Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26F32ED73F
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 20:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbhAGTJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 14:09:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42928 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbhAGTJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 14:09:01 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1F0991F4662A
Message-ID: <f7291b83fe39d71c3192ea58ebf71e3909bd38af.camel@collabora.com>
Subject: Re: [PATCH 5/5] media: hantro: Add support for the Rockchip PX30
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Thu, 07 Jan 2021 16:08:10 -0300
In-Reply-To: <20210107134101.195426-6-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
         <20210107134101.195426-6-paul.kocialkowski@bootlin.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Happy to see this patch. It was on my TODO list,
but I hadn't had time to bringup my rk3326 device.

A few comments.

On Thu, 2021-01-07 at 14:41 +0100, Paul Kocialkowski wrote:
> The PX30 SoC includes both the VDPU2 and VEPU2 blocks which are similar
> to the RK3399 (Hantro G1/H1 with shuffled registers).
> 
> Besides taking an extra clock, it also shares an interrupt with the IOMMU
> so it's necessary to request the interrupt shared.
> 

Could you clarify on the commit description which iommu device interrupt
line is being shared?

> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c    |  5 +++--
>  drivers/staging/media/hantro/hantro_hw.h     |  1 +
>  drivers/staging/media/hantro/rk3399_vpu_hw.c | 21 ++++++++++++++++++++
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e5f200e64993..076a7782b476 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -472,6 +472,7 @@ static const struct v4l2_file_operations hantro_fops = {
>  
>  static const struct of_device_id of_hantro_match[] = {
>  #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
> +       { .compatible = "rockchip,px30-vpu", .data = &px30_vpu_variant, },
>         { .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>         { .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>         { .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
> @@ -796,8 +797,8 @@ static int hantro_probe(struct platform_device *pdev)
>                         return -ENXIO;
>  
>                 ret = devm_request_irq(vpu->dev, irq,
> -                                      vpu->variant->irqs[i].handler, 0,
> -                                      dev_name(vpu->dev), vpu);
> +                                      vpu->variant->irqs[i].handler,
> +                                      IRQF_SHARED, dev_name(vpu->dev), vpu);

Maybe this irq flag should be part of vpu->variant? It sounds like an IP block
integration specific thing.

Also, you will need a px30-specific interrupt handler now,
since the rk3399 one is not shared-friendly.

>                 if (ret) {
>                         dev_err(vpu->dev, "Could not request %s IRQ.\n",
>                                 irq_name);
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 34c9e4649a25..07f516fd7a2e 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -148,6 +148,7 @@ enum hantro_enc_fmt {
>         RK3288_VPU_ENC_FMT_UYVY422 = 3,
>  };
>  
> +extern const struct hantro_variant px30_vpu_variant;
>  extern const struct hantro_variant rk3399_vpu_variant;
>  extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3288_vpu_variant;
> diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> index 7a7962cf771e..4112f98baa60 100644
> --- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c

Perhaps it's time to rename this to rockchip_vpu_hw.c,
and merge rk3288 and rk3399? It's a nitpick, though.

> @@ -220,3 +220,24 @@ const struct hantro_variant rk3328_vpu_variant = {
>         .clk_names = rk3399_clk_names,
>         .num_clocks = ARRAY_SIZE(rk3399_clk_names),
>  };
> +
> +static const char * const px30_clk_names[] = {
> +       "aclk", "hclk", "sclk"
> +};
> +
> +const struct hantro_variant px30_vpu_variant = {
> +       .enc_offset = 0x0,
> +       .enc_fmts = rk3399_vpu_enc_fmts,
> +       .num_enc_fmts = ARRAY_SIZE(rk3399_vpu_enc_fmts),
> +       .dec_offset = 0x400,
> +       .dec_fmts = rk3399_vpu_dec_fmts,
> +       .num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
> +       .codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
> +                HANTRO_VP8_DECODER,
> +       .codec_ops = rk3399_vpu_codec_ops,
> +       .irqs = rk3399_irqs,
> +       .num_irqs = ARRAY_SIZE(rk3399_irqs),
> +       .init = rk3399_vpu_hw_init,
> +       .clk_names = px30_clk_names,
> +       .num_clocks = ARRAY_SIZE(px30_clk_names)
> +};

Thanks,
Ezequiel

