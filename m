Return-Path: <linux-media+bounces-60673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCpMC3qH+2kscQMAu9opvQ
	(envelope-from <linux-media+bounces-60673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603E4DF4CF
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8B3B30167FC
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7FE4C8FF4;
	Wed,  6 May 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="b8tyL31C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8F4C0435
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091845; cv=none; b=mxAC2MXWCXOe2LGSHsGWkxhUDuqL4UrV0AZafEJ2pqXj0dZtrnSIgCzInl3oQltPrWw9fmsDLAhUDwXtLyBGNiuvqGEdjgViPVT51qDruVqxJp8n8+EYNCMaQxxtp8AdUMNJ6a+GEucK4DxIZbkz51Jid6m2612hIaoFgsO7ofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091845; c=relaxed/simple;
	bh=MLu72cz+5Gp007g9Xg3WyYdjNUZB0VuTwaWfowljlX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgVuJv05t5jlIndr4APgbBaPSmCQQMbm7n0i3x547THdCOBPeYFvrJkaJYZdObpkOiKcgoRlNj0m9iOHdqWASpMYc4C/plYIpVJC4MHpe/wNpu14cO8E1iT+RzHgVwh+jNtsaV93ZiNYCVZ/vHL1mDh5KXidKHe1IvAeAJzIYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=b8tyL31C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so103612495e9.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091841; x=1778696641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qUVdoZMr7Z4Rh702+lrtus7snCe9UmMcHnN9XePVCM=;
        b=b8tyL31CYpORSWXiI9JUOjxX5RTgjtTNK09+fnxm+0XUgXO6yJeB0yI7G5ceU+baE2
         jhBOBfZ58NOCPcFkjV3dnL++67XM3JbGphprD1KG8XpO99BAPHMCTLu6R6Bs+Qlhd1SQ
         uXrA+adpIIL9IjGSaoA+hrTveohfRgNnJUcBdCO9y7YH2UZ8emg5J6aOvSGnEXxWYgUP
         0LP+4bravMsZ9YMDxCMoNzATgNKnpxbs586U+UJVrYRhBnjGP7KWtPswvu7uqdsDN5c1
         rfOMz57YQP4auiJWPOibri1BFX5psFVg8NC/nk/3sgZg6oFRemhjbnb4S4M5em4JpMBM
         Z3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091841; x=1778696641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qUVdoZMr7Z4Rh702+lrtus7snCe9UmMcHnN9XePVCM=;
        b=L3qIL8EAbLBMxyhhDpwvOuIoGiDTSegm+a9FCgcsT3u6lZ4hk2widcufU+4BlVBUlq
         z2ZGoVRiL7FMSThm3BlQqdGx0Bo5Lh5mfycO8mWAZAYd4ITlqG1N2kaDPQDsI2IVvpaL
         ahlaZu/OD4W36Cn2hMDQTVj66Gpb+2oXTZaJ+06kxouDIy0ZYTHUx4jY+VAlIWfW83Rm
         PDLgiSFmkZGESUxsFS91pva3gqMCwg23cbvUupmXf3sMSIi26H63jRS0CWWsTC2DdNPB
         YAzulsm4kNxFzb1PvlZZMTaqlV5xpja2nBGAuD5CetPH15Rm/JFKrP9JHBedivzm7IZ1
         ZIAw==
X-Gm-Message-State: AOJu0YzTlmQi587jSzNDrRCCA1hc9r/hcKswmFdL9lxqen3RXF+shWxX
	6q76tdDv5nRygxK+UO3l/J6Ti5sSbjYmCuoY87dOZpjYmrIZgQ/GhSzCnQqk23wdBB27AA0jVRn
	k9zSj
X-Gm-Gg: AeBDies5Xsf/tXoRjklNNqgMJjcM2m8moC2GDoJXWxQlOzgBxQ5vcXFWROTOb9RN5V1
	Wlfibv6LiBatByMx83UADfvqpkiV/jIJ+4YPMcC7UaDxEmiSyZCvTZH4ugxD5TIN9E9powWYQET
	3wVHBLidxRmhatYsrFPL1PRFYcEWE7vR+bPfx3Q2d6XoSJ5mQG5MrT8ADbp+cYaRSyDgzwxEQmX
	JXvty3H0hZ8HDEPBIW21SIORouTOt1I50wAMx5sUYJndtvCBg8oAQzSFQu4vmmr8+Fa6AKnuX91
	b0jE7bgXV6Bju627wsynXntKI72niFZsq5SMMAMd0fKBEAB5AegNjylamFPAvF+ytCgVZbPKIAG
	KiCLFOWRQDljeeQ/w1bT0fort78Rxobmf62qa1pfmLiwajSCUt3vVIWUQ0V0cU5/5j5NcsHt8vV
	B6Ih42XCeyteHoWg2tmbNH0u40
X-Received: by 2002:a05:600c:354b:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-48e51f32bdemr79594435e9.15.1778091841546;
        Wed, 06 May 2026 11:24:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:24:01 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:46 +0100
Subject: [PATCH 08/13] media: imx355: pixel_rate never changes, so don't
 recompute
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-8-660685030455@raspberrypi.com>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
In-Reply-To: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 6603E4DF4CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60673-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b0cddb614775..12005bc40f36 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -161,7 +161,6 @@ struct imx355 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
@@ -860,7 +859,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	s32 vblank_def;
 	s32 vblank_min;
 	s64 h_blank;
-	u64 pixel_rate;
 	u32 height;
 
 	mutex_lock(&imx355->mutex);
@@ -881,9 +879,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		*framefmt = fmt->format;
 	} else {
 		imx355->cur_mode = mode;
-		pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
-		do_div(pixel_rate, 10);
-		__v4l2_ctrl_s_ctrl_int64(imx355->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
@@ -1175,9 +1170,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
 	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
-	imx355->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE, pixel_rate,
-					       pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;

-- 
2.34.1


