Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D2530D7F8
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 11:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbhBCKwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 05:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbhBCKwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 05:52:30 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57251C061788
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 02:51:16 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a8so32624234lfi.8
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 02:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOPBqSfvTUalmlO9KQoQtuiAFEsMX0/0KEkC4CfPQWA=;
        b=S4QzPy+QJRk25ukwtQ5ax5TH+L6Ih6BmCWVqMVrWIiUXcOF6RZ6ZWd8rQFFGyQsdvC
         ujcGoFj42zKEkMYxJehzUZD1MK+0UHTF0NtR8iFjnud3HHrcNXF/jDxzyGuK1VVr88GV
         4HOIfQ6bSNmNK4EuYEMYFvqEIrLR0deuQt8Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOPBqSfvTUalmlO9KQoQtuiAFEsMX0/0KEkC4CfPQWA=;
        b=GJRk/8P3QZG9RHQbMqCvLWXXfdoCcq0DczmGSr7E2D4CNEbKXbu4A5iBLUXLsIWquq
         QjUYi1DhV7Ixpf6o6h1YDCcQ4d5iyvTTfsUp679riVJWMCT0P/hY3dWWFHUvYkx3Nv6j
         5R33CyVR9hDtz3eZF8GWySMh3FcD10kJCuS80Fw5TLzxAjzLYRlSvMRh9mIkqmzhWVYb
         Wr6VytChFZ1DEh/T9IFFwKezH7J4e8h2EHM9JO2r/qNgorcus+sBW0RxNSvwJ+aprZ/I
         a7++fF6P+eWXwXU1KwTO0Fmr6JXUeRRZN/JPp2guJzb+jc/4bWpAZu8YYuAtZuo4HjzT
         7nIA==
X-Gm-Message-State: AOAM533l1oR22DlBRn2EysuNTU17ycUEeNGi2nejulUG8+S/O9vM7yeG
        0H8KxrSXzfPlR5U6XwIP4GOwm82ozGQaJQ==
X-Google-Smtp-Source: ABdhPJyeu8W2S3CZCeR+x7lt0bSn7UD7RfV5bOTcM/SUx2YsSpJN60skgST4VMMvJ0dUk+1rQpSMcA==
X-Received: by 2002:ac2:42d3:: with SMTP id n19mr1479542lfl.447.1612349474301;
        Wed, 03 Feb 2021 02:51:14 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id q9sm204420lfc.61.2021.02.03.02.51.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:51:14 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id p21so32620739lfu.11
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 02:51:14 -0800 (PST)
X-Received: by 2002:ac2:5683:: with SMTP id 3mr1366478lfr.332.1612349063531;
 Wed, 03 Feb 2021 02:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20210121061804.26423-1-irui.wang@mediatek.com> <20210121061804.26423-3-irui.wang@mediatek.com>
In-Reply-To: <20210121061804.26423-3-irui.wang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 3 Feb 2021 19:44:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXqFU+-f4C=BaW9d_KyEUwZVTiBj-dqqxnGP-Zd7YkMVw@mail.gmail.com>
Message-ID: <CAPBb6MXqFU+-f4C=BaW9d_KyEUwZVTiBj-dqqxnGP-Zd7YkMVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mtk-vcodec: Separating mtk encoder driver
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Irui,

Thanks for pushing this forward. I had two small conflicts when
applying this patch to the media tree, so you may want to rebase
before sending the next version. Please see the comments inline.

On Thu, Jan 21, 2021 at 3:18 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> MTK H264 Encoder(VENC_SYS) and VP8 Encoder(VENC_LT_SYS) are two
> independent hardware instance. They have their owner interrupt,
> register mapping, and special clocks.
>
> This patch seperates them into two drivers:

seperates -> separates

Also the patch does not result in two drivers, but two devices.

> User Call "VIDIOC_QUERYCAP":
> H264 Encoder return driver name "mtk-vcodec-enc";
> VP8 Encoder return driver name "mtk-venc-vp8.

