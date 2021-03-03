Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBC932C7DC
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351844AbhCDAc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388986AbhCCVbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 16:31:38 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350FEC061760
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 13:30:26 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id lr13so45119816ejb.8
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 13:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gz6/fn0MA6ieuQdfGlLO0r7rhZF3LTjYPpwbfwdmdwQ=;
        b=0/BAuiqJixT2tW+jYrcnO5pt2xRPDpV9QCp+A1R2IzaJgxIu4BFJkrie+yVeZzjtTI
         cZfvxJ7SUK0pb1hc9Vl7AaAq8KLl/+6Y0pWIJTJ1kv0rqlC86g8Y/qZtp6qlMALvsC2J
         0Z/SMpAloe64Lghu8e/ZQKg6YwOktzoZqS49wyRMitMyZ8NSgBs+dROcnsER3jygypR6
         4rILBQNOLN3kfMMMa8WI/e9RUsjbht0okpVSYKf0tBfK/PnPDnqgaBcnuQEqmjL9NAIv
         WaxXSGfY41AMctmM7S3iIZMLlfr/wwYmhECOH86QI1MGMtsSRhSya/jJ+RIhTpGr9fG5
         iXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gz6/fn0MA6ieuQdfGlLO0r7rhZF3LTjYPpwbfwdmdwQ=;
        b=Hu/LVl+8Yt+FBRVOnGtQE81AqxlUqR5ynikjoO077jgKzii7JWNVB3gsXxc9bEmbSD
         G33bWeGIbF/OLoG9cF9J1yq7Z0j/FZ53PB7wWjkBBpMc3Kj75WjyE3HIU5zHAMUinN4j
         D/9u8cLJZrdy5FeNiN3a3N1KMNtgj90DBgN/wjyTVAh22NVJ2NLOD/iNLYrNy6FP64yu
         ahYACgmam39FH3KOEQhuOjWITlxs/KnV7wHXhRH4cc5Tif6c+uvrPQTdpQ3FEq7GNc4g
         4b+/LP0sU1sq0ZNBZvDoC0tAMJqNJJLWITo//MoGXwM9HH4IqI3n5IlXqJolcfAOToEy
         7FKQ==
X-Gm-Message-State: AOAM531gQzy2W6mDcdpwhVldx9tgY8aqziqsdbMHZURmFMe48DuucY2r
        B47LqIUX8AejyTcLZpY+gcPh3o/Qwaw5gULiz1aPHA==
X-Google-Smtp-Source: ABdhPJx/Ww50xcbxMCXAhqIJNlvSZj5dJOIGwmT9jDly92NvUIWsVDsivQ7xXU33zDPntqx83j2iB/DewF93ye2XQ84=
X-Received: by 2002:a17:906:a3d1:: with SMTP id ca17mr765839ejb.92.1614807024886;
 Wed, 03 Mar 2021 13:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20210226100148.1663389-1-acourbot@chromium.org> <20210226100148.1663389-6-acourbot@chromium.org>
In-Reply-To: <20210226100148.1663389-6-acourbot@chromium.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 3 Mar 2021 18:30:12 -0300
Message-ID: <CAAEAJfDyHYGf+J6WDHchVATOvj5AJpO8dkAStiNGNobJ9Uz8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] media: mtk-vcodec: vdec: support stateless API
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Alex,

Thanks for the patch.

On Fri, 26 Feb 2021 at 07:06, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Support the stateless codec API that will be used by MT8183.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 ++++++++++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
>  5 files changed, 503 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>
[..]

> +
> +static const struct mtk_stateless_control mtk_stateless_controls[] = {
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_SPS,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,

This "needed_in_request" is not really required, as controls
are not volatile, and their value is stored per-context (per-fd).

It's perfectly valid for an application to pass the SPS control
at the beginning of the sequence, and then omit it
in further requests.

> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_PPS,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +               .needed_in_request = true,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +                       .def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +                       .max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +                       .menu_skip_mask =
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +                               BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +       },
> +       {
> +               .cfg = {
> +                       .id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> +                       .min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +                       .def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +                       .max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +               },
> +               .codec_type = V4L2_PIX_FMT_H264_SLICE,
> +       },
> +};

Applications also need to know which V4L2_CID_STATELESS_H264_START_CODE
the driver supports. From a next patch, this case seems to be
V4L2_STATELESS_H264_START_CODE_ANNEX_B.

