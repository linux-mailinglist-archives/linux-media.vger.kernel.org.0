Return-Path: <linux-media+bounces-21728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB069D4945
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 09:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C8C4B2375D
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 08:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD511D1F78;
	Thu, 21 Nov 2024 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LQJ+q8kz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D21CBEA3
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732179207; cv=none; b=L1BVS2GK+Rr7ePdglAEUo89iwnKrdeZrCa1X1msIthSp1VyqdTZnayQS2TG8fAT/rfssMG8rkf19dqJO1nKALjZ4vbXeuaehAERn3Jq38+MqWr+jtJR5nwUN0yde6Ijvhx2A9QdBU0q5N7j2iGadwSVvKgO9xBNr1VNMylrz50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732179207; c=relaxed/simple;
	bh=6n+S86RoAdZIZuJDPBq9B3e25CXEVJL86rH0qyqrJnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fofg5Jgj7FJ4Y4ZLuKK8EZOIuYb5RX8YMyFiDc0c5ke3rqcA4lgN8o1fsAxoxtbgxHFbDSXINYqd019ZpnANONGEqTk4AFpSFTropOVK9HZtSada+CYh5my8rqkbZ2A9LwnHfsGmY9D1EHPrIxuK2KEPaEyOvAMwUGPyjeLg6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LQJ+q8kz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-382325b0508so448324f8f.3
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 00:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732179200; x=1732784000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OSbfoYQsoE2dZGYChQCk9jjihU6c6NuuyWsfj1aseQ=;
        b=LQJ+q8kzMclQsQxrE2YBrFvwbCEfMiwPEsaiTXAX8V0bkfEA+0nVBop4u41FSpHx3Z
         qUPB7I6gHRz7x9fDNt65REOqWqETDXRUbNMQFnyvEPLXRtmdWHgz3C54vf21AzK2NxeA
         9zXaXx/wC0ouWQ13G3aCGJpi1bnBg20PK+z4fROcZzIDS4UFYL1/2AW1MGJsqDd4qTkO
         yddr2MKkPrJt1Ifq2A74vfpDxt5oGCUgJp53edoG4optG1IWxFPHBKVU0dAxT+xgLxYI
         ToJex7ulZOqrskFdDiyMLK4YD9ZdVpeOACgeKM65L+LN1aXnZ5+HLRD2jiyA5xlL8jsK
         WM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179200; x=1732784000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OSbfoYQsoE2dZGYChQCk9jjihU6c6NuuyWsfj1aseQ=;
        b=Anq0HN4XbzlQw4tIONVbNanhNruDJfrLxypfEmslBIZo3c1pP6HNFZWazghAQCEgbM
         oSox3mU62yuyAu8+TBWdk+c3BUY86500170r14TDJUM3qlu9/BWnMjCo4wdNq+u51axn
         qRQvDRoaQqhkVr981+zYsKFDXe09rqy08VZOfI9bgz3MhSk8VF5Mgs/ZzM3D9z6rCCv2
         rxmJtBh5NDtDYnGhEfcx1QQu5Ap/L1zG678/NkWdJH8gm4h6IdnqCsRFy7kpo/GlIdO0
         IIgYmNhDlLH7jEyp3qExl7AZW0iPgLcK5CU4mUyBRNLWXkewEme8fnaJp4Khx5ryYLgo
         g7MA==
X-Gm-Message-State: AOJu0YwVqiWy86oVRdYH4VrNA2O9uqlVT4hidos7VOYTbCWcfr0aWNVn
	n0bawjDT11BJBdodVBbno3U/cSFX24Oxxog9qALRqQeS5oHbt77mvA5jHtugC5E=
X-Google-Smtp-Source: AGHT+IEcAv3GRZwseuzL0YCWZg0w8k962U2tdmxbozyTY4fRwzpVpwqF+C9HcEjnZKWef7e7goJWmg==
X-Received: by 2002:a05:6000:1787:b0:382:588d:90ae with SMTP id ffacd0b85a97d-382588d9382mr2659960f8f.15.1732179200377;
        Thu, 21 Nov 2024 00:53:20 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549111fdsm4219900f8f.58.2024.11.21.00.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:53:20 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 21 Nov 2024 09:53:18 +0100
Subject: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek ISP3.0
 camsv
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Phi-bang Nguyen <pnguyen@baylibre.com>, 
 Florian Sylvestre <fsylvestre@baylibre.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This driver provides a path to bypass the SoC ISP so that image data
coming from the SENINF can go directly into memory without any image
processing. This allows the use of an external ISP.

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
[Paul Elder fix irq locking]
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/media/platform/mediatek/isp/Kconfig        |  18 +
 drivers/media/platform/mediatek/isp/Makefile       |   5 +
 drivers/media/platform/mediatek/isp/mtk_camsv.c    | 275 ++++++++
 drivers/media/platform/mediatek/isp/mtk_camsv.h    | 170 +++++
 .../media/platform/mediatek/isp/mtk_camsv30_hw.c   | 539 ++++++++++++++++
 .../media/platform/mediatek/isp/mtk_camsv_video.c  | 701 +++++++++++++++++++++
 6 files changed, 1708 insertions(+)

diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/media/platform/mediatek/isp/Kconfig
index 2a3cef81d15aa12633ade2f3be0bba36b9af62e1..2b89efc7ba9aa6b85f850bb8ec938cde581f31a2 100644
--- a/drivers/media/platform/mediatek/isp/Kconfig
+++ b/drivers/media/platform/mediatek/isp/Kconfig
@@ -1,4 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config MTK_CAMSV30
+	tristate "MediaTek ISP3.0 CAMSV driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	depends on PM
+	select MEDIA_CONTROLLER
+	select MTK_SENINF30
+	 select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	default n
+	help
+	  This driver provides a path to bypass the SoC ISP so that
+	  image data come from the SENINF can go directly into memory
+	  without any image processing.
+	  To compile this driver as a module, choose M here: the
+	  module will be called mtk-camsv30.
+
 config MTK_SENINF30
 	tristate "MediaTek ISP3.0 SENINF driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/media/platform/mediatek/isp/Makefile b/drivers/media/platform/mediatek/isp/Makefile
