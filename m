Return-Path: <linux-media+bounces-35410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4EEAE0C4D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A9F84A0B59
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B5A307ADE;
	Thu, 19 Jun 2025 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYMpWc+H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADE307AD4;
	Thu, 19 Jun 2025 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356433; cv=none; b=ex4UavhD3D5c96U+ZkPBJGPKPj+js9qoA5+Tx/u5pdTGxnq+mk2M64/oL6QqOLcl+FL/e89tp9gu3qujH+Ioan4POZxW5Z4H1s0WKMjPHz+QITQ35xre2uztYSPNQFUY7L4jDT5FpG5wdzreyRnf7QLyfG6+ESkyqeGqW5jS8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356433; c=relaxed/simple;
	bh=A7ijJ53lEBWjePdKjplJFVS8lnA26ndeER7Phf8YhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TP6dTHDSZsJX5io3pu3xyblnEcJRWgy/fJX9rqfr/TkbKCSCbTgHRBJBNu21DwiZC7NRi5PN9bJZmQLA3rgBkbjDBgYDfQN4J03/61Kj1e06QkSOzOdRGWc0Q+9yLJ23m8zkkSXzdyHn5GWfcdF4VqXMtTbpuA0/d8hoY2mKQVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYMpWc+H; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356432; x=1781892432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A7ijJ53lEBWjePdKjplJFVS8lnA26ndeER7Phf8YhlA=;
  b=BYMpWc+Hk0cSKOs1+qARPMpK1tYym1tJIV/qICOQvhOQ5wQyYy7TuGwk
   Yj9LVzs6/qALNIq2VMh2CJFmXjtbxYgJ+42uKUIBzJxgJLCaoUfU7DDxW
   VCYb/gMiNk/yIOY7pYjP/Mgv/GiiL2rmQGBALibhlV87XVWYTkE5nknbx
   +HBetdPyBG4WdymmIAT4u6oymNe3HdBfjX8hgGzi33rMA/l6/XH8piqmD
   brGC//zFeaT0bpsHoDK86gy1Lt2jGcnow9sI12I7na5qnYoreQZdIGzhG
   G0fWLg4paISsf2tBQ1CnLAzgVKGhdnpDGDQqAmtC1N5ADVQEZWFD6vU6v
   Q==;
X-CSE-ConnectionGUID: NXjE23FpRr+s/Lo08hINYg==
X-CSE-MsgGUID: DSYWNeCQTYGtCr8b4f+EXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048949"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048949"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:12 -0700
X-CSE-ConnectionGUID: 9VACkkzKR/e+oB5Hs+eQ8Q==
X-CSE-MsgGUID: qqvmYstSRTm2FZVC1Noh1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919857"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:01 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	prabhakar.csengg@gmail.com,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	martink@posteo.de,
	mattwmajewski@gmail.com,
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
	petrcvekcz@gmail.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	rmfrfs@gmail.com,
	zhengsq@rock-chips.com,
	slongerbeam@gmail.com,
	sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 41/55] media: i2c: ov8865: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:34 +0200
Message-ID: <273d77cc78cbe9fd144f96e68407f0f7b41d3895.1750352394.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get() fails on ACPI-based platforms, where firmware does not
provide a direct reference to the clock producer.

Replace devm_clk_get() with the new v4l2 helper
devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 95ffe7536aa6..5cc278c3e169 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2956,7 +2956,6 @@ static int ov8865_probe(struct i2c_client *client)
 	struct ov8865_sensor *sensor;
 	struct v4l2_subdev *subdev;
 	struct media_pad *pad;
-	unsigned int rate = 0;
 	unsigned int i;
 	int ret;
 
@@ -3019,39 +3018,14 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* External Clock */
 
-	sensor->extclk = devm_clk_get(dev, NULL);
-	if (PTR_ERR(sensor->extclk) == -ENOENT) {
-		dev_info(dev, "no external clock found, continuing...\n");
-		sensor->extclk = NULL;
-	} else if (IS_ERR(sensor->extclk)) {
+	sensor->extclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(sensor->extclk)) {
 		dev_err(dev, "failed to get external clock\n");
 		ret = PTR_ERR(sensor->extclk);
 		goto error_endpoint;
 	}
 
-	/*
-	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or
-	 * ACPI...but we also need to support the weird IPU3 case which will
-	 * have an external clock AND a clock-frequency property. Check for the
-	 * clock-frequency property and if found, set that rate if we managed
-	 * to acquire a clock. This should cover the ACPI case. If the system
-	 * uses devicetree then the configured rate should already be set, so
-	 * we can just read it.
-	 */
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &rate);
-	if (!ret && sensor->extclk) {
-		ret = clk_set_rate(sensor->extclk, rate);
-		if (ret) {
-			dev_err_probe(dev, ret, "failed to set clock rate\n");
-			goto error_endpoint;
-		}
-	} else if (ret && !sensor->extclk) {
-		dev_err_probe(dev, ret, "invalid clock config\n");
-		goto error_endpoint;
-	}
-
-	sensor->extclk_rate = rate ? rate : clk_get_rate(sensor->extclk);
+	sensor->extclk_rate = clk_get_rate(sensor->extclk);
 
 	for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
 		if (sensor->extclk_rate == supported_extclk_rates[i])

