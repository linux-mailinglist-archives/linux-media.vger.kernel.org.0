Return-Path: <linux-media+bounces-57249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCDgIy+MxmlELgUAu9opvQ
	(envelope-from <linux-media+bounces-57249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:54:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE66345A3D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D08131191D4
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66AF3EF0D2;
	Fri, 27 Mar 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFEqssDs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16A3F1650;
	Fri, 27 Mar 2026 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619129; cv=none; b=eeN1Fxuza/MFuCWkLgNR4Oftl82pc5EncAq1EG6OJxpMa3d5r5fUXKFpG8MSPDWGuhzpDCG9ho/c/YVCKR4QnnFpvnjdHK9oNP0EhhRioGJJTALyjQC8ci7pl5zm+n8Ncgw9B1BXH3Qd8QMxeEdl/q2jrvyOD/t5din/HSr8lqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619129; c=relaxed/simple;
	bh=IznfVUgNhWMJHCpKhtlk6Ijt6BIL4HKZTTbBUveC/AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I56joPZrBc28JnkQGxi5lrRJtbAzdtXl1TwVuBHIpUImQXjuRFWFO48uKkQtHkjGLkzsYFaJl3ualxE/W6caQpupqMZdX4foRym3wOhRhgXs3o8tpSeHZtc8DYanAsKnyvlv7EEqLlT1h8i0CD/nbN4UVWxFD00iVapNj9riN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFEqssDs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774619128; x=1806155128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IznfVUgNhWMJHCpKhtlk6Ijt6BIL4HKZTTbBUveC/AA=;
  b=bFEqssDsPaFVGpgC8/Dqt2TQiiu4wqqGe2d6pFl0oTUyjXYOusMsPXYa
   JdCjohHZ3WD3ii0ZvnlfDtV9NcoYLb72wJy38GWI0l9YcGCwCQlLwC358
   F5iCrQyljb3eriGT0C6QGsdsrz8v2RjJbIQMSJm4hG9ikA+nAZLX/9vve
   km2HtFSPlFaH2qJfsP/nPiRSMZp+ZEOeRIjXhusSnflr1lERrxZOHpMU2
   iL2JqENQv9x7Olu4Xo2BaOq+Qi/rxxciDbqSC0zDKXbvoSVT7TSmi1Htg
   3HfGIVi2wyHRFNBMtWPWldeB/k0ropLsCqmWwgjujqMpdj9eIy1dEK8VE
   Q==;
X-CSE-ConnectionGUID: Sx3iqJL8T42u5HNRj7o+Bg==
X-CSE-MsgGUID: /GYUBljPTcObiekgfyC7GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74873803"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74873803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 06:45:27 -0700
X-CSE-ConnectionGUID: CLFpc72RSlWacmfztycM8A==
X-CSE-MsgGUID: Y3QI57KoSNmJKj5G0Raj0g==
X-ExtLoop1: 1
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2026 06:45:24 -0700
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
Subject: [PATCH v5 2/2] media: i2c: ov13b10: support tps68470 regulator and gpio
Date: Fri, 27 Mar 2026 19:09:05 +0530
Message-ID: <20260327133905.3509868-3-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327133905.3509868-1-arun.t@intel.com>
References: <20260327133905.3509868-1-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57249-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: EDE66345A3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OV13B10 sensor obtains clock and regulators from the TPS68470 PMIC.
Add TPS68470 regulator and GPIO names to the sensor power on

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/i2c/ov13b10.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..4b7b17afb64c 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/regulator/consumer.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
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


