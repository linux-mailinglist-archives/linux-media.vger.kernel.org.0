Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BEB465A0D
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 00:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353883AbhLAX6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 18:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344111AbhLAX6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 18:58:49 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703C4C06174A
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 15:55:27 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id a11so32893091qkh.13
        for <linux-media@vger.kernel.org>; Wed, 01 Dec 2021 15:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVZ70Dywr625UyFi302s6LjnjHklxJb/tfvnMbwjLaM=;
        b=jCkXdMKskBUT2OYx7Iaa2BLRafUdDejK8djqWKix9T6swIAuLZxsGqdR4LzM5/sE3G
         JDmzjvBHFhnRgl47r/VjZFASHCgHpTdLo1VGBGxbbWxVmTPdWgGsuRfuzt8akpS21HLg
         OTBZNZBgwEoYUu53vs0qkpJYiVPEorqa7Ri40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVZ70Dywr625UyFi302s6LjnjHklxJb/tfvnMbwjLaM=;
        b=fJZrc4thU6KBdBn1TBiQT5G/lDgcUqax8zV9yTuvqlVqSP66z8RdrBWasJPBBNOZZj
         H0qCJyvaRSO/d1M9N7Al8RHqjGX9JaJJlY5Dhopc+lLrE+z77jKAWTuFChqf5qQkmIf/
         CIwo1M0NcEDTikNyEdLGy1Lvy0c2v2zfTYvhSGNeAA0si0lSK3XL9uidsYc34lU+34AM
         fysRDaajpmKrFsEKLCEDJ9iuOxm4oVlEG6ldddAxV92rg1zKPQ9i+TOYEUFCJfQDsa8C
         yEwbSunAsTtrUbR06APZC8C9YvkM8kz9wangEctJ9JXKvDQuBX9W7XQEHHrdNCJaUgl0
         md2A==
X-Gm-Message-State: AOAM531KV2JrZ64HimOhsooc/V7+3anIBjSNCiD8QaJ5VclBYoZkzePH
        oSngcJqCOEeijq8URo0qNJ8rQLuDUroC7b8JWzbHdg==
X-Google-Smtp-Source: ABdhPJwDrESPOFAKGV76+3Yd4DHuNO5qwOKr/plQ6gy9TgikmfsgmMo5D/ZY+B7br+XAoX3AcL0s/vToKivqbssMv5Q=
X-Received: by 2002:a37:8805:: with SMTP id k5mr9678214qkd.426.1638402926057;
 Wed, 01 Dec 2021 15:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com> <20211129034201.5767-3-yunfei.dong@mediatek.com>
In-Reply-To: <20211129034201.5767-3-yunfei.dong@mediatek.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Wed, 1 Dec 2021 15:55:15 -0800
Message-ID: <CAC-pXoPXc=q8KPUcSfY6XZ=sLt71vDZbJV=f4SZx55Gc6VbRQw@mail.gmail.com>
Subject: Re: [PATCH v11, 02/19] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
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
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LGTM.

On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Vdec and venc can use the same function to wake up interrupt event.
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 9 +--------
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 8 ++++++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 --------
>  3 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 59caf2163349..055d50e52720 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -31,13 +31,6 @@
>  module_param(mtk_v4l2_dbg_level, int, 0644);
>  module_param(mtk_vcodec_dbg, bool, 0644);
>
> -/* Wake up context wait_queue */
> -static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
> -{
> -       ctx->int_cond = 1;
> -       wake_up_interruptible(&ctx->queue);
> -}
> -
>  static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
>  {
>         struct mtk_vcodec_dev *dev = priv;
> @@ -69,7 +62,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
>         writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
>                 dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
>
> -       wake_up_ctx(ctx);
> +       wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);

Assuming setting up reason doesn't change functionality.

>
>         mtk_v4l2_debug(3,
>                         "mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 581522177308..1d2370608d0d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -473,4 +473,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
>         return container_of(ctrl->handler, struct mtk_vcodec_ctx, ctrl_hdl);
>  }
>
> +/* Wake up context wait_queue */
> +static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> +{
> +       ctx->int_cond = 1;
> +       ctx->int_type = reason;
> +       wake_up_interruptible(&ctx->queue);
> +}
> +
>  #endif /* _MTK_VCODEC_DRV_H_ */
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index eed67394cf46..7c3487fb3498 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -65,14 +65,6 @@ static const struct mtk_video_fmt mtk_video_formats_capture_vp8[] =  {
>         },
>  };
>
> -/* Wake up context wait_queue */
> -static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> -{
> -       ctx->int_cond = 1;
> -       ctx->int_type = reason;
> -       wake_up_interruptible(&ctx->queue);
> -}
> -
>  static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
>  {
>         if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
> --
> 2.25.1
>
