Return-Path: <linux-media+bounces-61298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PGRMKlPA2r63gEAu9opvQ
	(envelope-from <linux-media+bounces-61298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:04:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DE524513
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D74793282002
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B133C98B9;
	Tue, 12 May 2026 15:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="QRDUtoFh"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DE3ABD91;
	Tue, 12 May 2026 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600668; cv=none; b=G9DIt6iMJWAVCJPTEdjmd7otNxQwJidRbMFGRoKHNe+1aT5xsk0Sc6/VVGUWfrtdOQB+bzt/EuZYKblwNe8KkWmP1QyZj7L2KDnyfE1+scQ5Ym2iMqODGSObUwFbrvrnZZGOEEGBNcH9GBjEmac75oSSxlj0mEixXXDFXjoI/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600668; c=relaxed/simple;
	bh=GlKaxV0bBjGbvBXUWvk0e5s7WtjX09HZUeoJL6n7wpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfFAEfkBcPYYK/YrSRhNtb7mLN1tSoqcoS5QSIEvKUG2G+jwIZdL84BbNySGm3JKlGGQlKkq19jhiKimxbOrC0rVXOWDokDeKdNXbt0iFBzWsvQ6pUaMzdv/dimdy+Toc8Ec3KwLr3qrizUsemgk+1wl6AuOOobBnf4Md3ADQiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=QRDUtoFh; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600666; x=1810136666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GlKaxV0bBjGbvBXUWvk0e5s7WtjX09HZUeoJL6n7wpQ=;
  b=QRDUtoFhWYSNada3rJYhCNEbaSEottFYWFYvP6mAHqgzrVTLhwEfSC7F
   u0axZ/J5lvhGmrNUk33i+uY95U8m5sX6tKzmzP6WiEdoY7QM2l0RnhDcR
   XbUVWidtyYzysfcJsdaSkvy3j+36MFxtj1ov09NHFui3sUN78/5TqHC+I
   M3X1+a1GcyC838R2wA1SH6CMpOvRBR76fWyYn+XA2pDbad+JF1fCcKll+
   egXXCWRS+VPnquumFlv/AZ7cJDE6AKQYRK+RHY9Y7WYYyImkrqVgkSY14
   ZB254cvleqpDmqAPmYj+Q8p9DgAXxq7UR+ozUQ6hwnk5OwUKIBTEsM+eq
   g==;
X-CSE-ConnectionGUID: 8Svjjv0QRlCA5HY5ZrUlOA==
X-CSE-MsgGUID: bhCy90YaS/+67pOTIpqsAw==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="56617614"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:44:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:44:24 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:22 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 13/15] media: microchip-isc: use weighted averages for Grey World AWB
Date: Tue, 12 May 2026 21:13:37 +0530
Message-ID: <20260512154339.210444-14-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 468DE524513
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61298-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Replace pixel counts with intensity-weighted averages. Add 2% outlier
rejection at histogram tails.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 167 +++++++++++++-----
 .../media/platform/microchip/microchip-isc.h  |   2 +
 2 files changed, 125 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index e6386f8852e5..8fcf64708dc8 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -40,6 +40,12 @@
 	(((mbus_code) =3D=3D MEDIA_BUS_FMT_Y10_1X10) | \
 	(((mbus_code) =3D=3D MEDIA_BUS_FMT_Y8_1X8)))
