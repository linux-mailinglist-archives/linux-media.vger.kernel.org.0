Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C72D6D89
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 05:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfJODQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 23:16:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:22927 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727057AbfJODQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 23:16:27 -0400
X-UUID: c53a100090fb4d52b00cd2da44559896-20191015
X-UUID: c53a100090fb4d52b00cd2da44559896-20191015
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1410218489; Tue, 15 Oct 2019 11:16:17 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 15 Oct 2019 11:16:13 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 15 Oct 2019 11:16:13 +0800
Message-ID: <1571109375.3706.40.camel@mtksdccf07>
Subject: Re: [RFC PATCH V3 3/3] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     <tfiga@chromium.org>
CC:     <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "lkml@metux.net" <lkml@metux.net>,
        CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= 
        <ck.hu@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= 
        <po-yang.huang@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Tue, 15 Oct 2019 11:16:15 +0800
In-Reply-To: <20190906101125.3784-4-Jerry-Ch.chen@mediatek.com>
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
         <20190906101125.3784-4-Jerry-Ch.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Fri, 2019-09-06 at 18:11 +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds the driver of Face Detection (FD) unit in
> Mediatek camera system, providing face detection function.
> 
> The mtk-isp directory will contain drivers for multiple IP
> blocks found in Mediatek ISP system. It will include ISP Pass 1
> driver (CAM), sensor interface driver, DIP driver and face
> detection driver.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-isp/fd/Kconfig     |   19 +
>  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
>  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  148 ++
>  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1219 +++++++++++++++++
>  include/uapi/linux/mtk-fd-v4l2-controls.h     |   69 +
>  include/uapi/linux/v4l2-controls.h            |    4 +
>  8 files changed, 1468 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
>  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
>  create mode 100644 include/uapi/linux/mtk-fd-v4l2-controls.h
> 

[snip]

