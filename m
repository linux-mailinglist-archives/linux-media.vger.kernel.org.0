Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E44426A9F
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 14:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240689AbhJHMYs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Oct 2021 08:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhJHMYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 08:24:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3203C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 05:22:51 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYotl-0004Wb-Oh; Fri, 08 Oct 2021 14:22:49 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYotl-0007YE-1W; Fri, 08 Oct 2021 14:22:49 +0200
Message-ID: <b41a3863251d330d2bef2bd660e18d2bdba79102.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx-pxp: Initialize the spinlock prior to using
 it
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@denx.de>
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Date:   Fri, 08 Oct 2021 14:22:48 +0200
In-Reply-To: <20211007135601.2068291-1-festevam@denx.de>
References: <20211007135601.2068291-1-festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Thu, 2021-10-07 at 10:56 -0300, Fabio Estevam wrote:
> After devm_request_threaded_irq() is called there is a chance that an
> interrupt may occur before the spinlock is initialized, which will trigger
> a kernel oops.
>
> To prevent that, move the initialization of the spinlock prior to
> requesting the interrupts.
> 
> Fixes: 51abcf7fdb70 ("media: imx-pxp: add i.MX Pixel Pipeline driver")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/media/platform/imx-pxp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
> index acfc77f9d58f..7d1768ec7fcd 100644
> --- a/drivers/media/platform/imx-pxp.c
> +++ b/drivers/media/platform/imx-pxp.c
> @@ -1693,6 +1693,8 @@ static int pxp_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> +	spin_lock_init(&dev->irqlock);
> +
>  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
>  			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
>  	if (ret < 0) {
> @@ -1710,8 +1712,6 @@ static int pxp_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> -	spin_lock_init(&dev->irqlock);
> -
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret)
>  		goto err_clk;

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
