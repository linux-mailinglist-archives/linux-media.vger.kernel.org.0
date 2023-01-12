Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D65486676E6
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 15:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbjALOh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 09:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239078AbjALOhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 09:37:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A43619C0C
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 06:27:27 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pFyY9-0007as-FW; Thu, 12 Jan 2023 15:27:25 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pFyY9-0001ZK-2o; Thu, 12 Jan 2023 15:27:25 +0100
Date:   Thu, 12 Jan 2023 15:27:25 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v1 6/6] media: imx-pxp: Use non-threaded IRQ
Message-ID: <20230112142725.GS24101@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        kernel@pengutronix.de, linux-imx@nxp.com
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
 <20230106133227.13685-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106133227.13685-7-laurent.pinchart@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 06 Jan 2023 15:32:27 +0200, Laurent Pinchart wrote:
> There's no need to use threaded IRQs with the PXP, as the interrupt
> handler doesn't need to sleep and doesn't perform any time-consuming
> operation. Switch to regular IRQ handler.
> 
> This fixes lockups of the PXP noticed on i.MX7, where the PXP would stop
> generating interrupts after a variable number of frames (from a few
> dozens to a few hundreds). The root cause is however unknown.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/nxp/imx-pxp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index e4d7a6339929..28a222c8fe86 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1814,8 +1814,8 @@ static int pxp_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&dev->irqlock);
>  
> -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
> -			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
> +	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler,
> +			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev), dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>  		return ret;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
