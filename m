Return-Path: <linux-media+bounces-67661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMAVC4FzV2otOQEAu9opvQ
	(envelope-from <linux-media+bounces-67661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:48:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246075DB9C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Sqj2KZ4c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67661-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67661-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 536D9303A144
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C8E478E51;
	Wed, 15 Jul 2026 11:44:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F946AF3D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115864; cv=none; b=WWdnM0pfm8xbgeB3Kupey6v4PTJ/NoTNV7HCn9DdDoM5ARWK/FJbhUkuq92Uyq+2wrHNKyNHB4dKNB8EV8ERrkNFc1MhUv1hC2AwCt9PBSbd11NkpMJyFBovBLZQvW0qZ3rO8nybjo+mgFbr98Lvm8guy8QPFDUYueO97NQ/qXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115864; c=relaxed/simple;
	bh=QPSz7fNjipJoxhGgne7N/ewO/88rd81fw6g6fFaqWwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGXFEndUvhOLEuuGMCuw1hFHSQEjronbHtM87cKDeDoOJEp6WKQhIYh+9nWm/4FqVnWoU/AIqUOBw0hkaQzzQKilm+Yw9EtxBlS8p1oSnNzenimZT9YDgBacWSqBX/XfvVra9sq/VCMEz3ichq0rOK6hxyHvibt+vA9VKAXv1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Sqj2KZ4c; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f75f7172so36747965e9.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115860; x=1784720660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Y8stE43huuTKZ9RKy4x8t79KHGScJVKOZ/vGCx6NPU=;
        b=Sqj2KZ4cr18u2A65xn4RFqphwtH0J1o20KhfwemxpO1BLE8aFqySaTCDCZXwrqksOS
         Iy3pKbX+ALjEvb8oq3IEyBeZtiWtmYQDFLuNf+wi2D2zSTGXRZnIbunqu/ovUl2d6dc2
         jwYnkjTbXaKEZTDozkqU+5s1ZJoDWG4fnsz0IWKgWc2M58kLI/Cg8hbbykdnu5xGTAn/
         cn2wqxjlKRJm8BlGLJrTvz2JeT/OvvPvjA21g00J+eQkebmBg9jeAnuakavxDcAs+mJN
         YRCRqx2/+73hcNjpaRvTrQtZY+OvZrkTXfgka0lTlNTIorfkTF7dEhOAkLN1njVAu4Tt
         pmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115860; x=1784720660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Y8stE43huuTKZ9RKy4x8t79KHGScJVKOZ/vGCx6NPU=;
        b=fxxl27VLvE91LB1pUQVRpoP2lbI54/UCchTR/gwnfnygG5ScvamCBeuLDUyZb6gKj5
         mAtoknK7bTi/C3zy/PP3aVntxFhuzJ5DQ2CLL3vLJvOpJv3bL4JC652QsVDGJjseYwo4
         Qq1B67Gv4E8dwnBGeyHvTuj4ezobjhH0/OYbpaB3hcGc2VRsguj4qgjNZoGl3FTJ4nHa
         a9Pj4UCcggEHg0au6ykfpjLf8NpZ1qw3MnXQc+WgnMtymAjn2Hl/F7js1H4Ejn8QzJxu
         LZWjM9wP3DO1zuODPJ5fpNaVhYdWA5b04h04YWkLqC/bu5PTUsOlf7jthFHAaOSLL2XI
         onrQ==
X-Gm-Message-State: AOJu0YwMPy3H123MQP3fBFo8S8oigCdQHT1Ue3B5e8/sUPl009RIcGUU
	s2i+fa66/Lg1A/9m88k3cw0fhk4q1X++CC8YQo0pP+lNMfvHW4VzjPkdq0MFkljJOyQ=
X-Gm-Gg: AfdE7cm5bdoJ9ZfnJjx02fAK0Q6w0DnoIoHgidcNSKegBVQ2mCpIeR5XGJ4TYyp950u
	ue5ktWK3fG4GKjlBVQwSopN3ChaPopoVGW/68qwgQL+/y9kF4a4zDNwWZY6eBxN+fCnQvwiDow+
	ZnD04bLriPmq+/nt1HZv3jQjwqPp1Yc8W4BFXu5Kf5P/66THjlRWfNJfIjg/ZTK6WkvdRAsWrha
	R8y4WB3NK/j41PnfnrGdMUvF/ZbcSPjYKqrt6n1ZDV5c4nCvn1Ks9fKOnq1CZgS9E5asuAbZQ/h
	yBLhxJBw2d7yKVs5pgHbQICN33Jgdp+a7PtvWD0px5YoMxOuhEnY7Q7Lh2ntEWeVby+6GHxZMZ0
	b4Oq9KtMMdjIfPeVgluhez10OC3Qxj3SvOkqYqoAwe4Y+RiIWEMfemJTRQNIxUBoTKpOXBNuDAI
	+ILZC78omrdR9zo3j57j9R9EhoLvZTxp5zjZYA3z8DkaYGjpdG7wXQG0sDmJSmmnCX
X-Received: by 2002:a05:600c:4593:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4953c14752amr29475675e9.8.1784115860470;
        Wed, 15 Jul 2026 04:44:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:25 +0100
Subject: [PATCH v4 12/21] media: imx355: Add support for get_selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-12-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67661-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3246075DB9C

Provide all the cropping information via get_selection.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 649a6fc9abe9..120eda46d982 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -86,6 +86,11 @@
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
 
+#define IMX355_PIXEL_ARRAY_TOP		0
+#define IMX355_PIXEL_ARRAY_LEFT		0
+#define IMX355_PIXEL_ARRAY_WIDTH	3280
+#define IMX355_PIXEL_ARRAY_HEIGHT	2464
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -677,6 +682,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
 
 	mutex_lock(&imx355->mutex);
 
@@ -686,6 +692,8 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	*crop = imx355->cur_mode->crop;
+
 	mutex_unlock(&imx355->mutex);
 
 	return 0;
@@ -849,6 +857,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	struct imx355 *imx355 = to_imx355(sd);
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_rect *crop;
 	s32 vblank_def;
 	s64 h_blank;
 	u32 height;
@@ -869,6 +878,12 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
+
+		crop = v4l2_subdev_state_get_crop(sd_state, 0);
+		crop->width = mode->crop.width;
+		crop->height = mode->crop.height;
+		crop->left = mode->crop.left;
+		crop->top = mode->crop.top;
 	} else {
 		imx355->cur_mode = mode;
 		/* Update limits and set FPS to default */
@@ -892,6 +907,50 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static void
+__imx355_get_pad_crop(struct imx355 *imx355,
+		      struct v4l2_subdev_state *sd_state, unsigned int pad,
+		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		*r = *v4l2_subdev_state_get_crop(sd_state, pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		*r = imx355->cur_mode->crop;
+		break;
+	}
+}
+
+static int imx355_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct imx355 *imx355 = to_imx355(sd);
+
+		mutex_lock(&imx355->mutex);
+		__imx355_get_pad_crop(imx355, sd_state, sel->pad, sel->which,
+				      &sel->r);
+		mutex_unlock(&imx355->mutex);
+
+		return 0;
+	}
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = IMX355_PIXEL_ARRAY_TOP;
+		sel->r.left = IMX355_PIXEL_ARRAY_LEFT;
+		sel->r.width = IMX355_PIXEL_ARRAY_WIDTH;
+		sel->r.height = IMX355_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
@@ -1066,6 +1125,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.get_fmt = imx355_get_pad_format,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
+	.get_selection = imx355_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx355_subdev_ops = {

-- 
2.34.1


