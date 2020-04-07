Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0112A1A0D77
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 14:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbgDGMVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 08:21:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41290 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbgDGMVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 08:21:20 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C33159E;
        Tue,  7 Apr 2020 14:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586262077;
        bh=ccNWqTZBMcAMBu/tDHaT/nTS1utdy/HvpeGfWy7F6wE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oD1Jg3Tu+GArR9R2iri+k4MRwKhy9x4XUxz/P6UmD7HHZ42mE9skWot7T/lLdItZI
         YIzE7TY1JVVNjcHcLfKlwZS7MqbsMRd1UdFUbk9NRsXpIqLhWUqRwhrVAtk3jtbQL1
         3qDZaB9eWR/veW1hpqiebbXmNc0s9cT+bqBQ+l2Y=
Date:   Tue, 7 Apr 2020 15:21:06 +0300
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
Message-ID: <20200407122106.GD4751@pendragon.ideasonboard.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200406165108.GA7646@kekkonen.localdomain>
 <20200406173234.GD16885@pendragon.ideasonboard.com>
 <20200407062241.GA8883@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200407062241.GA8883@kekkonen.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Apr 07, 2020 at 09:22:41AM +0300, Sakari Ailus wrote:
> On Mon, Apr 06, 2020 at 08:32:34PM +0300, Laurent Pinchart wrote:
> > On Mon, Apr 06, 2020 at 07:51:08PM +0300, Sakari Ailus wrote:
> > > On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> > > > Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> > > > as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> > > > 24MHz. So instead making clock-frequency as dt-property just let the
> > > > driver enforce the required clock frequency.
> > > 
> > > Even if some current systems where the driver is used are using 24 MHz
> > > clock, that doesn't mean there wouldn't be systems using another frequency
> > > that the driver does not support right now.
> > > 
> > > The driver really should not set the frequency unless it gets it from DT,
> > > but I think the preferred means is to use assigned-clock-rates instead, and
> > > not to involve the driver with setting the frequency.
> > > 
> > > Otherwise we'll make it impossible to support other frequencies, at least
> > > without more or less random defaults.
> > 
> > We're running in circles here.
> > 
> > As the driver only supports 24MHz at the moment, the frequency should be
> > set by the driver, as it's a driver limitation. We can then work on
> > supporting additional frequencies, which will require DT to provide a
> > list of supported frequencies for the system, but that can be done on
> > top.
> 
> I guess it would be possible to use different external clock frequencies on
> a sensor in a given system but that seems to be a bit far fetched, to the
> extent I've never seen anyone doing that in practice.
> 
> Originally, the driver set the frequency based on the clock-frequency
> property. If we're removing that but use a fixed frequency instead, then
> how is that going to work going forward when someone adds support for other
> frequencies in the driver and has a system requiring that, while there are
> some other platforms relying on the driver setting a particular frequency?

The standard property for this is link-frequencies, not clock-frequency.
Deprecating clock-frequency now paves the way to use the standard
property later when/if someone implements support for additional
frequencies.

> Although, if you're saying that this driver only needs to work with DT that
> comes with the kernel and you don't care about DT binary compatibility,
> this would be fine.

I believe this series to not break backward compatibility, as the driver
only works with a 24MHz clock, so I expect all DTs to specify that.

-- 
Regards,

Laurent Pinchart
