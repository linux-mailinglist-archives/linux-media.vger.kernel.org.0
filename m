Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D4C18E1A3
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2020 14:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgCUNwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Mar 2020 09:52:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56668 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgCUNwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Mar 2020 09:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=9zayE4USDkOWrr3DP6CCOiR/yvcA3THc6runKgxQCuE=; b=hrQrpKsz+o9/AeFNtNmjpDVlYt
        a513Yd78ZoprmD6Dxl86UZ0XrzyMqqscqcpFXaYtpQyhNVONAlcT43xIzexrbsHZtFFg61f/s8p7R
        pg+f43/aI3LKFDQ/XvVOieS54+d8riIPH4bceOmQa6MitIxIc3pLvgHqKfHsaL7IF+yLefOXaQblW
        DbX+PwXPKHajPHIkV+39M1/xcv1qrXC8KxO8CIGthEL/wMZ1TPWaBCCUpYrpSS3ebFjAcloEgF6QG
        DXfz/lauFdlYZm6n7kR3Yt1wyQeeYJTTmFLn/Xsr3t5YoO7FlFbNxq927f2Np++JF9iMupZBqyhbH
        gF39Ml5g==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jFeXf-00009W-9C; Sat, 21 Mar 2020 13:51:59 +0000
Date:   Sat, 21 Mar 2020 14:51:45 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Ira Krufky <mkrufky@gmail.com>
Subject: Re: [PATCH] media: Refactor configuration options
Message-ID: <20200321145145.1e895e37@coco.lan>
In-Reply-To: <161f1d82501e168d56ca3e53e8e1fad52869ff5d.camel@collabora.com>
References: <20200321064127.5846-1-ezequiel@collabora.com>
        <20200321113514.63365880@coco.lan>
        <161f1d82501e168d56ca3e53e8e1fad52869ff5d.camel@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 21 Mar 2020 09:39:02 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> > > In other words, the following are removed: MEDIA_ANALOG_TV_SUPPORT,
> > > MEDIA_DIGITAL_TV_SUPPORT, MEDIA_CAMERA_SUPPORT, MEDIA_RADIO_SUPPORT,
> > > MEDIA_CEC_SUPPORT and MEDIA_SDR_SUPPORT.
> > > 
> > > As a result, the configuration is now simplified. Users
> > > will find USB capture devices under "Media USB Adapters",
> > > or CEC adapters under "CEC platform devices", without
> > > the need to enable any other "support" options.  
> > 
> > Nack.
> >   
> 
> Well, at least I got your attention on this topic :-)

:-)

> 
> > Those *_SUPPORT options were added to make life easier for users.
> > There are too many things to be customized for a poor user to
> > select the right options. So, from an end-user's perspective,
> > what he really wants is:
> >   
> 
> Do you think end-user's configure their own kernel?

They actually do, either directly or via media-build tree.

> I was under the assumption an end-user would use
> a distribution kernel. And distributions would take care
> of packaging what end-users need.
> 
> > 	"let me enable my TV card
> > or:
> > 	"I want to enable camera support"
> > 
> > They usually don't know what driver supports it, nor what are
> > the other drivers that should be enabled behind the scenes.
> > 
> > Those options helps the users to reduce the amount of options
> > for them to identify what they really bother, instead of 
> > presenting thousands of options they would need.
> > 
> > Now, if you, instead, add some patch that would allow them
> > to do something like:
> >      
> > 	make board=<usb id> / make board=<pci id>
> > 
> > Then this would be very welcomed.
> >   
> 
> Hm, I see.
> 
> So, another option is to clean memory-to-memory devices
> (codecs). There are no end-users for these devices,
> and they aren't really "Cameras/video grabbers".
> 
> I am not sure why we've added them under CAMERA_SUPPORT.
> I'd love to get rid of at least that dependency.

Good question. Probably because people just re-used what it
was there without thinking too much.

I remember someone once proposed adding an option to add
a "MEDIA_EMBEDDED" (or some other name) that would 
just allow setting everything as if those other *SUPORT
koptions didn't exist.

