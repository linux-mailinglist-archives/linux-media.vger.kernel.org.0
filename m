Return-Path: <linux-media+bounces-58222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFnrIVMz1mlZBwgAu9opvQ
	(envelope-from <linux-media+bounces-58222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:52:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5F3BAF27
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40936301D099
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 10:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4578F3BB9F3;
	Wed,  8 Apr 2026 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1dxRDuQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F743BAD9C;
	Wed,  8 Apr 2026 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645510; cv=none; b=hNNwLu/rvtxueHxqwPrlPq9x89/tajf5SAAed2SACXilWZN4R+0o5zDWBjbrTENVMDzVkFWVoOpfjGS1QmRiIVxvxzf1PLVH0g6PJCY0l+EDzTW42kY40mbsJOpNTH9JA4zVODMfBBj0vyx9H9H3iwn6jsEHP7cS4V6BAZDaSTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645510; c=relaxed/simple;
	bh=uo6Z+dtq8XsqtIfqNWw5PfxEu2d0Wog+rVedOtkc2Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spBLLuJsOjo4BEtgR2ZGeQxQX7UrJYaiSr0nfQKXZhkaHMFAXqNifiqln/rGJhuOeUYdS6IwcHVrtShzfSEhxcOa7KavCOH1n2jCTq0yPZ01psaXjhg6/BQTzhqB57G3kMIb5HFju+zzA4GNjgYdNND5eWxI/sDg14ZP7/SeXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1dxRDuQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775645509; x=1807181509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uo6Z+dtq8XsqtIfqNWw5PfxEu2d0Wog+rVedOtkc2Sc=;
  b=l1dxRDuQ5rDpOOGdHJXLtmuIBFTI2Ge+Ky62GvAFNzbyZHQ4Hzp3fD66
   VJt1UZljJVGQW3USpXox7TH82uQyWdeikEdJVOPDJkOyF8S+rfWCPIt01
   5Fa5DfxEG3xM4jDL3ADJN6qjl/LBctwmjUaKQOTMTFBBz3ZNNVwnkzZuU
   T+0wQhBdN44YV38h3Evnj0RfVbUANHbLhk3YFVsSRDsh4ARK8ycw2F+Mp
   So8TJh4Z5utFqC11eMrXzZUBYU/jzXotatUxCVznr1wxR2BRBnHTDIV2C
   O+swGsGBGhJxC1Aj6Q0Ka/AQUYuZl1npzZx9otxfhqxeDQkuarHDHPAo+
   Q==;
X-CSE-ConnectionGUID: YBiVFLrNSYKvSQHsUbNTBQ==
X-CSE-MsgGUID: ccN+OG6AS8KFZFSbHlqUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94013888"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94013888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 03:51:49 -0700
X-CSE-ConnectionGUID: 7PixzIa0Rb+d1zMJYo+cOg==
X-CSE-MsgGUID: +/BZaEfdQMuDX8FHjGJjlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228340119"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2026 03:51:46 -0700
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
Subject: [PATCH v10 1/2] platform/x86: int3472: Add TPS68470 board data for Intel nvl
Date: Wed,  8 Apr 2026 16:15:06 +0530
Message-ID: <20260408104510.392906-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408104510.392906-1-arun.t@intel.com>
References: <20260408104510.392906-1-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58222-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:dkim,intel.com:email,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74D5F3BAF27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
data to configure the GPIOs and regulators for proper camera sensor operation.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 6bec5a910396..9e4257f98661 100644
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
@@ -221,6 +239,60 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
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
 static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
 	.reg_init_data = {
 		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
@@ -297,6 +369,16 @@ static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pda
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
@@ -336,10 +418,27 @@ static const struct property_entry msi_p14_ai_evo_gpio_props[] = {
 	{ }
 };
 
+static const struct property_entry intel_nvl_gpio_props[] = {
+	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
+	{ }
+};
+
 static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
 	.properties = msi_p14_ai_evo_gpio_props,
 };
 
+static const struct software_node intel_nvl_tps68470_gpio_swnode = {
+	.properties = intel_nvl_gpio_props,
+};
+
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
@@ -379,6 +478,16 @@ static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_da
 	},
 };
 
+static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
+	.tps68470_gpio_swnode = &intel_nvl_tps68470_gpio_swnode,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&intel_nvl_tps68470_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -415,6 +524,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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
 	{ }
 };
 
-- 
2.43.0


