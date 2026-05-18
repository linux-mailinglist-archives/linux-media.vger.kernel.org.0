Return-Path: <linux-media+bounces-61969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBTkOin7CmqB+wQAu9opvQ
	(envelope-from <linux-media+bounces-61969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:42:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FC56BC8E
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5655C3188CB4
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A39F3F8EA8;
	Mon, 18 May 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nLok6D9v"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7993002BB;
	Mon, 18 May 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103852; cv=none; b=raIu6t2ruVPqyz3Z9g5jc5J6YaVbN+gTZUKGbpwDkUE4uR4YcZVlJuIb6VgBbA3iAUMI8c5cZZxv4DCIeRSwheJl9NR1ozouP+hTEmAch0ThYETZuQQgD4R0GRSUQGCYUjeJA6f7xwxEu6wr9SkGSGUCLlh4b3wfTsMpd+KVJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103852; c=relaxed/simple;
	bh=n3nsMJ2oFmIBkrGMO1+19bSY9smnW0o4BjVAif91DwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LbYbbq9nV6hmc6TRs84SnSBgHbZNwGfFosyGNW2LJg16zgVpzyR+zkrx8l8qFkV4BMWLXyu2eqmdrmx+UIp8N+IoN1pr/xEn9Q3CZwokrAeNaQ1/zaXPx5TbtdzFz9SLovUYDwYI3AM00agape354+Oz6GE2EN/CWkZMBbKCH0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nLok6D9v; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103848; x=1810639848;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=n3nsMJ2oFmIBkrGMO1+19bSY9smnW0o4BjVAif91DwE=;
  b=nLok6D9vwaq6r/EPeVlwIUlpLk88DJkshO73SQxIl8H2gzHGyZgTRvD7
   QlHP9/MqqUEU0QJaHTSd9QiDu31nwD55LU2VYZO2Nc2vHg2/Mcpun/uc3
   uniEQmwhUdvVdXptPKIWo7qSECQhpkokg1iNbHbPQ3kRBbD4XBnUsFQbD
   XrZCqG6ODJW1sEDDjdIz/J9UfaO4SdbCNDxt9kQ1s+YRJLe+rbGViyS3e
   aiuXnIWHXgusSjbtGJDZReW00ELlxGDJmEdfnHb1e2DGANwoJ3d+5LJ+Q
   gJQqcTTmHw4n9WsLf6yvQQudkKEpm0BI1COcXNWEefrmNyo9hDPjQkWVU
   g==;
X-CSE-ConnectionGUID: eIJGktPjSWaKDM9/S4gNAw==
X-CSE-MsgGUID: lPfJ1vm6RUCaCYHdM3CeIQ==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="56879094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 May 2026 04:30:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 18 May 2026 04:30:46 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:43 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:48 +0530
Subject: [PATCH v4 10/12] media: microchip-isc: use weighted averages for
 Grey World AWB
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-10-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 517FC56BC8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61969-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Replace pixel counts with intensity-weighted averages. Add 2% outlier
rejection at histogram tails.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c  | 167 +++++++++++++++------
 drivers/media/platform/microchip/microchip-isc.h   |   2 +
 2 files changed, 125 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 1727c98665d1..67c2999ae5b5 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -39,6 +39,12 @@
 	(((mbus_code) == MEDIA_BUS_FMT_Y10_1X10) | \
 	(((mbus_code) == MEDIA_BUS_FMT_Y8_1X8)))
 
+/* 4.0 in Q9 fixed-point: cap grey-world correction at 4x. */
+#define ISC_AWB_GW_GAIN_MAX	(4u << 9)
+
+/* Outlier rejection: skip darkest/brightest 2% of histogram. */
+#define ISC_AWB_OUTLIER_DIV	50
+
 static inline void isc_update_v4l2_ctrls(struct isc_device *isc)
 {
 	struct isc_ctrls *ctrls = &isc->ctrls;
@@ -1286,6 +1292,11 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	u32 *hist_count = &ctrls->hist_count[ctrls->hist_id];
 	u32 *hist_entry = &ctrls->hist_entry[0];
 	u32 i;
+	u32 total_pixels;
+	u32 dark_threshold, bright_threshold;
+	u32 cumulative;
+	u64 weighted_sum;
+	u32 pixel_count;
 
 	*min = 0;
 	*max = HIST_ENTRIES;
@@ -1293,44 +1304,103 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	regmap_bulk_read(regmap, ISC_HIS_ENTRY + isc->offsets.his_entry,
 			 hist_entry, HIST_ENTRIES);
 
-	*hist_count = 0;
-	/*
-	 * we deliberately ignore the end of the histogram,
-	 * the most white pixels
-	 */
+	/* Calculate total pixels */
+	total_pixels = 0;
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
+		dev_dbg(isc->dev,
+			"isc wb: no pixels in histogram for channel %u\n",
+			ctrls->hist_id);
+		return;
+	}
+
+	/* Outlier rejection: skip darkest/brightest 2% of histogram */
+	dark_threshold = total_pixels / ISC_AWB_OUTLIER_DIV;
+	bright_threshold = total_pixels / ISC_AWB_OUTLIER_DIV;
+	cumulative = 0;
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
+	weighted_sum = 0;
+
+	for (i = *min; i <= *max; i++) {
+		pixel_count = hist_entry[i];
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
+		"isc wb: hist_id %u, avg %u, count %u, range [%u,%u], total %u\n",
+		ctrls->hist_id, ctrls->channel_avg[ctrls->hist_id],
+		*hist_count, *min, *max, total_pixels);
 }
 
 static void isc_wb_update(struct isc_ctrls *ctrls)
 {
 	struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
-	u32 *hist_count = &ctrls->hist_count[0];
 	u32 c, offset[4];
 	u64 avg = 0;
-	/* We compute two gains, stretch gain and grey world gain */
-	u32 s_gain[4], gw_gain[4];
+	u32 gain, gw_gain, s_gain;
+	u32 min_pixels;
+	u32 frame_pixels;
 
 	/*
 	 * According to Grey World, we need to set gains for R/B to normalize
 	 * them towards the green channel.
-	 * Thus we want to keep Green as fixed and adjust only Red/Blue
-	 * Compute the average of the both green channels first
+	 * Thus we want to keep Green as fixed and adjust only Red/Blue.
+	 * Compute the average of the both green channels first.
 	 */
-	avg = (u64)hist_count[ISC_HIS_CFG_MODE_GR] +
-		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
-	avg >>= 1;
+	avg = (ctrls->channel_avg[ISC_HIS_CFG_MODE_GR] +
+		ctrls->channel_avg[ISC_HIS_CFG_MODE_GB]) >> 1;
 
 	dev_dbg(isc->dev, "isc wb: green components average %llu\n", avg);
 
@@ -1338,7 +1408,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 	if (!avg)
 		return;
 
+	/*
+	 * Require a minimum pixel count for both black-level offset and
+	 * grey-world gain: 1/64 of the frame area, which equals ~6.25% of
+	 * one Bayer channel's expected pixel count.  This scales with sensor
+	 * resolution and prevents noise-dominated histograms (from very small
+	 * crops or a nearly-empty frame) from producing wild corrections.
+	 * A floor of 64 ensures the guard is non-zero for tiny crops.
+	 */
+	frame_pixels = isc->fmt.fmt.pix.width * isc->fmt.fmt.pix.height;
+	min_pixels = frame_pixels ? max(frame_pixels >> 6, 64u) : 64u;
+
 	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
+		u32 hist_min = ctrls->hist_minmax[c][HIST_MIN_INDEX];
+		u32 hist_max = ctrls->hist_minmax[c][HIST_MAX_INDEX];
+		u32 channel_avg = ctrls->channel_avg[c];
+		u32 total_pixels = ctrls->total_pixels[c];
+
 		/*
 		 * the color offset is the minimum value of the histogram.
 		 * we stretch this color to the full range by substracting
@@ -1364,40 +1450,33 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		ctrls->offset[c] = -ctrls->offset[c];
 
 		/*
-		 * the stretch gain is the total number of histogram bins
-		 * divided by the actual range of color component (Max - Min)
-		 * If we compute gain like this, the actual color component
-		 * will be stretched to the full histogram.
-		 * We need to shift 9 bits for precision, we have 9 bits for
-		 * decimals
+		 * Stretch gain: scale the histogram range [hist_min, hist_max]
+		 * to the full 512-bin span.  Result is in Q9 fixed-point
+		 * (1.0 = 512).
 		 */
-		s_gain[c] = (HIST_ENTRIES << 9) /
-			(ctrls->hist_minmax[c][HIST_MAX_INDEX] -
-			ctrls->hist_minmax[c][HIST_MIN_INDEX] + 1);
+		s_gain = (HIST_ENTRIES << 9) / (hist_max - hist_min + 1);
 
 		/*
-		 * Now we have to compute the gain w.r.t. the average.
-		 * Add/lose gain to the component towards the average.
-		 * If it happens that the component is zero, use the
-		 * fixed point value : 1.0 gain.
+		 * Grey-world gain: scale each channel towards the green
+		 * average.  Require a minimum pixel count so noise-dominated
+		 * channels do not produce wild corrections.
 		 */
-		if (hist_count[c])
-			gw_gain[c] = div_u64(avg << 9, hist_count[c]);
+		if (channel_avg > 0 && total_pixels >= min_pixels)
+			gw_gain = div64_u64((avg << 9), channel_avg);
 		else
-			gw_gain[c] = 1 << 9;
+			gw_gain = 1 << 9;
 
-		dev_dbg(isc->dev,
-			"isc wb: component %d, s_gain %u, gw_gain %u\n",
-			c, s_gain[c], gw_gain[c]);
-		/* multiply both gains and adjust for decimals */
-		ctrls->gain[c] = s_gain[c] * gw_gain[c];
-		ctrls->gain[c] >>= 9;
+		/* Cap grey-world correction at 4x to avoid over-amplification. */
+		gw_gain = min_t(u32, gw_gain, ISC_AWB_GW_GAIN_MAX);
 
-		/* make sure we are not out of range */
-		ctrls->gain[c] = clamp_val(ctrls->gain[c], 0, GENMASK(12, 0));
+		/* Combine stretch and grey-world gains; result stays in Q9. */
+		gain = (s_gain * gw_gain) >> 9;
 
-		dev_dbg(isc->dev, "isc wb: component %d, final gain %u\n",
-			c, ctrls->gain[c]);
+		ctrls->gain[c] = clamp_val(gain, 0, GENMASK(12, 0));
+
+		dev_dbg(isc->dev,
+			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u",
+			c, hist_min, channel_avg, s_gain, gw_gain, gain);
 	}
 }
 
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 2c8bcaaa26ea..fccd7ff4846b 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -158,6 +158,8 @@ struct isc_ctrls {
 #define HIST_MIN_INDEX		0
 #define HIST_MAX_INDEX		1
 	u32 hist_minmax[HIST_BAYER][2];
+	u32 channel_avg[HIST_BAYER];
+	u32 total_pixels[HIST_BAYER];
 };
 
 #define ISC_PIPE_LINE_NODE_NUM	15

-- 
2.34.1


