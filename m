Return-Path: <linux-media+bounces-31670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01237AA85DB
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26ED87A6649
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB481A2391;
	Sun,  4 May 2025 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkZ4dZJp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151C193436
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353655; cv=none; b=ntmOvuWZGmXsnU40VeoJQYRxsK3YtgqTu9qT7OS0dsV0gVlZbSQtCCTyp7GifatMAsG9UlCiRLuRi69SlTZmZLWLL/yFo0m5dRpq9i77N26Nv6MaudyXSZYKk/MHiAbPxfVMQaoL7QCKABgyTwQQ/Q0XLqQOYDVV9rtD+Zea5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353655; c=relaxed/simple;
	bh=T5k9q2djfs9UhMaFc7+o4FGkxOnhwVtoKkI+S7f/6W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOpKKDQ4i+DpL7hSUfntH+hMJd63ZDK8kVBEA7e+I70NT2g9U7eVlFedqvGUUzxCw4gNpkJU4JrJSGj6ERoXAmJxwQcCYDRulfv3tD5eEZFVdZwG7EWDlInDFsEADBBv7ogfFmv3Xa8VT1C8mcNCiHovkHKd3HVWPh/3nyKmvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkZ4dZJp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FRShK50C1CbTfOcTcqcTH2Iiq263DOCt3b+mBJ1vHo=;
	b=dkZ4dZJpZb4hjjlCF4v03mPDVmX7/X4crR2n5kx4AB9TnVDvAV0NLLJjYZYSSxoZXsuu+p
	x/p+h9GTd+FhOuH5BqJIcZs8vs24X5+iQeIB7rNx4p8Q8wqJJdSsvBJUyKBq0k8IUvuTad
	8uwR+tp9N19qxA+aTfN7SCle56BQ7kw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-U2zKpWQzOwmdYHxvZ44ytg-1; Sun,
 04 May 2025 06:14:09 -0400
X-MC-Unique: U2zKpWQzOwmdYHxvZ44ytg-1
X-Mimecast-MFC-AGG-ID: U2zKpWQzOwmdYHxvZ44ytg_1746353648
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5748519560BB;
	Sun,  4 May 2025 10:14:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3980F1800352;
	Sun,  4 May 2025 10:14:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 10/13] media: mt9m114: Fix scaler bypass mode
Date: Sun,  4 May 2025 12:13:31 +0200
Message-ID: <20250504101336.18748-11-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

As indicated by the comment in mt9m114_ifp_set_fmt():

	/* If the output format is RAW10, bypass the scaler. */
	if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
		...

The intend of the driver is that the scalar is bypassed when the ISP
source/output pad's pixel-format is set to MEDIA_BUS_FMT_SGRBG10_1X10.

This patch makes 2 changes which are required to get this to work properly:

1. Set the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit in
   the MT9M114_CAM_OUTPUT_FORMAT register.

2. Disable cropping/composing by setting crop and compose selections on
   the ISP sink/input format to the format widthxheight @ 0x0.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index fa7c2137c6ba..2ebd115b2ddf 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -468,7 +468,8 @@ static const struct mt9m114_format_info mt9m114_format_infos[] = {
 		/* Keep the format compatible with the IFP sink pad last. */
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.output_format = MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_RAWR10
-			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER,
+			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER
+			| MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE,
 		.flags = MT9M114_FMT_FLAG_PARALLEL | MT9M114_FMT_FLAG_CSI2,
 	}
 };
@@ -796,7 +797,7 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	const struct v4l2_mbus_framefmt *ifp_format;
 	const struct v4l2_rect *ifp_crop;
 	const struct v4l2_rect *ifp_compose;
-	unsigned int hratio, vratio;
+	unsigned int border, hratio, vratio;
 	u64 output_format;
 	u64 read_mode;
 	int ret = 0;
@@ -856,10 +857,12 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	 * by demosaicing that are taken into account in the crop rectangle but
 	 * not in the hardware.
 	 */
+	border = (ifp_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) ? 0 : 4;
+
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
-		  ifp_crop->left - 4, &ret);
+		  ifp_crop->left - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
-		  ifp_crop->top - 4, &ret);
+		  ifp_crop->top - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
 		  ifp_crop->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
@@ -898,7 +901,8 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 			   MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_MASK |
 			   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
 			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
-			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
+			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE |
+			   MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE);
 	output_format |= ifp_info->output_format;
 
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
@@ -1805,6 +1809,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 {
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
@@ -1825,8 +1830,15 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 		format->code = info->code;
 
 		/* If the output format is RAW10, bypass the scaler. */
-		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
+		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
 			*format = *v4l2_subdev_state_get_format(state, 0);
+			crop = v4l2_subdev_state_get_crop(state, 0);
+			crop->left = 0;
+			crop->top = 0;
+			crop->width = format->width;
+			crop->height = format->height;
+			*v4l2_subdev_state_get_compose(state, 0) = *crop;
+		}
 	}
 
 	fmt->format = *format;
@@ -1846,6 +1858,10 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
+	/* Crop and compose are not supported when bypassing the scaler */
+	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10)
+		return -EINVAL;
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(state, 0);
@@ -1906,6 +1922,10 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
+	/* Crop and compose cannot be changed when bypassing the scaler */
+	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10)
+		return -EINVAL;
+
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
 	compose = v4l2_subdev_state_get_compose(state, 0);
-- 
2.49.0


