Return-Path: <linux-media+bounces-36005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0399AE9F21
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EE3D168C80
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0703B2E7187;
	Thu, 26 Jun 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laJCuj/g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D02E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945212; cv=none; b=cpS4Bb0ez4c4Nw6cA0OZ+Or7Gwz7Wx7gf0XgunhazGAN/+gaKjKZSoW+OWYwQR1tlGY6h3ThXhtG0hf+BU9/I/AIhuTvclrKePE/EQ1fc/gxiZxaa9jvu20u8N3Je+zXaLqzwX1O5LKCw1cAOF9/wor6eR7LeDtFEqU6wM0cFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945212; c=relaxed/simple;
	bh=J7qJZTKy7N5pbjtRpZGKZ4jQpK/U0dSNGvFeKxHhyIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHnZLqB4VTwKH9mnIZvEhoP/TiIYSr3nJkVDiLAgkN9BGtEFN4rLMteI5cwz9Vcis+SHWf9sj3/u5ydB56sRdk0Yk0T56QoOgFveK8ymDngf3tq4XaFIV6TpZcTFjVFH0+7FJGhEpPH33rj7orBEXmbRQmrlUl3tUx2lJJtLka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laJCuj/g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945211; x=1782481211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J7qJZTKy7N5pbjtRpZGKZ4jQpK/U0dSNGvFeKxHhyIo=;
  b=laJCuj/gkuhD5slK3K96zhIo1FY6TdMr/2ic1dHNro9Yo7qYU9x9hN7n
   LGSWhyeKsJsKeffQZITPg7Hi7vJ9L/kgExoDy/zQCEntQPZWIrqOOH9C4
   /vKUe0ULSPUwDRzjNxlbO1nrcvK4KjRa7rznAEPwMxVYCBJqQARpO/JGt
   wWaY4mhcqRWFwvL5q7yOHtF1uxgrm/NlEtu0lkihcf5HRM7j2Lx8qVlOu
   7vUQm1RooD5q4GvINAuh8c6XxDTfncb4eKbqAzkxB6VUToEEd38cP0OmI
   dqrGxBLRbnT5myvHRA+gvahzQb8eps4Bzqo9SgV2QmrHexGNjKqolNSTW
   A==;
X-CSE-ConnectionGUID: tNBFjkLaSEqv7NT6V1YWxQ==
X-CSE-MsgGUID: Sc9V0q1WRJKx+BhpPi+d5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922265"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:40:10 -0700
X-CSE-ConnectionGUID: EGcCUnYQTGe439txa8wP+g==
X-CSE-MsgGUID: SkTEsfuNTtCPeZBOyKQoyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153050103"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:40:03 -0700
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
Subject: [PATCH v2 47/48] media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:38 +0200
Message-ID: <667a70d60d199dc039a7185874dffe175c96a4d9.1750942967.git.mehdi.djait@linux.intel.com>
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

devm_clk_get() fails on ACPI-based platforms, where firmware does not
provide a direct reference to the clock producer.

Replace devm_clk_get() with the new v4l2 helper
devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/vgxy61.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 5b0479f3a3c0..3d001e0b646b 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1761,11 +1761,11 @@ static int vgxy61_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	sensor->xclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(sensor->xclk)) {
-		dev_err(dev, "failed to get xclk\n");
-		return PTR_ERR(sensor->xclk);
-	}
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(sensor->xclk))
+		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
+				     "failed to get xclk\n");
+
 	sensor->clk_freq = clk_get_rate(sensor->xclk);
 	if (sensor->clk_freq < 6 * HZ_PER_MHZ ||
 	    sensor->clk_freq > 27 * HZ_PER_MHZ) {
-- 
2.49.0


