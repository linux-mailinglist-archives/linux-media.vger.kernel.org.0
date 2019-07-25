Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D55755C1
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 19:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729691AbfGYRaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 13:30:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726547AbfGYRaM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 13:30:12 -0400
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11729229F3
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564075811;
        bh=YixtddaiZ7dD8tAh6B8gguCMZxyehTliVywjTUrKUOg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fGzKbCX7jOCqbPpF//bnZ+4Lap7pjg4buM5d72+5j/LgGU4mpewCqaEhBC7ZJhNpw
         MF9oPxhdfc+rA/ilYL0PpZ4w/mVP9XTpjBB3TXoTb2Ic+KjKO2UPP9JlwYkdmj2QPS
         XETM6oZgmIjXIIogoqBS3vCiIHSHAMvsuzHUCQH4=
Received: by mail-wr1-f43.google.com with SMTP id f9so51598194wre.12
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 10:30:10 -0700 (PDT)
X-Gm-Message-State: APjAAAXtL9fqxagHgAIzdMYqbFdBi+euM6sPUrPyRbH4XU3VXI8v7lW0
        dX2y6zyuYK1qHnplaQDpN8qR8EwOFn0L0ugeU58=
X-Google-Smtp-Source: APXvYqwpeBmRNSYoFu50liQDSMiCfi+uhxep3G0nXCUCPolTefvE7mdRrlKeYuwpy4l2Yd93adjleRY0fFJTh07cQK0=
X-Received: by 2002:adf:e941:: with SMTP id m1mr8594609wrn.279.1564075809569;
 Thu, 25 Jul 2019 10:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190715212316.352-1-ezequiel@collabora.com> <20190715212316.352-3-ezequiel@collabora.com>
 <20190725125730.2218f0a8@coco.lan> <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
In-Reply-To: <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Fri, 26 Jul 2019 01:29:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65wOz+nUi=Leb3FudU7K5S_AHtuCarXHcO0kMvvqEw8rQ@mail.gmail.com>
Message-ID: <CAGb2v65wOz+nUi=Leb3FudU7K5S_AHtuCarXHcO0kMvvqEw8rQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 26, 2019 at 1:06 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Thu, 2019-07-25 at 12:57 -0300, Mauro Carvalho Chehab wrote:
> > Em Mon, 15 Jul 2019 18:23:16 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >
> > > Many users have been complaining about not being able to find
> > > certain menu options. One such example are camera sensor drivers
> > > (e.g IMX219, OV5645, etc) which are common on embedded platforms
> > > and not always ancillary devices.
> > >
> > > The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
> > > to the fact that it uses the "visible" kbuild syntax to hide
> > > entire group of drivers.
> > >
> > > This is not obvious and, as explained above, not always desired.
> > >
> > > To fix the problem, drop the "visible" and stop hiding any menu
> > > options. Users skilled enough to configure their kernel are expected
> > > to be skilled enough to know what (not) to configure anyway.
> > >
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/dvb-frontends/Kconfig | 1 -
> > >  drivers/media/i2c/Kconfig           | 1 -
> > >  drivers/media/spi/Kconfig           | 1 -
> > >  drivers/media/tuners/Kconfig        | 1 -
> > >  4 files changed, 4 deletions(-)
> > >
> > > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > > index dc43749177df..2d1fea3bf546 100644
> > > --- a/drivers/media/dvb-frontends/Kconfig
> > > +++ b/drivers/media/dvb-frontends/Kconfig
> > > @@ -1,5 +1,4 @@
> > >  menu "Customise DVB Frontends"
> > > -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> > >
> > >  comment "Multistandard (satellite) frontends"
> > >     depends on DVB_CORE
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 79ce9ec6fc1b..475072bb67d6 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
> > >  #
> > >
> > >  menu "I2C Encoders, decoders, sensors and other helper chips"
> > > -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> >
> > Hmm... Hans picked this patch, but IMO it doesn't make sense
> > for PC consumer people to see the hundreds of extra options
> > that making those menus visible will produce.
> >
> > This was added because in the past we had lots of issues with
> > people desktop/laptop settings with all those things enabled.
> >
> > In any case, if the desktop/laptop user is smart enough to
> > go though it, he can simply disable MEDIA_SUBDRV_AUTOSELECT and
> > manually select what he wants, so I really miss the point of
> > making those stuff always visible.
> >
> > Now, from this patch's comments, it seems that you want this
> > to be visible if CONFIG_EMBEDDED. So, I won't complain if you
> > replace the changes on this patch to:
> >
> >       menu "foo"
> >           visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT
> >
> > In other words, for the normal guy that just wants to build the
> > latest media stuff for his PC camera or TV device to work, he won't
> > need to dig into hundreds of things that won't make any difference
> > if he enables, except for making the Kernel bigger.
> >
>
> Well, I think the real value of MEDIA_SUBDRV_AUTOSELECT is the autoselection,
> not the hidden part. I'm really missing to see what hiding anything gives you.
>
> In other words, this option gets useful when driver authors select ancillary
> drivers such as:
>
> config VIDEO_USBVISION
>         tristate "USB video devices based on Nogatech NT1003/1004/1005"
>         depends on I2C && VIDEO_V4L2
>         select VIDEO_TUNER
>         select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
>
> What's so confusing about having these drivers visible? Compared to the
> rest of the zillion menu options, what's more confusing about seeing these?
>
> Now, while I would agree with EMBEDDED, the problem with that is that
> many "embedded" platforms don't enable EMBEDDED. So, it's not that useful.
>
> Finally, let me give an example of why hiding the menus is so bad.
> Normally, to enable a symbol, we use the search tool.
>
> Now, when MEDIA_SUBDRV_AUTOSELECT=y, the search tool will _not_ take you
> there and there's no indication why.

As someone who has done so in the past year, I agree it's confusing.
I had to dig through the Kconfig files to figure out which knobs to
turn to get the OV5640 option out. The description says "auto-selecting",
which does not equal hiding everything. You could still have drivers
auto-selected (or not) based on a Kconfig option without hiding things.

ChenYu
