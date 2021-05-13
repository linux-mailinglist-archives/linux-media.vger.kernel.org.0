Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC3437F4C3
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 11:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhEMJXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 05:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhEMJXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 05:23:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFA1C06174A
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:21:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y9so32990112ljn.6
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5TZl7Xv0d/UcN3AO5XRTQ1YNYwxrNRqE46BtHPiztM=;
        b=XkeXKdhBfXmKZtxCw28f6HrDItAc38yiBOaXnF2bXtmEA+UC0Dv9nJpHWX1CqmuNn0
         sNFeTl8+0X/wouKvQPDcIxSa2iDMIaRLI04UnsE6SDl9iDOLQXE7Jo2pQJbNNxmDfetr
         iD8aKYoOw49WyeIvNHFsjzwHT81q8Zw830itc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5TZl7Xv0d/UcN3AO5XRTQ1YNYwxrNRqE46BtHPiztM=;
        b=g5bAHGLw2/YkhmSzLkjLzF0FCOuAIK0jIcOSVXMVvSBhi6O1g+i02+Qnvd0Q43KRka
         iqhY1WOFvJme7Im/GIsg1J9PgWJVflJcsTLx9oszxnrCK3lFVD2WS6QvZIRFMTS8yvHV
         mejHp7HKIr5iP0YZ0gGH9YsQ0T52t0ZvXM9haTcP4wgrkhgMZicHHGutSzlo5F8yRzZN
         BH4YcZZExXO45U9OYLwg3qxcb6E4oWFAymHZRs5jAnc2UpeFjebmED5AZrl7IIcXe8B8
         Cz/8JL2Jsvcrg7g+6BC44hxrH2oVOPGbQW+RlJcX+xHz7QBhbW9Xs3fc+sm/zV5FCExu
         qf4A==
X-Gm-Message-State: AOAM531Vytja+bB+JrWMe6zYP0+n3kdM+mU+0ffNNmdEPTPJSGN9L8nO
        UhaEQo60T7pTeVWy6KMSXE9V93KoDuvg3Q==
X-Google-Smtp-Source: ABdhPJzheiiViWhiIzlNMvwCFES5VG/iaT6RwHivuUPLFMQb8+ecoGKUimvqFAh6dhheggPAdFnKDQ==
X-Received: by 2002:a2e:a375:: with SMTP id i21mr32571633ljn.237.1620897713087;
        Thu, 13 May 2021 02:21:53 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id r4sm382031ljk.45.2021.05.13.02.21.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 02:21:52 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id f12so20411013ljp.2
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:21:52 -0700 (PDT)
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr5926332ljp.212.1620897711807;
 Thu, 13 May 2021 02:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-6-acourbot@chromium.org> <2aa7f058-38b2-2a31-d59b-bba96c39cc29@collabora.com>
In-Reply-To: <2aa7f058-38b2-2a31-d59b-bba96c39cc29@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 13 May 2021 18:21:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUOLfZi4YPp=VFdkhrPXKiUwAn-70LrAxG=i-HhmxLnEA@mail.gmail.com>
Message-ID: <CAPBb6MUOLfZi4YPp=VFdkhrPXKiUwAn-70LrAxG=i-HhmxLnEA@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] media: mtk-vcodec: vdec: support stateless API
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Apr 29, 2021 at 9:10 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 27.04.21 13:15, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > Support the stateless codec API that will be used by MT8183.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +++-
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
> >   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++++++++++++
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
> >   5 files changed, 446 insertions(+), 3 deletions(-)
> >   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
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
> >   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 4ad2662a43b2..01c5333d6cff 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -46,6 +46,13 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
> >   static int vidioc_try_decoder_cmd(struct file *file, void *priv,
> >                               struct v4l2_decoder_cmd *cmd)
> >   {
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
> >   }
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
> >    * @lastframe:              Intput buffer is last buffer - EOS
> >    * @error:          An unrecoverable error occurs on this buffer.
> >    * @frame_buffer:   Decode status, and buffer information of Capture buffer
> > + * @bs_buffer:       Output buffer info
> >    *
> >    * Note : These status information help us track and debug buffer state
> >    */
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
> >   };
> >
> >   extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
> >   extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> > +extern const struct media_device_ops mtk_vcodec_media_ops;
> >
> >
> >   /*
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > new file mode 100644
> > index 000000000000..75ddf53e2876
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>
> Hi, when compiling with -DDEBUG flag, I got some compilation errors for this file.

Nice catch, I've made sure the whole driver compiles with -DDEBUG.

Thanks,
Alex.
