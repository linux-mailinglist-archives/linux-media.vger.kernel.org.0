Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377D737F4C1
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 11:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhEMJWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 05:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhEMJWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 05:22:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7FEC061574
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:21:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j10so37611261lfb.12
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBhjsBg5zj8GdhNstXFypXL7FVkbxsAn4KHrq453z/4=;
        b=HWEP5kUvdfGEWoUnFdAbKl2FcTvl9LyUxqIOdkcX5yIxCJB37oEOEuPm0AmcF2Z4xC
         mNkPaeAtr0crlolLRo9RNJprg+tf5As3xQZTbPuJZ2GVNXdkSiHyxD77bi+blnHFdl8+
         6J/8w4czH2bFJX+yDJoEOq55AF3LyuHwgYeJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBhjsBg5zj8GdhNstXFypXL7FVkbxsAn4KHrq453z/4=;
        b=p62JW368ELqR6A+aoH1RiLdPLRKNOS5Iw4qd1i2rGCoOHCuFuv/G31hpoOEaw5HndP
         5mr67NC9Y69KD20+89hHQMzLS/uHW/1tnZ9nyUsRBGaUbBjfG//MEn2nKrxQSAb7MgZx
         GkrwISUP8xp0TXP3/oRsUWns2PR284VW+cFg6jMMe8HbvGbuCPTO0xDyzkYnJhYJoNn7
         31QXTf6Dgi9RMGdlJT0kcIbC8V4Fo7Uip/pqsMjHWVDUdiBHnKz98w/NdN1uOO4n0MLv
         EjJDZQ2hfNfE0oKIk57ibC+SjDhBjKYInofpq0+t0PdoSq+vOv/qn8OjPtAk+EQFMFec
         KHaQ==
X-Gm-Message-State: AOAM532KR5UgVQeMsKoy/Z5Rm4DMopSlbmfk8scHRc75jn2bwc3GvLqQ
        c8+HKUwK5ZcI6a2HqszS/oAT+ljKQVO/XA==
X-Google-Smtp-Source: ABdhPJyC68v7Mi8Y0zMN8Uw1YGGFtHZ2FAr05Xc/+nNg49wbDkY/dbo+J93jB/nxiHjGbOC+Pmff9g==
X-Received: by 2002:ac2:5316:: with SMTP id c22mr27251145lfh.609.1620897663933;
        Thu, 13 May 2021 02:21:03 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id o20sm230892lfu.283.2021.05.13.02.21.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 02:21:03 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id w15so32965428ljo.10
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:21:03 -0700 (PDT)
X-Received: by 2002:a2e:988b:: with SMTP id b11mr32839689ljj.87.1620897662778;
 Thu, 13 May 2021 02:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-6-acourbot@chromium.org> <4f295d39-5606-8efb-79e4-27ab221db75f@xs4all.nl>
