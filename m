Return-Path: <linux-media+bounces-44114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26725BC9E07
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4FAE1A631EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BBF235045;
	Thu,  9 Oct 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="woSKVxb0"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1D225390;
	Thu,  9 Oct 2025 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025252; cv=none; b=TSAO5/h8XgBMeZ6LiTeb+HU0Ii0nQxkm9aQTCALt/i/WDFfh/LndHpEdj5Zvr5jxAocthssVy4WAZn1dIvBNzGWucMOW5zGypKOSv8S9jHGJj24r4Y9bppjdybR3wkCLs3fYWZBhMvl7TzJlgMSzO4YPZEnnqlhNLUmA6oK3HPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025252; c=relaxed/simple;
	bh=DMEqDg//Z+EBvS1LkQGS2/QbzvTgDNenks+1gOOrhyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AW8HjrVbjJtqav4Drn+LqJrVxfo+ymQcuy0FLflCprh0kbq/5BP4NIXzfLNoMmh2zpK/9ccyoYwooSRvzd/7Mc0wQKyjwv7k1aOaygIxA9/D8INXJjAzb1Ogt2eci2S/hFwhjLmBA7ue3SozyAZ3wj1mWqdekkhojkZt2C04N2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=woSKVxb0; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025250; x=1791561250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DMEqDg//Z+EBvS1LkQGS2/QbzvTgDNenks+1gOOrhyA=;
  b=woSKVxb0GUg3wcHjjnEFkRehCqrIsUcHKgkOCLS9tMYyAqtIe/KVZmiZ
   zO/XbrZfUsI7e5K8vFDoIuOqaV5DF0pjWoZdekdFWYjzFL6uzB+7INH9z
   zdPXoY45AaRF/oDHiVILfmIoW/YlN0g3ZXaEqZFodN0m/QKfxEAkfYeA+
   qgIffkL9O5aoBxjoKblpzCugjW7TfiqOHuHlXhncvvozD3AgnvGKUBUd9
   15/lXNtwXyNJQziV84J/rgbTq2P9qm+QKQyP53Ql0Xk4D3jwfWvmEG8gt
   3U+7go/d+lGFcRu56qVaqm/WTjHyKTqFMW8+ZBgE+cczd/xMZSIEihzsC
   Q==;
X-CSE-ConnectionGUID: cxE1NKlcTy6ijIhpLPFRrQ==
X-CSE-MsgGUID: S3zefOBNT/u3fvF0DhiNTA==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057852"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:50 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:43 -0700
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
Subject: [PATCH 04/18] media: microchip-isc: Improve histogram calculation with outlier rejection
Date: Thu, 9 Oct 2025 21:22:37 +0530
Message-ID: <20251009155251.102472-5-balamanikandan.gunasundar@microchip.com>
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