I wonder if we need to use two different names? The driver is the
same, so it makes sense to me that both devices return
"mtk-vcodec-enc". Userspace can then list the formats on the CAPTURE
queue in order to query the supported codecs.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  10 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  23 +++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 121 +++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  40 +-----
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   4 +-
>  5 files changed, 82 insertions(+), 116 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 3dd010cba23e..1594edcc706d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -19,6 +19,7 @@
>  #define MTK_VCODEC_DRV_NAME    "mtk_vcodec_drv"
>  #define MTK_VCODEC_DEC_NAME    "mtk-vcodec-dec"
>  #define MTK_VCODEC_ENC_NAME    "mtk-vcodec-enc"
> +#define MTK_VENC_VP8_NAME      "mtk-venc-vp8"
>  #define MTK_PLATFORM_STR       "platform:mt8173"
>
>  #define MTK_VCODEC_MAX_PLANES  3
> @@ -193,7 +194,6 @@ struct mtk_vcodec_pm {
>
>         struct mtk_vcodec_clk   venc_clk;
>         struct device   *larbvenc;
> -       struct device   *larbvenclt;
>         struct device   *dev;
>         struct mtk_vcodec_dev   *mtkdev;
>  };
> @@ -311,25 +311,27 @@ enum mtk_chip {
>   * @chip: chip this encoder is compatible with
>   *
>   * @uses_ext: whether the encoder uses the extended firmware messaging format
> - * @has_lt_irq: whether the encoder uses the LT irq
> + * @name: whether the encoder core is vp8
>   * @min_birate: minimum supported encoding bitrate
>   * @max_bitrate: maximum supported encoding bitrate
>   * @capture_formats: array of supported capture formats
>   * @num_capture_formats: number of entries in capture_formats
>   * @output_formats: array of supported output formats
>   * @num_output_formats: number of entries in output_formats
> + * @core_id: stand for h264 or vp8 encode index
>   */
>  struct mtk_vcodec_enc_pdata {
>         enum mtk_chip chip;
>
>         bool uses_ext;
> -       bool has_lt_irq;
> +       const char *name;

This new member can be removed if we use the same name for both devices.

>         unsigned long min_bitrate;
>         unsigned long max_bitrate;
>         const struct mtk_video_fmt *capture_formats;
>         size_t num_capture_formats;
>         const struct mtk_video_fmt *output_formats;
>         size_t num_output_formats;
> +       int core_id;
>  };
>
>  #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
> @@ -361,7 +363,6 @@ struct mtk_vcodec_enc_pdata {
>   *
>   * @dec_irq: decoder irq resource
>   * @enc_irq: h264 encoder irq resource
> - * @enc_lt_irq: vp8 encoder irq resource
>   *
>   * @dec_mutex: decoder hardware lock
>   * @enc_mutex: encoder hardware lock.
> @@ -397,7 +398,6 @@ struct mtk_vcodec_dev {
>
>         int dec_irq;
>         int enc_irq;
> -       int enc_lt_irq;
>
>         struct mutex dec_mutex;
>         struct mutex enc_mutex;
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 21de1431cfcb..0da6871b4b39 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  #include <soc/mediatek/smi.h>
> +#include <linux/pm_runtime.h>
>
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_enc.h"
> @@ -189,7 +190,10 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
>  static int vidioc_venc_querycap(struct file *file, void *priv,
>                                 struct v4l2_capability *cap)
>  {
> -       strscpy(cap->driver, MTK_VCODEC_ENC_NAME, sizeof(cap->driver));
> +       const struct mtk_vcodec_enc_pdata *pdata =
> +               fh_to_ctx(priv)->dev->venc_pdata;
> +
> +       strscpy(cap->driver, pdata->name, sizeof(cap->driver));
>         strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
>         strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
>
> @@ -797,7 +801,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>           */
>         if ((ctx->state == MTK_STATE_ABORT) || (ctx->state == MTK_STATE_FREE)) {
>                 ret = -EIO;
> -               goto err_set_param;
> +               goto err_start_stream;
>         }
>
>         /* Do the initialization when both start_streaming have been called */
> @@ -809,6 +813,12 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>                         return 0;
>         }
>
> +       ret = pm_runtime_get_sync(&ctx->dev->plat_dev->dev);
> +       if (ret < 0) {
> +               mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> +               goto err_start_stream;
> +       }

This does not seem to be related to the split ; why is this necessary?

> +
>         mtk_venc_set_param(ctx, &param);
>         ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
>         if (ret) {
> @@ -835,6 +845,11 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>         return 0;
>
>  err_set_param:
> +       ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
> +       if (ret < 0)
> +               mtk_v4l2_err("pm_runtime_put fail %d", ret);
> +
> +err_start_stream:
>         for (i = 0; i < q->num_buffers; ++i) {
>                 struct vb2_buffer *buf = vb2_get_buffer(q, i);
>
> @@ -888,6 +903,10 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>         if (ret)
>                 mtk_v4l2_err("venc_if_deinit failed=%d", ret);
>
> +       ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
> +       if (ret < 0)
> +               mtk_v4l2_err("pm_runtime_put fail %d", ret);
> +
>         ctx->state = MTK_STATE_FREE;
>  }
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index dfb42e19bf81..4bee42454253 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -49,12 +49,15 @@ static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
>         },
>  };
>
> -static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
> +static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_h264[] =  {
>         {
>                 .fourcc = V4L2_PIX_FMT_H264,
>                 .type = MTK_FMT_ENC,
>                 .num_planes = 1,
>         },
> +};
> +
> +static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
>         {
>                 .fourcc = V4L2_PIX_FMT_VP8,
>                 .type = MTK_FMT_ENC,
> @@ -110,35 +113,13 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
>         ctx = dev->curr_ctx;
>         spin_unlock_irqrestore(&dev->irqlock, flags);
>
> -       mtk_v4l2_debug(1, "id=%d", ctx->id);
> -       addr = dev->reg_base[VENC_SYS] + MTK_VENC_IRQ_ACK_OFFSET;
> -
> -       ctx->irq_status = readl(dev->reg_base[VENC_SYS] +
> -                               (MTK_VENC_IRQ_STATUS_OFFSET));
> -
> -       clean_irq_status(ctx->irq_status, addr);
> -
> -       wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> -       return IRQ_HANDLED;
> -}
> -
> -static irqreturn_t mtk_vcodec_enc_lt_irq_handler(int irq, void *priv)
> -{
> -       struct mtk_vcodec_dev *dev = priv;
> -       struct mtk_vcodec_ctx *ctx;
> -       unsigned long flags;
> -       void __iomem *addr;
> -
> -       spin_lock_irqsave(&dev->irqlock, flags);
> -       ctx = dev->curr_ctx;
> -       spin_unlock_irqrestore(&dev->irqlock, flags);
> +       mtk_v4l2_debug(1, "id=%d coreid:%d", ctx->id, dev->venc_pdata->core_id);
> +       addr = dev->reg_base[dev->venc_pdata->core_id] +
> +                               MTK_VENC_IRQ_ACK_OFFSET;
>
> -       mtk_v4l2_debug(1, "id=%d", ctx->id);
> -       ctx->irq_status = readl(dev->reg_base[VENC_LT_SYS] +
> +       ctx->irq_status = readl(dev->reg_base[dev->venc_pdata->core_id] +
>                                 (MTK_VENC_IRQ_STATUS_OFFSET));
>
> -       addr = dev->reg_base[VENC_LT_SYS] + MTK_VENC_IRQ_ACK_OFFSET;
> -
>         clean_irq_status(ctx->irq_status, addr);
>
>         wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> @@ -293,17 +274,21 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         dev->venc_pdata = of_device_get_match_data(&pdev->dev);
>         ret = mtk_vcodec_init_enc_pm(dev);
>         if (ret < 0) {
> -               dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
> +               dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
>                 goto err_enc_pm;
>         }
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       dev->reg_base[VENC_SYS] = devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR((__force void *)dev->reg_base[VENC_SYS])) {
> -               ret = PTR_ERR((__force void *)dev->reg_base[VENC_SYS]);
> +       pm_runtime_enable(&pdev->dev);
> +
> +       snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> +                dev->venc_pdata->name);
> +
> +       dev->reg_base[dev->venc_pdata->core_id] =
> +               devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(dev->reg_base[dev->venc_pdata->core_id])) {
> +               ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_id]);
>                 goto err_res;
>         }
> -       mtk_v4l2_debug(2, "reg[%d] base=0x%p", i, dev->reg_base[VENC_SYS]);
>
>         res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>         if (res == NULL) {
> @@ -318,44 +303,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                                mtk_vcodec_enc_irq_handler,
>                                0, pdev->name, dev);
>         if (ret) {
> -               dev_err(&pdev->dev, "Failed to install dev->enc_irq %d (%d)",
> -                       dev->enc_irq,
> -                       ret);
> +               dev_err(&pdev->dev,
> +                       "Failed to install dev->enc_irq %d (%d) core_id:%d",
> +                       dev->enc_irq, ret, dev->venc_pdata->core_id);
>                 ret = -EINVAL;
>                 goto err_res;
>         }
>
> -       if (dev->venc_pdata->has_lt_irq) {
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -               dev->reg_base[VENC_LT_SYS] = devm_ioremap_resource(&pdev->dev, res);
> -               if (IS_ERR((__force void *)dev->reg_base[VENC_LT_SYS])) {
> -                       ret = PTR_ERR((__force void *)dev->reg_base[VENC_LT_SYS]);
> -                       goto err_res;
> -               }
> -               mtk_v4l2_debug(2, "reg[%d] base=0x%p", i, dev->reg_base[VENC_LT_SYS]);
> -
> -               dev->enc_lt_irq = platform_get_irq(pdev, 1);
> -               irq_set_status_flags(dev->enc_lt_irq, IRQ_NOAUTOEN);
> -               ret = devm_request_irq(&pdev->dev,
> -                                      dev->enc_lt_irq,
> -                                      mtk_vcodec_enc_lt_irq_handler,
> -                                      0, pdev->name, dev);
> -               if (ret) {
> -                       dev_err(&pdev->dev,
> -                               "Failed to install dev->enc_lt_irq %d (%d)",
> -                               dev->enc_lt_irq, ret);
> -                       ret = -EINVAL;
> -                       goto err_res;
> -               }
> -       }
> -
>         mutex_init(&dev->enc_mutex);
>         mutex_init(&dev->dev_mutex);
>         spin_lock_init(&dev->irqlock);
>
> -       snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> -                "[MTK_V4L2_VENC]");
> -
>         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>         if (ret) {
>                 mtk_v4l2_err("v4l2_device_register err=%d", ret);
> @@ -381,7 +339,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                                         V4L2_CAP_STREAMING;
>
>         snprintf(vfd_enc->name, sizeof(vfd_enc->name), "%s",
> -                MTK_VCODEC_ENC_NAME);
> +                       dev->venc_pdata->name);

