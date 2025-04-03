Return-Path: <linux-media+bounces-29358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D84A7B18B
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 23:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC253BF443
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 21:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF27D1FCCF8;
	Thu,  3 Apr 2025 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CuCqjzWC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1341F1312
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 21:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715894; cv=none; b=U0opPAwbiwtUmk3f7dJge11DBKhszRPkbp2jvO9y4SfVPRm/+mMeMMfLVk51TysDsvegEQcB7+pRm5OJYdOpAr2GjEAU6DKqqmNch/nwsYyYBRx/YOsFLuusjAAhEFafWPkxa6tfbHu6m/mK6M0eif3bBAGHGH/UTqk1kRxCYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715894; c=relaxed/simple;
	bh=86KyjaRAGjjTKuXy7mDWoRbScnGEMhFa4ax77t2ho8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akjHZZW3MO3XxJfVOcnxtOuQKZGVq1eTS2bmCxtyLkssMai25t5kTLZ0cPi5RmE8D7YdnvMak/zXrDPkbZ+OKiW/urNc3d+sT8gZfq7qBR5yhzVcDd/CXwaiWNmnVccBdT80kcywVjZESgqSIqKnN1TXS3PQj0aL9neiQoqr5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CuCqjzWC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1630198e87.2
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 14:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715890; x=1744320690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MGj5UpsHm+GZxbdk2LCox0kgO/5V4KNTxUQIcaSNWI=;
        b=CuCqjzWCUUFg689ZDk/rYO9TSCNpC11Pa450I6E57Lf/EMh/KrdrJOHzAxOBxnbdjr
         Av/pRkRBwqLhV9RJ1fWM0n/kUee7jC7TFUXg9TiHBVJd0VwMKa1kMw1IMGKSwFGH4Kc8
         QqulYh2cd+z5ID6mOu+slFL2KAfNscL+ykL3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715890; x=1744320690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MGj5UpsHm+GZxbdk2LCox0kgO/5V4KNTxUQIcaSNWI=;
        b=PEsCrM4dn3BfI9cAk128FTWxBMPDwJPB2ff4u4IlUbWbkPpD5takoT34BzHyw3+jyL
         9RYQ2gWKzmWgcl3bpWC0HJaC4e4cjAcR8ZA+wGDdakU5BuEwGnyjuIzcLdpajbMxWD/Y
         3ZaY5VGp7dPlz6ZFzBbC/adevJlhTTRLGO4WhoFfjK/N7ksr9ebfReXFYA7QBUGBbTZv
         sm6z7/pqNyRiXM8xLe5nRPy2skTeo0yZN0q+9mk+19zdpyE/6HBbO4r7a8JigVHp1cKc
         KY/8PIu1/l0oWFhFMvowT5cbWW90g+0vzUtQfSFsWd7Gm/ye0pgp1OQd/0RoA9LnprI1
         +AEQ==
X-Gm-Message-State: AOJu0YwNbWWj/kk6Vtz2ULvu/VTCKVaG9YjjaPmqI0bBW1EHq8/vbQG6
	VzvrHsgoHEMC87cDxwbg6d8lPFqRPb3MxWCQd+J9tVfJ679xQ94Lus0kfLSdhQ==
X-Gm-Gg: ASbGncvLNWC7mj2mvRu3G5ZOHhFIvPy5qU5H5dWLcgcmdojrtEaZGziNKHB48IQd1Hv
	V2RBJebrqUoCkpifM+7Tl5r8Rmk4UZNU6HugAZd0DtjAsHU3mKg6lXOrKkV8mH20/s/DBXuntro
	KAAaZavgjY4lNLZx5MRUz5mNIYtiKszqz5H//4o1PCqiChHSXhgBXZmcCPr05fG+xQ7YCOX7MBX
	B36hOYH6AwEyXbCzCGtpH0nQRBT5XMPA9VeBhpDP80fHil583yOQld9cOr1DmDrtoQybggeAOhO
	mLNCow82sAshsEKU4KCE8EcF6VF4/WV5LyokdLsckfxYxc577blt1Gelx6lqWApyd6ksE4uNehw
	X3UxP2n3L/WeRvOBZUQJ5ApzV
X-Google-Smtp-Source: AGHT+IHTbGg1GaWfCnPg2ymof4WQjtefKbcIM/OyDImt2UtLGpbIf8+qPYBSCQ/kBkFjcmGNx4MtWQ==
X-Received: by 2002:a05:6512:68c:b0:549:31e4:9ea with SMTP id 2adb3069b0e04-54c2338b38cmr46045e87.52.1743715890371;
        Thu, 03 Apr 2025 14:31:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 21:31:27 +0000
Subject: [PATCH v4 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-meta-v4-4-877aa6475975@chromium.org>
References: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
In-Reply-To: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the camera supports the MSXU_CONTROL_METADATA control, auto set the
MSXU_META quirk.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 53 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h              |  3 ++
 2 files changed, 56 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index fe2678fc795d7fd5a64e8113199012f34c419176..fb3fc75a0af20c471b87f459593418d3ac021193 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-ioctl.h>
@@ -187,11 +188,63 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+#define MSXU_CONTROL_METADATA 0x9
+static int uvc_enable_msxu(struct uvc_device *dev)
+{
+	static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
+	u32 *data __free(kfree) = NULL;
+	struct uvc_entity *entity;
+
+	list_for_each_entry(entity, &dev->entities, list) {
+		int ret;
+
+		if (memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
+			continue;
+
+		if (!data)
+			data = kmalloc(sizeof(*data), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (ret)
+			continue;
+
+		if (*data) {
+			dev->quirks |= UVC_QUIRK_MSXU_META;
+			return 0;
+		}
+
+		ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (ret || !*data)
+			continue;
+
+		ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (!ret) {
+			dev->quirks |= UVC_QUIRK_MSXU_META;
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
 int uvc_meta_register(struct uvc_streaming *stream)
 {
 	struct uvc_device *dev = stream->dev;
 	struct video_device *vdev = &stream->meta.vdev;
 	struct uvc_video_queue *queue = &stream->meta.queue;
+	int ret;
+
+	ret = uvc_enable_msxu(dev);
+	if (ret)
+		return ret;
 
 	stream->meta.format = V4L2_META_FMT_UVC;
 
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_MSXU_1_5 \
+	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
+	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
2.49.0.504.g3bcea36a83-goog


