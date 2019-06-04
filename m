Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D7634C35
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 17:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfFDP2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 11:28:31 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:45953 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbfFDP2a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 11:28:30 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x54FSN4H002555;
        Wed, 5 Jun 2019 00:28:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x54FSN4H002555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559662104;
        bh=xVd2/15cRIYRvqEFrZt+GrU5RKlOB2iz/49zmh4Olfg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gkcG3kL/oS6oTDjulpc8HBbEQb4OwyqoBfF+sF2fstjpOkFhHsRLBLsslDXG27N+F
         UKcqGCZu9O5jpNbD4f/S3WyMo+iRRbU/Cn9B+VhyrW3i7pHC+IOUwIHxTmCPG4yHUr
         68qyS48qeeWln9LIg7OboNpqpU8f3YO1bTTbmIbhwVb6z12V2e/KIVL62qYQPWTwzy
         gfXTq+hWZPP2e4UL2MCV0FGJyKewejyKJKreelnfu/E1KuqPvB4PhMR2fx/14YEurV
         iLvgcd3RlDoJHiW3hMfgXsUA64rnImhgn3q1IdZwzVHsu3bUWmLq4ZiylpH+k0nkFc
         BQOuzIuIHO3Lg==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id 7so7959291uah.1;
        Tue, 04 Jun 2019 08:28:24 -0700 (PDT)
X-Gm-Message-State: APjAAAW8TRRAbB4SrZ6gjnjWZXCQ2ysTyd+/Vx6M8qqtoUlzFVeUUlI/
        gL69GHW0Folp1xj8/pzYFm0XbaKu/kzZQfnyPfw=
X-Google-Smtp-Source: APXvYqz+9e5VCPBgmEDoWY6szosjZ6mKOCPexT7e/JjcmIzEzwsBPsiBfx089e0PnpelIZP4GrceIIo180eeV+mF/kk=
X-Received: by 2002:a9f:24a3:: with SMTP id 32mr14726733uar.109.1559662103076;
 Tue, 04 Jun 2019 08:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com> <20190604134213.GA26263@kroah.com>
In-Reply-To: <20190604134213.GA26263@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 5 Jun 2019 00:27:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
Message-ID: <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 4, 2019 at 10:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 04, 2019 at 09:48:12PM +0900, Masahiro Yamada wrote:
> > On Tue, Jun 4, 2019 at 8:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Jun 4, 2019 at 1:23 PM Joe Perches <joe@perches.com> wrote:
> > > >
> > > > On Tue, 2019-06-04 at 20:13 +0900, Masahiro Yamada wrote:
> > > > > On the other hand, uapi headers are written in more strict C, where
> > > > > the C++ comment style is forbidden.
> > > >
> > > > Is this a real problem for any toolchain?
> > >
> > > There is likely some code that is built with -Wpedandic -Werror --std=c89
> > > or similar. Since glibc allows this combination for its own headers, it seems
> > > best to also allow it in kernel headers that may be included by libc headers
> > > or by applications, at least where it does not hurt.
> > >
> > > Realistically though, we probably assume c99 or gnu89 in user space
> > > headers anyway, since there is no 'long long' in earlier standards.
> > >
> > >        Arnd
> >
> > In fact, I detected this issue by the following patch:
> > https://patchwork.kernel.org/patch/10974669/
> >
> > When I worked on it, I wondered which
> > c-dialect flags should be used.
> >
> > This code:
> >
> > > # Unlike the kernel space, uapi headers are written in more strict C.
> > > #  - Forbid C++ style comments
> > > #  - Use '__inline', '__asm__' instead of 'inline', 'asm'
> > > #
> > > # -std=c90 (equivalent to -ansi) catches the violation of those.
> > > # We cannot go as far as adding -Wpedantic since it emits too many warnings.
> > > #
> > > # REVISIT: re-consider the proper set of compiler flags for uapi compile-test.
> > >
> > > UAPI_CFLAGS := -std=c90 -Wpedantic -Wall -Werror=implicit-function-declaration
> >
> > Even "-std=c99 -Wpedantic" emits lots of warnings.
> >
> >
> >
> > I noticed one more thing.
> >
> > There are two ways to define fixed-width type.
> >
> > [1] #include <linux/types.h>, __u8, __u16, __u32, __u64
> >
> >       vs
> >
> > [2] #include <stdint.h>, uint8_t, uint16_t, uint32_t, uint64_t
> >
> >
> > Both are used in UAPI headers.
> > IIRC, <stdint.h> was standardized by C99.
> >
> > So, we have already relied on C99 in user-space too.
>
> Just because we have relied on it in the past, does not mean we need to
> keep relying on it.  I have had numerous complaints over the years from
> libc authors that our uapi headers are _NOT_ able to be directly
> consumed by them.  They all end up having to fix things up and include
> local "sanitized" copies.
>
> So any work we can do here to make them more sane and work properly
> everywhere is a good thing, as right now, they are broken.


Maybe, we should document UAPI header coding guideline.

Without To-Don't list,
people will do anything.


-- 
Best Regards
Masahiro Yamada