> +#define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> +
> +static const struct mtk_video_fmt mtk_video_formats[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> +               .type = MTK_FMT_DEC,
> +               .num_planes = 1,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_MM21,
> +               .type = MTK_FMT_FRAME,
> +               .num_planes = 2,
> +       },
> +};
> +#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> +#define DEFAULT_OUT_FMT_IDX    0
> +#define DEFAULT_CAP_FMT_IDX    1
> +
> +static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> +               .stepwise = {
> +                       MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
> +                       MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16,
> +               },
> +       },
> +};
> +
> +#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> +
> +static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
> +                                              struct vdec_fb *fb)
> +{
> +       struct mtk_video_dec_buf *vdec_frame_buf =
> +               container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> +       struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
> +       unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +
> +       vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
> +       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +               unsigned int cap_c_size =
> +                       ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +
> +               vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
> +       }
> +}
> +
> +static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
> +                                          struct vb2_v4l2_buffer *vb2_v4l2)
> +{
> +       struct mtk_video_dec_buf *framebuf =
> +               container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
> +       struct vdec_fb *pfb = &framebuf->frame_buffer;
> +       struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
> +
> +       pfb = &framebuf->frame_buffer;
> +       pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);

Are you sure you need a CPU mapping? It seems strange.
I'll comment some more on the next patch(es).

