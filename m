Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A1446F7A4
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 00:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbhLIXs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 18:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbhLIXs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 18:48:26 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE0EC0617A2
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 15:44:52 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id u16so6615979qvk.4
        for <linux-media@vger.kernel.org>; Thu, 09 Dec 2021 15:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z8ul/68TTMd0vCXelwEXbTf2Y8+4CmIOh8pjnYzpEeY=;
        b=HKchMdZDouQpqT1O5HjguvjPWBPz5meO4ShyPblqGvL14MCZ+bL7PTDY/4z9k56BpQ
         KZCb2a2oVelWePKPdWYqk3djkd1IimxvXoic+QwJFtOjUv8T6uBHfuHOfBVQOVd6sOaW
         fQJ5P1RPrRuXBjunLQ+OT9IAVh/3dd4uJx0Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z8ul/68TTMd0vCXelwEXbTf2Y8+4CmIOh8pjnYzpEeY=;
        b=CRFU5b2re4iaW+hgStMw/mGd+ldAxGTV3y3isUezqQ7aQX2YISTOaGG57jx9S8a7XA
         MHjpxXPFk5KJbnGoRxO44DZLBTpUQO6/YNt5LT+v/RjEsTWyalUb6NB0WsM7kBpdLbNz
         aCAffaOtaXj7/ShmrebhSZC6VbmN3ccZJeiI4K5hM05IRC0OSZELgt76uZCVZiAtTPoY
         v0ggeOhKytSwenAdTWA9eeXiW+hA/3y7rslCGs4Gc5nAz3MTeU9Ip6uyQH1aZbQjVq2/
         mdDolhdCWjo/ItfN5G1YtNFaLXUAxzTGZwwWGSICxdWgGJkGMtjdvTilgP52lYI1JNtg
         92zw==
X-Gm-Message-State: AOAM532diEZnBQ149IkgoJ5+LjtrXOTX1YTwpi+vJ3L8lixSj3V/sGTA
        DAcYF/Q5VxEDw8F9AkCifNecjxSyKgNwjwxUzu5YNQ==
X-Google-Smtp-Source: ABdhPJzV6/TnXjUOLjFzM/ma9fmG9Nt8FCU/gSZz36pPI4LByD43heeF0Dr9GJ2LVcnM2DQhO0cSrj4qiEKvoaPI/+c=
X-Received: by 2002:a05:6214:5193:: with SMTP id kl19mr20845472qvb.77.1639093491509;
 Thu, 09 Dec 2021 15:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20211202034544.2750-1-yunfei.dong@mediatek.com> <20211202034544.2750-14-yunfei.dong@mediatek.com>
In-Reply-To: <20211202034544.2750-14-yunfei.dong@mediatek.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Thu, 9 Dec 2021 15:44:41 -0800
Message-ID: <CAC-pXoPV0MrX91DfuiscmkOwviJ6Gh4RcYRZ+GW6482NpMGFtg@mail.gmail.com>
Subject: Re: [PATCH v12, 13/19] media: mtk-vcodec: Add work queue for core
 hardware decode
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 1, 2021 at 7:46 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Add work queue to process core hardware information.
> First, get lat_buf from message queue, then call core
> hardware of each codec(H264/VP9/AV1) to decode, finally
> puts lat_buf back to the message.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 16 +++++++-
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
>  .../platform/mtk-vcodec/vdec_msg_queue.c      | 41 ++++++++++++++++---
>  .../platform/mtk-vcodec/vdec_msg_queue.h      |  8 ++--
>  4 files changed, 57 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index d460703f335d..4fbff61d2334 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -341,6 +341,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 goto err_dec_pm;
>         }
>
> +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +               vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx, MTK_VDEC_CORE);
> +               dev->core_workqueue = alloc_ordered_workqueue("core-decoder",
> +                       WQ_MEM_RECLAIM | WQ_FREEZABLE);
> +               if (!dev->core_workqueue) {
> +                       mtk_v4l2_err("Failed to create core workqueue");
> +                       ret = -EINVAL;
> +                       goto err_res;
> +               }
> +       }
> +
>         for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>                 mutex_init(&dev->dec_mutex[i]);
>         spin_lock_init(&dev->irqlock);
> @@ -351,7 +362,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>         if (ret) {
>                 mtk_v4l2_err("v4l2_device_register err=%d", ret);
> -               goto err_res;
> +               goto err_core_workq;
>         }
>
>         init_waitqueue_head(&dev->queue);
> @@ -450,6 +461,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         video_unregister_device(vfd_dec);
>  err_dec_alloc:
>         v4l2_device_unregister(&dev->v4l2_dev);
> +err_core_workq:
> +       if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
> +               destroy_workqueue(dev->core_workqueue);
>  err_res:
>         mtk_vcodec_release_dec_pm(&dev->pm);
>  err_dec_pm:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index cbaed96dcfa2..a558cc16026d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -27,6 +27,7 @@
>  #define MTK_VCODEC_MAX_PLANES  3
>  #define MTK_V4L2_BENCHMARK     0
>  #define WAIT_INTR_TIMEOUT_MS   1000
> +#define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)