Let's keep the indendation at the same level as before (if we use the
same driver name for both devices this change is unnecessary though).

>         video_set_drvdata(vfd_enc, dev);
>         dev->vfd_enc = vfd_enc;
>         platform_set_drvdata(pdev, dev);
> @@ -409,8 +367,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 goto err_enc_reg;
>         }
>
> -       mtk_v4l2_debug(0, "encoder registered as /dev/video%d",
> -                       vfd_enc->num);
> +       mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
> +                      dev->venc_pdata->core_id, vfd_enc->num);
>
>         return 0;
>
> @@ -429,20 +387,33 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> +static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
>         .chip = MTK_MT8173,
> -       .has_lt_irq = true,
> -       .capture_formats = mtk_video_formats_capture_mt8173,
> -       .num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173),
> +       .name = MTK_VCODEC_ENC_NAME,
> +       .capture_formats = mtk_video_formats_capture_mt8173_h264,
> +       .num_capture_formats = 1,

Can't this be ARRAY_SIZE(mtk_video_formats_capture_mt8173_h264)

>         .output_formats = mtk_video_formats_output_mt8173,
>         .num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> -       .min_bitrate = 1,
> +       .min_bitrate = 64,

I'm fine with changing the value of min_bitrate, but this should be a
separate patch.

