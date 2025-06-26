Return-Path: <linux-media+bounces-35972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16630AE9EF1
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5221C443EA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C982E6126;
	Thu, 26 Jun 2025 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4CDO6S+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313F2E54AF
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944990; cv=none; b=GlbsTqRm/0WT7un4GLAvDNQM8hMtU0mQM5cuvuV2gUxXrVY6Cmeq2pL2kOS18ZSDhIViY9twF//GrGsTFrJNgObv4tmERjujOHJR4vAHDQ5bPJ5BExfRKSPrFYuURUR/hDUZTNLp8CftH49ZEx+hYD1t4Vi9F7uL3Iw0pJpwjIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944990; c=relaxed/simple;
	bh=ogOXHtVTMQqv5DXasJb1OKxkkxVsTQ6T73GoVBRxyIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hO/BaOWaXVBNDWWoVNAEjCfYLAb1rNwIu2Jmpzj2Q4DgWRn+zm6Z7M63ZY/vgohXGy9rbzROZp4NCUW9PKSGljuQpw1mvN7UC0Xd5OEeSQG9PSKZybEzhdv5vGqm5S/7vlcDtrfbuUPcxTmZgK+TAUMbOz2pKjuTZbOs/E5z87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4CDO6S+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944988; x=1782480988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ogOXHtVTMQqv5DXasJb1OKxkkxVsTQ6T73GoVBRxyIM=;
  b=O4CDO6S+AUUlstbnj7JA4k5QZF7fVQYK32C0/YA0EJESBklXshfb1q4R
   sqEuMp6KuUdSLGAXsftMauKIj+UYgEavrThYgt/FouXVLx66FAU9fy3XK
   +ffT/DZSqPnqCwifmCNmODRR9dsVFSkAVOk12vU8FARlT0y7TDZb9+vr2
   5Tk68OXSeNQR3js6C5YqgYlahH0+nZb7rTeO6EBkKzkhEfbOIamHjeqYG
   ejUvyj0bA7gCwgLxtLcEnu8HcjBxxioed4Tf2B5MwvKyO/BpIEJuqtxf2
   FxwduzTwFpNJwbOn0OV5SPRXOAae5hVllA6wLlPdqp9X4L4fwUtk4bllJ
   g==;
X-CSE-ConnectionGUID: e2CxN25dSieXg6jskThpsg==
X-CSE-MsgGUID: Omw45olrRliylGflLZAKnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921446"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:28 -0700
X-CSE-ConnectionGUID: wyjT5WcAQOavCYpXfyivAA==
X-CSE-MsgGUID: k4VUEfTjRcWc5yNxxhOmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049422"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:21 -0700
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
Subject: [PATCH v2 14/48] media: i2c: imx334: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:05 +0200
Message-ID: <c092521226f8d849b43cb787982a5cedd4610fac.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx334.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 846b9928d4e8..7a9b14d102c9 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -997,7 +997,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 				     "failed to get reset gpio\n");
 
 	/* Get sensor input clock */
-	imx334->inclk = devm_clk_get(imx334->dev, NULL);
+	imx334->inclk = devm_v4l2_sensor_clk_get(imx334->dev, NULL);
 	if (IS_ERR(imx334->inclk))
 		return dev_err_probe(imx334->dev, PTR_ERR(imx334->inclk),
 					 "could not get inclk\n");
-- 
2.49.0