Replace simple min/max detection with smart outlier rejection that skips
bottom/top 2% of histogram to avoid noise and saturation. Add channel
average calculation using weighted pixel intensity instead of simple
pixel counting for more accurate color analysis.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 83 ++++++++++++++++---
 .../media/platform/microchip/microchip-isc.h  |  2 +
 2 files changed, 75 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index c138e92a1aca..956bdea830e3 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -262,6 +262,10 @@ static void isc_set_histogram(struct isc_device *isc, bool enable)
 	struct isc_ctrls *ctrls = &isc->ctrls;
 
 	if (enable) {
+		/* Initialize histogram data storage for clean start */
+		memset(ctrls->total_pixels, 0, sizeof(ctrls->total_pixels));
+		memset(ctrls->hist_minmax, 0, sizeof(ctrls->hist_minmax));
+
 		regmap_write(regmap, ISC_HIS_CFG + isc->offsets.his,
 			     ISC_HIS_CFG_MODE_GR |
 			     (isc->config.sd_format->cfa_baycfg
@@ -1231,24 +1235,83 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	regmap_bulk_read(regmap, ISC_HIS_ENTRY + isc->offsets.his_entry,
 			 hist_entry, HIST_ENTRIES);
 
-	*hist_count = 0;
-	/*
-	 * we deliberately ignore the end of the histogram,
-	 * the most white pixels
-	 */
+	/* Calculate total pixels */
+	u32 total_pixels = 0;
+
+	for (i = 0; i < HIST_ENTRIES; i++)
+		total_pixels += hist_entry[i];
+
+	/* Handle empty histogram case */
+	if (total_pixels == 0) {
+		*hist_count = 0;
+		ctrls->channel_avg[ctrls->hist_id] = 256; /* Default middle value */
+		ctrls->total_pixels[ctrls->hist_id] = 0;
+		*min = 1;
+		*max = HIST_ENTRIES - 1;
+		dev_dbg(isc->dev, "isc wb: no pixels in histogram for channel %u", ctrls->hist_id);
+		return;
+	}
+
+	/* Smart outlier rejection - skip bottom/top 2% */
+	u32 dark_threshold = total_pixels / 50;   /* Bottom 2% */
+	u32 bright_threshold = total_pixels / 50; /* Top 2% */
+	u32 cumulative = 0;
+
+	/* Find effective minimum (skip dark noise) */
+	*min = 1;
 	for (i = 1; i < HIST_ENTRIES; i++) {
-		if (*hist_entry && !*min)
+		cumulative += hist_entry[i];
+		if (cumulative > dark_threshold) {
 			*min = i;
-		if (*hist_entry)
+			break;
+		}
+	}
+
+	/* Find effective maximum (skip bright saturation) */
+	cumulative = 0;
+	*max = HIST_ENTRIES - 1;
+	for (i = HIST_ENTRIES - 1; i > *min; i--) {
+		cumulative += hist_entry[i];
+		if (cumulative > bright_threshold) {
 			*max = i;
-		*hist_count += i * (*hist_entry++);
+			break;
+		}
 	}
 
+	/* Ensure reasonable range */
+	if (*max <= *min) {
+		*min = HIST_ENTRIES / 4;
+		*max = (HIST_ENTRIES * 3) / 4;
+	}
+
+	/* Calculate both pixel count and weighted average for useful range */
+	*hist_count = 0;
+	u64 weighted_sum = 0;
+
+	for (i = *min; i <= *max; i++) {
+		u32 pixel_count = hist_entry[i];
+		*hist_count += pixel_count;
+		weighted_sum += (u64)i * pixel_count;
+	}
+
+	/* Store total useful pixels for this channel */
+	ctrls->total_pixels[ctrls->hist_id] = *hist_count;
+
+	/* Calculate channel average */
+	if (*hist_count > 0)
+		ctrls->channel_avg[ctrls->hist_id] =
+			div64_u64(weighted_sum, *hist_count);
+	else
+		/* Default middle value */
+		ctrls->channel_avg[ctrls->hist_id] = 256;
+
 	if (!*min)
 		*min = 1;
 
-	dev_dbg(isc->dev, "isc wb: hist_id %u, hist_count %u",
-		ctrls->hist_id, *hist_count);
+	dev_dbg(isc->dev,
+		"isc wb: hist_id %u, avg %u, count %u, range [%u,%u], total %u",
+		ctrls->hist_id, ctrls->channel_avg[ctrls->hist_id],
+		*hist_count, *min, *max, total_pixels);
 }
 
 static void isc_wb_update(struct isc_ctrls *ctrls)
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index ad4e98a1dd8f..bd75ff4f109b 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -156,6 +156,8 @@ struct isc_ctrls {
 #define HIST_MIN_INDEX		0
 #define HIST_MAX_INDEX		1
 	u32 hist_minmax[HIST_BAYER][2];
+	u32 channel_avg[HIST_BAYER];      /* Average pixel intensity per channel */
+	u32 total_pixels[HIST_BAYER];     /* Total pixels per channel */
 };
 
 #define ISC_PIPE_LINE_NODE_NUM	15
-- 
2.34.1


