Return-Path: <linux-media+bounces-35424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5800AE0CC6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E968F6A262C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE182EA144;
	Thu, 19 Jun 2025 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czQUw35R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB891917CD;
	Thu, 19 Jun 2025 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356783; cv=none; b=hRDZTsBl+nvqW1+wSUwBKYsAk40zDqzmeiGgPO6PaFMO7+cWqThQXn0qOgBwDQl1avi/+bvfuQZJrVya9iwA09A0wYXJPTLTLlfYWy1CvriZ41cjRFAx7CbOG/D0tMYmRS6BqM9n3ilbouIfCTfeIDvPtMyanlMdDOxfuU5eif4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356783; c=relaxed/simple;
	bh=6c+2N0AUxiqNfsZha6j0d5qz7pyY+SbEaXAGcihmsbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBkpaSKW945djvk4CZzLmy6xowAw0KE2Czkk2BT32Fb9DwdKH3R0DbuRNuoc7JjenLJ8J7oQuymMUXi4dgyQjrQr1843TJegd87TYH92UTROtKcWs1/LGIE+tpAca60HeRDPLjhkCsgHwDvb7oyRFk7za+DRB0zDmx+bWrjdPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czQUw35R; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356782; x=1781892782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6c+2N0AUxiqNfsZha6j0d5qz7pyY+SbEaXAGcihmsbw=;
  b=czQUw35RckoPEFbh+9Z/y6qNHjvwRR4c+XSgIu4KtzrSiXqVL3DjYbl9
   axTVXXfKWRO//oAo66C0M+6ED1nP4oq4637um2x2GQ80kUDWzqwkLplCv
   cIEC/RDXKC20M8yXfN+ByHxLzYB/MZXRSQVN2smLV6hnpX/5MXU7tUx1o
   1C7Zo1+jrDzuK5ax4qAgQLpEvyfQPoIU+mNfcQA9MyHU/sbrlq1zemh2C
   oqUN/rYddfLki3ftXv74mdtEevIDVIZisxch0FvwSFch7Axm7B4w0Rrqn
   0Cyxk5VdtAkcxxGzkR3t6xXr0TidcRxvj4oHkLy293gpfYQPCPYe0gHmK
   g==;
X-CSE-ConnectionGUID: 9Lyu564qQoWOJXCPEgPSjA==
X-CSE-MsgGUID: jMcLAvUfTeO65XVHbLy7Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054571"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:13:01 -0700
X-CSE-ConnectionGUID: 0v6h7fMQQJObZCL07krtCA==
X-CSE-MsgGUID: e7qUCbilQ+WIIAzwOoMH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143748"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:52 -0700
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
Subject: [PATCH v1 55/55] media: i2c: ov2680: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:24 +0200
Message-ID: <6284706df845a3c88826f1c3bd17f60d3e71ecd9.1750352394.git.mehdi.djait@linux.intel.com>
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

Use the new v4l2 helper devm_v4l2_sensor_clk_get() that works on both
DT- and ACPI-based platforms to retrieve a reference to the clock
producer from firmware.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 7237fb27ecd0..c974169c92f8 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1079,7 +1079,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	struct device *dev = sensor->dev;
 	struct fwnode_handle *ep_fwnode;
 	struct gpio_desc *gpio;
-	unsigned int rate = 0;
 	int i, ret;
 
 	/*
@@ -1114,13 +1113,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 
 	sensor->pwdn_gpio = gpio;
 
-	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
-	if (IS_ERR(sensor->xvclk)) {
-		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
-				    "xvclk clock missing or invalid\n");
-		goto out_free_bus_cfg;
-	}
-
 	/*
 	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
 	 * ACPI... but we also need to support the weird IPU3 case which will
@@ -1130,22 +1122,15 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	 * uses devicetree then the configured rate should already be set, so
 	 * we can just read it.
 	 */
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &rate);
-	if (ret && !sensor->xvclk) {
-		dev_err_probe(dev, ret, "invalid clock config\n");
+
+	sensor->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
+	if (IS_ERR(sensor->xvclk)) {
+		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
+				    "xvclk clock missing or invalid\n");
 		goto out_free_bus_cfg;
 	}
 
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

