Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3BE3E0177
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 14:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbhHDMx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 08:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237536AbhHDMx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Aug 2021 08:53:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D51C0613D5;
        Wed,  4 Aug 2021 05:53:43 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f] (unknown [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ABD7D1F43956;
        Wed,  4 Aug 2021 13:53:40 +0100 (BST)
Subject: Re: [PATCH v4 14/15] media: mtk-vcodec: venc: support START and STOP
 commands
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-15-acourbot@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <59b6a19a-0ed6-e142-cb67-0f7c6b64dd6d@collabora.com>
Date:   Wed, 4 Aug 2021 14:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-15-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 27.04.21 13:15, Alexandre Courbot wrote:
> The V4L2 encoder specification requires encoders to support the
> V4L2_ENC_CMD_START and V4L2_ENC_CMD_STOP commands. Add support for these
> to the mtk-vcodec encoder by reusing the same flush buffer as used by
> the decoder driver.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   2 +
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 123 +++++++++++++++++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
>   3 files changed, 122 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index c2f4cad6cfc2..1b61d722d313 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -252,6 +252,7 @@ struct vdec_pic_info {
>    * @last_decoded_picinfo: pic information get from latest decode
>    * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
>    *		     to be used with encoder and stateful decoder.
> + * @is_flushing: set to true if flushing is in progress.
>    * @current_codec: current set input codec, in V4L2 pixel format
>    *
>    * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
> @@ -291,6 +292,7 @@ struct mtk_vcodec_ctx {
>   	struct work_struct encode_work;
>   	struct vdec_pic_info last_decoded_picinfo;
>   	struct v4l2_m2m_buffer empty_flush_buf;
> +	bool is_flushing;
>   
>   	u32 current_codec;
>   
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 4831052f475d..8058331dc553 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -659,6 +659,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
>   			     struct v4l2_buffer *buf)
>   {
>   	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	int ret;
>   
>   	if (ctx->state == MTK_STATE_ABORT) {
>   		mtk_v4l2_err("[%d] Call on QBUF after unrecoverable error",
> @@ -666,7 +667,77 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
>   		return -EIO;
>   	}
>   
> -	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
> +	ret = v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Complete flush if the user dequeued the 0-payload LAST buffer.
> +	 * We check the payload because a buffer with the LAST flag can also
> +	 * be seen during resolution changes. If we happen to be flushing at
> +	 * that time, the last buffer before the resolution changes could be
> +	 * misinterpreted for the buffer generated by the flush and terminate
> +	 * it earlier than we want.
> +	 */
> +	if (!V4L2_TYPE_IS_OUTPUT(buf->type) &&
> +	    buf->flags & V4L2_BUF_FLAG_LAST &&
> +	    buf->m.planes[0].bytesused == 0 &&
> +	    ctx->is_flushing) {
> +		/*
> +		 * Last CAPTURE buffer is dequeued, we can allow another flush
> +		 * to take place.
> +		 */
> +		ctx->is_flushing = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vidioc_encoder_cmd(struct file *file, void *priv,
> +			      struct v4l2_encoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	struct vb2_queue *src_vq, *dst_vq;
> +	int ret;
> +
> +	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, cmd);
> +	if (ret)
> +		return ret;
> +
> +	/* Calling START or STOP is invalid if a flush is in progress */
> +	if (ctx->is_flushing)
> +		return -EBUSY;
> +
> +	mtk_v4l2_debug(1, "encoder cmd=%u", cmd->cmd);
> +
> +	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> +				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	switch (cmd->cmd) {
> +	case V4L2_ENC_CMD_STOP:
> +		src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> +				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +		if (!vb2_is_streaming(src_vq)) {
> +			mtk_v4l2_debug(1, "Output stream is off. No need to flush.");
> +			return 0;
> +		}
> +		if (!vb2_is_streaming(dst_vq)) {
> +			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
> +			return 0;
> +		}
> +		ctx->is_flushing = true;
> +		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
> +		v4l2_m2m_try_schedule(ctx->m2m_ctx);
> +		break;
> +
> +	case V4L2_ENC_CMD_START:
> +		vb2_clear_last_buffer_dequeued(dst_vq);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
>   }
>   
>   const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
> @@ -702,6 +773,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
>   
>   	.vidioc_g_selection		= vidioc_venc_g_selection,
>   	.vidioc_s_selection		= vidioc_venc_s_selection,
> +
> +	.vidioc_encoder_cmd		= vidioc_encoder_cmd,
> +	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
>   };
>   
>   static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
> @@ -869,9 +943,27 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>   			dst_buf->vb2_buf.planes[0].bytesused = 0;
>   			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>   		}
> +		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
> +		if (ctx->is_flushing) {
> +			mtk_v4l2_debug(1, "STREAMOFF called while flushing");
> +			v4l2_m2m_buf_remove_by_buf(&ctx->m2m_ctx->out_q_ctx,
> +						   &ctx->empty_flush_buf.vb);
> +			ctx->is_flushing = false;
> +		}
>   	} else {
> -		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
> -			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
> +			if (src_buf != &ctx->empty_flush_buf.vb)
> +				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +		}
> +		if (ctx->is_flushing) {
> +			/*
> +			 * If we are in the middle of a flush, put the flush
> +			 * buffer back into the queue so the next CAPTURE
> +			 * buffer gets returned with the LAST flag set.
> +			 */
> +			v4l2_m2m_buf_queue(ctx->m2m_ctx,
> +					   &ctx->empty_flush_buf.vb);
> +		}
>   	}
>   
>   	if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> @@ -971,12 +1063,15 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
>   {
>   	struct venc_enc_param enc_prm;
>   	struct vb2_v4l2_buffer *vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> -	struct mtk_video_enc_buf *mtk_buf =
> -			container_of(vb2_v4l2, struct mtk_video_enc_buf,
> -				     m2m_buf.vb);
> -
> +	struct mtk_video_enc_buf *mtk_buf;
>   	int ret = 0;
>   
> +	/* Don't upcast the empty flush buffer */
> +	if (vb2_v4l2 == &ctx->empty_flush_buf.vb)
> +		return 0;

Hi, this check should also be in vb2ops_venc_buf_queue before upcasting

Thanks,
Dafna

> +
> +	mtk_buf = container_of(vb2_v4l2, struct mtk_video_enc_buf, m2m_buf.vb);
> +
>   	memset(&enc_prm, 0, sizeof(enc_prm));
>   	if (mtk_buf->param_change == MTK_ENCODE_PARAM_NONE)
>   		return 0;
> @@ -1062,6 +1157,20 @@ static void mtk_venc_worker(struct work_struct *work)
>   	}
>   
>   	src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +
> +	/*
> +	 * If we see the flush buffer, send an empty buffer with the LAST flag
> +	 * to the client. is_flushing will be reset at the time the buffer
> +	 * is dequeued.
> +	 */
> +	if (src_buf == &ctx->empty_flush_buf.vb) {
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
> +		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
> +		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> +		v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);
> +		return;
> +	}
> +
>   	memset(&frm_buf, 0, sizeof(frm_buf));
>   	for (i = 0; i < src_buf->vb2_buf.num_planes ; i++) {
>   		frm_buf.fb_addr[i].dma_addr =
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 7d7b8cfc2cc5..2dd6fef896df 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -131,6 +131,7 @@ static int fops_vcodec_open(struct file *file)
>   	struct mtk_vcodec_dev *dev = video_drvdata(file);
>   	struct mtk_vcodec_ctx *ctx = NULL;
>   	int ret = 0;
> +	struct vb2_queue *src_vq;
>   
>   	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
> @@ -164,6 +165,9 @@ static int fops_vcodec_open(struct file *file)
>   				ret);
>   		goto err_m2m_ctx_init;
>   	}
> +	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> +				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
>   	mtk_vcodec_enc_set_default_params(ctx);
>   
>   	if (v4l2_fh_is_singular(&ctx->fh)) {
> 
