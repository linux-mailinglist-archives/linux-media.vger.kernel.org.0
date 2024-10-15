Return-Path: <linux-media+bounces-19703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A2599F8FC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 23:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F37FB22732
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 21:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550461FBF7A;
	Tue, 15 Oct 2024 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ox1VFVGO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322221FBF67;
	Tue, 15 Oct 2024 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027224; cv=none; b=BikASwuwrcCBHc/o8W3tMgmRUTti9KQK/Z2cA2Szj5EXQC5imCknSsofbtDOBdQBMz168pMS7tB8qTgHizP8SNf8W0G8TFtjoFGUzImpthh0NF3l4eLqojBe6RDvIJBdBRGu5BB84LzzAcmKnSfry1fr5Q/fwwv5C3qWNynLhAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027224; c=relaxed/simple;
	bh=AOpwWOkdter/dta//ea30tZULAc+Y+Lv9Fvv3KCFmz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BIHexNDUZl+cOHZHDUDGW6R1bpg3xK0yErTdJ5kmjJtf4T4CINO5blDM4+I9bCrG9FBudw5GcW63QyQdlhPzqsEnEy+NJ/jHdb+hF4HS3JnHC76qI0FN9vgE93l639KmHU0ASG5cN3mI6Y9Nf0I5FaHEY3xgHN6htEnFxzMKtoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ox1VFVGO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0BA5A34;
	Tue, 15 Oct 2024 23:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729027114;
	bh=AOpwWOkdter/dta//ea30tZULAc+Y+Lv9Fvv3KCFmz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ox1VFVGORL5RJaYMYYsXRGP+h3S91HcqFMNZqlrzhnz7kO+i1o03oZCuZULueqJD8
	 XjxNE3kQ9AnYVTbiJSFgUzwYztBFanyHqPH82FmHefbeHrpcpDMGsNdPndMPapFLG/
	 a63crlpanbG2q2gLYryhzjlea/N7LBDx22nCMkdQ=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: anders.ruke@gmail.com,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/3] platform/x86: int3472: Add board data for Dell 7212
Date: Tue, 15 Oct 2024 22:19:57 +0100
Message-Id: <20241015211958.1465909-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
References: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
need some board data to describe how to configure the GPIOs and
regulators to run the sensor.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 322237e056f3..d28053733bd2 100644
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
+	.consumer_supplies = NULL
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
+	.consumer_supplies = NULL
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
+	.consumer_supplies = NULL
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
+		[TPS68470_VIO] = &dell_7212_tps68470_vio_reg_init_data,
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


