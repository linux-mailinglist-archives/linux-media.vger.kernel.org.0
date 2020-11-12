Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7232B02AC
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 11:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgKLK00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 05:26:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbgKLK0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 05:26:25 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934FBC0613D1;
        Thu, 12 Nov 2020 02:26:25 -0800 (PST)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EAB10634C24;
        Thu, 12 Nov 2020 12:24:43 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kd9mX-0004Ki-4c; Thu, 12 Nov 2020 12:24:45 +0200
Date:   Thu, 12 Nov 2020 12:24:45 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20201112102444.GB6899@valkosipuli.retiisi.org.uk>
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
 <20201111011417.2275501-2-linus.walleij@linaro.org>
 <20201111113848.GX6899@valkosipuli.retiisi.org.uk>
 <CACRpkdYK+X==Xm3AfymV_HEaZHOvPS-LtCLKZXc2jmzV7KUZoQ@mail.gmail.com>
 <20201111165503.GZ6899@valkosipuli.retiisi.org.uk>
 <CACRpkdYvfxWE83O+4OAKx02kJK5XRBCLN0rFPjBYheQ65n4urA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYvfxWE83O+4OAKx02kJK5XRBCLN0rFPjBYheQ65n4urA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

On Wed, Nov 11, 2020 at 11:07:53PM +0100, Linus Walleij wrote:
> On Wed, Nov 11, 2020 at 5:56 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > On Wed, Nov 11, 2020 at 05:34:58PM +0100, Linus Walleij wrote:
> 
> > > The way I understand it is that this component contains its own
> > > current regulation electronic. You request a brightness
> > > between 1-100 and it will support this range (no external
> > > current boost). And as a user that is "all you need to know".
> > >
> > > Isn't this problem more prevalent when you have some kind of
> > > external current-regulator that you need to program?
> > >
> > > This component draws its power directly from VBAT (the main
> > > battery) so regulating how much of that it takes is up to the
> > > component.
> > >
> > > I could think of the component brightness being a problem if
> > > the flash is embedded in some kind of plastic that cannot
> > > take the heat though, but I haven't seen any code trying to
> > > hold it down for this reason. I suppose the component
> > > datasheet (that I don't have) specifies all these things...
> >
> > The LED is different from the LED driver. If you happen to have a LED with
> > smaller maximum current than the LED driver can provide, the software has
> > to limit the current the driver provides, or hardware damage will result.
> >
> > This is why virtually all flash LED drivers have these properties.
> 
> Hm you're right of course.
> 
> I did some research, the flash driver in the RT8515
> appears to be somewhat clever.
> 
> Here is a schematic picture from the LG P970 service
> manual where you can see the connections from the RT8515
> to the LED:
> https://dflund.se/~triad/images/rt8515.jpg
> 
> On this image you can see that there are two resistors connected
> from the pins "RFS" and "RTS" to ground.
> 
> RFS (resistance flash setting?) is 20 kOhm
> RTS (resistance torch setting?) is 39 kOhm
> 
> Some sleuthing finds us the RT9387A which we have a datasheet for:
> https://static5.arrow.com/pdfs/2014/7/27/8/21/12/794/rtt_/manual/94download_ds.jspprt9387a.jspprt9387a.pdf
> This apparently works the same way so now we have a
> RT9387A driver as well.
> 
> The two resistances control the max current for flash
> and torch, with I = 5500 / R, up to 700 mA.
> For 20 and 39 kOhm this means
> 
> ImaxFlash = 275 mA
> ImaxTorch = 141 mA
> 
> So the max current is actually hardwired into the
> circuit.

Nice; thanks for digging into this! Interesting indeed, I have to admit
I've only seen software limited implementations up to now.

So here it's indeed not necessary to know the limits to operate the device
safely, and the limits would (or could) remain for the user interface's
purpose only (from driver PoV).

> 
> The setting of brightness is done with the pulse train,
> but it is a PWM dimmer setting on top of the max
> current.
> 
> So I'll just put in these max currents (assuming they
> are using the same equation).

Sounds good.

I think it'd be nice to have the limits, but they could be optional --- it
might not be always possible to know them in general case. I wonder if
anyone else has thoughts on this.

Cc'ing also linux-media.

-- 
Kind regards,

Sakari Ailus
