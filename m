Return-Path: <linux-media+bounces-57872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBohHlcSzWmMZwYAu9opvQ
	(envelope-from <linux-media+bounces-57872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:40:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD237A96A
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B660830D1A76
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 12:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47F240823A;
	Wed,  1 Apr 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egpfurwG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC7407117;
	Wed,  1 Apr 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046419; cv=none; b=bpmZ648hYgkEcu6VBiLjlhtr78Nh8KkOBHoNYFjIKcMUcQl3PO0CwAhRsKVLyHGoi9Z7xPQQKHahuG/Hf9aT6Z7f1mLThODA3OEFmPayVYi22zbLIp3VmVzUOHLf06erv/rH4gB3yfYwyBlmMe/yA3Lpld7r2mgQpGhFVCahGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046419; c=relaxed/simple;
	bh=hhR0AwqlgiWjVsLul/aIrHyC7IkMxpfWMhYMiXXBX1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyoDdw6slKQgjGior/qvDMnO9WsmkFGzKDRBfYdURlx1FwKVYuE9D+QwVmZl3j6d1Tt02N4qoevbDVUnIA7Ga6h17MP4rAW7+YtgbPneHkCpKAUNtbPt03FPsprt2WH7Z9P1nIrZg83Vaxflyf9V+x3ufrVZ+hYAPW+4sJzLO6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egpfurwG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775046417; x=1806582417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hhR0AwqlgiWjVsLul/aIrHyC7IkMxpfWMhYMiXXBX1s=;
  b=egpfurwGiblTsW71SG1zcuanhw7GoIOdFK6O8Dd0qA3a2Ksu5uXDhwXv
   TaEE/T/Ppo6ZImyN54y79SAJ5qFclWRwjaISAr4Ea/NTkVxlYOJb9eD8x
   rWm4Ep7pnT2lPCSV62wyntjfqB96IOsA/aLRomyziJwrnqYiTMOa95Thv
   s0qYbvqEpWNT+aurfFp/OUjegSlQgSD/iOBP460oENkJi8aTG18MgZIEM
   HAxs9J8vYB84GXEDQ9w1xNz82o0c4GDyXxKuBLuuqTWnzauaNLO7ESHHd
   W2yfPD0Az4+I3tq8Ks9LQKLlt1SbProE/B9ordQArSj8CZNF30jd0p/De
   Q==;
X-CSE-ConnectionGUID: qDNLWZJcQm2yy+u0K7VCuw==
X-CSE-MsgGUID: lvYrhd0NQwGFNDAKztxuqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79936878"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79936878"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 05:26:57 -0700
X-CSE-ConnectionGUID: xDcrzh2xRZ2vHBea7B/Elw==
X-CSE-MsgGUID: UOWRTasVRJOch/mQxDWMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249698780"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa002.fm.intel.com with ESMTP; 01 Apr 2026 05:26:54 -0700
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com,
	johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com,
	arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com,
	dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehdi.djait@intel.com
Subject: [PATCH v7 1/2] platform/x86: int3472: Add TPS68470 board data for Intel nvl
Date: Wed,  1 Apr 2026 17:50:29 +0530
Message-ID: <20260401122030.3955499-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401122030.3955499-1-arun.t@intel.com>
References: <20260401122030.3955499-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57872-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 8DDD237A96A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
data to configure the GPIOs and regulators for proper camera sensor operation.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 6bec5a910396..bfec0f1af065 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -144,6 +144,24 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
 	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
 };
 
+/* Settings for Intel NVL platform */
+
+static struct regulator_consumer_supply ovti13b1_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply ovti13b1_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply ovti13b1_vcm_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vcc", "i2c-OVTI13B1:01-VCM"),
+};
+
+static struct regulator_consumer_supply ovti13b1_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
+};
+
 static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
 	.constraints = {
 		.min_uV = 1200000,
@@ -221,6 +239,61 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
 	.consumer_supplies = int3479_aux2_consumer_supplies,
 };
 
+static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_core_consumer_supplies),
+	.consumer_supplies = ovti13b1_core_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_ana_consumer_supplies),
+	.consumer_supplies = ovti13b1_ana_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vcm_consumer_supplies),
+	.consumer_supplies = ovti13b1_vcm_consumer_supplies,
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
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vsio_consumer_supplies),
+	.consumer_supplies = ovti13b1_vsio_consumer_supplies,
+};
+
+
 static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
 	.reg_init_data = {
 		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
@@ -297,6 +370,16 @@ static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pda
 	},
 };
 
+static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -340,6 +423,14 @@ static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
 	.properties = msi_p14_ai_evo_gpio_props,
 };
 
+static struct gpiod_lookup_table intel_nvl_tps68470_gpios = {
+	.dev_id = "i2c-OVTI13B1:01",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -379,6 +470,15 @@ static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_da
 	},
 };
 
+static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&intel_nvl_tps68470_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -415,6 +515,14 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
+		},
+		.driver_data = (void *)&intel_nvl_tps68470_board_data,
+	},
+
 	{ }
 };
 
-- 
2.43.0


