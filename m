Return-Path: <linux-media+bounces-66884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /s8BIGgyTWq+wQEAu9opvQ
	(envelope-from <linux-media+bounces-66884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:07:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3D71E1BD
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:07:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=IeaOzMNq;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66884-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66884-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5492D303E4C1
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D444210E;
	Tue,  7 Jul 2026 17:06:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA35437871
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443987; cv=none; b=YCTrHPBG+971Ef6P9g2PepqdtyqcEC4Ky+bvacE3vf+/JpJfR8VBVVdLfhkPZIK5lui/ezsXGdGHSNDqyzc3ZNY6/w/65Iwzsx3XbcDkWBGYMBdVRll7R61z7IyZt3/Hrc24ZjC52EehFL8I0SjCUGnOfohCJ2EqUW7vcaagR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443987; c=relaxed/simple;
	bh=R2ZYgPq+z9kQOw9KXl0c5XFfjclw4AYkbMjGsY2Asjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4XPSvwemX9wO2j64nWwcNnorVZwpLwNFXsXd2uUhkkUbAJVOaNc/NjTqTH0As5FuRpXUUYVe68QCtOeX/nlcVvK9lIii+I7mS/QWQnEMjeAHT5Vhyjix90hrMKNBWlflDMPEEPjDUNLlp0AQh0MLrgB7AdzAQIjltlnSNIWNkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IeaOzMNq; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c19bad03so42416195e9.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443983; x=1784048783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueiE0h6EH4y87IMMPnR7H3cpNk1yU2lRb2045uoET4I=;
        b=IeaOzMNqBHgcP9FKar94shR9RtumeTYEBfSEU00J/bQ8K7MrwnJTIIzPexPMrjIT9h
         zO7UxrUMM039O0z9Lk+WH7WKjVPOwCA56tSf8XgnrxMqo7g3KSB1kPwHSC9rFhkcQelH
         8X9a+vmXXaymZJkBrF9vpfXVjA8Op+rbEtTVv3y+7S2eJIwu6FEm9kgqOGj8tH00Sl6C
         rRcsI1H9YWzcGGgms7yygFjhL3Ot+Ef4b3eVyfClhKWw79y1k8pBcDyXdOuGeaOJIg22
         FRv7f+d2FdBYR9qbRY0ade5AVOfaRUq9LkChmXORShrxKGAEOJue6pPMsmp55yD1Z1Th
         z2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443983; x=1784048783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ueiE0h6EH4y87IMMPnR7H3cpNk1yU2lRb2045uoET4I=;
        b=tGtdOyUv8TSQC/jIozhz0G4Rdvg5K2ry/HaHZVlPmXcCg8t9vHzevelLHdjEXZXI7S
         qwk1VhggEq41/VgTDprtoGsD+CrQebxXASGzI5nPb48ycOVX3R7dWzE5Z1u7okvLBbk1
         UNHCzyddrXTzj2HhPE7cLf7pgt9XDTJwmz2y8FzVARPkwQV8H8tZ4sQpKso4tXhpcQ8a
         KIIkC3ZXonMjf1NKZtz29bslar9NIzSmq8ELykt2TE+1zuy7pEkOzfRCfN/O7cukXSKg
         QlotatXOn5dPcbRzSaksyE/DVDjC7cBPVzszZ57KpEFfBNTjd+TRtQn+1ed4whS15cQg
         tTrw==
X-Gm-Message-State: AOJu0YxNv+iLVIuLiZmgExyPVoyX2AWpe3tPgWRqv6JuBfkZpZ5bVQxv
	gHlGSv+YTFLuAiAmj3tv4sfqWDpo5KEuynGulOoHsCb4buBgOb2Plhi1C5byZQmLt7s=
X-Gm-Gg: AfdE7clioTgyj1Off3NG4JWPZGI/dsY7Z9jMFXxhN6lXZpg8va52xGY7p5VwkeZK+9X
	N2P2CvJ5n/V1lpTnXEGOreo6OWYLegsV0wDLDkY/FpR6y5zkX0c1hN5oq/4szyFBW0Of4gfw8XH
	zqxQhjaL2oWrxfxOhe/RBEJL/qc4pj9YlnX1ehZZlMo/Q4ptIEPk+HzfU7zv0x3guaj3ABzZCE8
	XM7hyJXpze/YthshCWwi0kpDO52W/+WLKRtgPby9+vLWF3o0AbFZOSgsvBG/VMM+QEM7I2n7sil
	vtJlOWUJ85/kEdgdmU0qtB/RpR28Btg9F1GKdCVWSFyv8sFYE333HofLdOp1onBP+jX1iiyXnTu
	6FZ2eRqlLl6cFW8WLngw3Ly9w1V/aP7+RzWBblEP7KnB1KzAAkOdg27Cji/qq3IN4PJ5Z/c/shk
	tVw6r18hbToe/m5xUvcPZr14t03Y4Lr4w3LmxIP1jxxVQMbYLt/X5xkA475daLEhoU
X-Received: by 2002:a05:600c:34c9:b0:493:e49e:f58 with SMTP id 5b1f17b1804b1-493e49e0f82mr15109475e9.4.1783443982938;
        Tue, 07 Jul 2026 10:06:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:41 +0100
Subject: [PATCH v2 09/20] media: imx355: pixel_rate never changes, so don't
 recompute
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-9-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66884-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46F3D71E1BD

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 20cf6afee43e..9d977bac23b6 100644
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
@@ -866,7 +865,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	s32 vblank_def;
 	s32 vblank_min;
 	s64 h_blank;
-	u64 pixel_rate;
 	u32 height;
 
 	mutex_lock(&imx355->mutex);
@@ -887,9 +885,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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


