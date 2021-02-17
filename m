Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A45F31E015
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 21:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhBQUQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 15:16:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59538 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhBQUQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 15:16:21 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E92FB1F40F2C
Message-ID: <9d0ddec3cc244e36483abb28b54053fa02babb5c.camel@collabora.com>
Subject: Re: [PATCH v1 07/18] media: hantro: Add a field to distinguish the
 hardware versions
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Wed, 17 Feb 2021 17:15:27 -0300
In-Reply-To: <20210217080306.157876-8-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-8-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> Decoders hardware blocks could exist in multiple versions: add
> a field to distinguish them at runtime.
> Keep the default behavoir to be G1 hardware.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h     | 5 +++++
>  drivers/staging/media/hantro/hantro_drv.c | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index bde65231f22f..2a566dfc2fe3 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -36,6 +36,9 @@ struct hantro_codec_ops;
>  #define HANTRO_H264_DECODER    BIT(18)
>  #define HANTRO_DECODERS                0xffff0000
>  
> +#define HANTRO_G1_REV          0x6731
> +#define HANTRO_G2_REV          0x6732
> +
>  /**
>   * struct hantro_irq - irq handler and name
>   *
> @@ -170,6 +173,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @enc_base:          Mapped address of VPU encoder register for convenience.
>   * @dec_base:          Mapped address of VPU decoder register for convenience.
>   * @ctrl_base:         Mapped address of VPU control block.
> + * @core_hw_dec_rev    Runtime detected HW decoder core revision
>   * @vpu_mutex:         Mutex to synchronize V4L2 calls.
>   * @irqlock:           Spinlock to synchronize access to data structures
>   *                     shared with interrupt handlers.
> @@ -189,6 +193,7 @@ struct hantro_dev {
>         void __iomem *enc_base;
>         void __iomem *dec_base;
>         void __iomem *ctrl_base;
> +       u32 core_hw_dec_rev;
>  
>         struct mutex vpu_mutex; /* video_device lock */
>         spinlock_t irqlock;
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 0570047c7fa0..e1443c394f62 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -840,6 +840,8 @@ static int hantro_probe(struct platform_device *pdev)
>         }
>         vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
>         vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
> +       /* by default decoder is G1 */
> +       vpu->core_hw_dec_rev = HANTRO_G1_REV;
>  

What's the use of this field? Can't we simply rely on the compatible string?

Thanks,
Ezequiel