=20
+/* 4.0 in Q9 fixed-point: cap grey-world correction at 4x. */
+#define ISC_AWB_GW_GAIN_MAX	(4u << 9)
+
+/* Outlier rejection: skip darkest/brightest 2% of histogram. */
+#define ISC_AWB_OUTLIER_DIV	50
+
 static inline void isc_update_v4l2_ctrls(struct isc_device *isc)
 {
 	struct isc_ctrls *ctrls =3D &isc->ctrls;
@@ -1404,6 +1410,11 @@ static void isc_hist_count(struct isc_device *isc, u=
32 *min, u32 *max)
 	u32 *hist_count =3D &ctrls->hist_count[ctrls->hist_id];
 	u32 *hist_entry =3D &ctrls->hist_entry[0];
 	u32 i;
+	u32 total_pixels;
+	u32 dark_threshold, bright_threshold;
+	u32 cumulative;
+	u64 weighted_sum;
+	u32 pixel_count;
=20
 	*min =3D 0;
 	*max =3D HIST_ENTRIES;
@@ -1411,44 +1422,103 @@ static void isc_hist_count(struct isc_device *isc,=
 u32 *min, u32 *max)
 	regmap_bulk_read(regmap, ISC_HIS_ENTRY + isc->offsets.his_entry,
 			 hist_entry, HIST_ENTRIES);
=20
-	*hist_count =3D 0;
-	/*
-	 * we deliberately ignore the end of the histogram,
-	 * the most white pixels
-	 */
+	/* Calculate total pixels */
+	total_pixels =3D 0;
+	for (i =3D 0; i < HIST_ENTRIES; i++)
+		total_pixels +=3D hist_entry[i];
+
+	/* Handle empty histogram case */
+	if (total_pixels =3D=3D 0) {
+		*hist_count =3D 0;
+		ctrls->channel_avg[ctrls->hist_id] =3D 256; /* Default middle value */
+		ctrls->total_pixels[ctrls->hist_id] =3D 0;
+		*min =3D 1;
+		*max =3D HIST_ENTRIES - 1;
+		dev_dbg(isc->dev,
+			"isc wb: no pixels in histogram for channel %u\n",
+			ctrls->hist_id);
+		return;
+	}
+
+	/* Outlier rejection: skip darkest/brightest 2% of histogram */
+	dark_threshold =3D total_pixels / ISC_AWB_OUTLIER_DIV;
+	bright_threshold =3D total_pixels / ISC_AWB_OUTLIER_DIV;
+	cumulative =3D 0;
+
+	/* Find effective minimum (skip dark noise) */
+	*min =3D 1;
 	for (i =3D 1; i < HIST_ENTRIES; i++) {
-		if (*hist_entry && !*min)
+		cumulative +=3D hist_entry[i];
+		if (cumulative > dark_threshold) {
 			*min =3D i;
-		if (*hist_entry)
+			break;
+		}
+	}
+
+	/* Find effective maximum (skip bright saturation) */
+	cumulative =3D 0;
+	*max =3D HIST_ENTRIES - 1;
+	for (i =3D HIST_ENTRIES - 1; i > *min; i--) {
+		cumulative +=3D hist_entry[i];
+		if (cumulative > bright_threshold) {
 			*max =3D i;
-		*hist_count +=3D i * (*hist_entry++);
+			break;
+		}
 	}
=20
+	/* Ensure reasonable range */
+	if (*max <=3D *min) {
+		*min =3D HIST_ENTRIES / 4;
+		*max =3D (HIST_ENTRIES * 3) / 4;
+	}
+
+	/* Calculate both pixel count and weighted average for useful range */
+	*hist_count =3D 0;
+	weighted_sum =3D 0;
+
+	for (i =3D *min; i <=3D *max; i++) {
+		pixel_count =3D hist_entry[i];
+		*hist_count +=3D pixel_count;
+		weighted_sum +=3D (u64)i * pixel_count;
+	}
+
+	/* Store total useful pixels for this channel */
+	ctrls->total_pixels[ctrls->hist_id] =3D *hist_count;
+
+	/* Calculate channel average */
+	if (*hist_count > 0)
+		ctrls->channel_avg[ctrls->hist_id] =3D
+			div64_u64(weighted_sum, *hist_count);
+	else
+		/* Default middle value */
+		ctrls->channel_avg[ctrls->hist_id] =3D 256;
+
 	if (!*min)
 		*min =3D 1;
=20
-	dev_dbg(isc->dev, "isc wb: hist_id %u, hist_count %u",
-		ctrls->hist_id, *hist_count);
+	dev_dbg(isc->dev,
+		"isc wb: hist_id %u, avg %u, count %u, range [%u,%u], total %u\n",
+		ctrls->hist_id, ctrls->channel_avg[ctrls->hist_id],
+		*hist_count, *min, *max, total_pixels);
 }
