Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3671F107D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 01:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgFGXge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 19:36:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727786AbgFGXge (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Jun 2020 19:36:34 -0400
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1B692073B;
        Sun,  7 Jun 2020 23:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591572992;
        bh=qxJ2WbBGyyRXKF377NjTd0svTf3GYbF3a9PC/hfYG7Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kZwaAFTuzHdf2ud3jme9wklgQMFACma/ctBL1q3o2Zl0T7V044bDzPTzvho/1+4Vc
         ruG079DN2TMapWEcwe0zARryhXPk7pRX6p6FWOS4TZ0EWqRub3F2MUl4127coy7rZf
         j5570rvRO3YLJhXMWRtl0q6stLI98oEdJDUJjYLY=
Received: by mail-ed1-f43.google.com with SMTP id c35so11940024edf.5;
        Sun, 07 Jun 2020 16:36:31 -0700 (PDT)
X-Gm-Message-State: AOAM532YPzzCL+CiBZndrb0k0uax4IaSG2eHC5v14GCe4Osd66v4Tm9Q
        78wTtpmtXcOTm3d1SpyRp4e8t2xVzBk3NZ/Fog==
X-Google-Smtp-Source: ABdhPJy4IedkE2VQrVxiBQxIbKudIZBVCcovK6ZCZVgKIjhVRnPXlFVIOAxGe7H3jHrTu4Ss9FKB6uHV5equa7+zAgM=
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr20247364edr.271.1591572990077;
 Sun, 07 Jun 2020 16:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200604090553.10861-1-xia.jiang@mediatek.com> <20200604090553.10861-20-xia.jiang@mediatek.com>
In-Reply-To: <20200604090553.10861-20-xia.jiang@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Mon, 8 Jun 2020 07:36:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8dW2r-hZ7UyfOTMvH_RRXzO5uFSSU=HSoPenej7if2tQ@mail.gmail.com>
Message-ID: <CAAOTY_8dW2r-hZ7UyfOTMvH_RRXzO5uFSSU=HSoPenej7if2tQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
        mojahsu@chromium.org, srv_heupstream <srv_heupstream@mediatek.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, senozhatsky@chromium.org,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-media@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Xia:

Xia Jiang <xia.jiang@mediatek.com> =E6=96=BC 2020=E5=B9=B46=E6=9C=884=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> decode and encode have great similarities with function operation.
>
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: add member variable(struct v4l2_rect) in out_q structure for storing
>     the active crop information.
>     move the renaming exsting functions/defines/variables to a separate p=
atch.
> ---
>  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 845 +++++++++++++++---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  44 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 193 ++++
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h | 123 +++
>  5 files changed, 1084 insertions(+), 126 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
>

[snip]

>
> +static void mtk_jpeg_set_enc_default_params(struct mtk_jpeg_ctx *ctx)
> +{
> +       struct mtk_jpeg_q_data *q =3D &ctx->out_q;
> +       struct v4l2_pix_format_mplane *pix_mp;
> +
> +       pix_mp =3D kmalloc(sizeof(*pix_mp), GFP_KERNEL);
> +
> +       ctx->fh.ctrl_handler =3D &ctx->ctrl_hdl;
> +       ctx->colorspace =3D V4L2_COLORSPACE_JPEG,
> +       ctx->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +       ctx->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +       ctx->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +       pix_mp->width =3D MTK_JPEG_MIN_WIDTH;
> +       pix_mp->height =3D MTK_JPEG_MIN_HEIGHT;
> +
> +       q->fmt =3D mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> +                                     MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> +       vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +                                   fmt.pix_mp), q->fmt);
> +       q->w =3D pix_mp->width;
> +       q->h =3D pix_mp->height;
> +       q->crop_rect.width =3D pix_mp->width;
> +       q->crop_rect.height =3D pix_mp->height;
> +       q->sizeimage[0] =3D pix_mp->plane_fmt[0].sizeimage;
> +       q->bytesperline[0] =3D pix_mp->plane_fmt[0].bytesperline;
> +
> +       q =3D &ctx->cap_q;
> +       q->fmt =3D mtk_jpeg_find_format(V4L2_PIX_FMT_JPEG,
> +                                     MTK_JPEG_FMT_FLAG_ENC_CAPTURE);
> +       pix_mp->width =3D MTK_JPEG_MIN_WIDTH;
> +       pix_mp->height =3D MTK_JPEG_MIN_HEIGHT;
> +       vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +                                   fmt.pix_mp), q->fmt);
> +       q->w =3D pix_mp->width;
> +       q->h =3D pix_mp->height;
> +       q->sizeimage[0] =3D pix_mp->plane_fmt[0].sizeimage;
> +       q->bytesperline[0] =3D pix_mp->plane_fmt[0].bytesperline;
> +}
> +
>  static void mtk_jpeg_set_dec_default_params(struct mtk_jpeg_ctx *ctx)
>  {
>         struct mtk_jpeg_q_data *q =3D &ctx->out_q;
> +       struct v4l2_pix_format_mplane *pix_mp;
>         int i;
>
> +       pix_mp =3D kmalloc(sizeof(*pix_mp), GFP_KERNEL);
> +
> +       ctx->fh.ctrl_handler =3D &ctx->ctrl_hdl;
>         ctx->colorspace =3D V4L2_COLORSPACE_JPEG,
>         ctx->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
>         ctx->quantization =3D V4L2_QUANTIZATION_DEFAULT;
>         ctx->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> -
> -       q->fmt =3D mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> -                                             MTK_JPEG_FMT_TYPE_OUTPUT);
> -       q->w =3D MTK_JPEG_MIN_WIDTH;
> -       q->h =3D MTK_JPEG_MIN_HEIGHT;
> -       q->bytesperline[0] =3D 0;
> -       q->sizeimage[0] =3D MTK_JPEG_DEFAULT_SIZEIMAGE;
> +       pix_mp->width =3D MTK_JPEG_MIN_WIDTH;
> +       pix_mp->height =3D MTK_JPEG_MIN_HEIGHT;
> +
> +       q->fmt =3D mtk_jpeg_find_format(V4L2_PIX_FMT_JPEG,
> +                                     MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
> +       vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +                                   fmt.pix_mp), q->fmt);
> +       q->w =3D pix_mp->width;
> +       q->h =3D pix_mp->height;
> +       q->sizeimage[0] =3D pix_mp->plane_fmt[0].sizeimage;
> +       q->bytesperline[0] =3D pix_mp->plane_fmt[0].bytesperline;

