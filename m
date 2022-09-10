Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3055B46F8
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 16:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiIJOlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Sep 2022 10:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiIJOlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Sep 2022 10:41:35 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B020217E0B;
        Sat, 10 Sep 2022 07:41:27 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28A3j2Mm016423;
        Sat, 10 Sep 2022 16:40:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mFilX8UDFVc4fPFyg2OiOoRQEAIPBpyaoo5/rlffKd8=;
 b=NIHZl44JNAsW3Y9Baj+SI9AgyGdwkXopIaRvFKfkL61k4ABRcsDjeha2TqCf2WbnPBHV
 tslEqx1HTron+u+f5sAerHVaC2foZ5eUCTNVnDmHOKJftMy3KqSih6wgjx0ueLxZAd2m
 4YR6NCOO+UY6rDVhQQJYWKgXxdMmC+34Jcn2X33VR/ROaOcrQ3Y5LT/TGdhiVhHjAw9F
 rq1MyQnF8hXn4gTsbjp63hA7DNffxqrLisF8vy2cU7F+2fpwMo2EOWubHlXnJK7m1ppP
 GGOFICS/IMKKUJSKroTkT/bZdBl0OlZlJtAr5UdeLZGb//esgNcODK30YujimH8n2Lds Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnhq4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 10 Sep 2022 16:40:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A284510002A;
        Sat, 10 Sep 2022 16:40:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CA9622D164;
        Sat, 10 Sep 2022 16:40:19 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Sat, 10 Sep
 2022 16:40:19 +0200
From:   Hugues Fruchet <hugues.fruchet@foss.st.com>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>
Subject: [PATCH v1 3/5] media: stm32-dcmipp: STM32 DCMIPP camera interface driver
Date:   Sat, 10 Sep 2022 16:40:08 +0200
Message-ID: <20220910144010.34272-4-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910144010.34272-1-hugues.fruchet@foss.st.com>
References: <20220910144010.34272-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-10_07,2022-09-09_01,2022-06-22_01
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This V4L2 subdev driver enables Digital Camera Memory Interface
Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/st/stm32/Kconfig       |   15 +
 drivers/media/platform/st/stm32/Makefile      |    1 +
 .../platform/st/stm32/stm32-dcmipp/Makefile   |    5 +
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 1112 +++++++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |  790 ++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-common.c     |  116 ++
 .../st/stm32/stm32-dcmipp/dcmipp-common.h     |  240 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-core.c       |  682 ++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c   |  497 ++++++++
 9 files changed, 3458 insertions(+)
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

diff --git a/drivers/media/platform/st/stm32/Kconfig b/drivers/media/platform/st/stm32/Kconfig
index b22dd4753496..fab531866941 100644
--- a/drivers/media/platform/st/stm32/Kconfig
+++ b/drivers/media/platform/st/stm32/Kconfig
@@ -16,6 +16,21 @@ config VIDEO_STM32_DCMI
 	  To compile this driver as a module, choose M here: the module
 	  will be called stm32-dcmi.
 
+config VIDEO_STM32_DCMIPP
+	tristate "STM32 Digital Camera Memory Interface Pixel Processor (DCMIPP) support"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on MEDIA_CONTROLLER
+	depends on ARCH_STM32 || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  This module makes the STM32 Digital Camera Memory Interface
+	  Pixel Processor (DCMIPP) available as a v4l2 device.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called stm32-dcmipp.
+
 # Mem2mem drivers
 config VIDEO_STM32_DMA2D
 	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
diff --git a/drivers/media/platform/st/stm32/Makefile b/drivers/media/platform/st/stm32/Makefile
index 896ef98a73ab..7ed8297b9b19 100644
--- a/drivers/media/platform/st/stm32/Makefile
+++ b/drivers/media/platform/st/stm32/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_VIDEO_STM32_DCMI) += stm32-dcmi.o
+obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp/
 stm32-dma2d-objs := dma2d/dma2d.o dma2d/dma2d-hw.o
 obj-$(CONFIG_VIDEO_STM32_DMA2D) += stm32-dma2d.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
