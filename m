Return-Path: <linux-media+bounces-35990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE67AE9F10
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE201799C3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860432E6D14;
	Thu, 26 Jun 2025 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyxDGfju"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7E2E62BC
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945111; cv=none; b=HXhLjVQstbl4wUfUyIcTgVyE+mhoIxJrn/xxv5nj4fJnIvUcvwkX7CESRXL5sSXJOWgHxsmDKO8RoN+30raYpWH7RmUxt3eddCBQM1uFdxSCchBaG6Kep7j/z/2MyIQMlJ2TrEC0wcKafmvpzBAnjQXQLgTp0KjysM2bDQgQWDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945111; c=relaxed/simple;
	bh=OrrA38uUx1Pw8yrsHtmtqinKVx8OJVVj83iJYPZ/EDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjSYIVq0PykYYzS/vZjB/nhcgUP12sD9qnAQI/Tr5K5WIDX8TGcp5XcikCr6KYY3iJAVT65oJTezlPl/bl6e+XBjsiF4jKlbXQ6JOOftyJpCn/PQg3SMXkPPu8HusS5kobBAnoQ5hNUIQZk7iuJeehEBc8wUQyifA/5luRkNOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyxDGfju; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945110; x=1782481110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OrrA38uUx1Pw8yrsHtmtqinKVx8OJVVj83iJYPZ/EDk=;
  b=RyxDGfjursuAddZvBc1GnUDxS5u4eBg4AYSgs1ZpCBFeV2/P7kkAimrb
   lYwTUOFCZ42HHz1KaskV1ejYdme6TCBPDnABgdE3VgII0VGH7SKSMxhW+
   JKzWzNjP7bGHAjinlohFc367qJiLCjltM57ufZUZ3v4NALnotf790m0sS
   t6SmwsaL80dvEPcAmtGDaGWB//0B8SHnI47NsdnVaOtvx5cbj2aWf4FOe
   Aqzi7aX0eKBQHWGefUQrvO11zGAuCz10PtAUiOwHNP5LfmY9Tfo0UUF7N
   fKAnR65v7pA4MhG1/HCs1lHnYFCq0TUd/ISHS8naPOeyPWjdwy23IZZ0b
   w==;
X-CSE-ConnectionGUID: pHstntFQTh647BhpT3LIGQ==
X-CSE-MsgGUID: gGAXoGCaSEqi5nsDcnYgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921969"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:30 -0700
X-CSE-ConnectionGUID: BxsF8tN2RmC/sRAZtIndEQ==
X-CSE-MsgGUID: Rk9jPEkoSUqExZosQqVg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049752"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:23 -0700
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
Subject: [PATCH v2 32/48] media: i2c: ov5695: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:23 +0200
Message-ID: <b39a425bfece2bdb337af91459910eaebee97445.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov5695.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 663eccdfea6a..fe7ad7b2c05a 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1264,11 +1264,11 @@ static int ov5695_probe(struct i2c_client *client)
 	ov5695->client = client;
 	ov5695->cur_mode = &supported_modes[0];
 
-	ov5695->xvclk = devm_clk_get(dev, "xvclk");
-	if (IS_ERR(ov5695->xvclk)) {
-		dev_err(dev, "Failed to get xvclk\n");
-		return -EINVAL;
-	}
+	ov5695->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
+	if (IS_ERR(ov5695->xvclk))
+		return dev_err_probe(dev, PTR_ERR(ov5695->xvclk),
+				     "Failed to get xvclk\n");
+
 	ret = clk_set_rate(ov5695->xvclk, OV5695_XVCLK_FREQ);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set xvclk rate (24MHz)\n");
-- 
2.49.0


