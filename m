Return-Path: <linux-media+bounces-57941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE2TC2JJzmlQmgYAu9opvQ
	(envelope-from <linux-media+bounces-57941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:48:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1C387E05
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB688300F799
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 10:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FF438A720;
	Thu,  2 Apr 2026 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/X83ocz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF373803CD;
	Thu,  2 Apr 2026 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775126840; cv=none; b=jSgWxaD+9DesAwnmTX4SBr02uCcqtQgl3kqyn02qlpzNrkS1+5Ely3zOI56CaxFXAAJodKTdSEGXiY77BKSzH+ZUnPPLDIjgV5Rlosi6eCD9x8KDdVpdUZhBDPJlPH/2hJDFxmlkQpdQO6oIqb0Mp/gYJcthfqPV06CMirF/BbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775126840; c=relaxed/simple;
	bh=I/xKuF04j2MAbZqz3njmiYIBz0WmeHEBkGYbSpvr/Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbQTvdqcsQj73Hey0FGWL/s3ZSlF+jQW2yonx5Pu9FjYp27bTwXZUgm5wpFIrbCUn6H0QnhPyU2rohbyu4FGAPOE09dZ/tL38QDL6/6Cqdui7O4n/XYylI39CGJPJiXHmEYsPmsJhLfehMbEJPsO7HeybipQxvdlfno04b52qGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/X83ocz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775126839; x=1806662839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/xKuF04j2MAbZqz3njmiYIBz0WmeHEBkGYbSpvr/Wc=;
  b=R/X83oczLQCw2rKqjBsTqktR46asbdsFYZPS/lIfMsys1oNfGsAVQjZ5
   68Y2OhCAK1AhqCIz3K4VhD/nSW4gUlJYGOh1ClWtzXPN5cTxXp4UE2QpQ
   c7xTZ8eDWFTlVNRVsS3s7GzFxcWguC1v8AFqEruzAAKWoqCLNCgw5Xv6+
   CfrUMa3fCR5t5qASY9zLS0ugjrf+oxqpXR0GGUHaC6e8EP5v6WdE23ihW
   nWU39d8KrjB2vud2XXFKcCYgKX9AbrQIVs/DCjQ3h7vjSfcMga6QHy+Zh
   xdyezDsCxkkDb04d3pIEsd+WC5y8JLAi1Bw63sVyjzHKqGcJ+Pao11vjQ
   w==;
X-CSE-ConnectionGUID: zXh83RIOTgiPBs8nL4ZhGw==
X-CSE-MsgGUID: JeRhPbefQG23PeFEhF+jzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76370705"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76370705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 03:47:19 -0700
X-CSE-ConnectionGUID: 3xSlXnZsRLGrvnRz8k+Elw==
X-CSE-MsgGUID: ZfTteFKMTVivMmRBgfcF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231349397"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2026 03:47:17 -0700
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
Subject: [PATCH v8 2/2] media: ov13b10: Support multiple regulators
Date: Thu,  2 Apr 2026 16:10:38 +0530
Message-ID: <20260402104045.4040328-3-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402104045.4040328-1-arun.t@intel.com>
References: <20260402104045.4040328-1-arun.t@intel.com>
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
	TAGGED_FROM(0.00)[bounces-57941-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,qualcomm.com:email,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 35B1C387E05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OV13B10 sensor driver currently handles a single regulator called
avdd, however the sensor can be supplied by up to three regulators.
Update the driver to handle all of them together using the regulator
bulk API.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
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


