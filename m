Return-Path: <linux-media+bounces-35962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B0AE9EE3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09A931887B80
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01802E543C;
	Thu, 26 Jun 2025 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2qCtU5p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16052E1C64
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944922; cv=none; b=Hn3/+X665iZ8bKuWd6W567SKdzRltRTKQ9rRRRQxKu1Gc2GXRRitNInGVmFgmGZ4oiZJ5tRKjYG26UpWEU0e0/Dcd/J6Yckjsv6gNUxPbqoEkJyMKXp4JMfVDlb8OGyRIwz5RxPcsRtrUBYNl23Gw30l50zu8uR+h0x6OxllAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944922; c=relaxed/simple;
	bh=mpVPS8FHsJdej30Y9pyfhDGBlMwvFSzHQ/bNRJtgPmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4f2CY9rHcF0SQjPEVfwVUBEwJZa5hMlMLChmcr5BkwtjfV8qiNIUiFcoYeupTgDZIjCkTJ+u8sTygfopZTb0Rfb01yC28W2NKeH13IgSh2poYsTc8l4wvFMGR9up7xVGwjqARN3ocy4XRPIo847G2EQxKKnA2UIJ+1qh9tGPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2qCtU5p; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944920; x=1782480920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mpVPS8FHsJdej30Y9pyfhDGBlMwvFSzHQ/bNRJtgPmk=;
  b=L2qCtU5pSSPr/SGlJy5ypTwJF0RmOcGJ7+8aXdob1q1OPAl595x4lVUn
   3l+VTcmUjXikEKak763kLXn0visCHF1GAAgjuznaWVeOo7OTxEU6Kjabq
   95jcm8YRHBhCq666AJA3CgRNQEvSJcSOpmFQzd2N22g5BFhNx/a/1q3KY
   4lrBhqRG25Z8HBvwBJMgFOWD86gdojqM3tf/wd7hsSMT3eR/yYM87ejWz
   IoGjNeufkVeWZ2+4tUMvlHSHZiwh5fSdOPbE1w8H4BgdOFcdUsjxKUa2T
   Crb1KkNQ1pOCLU8oSrxsVmm4g21cLoAPU0K0uiO5578cRoiSn6Tz3cjDi
   w==;
X-CSE-ConnectionGUID: JuAgJL4/TY6Moo7UcN5v5g==
X-CSE-MsgGUID: FCx+yq/ARUOpIykFmNtD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921231"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921231"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:20 -0700
X-CSE-ConnectionGUID: wkI3uCLOQHWut/ldqsis6g==
X-CSE-MsgGUID: oTCuRRm4Sfy6ZkXbLlW+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049324"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:14 -0700
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
Subject: [PATCH v2 04/48] media: i2c: et8ek8: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:55 +0200
Message-ID: <b9230cb5a66d08041d0deff8c5001d2944689180.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 7519863d77b1..4787b2c430f8 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1433,11 +1433,10 @@ static int et8ek8_probe(struct i2c_client *client)
 		return PTR_ERR(sensor->vana);
 	}
 
-	sensor->ext_clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(sensor->ext_clk)) {
-		dev_err(&client->dev, "could not get clock\n");
-		return PTR_ERR(sensor->ext_clk);
-	}
+	sensor->ext_clk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(sensor->ext_clk))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->ext_clk),
+				     "could not get clock\n");
 
 	ret = of_property_read_u32(dev->of_node, "clock-frequency",
 				   &sensor->xclk_freq);
-- 
2.49.0


