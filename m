Return-Path: <linux-media+bounces-35998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90406AE9F18
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91B71887961
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5C92E6D3F;
	Thu, 26 Jun 2025 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Szn1ZlHx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4B2E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945165; cv=none; b=qL+hVQBVTu+PIcvlzDu0X26QtJPwh58UY8WKlJsU9GFz/0P/gmSsqzuZJWbS1mWDVclV2nYWPDv7swSrZdvwkPezkc/WBccgPzlOtQTN6Y4ut3Z0dElP/H/GrDoYrCzfad9gvfo/5ls4evdTLkdH/v+o6+PH4xOxum/TceU3W3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945165; c=relaxed/simple;
	bh=JHsl9Xg2nNLHewbH3AghzqVTMnHOcuVueZYDBg4kGYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYmGXUl9jddj3Hg6jTJmP4U2UIHUeuW8m3kSXelM4vIHJl83RFaK9bIKudeirqqtbf7JW6eJpu9Bj/PdzEF88cdQQe63pkWWx1rP82wnx17kPoUcha/9/gtS3vzlHR53NeNWjknc/8O8a3rVNYFxYkIlpAylTuOGq3dz+1Wguy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Szn1ZlHx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945164; x=1782481164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JHsl9Xg2nNLHewbH3AghzqVTMnHOcuVueZYDBg4kGYM=;
  b=Szn1ZlHxmIh9bTinZW0TXZPnrojaFt/dUC7sNzxaRy6vYjOAnwuv9KMG
   r302Ol1tcrNRBWgbRpi6cxYJDQI6/bjJPOPBYKw9PPWNFM/BWxjK+o3Cv
   8DtO8AZ+gF/pJtoTqdhjHC5szVuUcix2+3yawPwYOIX8oBzZIfA9N7hQL
   TEWQGbjHrcrxp9etUiPPN5CJoBM1hvrBdC7eQj0Wpu60hCvjNjHst4BCE
   fDv58CDuLPSqEXHBupGnGg1AUUOk/cq3kvgf9kqkvSca2n3o+lqJV8sRQ
   foaWoiLhAZbrQMMTIkKSXupkv40X1VzWA6odTXpM5oX5qj+D3c+0L+WhI
   Q==;
X-CSE-ConnectionGUID: TnUTcrtGRkSlYUFF/Iqy3Q==
X-CSE-MsgGUID: UVTh8O7UTLWeOIANC41RKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922120"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922120"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:23 -0700
X-CSE-ConnectionGUID: zI4BGKMBSSC1M6iAyVtsIQ==
X-CSE-MsgGUID: uUtfXEXZRxaB+JAejHWBkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049867"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:17 -0700
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
Subject: [PATCH v2 40/48] media: i2c: ov9640: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:31 +0200
Message-ID: <44a82657a36c09d57f789418b0fa7f50d912811a.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov9640.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 01dbc0ba89c8..2190c52b1433 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -718,9 +718,10 @@ static int ov9640_probe(struct i2c_client *client)
 
 	priv->subdev.ctrl_handler = &priv->hdl;
 
-	priv->clk = devm_clk_get(&client->dev, "mclk");
+	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "mclk");
 	if (IS_ERR(priv->clk)) {
-		ret = PTR_ERR(priv->clk);
+		ret = dev_err_probe(&client->dev, PTR_ERR(priv->clk),
+				    "failed to get mclk\n");
 		goto ectrlinit;
 	}
 
-- 
2.49.0