=20
 static void isc_wb_update(struct isc_ctrls *ctrls)
 {
 	struct isc_device *isc =3D container_of(ctrls, struct isc_device, ctrls);
-	u32 *hist_count =3D &ctrls->hist_count[0];
 	u32 c, offset[4];
 	u64 avg =3D 0;
-	/* We compute two gains, stretch gain and grey world gain */
-	u32 s_gain[4], gw_gain[4];
+	u32 gain, gw_gain, s_gain;
+	u32 min_pixels;
+	u32 frame_pixels;
=20
 	/*
 	 * According to Grey World, we need to set gains for R/B to normalize
 	 * them towards the green channel.
-	 * Thus we want to keep Green as fixed and adjust only Red/Blue
-	 * Compute the average of the both green channels first
+	 * Thus we want to keep Green as fixed and adjust only Red/Blue.
+	 * Compute the average of the both green channels first.
 	 */
-	avg =3D (u64)hist_count[ISC_HIS_CFG_MODE_GR] +
-		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
-	avg >>=3D 1;
+	avg =3D (ctrls->channel_avg[ISC_HIS_CFG_MODE_GR] +
+		ctrls->channel_avg[ISC_HIS_CFG_MODE_GB]) >> 1;
=20
 	dev_dbg(isc->dev, "isc wb: green components average %llu\n", avg);
=20
@@ -1456,7 +1526,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 	if (!avg)
 		return;
=20
+	/*
+	 * Require a minimum pixel count for both black-level offset and
+	 * grey-world gain: 1/64 of the frame area, which equals ~6.25% of
+	 * one Bayer channel's expected pixel count.  This scales with sensor
+	 * resolution and prevents noise-dominated histograms (from very small
+	 * crops or a nearly-empty frame) from producing wild corrections.
+	 * A floor of 64 ensures the guard is non-zero for tiny crops.
+	 */
+	frame_pixels =3D isc->fmt.fmt.pix.width * isc->fmt.fmt.pix.height;
+	min_pixels =3D frame_pixels ? max(frame_pixels >> 6, 64u) : 64u;
+
 	for (c =3D ISC_HIS_CFG_MODE_GR; c <=3D ISC_HIS_CFG_MODE_B; c++) {
+		u32 hist_min =3D ctrls->hist_minmax[c][HIST_MIN_INDEX];
+		u32 hist_max =3D ctrls->hist_minmax[c][HIST_MAX_INDEX];
+		u32 channel_avg =3D ctrls->channel_avg[c];
+		u32 total_pixels =3D ctrls->total_pixels[c];
+
 		/*
 		 * the color offset is the minimum value of the histogram.
 		 * we stretch this color to the full range by substracting
@@ -1482,40 +1568,33 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		ctrls->offset[c] =3D -ctrls->offset[c];
=20
 		/*
-		 * the stretch gain is the total number of histogram bins
-		 * divided by the actual range of color component (Max - Min)
-		 * If we compute gain like this, the actual color component
-		 * will be stretched to the full histogram.
-		 * We need to shift 9 bits for precision, we have 9 bits for
-		 * decimals
+		 * Stretch gain: scale the histogram range [hist_min, hist_max]
+		 * to the full 512-bin span.  Result is in Q9 fixed-point
+		 * (1.0 =3D 512).
 		 */
-		s_gain[c] =3D (HIST_ENTRIES << 9) /
-			(ctrls->hist_minmax[c][HIST_MAX_INDEX] -
-			ctrls->hist_minmax[c][HIST_MIN_INDEX] + 1);
+		s_gain =3D (HIST_ENTRIES << 9) / (hist_max - hist_min + 1);
=20
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
-			gw_gain[c] =3D div_u64(avg << 9, hist_count[c]);
+		if (channel_avg > 0 && total_pixels >=3D min_pixels)
+			gw_gain =3D div64_u64((avg << 9), channel_avg);
 		else
-			gw_gain[c] =3D 1 << 9;
+			gw_gain =3D 1 << 9;
=20
-		dev_dbg(isc->dev,
-			"isc wb: component %d, s_gain %u, gw_gain %u\n",
-			c, s_gain[c], gw_gain[c]);
-		/* multiply both gains and adjust for decimals */
-		ctrls->gain[c] =3D s_gain[c] * gw_gain[c];
-		ctrls->gain[c] >>=3D 9;
+		/* Cap grey-world correction at 4x to avoid over-amplification. */
+		gw_gain =3D min_t(u32, gw_gain, ISC_AWB_GW_GAIN_MAX);
=20
-		/* make sure we are not out of range */
-		ctrls->gain[c] =3D clamp_val(ctrls->gain[c], 0, GENMASK(12, 0));
+		/* Combine stretch and grey-world gains; result stays in Q9. */
+		gain =3D (s_gain * gw_gain) >> 9;
=20
-		dev_dbg(isc->dev, "isc wb: component %d, final gain %u\n",
-			c, ctrls->gain[c]);
+		ctrls->gain[c] =3D clamp_val(gain, 0, GENMASK(12, 0));
+
+		dev_dbg(isc->dev,
+			"isc wb: c=3D%u black=3D%u avg=3D%u s_gain=3D%u gw_gain=3D%u gain=3D%u",
+			c, hist_min, channel_avg, s_gain, gw_gain, gain);
 	}
 }
=20
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/med=
ia/platform/microchip/microchip-isc.h
index a4f1e6c22e44..44d54404250d 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -164,6 +164,8 @@ struct isc_ctrls {
 #define HIST_MIN_INDEX		0
 #define HIST_MAX_INDEX		1
 	u32 hist_minmax[HIST_BAYER][2];
+	u32 channel_avg[HIST_BAYER];      /* Average pixel intensity per channel =
*/
+	u32 total_pixels[HIST_BAYER];     /* Total pixels per channel */
=20
 	/*
 	 * Custom per-channel gamma LUT (10-bit output values, 64 entries).
--=20
2.34.1


