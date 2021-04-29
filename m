Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBFA36EB5D
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237580AbhD2N3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 09:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhD2N3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 09:29:37 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4F2C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id h15so14707780wre.11
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oy1qNwnuHeibPjIkP+hgeYDcQYApY+KrxCJjPlibiZU=;
        b=ndIOLOxZamBY6rnBB/+RDD3eu5FoeiL7lB7R5jvMjZARt/ZRvjs9SOqX6B6vVN95gk
         /UbxwLgZzCArrTg4Ws0yTOnRGnHTZ/ZeXM69PSg5WpIbczZXZwHwJ04zDffVyBEGe+KP
         k8AkBTpsAxvJ6KOAWym2JLD19Z4g1BGU/eHLVIpHGbZS2qAL2V7hQGvlpfkUMbmyVZVE
         TRswFCB1duxaU8jIDjFEC9PpA6uhc1Mdy6zhjgALlFexGnrX5Of9zU9Nj6wKCX1qQVZh
         UPP3wzFVUTPyH1qzfNPbJkZcBNnbnWdXH1XzcCQpzJo42JPBAEFenKNbfSppGBO/d+ah
         8YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oy1qNwnuHeibPjIkP+hgeYDcQYApY+KrxCJjPlibiZU=;
        b=GX8iIYh2gd9kqYWxqeg0ZtHqDDOKXGpjVDDvgYFSsTiAHciO9GKV/u+90YkmhKanRq
         IfXblDlSegzaNRuw30mkDhmPhQml01P7v115oo4GgpLP37DHbfkLb0mght4UJrd6OvPL
         Cc4OO+4iAQuYAwtcFbc8yf4lo+oOOetqorbHcwEg84UpRyCUHLMMyvHtE/xT5UO0/oLj
         Tj0PU7oVcnQTLuFFED/e8W4ZCv/OyacHsUwW+y9lnjNOiakcv38IYFQT24Zsn+cThRdn
         ctWbBhMFGtHjmZnKFh9+/Ii04wyTayuKcWtQxXm9M7dvUXBeoMQRgi4lK1pHlNrWJzP0
         cRcA==
X-Gm-Message-State: AOAM533TBuiomCPKBvXgptTdCINaVKqUr4VxTmKxezPS0QrDpI5hD8VJ
        GAfajH/e+98iHxu0qgqmCW3pprrFlhxU3p59
X-Google-Smtp-Source: ABdhPJxzWGLhOH/vqgmBsTgU4cAVG4PzZPO+EUT1a96XjUFUjXtjvIjdmY6kykhkqMQMAgfVeE3tVA==
X-Received: by 2002:adf:a316:: with SMTP id c22mr2268642wrb.202.1619702927459;
        Thu, 29 Apr 2021 06:28:47 -0700 (PDT)
Received: from localhost.localdomain (hst-221-38.medicom.bg. [84.238.221.38])
        by smtp.gmail.com with ESMTPSA id n10sm4811462wrw.37.2021.04.29.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 06:28:47 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP 4/4] venus: Add HEIC image encoder
Date:   Thu, 29 Apr 2021 16:28:33 +0300
Message-Id: <20210429132833.2802390-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for HEIC image encoder to Venus driver as a
separate device video node.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |    2 +
 drivers/media/platform/qcom/venus/core.h      |   10 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |   10 +-
 .../media/platform/qcom/venus/hfi_helper.h    |    5 +
 drivers/media/platform/qcom/venus/ienc.c      | 1348 +++++++++++++++++
 drivers/media/platform/qcom/venus/ienc.h      |   14 +
 .../media/platform/qcom/venus/ienc_ctrls.c    |   83 +
 7 files changed, 1471 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/venus/ienc.c
 create mode 100644 drivers/media/platform/qcom/venus/ienc.h
 create mode 100644 drivers/media/platform/qcom/venus/ienc_ctrls.c

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 91ee6be10292..1277e08b73f4 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -9,7 +9,9 @@ venus-core-objs += core.o helpers.o firmware.o \
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
+venus-ienc-objs += ienc.o ienc_ctrls.o
 
 obj-$(CONFIG_VIDEO_QCOM_VENUS) += venus-core.o
 obj-$(CONFIG_VIDEO_QCOM_VENUS) += venus-dec.o
 obj-$(CONFIG_VIDEO_QCOM_VENUS) += venus-enc.o
+obj-$(CONFIG_VIDEO_QCOM_VENUS) += venus-ienc.o
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 6de596b5a9d1..c5919724f18e 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -150,11 +150,13 @@ struct venus_core {
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
+	struct video_device *vdev_ienc;
 	struct v4l2_device v4l2_dev;
 	const struct venus_resources *res;
 	struct device *dev;
 	struct device *dev_dec;
 	struct device *dev_enc;
+	struct device *dev_ienc;
 	unsigned int use_tz;
 	struct video_firmware {
 		struct device *dev;
@@ -261,6 +263,13 @@ struct venc_controls {
 	u32 base_priority_id;
 };
 
+struct ienc_controls {
+	u32 profile;
+	u32 level;
+	u32 image_quality;
+	u32 grid_size;
+};
+
 struct venus_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -370,6 +379,7 @@ struct venus_inst {
 	union {
 		struct vdec_controls dec;
 		struct venc_controls enc;
+		struct ienc_controls ienc;
 	} controls;
 	struct v4l2_fh fh;
 	unsigned int streamon_cap, streamon_out;
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index fb64046d1e35..48232db4e491 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1268,7 +1268,15 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 		cq->frame_quality = in->frame_quality;
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cq);
 		break;
-	} default:
+	}
+	case HFI_PROPERTY_CONFIG_HEIC_GRID_ENABLE: {
+		struct hfi_heic_grid_enable *in = pdata, *grid = prop_data;
+
+		grid->grid_enable = in->grid_enable;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*grid);
+		break;
+	}
+	default:
 		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f367f43c9fb7..3836dedd61b0 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -534,6 +534,7 @@
 #define HFI_PROPERTY_CONFIG_VENC_LTRPERIOD			0x200600c
 #define HFI_PROPERTY_CONFIG_VENC_PERF_MODE			0x200600e
 #define HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY			0x2006014
