Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C2532C7E8
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244822AbhCDAdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390630AbhCCWKQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 17:10:16 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC315C06175F;
        Wed,  3 Mar 2021 14:06:11 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CD5D61F46036
Message-ID: <32899bc605ae7173c29b25a396e21d7fad32d4bf.camel@collabora.com>
Subject: Re: [PATCH v4 05/11] media: hantro: Add a field to distinguish the
 hardware versions
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Wed, 03 Mar 2021 19:05:58 -0300
In-Reply-To: <20210303113952.178519-6-benjamin.gaignard@collabora.com>
References: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
         <20210303113952.178519-6-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-03-03 at 12:39 +0100, Benjamin Gaignard wrote:
> Decoders hardware blocks could exist in multiple versions: add
> a field to distinguish them at runtime.
> G2 hardware block doesn't have postprocessor hantro_needs_postproc
> function should always returns false in for this hardware.
> hantro_needs_postproc function becoming to much complex to
> stay inline in .h file move it to .c file.
> 

Note that I already questioned this patch before:

https://lkml.org/lkml/2021/2/17/722

I think it's better to rely on of_device_id.data for this
type of thing.

In particular, I was expecting that just using
hantro_variant.postproc_regs would be enough.

Can you try if that works and avoid reading swreg(0)
and probing the hardware core?

Thanks!
Ezequiel

> Keep the default behavoir to be G1 hardware.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h          | 13 +++++++------
>  drivers/staging/media/hantro/hantro_drv.c      |  2 ++
>  drivers/staging/media/hantro/hantro_postproc.c | 17 +++++++++++++++++
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index a76a0d79db9f..05876e426419 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -37,6 +37,9 @@ struct hantro_codec_ops;
>  #define HANTRO_HEVC_DECODER    BIT(19)
>  #define HANTRO_DECODERS                0xffff0000
>  
> +#define HANTRO_G1_REV          0x6731
> +#define HANTRO_G2_REV          0x6732
> +
>  /**
>   * struct hantro_irq - irq handler and name
>   *
> @@ -171,6 +174,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @enc_base:          Mapped address of VPU encoder register for convenience.
>   * @dec_base:          Mapped address of VPU decoder register for convenience.
>   * @ctrl_base:         Mapped address of VPU control block.
> + * @core_hw_dec_rev    Runtime detected HW decoder core revision
>   * @vpu_mutex:         Mutex to synchronize V4L2 calls.
>   * @irqlock:           Spinlock to synchronize access to data structures
>   *                     shared with interrupt handlers.
> @@ -190,6 +194,7 @@ struct hantro_dev {
>         void __iomem *enc_base;
>         void __iomem *dec_base;
>         void __iomem *ctrl_base;
> +       u32 core_hw_dec_rev;
>  
>         struct mutex vpu_mutex; /* video_device lock */
>         spinlock_t irqlock;
> @@ -412,12 +417,8 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
>         return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  }
>  
> -static inline bool
> -hantro_needs_postproc(const struct hantro_ctx *ctx,
> -                     const struct hantro_fmt *fmt)
> -{
> -       return !ctx->is_encoder && fmt->fourcc != V4L2_PIX_FMT_NV12;
> -}
> +bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> +                          const struct hantro_fmt *fmt);
>  
>  static inline dma_addr_t
>  hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index f0b68e16fcc0..e3e6df28f470 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -836,6 +836,8 @@ static int hantro_probe(struct platform_device *pdev)
>         }
>         vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
>         vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
> +       /* by default decoder is G1 */
> +       vpu->core_hw_dec_rev = HANTRO_G1_REV;
>  
>         ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
>         if (ret) {
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 6d2a8f2a8f0b..050880f720d6 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -50,6 +50,23 @@ const struct hantro_postproc_regs hantro_g1_postproc_regs = {
>         .display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
>  };
>  
> +bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> +                          const struct hantro_fmt *fmt)
> +{
> +       struct hantro_dev *vpu = ctx->dev;
> +
> +       if (ctx->is_encoder)
> +               return false;
> +
> +       if (vpu->core_hw_dec_rev == HANTRO_G1_REV):q

> +               return fmt->fourcc != V4L2_PIX_FMT_NV12;
> +
> +       if (vpu->core_hw_dec_rev == HANTRO_G2_REV)
> +               return false;
> +
> +       return false;
> +}
> +
>  void hantro_postproc_enable(struct hantro_ctx *ctx)
>  {
>         struct hantro_dev *vpu = ctx->dev;