> +
> +static void mtk_fd_hw_job_finish(struct mtk_fd_dev *fd,
> +				 enum vb2_buffer_state vb_state)
> +{
> +	struct mtk_fd_ctx *ctx;
> +	struct vb2_v4l2_buffer *src_vbuf = NULL, *dst_vbuf = NULL;
> +
> +	ctx = v4l2_m2m_get_curr_priv(fd->m2m_dev);
> +	src_vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf,
> +				   V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
> +	v4l2_m2m_buf_done(src_vbuf, vb_state);
> +	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> +	v4l2_m2m_job_finish(fd->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +


> +static void mtk_fd_ipi_handler(void *data, unsigned int len, void *priv)
> +{
> +	struct mtk_fd_dev *fd = (struct mtk_fd_dev *)priv;
> +	struct device *dev = fd->dev;
> +	struct ipi_message *fd_ack_msg = (struct ipi_message *)data;
> +	struct fd_ack_param *fd_ack = &fd_ack_msg->fd_ack_param;
> +
> +	dev_dbg(fd->dev, "fd_ipi_ack_id: %d\n", fd_ack_msg->cmd_id);
> +	switch (fd_ack_msg->cmd_id) {
> +	case MTK_FD_IPI_CMD_INIT_ACK:
> +		return;
> +	case MTK_FD_IPI_CMD_ENQ_ACK:
> +		if (fd_ack->ret_code) {
> +			dev_err(dev, "ipi ret: %d, message: %d\n",
> +				fd_ack->ret_code, fd_ack->ret_msg);
> +			pm_runtime_put((fd->dev));
> +			mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> +		}
> +		return;
> +	case MTK_FD_IPI_CMD_RESET_ACK:
> +		return;
> +	}
> +}
> +
> +static int mtk_fd_hw_connect(struct mtk_fd_dev *fd)
> +{
> +	int ret;
> +
> +	ret = rproc_boot(fd->rproc_handle);
> +
> +	if (ret < 0) {
> +		/**
> +		 * Return 0 if downloading firmware successfully,
> +		 * otherwise it is failed
> +		 */
> +		dev_err(fd->dev, "Failed to boot rproc\n");
> +		return ret;
> +	}
> +
> +	ret = scp_ipi_register(fd->scp_pdev, SCP_IPI_FD_CMD,
> +			       mtk_fd_ipi_handler, fd);
> +	if (ret) {
> +		dev_err(fd->dev, "Failed to register IPI cmd handler\n");
> +		goto err_rproc_shutdown;
> +	}
> +
> +	fd->fd_stream_count++;
> +	if (fd->fd_stream_count == 1) {
> +		if (mtk_fd_hw_enable(fd)) {
> +			ret = -EINVAL;
> +			goto err_rproc_shutdown;
> +		}
> +	}
> +	return 0;
> +
> +err_rproc_shutdown:
> +	rproc_shutdown(fd->rproc_handle);
> +	return ret;
> +}
> +
> +static void mtk_fd_hw_disconnect(struct mtk_fd_dev *fd)
> +{
> +	fd->fd_stream_count--;
> +
> +	if (fd->fd_stream_count == 0) {
> +		if (!IS_ERR(fd->rs_dma_buf))
> +			mtk_fd_free_dma_handle(fd);
> +
> +		rproc_shutdown(fd->rproc_handle);
> +	}
> +}
> +
> +static int mtk_fd_hw_job_exec(struct mtk_fd_dev *fd,
> +			      struct fd_enq_param *fd_param)
> +{
> +	struct ipi_message fd_ipi_msg;
> +	int ret;
> +
> +	pm_runtime_get_sync((fd->dev));
> +
> +	reinit_completion(&fd->fd_irq_done);
> +	fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_ENQUEUE;
> +	memcpy(&fd_ipi_msg.fd_enq_param, fd_param, sizeof(struct fd_enq_param));
> +	ret = scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
> +			   sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT);
> +	if (ret) {
> +		pm_runtime_put((fd->dev));
> +		mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int mtk_fd_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +	if (v4l2_buf->field == V4L2_FIELD_ANY)
> +		v4l2_buf->field = V4L2_FIELD_NONE;
> +	if (v4l2_buf->field != V4L2_FIELD_NONE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct device *dev = ctx->dev;
> +	struct v4l2_pix_format_mplane *pixfmt;
> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		if (vb2_plane_size(vb, 0) < ctx->dst_fmt.buffersize) {
> +			dev_dbg(dev, "meta size %d is too small\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		pixfmt = &ctx->src_fmt;
> +
> +		if (vbuf->field == V4L2_FIELD_ANY)
> +			vbuf->field = V4L2_FIELD_NONE;
> +
> +		if (vb->num_planes > 2 || vbuf->field != V4L2_FIELD_NONE) {
> +			dev_dbg(dev, "plane or field %d not supported\n",
> +				vb->num_planes, vbuf->field);
> +			return -EINVAL;
> +		}
> +		if (vb2_plane_size(vb, 0) < pixfmt->plane_fmt[0].sizeimage) {
> +			dev_dbg(dev, "plane %d is too small\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_fd_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> +				  unsigned int *num_buffers,
> +				  unsigned int *num_planes,
> +				  unsigned int sizes[],
> +				  struct device *alloc_devs[])
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	unsigned int size[2];
> +	unsigned int plane;
> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		size[0] = ctx->dst_fmt.buffersize;
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> +		if (*num_planes == 2)
> +			size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> +		break;
> +	}
> +
> +	if (*num_planes > 2)
> +		return -EINVAL;
> +	if (*num_planes == 0) {
> +		if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
> +			sizes[0] = ctx->dst_fmt.buffersize;
> +			*num_planes = 1;
> +			return 0;
> +		}
> +
> +		*num_planes = ctx->src_fmt.num_planes;
> +		for (plane = 0; plane < *num_planes; plane++)
> +			sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
> +		return 0;
> +	}
> +
> +	for (plane = 0; plane < *num_planes; plane++) {
> +		if (sizes[plane] < size[plane])
> +			return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int mtk_fd_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +
> +	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return mtk_fd_hw_connect(ctx->fd_dev);
> +	else
> +		return 0;
> +}
> +
> +static int mtk_fd_job_abort(struct mtk_fd_dev *fd)
> +{
> +	u32 ret;
> +
> +	ret = wait_for_completion_timeout(&fd->fd_irq_done,
> +					  msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> +	/* Reset FD HW */
> +	if (!ret) {
> +		struct ipi_message fd_ipi_msg;
> +
> +		fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_RESET;
> +		if (scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
> +				 sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT))
> +			dev_err(fd->dev, "FD Reset HW error\n");
> +		return -ETIMEDOUT;
> +	}
> +	return 0;
> +}
> +

Continue the discussion about job abort in RFC v2,

I think the job_abort callback in v4l2_m2m_ops() might be useful.

ref:
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/media/v4l2-core/v4l2-mem2mem.c#L398
https://elixir.bootlin.com/linux/v5.4-rc2/source/include/media/v4l2-mem2mem.h#L43

in drivers/media/v4l2-core/v4l2-mem2mem.c #398 v4l2_m2m_cancel_job()
...
if (m2m_ctx->job_flags & TRANS_RUNNING) {
	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
	if (m2m_dev->m2m_ops->job_abort)
		m2m_dev->m2m_ops->job_abort(m2m_ctx->priv);
	dprintk("m2m_ctx %p running, will wait to complete\n", m2m_ctx);
	wait_event(m2m_ctx->finished,
			!(m2m_ctx->job_flags & TRANS_RUNNING));
} ...

If this operation is set, we might use the v4l2_m2m_cancel_job() when
suspend, and it will do mtk_fd_job_abort() here.


> +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct mtk_fd_dev *fd = ctx->fd_dev;
> +	struct vb2_v4l2_buffer *vb;
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	struct v4l2_m2m_queue_ctx *queue_ctx;
> +
> +	mtk_fd_job_abort(fd);
> +	queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
> +					&m2m_ctx->out_q_ctx :
> +					&m2m_ctx->cap_q_ctx;
> +	while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +
> +	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		mtk_fd_hw_disconnect(fd);
> +}
> +

[snip]

> +struct v4l2_ctrl_config mtk_fd_controls[] = {
> +	{
> +		.id = V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH,
> +		.name = "FD scale image widths",
> +		.type = V4L2_CTRL_TYPE_U16,
> +		.min = MTK_FD_OUTPUT_MIN_WIDTH,
> +		.max = MTK_FD_OUTPUT_MAX_WIDTH,
> +		.step = 1,
> +		.def = MTK_FD_OUTPUT_MAX_WIDTH,
> +		.dims = { MTK_FD_SCALE_ARR_NUM },
> +	},
> +	{
> +		.id = V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT,
> +		.name = "FD scale image heights",
> +		.type = V4L2_CTRL_TYPE_U16,
> +		.min = MTK_FD_OUTPUT_MIN_HEIGHT,
> +		.max = MTK_FD_OUTPUT_MAX_HEIGHT,
> +		.step = 1,
> +		.def = MTK_FD_OUTPUT_MAX_HEIGHT,
> +		.dims = { MTK_FD_SCALE_ARR_NUM },
> +	},
> +	{
> +		.id = V4L2_CID_MTK_FD_SCALE_IMG_NUM,
> +		.name = "FD scale size counts",
> +		.type = V4L2_CTRL_TYPE_INTEGER,
> +		.min = 0,
> +		.max = MTK_FD_SCALE_ARR_NUM,
> +		.step = 1,
> +		.def = 0,
> +	},
> +	{
> +		.id = V4L2_CID_MTK_FD_DETECT_POSE,
> +		.name = "FD detect face angle and directions",
> +		.type = V4L2_CTRL_TYPE_U16,
> +		.min = 0,
> +		.max = 0xffff,
> +		.step = 1,
> +		.def = 0x3ff,
> +		.dims = { MTK_FD_FACE_ANGLE_NUM},
> +	},
> +	{
> +		.id = V4L2_CID_MTK_FD_DETECT_SPEED,
> +		.name = "FD detection speedup",
> +		.type = V4L2_CTRL_TYPE_INTEGER,
> +		.min = 0,
> +		.max = MTK_FD_MAX_SPEEDUP,
> +		.step = 1,
> +		.def = 0,
> +	},
> +	{
> +		.id = V4L2_CID_MTK_FD_DETECTION_MODEL,
> +		.name = "FD use extra model",
> +		.type = V4L2_CTRL_TYPE_BOOLEAN,
> +		.min = 0,
> +		.max = 1,
> +		.step = 1,
> +		.def = 0,
> +	},
> +};
> +

[snip]

> +static int mtk_vfd_release(struct file *filp)
> +{
> +	struct mtk_fd_ctx *ctx = container_of(filp->private_data,
> +					      struct mtk_fd_ctx, fh);
> +
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations fd_video_fops = {
> +	.owner = THIS_MODULE,
> +	.open = mtk_vfd_open,
> +	.release = mtk_vfd_release,
> +	.poll = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = v4l2_m2m_fop_mmap,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl32 = v4l2_compat_ioctl32,
> +#endif
> +
> +};
> +
> +static void mtk_fd_fill_user_param(struct user_param *user_param,
> +				   struct v4l2_ctrl_handler *hdl)
> +{
> +	struct v4l2_ctrl *ctrl;
> +	int i;
> +
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH);
> +	if (ctrl)
> +		for (i = 0; i < ctrl->elems; i++)
> +			user_param->scale_img_width[i] = ctrl->p_new.p_u16[i];
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT);
> +	if (ctrl)
> +		for (i = 0; i < ctrl->elems; i++)
> +			user_param->scale_img_height[i] = ctrl->p_new.p_u16[i];
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_SCALE_IMG_NUM);
> +	if (ctrl)
> +		user_param->scale_img_num = ctrl->val;
> +
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_DETECT_POSE);
> +	if (ctrl)
> +		for (i = 0; i < ctrl->elems; i++)
> +			user_param->face_directions[i] = ctrl->p_new.p_u16[i];
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_DETECT_SPEED);
> +	if (ctrl)
> +		user_param->fd_speedup = ctrl->val;
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_DETECTION_MODEL);
> +	if (ctrl)
> +		user_param->fd_extra_model = ctrl->val;
> +}
> +
> +static void mtk_fd_device_run(void *priv)
> +{
> +	struct mtk_fd_ctx *ctx = priv;
> +	struct mtk_fd_dev *fd = ctx->fd_dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct fd_enq_param fd_param;
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	fd_param.src_img[0].dma_addr =
> +		vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	fd_param.user_result.dma_addr =
> +		vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	fd_param.output_vaddr = (u64)vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +	fd_param.user_param.src_img_fmt =
> +		get_fd_img_fmt(ctx->src_fmt.pixelformat);
> +	if (ctx->src_fmt.num_planes == 2)
> +		fd_param.src_img[1].dma_addr =
> +			vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
> +	mtk_fd_fill_user_param(&fd_param.user_param, &ctx->hdl);
> +
> +	/* Complete request controls if any */
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
> +
> +	fd->output = (struct fd_user_output *)fd_param.output_vaddr;
> +	mtk_fd_hw_job_exec(fd, &fd_param);
> +}
> +
> +static struct v4l2_m2m_ops fd_m2m_ops = {
> +	.device_run = mtk_fd_device_run,
> +};
> +
> +static const struct media_device_ops fd_m2m_media_ops = {
> +	.req_validate	= vb2_request_validate,
> +	.req_queue	= v4l2_m2m_request_queue,
> +};

