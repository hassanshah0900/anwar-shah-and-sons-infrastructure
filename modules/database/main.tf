locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_db_subnet_group" "postgresql" {
  name       = "${local.name_prefix}-postgresql-subnet-group"
  subnet_ids = var.db_subnet_ids
}

resource "aws_security_group" "postgresql" {
  name   = "${local.name_prefix}-postgresql-sg"
  vpc_id = var.vpc_id
  ingress {
    security_groups = [var.app_sg_id]
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_rds_cluster" "postgresql" {
  cluster_identifier = "${local.name_prefix}-aurora-postgresql-cluster"
  engine             = "aurora-postgresql"
  engine_mode        = "provisioned"
  engine_version     = "17"

  database_name               = "${var.project_name}_${var.environment}_db"
  master_username             = "dbadmin"
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.postgresql.name
  vpc_security_group_ids = [aws_security_group.postgresql.id]

  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${local.name_prefix}-aurora-postgresql-final-snapsho"

  storage_encrypted = true

  iam_database_authentication_enabled = true

  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 16
  }
}

resource "aws_rds_cluster_instance" "writer" {
  identifier         = "${aws_rds_cluster.postgresql.cluster_identifier}-writer"
  cluster_identifier = aws_rds_cluster.postgresql.cluster_identifier
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}

resource "aws_rds_cluster_instance" "reader" {
  identifier         = "${aws_rds_cluster.postgresql.cluster_identifier}-reader"
  cluster_identifier = aws_rds_cluster.postgresql.cluster_identifier
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}