index 375d720f9ed75e2197bb723bdce9bc0472e62842..e7205759fe9bc27bd5146c490b93db72deb3767f 100644
--- a/drivers/media/platform/mediatek/isp/Makefile
+++ b/drivers/media/platform/mediatek/isp/Makefile
@@ -1,4 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
+mtk-camsv30-objs += mtk_camsv.o
+mtk-camsv30-objs += mtk_camsv30_hw.o
+mtk-camsv30-objs += mtk_camsv_video.o
+obj-$(CONFIG_MTK_CAMSV30) += mtk-camsv30.o
+
 mtk-seninf-objs += mtk_seninf.o
 obj-$(CONFIG_MTK_SENINF30) += mtk-seninf.o
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv.c b/drivers/media/platform/mediatek/isp/mtk_camsv.c
new file mode 100644
index 0000000000000000000000000000000000000000..a02a1c226ee6164db08d18d6927d35ac86eaa8cc
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+
+#include "mtk_camsv.h"
+
+static inline struct mtk_cam_dev *to_mtk_cam_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mtk_cam_dev, subdev);
+}
+
+static const u32 mtk_cam_mbus_formats[] = {
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_VYUY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YVYU8_1X16,
+};
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev Operations
+ */
+
+static int mtk_cam_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	static const struct v4l2_mbus_framefmt def_format = {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.width = IMG_MAX_WIDTH,
+		.height = IMG_MAX_HEIGHT,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+		.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+		.quantization = V4L2_QUANTIZATION_DEFAULT,
+	};
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		format = v4l2_subdev_state_get_format(sd_state, i);
+		*format = def_format;
+	}
+
+	return 0;
+}
+
+static int mtk_cam_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(mtk_cam_mbus_formats))
+		return -EINVAL;
+
+	code->code = mtk_cam_mbus_formats[code->index];
+
+	return 0;
+}
+
+static int mtk_cam_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	/*
+	 * We only support pass-through mode, the format on source pads can't
+	 * be modified.
+	 */
+	if (fmt->pad != MTK_CAM_CIO_PAD_SENINF)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_mbus_formats); ++i) {
+		if (mtk_cam_mbus_formats[i] == fmt->format.code)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(mtk_cam_mbus_formats))
+		fmt->format.code = mtk_cam_mbus_formats[0];
+
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	format->width = clamp_t(u32, fmt->format.width,
+				IMG_MIN_WIDTH, IMG_MAX_WIDTH);
+	format->height = clamp_t(u32, fmt->format.height,
+				 IMG_MIN_HEIGHT, IMG_MAX_HEIGHT);
+	format->code = fmt->format.code;
+
+	fmt->format = *format;
+
+	/* Propagate the format to the source pad. */
+	format = v4l2_subdev_state_get_format(sd_state, MTK_CAM_CIO_PAD_VIDEO);
+	format->width = fmt->format.width;
+	format->height = fmt->format.height;
+	format->code = fmt->format.code;
+
+	return 0;
+}
+
+static int mtk_cam_subdev_registered(struct v4l2_subdev *sd)
+{
+	struct mtk_cam_dev *cam = to_mtk_cam_dev(sd);
+
+	/* Create the video device and link. */
+	return mtk_cam_video_register(cam);
+}
+
+static int camsv_enable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 pad,
+				u64 streams_mask)
+{
+	struct mtk_cam_dev *cam = to_mtk_cam_dev(sd);
+	struct v4l2_subdev *seninf;
+	int ret;
+
+	if (!cam->seninf) {
+		cam->seninf = media_pad_remote_pad_first(&cam->subdev_pads[MTK_CAM_CIO_PAD_SENINF]);
+		if (!cam->seninf) {
+			dev_err(cam->dev, "No SENINF connected\n");
+			return -ENOLINK;
+		}
+	}
+
+	seninf = media_entity_to_v4l2_subdev(cam->seninf->entity);
+
+	/* Seninf must stream on first */
+	ret = v4l2_subdev_enable_streams(seninf, cam->seninf->index, BIT(0));
+	if (ret) {
+		dev_err(cam->dev, "failed to stream on %s:%d\n",
+			seninf->entity.name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int camsv_disable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct mtk_cam_dev *cam = to_mtk_cam_dev(sd);
+	struct v4l2_subdev *seninf;
+	int ret;
+
+	if (cam->seninf) {
+		seninf = media_entity_to_v4l2_subdev(cam->seninf->entity);
+		ret = v4l2_subdev_disable_streams(seninf, cam->seninf->index,
+						  BIT(0));
+		if (ret) {
+			dev_err(cam->dev, "failed to stream off %s:%d\n",
+				sd->entity.name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mtk_cam_subdev_pad_ops = {
+	.enum_mbus_code = mtk_cam_enum_mbus_code,
+	.set_fmt = mtk_cam_set_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+	.enable_streams = camsv_enable_streams,
+	.disable_streams = camsv_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
+	.pad = &mtk_cam_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops mtk_cam_internal_ops = {
+	.init_state = mtk_cam_init_state,
+	.registered = mtk_cam_subdev_registered,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media Entity Operations
+ */
+
+static const struct media_entity_operations mtk_cam_media_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+/* -----------------------------------------------------------------------------
+ * Init & Cleanup
+ */
+
+static int mtk_cam_v4l2_register(struct mtk_cam_dev *cam)
+{
+	struct device *dev = cam->dev;
+	int ret;
+
+	cam->subdev_pads[MTK_CAM_CIO_PAD_SENINF].flags = MEDIA_PAD_FL_SINK;
+	cam->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize subdev pads */
+	ret = media_entity_pads_init(&cam->subdev.entity,
+				     ARRAY_SIZE(cam->subdev_pads),
+				     cam->subdev_pads);
+	if (ret) {
+		dev_err(dev, "failed to initialize media pads:%d\n", ret);
+		return ret;
+	}
+
+	/* Initialize subdev */
+	v4l2_subdev_init(&cam->subdev, &mtk_cam_subdev_ops);
+
+	cam->subdev.dev = dev;
+	cam->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	cam->subdev.entity.ops = &mtk_cam_media_entity_ops;
+	cam->subdev.internal_ops = &mtk_cam_internal_ops;
+	cam->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	strscpy(cam->subdev.name, dev_name(dev), sizeof(cam->subdev.name));
+	v4l2_set_subdevdata(&cam->subdev, cam);
+
+	v4l2_subdev_init_finalize(&cam->subdev);
+
+	ret = v4l2_async_register_subdev(&cam->subdev);
+	if (ret) {
+		dev_err(dev, "failed to initialize subdev:%d\n", ret);
+		media_entity_cleanup(&cam->subdev.entity);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam)
+{
+	mtk_cam_video_unregister(&cam->vdev);
+
+	media_entity_cleanup(&cam->subdev.entity);
+	v4l2_async_unregister_subdev(&cam->subdev);
+	v4l2_subdev_cleanup(&cam->subdev);
+}
+
+int mtk_cam_dev_init(struct mtk_cam_dev *cam_dev)
+{
+	int ret;
+
+	mutex_init(&cam_dev->op_lock);
+
+	/* v4l2 sub-device registration */
+	ret = mtk_cam_v4l2_register(cam_dev);
+	if (ret) {
+		mutex_destroy(&cam_dev->op_lock);
+		return ret;
+	}
+
+	return 0;
+}
+
+void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam)
+{
+	mtk_cam_v4l2_unregister(cam);
+	mutex_destroy(&cam->op_lock);
+}
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv.h b/drivers/media/platform/mediatek/isp/mtk_camsv.h
new file mode 100644
index 0000000000000000000000000000000000000000..de928662c75778ffeae708a7bdac27943af75d94
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAMSV_H__
+#define __MTK_CAMSV_H__
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+#include <soc/mediatek/smi.h>
+
+#define IMG_MAX_WIDTH			5376U
+#define IMG_MAX_HEIGHT			4032U
+#define IMG_MIN_WIDTH			80U
+#define IMG_MIN_HEIGHT			60U
+
+#define MTK_CAM_CIO_PAD_SENINF		0U
+#define MTK_CAM_CIO_PAD_VIDEO		1U
+#define MTK_CAM_CIO_NUM_PADS		2U
+
+struct mtk_cam_format_info {
+	u32 code;
+	u32 fourcc;
+	u8 bpp;
+};
+
+struct mtk_cam_dev_buffer {
+	struct vb2_v4l2_buffer v4l2_buf;
+	struct list_head list;
+	dma_addr_t daddr;
+	void *vaddr;
+};
+
+struct mtk_cam_sparams {
+	u32 w_factor;
+	u32 module_en_pak;
+	u32 fmt_sel;
+	u32 pak;
+	u32 imgo_stride;
+};
+
+/**
+ * struct mtk_cam_vdev_desc - MTK camera device descriptor
+ * @num_fmts: the number of supported node formats
+ * @fmts: supported format
+ * @frmsizes: supported V4L2 frame size number
+ */
+struct mtk_cam_vdev_desc {
+	u8 num_fmts;
+	const u32 *fmts;
+	const struct v4l2_frmsizeenum *frmsizes;
+};
+
+/**
+ * struct mtk_cam_video_device - MediaTek video device structure
+ * @desc: The node description of video device
+ * @vdev_pad: The media pad graph object of video device
+ * @vdev: The video device instance
+ * @vbq: A videobuf queue of video device
+ * @vdev_lock: Serializes vb2 queue and video device operations
+ * @format: The V4L2 format of video device
+ * @fmtinfo: Information about the current format
+ */
+struct mtk_cam_video_device {
+	const struct mtk_cam_vdev_desc *desc;
+
+	struct media_pad vdev_pad;
+	struct video_device vdev;
+	struct vb2_queue vbq;
+
+	/* Serializes vb2 queue and video device operations */
+	struct mutex vdev_lock;
+
+	struct v4l2_pix_format_mplane format;
+	const struct mtk_cam_format_info *fmtinfo;
+};
+
+/**
+ * struct mtk_cam_dev - MediaTek camera device structure.
+ * @dev: Pointer to device.
+ * @regs: Base address of CAMSV.
+ * @regs_img0: Base address of CAMSV IMG0.
+ * @regs_tg: Base address of CAMSV TG.
+ * @num_clks: Number of clocks.
+ * @clks: The clocks.
+ * @irq: Irq fired when buffer is ready.
+ * @conf: soc specific driver data.
+ * @pipeline: Media pipeline information.
+ * @subdev: The V4L2 sub-device instance.
+ * @subdev_pads: Media pads of this sub-device.
+ * @vdev: The video device node.
+ * @seninf: Pointer to the seninf pad.
+ * @stream_count: Number of streaming video nodes.
+ * @sequence: Buffer sequence number.
+ * @op_lock: Serializes driver's VB2 callback operations.
+ * @buf_list_lock: Protects the buffer list.
+ * @buf_list: List head for the buffer list.
+ * @hw_functions: Hardware specific functions.
+ */
+struct mtk_cam_dev {
+	struct device *dev;
+	void __iomem *regs;
+	void __iomem *regs_img0;
+	void __iomem *regs_tg;
+
+	unsigned int num_clks;
+	struct clk_bulk_data *clks;
+	unsigned int irq;
+	const struct mtk_cam_conf *conf;
+
+	struct media_pipeline pipeline;
+	struct v4l2_subdev subdev;
+	struct media_pad subdev_pads[MTK_CAM_CIO_NUM_PADS];
+	struct mtk_cam_video_device vdev;
+	struct media_pad *seninf;
+	unsigned int stream_count;
+	unsigned int sequence;
+
+	struct mutex op_lock;
+	spinlock_t buf_list_lock;
+
+	struct list_head buf_list;
+
+	const struct mtk_cam_hw_functions *hw_functions;
+
+};
+
+/**
+ * struct mtk_cam_conf - MediaTek camera configuration structure
+ * @tg_sen_mode: TG sensor mode
+ * @module_en: module enable
+ * @imgo_con: dma control register
+ * @imgo_con2: dma control register 2
+ */
+struct mtk_cam_conf {
+	u32 tg_sen_mode;
+	u32 module_en;
+	u32 imgo_con;
+	u32 imgo_con2;
+};
+
+struct mtk_cam_hw_functions {
+	void (*mtk_cam_setup)(struct mtk_cam_dev *cam_dev, u32 width,
+			      u32 height, u32 bpl, u32 mbus_fmt);
+	void (*mtk_cam_update_buffers_add)(struct mtk_cam_dev *cam_dev,
+					   struct mtk_cam_dev_buffer *buf);
+	void (*mtk_cam_cmos_vf_hw_enable)(struct mtk_cam_dev *cam_dev);
+	void (*mtk_cam_cmos_vf_hw_disable)(struct mtk_cam_dev *cam_dev);
+	void (*mtk_cam_fbc_init)(struct mtk_cam_dev *cam_dev,
+				 unsigned int num_buffers);
+	void (*mtk_cam_fbc_inc)(struct mtk_cam_dev *cam_dev);
+};
+
+int mtk_cam_dev_init(struct mtk_cam_dev *cam_dev);
+void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam_dev);
+int mtk_cam_video_register(struct mtk_cam_dev *cam_dev);
+void mtk_cam_video_unregister(struct mtk_cam_video_device *vdev);
+
+#endif /* __MTK_CAMSV_H__ */
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv30_hw.c b/drivers/media/platform/mediatek/isp/mtk_camsv30_hw.c
new file mode 100644
index 0000000000000000000000000000000000000000..56c3686770901da9d355f36ee86a9aa7f71aeb1f
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv30_hw.c
@@ -0,0 +1,539 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/ktime.h>
+#include <linux/bits.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "mtk_camsv.h"
+
+/* CAMSV */
+#define CAMSV_MODULE_EN				0x0000
+#define CAMSV_MODULE_EN_IMGO_EN			BIT(4)
+#define CAMSV_FMT_SEL				0x0004
+#define CAMSV_INT_EN				0x0008
+#define CAMSV_INT_STATUS			0x000c
+#define CAMSV_SW_CTL				0x0010
+#define CAMSV_IMGO_FBC				0x001C
+#define CAMSV_CLK_EN				0x0020
+#define CAMSV_PAK				0x003c
+
+/* CAMSV_TG */
+#define CAMSV_TG_SEN_MODE			0x0010
+#define CAMSV_TG_VF_CON				0x0014
+#define CAMSV_TG_SEN_GRAB_PXL			0x0018
+#define CAMSV_TG_SEN_GRAB_LIN			0x001c
+#define CAMSV_TG_PATH_CFG			0x0020
+
+/* CAMSV_IMG0 */
+#define CAMSV_IMGO_SV_BASE_ADDR			0x0000
+#define CAMSV_IMGO_SV_XSIZE			0x0008
+#define CAMSV_IMGO_SV_YSIZE			0x000c
+#define CAMSV_IMGO_SV_STRIDE			0x0010
+#define CAMSV_IMGO_SV_CON			0x0014
+#define CAMSV_IMGO_SV_CON2			0x0018
+
+#define CAMSV_TG_SEN_MODE_CMOS_EN		BIT(0)
+#define CAMSV_TG_VF_CON_VFDATA_EN		BIT(0)
+
+/* CAMSV_CLK_EN bits */
+#define CAMSV_TG_DP_CLK_EN			BIT(0)
+#define CAMSV_PAK_DP_CLK_EN			BIT(2)
+#define CAMSV_DMA_DP_CLK_EN			BIT(15)
+
+/* CAMSV_SW_CTL bits */
+#define CAMSV_IMGO_RST_TRIG			BIT(0)
+#define CAMSV_IMGO_RST_ST			BIT(1)
+#define CAMSV_SW_RST				BIT(2)
+
+/* IRQ BITS */
+#define CAMSV_IRQ_TG_ERR			BIT(4)
+#define CAMSV_IRQ_TG_GBERR			BIT(5)
+#define CAMSV_IRQ_PASS1_DON			BIT(10)
+#define CAMSV_IRQ_IMGO_ERR			BIT(16)
+
+/* FBC bits */
+#define CAMSV_IMGO_FBC_RCNT_INC			BIT(11)
+#define CAMSV_IMGO_FBC_EN			BIT(14)
+#define CAMSV_IMGO_FBC_LOCK_EN			BIT(15)
+#define CAMSV_IMGO_FBC_FB_NUM			GENMASK(19, 16)
+
+#define INT_ST_MASK_CAMSV (CAMSV_IRQ_PASS1_DON)
+
+#define INT_ST_MASK_CAMSV_ERR \
+	(CAMSV_IRQ_TG_ERR | CAMSV_IRQ_TG_GBERR | CAMSV_IRQ_IMGO_ERR)
+
+#define MTK_CAMSV30_AUTOSUSPEND_DELAY_MS 100
+
+static const struct mtk_cam_conf camsv30_conf = {
+	.tg_sen_mode = 0x00010002U, /* TIME_STP_EN = 1. DBL_DATA_BUS = 1 */
+	.module_en = 0x40000001U, /* enable double buffer and TG */
+	.imgo_con = 0x80000080U, /* DMA FIFO depth and burst */
+	.imgo_con2 = 0x00020002U, /* DMA priority */
+};
+
+static void fmt_to_sparams(u32 mbus_fmt, struct mtk_cam_sparams *sparams)
+{
+	switch (mbus_fmt) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		sparams->w_factor = 1;
+		sparams->module_en_pak = 0x4;
+		sparams->fmt_sel = 0x2;
+		sparams->pak = 0x5;
+		sparams->imgo_stride = 0X000b0000;
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		sparams->w_factor = 1;
+		sparams->module_en_pak = 0x4;
+		sparams->fmt_sel = 0x1;
+		sparams->pak = 0x6;
+		sparams->imgo_stride = 0X000b0000;
+		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		sparams->w_factor = 1;
+		sparams->module_en_pak = 0x4;
+		sparams->fmt_sel = 0x0;
+		sparams->pak = 0x7;
+		sparams->imgo_stride = 0X000b0000;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+		sparams->w_factor = 2;
+		sparams->module_en_pak = 0x8;
+		sparams->fmt_sel = 0x1000003;
+		sparams->pak = 0x0;
+		sparams->imgo_stride = 0x00090000;
+		break;
+	default:
+		break;
+	}
+}
+
+static u32 mtk_camsv30_read(struct mtk_cam_dev *priv, u32 reg)
+{
+	return readl(priv->regs + reg);
+}
+
+static void mtk_camsv30_write(struct mtk_cam_dev *priv, u32 reg, u32 value)
+{
+	writel(value, priv->regs + reg);
+}
+
+static void mtk_camsv30_img0_write(struct mtk_cam_dev *priv, u32 reg, u32 value)
+{
+	writel(value, priv->regs_img0 + reg);
+}
+
+static u32 mtk_camsv30_tg_read(struct mtk_cam_dev *priv, u32 reg)
+{
+	return readl(priv->regs_tg + reg);
+}
+
+static void mtk_camsv30_tg_write(struct mtk_cam_dev *priv, u32 reg, u32 value)
+{
+	writel(value, priv->regs_tg + reg);
+}
+
+static void mtk_camsv30_update_buffers_add(struct mtk_cam_dev *cam_dev,
+					   struct mtk_cam_dev_buffer *buf)
+{
+	mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_BASE_ADDR, buf->daddr);
+}
+
+static void mtk_camsv30_cmos_vf_hw_enable(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int fbc_val;
+	u32 clk_en = CAMSV_TG_DP_CLK_EN | CAMSV_DMA_DP_CLK_EN |
+		     CAMSV_PAK_DP_CLK_EN;
+
+	fbc_val = mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val |= CAMSV_IMGO_FBC_EN;
+	mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+
+	mtk_camsv30_write(cam_dev,  CAMSV_CLK_EN, clk_en);
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
+			     mtk_camsv30_tg_read(cam_dev, CAMSV_TG_SEN_MODE) |
+			     CAMSV_TG_SEN_MODE_CMOS_EN);
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_VF_CON,
+			     mtk_camsv30_tg_read(cam_dev, CAMSV_TG_VF_CON) |
+			     CAMSV_TG_VF_CON_VFDATA_EN);
+}
+
+static void mtk_camsv30_cmos_vf_hw_disable(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int fbc_val;
+
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
+			     mtk_camsv30_tg_read(cam_dev, CAMSV_TG_SEN_MODE) &
+			     ~CAMSV_TG_SEN_MODE_CMOS_EN);
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_VF_CON,
+			     mtk_camsv30_tg_read(cam_dev, CAMSV_TG_VF_CON) &
+			     ~CAMSV_TG_VF_CON_VFDATA_EN);
+	fbc_val = mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val &= ~CAMSV_IMGO_FBC_EN;
+	mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+}
+
+static void mtk_camsv30_fbc_init(struct mtk_cam_dev *cam_dev,
+				 unsigned int num_buffers)
+{
+	unsigned int fbc_val;
+
+	if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
+		dev_err(cam_dev->dev, "failed to get pm_runtime\n");
+		return;
+	}
+
+	fbc_val = mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val &= ~CAMSV_IMGO_FBC_FB_NUM;
+	fbc_val |= CAMSV_IMGO_FBC_EN;
+	fbc_val |= FIELD_PREP(CAMSV_IMGO_FBC_FB_NUM, num_buffers);
+	mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+
+	pm_runtime_put_autosuspend(cam_dev->dev);
+}
+
+static void mtk_camsv30_fbc_inc(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int fbc_val;
+
+	if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
+		dev_err(cam_dev->dev, "failed to get pm_runtime\n");
+		return;
+	}
+
+	fbc_val = mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val |= CAMSV_IMGO_FBC_RCNT_INC;
+	mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+	fbc_val &= ~CAMSV_IMGO_FBC_RCNT_INC;
+	mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+
+	pm_runtime_put_autosuspend(cam_dev->dev);
+}
+
+static void mtk_camsv30_setup(struct mtk_cam_dev *cam_dev, u32 w, u32 h,
+			      u32 bpl, u32 mbus_fmt)
+{
+	const struct mtk_cam_conf *conf = cam_dev->conf;
+	u32 tmp;
+	struct mtk_cam_sparams sparams;
+
+	fmt_to_sparams(mbus_fmt, &sparams);
+
+	if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
+		dev_err(cam_dev->dev, "failed to get pm_runtime\n");
+		return;
+	}
+
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_SEN_MODE, conf->tg_sen_mode);
+
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_SEN_GRAB_PXL,
+			     (w * sparams.w_factor) << 16U);
+
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_SEN_GRAB_LIN, h << 16U);
+
+	/* YUV_U2S_DIS: disable YUV sensor unsigned to signed */
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_PATH_CFG, 0x1000U);
+
+	/* Reset cam */
+	mtk_camsv30_write(cam_dev, CAMSV_SW_CTL, CAMSV_SW_RST);
+	mtk_camsv30_write(cam_dev, CAMSV_SW_CTL, 0x0U);
+	mtk_camsv30_write(cam_dev, CAMSV_SW_CTL, CAMSV_IMGO_RST_TRIG);
+
+	readl_poll_timeout_atomic(cam_dev->regs + CAMSV_SW_CTL, tmp,
+				  (tmp == (CAMSV_IMGO_RST_TRIG |
+					   CAMSV_IMGO_RST_ST)), 10, 200);
+
+	mtk_camsv30_write(cam_dev, CAMSV_SW_CTL, 0x0U);
+
+	mtk_camsv30_write(cam_dev, CAMSV_INT_EN, INT_ST_MASK_CAMSV);
+
+	mtk_camsv30_write(cam_dev, CAMSV_MODULE_EN,
+			  conf->module_en | sparams.module_en_pak);
+	mtk_camsv30_write(cam_dev, CAMSV_FMT_SEL, sparams.fmt_sel);
+	mtk_camsv30_write(cam_dev, CAMSV_PAK, sparams.pak);
+
+	mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_XSIZE, bpl - 1U);
+	mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_YSIZE, h - 1U);
+
+	mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_STRIDE,
+			       sparams.imgo_stride | bpl);
+
+	mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_CON, conf->imgo_con);
+	mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_CON2, conf->imgo_con2);
+
+	/* CMOS_EN first */
+	mtk_camsv30_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
+			     mtk_camsv30_tg_read(cam_dev, CAMSV_TG_SEN_MODE) |
+			     CAMSV_TG_SEN_MODE_CMOS_EN);
+
+	/* finally, CAMSV_MODULE_EN : IMGO_EN */
+	mtk_camsv30_write(cam_dev, CAMSV_MODULE_EN,
+			  mtk_camsv30_read(cam_dev, CAMSV_MODULE_EN) |
+			  CAMSV_MODULE_EN_IMGO_EN);
+
+	pm_runtime_put_autosuspend(cam_dev->dev);
+}
+
+static irqreturn_t isp_irq_camsv30(int irq, void *data)
+{
+	struct mtk_cam_dev *cam_dev = (struct mtk_cam_dev *)data;
+	struct mtk_cam_dev_buffer *buf;
+	unsigned int irq_status;
+
+	spin_lock(&cam_dev->buf_list_lock);
+
+	irq_status = mtk_camsv30_read(cam_dev, CAMSV_INT_STATUS);
+
+	if (irq_status & INT_ST_MASK_CAMSV_ERR)
+		dev_err(cam_dev->dev, "irq error 0x%lx\n",
+			irq_status & INT_ST_MASK_CAMSV_ERR);
+
+	/* De-queue frame */
+	if (irq_status & CAMSV_IRQ_PASS1_DON) {
+		cam_dev->sequence++;
+
+		buf = list_first_entry_or_null(&cam_dev->buf_list,
+					       struct mtk_cam_dev_buffer,
+					       list);
+		if (buf) {
+			buf->v4l2_buf.sequence = cam_dev->sequence;
+			buf->v4l2_buf.vb2_buf.timestamp =
+				ktime_get_ns();
+			vb2_buffer_done(&buf->v4l2_buf.vb2_buf,
+					VB2_BUF_STATE_DONE);
+			list_del(&buf->list);
+		}
+
+		buf = list_first_entry_or_null(&cam_dev->buf_list,
+					       struct mtk_cam_dev_buffer,
+					       list);
+		if (buf)
+			mtk_camsv30_update_buffers_add(cam_dev, buf);
+	}
+
+	spin_unlock(&cam_dev->buf_list_lock);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_camsv30_runtime_suspend(struct device *dev)
+{
+	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
+	struct vb2_queue *vbq = &cam_dev->vdev.vbq;
+
+	if (vb2_is_streaming(vbq)) {
+		mutex_lock(&cam_dev->op_lock);
+		v4l2_subdev_disable_streams(&cam_dev->subdev,
+					    cam_dev->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+					    BIT(0));
+		mutex_unlock(&cam_dev->op_lock);
+	}
+
+	clk_bulk_disable_unprepare(cam_dev->num_clks, cam_dev->clks);
+
+	return 0;
+}
+
+static int mtk_camsv30_runtime_resume(struct device *dev)
+{
+	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
+	struct mtk_cam_video_device *vdev = &cam_dev->vdev;
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	struct vb2_queue *vbq = &vdev->vbq;
+	struct mtk_cam_dev_buffer *buf, *buf_prev;
+	int ret;
+	unsigned long flags = 0;
+
+	ret = clk_bulk_prepare_enable(cam_dev->num_clks, cam_dev->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clock:%d\n", ret);
+		return ret;
+	}
+
+	if (vb2_is_streaming(vbq)) {
+		mtk_camsv30_setup(cam_dev, fmt->width, fmt->height,
+				  fmt->plane_fmt[0].bytesperline,
+				  vdev->fmtinfo->code);
+
+		spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
+		buf = list_first_entry_or_null(&cam_dev->buf_list,
+					       struct mtk_cam_dev_buffer,
+					       list);
+		if (buf)
+			mtk_camsv30_update_buffers_add(cam_dev, buf);
+
+		spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
+		mtk_camsv30_cmos_vf_hw_enable(cam_dev);
+
+
+		/* Stream on the sub-device */
+		mutex_lock(&cam_dev->op_lock);
+		ret = v4l2_subdev_enable_streams(&cam_dev->subdev,
+						 cam_dev->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+						 BIT(0));
+
+		if (ret) {
+			cam_dev->stream_count--;
+			if (cam_dev->stream_count == 0)
+				media_pipeline_stop(vdev->vdev.entity.pads);
+		}
+		mutex_unlock(&cam_dev->op_lock);
+
+		if (ret)
+			goto fail_no_stream;
+	}
+
+	return 0;
+
+fail_no_stream:
+	spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
+	list_for_each_entry_safe(buf, buf_prev, &cam_dev->buf_list, list) {
+		buf->daddr = 0ULL;
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->v4l2_buf.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
+	return ret;
+}
+
+static const struct mtk_cam_hw_functions mtk_camsv30_hw_functions = {
+	.mtk_cam_setup = mtk_camsv30_setup,
+	.mtk_cam_update_buffers_add = mtk_camsv30_update_buffers_add,
+	.mtk_cam_cmos_vf_hw_enable = mtk_camsv30_cmos_vf_hw_enable,
+	.mtk_cam_cmos_vf_hw_disable = mtk_camsv30_cmos_vf_hw_disable,
+	.mtk_cam_fbc_init = mtk_camsv30_fbc_init,
+	.mtk_cam_fbc_inc = mtk_camsv30_fbc_inc,
+};
+
+static int mtk_camsv30_probe(struct platform_device *pdev)
+{
+	static const char * const clk_names[] = { "cam", "camtg", "camsv"};
+
+	struct mtk_cam_dev *cam_dev;
+	struct device *dev = &pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!iommu_present(&platform_bus_type))
+		return -EPROBE_DEFER;
+
+	cam_dev = devm_kzalloc(dev, sizeof(*cam_dev), GFP_KERNEL);
+	if (!cam_dev)
+		return -ENOMEM;
+
+	cam_dev->conf = device_get_match_data(dev);
+	if (!cam_dev->conf)
+		return -ENODEV;
+
+	cam_dev->dev = dev;
+	dev_set_drvdata(dev, cam_dev);
+
+	cam_dev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(cam_dev->regs))
+		return dev_err_probe(dev, PTR_ERR(cam_dev->regs),
+				     "failed to map register base\n");
+
+	cam_dev->regs_img0 = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(cam_dev->regs_img0))
+		return dev_err_probe(dev, PTR_ERR(cam_dev->regs_img0),
+				     "failed to map img0 register base\n");
+
+	cam_dev->regs_tg = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(cam_dev->regs_tg))
+		return dev_err_probe(dev, PTR_ERR(cam_dev->regs_tg),
+				     "failed to map TG register base\n");
+
+	cam_dev->num_clks = ARRAY_SIZE(clk_names);
+	cam_dev->clks = devm_kcalloc(dev, cam_dev->num_clks,
+				     sizeof(*cam_dev->clks), GFP_KERNEL);
+	if (!cam_dev->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < cam_dev->num_clks; ++i)
+		cam_dev->clks[i].id = clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, cam_dev->num_clks, cam_dev->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get clocks: %i\n",
+				     ret);
+
+	cam_dev->irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(dev, cam_dev->irq, isp_irq_camsv30, 0,
+			       dev_name(dev), cam_dev);
+	if (ret != 0)
+		return dev_err_probe(dev, -ENODEV, "failed to request irq=%d\n",
+				     cam_dev->irq);
+
+	cam_dev->hw_functions = &mtk_camsv30_hw_functions;
+
+	spin_lock_init(&cam_dev->buf_list_lock);
+
+	/* initialise runtime power management */
+	pm_runtime_set_autosuspend_delay(dev, MTK_CAMSV30_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_suspended(dev);
+	devm_pm_runtime_enable(dev);
+
+	/* Initialize the v4l2 common part */
+	return mtk_cam_dev_init(cam_dev);
+}
+
+static void mtk_camsv30_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
+
+	mtk_cam_dev_cleanup(cam_dev);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static const struct dev_pm_ops mtk_camsv30_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(mtk_camsv30_runtime_suspend,
+			   mtk_camsv30_runtime_resume, NULL)
+};
+
+static const struct of_device_id mtk_camsv30_of_ids[] = {
+	{ .compatible = "mediatek,mt8365-camsv", .data = &camsv30_conf },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_camsv30_of_ids);
+
+static struct platform_driver mtk_camsv30_driver = {
+	.probe = mtk_camsv30_probe,
+	.remove = mtk_camsv30_remove,
+	.driver = {
+		.name = "mtk-camsv-isp30",
+		.of_match_table = mtk_camsv30_of_ids,
+		.pm = &mtk_camsv30_pm_ops,
+	}
+};
+
+module_platform_driver(mtk_camsv30_driver);
+
+MODULE_DESCRIPTION("MediaTek CAMSV ISP3.0 driver");
+MODULE_AUTHOR("Florian Sylvestre <fsylvestre@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv_video.c b/drivers/media/platform/mediatek/isp/mtk_camsv_video.c
new file mode 100644
index 0000000000000000000000000000000000000000..4a5f3431a14563d5ed133270a9907773e8626f9c
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv_video.c
@@ -0,0 +1,701 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mtk_camsv_video.c - V4L2 video node support
+ *
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/version.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mediabus.h>
+
+#include "mtk_camsv.h"
+
+static inline struct mtk_cam_video_device *
+file_to_mtk_cam_video_device(struct file *__file)
+{
+	return container_of(video_devdata(__file),
+			    struct mtk_cam_video_device, vdev);
+}
+
+static inline struct mtk_cam_video_device *
+vb2_queue_to_mtk_cam_video_device(struct vb2_queue *vq)
+{
+	return container_of(vq, struct mtk_cam_video_device, vbq);
+}
+
+static inline struct mtk_cam_dev_buffer *
+to_mtk_cam_dev_buffer(struct vb2_buffer *buf)
+{
+	return container_of(buf, struct mtk_cam_dev_buffer, v4l2_buf.vb2_buf);
+}
+
+/* -----------------------------------------------------------------------------
+ * Format Information
+ */
+
+static const struct mtk_cam_format_info mtk_cam_format_info[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.bpp = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.bpp = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.bpp = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.bpp = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.bpp = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.bpp = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.bpp = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.bpp = 16,
+	},
+};
+
+static const struct mtk_cam_format_info *
+mtk_cam_format_info_by_fourcc(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_format_info); ++i) {
+		const struct mtk_cam_format_info *info =
+			&mtk_cam_format_info[i];
+
+		if (info->fourcc == fourcc)
+			return info;
+	}
+
+	return NULL;
+}
+
+static const struct mtk_cam_format_info *
+mtk_cam_format_info_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_format_info); ++i) {
+		const struct mtk_cam_format_info *info =
+			&mtk_cam_format_info[i];
+
+		if (info->code == code)
+			return info;
+	}
+
+	return NULL;
+}
+
+static bool mtk_cam_dev_find_fmt(const struct mtk_cam_vdev_desc *desc,
+				 u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < desc->num_fmts; i++) {
+		if (desc->fmts[i] == format)
+			return true;
+	}
+
+	return false;
+}
+
+static void calc_bpl_size_pix_mp(const struct mtk_cam_format_info *fmtinfo,
+				 struct v4l2_pix_format_mplane *pix_mp)
+{
+	unsigned int bpl;
+	unsigned int i;
+
+	bpl = ALIGN(DIV_ROUND_UP(pix_mp->width * fmtinfo->bpp, 8), 2);
+
+	for (i = 0; i < pix_mp->num_planes; ++i) {
+		pix_mp->plane_fmt[i].bytesperline = bpl;
+		pix_mp->plane_fmt[i].sizeimage = bpl * pix_mp->height;
+	}
+}
+
+static void mtk_cam_dev_load_default_fmt(struct mtk_cam_dev *cam)
+{
+	struct mtk_cam_video_device *vdev = &cam->vdev;
+	struct v4l2_pix_format_mplane *fmt = &vdev->format;
+
+	fmt->num_planes = 1;
+	fmt->pixelformat = vdev->desc->fmts[0];
+	fmt->width = IMG_MAX_WIDTH;
+	fmt->height = IMG_MAX_HEIGHT;
+
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	vdev->fmtinfo = mtk_cam_format_info_by_fourcc(fmt->pixelformat);
+
+	calc_bpl_size_pix_mp(vdev->fmtinfo, fmt);
+}
+
+/* -----------------------------------------------------------------------------
+ * VB2 Queue Operations
+ */
+
+static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vq);
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	unsigned int size, default_num_planes, i;
+
+	size = fmt->plane_fmt[0].sizeimage;
+
+	default_num_planes = 1;
+
+	if (*num_planes == 0) {
+		*num_planes = default_num_planes;
+		for (i = 0; i < *num_planes; ++i)
+			sizes[i] = size;
+	} else if (*num_planes != default_num_planes || sizes[0] < size) {
+		return -EINVAL;
+	}
+
+	(*cam->hw_functions->mtk_cam_fbc_init)(cam, *num_buffers);
+
+	return 0;
+}
+
+static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vb->vb2_queue);
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_dev_buffer *buf = to_mtk_cam_dev_buffer(vb);
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	u32 size;
+	int i;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		size = fmt->plane_fmt[i].sizeimage;
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(cam->dev, "plane size is too small:%lu<%u\n",
+				vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+	}
+
+	buf->v4l2_buf.field = V4L2_FIELD_NONE;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		size = fmt->plane_fmt[i].sizeimage;
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	if (!buf->daddr)
+		buf->daddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	return 0;
+}
+
+static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_dev_buffer *buf = to_mtk_cam_dev_buffer(vb);
+	unsigned long flags;
+
+	/* Add the buffer into the tracking list */
+	spin_lock_irqsave(&cam->buf_list_lock, flags);
+	if (list_empty(&cam->buf_list))
+		(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, buf);
+
+	list_add_tail(&buf->list, &cam->buf_list);
+	(*cam->hw_functions->mtk_cam_fbc_inc)(cam);
+	spin_unlock_irqrestore(&cam->buf_list_lock, flags);
+}
+
+static void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam,
+					   enum vb2_buffer_state state)
+{
+	struct mtk_cam_dev_buffer *buf, *buf_prev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cam->buf_list_lock, flags);
+	list_for_each_entry_safe(buf, buf_prev, &cam->buf_list, list) {
+		buf->daddr = 0ULL;
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->v4l2_buf.vb2_buf, state);
+	}
+	spin_unlock_irqrestore(&cam->buf_list_lock, flags);
+}
+
+static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
+				   bool enable, bool pak_en)
+{
+	if (enable)
+		cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
+	else
+		cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
+}
+
+static int mtk_cam_verify_format(struct mtk_cam_dev *cam)
+{
+	struct mtk_cam_video_device *vdev = &cam->vdev;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = MTK_CAM_CIO_PAD_VIDEO,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(&cam->subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
+
+	if (vdev->fmtinfo->code != fmt.format.code ||
+	    vdev->format.height != fmt.format.height ||
+	    vdev->format.width != fmt.format.width)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
+				       unsigned int count)
+{
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_dev_buffer *buf;
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vq);
+	struct device *dev = cam->dev;
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	int ret;
+	unsigned long flags;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "failed to get pm_runtime\n");
+		return ret;
+	}
+
+	(*cam->hw_functions->mtk_cam_setup)(cam, fmt->width, fmt->height,
+			fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
+
+	/* Enable CMOS and VF */
+	mtk_cam_cmos_vf_enable(cam, true, true);
+
+	mutex_lock(&cam->op_lock);
+
+	ret = mtk_cam_verify_format(cam);
+	if (ret < 0)
+		goto fail_unlock;
+
+	/* Start streaming of the whole pipeline now*/
+	if (!cam->pipeline.start_count) {
+		ret = media_pipeline_start(vdev->vdev.entity.pads,
+					   &cam->pipeline);
+		if (ret) {
+			dev_err(dev, "failed to start pipeline:%d\n", ret);
+			goto fail_unlock;
+		}
+	}
+
+	/* Media links are fixed after media_pipeline_start */
+	cam->stream_count++;
+
+	cam->sequence = (unsigned int)-1;
+
+	/* Stream on the sub-device */
+	ret = v4l2_subdev_enable_streams(&cam->subdev,
+					 cam->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+					 BIT(0));
+	if (ret)
+		goto fail_no_stream;
+
+	mutex_unlock(&cam->op_lock);
+
+	/* Adding the buffer into the tracking list */
+	spin_lock_irqsave(&cam->buf_list_lock, flags);
+	buf = list_first_entry_or_null(&cam->buf_list,
+				       struct mtk_cam_dev_buffer,
+				       list);
+	if (buf)
+		(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, buf);
+	spin_unlock_irqrestore(&cam->buf_list_lock, flags);
+
+	return 0;
+
+fail_no_stream:
+	cam->stream_count--;
+	if (cam->stream_count == 0)
+		media_pipeline_stop(vdev->vdev.entity.pads);
+fail_unlock:
+	mutex_unlock(&cam->op_lock);
+	mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vq);
+
+	/* Disable CMOS and VF */
+	mtk_cam_cmos_vf_enable(cam, false, false);
+
+	mutex_lock(&cam->op_lock);
+
+	v4l2_subdev_disable_streams(&cam->subdev,
+				    cam->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+				    BIT(0));
+
+	mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_ERROR);
+	cam->stream_count--;
+	if (cam->stream_count) {
+		mutex_unlock(&cam->op_lock);
+		return;
+	}
+
+	mutex_unlock(&cam->op_lock);
+
+	media_pipeline_stop(vdev->vdev.entity.pads);
+}
+
+static const struct vb2_ops mtk_cam_vb2_ops = {
+	.queue_setup = mtk_cam_vb2_queue_setup,
+	.buf_prepare = mtk_cam_vb2_buf_prepare,
+	.buf_queue = mtk_cam_vb2_buf_queue,
+	.start_streaming = mtk_cam_vb2_start_streaming,
+	.stop_streaming = mtk_cam_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Video IOCTLs
+ */
+
+static int mtk_cam_vidioc_querycap(struct file *file, void *fh,
+				   struct v4l2_capability *cap)
+{
+	struct mtk_cam_dev *cam = video_drvdata(file);
+
+	strscpy(cap->driver, dev_driver_string(cam->dev), sizeof(cap->driver));
+	strscpy(cap->card, dev_driver_string(cam->dev), sizeof(cap->card));
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
+				   struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+	const struct mtk_cam_format_info *fmtinfo;
+	unsigned int i;
+
+	/* If mbus_code is not set enumerate all supported formats. */
+	if (!f->mbus_code) {
+		if (f->index >= vdev->desc->num_fmts)
+			return -EINVAL;
+
+		/* f->description is filled in v4l_fill_fmtdesc function */
+		f->pixelformat = vdev->desc->fmts[f->index];
+		f->flags = 0;
+
+		return 0;
+	}
+
+	/*
+	 * Otherwise only enumerate supported pixel formats corresponding to
+	 * that bus code.
+	 */
+	if (f->index)
+		return -EINVAL;
+
+	fmtinfo = mtk_cam_format_info_by_code(f->mbus_code);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	for (i = 0; i < vdev->desc->num_fmts; ++i) {
+		if (vdev->desc->fmts[i] == fmtinfo->fourcc) {
+			f->pixelformat = fmtinfo->fourcc;
+			f->flags = 0;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+
+	f->fmt.pix_mp = vdev->format;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct mtk_cam_format_info *fmtinfo;
+
+	/* Validate pixelformat */
+	if (!mtk_cam_dev_find_fmt(vdev->desc, pix_mp->pixelformat))
+		pix_mp->pixelformat = vdev->desc->fmts[0];
+
+	pix_mp->width = clamp_val(pix_mp->width, IMG_MIN_WIDTH, IMG_MAX_WIDTH);
+	pix_mp->height = clamp_val(pix_mp->height, IMG_MIN_HEIGHT,
+				   IMG_MAX_HEIGHT);
+
+	pix_mp->num_planes = 1;
+
+	fmtinfo = mtk_cam_format_info_by_fourcc(pix_mp->pixelformat);
+	calc_bpl_size_pix_mp(fmtinfo, pix_mp);
+
+	/* Constant format fields */
+	pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
+	pix_mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+	int ret;
+
+	if (vb2_is_busy(vdev->vdev.queue))
+		return -EBUSY;
+
+	ret = mtk_cam_vidioc_try_fmt(file, fh, f);
+	if (ret)
+		return ret;
+
+	/* Configure to video device */
+	vdev->format = f->fmt.pix_mp;
+	vdev->fmtinfo =
+		mtk_cam_format_info_by_fourcc(f->fmt.pix_mp.pixelformat);
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_enum_framesizes(struct file *file, void *priv,
+					  struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+
+	if (sizes->index)
+		return -EINVAL;
+
+	if (!mtk_cam_dev_find_fmt(vdev->desc, sizes->pixel_format))
+		return -EINVAL;
+
+	sizes->type = vdev->desc->frmsizes->type;
+	memcpy(&sizes->stepwise, &vdev->desc->frmsizes->stepwise,
+	       sizeof(sizes->stepwise));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_vidioc_querycap,
+	.vidioc_enum_framesizes = mtk_cam_vidioc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap = mtk_cam_vidioc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_cam_vidioc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_cam_vidioc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_cam_vidioc_try_fmt,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+/* -----------------------------------------------------------------------------
+ * Init & Cleanup
+ */
+
+static const u32 stream_out_fmts[] = {
+	/* The 1st entry is the default image format */
+	V4L2_PIX_FMT_SBGGR8,
+	V4L2_PIX_FMT_SGBRG8,
+	V4L2_PIX_FMT_SGRBG8,
+	V4L2_PIX_FMT_SRGGB8,
+	V4L2_PIX_FMT_UYVY,
+	V4L2_PIX_FMT_VYUY,
+	V4L2_PIX_FMT_YUYV,
+	V4L2_PIX_FMT_YVYU,
+};
+
+static const struct mtk_cam_vdev_desc video_stream = {
+	.fmts = stream_out_fmts,
+	.num_fmts = ARRAY_SIZE(stream_out_fmts),
+	.frmsizes =
+		&(struct v4l2_frmsizeenum){
+			.index = 0,
+			.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+			.stepwise = {
+				.max_width = IMG_MAX_WIDTH,
+				.min_width = IMG_MIN_WIDTH,
+				.max_height = IMG_MAX_HEIGHT,
+				.min_height = IMG_MIN_HEIGHT,
+				.step_height = 1,
+				.step_width = 1,
+			},
+		},
+};
+
+int mtk_cam_video_register(struct mtk_cam_dev *cam)
+{
+	struct device *dev = cam->dev;
+	struct mtk_cam_video_device *cam_vdev = &cam->vdev;
+	struct video_device *vdev = &cam_vdev->vdev;
+	struct vb2_queue *vbq = &cam_vdev->vbq;
+	int ret;
+
+	vb2_dma_contig_set_max_seg_size(cam->dev, DMA_BIT_MASK(32));
+
+	cam_vdev->desc = &video_stream;
+
+	/* Initialize mtk_cam_video_device */
+	mtk_cam_dev_load_default_fmt(cam);
+
+	cam_vdev->vdev_pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize media entities */
+	ret = media_entity_pads_init(&vdev->entity, 1, &cam_vdev->vdev_pad);
+	if (ret) {
+		dev_err(dev, "failed to initialize media pad:%d\n", ret);
+		return ret;
+	}
+	cam_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+
+	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vbq->dev = dev;
+	vbq->ops = &mtk_cam_vb2_ops;
+	vbq->mem_ops = &vb2_dma_contig_memops;
+	vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
+	/*
+	 * TODO: The hardware supports SOF interrupts, switch to a SOF
+	 * timestamp source would give better accuracy, but first requires
+	 * extending the V4L2 API to support it.
+	 */
+	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
+			     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+
+	/* No minimum buffers limitation */
+	vbq->min_queued_buffers = 0;
+	vbq->drv_priv = cam;
+
+	vbq->lock = &cam_vdev->vdev_lock;
+	ret = vb2_queue_init(vbq);
+	if (ret) {
+		dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
+		goto fail_media_clean;
+	}
+
+	/* Initialize vdev */
+	snprintf(vdev->name, sizeof(vdev->name), "%s video stream",
+		 dev_name(dev));
+
+	/* Set cap/type/ioctl_ops of the video device */
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
+			  | V4L2_CAP_IO_MC;
+	vdev->ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops;
+	vdev->fops = &mtk_cam_v4l2_fops;
+	vdev->release = video_device_release_empty;
+	vdev->lock = &cam_vdev->vdev_lock;
+	vdev->v4l2_dev = cam->subdev.v4l2_dev;
+	vdev->queue = &cam_vdev->vbq;
+	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
+	video_set_drvdata(vdev, cam);
+
+	/* Initialize miscellaneous variables */
+	mutex_init(&cam_vdev->vdev_lock);
+	INIT_LIST_HEAD(&cam->buf_list);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(dev, "failed to register vde:%d\n", ret);
+		goto fail_vb2_rel;
+	}
+
+	/* Create link between the video pad and the subdev pad. */
+	ret = media_create_pad_link(&cam->subdev.entity,
+				    MTK_CAM_CIO_PAD_VIDEO,
+				    &vdev->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE
+				    | MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto fail_vdev_ureg;
+
+	return 0;
+
+fail_vdev_ureg:
+	video_unregister_device(vdev);
+fail_vb2_rel:
+	mutex_destroy(&cam_vdev->vdev_lock);
+	vb2_queue_release(vbq);
+fail_media_clean:
+	media_entity_cleanup(&vdev->entity);
+
+	return ret;
+}
+
+void mtk_cam_video_unregister(struct mtk_cam_video_device *vdev)
+{
+	video_unregister_device(&vdev->vdev);
+	vb2_queue_release(&vdev->vbq);
+	media_entity_cleanup(&vdev->vdev.entity);
+	mutex_destroy(&vdev->vdev_lock);
+	vb2_dma_contig_clear_max_seg_size(&vdev->vdev.dev);
+}

-- 
2.47.0


