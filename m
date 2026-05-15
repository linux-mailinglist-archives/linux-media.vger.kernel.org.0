Return-Path: <linux-media+bounces-61766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GV/KZBdB2qw0QIAu9opvQ
	(envelope-from <linux-media+bounces-61766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:53:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A6555A93
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BE21300399E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828F03F9A14;
	Fri, 15 May 2026 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C86VexPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90933F99F4;
	Fri, 15 May 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867580; cv=none; b=RGQuNMK9PkCvyzeLLr9i77ls5zo3uf6RKfQXaQ+CP2wuX+jfpM8zWrPp+iWLE1WkTjw+3AByl479Dj/TiPo9BrFKwb/+cTT5cjGP0xjPIckSjZkZFxp4EXD/5OA0ReRPoH8EJIGHg1k0wpJFx9Xqjt63FNxfAUjhMjA8DigHeps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867580; c=relaxed/simple;
	bh=BX4QW3hxBSPX7xhWjOQ7LQO1rmatuD2o5waVWiDsPP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpuPkT+3blIO7v3XxqqnADyDS8ILDKa4KJH5WZvmgqWzCp+t2xtGLde76hf/Lwo6yinZCZ5La9aVcQ78AWjMUH3d6UuTEXTb2q5lUd1y260GXqhaKbqf8rP2Ls+ERlpvWNBtaDDlt891YDXMTO3Y7kifYvUBGtfntWDfOq64pM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C86VexPP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778867578; x=1810403578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BX4QW3hxBSPX7xhWjOQ7LQO1rmatuD2o5waVWiDsPP8=;
  b=C86VexPPGBTKI49o0fB6BXIEcmX/U0saKVKLV0RX8FS3clvr1csEPNRR
   AM7bkKz2tr7x7Isaq9khYhn9jG2MNt4eU1qeAY4utGcB+ldZc6Itf/W7p
   mOHWX0UgJicF+77niOi994j5EymxZwzBwoyv08QXrVWwYQ0gsX2LUFTpM
   OKPKWM7GCradPoAe1Y/JqFmb/BFcP0UNim7ARFjXuTUu5KM95GGXLUKZJ
   LavwBPaXHbiaexfy0VnYl5UW9kCAJ3kDJhAci7FhK4dSYFSyo5Rc+q6wc
   w5k1/udxh3qvjcckiuvQJtuilKJUQ7QDGPC7zdc8rgdlzWvqfk5g9EiD6
   A==;
X-CSE-ConnectionGUID: 3tz3Z+GnTi6Tjf9vrzWALg==
X-CSE-MsgGUID: ddjl9FwFSp6JvXasZptbrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90931328"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90931328"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 10:52:58 -0700
X-CSE-ConnectionGUID: DiA++BRCRXeM7cDZKSwS4Q==
X-CSE-MsgGUID: vgzVAFX4S+mZQtjbubu8zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237760901"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2026 10:52:55 -0700
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
Subject: [PATCH v11 1/3] platform/x86: int3472: Rename daisy-chain GPIO props to generic
Date: Fri, 15 May 2026 23:15:10 +0530
Message-ID: <20260515174514.3752028-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515174514.3752028-1-arun.t@intel.com>
References: <20260515174514.3752028-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 517A6555A93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61766-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

Rename the MSI-specific daisy-chain GPIO properties and software node
to generic names so they can be reused by other platforms that also
require daisy-chain GPIO configuration for TPS68470.

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 28c9e12c85bf..4358dc601923 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -323,13 +323,13 @@ static struct gpiod_lookup_table msi_prestige_ai_evo_ovti5675_gpios = {
 	}
 };
 
-static const struct property_entry msi_prestige_ai_evo_gpio_props[] = {
+static const struct property_entry int3472_tps68470_daisy_chain_gpio_props[] = {
 	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
 	{ }
 };
 
-static const struct software_node msi_prestige_ai_evo_tps68470_gpio_swnode = {
-	.properties = msi_prestige_ai_evo_gpio_props,
+static const struct software_node int3472_tps68470_daisy_chain_gpio_swnode = {
+	.properties = int3472_tps68470_daisy_chain_gpio_props,
 };
 
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
@@ -364,7 +364,7 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:06",
 	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
-	.tps68470_gpio_swnode = &msi_prestige_ai_evo_tps68470_gpio_swnode,
+	.tps68470_gpio_swnode = &int3472_tps68470_daisy_chain_gpio_swnode,
 	.n_gpiod_lookups = 1,
 	.tps68470_gpio_lookup_tables = {
 		&msi_prestige_ai_evo_ovti5675_gpios,
-- 
2.43.0


