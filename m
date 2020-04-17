Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCD01AD457
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 04:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgDQCJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 22:09:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46610 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728969AbgDQCJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 22:09:55 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 074C697D;
        Fri, 17 Apr 2020 04:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587089392;
        bh=aOJYR1rkQxzhPfNAEcrk20mLkVZECzCoRj7kVov3h0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hd+9RLdO3EIQiOjyOzIy3SGshr4Ot8mh0XQvXBVdxQdblIrY9LocV6mgBMEsq7mQj
         GFiH8t7FF/FgZp0G0wovnbPJEYSd0EyKD+0lmgVrWHcIQIloACo5iJSUXxmxL3c+/x
         LKMnXLpw7eBR/F4/bxhB022k91DSsdwgwrqC2TCE=
Date:   Fri, 17 Apr 2020 05:09:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency
 dt-property
Message-ID: <20200417020939.GI28162@pendragon.ideasonboard.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200406165108.GA7646@kekkonen.localdomain>
 <20200406173234.GD16885@pendragon.ideasonboard.com>
 <20200407062241.GA8883@kekkonen.localdomain>
 <20200407122106.GD4751@pendragon.ideasonboard.com>
 <20200407151401.GA5206@paasikivi.fi.intel.com>
 <20200414205552.GN19819@pendragon.ideasonboard.com>
 <20200415162722.GG27762@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415162722.GG27762@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 15, 2020 at 07:27:22PM +0300, Sakari Ailus wrote:
> On Tue, Apr 14, 2020 at 11:55:52PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 07, 2020 at 06:14:01PM +0300, Sakari Ailus wrote:
> >> On Tue, Apr 07, 2020 at 03:21:06PM +0300, Laurent Pinchart wrote:
> >>> On Tue, Apr 07, 2020 at 09:22:41AM +0300, Sakari Ailus wrote:
> >>>> On Mon, Apr 06, 2020 at 08:32:34PM +0300, Laurent Pinchart wrote:
> >>>>> On Mon, Apr 06, 2020 at 07:51:08PM +0300, Sakari Ailus wrote:
> >>>>>> On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> >>>>>>> Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> >>>>>>> as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> >>>>>>> 24MHz. So instead making clock-frequency as dt-property just let the
> >>>>>>> driver enforce the required clock frequency.
> >>>>>> 
> >>>>>> Even if some current systems where the driver is used are using 24 MHz
> >>>>>> clock, that doesn't mean there wouldn't be systems using another frequency
> >>>>>> that the driver does not support right now.
> >>>>>> 
> >>>>>> The driver really should not set the frequency unless it gets it from DT,
> >>>>>> but I think the preferred means is to use assigned-clock-rates instead, and
> >>>>>> not to involve the driver with setting the frequency.
> >>>>>> 
> >>>>>> Otherwise we'll make it impossible to support other frequencies, at least
> >>>>>> without more or less random defaults.
> >>>>> 
> >>>>> We're running in circles here.
> >>>>> 
> >>>>> As the driver only supports 24MHz at the moment, the frequency should be
> >>>>> set by the driver, as it's a driver limitation. We can then work on
> >>>>> supporting additional frequencies, which will require DT to provide a
> >>>>> list of supported frequencies for the system, but that can be done on
> >>>>> top.
> >>>> 
> >>>> I guess it would be possible to use different external clock frequencies on
> >>>> a sensor in a given system but that seems to be a bit far fetched, to the
> >>>> extent I've never seen anyone doing that in practice.
> >>>> 
> >>>> Originally, the driver set the frequency based on the clock-frequency
> >>>> property. If we're removing that but use a fixed frequency instead, then
> >>>> how is that going to work going forward when someone adds support for other
> >>>> frequencies in the driver and has a system requiring that, while there are
> >>>> some other platforms relying on the driver setting a particular frequency?
> >>> 
> >>> The standard property for this is link-frequencies, not clock-frequency.
> >>> Deprecating clock-frequency now paves the way to use the standard
> >>> property later when/if someone implements support for additional
> >>> frequencies.
> >> 
> >> The external clock frequency and link frequency are different indeed, but
> >> they are related. The link frequency has been selected in a way that it is
> >> possible to generate that exact frequency using the chosen external clock
> >> frequency. If you change the external clock frequency, chances are good
> >> there is no PLL configuration to generate that link frequency.
> > 
> > But aren't we supposed to pick the clock frequency based on the link
> > frequency specified in DT ?
> 
> No. In a general case there is no reliable way to come up with an external
> clock frequency based on another, different if related, frequency.
> 
> > In any case, this policy needs to be carefully documented.
> 
> I thought after ten or so years this would be already an established
> practice. :-)
> 
> I agree it should be documented. We don't seem to have specific
> documentation for camera sensor drivers at the moment. I can submit a
> patch...
> 
> >>>> Although, if you're saying that this driver only needs to work with DT that
> >>>> comes with the kernel and you don't care about DT binary compatibility,
> >>>> this would be fine.
> >>> 
> >>> I believe this series to not break backward compatibility, as the driver
> >>> only works with a 24MHz clock, so I expect all DTs to specify that.
> >> 
> >> What you're still doing here is defining the DT bindings based on the
> >> current driver implementation, not the device properties.
> > 
> > Quite the contrary, the device doesn't require any particular input
> > clock frequency, so we're removing that from DT :-) Specifying the clock
> > frequency in DT is in my opinion a manual workaround for not computing
> > it at runtime based on the desired link frequency, while the link
> > frequency is a property of the system as it specifies the range of link
> > frequencies that are safe to use from an EMC point of view.
> 
> The external clock frequency is significantly lower than the link frequency
> (usually), but it still comes out of the SoC (or a PMIC chip). The clock
> signal track on PCB as well as wiring may also be rather long, depending on
> where the camera sensor is --- quite possibly tens of centimetres.
> Therefore I wouldn't categorically rule out possible EMC issues with that
> one either.

That's a valid point.

> The bottom line is: use a known-good, safe frequency.

What if different input clock frequencies are needed to achieve
different link frequencies ?

-- 
Regards,

Laurent Pinchart
