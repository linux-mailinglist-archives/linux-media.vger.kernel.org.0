Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBBC43A5DB
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 15:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfFINJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 09:09:15 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:31087 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbfFINJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 09:09:15 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x59D9AP2031817;
        Sun, 9 Jun 2019 22:09:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x59D9AP2031817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560085751;
        bh=urjxFy2NEO4IWkWWBxKr5z0yKlOgm41OIQHm50hlY30=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bml5OGrd3jqBJvFoAisXFI7WMZzzdQbhDh0PKg2+B73PLIhW7o9K/4eAuaMhYRQF+
         QAKakDzS+W3mMarIxYuRoI4o4B9TK3eoG33Dk+X0b/z8KitpqjeQgd0Mh4PK1NWLL5
         ppHBKT6kZXjYOByep1HeUpTmeFjw+qGKhMDPkMmGZRMUW1Rt/SCeVaiVcTPV6mHtAh
         sk1lO51mRIj38G0mOQqM3j6u1WL9NhJ3/zJpjG4DnyDTrb0BysjM4hHablUNQqFQSy
         mj5T6CUn7L3gR+5FZIXuDzOahtbmjMDhDAIrkZxto/P4FRwe9LaEj3vmY0WB0g9PCq
         Z18qEuTyi1u5w==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id v6so3806647vsq.4;
        Sun, 09 Jun 2019 06:09:10 -0700 (PDT)
X-Gm-Message-State: APjAAAX0wtlc4TdJnACaEAt4vZKEjvGICQAi6LlgAfSHUbZc9VfUzdjG
        2BY1Znk/Ud5WBwXa54m/HjORuetFDln0u0iNhF0=
X-Google-Smtp-Source: APXvYqwzI4jRgQUipIfGjoYys5mBe1p4nX33Nb9rDgiw7jQV1ff71Cn9De0lDApp3gBKTt3c4SpMBpGIX6vmWnnA+2A=
X-Received: by 2002:a67:7fcc:: with SMTP id a195mr13075826vsd.181.1560085749841;
 Sun, 09 Jun 2019 06:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com> <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
 <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
 <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
 <20190605051040.GA22760@kroah.com> <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
 <20190605071413.779bd821@coco.lan> <a798561d24c486d31063a7994d8630c859df00e9.camel@perches.com>
 <CAK7LNARsSFT1ncyRgWi_tga_7KC6ZwZOETXQ2GrO9PfeJgLxyQ@mail.gmail.com> <ba5ec856bce34eead8ba655b9bd6c54b002c40b5.camel@perches.com>
In-Reply-To: <ba5ec856bce34eead8ba655b9bd6c54b002c40b5.camel@perches.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 9 Jun 2019 22:08:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToTXt71obf8NvOiuN5MnxHs+-dkCp_Midu9e6OaOqc4g@mail.gmail.com>
Message-ID: <CAK7LNAToTXt71obf8NvOiuN5MnxHs+-dkCp_Midu9e6OaOqc4g@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Joe Perches <joe@perches.com>
Cc:     Julia Lawall <julia.lawall@lip6.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 9, 2019 at 8:57 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2019-06-09 at 16:14 +0900, Masahiro Yamada wrote:
> > Hi Joe,
> >
> > On Thu, Jun 6, 2019 at 2:06 AM Joe Perches <joe@perches.com> wrote:
> > > Perhaps a checkpatch change too:
> > >
> > > The first block updates unsigned only bitfields
> > > The second tests uapi definitions and suggests "__<kernel_types"
> >
> > Good.
> >
> > In addition,
> >
> > "warn if __u8, __u16, __u32, __u64 are used outside of uapi/"
> >
> > Lots of kernel-space headers use __u{8,16,32,64} instead of u{8,16,32,64}
> > just because developers often miss to understand when to use
> > the underscore-prefixed types.
>
> The problem there is that checkpatch can't know if the
> __<uapi_type> being used is for an actual uapi use or not.
>
> coccinelle could be much better at that.

Why?

u{8,16,32,64} are _exactly_ the same as __u{8,16,32,64}.
See  include/asm-generic/int-ll64.h

We just use __u{8,16,32,64} for user-space
to avoid identifier name conflict,
but we do not have reason to do so for kernel-space.




--
Best Regards
Masahiro Yamada
