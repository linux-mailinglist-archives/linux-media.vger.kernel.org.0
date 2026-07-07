Return-Path: <linux-media+bounces-66886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1UfsARIzTWrvwQEAu9opvQ
	(envelope-from <linux-media+bounces-66886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:10:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016B71E245
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:10:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=opkgxo+w;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66886-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66886-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2083E309262B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C91B44CF44;
	Tue,  7 Jul 2026 17:06:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712343F4BB
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443988; cv=none; b=PcNofv2+172H5dhycJIYz7r8Qvkv1Xk0FXs+TgXi4ZQ7r4Yg5YTnPvK+S5hVByTLwmrQ1TppmjeJL81neen20gAwI6fmKGdLdtXtnxCkA/DCwM7F4DsbA4M2MuZFB5XoV6i+eJrdqLToFXaD899vKLrwlCffVImWzHPpUG6DJYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443988; c=relaxed/simple;
	bh=MphCc5O3/LceZSCcaULO3ViWZlkqj+5A+mASnW+CrnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2SfdS3Y0s11xfks77J0tFxYudC45hyRPKRH1SMJhFXu5Eec9lk7EJGxrD/gowL8VaDKvt4f6bL29aay1oCjp8kuVo8lIfyrWW+Ijo9/fvREPaNy9OLm7HgqYTzUn7Yr4Dj/Erp7lSV6sIlthYPrypQ7E8UPw1sF83+pm/+drvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=opkgxo+w; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493ba701891so35418865e9.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443985; x=1784048785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFU7xbH89hAQ1nHgu2V69I3OWBsT6XrnrmxwCNc4vF8=;
        b=opkgxo+wO7+39GNnMIkm3h70GOdwHhHaAAAQJF8hYhk9gzXsDL+sg43wV0KUMdTmQ1
         ASOS5hnV9QrZWiIMzWEndLaCy1hHvH1nDQ1L+ld9PVQLgXrz+9OeoXO3QC6hu+tNrfrs
         hHXMMxSce8ErSf68mLhDbQr/fk6Ar8LuPa69bOJCwuzIt79BYBwvfywKgHernc2ON+4d
         0hU0T6BU4+Tkfo43umf/y5zxgjibmEION1h6y1oCSp5U8TATHc1OaA3a/8KNfaZCE5Ou
         aobZ2gL1OR1jUubVrDcJ9aIFH6pvoOMgi/Uf33pphxhSUSShPHoOZtdMLpLOxaj9ZS9O
         xJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443985; x=1784048785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFU7xbH89hAQ1nHgu2V69I3OWBsT6XrnrmxwCNc4vF8=;
        b=XlBfFWJH3Fr/vgpdcA+BBlDQEnu1kckea3tTshbjLGM0BtJzkJGOa5cNXUL2AKzwsj
         IrGd2HIvgpF7ZAmSmnR/gOrnzRIHQUF2ljcKzxbnTi/ra64dBxTZ8p2hZ7EVIDE89Pv9
         narI6wkV79Sg/8Os82kfIBcTurydJELRpRIQWGozMt1rDlj4Smoxxdpb8sM2iU5eyd0t
         7y7lZyHpTg7QjvCJF+6j6DugCPv0WCsl4rWSguPF/p9Iv0w6oLhTpoYBTBIfs8xXMaLL
         K3/McDG3vAl9uEGNcbsk6meb0obI/SLVJ2zcgMDZLOiFnd6GxGBbfd/skRZUmb4U4vsf
         jb4Q==
X-Gm-Message-State: AOJu0YxUw7pUuu9CzzJH4oq36jpm/J3TQbWz+vzlGd1l9s3v1y4l8uk4
	wiuoXeBwpHfO57Fk6HcNi7ieeXJZR+TWNDDcWagVbPZegejd2JoJ4K9EWWRC2g3HoVw=
X-Gm-Gg: AfdE7ckBuYHP2KGV/BO5uz8DT2Vbi0huLtNr1zVZohu7EFf+FH1ZrcQfL3INOXC3+kW
	NgqxFOrRew0NgD0hOBhLS7fFFoSBLBnevZ/NXAXO5IsPBj1fYbQcLWPgu7Dqf20jDiZaML38sUa
	5V651Ycz4UfnNYu9Jc1UtTqS/xnjrRKTN6mzwdl3ShdEIBIyU03DvGPlRVjo7iDBhaofhgAWnJx
	x5Xumy+lYO+h8FJ4Ir/z8p4NnIlHFOd6r2nj7R2V65A16gU1DA1uA6MLT9hw2OLaojmDwl5gFU9
	F4+wxS+KbPEGyGplOnr3tIIyO2Re2FtMcLM6cpzNKXQRcXJSjq9pGsl3hz1WC5gyzJCX4KeyCSj
	CDLDBEV7Png17t7GL8rBprcIkXL8QdKHq/kSMEHea9juupHn7yzAdPBcbWBa4Lc9TnMcl+ip1QU
	ckLpqMT+E/iWy8Rgv61h0dbRsRYhK3f1a7YZjr21tutVdILOSvr3JvIrIzmwauUmkY
X-Received: by 2002:a05:600c:528c:b0:493:bc4a:c6b5 with SMTP id 5b1f17b1804b1-493df090fe1mr74373065e9.39.1783443984671;
        Tue, 07 Jul 2026 10:06:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:43 +0100
Subject: [PATCH v2 11/20] media: imx355: Add support for get_selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-11-1683ec07b897@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66886-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1016B71E245

Provide all the cropping information via get_selection.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 354092295b7c..0f5fbe21d7fb 100644
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
@@ -676,6 +681,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
 
 	mutex_lock(&imx355->mutex);
 
@@ -685,6 +691,8 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	*crop = imx355->cur_mode->crop;
+
 	mutex_unlock(&imx355->mutex);
 
 	return 0;
@@ -891,6 +899,50 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -1066,6 +1118,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.get_fmt = imx355_get_pad_format,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
+	.get_selection = imx355_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx355_subdev_ops = {

-- 
2.34.1


