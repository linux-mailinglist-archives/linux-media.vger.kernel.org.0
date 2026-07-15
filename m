Return-Path: <linux-media+bounces-67665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I3PCNVV0V2qsOQEAu9opvQ
	(envelope-from <linux-media+bounces-67665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:51:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6E75DC7C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:51:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Qf8qKwD7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67665-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67665-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 328023094F1B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712AB47DD51;
	Wed, 15 Jul 2026 11:44:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F047AF43
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115868; cv=none; b=h5NVpKaeORiQ72hTVQH/sq4Io/QcjM2sE2/LVFuD++RG9MpLSjygv6twIG9EOfl0zQF5ngyZYqGfDehZdtV779HxhrDM7YxoxD1Bf9Z3ziN1OgAD00Vxi0MVHc85sYWKFaryJqzzLaIajXSiAFs7SA4kNfH58NYon0UAQJRfFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115868; c=relaxed/simple;
	bh=G7QPlTkMee79QYHS9v7Qtnk2HOJP0RmJkXzxeJoizP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7NvhkssImzHBDjH4xQPi8PMtF9qIob3eUJGNJ1bE5MEkZvrkRo8lUg88b/MFlR9DGyx4QL2gQ59uKyXtEdvcSRmzRIkYdcsmzXba1I1EYLwvZ7wufKIaUz4LKIw1LczGL5PrW5P1k5QFkhLwAnFE1ktW9RftIQeleqBbO5KNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Qf8qKwD7; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475417f010dso2573833f8f.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115864; x=1784720664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJiOXsXcQGmdy/lo82tEoHsjlQ3Yl1x4+oS64EHfJ50=;
        b=Qf8qKwD7Zqtw5ErpzI0iBDi+GnOXyT/EiKiMIMAK3XMElfuMTLfum+trDdvSOqlQt2
         JheweUQsMZWsVp/coM5P3PW1CeTl6SOeZY/gsaK3We33MKJWhpYZX+WJMZslvVhZ46wb
         M1bxuvl+tXh+mFEMZ+j7o2Tk1J1BYOTd1xm2LAKW6yQT1Ylwv4sYa2vswKGe576ms5cN
         /6i1JNFRoJBVvqrnqlR5o9Pov0ApSUFh3dOqf+TpxTn/dh/bFqP1EBjj2vlGQ8hjkpza
         Jvgm8vvc4Z1dcfOAWIJ/GjKFt0GGd4WFh4hkShAIdPhyhvS0b0f9/gwpP4YMVujxkHPK
         OwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115864; x=1784720664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJiOXsXcQGmdy/lo82tEoHsjlQ3Yl1x4+oS64EHfJ50=;
        b=o9oUzZblr5iFpD5XptfcA1/F+OcKxXVOaYLTWho1cLgKZXkAZpl4NJzXgtN5m4vNAv
         zprfcm0+sctJAUFX5HD/q1qlLvh1haAu1IYIgEEZwLQoGjLJK1460fpPD3ORuP7Xr0rN
         Bv+W/KTHpI0aUbfe5OU/sDzEUq7mpt+0sappmrm5FpRKdJYc7AK8LLJU4zMzLxRph8IY
         sG/fSVufvNeGlb77mXsxV/NkSTtfLx0TVFvVhz/l1GS78/0j2vPYMRS4XOSOEpAap2+x
         8owD3V6tye2rE8Za9VMYqMATUqcvbIH+FXEfIo38DduqDZRPuz0KxoGoMRYMYsqo2k8F
         gG6w==
X-Gm-Message-State: AOJu0YyOU57YfM8RrXM8JmqVmwKMcKSyxXdSUE7RS5gQlNCcdChGdkXU
	bNjCjNQ3V7+o2mKxcO11xxKMUG83Y/XnO2BeFaqtive5Kvo2ZZ47GtjcGzhX8nrwlrA=
X-Gm-Gg: AfdE7ckwn6fValeXkpb+HpuNr8MZYxjjLvGY8JG+rlQj1GNmeyiPVdOKjoAyXxViOw9
	dwsgmPllJSj8W5Bwm79bREe711NgGClwiNFp+pQ41Or8TOwlggeViuOGDjvjU0ZxekMMJ5f0EAf
	1Zo14wDYV6qFinQwHba3ZePL8NmAk+tY1VzrcrNQR8y7HfFX3ukw6m0w1Ll0OFaiiFrxuIXvVfW
	O08ClwP1wZD6/S2bCnJef4VEtToaNlHaa9wMb3yxUKWeRri1WzYZUzZ+4IqP9KUuwGrbwR3Rlfg
	B4/vEAht6ZtNfZhsKM84bRcHbdGqGpyrvdpEeYQ7kFhGfBt8h4RGUrN2RrP9/SjB7/0EYW7kpW7
	RvbKR7XYOPB96cw+ZOEZhyungXBgS6SHhXRz9xNRekID/j0zrGWAlplXGMaws5y5MzZC3spe/0R
	hdvaPKBP3FK7jpzbBGFqlXUXB8dWhgIzVYPKpnAned6t0kqi4UKnMp8uN89xeeMCr18fC2YpEVP
	KY=
X-Received: by 2002:a05:6000:186c:b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-47f4fca833fmr2713850f8f.18.1784115864467;
        Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:29 +0100
Subject: [PATCH v4 16/21] media: imx355: Define the exposure offset, and
 use that define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-16-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67665-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54F6E75DC7C

The difference between frame length and max exposure time in
lines is 10. That had been used as a bare value in calculations.

Move it to a define, and use that define.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index fa8a6851b44e..cc27a193cd81 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -51,6 +51,7 @@
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
+#define IMX355_EXPOSURE_OFFSET		10
 
 /* Analog gain control */
 #define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
@@ -635,7 +636,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - 10;
+		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -1130,7 +1131,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* fll >= exposure time + adjust parameter (default value is 10) */
-	exposure_max = mode->fll_def - 10;
+	exposure_max = mode->fll_def - IMX355_EXPOSURE_OFFSET;
 	imx355->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX355_EXPOSURE_MIN, exposure_max,

-- 
2.34.1


