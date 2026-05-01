Return-Path: <linux-media+bounces-60154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FSzFLTJ9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:41:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C574ADAB4
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6525304F218
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6B93D091B;
	Fri,  1 May 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kn9vmVSn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E43D16F4;
	Fri,  1 May 2026 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649997; cv=none; b=bUdUYePgCOPUIEgHC2fJkwb6iIz6T58WhdaEjPXAdumswB8NHhtM2HNB8kA1QENx9hyMKn/Gd4tCUVN5vrttzq4gr0WdSdCOh+CA8S7UEmSRs1Aw8fVPtayw8VQ1D2yOZKVLEx62LjW2iJNbMwQj7kfLZxIn8dAwBawGI//+iiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649997; c=relaxed/simple;
	bh=dq4DMCXqSYdS73+YUge5/htblgYG6RQnLmA/JkmcKPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqPDydbGNA1iH10QJ4W4Y+Xd82W0B64+zxQlWQYWZRLxQLVWlwqKhPV9DcXDa4UcDNpIHgVlCTyRPUjaIipSVJI9yVnls/zcYy5MjxW44JtsEOo/2xqx2+DpcPu8J+pQXLa0f4Qei2TeTM4vhQuM+g1wKUgcbOWgKAldfW5Ahvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kn9vmVSn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EBF519D6;
	Fri,  1 May 2026 17:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649858;
	bh=dq4DMCXqSYdS73+YUge5/htblgYG6RQnLmA/JkmcKPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kn9vmVSnnhXoVL5cp66yibNJ5ihGPZVVuZ2wT0k5uh5wVzixNvi02CvYgq8oWFFQX
	 sZS+fyKtyzzVERkBbrQHCoKpI+/JIY4XyIbQKUqgqCzHOQPdhiafwdxk6AVizeqHcR
	 4TKntwbFy7SuOjsvydJNO6ofXBMNiii3xaLKelCo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:12 +0100
Subject: [PATCH 10/11] media: i2c: ov5640: Disable ISP for raw output
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-10-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=3940;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=dq4DMCXqSYdS73+YUge5/htblgYG6RQnLmA/JkmcKPU=;
 b=xw4QGoclVSO7tSIaroiJ+VJb5MVyXwscstU9Qg8ygk9BEn9qt6nJHiZfHchdRYeu88kET+8Ig
 gd19jYAcadQAqoSjHwufQG2uzZrb0bIpTFLs0t5ImMPm3kMzU25rIqA
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: B6C574ADAB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60154-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

The OV5640 has ISP operations that can run even when outputting RAW
bayer data.  These include the Lens Shading Correction, Gamma and Auto
white balance which need to be disabled when performing module
calibration using RAW data.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index fd369a13463e..f63d81640f54 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -280,28 +280,28 @@ static const struct ov5640_pixfmt ov5640_dvp_formats[] = {
 	}, {
 		/* Raw, BGBG... / GRGR... */
 		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.colorspace	= V4L2_COLORSPACE_RAW,
 		.bpp		= 8,
 		.ctrl00		= 0x00,
 		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
 		/* Raw bayer, GBGB... / RGRG... */
 		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.colorspace	= V4L2_COLORSPACE_RAW,
 		.bpp		= 8,
 		.ctrl00		= 0x01,
 		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
 		/* Raw bayer, GRGR... / BGBG... */
 		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.colorspace	= V4L2_COLORSPACE_RAW,
 		.bpp		= 8,
 		.ctrl00		= 0x02,
 		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
 		/* Raw bayer, RGRG... / GBGB... */
 		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.colorspace	= V4L2_COLORSPACE_RAW,
 		.bpp		= 8,
 		.ctrl00		= 0x03,
 		.mux		= OV5640_FMT_MUX_RAW_DPC,
@@ -348,7 +348,7 @@ static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
 	}, {
 		/* Raw, BGBG... / GRGR... */
 		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.colorspace	= V4L2_COLORSPACE_RAW,
 		.bpp		= 8,
 		.ctrl00		= 0x00,
 		.mux		= OV5640_FMT_MUX_RAW_DPC,
@@ -473,6 +473,7 @@ struct ov5640_dev {
 
 	struct v4l2_mbus_framefmt fmt;
 	bool pending_fmt_change;
+	bool is_raw;
 
 	const struct ov5640_mode_info *current_mode;
 	const struct ov5640_mode_info *last_mode;
@@ -618,8 +619,13 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
 
 	/* ISP Control */
-	{OV5640_REG_ISP_CTRL00, 0xa7, 0, 0},
-	{OV5640_REG_ISP_CTRL01, 0xa3, 0, 0},
+	{OV5640_REG_ISP_CTRL00, OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00_GMA_ENABLE |
+				OV5640_ISP_00_BPC_ENABLE | OV5640_ISP_00_WPC_ENABLE |
+				OV5640_ISP_00_CIP_ENABLE, 0, 0},
+
+	/* OV5640_ISP_01_UVA_ENABLE is not enabled */
+	{OV5640_REG_ISP_CTRL01, OV5640_ISP_01_SDE_ENABLE | OV5640_ISP_01_SCL_ENABLE |
+				OV5640_ISP_01_CMX_ENABLE | OV5640_ISP_01_AWB_ENABLE, 0, 0},
 
 	/* AWB Control */
 	{OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */
@@ -3116,6 +3122,31 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 	if (ret)
 		return ret;
 
+	/*
+	 * Disable all ISP image processing (Lens Shading, Gamma, AWB...) for
+	 * RAW modes to facilitate module tuning.
+	 */
+	sensor->is_raw = pixfmt->colorspace == V4L2_COLORSPACE_RAW;
+	if (sensor->is_raw) {
+		ret = ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL00, 0);
+		if (ret)
+			return ret;
+	} else {
+		ret = ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL00,
+				       OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00_GMA_ENABLE |
+				       OV5640_ISP_00_BPC_ENABLE | OV5640_ISP_00_WPC_ENABLE |
+				       OV5640_ISP_00_CIP_ENABLE);
+		if (ret)
+			return ret;
+
+		/* OV5640_ISP_01_UVA_ENABLE is not enabled */
+		ret = ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL01,
+				       OV5640_ISP_01_SDE_ENABLE | OV5640_ISP_01_SCL_ENABLE |
+				       OV5640_ISP_01_CMX_ENABLE | OV5640_ISP_01_AWB_ENABLE);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * TIMING TC REG21:
 	 * - [5]:	JPEG enable

-- 
2.52.0


