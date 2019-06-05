Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6310035626
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 07:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFEFKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 01:10:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfFEFKn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 01:10:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2E0420717;
        Wed,  5 Jun 2019 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559711442;
        bh=V8DlWgZqXstcCmPiURrcVjF20aQb86vskPSHAO9ICAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UlpBaFX6E6NIFPydKcc1ZcpMS2IYp9Q2DeXASDRP6E/m654Sf2lEg5/E3ZZaK7URY
         HZTqE+vusc3jRFjsxl74c1FAm0yQ6mmnuL77NCieSa6jiEVxSviIlPUSKJ1FKqt0sf
         st71bQrr/F4ISxOEEYPn9wBrDacByOOlapKvOXpo=
Date:   Wed, 5 Jun 2019 07:10:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
Message-ID: <20190605051040.GA22760@kroah.com>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com>
 <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
 <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
 <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 05, 2019 at 01:10:41PM +0900, Masahiro Yamada wrote:
> On Wed, Jun 5, 2019 at 3:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >
> > > > > There are two ways to define fixed-width type.
> > > > >
> > > > > [1] #include <linux/types.h>, __u8, __u16, __u32, __u64
> > > > >
> > > > >       vs
> > > > >
> > > > > [2] #include <stdint.h>, uint8_t, uint16_t, uint32_t, uint64_t
> > > > >
> > > > >
> > > > > Both are used in UAPI headers.
> > > > > IIRC, <stdint.h> was standardized by C99.
> > > > >
> > > > > So, we have already relied on C99 in user-space too.
> >
> > A related problem is that using the stdint.h types requires
> > including stdint.h first, but the C library requires that including
> > one standard header does not include another one recursively.
> >
> > So if sys/socket.h includes linux/socket.h, that must not include
> > stdint.h or any other header file that does so.
> 
> 
> This means we cannot reliably use uint{8,16,32,64}_t in UAPI headers.

We should not be doing that as they are in the userspace "namespace" of
variables, not in the kernel namespace.  We've been over this many times
in the past :(

> [1] If we include <stdint.h> from linux/foo.h
> 
>     If sys/foo.h includes <linux/foo.h> and <stdint.h>,
>     it violates the C library requirement.
> 
> 
> [2] If we do not include <stdint.h> from linux/foo.h
> 
>     If sys/foo.h includes <linux/foo.h>, but not <stdint.h>,
>     we get 'unknown type name' errors.

We need to just use the proper __u{8,16,32,64} variable types instead,
that is exactly what they are there for.

thanks,

greg k-h
