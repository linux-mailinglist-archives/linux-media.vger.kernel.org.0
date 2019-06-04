Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477B434932
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfFDNmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727129AbfFDNmS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 09:42:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A27424B0A;
        Tue,  4 Jun 2019 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559655736;
        bh=bZNqVO8f2ylblrO+c28v5AyhWdCQSWSKn5ngf4Aj5NE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=enrOrWMyuu5hZJrGcow0Dqzo9DGi2h086EaQngbQdQHsC81UHjNz5BLsqZuzI6hLP
         QEFG1Y3IHq043mikzia76U0mRvrrmRHW9V3jvNBFAdihVK/YAEZIm3LwgCSbOwUH2A
         XrnZS/VaMwtJ/MA4/h9Nadbue81MOSrRhf1SMeHU=
Date:   Tue, 4 Jun 2019 15:42:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
Message-ID: <20190604134213.GA26263@kroah.com>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 04, 2019 at 09:48:12PM +0900, Masahiro Yamada wrote:
> On Tue, Jun 4, 2019 at 8:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Jun 4, 2019 at 1:23 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Tue, 2019-06-04 at 20:13 +0900, Masahiro Yamada wrote:
> > > > On the other hand, uapi headers are written in more strict C, where
> > > > the C++ comment style is forbidden.
> > >
> > > Is this a real problem for any toolchain?
> >
> > There is likely some code that is built with -Wpedandic -Werror --std=c89
> > or similar. Since glibc allows this combination for its own headers, it seems
> > best to also allow it in kernel headers that may be included by libc headers
> > or by applications, at least where it does not hurt.
> >
> > Realistically though, we probably assume c99 or gnu89 in user space
> > headers anyway, since there is no 'long long' in earlier standards.
> >
> >        Arnd
> 
> In fact, I detected this issue by the following patch:
> https://patchwork.kernel.org/patch/10974669/
> 
> When I worked on it, I wondered which
> c-dialect flags should be used.
> 
> This code:
> 
> > # Unlike the kernel space, uapi headers are written in more strict C.
> > #  - Forbid C++ style comments
> > #  - Use '__inline', '__asm__' instead of 'inline', 'asm'
> > #
> > # -std=c90 (equivalent to -ansi) catches the violation of those.
> > # We cannot go as far as adding -Wpedantic since it emits too many warnings.
> > #
> > # REVISIT: re-consider the proper set of compiler flags for uapi compile-test.
> >
> > UAPI_CFLAGS := -std=c90 -Wpedantic -Wall -Werror=implicit-function-declaration
> 
> Even "-std=c99 -Wpedantic" emits lots of warnings.
> 
> 
> 
> I noticed one more thing.
> 
> There are two ways to define fixed-width type.
> 
> [1] #include <linux/types.h>, __u8, __u16, __u32, __u64
> 
>       vs
> 
> [2] #include <stdint.h>, uint8_t, uint16_t, uint32_t, uint64_t
> 
> 
> Both are used in UAPI headers.
> IIRC, <stdint.h> was standardized by C99.
> 
> So, we have already relied on C99 in user-space too.

Just because we have relied on it in the past, does not mean we need to
keep relying on it.  I have had numerous complaints over the years from
libc authors that our uapi headers are _NOT_ able to be directly
consumed by them.  They all end up having to fix things up and include
local "sanitized" copies.

So any work we can do here to make them more sane and work properly
everywhere is a good thing, as right now, they are broken.

thanks,

greg k-h
