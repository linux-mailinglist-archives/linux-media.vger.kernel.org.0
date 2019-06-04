Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2151634741
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfFDMtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:49:01 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38774 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfFDMtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 08:49:01 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x54CmnVr002530;
        Tue, 4 Jun 2019 21:48:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x54CmnVr002530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559652530;
        bh=H21/n5ZeA1Sd3QqC5U97OCEIy4trQ6PmVFi/VT4QN+4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HYwodEMul5OlQzmwKhEX6b6C1LVY4TFC427YWZnAh8FpKOLhbGx3nkXMth/GG8vu2
         /ge7aM6G/sHybQ+pNIcbuI8FxmcgcwZpYWkWGaYIUJZ5DwYtxgReCPxBybOnfwhUMd
         3spDI9xYERz6OQKv8WTZQiXN7llNojzp6+LdN2w2XgwiOIe519QIgyi/IvNIGXNJOO
         OE84YjAYKvwfo6fEVcNQ33COgUHWK6EsY/UI7PdO9kNSx2E1YlSuqnsGX5kvuzmGzM
         1whvXLCXmyCN0NJcZeWukuJEr5LjgNF4jQ1HDzP8BJHPKCmUoCd5Irc+i+8DBEhKbB
         zBsK14Sf9hL1g==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id c24so13398068vsp.7;
        Tue, 04 Jun 2019 05:48:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXxL+TITY0bnE3OumKbASPm/GvMWMibydToHEFS6AiEJQjR6O2l
        nQ9qOQdShazob2DID7T10qqFc0L07V9YcaiWn0o=
X-Google-Smtp-Source: APXvYqyl1i9lHN0jNv7AJ7DU8zIFIGmuYR+L/Yq9Azwv8O1F0W+l+BJxWSTbx748qLtCYkM7STINmYgRtNldie1Bjvc=
X-Received: by 2002:a67:b109:: with SMTP id w9mr5031632vsl.155.1559652528996;
 Tue, 04 Jun 2019 05:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com> <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
In-Reply-To: <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 4 Jun 2019 21:48:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
Message-ID: <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Joe Perches <joe@perches.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 4, 2019 at 8:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 4, 2019 at 1:23 PM Joe Perches <joe@perches.com> wrote:
> >
> > On Tue, 2019-06-04 at 20:13 +0900, Masahiro Yamada wrote:
> > > On the other hand, uapi headers are written in more strict C, where
> > > the C++ comment style is forbidden.
> >
> > Is this a real problem for any toolchain?
>
> There is likely some code that is built with -Wpedandic -Werror --std=c89
> or similar. Since glibc allows this combination for its own headers, it seems
> best to also allow it in kernel headers that may be included by libc headers
> or by applications, at least where it does not hurt.
>
> Realistically though, we probably assume c99 or gnu89 in user space
> headers anyway, since there is no 'long long' in earlier standards.
>
>        Arnd

In fact, I detected this issue by the following patch:
https://patchwork.kernel.org/patch/10974669/

When I worked on it, I wondered which
c-dialect flags should be used.

This code:

> # Unlike the kernel space, uapi headers are written in more strict C.
> #  - Forbid C++ style comments
> #  - Use '__inline', '__asm__' instead of 'inline', 'asm'
> #
> # -std=c90 (equivalent to -ansi) catches the violation of those.
> # We cannot go as far as adding -Wpedantic since it emits too many warnings.
> #
> # REVISIT: re-consider the proper set of compiler flags for uapi compile-test.
>
> UAPI_CFLAGS := -std=c90 -Wpedantic -Wall -Werror=implicit-function-declaration

Even "-std=c99 -Wpedantic" emits lots of warnings.



I noticed one more thing.

There are two ways to define fixed-width type.

[1] #include <linux/types.h>, __u8, __u16, __u32, __u64

      vs

[2] #include <stdint.h>, uint8_t, uint16_t, uint32_t, uint64_t


Both are used in UAPI headers.
IIRC, <stdint.h> was standardized by C99.

So, we have already relied on C99 in user-space too.



-- 
Best Regards
Masahiro Yamada
