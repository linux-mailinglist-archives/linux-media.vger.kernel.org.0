Return-Path: <linux-media+bounces-32923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E119ABD924
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E5018941A8
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 13:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C144241CB2;
	Tue, 20 May 2025 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PMzgzNH5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80322417FA;
	Tue, 20 May 2025 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747090; cv=none; b=TFkjTmTCOWF+790060Mi84M7X2XVJh46AotDI0apptiuiXyIKlTkOla0GLtO+rigtEja0Ba/wwYEfP1PcIygeAZbJRs/Mg4kcGVJtIATEECSLt9qruO0AdyfurBmtGxrfxVYCEzZD1AIddTfTFBu5x6sukMzTpf53MhOFdriP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747090; c=relaxed/simple;
	bh=YgcgXyuV9MNOeAGRc0J68iZKoU5MN27zuNUEpmKXiVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+XfuS+ZWXxFWIQw8t/8fIAnEYgdDSj8mrYWerPc2H+SpIhvVD7Yr2mtCRDiguxFR/9aYVPPE6K5xC8Hlck65OF4mlWCQCUlZeOqEDVMJwdAWgcn0FhQhipap5MOrvswKOYQtX7Ddt4ww5BzO3xNB26k2e6NxGCxqZtRuV/huu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PMzgzNH5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C54C7C67;
	Tue, 20 May 2025 15:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747747058;
	bh=YgcgXyuV9MNOeAGRc0J68iZKoU5MN27zuNUEpmKXiVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PMzgzNH532NIeEddUYB2E7C+XPX0N7SroOMvWwDxztpA32z7o0A+vuEl8YAozVYd5
	 SGNDz1JryRtOQcEgw3LK0OX2JMQg5gChyWaaAbOtXJXF2OOMqwlL2jNK+BOAvDdbc8
	 4Q1mzEhdkSR03hnL6JfTK9FePxBxOJ8vZR1KSamA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 20 May 2025 14:17:45 +0100
Subject: [PATCH v2 2/3] platform/x86: int3472: Add board data for Dell 7212
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-djrscally-ov5670-v2-2-104ae895aecf@ideasonboard.com>
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
In-Reply-To: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=YgcgXyuV9MNOeAGRc0J68iZKoU5MN27zuNUEpmKXiVw=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoLIEETSRYQa5qOgKbzUcP0VSDEYcs21+eCBht4
 2PzN0nX42yJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaCyBBAAKCRDISVd6bEV1
 Mgm3EACUT1+VzL37qS3pH07neIcjQv6dw8PN5pJCG4IgrQk/j/G+B10a9thWJLRhtbuiLWRP/bL
 pf+crFNIlOyM8B8PPHI7qk6TN0sKa5/exlXg/6s+ijq9GjF6oErK5vA3CEZHHPcPsccBAbzKvot
 9b7wph355vKDuyqnjtpStp0qUMaXRzNAxf2DVUUAXo+nY7weYsLgsqmeYchTc49CmyR1qFO33ck
 tb6/1d8XUx2/SjU03MHikGaHO+UeVw04L+rVBjMGz0keF5sE/kPzCqFr7JMzvp3J81guwl/FTGp
 UxM/VEZdoJk86BnN5epg/r48al6yO7alcEGQp26B8T33ht3LD9VJCfXClWJhEbo8QWEBhk2f57v
 4xPgR+PpRSom8lnHB2J+IfuHx4REl5GW1s7DKbbRCkHvnq378NM74ZQvPtSt4JBkEAC/hEZLwGS
 IRQrWp7wiCr8MM1aFh61LVDMa+mXy/v8EJLzBbiYp/JQx1cHO8bfqr94m9q2YoEuNm0xOzBBARL
 15UCHJBTbYobAp6kz76P+/xdZaxSvzzQe48ut/eWDMZ+wmM731gebzGCwQDIVSxBJ2WSsIqDY/t
 h0UvSvjuN7qc7SCvKXDAOhPd7t9UBSDpagESx6SeCWOW8afcN7M0RjQpX5ayWldmaj6zPDadegq
 QTaTo1wwG8sQKEg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
need some board data to describe how to configure the GPIOs and
regulators to run the sensor.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../x86/intel/int3472/tps68470_board_data.c        | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 322237e056f32e585e342bf8c27934c39c6fce84..71357a03629260129d08829f65d0563c521827d7 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -129,6 +129,109 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
 	},
 };
 
+/* Settings for Dell 7212 Tablet */
+
+static struct regulator_consumer_supply int3479_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply int3479_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
+};
+
+static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3479_vsio_consumer_supplies),
+	.consumer_supplies = int3479_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_7212_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 1213200,
+		.max_uV = 1213200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3479_aux1_consumer_supplies),
+	.consumer_supplies = int3479_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3479_aux2_consumer_supplies),
+	.consumer_supplies = int3479_aux2_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &dell_7212_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &dell_7212_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO]  = &dell_7212_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &dell_7212_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &dell_7212_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &dell_7212_tps68470_aux2_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -146,6 +249,15 @@ static struct gpiod_lookup_table surface_go_int347e_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table dell_7212_int3479_gpios = {
+	.dev_id = "i2c-INT3479:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -166,6 +278,15 @@ static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data
 	},
 };
 
+static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:05",
+	.tps68470_regulator_pdata = &dell_7212_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&dell_7212_int3479_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -188,6 +309,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&surface_go3_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7212 Rugged Extreme Tablet"),
+		},
+		.driver_data = (void *)&dell_7212_tps68470_board_data,
+	},
 	{ }
 };
 

-- 
2.34.1