something like this would do the trick:

	CONFIG_MEDIA_EMBEDDED
		bool

	config MEDIA_CAMERA_SUPPORT
		visible if !CONFIG_MEDIA_EMBEDDED_SUPPORT
		default y if CONFIG_MEDIA_EMBEDDED_SUPPORT

	config MEDIA_ANALOG_TV_SUPPORT
		visible if !CONFIG_MEDIA_EMBEDDED_SUPPORT
		default y if CONFIG_MEDIA_EMBEDDED_SUPPORT

	config MEDIA_DIGITAL_TV_SUPPORT
		visible if !CONFIG_MEDIA_EMBEDDED_SUPPORT
		default y if CONFIG_MEDIA_EMBEDDED_SUPPORT

	config MEDIA_RADIO_SUPPORT
		visible if !CONFIG_MEDIA_EMBEDDED_SUPPORT
		default y if CONFIG_MEDIA_EMBEDDED_SUPPORT

Regards,
Mauro

> 
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 3b9795cfcb36..9382e35211ca 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -5,7 +5,6 @@
>  
>  config MEDIA_CONTROLLER
>  	bool "Media Controller API"
> -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
>  	help
>  	  Enable the media controller API used to query media devices internal
>  	  topology and configure it dynamically.
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index f65e98d3adf2..dc5869dac5dc 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -5,7 +5,6 @@
>  
>  menuconfig V4L_PLATFORM_DRIVERS
>  	bool "V4L platform devices"
> -	depends on MEDIA_CAMERA_SUPPORT
>  	help
>  	  Say Y here to enable support for platform-specific V4L drivers.
>  
> @@ -43,7 +42,6 @@ config VIDEO_ASPEED
>  
>  config VIDEO_SH_VOU
>  	tristate "SuperH VOU video output driver"
> -	depends on MEDIA_CAMERA_SUPPORT
>  	depends on VIDEO_DEV && I2C
>  	depends on ARCH_SHMOBILE || COMPILE_TEST
>  	select VIDEOBUF2_DMA_CONTIG
> @@ -165,7 +163,6 @@ endif # V4L_PLATFORM_DRIVERS
>  menuconfig V4L_MEM2MEM_DRIVERS
>  	bool "Memory-to-memory multimedia devices"
>  	depends on VIDEO_V4L2
> -	depends on MEDIA_CAMERA_SUPPORT
>  	help
>  	  Say Y here to enable selecting drivers for V4L devices that
>  	  use system memory for both source and destination buffers, as opposed
> @@ -522,7 +519,6 @@ config VIDEO_TI_CSC
>  
>  menuconfig V4L_TEST_DRIVERS
>  	bool "Media test drivers"
> -	depends on MEDIA_CAMERA_SUPPORT
>  
>  if V4L_TEST_DRIVERS
>  
> 
> Cheers,
> Ezequiel
> 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/Kconfig                | 61 ----------------------------
> > >  drivers/media/dvb-frontends/Kconfig  |  2 +-
> > >  drivers/media/i2c/Kconfig            | 14 +------
> > >  drivers/media/i2c/m5mols/Kconfig     |  1 -
> > >  drivers/media/i2c/smiapp/Kconfig     |  1 -
> > >  drivers/media/mc/Kconfig             |  1 -
> > >  drivers/media/pci/Kconfig            | 18 ++------
> > >  drivers/media/pci/bt8xx/Kconfig      |  1 -
> > >  drivers/media/platform/Kconfig       |  7 ----
> > >  drivers/media/radio/Kconfig          |  1 -
> > >  drivers/media/tuners/Kconfig         |  8 ++--
> > >  drivers/media/usb/Kconfig            | 29 ++++---------
> > >  drivers/media/usb/dvb-usb-v2/Kconfig |  2 +-
> > >  drivers/media/usb/em28xx/Kconfig     |  4 +-
> > >  drivers/media/usb/go7007/Kconfig     |  2 +-
> > >  sound/pci/Kconfig                    |  2 -
> > >  16 files changed, 20 insertions(+), 134 deletions(-)
> > > 
> > > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > > index 9dfea5c4b6ab..fcbf265a92cd 100644
> > > --- a/drivers/media/Kconfig
> > > +++ b/drivers/media/Kconfig
> > > @@ -30,63 +30,6 @@ comment "Multimedia core support"
> > >  #
> > >  # Multimedia support - automatically enable V4L2 and DVB core
> > >  #
> > > -config MEDIA_CAMERA_SUPPORT
> > > -	bool "Cameras/video grabbers support"
> > > -	help
> > > -	  Enable support for webcams and video grabbers.
> > > -
> > > -	  Say Y when you have a webcam or a video capture grabber board.
> > > -
> > > -config MEDIA_ANALOG_TV_SUPPORT
> > > -	bool "Analog TV support"
> > > -	help
> > > -	  Enable analog TV support.
> > > -
> > > -	  Say Y when you have a TV board with analog support or with a
> > > -	  hybrid analog/digital TV chipset.
> > > -
> > > -	  Note: There are several DVB cards that are based on chips that
> > > -		support both analog and digital TV. Disabling this option
> > > -		will disable support for them.
> > > -
> > > -config MEDIA_DIGITAL_TV_SUPPORT
> > > -	bool "Digital TV support"
> > > -	help
> > > -	  Enable digital TV support.
> > > -
> > > -	  Say Y when you have a board with digital support or a board with
> > > -	  hybrid digital TV and analog TV.
> > > -
> > > -config MEDIA_RADIO_SUPPORT
> > > -	bool "AM/FM radio receivers/transmitters support"
> > > -	help
> > > -	  Enable AM/FM radio support.
> > > -
> > > -	  Additional info and docs are available on the web at
> > > -	  <https://linuxtv.org>
> > > -
> > > -	  Say Y when you have a board with radio support.
> > > -
> > > -	  Note: There are several TV cards that are based on chips that
> > > -		support radio reception. Disabling this option will
> > > -		disable support for them.
> > > -
> > > -config MEDIA_SDR_SUPPORT
> > > -	bool "Software defined radio support"
> > > -	help
> > > -	  Enable software defined radio support.
> > > -
> > > -	  Say Y when you have a software defined radio device.
> > > -
> > > -config MEDIA_CEC_SUPPORT
> > > -	bool "HDMI CEC support"
> > > -	help
> > > -	  Enable support for HDMI CEC (Consumer Electronics Control),
> > > -	  which is an optional HDMI feature.
> > > -
> > > -	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
> > > -	  adapter that supports HDMI CEC.
> > > -
> > >  source "drivers/media/cec/Kconfig"
> > >  
> > >  source "drivers/media/mc/Kconfig"
> > > @@ -99,7 +42,6 @@ source "drivers/media/mc/Kconfig"
> > >  config VIDEO_DEV
> > >  	tristate
> > >  	depends on MEDIA_SUPPORT
> > > -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> > >  	default y
> > >  
> > >  config VIDEO_V4L2_SUBDEV_API
> > > @@ -121,7 +63,6 @@ source "drivers/media/v4l2-core/Kconfig"
> > >  config DVB_CORE
> > >  	tristate
> > >  	depends on MEDIA_SUPPORT
> > > -	depends on MEDIA_DIGITAL_TV_SUPPORT
> > >  	depends on (I2C || I2C=n)
> > >  	default y
> > >  	select CRC32
> > > @@ -186,7 +127,6 @@ comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
> > >  
> > >  config MEDIA_SUBDRV_AUTOSELECT
> > >  	bool "Autoselect ancillary drivers (tuners, sensors, i2c, spi, frontends)"
> > > -	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_CAMERA_SUPPORT || MEDIA_SDR_SUPPORT
> > >  	depends on HAS_IOMEM
> > >  	select I2C
> > >  	select I2C_MUX
> > > @@ -214,7 +154,6 @@ config MEDIA_HIDE_ANCILLARY_SUBDRV
> > >  
> > >  config MEDIA_ATTACH
> > >  	bool
> > > -	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT
> > >  	depends on MODULES
> > >  	default MODULES
> > >  
> > > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > > index a29e9ddf9c82..832f66b91459 100644
> > > --- a/drivers/media/dvb-frontends/Kconfig
> > > +++ b/drivers/media/dvb-frontends/Kconfig
> > > @@ -518,7 +518,7 @@ config DVB_RTL2832
> > >  
> > >  config DVB_RTL2832_SDR
> > >  	tristate "Realtek RTL2832 SDR"
> > > -	depends on DVB_CORE && I2C && I2C_MUX && VIDEO_V4L2 && MEDIA_SDR_SUPPORT && USB
> > > +	depends on DVB_CORE && I2C && I2C_MUX && VIDEO_V4L2 && USB
> > >  	select DVB_RTL2832
> > >  	select VIDEOBUF2_VMALLOC
> > >  	default m if !MEDIA_SUBDRV_AUTOSELECT
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 125d596c13dd..92e51c288321 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -568,8 +568,6 @@ config VIDEO_APTINA_PLL
> > >  config VIDEO_SMIAPP_PLL
> > >  	tristate
> > >  
> > > -if MEDIA_CAMERA_SUPPORT
> > > -
> > >  config VIDEO_HI556
> > >  	tristate "Hynix Hi-556 sensor support"
> > >  	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > @@ -1007,12 +1005,9 @@ config VIDEO_S5C73M3
> > >  	help
> > >  	  This is a V4L2 sensor driver for Samsung S5C73M3
> > >  	  8 Mpixel camera.
> > > -endif
> > >  
> > >  comment "Lens drivers"
> > >  
> > > -if MEDIA_CAMERA_SUPPORT
> > > -
> > >  config VIDEO_AD5820
> > >  	tristate "AD5820 lens voice coil support"
> > >  	depends on GPIOLIB && I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > @@ -1050,12 +1045,8 @@ config VIDEO_DW9807_VCM
> > >  	  capability. This is designed for linear control of
> > >  	  voice coil motors, controlled via I2C serial interface.
> > >  
> > > -endif
> > > -
> > >  comment "Flash devices"
> > >  
> > > -if MEDIA_CAMERA_SUPPORT
> > > -
> > >  config VIDEO_ADP1653
> > >  	tristate "ADP1653 flash support"
> > >  	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > @@ -1079,8 +1070,6 @@ config VIDEO_LM3646
> > >  	  This is a driver for the lm3646 dual flash controllers. It controls
> > >  	  flash, torch LEDs.
> > >  
> > > -endif
> > > -
> > >  comment "Video improvement chips"
> > >  
> > >  config VIDEO_UPD64031A
> > > @@ -1123,7 +1112,7 @@ comment "SDR tuner chips"
> > >  
> > >  config SDR_MAX2175
> > >  	tristate "Maxim 2175 RF to Bits tuner"
> > > -	depends on VIDEO_V4L2 && MEDIA_SDR_SUPPORT && I2C
> > > +	depends on VIDEO_V4L2 && I2C
> > >  	select REGMAP_I2C
> > >  	help
> > >  	  Support for Maxim 2175 tuner. It is an advanced analog/digital
> > > @@ -1169,7 +1158,6 @@ config VIDEO_I2C
> > >  config VIDEO_ST_MIPID02
> > >  	tristate "STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge"
> > >  	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  	select V4L2_FWNODE
> > >  	help
> > >  	  Support for STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge.
> > > diff --git a/drivers/media/i2c/m5mols/Kconfig b/drivers/media/i2c/m5mols/Kconfig
> > > index e573482f269f..91c0dafc7668 100644
> > > --- a/drivers/media/i2c/m5mols/Kconfig
> > > +++ b/drivers/media/i2c/m5mols/Kconfig
> > > @@ -2,6 +2,5 @@
> > >  config VIDEO_M5MOLS
> > >  	tristate "Fujitsu M-5MOLS 8MP sensor support"
> > >  	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  	help
> > >  	  This driver supports Fujitsu M-5MOLS camera sensor with ISP
> > > diff --git a/drivers/media/i2c/smiapp/Kconfig b/drivers/media/i2c/smiapp/Kconfig
> > > index fcaa7f9494a8..a2f5775dfcac 100644
> > > --- a/drivers/media/i2c/smiapp/Kconfig
> > > +++ b/drivers/media/i2c/smiapp/Kconfig
> > > @@ -2,7 +2,6 @@
> > >  config VIDEO_SMIAPP
> > >  	tristate "SMIA++/SMIA sensor support"
> > >  	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && HAVE_CLK
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  	select VIDEO_SMIAPP_PLL
> > >  	select V4L2_FWNODE
> > >  	help
> > > diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> > > index 3b9795cfcb36..9382e35211ca 100644
> > > --- a/drivers/media/mc/Kconfig
> > > +++ b/drivers/media/mc/Kconfig
> > > @@ -5,7 +5,6 @@
> > >  
> > >  config MEDIA_CONTROLLER
> > >  	bool "Media Controller API"
> > > -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> > >  	help
> > >  	  Enable the media controller API used to query media devices internal
> > >  	  topology and configure it dynamically.
> > > diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> > > index dcb3719f440e..3d2cc135acd6 100644
> > > --- a/drivers/media/pci/Kconfig
> > > +++ b/drivers/media/pci/Kconfig
> > > @@ -9,25 +9,20 @@ menuconfig MEDIA_PCI_SUPPORT
> > >  
> > >  if MEDIA_PCI_SUPPORT
> > >  
> > > -if MEDIA_CAMERA_SUPPORT
> > > -	comment "Media capture support"
> > > +comment "Media capture support"
> > >  source "drivers/media/pci/meye/Kconfig"
> > >  source "drivers/media/pci/solo6x10/Kconfig"
> > >  source "drivers/media/pci/sta2x11/Kconfig"
> > >  source "drivers/media/pci/tw5864/Kconfig"
> > >  source "drivers/media/pci/tw68/Kconfig"
> > >  source "drivers/media/pci/tw686x/Kconfig"
> > > -endif
> > >  
> > > -if MEDIA_ANALOG_TV_SUPPORT
> > > -	comment "Media capture/analog TV support"
> > > +comment "Media capture/analog TV support"
> > >  source "drivers/media/pci/ivtv/Kconfig"
> > >  source "drivers/media/pci/saa7146/Kconfig"
> > >  source "drivers/media/pci/dt3155/Kconfig"
> > > -endif
> > >  
> > > -if MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> > > -	comment "Media capture/analog/hybrid TV support"
> > > +comment "Media capture/analog/hybrid TV support"
> > >  source "drivers/media/pci/cx18/Kconfig"
> > >  source "drivers/media/pci/cx23885/Kconfig"
> > >  source "drivers/media/pci/cx25821/Kconfig"
> > > @@ -37,10 +32,7 @@ source "drivers/media/pci/saa7134/Kconfig"
> > >  source "drivers/media/pci/saa7164/Kconfig"
> > >  source "drivers/media/pci/cobalt/Kconfig"
> > >  
> > > -endif
> > > -
> > > -if MEDIA_DIGITAL_TV_SUPPORT
> > > -	comment "Media digital TV PCI Adapters"
> > > +comment "Media digital TV PCI Adapters"
> > >  source "drivers/media/pci/ttpci/Kconfig"
> > >  source "drivers/media/pci/b2c2/Kconfig"
> > >  source "drivers/media/pci/pluto2/Kconfig"
> > > @@ -52,8 +44,6 @@ source "drivers/media/pci/ngene/Kconfig"
> > >  source "drivers/media/pci/ddbridge/Kconfig"
> > >  source "drivers/media/pci/smipcie/Kconfig"
> > >  source "drivers/media/pci/netup_unidvb/Kconfig"
> > > -endif
> > > -
> > >  source "drivers/media/pci/intel/ipu3/Kconfig"
> > >  
> > >  endif #MEDIA_PCI_SUPPORT
> > > diff --git a/drivers/media/pci/bt8xx/Kconfig b/drivers/media/pci/bt8xx/Kconfig
> > > index 75d172a6f54c..a4522c35d606 100644
> > > --- a/drivers/media/pci/bt8xx/Kconfig
> > > +++ b/drivers/media/pci/bt8xx/Kconfig
> > > @@ -5,7 +5,6 @@ config VIDEO_BT848
> > >  	select I2C_ALGOBIT
> > >  	select VIDEOBUF_DMA_SG
> > >  	depends on RC_CORE
> > > -	depends on MEDIA_RADIO_SUPPORT
> > >  	select VIDEO_TUNER
> > >  	select VIDEO_TVEEPROM
> > >  	select VIDEO_MSP3400 if MEDIA_SUBDRV_AUTOSELECT
> > > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > > index e01bbb9dd1c1..6d48338e8100 100644
> > > --- a/drivers/media/platform/Kconfig
> > > +++ b/drivers/media/platform/Kconfig
> > > @@ -5,7 +5,6 @@
> > >  
> > >  menuconfig V4L_PLATFORM_DRIVERS
> > >  	bool "V4L platform devices"
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  	help
> > >  	  Say Y here to enable support for platform-specific V4L drivers.
> > >  
> > > @@ -43,7 +42,6 @@ config VIDEO_ASPEED
> > >  
> > >  config VIDEO_SH_VOU
> > >  	tristate "SuperH VOU video output driver"
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  	depends on VIDEO_DEV && I2C
> > >  	depends on ARCH_SHMOBILE || COMPILE_TEST
> > >  	select VIDEOBUF2_DMA_CONTIG
> > > @@ -165,7 +163,6 @@ endif # V4L_PLATFORM_DRIVERS
> > >  menuconfig V4L_MEM2MEM_DRIVERS
> > >  	bool "Memory-to-memory multimedia devices"
> > >  	depends on VIDEO_V4L2
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  	help
> > >  	  Say Y here to enable selecting drivers for V4L devices that
> > >  	  use system memory for both source and destination buffers, as opposed
> > > @@ -534,7 +531,6 @@ config VIDEO_TI_CSC
> > >  
> > >  menuconfig V4L_TEST_DRIVERS
> > >  	bool "Media test drivers"
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > >  
> > >  if V4L_TEST_DRIVERS
> > >  
> > > @@ -557,7 +553,6 @@ endif #V4L_TEST_DRIVERS
> > >  
> > >  menuconfig DVB_PLATFORM_DRIVERS
> > >  	bool "DVB platform devices"
> > > -	depends on MEDIA_DIGITAL_TV_SUPPORT
> > >  	help
> > >  	  Say Y here to enable support for platform-specific Digital TV drivers.
> > >  
> > > @@ -567,7 +562,6 @@ endif #DVB_PLATFORM_DRIVERS
> > >  
> > >  menuconfig CEC_PLATFORM_DRIVERS
> > >  	bool "CEC platform devices"
> > > -	depends on MEDIA_CEC_SUPPORT
> > >  
> > >  if CEC_PLATFORM_DRIVERS
> > >  
> > > @@ -692,7 +686,6 @@ endif #CEC_PLATFORM_DRIVERS
> > >  
> > >  menuconfig SDR_PLATFORM_DRIVERS
> > >  	bool "SDR platform devices"
> > > -	depends on MEDIA_SDR_SUPPORT
> > >  	help
> > >  	  Say Y here to enable support for platform-specific SDR Drivers.
> > >  
> > > diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
> > > index eb79d99787bd..e19ba6ab6e48 100644
> > > --- a/drivers/media/radio/Kconfig
> > > +++ b/drivers/media/radio/Kconfig
> > > @@ -6,7 +6,6 @@
> > >  menuconfig RADIO_ADAPTERS
> > >  	bool "Radio Adapters"
> > >  	depends on VIDEO_V4L2
> > > -	depends on MEDIA_RADIO_SUPPORT
> > >  	default y
> > >  	help
> > >  	  Say Y here to enable selecting AM/FM radio adapters.
> > > diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> > > index e104bb7766e1..7af7ff174eea 100644
> > > --- a/drivers/media/tuners/Kconfig
> > > +++ b/drivers/media/tuners/Kconfig
> > > @@ -2,26 +2,24 @@
> > >  # Analog TV tuners, auto-loaded via tuner.ko
> > >  config MEDIA_TUNER
> > >  	tristate
> > > -	depends on (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT) && I2C
> > > +	depends on I2C
> > >  	default y
> > >  	select MEDIA_TUNER_XC2028 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_XC4000 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_MT20XX if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_TDA8290 if MEDIA_SUBDRV_AUTOSELECT
> > > -	select MEDIA_TUNER_TEA5761 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
> > > -	select MEDIA_TUNER_TEA5767 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
> > > +	select MEDIA_TUNER_TEA5761 if MEDIA_SUBDRV_AUTOSELECT
> > > +	select MEDIA_TUNER_TEA5767 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_SIMPLE if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
> > >  
> > >  comment "Tuner drivers hidden by 'Autoselect ancillary drivers'"
> > >  	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> > > -	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> > >  
> > >  menu "Customize TV tuners"
> > >  	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
> > > -	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> > >  
> > >  config MEDIA_TUNER_SIMPLE
> > >  	tristate "Simple tuner support"
> > > diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
> > > index e678d3d11467..72c88b1add55 100644
> > > --- a/drivers/media/usb/Kconfig
> > > +++ b/drivers/media/usb/Kconfig
> > > @@ -9,8 +9,7 @@ menuconfig MEDIA_USB_SUPPORT
> > >  
> > >  if MEDIA_USB_SUPPORT
> > >  
> > > -if MEDIA_CAMERA_SUPPORT
> > > -	comment "Webcam devices"
> > > +comment "Webcam devices"
> > >  source "drivers/media/usb/uvc/Kconfig"
> > >  source "drivers/media/usb/gspca/Kconfig"
> > >  source "drivers/media/usb/pwc/Kconfig"
> > > @@ -19,26 +18,19 @@ source "drivers/media/usb/zr364xx/Kconfig"
> > >  source "drivers/media/usb/stkwebcam/Kconfig"
> > >  source "drivers/media/usb/s2255/Kconfig"
> > >  source "drivers/media/usb/usbtv/Kconfig"
> > > -endif
> > >  
> > > -if MEDIA_ANALOG_TV_SUPPORT
> > > -	comment "Analog TV USB devices"
> > > +comment "Analog TV USB devices"
> > >  source "drivers/media/usb/pvrusb2/Kconfig"
> > >  source "drivers/media/usb/hdpvr/Kconfig"
> > >  source "drivers/media/usb/stk1160/Kconfig"
> > >  source "drivers/media/usb/go7007/Kconfig"
> > > -endif
> > >  
> > > -if (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT)
> > > -	comment "Analog/digital TV USB devices"
> > > +comment "Analog/digital TV USB devices"
> > >  source "drivers/media/usb/au0828/Kconfig"
> > >  source "drivers/media/usb/cx231xx/Kconfig"
> > >  source "drivers/media/usb/tm6000/Kconfig"
> > > -endif
> > >  
> > > -
> > > -if I2C && MEDIA_DIGITAL_TV_SUPPORT
> > > -	comment "Digital TV USB devices"
> > > +comment "Digital TV USB devices"
> > >  source "drivers/media/usb/dvb-usb/Kconfig"
> > >  source "drivers/media/usb/dvb-usb-v2/Kconfig"
> > >  source "drivers/media/usb/ttusb-budget/Kconfig"
> > > @@ -46,25 +38,18 @@ source "drivers/media/usb/ttusb-dec/Kconfig"
> > >  source "drivers/media/usb/siano/Kconfig"
> > >  source "drivers/media/usb/b2c2/Kconfig"
> > >  source "drivers/media/usb/as102/Kconfig"
> > > -endif
> > >  
> > > -if (MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT)
> > > -	comment "Webcam, TV (analog/digital) USB devices"
> > > +comment "Webcam, TV (analog/digital) USB devices"
> > >  source "drivers/media/usb/em28xx/Kconfig"
> > > -endif
> > >  
> > > -if MEDIA_SDR_SUPPORT
> > > -	comment "Software defined radio USB devices"
> > > +comment "Software defined radio USB devices"
> > >  source "drivers/media/usb/airspy/Kconfig"
> > >  source "drivers/media/usb/hackrf/Kconfig"
> > >  source "drivers/media/usb/msi2500/Kconfig"
> > > -endif
> > >  
> > > -if MEDIA_CEC_SUPPORT
> > > -	comment "USB HDMI CEC adapters"
> > > +comment "USB HDMI CEC adapters"
> > >  source "drivers/media/usb/pulse8-cec/Kconfig"
> > >  source "drivers/media/usb/rainshadow-cec/Kconfig"
> > > -endif
> > >  
> > >  endif #MEDIA_USB_SUPPORT
> > >  endif #USB
> > > diff --git a/drivers/media/usb/dvb-usb-v2/Kconfig b/drivers/media/usb/dvb-usb-v2/Kconfig
> > > index b21a4d413872..8ebda4361b65 100644
> > > --- a/drivers/media/usb/dvb-usb-v2/Kconfig
> > > +++ b/drivers/media/usb/dvb-usb-v2/Kconfig
> > > @@ -137,7 +137,7 @@ config DVB_USB_RTL28XXU
> > >  	select DVB_CXD2841ER if MEDIA_SUBDRV_AUTOSELECT
> > >  	select DVB_RTL2830
> > >  	select DVB_RTL2832
> > > -	select DVB_RTL2832_SDR if (MEDIA_SUBDRV_AUTOSELECT && MEDIA_SDR_SUPPORT)
> > > +	select DVB_RTL2832_SDR if MEDIA_SUBDRV_AUTOSELECT
> > >  	select DVB_SI2168 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_E4000 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select MEDIA_TUNER_FC0012 if MEDIA_SUBDRV_AUTOSELECT
> > > diff --git a/drivers/media/usb/em28xx/Kconfig b/drivers/media/usb/em28xx/Kconfig
> > > index f2031a933e54..7031d6e80304 100644
> > > --- a/drivers/media/usb/em28xx/Kconfig
> > > +++ b/drivers/media/usb/em28xx/Kconfig
> > > @@ -12,8 +12,8 @@ config VIDEO_EM28XX_V4L2
> > >  	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
> > >  	select VIDEO_TVP5150 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select VIDEO_MSP3400 if MEDIA_SUBDRV_AUTOSELECT
> > > -	select VIDEO_MT9V011 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_CAMERA_SUPPORT
> > > -	select VIDEO_OV2640 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_CAMERA_SUPPORT
> > > +	select VIDEO_MT9V011 if MEDIA_SUBDRV_AUTOSELECT
> > > +	select VIDEO_OV2640 if MEDIA_SUBDRV_AUTOSELECT
> > >  	help
> > >  	  This is a video4linux driver for Empia 28xx based TV cards.
> > >  
> > > diff --git a/drivers/media/usb/go7007/Kconfig b/drivers/media/usb/go7007/Kconfig
> > > index 4ff79940ad8d..533e95375082 100644
> > > --- a/drivers/media/usb/go7007/Kconfig
> > > +++ b/drivers/media/usb/go7007/Kconfig
> > > @@ -12,7 +12,7 @@ config VIDEO_GO7007
> > >  	select VIDEO_TW2804 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select VIDEO_TW9903 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select VIDEO_TW9906 if MEDIA_SUBDRV_AUTOSELECT
> > > -	select VIDEO_OV7640 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_CAMERA_SUPPORT
> > > +	select VIDEO_OV7640 if MEDIA_SUBDRV_AUTOSELECT
> > >  	select VIDEO_UDA1342 if MEDIA_SUBDRV_AUTOSELECT
> > >  	help
> > >  	  This is a video4linux driver for the WIS GO7007 MPEG
> > > diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
> > > index 93bc9bef7641..e68af4112505 100644
> > > --- a/sound/pci/Kconfig
> > > +++ b/sound/pci/Kconfig
> > > @@ -557,7 +557,6 @@ config SND_ES1968_INPUT
> > >  config SND_ES1968_RADIO
> > >  	bool "Enable TEA5757 radio tuner support for es1968"
> > >  	depends on SND_ES1968
> > > -	depends on MEDIA_RADIO_SUPPORT
> > >  	depends on VIDEO_V4L2=y || VIDEO_V4L2=SND_ES1968
> > >  	select RADIO_ADAPTERS
> > >  	select RADIO_TEA575X
> > > @@ -581,7 +580,6 @@ config SND_FM801
> > >  config SND_FM801_TEA575X_BOOL
> > >  	bool "ForteMedia FM801 + TEA5757 tuner"
> > >  	depends on SND_FM801
> > > -	depends on MEDIA_RADIO_SUPPORT
> > >  	depends on VIDEO_V4L2=y || VIDEO_V4L2=SND_FM801
> > >  	select RADIO_ADAPTERS
> > >  	select RADIO_TEA575X  
> > 
> > 
> > Thanks,
> > Mauro  
> 
> 



Thanks,
Mauro
