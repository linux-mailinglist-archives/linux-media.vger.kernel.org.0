Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E6535A33
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 12:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfFEKJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 06:09:17 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:44102 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbfFEKJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 06:09:16 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x55A9Cef010064;
        Wed, 5 Jun 2019 19:09:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x55A9Cef010064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559729353;
        bh=spSyBc2f59SMr1HLkOA0i/JhLd4nLOmABZGZ8e1sX4M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xjuWaVGpdL6WVMegKW6v4TWepAyvjNBR0tbIEOq0MlBZUn1NhqeaOShlvcuiw+t/c
         2mkgtlpCzkYfW8nTVvXwtsLlXKGlTaiDBtto2PJmMu1zvRGIHcK/WWOMUD/A0V06/w
         BAzeEr05rGpNZ8RDBvCOW3+hQM78zNiu0vgLsa/Y/JUv5SQ7wWiZz1XpwBUNrf8sRc
         FwTDgQsP7mEGi0ZWtwIK4AaqcBRN+q9pV263V3jSFnO31XFMefeKYZ0P3GTOXh/dcr
         dUBHXbDBRtrqeI3sDnevI0M4wUlafjBsBkAm+SqyIrhXovUeP2tUguibp7CbUx9hxC
         6NEFDqd+CnLBw==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id n2so6971811vso.6;
        Wed, 05 Jun 2019 03:09:13 -0700 (PDT)
X-Gm-Message-State: APjAAAUr3Hw6y74pq77w4JI8acLSMzPiDntGnHKYrbmDv3DMjTTaSLNm
        clqjSs46yOX5DbNttuszi6xOj7YqyofEsiHQslw=
X-Google-Smtp-Source: APXvYqxA9Vt9o6fNOvyuZTdbKqshJN+/e/D7lSAsZ1MNllAnmcOK/ccaKNZ9XxAj9H4XnzYnhtMNvSXJocyUrFCgYmQ=
X-Received: by 2002:a67:f495:: with SMTP id o21mr4387671vsn.54.1559729352077;
 Wed, 05 Jun 2019 03:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com> <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
 <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
 <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
 <20190605051040.GA22760@kroah.com> <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
 <20190605060205.GA29484@kroah.com>
In-Reply-To: <20190605060205.GA29484@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 5 Jun 2019 19:08:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQYOXZTUiQH1opbh3duipvLtQZvwb10STUj4YHZdTfM_A@mail.gmail.com>
Message-ID: <CAK7LNAQYOXZTUiQH1opbh3duipvLtQZvwb10STUj4YHZdTfM_A@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Wed, Jun 5, 2019 at 3:03 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 04, 2019 at 10:22:05PM -0700, Joe Perches wrote:
> > On Wed, 2019-06-05 at 07:10 +0200, Greg KH wrote:
> > > On Wed, Jun 05, 2019 at 01:10:41PM +0900, Masahiro Yamada wrote:
> > > > On Wed, Jun 5, 2019 at 3:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > []
> > > > This means we cannot reliably use uint{8,16,32,64}_t in UAPI headers.
> > >
> > > We should not be doing that as they are in the userspace "namespace" of
> > > variables, not in the kernel namespace.  We've been over this many times
> > > in the past :(
> >
> > Just not very successfully...
> >
> > $ git grep -w -P 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
> > 342
> >
> > $ git grep -w -P --name-only 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
> > 13
> >
> > Documentation helps a bit, checkpatch helps as well.
> > Maintainer knowledge and vigilance probably helps the most.
>
> Yes, it's not been a dedicated effort at all :(


I am proposing this series.
https://lkml.org/lkml/2019/6/4/1379


When CONFIG_UAPI_HEADER_TEST=y,
UAPI headers are compile-tested.

0-day bot tests allmodconfig, which enables CONFIG_UAPI_HEADER_TEST,
so new buggy headers will be blocked.

It will take some time to eliminate existing bugs.
I just started with low-hanging fruits:

https://lore.kernel.org/patchwork/patch/1083711/
https://lore.kernel.org/patchwork/patch/1084123/



Anyway, having a document will be really nice.

Not all maintainers understand the detail.
Having some evidence in Documentation/
will help the review process move smoothly.


> But it needs to be resolved, if we want people to actually use our
> kernel headers easily.
>
> thanks,
>
> greg k-h



-- 
Best Regards
Masahiro Yamada