> +       pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +       pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +
> +       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +               pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
> +               pfb->base_c.dma_addr =
> +                       vb2_dma_contig_plane_dma_addr(dst_buf, 1);
> +               pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +       }
> +       mtk_v4l2_debug(1,
> +               "id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx frame_count = %d",
> +               dst_buf->index, pfb,
> +               pfb->base_y.va, &pfb->base_y.dma_addr,
> +               &pfb->base_c.dma_addr, pfb->base_y.size,
> +               ctx->decoded_frame_cnt);
> +
> +       return pfb;
> +}
> +
> +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> +{
> +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +       v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +}
> +
> +static int fops_media_request_validate(struct media_request *mreq)
> +{
> +       const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
> +       struct mtk_vcodec_ctx *ctx = NULL;
> +       struct media_request_object *req_obj;
> +       struct v4l2_ctrl_handler *parent_hdl, *hdl;
> +       struct v4l2_ctrl *ctrl;
> +       unsigned int i;
> +
> +       switch (buffer_cnt) {
> +       case 1:
> +               /* We expect exactly one buffer with the request */
> +               break;
> +       case 0:
> +               mtk_v4l2_err("No buffer provided with the request");
> +               return -ENOENT;
> +       default:
> +               mtk_v4l2_err("Too many buffers (%d) provided with the request",
> +                            buffer_cnt);
> +               return -EINVAL;
> +       }
> +
> +       list_for_each_entry(req_obj, &mreq->objects, list) {
> +               struct vb2_buffer *vb;
> +
> +               if (vb2_request_object_is_buffer(req_obj)) {
> +                       vb = container_of(req_obj, struct vb2_buffer, req_obj);
> +                       ctx = vb2_get_drv_priv(vb->vb2_queue);
> +                       break;
> +               }
> +       }
> +
> +       if (!ctx) {
> +               mtk_v4l2_err("Cannot find buffer for request");
> +               return -ENOENT;
> +       }
> +
> +       parent_hdl = &ctx->ctrl_hdl;
> +
> +       hdl = v4l2_ctrl_request_hdl_find(mreq, parent_hdl);
> +       if (!hdl) {
> +               mtk_v4l2_err("Cannot find control handler for request\n");
> +               return -ENOENT;
> +       }
> +
> +       for (i = 0; i < NUM_CTRLS; i++) {
> +               if (mtk_stateless_controls[i].codec_type != ctx->current_codec)
> +                       continue;
> +               if (!mtk_stateless_controls[i].needed_in_request)
> +                       continue;
> +
> +               ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
> +                                         mtk_stateless_controls[i].cfg.id);
> +               if (!ctrl) {
> +                       mtk_v4l2_err("Missing required codec control\n");
> +                       return -ENOENT;
> +               }
> +       }
> +
> +       v4l2_ctrl_request_hdl_put(hdl);
> +
> +       return vb2_request_validate(mreq);
> +}
> +
> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +       struct mtk_vcodec_ctx *ctx =
> +               container_of(work, struct mtk_vcodec_ctx, decode_work);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> +       struct vb2_buffer *vb2_src;
> +       struct mtk_vcodec_mem *bs_src;
> +       struct mtk_video_dec_buf *dec_buf_src;
> +       struct media_request *src_buf_req;
> +       struct vdec_fb *dst_buf;
> +       bool res_chg = false;
> +       int ret;
> +
> +       vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_src == NULL) {
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               mtk_v4l2_debug(1, "[%d] no available source buffer", ctx->id);
> +               return;
> +       }
> +
> +       vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_dst == NULL) {
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
> +               return;
> +       }
> +
> +       vb2_src = &vb2_v4l2_src->vb2_buf;
> +       dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
> +                                  m2m_buf.vb);
> +       bs_src = &dec_buf_src->bs_buffer;
> +
> +       mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
> +                       ctx->id, src_buf->vb2_queue->type,
> +                       src_buf->index, src_buf, src_buf_info);
> +
> +       bs_src->va = vb2_plane_vaddr(vb2_src, 0);
> +       bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
> +       bs_src->size = (size_t)vb2_src->planes[0].bytesused;
> +       if (!bs_src->va) {
> +               v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +               mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
> +                            vb2_src->index);
> +               return;
> +       }
> +
> +       mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
> +                       ctx->id, buf->va, &buf->dma_addr, buf->size, src_buf);
> +       /* Apply request controls. */
> +       src_buf_req = vb2_src->req_obj.req;
> +       if (src_buf_req)
> +               v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> +       else
> +               mtk_v4l2_err("vb2 buffer media request is NULL");
> +
> +       dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
> +       v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
> +       ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
> +       if (ret) {
> +               mtk_v4l2_err(
> +                       " <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
> +                       ctx->id, vb2_src->index, bs_src->size,
> +                       vb2_src->timestamp, ret, res_chg);
> +               if (ret == -EIO) {
> +                       mutex_lock(&ctx->lock);
> +                       dec_buf_src->error = true;
> +                       mutex_unlock(&ctx->lock);
> +               }
> +       }
> +
> +       mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
> +
> +       v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +               ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +
> +       v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +}
> +
> +static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
> +
> +       mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
> +                       ctx->id, vb->vb2_queue->type,
> +                       vb->index, vb);
> +
> +       mutex_lock(&ctx->lock);
> +       v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
> +       mutex_unlock(&ctx->lock);
> +       if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return;
> +
> +       mtk_v4l2_debug(3, "(%d) id=%d, bs=%p",
> +               vb->vb2_queue->type, vb->index, src_buf);
> +
> +       /* If an OUTPUT buffer, we may need to update the state */
> +       if (ctx->state == MTK_STATE_INIT) {
> +               ctx->state = MTK_STATE_HEADER;
> +               mtk_v4l2_debug(1, "Init driver from init to header.");

This state thing seems just something to make the rest
of the stateful-based driver happy, right?

Makes me wonder a bit if just splitting the stateless part to its
own driver, wouldn't make your maintenance easier.

What's the motivation for sharing the driver?

> +       } else {
> +               mtk_v4l2_debug(3, "[%d] already init driver %d",
> +                               ctx->id, ctx->state);
> +       }
> +}
> +
> +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> +{
> +       bool res_chg;
> +
> +       return vdec_if_decode(ctx, NULL, NULL, &res_chg);
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
> +       .g_volatile_ctrl = mtk_vdec_g_v_ctrl,
> +};
> +
> +static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct v4l2_ctrl *ctrl;
> +       unsigned int i;
> +
> +       v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
> +       if (ctx->ctrl_hdl.error) {
> +               mtk_v4l2_err("v4l2_ctrl_handler_init failed\n");
> +               return ctx->ctrl_hdl.error;
> +       }
> +
> +       ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl,
> +                               &mtk_vcodec_dec_ctrl_ops,
> +                               V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +                               0, 32, 1, 1);
> +       ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;

Hm, this volatile control for MIN_BUFFERS_FOR_CAPTURE seems
to return the DPB size. However, isn't this something userspace already knows?

> +
> +       for (i = 0; i < NUM_CTRLS; i++) {
> +               struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
> +
> +               v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
> +               if (ctx->ctrl_hdl.error) {
> +                       mtk_v4l2_err("Adding control %d failed %d",
> +                                       i, ctx->ctrl_hdl.error);
> +                       return ctx->ctrl_hdl.error;
> +               }
> +       }
> +
> +       v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +
> +       return 0;
> +}
> +
> +const struct media_device_ops mtk_vcodec_media_ops = {
> +       .req_validate   = fops_media_request_validate,
> +       .req_queue      = v4l2_m2m_request_queue,
> +};
> +
> +static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vb2_queue *src_vq;
> +
> +       src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> +                                V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +       /* Support request api for output plane */
> +       src_vq->supports_requests = true;
> +       src_vq->requires_requests = true;
> +}
> +
> +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
> +{

I have to admit I do not remember exactly the reason,
but this should set the buffer field to V4L2_FIELD_NONE.

Thanks,
Ezequiel
