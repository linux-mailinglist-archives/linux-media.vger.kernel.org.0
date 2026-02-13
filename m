Return-Path: <linux-media+bounces-52749-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLMCM0ovj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52749-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:03:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C1136DE7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54B2030BD5FB
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9640D36215A;
	Fri, 13 Feb 2026 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lo4ofjqF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22B1362139;
	Fri, 13 Feb 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991342; cv=none; b=nLDDGKB9e7cgVTuLcyFt4ExhpKv2eihfvXHzbSUSUvrtCpEERoE/is3y9j2zPwGuofyRF1qDJE2BbU2o41uOktuFPoeaJ8L+HHLreX0Xr4g744E8bbIDSgy3PYqcKiSl/XeaVoEIWYlUWhHkp281XVlffcTSUEu9AQPXUCbUkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991342; c=relaxed/simple;
	bh=SQ/dqcNpMoCW4Rs/Izr97KYeYhBCOM4r6Oq2FBVzMBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQckTEVXUsoOg7COYB3wTQTmjXGvaFyE0qQRJVtO9QocmQzKPW6OzTHVb+4cwWZynOWz9gSzDe2oT77nT08sXZL6DgAfdgWTbnVDkMY8eNI2Cp1GO8c15if3K97H/dTA+QdNNSuO+oiPt8KRJAYOE3WSNuWFoV76Nv+zy+g/MXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lo4ofjqF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EA1326A5;
	Fri, 13 Feb 2026 15:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991279;
	bh=SQ/dqcNpMoCW4Rs/Izr97KYeYhBCOM4r6Oq2FBVzMBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lo4ofjqFbti/6Z2l6i4ziMr/qHFT9gipGP9MwpGO6fgrtbhlFBnZ4ZS1Z0MtNgc4l
	 sJEqNz5ndXW42xo3dEmAtPgwQs4xPKqRu28q2AmdZ8Cryjk0QaHJs3lBs3No1nK9XP
	 LXF8MJs01ScY7TYddz2eAkboy/pX1ordVzI2Q7KE=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:46 +0000
Subject: [PATCH v2 07/25] media: i2c: imx283: Factor out vertical cropping
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-mainline-imx283-v2-v2-7-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=4967;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=SQ/dqcNpMoCW4Rs/Izr97KYeYhBCOM4r6Oq2FBVzMBo=;
 b=wrWtqTMLslPG4e2JiVuZp1ZPqMo1/xm6f1BDadmryX8wVUWXPK1nVBOkO38QelEw1+OXWR88H
 5GJ9QSaYUBqDDuqZLFp8Vo0d2z5lCMEJaafpgH5N7I5BOt+aCniJ5OQ
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52749-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 4E7C1136DE7
X-Rspamd-Action: no action

The vertical cropping parameters are specific to the readout mode
selected and do not need to be duplicated on v4l2 mode choices.

Move them to the imx283_scanout definitions. This also fixes the 10bit
mode which had not yet defined the veff correctly and worked by chance.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 61 +++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 164e7c6125ae..0abfeeb89425 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -270,6 +270,11 @@ struct imx283_scanout {
 
 	/* Optical Blanking */
 	u8 vertical_ob;
+
+	/* Vertical Arbitrary Cropping Function */
+	u16 vst;
+	u16 vct;
+	u16 veff;
 };
 
 static const struct imx283_scanout imx283_scan_modes[] = {
@@ -278,21 +283,33 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x04, 0x03, 0x10, 0x00 },
 		.vertical_ob = 16,
+		.vst = 0,
+		.vct = 0,
+		.veff = 3694,
 	},
 	[IMX283_MODE_1] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x00, 0x00 },
 		.vertical_ob = 16,
+		.vst = 0,
+		.vct = 0,
+		.veff = 3694,
 	},
 	[IMX283_MODE_1A] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x20, 0x50 },
 		.vertical_ob = 16,
