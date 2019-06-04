Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A4D343D0
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfFDKMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:12:19 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:21251 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727298AbfFDKMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:18 -0400
X-UUID: b71fe34024024ef39acc5b4b3a5e4bb8-20190604
X-UUID: b71fe34024024ef39acc5b4b3a5e4bb8-20190604
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1925106364; Tue, 04 Jun 2019 18:12:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 18:12:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 18:12:00 +0800
From:   Stu Hsieh <stu.hsieh@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stu Hsieh <stu.hsieh@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 05/14] [media] mtk-mipicsi: register the v4l2 device for mt2712 mipicsi
Date:   Tue, 4 Jun 2019 18:11:46 +0800
Message-ID: <1559643115-15124-6-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch register the v4l2 camera for mt2712 mipicsi.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 728 ++++++++++++++++++
 1 file changed, 728 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 3d1e52411b69..28dcc683a958 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -32,14 +32,28 @@
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
 #include <linux/iommu.h>
+#include <linux/of_graph.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-core.h>
+#include <linux/videodev2.h>
 #include <soc/mediatek/smi.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 
 #define MTK_MIPICSI_DRV_NAME "mtk-mipicsi"
 #define MTK_PLATFORM_STR "platform:mt2712"
+#define MAX_SUPPORT_WIDTH             4096U
+#define MAX_SUPPORT_HEIGHT            4096U
+#define MAX_BUFFER_NUM                  32U
 
 #define MIPI_RX_ANA00_CSI				0x00
 #define MIPI_RX_ANA04_CSI				0x04
@@ -86,6 +100,28 @@
 #define IMGO_STRIDE					0x238
 #define DMA_FRAME_HEADER_EN				0xE00
 
+#define notifier_to_mipicsi(n) container_of(n, struct mtk_mipicsi_dev, \
+					    notifier)
+/* buffer for one video frame */
+struct mtk_mipicsi_buf {
+	struct list_head queue;
+	struct vb2_buffer *vb;
+	dma_addr_t vb_dma_addr_phy;
+	int prepare_flag;
+};
+
+struct mtk_format {
+	u32     fourcc;
+	u32     mbus_code;
+	u8      bpp;
+};
+
+struct mtk_mipicsi_subdev {
+	struct device_node *node;
+	struct v4l2_async_subdev asd;
+	struct v4l2_subdev *subdev;
+};
+
 struct mtk_mipicsi_channel {
 	void __iomem            *seninf_mux;
 	void __iomem            *camsv;
@@ -103,6 +139,47 @@ struct mtk_mipicsi_dev {
 	void __iomem		*seninf_ctrl;
 	void __iomem		*seninf;
 	struct regmap		*seninf_top;
+
+	struct v4l2_device	v4l2_dev;
+	struct video_device	*vdev;
+	struct vb2_queue	queue;
+	struct v4l2_async_notifier	notifier;
+	struct mtk_mipicsi_subdev	mipicsi_sd;
+	struct v4l2_format		fmt;
+	unsigned int			num_user_formats;
+	const struct mtk_format		**user_formats;
+	const struct mtk_format		*current_fmt;
+
+	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
+	struct list_head	fb_list;
+	bool streamon;
+	char drv_name[16];
+	u32 id;
+
+	spinlock_t		irqlock;
+	spinlock_t		queue_lock;
+	struct mutex		lock;
+
+};
+
+static const struct mtk_format mtk_mipicsi_formats[] = {
+{
+	.fourcc = V4L2_PIX_FMT_YUYV,
+	.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+	.bpp = 2,
+}, {
+	.fourcc = V4L2_PIX_FMT_YVYU,
+	.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
+	.bpp = 2,
+}, {
+	.fourcc = V4L2_PIX_FMT_UYVY,
+	.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
+	.bpp = 2,
+}, {
+	.fourcc = V4L2_PIX_FMT_VYUY,
+	.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
+	.bpp = 2,
+},
 };
 
 static void mtk_mipicsi_ana_init(void __iomem *base)
@@ -335,6 +412,321 @@ static const struct dev_pm_ops mtk_mipicsi_pm = {
 		mtk_mipicsi_pm_resume, NULL)
 };
 
