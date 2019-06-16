Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974444759F
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 17:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfFPPtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 11:49:22 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50354 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfFPPtW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 11:49:22 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6191F801F6; Sun, 16 Jun 2019 17:49:09 +0200 (CEST)
Date:   Sun, 16 Jun 2019 17:48:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
Message-ID: <20190616154848.GA24837@xo-6d-61-c0.localdomain>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com>
 <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> > > In fact, I detected this issue by the following patch:
> > > https://patchwork.kernel.org/patch/10974669/
> > >
> > > When I worked on it, I wondered which
> > > c-dialect flags should be used.
> > >
> > > This code:
> > >
> > > > # Unlike the kernel space, uapi headers are written in more strict C.
> > > > #  - Forbid C++ style comments
> > > > #  - Use '__inline', '__asm__' instead of 'inline', 'asm'
> > > > #
> > > > # -std=c90 (equivalent to -ansi) catches the violation of those.
> > > > # We cannot go as far as adding -Wpedantic since it emits too many warnings.
> > > > #
> > > > # REVISIT: re-consider the proper set of compiler flags for uapi compile-test.
> > > >
> > > > UAPI_CFLAGS := -std=c90 -Wpedantic -Wall -Werror=implicit-function-declaration
> > >
> > > Even "-std=c99 -Wpedantic" emits lots of warnings.
> > >
> > >
> > >
> > > I noticed one more thing.
> > >
> > > There are two ways to define fixed-width type.
> > >
> > > [1] #include <linux/types.h>, __u8, __u16, __u32, __u64
> > >
> > >       vs
> > >
> > > [2] #include <stdint.h>, uint8_t, uint16_t, uint32_t, uint64_t
> > >
> > >
> > > Both are used in UAPI headers.
> > > IIRC, <stdint.h> was standardized by C99.
> > >
> > > So, we have already relied on C99 in user-space too.
> >
> > Just because we have relied on it in the past, does not mean we need to
> > keep relying on it.  I have had numerous complaints over the years from
> > libc authors that our uapi headers are _NOT_ able to be directly
> > consumed by them.  They all end up having to fix things up and include
> > local "sanitized" copies.
> >
> > So any work we can do here to make them more sane and work properly
> > everywhere is a good thing, as right now, they are broken.
> 
> Maybe, we should document UAPI header coding guideline.

> Without To-Don't list,
> people will do anything.

Even better would be a (compile-time) test that checks for problems in the headers...

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
