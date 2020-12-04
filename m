Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2142CE975
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgLDIXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:23:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:34254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgLDIXA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 03:23:00 -0500
X-Gm-Message-State: AOAM533u8qp4warYnaliKs4L1gnxZT5uXjKYFLEHCxsov/e/vQxsaaWh
        fwnTHEFW2XT4ZjvJsXOj0PuIKGgBcBHq3mvrfT4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607070139;
        bh=2hCU16u8xdgK+1WRUVeeUfn1ZGZIrA6XHXnWa4B43Ws=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h4Q7Sa7DoFD2o2/4Tu0jkpK5D/EijEerH1ihEOloYkaFXaCVsUF23qNUERELqxG3G
         bZvfwDXDP+VjTTqW20jYjz5Jw8ZR009/7IQ6dHfEZzbd+PUmj0GGb9prKqvyY0CW9Y
         yV4g94/ccG0e/5dQoxJF4DAKP4eFQXUOhpkoilRSDoxR68czPx5Znoi9mRptSIHCwl
         COBThqd/i8MdcDyCu7POFXJS9GknBKBfSEKvZuHy54AAInO9Gn6H6LfXoz10Wo4OXz
         KZu6OkvnmiwTg+C2fFIJdUE+EM0bY1WiSrBfcfs47rKI7V6UztSPPP9OtpDv9HTksS
         2ejQOYIS7mL+Q==
X-Google-Smtp-Source: ABdhPJxs+Au9ZXbkEKqkIFc+iYxn/D/2u3KSa+IfdKMx2o4fDVnF4lOKi/heqBPu4O3BvmX7cKSQyOP8MbSTPeGfxR0=
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr2437405oig.4.1607070138915;
 Fri, 04 Dec 2020 00:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20201203222956.1091606-1-arnd@kernel.org> <1607047828.4733.172.camel@mhfsdcap03>
In-Reply-To: <1607047828.4733.172.camel@mhfsdcap03>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 4 Dec 2020 09:22:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ZA4cLNL3kVN9qKjHyhWJXOA2LtsEakN0V9rcTBQaVNw@mail.gmail.com>
Message-ID: <CAK8P3a0ZA4cLNL3kVN9qKjHyhWJXOA2LtsEakN0V9rcTBQaVNw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: fix an uninitialized error code
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        tfiga@google.com, sj.huang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 4, 2020 at 3:10 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Arnd,
>
> Thanks for the patch.
>
> On Thu, 2020-12-03 at 23:29 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Clang points out that the error handling in ov02a10_s_stream() is
> > broken, and just returns a random error code:
> >
> > drivers/media/i2c/ov02a10.c:537:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> >         if (ov02a10->streaming == on)
> >             ^~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/media/i2c/ov02a10.c:568:9: note: uninitialized use occurs here
> >         return ret;
> >                ^~~
> > drivers/media/i2c/ov02a10.c:537:2: note: remove the 'if' if its condition is always false
> >         if (ov02a10->streaming == on)
> >         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/media/i2c/ov02a10.c:533:9: note: initialize the variable 'ret' to silence this warning
> >         int ret;
> >
> > I assume that -EBUSY is the intended error code, so use that.
> >
> > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/media/i2c/ov02a10.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > index 391718136ade..7ee9c904d9b5 100644
> > --- a/drivers/media/i2c/ov02a10.c
> > +++ b/drivers/media/i2c/ov02a10.c
> > @@ -534,8 +534,10 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> >
> >       mutex_lock(&ov02a10->mutex);
> >
> > -     if (ov02a10->streaming == on)
> > +     if (ov02a10->streaming == on) {
> > +             ret = -EBUSY;
> >               goto unlock_and_return;
> > +     }
> >
> >       if (on) {
> >               ret = pm_runtime_get_sync(&client->dev);
>
> Only if sensor fails to stream on, ret can return a negative error code.
> Thus ret above needs to be initialized to '0'.

Ok, I sent a version 2.

> Also you could fix the clang error like this.
>
> static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> {
>         struct ov02a10 *ov02a10 = to_ov02a10(sd);
>         ...
>         int ret = 0;
>
>         ...
>         if (ov02a10->streaming == on)
>                 goto unlock_and_return;
>
>         ...
> }

Sorry, I should have removed the last line of the output from
clang that suggested doing that. Initializing a local variable
in the declaration is generally a bad idea precisely because it
prevents the compiler from warning about a case like this where
the author forgot to set the correct error value.

We should really fix clang to not propagate that nonsense.

        Arnd
