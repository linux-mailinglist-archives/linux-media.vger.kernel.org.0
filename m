Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5B075CBE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 04:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfGZCJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 22:09:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36792 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfGZCJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 22:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=du09czMbznQL4hmsu4giv5m1v0qVkxwz64Ozzt+8ph8=; b=F25/cSPP2dlsQ9su9K23TiFU4
        SchcAbrf0ZqtGeoAXhJAisinwsIIXzgDe77J++VEvz+ryhnGItwtf/cjhnOEfYN/MAkhkCv9D5HKX
        trR1a34ck3h27Tmcffh2vslbtioyheo1+oN6q7FQYc+p1ABqedw8Oc3cQIkvsz6ntaQHt84T32Jty
        D1gJyr63HTYe8xkhrwmGg5ILzXjW14CwVzSupWB0tZ1RbBXHO9MnrpTUNMWky+T/OxJ0ndPbTvC5N
        A+xeboYpcX75ceI7hZrz2vAL8sZhEfu5ilcafZI6azx9STOY59aH017gsIYz//a2pkEsnOi37SE+y
        /dgLJGX1w==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqpfq-0006Gg-4Y; Fri, 26 Jul 2019 02:09:34 +0000
Date:   Thu, 25 Jul 2019 23:09:29 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
Message-ID: <20190725230929.6a52133c@coco.lan>
In-Reply-To: <cb3e54a7281678b89e34eee82009f615589fea94.camel@collabora.com>
References: <20190715212316.352-1-ezequiel@collabora.com>
        <20190715212316.352-3-ezequiel@collabora.com>
        <20190725125730.2218f0a8@coco.lan>
        <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
        <CAGb2v65wOz+nUi=Leb3FudU7K5S_AHtuCarXHcO0kMvvqEw8rQ@mail.gmail.com>
        <20190725154111.7fc7e335@coco.lan>
        <cb3e54a7281678b89e34eee82009f615589fea94.camel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 25 Jul 2019 20:55:13 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> On Thu, 2019-07-25 at 15:41 -0300, Mauro Carvalho Chehab wrote:
