Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A584286C1
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 08:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhJKGWh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 Oct 2021 02:22:37 -0400
Received: from ni.piap.pl ([195.187.100.5]:54960 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233802AbhJKGWh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 02:22:37 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu> <m3zgrlkxn6.fsf@t19.piap.pl>
        <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
Date:   Mon, 11 Oct 2021 08:20:32 +0200
In-Reply-To: <20211009090749.hujuwamgkjw2tfcx@uno.localdomain> (Jacopo Mondi's
        message of "Sat, 9 Oct 2021 11:07:49 +0200")
Message-ID: <m3v924krpr.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your input.

Jacopo Mondi <jacopo@jmondi.org> writes:

> To my understanding the C99 standard added support for the //
> commenting style and tollerate them, but they're still from C++

Sure. Not everything coming from C++ is bad.

> and I
> see very few places where they're used in the kernel,

It's not going to change if no one uses //.

> and per as far I
> know they're still not allowed by the coding style
> https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

As Randy wrote, perhaps we need to bring the coding-style up to date?

> Looking at how you used comments in the driver I think you could get
> rid of most // comments easily, the register tables might be an
> exception but I would really try to remove them from there as well.

I could. The question is "why?" IMHO the C++ style is (in places I use
it) better than the /* */. Why should I use the worse thing?

> In my personal opinion lifting that restriction caused more pain than
> anything, as different subsystem are now imposing different
> requirements.

I think it was always the restriction causing more harm than good.
It's not like the "spirit" behind it was wrong - no. The oversided lines
SHOULD be avoided. It was the hard limit which was wrong: a) the limit
itself (80) was definitely inadequate, and b) the hard limit should have
never existed. 8-character tabs only made this worse (e.g. I use 4-chars
tabs outside the kernel).

This is all about readability, right? Hard rules don't play well with
it.

Things like:
                                       fst_tx_dma(card,
                                                   card->tx_dma_handle_card,
                                                   BUF_OFFSET(txBuffer[pi]
                                                              [port->txpos][0]),
                                                   skb->len);
Is this better, isn't it?
However I do realize my opinion may be a bit distorted since I have some
vision problems.

> 	ret = ar0521_write_regs(sensor, pixel_timing_recommended, ARRAY_SIZE(pixel_timing_recommended));
> 	if (ret)
> 		goto off;
>
>
> should be
>
> 	ret = ar0521_write_regs(sensor, pixel_timing_recommended,
>                                 ARRAY_SIZE(pixel_timing_recommended));
> 	if (ret)
> 		goto off;

Do you consider the second one BETTER? I definitely don't (though it
this case the difference is small). If it's worse, why should I use it?

Also, in such cases I try to align the arguments (ARRAY_SIZE right below
sensor). Still IMHO worse than #1.

> if you go over 100 you should ask yourself what are you doing :)

I do. Sometimes the answer is I'm doing the right thing :-)
And sometimes I change the code. You won't see it because it's already
changed.

> The sensor frame rate is configured by userspace by changing the
> blankings through the V4L2_CID_[VH]BLANK.
>
> You are right the current definition is akward to work with, as there
> is no way to set the 'total pixels' like you have suggested, but it's
> rather userspace that knowing the desired total sizes has to compute
> the blankings by subtracting the visible sizes (plus the mandatory min
> blanking sizes).

But it can't do that, can it?
This could be adequate for a sensor with fixed pixel clock. Here we can
control pixel clocks at will, how is the driver going to know what pixel
clock should it use? Also, the "extra delay" can't be set with
V4L2_CID_[VH]BLANK, it needs interval-based timings or the "total pixel"
or something alike.
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