> +       .max_bitrate = 4000000,
> +       .core_id = VENC_SYS,
> +};
> +
> +static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
> +       .chip = MTK_MT8173,
> +       .name = MTK_VENC_VP8_NAME,
> +       .capture_formats = mtk_video_formats_capture_mt8173_vp8,
> +       .num_capture_formats = 1,

Same here, ARRAY_SIZE(mtk_video_formats_capture_mt8173_vp8)

> +       .output_formats = mtk_video_formats_output_mt8173,
> +       .num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> +       .min_bitrate = 64,
>         .max_bitrate = 4000000,
> +       .core_id = VENC_LT_SYS,
>  };
>
>  static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
>         .chip = MTK_MT8183,
> -       .has_lt_irq = false,
> +       .name = MTK_VCODEC_ENC_NAME,
>         .uses_ext = true,
>         .capture_formats = mtk_video_formats_capture_mt8183,
>         .num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
> @@ -451,10 +422,14 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
>         .num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
>         .min_bitrate = 64,
>         .max_bitrate = 40000000,
> +       .core_id = VENC_SYS,
>  };
>
>  static const struct of_device_id mtk_vcodec_enc_match[] = {
> -       {.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
> +       {.compatible = "mediatek,mt8173-vcodec-avc-enc",
> +                       .data = &mt8173_avc_pdata},

For backward compatibility let's also match
"mediatek,mt8173-vcodec-enc" against this platform data.


> +       {.compatible = "mediatek,mt8173-vcodec-vp8-enc",
> +                       .data = &mt8173_vp8_pdata},
>         {.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
>         {},
>  };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 3b7c54d6aa8f..1b2e4930ed27 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -43,23 +43,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>                 return -ENODEV;
>         }
>         pm->larbvenc = &pdev->dev;
> -
> -       node = of_parse_phandle(dev->of_node, "mediatek,larb", 1);
> -       if (!node) {
> -               mtk_v4l2_err("no mediatek,larb found");
> -               ret = -ENODEV;
> -               goto put_larbvenc;
> -       }
> -
> -       pdev = of_find_device_by_node(node);
> -       of_node_put(node);
> -       if (!pdev) {
> -               mtk_v4l2_err("no mediatek,larb device found");
> -               ret = -ENODEV;
> -               goto put_larbvenc;
> -       }
> -
> -       pm->larbvenclt = &pdev->dev;
>         pdev = mtkdev->plat_dev;
>         pm->dev = &pdev->dev;
>
> @@ -71,12 +54,12 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>                         GFP_KERNEL);
>                 if (!enc_clk->clk_info) {
>                         ret = -ENOMEM;
> -                       goto put_larbvenclt;
> +                       goto put_larbvenc;
>                 }
>         } else {
>                 mtk_v4l2_err("Failed to get venc clock count");
>                 ret = -EINVAL;
> -               goto put_larbvenclt;
> +               goto put_larbvenc;
>         }
>
>         for (i = 0; i < enc_clk->clk_num; i++) {
> @@ -85,7 +68,7 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>                         "clock-names", i, &clk_info->clk_name);
>                 if (ret) {
>                         mtk_v4l2_err("venc failed to get clk name %d", i);
> -                       goto put_larbvenclt;
> +                       goto put_larbvenc;
>                 }
>                 clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>                         clk_info->clk_name);
> @@ -93,14 +76,12 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>                         mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
>                                 clk_info->clk_name);
>                         ret = PTR_ERR(clk_info->vcodec_clk);
> -                       goto put_larbvenclt;
> +                       goto put_larbvenc;
>                 }
>         }
>
>         return 0;
>
> -put_larbvenclt:
> -       put_device(pm->larbvenclt);
>  put_larbvenc:
>         put_device(pm->larbvenc);
>         return ret;
> @@ -108,7 +89,7 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>
>  void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -       put_device(mtkdev->pm.larbvenclt);
> +       pm_runtime_disable(mtkdev->pm.dev);
>         put_device(mtkdev->pm.larbvenc);
>  }
>
> @@ -130,18 +111,10 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>         ret = mtk_smi_larb_get(pm->larbvenc);
>         if (ret) {
>                 mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -               goto larbvencerr;
> -       }
> -       ret = mtk_smi_larb_get(pm->larbvenclt);
> -       if (ret) {
> -               mtk_v4l2_err("mtk_smi_larb_get larb4 fail %d", ret);
> -               goto larbvenclterr;
> +               goto clkerr;
>         }
>         return;
>
> -larbvenclterr:
> -       mtk_smi_larb_put(pm->larbvenc);
> -larbvencerr:
>  clkerr:
>         for (i -= 1; i >= 0; i--)
>                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> @@ -153,7 +126,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
>         int i = 0;
>
>         mtk_smi_larb_put(pm->larbvenc);
> -       mtk_smi_larb_put(pm->larbvenclt);
>         for (i = enc_clk->clk_num - 1; i >= 0; i--)
>                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 11abb191ada5..8267a9c4fd25 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -367,7 +367,7 @@ static int vp8_enc_encode(void *handle,
>
>         mtk_vcodec_debug_enter(inst);
>
> -       enable_irq(ctx->dev->enc_lt_irq);
> +       enable_irq(ctx->dev->enc_irq);
>
>         switch (opt) {
>         case VENC_START_OPT_ENCODE_FRAME:
> @@ -386,7 +386,7 @@ static int vp8_enc_encode(void *handle,
>
>  encode_err:
>
> -       disable_irq(ctx->dev->enc_lt_irq);
> +       disable_irq(ctx->dev->enc_irq);
>         mtk_vcodec_debug_leave(inst);
>
>         return ret;
> --
> 2.18.0
>
