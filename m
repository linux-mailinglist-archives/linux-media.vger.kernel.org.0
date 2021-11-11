Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867DD44D993
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhKKPyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbhKKPyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:54:18 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E72FC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 07:51:29 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id az33-20020a05600c602100b00333472fef04so6876206wmb.5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 07:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q9fpzcjJOliiClFHyEfNex98ZSc6ufkk4IN4tLlM1To=;
        b=a+GjUURELtjY4tL3TIcfPO9KmfzySKBnpwL2jSFEhieFlp2ULJkAY9dOg+PFE1gWs9
         8+EhbGFkmQLZyu/lOb6n01pi9w5izrrDuLch0Bstlw+DN9wBEK/jlKsClpsZWH/CqMKs
         3EzQx5gAeAIjHpK4KVwO/erfFz6GSNjjk/pOzc2dPLnNbmWvQyquj6LlO/iIN5jlEhJ2
         YM/lwFvcmttifwOWXq4eKgmLgBkwxTAfW4ugDVZIgzYte4jgydgTDDUqF6cpa3VpXECm
         SjujRrSWL2V3tDGR/qZofpQXpwSeiLP+a0c76NeDDUlBIyb3934Yz55wtrB7Il6zKTBR
         UJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q9fpzcjJOliiClFHyEfNex98ZSc6ufkk4IN4tLlM1To=;
        b=WiQV5ukbY+HcOUT+uR/wEYgXgYCdh/0gIb7+ptnskHtVOGohSFC1uN5+HYA+5KUe2p
         n2EidF1ArHs+7UgpHf3BUep5gb5cez1fQbTMaWZw0nGjVOyPl2BTBoHmkaDweWICpkSP
         Ok3HO703KLQ1eo95y0xIhmH19r7pv6PoBjk3s4L5ZUiQHlnrJrMyFkK3zc+q9p1aooAr
         LiMoqcH0zuViK7Erg1EylTP37jB6p6BZwIBLJIrj0Qmywh9jFe1MlfL58mK23Or5iJUq
         wdnQXus+1oV4grIRfXj19OrDacwxdEXLZXcNYT1fGYG+g+36uKpnLyPt34vVyvj6hWPH
         9AVw==
X-Gm-Message-State: AOAM532EvOYg6CEIFzRAag9MiC+V+322AnsoH9FiLN6i7+YHFJeBuFGx
        xAVuzpvB55Dua0w2fVPMT0vnFkxsW28PlKX0FbsElA==
X-Google-Smtp-Source: ABdhPJyzthmxzmtXBc09CEqbgaJtIYxWX3pGcb2I0MHuxnkg0O8lIMzFUZ6eHk8B0OKkwGCxw0tGGlIEAjLqKT7B+T4=
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr26732161wmh.106.1636645887851;
 Thu, 11 Nov 2021 07:51:27 -0800 (PST)
MIME-Version: 1.0
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com> <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com> <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com> <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com> <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com> <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com> <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
In-Reply-To: <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 11 Nov 2021 15:51:11 +0000
Message-ID: <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass acpi_enforce_resources=lax
 on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, 11 Nov 2021 at 15:23, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/11/21 12:18, Daniel Scally wrote:
>
> <snip>
>
> >>> One problem I'm experiencing
> >>> is that the focus position I set isn't maintained; it holds for a couple
> >>> of seconds and then resets to the "normal" focus...this happens when the
> >>> .close() callback for the driver is called, which happens right after
> >>> the control value is applied. All the other VCM drivers in the kernel
> >>> power down on .close() so I did the same>
> >> Right, I believe that this is fine though, we expect people to use
> >> libcamera with this and once libcamera gets autofocus support, then
> >> I would expect libcamera to keep the fd open the entire time while
> >> streaming.
> >
> >
> > OK - as long as that's how it works then I agree that this is fine as is
> > yes.
>
> So I've just picked up an old project of mine, called gtk-v4l which
> is a nice simply v4l2 controls applet and patches it up to also
> work on v4l-subdevs:
>
> https://github.com/jwrdegoede/gtk-v4l/
>
> So now you can run:
>
> sudo gtk-v4l -d /dev/v4l-subdev8
>
> And it will give you a slider to control the focus; and as
> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> issue :)

Do the lens and sensor share a regulator / enable GPIO?

I was looking at the same issue for a Sony IMX135 module with AD5398
VCM driver [1].
In my case they do share an enable GPIO, so using regulator-gpio we
can register via regulator_register_notifier for information on when
the regulator is powered up. It can then also reset to the last
position should the sensor subdev enable the regulator without the
lens driver being opened at all.

I don't know if that helps in your case.

 Dave

[1] https://github.com/6by9/linux/commit/e15e712e8c17afe03f121540178371ce2a8a7922
on branch https://github.com/6by9/linux/commits/rpi-5.10.y-imx135

> >> What is necessary is some way for libcamera to:
> >>
> >> 1. See if there is a VCM which belongs to the sensor; and
> >> 2. If there is a VCM figure out which v4l2-subdev it is.
> >>
> >> Also see this email thread, where Hans Verkuil came to the
> >> conclusion that this info is currently missing from the MC
> >> representation (link is to the conclusion):
> >>
> >> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html
> >
> >
> > Yeah I read through that thread too, and had a brief chat with Laurent
> > about it. My plan was to add a new type of link called an "ancillary
> > link" between two entities, and automatically create those in
> > match_notify() based on the function field of the matching entities, and
> > expose them as part of the media graph. I've started working on that but
> > not progressed far enough to share anything.
>
> Sounds good.
>
> > Libcamera would need
> > updating with support for that too though.
>
> Right I think libcamera will need updating no matter what, first we
> need to comeup with a userspace API for this.
>
> Although I guess it would be good to also write libcamera patches
> once the kernel patches are ready, but not yet merged, to make
> sure the API is usable without problems by libcamera.
>
> Regards,
>
> Hans
>
