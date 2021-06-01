Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1CD391BD2
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 17:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235560AbhEZP0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 11:26:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59400 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235460AbhEZP0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 11:26:19 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QFOMwo001777;
        Wed, 26 May 2021 10:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622042662;
        bh=bu6k1J8XXPw2Jq39WYBihiEvT/VoBWeC2TUdk9s0SNs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YisCfrU6IjOhF9rZ+5AkOKjfvq43jk+KB15Kugn3eR6xVgMHesy2Amz/KoAh+DuJI
         pEMaXyl1DuHjhjdrQFOBo6wGH9XOamIezBlE2qYJ67fmiQgEklVOVGuYBiTMP4KIuT
         iVMLMYHTwva+2h9XT5d3Bfj8KmYOAkt/swRkUkss=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QFOL9F115866
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 10:24:21 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 10:24:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 10:24:21 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QFN9Jl056314;
        Wed, 26 May 2021 10:24:16 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Benoit Parrot <bparrot@ti.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <dmaengine@vger.kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 13/18] media: ti: Add CSI2RX support for J721E
Date:   Wed, 26 May 2021 20:53:03 +0530
Message-ID: <20210526152308.16525-14-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210526152308.16525-1-p.yadav@ti.com>
References: <20210526152308.16525-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TI's J721E uses the Cadence CSI2RX and DPHY peripherals to facilitate
capture over a CSI-2 bus.

The Cadence CSI2RX IP acts as a bridge between the TI specific parts and
the CSI-2 protocol parts. TI then has a wrapper on top of this bridge
called the SHIM layer. It takes in data from stream 0, repacks it, and
sends it to memory over PSI-L DMA.

This driver acts as the "front end" to V4L2 client applications. It
implements the required ioctls and buffer operations, passes the
necessary calls on to the bridge, programs the SHIM layer, and performs
DMA via the dmaengine API to finally return the data to a buffer
supplied by the application.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v2:
- Use dmaengine_get_dma_device() instead of directly accessing
  dma->device->dev.
- Do not set dst_addr_width when configuring slave DMA.
- Move to a separate subdir and rename to j721e-csi2rx.c
- Convert compatible to ti,j721e-csi2rx.
- Move to use Media Controller centric APIs.
- Improve cleanup in probe when one of the steps fails.
- Add colorspace to formats database.
- Set hw_revision on media_device.
- Move video device initialization to probe time instead of register time.

 MAINTAINERS                                   |   6 +
 drivers/media/platform/Kconfig                |  12 +
 drivers/media/platform/ti/Makefile            |   1 +
 .../media/platform/ti/j721e-csi2rx/Makefile   |   2 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 884 ++++++++++++++++++
 5 files changed, 905 insertions(+)
 create mode 100644 drivers/media/platform/ti/j721e-csi2rx/Makefile
 create mode 100644 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 607dd5e18e7d..2cf140a02063 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18332,6 +18332,12 @@ S:	Odd Fixes
 F:	drivers/clk/ti/
 F:	include/linux/clk/ti.h
 
+TI J721E CSI2RX DRIVER
+M:	Pratyush Yadav <p.yadav@ti.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	drivers/media/platform/ti/j721e-csi2rx/
+
 TI DAVINCI MACHINE SUPPORT
 M:	Sekhar Nori <nsekhar@ti.com>
 R:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 157c924686e4..732a942b3b29 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -200,6 +200,18 @@ config VIDEO_TI_CAL_MC
 
 endif # VIDEO_TI_CAL
 
+config VIDEO_TI_J721E_CSI2RX
+	tristate "TI J721E CSI2RX wrapper layer driver"
+	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_SUPPORT && MEDIA_CONTROLLER
+	depends on PHY_CADENCE_DPHY && VIDEO_CADENCE_CSI2RX
+	depends on ARCH_K3 || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  Support for TI CSI2RX wrapper layer. This just enables the wrapper driver.
+	  The Cadence CSI2RX bridge driver needs to be enabled separately.
+
 endif # V4L_PLATFORM_DRIVERS
 
 menuconfig V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/ti/Makefile b/drivers/media/platform/ti/Makefile
