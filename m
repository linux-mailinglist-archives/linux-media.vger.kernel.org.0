Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2CC3A147B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 14:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhFIMdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 08:33:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42788 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhFIMdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 08:33:38 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9163B46E;
        Wed,  9 Jun 2021 14:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623241902;
        bh=f3y6p+1VcYPCa1VfHYSZBXe3O18eeGVJqcgkx9qYpHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KuXjBJ4d9t924KlrB+ggPBQK5TnAK7ByzkKlauB7I2gfeXqAmGe+gN2kckZK6yYFY
         +nP7iqTBaDnVu9tSt82pLj+EKsSaGAdt3n4dgXa79M/LGa+sLolzyLpy+uvQ+jlhet
         v+TLAe+4DUu+v+ivwcAloQ4zz9bRt0L3pb4W87nE=
Date:   Wed, 9 Jun 2021 15:31:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/28] media: ti-vpe: cal: remove wait when stopping
 camerarx
Message-ID: <YMC0nHUBBOtuH3YB@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-16-tomi.valkeinen@ideasonboard.com>
 <YHwqLSgwYmt9ZAOU@pendragon.ideasonboard.com>
 <9d6b96f4-cdb0-5820-965d-7135a926829f@ideasonboard.com>
 <YIn2Y/HpOPBKUzh/@pendragon.ideasonboard.com>
 <YLouK5I6b+YfQBgh@pendragon.ideasonboard.com>
 <95e7b3ee-4f61-40a8-3693-8884b9629f44@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <95e7b3ee-4f61-40a8-3693-8884b9629f44@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jun 07, 2021 at 01:41:07PM +0300, Tomi Valkeinen wrote:
> On 04/06/2021 16:44, Laurent Pinchart wrote:
> > On Thu, Apr 29, 2021 at 02:57:23AM +0300, Laurent Pinchart wrote:
> >> On Mon, Apr 19, 2021 at 02:29:20PM +0300, Tomi Valkeinen wrote:
> >>> On 18/04/2021 15:46, Laurent Pinchart wrote:
> >>>> On Mon, Apr 12, 2021 at 02:34:44PM +0300, Tomi Valkeinen wrote:
> >>>>> Asserting ComplexIO reset seems to affect the HW (ie. asserting reset
> >>>>> will break an active capture), but the RESET_DONE bit never changes to
> >>>>> "reset is ongoing" state. Thus we always get a timeout.
> >>>>>
> >>>>> Drop the wait, as it seems to achieve nothing.
> >>>>>
> >>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>> ---
> >>>>>    drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
> >>>>>    1 file changed, 2 insertions(+), 13 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >>>>> index 0354f311c5d2..245c601b992c 100644
> >>>>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> >>>>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >>>>> @@ -405,7 +405,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
> >>>>>    
> >>>>>    static void cal_camerarx_stop(struct cal_camerarx *phy)
> >>>>>    {
> >>>>> -	unsigned int i;
> >>>>>    	int ret;
> >>>>>    
> >>>>>    	cal_camerarx_ppi_disable(phy);
> >>>>> @@ -419,19 +418,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
> >>>>>    			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
> >>>>>    			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
> >>>>>    
> >>>>> -	/* Wait for power down completion */
> >>>>> -	for (i = 0; i < 10; i++) {
> >>>>> -		if (cal_read_field(phy->cal,
> >>>>> -				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
> >>>>> -				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
> >>>>> -		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
> >>>>
> >>>> Isn't this the wrong condition ? I would have expected
> >>>> CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED, not
> >>>> CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING. That could explain why
> >>>> you always get a timeout.
> >>>
> >>> No, I don't think so. The complexio reset is set active just before the
> >>> wait. So the reset status should show reset ongoing, until at some point
> >>> we release the reset (we do that when starting the PHY again).
> >>>
> >>> The TRM doesn't talk about this, though. So, I guess the status might go
> >>> to RESETONGOING for a very short time and back to RESETCOMPLETED before
> >>> the code can see the RESETONGOING. But I suspect the status just stays
> >>> at RESETCOMPLETED.
> >>
> >> The TRM is indeed not very clear. My understanding was that asserting
> >> RESET_CTRL initiates the reset, and RESET_DONE switches to 1 once the
> >> reset completes. There's however a note in the initialization sequence
> >> that states
> >>
> >> a. Deassert the CAMERARX reset:
> >> i. Set CAL_CSI2_COMPLEXIO_CFG_j[30] RESET_CTRL to 0x1.
> >> CAUTION
> >> For the CAL_CSI2_COMPLEXIO_CFG_j[29] RESET_DONE bit to be set to 0x1
> >> (reset completed), the external sensor must to be active and sending the
> >> MIPI HS BYTECLK (that is, RXBYTECLKHS clock).
> >>
> >> The RESET_DONE bit may thus only toggle when de-asserting the reset
> >> signal (by setting RESET_CTRL to 1). It would be useful to test that
> >> hypothesis by reading RESET_DONE just before setting RESET_CTRL to 1,
> >> and right after. I'd expect the values to be 0 and 1 respectively. If
> >> that's the case, then this patch is likely correct, so
> >>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >>
> >> The register macros are quite confusing by the way. We have
> >>
> >> #define CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK          BIT(30)
> >> #define CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL                       0
> >> #define CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL           1
> >>
> >> When reading the code, I thought
> >>
> >>          cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
> >>                          CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
> >>                          CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK)
> >>
> >> meant that we were setting the reset bit to 1. I would personally get
> >> rid of the _MASK suffixes for single bits, and use 0 and 1 in the code
> >> instead of CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL and
> >> CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL.
> > 
> > Do you think this would be a good idea ? It can be done in a follow-up
> > patch.
> 
> I'd rather keep the MASK prefix as it's used for multiple bit masks too.
> 
> I think the problem here is the define for 0. The define should tell 
> what the bit value does, but here it's just the field name. The value 
> defines could perhaps be:
> 
> #define CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_ASSERT           0
> #define CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_DEASSERT         1
> 
> Using just 0 or 1 may work fine at times, but often you don't know what 
> they mean. You set 1 to RESET_CTRL. Does it put the IP into reset? Or 
> release the reset?

I have a small preference for dropping _MASK for single bits, but the
above is fine with me too, it's entirely up to you.

> Some other bits in cal_regs.h are fine, like:
> 
> #define CAL_CTRL_PWRSCPCLK_MASK			BIT(21)
> #define CAL_CTRL_PWRSCPCLK_AUTO				0
> #define CAL_CTRL_PWRSCPCLK_FORCE			1
> 
> But some have this same issue:
> 
> #define CAL_CTRL_POSTED_WRITES_MASK		BIT(0)
> #define CAL_CTRL_POSTED_WRITES_NONPOSTED		0
> #define CAL_CTRL_POSTED_WRITES				1

-- 
Regards,

Laurent Pinchart
