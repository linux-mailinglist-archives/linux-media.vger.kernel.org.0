Return-Path: <linux-media+bounces-35996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EDAE9F14
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BCBB167CAB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B503A2E6D36;
	Thu, 26 Jun 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo9xJnM8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8BD142E83
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945152; cv=none; b=mQP50tFtG67ih+E5Ht3ZyWQJLHAvD9SIT6pnzG+kDlDdz9DgQqbHFmopDcczVspfUQU33SSs+ke83PqzS/B6szZggOT7pPnqZMri4R45zaIUOxbh1r0cQjAPjw7ctTynOL/Z61uYdpGYby5fNJAz6SI8x27ZdLNaUEuVbDxTVeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945152; c=relaxed/simple;
	bh=JmHNBaFgTZYAyVdK08+RNqStWcmfkGANFU2yIC2tujE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wg5CHPhbuy0hjE0ell4wsNmT0Rmf4YPhRWKh3mZXr+szdaLKQBXRjJowWVAKGqij+cRO6DvpO9hBzUuseC0EfZHLj2UpRlnNgHaiuxtNqK+ggmpHf62cyvSRwVkoGtvGT+AiV4/VHhmuJhLja7nCXs/+kuXnFkqGr/1bl09i6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo9xJnM8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945150; x=1782481150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JmHNBaFgTZYAyVdK08+RNqStWcmfkGANFU2yIC2tujE=;
  b=fo9xJnM8ighNOXg5F0QUZajo7CAQ8QsoTozjrDTfzDWugpjTNQ0GSsRx
   Gxzt+fMu1x7bAIEP6auSRbXqueAkXUxHCwxkuiLNsD9nLfCfR0cKUN3bt
   WC+/2FzzClVMGZe3WutiFL7m/o2BPU48yjyyAh2JODkvbIrUIYPppjSEj
   VPRhkiS6QcJ6QLoFi9IAe6JN0p39wrevtxbjTusq8gj2ivPUK2bxRcPZl
   KHCZ7eUBBK2WDibL1fof79oPHzQIWRA4UDZaCAtEtVZHSLQuhy2YYeAAh
   RGhz5N7SZvXKk/cJGOqdc7FWDpT0urPBwSjO3vHZbgcBfO1UAKs6o/t8E
   w==;
X-CSE-ConnectionGUID: XLWT5WQhQt+4r3VG1dtTOw==
X-CSE-MsgGUID: N3Plvrp7QIOZnwtZYo9ang==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922089"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922089"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:10 -0700
X-CSE-ConnectionGUID: LRImrYZHS2ux6RmgaoLYUg==
X-CSE-MsgGUID: 8pKCLxcrTdW/VBq/GuyWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049828"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:03 -0700
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
Subject: [PATCH v2 38/48] media: i2c: ov8865: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:29 +0200
Message-ID: <ec786f7159558f0fd7998302272f6cc53f9aed4d.1750942967.git.mehdi.djait@linux.intel.com>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ov8865.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 95ffe7536aa6..a5ea26337a76 100644
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
-		dev_err(dev, "failed to get external clock\n");
-		ret = PTR_ERR(sensor->extclk);
+	sensor->extclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(sensor->extclk)) {
+		ret = dev_err_probe(dev, PTR_ERR(sensor->extclk),
+				    "failed to get external clock\n");
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
-- 
2.49.0


