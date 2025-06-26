Return-Path: <linux-media+bounces-35963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16210AE9EE4
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4D201888340
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498FC2E54A4;
	Thu, 26 Jun 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG96tV1r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648772E1C64
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944928; cv=none; b=mMWWSfYjnOEiIxJ9z/L3zE/xFO9HcNmIycRe3dM9d0CWTqIxC75J26WgJ8pRtK5hTH5iO1ROaBMTgk7SYVimU602dvkA1ydjcByAl3eAnWwtfNBVB4CymQCRip1duFC0yom2pB1VgcU7E9r6ETS+NIS3wEknNKcgkxNONDQDjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944928; c=relaxed/simple;
	bh=LgFbFGib/yNiugg1fYb+3/kd/seyA2ZnD8UbyncULQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYm1fjXCp1x9DAj2AKliGFzJUZggZ2kyw6MRkYcLO/nclqIwLrSBcaFj+k9q64AFHsKXreBL6GtEfIwGXWFzH1tTUAaP9x4h9ArkDh4Xrj2FjbcqqbjO7DBFSZhweL3csfWYfwVmixTFdRf5fRKk5d3KfY/LRIXnXYqx9wl7FV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG96tV1r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944927; x=1782480927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LgFbFGib/yNiugg1fYb+3/kd/seyA2ZnD8UbyncULQY=;
  b=NG96tV1rIKLGrqxIcWFBae1rgYwoXlATdDITaCkI+BKkgTTDDz6FsjX5
   z8ndsWT52GI9+ukaETR7oQAJA4i/ipJNsFKVaPmNUydLUcPyetItZJRo4
   UFTC8rwEZUb9fiUq6SAYxDpQnhBJZEUnXHWcD+HGDIxqSYjH0+c/F6Kfz
   nTjpGXzmYl1a+QU160Edw9EXPQ9AJccs+EYQNr9U2fFP2F4x7xoJgIDR3
   I/R1a2bgq30NZMVFcCIJcer9UCqbDLLXFrsSJlwh0vsVtW5BESlQRM6yd
   hUue9xuV3q72UuXTfF+2M4qVQ1+7DQyhwF71b8X6b/s0KhkI8R3Au4qi2
   Q==;
X-CSE-ConnectionGUID: qLKjuy+AT2uuBpm0S1UzBA==
X-CSE-MsgGUID: ZCaUFyvKQsCZ8su1by6wBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921252"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921252"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:27 -0700
X-CSE-ConnectionGUID: BF7mUU7hRAGgTwTpS+zejQ==
X-CSE-MsgGUID: 1tpBR1knRTSRVbovY4OYCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049342"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:20 -0700
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
Subject: [PATCH v2 05/48] media: i2c: gc05a2: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:56 +0200
Message-ID: <0256da091ab34663e2e5d7ac31a141039bc0198c.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/gc05a2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index 3f7f3d5abeeb..4dadd25e6c90 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -1235,7 +1235,7 @@ static int gc05a2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gc05a2->regmap),
 				     "failed to init CCI\n");
 
-	gc05a2->xclk = devm_clk_get(dev, NULL);
+	gc05a2->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(gc05a2->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc05a2->xclk),
 				     "failed to get xclk\n");
-- 
2.49.0


