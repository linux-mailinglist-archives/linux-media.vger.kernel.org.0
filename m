Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49993E2C4B
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 16:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbhHFOOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 10:14:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47552 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237233AbhHFOOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 10:14:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D545C1F44A85
Message-ID: <79673df0562db410753c90f9957125f202c5a1b2.camel@collabora.com>
Subject: Re: [PATCH] media: hantro: Fix check for single irq
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, emil.velikov@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Fri, 06 Aug 2021 11:13:46 -0300
In-Reply-To: <8101406.vZ8PxZ7URt@jernej-laptop>
References: <20210805190416.332563-1-jernej.skrabec@gmail.com>
         <6761bb11f4554e9f9cbe468b5ff8f851c57515ef.camel@collabora.com>
         <8101406.vZ8PxZ7URt@jernej-laptop>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-08-06 at 06:44 +0200, Jernej Škrabec wrote:
> Dne petek, 06. avgust 2021 ob 00:03:36 CEST je Ezequiel Garcia napisal(a):
> > Hi Jernej,
> > 
> > On Thu, 2021-08-05 at 21:04 +0200, Jernej Skrabec wrote:
> > > Some cores use only one interrupt and in such case interrupt name in DT
> > > is not needed. Driver supposedly accounted that, but due to the wrong
> > > field check it never worked. Fix that.
> > > 
> > > Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single
> > > irq/clk") Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/staging/media/hantro/hantro_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/hantro/hantro_drv.c
> > > b/drivers/staging/media/hantro/hantro_drv.c index
> > > 8a2edd67f2c6..20e508158871 100644
> > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > @@ -919,7 +919,7 @@ static int hantro_probe(struct platform_device *pdev)
> > >                 if (!vpu->variant->irqs[i].handler)
> > >                         continue;
> > >  
> > > -               if (vpu->variant->num_clocks > 1) {
> > > +               if (vpu->variant->num_irqs > 1) {
> > 
> > Oops, thanks for spotting this.
> > 
> > How about this instead?
> 
> No, original solution is more robust. With solution below, you're assuming 
> that irq order in driver array is same as in DT. That doesn't matter if there 
> is only one name or if names match. However, if there is a typo, either in DT 
> node or in driver, driver will still happily assign clock based on index and 
> that might not be correct one. Even if it works out, you can easily miss that 
> you have a typo. Driver doesn't tell you which irq is used, if it is 
> successfully acquired.
> 

I find it odd to iterate up to num_irqs but then
have a case for num_irqs == 1, and call
platform_get_irq(vpu->pdev, 0).

But OTOH, your fix is correct and it's a oneliner.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

