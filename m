Return-Path: <linux-media+bounces-52754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GDDEY0vj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:05:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C502136E14
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED2C2303672C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9502361DC0;
	Fri, 13 Feb 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O9X40Hu2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DEE361DCB;
	Fri, 13 Feb 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991360; cv=none; b=k7CyTAKfRYhr5Psdrj8UmkiuohgEP7GOCA0KGwfEaD9TDBzshdfrwMWxMUyQUL/xe3AqdRibQHXkiPLCk5Zd46XtHxluFbA6FRSEyGTS+xcrV/wmRX5+xhdQiIBmN11ErV/xNaTICdhmu8HtgmPUoQZ/HQse7fAtA4fVSCCQp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991360; c=relaxed/simple;
	bh=1fJehNgR9AP4Hz4vI57ZNjlZUsjrjJpB+iMudQZmCWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRtactWG1gZqHypPQFkb4RU+/5G45HYORMyrxp16CjLwqh2pid/9XYVoR5yvZVWsMnio0tq+/g85uXPFf1eYF5avMU4D8d/SY7xmiqPePftU2Bm3F0QFwbuxitprm1Lr52BxoB2w4AWjB3viyz7lBpcJuvYzkGFpOAhcadw7Fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O9X40Hu2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C316F26D7;
	Fri, 13 Feb 2026 15:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991282;
	bh=1fJehNgR9AP4Hz4vI57ZNjlZUsjrjJpB+iMudQZmCWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O9X40Hu2ZqsYyxb8uO4VGIR4LDZJzmxN1up+tfE/Fv+XJ4jtQIxToursOViv7RZBs
	 Qoyl7Q0ePitiMDC+h4FRKZuRvH5mw91mPuX74IZWwY3kCxdHKqbfTMxoz38iXu1Qu7
	 URi+cu+O1CunfdiuR5gpcWBDBoPq5ypd24pf/Psk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:52 +0000
Subject: [PATCH v2 13/25] media: i2c: imx283: Move binning to scan modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-mainline-imx283-v2-v2-13-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=5543;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=1fJehNgR9AP4Hz4vI57ZNjlZUsjrjJpB+iMudQZmCWA=;
 b=FHj7toex3LVko2emBk2u5pO2qkqC/OOuOGX5Kzzuns8KhwIsh0HPfWhZfVFgYnYqYEXNfH4Rv
 A7sniSY+DZKDeBjnRMenWEEEoZ/vBnx4QluEMNBh8G5bhndFPmEY+qE
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52754-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 6C502136E14
X-Rspamd-Action: no action

The binning factors are determined by the chosen scan mode.

Move the definition of the binning ratio to the scan mode strutures
and remove from the v4l2 output mode definitions. The horizontal
binning ratio is not used and therefore is dropped.

This also fixes the 10-bit mode handling which previously had an
undefined vbin_ratio for MODE1.

V4L2 does not currently expose an API to support the differences between
binning and skipping, so while the mode capabilities are kept for the
skipping modes - there is no definition to use them yet.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 315c050c4fd0..d333be4e66d7 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -279,6 +279,9 @@ struct imx283_scanout {
 	/* Optical Blanking */
 	u8 vertical_ob;
 
+	/* vertical binning ratio */
+	u8 vbin_ratio;
+
 	/* Vertical Arbitrary Cropping Function */
 	s16 vst;
 	u16 vct;
@@ -291,6 +294,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x04, 0x03, 0x10, 0x00 },
 		.vertical_ob = 16,
+		.vbin_ratio = 1,
 		.vst = -1, /* Align to Mode 2/3 */
 		.vct = 0,
 		.veff = 3694,
@@ -299,6 +303,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x00, 0x00 },
 		.vertical_ob = 16,
+		.vbin_ratio = 1,
 		.vst = -1, /* Align to Mode 2/3 */
 		.vct = 0,
 		.veff = 3694,
@@ -307,6 +312,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x20, 0x50 },
 		.vertical_ob = 16,