[snip]

> +
> +static int mtk_fd_suspend(struct device *dev)
> +{
> +	struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	if (fd->fd_stream_count)
> +		if (mtk_fd_job_abort(fd))
> +			mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> +

To avoid mtk_fd_hw_job_finish() trigger the next job,
I suppose that we could use v4l2_m2m_cancel_job instead of job_abort and
job_finish here.

/**
 * v4l2_m2m_cancel_job() - cancel pending jobs for the context
 * @m2m_ctx: m2m context with jobs to be canceled
 *
 * In case of streamoff or release called on any context,
 * 1] If the context is currently running, then abort job will be called
 * 2] If the context is queued, then the context will be removed from
 *    the job_queue
 */

or another way,
we may add a flag and implement mtk_fd_job_ready() that reads the flag
if we suspend, we set the flag and do job_abort and job_finish, even if
it try enqueue, it will still not really queue the job, until we reset
the flag in mtk_fd_resume().

how do you think?

> +	/* suspend FD HW */
> +	writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> +	writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> +	clk_disable_unprepare(fd->fd_clk);
> +	dev_dbg(dev, "%s:disable clock\n", __func__);
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_resume(struct device *dev)
> +{
> +	struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret = clk_prepare_enable(fd->fd_clk);
> +	if (ret < 0) {
> +		dev_dbg(dev, "Failed to open fd clk:%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* resume FD HW */
> +	writel(MTK_FD_SET_HW_ENABLE, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> +	writel(0x1, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> +	dev_dbg(dev, "%s:enable clock\n", __func__);
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(fd->fd_clk);
> +	return 0;
> +}
> +
> +static int mtk_fd_runtime_resume(struct device *dev)
> +{
> +	struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(fd->fd_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to open fd clk:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_fd_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mtk_fd_suspend, mtk_fd_resume)
> +	SET_RUNTIME_PM_OPS(mtk_fd_runtime_suspend, mtk_fd_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id mtk_fd_of_ids[] = {
> +	{ .compatible = "mediatek,mt8183-fd", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_fd_of_ids);
> +
> +static struct platform_driver mtk_fd_driver = {
> +	.probe   = mtk_fd_probe,
> +	.remove  = mtk_fd_remove,
> +	.driver  = {
> +		.name  = "mtk-fd-4.0",
> +		.of_match_table = of_match_ptr(mtk_fd_of_ids),
> +		.pm = &mtk_fd_pm_ops,
> +	}
> +};
> +module_platform_driver(mtk_fd_driver);
> +
> +MODULE_DESCRIPTION("Mediatek FD driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/mtk-fd-v4l2-controls.h b/include/uapi/linux/mtk-fd-v4l2-controls.h
> new file mode 100644
> index 000000000000..9b814de05b0c
> --- /dev/null
> +++ b/include/uapi/linux/mtk-fd-v4l2-controls.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +//
> +// Copyright (c) 2019 MediaTek Inc.
> +/*
> + * For V4L2_CID_MTK_FD_DETECT_POSE, User can set the desired face direction to
> + * be detected for each face angle, there are five face angle and 12 directions.
> + * Below shows the definition of face angle and face direction,
> + * and a recommended usage of for face detection, the more selected directions
> + * the longer HW process time needed.
> + *
> + * enum face_angle {
> + *	MTK_FD_FACE_FRONT,
> + *	MTK_FD_FACE_RIGHT_50,
> + *	MTK_FD_FACE_LEFT_50,
> + *	MTK_FD_FACE_RIGHT_90,
> + *	MTK_FD_FACE_LEFT_90,
> + *	MTK_FD_FACE_ANGLE_NUM,
> + * };
> + *
> + * struct face_direction_def {
> + *	__u16 MTK_FD_FACE_DIR_0 : 1,
> + *		MTK_FD_FACE_DIR_30 : 1,
> + *		MTK_FD_FACE_DIR_60 : 1,
> + *		MTK_FD_FACE_DIR_90 : 1,
> + *		MTK_FD_FACE_DIR_120 : 1,
> + *		MTK_FD_FACE_DIR_150 : 1,
> + *		MTK_FD_FACE_DIR_180 : 1,
> + *		MTK_FD_FACE_DIR_210 : 1,
> + *		MTK_FD_FACE_DIR_240 : 1,
> + *		MTK_FD_FACE_DIR_270 : 1,
> + *		MTK_FD_FACE_DIR_300 : 1,
> + *		MTK_FD_FACE_DIR_330 : 1,
> + *		: 4;
> + * };
> + *
> + * Sample usage:
> + * u16 face_directions[MTK_FD_FACE_ANGLE_NUM] = {0};
> + *
> + *	face_directions[MTK_FD_FACE_FRONT] = 0x3ff;
> + *
> + */
> +
> +#ifndef __UAPI_MTK_FD_V4L2_CONTROLS_H__
> +#define __UAPI_MTK_FD_V4L2_CONTROLS_H__
> +
> +#include <linux/v4l2-controls.h>
> +
> +/* Set the face angle and directions to be detected */
> +#define V4L2_CID_MTK_FD_DETECT_POSE		(V4L2_CID_USER_MTK_FD_BASE + 1)
> +
> +/* Set image widths for an input image to be scaled down for face detection */
> +#define V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH	(V4L2_CID_USER_MTK_FD_BASE + 2)
> +
> +/* Set image heights for an input image to be scaled down for face detection */
> +#define V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT	(V4L2_CID_USER_MTK_FD_BASE + 3)
> +
> +/* Set the length of scale down size array */
> +#define V4L2_CID_MTK_FD_SCALE_IMG_NUM		(V4L2_CID_USER_MTK_FD_BASE + 4)
> +
> +/* Set the detection speed, usually reducing accuracy. */
> +#define V4L2_CID_MTK_FD_DETECT_SPEED		(V4L2_CID_USER_MTK_FD_BASE + 5)
> +
> +/* Select the detection model or algorithm to be used. */
> +#define V4L2_CID_MTK_FD_DETECTION_MODEL		(V4L2_CID_USER_MTK_FD_BASE + 6)
> +
> +/* We reserve 16 controls for this driver. */
> +#define V4L2_CID_MTK_FD_MAX			16
> +

For these control IDs, I think the following should be remained as chip
specific controls.
V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH,
V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT and V4L2_CID_MTK_FD_SCALE_IMG_NUM 

Hope there would be standardizing face detection api that cover the rest
controls: V4L2_CID_MTK_FD_DETECT_POSE, V4L2_CID_MTK_FD_DETECT_SPEED and
V4L2_CID_MTK_FD_DETECTION_MODEL

Would you have any suggestions on how to propose the standard face
detection apis?

Thanks and best regards
Jerry

> +#endif /* __UAPI_MTK_FD_V4L2_CONTROLS_H__ */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 3dcfc6148f99..eae876ea6d0a 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -192,6 +192,10 @@ enum v4l2_colorfx {
>   * We reserve 16 controls for this driver. */
>  #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
>  
> +/* The base for the mediatek FD driver controls */
> +/* We reserve 16 controls for this driver. */
> +#define V4L2_CID_USER_MTK_FD_BASE		(V4L2_CID_USER_BASE + 0x10d0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */



