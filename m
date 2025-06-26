Return-Path: <linux-media+bounces-35967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4EAE9EED
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F38EC56283E
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD35B2E6D0B;
	Thu, 26 Jun 2025 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jR/hV6aV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC692E1C64
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944956; cv=none; b=uOphM/DP7sMQ6R8D0g6N/azTGrJG5hHXLC5jodsIowKAEbP2LqQwPnQBkh0mT4qsDZqMFMncjfqeH+2V6L73ImyY1HRYcO/VJqvI+ncYy8eGZ8nR9gwGkkPYfkUG44QFyUf+utZhFNuYnwcx4Le8/r2XbyHdXXXDlPBU13dMjAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944956; c=relaxed/simple;
	bh=an8COh7GJauY4WQQ5+HVFpvGQWV3f+Yin8vvrNvsbg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnuVPRkVcTrgV9kDkcanmA51fO/TERmNPf0pcc5EuqsMcaF/EtORss7X5pgH6x7yDq0q8H7/oes2hFA8nycDozOg0gZnu/uPOhSyRlwW26Gf3ZjQVRGUtZGNL3PENIKnjln6z4gNSPXXzD85kHFm/9zV+5IvDphEFvgPekyjKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jR/hV6aV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944954; x=1782480954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=an8COh7GJauY4WQQ5+HVFpvGQWV3f+Yin8vvrNvsbg4=;
  b=jR/hV6aVFpZEb8M9yYCJ/3uRj8P9rY4n43Xf6/+6LVuxEnJ3yHl0S/nP
   ieIiCu5TwtcNcgihbnL2Oy8mtUPECSbUFwsNlrFUy77SvGR2MHgCsW07w
   l7HFghG259DHdk5LK4fZMC1yNalIDbdBJoIhZWQApAL/0+Vv/HofK9r1E
   8OgKA9HnO8JTQnbfULt/ZlE/WeDdr0Y6F0Lz6GhQLbUPNr+jp9KNR5J3e
   BSHUPG8fKTxUBqPxZnGOWKm9qZhaK3T3uwqA5jMkH67rlgqgaAUDEoh2k
   ygDPVYhc8ENuXtIDOvRSzEnwk9vVeSOwom6atJ0COYF0M62lARKVsFaIg
   g==;
X-CSE-ConnectionGUID: xyHQYotASMelw8fbORkAMw==
X-CSE-MsgGUID: ZflJipvaSWqfNAzlTVb4PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921348"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:54 -0700
X-CSE-ConnectionGUID: spyE0HYQTm6/yOEsMg2noA==
X-CSE-MsgGUID: bkNRbaEqRz6ytLbq+24Jew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049371"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:47 -0700
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
Subject: [PATCH v2 09/48] media: i2c: imx214: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:00 +0200
Message-ID: <8b6a06bc91a286fb5e39fa659e296bb3888d1d14.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx214.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index dd7bc45523d8..73e7bc2f85c0 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1271,7 +1271,7 @@ static int imx214_probe(struct i2c_client *client)
 
 	imx214->dev = dev;
 
-	imx214->xclk = devm_clk_get(dev, NULL);
+	imx214->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(imx214->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");
-- 
2.49.0


