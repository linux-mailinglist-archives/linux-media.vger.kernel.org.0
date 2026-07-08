Return-Path: <linux-media+bounces-67017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ErOMX1lTmqXLwIAu9opvQ
	(envelope-from <linux-media+bounces-67017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F2727AC8
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=g+jz2P4B;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67017-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67017-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C958C309B562
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8864F49553A;
	Wed,  8 Jul 2026 14:49:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AA47A0B7
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522167; cv=none; b=D4YhwWWbyvtH3+ysjouXkVnqywo1ltSIQ6zfAjxxOdHcgQMnbDRU25q07bI4D7rlf4VHpZUcIa1B2/iUk4BMCEB4NkCOSTtbMAk38N5bNf3/TUCNwe2epDI1x9ptGNEFRwf5pAg8Depmi8TendbN/KIYo8Wt0FSkocZXMBIuURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522167; c=relaxed/simple;
	bh=UElEKgx5eHfzk8J2KAJPSWZW6uMMfWtwZrksO9N6Tgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZMhH80JdeGfnT3cyEZxto9yr6StxzahoXiJ9UFYUUUA7itkeKa5xR6wdMsmXjTJ6HtxPsXN4CMHPCXsFx6TUt2+Phx9V4dqDspFyZ2LploZ9QUKqtAldKTxvFVWbiYqrd5UTEXysl53tddb45bew4SyL/jtc1fl+BB1b7BSWVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g+jz2P4B; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c00f74baso5390395e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522158; x=1784126958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MdvxgOZXywHJMIvMKFBTdmdPZacbqOOXj1fqUFx+10=;
        b=g+jz2P4B5ayBWbaYFt/0zbbaswROo/uLmAM48UQ4DTTRh70I0HHE9MhYOplG1iPhGw
         AXTDLqOEddI0iRn+Nesl3RGJIO33sFZjW80/mhe8Uq5LA+qlcYx8MDxDbyYdrLCcyJTG
         v9SrjaOsujRmXuYsb6lN4gNZYsURrK77i3+fi3/byAqhwnnYWqgRO9D2vnyy+XI4pr2i
         +DaaqTC9ui1xlbcLv34X2680FJU9LtDGHRAv8DNEp9/AqHLFru2cDtvB41FyBXYbu8Fw
         /NtpsOXeGSgAFc3yLGFqabvRUeRw1CU9nye8cOpg5ugWxoXorH0Q7YK9bPH0omu2IiZq
         I0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522158; x=1784126958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MdvxgOZXywHJMIvMKFBTdmdPZacbqOOXj1fqUFx+10=;
        b=YfQku9LGPENFDu5+/g6zE7jt+jIR74yDB5Z8OxCAh6LDTzI+0ORrxwH8+Vzhp33W9S
         LBtmJkg+hA4qRi68KQtK/clEfK1xzwLcKrldDRxRvyMzP0ukFIwAPh98QxoOXLKPtfYw
         eOezVLy/8Lp1yCMMxmCz4vvtjzKsNDfsZMHjUTa8J7tG1vnykKCvcDRtGQ14XnMCtOon
         M1FqozGWFp6TO+iFzCgEN6Ne4cw7WN2OZqSfHc9kPaqkL99tuH6b3pdlVhRCS9w/9Fpo
         oJhhmMJxdbPkL9phuZphjYzB6d14j8bNaM9Y1gnKnXDL4pIPTH03YFaWcrrUUm6FlBNN
         vsPA==
X-Gm-Message-State: AOJu0Yz5T8hKds7/Fz3Zmyqa4cbZNFoJuCiOrM52p9572C7qekN0aeZl
	fr2USQVIrte1+iGBDmvS7KaAYqckHM4WfAoH7pNfAVC0FZBYalkgvlqy4i01OvPmJcg=
X-Gm-Gg: AfdE7cmJsk3Lrn/Rfxe+rUgfxClS8ytYeSm67PGKbMbJ7FIJ7hQ9akejszXtSy85e1C
	heZ8uSbIk0THxD/pxr2cnQOGbRG2dQ/PvP6iYgXzmBfnz5QjBiMwSRF1VTckTszmH079Zf5iExv
	GjVTX0Pcc/etfYiJNGbVIB7VOcCrqqR1p2/xQshhE46Gq4AgXAqmh7bC6m4kAq+CUNGhUjxLsiK
	aUvym+Fp+V1QfKG8RPzZAUdNxmhw/4LA5tXHxj2r6L1l4n7TiT+dpVMPjGoZNAMC463bg9nb3NV
	SY7LdURtOxWe1EF/tTWQSdo5xk/ClqrxBtjUzRzuZye+jFlg2Si6DXxDjCQwZ8IDqq3zJOcZfSN
	entccEmPuaMcvIzLum9FeyKSKQhDSWFQAKxUOcwYHVoIYJcmiJ+CEJlzba80mYfV15AkIY5Kq+z
	A0Xec6ToAIzhd/SMymrfHiI14+2vZzDJuG1aPMaGgBG9+F0J6R9wLUsBbiVSn/YFH11n9ArSwVd
	BU=
X-Received: by 2002:a05:600c:3b10:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493e689b2d8mr34274405e9.9.1783522158200;
        Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:47 +0100
Subject: [PATCH v3 11/20] media: imx355: Add support for get_selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-11-9df386a623d7@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67017-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B1F2727AC8

Provide all the cropping information via get_selection.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index c6f27cf269b4..ee1f41a66a0b 100644
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
@@ -869,6 +877,12 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -892,6 +906,50 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -1066,6 +1124,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.get_fmt = imx355_get_pad_format,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
+	.get_selection = imx355_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx355_subdev_ops = {

-- 
2.34.1


