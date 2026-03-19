Return-Path: <linux-media+bounces-56350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMNIEEsdvGlEsQIAu9opvQ
	(envelope-from <linux-media+bounces-56350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:59:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BFB2CE269
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 485073050184
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099123E315D;
	Thu, 19 Mar 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbXYChsH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8121ABC9;
	Thu, 19 Mar 2026 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935445; cv=none; b=WLhueFOONO2WrVRsk9/hNEHEKatFe+UQ1q5y5XtzDFt0Fvu9KZdctpE1UHw031Z4LDXLKz9zQv8r05MuoYyP9jVxuzXPdFHixRWuXn0TdLeHobZzPblnEiyqwnxoKsVQ75hBKy5fgB+pULdIxVyRBAcKPiyvPRDEXDw9EjFDo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935445; c=relaxed/simple;
	bh=oPR/2FF8grQKqyEK5SA9o4Gw7BqmljGE/xFXIPr4zss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAlyoorI88f5sb8fNE1CejCpXIowZ5iuOO3mCMTD0ylT9EqQavAjDGO4wywovL+hsKPlgJn+U1j+DZDe5UOopVxyibPxH8aO1LX4woUYJ11Xo8kMcygv097VDhIR6/ey9Qz4HUCMOczV1evt4ddb5Owaw9cZ8zB3De77snQtlTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbXYChsH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773935444; x=1805471444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oPR/2FF8grQKqyEK5SA9o4Gw7BqmljGE/xFXIPr4zss=;
  b=XbXYChsHFDyjVJGeusc2MaGmdJPd26yD/dG/q/TNJ748Az5cUU8ATjkN
   0cwJHmpRnh3CUkSpBJxHA7y5tfEKtDL1OJCSa7MLZUPKPE9Y6EQi2rpSh
   fLmN32u/KQKGROIWiON6hFOUodWW1xGRb3fpLgvat09xKf+EB82UWWMaI
   8h3NWwOZ8oPXoNgXiabOkjRSpeF+5KaxUjY1YmEALM15piFjOGpRheSh1
   7kXA2EzT2Ht2ToGuqCVKsWERDvHVJbpvKRYa7E30BkWVvRDU59t9XEV1b
   +JoTpnZcM3OUK026220vZa+js2NFMvJGuSl9WY3lJd10r9ArckyCYBvOg
   A==;
X-CSE-ConnectionGUID: Igzmf1xCRBqkb8MKliILNA==
X-CSE-MsgGUID: yP1HcXn3RyOV3zEmIYcnXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86374054"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86374054"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:50:44 -0700
X-CSE-ConnectionGUID: CUjmJYJDTLyj1yik8220NA==
X-CSE-MsgGUID: BzMsYPNyQ/Kg4cJ51fiwkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218444625"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:50:42 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH 2/2] platform/x86: int3472: Add more MSI AI evo laptops
Date: Thu, 19 Mar 2026 17:50:31 +0200
Message-ID: <20260319155031.1989179-2-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
References: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-56350-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B7BFB2CE269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MSI prestige AI EVO 13 and 16 have the same camera configuration
as model 14. Use the same platform data for all.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 52 ++++++++++++-------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index e65067358301..cef241f1bf09 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -238,7 +238,7 @@ static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[] = {
 	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
 };
 
-static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_data = {
+static const struct regulator_init_data msi_prestige_ai_evo_tps68470_core_reg_init_data = {
 	.constraints = {
 		.min_uV = 1200000,
 		.max_uV = 1200000,
@@ -249,7 +249,7 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_da
 	.consumer_supplies = ovti5675_dvdd_consumer_supplies,
 };
 
-static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_data = {
+static const struct regulator_init_data msi_prestige_ai_evo_tps68470_ana_reg_init_data = {
 	.constraints = {
 		.min_uV = 2815200,
 		.max_uV = 2815200,
@@ -260,7 +260,7 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_dat
 	.consumer_supplies = ovti5675_avdd_consumer_supplies,
 };
 
-static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
+static const struct regulator_init_data msi_prestige_ai_evo_tps68470_vio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
 		.max_uV = 1800600,
@@ -269,7 +269,7 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_dat
 	},
 };
 
-static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_data = {
+static const struct regulator_init_data msi_prestige_ai_evo_tps68470_vsio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
 		.max_uV = 1800600,
@@ -280,12 +280,12 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_da
 	.consumer_supplies = ovti5675_dovdd_consumer_supplies,
 };
 
-static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pdata = {
+static const struct tps68470_regulator_platform_data msi_prestige_ai_evo_tps68470_pdata = {
 	.reg_init_data = {
-		[TPS68470_CORE] = &msi_p14_ai_evo_tps68470_core_reg_init_data,
-		[TPS68470_ANA]  = &msi_p14_ai_evo_tps68470_ana_reg_init_data,
-		[TPS68470_VIO]  = &msi_p14_ai_evo_tps68470_vio_reg_init_data,
-		[TPS68470_VSIO] = &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
+		[TPS68470_CORE] = &msi_prestige_ai_evo_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &msi_prestige_ai_evo_tps68470_ana_reg_init_data,
+		[TPS68470_VIO]  = &msi_prestige_ai_evo_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &msi_prestige_ai_evo_tps68470_vsio_reg_init_data,
 	},
 };
 
@@ -315,7 +315,7 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
 	}
 };
 
-static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
+static struct gpiod_lookup_table msi_prestige_ai_evo_ovti5675_gpios = {
 	.dev_id = "i2c-OVTI5675:00",
 	.table = {
 		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
@@ -323,13 +323,13 @@ static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
 	}
 };
 
-static const struct property_entry msi_p14_ai_evo_gpio_props[] = {
+static const struct property_entry msi_prestige_ai_evo_gpio_props[] = {
 	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
 	{ }
 };
 
-static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
-	.properties = msi_p14_ai_evo_gpio_props,
+static const struct software_node msi_prestige_ai_evo_tps68470_gpio_swnode = {
+	.properties = msi_prestige_ai_evo_gpio_props,
 };
 
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
@@ -361,13 +361,13 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
-static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
+static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:06",
-	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
-	.tps68470_gpio_swnode = &msi_p14_ai_evo_tps68470_gpio_swnode,
+	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
+	.tps68470_gpio_swnode = &msi_prestige_ai_evo_tps68470_gpio_swnode,
 	.n_gpiod_lookups = 1,
 	.tps68470_gpio_lookup_tables = {
-		&msi_p14_ai_evo_ovti5675_gpios,
+		&msi_prestige_ai_evo_ovti5675_gpios,
 	},
 };
 
@@ -400,13 +400,29 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Evo A2VMG"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),
+		},
+		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-14N3"),
 		},
-		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
+		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 16 AI+ Evo B2VMG"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-B2VMG"),
+		},
+		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
 	},
 	{ }
 };
-- 
2.53.0


