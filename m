Return-Path: <linux-media+bounces-67019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qJr5ESxnTmooMAIAu9opvQ
	(envelope-from <linux-media+bounces-67019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:05:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809E727BD6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:05:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=phnLMqFp;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67019-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67019-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAEF230AC1CF
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B204C955B;
	Wed,  8 Jul 2026 14:49:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6BF480DFD
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522168; cv=none; b=GKFlvLuK5UmN5SgMO2iNfKzJxlzY5zkPxSHlzQGq0JQFDAZuxk82pfR5PpAwArGAHBqpPyEGJFTh2jZqmaKKNCuYK95mPrsp+syL0ZShkLLnSfw9ZO2UA7azpdBt1n9o0mnyrYGss5ccJPA+FQ61mRB5Mie89ww+NKl4LIVt4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522168; c=relaxed/simple;
	bh=AE+i38URadyS4ydSRjafOJeNNrYwdTlnwBC+7VOFlkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USEiFnaWZWCDVXhlu40rW8ih/9ggy+vg3K3tIAQZNv1sq5akiCN8svNhLsumncPoUH5/rfb/nrhrZZdEUOx09DRspkmckKxnEjHpaX3e8Q99J5GSXR/+ahvu1HAYPD/1HdrC+ifmqkYzh9GCa7gC/WaukVyuwaRud0kEVpBZL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=phnLMqFp; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47dec32798aso804241f8f.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522160; x=1784126960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOdbzYUWhs5HpVXO6M+i3dw4wtd6/MeyqYVT2Wwi2z8=;
        b=phnLMqFpZ7VlYI3qE0FKGEFc2RCwLe15w3KeD2zTz/QI+rHetv9Q3EAJkAzjDRZmK3
         3NQ3THjG+F/D3lpXFsD85JoHNFRO+Z6LgnU9A6FxckdBE+F2Ig2Z9tgQFsf4PWhYCUxq
         5wRG/Tveb5l2dOrLbAx78hbKaCGKZvM/Wxw8pi27MW4acFXsljvq242GRbAzbcuLoYNG
         fAFNkjqWf+VrqbtB3b01wM6U90OSbJ6ln1nd37kWdm1y2qHK3+sG5JYljMeBlGncZIoa
         37j3zx+rdG9+BKtpBiOiR4g4B1r7F7cxFq72+yQLafiilTt7YGNr47L31G5lIoptng6S
         4+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522160; x=1784126960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOdbzYUWhs5HpVXO6M+i3dw4wtd6/MeyqYVT2Wwi2z8=;
        b=jZc1eIKrJZjv6SKUUhuKGk8mf1aWb8gB8qgtUhaL/oZur+ZXRp9vRA5STcx91btub4
         MI9pVCNsW5CfKVmhxlFZESh9aSUsb5Ime38fjMdBZYUq0XCEwobqnF2ZYfwEwDVshQr5
         yX6XrBSvAqBM+913KciKV/fFzYJKuT5t7DnSopHa5TACj9LvtiZLAczhpZpa4dJ04ZyA
         N6P4eiWfauwYP/8mvFhPKN8bqbMRfZyScpvisV4X/s1+2dGrB8YCQNxRF6Dy9GMGyhRh
         VgU5VihpF4bJiZKaPQzJANd8Yiq/pKwLUxHAIrfauKOVaCxbXMsTaaafK5RSBmI1NG6s
         DDEQ==
X-Gm-Message-State: AOJu0Yzogh3saXYfj9KKPXJztwxgYO8dvm/UELTWxxusD5CwpbfKLAj3
	pVjxDpVK1FeZaxiTWq7m12526N8VanykkbNnuZY3SmBU+WhEba56o3snyNrnISlyQ0g=
X-Gm-Gg: AfdE7clFx+8lk8wmdZNgmhtsjozQ33ubSqY3Jgi1G/r0WZ0+eEiXeqqh8RoJ+FZA9pP
	NfXfVaLTraObNCxm9SQZpcyQkHOENflFxRlJYlvSorLH6zn87iJrImt887mWYMAev43HaT7f9bU
	xsC3KbBZCeBCXjkiAU7Tra9fbXmxNEQmQw55W/A8rdzwBRitECfWXN50IFnJQy8ZWI7FwHSjwQ7
	5TQrIbznQm18n4GccROe6VUPIHNj+1ZGRLKZzDJVIEdxsqA0ele7I6t4fdy+3hQxkLxKSBwAJUC
	f+5/Q6zzPjsmfQffNuXPgwFh4yTvsCjTnkXXwwSNSw1Pg1qYb8YCdA2GMwi9TU+C1qtILZKYca9
	NHvK/bIUXuXZAWuV/9Mf3oNQmlirUMPoGbt3+7RnXXNS3qZMerzYAd931lX8yKuuaGuTOjmv4Ou
	q2ZNTuDone4CV0T2kC4pCWEHUbG2RtO0Hkkw0tHFMrlLRHs7WgycHZc6djQuohUkgt3ie6dz1KQ
	UU=
X-Received: by 2002:a05:600c:8b05:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493e68cf39amr29755245e9.26.1783522160563;
        Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:50 +0100
Subject: [PATCH v3 14/20] media: imx355: Set the colorspace in the format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-14-9df386a623d7@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-67019-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8809E727BD6

The colorspace fields were left set to 0 when they should be
set appropriately for a raw image sensor. Add those values.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b27329143e48..2bf8da7469fe 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -612,6 +612,10 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->height = imx355->cur_mode->height;
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
+	try_fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	try_fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	try_fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	try_fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 
 	*crop = imx355->cur_mode->crop;
 
@@ -738,6 +742,10 @@ static void imx355_update_pad_format(struct imx355 *imx355,
 	fmt->format.height = mode->height;
 	fmt->format.code = imx355_get_format_code(imx355);
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static int imx355_do_get_pad_format(struct imx355 *imx355,

-- 
2.34.1


