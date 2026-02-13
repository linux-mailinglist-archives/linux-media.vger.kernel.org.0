Return-Path: <linux-media+bounces-52747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD6NC+Mvj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:06:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE7136E58
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24AD1313D5C6
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3DF36214C;
	Fri, 13 Feb 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jw6Vm2qU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A74D36166A;
	Fri, 13 Feb 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991337; cv=none; b=Qlu9BfJo0aPrmxXoTKyQNvS0JkfXIxUzET9hlUkhJODErJIU/so4acUTvbhCgIwcbcgFY1v/5qRTXlSX4C9hpJdVWVaBUPnVmuAvYscrVT6cxCB8DubJrm8bn9IYyCbFp8gD2n/qXqILH2il/jOp7omnjnid0AxpP2dQOgJsxT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991337; c=relaxed/simple;
	bh=FTYr05q00nZpiIwRutnF6nhQBZV3JEZL3mZmsvhNw/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExA6lhluGLANDBay+fMBM6PilOTdog5dpLJ3UZLDWcY488CWY5sutrnog0cbVkfFK0+H5Xy7NefGpC+D/vPZRcb9jwoc2h+tH9PEb/oRmCzYF+9bmJKNIRg9QKQkwlI8Xed7kRHxSrgJ91FIbuXrPC+sV4orMm+ek9MDyqLp9fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jw6Vm2qU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 354F326A1;
	Fri, 13 Feb 2026 15:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991279;
	bh=FTYr05q00nZpiIwRutnF6nhQBZV3JEZL3mZmsvhNw/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jw6Vm2qU95BeiABxV4IvxfiJt2dm3M9q4N9TM2TbM9dLN2uywTg4XOyBQwtzLlXVO
	 LJqXWu44Lxn0rBFUL9V6EU11hjXH8947OqkMx/HCfS8LDFOyrllJvptQBRiQ4CCVUV
	 Mb+kkWBJLSK/Nw1jWImqxQegzDq/77KQ8qXbUNoM=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:45 +0000
Subject: [PATCH v2 06/25] media: i2c: imx283: Move vertical_ob to scan
 modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-mainline-imx283-v2-v2-6-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=4172;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=FTYr05q00nZpiIwRutnF6nhQBZV3JEZL3mZmsvhNw/k=;
 b=zjZGYNewdePuh5YLp57IKOHb1rWUsNthvdmcRCGAUva9cqlup3EFd4OyptWyHrzkCUzeWeIa7
 24K+iQlrjK4DZDOc6iTC4BXai70ACmxq8H4Yg+PVdGdezirK0aw/n5l
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52747-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86AE7136E58
X-Rspamd-Action: no action

The Vertical Optical Black region is a property of the selected scan mode.

Move the storage of this property to the scan mode table so it does
not get duplicated when adding new output modes.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index fe63700da872..164e7c6125ae 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -267,6 +267,9 @@ struct imx283_readout_mode {
 struct imx283_scanout {
 	u8 bpp;
 	struct imx283_readout_mode readout;
+
+	/* Optical Blanking */
+	u8 vertical_ob;
 };
 
 static const struct imx283_scanout imx283_scan_modes[] = {
@@ -274,52 +277,62 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 	[IMX283_MODE_0] = {
 		.bpp = 12,
 		.readout = { 0x04, 0x03, 0x10, 0x00 },
+		.vertical_ob = 16,
 	},
 	[IMX283_MODE_1] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x00, 0x00 },
+		.vertical_ob = 16,
 	},
 	[IMX283_MODE_1A] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x20, 0x50 },
+		.vertical_ob = 16,
 	},
 	[IMX283_MODE_1S] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x41, 0x20, 0x50 },
+		.vertical_ob = 16,
 	},
 
 	/* Horizontal / Vertical 2/2-line binning */
 	[IMX283_MODE_2] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x50, 0x00 },
+		.vertical_ob = 4,
 	},
 	[IMX283_MODE_2A] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x70, 0x50 },
+		.vertical_ob = 4,
 	},
 
 	/* Horizontal / Vertical 3/3-line binning */
 	[IMX283_MODE_3] = {
 		.bpp = 12,
 		.readout = { 0x1e, 0x18, 0x10, 0x00 },
+		.vertical_ob = 4,
 	},
 
 	/* Vertical 2/9 subsampling, horizontal 3 binning cropping */
 	[IMX283_MODE_4] = {
 		.bpp = 12,
 		.readout = { 0x29, 0x18, 0x30, 0x50 },
+		.vertical_ob = 4,
 	},
 
 	/* Vertical 2/19 subsampling binning, horizontal 3 binning */
 	[IMX283_MODE_5] = {
 		.bpp = 12,
 		.readout = { 0x2d, 0x18, 0x10, 0x00 },
+		.vertical_ob = 4,
 	},
 
 	/* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
 	[IMX283_MODE_6] = {
 		.bpp = 10,
 		.readout = { 0x18, 0x21, 0x00, 0x09 },
+		.vertical_ob = 4,
 	},
 
 	/*
@@ -381,9 +394,6 @@ struct imx283_mode {
 	u8 hbin_ratio;
 	u8 vbin_ratio;
 
-	/* Optical Blanking */
-	u32 vertical_ob;
-
 	/* Analog crop rectangle. */
 	struct v4l2_rect crop;
 };
@@ -465,7 +475,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_vmax = 4000,
 
 		.min_shr = 11,
-		.vertical_ob = 16,
 		.crop = {
 			.top = 40,
 			.left = 108,
@@ -495,7 +504,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.vbin_ratio = 2,
 
 		.min_shr = 12,
-		.vertical_ob = 4,
 
 		.crop = {
 			.top = 40,
@@ -526,7 +534,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.vbin_ratio = 3,
 
 		.min_shr = 16,
-		.vertical_ob = 4,
 
 		.crop = {
 			.top = 40,
@@ -551,7 +558,6 @@ static const struct imx283_mode supported_modes_10bit[] = {
 		.default_vmax = 3840,
 
 		.min_shr = 10,
-		.vertical_ob = 16,
 		.crop = {
 			.top = 40,
 			.left = 108,
@@ -1132,7 +1138,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		mode->crop.height);
 
 	y_out_size = mode->crop.height / mode->vbin_ratio;
-	write_v_size = y_out_size + mode->vertical_ob;
+	write_v_size = y_out_size + mode->scan->vertical_ob;
 	/*
 	 * cropping start position = (VWINPOS – Vst) × 2
 	 * cropping width = Veff – (VWIDCUT – Vct) × 2
@@ -1147,7 +1153,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret);
 	cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
 
-	cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->vertical_ob, &ret);
+	cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical_ob, &ret);
 
 	/* TODO: Validate mode->crop is fully contained within imx283_native_area */
 	cci_write(imx283->cci, IMX283_REG_HTRIMMING_START, mode->crop.left, &ret);

-- 
2.52.0


