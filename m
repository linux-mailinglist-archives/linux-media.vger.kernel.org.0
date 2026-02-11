Return-Path: <linux-media+bounces-52614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKR/IISsjGl/sAAAu9opvQ
	(envelope-from <linux-media+bounces-52614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 17:21:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFAC1260FB
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 17:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61A633019B91
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0641C33EB18;
	Wed, 11 Feb 2026 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrayAC7U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6633E360;
	Wed, 11 Feb 2026 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826875; cv=none; b=W+/l6OunI1uTfVpLUltz1NIFhqNgZp4KdOb7IIEBd5pld6Q3JQAOtYq/5TjAYb/LI+jPYfPpB4gjlBHd5dnCHKSQDZTvih5WJQ+6+1E++1F6idUqg3ntV8mAPfENaERVF818vxo2Oh0/ePymHCDZIHor85WVPMayfYNQqYMaqzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826875; c=relaxed/simple;
	bh=u8WTJDIWTX59Tpp0S5/n/oeAJgzAj7zbfMOEU06EMqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfTyByeAip0Mz5gqMNNUSDLoqek+zB4jW46CxmU0HxCkfk2/8Y4R65gP11ozN0JLujzz4BjZdfyfCPxZ2LUwHb7nvbfCra7jzh9UYPMhdwCDWtup4nPh/AXwc+nCuomNfP63TPRZ8l4TX+PMKkgpVKti8wtL7KNObzZha2r4MHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrayAC7U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770826873; x=1802362873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u8WTJDIWTX59Tpp0S5/n/oeAJgzAj7zbfMOEU06EMqk=;
  b=IrayAC7UuGH8yQdg1MsiLGi7WCUbrm9pTLydesvPIx+VWj+M6N05b5o0
   SdA90qzQrBu7AfWnIEI0Ed+toNk/NT4UL+mu839qR3oj2mUhm7Jyf2j+M
   WKatXRHS5pXFGmISLaWJFfNfhfWwGKzSowbj/5Y1mxKM66BE0orDKPNja
   MO1u8RGL949uqy9zqne1+3NIqekmZ7Ju1VwC7Zn50z/uPYzlrkORNSJeE
   H/UBsR1XTUyuYJJwTpoAVy2J02eLSbAavUfzw7006RC/yMDOTTPEPcMbC
   lXJccZ/xiC5WduBzXkSgeZ8LTQ3vZ2oq9B4DblEcLesANP5EmDtVQfIPI
   w==;
X-CSE-ConnectionGUID: 5X5KyQ0XSDWzwCPilovMig==
X-CSE-MsgGUID: Szl8Lpy1R96oJAJSP0cqUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72165996"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72165996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 08:21:13 -0800
X-CSE-ConnectionGUID: jDIKvOh8Soq0i3tKtxphmA==
X-CSE-MsgGUID: kuChXxgSTJCQFYy7HCyOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216442715"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2026 08:21:12 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: int3472: Add board data for Intel nvl
Date: Wed, 11 Feb 2026 21:46:16 +0530
Message-ID: <20260211161617.3740103-1-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-52614-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAFAC1260FB
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
index 71357a036292..603a353ef25f 100644
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
+	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
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


