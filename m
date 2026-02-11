Return-Path: <linux-media+bounces-52612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFXnC9SjjGlhrwAAu9opvQ
	(envelope-from <linux-media+bounces-52612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:44:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A4125CD5
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73C203029E59
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 15:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3267330F7F7;
	Wed, 11 Feb 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REMUcMq+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065F430E84E;
	Wed, 11 Feb 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824640; cv=none; b=JWmhAJCbI86srx2ww3tTs0oFvkQBVvlmD4zyQj5xM47vzoe+MNTmS1QbTJ4aN1q+7Zgu1LqzdZWBWGtTqbuwvXgnSUOoVPFqDNTsGVxq6aTeA2WzG/8MFhRl54ozZQtqXHycZ/j4CuHuNeG8D3lYxPzZ7zAZXm4W7hT8fITq1ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824640; c=relaxed/simple;
	bh=IH58V8tWIIwiwDLUKtgdMDLLHDKdAYTtNYyZjGChT2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKLFeQsU28Semjt9gP3VLHtpcw8oZjwf3XHSjb5BcZ7bB3ir2XUXKX7p/FKqdcACwgSDTslrLeyQkzEE5Dg1Cz0tSmSwKGo9qJUay8FekRv8/nQfhFBf3Xr3q9BZjYgzxY9hy2W216FXkD7bYPR+ARXP17J2RJc2kq/iHdzAuvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REMUcMq+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770824639; x=1802360639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IH58V8tWIIwiwDLUKtgdMDLLHDKdAYTtNYyZjGChT2U=;
  b=REMUcMq+ZRt5r+pdyoIxm7rShEOtA1XUI8KfQjpyhsgpQJS8VtlZcwz8
   +i+4604jX62QARks/6mRECUQXtEmRX61mxZ7XF0zNhuzZ14pTQmOu5URr
   7n3ZONBFadkLphdReB+oeVN4KXyaF7cyvATZbZGsoCnxPbeY29MgW4vfT
   GiqdP+tVs1evNyHm4MEq5D2m63hz0lBJ+e0pbKS4zGnSj27xiLiLFJKyS
   GKACG4kY9vR+XrMu0hEDOFPhUFIbW7R9FLj4AAjtMZkC+IN39AweOJqGx
   o53AXxcDPoQJXC6Viz65XCMU7YTREVvDR2DVyukuOyUoHIRTjklu5aW3J
   w==;
X-CSE-ConnectionGUID: dy8aO7tHQ/aROdhGkS/tUA==
X-CSE-MsgGUID: 3RUTkFqqQDaMYS6sEWiovg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74572800"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="74572800"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 07:43:59 -0800
X-CSE-ConnectionGUID: v3ocYBEfRyGGH1gwAxpY0Q==
X-CSE-MsgGUID: Iby5LSqeRSau9rhCZUybkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211649962"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2026 07:43:57 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: int3472: Add board data for Intel nvl
Date: Wed, 11 Feb 2026 21:09:00 +0530
Message-ID: <20260211153901.3737233-1-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-52612-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A33A4125CD5
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
index 71357a036292..79fc3c33098d 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
 	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
 };
 
+/* Settings for Intel NVL platform */
+
+static struct regulator_consumer_supply int347_ov13b_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int347_ov13b_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int347_ov13b_vcm_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int347_ov13b_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
+	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
+	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int347_ov13b_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
+};
+
+static struct regulator_consumer_supply int347_ov13b_aux2_consumer_supplies[] = {
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
+	.num_consumer_supplies = ARRAY_SIZE(int347_ov13b_core_consumer_supplies),
+	.consumer_supplies = int347_ov13b_core_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347_ov13b_ana_consumer_supplies),
+	.consumer_supplies = int347_ov13b_ana_consumer_supplies,
+};
+static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347_ov13b_vcm_consumer_supplies),
+	.consumer_supplies = int347_ov13b_vcm_consumer_supplies,
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
+	.num_consumer_supplies = ARRAY_SIZE(int347_ov13b_vsio_consumer_supplies),
+	.consumer_supplies = int347_ov13b_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347_ov13b_aux1_consumer_supplies),
+	.consumer_supplies = int347_ov13b_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347_ov13b_aux2_consumer_supplies),
+	.consumer_supplies = int347_ov13b_aux2_consumer_supplies,
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
+	.dev_name = "i2c-INT3472:07",
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