+		.vbin_ratio = 1,
 		.vst = 146,
 		.vct = 291,
 		.veff = 3112,
@@ -315,6 +321,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x41, 0x20, 0x50 },
 		.vertical_ob = 16,
+		.vbin_ratio = 1,
 		.vst = 162,
 		.vct = 324,
 		.veff = 3046,
@@ -325,6 +332,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x50, 0x00 },
 		.vertical_ob = 4,
+		.vbin_ratio = 2,
 		.vst = -2, /* Provides alignment to Mode 0/1 */
 		.vct = 0,
 		.veff = 1824,
@@ -333,6 +341,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x70, 0x50 },
 		.vertical_ob = 4,
+		.vbin_ratio = 2,
 		.vst = 71,
 		.vct = 143,
 		.veff = 1556,
@@ -343,6 +352,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x1e, 0x18, 0x10, 0x00 },
 		.vertical_ob = 4,
+		.vbin_ratio = 3,
 		.vst = 1, /* Provides alignment to Mode 0/1 */
 		.vct = 0,
 		.veff = 1234,
@@ -353,6 +363,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x29, 0x18, 0x30, 0x50 },
 		.vertical_ob = 4,
+		.vbin_ratio = 1, /* SUBSAMPLING UNDEFINED */
 		.vst = 9,
 		.vct = 17,
 		.veff = 378,
@@ -363,6 +374,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x2d, 0x18, 0x10, 0x00 },
 		.vertical_ob = 4,
+		.vbin_ratio = 1, /* SUBSAMPLING UNDEFINED */
 		.vst = 0,
 		.vct = 0,
 		.veff = 198,
@@ -373,6 +385,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 10,
 		.readout = { 0x18, 0x21, 0x00, 0x09 },
 		.vertical_ob = 4,
+		.vbin_ratio = 2, /* SUBSAMPLING UNDEFINED */
 		.vst = 0,
 		.vct = 0,
 		.veff = 1556,
@@ -425,10 +438,6 @@ struct imx283_mode {
 	/* minimum SHR */
 	u32 min_shr;
 
-	/* Horizontal and vertical binning ratio */
-	u8 hbin_ratio;
-	u8 vbin_ratio;
-
 	/* Analog crop rectangle. */
 	struct v4l2_rect crop;
 };
@@ -498,9 +507,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
 		.min_vmax = 3793, /* Lines */
 
-		.hbin_ratio = 1,
-		.vbin_ratio = 1,
-
 		/* 20.00 FPS */
 		.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
 		.default_vmax = 4000,
@@ -523,9 +529,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 2500, /* 375 @ 480MHz/72Mhz */
 		.default_vmax = 3840,
 
-		.hbin_ratio = 2,
-		.vbin_ratio = 2,
-
 		.min_shr = 12,
 
 		.crop = imx283_recommended_area,
@@ -544,9 +547,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 1900, /* 285 @ 480MHz/72Mhz */
 		.default_vmax = 4200,
 
-		.hbin_ratio = 3,
-		.vbin_ratio = 3,
-
 		.min_shr = 16,
 
 		.crop = imx283_recommended_area,
@@ -1141,7 +1141,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 
 	/* Vertical Configuration */
 	{
-		u32 y_out_size = mode->crop.height / mode->vbin_ratio;
+		u32 y_out_size = mode->crop.height / mode->scan->vbin_ratio;
 		u32 write_v_size = y_out_size + mode->scan->vertical_ob;
 		s16 top = mode->crop.top;
 		u32 v_widcut;
@@ -1154,7 +1154,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		 * cropping start position = (VWINPOS – Vst) × 2
 		 * cropping width = Veff – (VWIDCUT – Vct) × 2
 		 */
-		v_pos = (top / mode->vbin_ratio / 2) + mode->scan->vst;
+		v_pos = (top / mode->scan->vbin_ratio / 2) + mode->scan->vst;
 		v_widcut = ((mode->scan->veff - y_out_size) / 2) + mode->scan->vct;
 
 		cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);

-- 
2.52.0


