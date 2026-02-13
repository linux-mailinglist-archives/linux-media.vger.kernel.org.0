Return-Path: <linux-media+bounces-52746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFVhJrAvj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:05:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B98136E33
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5093E3112856
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E2A36212D;
	Fri, 13 Feb 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m/fLK/ap"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01686361DCF;
	Fri, 13 Feb 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991335; cv=none; b=HetVXHHXCGPb/vv0jjgFfN0VZuAo+S2qIGZ7CQLdqexf85/R0mCjbzN7nGiC9WaI2izddypGTWdgi4HRhBMetaGhZIFvTiSGoq8BZ4SisKXYSagjKpDN4yi5WZenZL1/yQo8yv5Zy4u7+gMMtGFPLxpuxKhte+Ih76oa1VNSS2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991335; c=relaxed/simple;
	bh=QqgQyWdO4Ut0ngGaW/ZW4D336zGgMk+CJLwaBYWu2Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dszb1I77lK/v2aazNeXGIAy5aL2945NbHLor5xFN2Uc4PPPmxaN7bsoKTDNCHwfawgM4TmhJ3qKA9O08tmJz3PkNf8Gsn5S5sTjhGe17zg+7WilIP7op3rMP11arXFcobW4XQ7YzCQpsJidO4LlBZaQXYqvQAJM11tlO+rDnbBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m/fLK/ap; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70894268F;
	Fri, 13 Feb 2026 15:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991278;
	bh=QqgQyWdO4Ut0ngGaW/ZW4D336zGgMk+CJLwaBYWu2Hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m/fLK/ap1T8MN33o6clLop/gr4Gm9NIOkXNQH0fBsMaJu2Vd2Vs40LPlHHYFxWCRE
	 cIofATYKlDGNVGEzgIbmpNuIOWGe87QolJBY+nXjXh0LxTdJ6eMq1HdQONpMzpldc2
	 0bk6VrYEgEnDX0jY8UkObiICNqwy0QkLrhqJY2Jo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:43 +0000
Subject: [PATCH v2 04/25] media: i2c: imx283: Move scan out data to single
 data structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-4-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=6712;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=QqgQyWdO4Ut0ngGaW/ZW4D336zGgMk+CJLwaBYWu2Hc=;
 b=2+YvjgHKhnqxNN+7bt1p4To4+uZ3Ih5VH7dktgwhioyh7YQcMvZ6jGnrZVgBnBIbgBeqZFcIh
 cJkUkig7qO8DmraRrifns7Va6vA9L4axyUVPrptFXwariJ8FFiDESTu
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52746-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0B98136E33
X-Rspamd-Action: no action

Move the common data structures to a new scanout table and allow v4l2
output modes to reference their scanout.

This removes duplication from the mode definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 90 +++++++++++++++++++++++++++++++---------------
 1 file changed, 62 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index d53cea49baae..3e97ad38f716 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -264,28 +264,63 @@ struct imx283_readout_mode {
 	u8 mdsel4;
 };
 