Basic question: What is practical meaning of this? What architectures
are supported?

>
>  /*
>   * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -464,6 +465,7 @@ struct mtk_vcodec_enc_pdata {
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
>   *
> + * @core_workqueue: queue used for core hardware decode
>   * @msg_queue_core_ctx: msg queue context used for core workqueue
>   *
>   * @subdev_dev: subdev hardware device
> @@ -506,6 +508,7 @@ struct mtk_vcodec_dev {
>         unsigned int dec_capability;
>         unsigned int enc_capability;
>
> +       struct workqueue_struct *core_workqueue;
>         struct vdec_msg_queue_ctx msg_queue_core_ctx;
>
>         void *subdev_dev[MTK_VDEC_HW_MAX];
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index 913aefa67618..24f1d03df9f1 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -68,6 +68,9 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
>
>         if (msg_ctx->hardware_index != MTK_VDEC_CORE)
>                 wake_up_all(&msg_ctx->ready_to_use);
> +       else
> +               queue_work(buf->ctx->dev->core_workqueue,
> +                       &buf->ctx->msg_queue.core_work);

need {} for else here?

>
>         mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
>                 msg_ctx->hardware_index, buf, msg_ctx->ready_num);
> @@ -169,8 +172,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
>         return false;
>  }
>
> -void vdec_msg_queue_deinit(
> -       struct vdec_msg_queue *msg_queue,
> +void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
>         struct mtk_vcodec_ctx *ctx)
>  {
>         struct vdec_lat_buf *lat_buf;
> @@ -196,10 +198,36 @@ void vdec_msg_queue_deinit(
>         }
>  }
>
> -int vdec_msg_queue_init(
> -       struct vdec_msg_queue *msg_queue,
> -       struct mtk_vcodec_ctx *ctx,
> -       core_decode_cb_t core_decode,
> +static void vdec_msg_queue_core_work(struct work_struct *work)
> +{
> +       struct vdec_msg_queue *msg_queue =
> +               container_of(work, struct vdec_msg_queue, core_work);
> +       struct mtk_vcodec_ctx *ctx =
> +               container_of(msg_queue, struct mtk_vcodec_ctx, msg_queue);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vdec_lat_buf *lat_buf;
> +
> +       lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> +       if (!lat_buf)
> +               return;

If we were to return in this error condition,
isn't it better to also differentiate this error with return code and
change void return type?

> +
> +       ctx = lat_buf->ctx;
> +       mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> +
> +       lat_buf->core_decode(lat_buf);
> +
> +       mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> +       vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> +
> +       if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
> +               mtk_v4l2_debug(3, "re-schedule to decode for core",
> +                       dev->msg_queue_core_ctx.ready_num);
> +               queue_work(dev->core_workqueue, &msg_queue->core_work);
> +       }
> +}
> +
> +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t core_decode,
>         int private_size)
>  {
>         struct vdec_lat_buf *lat_buf;
> @@ -210,6 +238,7 @@ int vdec_msg_queue_init(
>                 return 0;
>
>         vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
> +       INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
>         msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
>                 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> index 21a9c0aeb1b4..43eae638a2a8 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -67,6 +67,7 @@ struct vdec_lat_buf {
>   * @wdma_addr: wdma address used for ube
>   * @wdma_rptr_addr: ube read point
>   * @wdma_wptr_addr: ube write point
> + * @core_work: core hardware work
>   * @lat_ctx: used to store lat buffer list
>   */
>  struct vdec_msg_queue {
> @@ -76,6 +77,7 @@ struct vdec_msg_queue {
>         uint64_t wdma_rptr_addr;
>         uint64_t wdma_wptr_addr;
>
> +       struct work_struct core_work;
>         struct vdec_msg_queue_ctx lat_ctx;
>  };
>
> @@ -86,10 +88,8 @@ struct vdec_msg_queue {
>   * @core_decode: core decode callback for each codec
>   * @private_size: the private data size used to share with core
>   */
> -int vdec_msg_queue_init(
> -       struct vdec_msg_queue *msg_queue,
> -       struct mtk_vcodec_ctx *ctx,
> -       core_decode_cb_t core_decode,
> +int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
> +       struct mtk_vcodec_ctx *ctx,     core_decode_cb_t core_decode,

Not sure about the formatting rule, but is it supposed to be one param per line?
If so, this comment also applied to function definition part.

>         int private_size);
>
>  /**
> --
> 2.25.1
>
