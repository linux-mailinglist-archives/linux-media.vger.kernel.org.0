Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA08203717
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 14:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgFVMoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 08:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgFVMoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 08:44:24 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF79C061794
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 05:44:23 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id d67so15448778oig.6
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CAo7NV9nFD8IfxfDB4pXgggwoLMPC93xAsaHnDYeJA4=;
        b=QY9vFJ6FdUCh8LQZrqap0Oy/hfTfmFEW56BKvgRdM9cQwihmMiOnumTmVuMc15Dlxh
         SKL6hfCc23YbHG36QMg9GN31N0VKHEck9WWsX5XfM9wT89A+ldV0F81wX7Jl/GA65HMO
         4mXU4OzQ7WvW+oseLA19Lzj/MK0wzZsL2qIyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CAo7NV9nFD8IfxfDB4pXgggwoLMPC93xAsaHnDYeJA4=;
        b=sEYSoqO4QFzKgmA+fxHCljDKCvBRyjetHFbVUpx4944Jqhxp7wcuYYD/yMBSzgMR/l
         yxO0hx2S7uV9z5QJLxbbNG7Cfw3sJa5Tg9V051+dm/jFoRc3xHx5TXzqJQotwq09RM8B
         ajaynTjMABJJTh63bYSJfXqDvU1h21O5TwXXnMJqVm2e5QxS1JjfgkZ+vIeQzCh6dzyw
         6dI1htyWK6Y0FcJ4Z9q16+JiQgEM5I3jBe/iDeXY1Peh3yzSKGlXmH4LRV7o90SP9otF
         74h0G/4RSaf6MZZ++p9rB+Bv7GtJ5n3WMLQjkHc8Mk6c96i6lXW7fYGzQAGYJvDsgeaC
         vhFg==
X-Gm-Message-State: AOAM531Qfvby9/iq/e+PFIBQ//ZJRyndP4FFcFJL4fTuRNKv5TsLXRkD
        JFAVxdxKWDIA+RltGcFvmPzGevd0vBo=
X-Google-Smtp-Source: ABdhPJzOkpkvM8VR5D4X/2VuNb8XdS7yuNmep0k0x/j5A4N9xnYGBTF4v13wqjdKJmW6leObbC0RDA==
X-Received: by 2002:aca:c494:: with SMTP id u142mr12335446oif.113.1592829862549;
        Mon, 22 Jun 2020 05:44:22 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id f5sm3363664oou.47.2020.06.22.05.44.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 05:44:21 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id e5so12882207ote.11
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 05:44:21 -0700 (PDT)
X-Received: by 2002:a9d:604d:: with SMTP id v13mr12995404otj.97.1592829860665;
 Mon, 22 Jun 2020 05:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org> <20200520082723.96136-7-acourbot@chromium.org>
 <1592551593.32358.1.camel@mtksdaap41>
In-Reply-To: <1592551593.32358.1.camel@mtksdaap41>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 22 Jun 2020 21:44:08 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXOPMhtSrAa+F+0BcC7Uzc4UJQU29eBMi5fv1zjF2D0jA@mail.gmail.com>
Message-ID: <CAPBb6MXOPMhtSrAa+F+0BcC7Uzc4UJQU29eBMi5fv1zjF2D0jA@mail.gmail.com>
Subject: Re: [PATCH 06/10] media: mtk-vcodec: venc: specify supported formats per-chip
To:     Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 4:26 PM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
>
> On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> > Different chips have different supported bitrate ranges. Move the list
> > of supported formats to the platform data, and split the output and
> > capture formats into two lists to make it easier to find the default
> > format for each queue.
> >
>
> Does this patch pass v4l2 compliance test?

This should not change the behavior towards userspace at all (it's
just moving data around and making it more flexible), so the test
results should not be affected either.