new file mode 100644
index 000000000000..cbddc98141a4
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o
+
+obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
+obj-$(CONFIG_VIDEO_STM32_DCMIPP) += dcmipp-parallel.o dcmipp-byteproc.o dcmipp-bytecap.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
new file mode 100644
index 000000000000..ae7841913000
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -0,0 +1,1112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "dcmipp-common.h"
+
+#define DCMIPP_BYTECAP_DRV_NAME "dcmipp-bytecap"
+
+#define DCMIPP_PRSR (0x1F8)
+#define DCMIPP_CMIER (0x3F0)
+#define DCMIPP_CMIER_P0FRAMEIE BIT(9)
+#define DCMIPP_CMIER_P0VSYNCIE BIT(10)
+#define DCMIPP_CMIER_P0OVRIE BIT(15)
+#define DCMIPP_CMIER_P0ALL (DCMIPP_CMIER_P0VSYNCIE |\
+			    DCMIPP_CMIER_P0FRAMEIE |\
+			    DCMIPP_CMIER_P0OVRIE)
+#define DCMIPP_CMSR1 (0x3F4)
+#define DCMIPP_CMSR2 (0x3F8)
+#define DCMIPP_CMSR2_P0FRAMEF BIT(9)
+#define DCMIPP_CMSR2_P0VSYNCF BIT(10)
+#define DCMIPP_CMSR2_P0OVRF BIT(15)
+#define DCMIPP_CMFCR (0x3FC)
+#define DCMIPP_P0FSCR (0x404)
+#define DCMIPP_P0FSCR_PIPEN BIT(31)
+#define DCMIPP_P0FCTCR (0x500)
+#define DCMIPP_P0FCTCR_CPTREQ BIT(3)
+#define DCMIPP_P0DCCNTR (0x5B0)
+#define DCMIPP_P0DCLMTR (0x5B4)
+#define DCMIPP_P0DCLMTR_ENABLE BIT(31)
+#define DCMIPP_P0DCLMTR_LIMIT_MASK GENMASK(23, 0)
+#define DCMIPP_P0PPM0AR1 (0x5C4)
+#define DCMIPP_P0SR (0x5F8)
+#define DCMIPP_P0SR_CPTACT BIT(23)
+
+struct dcmipp_bytecap_pix_map {
+	unsigned int code;
+	u32 pixelformat;
+};
+
+#define PIXMAP_MBUS_PFMT(mbus, fmt)				\
+		{						\
+			.code = MEDIA_BUS_FMT_##mbus,		\
+			.pixelformat = V4L2_PIX_FMT_##fmt	\
+		}
+
+static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
+	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
+	PIXMAP_MBUS_PFMT(YUYV8_2X8, YUYV),
+	PIXMAP_MBUS_PFMT(YVYU8_2X8, YVYU),
+	PIXMAP_MBUS_PFMT(UYVY8_2X8, UYVY),
+	PIXMAP_MBUS_PFMT(VYUY8_2X8, VYUY),
+	PIXMAP_MBUS_PFMT(Y8_1X8, GREY),
+	PIXMAP_MBUS_PFMT(SBGGR8_1X8, SBGGR8),
+	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
+	PIXMAP_MBUS_PFMT(SGRBG8_1X8, SGRBG8),
+	PIXMAP_MBUS_PFMT(SRGGB8_1X8, SRGGB8),
+	PIXMAP_MBUS_PFMT(JPEG_1X8, JPEG),
+};
+
+static const struct dcmipp_bytecap_pix_map *dcmipp_bytecap_pix_map_by_pixelformat
+						(u32 pixelformat)
+{
+	const struct dcmipp_bytecap_pix_map *l = dcmipp_bytecap_pix_map_list;
+	unsigned int size = ARRAY_SIZE(dcmipp_bytecap_pix_map_list);
+	unsigned int i;
+
+	for (i = 0; i < size; i++) {
+		if (l[i].pixelformat == pixelformat)
+			return &l[i];
+	}
+
+	return NULL;
+}
+
+static const struct dcmipp_bytecap_pix_map *dcmipp_bytecap_pix_map_by_index(unsigned int i)
+{
+	const struct dcmipp_bytecap_pix_map *l = dcmipp_bytecap_pix_map_list;
+	unsigned int size = ARRAY_SIZE(dcmipp_bytecap_pix_map_list);
+
+	if (i >= size)
+		return NULL;
+
+	return &l[i];
+}
+
+struct dcmipp_buf {
+	struct vb2_v4l2_buffer	vb;
+	bool			prepared;
+	dma_addr_t		paddr;
+	size_t			size;
+	struct list_head	list;
+};
+
+enum state {
+	STOPPED = 0,
+	WAIT_FOR_BUFFER,
+	RUNNING,
+};
+
+struct dcmipp_bytecap_device {
+	struct dcmipp_ent_device ved;
+	struct video_device vdev;
+	struct device *dev;
+	struct device *cdev;
+	struct v4l2_pix_format format;
+	struct vb2_queue queue;
+	struct list_head buffers;
+	/* Protects the access of variables shared within the interrupt */
+	spinlock_t irqlock;
+	/* Protect this data structure */
+	struct mutex lock;
+	u32 sequence;
+	struct media_pipeline pipe;
+
+	enum state state;
+
+	/*
+	 * DCMIPP driver is handling 2 buffers
+	 * active: buffer into which DCMIPP is currently writing into
+	 * next: buffer given to the DCMIPP and which will become
+	 *       automatically active on next VSYNC
+	 */
+	struct dcmipp_buf *active, *next;
+
+	void __iomem *regs;
+	struct reset_control *rstc;
+
+	u32 cmier;
+	u32 cmsr2;
+
+	int errors_count;
+	int limit_count;
+	int overrun_count;
+	int buffers_count;
+	int vsync_count;
+	int frame_count;
+	int it_count;
+	int underrun_count;
+	int nactive_count;
+};
+
+static const struct v4l2_pix_format fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.pixelformat = V4L2_PIX_FMT_RGB565,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static inline int frame_size(u32 width, u32 height, u32 format)
+{
+	switch (format) {
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_GREY:
+		return (width * height);
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		return (width * height * 2);
+	case V4L2_PIX_FMT_JPEG:
+		return (width * height);
+	default:
+		return 0;
+	}
+}
+
+static inline int frame_stride(u32 width, u32 format)
+{
+	switch (format) {
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_GREY:
+	case V4L2_PIX_FMT_JPEG:
+		return width;
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		return (width * 2);
+	default:
+		return 0;
+	}
+}
+
+static inline int hdw_pixel_alignment(u32 format)
+{
+	/* 16 bytes alignment required by hardware */
+	switch (format) {
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_GREY:
+	case V4L2_PIX_FMT_JPEG:
+		return 4;/* 2^4 = 16 pixels = 16 bytes */
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		return 3;/* 2^3  = 8 pixels = 16 bytes */
+	default:
+		return 0;
+	}
+}
+
+static int dcmipp_bytecap_querycap(struct file *file, void *priv,
+				   struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, DCMIPP_PDEV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", DCMIPP_PDEV_NAME);
+
+	return 0;
+}
+
+static void dcmipp_bytecap_get_format(struct dcmipp_ent_device *ved,
+				      struct v4l2_pix_format *fmt)
+{
+	struct dcmipp_bytecap_device *vcap = container_of(ved, struct dcmipp_bytecap_device,
+						    ved);
+
+	*fmt = vcap->format;
+}
+
+static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+
+	f->fmt.pix = vcap->format;
+
+	return 0;
+}
+
+static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
+					  struct v4l2_format *f)
+{
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct v4l2_pix_format *format = &f->fmt.pix;
+	const struct dcmipp_bytecap_pix_map *vpix;
+	u32 in_w, in_h;
+
+	/* Don't accept a pixelformat that is not on the table */
+	vpix = dcmipp_bytecap_pix_map_by_pixelformat(format->pixelformat);
+	if (!vpix)
+		format->pixelformat = fmt_default.pixelformat;
+
+	/* Adjust width & height */
+	in_w = format->width;
+	in_h = format->height;
+	v4l_bound_align_image(&format->width,
+			      DCMIPP_FRAME_MIN_WIDTH, DCMIPP_FRAME_MAX_WIDTH,
+			      hdw_pixel_alignment(format->pixelformat),
+			      &format->height,
+			      DCMIPP_FRAME_MIN_HEIGHT, DCMIPP_FRAME_MAX_HEIGHT,
+			      hdw_pixel_alignment(format->pixelformat),
+			      0);
+	if (format->width != in_w || format->height != in_h)
+		dev_dbg(vcap->dev,
+			"resolution updated: %dx%d -> %dx%d\n",
+			in_w, in_h, format->width, format->height);
+
+	format->bytesperline = frame_stride(format->width, format->pixelformat);
+	format->sizeimage = frame_size(format->width, format->height, format->pixelformat);
+
+	if (format->field == V4L2_FIELD_ANY)
+		format->field = fmt_default.field;
+
+	dcmipp_colorimetry_clamp(format);
+
+	return 0;
+}
+
+static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	int ret;
+
+	/* Do not change the format while stream is on */
+	if (vb2_is_busy(&vcap->queue))
+		return -EBUSY;
+
+	ret = dcmipp_bytecap_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	dev_dbg(vcap->dev, "%s: format update: old:%dx%d (0x%x, %d, %d, %d, %d) new:%dx%d (0x%x, %d, %d, %d, %d)\n",
+		vcap->vdev.name,
+		/* old */
+		vcap->format.width, vcap->format.height,
+		vcap->format.pixelformat, vcap->format.colorspace,
+		vcap->format.quantization, vcap->format.xfer_func,
+		vcap->format.ycbcr_enc,
+		/* new */
+		f->fmt.pix.width, f->fmt.pix.height,
+		f->fmt.pix.pixelformat, f->fmt.pix.colorspace,
+		f->fmt.pix.quantization, f->fmt.pix.xfer_func,
+		f->fmt.pix.ycbcr_enc);
+
+	vcap->format = f->fmt.pix;
+
+	return 0;
+}
+
+static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
+					   struct v4l2_fmtdesc *f)
+{
+	const struct dcmipp_bytecap_pix_map *vpix = dcmipp_bytecap_pix_map_by_index(f->index);
+
+	if (!vpix)
+		return -EINVAL;
+
+	f->pixelformat = vpix->pixelformat;
+
+	return 0;
+}
+
+static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
+					  struct v4l2_frmsizeenum *fsize)
+{
+	const struct dcmipp_bytecap_pix_map *vpix;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_bytecap_pix_map_by_pixelformat(fsize->pixel_format);
+	if (!vpix)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fsize->stepwise.max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fsize->stepwise.min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fsize->stepwise.max_height = DCMIPP_FRAME_MAX_HEIGHT;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+/* TODO - based on the explanation text, should also use v4l2_pipeline_link_notify */
+static int dcmipp_bytecap_open(struct file *file)
+{
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	int ret;
+
+	ret = mutex_lock_interruptible(&vcap->lock);
+	if (ret)
+		return ret;
+
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto err_unlock;
+
+	ret = v4l2_pipeline_pm_get(&vcap->vdev.entity);
+	if (ret)
+		goto err_close;
+
+	mutex_unlock(&vcap->lock);
+
+	return 0;
+
+err_close:
+	v4l2_fh_release(file);
+err_unlock:
+	mutex_unlock(&vcap->lock);
+
+	return ret;
+}
+
+static int dcmipp_bytecap_close(struct file *file)
+{
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+
+	vb2_fop_release(file);
+
+	v4l2_pipeline_pm_put(&vcap->vdev.entity);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations dcmipp_bytecap_fops = {
+	.owner		= THIS_MODULE,
+	.open		= dcmipp_bytecap_open,
+	.release	= dcmipp_bytecap_close,
+	.read           = vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = vb2_fop_mmap,
+};
+
+static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
+	.vidioc_querycap = dcmipp_bytecap_querycap,
+
+	.vidioc_g_fmt_vid_cap = dcmipp_bytecap_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = dcmipp_bytecap_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = dcmipp_bytecap_try_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap = dcmipp_bytecap_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes = dcmipp_bytecap_enum_framesizes,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+};
+
+static int dcmipp_pipeline_s_stream(struct dcmipp_bytecap_device *vcap,
+				    int state)
+{
+	struct media_entity *entity = &vcap->vdev.entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret;
+
+	/* Start/stop all entities within pipeline */
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, state);
+		if (ret < 0 && ret != -ENOIOCTLCMD) {
+			dev_err(vcap->dev, "%s: \"%s\" failed to %s streaming (%d)\n",
+				__func__, subdev->name,
+				state ? "start" : "stop", ret);
+
+			if (!state)
+				v4l2_subdev_call(subdev, core, s_power, state);
+
+			return ret;
+		}
+
+		dev_dbg(vcap->dev, "\"%s\" is %s\n",
+			subdev->name, state ? "started" : "stopped");
+	}
+
+	return 0;
+}
+
+static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
+				 struct dcmipp_buf *buf)
+{
+	/* Set buffer address */
+	reg_write(vcap, DCMIPP_P0PPM0AR1, buf->paddr);
+	dev_dbg(vcap->dev, "Write [%d] %p phy=%pad\n", buf->vb.vb2_buf.index, buf, &buf->paddr);
+
+	/* Set buffer size */
+	reg_write(vcap, DCMIPP_P0DCLMTR, DCMIPP_P0DCLMTR_ENABLE |
+		  ((buf->size / 4) & DCMIPP_P0DCLMTR_LIMIT_MASK));
+
+	/* Capture request */
+	reg_set(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+}
+
+static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
+					  unsigned int count)
+{
+	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct media_entity *entity = &vcap->vdev.entity;
+	struct dcmipp_buf *buf, *node;
+	int ret;
+
+	vcap->sequence = 0;
+	vcap->errors_count = 0;
+	vcap->limit_count = 0;
+	vcap->overrun_count = 0;
+	vcap->buffers_count = 0;
+	vcap->vsync_count = 0;
+	vcap->frame_count = 0;
+	vcap->it_count = 0;
+	vcap->underrun_count = 0;
+	vcap->nactive_count = 0;
+
+	ret = pm_runtime_get_sync(vcap->cdev);
+	if (ret < 0) {
+		dev_err(vcap->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
+			__func__, ret);
+		goto err_pm_put;
+	}
+
+	/* Start the media pipeline */
+	ret = media_pipeline_start(entity, &vcap->pipe);
+	if (ret) {
+		dev_err(vcap->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
+			__func__, ret);
+		goto err_pm_put;
+	}
+
+	/* Start all the elements within pipeline */
+	ret = dcmipp_pipeline_s_stream(vcap, 1);
+	if (ret)
+		goto err_media_pipeline_stop;
+
+	spin_lock_irq(&vcap->irqlock);
+
+	/* Enable pipe at the end of programming */
+	reg_set(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
+
+	/*
+	 * Start capture if at least one buffer has been queued,
+	 * otherwise start is deferred at next buffer queueing
+	 */
+	buf = list_first_entry_or_null(&vcap->buffers, typeof(*buf), list);
+	if (!buf) {
+		dev_dbg(vcap->dev, "Start streaming is deferred to next buffer queueing\n");
+		vcap->next = NULL;
+		vcap->state = WAIT_FOR_BUFFER;
+		spin_unlock_irq(&vcap->irqlock);
+		return 0;
+	}
+	vcap->next = buf;
+	dev_dbg(vcap->dev, "Start with next [%d] %p phy=%pad\n",
+		buf->vb.vb2_buf.index, buf, &buf->paddr);
+
+	/* Start capture */
+	dcmipp_start_capture(vcap, buf);
+
+	/* Enable interruptions */
+	vcap->cmier |= DCMIPP_CMIER_P0ALL;
+	reg_set(vcap, DCMIPP_CMIER, vcap->cmier);
+
+	vcap->state = RUNNING;
+
+	spin_unlock_irq(&vcap->irqlock);
+
+	return 0;
+
+err_media_pipeline_stop:
+	media_pipeline_stop(entity);
+err_pm_put:
+	pm_runtime_put(vcap->cdev);
+	spin_lock_irq(&vcap->irqlock);
+	/*
+	 * Return all buffers to vb2 in QUEUED state.
+	 * This will give ownership back to userspace
+	 */
+	list_for_each_entry_safe(buf, node, &vcap->buffers, list) {
+		list_del_init(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	vcap->active = NULL;
+	spin_unlock_irq(&vcap->irqlock);
+
+	return ret;
+}
+
+static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
+{
+	struct device *dev = vcap->dev;
+
+	dev_dbg(dev, "[DCMIPP_PRSR]  =%#10.8x\n", reg_read(vcap, DCMIPP_PRSR));
+	dev_dbg(dev, "[DCMIPP_P0SR] =%#10.8x\n", reg_read(vcap, DCMIPP_P0SR));
+	dev_dbg(dev, "[DCMIPP_P0DCCNTR]=%#10.8x\n",
+		reg_read(vcap, DCMIPP_P0DCCNTR));
+	dev_dbg(dev, "[DCMIPP_CMSR1] =%#10.8x\n", reg_read(vcap, DCMIPP_CMSR1));
+	dev_dbg(dev, "[DCMIPP_CMSR2] =%#10.8x\n", reg_read(vcap, DCMIPP_CMSR2));
+}
+
+/*
+ * Stop the stream engine. Any remaining buffers in the stream queue are
+ * dequeued and passed on to the vb2 framework marked as STATE_ERROR.
+ */
+static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
+{
+	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_buf *buf, *node;
+	int ret;
+	u32 status;
+
+	dcmipp_pipeline_s_stream(vcap, 0);
+
+	/* Stop the media pipeline */
+	media_pipeline_stop(&vcap->vdev.entity);
+
+	/* Disable interruptions */
+	reg_clear(vcap, DCMIPP_CMIER, vcap->cmier);
+
+	/* Stop capture */
+	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+
+	/* Wait until CPTACT become 0 */
+	ret = readl_relaxed_poll_timeout(vcap->regs + DCMIPP_P0SR,
+					 status,
+					 !(status & DCMIPP_P0SR_CPTACT),
+					 20, 1000);
+	if (ret)
+		dev_warn(vcap->dev, "Timeout when stopping\n");
+
+	/* Disable pipe */
+	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
+
+	spin_lock_irq(&vcap->irqlock);
+
+	/* Return all queued buffers to vb2 in ERROR state */
+	list_for_each_entry_safe(buf, node, &vcap->buffers, list) {
+		list_del_init(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	INIT_LIST_HEAD(&vcap->buffers);
+
+	vcap->active = NULL;
+	vcap->state = STOPPED;
+
+	dcmipp_dump_status(vcap);
+
+	spin_unlock_irq(&vcap->irqlock);
+
+	pm_runtime_put(vcap->cdev);
+
+	if (ret) {
+		/* Reset IP on timeout */
+		if (reset_control_assert(vcap->rstc))
+			dev_warn(vcap->dev, "Failed to assert the reset line\n");
+
+		usleep_range(3000, 5000);
+
+		if (reset_control_deassert(vcap->rstc))
+			dev_warn(vcap->dev, "Failed to deassert the reset line\n");
+	}
+
+	if (vcap->errors_count)
+		dev_warn(vcap->dev, "Some errors found while streaming: errors=%d (overrun=%d, limit=%d, nactive=%d), underrun=%d, buffers=%d\n",
+			 vcap->errors_count, vcap->overrun_count, vcap->limit_count,
+			 vcap->nactive_count, vcap->underrun_count, vcap->buffers_count);
+	dev_dbg(vcap->dev, "Stop streaming, errors=%d (overrun=%d, limit=%d, nactive=%d), underrun=%d, vsync=%d, frame=%d, buffers=%d, it=%d\n",
+		vcap->errors_count, vcap->overrun_count, vcap->limit_count,
+		vcap->nactive_count, vcap->underrun_count, vcap->vsync_count,
+		vcap->frame_count, vcap->buffers_count, vcap->it_count);
+}
+
+static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
+{
+	struct dcmipp_bytecap_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
+	unsigned long size;
+
+	size = vcap->format.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(vcap->dev, "%s data will not fit into plane (%lu < %lu)\n",
+			__func__, vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+
+	if (!buf->prepared) {
+		/* Get memory addresses */
+		buf->paddr =
+			vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		buf->size = vb2_plane_size(&buf->vb.vb2_buf, 0);
+		buf->prepared = true;
+
+		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
+
+		dev_dbg(vcap->dev, "Setup [%d] phy=%pad size=%zu\n",
+			vb->index, &buf->paddr, buf->size);
+	}
+
+	return 0;
+}
+
+static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
+{
+	struct dcmipp_bytecap_device *vcap =
+		vb2_get_drv_priv(vb2_buf->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2_buf);
+	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
+
+	spin_lock_irq(&vcap->irqlock);
+	list_add_tail(&buf->list, &vcap->buffers);
+
+	dev_dbg(vcap->dev, "Queue [%d] %p phy=%pad\n", buf->vb.vb2_buf.index, buf, &buf->paddr);
+
+	if (vcap->state == WAIT_FOR_BUFFER) {
+		vcap->next = buf;
+		dev_dbg(vcap->dev, "Restart with next [%d] %p phy=%pad\n",
+			buf->vb.vb2_buf.index, buf, &buf->paddr);
+
+		dcmipp_start_capture(vcap, buf);
+
+		vcap->state = RUNNING;
+
+		spin_unlock_irq(&vcap->irqlock);
+
+		return;
+	}
+
+	spin_unlock_irq(&vcap->irqlock);
+}
+
+static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
+				      unsigned int *nbuffers,
+				      unsigned int *nplanes,
+				      unsigned int sizes[],
+				      struct device *alloc_devs[])
+{
+	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	unsigned int size;
+
+	size = vcap->format.sizeimage;
+
+	/* Make sure the image size is large enough */
+	if (*nplanes)
+		return sizes[0] < vcap->format.sizeimage ? -EINVAL : 0;
+
+	*nplanes = 1;
+	sizes[0] = vcap->format.sizeimage;
+
+	dev_dbg(vcap->dev, "Setup queue, count=%d, size=%d\n",
+		*nbuffers, size);
+
+	return 0;
+}
+
+static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
+
+	INIT_LIST_HEAD(&buf->list);
+
+	return 0;
+}
+
+static const struct vb2_ops dcmipp_bytecap_qops = {
+	.start_streaming	= dcmipp_bytecap_start_streaming,
+	.stop_streaming		= dcmipp_bytecap_stop_streaming,
+	.buf_init		= dcmipp_bytecap_buf_init,
+	.buf_prepare		= dcmipp_bytecap_buf_prepare,
+	.buf_queue		= dcmipp_bytecap_buf_queue,
+	.queue_setup		= dcmipp_bytecap_queue_setup,
+	/*
+	 * Since q->lock is set we can use the standard
+	 * vb2_ops_wait_prepare/finish helper functions.
+	 */
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+static const struct media_entity_operations dcmipp_bytecap_mops = {
+	.link_validate		= dcmipp_link_validate,
+};
+
+static void dcmipp_bytecap_release(struct video_device *vdev)
+{
+	struct dcmipp_bytecap_device *vcap =
+		container_of(vdev, struct dcmipp_bytecap_device, vdev);
+
+	dcmipp_pads_cleanup(vcap->ved.pads);
+	kfree(vcap);
+}
+
+static void dcmipp_bytecap_comp_unbind(struct device *comp,
+				       struct device *master,
+				       void *master_data)
+{
+	struct dcmipp_ent_device *ved = dev_get_drvdata(comp);
+	struct dcmipp_bytecap_device *vcap =
+		container_of(ved, struct dcmipp_bytecap_device, ved);
+
+	media_entity_cleanup(ved->ent);
+	vb2_video_unregister_device(&vcap->vdev);
+}
+
+static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
+			       struct dcmipp_buf *buf,
+			       size_t bytesused,
+			       int err)
+{
+	struct vb2_v4l2_buffer *vbuf;
+
+	list_del_init(&buf->list);
+
+	vbuf = &buf->vb;
+
+	vbuf->sequence = vcap->sequence++;
+	vbuf->field = V4L2_FIELD_NONE;
+	vbuf->vb2_buf.timestamp = ktime_get_ns();
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, bytesused);
+	vb2_buffer_done(&vbuf->vb2_buf,
+			err ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+	dev_dbg(vcap->dev, "Done  [%d] %p phy=%pad\n", buf->vb.vb2_buf.index, buf, &buf->paddr);
+	vcap->buffers_count++;
+}
+
+/* irqlock must be held */
+static void dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
+{
+	if (!vcap->next && list_is_singular(&vcap->buffers)) {
+		/*
+		 * If there is no available buffer (none or a single one in the list while two
+		 * are expected), stop the capture (effective for next frame). On-going frame
+		 * capture will continue till FRAME END but no further capture will be done.
+		 */
+		reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+
+		dev_dbg(vcap->dev, "Capture restart is deferred to next buffer queueing\n");
+		vcap->next = NULL;
+		vcap->state = WAIT_FOR_BUFFER;
+		return;
+	}
+
+	/* If we don't have buffer yet, pick the one after active */
+	if (!vcap->next)
+		vcap->next = list_next_entry(vcap->active, list);
+
+	/*
+	 * Set buffer address
+	 * This register is shadowed and will be taken into
+	 * account on next VSYNC (start of next frame)
+	 */
+	reg_write(vcap, DCMIPP_P0PPM0AR1, vcap->next->paddr);
+	dev_dbg(vcap->dev, "Write [%d] %p phy=%pad\n",
+		vcap->next->vb.vb2_buf.index, vcap->next, &vcap->next->paddr);
+}
+
+/* irqlock must be held */
+static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
+					 size_t bytesused)
+{
+	int err = 0;
+	struct dcmipp_buf *buf = vcap->active;
+
+	if (!buf) {
+		vcap->nactive_count++;
+		vcap->errors_count++;
+		return;
+	}
+
+	if (bytesused > buf->size) {
+		dev_dbg(vcap->dev, "frame larger than expected (%zu > %zu)\n",
+			bytesused, buf->size);
+		/* Clip to buffer size and return buffer to V4L2 in error */
+		bytesused = buf->size;
+		vcap->limit_count++;
+		vcap->errors_count++;
+		err = -EOVERFLOW;
+	}
+
+	dcmipp_buffer_done(vcap, buf, bytesused, err);
+	vcap->active = NULL;
+}
+
+static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
+{
+	struct dcmipp_bytecap_device *vcap =
+			container_of(arg, struct dcmipp_bytecap_device, ved);
+	size_t bytesused = 0;
+	u32 cmsr2;
+
+	spin_lock_irq(&vcap->irqlock);
+
+	cmsr2 = vcap->cmsr2 & vcap->cmier;
+
+	/*
+	 * If we have an overrun, a frame-end will probably not be generated, in that
+	 * case the active buffer will be recycled as next buffer by the VSYNC handler
+	 */
+	if (cmsr2 & DCMIPP_CMSR2_P0OVRF) {
+		vcap->errors_count++;
+		vcap->overrun_count++;
+	}
+
+	if (cmsr2 & DCMIPP_CMSR2_P0FRAMEF) {
+		vcap->frame_count++;
+
+		/* Read captured buffer size */
+		bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
+		dcmipp_bytecap_process_frame(vcap, bytesused);
+	}
+
+	if (cmsr2 & DCMIPP_CMSR2_P0VSYNCF) {
+		vcap->vsync_count++;
+		if (vcap->state == WAIT_FOR_BUFFER) {
+			vcap->underrun_count++;
+			goto out;
+		}
+
+		/*
+		 * On VSYNC, the previously set next buffer is going to become active thanks to
+		 * the shadowing mechanism of the DCMIPP. In most of the cases, since a FRAMEEND
+		 * has already come, pointer next is NULL since active is reset during the
+		 * FRAMEEND handling. However, in case of framerate adjustment, there are more
+		 * VSYNC than FRAMEEND. Thus we recycle the active (but not used) buffer and put it
+		 * back into next.
+		 */
+		swap(vcap->active, vcap->next);
+		dcmipp_bytecap_set_next_frame_or_stop(vcap);
+	}
+
+out:
+	spin_unlock_irq(&vcap->irqlock);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
+{
+	struct dcmipp_bytecap_device *vcap =
+			container_of(arg, struct dcmipp_bytecap_device, ved);
+
+	/* Store interrupt status register */
+	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & vcap->cmier;
+	vcap->it_count++;
+
+	/* Clear interrupt */
+	reg_write(vcap, DCMIPP_CMFCR, vcap->cmsr2);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int dcmipp_bytecap_comp_bind(struct device *comp, struct device *master,
+				    void *master_data)
+{
+	struct dcmipp_bind_data *bind_data = master_data;
+	struct dcmipp_platform_data *pdata = comp->platform_data;
+	struct dcmipp_bytecap_device *vcap;
+	struct v4l2_pix_format *format;
+	struct video_device *vdev;
+	struct vb2_queue *q;
+	int ret = 0;
+
+	/* Allocate the dcmipp_bytecap_device struct */
+	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
+	if (!vcap)
+		return -ENOMEM;
+
+	/* Allocate the pads */
+	vcap->ved.pads =
+		dcmipp_pads_init(1,
+				 (const unsigned long[1]) {MEDIA_PAD_FL_SINK});
+	if (IS_ERR(vcap->ved.pads)) {
+		ret = PTR_ERR(vcap->ved.pads);
+		goto err_free_vcap;
+	}
+
+	/* Initialize the media entity */
+	vcap->vdev.entity.name = pdata->entity_name;
+	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
+	ret = media_entity_pads_init(&vcap->vdev.entity,
+				     1, vcap->ved.pads);
+	if (ret)
+		goto err_clean_pads;
+
+	/* Initialize the lock */
+	mutex_init(&vcap->lock);
+
+	/* Initialize the vb2 queue */
+	q = &vcap->queue;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
+	q->lock = &vcap->lock;
+	q->drv_priv = vcap;
+	q->buf_struct_size = sizeof(struct dcmipp_buf);
+	q->ops = &dcmipp_bytecap_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = 1;
+	q->dev = comp;
+
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
+			pdata->entity_name, ret);
+		goto err_clean_m_ent;
+	}
+
+	/* Initialize buffer list and its lock */
+	INIT_LIST_HEAD(&vcap->buffers);
+	spin_lock_init(&vcap->irqlock);
+
+	/* Set default frame format */
+	vcap->format = fmt_default;
+	format = &vcap->format;
+	format->bytesperline = frame_stride(format->width, format->pixelformat);
+	format->sizeimage = frame_size(format->width,
+				       format->height,
+				       format->pixelformat);
+
+	/* Fill the dcmipp_ent_device struct */
+	vcap->ved.ent = &vcap->vdev.entity;
+	vcap->ved.vdev_get_format = dcmipp_bytecap_get_format;
+	vcap->ved.handler = dcmipp_bytecap_irq_callback;
+	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
+	dev_set_drvdata(comp, &vcap->ved);
+	vcap->dev = comp;
+	vcap->regs = bind_data->regs;
+	vcap->rstc = bind_data->rstc;
+	vcap->cdev = master;
+
+	/* Initialize the video_device struct */
+	vdev = &vcap->vdev;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_READWRITE;
+	vdev->entity.ops = &dcmipp_bytecap_mops;
+	vdev->release = dcmipp_bytecap_release;
+	vdev->fops = &dcmipp_bytecap_fops;
+	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
+	vdev->lock = &vcap->lock;
+	vdev->queue = q;
+	vdev->v4l2_dev = bind_data->v4l2_dev;
+	strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
+	video_set_drvdata(vdev, &vcap->ved);
+
+	/* Register the video_device with the v4l2 and the media framework */
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(comp, "%s: video register failed (err=%d)\n",
+			vcap->vdev.name, ret);
+		goto err_clean_m_ent;
+	}
+
+	return 0;
+
+err_clean_m_ent:
+	media_entity_cleanup(&vcap->vdev.entity);
+err_clean_pads:
+	dcmipp_pads_cleanup(vcap->ved.pads);
+err_free_vcap:
+	kfree(vcap);
+
+	return ret;
+}
+
+static const struct component_ops dcmipp_bytecap_comp_ops = {
+	.bind = dcmipp_bytecap_comp_bind,
+	.unbind = dcmipp_bytecap_comp_unbind,
+};
+
+static int dcmipp_bytecap_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &dcmipp_bytecap_comp_ops);
+}
+
+static int dcmipp_bytecap_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dcmipp_bytecap_comp_ops);
+
+	return 0;
+}
+
+static const struct platform_device_id dcmipp_bytecap_driver_ids[] = {
+	{
+		.name	= DCMIPP_BYTECAP_DRV_NAME,
+	},
+	{ }
+};
+
+static struct platform_driver dcmipp_bytecap_pdrv = {
+	.probe		= dcmipp_bytecap_probe,
+	.remove		= dcmipp_bytecap_remove,
+	.id_table	= dcmipp_bytecap_driver_ids,
+	.driver		= {
+		.name	= DCMIPP_BYTECAP_DRV_NAME,
+	},
+};
+
+module_platform_driver(dcmipp_bytecap_pdrv);
+
+MODULE_DEVICE_TABLE(platform, dcmipp_bytecap_driver_ids);
+
+MODULE_AUTHOR("Hugues Fruchet <hugues.fruchet@foss.st.com>");
+MODULE_AUTHOR("Alain Volmat <alain.volmat@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 Digital Camera Memory Interface with Pixel Processor driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
new file mode 100644
index 000000000000..5458162a36bf
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -0,0 +1,790 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/vmalloc.h>
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+
+#define DCMIPP_BYTEPROC_DRV_NAME "dcmipp-byteproc"
+
+#define DCMIPP_FMT_WIDTH_DEFAULT  640
+#define DCMIPP_FMT_HEIGHT_DEFAULT 480
+
+#define DCMIPP_P0FCTCR (0x500)
+#define DCMIPP_P0FCTCR_FRATE_MASK GENMASK(1, 0)
+#define DCMIPP_P0SCSTR (0x504)
+#define DCMIPP_P0SCSTR_HSTART_SHIFT	0
+#define DCMIPP_P0SCSTR_VSTART_SHIFT	16
+#define DCMIPP_P0SCSZR (0x508)
+#define DCMIPP_P0SCSZR_ENABLE BIT(31)
+#define DCMIPP_P0SCSZR_HSIZE_SHIFT	0
+#define DCMIPP_P0SCSZR_VSIZE_SHIFT	16
+#define DCMIPP_P0PPCR (0x5C0)
+#define DCMIPP_P0PPCR_BSM_1_2 0x1
+#define DCMIPP_P0PPCR_BSM_1_4 0x2
+#define DCMIPP_P0PPCR_BSM_2_4 0x3
+#define DCMIPP_P0PPCR_BSM_MASK GENMASK(8, 7)
+#define DCMIPP_P0PPCR_BSM_SHIFT 0x7
+#define DCMIPP_P0PPCR_LSM BIT(10)
+#define DCMIPP_P0PPCR_OELS BIT(11)
+
+#define IS_SINK(pad) (!(pad))
+#define IS_SRC(pad)  ((pad))
+#define PAD_STR(pad) (IS_SRC((pad))) ? "src" : "sink"
+
+#define BYTEPROC_MEDIA_BUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB565_2X8_LE
+
+struct dcmipp_byteproc_pix_map {
+	unsigned int code;
+	unsigned int bpp;
+};
+
+#define PIXMAP_MBUS_BPP(mbus, byteperpixel)	\
+		{						\
+			.code = MEDIA_BUS_FMT_##mbus,		\
+			.bpp = byteperpixel,	\
+		}
+static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
+	PIXMAP_MBUS_BPP(RGB565_2X8_LE, 2),
+	PIXMAP_MBUS_BPP(YUYV8_2X8, 2),
+	PIXMAP_MBUS_BPP(YVYU8_2X8, 2),
+	PIXMAP_MBUS_BPP(UYVY8_2X8, 2),
+	PIXMAP_MBUS_BPP(VYUY8_2X8, 2),
+	PIXMAP_MBUS_BPP(Y8_1X8, 1),
+	PIXMAP_MBUS_BPP(SBGGR8_1X8, 1),
+	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),
+	PIXMAP_MBUS_BPP(SGRBG8_1X8, 1),
+	PIXMAP_MBUS_BPP(SRGGB8_1X8, 1),
+	PIXMAP_MBUS_BPP(JPEG_1X8, 1),
+};
+
+static const struct dcmipp_byteproc_pix_map *dcmipp_byteproc_pix_map_by_index(unsigned int i)
+{
+	const struct dcmipp_byteproc_pix_map *l = dcmipp_byteproc_pix_map_list;
+	unsigned int size = ARRAY_SIZE(dcmipp_byteproc_pix_map_list);
+
+	if (i >= size)
+		return NULL;
+
+	return &l[i];
+}
+
+static const struct dcmipp_byteproc_pix_map *dcmipp_byteproc_pix_map_by_code(u32 code)
+{
+	const struct dcmipp_byteproc_pix_map *l = dcmipp_byteproc_pix_map_list;
+	unsigned int size = ARRAY_SIZE(dcmipp_byteproc_pix_map_list);
+	unsigned int i;
+
+	for (i = 0; i < size; i++) {
+		if (l[i].code == code)
+			return &l[i];
+	}
+
+	return NULL;
+}
+
+struct dcmipp_byteproc_device {
+	struct dcmipp_ent_device ved;
+	struct v4l2_subdev sd;
+	struct device *dev;
+	struct v4l2_mbus_framefmt sink_fmt;
+	bool streaming;
+	/* Protect this data structure */
+	struct mutex lock;
+
+	void __iomem *regs;
+
+	struct v4l2_fract sink_interval;
+	struct v4l2_fract src_interval;
+	unsigned int frate;
+	u32 src_code;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.code = BYTEPROC_MEDIA_BUS_FMT_DEFAULT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static const struct v4l2_rect crop_min = {
+	.width = DCMIPP_FRAME_MIN_WIDTH,
+	.height = DCMIPP_FRAME_MIN_HEIGHT,
+	.top = 0,
+	.left = 0,
+};
+
+static struct v4l2_rect
+dcmipp_byteproc_get_compose_bound(const struct v4l2_mbus_framefmt *fmt)
+{
+	/* Get the crop bounds to clamp the crop rectangle correctly */
+	struct v4l2_rect r = {
+		.left = 0,
+		.top = 0,
+		.width = fmt->width,
+		.height = fmt->height,
+	};
+
+	return r;
+}
+
+static void dcmipp_byteproc_adjust_crop(struct v4l2_rect *r, struct v4l2_rect *compose)
+{
+	/* Disallow rectangles smaller than the minimal one. */
+	v4l2_rect_set_min_size(r, &crop_min);
+	v4l2_rect_map_inside(r, compose);
+}
+
+static void dcmipp_byteproc_adjust_compose(struct v4l2_rect *r,
+					   const struct v4l2_mbus_framefmt *fmt)
+{
+	r->top = 0;
+	r->left = 0;
+
+	/* Compose is not possible for JPEG or Bayer formats */
+	if (fmt->code == MEDIA_BUS_FMT_JPEG_1X8 ||
+	    fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8 || fmt->code == MEDIA_BUS_FMT_SGBRG8_1X8 ||
+	    fmt->code == MEDIA_BUS_FMT_SGRBG8_1X8 || fmt->code == MEDIA_BUS_FMT_SRGGB8_1X8) {
+		r->width = fmt->width;
+		r->height = fmt->height;
+		return;
+	}
+
+	/* Adjust height - we can only perform 1/2 decimation */
+	if (r->height <= (fmt->height / 2))
+		r->height = fmt->height / 2;
+	else
+		r->height = fmt->height;
+
+	/* Adjust width - /2 or /4 for 8bits formats and /2 for 16bits formats */
+	if (fmt->code == MEDIA_BUS_FMT_Y8_1X8 && r->width <= (fmt->width / 4))
+		r->width = fmt->width / 4;
+	else if (r->width <= (fmt->width / 2))
+		r->width = fmt->width / 2;
+	else
+		r->width = fmt->width;
+}
+
+static void dcmipp_byteproc_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
+{
+	const struct dcmipp_byteproc_pix_map *vpix;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_byteproc_pix_map_by_code(fmt->code);
+	if (!vpix)
+		fmt->code = fmt_default.code;
+
+	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
+			     DCMIPP_FRAME_MAX_WIDTH) & ~1;
+	fmt->height = clamp_t(u32, fmt->height, DCMIPP_FRAME_MIN_HEIGHT,
+			      DCMIPP_FRAME_MAX_HEIGHT) & ~1;
+
+	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+		fmt->field = fmt_default.field;
+
+	dcmipp_colorimetry_clamp(fmt);
+}
+
+static int dcmipp_byteproc_init_cfg(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state)
+{
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		struct v4l2_mbus_framefmt *mf;
+		struct v4l2_rect *r;
+
+		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
+		*mf = fmt_default;
+
+		if (IS_SINK(i))
+			r = v4l2_subdev_get_try_compose(sd, sd_state, i);
+		else
+			r = v4l2_subdev_get_try_crop(sd, sd_state, i);
+
+		r->top = 0;
+		r->left = 0;
+		r->width = DCMIPP_FMT_WIDTH_DEFAULT;
+		r->height = DCMIPP_FMT_HEIGHT_DEFAULT;
+	}
+
+	return 0;
+}
+
+static int dcmipp_byteproc_enum_mbus_code(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct dcmipp_byteproc_pix_map *vpix;
+
+	vpix = dcmipp_byteproc_pix_map_by_index(code->index);
+	if (!vpix)
+		return -EINVAL;
+
+	code->code = vpix->code;
+
+	return 0;
+}
+
+static int dcmipp_byteproc_enum_frame_size(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct dcmipp_byteproc_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_byteproc_pix_map_by_code(fse->code);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fse->max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fse->min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fse->max_height = DCMIPP_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int dcmipp_byteproc_get_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *crop_rect;
+
+	mutex_lock(&byteproc->lock);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 1);
+	} else {
+		fmt->format = byteproc->sink_fmt;
+		crop_rect = &byteproc->crop;
+	}
+
+	if (IS_SRC(fmt->pad)) {
+		fmt->format.width = crop_rect->width;
+		fmt->format.height = crop_rect->height;
+	}
+
+	mutex_unlock(&byteproc->lock);
+
+	return 0;
+}
+
+static int dcmipp_byteproc_set_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop, *compose;
+	int ret = 0;
+
+	mutex_lock(&byteproc->lock);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		if (byteproc->streaming) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		sink_fmt = &byteproc->sink_fmt;
+		crop = &byteproc->crop;
+		compose = &byteproc->compose;
+	} else {
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop = v4l2_subdev_get_try_crop(sd, sd_state, 1);
+		compose = v4l2_subdev_get_try_compose(sd, sd_state, 0);
+	}
+
+	if (IS_SRC(fmt->pad)) {
+		fmt->format = *sink_fmt;
+		fmt->format.width = crop->width;
+		fmt->format.height = crop->height;
+	} else {
+		dcmipp_byteproc_adjust_fmt(&fmt->format);
+		crop->top = 0;
+		crop->left = 0;
+		crop->width = fmt->format.width;
+		crop->height = fmt->format.height;
+		*compose = *crop;
+		*sink_fmt = fmt->format;
+	}
+
+out:
+	mutex_unlock(&byteproc->lock);
+
+	return ret;
+}
+
+static int dcmipp_byteproc_get_selection(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *sd_state,
+					 struct v4l2_subdev_selection *s)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop, *compose;
+
+	/*
+	 * In the HW, the decimation block is located prior to the crop hence:
+	 * Compose is done on the sink pad
+	 * Crop is done on the src pad
+	 */
+	if ((s->target == V4L2_SEL_TGT_CROP ||
+	     s->target == V4L2_SEL_TGT_CROP_BOUNDS ||
+	     s->target == V4L2_SEL_TGT_CROP_DEFAULT) && IS_SINK(s->pad))
+		return -EINVAL;
+
+	if ((s->target == V4L2_SEL_TGT_COMPOSE ||
+	     s->target == V4L2_SEL_TGT_COMPOSE_BOUNDS ||
+	     s->target == V4L2_SEL_TGT_COMPOSE_DEFAULT) && IS_SRC(s->pad))
+		return -EINVAL;
+
+	if (s->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		sink_fmt = &byteproc->sink_fmt;
+		crop = &byteproc->crop;
+		compose = &byteproc->compose;
+	} else {
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop = v4l2_subdev_get_try_crop(sd, sd_state, 1);
+		compose = v4l2_subdev_get_try_compose(sd, sd_state, 0);
+	}
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r = *crop;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		s->r = *compose;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r = *compose;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		s->r = dcmipp_byteproc_get_compose_bound(sink_fmt);
+		break;
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = sink_fmt->width;
+		s->r.height = sink_fmt->height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dcmipp_byteproc_set_selection(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *sd_state,
+					 struct v4l2_subdev_selection *s)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop, *compose;
+
+	/*
+	 * In the HW, the decimation block is located prior to the crop hence:
+	 * Compose is done on the sink pad
+	 * Crop is done on the src pad
+	 */
+	if ((s->target == V4L2_SEL_TGT_CROP ||
+	     s->target == V4L2_SEL_TGT_CROP_BOUNDS ||
+	     s->target == V4L2_SEL_TGT_CROP_DEFAULT) && IS_SINK(s->pad))
+		return -EINVAL;
+
+	if ((s->target == V4L2_SEL_TGT_COMPOSE ||
+	     s->target == V4L2_SEL_TGT_COMPOSE_BOUNDS ||
+	     s->target == V4L2_SEL_TGT_COMPOSE_DEFAULT) && IS_SRC(s->pad))
+		return -EINVAL;
+
+	if (s->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		sink_fmt = &byteproc->sink_fmt;
+		crop = &byteproc->crop;
+		compose = &byteproc->compose;
+	} else {
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop = v4l2_subdev_get_try_crop(sd, sd_state, 1);
+		compose = v4l2_subdev_get_try_compose(sd, sd_state, 0);
+	}
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		dcmipp_byteproc_adjust_crop(&s->r, compose);
+
+		*crop = s->r;
+
+		dev_dbg(byteproc->dev, "s_selection: crop %ux%u@(%u,%u)\n",
+			crop->width, crop->height, crop->left, crop->top);
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		dcmipp_byteproc_adjust_compose(&s->r, sink_fmt);
+		*compose = s->r;
+		*crop = s->r;
+
+		dev_dbg(byteproc->dev, "s_selection: compose %ux%u@(%u,%u)\n",
+			compose->width, compose->height, compose->left, compose->top);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const unsigned int dcmipp_frates[] = {1, 2, 4, 8};
+
+static int dcmipp_byteproc_enum_frame_interval
+				(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_fract *sink_interval = &byteproc->sink_interval;
+	unsigned int ratio;
+	int ret = 0;
+
+	if (fie->pad > 1 ||
+	    fie->index >= (IS_SRC(fie->pad) ? ARRAY_SIZE(dcmipp_frates) : 1) ||
+	    fie->width > DCMIPP_FRAME_MAX_WIDTH ||
+	    fie->height > DCMIPP_FRAME_MAX_HEIGHT)
+		return -EINVAL;
+
+	mutex_lock(&byteproc->lock);
+
+	if (IS_SINK(fie->pad)) {
+		fie->interval = *sink_interval;
+		goto out;
+	}
+
+	ratio = dcmipp_frates[fie->index];
+
+	fie->interval.numerator = sink_interval->numerator * ratio;
+	fie->interval.denominator = sink_interval->denominator;
+
+out:
+	mutex_unlock(&byteproc->lock);
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_byteproc_pad_ops = {
+	.init_cfg		= dcmipp_byteproc_init_cfg,
+	.enum_mbus_code		= dcmipp_byteproc_enum_mbus_code,
+	.enum_frame_size	= dcmipp_byteproc_enum_frame_size,
+	.enum_frame_interval	= dcmipp_byteproc_enum_frame_interval,
+	.get_fmt		= dcmipp_byteproc_get_fmt,
+	.set_fmt		= dcmipp_byteproc_set_fmt,
+	.get_selection		= dcmipp_byteproc_get_selection,
+	.set_selection		= dcmipp_byteproc_set_selection,
+};
+
+static int dcmipp_byteproc_configure_scale_crop
+			(struct dcmipp_byteproc_device *byteproc)
+{
+	const struct dcmipp_byteproc_pix_map *vpix;
+	u32 hprediv, vprediv;
+	struct v4l2_rect *crop = &byteproc->crop;
+	u32 val = 0;
+
+	/* find output format bpp */
+	vpix = dcmipp_byteproc_pix_map_by_code(byteproc->sink_fmt.code);
+	if (!vpix)
+		return -EINVAL;
+
+	/* clear decimation/crop */
+	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_BSM_MASK);
+	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_LSM);
+	reg_write(byteproc, DCMIPP_P0SCSTR, 0);
+	reg_write(byteproc, DCMIPP_P0SCSZR, 0);
+
+	/* Ignore decimation/crop with JPEG */
+	if (vpix->code == MEDIA_BUS_FMT_JPEG_1X8)
+		return 0;
+
+	/* decimation */
+	hprediv = byteproc->sink_fmt.width / byteproc->compose.width;
+	if (hprediv == 4)
+		val |= DCMIPP_P0PPCR_BSM_1_4 << DCMIPP_P0PPCR_BSM_SHIFT;
+	else if ((vpix->code == MEDIA_BUS_FMT_Y8_1X8) && (hprediv == 2))
+		val |= DCMIPP_P0PPCR_BSM_1_2 << DCMIPP_P0PPCR_BSM_SHIFT;
+	else if (hprediv == 2)
+		val |= DCMIPP_P0PPCR_BSM_2_4 << DCMIPP_P0PPCR_BSM_SHIFT;
+
+	vprediv = byteproc->sink_fmt.height / byteproc->compose.height;
+	if (vprediv == 2)
+		val |= DCMIPP_P0PPCR_LSM | DCMIPP_P0PPCR_OELS;
+
+	/* decimate using bytes and lines skipping */
+	if (val) {
+		reg_set(byteproc, DCMIPP_P0PPCR, val);
+
+		dev_dbg(byteproc->dev, "decimate to %dx%d [prediv=%dx%d]\n",
+			byteproc->compose.width, byteproc->compose.height, hprediv, vprediv);
+	}
+
+	dev_dbg(byteproc->dev, "crop to %dx%d\n", crop->width, crop->height);
+
+	/* expressed in 32-bits words on X axis, lines on Y axis */
+	reg_write(byteproc, DCMIPP_P0SCSTR,
+		  (((crop->left * vpix->bpp) / 4) << DCMIPP_P0SCSTR_HSTART_SHIFT) |
+		  (crop->top << DCMIPP_P0SCSTR_VSTART_SHIFT));
+	reg_write(byteproc, DCMIPP_P0SCSZR,
+		  DCMIPP_P0SCSZR_ENABLE |
+		  (((crop->width * vpix->bpp) / 4) << DCMIPP_P0SCSZR_HSIZE_SHIFT) |
+		  (crop->height << DCMIPP_P0SCSZR_VSIZE_SHIFT));
+
+	return 0;
+}
+
+static void dcmipp_byteproc_configure_framerate
+			(struct dcmipp_byteproc_device *byteproc)
+{
+	/* Frame skipping */
+	reg_clear(byteproc, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_FRATE_MASK);
+	reg_set(byteproc, DCMIPP_P0FCTCR, byteproc->frate);
+}
+
+static int dcmipp_byteproc_g_frame_interval(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_frame_interval *fi)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+
+	if (IS_SINK(fi->pad))
+		fi->interval = byteproc->sink_interval;
+	else
+		fi->interval = byteproc->src_interval;
+
+	return 0;
+}
+
+static int dcmipp_byteproc_s_frame_interval(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_frame_interval *fi)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+
+	mutex_lock(&byteproc->lock);
+
+	if (byteproc->streaming) {
+		mutex_unlock(&byteproc->lock);
+		return -EBUSY;
+	}
+
+	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
+		fi->interval = byteproc->sink_interval;
+
+	if (IS_SINK(fi->pad)) {
+		/*
+		 * Setting sink frame interval resets frame skipping.
+		 * Sink frame interval is propagated to src.
+		 */
+		byteproc->frate = 0;
+		byteproc->sink_interval = fi->interval;
+		byteproc->src_interval = byteproc->sink_interval;
+	} else {
+		unsigned int ratio;
+
+		/* Normalize ratio */
+		ratio = (byteproc->sink_interval.denominator *
+			 fi->interval.numerator) /
+			(byteproc->sink_interval.numerator *
+			 fi->interval.denominator);
+
+		/* Hardware can skip 1 frame over 2, 4 or 8 */
+		byteproc->frate = ratio >= 8 ? 3 :
+				  ratio >= 4 ? 2 :
+				  ratio >= 2 ? 1 : 0;
+
+		/* Adjust src frame interval to what hardware can really do */
+		byteproc->src_interval.numerator =
+			byteproc->sink_interval.numerator * ratio;
+		byteproc->src_interval.denominator =
+			byteproc->sink_interval.denominator;
+	}
+
+	mutex_unlock(&byteproc->lock);
+
+	return 0;
+}
+
+#define STOP_TIMEOUT_US 1000
+#define POLL_INTERVAL_US  50
+static int dcmipp_byteproc_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	mutex_lock(&byteproc->lock);
+	if (enable) {
+		dcmipp_byteproc_configure_framerate(byteproc);
+
+		ret = dcmipp_byteproc_configure_scale_crop(byteproc);
+		if (ret)
+			goto err;
+	}
+
+err:
+	mutex_unlock(&byteproc->lock);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops dcmipp_byteproc_video_ops = {
+	.g_frame_interval = dcmipp_byteproc_g_frame_interval,
+	.s_frame_interval = dcmipp_byteproc_s_frame_interval,
+	.s_stream = dcmipp_byteproc_s_stream,
+};
+
+static const struct v4l2_subdev_ops dcmipp_byteproc_ops = {
+	.pad = &dcmipp_byteproc_pad_ops,
+	.video = &dcmipp_byteproc_video_ops,
+};
+
+/* FIXME */
+static void dcmipp_byteproc_release(struct v4l2_subdev *sd)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+
+	kfree(byteproc);
+}
+
+static const struct v4l2_subdev_internal_ops dcmipp_byteproc_int_ops = {
+	.release = dcmipp_byteproc_release,
+};
+
+static void dcmipp_byteproc_comp_unbind(struct device *comp,
+					struct device *master,
+					void *master_data)
+{
+	struct dcmipp_ent_device *ved = dev_get_drvdata(comp);
+	struct dcmipp_byteproc_device *byteproc =
+			container_of(ved, struct dcmipp_byteproc_device, ved);
+
+	dcmipp_ent_sd_unregister(ved, &byteproc->sd);
+}
+
+static int dcmipp_byteproc_comp_bind(struct device *comp, struct device *master,
+				     void *master_data)
+{
+	struct dcmipp_bind_data *bind_data = master_data;
+	struct dcmipp_platform_data *pdata = comp->platform_data;
+	struct dcmipp_byteproc_device *byteproc;
+	struct v4l2_rect r = {
+		.top = 0,
+		.left = 0,
+		.width = DCMIPP_FMT_WIDTH_DEFAULT,
+		.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	};
+	struct v4l2_fract interval = {
+		.numerator = 1,
+		.denominator = 30,
+	};
+	int ret;
+
+	/* Allocate the byteproc struct */
+	byteproc = kzalloc(sizeof(*byteproc), GFP_KERNEL);
+	if (!byteproc)
+		return -ENOMEM;
+
+	byteproc->regs = bind_data->regs;
+
+	/* Initialize the lock */
+	mutex_init(&byteproc->lock);
+
+	/* Initialize ved and sd */
+	ret = dcmipp_ent_sd_register(&byteproc->ved, &byteproc->sd,
+				     bind_data->v4l2_dev,
+				     pdata->entity_name,
+				     MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER, 2,
+				     (const unsigned long[2]) {
+				     MEDIA_PAD_FL_SINK,
+				     MEDIA_PAD_FL_SOURCE,
+				     },
+				     &dcmipp_byteproc_int_ops,
+				     &dcmipp_byteproc_ops,
+				     NULL, NULL);
+	if (ret) {
+		kfree(byteproc);
+		return ret;
+	}
+
+	dev_set_drvdata(comp, &byteproc->ved);
+	byteproc->dev = comp;
+
+	/* Initialize the frame format */
+	byteproc->sink_fmt = fmt_default;
+	byteproc->crop = r;
+	byteproc->compose = r;
+	byteproc->src_interval = interval;
+	byteproc->sink_interval = interval;
+
+	return 0;
+}
+
+static const struct component_ops dcmipp_byteproc_comp_ops = {
+	.bind = dcmipp_byteproc_comp_bind,
+	.unbind = dcmipp_byteproc_comp_unbind,
+};
+
+static int dcmipp_byteproc_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &dcmipp_byteproc_comp_ops);
+}
+
+static int dcmipp_byteproc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dcmipp_byteproc_comp_ops);
+
+	return 0;
+}
+
+static const struct platform_device_id dcmipp_byteproc_driver_ids[] = {
+	{
+		.name           = DCMIPP_BYTEPROC_DRV_NAME,
+	},
+	{ }
+};
+
+static struct platform_driver dcmipp_byteproc_pdrv = {
+	.probe		= dcmipp_byteproc_probe,
+	.remove		= dcmipp_byteproc_remove,
+	.id_table	= dcmipp_byteproc_driver_ids,
+	.driver		= {
+		.name	= DCMIPP_BYTEPROC_DRV_NAME,
+	},
+};
+
+module_platform_driver(dcmipp_byteproc_pdrv);
+
+MODULE_DEVICE_TABLE(platform, dcmipp_byteproc_driver_ids);
+
+MODULE_AUTHOR("Hugues Fruchet <hugues.fruchet@foss.st.com>");
+MODULE_AUTHOR("Alain Volmat <alain.volmat@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 Digital Camera Memory Interface with Pixel Processor driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
new file mode 100644
index 000000000000..f070690ccbb1
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include "dcmipp-common.h"
+
+/* Helper function to allocate and initialize pads */
+struct media_pad *dcmipp_pads_init(u16 num_pads, const unsigned long *pads_flag)
+{
+	struct media_pad *pads;
+	unsigned int i;
+
+	/* Allocate memory for the pads */
+	pads = kcalloc(num_pads, sizeof(*pads), GFP_KERNEL);
+	if (!pads)
+		return ERR_PTR(-ENOMEM);
+
+	/* Initialize the pads */
+	for (i = 0; i < num_pads; i++) {
+		pads[i].index = i;
+		pads[i].flags = pads_flag[i];
+	}
+
+	return pads;
+}
+EXPORT_SYMBOL_GPL(dcmipp_pads_init);
+
+int dcmipp_link_validate(struct media_link *link)
+{
+	/* TODO */
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dcmipp_link_validate);
+
+static const struct media_entity_operations dcmipp_ent_sd_mops = {
+	.link_validate = dcmipp_link_validate,
+};
+
+int dcmipp_ent_sd_register(struct dcmipp_ent_device *ved,
+			   struct v4l2_subdev *sd,
+			   struct v4l2_device *v4l2_dev,
+			   const char *const name,
+			   u32 function,
+			   u16 num_pads,
+			   const unsigned long *pads_flag,
+			   const struct v4l2_subdev_internal_ops *sd_int_ops,
+			   const struct v4l2_subdev_ops *sd_ops,
+			   irq_handler_t handler,
+			   irq_handler_t thread_fn)
+{
+	int ret;
+
+	/* Allocate the pads. Should be released from the sd_int_op release */
+	ved->pads = dcmipp_pads_init(num_pads, pads_flag);
+	if (IS_ERR(ved->pads))
+		return PTR_ERR(ved->pads);
+
+	/* Fill the dcmipp_ent_device struct */
+	ved->ent = &sd->entity;
+
+	/* Initialize the subdev */
+	v4l2_subdev_init(sd, sd_ops);
+	sd->internal_ops = sd_int_ops;
+	sd->entity.function = function;
+	sd->entity.ops = &dcmipp_ent_sd_mops;
+	sd->owner = THIS_MODULE;
+	strscpy(sd->name, name, sizeof(sd->name));
+	v4l2_set_subdevdata(sd, ved);
+
+	/* Expose this subdev to user space */
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	if (sd->ctrl_handler)
+		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+
+	/* Initialize the media entity */
+	ret = media_entity_pads_init(&sd->entity, num_pads, ved->pads);
+	if (ret)
+		goto err_clean_pads;
+
+	/* Register the subdev with the v4l2 and the media framework */
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret) {
+		dev_err(v4l2_dev->dev,
+			"%s: subdev register failed (err=%d)\n",
+			name, ret);
+		goto err_clean_m_ent;
+	}
+
+	ved->handler = handler;
+	ved->thread_fn = thread_fn;
+
+	return 0;
+
+err_clean_m_ent:
+	media_entity_cleanup(&sd->entity);
+err_clean_pads:
+	dcmipp_pads_cleanup(ved->pads);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dcmipp_ent_sd_register);
+
+void dcmipp_ent_sd_unregister(struct dcmipp_ent_device *ved, struct v4l2_subdev *sd)
+{
+	media_entity_cleanup(ved->ent);
+	v4l2_device_unregister_subdev(sd);
+}
+EXPORT_SYMBOL_GPL(dcmipp_ent_sd_unregister);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
new file mode 100644
index 000000000000..a8c162193de6
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#ifndef _DCMIPP_COMMON_H_
+#define _DCMIPP_COMMON_H_
+
+#include <linux/interrupt.h>
+#include <linux/slab.h>
+#include <media/media-device.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define DCMIPP_PDEV_NAME "dcmipp"
+
+/* DCMIPP-specific controls */
+#define DCMIPP_CID_DCMIPP_BASE		(0x00f00000 | 0xf000)
+#define DCMIPP_CID_DCMIPP_CLASS		(0x00f00000 | 1)
+#define DCMIPP_CID_TEST_PATTERN		(DCMIPP_CID_DCMIPP_BASE + 0)
+
+#define DCMIPP_FRAME_MAX_WIDTH 4096
+#define DCMIPP_FRAME_MAX_HEIGHT 2160
+#define DCMIPP_FRAME_MIN_WIDTH 16
+#define DCMIPP_FRAME_MIN_HEIGHT 16
+
+#define DCMIPP_FMT_WIDTH_DEFAULT  640
+#define DCMIPP_FMT_HEIGHT_DEFAULT 480
+
+#define DCMIPP_FRAME_INDEX(lin, col, width, bpp) \
+	(((lin) * (width) + (col)) * (bpp))
+
+#define DCMIPP_COLORSPACE_DEFAULT	V4L2_COLORSPACE_REC709
+#define DCMIPP_YCBCR_ENC_DEFAULT	V4L2_YCBCR_ENC_DEFAULT
+#define DCMIPP_QUANTIZATION_DEFAULT	V4L2_QUANTIZATION_DEFAULT
+#define DCMIPP_XFER_FUNC_DEFAULT	V4L2_XFER_FUNC_DEFAULT
+
+/**
+ * struct dcmipp_colorimetry_clamp - Adjust colorimetry parameters
+ *
+ * @fmt:		the pointer to struct v4l2_pix_format or
+ *			struct v4l2_mbus_framefmt
+ *
+ * Entities must check if colorimetry given by the userspace is valid, if not
+ * then set them as DEFAULT
+ */
+#define dcmipp_colorimetry_clamp(fmt)					\
+do {									\
+	if ((fmt)->colorspace == V4L2_COLORSPACE_DEFAULT ||		\
+	    (fmt)->colorspace > V4L2_COLORSPACE_DCI_P3) {		\
+		(fmt)->colorspace = DCMIPP_COLORSPACE_DEFAULT;		\
+		(fmt)->ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT;		\
+		(fmt)->quantization = DCMIPP_QUANTIZATION_DEFAULT;	\
+		(fmt)->xfer_func = DCMIPP_XFER_FUNC_DEFAULT;		\
+	}								\
+	if ((fmt)->ycbcr_enc > V4L2_YCBCR_ENC_SMPTE240M)		\
+		(fmt)->ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT;		\
+	if ((fmt)->quantization > V4L2_QUANTIZATION_LIM_RANGE)		\
+		(fmt)->quantization = DCMIPP_QUANTIZATION_DEFAULT;	\
+	if ((fmt)->xfer_func > V4L2_XFER_FUNC_SMPTE2084)		\
+		(fmt)->xfer_func = DCMIPP_XFER_FUNC_DEFAULT;		\
+} while (0)
+
+/**
+ * struct dcmipp_platform_data - platform data to components
+ *
+ * @entity_name:	The name of the entity to be created
+ *
+ * Board setup code will often provide additional information using the device's
+ * platform_data field to hold additional information.
+ * When injecting a new platform_device in the component system the core needs
+ * to provide to the corresponding submodules the name of the entity that should
+ * be used when registering the subdevice in the Media Controller system.
+ */
+struct dcmipp_platform_data {
+	char entity_name[32];
+};
+
+struct dcmipp_bind_data {
+	/* Internal v4l2 parent device*/
+	struct v4l2_device		*v4l2_dev;
+
+	/* Hardware resources */
+	struct reset_control		*rstc;
+	void __iomem			*regs;
+};
+
+/**
+ * struct dcmipp_ent_device - core struct that represents a node in the topology
+ *
+ * @ent:		the pointer to struct media_entity for the node
+ * @pads:		the list of pads of the node
+ * @process_frame:	callback send a frame to that node
+ * @vdev_get_format:	callback that returns the current format a pad, used
+ *			only when is_media_entity_v4l2_video_device(ent) returns
+ *			true
+ *
+ * Each node of the topology must create a dcmipp_ent_device struct. Depending on
+ * the node it will be of an instance of v4l2_subdev or video_device struct
+ * where both contains a struct media_entity.
+ * Those structures should embedded the dcmipp_ent_device struct through
+ * v4l2_set_subdevdata() and video_set_drvdata() respectivaly, allowing the
+ * dcmipp_ent_device struct to be retrieved from the corresponding struct
+ * media_entity
+ */
+struct dcmipp_ent_device {
+	struct media_entity *ent;
+	struct media_pad *pads;
+	void * (*process_frame)(struct dcmipp_ent_device *ved,
+				const void *frame);
+	void (*vdev_get_format)(struct dcmipp_ent_device *ved,
+				struct v4l2_pix_format *fmt);
+
+	/* Parallel input device */
+	struct v4l2_mbus_config_parallel bus;
+	enum v4l2_mbus_type bus_type;
+	irq_handler_t handler;
+	irqreturn_t handler_ret;
+	irq_handler_t thread_fn;
+};
+
+/**
+ * dcmipp_pads_init - initialize pads
+ *
+ * @num_pads:	number of pads to initialize
+ * @pads_flags:	flags to use in each pad
+ *
+ * Helper functions to allocate/initialize pads
+ */
+struct media_pad *dcmipp_pads_init(u16 num_pads,
+				   const unsigned long *pads_flag);
+
+/**
+ * dcmipp_pads_cleanup - free pads
+ *
+ * @pads: pointer to the pads
+ *
+ * Helper function to free the pads initialized with dcmipp_pads_init
+ */
+static inline void dcmipp_pads_cleanup(struct media_pad *pads)
+{
+	kfree(pads);
+}
+
+/**
+ * dcmipp_ent_sd_register - initialize and register a subdev node
+ *
+ * @ved:	the dcmipp_ent_device struct to be initialize
+ * @sd:		the v4l2_subdev struct to be initialize and registered
+ * @v4l2_dev:	the v4l2 device to register the v4l2_subdev
+ * @name:	name of the sub-device. Please notice that the name must be
+ *		unique.
+ * @function:	media entity function defined by MEDIA_ENT_F_* macros
+ * @num_pads:	number of pads to initialize
+ * @pads_flag:	flags to use in each pad
+ * @sd_int_ops:	pointer to &struct v4l2_subdev_internal_ops
+ * @sd_ops:	pointer to &struct v4l2_subdev_ops.
+ *
+ * Helper function initialize and register the struct dcmipp_ent_device and struct
+ * v4l2_subdev which represents a subdev node in the topology
+ */
+int dcmipp_ent_sd_register(struct dcmipp_ent_device *ved,
+			   struct v4l2_subdev *sd,
+			   struct v4l2_device *v4l2_dev,
+			   const char *const name,
+			   u32 function,
+			   u16 num_pads,
+			   const unsigned long *pads_flag,
+			   const struct v4l2_subdev_internal_ops *sd_int_ops,
+			   const struct v4l2_subdev_ops *sd_ops,
+			   irq_handler_t handler,
+			   irq_handler_t thread_fn);
+
+/**
+ * dcmipp_ent_sd_unregister - cleanup and unregister a subdev node
+ *
+ * @ved:	the dcmipp_ent_device struct to be cleaned up
+ * @sd:		the v4l2_subdev struct to be unregistered
+ *
+ * Helper function cleanup and unregister the struct dcmipp_ent_device and struct
+ * v4l2_subdev which represents a subdev node in the topology
+ */
+void dcmipp_ent_sd_unregister(struct dcmipp_ent_device *ved,
+			      struct v4l2_subdev *sd);
+
+/**
+ * dcmipp_link_validate - validates a media link
+ *
+ * @link: pointer to &struct media_link
+ *
+ * This function call validates if a media link is valid for streaming.
+ */
+int dcmipp_link_validate(struct media_link *link);
+
+#define reg_write(device, reg, val) \
+	(reg_write_dbg((device)->dev, #reg, (device)->regs, (reg), (val)))
+#define reg_read(device, reg) \
+	 (reg_read_dbg((device)->dev, #reg, (device)->regs, (reg)))
+#define reg_set(device, reg, mask) \
+	 (reg_set_dbg((device)->dev, #reg, (device)->regs, (reg), (mask)))
+#define reg_clear(device, reg, mask) \
+	 (reg_clear_dbg((device)->dev, #reg, (device)->regs, (reg), (mask)))
+
+static inline u32 reg_read_dbg(struct device *dev, const char *regname,
+			       void __iomem *base, u32 reg)
+{
+	u32 val = readl_relaxed(base + reg);
+
+	dev_dbg(dev, "RD  %s %#10.8x\n", regname, val);
+	return val;
+}
+
+static inline void reg_write_dbg(struct device *dev, const char *regname,
+				 void __iomem *base, u32 reg, u32 val)
+{
+	dev_dbg(dev, "WR  %s %#10.8x\n", regname, val);
+	writel_relaxed(val, base + reg);
+}
+
+static inline void reg_set_dbg(struct device *dev, const char *regname,
+			       void __iomem *base, u32 reg, u32 mask)
+{
+	dev_dbg(dev, "SET %s %#10.8x\n", regname, mask);
+	reg_write_dbg(dev, regname, base, reg, readl_relaxed(base + reg) | mask);
+}
+
+static inline void reg_clear_dbg(struct device *dev, const char *regname,
+				 void __iomem *base, u32 reg, u32 mask)
+{
+	dev_dbg(dev, "CLR %s %#10.8x\n", regname, mask);
+	reg_write_dbg(dev, regname, base, reg, readl_relaxed(base + reg) & ~mask);
+}
+
+#endif
+
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
new file mode 100644
index 000000000000..aa7ae9a5b1a8
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -0,0 +1,682 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <media/media-device.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "dcmipp-common.h"
+
+#define DCMIPP_MDEV_MODEL_NAME "DCMIPP MDEV"
+
+#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
+	.src_ent = src,						\
+	.src_pad = srcpad,					\
+	.sink_ent = sink,					\
+	.sink_pad = sinkpad,					\
+	.flags = link_flags,					\
+}
+
+#define DCMIPP_CMHWCFGR (0x200)
+#define DCMIPP_P0HWCFGR (0x400)
+#define DCMIPP_VERR (0xFF4)
+
+struct dcmipp_device {
+	/* The platform device */
+	struct platform_device		pdev;
+	struct device			*dev;
+
+	/* Hardware resources */
+	struct reset_control		*rstc;
+	void __iomem			*regs;
+	struct clk			*kclk;
+
+	/* The pipeline configuration */
+	const struct dcmipp_pipeline_config	*pipe_cfg;
+
+	/* The Associated media_device parent */
+	struct media_device		mdev;
+
+	/* Internal v4l2 parent device*/
+	struct v4l2_device		v4l2_dev;
+
+	/* Subdevices */
+	struct platform_device		**subdevs;
+
+	struct v4l2_async_notifier	notifier;
+};
+
+static inline struct dcmipp_device *notifier_to_dcmipp(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct dcmipp_device, notifier);
+}
+
+/* Structure which describes individual configuration for each entity */
+struct dcmipp_ent_config {
+	const char *name;
+	const char *drv;
+};
+
+/* Structure which describes links between entities */
+struct dcmipp_ent_link {
+	unsigned int src_ent;
+	u16 src_pad;
+	unsigned int sink_ent;
+	u16 sink_pad;
+	u32 flags;
+};
+
+/* Structure which describes the whole topology */
+struct dcmipp_pipeline_config {
+	const struct dcmipp_ent_config *ents;
+	size_t num_ents;
+	const struct dcmipp_ent_link *links;
+	size_t num_links;
+};
+
+/* --------------------------------------------------------------------------
+ * Topology Configuration
+ */
+
+static const struct dcmipp_ent_config stm32mp13_ent_config[] = {
+	{
+		.name = "dcmipp_parallel",
+		.drv = "dcmipp-parallel",
+	},
+	{
+		.name = "dcmipp_dump_postproc",
+		.drv = "dcmipp-byteproc",
+	},
+	{
+		.name = "dcmipp_dump_capture",
+		.drv = "dcmipp-bytecap",
+	},
+};
+
+#define ID_PARALLEL 0
+#define ID_DUMP_BYTEPROC 1
+#define ID_DUMP_CAPTURE 2
+
+static const struct dcmipp_ent_link stm32mp13_ent_links[] = {
+	DCMIPP_ENT_LINK(ID_PARALLEL,      1, ID_DUMP_BYTEPROC, 0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+};
+
+static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
+	.ents		= stm32mp13_ent_config,
+	.num_ents	= ARRAY_SIZE(stm32mp13_ent_config),
+	.links		= stm32mp13_ent_links,
+	.num_links	= ARRAY_SIZE(stm32mp13_ent_links)
+};
+
+/* -------------------------------------------------------------------------- */
+#define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
+			     (f) == MEDIA_LNK_FL_ENABLED ? "ENABLED" :\
+			     (f) == MEDIA_LNK_FL_IMMUTABLE ? "IMMUTABLE" :\
+			     (f) == (MEDIA_LNK_FL_ENABLED |\
+				     MEDIA_LNK_FL_IMMUTABLE) ?\
+					"ENABLED, IMMUTABLE" :\
+			     "UNKNOWN")
+
+static int dcmipp_create_links(struct dcmipp_device *dcmipp)
+{
+	unsigned int i;
+	int ret;
+
+	/* Initialize the links between entities */
+	for (i = 0; i < dcmipp->pipe_cfg->num_links; i++) {
+		const struct dcmipp_ent_link *link = &dcmipp->pipe_cfg->links[i];
+		/*
+		 * TODO: Check another way of retrieving ved struct without
+		 * relying on platform_get_drvdata
+		 */
+		struct dcmipp_ent_device *ved_src =
+			platform_get_drvdata(dcmipp->subdevs[link->src_ent]);
+		struct dcmipp_ent_device *ved_sink =
+			platform_get_drvdata(dcmipp->subdevs[link->sink_ent]);
+
+		dev_dbg(dcmipp->dev, "Create link \"%s\":%d -> %d:\"%s\" [%s]\n",
+			dcmipp->pipe_cfg->ents[link->src_ent].name,
+			link->src_pad,
+			link->sink_pad,
+			dcmipp->pipe_cfg->ents[link->sink_ent].name,
+			LINK_FLAG_TO_STR(link->flags));
+
+		ret = media_create_pad_link(ved_src->ent, link->src_pad,
+					    ved_sink->ent, link->sink_pad,
+					    link->flags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int dcmipp_graph_init(struct dcmipp_device *dcmipp);
+
+static int dcmipp_comp_bind(struct device *master)
+{
+	struct dcmipp_device *dcmipp = platform_get_drvdata(to_platform_device(master));
+	struct dcmipp_bind_data bind_data;
+	int ret;
+
+	/* Register the v4l2 struct */
+	ret = v4l2_device_register(dcmipp->mdev.dev, &dcmipp->v4l2_dev);
+	if (ret) {
+		dev_err(dcmipp->mdev.dev,
+			"v4l2 device register failed (err=%d)\n", ret);
+		return ret;
+	}
+
+	/* Bind subdevices */
+	bind_data.v4l2_dev = &dcmipp->v4l2_dev;
+	bind_data.rstc = dcmipp->rstc;
+	bind_data.regs = dcmipp->regs;
+	ret = component_bind_all(master, &bind_data);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	/* Initialize links */
+	ret = dcmipp_create_links(dcmipp);
+	if (ret)
+		goto err_comp_unbind_all;
+
+	ret = dcmipp_graph_init(dcmipp);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+
+	media_device_unregister(&dcmipp->mdev);
+	media_device_cleanup(&dcmipp->mdev);
+err_comp_unbind_all:
+	component_unbind_all(master, NULL);
+err_v4l2_unregister:
+	v4l2_device_unregister(&dcmipp->v4l2_dev);
+
+	return ret;
+}
+
+static void dcmipp_comp_unbind(struct device *master)
+{
+	struct dcmipp_device *dcmipp = platform_get_drvdata(to_platform_device(master));
+
+	v4l2_async_nf_unregister(&dcmipp->notifier);
+	v4l2_async_nf_cleanup(&dcmipp->notifier);
+
+	media_device_unregister(&dcmipp->mdev);
+	media_device_cleanup(&dcmipp->mdev);
+	component_unbind_all(master, NULL);
+	v4l2_device_unregister(&dcmipp->v4l2_dev);
+}
+
+static int dcmipp_comp_compare(struct device *comp, void *data)
+{
+	return comp == data;
+}
+
+static struct component_match *dcmipp_add_subdevs(struct dcmipp_device *dcmipp)
+{
+	struct component_match *match = NULL;
+	struct dcmipp_platform_data pdata;
+	int i;
+
+	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
+		dev_dbg(dcmipp->dev, "new pdev for %s (%s)\n",
+			dcmipp->pipe_cfg->ents[i].drv,
+			dcmipp->pipe_cfg->ents[i].name);
+
+		strscpy(pdata.entity_name, dcmipp->pipe_cfg->ents[i].name,
+			sizeof(pdata.entity_name));
+
+		dcmipp->subdevs[i] =
+			platform_device_register_data
+				(dcmipp->dev,
+				 dcmipp->pipe_cfg->ents[i].drv,
+				 PLATFORM_DEVID_AUTO,
+				 &pdata,
+				 sizeof(pdata));
+		if (IS_ERR(dcmipp->subdevs[i])) {
+			match = ERR_CAST(dcmipp->subdevs[i]);
+			while (--i >= 0)
+				platform_device_unregister(dcmipp->subdevs[i]);
+
+			dev_err(dcmipp->mdev.dev,
+				"%s error (err=%ld)\n", __func__,
+				PTR_ERR(match));
+			return match;
+		}
+
+		component_match_add(dcmipp->dev, &match, dcmipp_comp_compare,
+				    &dcmipp->subdevs[i]->dev);
+	}
+
+	return match;
+}
+
+static void dcmipp_rm_subdevs(struct dcmipp_device *dcmipp)
+{
+	unsigned int i;
+
+	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++)
+		platform_device_unregister(dcmipp->subdevs[i]);
+}
+
+static const struct component_master_ops dcmipp_comp_ops = {
+	.bind = dcmipp_comp_bind,
+	.unbind = dcmipp_comp_unbind,
+};
+
+static const struct of_device_id dcmipp_of_match[] = {
+	{ .compatible = "st,stm32mp13-dcmipp", .data = &stm32mp13_pipe_cfg},
+	{ /* end node */ },
+};
+MODULE_DEVICE_TABLE(of, dcmipp_of_match);
+
+static int dcmipp_graph_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
+	int ret;
+
+	/* Register the media device */
+	ret = media_device_register(&dcmipp->mdev);
+	if (ret) {
+		dev_err(dcmipp->mdev.dev,
+			"media device register failed (err=%d)\n", ret);
+		return ret;
+	}
+
+	/* Expose all subdev's nodes*/
+	ret = v4l2_device_register_subdev_nodes(&dcmipp->v4l2_dev);
+	if (ret) {
+		dev_err(dcmipp->mdev.dev,
+			"dcmipp subdev nodes registration failed (err=%d)\n",
+			ret);
+		media_device_unregister(&dcmipp->mdev);
+		return ret;
+	}
+
+	dev_dbg(dcmipp->dev, "Notify complete !\n");
+
+	return 0;
+}
+
+static void dcmipp_graph_notify_unbind(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *sd,
+				       struct v4l2_async_subdev *asd)
+{
+	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
+
+	dev_dbg(dcmipp->dev, "Removing %s\n", sd->name);
+}
+
+static irqreturn_t dcmipp_irq_thread(int irq, void *arg)
+{
+	struct dcmipp_device *dcmipp = arg;
+	struct dcmipp_ent_device *ved;
+	unsigned int i;
+
+	/* Call irq thread of each entities of pipeline */
+	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
+		ved = platform_get_drvdata(dcmipp->subdevs[i]);
+		if (ved->thread_fn && ved->handler_ret == IRQ_WAKE_THREAD)
+			ved->thread_fn(irq, ved);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t dcmipp_irq_callback(int irq, void *arg)
+{
+	struct dcmipp_device *dcmipp = arg;
+	struct dcmipp_ent_device *ved;
+	irqreturn_t ret = IRQ_HANDLED;
+	unsigned int i;
+
+	/* Call irq handler of each entities of pipeline */
+	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
+		ved = platform_get_drvdata(dcmipp->subdevs[i]);
+		if (ved->handler)
+			ved->handler_ret = ved->handler(irq, ved);
+		else if (ved->thread_fn)
+			ved->handler_ret = IRQ_WAKE_THREAD;
+		else
+			ved->handler_ret = IRQ_HANDLED;
+		if (ved->handler_ret != IRQ_HANDLED)
+			ret = ved->handler_ret;
+	}
+
+	return ret;
+}
+
+static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
+				     struct v4l2_subdev *subdev,
+				     struct v4l2_async_subdev *asd)
+{
+	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
+	unsigned int ret;
+	int src_pad;
+	struct dcmipp_ent_device *sink;
+	struct device_node *np = dcmipp->dev->of_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
+
+	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
+
+	/*
+	 * Link this sub-device to DCMIPP, it could be
+	 * a parallel camera sensor or a CSI-2 to parallel bridge
+	 */
+
+	src_pad = media_entity_get_fwnode_pad(&subdev->entity,
+					      subdev->fwnode,
+					      MEDIA_PAD_FL_SOURCE);
+
+	/* Get bus characteristics from devicetree */
+	np = of_graph_get_next_endpoint(np, NULL);
+	if (!np) {
+		dev_err(dcmipp->dev, "Could not find the endpoint\n");
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &ep);
+	of_node_put(np);
+	if (ret) {
+		dev_err(dcmipp->dev, "Could not parse the endpoint\n");
+		return ret;
+	}
+
+	if ((ep.bus_type == V4L2_MBUS_PARALLEL ||
+	     ep.bus_type == V4L2_MBUS_BT656) &&
+	     ep.bus.parallel.bus_width > 0) {
+		/* Only 8 bits bus width supported with BT656 bus */
+		if (ep.bus_type == V4L2_MBUS_BT656 &&
+		    ep.bus.parallel.bus_width != 8) {
+			dev_err(dcmipp->dev, "BT656 bus conflicts with %u bits bus width (8 bits required)\n",
+				ep.bus.parallel.bus_width);
+			return -ENODEV;
+		}
+
+		/*
+		 * Parallel input device detected
+		 * Connect it to parallel subdev
+		 */
+		sink = platform_get_drvdata(dcmipp->subdevs[ID_PARALLEL]);
+		sink->bus.flags = ep.bus.parallel.flags;
+		sink->bus.bus_width = ep.bus.parallel.bus_width;
+		sink->bus.data_shift = ep.bus.parallel.data_shift;
+		sink->bus_type = ep.bus_type;
+		ret = media_create_pad_link(&subdev->entity, src_pad,
+					    sink->ent, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			dev_err(dcmipp->dev, "Failed to create media pad link with subdev \"%s\"\n",
+				subdev->name);
+		else
+			dev_dbg(dcmipp->dev, "DCMIPP is now linked to \"%s\"\n",
+				subdev->name);
+
+		return 0;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_async_notifier_operations dcmipp_graph_notify_ops = {
+	.bound = dcmipp_graph_notify_bound,
+	.unbind = dcmipp_graph_notify_unbind,
+	.complete = dcmipp_graph_notify_complete,
+};
+
+static int dcmipp_graph_init(struct dcmipp_device *dcmipp)
+{
+	struct v4l2_async_subdev *asd;
+	struct device_node *ep;
+	int ret;
+
+	ep = of_graph_get_next_endpoint(dcmipp->dev->of_node, NULL);
+	if (!ep) {
+		dev_err(dcmipp->dev, "Failed to get next endpoint\n");
+		return -EINVAL;
+	}
+
+	v4l2_async_nf_init(&dcmipp->notifier);
+
+	asd = v4l2_async_nf_add_fwnode_remote
+		(&dcmipp->notifier, of_fwnode_handle(ep),
+		 struct v4l2_async_subdev);
+
+	of_node_put(ep);
+
+	if (IS_ERR(asd)) {
+		dev_err(dcmipp->dev, "Failed to add fwnode remote subdev\n");
+		return PTR_ERR(asd);
+	}
+
+	dcmipp->notifier.ops = &dcmipp_graph_notify_ops;
+
+	ret = v4l2_async_nf_register(&dcmipp->v4l2_dev, &dcmipp->notifier);
+	if (ret < 0) {
+		dev_err(dcmipp->dev, "Failed to register notifier\n");
+		v4l2_async_nf_cleanup(&dcmipp->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dcmipp_probe(struct platform_device *pdev)
+{
+	struct dcmipp_device *dcmipp;
+	struct component_match *comp_match = NULL;
+	struct resource *res;
+	struct clk *kclk;
+	const struct dcmipp_pipeline_config *pipe_cfg;
+	int irq;
+	int ret;
+
+	dcmipp = devm_kzalloc(&pdev->dev, sizeof(struct dcmipp_device), GFP_KERNEL);
+	if (!dcmipp)
+		return -ENOMEM;
+
+	dcmipp->dev = &pdev->dev;
+
+	pipe_cfg = of_device_get_match_data(&pdev->dev);
+	if (!pipe_cfg) {
+		dev_err(&pdev->dev, "Can't get device data\n");
+		return -ENODEV;
+	}
+	dcmipp->pipe_cfg = pipe_cfg;
+
+	platform_set_drvdata(pdev, dcmipp);
+
+	/* Get hardware resources from devicetree */
+	dcmipp->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(dcmipp->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dcmipp->rstc),
+				     "Could not get reset control\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0) {
+		if (irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get irq\n");
+		return irq ? irq : -ENXIO;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Could not get resource\n");
+		return -ENODEV;
+	}
+
+	dcmipp->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dcmipp->regs)) {
+		dev_err(&pdev->dev, "Could not map registers\n");
+		return PTR_ERR(dcmipp->regs);
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, dcmipp_irq_callback,
+					dcmipp_irq_thread, IRQF_ONESHOT,
+					dev_name(&pdev->dev), dcmipp);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
+		return ret;
+	}
+
+	/* Reset device */
+	ret = reset_control_assert(dcmipp->rstc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to assert the reset line\n");
+		return ret;
+	}
+
+	usleep_range(3000, 5000);
+
+	ret = reset_control_deassert(dcmipp->rstc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to deassert the reset line\n");
+		return ret;
+	}
+
+	kclk = devm_clk_get(&pdev->dev, "kclk");
+	if (IS_ERR(kclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
+				     "Unable to get kclk\n");
+	dcmipp->kclk = kclk;
+
+	/* Create platform_device for each entity in the topology */
+	dcmipp->subdevs = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
+				       sizeof(*dcmipp->subdevs), GFP_KERNEL);
+	if (!dcmipp->subdevs)
+		return -ENOMEM;
+
+	comp_match = dcmipp_add_subdevs(dcmipp);
+	if (IS_ERR(comp_match))
+		return PTR_ERR(comp_match);
+
+	/* Link the media device within the v4l2_device */
+	dcmipp->v4l2_dev.mdev = &dcmipp->mdev;
+
+	/* Initialize media device */
+	strscpy(dcmipp->mdev.model, DCMIPP_MDEV_MODEL_NAME,
+		sizeof(dcmipp->mdev.model));
+	snprintf(dcmipp->mdev.bus_info, sizeof(dcmipp->mdev.bus_info),
+		 "platform:%s", DCMIPP_PDEV_NAME);
+	dcmipp->mdev.dev = &pdev->dev;
+	media_device_init(&dcmipp->mdev);
+
+	/* Add self to the component system */
+	ret = component_master_add_with_match(&pdev->dev, &dcmipp_comp_ops,
+					      comp_match);
+	if (ret) {
+		media_device_cleanup(&dcmipp->mdev);
+		dcmipp_rm_subdevs(dcmipp);
+		return ret;
+	}
+
+	pm_runtime_enable(dcmipp->dev);
+
+	dev_info(&pdev->dev, "Probe done");
+
+	return 0;
+}
+
+static int dcmipp_remove(struct platform_device *pdev)
+{
+	struct dcmipp_device *dcmipp = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	component_master_del(&pdev->dev, &dcmipp_comp_ops);
+	dcmipp_rm_subdevs(dcmipp);
+
+	return 0;
+}
+
+static __maybe_unused int dcmipp_runtime_suspend(struct device *dev)
+{
+	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dcmipp->kclk);
+
+	return 0;
+}
+
+static __maybe_unused int dcmipp_runtime_resume(struct device *dev)
+{
+	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dcmipp->kclk);
+	if (ret)
+		dev_err(dev, "%s: Failed to prepare_enable k clock\n", __func__);
+
+	return ret;
+}
+
+static __maybe_unused int dcmipp_suspend(struct device *dev)
+{
+	/* disable clock */
+	pm_runtime_force_suspend(dev);
+
+	/* change pinctrl state */
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static __maybe_unused int dcmipp_resume(struct device *dev)
+{
+	/* restore pinctl default state */
+	pinctrl_pm_select_default_state(dev);
+
+	/* clock enable */
+	pm_runtime_force_resume(dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dcmipp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dcmipp_suspend, dcmipp_resume)
+	SET_RUNTIME_PM_OPS(dcmipp_runtime_suspend,
+			   dcmipp_runtime_resume, NULL)
+};
+
+static struct platform_driver dcmipp_pdrv = {
+	.probe		= dcmipp_probe,
+	.remove		= dcmipp_remove,
+	.driver		= {
+		.name	= DCMIPP_PDEV_NAME,
+		.of_match_table = of_match_ptr(dcmipp_of_match),
+		.pm = &dcmipp_pm_ops,
+	},
+};
+
+module_platform_driver(dcmipp_pdrv);
+
+MODULE_AUTHOR("Hugues Fruchet <hugues.fruchet@foss.st.com>");
+MODULE_AUTHOR("Alain Volmat <alain.volmat@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 Digital Camera Memory Interface with Pixel Processor driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
new file mode 100644
index 000000000000..37215791c01c
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/v4l2-mediabus.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+
+#define DCMIPP_PAR_DRV_NAME "dcmipp-parallel"
+
+#define DCMIPP_PRCR (0x104)
+#define DCMIPP_PRCR_FORMAT_SHIFT 16
+#define DCMIPP_PRCR_FORMAT_YUV422 0x1E
+#define DCMIPP_PRCR_FORMAT_RGB565 0x22
+#define DCMIPP_PRCR_FORMAT_RAW8 0x2A
+#define DCMIPP_PRCR_FORMAT_G8 0x4A
+#define DCMIPP_PRCR_FORMAT_BYTE_STREAM 0x5A
+#define DCMIPP_PRCR_ESS BIT(4)
+#define DCMIPP_PRCR_PCKPOL BIT(5)
+#define DCMIPP_PRCR_HSPOL BIT(6)
+#define DCMIPP_PRCR_VSPOL BIT(7)
+#define DCMIPP_PRCR_ENABLE BIT(14)
+#define DCMIPP_PRCR_SWAPCYCLES BIT(25)
+#define DCMIPP_PRCR_SWAPBITS BIT(26)
+
+#define DCMIPP_PRESCR (0x108)
+#define DCMIPP_PRESUR (0x10c)
+
+#define IS_SINK(pad) (!(pad))
+#define IS_SRC(pad)  ((pad))
+
+#define PAR_MEDIA_BUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB565_2X8_LE
+
+struct dcmipp_par_pix_map {
+	unsigned int code_sink;
+	unsigned int code_src;
+	u8 prcr_format;
+	u8 prcr_swapbits;
+	u8 prcr_swapcycles;
+};
+
+#define PIXMAP_SINK_SRC_PRCR_SWAP(sink, src, prcr, swap)	\
+		{						\
+			.code_sink = MEDIA_BUS_FMT_##sink,		\
+			.code_src = MEDIA_BUS_FMT_##src,		\
+			.prcr_format = DCMIPP_PRCR_FORMAT_##prcr,	\
+			.prcr_swapcycles = swap,		\
+		}
+static const struct dcmipp_par_pix_map dcmipp_par_pix_map_list[] = {
+	/* RGB565 */
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0),
+	/* YUV422 */
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1),
+	/* GREY */
+	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0),
+	/* Raw Bayer */
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR8_1X8, SBGGR8_1X8, RAW8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG8_1X8, SGBRG8_1X8, RAW8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG8_1X8, SGRBG8_1X8, RAW8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB8_1X8, SRGGB8_1X8, RAW8, 0),
+	/* JPEG */
+	PIXMAP_SINK_SRC_PRCR_SWAP(JPEG_1X8, JPEG_1X8, BYTE_STREAM, 0),
+};
+
+/*
+ * Search through the pix_map table, skipping two consecutive entry with the
+ * same code
+ */
+static inline const struct dcmipp_par_pix_map *dcmipp_par_pix_map_by_index
+						(unsigned int index,
+						 unsigned int pad)
+{
+	const struct dcmipp_par_pix_map *l = dcmipp_par_pix_map_list;
+	unsigned int size = ARRAY_SIZE(dcmipp_par_pix_map_list);
+	unsigned int i = 0;
+	u32 prev_code = 0, cur_code;
+
+	while (i < size) {
+		if (IS_SRC(pad))
+			cur_code = l[i].code_src;
+		else
+			cur_code = l[i].code_sink;
+
+		if (cur_code == prev_code) {
+			i++;
+			continue;
+		} else {
+			prev_code = cur_code;
+		}
+
+		if (index == 0)
+			break;
+		i++;
+		index--;
+	}
+
+	if (i >= size)
+		return NULL;
+
+	return &l[i];
+}
+
+static inline const struct dcmipp_par_pix_map *dcmipp_par_pix_map_by_code
+					(u32 code_sink, u32 code_src)
+{
+	const struct dcmipp_par_pix_map *l = dcmipp_par_pix_map_list;
+	unsigned int size = ARRAY_SIZE(dcmipp_par_pix_map_list);
+	unsigned int i;
+
+	for (i = 0; i < size; i++) {
+		if ((l[i].code_sink == code_sink && l[i].code_src == code_src) ||
+		    (l[i].code_sink == code_src && l[i].code_src == code_sink) ||
+		    (l[i].code_sink == code_sink && code_src == 0) ||
+		    (code_sink == 0 && l[i].code_src == code_src))
+			return &l[i];
+	}
+	return NULL;
+}
+
+struct dcmipp_par_device {
+	struct dcmipp_ent_device ved;
+	struct v4l2_subdev sd;
+	struct device *dev;
+	/* The active format */
+	struct v4l2_mbus_framefmt sink_format;
+	struct v4l2_mbus_framefmt src_format;
+	bool streaming;
+	void __iomem			*regs;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.code = PAR_MEDIA_BUS_FMT_DEFAULT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static int dcmipp_par_init_cfg(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state)
+{
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		struct v4l2_mbus_framefmt *mf;
+
+		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
+		*mf = fmt_default;
+	}
+
+	return 0;
+}
+
+static int dcmipp_par_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct dcmipp_par_pix_map *vpix =
+		dcmipp_par_pix_map_by_index(code->index, code->pad);
+
+	if (!vpix)
+		return -EINVAL;
+
+	code->code = IS_SRC(code->pad) ? vpix->code_src : vpix->code_sink;
+
+	return 0;
+}
+
+static int dcmipp_par_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct dcmipp_par_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_par_pix_map_by_code(IS_SINK(fse->pad) ? fse->code : 0,
+					  IS_SRC(fse->pad) ? fse->code : 0);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fse->max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fse->min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fse->max_height = DCMIPP_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int dcmipp_par_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct dcmipp_par_device *par =
+				container_of(sd, struct dcmipp_par_device, sd);
+
+	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
+		      *v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) :
+		      (IS_SRC(fmt->pad) ? par->src_format : par->sink_format);
+
+	return 0;
+}
+
+static void dcmipp_par_adjust_fmt(struct dcmipp_par_device *par,
+				  struct v4l2_mbus_framefmt *fmt, __u32 pad)
+{
+	const struct dcmipp_par_pix_map *vpix;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_par_pix_map_by_code(IS_SINK(pad) ? fmt->code : 0,
+					  IS_SRC(pad) ? fmt->code : 0);
+	if (!vpix)
+		fmt->code = fmt_default.code;
+
+	/* Exclude JPEG if BT656 bus is selected */
+	if (vpix && vpix->code_sink == MEDIA_BUS_FMT_JPEG_1X8 &&
+	    par->ved.bus_type == V4L2_MBUS_BT656)
+		fmt->code = fmt_default.code;
+
+	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
+			     DCMIPP_FRAME_MAX_WIDTH) & ~1;
+	fmt->height = clamp_t(u32, fmt->height, DCMIPP_FRAME_MIN_HEIGHT,
+			      DCMIPP_FRAME_MAX_HEIGHT) & ~1;
+
+	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+		fmt->field = fmt_default.field;
+
+	dcmipp_colorimetry_clamp(fmt);
+}
+
+static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct dcmipp_par_device *par = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *mf;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		/* Do not change the format while stream is on */
+		if (par->streaming)
+			return -EBUSY;
+
+		mf = IS_SRC(fmt->pad) ? &par->src_format : &par->sink_format;
+	} else {
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+	}
+
+	/* Set the new format */
+	dcmipp_par_adjust_fmt(par, &fmt->format, fmt->pad);
+
+	dev_dbg(par->dev, "%s: format update: old:%dx%d (0x%x, %d, %d, %d, %d) new:%dx%d (0x%x, %d, %d, %d, %d)\n",
+		par->sd.name,
+		/* old */
+		mf->width, mf->height, mf->code,
+		mf->colorspace,	mf->quantization,
+		mf->xfer_func, mf->ycbcr_enc,
+		/* new */
+		fmt->format.width, fmt->format.height, fmt->format.code,
+		fmt->format.colorspace, fmt->format.quantization,
+		fmt->format.xfer_func, fmt->format.ycbcr_enc);
+
+	*mf = fmt->format;
+
+	/* When setting the sink format, report that format on the src pad as well */
+	if (IS_SINK(fmt->pad))
+		par->src_format = fmt->format;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
+	.init_cfg		= dcmipp_par_init_cfg,
+	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
+	.enum_frame_size	= dcmipp_par_enum_frame_size,
+	.get_fmt		= dcmipp_par_get_fmt,
+	.set_fmt		= dcmipp_par_set_fmt,
+};
+
+static int dcmipp_par_configure(struct dcmipp_par_device *par)
+{
+	u32 val = 0;
+	const struct dcmipp_par_pix_map *vpix;
+
+	/* Set vertical synchronization polarity */
+	if (par->ved.bus.flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
+		val |= DCMIPP_PRCR_VSPOL;
+
+	/* Set horizontal synchronization polarity */
+	if (par->ved.bus.flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+		val |= DCMIPP_PRCR_HSPOL;
+
+	/* Set pixel clock polarity */
+	if (par->ved.bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+		val |= DCMIPP_PRCR_PCKPOL;
+
+	/*
+	 * BT656 embedded synchronisation bus mode.
+	 *
+	 * Default SAV/EAV mode is supported here with default codes
+	 * SAV=0xff000080 & EAV=0xff00009d.
+	 * With DCMIPP this means LSC=SAV=0x80 & LEC=EAV=0x9d.
+	 */
+	if (par->ved.bus_type == V4L2_MBUS_BT656) {
+		val |= DCMIPP_PRCR_ESS;
+
+		/* Unmask all codes */
+		reg_write(par, DCMIPP_PRESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
+
+		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
+		reg_write(par, DCMIPP_PRESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
+	}
+
+	/* Set format */
+	vpix = dcmipp_par_pix_map_by_code(par->sink_format.code,
+					  par->src_format.code);
+	if (!vpix) {
+		dev_err(par->dev, "Invalid sink/src format configuration\n");
+		return -EINVAL;
+	}
+
+	val |= vpix->prcr_format << DCMIPP_PRCR_FORMAT_SHIFT;
+
+	/* swap LSB vs MSB within one cycle */
+	if (vpix->prcr_swapbits)
+		val |= DCMIPP_PRCR_SWAPBITS;
+
+	/* swap cycles */
+	if (vpix->prcr_swapcycles)
+		val |= DCMIPP_PRCR_SWAPCYCLES;
+
+	reg_write(par, DCMIPP_PRCR, val);
+
+	return 0;
+}
+
+static int dcmipp_par_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct dcmipp_par_device *par =
+				container_of(sd, struct dcmipp_par_device, sd);
+	int ret = 0;
+
+	if (enable) {
+		ret = dcmipp_par_configure(par);
+		if (ret)
+			return ret;
+
+		/* Enable parallel interface */
+		reg_set(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	} else {
+		/* Disable parallel interface */
+		reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	}
+
+	par->streaming = enable;
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops dcmipp_par_video_ops = {
+	.s_stream = dcmipp_par_s_stream,
+};
+
+static const struct v4l2_subdev_ops dcmipp_par_ops = {
+	.pad = &dcmipp_par_pad_ops,
+	.video = &dcmipp_par_video_ops,
+};
+
+static void dcmipp_par_release(struct v4l2_subdev *sd)
+{
+	struct dcmipp_par_device *par =
+				container_of(sd, struct dcmipp_par_device, sd);
+
+	kfree(par);
+}
+
+static const struct v4l2_subdev_internal_ops dcmipp_par_int_ops = {
+	.release = dcmipp_par_release,
+};
+
+static void dcmipp_par_comp_unbind(struct device *comp, struct device *master,
+				   void *master_data)
+{
+	struct dcmipp_ent_device *ved = dev_get_drvdata(comp);
+	struct dcmipp_par_device *par =
+			container_of(ved, struct dcmipp_par_device, ved);
+
+	dcmipp_ent_sd_unregister(ved, &par->sd);
+}
+
+static int dcmipp_par_comp_bind(struct device *comp, struct device *master,
+				void *master_data)
+{
+	struct dcmipp_bind_data *bind_data = master_data;
+	struct dcmipp_platform_data *pdata = comp->platform_data;
+	struct dcmipp_par_device *par;
+	int ret;
+
+	/* Allocate the par struct */
+	par = kzalloc(sizeof(*par), GFP_KERNEL);
+	if (!par)
+		return -ENOMEM;
+
+	par->regs = bind_data->regs;
+
+	/* Initialize ved and sd */
+	ret = dcmipp_ent_sd_register
+		(&par->ved, &par->sd, bind_data->v4l2_dev,
+		 pdata->entity_name,
+		 MEDIA_ENT_F_VID_IF_BRIDGE, 2,
+		 (const unsigned long[2]) {
+		  MEDIA_PAD_FL_SINK,
+		  MEDIA_PAD_FL_SOURCE,
+		  },
+		 &dcmipp_par_int_ops, &dcmipp_par_ops,
+		 NULL, NULL);
+	if (ret)
+		goto err_free_hdl;
+
+	dev_set_drvdata(comp, &par->ved);
+	par->dev = comp;
+
+	/* Initialize the frame format */
+	par->sink_format = fmt_default;
+	par->src_format = fmt_default;
+
+	return 0;
+
+err_free_hdl:
+	kfree(par);
+
+	return ret;
+}
+
+static const struct component_ops dcmipp_par_comp_ops = {
+	.bind = dcmipp_par_comp_bind,
+	.unbind = dcmipp_par_comp_unbind,
+};
+
+static int dcmipp_par_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &dcmipp_par_comp_ops);
+}
+
+static int dcmipp_par_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dcmipp_par_comp_ops);
+
+	return 0;
+}
+
+static const struct platform_device_id dcmipp_par_driver_ids[] = {
+	{
+		.name           = DCMIPP_PAR_DRV_NAME,
+	},
+	{ }
+};
+
+static struct platform_driver dcmipp_par_pdrv = {
+	.probe		= dcmipp_par_probe,
+	.remove		= dcmipp_par_remove,
+	.id_table	= dcmipp_par_driver_ids,
+	.driver		= {
+		.name	= DCMIPP_PAR_DRV_NAME,
+	},
+};
+
+module_platform_driver(dcmipp_par_pdrv);
+
+MODULE_DEVICE_TABLE(platform, dcmipp_par_driver_ids);
+
+MODULE_AUTHOR("Hugues Fruchet <hugues.fruchet@foss.st.com>");
+MODULE_AUTHOR("Alain Volmat <hugues.fruchet@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 Digital Camera Memory Interface with Pixel Processor driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