index bbc737ccbbea..17c9cfb74f66 100644
--- a/drivers/media/platform/ti/Makefile
+++ b/drivers/media/platform/ti/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += cal/
 obj-y += vpe/
+obj-y += j721e-csi2rx/
diff --git a/drivers/media/platform/ti/j721e-csi2rx/Makefile b/drivers/media/platform/ti/j721e-csi2rx/Makefile
new file mode 100644
index 000000000000..377afc1d6280
--- /dev/null
+++ b/drivers/media/platform/ti/j721e-csi2rx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_TI_J721E_CSI2RX) += j721e-csi2rx.o
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
new file mode 100644
index 000000000000..b8d31a0af6d8
--- /dev/null
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -0,0 +1,884 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI CSI2 RX driver.
+ *
+ * Copyright (C) 2021 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Author: Pratyush Yadav <p.yadav@ti.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/dmaengine.h>
+#include <linux/of_platform.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+
+#define TI_CSI2RX_MODULE_NAME		"j721e-csi2rx"
+
+#define SHIM_CNTL			0x10
+#define SHIM_CNTL_PIX_RST		BIT(0)
+
+#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX_EN			BIT(31)
+#define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
+#define SHIM_DMACNTX_FMT		GENMASK(5, 0)
+#define SHIM_DMACNTX_UYVY		0
+#define SHIM_DMACNTX_VYUY		1
+#define SHIM_DMACNTX_YUYV		2
+#define SHIM_DMACNTX_YVYU		3
+
+#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
+#define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 15)
+
+#define CSI_DF_YUV420			0x18
+#define CSI_DF_YUV422			0x1e
+#define CSI_DF_RGB444			0x20
+#define CSI_DF_RGB888			0x24
+
+#define PSIL_WORD_SIZE_BYTES		16
+
+struct ti_csi2rx_fmt {
+	u32				fourcc;	/* Four character code. */
+	u32				code;	/* Mbus code. */
+	enum v4l2_colorspace		colorspace;
+	u32				csi_df;	/* CSI Data format. */
+	u8				bpp;	/* Bits per pixel. */
+};
+
+struct ti_csi2rx_buffer {
+	/* Common v4l2 buffer. Must be first. */
+	struct vb2_v4l2_buffer		vb;
+	struct list_head		list;
+};
+
+struct ti_csi2rx_dmaq {
+	struct list_head		list;
+};
+
+struct ti_csi2rx_dev {
+	struct device			*dev;
+	void __iomem			*shim;
+	struct v4l2_device		v4l2_dev;
+	struct video_device		vdev;
+	struct media_device		mdev;
+	struct media_pipeline		pipe;
+	struct media_pad		pad;
+	struct v4l2_async_notifier	notifier;
+	struct v4l2_subdev		*subdev;
+	struct vb2_queue		vidq;
+	struct mutex			mutex; /* To serialize ioctls. */
+	struct v4l2_format		v_fmt;
+	struct dma_chan			*dma;
+	struct ti_csi2rx_dmaq		dmaq;
+	u32				sequence;
+};
+
+static const struct ti_csi2rx_fmt formats[] = {
+	{
+		.fourcc			= V4L2_PIX_FMT_YUYV,
+		.code			= MEDIA_BUS_FMT_YUYV8_2X8,
+		.colorspace		= V4L2_COLORSPACE_SRGB,
+		.csi_df			= CSI_DF_YUV422,
+		.bpp			= 16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_UYVY,
+		.code			= MEDIA_BUS_FMT_UYVY8_2X8,
+		.colorspace		= V4L2_COLORSPACE_SRGB,
+		.csi_df			= CSI_DF_YUV422,
+		.bpp			= 16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_YVYU,
+		.code			= MEDIA_BUS_FMT_YVYU8_2X8,
+		.colorspace		= V4L2_COLORSPACE_SRGB,
+		.csi_df			= CSI_DF_YUV422,
+		.bpp			= 16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_VYUY,
+		.code			= MEDIA_BUS_FMT_VYUY8_2X8,
+		.colorspace		= V4L2_COLORSPACE_SRGB,
+		.csi_df			= CSI_DF_YUV422,
+		.bpp			= 16,
+	},
+
+	/* More formats can be supported but they are not listed for now. */
+};
+
+static const unsigned int num_formats = ARRAY_SIZE(formats);
+
+/* Forward declaration needed by ti_csi2rx_dma_callback. */
+static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
+			       struct ti_csi2rx_buffer *buf);
+
+static const struct ti_csi2rx_fmt *find_format_by_pix(u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_formats; i++) {
+		if (formats[i].fourcc == pixelformat)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
+			       struct v4l2_format *v4l2_fmt)
+{
+	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
+	u32 bpl;
+
+	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	pix->pixelformat = csi_fmt->fourcc;
+	pix->colorspace = csi_fmt->colorspace;
+	pix->sizeimage = pix->height * pix->width * (csi_fmt->bpp / 8);
+
+	bpl = (pix->width * ALIGN(csi_fmt->bpp, 8)) >> 3;
+	pix->bytesperline = ALIGN(bpl, 16);
+}
+
+static int ti_csi2rx_querycap(struct file *file, void *priv,
+			      struct v4l2_capability *cap)
+{
+	struct ti_csi2rx_dev *csi = video_drvdata(file);
+
+	strscpy(cap->driver, TI_CSI2RX_MODULE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, TI_CSI2RX_MODULE_NAME, sizeof(cap->card));
+
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(csi->dev));
+
+	return 0;
+}
+
+static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
+				      struct v4l2_fmtdesc *f)
+{
+	if (f->index >= num_formats)
+		return -EINVAL;
+
+	memset(f->reserved, 0, sizeof(f->reserved));
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	f->pixelformat = formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *prov,
+				   struct v4l2_format *f)
+{
+	struct ti_csi2rx_dev *csi = video_drvdata(file);
+
+	*f = csi->v_fmt;
+
+	return 0;
+}
+
+static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
+				     struct v4l2_format *f)
+{
+	const struct ti_csi2rx_fmt *fmt;
+
+	/*
+	 * Default to the first format if the requested pixel format code isn't
+	 * supported.
+	 */
+	fmt = find_format_by_pix(f->fmt.pix.pixelformat);
+	if (!fmt)
+		fmt = &formats[0];
+
+	if (f->fmt.pix.field == V4L2_FIELD_ANY)
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+
+	if (f->fmt.pix.field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	ti_csi2rx_fill_fmt(fmt, f);
+
+	return 0;
+}
+
+static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct ti_csi2rx_dev *csi = video_drvdata(file);
+	struct vb2_queue *q = &csi->vidq;
+	int ret;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	ret = ti_csi2rx_try_fmt_vid_cap(file, priv, f);
+	if (ret < 0)
+		return ret;
+
+	csi->v_fmt = *f;
+
+	return 0;
+}
+
+static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
+				     struct v4l2_frmsizeenum *fsize)
+{
+	const struct ti_csi2rx_fmt *fmt;
+	u8 bpp;
+
+	fmt = find_format_by_pix(fsize->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	bpp = ALIGN(fmt->bpp, 8);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = PSIL_WORD_SIZE_BYTES * 8 / bpp;
+	fsize->stepwise.max_width = UINT_MAX;
+	fsize->stepwise.step_width = PSIL_WORD_SIZE_BYTES * 8 / bpp;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = UINT_MAX;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops csi_ioctl_ops = {
+	.vidioc_querycap      = ti_csi2rx_querycap,
+	.vidioc_enum_fmt_vid_cap = ti_csi2rx_enum_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = ti_csi2rx_try_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap = ti_csi2rx_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = ti_csi2rx_s_fmt_vid_cap,
+	.vidioc_enum_framesizes = ti_csi2rx_enum_framesizes,
+	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf      = vb2_ioctl_querybuf,
+	.vidioc_qbuf          = vb2_ioctl_qbuf,
+	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
+	.vidioc_streamon      = vb2_ioctl_streamon,
+	.vidioc_streamoff     = vb2_ioctl_streamoff,
+};
+
+static const struct v4l2_file_operations csi_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int ti_csi2rx_video_register(struct ti_csi2rx_dev *csi)
+{
+	struct video_device *vdev = &csi->vdev;
+	int ret, src_pad;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	src_pad = media_entity_get_fwnode_pad(&csi->subdev->entity,
+					      csi->subdev->fwnode,
+					      MEDIA_PAD_FL_SOURCE);
+	if (src_pad < 0) {
+		dev_err(csi->dev, "Couldn't find source pad for subdev\n");
+		return src_pad;
+	}
+
+	ret = media_create_pad_link(&csi->subdev->entity, src_pad,
+				    &vdev->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		video_unregister_device(vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int csi_async_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_subdev *asd)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
+
+	csi->subdev = subdev;
+
+	return 0;
+}
+
+static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
+	int ret;
+
+	ret = ti_csi2rx_video_register(csi);
+	if (ret)
+		return ret;
+
+	return v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations csi_async_notifier_ops = {
+	.bound = csi_async_notifier_bound,
+	.complete = csi_async_notifier_complete,
+};
+
+static int ti_csi2rx_init_subdev(struct ti_csi2rx_dev *csi)
+{
+	struct fwnode_handle *fwnode;
+	struct v4l2_async_subdev *asd;
+	struct device_node *node;
+	int ret;
+
+	node = of_get_child_by_name(csi->dev->of_node, "csi-bridge");
+	if (!node)
+		return -EINVAL;
+
+	fwnode = of_fwnode_handle(node);
+	of_node_put(node);
+	if (!fwnode)
+		return -EINVAL;
+
+	v4l2_async_notifier_init(&csi->notifier);
+	csi->notifier.ops = &csi_async_notifier_ops;
+
+	asd = v4l2_async_notifier_add_fwnode_subdev(&csi->notifier, fwnode,
+						    struct v4l2_async_subdev);
+	if (IS_ERR(asd)) {
+		v4l2_async_notifier_cleanup(&csi->notifier);
+		return PTR_ERR(asd);
+	}
+
+	ret = v4l2_async_notifier_register(&csi->v4l2_dev, &csi->notifier);
+	if (ret) {
+		v4l2_async_notifier_cleanup(&csi->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
+{
+	const struct ti_csi2rx_fmt *fmt;
+	unsigned int reg;
+
+	fmt = find_format_by_pix(csi->v_fmt.fmt.pix.pixelformat);
+	if (!fmt) {
+		dev_err(csi->dev, "Unknown format\n");
+		return;
+	}
+
+	/* De-assert the pixel interface reset. */
+	reg = SHIM_CNTL_PIX_RST;
+	writel(reg, csi->shim + SHIM_CNTL);
+
+	reg = SHIM_DMACNTX_EN;
+	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_df);
+
+	/*
+	 * Using the values from the documentation gives incorrect ordering for
+	 * the luma and chroma components. In practice, the "reverse" format
+	 * gives the correct image. So for example, if the image is in UYVY, the
+	 * reverse would be YVYU.
+	 */
+	switch (fmt->fourcc) {
+	case V4L2_PIX_FMT_UYVY:
+		reg |= FIELD_PREP(SHIM_DMACNTX_YUV422,
+					SHIM_DMACNTX_YVYU);
+		break;
+	case V4L2_PIX_FMT_VYUY:
+		reg |= FIELD_PREP(SHIM_DMACNTX_YUV422,
+					SHIM_DMACNTX_YUYV);
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		reg |= FIELD_PREP(SHIM_DMACNTX_YUV422,
+					SHIM_DMACNTX_VYUY);
+		break;
+	case V4L2_PIX_FMT_YVYU:
+		reg |= FIELD_PREP(SHIM_DMACNTX_YUV422,
+					SHIM_DMACNTX_UYVY);
+		break;
+	default:
+		/* Ignore if not YUV 4:2:2 */
+		break;
+	}
+
+	writel(reg, csi->shim + SHIM_DMACNTX);
+
+	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
+	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 1);
+	writel(reg, csi->shim + SHIM_PSI_CFG0);
+}
+
+static void ti_csi2rx_dma_callback(void *param)
+{
+	struct ti_csi2rx_dev *csi = param;
+	struct ti_csi2rx_buffer *buf;
+	struct ti_csi2rx_dmaq *dmaq = &csi->dmaq;
+
+	buf = list_entry(dmaq->list.next, struct ti_csi2rx_buffer, list);
+	list_del(&buf->list);
+
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	buf->vb.sequence = csi->sequence++;
+
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	/* If there are more buffers to process then start their transfer. */
+	if (list_empty(&dmaq->list))
+		return;
+
+	buf = list_entry(dmaq->list.next, struct ti_csi2rx_buffer, list);
+
+	if (ti_csi2rx_start_dma(csi, buf))
+		dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
+}
+
+static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
+			       struct ti_csi2rx_buffer *buf)
+{
+	unsigned long addr;
+	struct dma_async_tx_descriptor *desc;
+	size_t len = csi->v_fmt.fmt.pix.sizeimage;
+	dma_cookie_t cookie;
+	int ret = 0;
+
+	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	desc = dmaengine_prep_slave_single(csi->dma, addr, len, DMA_DEV_TO_MEM,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc)
+		return -EIO;
+
+	desc->callback = ti_csi2rx_dma_callback;
+	desc->callback_param = csi;
+
+	cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	dma_async_issue_pending(csi->dma);
+
+	return 0;
+}
+
+static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
+				 unsigned int *nplanes, unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(q);
+	unsigned int size = csi->v_fmt.fmt.pix.sizeimage;
+
+	if (*nplanes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+		size = sizes[0];
+	}
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	return 0;
+}
+
+static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long size = csi->v_fmt.fmt.pix.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(csi->dev, "Data will not fit into plane\n");
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+	return 0;
+}
+
+static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
+{
+	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
+	struct ti_csi2rx_buffer *buf;
+	struct ti_csi2rx_dmaq *dmaq = &csi->dmaq;
+
+	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
+
+	list_add_tail(&buf->list, &dmaq->list);
+}
+
+/*
+ * Find the input format. This is done by finding the first device in the
+ * pipeline which can tell us the current format. This could be the sensor, or
+ * this could be another device in the middle which is capable of format
+ * conversions.
+ */
+static int ti_csi2rx_validate_pipeline(struct ti_csi2rx_dev *csi)
+{
+	struct media_pipeline *pipe = &csi->pipe;
+	struct media_entity *entity;
+	struct v4l2_subdev *sd;
+	struct v4l2_subdev_format fmt;
+	struct v4l2_pix_format *pix = &csi->v_fmt.fmt.pix;
+	const struct ti_csi2rx_fmt *ti_fmt;
+	int ret;
+
+	media_graph_walk_start(&pipe->graph, &csi->vdev.entity);
+
+	while ((entity = media_graph_walk_next(&pipe->graph))) {
+		if (!is_media_entity_v4l2_subdev(entity))
+			continue;
+
+		sd = media_entity_to_v4l2_subdev(entity);
+
+		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		fmt.pad = media_get_pad_index(entity, 0, PAD_SIGNAL_DEFAULT);
+
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
+		if (ret && ret != -ENOIOCTLCMD)
+			return ret;
+		if (!ret)
+			break;
+	}
+
+	/* Could not find input format. */
+	if (!entity)
+		return -EPIPE;
+
+	if (fmt.format.width != pix->width)
+		return -EPIPE;
+	if (fmt.format.height != pix->height)
+		return -EPIPE;
+
+	ti_fmt = find_format_by_pix(pix->pixelformat);
+	if (WARN_ON(!ti_fmt))
+		return -EINVAL;
+
+	if (fmt.format.code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	    fmt.format.code == MEDIA_BUS_FMT_VYUY8_2X8 ||
+	    fmt.format.code == MEDIA_BUS_FMT_YVYU8_2X8) {
+		dev_err(csi->dev,
+			"Only UYVY input allowed for YUV422 8-bit. Output format can be configured.\n");
+		return -EPIPE;
+	}
+
+	if (fmt.format.code == MEDIA_BUS_FMT_UYVY8_2X8) {
+		/* Format conversion between YUV422 formats can be done. */
+		if (ti_fmt->code != MEDIA_BUS_FMT_UYVY8_2X8 &&
+		    ti_fmt->code != MEDIA_BUS_FMT_YUYV8_2X8 &&
+		    ti_fmt->code != MEDIA_BUS_FMT_VYUY8_2X8 &&
+		    ti_fmt->code != MEDIA_BUS_FMT_YVYU8_2X8)
+			return -EPIPE;
+	} else if (fmt.format.code != ti_fmt->code) {
+		return -EPIPE;
+	}
+
+	if (fmt.format.field != V4L2_FIELD_NONE &&
+	    fmt.format.field != V4L2_FIELD_ANY)
+		return -EPIPE;
+
+	return 0;
+}
+
+static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
+	struct ti_csi2rx_dmaq *dmaq = &csi->dmaq;
+	struct ti_csi2rx_buffer *buf, *tmp;
+	int ret;
+
+	if (list_empty(&dmaq->list))
+		return -EIO;
+
+	ret = media_pipeline_start(&csi->vdev.entity, &csi->pipe);
+	if (ret)
+		return ret;
+
+	ret = ti_csi2rx_validate_pipeline(csi);
+	if (ret) {
+		dev_err(csi->dev,
+			"Format mismatch between source and video node\n");
+		goto err;
+	}
+
+	ti_csi2rx_setup_shim(csi);
+
+	ret = v4l2_subdev_call(csi->subdev, video, s_stream, 1);
+	if (ret)
+		goto err;
+
+	csi->sequence = 0;
+
+	buf = list_entry(dmaq->list.next, struct ti_csi2rx_buffer, list);
+	ret = ti_csi2rx_start_dma(csi, buf);
+	if (ret) {
+		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
+		goto err_stream;
+	}
+
+	return 0;
+
+err_stream:
+	v4l2_subdev_call(csi->subdev, video, s_stream, 0);
+err:
+	media_pipeline_stop(&csi->vdev.entity);
+	list_for_each_entry_safe(buf, tmp, &dmaq->list, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+
+	return ret;
+}
+
+static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
+{
+	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
+	struct ti_csi2rx_buffer *buf = NULL, *tmp;
+	int ret;
+
+	media_pipeline_stop(&csi->vdev.entity);
+
+	ret = v4l2_subdev_call(csi->subdev, video, s_stream, 0);
+	if (ret)
+		dev_err(csi->dev, "Failed to stop subdev stream\n");
+
+	writel(0, csi->shim + SHIM_CNTL);
+
+	ret = dmaengine_terminate_sync(csi->dma);
+	if (ret)
+		dev_err(csi->dev, "Failed to stop DMA\n");
+
+	writel(0, csi->shim + SHIM_DMACNTX);
+
+	list_for_each_entry_safe(buf, tmp, &csi->dmaq.list, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops csi_vb2_qops = {
+	.queue_setup = ti_csi2rx_queue_setup,
+	.buf_prepare = ti_csi2rx_buffer_prepare,
+	.buf_queue = ti_csi2rx_buffer_queue,
+	.start_streaming = ti_csi2rx_start_streaming,
+	.stop_streaming = ti_csi2rx_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
+{
+	struct vb2_queue *q = &csi->vidq;
+	int ret;
+
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
+	q->drv_priv = csi;
+	q->buf_struct_size = sizeof(struct ti_csi2rx_buffer);
+	q->ops = &csi_vb2_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->dev = dmaengine_get_dma_device(csi->dma);
+	q->lock = &csi->mutex;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+
+	csi->vdev.queue = q;
+
+	return 0;
+}
+
+static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
+{
+	struct dma_slave_config cfg;
+	int ret;
+
+	INIT_LIST_HEAD(&csi->dmaq.list);
+
+	csi->dma = NULL;
+
+	csi->dma = dma_request_chan(csi->dev, "rx0");
+	if (IS_ERR(csi->dma))
+		return PTR_ERR(csi->dma);
+
+	memset(&cfg, 0, sizeof(cfg));
+
+	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES;
+
+	ret = dmaengine_slave_config(csi->dma, &cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
+{
+	struct media_device *mdev = &csi->mdev;
+	struct video_device *vdev = &csi->vdev;
+	int ret;
+
+	mdev->dev = csi->dev;
+	mdev->hw_revision = 1;
+	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
+	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
+		 dev_name(mdev->dev));
+
+	media_device_init(mdev);
+
+	strscpy(vdev->name, TI_CSI2RX_MODULE_NAME, sizeof(vdev->name));
+	vdev->v4l2_dev = &csi->v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->fops = &csi_fops;
+	vdev->ioctl_ops = &csi_ioctl_ops;
+	vdev->release = video_device_release_empty;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->lock = &csi->mutex;
+	video_set_drvdata(vdev, csi);
+
+	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&csi->vdev.entity, 1, &csi->pad);
+	if (ret)
+		return ret;
+
+	csi->v4l2_dev.mdev = mdev;
+
+	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = media_device_register(mdev);
+	if (ret) {
+		v4l2_device_unregister(&csi->v4l2_dev);
+		media_device_cleanup(mdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_dev *csi)
+{
+	dma_release_channel(csi->dma);
+}
+
+static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
+{
+	media_device_unregister(&csi->mdev);
+	v4l2_device_unregister(&csi->v4l2_dev);
+	media_device_cleanup(&csi->mdev);
+}
+
+static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
+{
+	v4l2_async_notifier_unregister(&csi->notifier);
+	v4l2_async_notifier_cleanup(&csi->notifier);
+}
+
+static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_dev *csi)
+{
+	vb2_queue_release(&csi->vidq);
+}
+
+static int ti_csi2rx_probe(struct platform_device *pdev)
+{
+	struct ti_csi2rx_dev *csi;
+	struct resource *res;
+	int ret;
+
+	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
+	if (!csi)
+		return -ENOMEM;
+
+	csi->dev = &pdev->dev;
+	platform_set_drvdata(pdev, csi);
+
+	mutex_init(&csi->mutex);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	csi->shim = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(csi->shim))
+		return PTR_ERR(csi->shim);
+
+	ret = ti_csi2rx_init_dma(csi);
+	if (ret)
+		return ret;
+
+	ret = ti_csi2rx_v4l2_init(csi);
+	if (ret)
+		goto err_dma;
+
+	ret = ti_csi2rx_init_vb2q(csi);
+	if (ret)
+		goto err_v4l2;
+
+	ret = ti_csi2rx_init_subdev(csi);
+	if (ret)
+		goto err_vb2q;
+
+	ret = of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create children: %d\n", ret);
+		goto err_subdev;
+	}
+
+	return 0;
+
+err_subdev:
+	ti_csi2rx_cleanup_subdev(csi);
+err_vb2q:
+	ti_csi2rx_cleanup_vb2q(csi);
+err_v4l2:
+	ti_csi2rx_cleanup_v4l2(csi);
+err_dma:
+	ti_csi2rx_cleanup_dma(csi);
+	return ret;
+}
+
+static int ti_csi2rx_remove(struct platform_device *pdev)
+{
+	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
+
+	if (vb2_is_busy(&csi->vidq))
+		return -EBUSY;
+
+	video_unregister_device(&csi->vdev);
+
+	ti_csi2rx_cleanup_vb2q(csi);
+	ti_csi2rx_cleanup_subdev(csi);
+	ti_csi2rx_cleanup_v4l2(csi);
+	ti_csi2rx_cleanup_dma(csi);
+
+	return 0;
+}
+
+static const struct of_device_id ti_csi2rx_of_match[] = {
+	{ .compatible = "ti,j721e-csi2rx", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ti_csi2rx_of_match);
+
+static struct platform_driver ti_csi2rx_pdrv = {
+	.probe = ti_csi2rx_probe,
+	.remove = ti_csi2rx_remove,
+	.driver = {
+		.name = TI_CSI2RX_MODULE_NAME,
+		.of_match_table = ti_csi2rx_of_match,
+	},
+};
+
+module_platform_driver(ti_csi2rx_pdrv);
+
+MODULE_DESCRIPTION("TI J721E CSI2 RX Driver");
+MODULE_AUTHOR("Pratyush Yadav <p.yadav@ti.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION("1.0");
-- 
2.30.0

