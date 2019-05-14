Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA1E1C2DE
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfENGOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:14:05 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:35872 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725928AbfENGOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:03 -0400
X-UUID: 08d6365e1c834f459fa741bee0783e6e-20190514
X-UUID: 08d6365e1c834f459fa741bee0783e6e-20190514
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 991749743; Tue, 14 May 2019 14:13:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:13:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:13:54 +0800
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
Subject: [PATCH v3 03/13] [media] mtk-mipicsi: register the soc_camera host
Date:   Tue, 14 May 2019 14:13:40 +0800
Message-ID: <1557814430-9675-4-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch register the soc_camera host for mt2712 mipicsi.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 417 ++++++++++++++++++
 1 file changed, 417 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 4ae5b88abc5f..9142564baf1d 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -53,6 +53,10 @@
 #define MIPICSI_COMMON_CLK 2
 #define MTK_CAMDMA_MAX_NUM 4U
 #define MIPICSI_CLK (MIPICSI_COMMON_CLK + MTK_CAMDMA_MAX_NUM)
+#define MAX_SUPPORT_WIDTH             4096U
+#define MAX_SUPPORT_HEIGHT            4096U
+#define MAX_BUFFER_NUM                  32U
+#define VID_LIMIT_BYTES			(100U * 1024U * 1024U)
 
 #define MIPI_RX_ANA00_CSI				0x00
 #define MIPI_RX_ANA04_CSI				0x04
@@ -99,7 +103,16 @@
 #define IMGO_STRIDE					0x238
 #define DMA_FRAME_HEADER_EN				0xE00
 