-static const struct imx283_readout_mode imx283_readout_modes[] = {
+struct imx283_scanout {
+	u8 bpp;
+	struct imx283_readout_mode readout;
+};
+
+static const struct imx283_scanout imx283_scan_modes[] = {
 	/* All pixel scan modes */
-	[IMX283_MODE_0] = { 0x04, 0x03, 0x10, 0x00 }, /* 12 bit */
-	[IMX283_MODE_1] = { 0x04, 0x01, 0x00, 0x00 }, /* 10 bit */
-	[IMX283_MODE_1A] = { 0x04, 0x01, 0x20, 0x50 }, /* 10 bit */
-	[IMX283_MODE_1S] = { 0x04, 0x41, 0x20, 0x50 }, /* 10 bit */
+	[IMX283_MODE_0] = {
+		.bpp = 12,
+		.readout = { 0x04, 0x03, 0x10, 0x00 },
+	},
+	[IMX283_MODE_1] = {
+		.bpp = 10,
+		.readout = { 0x04, 0x01, 0x00, 0x00 },
+	},
+	[IMX283_MODE_1A] = {
+		.bpp = 10,
+		.readout = { 0x04, 0x01, 0x20, 0x50 },
+	},
+	[IMX283_MODE_1S] = {
+		.bpp = 10,
+		.readout = { 0x04, 0x41, 0x20, 0x50 },
+	},
 
 	/* Horizontal / Vertical 2/2-line binning */
-	[IMX283_MODE_2] = { 0x0d, 0x11, 0x50, 0x00 }, /* 12 bit */
-	[IMX283_MODE_2A] = { 0x0d, 0x11, 0x70, 0x50 }, /* 12 bit */
+	[IMX283_MODE_2] = {
+		.bpp = 12,
+		.readout = { 0x0d, 0x11, 0x50, 0x00 },
+	},
+	[IMX283_MODE_2A] = {
+		.bpp = 12,
+		.readout = { 0x0d, 0x11, 0x70, 0x50 },
+	},
 
 	/* Horizontal / Vertical 3/3-line binning */
-	[IMX283_MODE_3] = { 0x1e, 0x18, 0x10, 0x00 }, /* 12 bit */
+	[IMX283_MODE_3] = {
+		.bpp = 12,
+		.readout = { 0x1e, 0x18, 0x10, 0x00 },
+	},
 
 	/* Vertical 2/9 subsampling, horizontal 3 binning cropping */
-	[IMX283_MODE_4] = { 0x29, 0x18, 0x30, 0x50 }, /* 12 bit */
+	[IMX283_MODE_4] = {
+		.bpp = 12,
+		.readout = { 0x29, 0x18, 0x30, 0x50 },
+	},
 
 	/* Vertical 2/19 subsampling binning, horizontal 3 binning */
-	[IMX283_MODE_5] = { 0x2d, 0x18, 0x10, 0x00 }, /* 12 bit */
+	[IMX283_MODE_5] = {
+		.bpp = 12,
+		.readout = { 0x2d, 0x18, 0x10, 0x00 },
+	},
 
 	/* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
-	[IMX283_MODE_6] = { 0x18, 0x21, 0x00, 0x09 }, /* 10 bit */
+	[IMX283_MODE_6] = {
+		.bpp = 10,
+		.readout = { 0x18, 0x21, 0x00, 0x09 },
+	},
 
 	/*
 	 * New modes should make sure the offset period is complied.
@@ -293,12 +328,14 @@ static const struct imx283_readout_mode imx283_readout_modes[] = {
 	 */
 };
 
+static bool scan_mode(const struct imx283_scanout *scan, enum imx283_modes mode)
+{
+	return scan == &imx283_scan_modes[mode];
+}
+
 /* Mode : resolution and related config values */
 struct imx283_mode {
-	unsigned int mode;
-
-	/* Bits per pixel */
-	unsigned int bpp;
+	const struct imx283_scanout *scan;
 
 	/* Frame width */
 	unsigned int width;
@@ -410,8 +447,8 @@ static const struct imx283_reg_list link_freq_reglist[] = {
 static const struct imx283_mode supported_modes_12bit[] = {
 	{
 		/* 20MPix 21.40 fps readout mode 0 */
-		.mode = IMX283_MODE_0,
-		.bpp = 12,
+		.scan = &imx283_scan_modes[IMX283_MODE_0],
+
 		.width = 5472,
 		.height = 3648,
 		.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
@@ -442,8 +479,7 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		/*
 		 * Readout mode 2 : 2/2 binned mode (2736x1824)
 		 */
-		.mode = IMX283_MODE_2,
-		.bpp = 12,
+		.scan = &imx283_scan_modes[IMX283_MODE_2],
 		.width = 2736,
 		.height = 1824,
 		.min_hmax = 2414, /* Pixels (362 * 480MHz/72MHz + padding) */
@@ -475,8 +511,7 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		/*
 		 * Readout mode 3 : 3/3 binned mode (1824x1216)
 		 */
-		.mode = IMX283_MODE_3,
-		.bpp = 12,
+		.scan = &imx283_scan_modes[IMX283_MODE_3],
 		.width = 1824,
 		.height = 1216,
 		.min_hmax = 1894, /* Pixels (284 * 480MHz/72MHz + padding) */
@@ -509,8 +544,7 @@ static const struct imx283_mode supported_modes_12bit[] = {
 static const struct imx283_mode supported_modes_10bit[] = {
 	{
 		/* 20MPix 25.48 fps readout mode 1 */
-		.mode = IMX283_MODE_1,
-		.bpp = 10,
+		.scan = &imx283_scan_modes[IMX283_MODE_1],
 		.width = 5472,
 		.height = 3648,
 		.min_hmax = 5960, /* 745 @ 576MHz / 72MHz */
@@ -616,7 +650,7 @@ static u64 imx283_pixel_rate(struct imx283 *imx283,
 			     const struct imx283_mode *mode)
 {
 	u64 link_frequency = link_frequencies[__ffs(imx283->link_freq_bitmap)];
-	unsigned int bpp = mode->bpp;
+	unsigned int bpp = mode->scan->bpp;
 	const unsigned int ddr = 2; /* Double Data Rate */
 	const unsigned int lanes = 4; /* Only 4 lane support */
 	u64 numerator = link_frequency * ddr * lanes;
@@ -673,7 +707,7 @@ static u32 imx283_exposure(struct imx283 *imx283,
 	u64 numerator;
 
 	/* Number of clocks per internal offset period */
-	offset = mode->mode == IMX283_MODE_0 ? 209 : 157;
+	offset = scan_mode(mode->scan, IMX283_MODE_0) ? 209 : 157;
 	numerator = (imx283->vmax * (svr + 1) - shr) * imx283->hmax + offset;
 
 	do_div(numerator, imx283->hmax);
@@ -708,7 +742,7 @@ static u32 imx283_shr(struct imx283 *imx283, const struct imx283_mode *mode,
 	u64 temp;
 
 	/* Number of clocks per internal offset period */
-	offset = mode->mode == IMX283_MODE_0 ? 209 : 157;
+	offset = scan_mode(mode->scan, IMX283_MODE_0) ? 209 : 157;
 	temp = ((u64)exposure * imx283->hmax - offset);
 	do_div(temp, imx283->hmax);
 
@@ -1073,7 +1107,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	 * Set the readout mode registers.
 	 * MDSEL3 and MDSEL4 are updated to enable Arbitrary Vertical Cropping.
 	 */
-	readout = &imx283_readout_modes[mode->mode];
+	readout = &mode->scan->readout;
 	cci_write(imx283->cci, IMX283_REG_MDSEL1, readout->mdsel1, &ret);
 	cci_write(imx283->cci, IMX283_REG_MDSEL2, readout->mdsel2, &ret);
 	cci_write(imx283->cci, IMX283_REG_MDSEL3,
@@ -1082,7 +1116,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		  readout->mdsel4 | IMX283_MDSEL4_VCROP_EN, &ret);
 
 	/* Mode 1S specific entries from the Readout Drive Mode Tables */
-	if (mode->mode == IMX283_MODE_1S) {
+	if (scan_mode(mode->scan, IMX283_MODE_1S)) {
 		cci_write(imx283->cci, IMX283_REG_MDSEL7, 0x01, &ret);
 		cci_write(imx283->cci, IMX283_REG_MDSEL18, 0x1098, &ret);
 	}

-- 
2.52.0


