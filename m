Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9223A3E1E47
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 00:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhHEWED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 18:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhHEWEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 18:04:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53554C0613D5;
        Thu,  5 Aug 2021 15:03:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 873A21F44331
Message-ID: <6761bb11f4554e9f9cbe468b5ff8f851c57515ef.camel@collabora.com>
Subject: Re: [PATCH] media: hantro: Fix check for single irq
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>, p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, emil.velikov@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Thu, 05 Aug 2021 19:03:36 -0300
In-Reply-To: <20210805190416.332563-1-jernej.skrabec@gmail.com>
References: <20210805190416.332563-1-jernej.skrabec@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Thu, 2021-08-05 at 21:04 +0200, Jernej Skrabec wrote:
> Some cores use only one interrupt and in such case interrupt name in DT
> is not needed. Driver supposedly accounted that, but due to the wrong
> field check it never worked. Fix that.
> 
> Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single irq/clk")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 8a2edd67f2c6..20e508158871 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -919,7 +919,7 @@ static int hantro_probe(struct platform_device *pdev)
>                 if (!vpu->variant->irqs[i].handler)
>                         continue;
>  
> -               if (vpu->variant->num_clocks > 1) {
> +               if (vpu->variant->num_irqs > 1) {

Oops, thanks for spotting this.
 
How about this instead?

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 31d8449ca1d2..af7054b04155 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -918,16 +918,15 @@ static int hantro_probe(struct platform_device *pdev)
                if (!vpu->variant->irqs[i].handler)
                        continue;
 
-               if (vpu->variant->num_clocks > 1) {
-                       irq_name = vpu->variant->irqs[i].name;
-                       irq = platform_get_irq_byname(vpu->pdev, irq_name);
-               } else {
+               irq_name = vpu->variant->irqs[i].name;
+               irq = platform_get_irq_byname(vpu->pdev, irq_name);
+               if (irq <= 0) {
                        /*
-                        * If the driver has a single IRQ, chances are there
-                        * will be no actual name in the DT bindings.
+                        * Missing interrupt-names property in device tree,
+                        * looking up interrupts by index.
                         */
                        irq_name = "default";
-                       irq = platform_get_irq(vpu->pdev, 0);
+                       irq = platform_get_irq(vpu->pdev, i);
                }
                if (irq <= 0)
                        return -ENXIO;



-- 
Kindly,
Ezequiel