+/* buffer for one video frame */
+struct mtk_mipicsi_buf {
+	struct list_head queue;
+	struct vb2_buffer *vb;
+	dma_addr_t vb_dma_addr_phy;
+	int prepare_flag;
+};
+
 struct mtk_mipicsi_dev {
+	struct soc_camera_host	soc_host;
 	struct platform_device *pdev;
 	unsigned int camsv_num;
 	struct device *larb_pdev;
@@ -109,6 +122,14 @@ struct mtk_mipicsi_dev {
 	struct regmap		*seninf_top;
 	void __iomem		*seninf_mux[MTK_CAMDMA_MAX_NUM];
 	void __iomem		*camsv[MTK_CAMDMA_MAX_NUM];
+	struct list_head	fb_list;
+	spinlock_t		lock;
+	spinlock_t		queue_lock;
+	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
+	bool streamon;
+	unsigned long enqueue_cnt;
+	char drv_name[16];
+	u32 id;
 	int clk_num;
 	struct clk		*clk[MIPICSI_CLK];
 };
@@ -122,6 +143,351 @@ struct mtk_mipicsi_dev {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	/* Get width/height info from subdev. Then use them to set register */
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
+	if (ret < 0) {
+		dev_err(icd->parent, "sub device get_fmt fail\n");
+		return ret;
+	}
+
+	/*
+	 * If power domain was closed before, it will be open.
+	 * Then clock will be open and register will be set
+	 */
+	(void)pm_runtime_get_sync(icd->parent);
+
+	return 0;
+}
+
+static void mtk_mipicsi_remove_device(struct soc_camera_device *icd)
+{
+	(void)pm_runtime_put_sync(icd->parent);
+}
+
+static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
+				struct v4l2_format *f)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	struct device *dev = &mipicsi->pdev->dev;
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	const struct soc_camera_format_xlate *xlate = NULL;
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_mbus_framefmt *mf = &format.format;
+	int ret = 0;
+
+	xlate = soc_camera_xlate_by_fourcc(icd, pix->pixelformat);
+	if (xlate == NULL) {
+		dev_err(dev, "Format 0x%x not found\n", pix->pixelformat);
+		return -EINVAL;
+	}
+
+	mf->width	= pix->width;
+	mf->height	= pix->height;
+	mf->field	= pix->field;
+	mf->colorspace	= pix->colorspace;
+	mf->code	= xlate->code;
+
+	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &format);
+	pix->width		= mf->width;
+	pix->height		= mf->height;
+	pix->field		= mf->field;
+	pix->colorspace		= mf->colorspace;
+	icd->current_fmt	= xlate;
+	if (pix->pixelformat == V4L2_PIX_FMT_YUYV)
+		pix->sizeimage = pix->width * pix->height * 2U;
+
+	if (mf->code != xlate->code)
+		return -EINVAL;
+
+	return ret;
+}
+
+static int mtk_mipicsi_try_fmt(struct soc_camera_device *icd,
+			      struct v4l2_format *f)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	const struct soc_camera_format_xlate *xlate = NULL;
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+	struct v4l2_mbus_framefmt *mf = &format.format;
+	u32 pixfmt = pix->pixelformat;
+	int ret = 0;
+
+	xlate = soc_camera_xlate_by_fourcc(icd, pixfmt);
+	if (xlate == NULL) {
+		xlate = icd->current_fmt;
+		dev_dbg(icd->parent, "Format %x not found, keeping %x\n",
+			pixfmt, xlate->host_fmt->fourcc);
+		pixfmt = xlate->host_fmt->fourcc;
+		pix->pixelformat = pixfmt;
+		pix->colorspace = icd->colorspace;
+	}
+
+	/* limit to  MTK hardware capabilities */
+	pix->height = min(pix->height, MAX_SUPPORT_HEIGHT);
+	pix->width = min(pix->width, MAX_SUPPORT_WIDTH);
+
+	/* limit to sensor capabilities */
+	mf->width	= pix->width;
+	mf->height	= pix->height;
+	mf->field	= pix->field;
+	mf->colorspace	= pix->colorspace;
+	mf->code	= xlate->code;
+
+	ret = v4l2_subdev_call(sd, pad, set_fmt, &pad_cfg, &format);
+	if (ret < 0)
+		return ret;
+
+	pix->width	= mf->width;
+	pix->height	= mf->height;
+	pix->field	= mf->field;
+	pix->colorspace	= mf->colorspace;
+	pix->bytesperline = pix->width * 2U;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
+	return ret;
+}
+
+static int mtk_mipicsi_vb2_queue_setup(struct vb2_queue *vq,
+		unsigned int *nbufs,
+		unsigned int *num_planes, unsigned int sizes[],
+		struct device *alloc_devs[])
+{
+	struct soc_camera_device *icd = soc_camera_from_vb2q(vq);
+	u32 sizeimage = icd->sizeimage;
+
+	if (*nbufs == 0U || *nbufs > MAX_BUFFER_NUM)
+		*nbufs = MAX_BUFFER_NUM;
+	if (sizeimage * *nbufs > VID_LIMIT_BYTES)
+		*nbufs = VID_LIMIT_BYTES / sizeimage;
+
+	/*
+	 * Called from VIDIOC_REQBUFS or in compatibility mode For YUV422P
+	 * format, even if there are 3 planes Y, U and V, we reply there is only
+	 * one plane, containing Y, U and V data, one after the other.
+	 */
+	if (*num_planes != 0U)
+		return sizes[0] < sizeimage ? -EINVAL : 0;
+	sizes[0] = sizeimage;
+	*num_planes = 1;
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
+	struct soc_camera_device *icd = NULL;
+	struct soc_camera_host *ici = NULL;
+	struct mtk_mipicsi_dev *mipicsi = NULL;
+	struct mtk_mipicsi_buf *buf;
+	u32 size = 0;
+	char *va = NULL;
+
+	/* notice that vb->vb2_queue addr equals to soc_camera_device->vb2_vidq.
+	 *  It was handled in reqbufs
+	 */
+	icd = soc_camera_from_vb2q(vb->vb2_queue);
+	ici = to_soc_camera_host(icd->parent);
+	mipicsi = ici->priv;
+	buf = &mipicsi->cam_buf[vb->index];
+	size = icd->sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(icd->parent, "data will not fit into plane (%lu < %u)",
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
+		va = vb2_plane_vaddr(vb, 0);
+		buf->vb = vb;
+	}
+
+	return 0;
+}
+
+static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
+{
+	struct soc_camera_device *icd = soc_camera_from_vb2q(vb->vb2_queue);
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	char *va = NULL;
+
+	spin_lock(&mipicsi->queue_lock);
+	list_add_tail(&(mipicsi->cam_buf[vb->index].queue),
+		&(mipicsi->fb_list));
+	spin_unlock(&mipicsi->queue_lock);
+
+	va = vb2_plane_vaddr(vb, 0);
+
+	++(mipicsi->enqueue_cnt);
+}
+
+static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
+		unsigned int count)
+{
+	struct soc_camera_device *icd = soc_camera_from_vb2q(vq);
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+
+	icd->vdev->queue = vq;
+
+	mipicsi->streamon = true;
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
+	mipicsi->streamon = false;
+
+	INIT_LIST_HEAD(&(mipicsi->fb_list));
+
+	mipicsi->enqueue_cnt = 0UL;
+}
+
+static struct vb2_ops mtk_vb2_ops = {
+	.queue_setup		= mtk_mipicsi_vb2_queue_setup,
+	.buf_init			= mtk_mipicsi_vb2_init,
+	.buf_prepare		= mtk_mipicsi_vb2_prepare,
+	.buf_queue			= mtk_mipicsi_vb2_queue,
+	.start_streaming	= mtk_mipicsi_vb2_start_streaming,
+	.stop_streaming		= mtk_mipicsi_vb2_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+static int mtk_mipicsi_init_videobuf2(struct vb2_queue *q,
+			      struct soc_camera_device *icd)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	struct mutex *q_lock = NULL;
+
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP;
+	q->drv_priv = mipicsi;
+	q->buf_struct_size = sizeof(struct vb2_buffer);
+	q->ops = &mtk_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->dev = ici->v4l2_dev.dev;
+	q_lock = devm_kzalloc(mipicsi->soc_host.v4l2_dev.dev,
+			sizeof(*q_lock), GFP_KERNEL);
+	q->lock = q_lock;
+	mutex_init(q->lock);
+
+	return vb2_queue_init(q);
+}
+
+static int mtk_mipicsi_querycap(struct soc_camera_host *ici,
+			       struct v4l2_capability *cap)
+{
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+
+	(void)strlcpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
+	(void)strlcpy(cap->driver, mipicsi->drv_name, sizeof(cap->driver));
+	(void)strlcpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
+	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static int mtk_mipicsi_set_bus_param(struct soc_camera_device *icd)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
+	unsigned int common_flags = 0U;
+	int ret = 0;
+
+	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
+	if (ret == 0) {
+		common_flags = soc_mbus_config_compatible(&cfg,
+				MTK_MIPICSI_BUS_PARAM);
+		if (common_flags == 0U) {
+			dev_err(icd->parent, "Flags incompatible: camera 0x%x",
+				cfg.flags);
+			return -EINVAL;
+		}
+	} else {
+		if (ret != -ENOIOCTLCMD)
+			return ret;
+	}
+	common_flags = MTK_MIPICSI_BUS_PARAM;
+
+	dev_dbg(icd->parent, "Flags cam: 0x%x common: 0x%x\n",
+		cfg.flags, common_flags);
+
+	cfg.flags = common_flags;
+	ret = v4l2_subdev_call(sd, video, s_mbus_config, &cfg);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_dbg(icd->parent, "camera s_mbus_config(0x%x) returned %d\n",
+			common_flags, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
+	.owner			= THIS_MODULE,
+	.add			= mtk_mipicsi_add_device,
+	.remove			= mtk_mipicsi_remove_device,
+	.set_fmt		= mtk_mipicsi_set_fmt,
+	.try_fmt		= mtk_mipicsi_try_fmt,
+	.init_videobuf2	= mtk_mipicsi_init_videobuf2,
+	.poll			= vb2_fop_poll,
+	.querycap		= mtk_mipicsi_querycap,
+	.set_bus_param		= mtk_mipicsi_set_bus_param,
+};
+
 static void mtk_mipicsi_ana_init(void __iomem *base)
 {
 	writel(0xFEFBEFBEU & readl(base + MIPI_RX_ANA4C_CSI),
@@ -271,6 +637,15 @@ static int mtk_mipicsi_pm_suspend(struct device *dev)
 	int ret = 0;
 	int i = 0;
 
+	if (mipicsi->soc_host.icd != NULL) {
+		struct v4l2_subdev *sd =
+			soc_camera_to_subdev(mipicsi->soc_host.icd);
+
+		ret = v4l2_subdev_call(sd, core, s_power, 0);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
+	}
+
 	/* close digtal and analog clock */
 	for (i = 0; i < mipicsi->clk_num; ++i)
 		clk_disable_unprepare(mipicsi->clk[i]);
@@ -295,6 +670,15 @@ static int mtk_mipicsi_pm_resume(struct device *dev)
 	int ret = 0;
 	int i = 0;
 
+	if (mipicsi->soc_host.icd != NULL) {
+		struct v4l2_subdev *sd =
+			soc_camera_to_subdev(mipicsi->soc_host.icd);
+
+		ret = v4l2_subdev_call(sd, core, s_power, 1);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
+	}
+
 	if (mipicsi->larb_pdev != NULL) {
 		ret = mtk_smi_larb_get(mipicsi->larb_pdev);
 		if (ret != 0)
@@ -446,6 +830,16 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
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
@@ -545,6 +939,25 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	mipicsi->soc_host.drv_name	= mipicsi->drv_name;
+	mipicsi->soc_host.ops		= &mtk_soc_camera_host_ops;
+	mipicsi->soc_host.priv		= mipicsi;
+	mipicsi->soc_host.v4l2_dev.dev	= &pdev->dev;
+	mipicsi->soc_host.nr		= mipicsi->id;
+	mipicsi->streamon		= false;
+
+	ret = soc_camera_host_register(&mipicsi->soc_host);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "soc camera host register fail\n");
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
+
+	INIT_LIST_HEAD(&mipicsi->fb_list);
+	spin_lock_init(&mipicsi->queue_lock);
+	spin_lock_init(&mipicsi->lock);
+	mipicsi->enqueue_cnt = 0UL;
+
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32U));
 	if (ret != 0) {
 		dev_err(&pdev->dev, "dma set max seg size fail\n");
@@ -556,12 +969,16 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "probe done\n");
 	return ret;
 clean:
+	soc_camera_host_unregister(&mipicsi->soc_host);
 	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
 static int mtk_mipicsi_remove(struct platform_device *pdev)
 {
+	struct soc_camera_host *soc_host = to_soc_camera_host(&pdev->dev);
+
+	soc_camera_host_unregister(soc_host);
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
2.18.0

