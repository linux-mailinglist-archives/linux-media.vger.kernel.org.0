Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0751C1AA8E2
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 15:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633377AbgDONmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 09:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:36780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730647AbgDONml (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 09:42:41 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9492E20767;
        Wed, 15 Apr 2020 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586958160;
        bh=G3ksAsgoVdvVoOXZeIFexuS2cxmkIclH0f7tRwcz0O0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sEqXk+a9IguDdfV4+H4arsbiSyBXB5X2kIc/aRjioG0s4XzTDWQ8tG458vH2jGqph
         ftvBbd+3vapXQaFq2P9XBOk/QhTYJjir7uYHOKZ8BjaXbdyKwKwh+m+JzuOJMMm0Rt
         /CqWMFRT41ijrdE4lpvsMmbLmGW8q2Q6WNDbRtlY=
Date:   Wed, 15 Apr 2020 15:42:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Stefan Agner <stefan@agner.ch>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] media: i2c/Kconfig: use sub-menus for I2C support
Message-ID: <20200415154101.002be2bc@coco.lan>
In-Reply-To: <2f31a4cb-7838-eaf1-3055-ead1ed877b9f@xs4all.nl>
References: <ab8d95a0d04beb854accf5428c5ead2b191a269d.1586955665.git.mchehab+huawei@kernel.org>
        <2f31a4cb-7838-eaf1-3055-ead1ed877b9f@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 15 Apr 2020 15:16:02 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 15/04/2020 15:01, Mauro Carvalho Chehab wrote:
> > There are *lots* of I2C ancillary drivers. While we're using
> > comments to group them, all options appear at the same menu.
> > 
> > It should be a lot clearer to group them into sub-menus, with
> > may help people to go directly to the driver(s) he's needing
> > to enable.  
> 
> Looks good, but I would drop the "Video and audio decoders" submenu
> and just move everything there under "Video decoders". I don't think
> it warrants a separate submenu.

Fair enough. Just submitted a second version.

I opted to keep "Video and audio decoders" as a comment, as, if we
ever add some other A/V decoder, developers should place it together
with the other ones.