+static int mtk_mipicsi_vb2_queue_setup(struct vb2_queue *vq,
+		unsigned int *nbufs, unsigned int *num_planes,
+		unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vq);
+	u32 sizeimage = mipicsi->fmt.fmt.pix.sizeimage;
+
+	if (*nbufs == 0U || *nbufs > MAX_BUFFER_NUM)
+		*nbufs = MAX_BUFFER_NUM;
+
+	/*
+	 * Called from VIDIOC_REQBUFS or in compatibility mode For YUV422P
+	 * format, even if there are 3 planes Y, U and V, we reply there is only
+	 * one plane, containing Y, U and V data, one after the other.
+	 */
+	if (*num_planes != 0U)
+		return sizes[0] < sizeimage ? -EINVAL : 0;
+
+	sizes[0] = sizeimage;
+	*num_planes = 1;
+
+	return 0;
+}
+
+static int mtk_mipicsi_vb2_init(struct vb2_buffer *vb)
+{
+	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vb->vb2_queue);
+
+	mipicsi->cam_buf[vb->index].prepare_flag = 0;
+
+	return 0;
+}
+
+static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_mipicsi_buf *buf;
+	u32 size = 0;
+
+	buf = &mipicsi->cam_buf[vb->index];
+	size = mipicsi->fmt.fmt.pix.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(&mipicsi->pdev->dev, "data will not fit into plane (%lu < %u)",
+			vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+
+	if ((buf->prepare_flag) == 0) {
+		buf->prepare_flag = 1;
+		buf->vb_dma_addr_phy =
+			vb2_dma_contig_plane_dma_addr(vb, 0);
+		buf->vb = vb;
+	}
+
+	return 0;
+}
+
+static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
+{
+	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vb->vb2_queue);
+
+	spin_lock(&mipicsi->queue_lock);
+	list_add_tail(&(mipicsi->cam_buf[vb->index].queue),
+		&(mipicsi->fb_list));
+	spin_unlock(&mipicsi->queue_lock);
+}
+
+static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
+		unsigned int count)
+{
+	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vq);
+
+	mipicsi->streamon = true;
+
+	return 0;
+}
+
+static void mtk_mipicsi_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vq);
+	struct mtk_mipicsi_buf *buf = NULL;
+	struct mtk_mipicsi_buf *tmp = NULL;
+	unsigned int index = 0;
+
+	spin_lock(&mipicsi->queue_lock);
+	while (list_empty(&(mipicsi->fb_list)) == 0) {
+		list_for_each_entry_safe(buf, tmp, &(mipicsi->fb_list), queue) {
+			if (buf->vb->state == VB2_BUF_STATE_ACTIVE) {
+				vb2_buffer_done(buf->vb, VB2_BUF_STATE_ERROR);
+				break;
+			}
+		}
+		buf->vb_dma_addr_phy = 0ULL;
+		buf->prepare_flag = 0;
+		index = buf->vb->index;
+		list_del_init(&(mipicsi->cam_buf[index].queue));
+	}
+	spin_unlock(&mipicsi->queue_lock);
+
+	INIT_LIST_HEAD(&(mipicsi->fb_list));
+
+	mipicsi->streamon = false;
+}
+
+static struct vb2_ops mtk_vb2_ops = {
+	.queue_setup		= mtk_mipicsi_vb2_queue_setup,
+	.buf_init		= mtk_mipicsi_vb2_init,
+	.buf_prepare		= mtk_mipicsi_vb2_prepare,
+	.buf_queue		= mtk_mipicsi_vb2_queue,
+	.start_streaming	= mtk_mipicsi_vb2_start_streaming,
+	.stop_streaming		= mtk_mipicsi_vb2_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+static int mtk_s_input(struct file *file, void *priv, unsigned int i)
+{
+	if (i > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+
+	return 0;
+}
+
+static int mtk_enum_input(struct file *file, void *priv,
+				struct v4l2_input *i)
+{
+	if (i->index != 0)
+		return -EINVAL;
+
+	i->type = V4L2_INPUT_TYPE_CAMERA;
+	strscpy(i->name, "Camera", sizeof(i->name));
+
+	return 0;
+}
+
+static int mtk_enum_fmt_vid_cap(struct file *file, void  *priv,
+				struct v4l2_fmtdesc *f)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+
+	if (f->index >= mipicsi->num_user_formats)
+		return -EINVAL;
+
+	f->pixelformat = mipicsi->user_formats[f->index]->fourcc;
+
+	return 0;
+}
+
+static const struct mtk_format *find_format_by_fourcc(
+					struct mtk_mipicsi_dev *mipicsi,
+					unsigned int fourcc)
+{
+	unsigned int num_formats = mipicsi->num_user_formats;
+	const struct mtk_format *fmt;
+	unsigned int i;
+
+	for (i = 0; i < num_formats; i++) {
+		fmt = mipicsi->user_formats[i];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static int mtk_mipicsi_try_fmt(struct mtk_mipicsi_dev *mipicsi,
+			      struct v4l2_format *f,
+			      const struct mtk_format **current_fmt)
+{
+	const struct mtk_format *mtk_fmt;
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev *sd = mipicsi->mipicsi_sd.subdev;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+	int ret = 0;
+
+	mtk_fmt = find_format_by_fourcc(mipicsi, pix->pixelformat);
+	if (!mtk_fmt) {
+		mtk_fmt = mipicsi->user_formats[0];
+		pix->pixelformat = mtk_fmt->fourcc;
+	}
+
+	/* limit to MTK hardware capabilities */
+	pix->height = clamp(pix->height, 0U, MAX_SUPPORT_HEIGHT);
+	pix->width = clamp(pix->width, 0U, MAX_SUPPORT_WIDTH);
+	v4l2_fill_mbus_format(&format.format, pix, mtk_fmt->mbus_code);
+	ret = v4l2_subdev_call(sd, pad, set_fmt, &pad_cfg, &format);
+	if (ret < 0)
+		return ret;
+
+	v4l2_fill_pix_format(pix, &format.format);
+	pix->bytesperline = pix->width * mtk_fmt->bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
+	if (current_fmt)
+		*current_fmt = mtk_fmt;
+
+	return ret;
+}
+
+static int mtk_mipicsi_set_fmt(struct mtk_mipicsi_dev *mipicsi,
+				struct v4l2_format *f)
+{
+	struct v4l2_subdev *sd = mipicsi->mipicsi_sd.subdev;
+	struct device *dev = &mipicsi->pdev->dev;
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	const struct mtk_format *current_fmt;
+	int ret;
+
+	ret = mtk_mipicsi_try_fmt(mipicsi, f, &current_fmt);
+	if (ret)
+		return ret;
+
+	v4l2_fill_mbus_format(&format.format, &f->fmt.pix,
+			current_fmt->mbus_code);
+
+	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &format);
+	if (ret < 0)
+		return ret;
+
+	mipicsi->fmt = *f;
+	mipicsi->current_fmt = current_fmt;
+
+	dev_info(dev, "width/height/sizeimage %u/%u/%u", pix->width,
+							 pix->height,
+							 pix->sizeimage);
+
+	return ret;
+}
+
+static int mtk_s_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+
+	if (vb2_is_streaming(&mipicsi->queue))
+		return -EBUSY;
+
+	return mtk_mipicsi_set_fmt(mipicsi, f);
+}
+
+static int mtk_g_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *fmt)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+
+	*fmt = mipicsi->fmt;
+
+	return 0;
+}
+
+static int mtk_try_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+
+	return mtk_mipicsi_try_fmt(mipicsi, f, NULL);
+}
+
+static int mtk_mipicsi_querycap(struct file *file, void *priv,
+				struct v4l2_capability *cap)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+
+	strlcpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
+	strlcpy(cap->driver, mipicsi->drv_name, sizeof(cap->driver));
+	strlcpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
+	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mtk_mipicsi_ioctl_ops = {
+	.vidioc_querycap                = mtk_mipicsi_querycap,
+
+	.vidioc_try_fmt_vid_cap         = mtk_try_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap           = mtk_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap           = mtk_s_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap        = mtk_enum_fmt_vid_cap,
+
+	.vidioc_enum_input              = mtk_enum_input,
+	.vidioc_g_input                 = mtk_g_input,
+	.vidioc_s_input                 = mtk_s_input,
+
+	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
+	.vidioc_querybuf                = vb2_ioctl_querybuf,
+	.vidioc_qbuf                    = vb2_ioctl_qbuf,
+	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
+	.vidioc_expbuf                  = vb2_ioctl_expbuf,
+	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
+	.vidioc_streamon                = vb2_ioctl_streamon,
+	.vidioc_streamoff               = vb2_ioctl_streamoff,
+
+	.vidioc_log_status              = v4l2_ctrl_log_status,
+	.vidioc_subscribe_event         = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
+};
+
 static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
 		int index)
 {
@@ -452,6 +844,16 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 	dev = &mipicsi->pdev->dev;
 	pdev = mipicsi->pdev;
 
+	/* mediatek,mipicsiid is a flag to show which mipicsi HW */
+	ret = of_property_read_u32(dev->of_node, "mediatek,mipicsiid",
+		(u32 *)&mipicsi->id);
+	if (ret != 0) {
+		dev_info(dev, "not set mediatek,mipicsiid, use default id 0\n");
+		mipicsi->id = 0;
+	}
+	(void)sprintf(mipicsi->drv_name, MTK_MIPICSI_DRV_NAME"%d",
+		mipicsi->id);
+
 	/* get and parse seninf_mux_camsv */
 	camsv_num = of_count_phandle_with_args(dev->of_node,
 		"mediatek,seninf_mux_camsv", NULL);
@@ -514,6 +916,262 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 	return 0;
 }
 