>
>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   8 ++
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 122 +++++++-----------
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  40 ++++++
> >  3 files changed, 95 insertions(+), 75 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index b8f913de8d80..59b4b750666b 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -313,6 +313,10 @@ enum mtk_chip {
> >   * @has_lt_irq: whether the encoder uses the LT irq
> >   * @min_birate: minimum supported encoding bitrate
> >   * @max_bitrate: maximum supported encoding bitrate
> > + * @capture_formats: array of supported capture formats
> > + * @num_capture_formats: number of entries in capture_formats
> > + * @output_formats: array of supported output formats
> > + * @num_output_formats: number of entries in output_formats
> >   */
> >  struct mtk_vcodec_enc_pdata {
> >       enum mtk_chip chip;
> > @@ -321,6 +325,10 @@ struct mtk_vcodec_enc_pdata {
> >       bool has_lt_irq;
> >       unsigned long min_bitrate;
> >       unsigned long max_bitrate;
> > +     const struct mtk_video_fmt *capture_formats;
> > +     size_t num_capture_formats;
> > +     const struct mtk_video_fmt *output_formats;
> > +     size_t num_output_formats;
> >  };
> >
> >  /**
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 50ba9da59153..05743a745a11 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -23,47 +23,9 @@
> >  #define DFT_CFG_WIDTH        MTK_VENC_MIN_W
> >  #define DFT_CFG_HEIGHT       MTK_VENC_MIN_H
> >  #define MTK_MAX_CTRLS_HINT   20
> > -#define OUT_FMT_IDX          0
> > -#define CAP_FMT_IDX          4
> > -
> >
> >  static void mtk_venc_worker(struct work_struct *work);
> >
> > -static const struct mtk_video_fmt mtk_video_formats[] = {
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_NV12M,
> > -             .type = MTK_FMT_FRAME,
> > -             .num_planes = 2,
> > -     },
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_NV21M,
> > -             .type = MTK_FMT_FRAME,
> > -             .num_planes = 2,
> > -     },
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_YUV420M,
> > -             .type = MTK_FMT_FRAME,
> > -             .num_planes = 3,
> > -     },
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_YVU420M,
> > -             .type = MTK_FMT_FRAME,
> > -             .num_planes = 3,
> > -     },
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_H264,
> > -             .type = MTK_FMT_ENC,
> > -             .num_planes = 1,
> > -     },
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_VP8,
> > -             .type = MTK_FMT_ENC,
> > -             .num_planes = 1,
> > -     },
> > -};
> > -
> > -#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> > -
> >  static const struct mtk_codec_framesizes mtk_venc_framesizes[] = {
> >       {
> >               .fourcc = V4L2_PIX_FMT_H264,
> > @@ -156,27 +118,17 @@ static const struct v4l2_ctrl_ops mtk_vcodec_enc_ctrl_ops = {
> >       .s_ctrl = vidioc_venc_s_ctrl,
> >  };
> >
> > -static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
> > +static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
> > +                        const struct mtk_video_fmt *formats,
> > +                        size_t num_formats)
> >  {
> > -     const struct mtk_video_fmt *fmt;
> > -     int i, j = 0;
> > +     if (f->index >= num_formats)
> > +             return -EINVAL;
> >
> > -     for (i = 0; i < NUM_FORMATS; ++i) {
> > -             if (output_queue && mtk_video_formats[i].type != MTK_FMT_FRAME)
> > -                     continue;
> > -             if (!output_queue && mtk_video_formats[i].type != MTK_FMT_ENC)
> > -                     continue;
> > +     f->pixelformat = formats[f->index].fourcc;
> > +     memset(f->reserved, 0, sizeof(f->reserved));
> >
> > -             if (j == f->index) {
> > -                     fmt = &mtk_video_formats[i];
> > -                     f->pixelformat = fmt->fourcc;
> > -                     memset(f->reserved, 0, sizeof(f->reserved));
> > -                     return 0;
> > -             }
> > -             ++j;
> > -     }
> > -
> > -     return -EINVAL;
> > +     return 0;
> >  }
> >
> >  static int vidioc_enum_framesizes(struct file *file, void *fh,
> > @@ -202,13 +154,21 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
> >  static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
> >                                  struct v4l2_fmtdesc *f)
> >  {
> > -     return vidioc_enum_fmt(f, false);
> > +     const struct mtk_vcodec_enc_pdata *pdata =
> > +             fh_to_ctx(priv)->dev->venc_pdata;
> > +
> > +     return vidioc_enum_fmt(f, pdata->capture_formats,
> > +                            pdata->num_capture_formats);
> >  }
> >
> >  static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
> >                                  struct v4l2_fmtdesc *f)
> >  {
> > -     return vidioc_enum_fmt(f, true);
> > +     const struct mtk_vcodec_enc_pdata *pdata =
> > +             fh_to_ctx(priv)->dev->venc_pdata;
> > +
> > +     return vidioc_enum_fmt(f, pdata->output_formats,
> > +                            pdata->num_output_formats);
> >  }
> >
> >  static int vidioc_venc_querycap(struct file *file, void *priv,
> > @@ -266,13 +226,20 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
> >       return &ctx->q_data[MTK_Q_DATA_DST];
> >  }
> >
> > -static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f)
> > +static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f,
> > +     const struct mtk_vcodec_enc_pdata *pdata)
> >  {
> >       const struct mtk_video_fmt *fmt;
> >       unsigned int k;
> >
> > -     for (k = 0; k < NUM_FORMATS; k++) {
> > -             fmt = &mtk_video_formats[k];
> > +     for (k = 0; k < pdata->num_capture_formats; k++) {
> > +             fmt = &pdata->capture_formats[k];
> > +             if (fmt->fourcc == f->fmt.pix.pixelformat)
> > +                     return fmt;
> > +     }
> > +
> > +     for (k = 0; k < pdata->num_output_formats; k++) {
> > +             fmt = &pdata->output_formats[k];
> >               if (fmt->fourcc == f->fmt.pix.pixelformat)
> >                       return fmt;
> >       }
> > @@ -414,6 +381,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
> >                            struct v4l2_format *f)
> >  {
> >       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +     const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
> >       struct vb2_queue *vq;
> >       struct mtk_q_data *q_data;
> >       int i, ret;
> > @@ -436,10 +404,10 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
> >               return -EINVAL;
> >       }
> >
> > -     fmt = mtk_venc_find_format(f);
> > +     fmt = mtk_venc_find_format(f, pdata);
> >       if (!fmt) {
> > -             f->fmt.pix.pixelformat = mtk_video_formats[CAP_FMT_IDX].fourcc;
> > -             fmt = mtk_venc_find_format(f);
> > +             fmt = &ctx->dev->venc_pdata->capture_formats[0];
> > +             f->fmt.pix.pixelformat = fmt->fourcc;
> >       }
> >
> >       q_data->fmt = fmt;
> > @@ -476,6 +444,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
> >                            struct v4l2_format *f)
> >  {
> >       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +     const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
> >       struct vb2_queue *vq;
> >       struct mtk_q_data *q_data;
> >       int ret, i;
> > @@ -499,10 +468,10 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
> >               return -EINVAL;
> >       }
> >
> > -     fmt = mtk_venc_find_format(f);
> > +     fmt = mtk_venc_find_format(f, pdata);
> >       if (!fmt) {
> > -             f->fmt.pix.pixelformat = mtk_video_formats[OUT_FMT_IDX].fourcc;
> > -             fmt = mtk_venc_find_format(f);
> > +             fmt = &ctx->dev->venc_pdata->output_formats[0];
> > +             f->fmt.pix.pixelformat = fmt->fourcc;
> >       }
> >
> >       pix_fmt_mp->height = clamp(pix_fmt_mp->height,
> > @@ -580,11 +549,12 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
> >  {
> >       const struct mtk_video_fmt *fmt;
> >       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +     const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
> >
> > -     fmt = mtk_venc_find_format(f);
> > +     fmt = mtk_venc_find_format(f, pdata);
> >       if (!fmt) {
> > -             f->fmt.pix.pixelformat = mtk_video_formats[CAP_FMT_IDX].fourcc;
> > -             fmt = mtk_venc_find_format(f);
> > +             fmt = &ctx->dev->venc_pdata->capture_formats[0];
> > +             f->fmt.pix.pixelformat = fmt->fourcc;
> >       }
> >       f->fmt.pix_mp.colorspace = ctx->colorspace;
> >       f->fmt.pix_mp.ycbcr_enc = ctx->ycbcr_enc;
> > @@ -598,11 +568,13 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> >                                        struct v4l2_format *f)
> >  {
> >       const struct mtk_video_fmt *fmt;
> > +     struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +     const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
> >
> > -     fmt = mtk_venc_find_format(f);
> > +     fmt = mtk_venc_find_format(f, pdata);
> >       if (!fmt) {
> > -             f->fmt.pix.pixelformat = mtk_video_formats[OUT_FMT_IDX].fourcc;
> > -             fmt = mtk_venc_find_format(f);
> > +             fmt = &ctx->dev->venc_pdata->output_formats[0];
> > +             f->fmt.pix.pixelformat = fmt->fourcc;
> >       }
> >       if (!f->fmt.pix_mp.colorspace) {
> >               f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
> > @@ -1187,7 +1159,7 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
> >       q_data->coded_height = DFT_CFG_HEIGHT;
> >       q_data->field = V4L2_FIELD_NONE;
> >
> > -     q_data->fmt = &mtk_video_formats[OUT_FMT_IDX];
> > +     q_data->fmt = &ctx->dev->venc_pdata->output_formats[0];
> >
> >       v4l_bound_align_image(&q_data->coded_width,
> >                               MTK_VENC_MIN_W,
> > @@ -1216,7 +1188,7 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
> >       memset(q_data, 0, sizeof(struct mtk_q_data));
> >       q_data->coded_width = DFT_CFG_WIDTH;
> >       q_data->coded_height = DFT_CFG_HEIGHT;
> > -     q_data->fmt = &mtk_video_formats[CAP_FMT_IDX];
> > +     q_data->fmt = &ctx->dev->venc_pdata->capture_formats[0];
> >       q_data->field = V4L2_FIELD_NONE;
> >       ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> >               DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 221fa0303075..c8a4b85a81c4 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -26,6 +26,42 @@
> >  module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
> >  module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
> >
> > +static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_NV12M,
> > +             .type = MTK_FMT_FRAME,
> > +             .num_planes = 2,
> > +     },
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_NV21M,
> > +             .type = MTK_FMT_FRAME,
> > +             .num_planes = 2,
> > +     },
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_YUV420M,
> > +             .type = MTK_FMT_FRAME,
> > +             .num_planes = 3,
> > +     },
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_YVU420M,
> > +             .type = MTK_FMT_FRAME,
> > +             .num_planes = 3,
> > +     },
> > +};
> > +
> > +static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_H264,
> > +             .type = MTK_FMT_ENC,
> > +             .num_planes = 1,
> > +     },
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_VP8,
> > +             .type = MTK_FMT_ENC,
> > +             .num_planes = 1,
> > +     },
> > +};
> > +
> >  /* Wake up context wait_queue */
> >  static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> >  {
> > @@ -380,6 +416,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >  static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> >       .chip = MTK_MT8173,
> >       .has_lt_irq = true,
> > +     .capture_formats = mtk_video_formats_capture_mt8173,
> > +     .num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173),
> > +     .output_formats = mtk_video_formats_output_mt8173,
> > +     .num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> >       .min_bitrate = 1,
> >       .max_bitrate = 4000000,
> >  };
>
