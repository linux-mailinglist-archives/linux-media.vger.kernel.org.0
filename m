Return-Path: <linux-media+bounces-52615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLnjBKasjGl/sAAAu9opvQ
	(envelope-from <linux-media+bounces-52615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 17:21:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DAC126102
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 17:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFAE7303DAC7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCCC33F36E;
	Wed, 11 Feb 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAtBCV5r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79133F399;
	Wed, 11 Feb 2026 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826878; cv=none; b=XLq5QuX/ahWD8eLLVIiQxWMCOk1C1re9sXwBvF5nuq+F+/XQgFgKIv+Zq345nEBmb1v9zAZBscEfQYImfn64fkSLdQ6TGIxYotBccjUFcKhvTARr+9V0Q/bzaS9Vm88r90xoGiDByvZdZDRKkQ7MKn0XAJP3KZaAygEtoLdjK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826878; c=relaxed/simple;
	bh=I8IxnmVCk+FGLLSievLa0IM2y7OaqIwWWg+UEICANBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EW74Etw4MyoC49w+A8yWoiZse65UGxeXjcUoATyZNk5nJuCOPkENxg2alxazUmIezb8t8GWOX8BIPkSjMIyNF10D2ph21rO0eRqDigxQ++C1wM32N1T3Ry/eUF9MSvS/ZIDxU9TGAzFRHVhwlzjEOlGZGVbOHw7tIUExOx3j4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAtBCV5r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770826877; x=1802362877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I8IxnmVCk+FGLLSievLa0IM2y7OaqIwWWg+UEICANBY=;
  b=GAtBCV5rhIO3JDoaYLVX/ESx0bQ6J7Ctp945LjUcMWb9xLIzBIV3Zr5J
   jhucknLeN893yTADGRppCJQ89rlve8joMBRPp1xNAx4NDjtkFyrey5U4z
   lJ0Dxv/KhOKOJycNRkIRwiXOZvmVUxV1wdIJgLB1ACv6BSlX/9SCWI5TY
   9dEm7YwzdX2yPAsXZy8qPSK/iies/eNlrPGDf95T9/CRSMEGByhuaF6qx
   Cv0Jh2E51rUNJlMLUbvGpBVkdPbzOuQnNl20Z1/UBJYY8tG1w7mJd+b23
   Adc6wABQ9cBPEiTQL66WwWt6DkjZCNiFfr0m3PHpBV1nf5e+WAYazj8aR
   A==;
X-CSE-ConnectionGUID: TPug23P+ScG+fx7rEFkj4w==
X-CSE-MsgGUID: DRLqwjj4TFqOlslH9qHtGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72166007"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72166007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 08:21:17 -0800
X-CSE-ConnectionGUID: MDLE36f7RQyhAD5rJPuHTw==
X-CSE-MsgGUID: LyhtRFjJQx+k9V//y3blYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216442725"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2026 08:21:16 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and gpio
Date: Wed, 11 Feb 2026 21:46:17 +0530
Message-ID: <20260211161617.3740103-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211161617.3740103-1-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260211161617.3740103-1-arun.t@intel.com>
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
	TAGGED_FROM(0.00)[bounces-52615-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 88DAC126102
X-Rspamd-Action: no action

Ov13b10 sensor get clock and regulator from TPS68470 PMIC.
Added tps68470 regulator/gpio names in power_on

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/i2c/ov13b10.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..228ffe5ada70 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -11,6 +11,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <linux/regulator/consumer.h>
 
 #define OV13B10_REG_VALUE_08BIT		1
 #define OV13B10_REG_VALUE_16BIT		2
@@ -699,6 +700,13 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
 	},
 };
 
+static const char * const ov13b10_supply_names[] = {
+	"dovdd",        /* Digital I/O power */
+	"avdd",         /* Analog power */
+	"dvdd",         /* Digital core power */
+};
+
+
 struct ov13b10 {
 	struct device *dev;
 
@@ -708,7 +716,7 @@ struct ov13b10 {
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	struct clk *img_clk;
-	struct regulator *avdd;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov13b10_supply_names)];
 	struct gpio_desc *reset;
 
 	/* V4L2 Controls */
@@ -1194,9 +1202,8 @@ static int ov13b10_power_off(struct device *dev)
 	struct ov13b10 *ov13b10 = to_ov13b10(sd);
 
 	gpiod_set_value_cansleep(ov13b10->reset, 1);
-
-	if (ov13b10->avdd)
-		regulator_disable(ov13b10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov13b10_supply_names),
+					ov13b10->supplies);
 
 	clk_disable_unprepare(ov13b10->img_clk);
 
@@ -1214,14 +1221,12 @@ static int ov13b10_power_on(struct device *dev)
 		dev_err(dev, "failed to enable imaging clock: %d", ret);
 		return ret;
 	}
-
-	if (ov13b10->avdd) {
-		ret = regulator_enable(ov13b10->avdd);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable avdd: %d", ret);
-			clk_disable_unprepare(ov13b10->img_clk);
-			return ret;
-		}
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov13b10_supply_names),
+					ov13b10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		clk_disable_unprepare(ov13b10->img_clk);
+		return ret;
 	}
 
 	gpiod_set_value_cansleep(ov13b10->reset, 0);
@@ -1473,7 +1478,7 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
 static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 {
 	unsigned long freq;
-	int ret;
+	int ret, i;
 
 	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ov13b->reset))
@@ -1481,6 +1486,7 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 				     "failed to get reset gpio\n");
 
 	ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
+
 	if (IS_ERR(ov13b->img_clk))
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->img_clk),
 				     "failed to get imaging clock\n");
@@ -1491,15 +1497,14 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 				     "external clock %lu is not supported\n",
 				     freq);
 
-	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
-	if (IS_ERR(ov13b->avdd)) {
-		ret = PTR_ERR(ov13b->avdd);
-		ov13b->avdd = NULL;
-		if (ret != -ENODEV)
-			return dev_err_probe(ov13b->dev, ret,
-					     "failed to get avdd regulator\n");
-	}
+	for (i = 0; i < ARRAY_SIZE(ov13b10_supply_names); i++)
+		ov13b->supplies[i].supply = ov13b10_supply_names[i];
 
+	ret = devm_regulator_bulk_get(ov13b->dev, ARRAY_SIZE(ov13b10_supply_names),
+					ov13b->supplies);
+	if (ret)
+		return dev_err_probe(ov13b->dev, ret,
+				     "failed to get regulators\n");
 	return 0;
 }
 
-- 
2.43.0