+static int mtk_mipicsi_set_default_fmt(struct mtk_mipicsi_dev *mipicsi)
+{
+	struct v4l2_format f = {
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.fmt.pix = {
+			.width          = 1280,
+			.height         = 720,
+			.field          = V4L2_FIELD_NONE,
+			.pixelformat    = mipicsi->user_formats[0]->fourcc,
+		},
+	};
+	int ret;
+
+	ret = mtk_mipicsi_try_fmt(mipicsi, &f, NULL);
+	if (ret)
+		return ret;
+	mipicsi->current_fmt = mipicsi->user_formats[0];
+	mipicsi->fmt = f;
+
+	return 0;
+}
+
+static int mipicsi_formats_init(struct mtk_mipicsi_dev *mipicsi)
+{
+	const struct mtk_format *mipicsi_fmts[ARRAY_SIZE(mtk_mipicsi_formats)];
+	struct v4l2_subdev *sd = mipicsi->mipicsi_sd.subdev;
+	unsigned int i, j, num_fmts = 0;
+	struct v4l2_subdev_mbus_code_enum mbus_code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	while (!v4l2_subdev_call(sd, pad, enum_mbus_code, NULL, &mbus_code)) {
+		for (i = 0; i < ARRAY_SIZE(mtk_mipicsi_formats); i++) {
+			if (mtk_mipicsi_formats[i].mbus_code != mbus_code.code)
+				continue;
+
+			/* Code supported, have we got this fourcc yet? */
+			for (j = 0; j < num_fmts; j++)
+				if (mipicsi_fmts[j]->fourcc ==
+				    mtk_mipicsi_formats[i].fourcc)
+					/* Already available */
+					break;
+
+			if (j == num_fmts)
+				/* new */
+				mipicsi_fmts[num_fmts++] =
+					&mtk_mipicsi_formats[i];
+		}
+		mbus_code.index++;
+	}
+
+	if (!num_fmts)
+		return -ENXIO;
+
+	mipicsi->num_user_formats = num_fmts;
+	mipicsi->user_formats = devm_kcalloc(&mipicsi->pdev->dev,
+					     num_fmts,
+					     sizeof(struct isi_format *),
+					     GFP_KERNEL);
+	if (!mipicsi->user_formats)
+		return -ENOMEM;
+
+	memcpy(mipicsi->user_formats, mipicsi_fmts,
+	       num_fmts * sizeof(struct mtk_format *));
+	mipicsi->current_fmt = mipicsi->user_formats[0];
+
+	return 0;
+}
+
+static int mipicsi_subdev_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct mtk_mipicsi_dev *mipicsi = notifier_to_mipicsi(notifier);
+	struct device *dev = &mipicsi->pdev->dev;
+	int ret;
+
+	mipicsi->vdev->ctrl_handler = mipicsi->mipicsi_sd.subdev->ctrl_handler;
+	ret = mipicsi_formats_init(mipicsi);
+	if (ret) {
+		dev_err(dev, "No supported mediabus format found\n");
+		return ret;
+	}
+
+	ret = mtk_mipicsi_set_default_fmt(mipicsi);
+	if (ret) {
+		dev_err(dev, "Could not set default format\n");
+		return ret;
+	}
+
+	ret = video_register_device(mipicsi->vdev, VFL_TYPE_GRABBER, -1);
+	if (ret) {
+		dev_err(dev, "Failed to register video device\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "Device registered as %s\n",
+		video_device_node_name(mipicsi->vdev));
+
+	return 0;
+}
+
+static void mipicsi_subdev_notify_unbind(struct v4l2_async_notifier *notifier,
+					 struct v4l2_subdev *sd,
+					 struct v4l2_async_subdev *asd)
+{
+	struct mtk_mipicsi_dev *mipicsi = notifier_to_mipicsi(notifier);
+
+	dev_dbg(&mipicsi->pdev->dev, "Removing %s\n",
+		video_device_node_name(mipicsi->vdev));
+
+	/* Checks internally if vdev have been init or not */
+	video_unregister_device(mipicsi->vdev);
+}
+
+static int mipicsi_subdev_notify_bound(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *subdev,
+				       struct v4l2_async_subdev *asd)
+{
+	struct mtk_mipicsi_dev *mipicsi = notifier_to_mipicsi(notifier);
+
+	dev_dbg(&mipicsi->pdev->dev, "subdev %s bound\n", subdev->name);
+
+	mipicsi->mipicsi_sd.subdev = subdev;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations mipicsi_subdev_notify_ops = {
+	.bound = mipicsi_subdev_notify_bound,
+	.unbind = mipicsi_subdev_notify_unbind,
+	.complete = mipicsi_subdev_notify_complete,
+};
+
+static int mtk_mipicsi_graph_parse(struct mtk_mipicsi_dev *mipicsi,
+					struct device_node *node)
+{
+	struct device_node *ep = NULL;
+	struct device_node *remote;
+
+	ep = of_graph_get_next_endpoint(node, ep);
+	if (!ep)
+		return -EINVAL;
+
+	remote = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!remote)
+		return -EINVAL;
+
+	/* Remote node to connect */
+	mipicsi->mipicsi_sd.node = remote;
+	mipicsi->mipicsi_sd.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
+	mipicsi->mipicsi_sd.asd.match.fwnode = of_fwnode_handle(remote);
+	return 0;
+}
+
+static int mtk_mipicsi_subdev_init(struct mtk_mipicsi_dev *mipicsi)
+{
+	int ret;
+	struct device *dev = &mipicsi->pdev->dev;
+
+	/* Parse the graph to extract a list of subdevice DT nodes. */
+	ret = mtk_mipicsi_graph_parse(mipicsi, dev->of_node);
+	if (ret < 0) {
+		dev_err(&mipicsi->pdev->dev, "Graph parsing failed\n");
+		return ret;
+	}
+
+	v4l2_async_notifier_init(&mipicsi->notifier);
+
+	ret = v4l2_async_notifier_add_subdev(&mipicsi->notifier,
+						&mipicsi->mipicsi_sd.asd);
+	if (ret) {
+		of_node_put(mipicsi->mipicsi_sd.node);
+		return ret;
+	}
+
+	mipicsi->notifier.ops = &mipicsi_subdev_notify_ops;
+
+	ret = v4l2_async_notifier_register(&mipicsi->v4l2_dev,
+					   &mipicsi->notifier);
+	if (ret < 0) {
+		dev_err(&mipicsi->pdev->dev, "Notifier registration failed\n");
+		v4l2_async_notifier_cleanup(&mipicsi->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_mipicsi_open(struct file *file)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+	struct v4l2_subdev *sd = mipicsi->mipicsi_sd.subdev;
+	int ret;
+
+	if (mutex_lock_interruptible(&mipicsi->lock))
+		return -ERESTARTSYS;
+
+	ret = v4l2_fh_open(file);
+	if (ret < 0)
+		goto unlock;
+
+	if (!v4l2_fh_is_singular_file(file))
+		goto fh_rel;
+
+	ret = v4l2_subdev_call(sd, core, s_power, 1);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		goto fh_rel;
+
+	ret = mtk_mipicsi_set_fmt(mipicsi, &mipicsi->fmt);
+	if (ret)
+		v4l2_subdev_call(sd, core, s_power, 0);
+
+	pm_runtime_get_sync(&mipicsi->pdev->dev);
+
+fh_rel:
+	if (ret)
+		v4l2_fh_release(file);
+unlock:
+	mutex_unlock(&mipicsi->lock);
+	return ret;
+}
+
+static int mtk_mipicsi_release(struct file *file)
+{
+	struct mtk_mipicsi_dev *mipicsi = video_drvdata(file);
+	struct device *dev = &mipicsi->pdev->dev;
+	struct v4l2_subdev *sd = mipicsi->mipicsi_sd.subdev;
+	bool fh_singular;
+	int ret;
+
+	mutex_lock(&mipicsi->lock);
+
+	pm_runtime_put_sync(dev);
+
+	fh_singular = v4l2_fh_is_singular_file(file);
+
+	ret = _vb2_fop_release(file, NULL);
+
+	if (fh_singular)
+		v4l2_subdev_call(sd, core, s_power, 0);
+
+	mutex_unlock(&mipicsi->lock);
+
+	return ret;
+}
+
+static const struct v4l2_file_operations mipicsi_fops = {
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open           = mtk_mipicsi_open,
+	.release        = mtk_mipicsi_release,
+	.poll           = vb2_fop_poll,
+	.mmap           = vb2_fop_mmap,
+	.read           = vb2_fop_read,
+};
+
 static int mtk_mipicsi_probe(struct platform_device *pdev)
 {
 	struct mtk_mipicsi_dev *mipicsi = NULL;
@@ -521,6 +1179,7 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 	struct iommu_domain *iommu = NULL;
 	struct device_node *larb_node = NULL;
 	struct platform_device *larb_pdev = NULL;
+	struct vb2_queue *q;
 
 	iommu = iommu_get_domain_for_dev(&pdev->dev);
 	if (iommu == NULL) {
@@ -557,9 +1216,78 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	INIT_LIST_HEAD(&mipicsi->fb_list);
+	spin_lock_init(&mipicsi->queue_lock);
+	spin_lock_init(&mipicsi->irqlock);
+	mutex_init(&mipicsi->lock);
+
+	q = &mipicsi->queue;
+
+	/* Initialize the top-level structure */
+	ret = v4l2_device_register(&pdev->dev, &mipicsi->v4l2_dev);
+	if (ret)
+		return ret;
+
+	mipicsi->vdev = video_device_alloc();
+	if (mipicsi->vdev == NULL) {
+		ret = -ENOMEM;
+		goto err_vdev_alloc;
+	}
+
+	/* video node */
+	mipicsi->vdev->fops = &mipicsi_fops;
+	mipicsi->vdev->v4l2_dev = &mipicsi->v4l2_dev;
+	mipicsi->vdev->queue = &mipicsi->queue;
+	strscpy(mipicsi->vdev->name, mipicsi->drv_name,
+		sizeof(mipicsi->vdev->name));
+	mipicsi->vdev->release = video_device_release;
+	mipicsi->vdev->ioctl_ops = &mtk_mipicsi_ioctl_ops;
+	mipicsi->vdev->lock = &mipicsi->lock;
+	mipicsi->vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				     V4L2_CAP_STREAMING |
+				     V4L2_CAP_READWRITE;
+	video_set_drvdata(mipicsi->vdev, mipicsi);
+
+	/* buffer queue */
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	q->drv_priv = mipicsi;
+	q->buf_struct_size = sizeof(struct vb2_buffer);
+	q->ops = &mtk_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->dev = mipicsi->v4l2_dev.dev;
+	q->lock = &mipicsi->lock;
+
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to initialize VB2 queue\n");
+		goto err_vb2_queue;
+	}
+
+	mipicsi->streamon = false;
+
+	ret = mtk_mipicsi_subdev_init(mipicsi);
+	if (ret < 0)
+		goto err_mipicsi_subdev_init;
+
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32U));
+	if (ret != 0) {
+		dev_err(&pdev->dev, "dma set max seg size fail\n");
+		goto clean;
+	}
+
 	dev_set_drvdata(&pdev->dev, mipicsi);
 
 	dev_info(&pdev->dev, "probe done\n");
+	return ret;
+clean:
+err_mipicsi_subdev_init:
+err_vb2_queue:
+	video_device_release(mipicsi->vdev);
+err_vdev_alloc:
+	v4l2_device_unregister(&mipicsi->v4l2_dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
2.18.0

