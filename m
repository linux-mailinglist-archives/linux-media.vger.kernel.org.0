Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0362C3329
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 22:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732863AbgKXVkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 16:40:09 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44799 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbgKXVkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 16:40:09 -0500
X-Originating-IP: 87.16.255.135
Received: from uno.localdomain (host-87-16-255-135.retail.telecomitalia.it [87.16.255.135])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id ADB47C0005;
        Tue, 24 Nov 2020 21:40:03 +0000 (UTC)
Date:   Tue, 24 Nov 2020 22:40:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rcar-vin: Mask VNCSI_IFMD register
Message-ID: <20201124214008.xnsnhaglrjjcd7ud@uno.localdomain>
References: <20201116110428.27338-1-jacopo+renesas@jmondi.org>
 <20201116110428.27338-3-jacopo+renesas@jmondi.org>
 <20201123153124.GC1773213@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123153124.GC1773213@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Nov 23, 2020 at 04:31:24PM +0100, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2020-11-16 12:04:28 +0100, Jacopo Mondi wrote:
> > The VNCSI_IFMD register controls the data expansion mode and the
> > channel routing between the CSI-2 receivers and VIN instances.
> >
> > According to the chip manual revision 2.20 not all fields are available
> > for all the SoCs:
> > - V3M, V3H and E3 do not support the DES1 field has they do not feature
> >   a CSI20 receiver.
> > - D3 only supports parallel input, and the whole register shall always
> >   be written as 0.
> >
> > Inspect the per-SoC channel routing table where the available CSI-2
> > instances are reported and configure VNCSI_IFMD accordingly.
> >
> > This patch upports the BSP change commit f54697394457
> > ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990")
>
> I really like this approach, nice work.
>

I'm happy you like it, almost like you suggested it in first place,
right ? :)

> >
> > Suggested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 26 +++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 378514a75bc2..ab6818b34e5a 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -1570,7 +1570,9 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
> >   */
> >  int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
> >  {
> > -	u32 ifmd, vnmc;
> > +	const struct rvin_group_route *route;
> > +	u32 ifmd = 0;
> > +	u32 vnmc;
> >  	int ret;
> >
> >  	ret = pm_runtime_get_sync(vin->dev);
> > @@ -1583,9 +1585,27 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
> >  	vnmc = rvin_read(vin, VNMC_REG);
> >  	rvin_write(vin, vnmc & ~VNMC_VUP, VNMC_REG);
> >
> > -	ifmd = VNCSI_IFMD_DES1 | VNCSI_IFMD_DES0 | VNCSI_IFMD_CSI_CHSEL(chsel);
> > +	/*
> > +	 * Set data expansion mode to "pad with 0s" by inspecting the routes
> > +	 * table to find out which bit fields are available in the IFMD
> > +	 * register. IFMD_DES1 controls data expansion mode for CSI20/21,
> > +	 * IFMD_DES0 controls data expansion mode for CSI40/41.
> > +	 */
> > +	for (route = vin->info->routes; route->mask; route++) {
> > +		/* CSI21 is only available in r8a7795es1 and not documented. */
>
> I would drop this comment as we do not know what will happen in future
> SoCs.
>
> > +		if (route->csi == RVIN_CSI20 || route->csi == RVIN_CSI21)
> > +			ifmd |= VNCSI_IFMD_DES1;
> > +		else
> > +			ifmd |= VNCSI_IFMD_DES0;
> >
> > -	rvin_write(vin, ifmd, VNCSI_IFMD_REG);
> > +		/* If both have been set stop looping. */
> > +		if (ifmd == (VNCSI_IFMD_DES0 | VNCSI_IFMD_DES1))
> > +			break;
>
> I would remove the comment here as I think the code is quiet self
> explanatory and reading the comment made me think I was missing
> something obvious ;-)
>

Correct, I'm breaking the first rule of avoiding superfluous comments.

> > +	}
>
> Missing blank line.

Was kind of intentional, but I can add one

>
> With these small nits fixed,
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks
  j

>
> > +	if (ifmd) {
> > +		ifmd |= VNCSI_IFMD_CSI_CHSEL(chsel);
> > +		rvin_write(vin, ifmd, VNCSI_IFMD_REG);
> > +	}
> >
> >  	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
> >
> > --
> > 2.29.1
> >
>
> --
> Regards,
> Niklas Söderlund