+		.vst = 146,
+		.vct = 291,
+		.veff = 3112,
 	},
 	[IMX283_MODE_1S] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x41, 0x20, 0x50 },
 		.vertical_ob = 16,
+		.vst = 162,
+		.vct = 324,
+		.veff = 3046,
 	},
 
 	/* Horizontal / Vertical 2/2-line binning */
@@ -300,11 +317,17 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x50, 0x00 },
 		.vertical_ob = 4,
+		.vst = 0,
+		.vct = 0,
+		.veff = 1824,
 	},
 	[IMX283_MODE_2A] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x70, 0x50 },
 		.vertical_ob = 4,
+		.vst = 71,
+		.vct = 143,
+		.veff = 1556,
 	},
 
 	/* Horizontal / Vertical 3/3-line binning */
@@ -312,6 +335,9 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x1e, 0x18, 0x10, 0x00 },
 		.vertical_ob = 4,
+		.vst = 0,
+		.vct = 0,
+		.veff = 1234,
 	},
 
 	/* Vertical 2/9 subsampling, horizontal 3 binning cropping */
@@ -319,6 +345,9 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x29, 0x18, 0x30, 0x50 },
 		.vertical_ob = 4,
+		.vst = 9,
+		.vct = 17,
+		.veff = 378,
 	},
 
 	/* Vertical 2/19 subsampling binning, horizontal 3 binning */
@@ -326,6 +355,9 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x2d, 0x18, 0x10, 0x00 },
 		.vertical_ob = 4,
+		.vst = 0,
+		.vct = 0,
+		.veff = 198,
 	},
 
 	/* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
@@ -333,6 +365,9 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 10,
 		.readout = { 0x18, 0x21, 0x00, 0x09 },
 		.vertical_ob = 4,
+		.vst = 0,
+		.vct = 0,
+		.veff = 1556,
 	},
 
 	/*
@@ -382,14 +417,6 @@ struct imx283_mode {
 	/* minimum SHR */
 	u32 min_shr;
 
-	/*
-	 * Per-mode vertical crop constants used to calculate values
-	 * of IMX283REG_WIDCUT and IMX283_REG_VWINPOS.
-	 */
-	u32 veff;
-	u32 vst;
-	u32 vct;
-
 	/* Horizontal and vertical binning ratio */
 	u8 hbin_ratio;
 	u8 vbin_ratio;
@@ -463,10 +490,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
 		.min_vmax = 3793, /* Lines */
 
-		.veff = 3694,
-		.vst = 0,
-		.vct = 0,
-
 		.hbin_ratio = 1,
 		.vbin_ratio = 1,
 
@@ -496,10 +519,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 2500, /* 375 @ 480MHz/72Mhz */
 		.default_vmax = 3840,
 
-		.veff = 1824,
-		.vst = 0,
-		.vct = 0,
-
 		.hbin_ratio = 2,
 		.vbin_ratio = 2,
 
@@ -526,10 +545,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 1900, /* 285 @ 480MHz/72Mhz */
 		.default_vmax = 4200,
 
-		.veff = 1234,
-		.vst = 0,
-		.vct = 0,
-
 		.hbin_ratio = 3,
 		.vbin_ratio = 3,
 
@@ -1144,9 +1159,9 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	 * cropping width = Veff – (VWIDCUT – Vct) × 2
 	 */
 	v_pos = imx283->vflip->val ?
-		((-mode->crop.top / mode->vbin_ratio) / 2) + mode->vst :
-		((mode->crop.top / mode->vbin_ratio) / 2)  + mode->vst;
-	v_widcut = ((mode->veff - y_out_size) / 2) + mode->vct;
+		((-mode->crop.top / mode->vbin_ratio) / 2) + mode->scan->vst :
+		((mode->crop.top / mode->vbin_ratio) / 2)  + mode->scan->vst;
+	v_widcut = ((mode->scan->veff - y_out_size) / 2) + mode->scan->vct;
 
 	cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);
 	cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_size, &ret);

-- 
2.52.0


