Return-Path: <linux-media+bounces-32664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDFABA9CB
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1425417F591
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085931F8755;
	Sat, 17 May 2025 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIA21xlC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB9C1F7075
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482120; cv=none; b=SL5rRgc+A4Dmvhq4f1qzlxNUDGF4dJH5yMPHLX4z2DYBqK1CZBlOOO5ovBo23xtnKycYy33gBbJNTH5/dtjaCQr/ITPukhX+HCW2JmfCEp6rb64mHLTJs/FGMkAEDyaMElOmjWAvAkCPcsGlDBEAH7ZUbJYgBBeL4nxksLSXM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482120; c=relaxed/simple;
	bh=XNaRz35e0vZWgEWzpEtIrNvdtfZ7RyCA+ZqeZVkOJVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7x+gEk6z+fJuO7Q3PD2EycSyP5hl2umyESe7xWOefWtxTJ8cCgKhxN6NKU+aNgfSCtlp3SVYbCmZoO8JLkSjp2Kgjv1gqhS4C6LEDF7SbFq9KCcNI8w7maP64CilXRcqZLzfIde4NrnM5GkxMjVVW+DBusb7Nt7P7IcAKOOLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIA21xlC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kRTKBx5q1t17bw8Lqpo/bcBQBEnRH+ZnFCeyr81fIEQ=;
	b=dIA21xlC4aLRK0YVJYlqmT+YAnerttN4RNqrEoZqaTgr9Cetx8nSeh2e+fSfTfupCatf34
	fERkZm6j2lds27P5qV21XAY7aCa0hAjgVdVxD6bNO7ZoFTtMZfKBj+LG+ZrimewFMwg3oa
	Cn4LHgC+4NQOpoCBUTjEL27nxfD/FCo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-iPsuwrieMHCKAnhW0nkAiA-1; Sat,
 17 May 2025 07:41:54 -0400
X-MC-Unique: iPsuwrieMHCKAnhW0nkAiA-1
X-Mimecast-MFC-AGG-ID: iPsuwrieMHCKAnhW0nkAiA_1747482113
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 383CF1956088;
	Sat, 17 May 2025 11:41:53 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 64279180045B;
	Sat, 17 May 2025 11:41:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/23] media: atomisp: gc0310: Add selection API support
Date: Sat, 17 May 2025 13:40:49 +0200
Message-ID: <20250517114106.43494-7-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support for the selection API as expected by libcamera.

Note the driver only supports a single fixed resolution and
no cropping, so this is a simple read-only implementation.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 756e56f639b7..7902e732a3ca 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -3,7 +3,7 @@
  * Support for GalaxyCore GC0310 VGA camera sensor.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel.org>
  */
 
 #include <linux/delay.h>
@@ -352,6 +352,43 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int gc0310_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	/* Only the single fixed 656x496 mode is supported, without croping */
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = GC0310_NATIVE_WIDTH;
+		sel->r.height = GC0310_NATIVE_HEIGHT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gc0310_set_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	/* Only the single fixed 656x496 mode is supported, without croping */
+	sel->r.top = 0;
+	sel->r.left = 0;
+	sel->r.width = GC0310_NATIVE_WIDTH;
+	sel->r.height = GC0310_NATIVE_HEIGHT;
+	return 0;
+}
+
 static int gc0310_detect(struct gc0310_device *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
@@ -509,6 +546,8 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_frame_size = gc0310_enum_frame_size,
 	.get_fmt = gc0310_get_fmt,
 	.set_fmt = gc0310_set_fmt,
+	.get_selection = gc0310_get_selection,
+	.set_selection = gc0310_set_selection,
 	.get_frame_interval = gc0310_get_frame_interval,
 };
 
@@ -671,5 +710,6 @@ static struct i2c_driver gc0310_driver = {
 module_i2c_driver(gc0310_driver);
 
 MODULE_AUTHOR("Lai, Angie <angie.lai@intel.com>");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
 MODULE_DESCRIPTION("A low-level driver for GalaxyCore GC0310 sensors");
 MODULE_LICENSE("GPL");
-- 
2.49.0


