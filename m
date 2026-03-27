Return-Path: <linux-media+bounces-57310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO3TL1jMxmn5OgUAu9opvQ
	(envelope-from <linux-media+bounces-57310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:28:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57542349060
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44DF930A04D3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A4A4070F3;
	Fri, 27 Mar 2026 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cqv0s8Z9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EFF25A2B5;
	Fri, 27 Mar 2026 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635993; cv=none; b=YjcJdrKcXM7wLyjTJH4/kygdxNKhCu07Dd+o2L8aCI27+LFJkR0nRM7cNK1230gJeP5IMm7F/ARYy+p0yXWPngQVNdhpikHvxr5cEfWfIgsLEqJvaSabadqwku2lsHtxNJvNSmo7LlsYrQAhr0h6Ln6noKEdOPMBHUqsQhVExAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635993; c=relaxed/simple;
	bh=HH0PDa/9kZC42ciSwNTwgQKd8odFAAx6WCKu62EBRlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAXNktJfOaUvH2Q4pxRXrzLFfadxJf92RppD6WeL6E4oKuc2H9SP0WiQyADgyjUT7wfg60e9sW74icmWcOln3YKJsW5AsZrv7stZBA5u8EicZMKng6JirVj+lp+pWteCGOvGW12ekpK5TXy5YI4d3D128U0+DQ/CKGJ6zRaLSuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cqv0s8Z9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774635988; x=1806171988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HH0PDa/9kZC42ciSwNTwgQKd8odFAAx6WCKu62EBRlc=;
  b=Cqv0s8Z9jaaTp2Eu7oHyRYPyCTMNvITh3ZZc6gRuaiH9RSnWX/inITp9
   EiQ+c54umqeuZNcBHsUgb+8hNmZgzkXYy6p2WX0+7nY93ZXlitFp2if1Z
   JKIcDE1E9LTdHBtAKbIy5jqbkVPlxVmo/e+1+w5qsTAkKS8ZObF5Wrqd1
   cUPpME/V/2NNod+BLEnlda0+oiAO8LXgY1O7PbcfOx1Eedc4WgB/oowQ2
   1kBj05Jun2y/aNPY08KoeRAG+TlerC8UcH1v1+WdwROQEDWIRrisCgyi/
   RzB+oMJ5Hd6cct9uc/2XG8EIuCLgyk6n49SAJXPuX4RE96G2v0QGN5r85
   w==;
X-CSE-ConnectionGUID: ihl5lSzCSIGhTid3myJWGA==
X-CSE-MsgGUID: 0i/SoXNlQiisdUpQpHtJTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74746450"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74746450"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:26:22 -0700
X-CSE-ConnectionGUID: jpdvIlqFQYGQLXFkTxTXAA==
X-CSE-MsgGUID: nShSEwIlRwijnBJLjmSY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="218773035"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 11:26:19 -0700
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
Subject: [PATCH v6 2/2] media: ov13b10: Support multiple regulators
Date: Fri, 27 Mar 2026 23:49:58 +0530
Message-ID: <20260327181959.3528753-3-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327181959.3528753-1-arun.t@intel.com>
References: <20260327181959.3528753-1-arun.t@intel.com>
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
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57310-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 57542349060
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OV13B10 sensor driver currently handles a single regulator called
avdd, however the sensor can be supplied by up to three regulators.
Update the driver to handle all of them together using the regulator
bulk API.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
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


