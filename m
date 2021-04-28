Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CB636E23D
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 01:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhD1Xoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 19:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhD1Xoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 19:44:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369A2C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 16:44:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD5A1DA8;
        Thu, 29 Apr 2021 01:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619653447;
        bh=kb2fBlGb9O+0WUWDjOswKfY60IIPrLTNpuFe73Cy1m4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ju2KmsilIbmndFDNLt+ggK2IdEfHWKYUkXhKPT4wZjzP5hXfn6Pz0nAKx1IAmL+dE
         HzrXlZoLdnkI2CkcrBuiPq7QKfGBxXbN8bOltYFwGS3WJkHu5pIShcb8wEJNNBAJB9
         P6WGQZi4BJYIj/Xnr0CC1X3f6JQ1ZSwTV3mAdp7E=
Date:   Thu, 29 Apr 2021 02:44:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/28] media: ti-vpe: cal: catch VC errors
Message-ID: <YInzQTnAknPWN5RN@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-15-tomi.valkeinen@ideasonboard.com>
 <YHwoTIhbLtKoD+6F@pendragon.ideasonboard.com>
 <0e4bcb84-8acf-2bb2-85be-fb96599b3c3c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e4bcb84-8acf-2bb2-85be-fb96599b3c3c@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Apr 19, 2021 at 02:19:01PM +0300, Tomi Valkeinen wrote:
> On 18/04/2021 15:38, Laurent Pinchart wrote:
> > On Mon, Apr 12, 2021 at 02:34:43PM +0300, Tomi Valkeinen wrote:
> >> CAL driver currently ignores VC related errors. To help catch error
> >> conditions, enable all the VC error interrupts and handle them in the
> >> interrupt handler by printing an error.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal-camerarx.c | 23 ++++++++++++++++----
> >>   drivers/media/platform/ti-vpe/cal.c          |  9 ++++++++
> >>   2 files changed, 28 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> index 974fcbb19547..0354f311c5d2 100644
> >> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> @@ -226,24 +226,39 @@ static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
> >>   		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
> >>   		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
> >>   		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
> >> -
> >> -	/* Enable CIO error IRQs. */
> >> +	const u32 vc_err_mask =
> >> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(0) |
> >> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(1) |
> >> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(2) |
> >> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(3) |
> >> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(0) |
> >> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(1) |
> >> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(2) |
> >> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(3);
> >> +
> >> +	/* Enable CIO & VC error IRQs. */
> >>   	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
> >> -		  CAL_HL_IRQ_CIO_MASK(phy->instance));
> >> +		  CAL_HL_IRQ_CIO_MASK(phy->instance) | CAL_HL_IRQ_VC_MASK(phy->instance));
> > 
> > Line wrap ? Same in multiple places below. I know there's no strict 80
> > columns limit anymore, but I don't think longer lines help with
> > readability in this patch (not to mention the coding style inconsistency
> > with the rest of the driver).
> 
> Well, I disagree, but I guess that's in the eye of the beholder.
> 
> If we have a coding style with strict 80 column limit, then there are 
> other places I need to start fixing too. My personal coding style is 
> such that around 80 columns I start thinking about splitting if it can 
> be done without any messiness, around 100 I seriously try to split it, 
> and around 120 I think it's broken.

It then all depends on your messiness gauge :-) For the code above,

 	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
		  CAL_HL_IRQ_CIO_MASK(phy->instance) |
		  CAL_HL_IRQ_VC_MASK(phy->instance));

doesn't seem messy at all to me (quite the contrary actually).

> I can change this and the other similar line, the end result is only 
> slightly messier, but...
> 
> >> +
> >> +			if (status & CAL_HL_IRQ_VC_MASK(i)) {
> >> +				u32 vc_stat = cal_read(cal, CAL_CSI2_VC_IRQSTATUS(i));
> >> +
> >> +				dev_err_ratelimited(cal->dev,
> >> +						    "CIO%u VC error: %#08x\n", i, vc_stat);
> >> +
> >> +				cal_write(cal, CAL_CSI2_VC_IRQSTATUS(i), vc_stat);
> >> +			}
> 
> ...especially for this part sticking to 80 columns uglifies the code.
> 
> u32 vc_stat =
> 	cal_read(cal,
> 		 CAL_CSI2_VC_IRQSTATUS(i));
> 
> or
> 
> u32 cio_stat = cal_read(cal,
> 	CAL_CSI2_COMPLEXIO_IRQSTATUS(i));

That would be messy, and I think it should either stay as-is, or the
function should be refactored with code broken out in multiple functions
(probably overkill for this specific example).

The next line, however, I would have written as

				dev_err_ratelimited(cal->dev,
						    "CIO%u VC error: %#08x\n",
						    i, vc_stat);

> I could split parts to a separate function, but I don't think the end 
> result would be better.
> 
> I think we discuss the 80-column problem almost in every series. Maybe 
> we need to agree to some clear predefined rules to avoid future 
> discussions about this? =)

So all we need is a metric that measure code mess, right ? :-)

-- 
Regards,

Laurent Pinchart
