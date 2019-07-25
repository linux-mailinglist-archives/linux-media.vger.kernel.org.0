Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED78755FF
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 19:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403755AbfGYRpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 13:45:19 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46076 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403751AbfGYRpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 13:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rJDFoDCT6Lbt7Lxt7hbWXyJbv/elrO10MHFFhw5LxZA=; b=ELSuVcTgFioHXnsdM5mVscqHI
        IAOdYzeebjZN+bZKLjdHeLV4oTXBgGPxKRob2gBmncJkqpgKpSMgzeKyjWqzwpkrLyKk8MB/H7L9s
        WrH7Vlnyo7iekYwcZji5aYj1iHCJelWY3Wd/CQw9NnxBNY798GfEmBhf6dXetEJ1lJ0FekfPcdjCt
        9pqWy+SCkTN7in0oEtw78dPIKf92u5KNRo/7LmmKt9x8rEhI43OeTJWuH6au1F7mXV1cikA2cxjz3
        HAXe/8TPBX+gwEYvLuyChXu+5704SCgjWEujjRKeziaSqASQU8wwcMf5dbmto/veZdNtANLBtBitx
        hPsPm40pw==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqhnp-0008RF-EK; Thu, 25 Jul 2019 17:45:17 +0000
Date:   Thu, 25 Jul 2019 14:45:13 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
Message-ID: <20190725144513.4e41c80a@coco.lan>
In-Reply-To: <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
References: <20190715212316.352-1-ezequiel@collabora.com>
        <20190715212316.352-3-ezequiel@collabora.com>
        <20190725125730.2218f0a8@coco.lan>
        <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 25 Jul 2019 14:05:58 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

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
> > > -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> > >  
> > >  comment "Multistandard (satellite) frontends"
> > >  	depends on DVB_CORE
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 79ce9ec6fc1b..475072bb67d6 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
> > >  #
> > >  
> > >  menu "I2C Encoders, decoders, sensors and other helper chips"
> > > -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT  
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
> > 	menu "foo"
> > 	    visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT
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

There are not zillion of media menu options. We want to make as easy as
possible for people that, for instance, rebuilds the media subsystem
from:
	https://git.linuxtv.org/media_build.git/

For them to be able to build the driver they need without need to
be a technical person that knows what SAA711X means, and why
it shouldn't select TVP5150 if he has a board supported by the USBVision
driver.

> Now, while I would agree with EMBEDDED, the problem with that is that
> many "embedded" platforms don't enable EMBEDDED. So, it's not that useful.

Well, so the problem is elsewhere, not on media.

> 
> Finally, let me give an example of why hiding the menus is so bad.
> Normally, to enable a symbol, we use the search tool.
> 
> Now, when MEDIA_SUBDRV_AUTOSELECT=y, the search tool will _not_ take you
> there and there's no indication why.

If the search tool is not capable of properly handling visible
and explain why a symbol can't be selected, it should be fixed.

Thanks,
Mauro
