Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662C94286D9
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbhJKGdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 02:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhJKGdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 02:33:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B642CC061570;
        Sun, 10 Oct 2021 23:31:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC2DB2BD;
        Mon, 11 Oct 2021 08:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633933895;
        bh=NZEWtQSQNMfMfU0P9SAiyUbuKJVmjgo9nSzOUAPZHkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qr8TJWxwC1hjcQd6r4aghWFqpkqA2EgAutnW0jZF8zFrKkk6e5muJbaMI9nMYMOcn
         y9s+bb/3JrwtW6X07khCZSxlrI8MJ62YlsxACrtJuCVPfXGzgjcvMosEf8xJbzClLK
         gGCcx2oz3BQhzNWf1gigVrZPvRYJMVaDxEenrkvE=
Date:   Mon, 11 Oct 2021 09:31:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <YWPaOjbBZ0wmJHHM@pendragon.ideasonboard.com>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu>
 <m3zgrlkxn6.fsf@t19.piap.pl>
 <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
 <m3v924krpr.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3v924krpr.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Mon, Oct 11, 2021 at 08:20:32AM +0200, Krzysztof Hałasa wrote:
> Hi Jacopo,
> 
> Thanks for your input.
> 
> Jacopo Mondi <jacopo@jmondi.org> writes:
> 
> > To my understanding the C99 standard added support for the //
> > commenting style and tollerate them, but they're still from C++
> 
> Sure. Not everything coming from C++ is bad.
> 
> > and I
> > see very few places where they're used in the kernel,
> 
> It's not going to change if no one uses //.
> 
> > and per as far I
> > know they're still not allowed by the coding style
> > https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
> 
> As Randy wrote, perhaps we need to bring the coding-style up to date?
> 
> > Looking at how you used comments in the driver I think you could get
> > rid of most // comments easily, the register tables might be an
> > exception but I would really try to remove them from there as well.
> 
> I could. The question is "why?" IMHO the C++ style is (in places I use
> it) better than the /* */. Why should I use the worse thing?

It's also a matter of consistency, to try and unify the coding style
across similar drivers in a subsytem. In this case, the media system
frowns upon C++-style comments.

> > In my personal opinion lifting that restriction caused more pain than
> > anything, as different subsystem are now imposing different
> > requirements.
> 
> I think it was always the restriction causing more harm than good.
> It's not like the "spirit" behind it was wrong - no. The oversided lines
> SHOULD be avoided. It was the hard limit which was wrong: a) the limit
> itself (80) was definitely inadequate, and b) the hard limit should have
> never existed. 8-character tabs only made this worse (e.g. I use 4-chars
> tabs outside the kernel).
> 
> This is all about readability, right? Hard rules don't play well with
> it.
> 
> Things like:
>                                        fst_tx_dma(card,
>                                                    card->tx_dma_handle_card,
>                                                    BUF_OFFSET(txBuffer[pi]
>                                                               [port->txpos][0]),
>                                                    skb->len);
> Is this better, isn't it?
> However I do realize my opinion may be a bit distorted since I have some
> vision problems.
> 
> > 	ret = ar0521_write_regs(sensor, pixel_timing_recommended, ARRAY_SIZE(pixel_timing_recommended));
> > 	if (ret)
> > 		goto off;
> >
> >
> > should be
> >
> > 	ret = ar0521_write_regs(sensor, pixel_timing_recommended,
> >                                 ARRAY_SIZE(pixel_timing_recommended));
> > 	if (ret)
> > 		goto off;
> 
> Do you consider the second one BETTER? I definitely don't (though it
> this case the difference is small). If it's worse, why should I use it?

I find the second option much more readable, yes.

Code is written once and read often, so you should consider the coding
style in use in the subsystem.

> Also, in such cases I try to align the arguments (ARRAY_SIZE right below
> sensor). Still IMHO worse than #1.
> 
> > if you go over 100 you should ask yourself what are you doing :)
> 
> I do. Sometimes the answer is I'm doing the right thing :-)
> And sometimes I change the code. You won't see it because it's already
> changed.
> 
> > The sensor frame rate is configured by userspace by changing the
> > blankings through the V4L2_CID_[VH]BLANK.
> >
> > You are right the current definition is akward to work with, as there
> > is no way to set the 'total pixels' like you have suggested, but it's
> > rather userspace that knowing the desired total sizes has to compute
> > the blankings by subtracting the visible sizes (plus the mandatory min
> > blanking sizes).
> 
> But it can't do that, can it?
> This could be adequate for a sensor with fixed pixel clock. Here we can
> control pixel clocks at will, how is the driver going to know what pixel
> clock should it use? Also, the "extra delay" can't be set with
> V4L2_CID_[VH]BLANK, it needs interval-based timings or the "total pixel"
> or something alike.

Additional controls may be needed, I haven't studied this particular
sensor in details, but in general frame rate is controlled explicitly
through low-level parameters for raw sensors, which means controlling
h/v blank and possibly the pixel clock from userspace. The
.g_frame_interval() and .s_frame_interval() operations are deprecated
(and should never have been used) for raw sensors.

-- 
Regards,

Laurent Pinchart
