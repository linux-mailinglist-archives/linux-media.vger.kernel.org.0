Return-Path: <linux-media+bounces-51819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEg8DxR6fGmWNAIAu9opvQ
	(envelope-from <linux-media+bounces-51819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 10:29:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4FFB8EC8
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 10:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEABD3009B0F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F1D353EDB;
	Fri, 30 Jan 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSYJtJJe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9769352C47;
	Fri, 30 Jan 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765352; cv=none; b=pI3GS+Ijekn8jcvUhYNFGtTYmVp+wjneBx8eJr71hCh6u8hvihrY+OHAeDPzOhcz75+oPUeMeB2znLDQ1QircZkw6/sq9A/RtQHr06VNilpeSLWJHglxYvI8B7/PoXuQqn6xib0LE7KONTUd1G5Ehk4JB7noLrvPjCZ1OsUCFsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765352; c=relaxed/simple;
	bh=yRoybChPFVb77td5Zpb/6mlIDUanvgL2T3va5FwfIbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=da4srDMuK0sBp/aiiOdDFVbxYstkjf1HFHAPY1Cku2VghChW3+MmHXhR9vbAACoLk9qxeEu4aw615OxVjYKQPmEyknzMCYdzX86jyybh4b8hF/2KdB7ftDKgbi46Lnu2Cuj6wUzZg+HAPgf3ePgtANM5+q0RWkrAOUnMy43Bc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSYJtJJe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769765351; x=1801301351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRoybChPFVb77td5Zpb/6mlIDUanvgL2T3va5FwfIbs=;
  b=MSYJtJJe07I70nnDdfVQ973kzFs4oQfkvSSSVH2JpGDrDVNhnXnIOeuV
   amFjPWlSz80tgOLPM/49nwChN8PLfPoacjl5MKxLO7fTYCp4Nev+6pjR0
   susdsBGeSqC9pBHbxEc204OLz8Apk3flXTaP8QdU76p5fbGOXQ6NqKR5d
   xVhwrrLuqPGEjaBVHHHgjAk1phBokMpl5sUHkMjYeYgBR1L6O5Cm9WlOP
   S9VNHonSEH4tXt9jncDoODtWpuJf9Fz1R3zTGg5YUORPpUUifKGBtMFAS
   NU1Ugos+MOXG07FMyrBBDawtnmsL/Fuz7g/A+DwzzTwx5pUEgcIyp3W8h
   A==;
X-CSE-ConnectionGUID: NmL9ZK2STAO/2TxKCB1HOA==
X-CSE-MsgGUID: 31/FLAJATfWk8TsQf00SVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58594008"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="58594008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 01:29:10 -0800
X-CSE-ConnectionGUID: a2g3sIovSneyN+FJJBbc9Q==
X-CSE-MsgGUID: dwqU3mN1R9mZc9n+V3jOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239535430"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 01:29:10 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and gpio
Date: Fri, 30 Jan 2026 14:54:31 +0530
Message-ID: <20260130092431.2335363-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130092431.2335363-1-arun.t@intel.com>
References: <20260130092431.2335363-1-arun.t@intel.com>
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
	TAGGED_FROM(0.00)[bounces-51819-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: BF4FFB8EC8
X-Rspamd-Action: no action

Ov13b10 sensor get clock and regulator from TPS68470 PMIC.
Added tps68470 regulator/gpio names in power_on()

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/i2c/ov13b10.c | 38 ++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..c2469c88c722 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -709,6 +709,10 @@ struct ov13b10 {
 
 	struct clk *img_clk;
 	struct regulator *avdd;
+	struct regulator *vio;
+	struct regulator *core;
+	struct gpio_desc *enable;
+
 	struct gpio_desc *reset;
 
 	/* V4L2 Controls */
@@ -1475,12 +1479,19 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 	unsigned long freq;
 	int ret;
 
-	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
+	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))
+		ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "s_resetn", GPIOD_OUT_LOW);
+	else
+		ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ov13b->reset))
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
 				     "failed to get reset gpio\n");
 
-	ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
+	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))
+		ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, "tps68470-clk");
+	else
+		ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
+
 	if (IS_ERR(ov13b->img_clk))
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->img_clk),
 				     "failed to get imaging clock\n");
@@ -1490,8 +1501,11 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 		return dev_err_probe(ov13b->dev, -EINVAL,
 				     "external clock %lu is not supported\n",
 				     freq);
+	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01"))
+		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "ana");
+	else
+		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
 
-	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
 	if (IS_ERR(ov13b->avdd)) {
 		ret = PTR_ERR(ov13b->avdd);
 		ov13b->avdd = NULL;
@@ -1499,6 +1513,24 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 			return dev_err_probe(ov13b->dev, ret,
 					     "failed to get avdd regulator\n");
 	}
+	if (strstr(dev_name(ov13b->dev), "OVTI13B1:01")){
+		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "dovdd");
+		if (IS_ERR(ov13b->avdd)) {
+			ret = PTR_ERR(ov13b->avdd);
+			ov13b->avdd = NULL;
+			if (ret != -ENODEV)
+				return dev_err_probe(ov13b->dev, ret,
+			               "failed to get avdd regulator\n");
+		}
+		ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "dvdd");
+		if (IS_ERR(ov13b->avdd)) {
+			ret = PTR_ERR(ov13b->avdd);
+			ov13b->avdd = NULL;
+			if (ret != -ENODEV)
+				return dev_err_probe(ov13b->dev, ret,
+					"failed to get avdd regulator\n");
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0


