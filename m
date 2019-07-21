Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6AC6F3B2
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 16:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfGUObr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 10:31:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55722 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfGUObq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 10:31:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EADD6281EBE
Message-ID: <6a9d917e0a0040e81868ef6870d78502b19374bd.camel@collabora.com>
Subject: Re: [PATCH] m2m-deinterlace: use struct v4l2_fh
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Sun, 21 Jul 2019 11:31:37 -0300
In-Reply-To: <8975a874-cbc4-402c-2b21-4ee9febfa18f@xs4all.nl>
References: <8975a874-cbc4-402c-2b21-4ee9febfa18f@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-17 at 11:36 +0200, Hans Verkuil wrote:
> Convert this driver to use struct v4l2_fh and as a result switch to
> using vb2/v4l2_mem2mem helper functions as well.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Tested on an omap4 board, after additional hacking of this driver to
> make it work on omap4.
> ---
>  drivers/media/platform/m2m-deinterlace.c | 124 +++++++----------------
>  1 file changed, 36 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> index beb7fd7442fb..684346136fcb 100644
> --- a/drivers/media/platform/m2m-deinterlace.c
> +++ b/drivers/media/platform/m2m-deinterlace.c
> @@ -135,13 +135,13 @@ struct deinterlace_dev {
>  };
> 
>  struct deinterlace_ctx {
> +	struct v4l2_fh		fh;
>  	struct deinterlace_dev	*dev;
> 
>  	/* Abort requested by m2m */
>  	int			aborting;
>  	enum v4l2_colorspace	colorspace;
>  	dma_cookie_t		cookie;
> -	struct v4l2_m2m_ctx	*m2m_ctx;
>  	struct dma_interleaved_template *xt;
>  };
> 
> @@ -153,9 +153,9 @@ static int deinterlace_job_ready(void *priv)
>  	struct deinterlace_ctx *ctx = priv;
>  	struct deinterlace_dev *pcdev = ctx->dev;
> 
> -	if ((v4l2_m2m_num_src_bufs_ready(ctx->m2m_ctx) > 0)
> -	    && (v4l2_m2m_num_dst_bufs_ready(ctx->m2m_ctx) > 0)
> -	    && (atomic_read(&ctx->dev->busy) == 0)) {
> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) > 0 &&
> +	    v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx) > 0 &&
> +	    !atomic_read(&ctx->dev->busy)) {
>  		dprintk(pcdev, "Task ready\n");
>  		return 1;
>  	}
> @@ -174,7 +174,7 @@ static void deinterlace_job_abort(void *priv)
> 
>  	dprintk(pcdev, "Aborting task\n");
> 
> -	v4l2_m2m_job_finish(pcdev->m2m_dev, ctx->m2m_ctx);
> +	v4l2_m2m_job_finish(pcdev->m2m_dev, ctx->fh.m2m_ctx);
>  }
> 
>  static void dma_callback(void *data)
> @@ -185,8 +185,8 @@ static void dma_callback(void *data)
> 
>  	atomic_set(&pcdev->busy, 0);
> 
> -	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->m2m_ctx);
> -	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->m2m_ctx);
> +	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
> +	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
> 
>  	dst_vb->vb2_buf.timestamp = src_vb->vb2_buf.timestamp;
>  	dst_vb->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
> @@ -197,7 +197,7 @@ static void dma_callback(void *data)
>  	v4l2_m2m_buf_done(src_vb, VB2_BUF_STATE_DONE);
>  	v4l2_m2m_buf_done(dst_vb, VB2_BUF_STATE_DONE);
> 
> -	v4l2_m2m_job_finish(pcdev->m2m_dev, curr_ctx->m2m_ctx);
> +	v4l2_m2m_job_finish(pcdev->m2m_dev, curr_ctx->fh.m2m_ctx);
> 
>  	dprintk(pcdev, "dma transfers completed.\n");
>  }
> @@ -216,8 +216,8 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
>  	dma_addr_t p_in, p_out;
>  	enum dma_ctrl_flags flags;
> 
> -	src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> -	dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> 
>  	s_q_data = get_q_data(V4L2_BUF_TYPE_VIDEO_OUTPUT);
>  	s_width	= s_q_data->width;
> @@ -496,7 +496,7 @@ static int vidioc_g_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
>  	struct vb2_queue *vq;
>  	struct deinterlace_q_data *q_data;
> 
> -	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>  	if (!vq)
>  		return -EINVAL;
> 
> @@ -593,7 +593,7 @@ static int vidioc_s_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
>  	struct deinterlace_q_data *q_data;
>  	struct vb2_queue *vq;
> 
> -	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>  	if (!vq)
>  		return -EINVAL;
> 
> @@ -666,36 +666,6 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
>  	return ret;
>  }
> 
> -static int vidioc_reqbufs(struct file *file, void *priv,
> -			  struct v4l2_requestbuffers *reqbufs)
> -{
> -	struct deinterlace_ctx *ctx = priv;
> -
> -	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
> -}
> -
> -static int vidioc_querybuf(struct file *file, void *priv,
> -			   struct v4l2_buffer *buf)
> -{
> -	struct deinterlace_ctx *ctx = priv;
> -
> -	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
> -}
> -
> -static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
> -{
> -	struct deinterlace_ctx *ctx = priv;
> -
> -	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
> -}
> -
> -static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
> -{
> -	struct deinterlace_ctx *ctx = priv;
> -
> -	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
> -}
> -
>  static int vidioc_streamon(struct file *file, void *priv,
>  			   enum v4l2_buf_type type)
>  {
> @@ -736,15 +706,7 @@ static int vidioc_streamon(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
> 
> -	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
> -}
> -
> -static int vidioc_streamoff(struct file *file, void *priv,
> -			    enum v4l2_buf_type type)
> -{
> -	struct deinterlace_ctx *ctx = priv;
> -
> -	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
> +	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
>  }
> 
>  static const struct v4l2_ioctl_ops deinterlace_ioctl_ops = {
> @@ -760,14 +722,15 @@ static const struct v4l2_ioctl_ops deinterlace_ioctl_ops = {
>  	.vidioc_try_fmt_vid_out	= vidioc_try_fmt_vid_out,
>  	.vidioc_s_fmt_vid_out	= vidioc_s_fmt_vid_out,
> 
> -	.vidioc_reqbufs		= vidioc_reqbufs,
> -	.vidioc_querybuf	= vidioc_querybuf,
> -
> -	.vidioc_qbuf		= vidioc_qbuf,
> -	.vidioc_dqbuf		= vidioc_dqbuf,
> +	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
> 
>  	.vidioc_streamon	= vidioc_streamon,
> -	.vidioc_streamoff	= vidioc_streamoff,
> +	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
>  };
> 
> 
> @@ -831,7 +794,7 @@ static void deinterlace_buf_queue(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct deinterlace_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> 
> -	v4l2_m2m_buf_queue(ctx->m2m_ctx, vbuf);
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>  }
> 
>  static const struct vb2_ops deinterlace_qops = {
> @@ -849,7 +812,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	int ret;
> 
>  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -	src_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;

For this and the other patches: is this change related to v4l2_fh usage?

In any case,

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

