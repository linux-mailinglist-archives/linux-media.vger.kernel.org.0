Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2280966845C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 21:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240368AbjALUxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 15:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbjALUwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 15:52:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2422A63F62
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 12:25:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91357492;
        Thu, 12 Jan 2023 21:25:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673555145;
        bh=b/MKzjvHiAkB9bOcnDqY5VhGe905xGJNDuP2NCcuvEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i4F92MTwe9kEKlepbqF3Oj8O2A1blBTc9uKC6MmzeDB5KqT66NAvdmbVOFKTCsmsj
         xN9L2MsPTs3qYn7YmLDebfRyCGcANXFuidCwuRzO4vJXYwHkd1TY2S9E6o0ta04cFE
         B/qNBoX7rOJuhYuSgpJyQuQrr/xWtgFFoq17NObM=
Date:   Thu, 12 Jan 2023 22:25:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-imx@nxp.com
Subject: Re: [PATCH v2 7/7] media: imx-pxp: Use non-threaded IRQ
Message-ID: <Y8BsyPDHUFkDquYy@pendragon.ideasonboard.com>
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
 <20230112172507.30579-8-laurent.pinchart@ideasonboard.com>
 <1cb7c14119958f0cf17fcd527a319b6e2c6e8f0d.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cb7c14119958f0cf17fcd527a319b6e2c6e8f0d.camel@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 12, 2023 at 06:34:36PM +0100, Lucas Stach wrote:
> Am Donnerstag, dem 12.01.2023 um 19:25 +0200 schrieb Laurent Pinchart:
> > There's no need to use threaded IRQs with the PXP, as the interrupt
> > handler doesn't need to sleep and doesn't perform any time-consuming
> > operation. Switch to regular IRQ handler.
> > 
> > This fixes lockups of the PXP noticed on i.MX7, where the PXP would stop
> > generating interrupts after a variable number of frames (from a few
> > dozens to a few hundreds). The root cause is however unknown.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/media/platform/nxp/imx-pxp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> > index aaafaf37439c..472907956145 100644
> > --- a/drivers/media/platform/nxp/imx-pxp.c
> > +++ b/drivers/media/platform/nxp/imx-pxp.c
> > @@ -1812,8 +1812,8 @@ static int pxp_probe(struct platform_device *pdev)
> >  
> >  	spin_lock_init(&dev->irqlock);
> >  
> > -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
> > -			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
> > +	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler,
> > +			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev), dev);
> 
> Why does this explicitly configure the IRQ as active high? Those flags
> should normally be set via DT and only overridden by the driver if
> there is a very good reason to do so.

Indeed, I'm not sure why I had this. I'll drop the flag.

> >  	if (ret < 0) {
> >  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> >  		return ret;

-- 
Regards,

Laurent Pinchart
