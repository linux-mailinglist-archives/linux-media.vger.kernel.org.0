Return-Path: <linux-media+bounces-36006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A48AAE9F22
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A298A1C43476
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EF02E718D;
	Thu, 26 Jun 2025 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKgKqtye"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E42E7179
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945218; cv=none; b=u/TnHcuu73ryztdS+S7OTEfT77AvOzbuqLU6lMxH8/CukoI8u9kkGNrSFtgJnOLpabmGE2Up3iEi5ITS86/yBMlsNiIYRnCPhA/nLIh4GexuflOE1Gyu8IN751GS82mN/845iFtWNuk1aR1Ebqz+kzScfAYDU7k8P9oSWXmA3sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945218; c=relaxed/simple;
	bh=irPjIU5945H+PtS1I48Ok7T7wuM9k9ncDQ1fbrVp3TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJP7CDVrLacDm+XX/OgfQ+HCzcP5fSLOFobhCiX9HUs1VUqo7msW6Sm3lZkzi5QNJLO5bSeHgzOl3WkjSTAUVOT2gNPQ+iMrivnwfSHtPjyky8CKoUkTL6Y4NzwCcVnufY7Ajccc7czDPnbH3XN2qtAyNjR4JA5jQaz7onrxWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKgKqtye; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945217; x=1782481217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=irPjIU5945H+PtS1I48Ok7T7wuM9k9ncDQ1fbrVp3TE=;
  b=MKgKqtyeE7oIZX4ujcKq0MS1GdXmvY2KOE+hgwV8xIaQFWkWuvOvY+A0
   hpou667riGqWeTvUcZrwOFJ0+14z93+1ZGb5tFLr0CbExfziPOREVO6+5
   rA1s0hL/TDwc+GZxaeseOqkS05XDnEh5ID+wjV2InHrGSdlgHpYGuUdy3
   H93rBduZ4Y8/Ol18rP5SK/FnlLPZG7Eoi2HgtHaOFJaWzVv6P159cDddz
   N0UlXNJ29/B/oGDiQJ2/hihs8Cz2810aQ161AvPM5ABjPlMr76DoWiHqH
   cqztwJhOhXGP+R32e2Wo2xlYDsbZdgC9hidTfqX49EqtVRIXO5aRfzttT
   g==;
X-CSE-ConnectionGUID: n5ehpHriS/WKK26gXxehAw==
X-CSE-MsgGUID: S+44R1xMTUintWjHVn6BPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922293"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:40:17 -0700
X-CSE-ConnectionGUID: QpAE5B9STzaU5/gAMEC2uA==
X-CSE-MsgGUID: uze++lXwQx6MDlqSLtQBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153050166"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:40:10 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 48/48] media: i2c: ov2680: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:39 +0200
Message-ID: <ddca65328c6ddd6acc3f581690ef43634e0cea79.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new v4l2 helper devm_v4l2_sensor_clk_get() that works on both
DT- and ACPI-based platforms to retrieve a reference to the clock
producer from firmware.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ov2680.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 7237fb27ecd0..78e63bd1b35b 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1079,7 +1079,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	struct device *dev = sensor->dev;
 	struct fwnode_handle *ep_fwnode;
 	struct gpio_desc *gpio;
-	unsigned int rate = 0;
 	int i, ret;
 
 	/*
@@ -1114,38 +1113,14 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 
 	sensor->pwdn_gpio = gpio;
 
-	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
+	sensor->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
 	if (IS_ERR(sensor->xvclk)) {
 		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
 				    "xvclk clock missing or invalid\n");
 		goto out_free_bus_cfg;
 	}
 
-	/*
-	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
-	 * ACPI... but we also need to support the weird IPU3 case which will
-	 * have an external clock AND a clock-frequency property. Check for the
-	 * clock-frequency property and if found, set that rate if we managed
-	 * to acquire a clock. This should cover the ACPI case. If the system
-	 * uses devicetree then the configured rate should already be set, so
-	 * we can just read it.
-	 */
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &rate);
-	if (ret && !sensor->xvclk) {
-		dev_err_probe(dev, ret, "invalid clock config\n");
-		goto out_free_bus_cfg;
-	}
-
-	if (!ret && sensor->xvclk) {
-		ret = clk_set_rate(sensor->xvclk, rate);
-		if (ret) {
-			dev_err_probe(dev, ret, "failed to set clock rate\n");
-			goto out_free_bus_cfg;
-		}
-	}
-
-	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
+	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
 
 	for (i = 0; i < ARRAY_SIZE(ov2680_xvclk_freqs); i++) {
 		if (sensor->xvclk_freq == ov2680_xvclk_freqs[i])
-- 
2.49.0


