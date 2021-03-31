Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F063507B1
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 21:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbhCaT6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 15:58:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33960 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235995AbhCaT55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 15:57:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 88FED1F46396
Message-ID: <7ab16129c1f3cb701f3b5d5fc3cc66f9f42d6606.camel@collabora.com>
Subject: Re: [PATCH v3 6/9] media: hantro: add fallback handling for single
 irq/clk
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Wed, 31 Mar 2021 16:57:48 -0300
In-Reply-To: <20210331173520.184191-7-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
         <20210331173520.184191-7-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

Thanks for the patch. Looking good!

A few comments below.

On Wed, 2021-03-31 at 18:35 +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Currently the driver expects that each irq/clk will have a name
> specified.
> 
> A valid point was raised by the DT maintainers - when there is a single
> interrupt line or clock - the names are not needed.
> 
> This is handled:
>  - clk - implicitly - ultimately we'll call of_clk_get_hw(..., 0, NULL
>    which will get the first clock from the pmc
>  - irq - explicitly - platform_get_irq(..., 0)
> 
> To gracefully handle potential bugs, add respective WARN_ON() if we're
> having more than one irq/clk, yet lacking the respective names.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Since this is a new patch, I'm unsure where was this Acked-by?

> Suggested-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> v3
>  - New patch
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 24 +++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e5f200e64993..d1294eb9cd07 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -752,8 +752,16 @@ static int hantro_probe(struct platform_device *pdev)
>         if (!vpu->clocks)
>                 return -ENOMEM;
>  
> -       for (i = 0; i < vpu->variant->num_clocks; i++)
> +       for (i = 0; i < vpu->variant->num_clocks; i++) {
>                 vpu->clocks[i].id = vpu->variant->clk_names[i];
> +
> +               /*
> +                * Warn and refuse to load if the driver has multiple clocks,
> +                * yet they are lacking the respective names.
> +                */
> +               if (WARN_ON(!vpu->variant->clk_names[i] && 

We already have more WARN_ON than we should in this driver,
I would just remove this condition entirely.

> +                       return -ENXIO;
> +       }
>         ret = devm_clk_bulk_get(&pdev->dev, vpu->variant->num_clocks,
>                                 vpu->clocks);
>         if (ret)
> @@ -791,7 +799,19 @@ static int hantro_probe(struct platform_device *pdev)
>                 if (!vpu->variant->irqs[i].handler)
>                         continue;
>  
> -               irq = platform_get_irq_byname(vpu->pdev, irq_name);
> +               /*
> +                * If the driver has a single IRQ, chances are there will be no
> +                * actual name in the DT bindings.
> +                */
> +               if (!irq_name) {
> +                       if (WARN_ON(i))
> +                               return -ENXIO;
> +
> +                       irq_name = "default";
> +                       irq = platform_get_irq(vpu->pdev, 0);
> +               } else {
> +                       irq = platform_get_irq_byname(vpu->pdev, irq_name);
> +               }

How about this instead:

irq = platform_get_irq_byname(vpu->pdev, irq_name);
if (irq <= 0)
	irq = platform_get_irq(vpu->pdev, i);

(and leave the irq name in the sama5d4 code).

Thanks,
Ezequiel

