Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0099393E28
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 09:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhE1Hpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 03:45:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33170 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhE1Hpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 03:45:36 -0400
Received: from [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d] (unknown [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 760411F41EBF;
        Fri, 28 May 2021 08:43:58 +0100 (BST)
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP
 commands
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org>
 <9b37044d-f909-9169-3d22-fa6c5f788822@collabora.com>
Message-ID: <082ffa69-1280-f5e8-f8ef-a1bb6d2bc8c5@collabora.com>
Date:   Fri, 28 May 2021 10:43:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b37044d-f909-9169-3d22-fa6c5f788822@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


On 28.05.21 10:03, Dafna Hirschfeld wrote:
> Hi,
> 
> I applied this patchset and tested the stateful encoder on debian with the command:
> 
> [gst-master] root@debian:~/gst-build# gst-launch-1.0 filesrc location=images/jelly-800-640.YU12 ! rawvideoparse width=800 height=640 format=i420 ! videoconvert ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=jelly-800-640.mp4
> 
> I get:
> 
> Setting pipeline[   79.703879] [MTK_V4L2] level=0 fops_vcodec_open(),190: encoder capability 10000000
>   to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> [   80.621076] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.631232] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.640878] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.650766] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.660430] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.670194] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.680967] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.691376] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.701718] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.712106] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.722272] [MTK_V4L2] level=0 mtk_venc_set_param(),371: fmt 0x3, P/L 0/0, w/h 800/640, buf 800/640, fps/bps 25/4000000, gop 0, i_period 0
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> [   81.918747] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
> [   81.931392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
> [   81.938470] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
> [   82.974746] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
> [   82.987392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
> [   82.994471] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
> [  104.163977] cros-ec-dev cros-ec-dev.2.auto: Some logs may have been dropped...
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> ^Chandling interrupt.
> 
> And then the streaming hangs. The same error happens without this patchset, but without
> this patchset the statful encoder does not support V4L2_ENC_CMD_STOP/START needed by the spec.
> I am not sure what cause the error and wether those mtk-iommu erros has to do with that. The issue
> could also come from the mtk-vpu used by the encoder.
> Do you have any idea where this can come from?
> 
> Thanks,
> Dafna
> 
> 
> 
> On 19.05.21 17:30, Alexandre Courbot wrote:
>> The V4L2 encoder specification requires encoders to support the
>> V4L2_ENC_CMD_START and V4L2_ENC_CMD_STOP commands. Add support for these
>> to the mtk-vcodec encoder by reusing the same flush buffer as used by
>> the decoder driver.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> [hsinyi: fix double-free issue if flush buffer was not dequeued by the
>> time streamoff is called]
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
>>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   2 +
>>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 +++++++++++++++++-
>>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
>>   3 files changed, 134 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
>> index c6fe61253f43..37a62c0f406f 100644
>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
>> @@ -252,6 +252,7 @@ struct vdec_pic_info {
>>    * @last_decoded_picinfo: pic information get from latest decode
>>    * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
>>    *             to be used with encoder and stateful decoder.
>> + * @is_flushing: set to true if flushing is in progress.
>>    *
>>    * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>>    * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
>> @@ -290,6 +291,7 @@ struct mtk_vcodec_ctx {
>>       struct work_struct encode_work;
>>       struct vdec_pic_info last_decoded_picinfo;
>>       struct v4l2_m2m_buffer empty_flush_buf;
>> +    bool is_flushing;
>>       enum v4l2_colorspace colorspace;
>>       enum v4l2_ycbcr_encoding ycbcr_enc;
>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>> index 4831052f475d..4701dea251ca 100644
>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>> @@ -659,6 +659,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
>>                    struct v4l2_buffer *buf)
>>   {
>>       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>> +    int ret;
>>       if (ctx->state == MTK_STATE_ABORT) {
>>           mtk_v4l2_err("[%d] Call on QBUF after unrecoverable error",
>> @@ -666,7 +667,77 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
>>           return -EIO;
>>       }
>> -    return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
>> +    ret = v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /*
>> +     * Complete flush if the user dequeued the 0-payload LAST buffer.
>> +     * We check the payload because a buffer with the LAST flag can also
>> +     * be seen during resolution changes. If we happen to be flushing at
>> +     * that time, the last buffer before the resolution changes could be
>> +     * misinterpreted for the buffer generated by the flush and terminate
>> +     * it earlier than we want.
>> +     */
>> +    if (!V4L2_TYPE_IS_OUTPUT(buf->type) &&
>> +        buf->flags & V4L2_BUF_FLAG_LAST &&
>> +        buf->m.planes[0].bytesused == 0 &&
>> +        ctx->is_flushing) {
>> +        /*
>> +         * Last CAPTURE buffer is dequeued, we can allow another flush
>> +         * to take place.
>> +         */
>> +        ctx->is_flushing = false;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int vidioc_encoder_cmd(struct file *file, void *priv,
>> +                  struct v4l2_encoder_cmd *cmd)
>> +{
>> +    struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>> +    struct vb2_queue *src_vq, *dst_vq;
>> +    int ret;

I see that the driver return -EIO on the ioctls when in state MTK_STATE_ABORT
so you should probably test the state here as well.

Thanks,
Dafna

>> +
>> +    ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, cmd);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Calling START or STOP is invalid if a flush is in progress */
>> +    if (ctx->is_flushing)
>> +        return -EBUSY;
>> +
>> +    mtk_v4l2_debug(1, "encoder cmd=%u", cmd->cmd);
>> +
>> +    dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>> +                V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +    switch (cmd->cmd) {
>> +    case V4L2_ENC_CMD_STOP:
>> +        src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>> +                V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +        if (!vb2_is_streaming(src_vq)) {
>> +            mtk_v4l2_debug(1, "Output stream is off. No need to flush.");
>> +            return 0;
>> +        }
>> +        if (!vb2_is_streaming(dst_vq)) {
>> +            mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
>> +            return 0;
>> +        }
>> +        ctx->is_flushing = true;
>> +        v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
>> +        v4l2_m2m_try_schedule(ctx->m2m_ctx);
>> +        break;
>> +
>> +    case V4L2_ENC_CMD_START:
>> +        vb2_clear_last_buffer_dequeued(dst_vq);
>> +        break;
>> +
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>>   }
>>   const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
>> @@ -702,6 +773,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
>>       .vidioc_g_selection        = vidioc_venc_g_selection,
>>       .vidioc_s_selection        = vidioc_venc_s_selection,
>> +
>> +    .vidioc_encoder_cmd        = vidioc_encoder_cmd,
>> +    .vidioc_try_encoder_cmd        = v4l2_m2m_ioctl_try_encoder_cmd,
>>   };
>>   static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
>> @@ -869,9 +943,39 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>>               dst_buf->vb2_buf.planes[0].bytesused = 0;
>>               v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>>           }
>> +        /* STREAMOFF on the CAPTURE queue completes any ongoing flush */
>> +        if (ctx->is_flushing) {
>> +            struct v4l2_m2m_buffer *b, *n;
>> +
>> +            mtk_v4l2_debug(1, "STREAMOFF called while flushing");
>> +            /*
>> +             * STREAMOFF could be called before the flush buffer is
>> +             * dequeued. Check whether empty flush buf is still in
>> +             * queue before removing it.
>> +             */
>> +            v4l2_m2m_for_each_src_buf_safe(ctx->m2m_ctx, b, n) {
>> +                if (b == &ctx->empty_flush_buf) {
>> +                    v4l2_m2m_src_buf_remove_by_buf(
>> +                            ctx->m2m_ctx, &b->vb);
>> +                    break;
>> +                }
>> +            }
>> +            ctx->is_flushing = false;
>> +        }
>>       } else {
>> -        while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>> -            v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>> +        while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
>> +            if (src_buf != &ctx->empty_flush_buf.vb)
>> +                v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>> +        }
>> +        if (ctx->is_flushing) {
>> +            /*
>> +             * If we are in the middle of a flush, put the flush
>> +             * buffer back into the queue so the next CAPTURE
>> +             * buffer gets returned with the LAST flag set.
>> +             */
>> +            v4l2_m2m_buf_queue(ctx->m2m_ctx,
>> +                       &ctx->empty_flush_buf.vb);
>> +        }
>>       }
>>       if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>> @@ -971,12 +1075,15 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
>>   {
>>       struct venc_enc_param enc_prm;
>>       struct vb2_v4l2_buffer *vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
>> -    struct mtk_video_enc_buf *mtk_buf =
>> -            container_of(vb2_v4l2, struct mtk_video_enc_buf,
>> -                     m2m_buf.vb);
>> -
>> +    struct mtk_video_enc_buf *mtk_buf;
>>       int ret = 0;
>> +    /* Don't upcast the empty flush buffer */
>> +    if (vb2_v4l2 == &ctx->empty_flush_buf.vb)
>> +        return 0;
>> +
>> +    mtk_buf = container_of(vb2_v4l2, struct mtk_video_enc_buf, m2m_buf.vb);
>> +
>>       memset(&enc_prm, 0, sizeof(enc_prm));
>>       if (mtk_buf->param_change == MTK_ENCODE_PARAM_NONE)
>>           return 0;
>> @@ -1062,6 +1169,20 @@ static void mtk_venc_worker(struct work_struct *work)
>>       }
>>       src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
>> +
>> +    /*
>> +     * If we see the flush buffer, send an empty buffer with the LAST flag
>> +     * to the client. is_flushing will be reset at the time the buffer
>> +     * is dequeued.
>> +     */
>> +    if (src_buf == &ctx->empty_flush_buf.vb) {
>> +        vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>> +        dst_buf->flags |= V4L2_BUF_FLAG_LAST;
>> +        v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>> +        v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);
>> +        return;
>> +    }
>> +
>>       memset(&frm_buf, 0, sizeof(frm_buf));
>>       for (i = 0; i < src_buf->vb2_buf.num_planes ; i++) {
>>           frm_buf.fb_addr[i].dma_addr =
>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
>> index 7d7b8cfc2cc5..2dd6fef896df 100644
>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
>> @@ -131,6 +131,7 @@ static int fops_vcodec_open(struct file *file)
>>       struct mtk_vcodec_dev *dev = video_drvdata(file);
>>       struct mtk_vcodec_ctx *ctx = NULL;
>>       int ret = 0;
>> +    struct vb2_queue *src_vq;
>>       ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>>       if (!ctx)
>> @@ -164,6 +165,9 @@ static int fops_vcodec_open(struct file *file)
>>                   ret);
>>           goto err_m2m_ctx_init;
>>       }
>> +    src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>> +                V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +    ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
>>       mtk_vcodec_enc_set_default_params(ctx);
>>       if (v4l2_fh_is_singular(&ctx->fh)) {
>>
