Return-Path: <linux-media+bounces-67021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fu9tIollTmqdLwIAu9opvQ
	(envelope-from <linux-media+bounces-67021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC6727ACE
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=HUCfkimA;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67021-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67021-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92A4D30A1170
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0034047B436;
	Wed,  8 Jul 2026 14:49:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A847D941
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522167; cv=none; b=HewONhXsJ4CxVPxm7774bjhaOHXFhokZD4r2rpglNQ1K00Sl4o5ZZsh6IowSwvd0zeikhzfw2H02OGcr+bwrSFy5F88wuoBjHIO9ieqU17Fp/Ys5aiNqKvgulVu41CjvJFlfZiSsjrosyXMbldLXuHlUqoLbpXMQeHhALf2rRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522167; c=relaxed/simple;
	bh=Y13P6d/hP9MONM9g2M3JRHmmeNpDAlPRWKBNqbY3BGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umxC+RIh6It5P3OkV3XiKc51rUEEKwxruBI/yMRiw3AmO0N7xyfurEPiZHqLhqrVt9kD9HesdSsBlKZPcSNbY2Hgc5HUve6IffR67M0sghaRueTsNTJjJSGURa2R1hmJoeVLqiuYxUHr8VNxVKVRNlsbS7cGDkVwa916sKgoCcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HUCfkimA; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso2482655e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522157; x=1784126957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBwAFnI0CLH29JbBAy6QPj6qdoZnqHm2ZK4wHLoQ3Bo=;
        b=HUCfkimA1v6FCYtk8yegJ1OmPmjcu8KtW0p2rWAW4E4uAgKYwEtLQq2KRMeR3hOu6w
         UH5hNbGD7oFQ8SThT4kgvRCKaz2Bri9ecB48au0OmF3tZtjM7wubirdVysGeQSVhFUCr
         qFdpvaQ9adc7STqVjSFTaz37yXWglTr79zdl6RDa8ppbb/rfIIRPPAEAmgVzrVDNA3ry
         3jVsJZqvAcgPTpfxcwG4mfYktKfBTZG4U1DM6W+Duj0TI5FM56YXO0/Bju0XluU0BZ+w
         clsNK+2McN0Y35fLQkVOl7R0FbMansg0NFCeI8LJPE+r12BCBtyT94ve7qMvB+h9RAnf
         j68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522157; x=1784126957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBwAFnI0CLH29JbBAy6QPj6qdoZnqHm2ZK4wHLoQ3Bo=;
        b=fEtTVZDyRFPEjyyUMyPN2JHukq742IMJqL0rBHKkxQKa3HCMpZztQ0wq3s2rTfQFfJ
         JFQ4a47XR2+qnfZeOLbYZdJiAL1snm+igg/32sCG73HJ197CDBRlNHG2z3NMpYvbT1Lu
         1nt8GpS9bGXWEzyogcndU2gxkE0HgmRMsB5h1qBVPe+tP2ppfrvsYC2tQOesvcjRnFbi
         yS5iARnwEKcLYJS6KyFPN43j4IeDeMooyXvF18W7h7h1K3lYlY8320XFH+5hg/1uVAmr
         CXCTFuMKKHUaUK1ZPZl5q7GdZfFrMoFL+IjWUUtaRnvLK2A5zHYlBPyacZHSM/Gs6eWq
         oxkQ==
X-Gm-Message-State: AOJu0YysQ4fZ1WsxG4ORqjPaG7mxRDGQoog/10vvQdWI4Umjn8l9xNpX
	2Tj1tZEC+aSF7Bxhbr6tstZsWYgjTr89YwSHTc86TIePfZJYb4zldxwFQHwExzxs10I=
X-Gm-Gg: AfdE7clWyiqkSv4cdU0YHJMRFEXOWyUPWuVnMWiw9werVWdn9FtspZ6MjTdU4BrITrA
	aUs42vo/77mD1i+2wQKVFSqRHa4If1urTxu+V+YS+tP+NA1ozzzhMp9AJQ0xjXCVK8dpjFiufJy
	O3Z1e7kicXQhLL/OO7OJiE8nfcrOtbze3kOjv2TJkpk9MyM/9HsaBEeQuwCstFfaKlRm7QFnY0Y
	yb1tW9BgP5pEh7aD1Q416iBt125mherRgIg5gPAKOsXaTlRMrn0702B6bwJXGf3i/PfU2EmHcK1
	r2qDK8GyRPrJXXPeUzh2DROX623YttmRXQoUG4QdiNtttxjKKEyT7A3WSWdkFbwXH6Ri1GTQqDy
	XflqH6lprL1IhtJTwQHp+u2xT5QiDbMWdPJFy/M8V93JMWf5t1u+fLyyu8+z5AA6vOHF1vTmovr
	N+ifuXmh1Ejc4zbqjwIZ7CRODrqDA4E7FyLS617sDEhxnea5S/aa5ry9K11lSVcJ5a
X-Received: by 2002:a05:600c:6085:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493e6859969mr26493025e9.7.1783522156758;
        Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:45 +0100
Subject: [PATCH v3 09/20] media: imx355: pixel_rate never changes, so don't
 recompute
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-9-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67021-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07EC6727ACE

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 2880e03b3f08..2a97e076bff7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -151,7 +151,6 @@ struct imx355 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
@@ -867,7 +866,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	s32 vblank_def;
 	s32 vblank_min;
 	s64 h_blank;
-	u64 pixel_rate;
 	u32 height;
 
 	mutex_lock(&imx355->mutex);
@@ -888,9 +886,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		*framefmt = fmt->format;
 	} else {
 		imx355->cur_mode = mode;
-		pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
-		do_div(pixel_rate, 10);
-		__v4l2_ctrl_s_ctrl_int64(imx355->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
@@ -1180,9 +1175,8 @@ static int imx355_init_controls(struct imx355 *imx355)
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