+#define HFI_PROPERTY_CONFIG_HEIC_GRID_ENABLE			0x2006015
 
 /*
  * HFI_PROPERTY_PARAM_VPE_COMMON_START
@@ -772,6 +773,10 @@ struct hfi_heic_frame_quality {
 	u32 reserved[3];
 };
 
+struct hfi_heic_grid_enable {
+	u32 grid_enable;
+};
+
 struct hfi_quantization {
 	u32 qp_i;
 	u32 qp_p;
diff --git a/drivers/media/platform/qcom/venus/ienc.c b/drivers/media/platform/qcom/venus/ienc.c
new file mode 100644
index 000000000000..a54a3d666233
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/ienc.c
@@ -0,0 +1,1348 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2017 Linaro Ltd.
+ */
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ctrls.h>
+
+#include "hfi_venus_io.h"
+#include "hfi_parser.h"
+#include "core.h"
+#include "helpers.h"
+#include "ienc.h"
+#include "pm_helpers.h"
+
+/*
+ * Three resons to keep MPLANE formats (despite that the number of planes
+ * currently is one):
+ * - the MPLANE formats allow only one plane to be used
+ * - the downstream driver use MPLANE formats too
+ * - future firmware versions could add support for >1 planes
+ */
+static const struct venus_format ienc_formats[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_NV12,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_HEIC,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+};
+
+static const struct venus_format *
+find_format(struct venus_inst *inst, u32 pixfmt, u32 type)
+{
+	const struct venus_format *fmt = ienc_formats;
+	unsigned int size = ARRAY_SIZE(ienc_formats);
+	unsigned int i;
+	u32 check_pixfmt;
+
+	for (i = 0; i < size; i++) {
+		if (fmt[i].pixfmt == pixfmt)
+			break;
+	}
+
+	if (i == size || fmt[i].type != type)
+		return NULL;
+
+	check_pixfmt = fmt[i].pixfmt;
+
+	if (check_pixfmt == V4L2_PIX_FMT_HEIC)
+		check_pixfmt = V4L2_PIX_FMT_HEVC;
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    !venus_helper_check_codec(inst, check_pixfmt))
+		return NULL;
+
+	return &fmt[i];
+}
+
+static const struct venus_format *
+find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
+{
+	const struct venus_format *fmt = ienc_formats;
+	unsigned int size = ARRAY_SIZE(ienc_formats);
+	unsigned int i, k = 0;
+	u32 check_pixfmt;
+
+	if (index > size)
+		return NULL;
+
+	for (i = 0; i < size; i++) {
+		bool valid;
+
+		if (fmt[i].type != type)
+			continue;
+
+		check_pixfmt = fmt[i].pixfmt;
+		if (check_pixfmt == V4L2_PIX_FMT_HEIC)
+			check_pixfmt = V4L2_PIX_FMT_HEVC;
+
+		valid = type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+			venus_helper_check_codec(inst, check_pixfmt);
+		if (k == index && valid)
+			break;
+		if (valid)
+			k++;
+	}
+
+	if (i == size)
+		return NULL;
+
+	return &fmt[i];
+}
+
+static int
+ienc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
+	strscpy(cap->card, "Qualcomm Venus image encoder", sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int ienc_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct venus_inst *inst = to_inst(file);
+	const struct venus_format *fmt;
+
+	fmt = find_format_by_index(inst, f->index, f->type);
+
+	memset(f->reserved, 0, sizeof(f->reserved));
+
+	if (!fmt)
+		return -EINVAL;
+
+	f->pixelformat = fmt->pixfmt;
+
+	return 0;
+}
+
+static const struct venus_format *
+ienc_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct v4l2_plane_pix_format *pfmt = pixmp->plane_fmt;
+	const struct venus_format *fmt;
+	u32 sizeimage;
+
+	memset(pfmt[0].reserved, 0, sizeof(pfmt[0].reserved));
+	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
+
+	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	if (!fmt) {
+		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			pixmp->pixelformat = V4L2_PIX_FMT_HEIC;
+		else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			pixmp->pixelformat = V4L2_PIX_FMT_NV12;
+		else
+			return NULL;
+		fmt = find_format(inst, pixmp->pixelformat, f->type);
+	}
+
+	pixmp->width = clamp(pixmp->width, frame_width_min(inst),
+			     frame_width_max(inst));
+	pixmp->height = clamp(pixmp->height, frame_height_min(inst),
+			      frame_height_max(inst));
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		pixmp->height = ALIGN(pixmp->height, 32);
+
+	pixmp->width = ALIGN(pixmp->width, 2);
+	pixmp->height = ALIGN(pixmp->height, 2);
+
+	if (pixmp->field == V4L2_FIELD_ANY)
+		pixmp->field = V4L2_FIELD_NONE;
+	pixmp->num_planes = fmt->num_planes;
+	pixmp->flags = 0;
+
+	sizeimage = venus_helper_get_framesz(pixmp->pixelformat,
+					     pixmp->width,
+					     pixmp->height);
+	pfmt[0].sizeimage = max(ALIGN(pfmt[0].sizeimage, SZ_4K), sizeimage);
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		pfmt[0].bytesperline = ALIGN(pixmp->width, 128);
+	else
+		pfmt[0].bytesperline = 0;
+
+	return fmt;
+}
+
+static int ienc_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct venus_inst *inst = to_inst(file);
+
+	ienc_try_fmt_common(inst, f);
+
+	return 0;
+}
+
+static int ienc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct venus_inst *inst = to_inst(file);
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct v4l2_pix_format_mplane orig_pixmp;
+	const struct venus_format *fmt;
+	struct v4l2_format format;
+	u32 pixfmt_out = 0, pixfmt_cap = 0;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	orig_pixmp = *pixmp;
+
+	fmt = ienc_try_fmt_common(inst, f);
+	if (!fmt)
+		return -EINVAL;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		pixfmt_out = pixmp->pixelformat;
+		pixfmt_cap = inst->fmt_cap->pixfmt;
+	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		pixfmt_cap = pixmp->pixelformat;
+		pixfmt_out = inst->fmt_out->pixfmt;
+	}
+
+	memset(&format, 0, sizeof(format));
+
+	format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	format.fmt.pix_mp.pixelformat = pixfmt_out;
+	format.fmt.pix_mp.width = orig_pixmp.width;
+	format.fmt.pix_mp.height = orig_pixmp.height;
+	ienc_try_fmt_common(inst, &format);
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		inst->out_width = format.fmt.pix_mp.width;
+		inst->out_height = format.fmt.pix_mp.height;
+		inst->colorspace = pixmp->colorspace;
+		inst->ycbcr_enc = pixmp->ycbcr_enc;
+		inst->quantization = pixmp->quantization;
+		inst->xfer_func = pixmp->xfer_func;
+	}
+
+	memset(&format, 0, sizeof(format));
+
+	format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	format.fmt.pix_mp.pixelformat = pixfmt_cap;
+	format.fmt.pix_mp.width = orig_pixmp.width;
+	format.fmt.pix_mp.height = orig_pixmp.height;
+	ienc_try_fmt_common(inst, &format);
+
+	inst->width = format.fmt.pix_mp.width;
+	inst->height = format.fmt.pix_mp.height;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		inst->fmt_out = fmt;
+	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		inst->fmt_cap = fmt;
+		inst->output_buf_size = pixmp->plane_fmt[0].sizeimage;
+	}
+
+	return 0;
+}
+
+static int ienc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct venus_inst *inst = to_inst(file);
+	const struct venus_format *fmt;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		fmt = inst->fmt_cap;
+	else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		fmt = inst->fmt_out;
+	else
+		return -EINVAL;
+
+	pixmp->pixelformat = fmt->pixfmt;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		pixmp->width = inst->width;
+		pixmp->height = inst->height;
+		pixmp->colorspace = inst->colorspace;
+		pixmp->ycbcr_enc = inst->ycbcr_enc;
+		pixmp->quantization = inst->quantization;
+		pixmp->xfer_func = inst->xfer_func;
+	} else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		pixmp->width = inst->out_width;
+		pixmp->height = inst->out_height;
+	}
+
+	ienc_try_fmt_common(inst, f);
+
+	return 0;
+}
+
+static int
+ienc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct venus_inst *inst = to_inst(file);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.width = inst->out_width;
+		s->r.height = inst->out_height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r.width = inst->width;
+		s->r.height = inst->height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	s->r.top = 0;
+	s->r.left = 0;
+
+	return 0;
+}
+
+static int
+ienc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct venus_inst *inst = to_inst(file);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	if (s->r.width > inst->out_width ||
+	    s->r.height > inst->out_height)
+		return -EINVAL;
+
+	s->r.width = ALIGN(s->r.width, 2);
+	s->r.height = ALIGN(s->r.height, 2);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r.top = 0;
+		s->r.left = 0;
+		inst->width = s->r.width;
+		inst->height = s->r.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ienc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct venus_inst *inst = to_inst(file);
+	struct v4l2_outputparm *out = &a->parm.output;
+	struct v4l2_fract *timeperframe = &out->timeperframe;
+	u64 us_per_frame, fps;
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	memset(out->reserved, 0, sizeof(out->reserved));
+
+	if (!timeperframe->denominator)
+		timeperframe->denominator = inst->timeperframe.denominator;
+	if (!timeperframe->numerator)
+		timeperframe->numerator = inst->timeperframe.numerator;
+
+	out->capability = V4L2_CAP_TIMEPERFRAME;
+
+	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
+	do_div(us_per_frame, timeperframe->denominator);
+
+	if (!us_per_frame)
+		return -EINVAL;
+
+	fps = (u64)USEC_PER_SEC;
+	do_div(fps, us_per_frame);
+
+	inst->timeperframe = *timeperframe;
+	inst->fps = fps;
+
+	return 0;
+}
+
+static int ienc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct venus_inst *inst = to_inst(file);
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	a->parm.output.capability |= V4L2_CAP_TIMEPERFRAME;
+	a->parm.output.timeperframe = inst->timeperframe;
+
+	return 0;
+}
+
+static int ienc_enum_framesizes(struct file *file, void *fh,
+				struct v4l2_frmsizeenum *fsize)
+{
+	struct venus_inst *inst = to_inst(file);
+	const struct venus_format *fmt;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+
+	fmt = find_format(inst, fsize->pixel_format,
+			  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!fmt) {
+		fmt = find_format(inst, fsize->pixel_format,
+				  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!fmt)
+			return -EINVAL;
+	}
+
+	if (fsize->index)
+		return -EINVAL;
+
+	fsize->stepwise.min_width = frame_width_min(inst);
+	fsize->stepwise.max_width = frame_width_max(inst);
+	fsize->stepwise.step_width = frame_width_step(inst);
+	fsize->stepwise.min_height = frame_height_min(inst);
+	fsize->stepwise.max_height = frame_height_max(inst);
+	fsize->stepwise.step_height = frame_height_step(inst);
+
+	return 0;
+}
+
+static int ienc_enum_frameintervals(struct file *file, void *fh,
+				    struct v4l2_frmivalenum *fival)
+{
+	struct venus_inst *inst = to_inst(file);
+	const struct venus_format *fmt;
+	unsigned int framerate_factor = 1;
+
+	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+
+	fmt = find_format(inst, fival->pixel_format,
+			  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!fmt) {
+		fmt = find_format(inst, fival->pixel_format,
+				  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!fmt)
+			return -EINVAL;
+	}
+
+	if (fival->index)
+		return -EINVAL;
+
+	if (!fival->width || !fival->height)
+		return -EINVAL;
+
+	if (fival->width > frame_width_max(inst) ||
+	    fival->width < frame_width_min(inst) ||
+	    fival->height > frame_height_max(inst) ||
+	    fival->height < frame_height_min(inst))
+		return -EINVAL;
+
+	if (IS_V1(inst->core)) {
+		/* framerate is reported in 1/65535 fps unit */
+		framerate_factor = (1 << 16);
+	}
+
+	fival->stepwise.min.numerator = 1;
+	fival->stepwise.min.denominator = frate_max(inst) / framerate_factor;
+	fival->stepwise.max.numerator = 1;
+	fival->stepwise.max.denominator = frate_min(inst) / framerate_factor;
+	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.denominator = frate_max(inst) / framerate_factor;
+
+	return 0;
+}
+
+static int ienc_encoder_cmd(struct file *file, void *fh,
+			    struct v4l2_encoder_cmd *ec)
+{
+	struct venus_inst *inst = to_inst(file);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct hfi_frame_data fdata = {0};
+	int ret = 0;
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&inst->lock);
+
+	if (!vb2_is_streaming(&m2m_ctx->cap_q_ctx.q) ||
+	    !vb2_is_streaming(&m2m_ctx->out_q_ctx.q))
+		goto unlock;
+
+	if (m2m_ctx->is_draining) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP) {
+		if (v4l2_m2m_has_stopped(m2m_ctx)) {
+			ret = 0;
+			goto unlock;
+		}
+
+		m2m_ctx->is_draining = true;
+
+		fdata.buffer_type = HFI_BUFFER_INPUT;
+		fdata.flags |= HFI_BUFFERFLAG_EOS;
+		fdata.device_addr = 0;
+		fdata.clnt_data = (u32)-1;
+
+		ret = hfi_session_process_buf(inst, &fdata);
+		if (ret)
+			goto unlock;
+	}
+
+	if (ec->cmd == V4L2_ENC_CMD_START && v4l2_m2m_has_stopped(m2m_ctx)) {
+		vb2_clear_last_buffer_dequeued(&m2m_ctx->cap_q_ctx.q);
+		inst->m2m_ctx->has_stopped = false;
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
+	}
+
+unlock:
+	mutex_unlock(&inst->lock);
+	return ret;
+}
+
+static const struct v4l2_ioctl_ops ienc_ioctl_ops = {
+	.vidioc_querycap = ienc_querycap,
+	.vidioc_enum_fmt_vid_cap = ienc_enum_fmt,
+	.vidioc_enum_fmt_vid_out = ienc_enum_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = ienc_s_fmt,
+	.vidioc_s_fmt_vid_out_mplane = ienc_s_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = ienc_g_fmt,
+	.vidioc_g_fmt_vid_out_mplane = ienc_g_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = ienc_try_fmt,
+	.vidioc_try_fmt_vid_out_mplane = ienc_try_fmt,
+	.vidioc_g_selection = ienc_g_selection,
+	.vidioc_s_selection = ienc_s_selection,
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+	.vidioc_s_parm = ienc_s_parm,
+	.vidioc_g_parm = ienc_g_parm,
+	.vidioc_enum_framesizes = ienc_enum_framesizes,
+	.vidioc_enum_frameintervals = ienc_enum_frameintervals,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd = ienc_encoder_cmd,
+};
+
+static int ienc_set_properties(struct venus_inst *inst)
+{
+	struct ienc_controls *ctr = &inst->controls.ienc;
+	struct hfi_multi_slice_control mslice;
+	struct hfi_intra_period intra_period;
+	struct hfi_ltr_mode ltr_mode;
+	struct hfi_framerate frate;
+	struct hfi_intra_refresh ir;
+	struct hfi_enable en;
+	u32 ptype, rate_control;
+	u32 profile, level, hier_p;
+	int ret;
+
+	ret = venus_helper_set_work_mode(inst);
+	if (ret)
+		return ret;
+
+	ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
+	frate.buffer_type = HFI_BUFFER_OUTPUT;
+	frate.framerate = inst->fps * (1 << 16);
+
+	ret = hfi_session_set_property(inst, ptype, &frate);
+	if (ret)
+		return ret;
+
+	ptype = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL;
+	rate_control = HFI_RATE_CONTROL_CQ;
+
+	ret = hfi_session_set_property(inst, ptype, &rate_control);
+	if (ret)
+		return ret;
+
+	if (rate_control == HFI_RATE_CONTROL_CQ && ctr->image_quality) {
+		struct hfi_heic_frame_quality quality = {0};
+
+		ptype = HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY;
+		quality.frame_quality = ctr->image_quality;
+
+		ret = hfi_session_set_property(inst, ptype, &quality);
+		if (ret)
+			return ret;
+	}
+
+	if (ctr->grid_size) {
+		struct hfi_heic_grid_enable grid = {};
+
+		ptype = HFI_PROPERTY_CONFIG_HEIC_GRID_ENABLE;
+		grid.grid_enable = 1;
+
+		ret = hfi_session_set_property(inst, ptype, &grid);
+		if (ret)
+			return ret;
+	}
+
+	/* disable multi slice mode aka set single mode */
+	ptype = HFI_PROPERTY_PARAM_VENC_MULTI_SLICE_CONTROL;
+	mslice.multi_slice = HFI_MULTI_SLICE_OFF;
+	mslice.slice_size = 0;
+
+	ret = hfi_session_set_property(inst, ptype, &mslice);
+	if (ret)
+		return ret;
+
+	/* disable LTR */
+	ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
+	ltr_mode.ltr_mode = HFI_LTR_MODE_DISABLE;
+	ltr_mode.ltr_count = 0;
+	ltr_mode.trust_mode = 0;
+
+	ret = hfi_session_set_property(inst, ptype, &ltr_mode);
+	if (ret)
+		return ret;
+
+	/* disable layer encoding */
+	ptype = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER;
+	hier_p = 0;
+
+	ret = hfi_session_set_property(inst, ptype, &hier_p);
+	if (ret)
+		return ret;
+
+	/* disable IR */
+	ptype = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH;
+	ir.mode = HFI_INTRA_REFRESH_NONE;
+	ir.cir_mbs = 0;
+
+	ret = hfi_session_set_property(inst, ptype, &ir);
+	if (ret)
+		return ret;
+
+	/* Reset P & B frames */
+	ptype = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD;
+	intra_period.pframes = 0;
+	intra_period.bframes = 0;
+
+	ret = hfi_session_set_property(inst, ptype, &intra_period);
+	if (ret)
+		return ret;
+
+	switch (inst->hfi_codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		profile = ctr->profile;
+		level = ctr->level;
+		break;
+	default:
+		profile = 0;
+		level = 0;
+		break;
+	}
+
+	ret = venus_helper_set_profile_level(inst, profile, level);
+	if (ret)
+		return ret;
+
+	/* Prepend SPS and PPS with every I/IDR frame */
+	ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
+	en.enable = 1;
+	ret = hfi_session_set_property(inst, ptype, &en);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ienc_init_session(struct venus_inst *inst)
+{
+	struct ienc_controls *ctr = &inst->controls.ienc;
+	u32 width, height;
+	int ret;
+
+	ret = venus_helper_session_init(inst);
+	if (ret == -EALREADY)
+		return 0;
+	else if (ret)
+		return ret;
+
+	ret = venus_helper_set_input_resolution(inst, inst->width,
+						inst->height);
+	if (ret)
+		goto deinit;
+
+	width = inst->width;
+	height = inst->height;
+
+	if (ctr->grid_size) {
+		width = ctr->grid_size;//512;
+		height = ctr->grid_size;//512;
+	}
+
+	ret = venus_helper_set_output_resolution(inst, width, height,
+						 HFI_BUFFER_OUTPUT);
+	if (ret)
+		goto deinit;
+
+	ret = venus_helper_set_color_format(inst, inst->fmt_out->pixfmt);
+	if (ret)
+		goto deinit;
+
+	ret = ienc_set_properties(inst);
+	if (ret)
+		goto deinit;
+
+	return 0;
+deinit:
+	hfi_session_deinit(inst);
+	return ret;
+}
+
+static int ienc_out_num_buffers(struct venus_inst *inst, unsigned int *num)
+{
+	struct hfi_buffer_requirements bufreq;
+	int ret;
+
+	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
+	if (ret)
+		return ret;
+
+	*num = bufreq.count_actual;
+
+	return 0;
+}
+
+static int ienc_queue_setup(struct vb2_queue *q,
+			    unsigned int *num_buffers, unsigned int *num_planes,
+			    unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	unsigned int num, min = 4;
+	int ret;
+
+	if (*num_planes) {
+		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+		    *num_planes != inst->fmt_out->num_planes)
+			return -EINVAL;
+
+		if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+		    *num_planes != inst->fmt_cap->num_planes)
+			return -EINVAL;
+
+		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+		    sizes[0] < inst->input_buf_size)
+			return -EINVAL;
+
+		if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+		    sizes[0] < inst->output_buf_size)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	mutex_lock(&inst->lock);
+	ret = ienc_init_session(inst);
+	mutex_unlock(&inst->lock);
+
+	if (ret)
+		return ret;
+
+	switch (q->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		*num_planes = inst->fmt_out->num_planes;
+
+		ret = ienc_out_num_buffers(inst, &num);
+		if (ret)
+			break;
+
+		num = max(num, min);
+		*num_buffers = max(*num_buffers, num);
+		inst->num_input_bufs = *num_buffers;
+
+		sizes[0] = venus_helper_get_framesz(inst->fmt_out->pixfmt,
+						    inst->width,
+						    inst->height);
+		inst->input_buf_size = sizes[0];
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		*num_planes = inst->fmt_cap->num_planes;
+		*num_buffers = max(*num_buffers, min);
+		inst->num_output_bufs = *num_buffers;
+		sizes[0] = venus_helper_get_framesz(inst->fmt_cap->pixfmt,
+						    inst->width,
+						    inst->height);
+		sizes[0] = max(sizes[0], inst->output_buf_size);
+		inst->output_buf_size = sizes[0];
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int ienc_buf_init(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst->buf_count++;
+
+	return venus_helper_vb2_buf_init(vb);
+}
+
+static void ienc_release_session(struct venus_inst *inst)
+{
+	int ret;
+
+	mutex_lock(&inst->lock);
+
+	ret = hfi_session_deinit(inst);
+	if (ret || inst->session_error)
+		hfi_session_abort(inst);
+
+	mutex_unlock(&inst->lock);
+
+	venus_pm_load_scale(inst);
+	INIT_LIST_HEAD(&inst->registeredbufs);
+	venus_pm_release_core(inst);
+}
+
+static void ienc_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_buffer *buf = to_venus_buffer(vbuf);
+
+	mutex_lock(&inst->lock);
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		if (!list_empty(&inst->registeredbufs))
+			list_del_init(&buf->reg_list);
+	mutex_unlock(&inst->lock);
+
+	inst->buf_count--;
+	if (!inst->buf_count)
+		ienc_release_session(inst);
+}
+
+static int ienc_verify_conf(struct venus_inst *inst)
+{
+	enum hfi_version ver = inst->core->res->hfi_version;
+	struct hfi_buffer_requirements bufreq;
+	int ret;
+
+	if (!inst->num_input_bufs || !inst->num_output_bufs)
+		return -EINVAL;
+
+	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
+	if (ret)
+		return ret;
+
+	if (inst->num_output_bufs < bufreq.count_actual ||
+	    inst->num_output_bufs < HFI_BUFREQ_COUNT_MIN(&bufreq, ver))
+		return -EINVAL;
+
+	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
+	if (ret)
+		return ret;
+
+	if (inst->num_input_bufs < bufreq.count_actual ||
+	    inst->num_input_bufs < HFI_BUFREQ_COUNT_MIN(&bufreq, ver))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ienc_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	int ret;
+
+	mutex_lock(&inst->lock);
+
+	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->streamon_out = 1;
+	else
+		inst->streamon_cap = 1;
+
+	if (inst->streamon_out && inst->streamon_cap &&
+	    inst->state == INST_INIT) {
+		venus_helper_init_instance(inst);
+
+		inst->sequence_cap = 0;
+		inst->sequence_out = 0;
+
+		ret = ienc_init_session(inst);
+		if (ret)
+			goto bufs_done;
+
+		ret = venus_pm_acquire_core(inst);
+		if (ret)
+			goto deinit_sess;
+
+		ret = ienc_set_properties(inst);
+		if (ret)
+			goto deinit_sess;
+
+		ret = ienc_verify_conf(inst);
+		if (ret)
+			goto deinit_sess;
+
+		ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
+						inst->num_output_bufs, 0);
+		if (ret)
+			goto deinit_sess;
+
+		ret = venus_helper_vb2_start_streaming(inst);
+		if (ret)
+			goto deinit_sess;
+
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
+	}  else if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->streamon_cap &&
+		    inst->streamon_out) {
+		ret = venus_helper_vb2_start_streaming(inst);
+		if (ret)
+			goto bufs_done;
+
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
+	}
+
+	mutex_unlock(&inst->lock);
+
+	return 0;
+
+deinit_sess:
+	hfi_session_deinit(inst);
+bufs_done:
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->streamon_out = 0;
+	else
+		inst->streamon_cap = 0;
+	mutex_unlock(&inst->lock);
+	return ret;
+}
+
+static void ienc_stop_streaming(struct vb2_queue *q)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	int ret = -EINVAL;
+
+	mutex_lock(&inst->lock);
+
+	v4l2_m2m_clear_state(m2m_ctx);
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+		ret = hfi_session_stop(inst);
+		ret |= hfi_session_unload_res(inst);
+		ret |= venus_helper_unregister_bufs(inst);
+		ret |= venus_helper_intbufs_free(inst);
+	}
+
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->streamon_out = 0;
+	else
+		inst->streamon_cap = 0;
+
+	mutex_unlock(&inst->lock);
+}
+
+static void ienc_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	mutex_lock(&inst->lock);
+
+	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	if (!(inst->streamon_out && inst->streamon_cap))
+		goto unlock;
+
+	if (v4l2_m2m_has_stopped(m2m_ctx))
+		goto unlock;
+
+	venus_helper_process_buf(vb);
+
+unlock:
+	mutex_unlock(&inst->lock);
+}
+
+static const struct vb2_ops ienc_vb2_ops = {
+	.queue_setup = ienc_queue_setup,
+	.buf_init = ienc_buf_init,
+	.buf_cleanup = ienc_buf_cleanup,
+	.buf_prepare = venus_helper_vb2_buf_prepare,
+	.start_streaming = ienc_start_streaming,
+	.stop_streaming = ienc_stop_streaming,
+	.buf_queue = ienc_vb2_buf_queue,
+};
+
+static void ienc_buf_done(struct venus_inst *inst, unsigned int buf_type,
+			  u32 tag, u32 bytesused, u32 data_offset, u32 flags,
+			  u32 hfi_flags, u64 timestamp_us)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct vb2_buffer *vb;
+	unsigned int type;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	if (buf_type == HFI_BUFFER_INPUT)
+		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	else
+		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+
+	vbuf = venus_helper_find_buf(inst, type, tag);
+	if (!vbuf)
+		return;
+
+	vbuf->flags = flags;
+	vb = &vbuf->vb2_buf;
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		vb = &vbuf->vb2_buf;
+		vb2_set_plane_payload(vb, 0, bytesused + data_offset);
+		vb->planes[0].data_offset = data_offset;
+		vb->timestamp = timestamp_us * NSEC_PER_USEC;
+		vbuf->sequence = inst->sequence_cap++;
+
+		if ((!bytesused && m2m_ctx->is_draining) ||
+		    (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			v4l2_m2m_mark_stopped(inst->m2m_ctx);
+		}
+	} else {
+		vbuf->sequence = inst->sequence_out++;
+	}
+
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+}
+
+static void ienc_event_notify(struct venus_inst *inst, u32 event,
+			      struct hfi_event_data *data)
+{
+	struct device *dev = inst->core->dev_enc;
+
+	if (event == EVT_SESSION_ERROR) {
+		inst->session_error = true;
+		dev_err(dev, "enc: event session error %x\n", inst->error);
+	}
+}
+
+static const struct hfi_inst_ops ienc_hfi_ops = {
+	.buf_done = ienc_buf_done,
+	.event_notify = ienc_event_notify,
+};
+
+static void ienc_m2m_device_run(void *priv)
+{
+}
+
+static const struct v4l2_m2m_ops ienc_m2m_ops = {
+	.device_run = ienc_m2m_device_run,
+	.job_abort = venus_helper_m2m_job_abort,
+};
+
+static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
+			  struct vb2_queue *dst_vq)
+{
+	struct venus_inst *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->ops = &ienc_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->drv_priv = inst;
+	src_vq->buf_struct_size = sizeof(struct venus_buffer);
+	src_vq->allow_zero_bytesused = 1;
+	src_vq->min_buffers_needed = 1;
+	src_vq->dev = inst->core->dev;
+	if (inst->core->res->hfi_version == HFI_VERSION_1XX)
+		src_vq->bidirectional = 1;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->ops = &ienc_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->drv_priv = inst;
+	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
+	dst_vq->allow_zero_bytesused = 1;
+	dst_vq->min_buffers_needed = 1;
+	dst_vq->dev = inst->core->dev;
+	return vb2_queue_init(dst_vq);
+}
+
+static void ienc_inst_init(struct venus_inst *inst)
+{
+	inst->fmt_cap = &ienc_formats[1];
+	inst->fmt_out = &ienc_formats[0];
+	inst->width = 1280;
+	inst->height = ALIGN(720, 32);
+	inst->out_width = 1280;
+	inst->out_height = 720;
+	inst->fps = 1;
+	inst->timeperframe.numerator = 1;
+	inst->timeperframe.denominator = 1;
+	inst->hfi_codec = HFI_VIDEO_CODEC_HEVC;
+}
+
+static int ienc_open(struct file *file)
+{
+	struct venus_core *core = video_drvdata(file);
+	struct venus_inst *inst;
+	int ret;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&inst->dpbbufs);
+	INIT_LIST_HEAD(&inst->registeredbufs);
+	INIT_LIST_HEAD(&inst->internalbufs);
+	INIT_LIST_HEAD(&inst->list);
+	mutex_init(&inst->lock);
+
+	inst->core = core;
+	inst->session_type = VIDC_SESSION_TYPE_ENC;
+	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
+	inst->core_acquired = false;
+
+	venus_helper_init_instance(inst);
+
+	ret = pm_runtime_get_sync(core->dev_enc);
+	if (ret < 0)
+		goto err_put_sync;
+
+	ret = ienc_ctrl_init(inst);
+	if (ret)
+		goto err_put_sync;
+
+	ret = hfi_session_create(inst, &ienc_hfi_ops);
+	if (ret)
+		goto err_ctrl_deinit;
+
+	ienc_inst_init(inst);
+
+	/*
+	 * create m2m device for every instance, the m2m context scheduling
+	 * is made by firmware side so we do not need to care about.
+	 */
+	inst->m2m_dev = v4l2_m2m_init(&ienc_m2m_ops);
+	if (IS_ERR(inst->m2m_dev)) {
+		ret = PTR_ERR(inst->m2m_dev);
+		goto err_session_destroy;
+	}
+
+	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
+	if (IS_ERR(inst->m2m_ctx)) {
+		ret = PTR_ERR(inst->m2m_ctx);
+		goto err_m2m_release;
+	}
+
+	v4l2_fh_init(&inst->fh, core->vdev_ienc);
+
+	inst->fh.ctrl_handler = &inst->ctrl_handler;
+	v4l2_fh_add(&inst->fh);
+	inst->fh.m2m_ctx = inst->m2m_ctx;
+	file->private_data = &inst->fh;
+
+	return 0;
+
+err_m2m_release:
+	v4l2_m2m_release(inst->m2m_dev);
+err_session_destroy:
+	hfi_session_destroy(inst);
+err_ctrl_deinit:
+	ienc_ctrl_deinit(inst);
+err_put_sync:
+	pm_runtime_put_sync(core->dev_enc);
+	kfree(inst);
+	return ret;
+}
+
+static int ienc_close(struct file *file)
+{
+	struct venus_inst *inst = to_inst(file);
+
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+	v4l2_m2m_release(inst->m2m_dev);
+	ienc_ctrl_deinit(inst);
+	hfi_session_destroy(inst);
+	mutex_destroy(&inst->lock);
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
+
+	pm_runtime_put_sync(inst->core->dev_enc);
+
+	kfree(inst);
+	return 0;
+}
+
+static const struct v4l2_file_operations ienc_fops = {
+	.owner = THIS_MODULE,
+	.open = ienc_open,
+	.release = ienc_close,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = v4l2_m2m_fop_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static int ienc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct video_device *vdev;
+	struct venus_core *core;
+	int ret;
+
+	if (!dev->parent)
+		return -EPROBE_DEFER;
+
+	core = dev_get_drvdata(dev->parent);
+	if (!core)
+		return -EPROBE_DEFER;
+
+	if (!IS_V6(core))
+		return -ENODEV;
+
+	platform_set_drvdata(pdev, core);
+
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
+	vdev = video_device_alloc();
+	if (!vdev)
+		return -ENOMEM;
+
+	strscpy(vdev->name, "qcom-venus-image-encoder", sizeof(vdev->name));
+	vdev->release = video_device_release;
+	vdev->fops = &ienc_fops;
+	vdev->ioctl_ops = &ienc_ioctl_ops;
+	vdev->vfl_dir = VFL_DIR_M2M;
+	vdev->v4l2_dev = &core->v4l2_dev;
+	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_vdev_release;
+
+	core->vdev_ienc = vdev;
+	core->dev_ienc = dev;
+
+	video_set_drvdata(vdev, core);
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err_vdev_release:
+	video_device_release(vdev);
+	return ret;
+}
+
+static int ienc_remove(struct platform_device *pdev)
+{
+	struct venus_core *core = dev_get_drvdata(pdev->dev.parent);
+
+	video_unregister_device(core->vdev_ienc);
+	pm_runtime_disable(core->dev_ienc);
+
+	if (core->pm_ops->venc_put)
+		core->pm_ops->venc_put(core->dev_ienc);
+
+	return 0;
+}
+
+static __maybe_unused int ienc_runtime_suspend(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
+
+	if (pm_ops->venc_power)
+		ret = pm_ops->venc_power(dev, POWER_OFF);
+
+	return ret;
+}
+
+static __maybe_unused int ienc_runtime_resume(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
+
+	if (pm_ops->venc_power)
+		ret = pm_ops->venc_power(dev, POWER_ON);
+
+	return ret;
+}
+
+static const struct dev_pm_ops ienc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(ienc_runtime_suspend, ienc_runtime_resume, NULL)
+};
+
+static const struct of_device_id ienc_dt_match[] = {
+	{ .compatible = "venus-image-encoder" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ienc_dt_match);
+
+static struct platform_driver qcom_venus_ienc_driver = {
+	.probe = ienc_probe,
+	.remove = ienc_remove,
+	.driver = {
+		.name = "qcom-venus-image-encoder",
+		.of_match_table = ienc_dt_match,
+		.pm = &ienc_pm_ops,
+	},
+};
+module_platform_driver(qcom_venus_ienc_driver);
+
+MODULE_ALIAS("platform:qcom-venus-image-encoder");
+MODULE_DESCRIPTION("Qualcomm Venus image encoder driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/qcom/venus/ienc.h b/drivers/media/platform/qcom/venus/ienc.h
new file mode 100644
index 000000000000..6d050e0c3b7f
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/ienc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2017 Linaro Ltd.
+ */
+#ifndef __VENUS_VENC_H__
+#define __VENUS_VENC_H__
+
+struct venus_inst;
+
+int ienc_ctrl_init(struct venus_inst *inst);
+void ienc_ctrl_deinit(struct venus_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/venus/ienc_ctrls.c b/drivers/media/platform/qcom/venus/ienc_ctrls.c
new file mode 100644
index 000000000000..e925b20834b0
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/ienc_ctrls.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2017 Linaro Ltd.
+ */
+#include <linux/types.h>
+#include <media/v4l2-ctrls.h>
+
+#include "core.h"
+#include "ienc.h"
+
+static int ienc_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct venus_inst *inst = ctrl_to_inst(ctrl);
+	struct ienc_controls *ctr = &inst->controls.ienc;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		ctr->profile = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		ctr->level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:
+		ctr->image_quality = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEIC_GRID_SIZE:
+		ctr->grid_size = ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ienc_ctrl_ops = {
+	.s_ctrl = ienc_op_s_ctrl,
+};
+
+int ienc_ctrl_init(struct venus_inst *inst)
+{
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 3);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &ienc_ctrl_ops,
+		V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		~(1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &ienc_ctrl_ops,
+		V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+		0, V4L2_MPEG_VIDEO_HEVC_LEVEL_1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &ienc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 80);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &ienc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEIC_GRID_SIZE, 0, 512, 512, 0);
+
+	ret = inst->ctrl_handler.error;
+	if (ret)
+		goto err;
+
+	ret = v4l2_ctrl_handler_setup(&inst->ctrl_handler);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+	return ret;
+}
+
+void ienc_ctrl_deinit(struct venus_inst *inst)
+{
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+}
-- 
2.25.1