I would like non-jpeg-enc related modification to be another patch.

>
>         q =3D &ctx->cap_q;
> -       q->fmt =3D mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUV420M,
> -                                             MTK_JPEG_FMT_TYPE_CAPTURE);
> -       q->w =3D MTK_JPEG_MIN_WIDTH;
> -       q->h =3D MTK_JPEG_MIN_HEIGHT;
> -
> +       q->fmt =3D mtk_jpeg_find_format(V4L2_PIX_FMT_YUV420M,
> +                                     MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
> +       pix_mp->width =3D MTK_JPEG_MIN_WIDTH;
> +       pix_mp->height =3D MTK_JPEG_MIN_HEIGHT;
> +       vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +                                   fmt.pix_mp), q->fmt);
> +       q->w =3D pix_mp->width;
> +       q->h =3D pix_mp->height;
>         for (i =3D 0; i < q->fmt->colplanes; i++) {
> -               u32 stride =3D q->w * q->fmt->h_sample[i] / 4;
> -               u32 h =3D q->h * q->fmt->v_sample[i] / 4;
> +               q->sizeimage[i] =3D pix_mp->plane_fmt[i].sizeimage;
> +               q->bytesperline[i] =3D pix_mp->plane_fmt[i].bytesperline;
> +       }
> +}
>
> -               q->bytesperline[i] =3D stride;
> -               q->sizeimage[i] =3D stride * h;
> +static int mtk_jpeg_enc_open(struct file *file)
> +{
> +       struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> +       struct video_device *vfd =3D video_devdata(file);
> +       struct mtk_jpeg_ctx *ctx;
> +       int ret =3D 0;
> +
> +       ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       if (mutex_lock_interruptible(&jpeg->lock)) {
> +               ret =3D -ERESTARTSYS;
> +               goto free;
> +       }
> +
> +       v4l2_fh_init(&ctx->fh, vfd);
> +       file->private_data =3D &ctx->fh;
> +       v4l2_fh_add(&ctx->fh);
> +
> +       ctx->jpeg =3D jpeg;
> +       ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
> +                                           mtk_jpeg_enc_queue_init);
> +       if (IS_ERR(ctx->fh.m2m_ctx)) {
> +               ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +               goto error;
>         }
> +
> +       ret =3D mtk_jpeg_enc_ctrls_setup(ctx);
> +       if (ret) {
> +               v4l2_err(&jpeg->v4l2_dev, "Failed to setup jpeg enc contr=
ols\n");
> +               goto error;
> +       }
> +       mtk_jpeg_set_enc_default_params(ctx);
> +
> +       mutex_unlock(&jpeg->lock);
> +       return 0;
> +
> +error:
> +       v4l2_fh_del(&ctx->fh);
> +       v4l2_fh_exit(&ctx->fh);
> +       mutex_unlock(&jpeg->lock);
> +free:
> +       kfree(ctx);
> +       return ret;
>  }
>
>  static int mtk_jpeg_dec_open(struct file *file)
> @@ -953,6 +1507,12 @@ static int mtk_jpeg_dec_open(struct file *file)
>                 goto error;
>         }
>
> +       v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 0);
> +       ret =3D v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +       if (ret) {
> +               v4l2_err(&jpeg->v4l2_dev, "Failed to setup jpeg dec contr=
ols\n");
> +               goto error;
> +       }
>         mtk_jpeg_set_dec_default_params(ctx);
>         mutex_unlock(&jpeg->lock);
>         return 0;
> @@ -973,6 +1533,7 @@ static int mtk_jpeg_release(struct file *file)
>
>         mutex_lock(&jpeg->lock);
>         v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +       v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>         v4l2_fh_del(&ctx->fh);
>         v4l2_fh_exit(&ctx->fh);
>         kfree(ctx);
> @@ -980,6 +1541,15 @@ static int mtk_jpeg_release(struct file *file)
>         return 0;
>  }
>
> +static const struct v4l2_file_operations mtk_jpeg_enc_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D mtk_jpeg_enc_open,
> +       .release        =3D mtk_jpeg_release,
> +       .poll           =3D v4l2_m2m_fop_poll,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .mmap           =3D v4l2_m2m_fop_mmap,
> +};
> +
>  static const struct v4l2_file_operations mtk_jpeg_dec_fops =3D {
>         .owner          =3D THIS_MODULE,
>         .open           =3D mtk_jpeg_dec_open,
> @@ -993,6 +1563,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jp=
eg)
>  {
>         struct device_node *node;
>         struct platform_device *pdev;
> +       int i;
>
>         node =3D of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0)=
;
>         if (!node)
> @@ -1006,12 +1577,17 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev =
*jpeg)
>
>         jpeg->larb =3D &pdev->dev;
>
> -       jpeg->clk_jdec =3D devm_clk_get(jpeg->dev, "jpgdec");
> -       if (IS_ERR(jpeg->clk_jdec))
> -               return PTR_ERR(jpeg->clk_jdec);
> +       for (i =3D 0; i < jpeg->variant->num_clocks; i++) {
> +               jpeg->clocks[i] =3D devm_clk_get(jpeg->dev,
> +                                              jpeg->variant->clk_names[i=
]);
> +               if (IS_ERR(jpeg->clocks[i])) {
> +                       dev_err(&pdev->dev, "failed to get clock: %s\n",
> +                               jpeg->variant->clk_names[i]);
> +                       return PTR_ERR(jpeg->clocks[i]);
> +               }
> +       }
>
> -       jpeg->clk_jdec_smi =3D devm_clk_get(jpeg->dev, "jpgdec-smi");
> -       return PTR_ERR_OR_ZERO(jpeg->clk_jdec_smi);
> +       return 0;
>  }
>
>  static int mtk_jpeg_probe(struct platform_device *pdev)
> @@ -1028,6 +1604,7 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>         mutex_init(&jpeg->lock);
>         spin_lock_init(&jpeg->hw_lock);
>         jpeg->dev =3D &pdev->dev;
> +       jpeg->variant =3D of_device_get_match_data(jpeg->dev);
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         jpeg->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> @@ -1042,8 +1619,12 @@ static int mtk_jpeg_probe(struct platform_device *=
pdev)
>                 return jpeg_irq;
>         }
>
> -       ret =3D devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, =
0,
> -                              pdev->name, jpeg);
> +       if (jpeg->variant->is_encoder)
> +               ret =3D devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_e=
nc_irq,
> +                                      0, pdev->name, jpeg);
> +       else
> +               ret =3D devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_d=
ec_irq,
> +                                      0, pdev->name, jpeg);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n=
",
>                         jpeg_irq, ret);
> @@ -1063,7 +1644,10 @@ static int mtk_jpeg_probe(struct platform_device *=
pdev)
>                 goto err_dev_register;
>         }
>
> -       jpeg->m2m_dev =3D v4l2_m2m_init(&mtk_jpeg_dec_m2m_ops);
> +       if (jpeg->variant->is_encoder)
> +               jpeg->m2m_dev =3D v4l2_m2m_init(&mtk_jpeg_enc_m2m_ops);
> +       else
> +               jpeg->m2m_dev =3D v4l2_m2m_init(&mtk_jpeg_dec_m2m_ops);
>         if (IS_ERR(jpeg->m2m_dev)) {
>                 v4l2_err(&jpeg->v4l2_dev, "Failed to init mem2mem device\=
n");
>                 ret =3D PTR_ERR(jpeg->m2m_dev);
> @@ -1076,9 +1660,15 @@ static int mtk_jpeg_probe(struct platform_device *=
pdev)
>                 goto err_vfd_jpeg_alloc;
>         }
>         snprintf(jpeg->vdev->name, sizeof(jpeg->vdev->name),
> -                "%s-dec", MTK_JPEG_NAME);
> -       jpeg->vdev->fops =3D &mtk_jpeg_dec_fops;
> -       jpeg->vdev->ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops;
> +                "%s-%s", MTK_JPEG_NAME,
> +                jpeg->variant->is_encoder ? "enc" : "dec");
> +       if (jpeg->variant->is_encoder) {
> +               jpeg->vdev->fops =3D &mtk_jpeg_enc_fops;
> +               jpeg->vdev->ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops;
> +       } else {
> +               jpeg->vdev->fops =3D &mtk_jpeg_dec_fops;
> +               jpeg->vdev->ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops;
> +       }
>         jpeg->vdev->minor =3D -1;
>         jpeg->vdev->release =3D video_device_release;
>         jpeg->vdev->lock =3D &jpeg->lock;
> @@ -1095,8 +1685,9 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>
>         video_set_drvdata(jpeg->vdev, jpeg);
>         v4l2_info(&jpeg->v4l2_dev,
> -                 "decoder device registered as /dev/video%d (%d,%d)\n",
> -                 jpeg->vdev->num, VIDEO_MAJOR, jpeg->vdev->minor);
> +                 "jpeg %s device registered as /dev/video%d (%d,%d)\n",
> +                 jpeg->variant->is_encoder ? "enc" : "dec", jpeg->vdev->=
num,
> +                 VIDEO_MAJOR, jpeg->vdev->minor);
>
>         platform_set_drvdata(pdev, jpeg);
>
> @@ -1187,14 +1778,36 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops =
=3D {
>         SET_RUNTIME_PM_OPS(mtk_jpeg_pm_suspend, mtk_jpeg_pm_resume, NULL)
>  };
>
> +static struct mtk_jpeg_variant mt8173_jpeg_drvdata =3D {
> +       .is_encoder     =3D false,
> +       .clk_names      =3D {"jpgdec-smi", "jpgdec"},
> +       .num_clocks     =3D 2,
> +};

