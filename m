Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6367534D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 17:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387660AbfGYP5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 11:57:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51448 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfGYP5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 11:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xi0m+r98hv4YyRdAuVgrIQAcj/fCNe/oPFIbM/tAuXM=; b=Pm0kunYXVbn7vDwnLMw5ByCFU
        IOlc8EjFdEEDh7ZVJkeC2GMd9T2hAjPqzFoevdyPZAVOIGPnT3efGWFqL9wutiNCp3l+I1NsoO1V6
        8rHttxemTIj9CeCR3kZ6OZS48ViEDHymhzH2Bg6O5waKhHRFs34cQxTm4oqisdLt/DfpyhvhRlOnY
        I3rmnuMY3USrtVZcG/pAgrx30qbTMxNYPBZ8TyCMwn98GSmWTjmMz9zaqahks0U4y3KRTnhoE/6Rq
        JUmOU3xvu/ceoNjjbDQLVd/4qS5MCNrdsMD0LwuQHm5+dM2bpyMQXq8dZHmVLYFjjo79oUaEHEns1
        k0P4ASanw==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqg7a-0000Jr-AX; Thu, 25 Jul 2019 15:57:34 +0000
Date:   Thu, 25 Jul 2019 12:57:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
Message-ID: <20190725125730.2218f0a8@coco.lan>
In-Reply-To: <20190715212316.352-3-ezequiel@collabora.com>
References: <20190715212316.352-1-ezequiel@collabora.com>
        <20190715212316.352-3-ezequiel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 15 Jul 2019 18:23:16 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Many users have been complaining about not being able to find
> certain menu options. One such example are camera sensor drivers
> (e.g IMX219, OV5645, etc) which are common on embedded platforms
> and not always ancillary devices.
> 
> The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
> to the fact that it uses the "visible" kbuild syntax to hide
> entire group of drivers.
> 
> This is not obvious and, as explained above, not always desired.
> 
> To fix the problem, drop the "visible" and stop hiding any menu
> options. Users skilled enough to configure their kernel are expected
> to be skilled enough to know what (not) to configure anyway.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/dvb-frontends/Kconfig | 1 -
>  drivers/media/i2c/Kconfig           | 1 -
>  drivers/media/spi/Kconfig           | 1 -
>  drivers/media/tuners/Kconfig        | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> index dc43749177df..2d1fea3bf546 100644
> --- a/drivers/media/dvb-frontends/Kconfig
> +++ b/drivers/media/dvb-frontends/Kconfig
> @@ -1,5 +1,4 @@
>  menu "Customise DVB Frontends"
> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>  
>  comment "Multistandard (satellite) frontends"
>  	depends on DVB_CORE
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 79ce9ec6fc1b..475072bb67d6 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
>  #
>  
>  menu "I2C Encoders, decoders, sensors and other helper chips"
> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT

Hmm... Hans picked this patch, but IMO it doesn't make sense
for PC consumer people to see the hundreds of extra options
that making those menus visible will produce.

This was added because in the past we had lots of issues with
people desktop/laptop settings with all those things enabled.

In any case, if the desktop/laptop user is smart enough to
go though it, he can simply disable MEDIA_SUBDRV_AUTOSELECT and
manually select what he wants, so I really miss the point of
making those stuff always visible.

Now, from this patch's comments, it seems that you want this
to be visible if CONFIG_EMBEDDED. So, I won't complain if you
replace the changes on this patch to:

	menu "foo"
	    visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT

In other words, for the normal guy that just wants to build the
latest media stuff for his PC camera or TV device to work, he won't
need to dig into hundreds of things that won't make any difference
if he enables, except for making the Kernel bigger.


>  
>  comment "Audio decoders, processors and mixers"
>  
> diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
> index 08386abb9bbc..d94921fe3db5 100644
> --- a/drivers/media/spi/Kconfig
> +++ b/drivers/media/spi/Kconfig
> @@ -2,7 +2,6 @@
>  if VIDEO_V4L2
>  
>  menu "SPI helper chips"
> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>  
>  config VIDEO_GS1662
>  	tristate "Gennum Serializers video"
> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> index a7108e575e9b..01212df505ae 100644
> --- a/drivers/media/tuners/Kconfig
> +++ b/drivers/media/tuners/Kconfig
> @@ -16,7 +16,6 @@ config MEDIA_TUNER
>  	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
>  
>  menu "Customize TV tuners"
> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>  	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
>  
>  config MEDIA_TUNER_SIMPLE



Thanks,
Mauro