> 
> With that change:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/Kconfig               |  1 -
> >  drivers/media/dvb-frontends/Kconfig |  2 +-
> >  drivers/media/i2c/Kconfig           | 68 +++++++++++++++++++----------
> >  drivers/media/spi/Kconfig           |  4 +-
> >  drivers/media/tuners/Kconfig        |  2 +-
> >  5 files changed, 49 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index 8694e3c6d183..43012e1da108 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -244,7 +244,6 @@ config MEDIA_HIDE_ANCILLARY_SUBDRV
> >  	default y
> >  
> >  menu "Media ancillary drivers"
> > -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config MEDIA_ATTACH
> >  	bool
> > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > index aa24506257b3..fbadba9b328e 100644
> > --- a/drivers/media/dvb-frontends/Kconfig
> > +++ b/drivers/media/dvb-frontends/Kconfig
> > @@ -2,7 +2,7 @@
> >  
> >  if MEDIA_DIGITAL_TV_SUPPORT
> >  
> > -comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
> > +comment "DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'"
> >  	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  menu "Customise DVB Frontends"
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index efd12bf4f8eb..e4870268cbb2 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -5,6 +5,9 @@
> >  
> >  if VIDEO_V4L2
> >  
> > +comment "IR I2C driver auto-selected by 'Autoselect ancillary drivers'"
> > +	depends on MEDIA_SUBDRV_AUTOSELECT && I2C && RC_CORE
> > +
> >  config VIDEO_IR_I2C
> >  	tristate "I2C module for IR" if !MEDIA_SUBDRV_AUTOSELECT || EXPERT
> >  	depends on I2C && RC_CORE
> > @@ -22,17 +25,14 @@ config VIDEO_IR_I2C
> >  # V4L2 I2C drivers that aren't related with Camera support
> >  #
> >  
> > -comment "I2C drivers hidden by 'Autoselect ancillary drivers'"
> > +comment "audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> >  	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> > -
> > -menu "I2C Encoders, decoders, sensors and other helper chips"
> > -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> > -
> >  #
> >  # Encoder / Decoder module configuration
> >  #
> >  
> > -comment "Audio decoders, processors and mixers"
> > +menu "Audio decoders, processors and mixers"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_TVAUDIO
> >  	tristate "Simple audio decoder chips"
> > @@ -191,8 +191,10 @@ config VIDEO_SONY_BTF_MPX
> >  
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called sony-btf-mpx.
> > +endmenu
> >  
> > -comment "RDS decoders"
> > +menu "RDS decoders"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_SAA6588
> >  	tristate "SAA6588 Radio Chip RDS decoder support"
> > @@ -205,8 +207,10 @@ config VIDEO_SAA6588
> >  
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called saa6588.
> > +endmenu
> >  
> > -comment "Video decoders"
> > +menu "Video decoders"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_ADV7180
> >  	tristate "Analog Devices ADV7180 decoder"
> > @@ -459,8 +463,10 @@ config VIDEO_VPX3220
> >  
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called vpx3220.
> > +endmenu
> >  
> > -comment "Video and audio decoders"
> > +menu "Video and audio decoders"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_SAA717X
> >  	tristate "Philips SAA7171/3/4 audio/video decoders"
> > @@ -473,7 +479,10 @@ config VIDEO_SAA717X
> >  
> >  source "drivers/media/i2c/cx25840/Kconfig"
> >  
> > -comment "Video encoders"
> > +endmenu
> > +
> > +menu "Video encoders"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_SAA7127
> >  	tristate "Philips SAA7127/9 digital video encoders"
> > @@ -580,8 +589,10 @@ config VIDEO_THS8200
> >  
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called ths8200.
> > +endmenu
> >  
> > -comment "Video improvement chips"
> > +menu "Video improvement chips"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_UPD64031A
> >  	tristate "NEC Electronics uPD64031A Ghost Reduction"
> > @@ -605,8 +616,10 @@ config VIDEO_UPD64083
> >  
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called upd64083.
> > +endmenu
> >  
> > -comment "Audio/Video compression chips"
> > +menu "Audio/Video compression chips"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_SAA6752HS
> >  	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
> > @@ -619,7 +632,10 @@ config VIDEO_SAA6752HS
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called saa6752hs.
> >  
> > -comment "SDR tuner chips"
> > +endmenu
> > +
> > +menu "SDR tuner chips"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config SDR_MAX2175
> >  	tristate "Maxim 2175 RF to Bits tuner"
> > @@ -632,7 +648,11 @@ config SDR_MAX2175
> >  	  To compile this driver as a module, choose M here; the
> >  	  module will be called max2175.
> >  
> > -comment "Miscellaneous helper chips"
> > +
> > +endmenu
> > +
> > +menu "Miscellaneous helper chips"
> > +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> >  
> >  config VIDEO_THS7303
> >  	tristate "THS7303/53 Video Amplifier"
> > @@ -679,16 +699,14 @@ config VIDEO_ST_MIPID02
> >  
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called st-mipid02.
> > -
> >  endmenu
> >  
> >  #
> > -# All drivers that are related to Media Camera Support should be here
> > +# V4L2 I2C drivers that are related with Camera support
> >  #
> >  
> > -if MEDIA_CAMERA_SUPPORT
> > -
> > -comment "Camera sensor devices"
> > +menu "Camera sensor devices"
> > +	visible if MEDIA_CAMERA_SUPPORT
> >  
> >  config VIDEO_APTINA_PLL
> >  	tristate
> > @@ -1189,7 +1207,10 @@ config VIDEO_S5C73M3
> >  	  This is a V4L2 sensor driver for Samsung S5C73M3
> >  	  8 Mpixel camera.
> >  
> > -comment "Lens drivers"
> > +endmenu
> > +
> > +menu "Lens drivers"
> > +	visible if MEDIA_CAMERA_SUPPORT
> >  
> >  config VIDEO_AD5820
> >  	tristate "AD5820 lens voice coil support"
> > @@ -1232,8 +1253,10 @@ config VIDEO_DW9807_VCM
> >  	  capability. This is designed for linear control of
> >  	  voice coil motors, controlled via I2C serial interface.
> >  
> > +endmenu
> >  
> > -comment "Flash devices"
> > +menu "Flash devices"
> > +	visible if MEDIA_CAMERA_SUPPORT
> >  
> >  config VIDEO_ADP1653
> >  	tristate "ADP1653 flash support"
> > @@ -1260,7 +1283,6 @@ config VIDEO_LM3646
> >  	help
> >  	  This is a driver for the lm3646 dual flash controllers. It controls
> >  	  flash, torch LEDs.
> > -
> > -endif # MEDIA_CAMERA_SUPPORT
> > +endmenu
> >  
> >  endif # VIDEO_V4L2
> > diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
> > index bf385d503cab..857ef4ace6e9 100644
> > --- a/drivers/media/spi/Kconfig
> > +++ b/drivers/media/spi/Kconfig
> > @@ -1,8 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  if VIDEO_V4L2
> >  
> > -comment "SPI drivers hidden by 'Autoselect ancillary drivers'"
> > -	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> > +comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> > +	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
> >  
> >  menu "SPI helper chips"
> >  	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> > diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> > index e104bb7766e1..2368b0e230e5 100644
> > --- a/drivers/media/tuners/Kconfig
> > +++ b/drivers/media/tuners/Kconfig
> > @@ -15,7 +15,7 @@ config MEDIA_TUNER
> >  	select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
> >  	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
> >  
> > -comment "Tuner drivers hidden by 'Autoselect ancillary drivers'"
> > +comment "Tuner drivers auto-selected by 'Autoselect ancillary drivers'"
> >  	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> >  	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> >  
> >   
> 



Thanks,
Mauro
