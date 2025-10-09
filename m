Return-Path: <linux-media+bounces-44112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292DBC9DF5
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAF041A62BA0
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA79D225A39;
	Thu,  9 Oct 2025 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Sin7atMa"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63521C9E5;
	Thu,  9 Oct 2025 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025250; cv=none; b=oAmVGlQhR7pU7Pf8n1xCXMa/8sjQ6Uf6eWoxKPpAZHdn+pJ74cHirx+CLCfjkPkk6Nh7u8uN1HfP/h0jGz0nOTAPr3/hdzsBEBPOmr1j+Dj789woW7FuBrKgf1mD2v7PD3tC7ZEnnFJcgXOFlr4MNuQ2aSbeC/W2yPnT/YAv0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025250; c=relaxed/simple;
	bh=HhopEnfXxoWrfgJ4xCvMufOgsASq4oytV0XNPkQ6TFE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OiUHFjS7EtcMYFO8ZDfHe3JrOgsVeqI4PvXJSLQG9m52W0CfF9nODVoi5cqyCRqMPGFm103Ty44XJj31UgVeyBdcBWObIJXX4EloHcU1Em+qHFhHz0pUaaU4rnkjVXlaDkk0dAi4nLbbjw2g6C9qcBlqGJMriwa8rGqGD7SLh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Sin7atMa; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025248; x=1791561248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HhopEnfXxoWrfgJ4xCvMufOgsASq4oytV0XNPkQ6TFE=;
  b=Sin7atMadVcqy9lC/66NF77ARADG8Lx/fOR+Qu7YhgrwZJx/n+xaNkEW
   vWtoPBlIHs+uBsB4weWo/6onlzMPOh+HasC4DX5ACVtV0SJ+39TgERa6U
   OrQYC/75CHTRs2VcDZobVpB+BF2SqGlKpnyB7ufphKsW/JyID+IYUEdzB
   86lQnrMYxS5Q0VP5RJSe5tm4BAreLRvVF0ocw0lo/8vmHinxNI20+wBps
   frUpN/n2fspqmRl1KoODndxGoBt1iV3gqZB9GA+/e29oXyLWPFg+J5EAU
   tbrEuWG3ZIlQBxCht6cDiT4f/iehYTT1z62Pd4UGPSdRTli2JK+EwqbWM
   A==;
X-CSE-ConnectionGUID: /pWBC8reTeqGekq1nPl3zQ==
X-CSE-MsgGUID: D+FGj4Y6S3azHFbGcI4IEg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057848"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:53:58 -0700
Received: from chn-vm-ex2.mchp-main.com (10.10.87.31) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:53:58 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:50 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 05/18] media: microchip-isc: Use channel averages for Grey World AWB
Date: Thu, 9 Oct 2025 21:22:38 +0530
Message-ID: <20251009155251.102472-6-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Replace pixel counting with actual pixel intensity averages in Grey
World algorithm for more accurate white balance calculation.This
provides better color correction especially in mixed lighting
conditions.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 956bdea830e3..bb2dd69a83f0 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1317,7 +1317,6 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 static void isc_wb_update(struct isc_ctrls *ctrls)
 {
 	struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
-	u32 *hist_count = &ctrls->hist_count[0];
 	u32 c, offset[4];
 	u64 avg = 0;
 	/* We compute two gains, stretch gain and grey world gain */
@@ -1328,10 +1327,10 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 	 * them towards the green channel.
 	 * Thus we want to keep Green as fixed and adjust only Red/Blue
 	 * Compute the average of the both green channels first
+	 * Use channel averages for Grey World algorithm
 	 */
-	avg = (u64)hist_count[ISC_HIS_CFG_MODE_GR] +
-		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
-	avg >>= 1;
+	avg = (ctrls->channel_avg[ISC_HIS_CFG_MODE_GR] +
+			ctrls->channel_avg[ISC_HIS_CFG_MODE_GB]) >> 1;
 
 	dev_dbg(isc->dev, "isc wb: green components average %llu\n", avg);
 
@@ -1340,6 +1339,11 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		return;
 
 	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
+		u32 hist_min = ctrls->hist_minmax[c][HIST_MIN_INDEX];
+		u32 hist_max = ctrls->hist_minmax[c][HIST_MAX_INDEX];
+		u32 channel_avg = ctrls->channel_avg[c];
+		u32 total_pixels = ctrls->total_pixels[c];
+
 		/*
 		 * the color offset is the minimum value of the histogram.
 		 * we stretch this color to the full range by substracting
@@ -1373,23 +1377,21 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		 * decimals
 		 */
 		s_gain[c] = (HIST_ENTRIES << 9) /
-			(ctrls->hist_minmax[c][HIST_MAX_INDEX] -
-			ctrls->hist_minmax[c][HIST_MIN_INDEX] + 1);
+			(hist_max - hist_min + 1);
 
 		/*
-		 * Now we have to compute the gain w.r.t. the average.
-		 * Add/lose gain to the component towards the average.
-		 * If it happens that the component is zero, use the
-		 * fixed point value : 1.0 gain.
+		 * Grey World gain using channel averages
+		 * This is much more accurate than using hist_count
 		 */
-		if (hist_count[c])
-			gw_gain[c] = div_u64(avg << 9, hist_count[c]);
+		if (channel_avg > 0 && total_pixels > 1000)
+			gw_gain[c] = div64_u64((avg << 9), channel_avg);
 		else
 			gw_gain[c] = 1 << 9;
 
 		dev_dbg(isc->dev,
-			"isc wb: component %d, s_gain %u, gw_gain %u\n",
-			c, s_gain[c], gw_gain[c]);
+			"isc wb: component %d, black_level=%u, avg=%u, s_gain=%u, gw_gain=%u",
+			c, hist_min, channel_avg, s_gain[c], gw_gain[c]);
+
 		/* multiply both gains and adjust for decimals */
 		ctrls->gain[c] = s_gain[c] * gw_gain[c];
 		ctrls->gain[c] >>= 9;
@@ -1397,8 +1399,9 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* make sure we are not out of range */
 		ctrls->gain[c] = clamp_val(ctrls->gain[c], 0, GENMASK(12, 0));
 
-		dev_dbg(isc->dev, "isc wb: component %d, final gain %u\n",
-			c, ctrls->gain[c]);
+		dev_dbg(isc->dev,
+			"isc wb: component %d, final gain %u, offset %d\n",
+			c, ctrls->gain[c], ctrls->offset[c]);
 	}
 }
 
-- 
2.34.1


