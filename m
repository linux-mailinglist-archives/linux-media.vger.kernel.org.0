Return-Path: <linux-media+bounces-58223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FjPOaAz1mlZBwgAu9opvQ
	(envelope-from <linux-media+bounces-58223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:53:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7977E3BAF81
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FD2E307A35C
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 10:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F063BC683;
	Wed,  8 Apr 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD9Js2FZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4D3BADBF;
	Wed,  8 Apr 2026 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645513; cv=none; b=L/Ow0+h658Oc4cf2VDhECBtzMsC3T9vcqtP0bIn21b7mRp5GDoY/PSqWc4IF1N9XNDcaKUalCQlOtkAZhg8Mm+Yz/bmq/eUjhpZClt4gfqZDNCMKL1DFqeCBYoIhdY/ZZes9+leOpUesvoERhiyxxk8o0x58F0q0nyylFUOVaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645513; c=relaxed/simple;
	bh=LTeQaUWHvsph4joDVjSb9M34kexlgvWpIEuOIo8m45k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZAd5kvRkCqHwHKED4pysofM+ZsminNFaKhSPgVXqwO29HTPPMrU7BusZIgNOCLBZN9KMIMHG5ZEGlZfUVpUxbjFZV1/PY0tdMf9r+S1S+kUVSk+KJabDbo01CdjFxjWDCe6RU/1lqq5hIsHGrUKDXXFZ709A1rDyQ7ntAJ5eSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YD9Js2FZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775645512; x=1807181512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LTeQaUWHvsph4joDVjSb9M34kexlgvWpIEuOIo8m45k=;
  b=YD9Js2FZ1UMXatjUY3r1CWT09dwD7B/X9g5tsAon0HfQyRfjKv665/Ge
   7VyaAIdXvScm2kAARHB2P+gZHioDXjInC5NyDVsLfY6kyoHvtaBw8Ep2n
   gvDcubwi6hW4sU3R1FQqIyZmP2j5BavpBXLK4WrYTBADYfyBPggFXWZ85
   1YdkrOoSW3fZm5TKfHX1iaK7gC5RBHalNdQpsPkdkBdyz4wnOk1SIH/TB
   aHjcR8gdYYdaKH8EqesQSl5NWueaQYpv1vKNQjjlE/i2qq6AUx5JZRp5c
   AX6oNzkqYcVtxuuXNHyWPbWL4EstxJHxvVUiwRM+gunNpKZGkWAEvSSU4
   Q==;
X-CSE-ConnectionGUID: lCSxAnTqQjCOURcnXfPmcw==
X-CSE-MsgGUID: wawTNbuhTua5cF0lbPcIGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94013893"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94013893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 03:51:52 -0700
X-CSE-ConnectionGUID: PNSKOGPBSjaMb9fJTkrMag==
X-CSE-MsgGUID: jh35wxJNSK67r+POof/LRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228340140"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2026 03:51:49 -0700
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
Subject: [PATCH v10 2/2] media: ov13b10: Support multiple regulators
Date: Wed,  8 Apr 2026 16:15:07 +0530
Message-ID: <20260408104510.392906-3-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58223-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 7977E3BAF81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OV13B10 sensor driver currently handles a single regulator called
avdd, however the sensor can be supplied by up to three regulators.
Update the driver to handle all of them together using the regulator
bulk API.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov13b10.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..b0d34141a13a 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -8,6 +8,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -699,6 +700,12 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
 	},
 };
 
+static const char * const ov13b10_supply_names[] = {
+	"dovdd",        /* Digital I/O power */
+	"avdd",         /* Analog power */
+	"dvdd",         /* Digital core power */
+};
+
 struct ov13b10 {
 	struct device *dev;
 
@@ -708,7 +715,7 @@ struct ov13b10 {
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	struct clk *img_clk;
-	struct regulator *avdd;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov13b10_supply_names)];
 	struct gpio_desc *reset;
 
 	/* V4L2 Controls */
@@ -1194,9 +1201,8 @@ static int ov13b10_power_off(struct device *dev)
 	struct ov13b10 *ov13b10 = to_ov13b10(sd);
 
 	gpiod_set_value_cansleep(ov13b10->reset, 1);
-
-	if (ov13b10->avdd)
-		regulator_disable(ov13b10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov13b10_supply_names),
+			       ov13b10->supplies);
 
 	clk_disable_unprepare(ov13b10->img_clk);
 
@@ -1214,14 +1220,12 @@ static int ov13b10_power_on(struct device *dev)
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
+				    ov13b10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		clk_disable_unprepare(ov13b10->img_clk);
+		return ret;
 	}
 
 	gpiod_set_value_cansleep(ov13b10->reset, 0);
@@ -1475,7 +1479,8 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 	unsigned long freq;
 	int ret;
 
-	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
+	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset",
+					       GPIOD_OUT_LOW);
 	if (IS_ERR(ov13b->reset))
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
 				     "failed to get reset gpio\n");
@@ -1491,15 +1496,15 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
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
+	for (unsigned int i = 0; i < ARRAY_SIZE(ov13b10_supply_names); i++)
+		ov13b->supplies[i].supply = ov13b10_supply_names[i];
 
+	ret = devm_regulator_bulk_get(ov13b->dev,
+				      ARRAY_SIZE(ov13b10_supply_names),
+				      ov13b->supplies);
+	if (ret)
+		return dev_err_probe(ov13b->dev, ret,
+				     "failed to get regulators\n");
 	return 0;
 }
 
-- 
2.43.0


