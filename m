Return-Path: <linux-media+bounces-67659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dOcxMOVzV2pcOQEAu9opvQ
	(envelope-from <linux-media+bounces-67659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:49:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6775DC0D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=e+lL2Elp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67659-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67659-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4392C30F968C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796A447799C;
	Wed, 15 Jul 2026 11:44:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77E44CF59
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115862; cv=none; b=t1rgwlDPQSpM237/yu4/Tcus2fmJXMA4+52FPOC0WAUY83v5oImuaR9OLtWqevh2+t0aCTOaxecpCQO6Ugd1kOAgM2/3BmQ31aS9+640aYkjChcoPCmGLoIyHJA0IBKvCf8oNrQFwdG33sm9kcrS4H0wzLKqadIfaLIxffdHbfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115862; c=relaxed/simple;
	bh=fMZKryxQmK9xInKacewLC6J+EQDsnbDnLfr0OntXxwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lnxh1gT+5KVZGHAvskJvvVEJbqvD9IMFYMylMMsEPI2+b/rGS/jIgxw99aemey2SNAOjtNEWeS9DNPqZ4ISu9ZaLd88My4Z24F9I1gfb46TmeNLZDk/9ymFYq0jMP6ejt4qIqnaajt3yF1kjN9Bl7C36ZYasaF0nJLY87zN1oYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=e+lL2Elp; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso36618965e9.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115859; x=1784720659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYbwYTOXVK4epL4nJxXsUqEGgL/QA5hnuNFZvu8Ghx8=;
        b=e+lL2Elp3okyMXkSww1nguVWhm+AB0mGIlsoEuEAKhM39ynXeJPlt/sgDde+771pb6
         oje8h2810SCoNsmXlnj660BP2nIB8tIgLPRb9kEAyd3f3mi2lAYYmsc1joQ2Cre7OC68
         WpJQxKFXafOXAYltbXE3fKx1Ubh3KLlH/YOn4EFfV+4ppTLKyKUK1jZQB04HC1pFqNnF
         OVsYCPgEP/xYcwyadsKoEALjO66gxUE8yOYmKqHrkD3DYeD1/0DgHOhQdGGS9NcZtC0E
         jHrlrdojLmUWv/+ngsjFqL9tqKFzDIunwGl9GZAM5LgFjrri0zJTBKMiHLEPPFKnNVyw
         iQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115859; x=1784720659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYbwYTOXVK4epL4nJxXsUqEGgL/QA5hnuNFZvu8Ghx8=;
        b=qrjaAOXjQhusp3kJ1hAVr2dq4gF8gTbhfVa2i4EwseNWaRMd1aQIaYoMmH2V1K7Ai0
         F+sVpsyxQlKc8cfq3gL1oqBlTTEreFVLKx/GWi4hIciB/jK3KfWDyqL0sXN7R8Rq/pEn
         cIAu5/gLNGSkkFEdYEENSOOCM42kHJMbKFTg+O5R8uQVG+WEtNM9e1oK25y9lsTdT5Yl
         8ZuDKJ5QTzV05N+wIgM4y+oqUU7pu5LIC+D+Q6Zahks8LHJbEUEkeQAe1crNmSIJ9Md3
         ocZidgLQQMbJp28/7INLr/VAAKh3nhK14EtYnYzAGCcMv0igMbCFbzyP5jiuFunn0fYZ
         ysUQ==
X-Gm-Message-State: AOJu0YzNQakFcpxPSeHskP8qSjQRLvSmGWJXa438KFdJmN2zVWttdiWq
	bqMsDe1BCEpF9qg06yEqUjckFYvYr8MjbR2voFT2UGIx1A//iKII2g7MpL3ihyIGt78=
X-Gm-Gg: AfdE7ckBSFdDc9wI3vRaT34/nvh14rL5wTJ4vLxulWbBHv8T0zRkSIvd6SJmYf4VA9B
	c/P/9hyRllIxap4GQdBX0MZzc5XoMFR9GoLcoHJ4B7f5t/YBlffuxqr2ff6x7lrZAny7wel8vwN
	hxcGNUCSvS3HuNIDcTkZNH2FfB33oQU+GAfTHf5Rw9YV+QLHk7gkG3QSmLdU0ZRl3Z3gryKRNEX
	WoqfEoh6F721y+Uo+X/053om6WJAHjvI76ng+fVkozXIBQioZIJyQ7dziH3jvsj8EIwphM36ioD
	uuBI1tOPVItW6du7gixhATokAR9BrAWtn5c0sehjywOldxmnOKIkB/2/vSn9uGOt0vyPQnDXq9z
	rbeQkzwSTsam/NSuNJI2TAxBCBINJjP6JCRg+kANB+VEt8wuJpTVdHTh9QTfe+1bCjzSKFLx+rO
	JBceGwGLeT8kGX6xANJ9sqF6+cq3K2wyEV3s8UtJ4mvjEX1WEV+3Y2JivBNfd2626/1wMH4eitN
	1g=
X-Received: by 2002:a05:600c:a08e:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-4953c390347mr28066415e9.39.1784115858714;
        Wed, 15 Jul 2026 04:44:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:23 +0100
Subject: [PATCH v4 10/21] media: imx355: pixel_rate never changes, so don't
 recompute
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-10-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-67659-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DE6775DC0D

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b329da85ddc0..879e98b8a8ef 100644
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


