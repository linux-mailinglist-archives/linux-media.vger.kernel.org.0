Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 971653AAEC
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 19:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbfFIRmv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 13:42:51 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35158 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728678AbfFIRmv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 13:42:51 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6D2F38023A; Sun,  9 Jun 2019 19:42:39 +0200 (CEST)
Date:   Sun, 9 Jun 2019 19:42:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
Message-ID: <20190609174216.GA13697@xo-6d-61-c0.localdomain>
References: <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com>
 <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
 <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
 <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
 <20190605051040.GA22760@kroah.com>
 <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
 <20190605071413.779bd821@coco.lan>
 <a798561d24c486d31063a7994d8630c859df00e9.camel@perches.com>
 <CAK7LNARsSFT1ncyRgWi_tga_7KC6ZwZOETXQ2GrO9PfeJgLxyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARsSFT1ncyRgWi_tga_7KC6ZwZOETXQ2GrO9PfeJgLxyQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> On Thu, Jun 6, 2019 at 2:06 AM Joe Perches <joe@perches.com> wrote:
> > Perhaps a checkpatch change too:
> >
> > The first block updates unsigned only bitfields
> > The second tests uapi definitions and suggests "__<kernel_types"
> 
> Good.
> 
> In addition,
> 
> "warn if __u8, __u16, __u32, __u64 are used outside of uapi/"
> 
> Lots of kernel-space headers use __u{8,16,32,64} instead of u{8,16,32,64}
> just because developers often miss to understand when to use
> the underscore-prefixed types.

I have seen it even in the .c files in kernel.... 

And you want same handling for __s64 (etc) variants.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
