Return-Path: <linux-media+bounces-54112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OFdOaXOpWm1GwAAu9opvQ
	(envelope-from <linux-media+bounces-54112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:53:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C081DE1D9
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C405D306B7B6
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 17:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6674301A6;
	Mon,  2 Mar 2026 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCVIymqR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBB42F57C;
	Mon,  2 Mar 2026 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473954; cv=none; b=L6lg7DYPmal6RfALMbBFIAy9PtVCwYa2jGZumjdYElmJrNUQeBnoEnJFkLYLMMfJZSe6apENel+f0i+REpSjUes2awleH4v0FCLJ5SISuebWAH8qIBbJyplGtcRWpKmoRD/LwbEyERt8nFdjPyujI8p8QrqWGmmEACkkiVSdE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473954; c=relaxed/simple;
	bh=f+yYe0anx63PYHKFrWxE/NIAazMIPMqQq9UELZthpS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgI3/xp7OMQzklZv1HIOOxrJB81GWvTaBaJIbU9Uf+OqZrEml8197aBTt1LIGVLy1QmCceZRmUZc+UHcOuAEm1pK46JdRodNjcRkGwGYEK7XQUEKobEVouWaXoFLKHgylGuiy0D7BLRm9tlWjHXC+902Hi8oY95jWCUhvA+VfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCVIymqR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772473951; x=1804009951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+yYe0anx63PYHKFrWxE/NIAazMIPMqQq9UELZthpS8=;
  b=gCVIymqRipY/BKvcdsf8OJC8CBaUVBLq1BlcQwLV0l7p2BG+L6/l3rVG
   6NBLiXOQp3kH0ifgzDg8FfoBFbnlOZedEYsOjFcNoTiU6Bu12IEwfxldT
   a05zfXxfcuvYBiaJL/NLlFlks2Nj+7v2YxPIgXRzuYNapDHYkuyX2QYcJ
   4U/ZaYyMpcNfvL8Sb1jgbnm5qCzB3/rPcAIYnVuD3ocw9R5ZW7sFk0xRR
   QciMj+XqiYbEddYq12hZVsh91IJ+jhi/N6BZs9YkFus5gc683aadJCMi2
   ph5GQ+b5nQRy7O73XTqp0KFvosSQAo969Jg9iqvlcfKYzCYa5hBFwSD+k
   A==;
X-CSE-ConnectionGUID: aGSxkvpRQn+oHQUZz2XhCA==
X-CSE-MsgGUID: rZzKkmgCRwSoUbNpLIObKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77356740"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="77356740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 09:52:30 -0800
X-CSE-ConnectionGUID: NSUtNXDPR1WvG1W5D1Q4ag==
X-CSE-MsgGUID: jp2UtXLmTlqomU+W79njyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="248238385"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 09:52:27 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: sakari.ailus@iki.fi,
	sakari.ailus@intel.com,
	sakari.ailus@linux.intel.com,
	arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com,
	dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehdi.djait@intel.com
Subject: [PATCH v3 2/2] media: i2c: ov13b10: support tps68470 regulator and gpio
Date: Mon,  2 Mar 2026 23:16:44 +0530
Message-ID: <20260302174644.1258718-3-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302174644.1258718-1-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260302174644.1258718-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 62C081DE1D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-54112-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

The OV13B10 sensor obtains clock and regulators from the TPS68470 PMIC.
Add TPS68470 regulator and GPIO names to the sensor power on

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/i2c/ov13b10.c | 48 +++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..d678d0d49266 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/regulator/consumer.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -699,6 +700,13 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
 	},
 };
 
+static const char * const ov13b10_supply_names[] = {
+	"dovdd",        /* Digital I/O power */
+	"avdd",         /* Analog power */
+	"dvdd",         /* Digital core power */
+	"vdd",		/* Vcm power */
+};
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
+			       ov13b10->supplies);
 
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
+				    ov13b10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		clk_disable_unprepare(ov13b10->img_clk);
+		return ret;
 	}
 
 	gpiod_set_value_cansleep(ov13b10->reset, 0);
@@ -1475,7 +1480,8 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 	unsigned long freq;
 	int ret;
 
-	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
+	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset",
+					       GPIOD_OUT_LOW);
 	if (IS_ERR(ov13b->reset))
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
 				     "failed to get reset gpio\n");
@@ -1491,15 +1497,15 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
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