> > Em Fri, 26 Jul 2019 01:29:58 +0800
> > Chen-Yu Tsai <wens@kernel.org> escreveu:
> >   
> > > On Fri, Jul 26, 2019 at 1:06 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:  
> > > > On Thu, 2019-07-25 at 12:57 -0300, Mauro Carvalho Chehab wrote:    
> > > > > Em Mon, 15 Jul 2019 18:23:16 -0300
> > > > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > > > >    
> > > > > > 	Many users have been complaining about not being able to find
> > > > > > certain menu options. One such example are camera sensor drivers
> > > > > > (e.g IMX219, OV5645, etc) which are common on embedded platforms
> > > > > > and not always ancillary devices.
> > > > > > 
> > > > > > The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
> > > > > > to the fact that it uses the "visible" kbuild syntax to hide
> > > > > > entire group of drivers.
> > > > > > 
> > > > > > This is not obvious and, as explained above, not always desired.
> > > > > > 
> > > > > > To fix the problem, drop the "visible" and stop hiding any menu
> > > > > > options. Users skilled enough to configure their kernel are expected
> > > > > > to be skilled enough to know what (not) to configure anyway.
> > > > > > 
> > > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > > ---
> > > > > >  drivers/media/dvb-frontends/Kconfig | 1 -
> > > > > >  drivers/media/i2c/Kconfig           | 1 -
> > > > > >  drivers/media/spi/Kconfig           | 1 -
> > > > > >  drivers/media/tuners/Kconfig        | 1 -
> > > > > >  4 files changed, 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > > > > > index dc43749177df..2d1fea3bf546 100644
> > > > > > --- a/drivers/media/dvb-frontends/Kconfig
> > > > > > +++ b/drivers/media/dvb-frontends/Kconfig
> > > > > > @@ -1,5 +1,4 @@
> > > > > >  menu "Customise DVB Frontends"
> > > > > > -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> > > > > > 
> > > > > >  comment "Multistandard (satellite) frontends"
> > > > > >     depends on DVB_CORE
> > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > index 79ce9ec6fc1b..475072bb67d6 100644
> > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
> > > > > >  #
> > > > > > 
> > > > > >  menu "I2C Encoders, decoders, sensors and other helper chips"
> > > > > > -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT    
> > > > > 
> > > > > Hmm... Hans picked this patch, but IMO it doesn't make sense
> > > > > for PC consumer people to see the hundreds of extra options
> > > > > that making those menus visible will produce.
> > > > > 
> > > > > This was added because in the past we had lots of issues with
> > > > > people desktop/laptop settings with all those things enabled.
> > > > > 
> > > > > In any case, if the desktop/laptop user is smart enough to
> > > > > go though it, he can simply disable MEDIA_SUBDRV_AUTOSELECT and
> > > > > manually select what he wants, so I really miss the point of
> > > > > making those stuff always visible.
> > > > > 
> > > > > Now, from this patch's comments, it seems that you want this
> > > > > to be visible if CONFIG_EMBEDDED. So, I won't complain if you
> > > > > replace the changes on this patch to:
> > > > > 
> > > > >       menu "foo"
> > > > >           visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT
> > > > > 
> > > > > In other words, for the normal guy that just wants to build the
> > > > > latest media stuff for his PC camera or TV device to work, he won't
> > > > > need to dig into hundreds of things that won't make any difference
> > > > > if he enables, except for making the Kernel bigger.
> > > > >    
> > > > 
> > > > Well, I think the real value of MEDIA_SUBDRV_AUTOSELECT is the autoselection,
> > > > not the hidden part. I'm really missing to see what hiding anything gives you.
> > > > 
> > > > In other words, this option gets useful when driver authors select ancillary
> > > > drivers such as:
> > > > 
> > > > config VIDEO_USBVISION
> > > >         tristate "USB video devices based on Nogatech NT1003/1004/1005"
> > > >         depends on I2C && VIDEO_V4L2
> > > >         select VIDEO_TUNER
> > > >         select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
> > > > 
> > > > What's so confusing about having these drivers visible? Compared to the
> > > > rest of the zillion menu options, what's more confusing about seeing these?
> > > > 
> > > > Now, while I would agree with EMBEDDED, the problem with that is that
> > > > many "embedded" platforms don't enable EMBEDDED. So, it's not that useful.
> > > > 
> > > > Finally, let me give an example of why hiding the menus is so bad.
> > > > Normally, to enable a symbol, we use the search tool.
> > > > 
> > > > Now, when MEDIA_SUBDRV_AUTOSELECT=y, the search tool will _not_ take you
> > > > there and there's no indication why.    
> > > 
> > > As someone who has done so in the past year, I agree it's confusing.
> > > I had to dig through the Kconfig files to figure out which knobs to
> > > turn to get the OV5640 option out. The description says "auto-selecting",  
> > 
> > Well, the text and/or the help message can be changed, if it is not
> > clear enough, but this option was added because we had too many issues
> > with users trying to build drivers for their devices without being
> > able to do that, because selecting thousands of devices is something
> > that an average PC user has troubles.
> > 
> > I'm all to improve it, provided that we don't make harder for non-devs
> > to build the Kernel.
> >   
> 
> I just recalled Buildroot made extensive use of comments,
> so how about this instead:
> 
> From fdbb96242422823a6df59cf457ebd19f83e45ffe Mon Sep 17 00:00:00 2001
> From: Ezequiel Garcia <ezequiel@collabora.com>
> Date: Thu, 25 Jul 2019 20:45:07 -0300
> Subject: [PATCH] media: Clarify how menus are hidden by SUBDRV_AUTOSELECT
> 
> Some users have been having a hard time finding certain menu
> options. One such example are camera sensor drivers
> (e.g IMX219, OV5645, etc) which are common on embedded
> platforms and not really "ancillary" devices.
> 
> The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
> to the fact that it uses the "visible" kbuild syntax to hide
> entire group of drivers.
> 
> This is not obvious and it normally takes some time to
> figure out.
> 
> To fix the problem, add a comment on each of hidden menus,
> which should clarify what option is causing menus to be hidden.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/dvb-frontends/Kconfig | 3 +++
>  drivers/media/i2c/Kconfig           | 3 +++
>  drivers/media/spi/Kconfig           | 3 +++
>  drivers/media/tuners/Kconfig        | 4 ++++
>  4 files changed, 13 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> index dc43749177df..5e2ba9d03662 100644
> --- a/drivers/media/dvb-frontends/Kconfig
> +++ b/drivers/media/dvb-frontends/Kconfig
> @@ -1,3 +1,6 @@
> +comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
> +	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
> +
>  menu "Customise DVB Frontends"
>  	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT

Makes sense to me.

Yet, it will keep repeating the same dependency logic everywhere.

Maybe we could have something like:

config MEDIA_SIMPLIFY_SELECT
	bool
	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
	default y

(yeah, the name sucks - feel free to suggest a better name for
the symbol)

and use it instead of keeping repeating the same if over and over.

>  
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 79ce9ec6fc1b..a110fa53233f 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -22,6 +22,9 @@ config VIDEO_IR_I2C
>  # Encoder / Decoder module configuration
>  #
>  
> +comment "I2C drivers hidden by 'Autoselect ancillary drivers'"
> +	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
> +
>  menu "I2C Encoders, decoders, sensors and other helper chips"
>  	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>  
> diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
> index 08386abb9bbc..da1750f86bbc 100644
> --- a/drivers/media/spi/Kconfig
> +++ b/drivers/media/spi/Kconfig
> @@ -1,6 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  if VIDEO_V4L2
>  
> +comment "SPI drivers hidden by 'Autoselect ancillary drivers'"
> +	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
> +
>  menu "SPI helper chips"
>  	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>  
> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> index a7108e575e9b..e017e09d5374 100644
> --- a/drivers/media/tuners/Kconfig
> +++ b/drivers/media/tuners/Kconfig
> @@ -15,6 +15,10 @@ config MEDIA_TUNER
>  	select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
>  	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
>  
> +comment "Tuner drivers hidden by 'Autoselect ancillary drivers'"
> +	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
> +	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> +
>  menu "Customize TV tuners"
>  	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>  	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT



Thanks,
Mauro
