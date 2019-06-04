Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACA6334FC5
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 20:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfFDSUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 14:20:49 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39028 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDSUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 14:20:48 -0400
Received: by mail-qk1-f193.google.com with SMTP id i125so3473388qkd.6;
        Tue, 04 Jun 2019 11:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQhpQeHfjr7pr+7f8qd7u/ZaT6BtUjv/QYyj8bAPAzE=;
        b=gkae9fyqxlKdK2zhmiq1R3vKkMIGG4+8Goz7dmSheLbpNKRrfKou8VnKZFLJERxtPz
         YN3vDosPUPEONnEasvyKe4AOUqHBvPWZg1JD0ohjkREjMt+y5hpT6nTnyoUYkjHhhlkx
         BPI0365uS3t+mYIy7W1X/Zrj+GpaaI5UDgbvz98cjStwxB5M/KwSsQ+QXkj2LrjEAwap
         98TWaX0khFyYtOoAqKImLdvO3IKEFD4jEOj3GZ2Xtl6wstnEEfwRHDe83gHrTf7fUzUL
         O5o4KVJTaLq6ufdxtHPkbrfYz9VuRItQ2i5+j6F3emvFPCMuHCCeranPSzHVax2BISbq
         upkA==
X-Gm-Message-State: APjAAAXimky9AHvK4ZWRKZYdsY2D8csHRXnZfosWHO/quMQfnydy/8H1
        V/HSnG8ntpQ+SFeDTPZe8qs0lCZ4UpxVSvg8f77rhsQF
X-Google-Smtp-Source: APXvYqxPjPBgDsgzeBtCCa9fhlWMow8VQw4843sOSqGqDdUUeqUxZWI9r6CcQc/jbpBMS/IxKaTsN47H9K44JoQVz98=
X-Received: by 2002:a05:620a:16c1:: with SMTP id a1mr28229029qkn.269.1559672447021;
 Tue, 04 Jun 2019 11:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com> <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
In-Reply-To: <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 4 Jun 2019 20:20:30 +0200
Message-ID: <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
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

On Tue, Jun 4, 2019 at 5:28 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Tue, Jun 4, 2019 at 10:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jun 04, 2019 at 09:48:12PM +0900, Masahiro Yamada wrote:
> > > On Tue, Jun 4, 2019 at 8:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > # Unlike the kernel space, uapi headers are written in more strict C.
> > > > # -std=c90 (equivalent to -ansi) catches the violation of those.
> > > > # We cannot go as far as adding -Wpedantic since it emits too many warnings.

At least with clang, we might be able to be more specific about which
warnings to add or not to add.

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

A related problem is that using the stdint.h types requires
including stdint.h first, but the C library requires that including
one standard header does not include another one recursively.

So if sys/socket.h includes linux/socket.h, that must not include
stdint.h or any other header file that does so.

> > Just because we have relied on it in the past, does not mean we need to
> > keep relying on it.  I have had numerous complaints over the years from
> > libc authors that our uapi headers are _NOT_ able to be directly
> > consumed by them.  They all end up having to fix things up and include
> > local "sanitized" copies.

Yes, and this is getting worse with 64-bit time_t as we now get conflicting
definitions of timespec, timeval and derived types. We probably need to
change a lot of the common headers that conflict with libc definitions
and come up with a better way of exposing the interfaces there.

Similarly, a header that may get included by libc should not define any
data structures with members that may conflict with a user space macro
name. E.g.

struct foo {
      __u32 bar;
};

uses the correct type, but if an application contains

#define bar __read_bar()
#include <linux/foo.h>

then it will get a compile failure. Not sure what we can do about this,
but we might need a form of classification of headers into those
that can be included by libc and must follow very strict rules,
as opposed to those headers that are specific to a driver or subsystem
that will not be included unless some application specifically needs the
symbols in that header to talk to the kernel.

> > So any work we can do here to make them more sane and work properly
> > everywhere is a good thing, as right now, they are broken.
>
>
> Maybe, we should document UAPI header coding guideline.
>
> Without To-Don't list,
> people will do anything.

This also came up recently with the discussion on how to define
data structures in a portable way that avoids not only the identifier
conflicts but also differences in size or alignment of member types.

        Arnd
