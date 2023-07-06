Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2641274A110
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 17:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbjGFPdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 11:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbjGFPdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 11:33:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E98CCE
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 08:33:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-48-60.reb.o2.cz [85.160.48.60])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1072D01;
        Thu,  6 Jul 2023 17:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688657584;
        bh=gm0ffGr+6CxQ2ndRztFgMa8JTxyZtssGrG5RSS493f8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d/yGOI/LadgMiSmETizy29VNABDQn0oZeVHJ59TkjQBKtP7bfdvIV8D7kNtYv7nCX
         tfBTEdU4TYmpe8aGX02Zt4fFZlsHmwCKliAiqVolaIjxIgmTp8Zw6C7L129JntAbUn
         mnK+sOsCZoZ4PHuPO5OoK+9fLxFKS5ZiI4B4o6B4=
Date:   Thu, 6 Jul 2023 18:33:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Remove common dependencies from
 sensor drivers
Message-ID: <20230706153348.GB24758@pendragon.ideasonboard.com>
References: <20230706093352.193513-1-sakari.ailus@linux.intel.com>
 <20230706093352.193513-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230706093352.193513-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Jul 06, 2023 at 12:33:52PM +0300, Sakari Ailus wrote:
> As selecting V4L2_FWNODE, MEDIA_CONTROLLER and VIDEO_V4L2_SUBDEV_API are
> now done in the top level menu, they can be dropped from individual
> drivers. Also dropped selecting V4L2_ASYNC for a single driver as this is
> already implied by V4L2_FWNODE.
> 
> Similarly, the I2C dependency is now also in the top level menu, so remove
> it, as well as VIDEO_DEV which isn't needed by camera sensor drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig        | 223 ++-----------------------------
>  drivers/media/i2c/ccs/Kconfig    |   5 +-
>  drivers/media/i2c/et8ek8/Kconfig |   4 -
>  3 files changed, 10 insertions(+), 222 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index ad955bfa6f01..b03b4ffb5eeb 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -43,10 +43,6 @@ config VIDEO_CCS_PLL
>  
>  config VIDEO_AR0521
>  	tristate "ON Semiconductor AR0521 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the ON Semiconductor
>  	  AR0521 camera.
> @@ -56,10 +52,6 @@ config VIDEO_AR0521
>  
>  config VIDEO_HI556
>  	tristate "Hynix Hi-556 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Hynix
>  	  Hi-556 camera.
> @@ -69,10 +61,6 @@ config VIDEO_HI556
>  
>  config VIDEO_HI846
>  	tristate "Hynix Hi-846 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Hynix
>  	  Hi-846 camera.
> @@ -82,10 +70,6 @@ config VIDEO_HI846
>  
>  config VIDEO_HI847
>          tristate "Hynix Hi-847 sensor support"
> -        depends on I2C && VIDEO_DEV
> -        select MEDIA_CONTROLLER
> -        select VIDEO_V4L2_SUBDEV_API
> -        select V4L2_FWNODE
>          help
>            This is a Video4Linux2 sensor driver for the Hynix
>            Hi-847 camera.
> @@ -95,10 +79,6 @@ config VIDEO_HI847
>  
>  config VIDEO_IMX208
>  	tristate "Sony IMX208 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	depends on MEDIA_CAMERA_SUPPORT
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX208 camera.
> @@ -108,10 +88,7 @@ config VIDEO_IMX208
>  
>  config VIDEO_IMX214
>  	tristate "Sony IMX214 sensor support"
> -	depends on GPIOLIB && I2C && VIDEO_DEV
> -	select V4L2_FWNODE
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> +	depends on GPIOLIB
>  	select REGMAP_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
> @@ -122,10 +99,6 @@ config VIDEO_IMX214
>  
>  config VIDEO_IMX219
>  	tristate "Sony IMX219 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX219 camera.
> @@ -135,9 +108,6 @@ config VIDEO_IMX219
>  
>  config VIDEO_IMX258
>  	tristate "Sony IMX258 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX258 camera.
> @@ -147,9 +117,6 @@ config VIDEO_IMX258
>  
>  config VIDEO_IMX274
>  	tristate "Sony IMX274 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
>  	help
>  	  This is a V4L2 sensor driver for the Sony IMX274
> @@ -157,11 +124,7 @@ config VIDEO_IMX274
>  
>  config VIDEO_IMX290
>  	tristate "Sony IMX290 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX290 camera sensor.
> @@ -171,10 +134,6 @@ config VIDEO_IMX290
>  
>  config VIDEO_IMX296
>  	tristate "Sony IMX296 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX296 camera.
> @@ -184,9 +143,6 @@ config VIDEO_IMX296
>  
>  config VIDEO_IMX319
>  	tristate "Sony IMX319 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX319 camera.
> @@ -197,10 +153,6 @@ config VIDEO_IMX319
>  config VIDEO_IMX334
>  	tristate "Sony IMX334 sensor support"
>  	depends on OF_GPIO
> -	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX334 camera.
> @@ -211,10 +163,6 @@ config VIDEO_IMX334
>  config VIDEO_IMX335
>  	tristate "Sony IMX335 sensor support"
>  	depends on OF_GPIO
> -	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX335 camera.
> @@ -224,9 +172,6 @@ config VIDEO_IMX335
>  
>  config VIDEO_IMX355
>  	tristate "Sony IMX355 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX355 camera.
> @@ -237,10 +182,6 @@ config VIDEO_IMX355
>  config VIDEO_IMX412
>  	tristate "Sony IMX412 sensor support"
>  	depends on OF_GPIO
> -	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX412 camera.
> @@ -251,10 +192,6 @@ config VIDEO_IMX412
>  config VIDEO_IMX415
>  	tristate "Sony IMX415 sensor support"
>  	depends on OF_GPIO
> -	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX415 camera.
> @@ -267,35 +204,25 @@ config VIDEO_MAX9271_LIB
>  
>  config VIDEO_MT9M001
>  	tristate "mt9m001 support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This driver supports MT9M001 cameras from Micron, monochrome
>  	  and colour models.
>  
>  config VIDEO_MT9M111
>  	tristate "mt9m111, mt9m112 and mt9m131 support"
> -	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
>  	  Micron/Aptina
>  
>  config VIDEO_MT9P031
>  	tristate "Aptina MT9P031 support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEO_APTINA_PLL
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Aptina
>  	  (Micron) mt9p031 5 Mpixel camera.
>  
>  config VIDEO_MT9T112
>  	tristate "Aptina MT9T111/MT9T112 support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a Video4Linux2 sensor driver for the Aptina
>  	  (Micron) MT9T111 and MT9T112 3 Mpixel camera.
> @@ -305,7 +232,6 @@ config VIDEO_MT9T112
>  
>  config VIDEO_MT9V011
>  	tristate "Micron mt9v011 sensor support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a Video4Linux2 sensor driver for the Micron
>  	  mt0v011 1.3 Mpixel camera.  It currently only works with the
> @@ -313,18 +239,13 @@ config VIDEO_MT9V011
>  
>  config VIDEO_MT9V032
>  	tristate "Micron MT9V032 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Micron
>  	  MT9V032 752x480 CMOS sensor.
>  
>  config VIDEO_MT9V111
>  	tristate "Aptina MT9V111 sensor support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a Video4Linux2 sensor driver for the Aptina/Micron
>  	  MT9V111 sensor.
> @@ -334,10 +255,6 @@ config VIDEO_MT9V111
>  
>  config VIDEO_OG01A1B
>  	tristate "OmniVision OG01A1B sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OG01A1B camera.
> @@ -347,10 +264,6 @@ config VIDEO_OG01A1B
>  
>  config VIDEO_OV01A10
>  	tristate "OmniVision OV01A10 sensor support"
> -	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV01A10 camera.
> @@ -360,10 +273,6 @@ config VIDEO_OV01A10
>  
>  config VIDEO_OV02A10
>  	tristate "OmniVision OV02A10 sensor support"
> -	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV02A10 camera.
> @@ -373,10 +282,6 @@ config VIDEO_OV02A10
>  
>  config VIDEO_OV08D10
>          tristate "OmniVision OV08D10 sensor support"
> -        depends on I2C && VIDEO_DEV
> -        select MEDIA_CONTROLLER
> -        select VIDEO_V4L2_SUBDEV_API
> -        select V4L2_FWNODE
>          help
>            This is a Video4Linux2 sensor driver for the OmniVision
>            OV08D10 camera sensor.
> @@ -386,10 +291,6 @@ config VIDEO_OV08D10
>  
>  config VIDEO_OV08X40
>  	tristate "OmniVision OV08X40 sensor support"
> -	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV08X40 camera.
> @@ -399,28 +300,18 @@ config VIDEO_OV08X40
>  
>  config VIDEO_OV13858
>  	tristate "OmniVision OV13858 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV13858 camera.
>  
>  config VIDEO_OV13B10
>  	tristate "OmniVision OV13B10 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV13B10 camera.
>  
>  config VIDEO_OV2640
>  	tristate "OmniVision OV2640 sensor support"
> -	depends on VIDEO_DEV && I2C
> -	select V4L2_ASYNC
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2640 camera.
> @@ -430,8 +321,7 @@ config VIDEO_OV2640
>  
>  config VIDEO_OV2659
>  	tristate "OmniVision OV2659 sensor support"
> -	depends on VIDEO_DEV && I2C && GPIOLIB
> -	select V4L2_FWNODE
> +	depends on GPIOLIB
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2659 camera.
> @@ -441,9 +331,6 @@ config VIDEO_OV2659
>  
>  config VIDEO_OV2680
>  	tristate "OmniVision OV2680 sensor support"
> -	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2680 camera.
> @@ -453,10 +340,6 @@ config VIDEO_OV2680
>  
>  config VIDEO_OV2685
>  	tristate "OmniVision OV2685 sensor support"
> -	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2685 camera.
> @@ -466,11 +349,7 @@ config VIDEO_OV2685
>  
>  config VIDEO_OV2740
>  	tristate "OmniVision OV2740 sensor support"
> -	depends on VIDEO_DEV && I2C
>  	depends on ACPI || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	select REGMAP_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
> @@ -481,10 +360,7 @@ config VIDEO_OV2740
>  
>  config VIDEO_OV4689
>  	tristate "OmniVision OV4689 sensor support"
> -	depends on GPIOLIB && VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on GPIOLIB
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the OmniVision
>  	  OV4689 camera.
> @@ -495,10 +371,7 @@ config VIDEO_OV4689
>  config VIDEO_OV5640
>  	tristate "OmniVision OV5640 sensor support"
>  	depends on OF
> -	depends on GPIOLIB && VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on GPIOLIB
>  	help
>  	  This is a Video4Linux2 sensor driver for the Omnivision
>  	  OV5640 camera sensor with a MIPI CSI-2 interface.
> @@ -506,10 +379,6 @@ config VIDEO_OV5640
>  config VIDEO_OV5645
>  	tristate "OmniVision OV5645 sensor support"
>  	depends on OF
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5645 camera.
> @@ -519,10 +388,6 @@ config VIDEO_OV5645
>  
>  config VIDEO_OV5647
>  	tristate "OmniVision OV5647 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5647 camera.
> @@ -532,10 +397,7 @@ config VIDEO_OV5647
>  
>  config VIDEO_OV5648
>  	tristate "OmniVision OV5648 sensor support"
> -	depends on I2C && PM && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on PM
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5648 camera.
> @@ -545,10 +407,6 @@ config VIDEO_OV5648
>  
>  config VIDEO_OV5670
>  	tristate "OmniVision OV5670 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5670 camera.
> @@ -558,10 +416,6 @@ config VIDEO_OV5670
>  
>  config VIDEO_OV5675
>  	tristate "OmniVision OV5675 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5675 camera.
> @@ -571,8 +425,6 @@ config VIDEO_OV5675
>  
>  config VIDEO_OV5693
>  	tristate "OmniVision OV5693 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5693 camera.
> @@ -582,8 +434,6 @@ config VIDEO_OV5693
>  
>  config VIDEO_OV5695
>  	tristate "OmniVision OV5695 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5695 camera.
> @@ -593,7 +443,6 @@ config VIDEO_OV5695
>  
>  config VIDEO_OV6650
>  	tristate "OmniVision OV6650 sensor support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV6650 camera.
> @@ -603,10 +452,6 @@ config VIDEO_OV6650
>  
>  config VIDEO_OV7251
>  	tristate "OmniVision OV7251 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV7251 camera.
> @@ -616,7 +461,6 @@ config VIDEO_OV7251
>  
>  config VIDEO_OV7640
>  	tristate "OmniVision OV7640 sensor support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV7640 camera.
> @@ -626,8 +470,6 @@ config VIDEO_OV7640
>  
>  config VIDEO_OV7670
>  	tristate "OmniVision OV7670 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV7670 VGA camera.  It currently only works with the M88ALP01
> @@ -635,9 +477,7 @@ config VIDEO_OV7670
>  
>  config VIDEO_OV772X
>  	tristate "OmniVision OV772x sensor support"
> -	depends on I2C && VIDEO_DEV
>  	select REGMAP_SCCB
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV772x camera.
> @@ -647,7 +487,6 @@ config VIDEO_OV772X
>  
>  config VIDEO_OV7740
>  	tristate "OmniVision OV7740 sensor support"
> -	depends on I2C && VIDEO_DEV
>  	select REGMAP_SCCB
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
> @@ -655,10 +494,6 @@ config VIDEO_OV7740
>  
>  config VIDEO_OV8856
>  	tristate "OmniVision OV8856 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV8856 camera sensor.
> @@ -668,10 +503,7 @@ config VIDEO_OV8856
>  
>  config VIDEO_OV8858
>  	tristate "OmniVision OV8858 sensor support"
> -	depends on I2C && PM && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on PM
>  	help
>  	  This is a Video4Linux2 sensor driver for OmniVision
>  	  OV8858 camera sensor.
> @@ -681,10 +513,7 @@ config VIDEO_OV8858
>  
>  config VIDEO_OV8865
>  	tristate "OmniVision OV8865 sensor support"
> -	depends on I2C && PM && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on PM
>  	help
>  	  This is a Video4Linux2 sensor driver for OmniVision
>  	  OV8865 camera sensor.
> @@ -695,10 +524,6 @@ config VIDEO_OV8865
>  config VIDEO_OV9282
>  	tristate "OmniVision OV9282 sensor support"
>  	depends on OF_GPIO
> -	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV9282 camera sensor.
> @@ -708,16 +533,12 @@ config VIDEO_OV9282
>  
>  config VIDEO_OV9640
>  	tristate "OmniVision OV9640 sensor support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV9640 camera sensor.
>  
>  config VIDEO_OV9650
>  	tristate "OmniVision OV9650/OV9652 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_SCCB
>  	help
>  	  This is a V4L2 sensor driver for the Omnivision
> @@ -725,11 +546,7 @@ config VIDEO_OV9650
>  
>  config VIDEO_OV9734
>  	tristate "OmniVision OV9734 sensor support"
> -	depends on VIDEO_DEV && I2C
>  	depends on ACPI || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV9734 camera.
> @@ -739,10 +556,6 @@ config VIDEO_OV9734
>  
>  config VIDEO_RDACM20
>  	tristate "IMI RDACM20 camera support"
> -	depends on I2C
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
>  	select VIDEO_MAX9271_LIB
>  	help
>  	  This driver supports the IMI RDACM20 GMSL camera, used in
> @@ -753,10 +566,6 @@ config VIDEO_RDACM20
>  
>  config VIDEO_RDACM21
>  	tristate "IMI RDACM21 camera support"
> -	depends on I2C
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
>  	select VIDEO_MAX9271_LIB
>  	help
>  	  This driver supports the IMI RDACM21 GMSL camera, used in
> @@ -767,7 +576,6 @@ config VIDEO_RDACM21
>  
>  config VIDEO_RJ54N1
>  	tristate "Sharp RJ54N1CB0C sensor support"
> -	depends on I2C && VIDEO_DEV
>  	help
>  	  This is a V4L2 sensor driver for Sharp RJ54N1CB0C CMOS image
>  	  sensor.
> @@ -777,39 +585,26 @@ config VIDEO_RJ54N1
>  
>  config VIDEO_S5C73M3
>  	tristate "Samsung S5C73M3 sensor support"
> -	depends on I2C && SPI && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on SPI
>  	help
>  	  This is a V4L2 sensor driver for Samsung S5C73M3
>  	  8 Mpixel camera.
>  
>  config VIDEO_S5K5BAF
>  	tristate "Samsung S5K5BAF sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
>  	  camera sensor with an embedded SoC image signal processor.
>  
>  config VIDEO_S5K6A3
>  	tristate "Samsung S5K6A3 sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
>  	  camera sensor.
>  
>  config VIDEO_ST_VGXY61
>  	tristate "ST VGXY61 sensor support"
> -	depends on OF && GPIOLIB && VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
> +	depends on OF && GPIOLIB
>  	help
>  	  This is a Video4Linux2 sensor driver for the ST VGXY61
>  	  camera sensor.
> diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
> index 71671db3d993..b55c93a2e204 100644
> --- a/drivers/media/i2c/ccs/Kconfig
> +++ b/drivers/media/i2c/ccs/Kconfig
> @@ -1,11 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_CCS
>  	tristate "MIPI CCS/SMIA++/SMIA sensor support"
> -	depends on I2C && VIDEO_DEV && HAVE_CLK
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> +	depends on HAVE_CLK
>  	select VIDEO_CCS_PLL
> -	select V4L2_FWNODE
>  	help
>  	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
>  	  camera sensors.
> diff --git a/drivers/media/i2c/et8ek8/Kconfig b/drivers/media/i2c/et8ek8/Kconfig
> index 398dd4d21df1..987fc62d5e6b 100644
> --- a/drivers/media/i2c/et8ek8/Kconfig
> +++ b/drivers/media/i2c/et8ek8/Kconfig
> @@ -1,10 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_ET8EK8
>  	tristate "ET8EK8 camera sensor support"
> -	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a driver for the Toshiba ET8EK8 5 MP camera sensor.
>  	  It is used for example in Nokia N900 (RX-51).
> 

-- 
Regards,

Laurent Pinchart
