Return-Path: <linux-media+bounces-53428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG0gFkqfn2nucwQAu9opvQ
	(envelope-from <linux-media+bounces-53428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 02:18:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1919FC62
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 02:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 914473006936
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 01:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC543624A7;
	Thu, 26 Feb 2026 01:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5IIj3Ls"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597C3624A6;
	Thu, 26 Feb 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068673; cv=none; b=nFcU0ivOl5MQAwe4m375AHaVVPNRn+026I/SbAt1HEkAm3IdNFa4+UPL2qqwHcnBYTv4mBtfjz3vtSiMVQblN7ozpMpcgPZn2aBb3HfDH65ZI5dHPawe1q0iW8eGqe7BWRIQhL+DdF+JJt0/GPQvGlT1wlWOY1F0BQUV9Qm90rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068673; c=relaxed/simple;
	bh=1WfhuO3IyZA+U5/XET4RuDXdEhsyOn5TgRjmH7EwR3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVUTyns2CtC7fp7VyJ7W+DDWatbtn0JVOq65pUlvcOMuCDHJ2ckYYYSWNoakWrqRXumTlfPqZmsYANh6Ap8YC2eRW30Tu+VY45Hc3I7RMy00LTMX1XgFAR5DboToLHQSXbhmtGxSVLhfS7mZ2U5sUJ9Sg5Nk1DHJXfWN1+tA6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5IIj3Ls; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772068672; x=1803604672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1WfhuO3IyZA+U5/XET4RuDXdEhsyOn5TgRjmH7EwR3A=;
  b=N5IIj3LsJfNTXjMo2HK5FDlvmuFkGrOypcNNuS7OFmOvBm8PrYfXCTgR
   jHeKjHB2M3Vxol3K1GXIk0rrZvNXC0xYla5kc82DWMgqZ6gvcaA5MIgIG
   w4SPdBV/UtqxxdTcnFf2y/FR2QMonkum43d2L7DHJpX0oJHuZ9YoKT6Ms
   QyQr6Ld0lC0QjzoDZ8b02limvCmWPisaDouf8vzPFQEaXJEbCg8m3VW5+
   IdnKkYIb2DNwRsyDh6vYlpAKJppu4guvphnLccj7OtSzJsaBOnHyAUxOS
   L9kt2B/3iL/pOnj1YoyzpGo35sg5fOjD12KsPltYXGDnxiIUncuEzErmD
   w==;
X-CSE-ConnectionGUID: IDAcBRR6QESv56NBopyCnA==
X-CSE-MsgGUID: /XSd4DE7TSqfC4uR0XG1kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73191671"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73191671"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 17:17:51 -0800
X-CSE-ConnectionGUID: i3eRDKR5QmaqPnkWMEF/fw==
X-CSE-MsgGUID: 6m+aOBHfQV2MGBj20FKpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="216420535"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa008.jf.intel.com with ESMTP; 25 Feb 2026 17:17:50 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: int3472: Add board data for Intel nvl
Date: Thu, 26 Feb 2026 06:42:28 +0530
Message-ID: <20260226011230.832944-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130092431.2335363-2-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53428-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: A1C1919FC62
X-Rspamd-Action: no action

The Intel Nvl O13b10 sensor with the Intel IPU8 ISP.
The sensor is powered by a TPS68470 PMIC, and so we
need some board data to describe how to configure the GPIOs and
regulators to run the sensor.

Signed-off-by: Arun T <arun.t@intel.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036292..71dc0940a94b 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
 	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
 };
 
+/* Settings for Intel NVL platform */
+
+static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
+	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
+	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
+};
+
 static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
 	.constraints = {
 		.min_uV = 1200000,
@@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
 	.consumer_supplies = int3479_aux2_consumer_supplies,
 };
 
+static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
+	.consumer_supplies = int3472_core_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
+	.consumer_supplies = int3472_ana_consumer_supplies,
+};
+static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
+	.consumer_supplies = int3472_vcm_consumer_supplies,
+};
+
+/* Ensure the always-on VIO regulator has the same voltage as VSIO */
+static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.always_on = true,
+	},
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
+	.consumer_supplies = int3472_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
+	.consumer_supplies = int3472_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
+	.consumer_supplies = int3472_aux2_consumer_supplies,
+};
+
+
 static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
 	.reg_init_data = {
 		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
@@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
 	},
 };
 
+static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &intel_nvl_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &intel_nvl_tps68470_aux2_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table intel_nvl_int347a_gpios = {
+	.dev_id = "i2c-OVTI13B1:01",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static struct gpiod_lookup_table intel_nvl_int347e_gpios = {
+	.dev_id = "i2c-OVTI13B1:01",
+	.table = {
+	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
+	.n_gpiod_lookups = 2,
+	.tps68470_gpio_lookup_tables = {
+		&intel_nvl_int347a_gpios,
+		&intel_nvl_int347e_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
+		},
+	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.43.0


