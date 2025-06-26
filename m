Return-Path: <linux-media+bounces-35969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C118FAE9EEF
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6885D1C441B8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC29A2E62C8;
	Thu, 26 Jun 2025 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMxDFGcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC12E62A7
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944969; cv=none; b=GLZCNGterkIf8ZlZC8QRUlnaAr6+0ZV64KL1uRia9vOJBE9a55G5JltpC52p8BEE7/5lyaU4z5PGc4kSfmH2sINKOHKtcnNiG+vrtpHo9jHd/JhYcMGHw1o1LINUXXwPMCYdmTKbiPSrLZ7Jg0lQBYuIwZBTomM8oFPSXG2z0qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944969; c=relaxed/simple;
	bh=sWELgQTUz70DZDwZrgFdn0+9EYdlC/XwuhgrFHDgJfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USjYgSFXwZ0PewJlXg2/Z18c7QMGwpEDQiAghiOFb3ocz1vNlVbg+gBPlTe3/gJKBvbUKdsJgto53kEU7RDZP5dqRIEnjvwTSbG26FkOjyTAHKEn+vLyRKB9Q6nuaHoi6k4+EwmEpOflXGeFtAk1ydpV6CFL/xQ3YQUbC2vBWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMxDFGcJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944967; x=1782480967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sWELgQTUz70DZDwZrgFdn0+9EYdlC/XwuhgrFHDgJfc=;
  b=XMxDFGcJRkagR9HvmjqaIMt7H5Kgfe1J0zt2E3Jw9a0lNGZOr2MPFi4T
   jyO2HeOEGATt7aclRDy4tgf28/R4CizqZDLK67EPcws8DPaXMD6RPZ53L
   MoF1vu7eEJEw9QHsFv4+tuu3b1JckMylGEWCJGtnbP9nBUFdxGMNkqE3x
   vi5mYlxEZafJlQUE/pT9lw34eOL3/C8n+KO2orlLRqU1M9IBDYDBTDFnA
   mlKt+Rm3m3GQFtRjXvkcc2irn92NZADmIX65jQDmHf3OpscoyAuIofiBS
   5YzPPdlZsMlWt4VK+Xohf/ZdS8YBtyMn7g1Y3DdT8bp1Uavilt7nB6QrZ
   A==;
X-CSE-ConnectionGUID: Qu3Yycg2Ri6tl+I9udCQVw==
X-CSE-MsgGUID: 8KEdKhKdQ923fPVuGRv0lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921383"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921383"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:07 -0700
X-CSE-ConnectionGUID: 5k0VYHpLR9mMoeL1/nn5hg==
X-CSE-MsgGUID: 3Ruisg5ATpeANb4ZgclHXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049391"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:01 -0700
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
Subject: [PATCH v2 11/48] media: i2c: imx283: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:02 +0200
Message-ID: <9c6775140faf8da32ec1f2ba784daf6a0900227e.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx283.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index da618c8cbadc..8bff5bf4df12 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1462,11 +1462,10 @@ static int imx283_probe(struct i2c_client *client)
 	}
 
 	/* Get system clock (xclk) */
-	imx283->xclk = devm_clk_get(imx283->dev, NULL);
-	if (IS_ERR(imx283->xclk)) {
+	imx283->xclk = devm_v4l2_sensor_clk_get(imx283->dev, NULL);
+	if (IS_ERR(imx283->xclk))
 		return dev_err_probe(imx283->dev, PTR_ERR(imx283->xclk),
 				     "failed to get xclk\n");
-	}
 
 	xclk_freq = clk_get_rate(imx283->xclk);
 	for (i = 0; i < ARRAY_SIZE(imx283_frequencies); i++) {
-- 
2.49.0