I would like non-jpeg-enc related modification to be another patch.

> +
> +static struct mtk_jpeg_variant mt2701_jpeg_drvdata =3D {
> +       .is_encoder     =3D false,
> +       .clk_names      =3D {"jpgdec-smi", "jpgdec"},
> +       .num_clocks     =3D 2,
> +};

mt2701_jpeg_drvdata is equal to mt8173_jpeg_drvdata, so keep only
mt8173_jpeg_drvdata.

> +
> +static struct mtk_jpeg_variant mtk_jpeg_drvdata =3D {
> +       .is_encoder     =3D true,
> +       .clk_names      =3D {"jpgenc"},
> +       .num_clocks     =3D 1,
> +};
> +
>  static const struct of_device_id mtk_jpeg_match[] =3D {
>         {
>                 .compatible =3D "mediatek,mt8173-jpgdec",
> -               .data       =3D NULL,
> +               .data =3D &mt8173_jpeg_drvdata,
>         },
>         {
>                 .compatible =3D "mediatek,mt2701-jpgdec",
> -               .data       =3D NULL,
> +               .data =3D &mt2701_jpeg_drvdata,
> +       },
> +       {
> +               .compatible =3D "mediatek,mtk-jpgenc",
> +               .data =3D &mtk_jpeg_drvdata,
>         },
>         {},
>  };
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/me=
dia/platform/mtk-jpeg/mtk_jpeg_core.h
> index 0b59e48495d5..9ec2c3350a16 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016 MediaTek Inc.
>   * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
>   *         Rick Chang <rick.chang@mediatek.com>
> + *         Xia Jiang <xia.jiang@mediatek.com>
>   */
>
>  #ifndef _MTK_JPEG_CORE_H
> @@ -16,19 +17,21 @@
>  #define MTK_JPEG_NAME          "mtk-jpeg"
>
>  #define MTK_JPEG_COMP_MAX              3
> +#define MTK_JPEG_MAX_CLOCKS            2
> +
>
>  #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT   BIT(0)
>  #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE  BIT(1)
> -
> -#define MTK_JPEG_FMT_TYPE_OUTPUT       1
> -#define MTK_JPEG_FMT_TYPE_CAPTURE      2
> +#define MTK_JPEG_FMT_FLAG_ENC_OUTPUT   BIT(2)
> +#define MTK_JPEG_FMT_FLAG_ENC_CAPTURE  BIT(3)
>
>  #define MTK_JPEG_MIN_WIDTH     32U
>  #define MTK_JPEG_MIN_HEIGHT    32U
> -#define MTK_JPEG_MAX_WIDTH     8192U
> -#define MTK_JPEG_MAX_HEIGHT    8192U
> +#define MTK_JPEG_MAX_WIDTH     65535U
> +#define MTK_JPEG_MAX_HEIGHT    65535U

MT8173 use this definition, why do you change this?
If the definition is wrong in MT8173, use a patch to fixup this.

>
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE     (1 * 1024 * 1024)
> +#define MTK_JPEG_MAX_EXIF_SIZE (64 * 1024)
>
>  /**
>   * enum mtk_jpeg_ctx_state - states of the context state machine
> @@ -42,6 +45,18 @@ enum mtk_jpeg_ctx_state {
>         MTK_JPEG_SOURCE_CHANGE,
>  };
>
