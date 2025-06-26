Return-Path: <linux-media+bounces-35965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043CAE9EE9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B06611C43ED5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F50E2E6D14;
	Thu, 26 Jun 2025 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efsiT5cz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7072E62C8
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944942; cv=none; b=slLyPmpLhAH9fZPcyM4wxGixuKKm0ffQNx+sYwi632azisaaHoiESVcVHyEBc9OcrMHB3APgCCgKA462JcBKdZV24mle5XKA2o1ZfhYSoKWflp2B10BcAL7OAGYuaSop8qOS9Vnq12TwtJbMCmOsZ3pxfpzTvXItBqyHwubZENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944942; c=relaxed/simple;
	bh=/ElEpeszW6s5qdEaYPtxV+A1tDp1jNH8YmNsUZIBKoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbRZe8WWSfjPVS4+6rBiqH9JCgzuiu7Wc7i2qOocKVT4VRoAGBFsNDKlfw5NUWtfQwd674r1DQogZkupikKmj7mCZi8tzKwZvAQjnzBm1h8kMjh+g4WKN6D4JgNWO6aaCYKQHAAkW9PQNxt92P3nYFBrkeokOA4vEk9bOgguir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efsiT5cz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944941; x=1782480941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ElEpeszW6s5qdEaYPtxV+A1tDp1jNH8YmNsUZIBKoA=;
  b=efsiT5czAR9QMrol+bjb65n0m3VQvlwcs1IxFGWjModTtHJsgOXTzlWK
   6r/hj3528UeRLsW6iotHfEp+WVf2edO38HdAQ5+ZJLbspGSjxHtYBEMat
   C+ABUWYsZvE53wsbKhkEMeaILYgCmKCX8ducdTiW/8X7Jo1yaXzhJtAOb
   uS2iRUdH0mjayKRXx+XpsG/hOwvrMMWPV3GO69Kc9bqLEbwwsH/xVmkDz
   3QuEHQDJ9PLsLtzvfMUDhJ2fgRpb1UJ1qhZAPoaYgSCwBxeheUGXbdzlw
   +wlLI29ZgJ7O8RYmq7QILIsYd6dXsiQKv2/62aJvA1x6ZhMCqYGV/c6f2
   w==;
X-CSE-ConnectionGUID: dpXnepiPQia9b5s/Qi1Rcw==
X-CSE-MsgGUID: xW9najl9Rb+nuKP4p2ADxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921305"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:40 -0700
X-CSE-ConnectionGUID: IMthWR/7S1yoxmrO26AnXA==
X-CSE-MsgGUID: PjZw9d50SjClVJJOSZRnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049357"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:34 -0700
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
Subject: [PATCH v2 07/48] media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:58 +0200
Message-ID: <31fc052a21b30f98a8c41d2ec0a2447c62aa72a7.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/gc2145.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index ba02161d46e7..52d9387559c9 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -1334,7 +1334,7 @@ static int gc2145_probe(struct i2c_client *client)
 		return -EINVAL;
 
 	/* Get system clock (xclk) */
-	gc2145->xclk = devm_clk_get(dev, NULL);
+	gc2145->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(gc2145->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc2145->xclk),
 				     "failed to get xclk\n");
-- 
2.49.0


