Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5453D667D84
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 19:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240213AbjALSH0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Jan 2023 13:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238976AbjALSGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 13:06:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B834260D6
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 09:34:39 -0800 (PST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1pG1TJ-0001Aq-WB; Thu, 12 Jan 2023 18:34:38 +0100
Message-ID: <1cb7c14119958f0cf17fcd527a319b6e2c6e8f0d.camel@pengutronix.de>
Subject: Re: [PATCH v2 7/7] media: imx-pxp: Use non-threaded IRQ
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-imx@nxp.com
Date:   Thu, 12 Jan 2023 18:34:36 +0100
In-Reply-To: <20230112172507.30579-8-laurent.pinchart@ideasonboard.com>
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
         <20230112172507.30579-8-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, dem 12.01.2023 um 19:25 +0200 schrieb Laurent Pinchart:
> There's no need to use threaded IRQs with the PXP, as the interrupt
> handler doesn't need to sleep and doesn't perform any time-consuming
> operation. Switch to regular IRQ handler.
> 
> This fixes lockups of the PXP noticed on i.MX7, where the PXP would stop
> generating interrupts after a variable number of frames (from a few
> dozens to a few hundreds). The root cause is however unknown.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index aaafaf37439c..472907956145 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1812,8 +1812,8 @@ static int pxp_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&dev->irqlock);
>  
> -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
> -			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
> +	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler,
> +			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev), dev);

Why does this explicitly configure the IRQ as active high? Those flags
should normally be set via DT and only overridden by the driver if
there is a very good reason to do so.

Regards,
Lucas

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>  		return ret;