In-Reply-To: <4f295d39-5606-8efb-79e4-27ab221db75f@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 13 May 2021 18:20:51 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW0B8O1nsYdUjYgTJz8oCB1yR5jR29KC_6broSYSqMx1g@mail.gmail.com>
Message-ID: <CAPBb6MW0B8O1nsYdUjYgTJz8oCB1yR5jR29KC_6broSYSqMx1g@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] media: mtk-vcodec: vdec: support stateless API
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Apr 29, 2021 at 4:27 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/04/2021 13:15, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > Support the stateless codec API that will be used by MT8183.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/platform/mtk-vcodec/Makefile    |   1 +
> >  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +++-
> >  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
> >  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++++++++++++
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
> >  5 files changed, 446 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> > index 9c3cbb5b800e..4ba93d838ab6 100644
> > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -12,6 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
> >               vdec_vpu_if.o \
> >               mtk_vcodec_dec.o \
> >               mtk_vcodec_dec_stateful.o \
> > +             mtk_vcodec_dec_stateless.o \
> >               mtk_vcodec_dec_pm.o \
> >
> >  mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 4ad2662a43b2..01c5333d6cff 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -46,6 +46,13 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
> >  static int vidioc_try_decoder_cmd(struct file *file, void *priv,
> >                               struct v4l2_decoder_cmd *cmd)
> >  {
> > +     struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +
> > +     /* Use M2M stateless helper if relevant */
> > +     if (ctx->dev->vdec_pdata->uses_stateless_api)
> > +             return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> > +                                                             cmd);
> > +
> >       switch (cmd->cmd) {
> >       case V4L2_DEC_CMD_STOP:
> >       case V4L2_DEC_CMD_START:
> > @@ -72,6 +79,10 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
> >       if (ret)
> >               return ret;
> >
> > +     /* Use M2M stateless helper if relevant */
> > +     if (ctx->dev->vdec_pdata->uses_stateless_api)
> > +             return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, cmd);
> > +
> >       mtk_v4l2_debug(1, "decoder cmd=%u", cmd->cmd);
> >       dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> >                               V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > @@ -414,7 +425,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >        * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
> >        * if using the stateful API.
> >        */
> > -     if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
> > +     if (!dec_pdata->uses_stateless_api &&
> > +         (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
> >           vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
> >               mtk_v4l2_err("out_q_ctx buffers already requested");
> >               ret = -EBUSY;
> > @@ -457,6 +469,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >               ctx->quantization = pix_mp->quantization;
> >               ctx->xfer_func = pix_mp->xfer_func;
> >
> > +             ctx->current_codec = fmt->fourcc;
> >               if (ctx->state == MTK_STATE_FREE) {
> >                       ret = vdec_if_init(ctx, q_data->fmt->fourcc);
> >                       if (ret) {
> > @@ -468,6 +481,49 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >               }
> >       }
> >
> > +     /*
> > +      * If using the stateless API, S_FMT should have the effect of setting
> > +      * the CAPTURE queue resolution no matter which queue it was called on.
> > +      */
> > +     if (dec_pdata->uses_stateless_api) {
> > +             ctx->picinfo.pic_w = pix_mp->width;
> > +             ctx->picinfo.pic_h = pix_mp->height;
> > +
> > +             ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
> > +             if (ret) {
> > +                     mtk_v4l2_err("[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
> > +                             ctx->id);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ctx->last_decoded_picinfo = ctx->picinfo;
> > +
> > +             if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> > +                             ctx->picinfo.fb_sz[0] +
> > +                             ctx->picinfo.fb_sz[1];
> > +                     ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
> > +                             ctx->picinfo.buf_w;
> > +             } else {
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> > +                             ctx->picinfo.fb_sz[0];
> > +                     ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
> > +                             ctx->picinfo.buf_w;
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] =
> > +                             ctx->picinfo.fb_sz[1];
> > +                     ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] =
> > +                             ctx->picinfo.buf_w;
> > +             }
> > +
> > +             ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
> > +             ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
> > +             mtk_v4l2_debug(2, "[%d] vdec_if_init() num_plane = %d wxh=%dx%d pic wxh=%dx%d sz[0]=0x%x sz[1]=0x%x",
> > +                     ctx->id, pix_mp->num_planes,
> > +                     ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> > +                     ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
> > +     }
> >       return 0;
> >  }
> >
> > @@ -765,9 +821,15 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> >               while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
> >                       struct mtk_video_dec_buf *buf_info = container_of(
> >                                src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
> > -                     if (!buf_info->lastframe)
> > +                     if (!buf_info->lastframe) {
> > +                             struct media_request *req =
> > +                                     src_buf->vb2_buf.req_obj.req;
> >                               v4l2_m2m_buf_done(src_buf,
> >                                               VB2_BUF_STATE_ERROR);
> > +                             if (req)
> > +                                     v4l2_ctrl_request_complete(req,
> > +                                                             &ctx->ctrl_hdl);
> > +                     }
> >               }
> >               return;
> >       }
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > index 6a18cb3bfe07..6b29d7d9ae15 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > @@ -45,6 +45,7 @@ struct vdec_fb {
> >   * @lastframe:               Intput buffer is last buffer - EOS
> >   * @error:           An unrecoverable error occurs on this buffer.
> >   * @frame_buffer:    Decode status, and buffer information of Capture buffer
> > + * @bs_buffer:       Output buffer info
> >   *
> >   * Note : These status information help us track and debug buffer state
> >   */
> > @@ -55,12 +56,18 @@ struct mtk_video_dec_buf {
> >       bool    queued_in_vb2;
> >       bool    queued_in_v4l2;
> >       bool    lastframe;
> > +
> >       bool    error;
> > -     struct vdec_fb  frame_buffer;
> > +
> > +     union {
> > +             struct vdec_fb  frame_buffer;
> > +             struct mtk_vcodec_mem   bs_buffer;
> > +     };
> >  };
> >
> >  extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
> >  extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> > +extern const struct media_device_ops mtk_vcodec_media_ops;
> >
> >
> >  /*
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > new file mode 100644
> > index 000000000000..75ddf53e2876
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > @@ -0,0 +1,370 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include "media/videobuf2-v4l2.h"
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <linux/module.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_dec.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "vdec_drv_if.h"
> > +#include "mtk_vcodec_dec_pm.h"
> > +
> > +/**
> > + * struct mtk_stateless_control  - CID control type
> > + * @cfg: control configuration
> > + * @codec_type: codec type (V4L2 pixel format) for CID control type
> > + */
> > +struct mtk_stateless_control {
> > +     struct v4l2_ctrl_config cfg;
> > +     int codec_type;
> > +};
> > +
> > +static const struct mtk_stateless_control mtk_stateless_controls[] = {
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_STATELESS_H264_SPS,
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     },
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_STATELESS_H264_PPS,
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     },
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     },
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     },
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > +                     .def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> > +                     .max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > +                     .menu_skip_mask =
> > +                             BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > +                             BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     },
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> > +                     .min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> > +                     .def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> > +                     .max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     },
> > +     {
> > +             .cfg = {
> > +                     .id = V4L2_CID_STATELESS_H264_START_CODE,
> > +                     .min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> > +                     .def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> > +                     .max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> > +             },
> > +             .codec_type = V4L2_PIX_FMT_H264_SLICE,
> > +     }
> > +};
> > +#define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> > +
> > +static const struct mtk_video_fmt mtk_video_formats[] = {
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_H264_SLICE,
> > +             .type = MTK_FMT_DEC,
> > +             .num_planes = 1,
> > +     },
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_MM21,
> > +             .type = MTK_FMT_FRAME,
> > +             .num_planes = 2,
> > +     },
> > +};
> > +#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> > +#define DEFAULT_OUT_FMT_IDX    0
> > +#define DEFAULT_CAP_FMT_IDX    1
> > +
> > +static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_H264_SLICE,
> > +             .stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
> > +                             MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
> > +     },
> > +};
> > +
> > +#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> > +
> > +static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
> > +                                            struct vdec_fb *fb)
> > +{
> > +     struct mtk_video_dec_buf *vdec_frame_buf =
> > +             container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> > +     struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
> > +     unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> > +
> > +     vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
> > +     if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> > +             unsigned int cap_c_size =
> > +                     ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> > +
> > +             vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
> > +     }
> > +}
> > +
> > +static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
> > +                                        struct vb2_v4l2_buffer *vb2_v4l2)
> > +{
> > +     struct mtk_video_dec_buf *framebuf =
> > +             container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
> > +     struct vdec_fb *pfb = &framebuf->frame_buffer;
> > +     struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
> > +
> > +     pfb = &framebuf->frame_buffer;
> > +     pfb->base_y.va = NULL;
> > +     pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> > +     pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> > +
> > +     if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> > +             pfb->base_c.va = NULL;
> > +             pfb->base_c.dma_addr =
> > +                     vb2_dma_contig_plane_dma_addr(dst_buf, 1);
> > +             pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> > +     }
> > +     mtk_v4l2_debug(1,
> > +             "id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx frame_count = %d",
> > +             dst_buf->index, pfb,
> > +             pfb->base_y.va, &pfb->base_y.dma_addr,
> > +             &pfb->base_c.dma_addr, pfb->base_y.size,
> > +             ctx->decoded_frame_cnt);
> > +
> > +     return pfb;
> > +}
> > +
> > +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> > +{
> > +     struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > +
> > +     v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> > +}
> > +
> > +static int fops_media_request_validate(struct media_request *mreq)
>
> I think this function should be moved to just before mtk_vcodec_media_ops.
> It's a bit weird to have this in the middle of the code.
>
> > +{
> > +     const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
> > +
> > +     switch (buffer_cnt) {
> > +     case 1:
> > +             /* We expect exactly one buffer with the request */
> > +             break;
> > +     case 0:
> > +             mtk_v4l2_err("No buffer provided with the request");
> > +             return -ENOENT;
> > +     default:
> > +             mtk_v4l2_err("Too many buffers (%d) provided with the request",
> > +                          buffer_cnt);
>
> These aren't errors: user errors are not something that should be reported
> in the kernel log, only driver/hw errors should be reported there.
>
> Use _debug instead.
>
> > +             return -EINVAL;
> > +     }
> > +
> > +     return vb2_request_validate(mreq);
> > +}
> > +
> > +static void mtk_vdec_worker(struct work_struct *work)
> > +{
> > +     struct mtk_vcodec_ctx *ctx =
> > +             container_of(work, struct mtk_vcodec_ctx, decode_work);
> > +     struct mtk_vcodec_dev *dev = ctx->dev;
> > +     struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> > +     struct vb2_buffer *vb2_src;
> > +     struct mtk_vcodec_mem *bs_src;
> > +     struct mtk_video_dec_buf *dec_buf_src;
> > +     struct media_request *src_buf_req;
> > +     struct vdec_fb *dst_buf;
> > +     bool res_chg = false;
> > +     int ret;
> > +
> > +     vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> > +     if (vb2_v4l2_src == NULL) {
> > +             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> > +             mtk_v4l2_debug(1, "[%d] no available source buffer", ctx->id);
> > +             return;
> > +     }
> > +
> > +     vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > +     if (vb2_v4l2_dst == NULL) {
> > +             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> > +             mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
> > +             return;
> > +     }
> > +
> > +     vb2_src = &vb2_v4l2_src->vb2_buf;
> > +     dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
> > +                                m2m_buf.vb);
> > +     bs_src = &dec_buf_src->bs_buffer;
> > +
> > +     mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
> > +                     ctx->id, src_buf->vb2_queue->type,
> > +                     src_buf->index, src_buf, src_buf_info);
> > +
> > +     bs_src->va = NULL;
> > +     bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
> > +     bs_src->size = (size_t)vb2_src->planes[0].bytesused;
> > +
> > +     mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
> > +                     ctx->id, buf->va, &buf->dma_addr, buf->size, src_buf);
> > +     /* Apply request controls. */
> > +     src_buf_req = vb2_src->req_obj.req;
> > +     if (src_buf_req)
> > +             v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> > +     else
> > +             mtk_v4l2_err("vb2 buffer media request is NULL");
> > +
> > +     dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
> > +     v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
> > +     ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
> > +     if (ret) {
> > +             mtk_v4l2_err(
> > +                     " <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
> > +                     ctx->id, vb2_src->index, bs_src->size,
> > +                     vb2_src->timestamp, ret, res_chg);
> > +             if (ret == -EIO) {
> > +                     mutex_lock(&ctx->lock);
> > +                     dec_buf_src->error = true;
> > +                     mutex_unlock(&ctx->lock);
> > +             }
> > +     }
> > +
> > +     mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
> > +
> > +     v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> > +             ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> > +
> > +     v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> > +}
> > +
> > +static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> > +{
> > +     struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > +     struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
> > +
> > +     mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
> > +                     ctx->id, vb->vb2_queue->type,
> > +                     vb->index, vb);
> > +
> > +     mutex_lock(&ctx->lock);
> > +     v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
> > +     mutex_unlock(&ctx->lock);
> > +     if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > +             return;
> > +
> > +     mtk_v4l2_debug(3, "(%d) id=%d, bs=%p",
> > +             vb->vb2_queue->type, vb->index, src_buf);
> > +
> > +     /* If an OUTPUT buffer, we may need to update the state */
> > +     if (ctx->state == MTK_STATE_INIT) {
> > +             ctx->state = MTK_STATE_HEADER;
> > +             mtk_v4l2_debug(1, "Init driver from init to header.");
> > +     } else {
> > +             mtk_v4l2_debug(3, "[%d] already init driver %d",
> > +                             ctx->id, ctx->state);
> > +     }
> > +}
> > +
> > +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> > +{
> > +     bool res_chg;
> > +
> > +     return vdec_if_decode(ctx, NULL, NULL, &res_chg);
> > +}
> > +
> > +static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
> > +{
> > +     unsigned int i;
> > +
> > +     v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
> > +     if (ctx->ctrl_hdl.error) {
> > +             mtk_v4l2_err("v4l2_ctrl_handler_init failed\n");
> > +             return ctx->ctrl_hdl.error;
> > +     }
> > +
> > +     for (i = 0; i < NUM_CTRLS; i++) {
> > +             struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
> > +
> > +             v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
> > +             if (ctx->ctrl_hdl.error) {
> > +                     mtk_v4l2_err("Adding control %d failed %d",
> > +                                     i, ctx->ctrl_hdl.error);
> > +                     return ctx->ctrl_hdl.error;
> > +             }
> > +     }
> > +
> > +     v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> > +
> > +     return 0;
> > +}
> > +
> > +const struct media_device_ops mtk_vcodec_media_ops = {
> > +     .req_validate   = fops_media_request_validate,
> > +     .req_queue      = v4l2_m2m_request_queue,
> > +};
> > +
> > +static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
> > +{
> > +     struct vb2_queue *src_vq;
> > +
> > +     src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> > +                              V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> > +
> > +     /* Support request api for output plane */
> > +     src_vq->supports_requests = true;
> > +     src_vq->requires_requests = true;
> > +}
> > +
> > +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +
> > +     vbuf->field = V4L2_FIELD_NONE;
> > +     return 0;
> > +}
> > +
> > +static struct vb2_ops mtk_vdec_request_vb2_ops = {
> > +     .queue_setup    = vb2ops_vdec_queue_setup,
> > +     .buf_prepare    = vb2ops_vdec_buf_prepare,
>
> Should be with the other .buf ops.
>
> > +     .wait_prepare   = vb2_ops_wait_prepare,
> > +     .wait_finish    = vb2_ops_wait_finish,
> > +     .start_streaming        = vb2ops_vdec_start_streaming,
> > +
> > +     .buf_queue      = vb2ops_vdec_stateless_buf_queue,
> > +     .buf_out_validate = vb2ops_vdec_out_buf_validate,
> > +     .buf_init       = vb2ops_vdec_buf_init,
> > +     .buf_finish     = vb2ops_vdec_buf_finish,
> > +     .stop_streaming = vb2ops_vdec_stop_streaming,
>
> Shouldn't stop_streaming be just after .start_streaming? It's weird to see
> them separated by other ops.

All suggestions applied, thanks!

Cheers,
Alex.
