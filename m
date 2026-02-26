Return-Path: <linux-media+bounces-53429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH21F2Kfn2nucwQAu9opvQ
	(envelope-from <linux-media+bounces-53429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 02:18:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC919FC78
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 02:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AEB9307A9DA
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 01:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FB23624AA;
	Thu, 26 Feb 2026 01:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZR+NE9fN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C0D30E852;
	Thu, 26 Feb 2026 01:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068683; cv=none; b=rU2CFG2VTOFM9UejO+YrChNGmfxQvWmEToAjBA/NFXlcKLWuB2Y1UtgPvzddXHl8qWhGWcuRDKeYcJBuNkufr/OZmoMYbSvUGvlopW1gqrAsJz2JiC/q7Ux7DyJgqZB1Ty9U1vRvS7K3FmmI3OsBvWTeZQsTsWsU6ZtqUsVdfOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068683; c=relaxed/simple;
	bh=I8IxnmVCk+FGLLSievLa0IM2y7OaqIwWWg+UEICANBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIyEDlKeeUsVxwm3pUoApmnKIXlCsj77eeyp4N6jgVN0R13y9OZWp0XtZgVk6pxmc0ZS3I0zXK1kXApAxwRYHrkDMLOYnlcSFnFot43C84QyDi93rwc+ag9b1Ld8CuxkXWyl3d+i6/8zvjKFhnjZJiCXCDaFaS2UAe8PstYrWik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZR+NE9fN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772068682; x=1803604682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I8IxnmVCk+FGLLSievLa0IM2y7OaqIwWWg+UEICANBY=;
  b=ZR+NE9fNmiJA5dUKOTTnmXr88BUHYzp2OTIj+qpoEQahsSa+EmTdNWhs
   hT9B/fXe4RsesiFlwndLpMOTof88hckTPCeW/qtSIpRLvUqfwe3fwMrXe
   O4ofaq5991dgxo2WjD7PjmG3PUJtub9UhaoWNfJFnK1WjfQHAyN05w7ip
   CLwNdG+WviQE6QS7IrBy/ZA8I+oTftSXBUnSwHT7JbSi4dVkVw5i4s6Do
   wkMSrnlyM8t1TxWUl7Mq7FAZnTLY4XHkvKfYhcn1F4ylW6/n2OR9PWiB3
   hveDkE+b4g5f0YiLtw3vCabwpN+G9VkSWRXDBqYPXsRhdwKv+/gKeu4yT
   g==;
X-CSE-ConnectionGUID: qJiIHdQ+Qp6gGH4WFxLgNw==
X-CSE-MsgGUID: 7CjaFp8HTri1yvqv1qO8UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73191677"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73191677"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 17:18:01 -0800
X-CSE-ConnectionGUID: cT28O2Z/QwivEHbEZlt1kQ==
X-CSE-MsgGUID: k7kraMSKR3GK1SwNuUxZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="216420543"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa008.jf.intel.com with ESMTP; 25 Feb 2026 17:18:01 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and gpio
Date: Thu, 26 Feb 2026 06:42:29 +0530
Message-ID: <20260226011230.832944-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226011230.832944-1-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260226011230.832944-1-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53429-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0FC919FC78
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


