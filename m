Return-Path: <linux-media+bounces-53718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPBHJ0qfoWl8ugQAu9opvQ
	(envelope-from <linux-media+bounces-53718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:42:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B831B7CE7
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 386393139A5C
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BAD355F37;
	Fri, 27 Feb 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMNUvkIN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA53EF0C7;
	Fri, 27 Feb 2026 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199671; cv=none; b=brRerLWSiXzRIUJOKV4rnBW/NUmHek1yClrT0godoQWjLdFGZhqP83JtgkRDTooCPhq4DofdILQPgZMP1fjKuFXaw9u+CG9uWlfxwE2qPhrXK39EmLieQ/uoACd97fXPYYA+qaYx0fm1cUlXZgBYUCVkFekScpqT6ah/3tndECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199671; c=relaxed/simple;
	bh=1WfhuO3IyZA+U5/XET4RuDXdEhsyOn5TgRjmH7EwR3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPkjBPr7KH9wxd7SzMrBehbfMO7yPvgvouLvlcqkOZDgQd5Q6HdD+4F8JtFJw4Iqnm4E5bXNQvMzMCAu51yPbNA/UnqO6DmkTyTU7i47zaerpIOY7OReRS/yZlLjaLGrcFt0Qp4LClbpTTDI61HX2Lp5Lfl+nScvx4p32jEncH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMNUvkIN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772199669; x=1803735669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1WfhuO3IyZA+U5/XET4RuDXdEhsyOn5TgRjmH7EwR3A=;
  b=YMNUvkINvjohccB/BnJYVqfU36+/qljXJ/f9A6NDpjZGzffqUzktfTZJ
   iKhBLRAmY7Ze3yxoswCMGgforadxQeBVf+0Z1vDUdDllf9hYg4VyLeW2l
   feJazIiJr40MnlXrtjFoyG5PvLmCCQwEOuBuSkPQuq/Tb4mNbeQxazuH3
   pZ8dBRXNcexsEYBs9nV5Dl40piBhc9PuJro6A8LvRm0OGt8qpdrD3ROPy
   EQjTaRwxC4Lq4TryGV02yNMOiBEnJTvL8+sgV9Wz2wtxB3Q6d+bL4k2Fg
   ICLozuSCA7xP5HVWhahyQx29RFc6EVo7A9f0xVP4l1NJTNtpcNUoodQjE
   g==;
X-CSE-ConnectionGUID: MU2rB+ABTnCT6VbPx/PzAQ==
X-CSE-MsgGUID: W6O7mpWzQyGyak7mVTXvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77121494"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77121494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 05:41:09 -0800
X-CSE-ConnectionGUID: cQRxvoW8QlOmeiKy7mgaRg==
X-CSE-MsgGUID: AxtgIQs8QQCT7sCWS7Pmcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="244281867"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2026 05:41:07 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel nvl
Date: Fri, 27 Feb 2026 19:05:41 +0530
Message-ID: <20260227133542.970820-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227133542.970820-1-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
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
	TAGGED_FROM(0.00)[bounces-53718-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: D0B831B7CE7
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


