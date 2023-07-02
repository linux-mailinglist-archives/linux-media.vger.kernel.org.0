Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA1F744E37
	for <lists+linux-media@lfdr.de>; Sun,  2 Jul 2023 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjGBOvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jul 2023 10:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjGBOvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jul 2023 10:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FF0E74
        for <linux-media@vger.kernel.org>; Sun,  2 Jul 2023 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688309446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MpX6VLc4MJWbut1ZBvD2OWLAlVrlSmmuM4Bh2t3Qytc=;
        b=LM7cTqyRzEJOkJ+juF9LBVkG1xWIGP//i7rlZ6bNCuK0hW61eZ2lQFi/Iiaoc2KjUyau+L
        fce2q79Wz5QwnqpgwlS9O8hkkivpAyevicy9+nj8iS4P+DrFs8r7yKIYYucWa5RVKxhn+A
        7TZoiW4kL4XU/+AoiKFGncpSBj28rgs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-CxDFDRFAPgiA_6d3N5tjOg-1; Sun, 02 Jul 2023 10:50:44 -0400
X-MC-Unique: CxDFDRFAPgiA_6d3N5tjOg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9932bf9a1e8so71702266b.0
        for <linux-media@vger.kernel.org>; Sun, 02 Jul 2023 07:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688309444; x=1690901444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpX6VLc4MJWbut1ZBvD2OWLAlVrlSmmuM4Bh2t3Qytc=;
        b=a9EHE4ZeLL+HmgjteNI/Rl9ACG3myeS6BHKaJ04R4JZoKW+Bf+rbf9bxBOj3+vXE/Z
         SrUFe7OLbQqG2/iT78LvcJDpCyUpyCIwvqtQmOCk1kLu4KOjMWhOZAFjGFBcMe6NnL2J
         p9kyRbQGSkS43eiz5FcaplAujkb2skU/YG/VEOwUd4ftQIZRNgGFCTG6REohgZ6OjKnt
         U4OnY89Ab9enlVhI2ikyLgiaM8etNdAJQXcqTWYjw9Va8SOCqg6sUWMVoOWImKzyq/w+
         MNfi9iW6SaqTjPfNnz0ecdvB+osPXsai2hlz/yti4W+QD4tUf+NCzz4UwMV6CUPgNzEU
         jkxA==
X-Gm-Message-State: ABy/qLbr72Y/xVkLIqksHsvfZdh9KtFWuNxnz3alRZzVU/XW2mgbqCI/
        mEURbilrVjyGq9rPi5kVikvZ2eiB7vlvtCQa+A1O3nMYwQ9hvNMz8ZN6gN2jyPEcWalgFug6YJD
        8BM7UMRqNJ2OCBULjGf0EiOk=
X-Received: by 2002:a17:906:3cc:b0:965:6075:d100 with SMTP id c12-20020a17090603cc00b009656075d100mr6135286eja.39.1688309443681;
        Sun, 02 Jul 2023 07:50:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEoTmYgjYBzRDElQtlc15Ak7lb2AihxMI52hJtUKLW5XaPuWF2FWraFnyaHoemHUp5h+2sCvg==
X-Received: by 2002:a17:906:3cc:b0:965:6075:d100 with SMTP id c12-20020a17090603cc00b009656075d100mr6135273eja.39.1688309443152;
        Sun, 02 Jul 2023 07:50:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b00992a8a54f32sm4778001ejb.139.2023.07.02.07.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 07:50:42 -0700 (PDT)
Message-ID: <64072a36-339b-217f-678b-b71ab14362e8@redhat.com>
Date:   Sun, 2 Jul 2023 16:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] media: i2c: Stop selecting common features for
 individual camera drivers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
 <20230630140354.111404-3-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630140354.111404-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/30/23 16:03, Sakari Ailus wrote:
> As selecting V4L2_FWNODE, MEDIA_CONTROLLER and VIDEO_V4L2_SUBDEV_API are
> now selected by the top level menu, they can be dropped from the
> individual drivers. Also dropped selectng V4L2_ASYNC for a single driver
> as this is already implied by V4L2_FWNODE.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/i2c/Kconfig        | 149 -------------------------------
>  drivers/media/i2c/ccs/Kconfig    |   3 -
>  drivers/media/i2c/et8ek8/Kconfig |   3 -
>  3 files changed, 155 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c7ffaa79abeb..d8ea6be924c0 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -44,9 +44,6 @@ config VIDEO_CCS_PLL
>  config VIDEO_AR0521
>  	tristate "ON Semiconductor AR0521 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the ON Semiconductor
>  	  AR0521 camera.
> @@ -57,9 +54,6 @@ config VIDEO_AR0521
>  config VIDEO_HI556
>  	tristate "Hynix Hi-556 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Hynix
>  	  Hi-556 camera.
> @@ -70,9 +64,6 @@ config VIDEO_HI556
>  config VIDEO_HI846
>  	tristate "Hynix Hi-846 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Hynix
>  	  Hi-846 camera.
> @@ -83,9 +74,6 @@ config VIDEO_HI846
>  config VIDEO_HI847
>          tristate "Hynix Hi-847 sensor support"
>          depends on I2C && VIDEO_DEV
> -        select MEDIA_CONTROLLER
> -        select VIDEO_V4L2_SUBDEV_API
> -        select V4L2_FWNODE
>          help
>            This is a Video4Linux2 sensor driver for the Hynix
>            Hi-847 camera.
> @@ -96,9 +84,6 @@ config VIDEO_HI847
>  config VIDEO_IMX208
>  	tristate "Sony IMX208 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	depends on MEDIA_CAMERA_SUPPORT
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX208 camera.
> @@ -109,9 +94,6 @@ config VIDEO_IMX208
>  config VIDEO_IMX214
>  	tristate "Sony IMX214 sensor support"
>  	depends on GPIOLIB && I2C && VIDEO_DEV
> -	select V4L2_FWNODE
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
> @@ -123,9 +105,6 @@ config VIDEO_IMX214
>  config VIDEO_IMX219
>  	tristate "Sony IMX219 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX219 camera.
> @@ -136,8 +115,6 @@ config VIDEO_IMX219
>  config VIDEO_IMX258
>  	tristate "Sony IMX258 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX258 camera.
> @@ -148,8 +125,6 @@ config VIDEO_IMX258
>  config VIDEO_IMX274
>  	tristate "Sony IMX274 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
>  	help
>  	  This is a V4L2 sensor driver for the Sony IMX274
> @@ -158,10 +133,7 @@ config VIDEO_IMX274
>  config VIDEO_IMX290
>  	tristate "Sony IMX290 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX290 camera sensor.
> @@ -172,9 +144,6 @@ config VIDEO_IMX290
>  config VIDEO_IMX296
>  	tristate "Sony IMX296 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX296 camera.
> @@ -185,8 +154,6 @@ config VIDEO_IMX296
>  config VIDEO_IMX319
>  	tristate "Sony IMX319 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX319 camera.
> @@ -198,9 +165,6 @@ config VIDEO_IMX334
>  	tristate "Sony IMX334 sensor support"
>  	depends on OF_GPIO
>  	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX334 camera.
> @@ -212,9 +176,6 @@ config VIDEO_IMX335
>  	tristate "Sony IMX335 sensor support"
>  	depends on OF_GPIO
>  	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX335 camera.
> @@ -225,8 +186,6 @@ config VIDEO_IMX335
>  config VIDEO_IMX355
>  	tristate "Sony IMX355 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX355 camera.
> @@ -238,9 +197,6 @@ config VIDEO_IMX412
>  	tristate "Sony IMX412 sensor support"
>  	depends on OF_GPIO
>  	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX412 camera.
> @@ -252,9 +208,6 @@ config VIDEO_IMX415
>  	tristate "Sony IMX415 sensor support"
>  	depends on OF_GPIO
>  	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX415 camera.
> @@ -268,8 +221,6 @@ config VIDEO_MAX9271_LIB
>  config VIDEO_MT9M001
>  	tristate "mt9m001 support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This driver supports MT9M001 cameras from Micron, monochrome
>  	  and colour models.
> @@ -277,7 +228,6 @@ config VIDEO_MT9M001
>  config VIDEO_MT9M111
>  	tristate "mt9m111, mt9m112 and mt9m131 support"
>  	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
>  	  Micron/Aptina
> @@ -285,10 +235,7 @@ config VIDEO_MT9M111
>  config VIDEO_MT9P031
>  	tristate "Aptina MT9P031 support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEO_APTINA_PLL
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Aptina
>  	  (Micron) mt9p031 5 Mpixel camera.
> @@ -314,10 +261,7 @@ config VIDEO_MT9V011
>  config VIDEO_MT9V032
>  	tristate "Micron MT9V032 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Micron
>  	  MT9V032 752x480 CMOS sensor.
> @@ -335,9 +279,6 @@ config VIDEO_MT9V111
>  config VIDEO_OG01A1B
>  	tristate "OmniVision OG01A1B sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OG01A1B camera.
> @@ -348,9 +289,6 @@ config VIDEO_OG01A1B
>  config VIDEO_OV01A10
>  	tristate "OmniVision OV01A10 sensor support"
>  	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV01A10 camera.
> @@ -361,9 +299,6 @@ config VIDEO_OV01A10
>  config VIDEO_OV02A10
>  	tristate "OmniVision OV02A10 sensor support"
>  	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV02A10 camera.
> @@ -374,9 +309,6 @@ config VIDEO_OV02A10
>  config VIDEO_OV08D10
>          tristate "OmniVision OV08D10 sensor support"
>          depends on I2C && VIDEO_DEV
> -        select MEDIA_CONTROLLER
> -        select VIDEO_V4L2_SUBDEV_API
> -        select V4L2_FWNODE
>          help
>            This is a Video4Linux2 sensor driver for the OmniVision
>            OV08D10 camera sensor.
> @@ -387,9 +319,6 @@ config VIDEO_OV08D10
>  config VIDEO_OV08X40
>  	tristate "OmniVision OV08X40 sensor support"
>  	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV08X40 camera.
> @@ -400,9 +329,6 @@ config VIDEO_OV08X40
>  config VIDEO_OV13858
>  	tristate "OmniVision OV13858 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV13858 camera.
> @@ -410,9 +336,6 @@ config VIDEO_OV13858
>  config VIDEO_OV13B10
>  	tristate "OmniVision OV13B10 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV13B10 camera.
> @@ -420,7 +343,6 @@ config VIDEO_OV13B10
>  config VIDEO_OV2640
>  	tristate "OmniVision OV2640 sensor support"
>  	depends on VIDEO_DEV && I2C
> -	select V4L2_ASYNC
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2640 camera.
> @@ -431,7 +353,6 @@ config VIDEO_OV2640
>  config VIDEO_OV2659
>  	tristate "OmniVision OV2659 sensor support"
>  	depends on VIDEO_DEV && I2C && GPIOLIB
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2659 camera.
> @@ -442,8 +363,6 @@ config VIDEO_OV2659
>  config VIDEO_OV2680
>  	tristate "OmniVision OV2680 sensor support"
>  	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2680 camera.
> @@ -454,9 +373,6 @@ config VIDEO_OV2680
>  config VIDEO_OV2685
>  	tristate "OmniVision OV2685 sensor support"
>  	depends on VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2685 camera.
> @@ -468,9 +384,6 @@ config VIDEO_OV2740
>  	tristate "OmniVision OV2740 sensor support"
>  	depends on VIDEO_DEV && I2C
>  	depends on ACPI || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	select REGMAP_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
> @@ -482,9 +395,6 @@ config VIDEO_OV2740
>  config VIDEO_OV4689
>  	tristate "OmniVision OV4689 sensor support"
>  	depends on GPIOLIB && VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the OmniVision
>  	  OV4689 camera.
> @@ -496,9 +406,6 @@ config VIDEO_OV5640
>  	tristate "OmniVision OV5640 sensor support"
>  	depends on OF
>  	depends on GPIOLIB && VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Omnivision
>  	  OV5640 camera sensor with a MIPI CSI-2 interface.
> @@ -507,9 +414,6 @@ config VIDEO_OV5645
>  	tristate "OmniVision OV5645 sensor support"
>  	depends on OF
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5645 camera.
> @@ -520,9 +424,6 @@ config VIDEO_OV5645
>  config VIDEO_OV5647
>  	tristate "OmniVision OV5647 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5647 camera.
> @@ -533,9 +434,6 @@ config VIDEO_OV5647
>  config VIDEO_OV5648
>  	tristate "OmniVision OV5648 sensor support"
>  	depends on I2C && PM && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5648 camera.
> @@ -546,9 +444,6 @@ config VIDEO_OV5648
>  config VIDEO_OV5670
>  	tristate "OmniVision OV5670 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5670 camera.
> @@ -559,9 +454,6 @@ config VIDEO_OV5670
>  config VIDEO_OV5675
>  	tristate "OmniVision OV5675 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5675 camera.
> @@ -572,7 +464,6 @@ config VIDEO_OV5675
>  config VIDEO_OV5693
>  	tristate "OmniVision OV5693 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5693 camera.
> @@ -583,7 +474,6 @@ config VIDEO_OV5693
>  config VIDEO_OV5695
>  	tristate "OmniVision OV5695 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5695 camera.
> @@ -604,9 +494,6 @@ config VIDEO_OV6650
>  config VIDEO_OV7251
>  	tristate "OmniVision OV7251 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV7251 camera.
> @@ -627,7 +514,6 @@ config VIDEO_OV7640
>  config VIDEO_OV7670
>  	tristate "OmniVision OV7670 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV7670 VGA camera.  It currently only works with the M88ALP01
> @@ -637,7 +523,6 @@ config VIDEO_OV772X
>  	tristate "OmniVision OV772x sensor support"
>  	depends on I2C && VIDEO_DEV
>  	select REGMAP_SCCB
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV772x camera.
> @@ -656,9 +541,6 @@ config VIDEO_OV7740
>  config VIDEO_OV8856
>  	tristate "OmniVision OV8856 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV8856 camera sensor.
> @@ -669,9 +551,6 @@ config VIDEO_OV8856
>  config VIDEO_OV8858
>  	tristate "OmniVision OV8858 sensor support"
>  	depends on I2C && PM && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for OmniVision
>  	  OV8858 camera sensor.
> @@ -682,9 +561,6 @@ config VIDEO_OV8858
>  config VIDEO_OV8865
>  	tristate "OmniVision OV8865 sensor support"
>  	depends on I2C && PM && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for OmniVision
>  	  OV8865 camera sensor.
> @@ -696,9 +572,6 @@ config VIDEO_OV9282
>  	tristate "OmniVision OV9282 sensor support"
>  	depends on OF_GPIO
>  	depends on I2C && VIDEO_DEV
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV9282 camera sensor.
> @@ -716,8 +589,6 @@ config VIDEO_OV9640
>  config VIDEO_OV9650
>  	tristate "OmniVision OV9650/OV9652 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_SCCB
>  	help
>  	  This is a V4L2 sensor driver for the Omnivision
> @@ -727,9 +598,6 @@ config VIDEO_OV9734
>  	tristate "OmniVision OV9734 sensor support"
>  	depends on VIDEO_DEV && I2C
>  	depends on ACPI || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV9734 camera.
> @@ -740,9 +608,6 @@ config VIDEO_OV9734
>  config VIDEO_RDACM20
>  	tristate "IMI RDACM20 camera support"
>  	depends on I2C
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
>  	select VIDEO_MAX9271_LIB
>  	help
>  	  This driver supports the IMI RDACM20 GMSL camera, used in
> @@ -754,9 +619,6 @@ config VIDEO_RDACM20
>  config VIDEO_RDACM21
>  	tristate "IMI RDACM21 camera support"
>  	depends on I2C
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
> -	select MEDIA_CONTROLLER
>  	select VIDEO_MAX9271_LIB
>  	help
>  	  This driver supports the IMI RDACM21 GMSL camera, used in
> @@ -778,9 +640,6 @@ config VIDEO_RJ54N1
>  config VIDEO_S5C73M3
>  	tristate "Samsung S5C73M3 sensor support"
>  	depends on I2C && SPI && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a V4L2 sensor driver for Samsung S5C73M3
>  	  8 Mpixel camera.
> @@ -788,9 +647,6 @@ config VIDEO_S5C73M3
>  config VIDEO_S5K5BAF
>  	tristate "Samsung S5K5BAF sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
>  	  camera sensor with an embedded SoC image signal processor.
> @@ -798,8 +654,6 @@ config VIDEO_S5K5BAF
>  config VIDEO_S5K6A3
>  	tristate "Samsung S5K6A3 sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
>  	  camera sensor.
> @@ -807,9 +661,6 @@ config VIDEO_S5K6A3
>  config VIDEO_ST_VGXY61
>  	tristate "ST VGXY61 sensor support"
>  	depends on OF && GPIOLIB && VIDEO_DEV && I2C
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the ST VGXY61
>  	  camera sensor.
> diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
> index 71671db3d993..7cc17b0e3153 100644
> --- a/drivers/media/i2c/ccs/Kconfig
> +++ b/drivers/media/i2c/ccs/Kconfig
> @@ -2,10 +2,7 @@
>  config VIDEO_CCS
>  	tristate "MIPI CCS/SMIA++/SMIA sensor support"
>  	depends on I2C && VIDEO_DEV && HAVE_CLK
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEO_CCS_PLL
> -	select V4L2_FWNODE
>  	help
>  	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
>  	  camera sensors.
> diff --git a/drivers/media/i2c/et8ek8/Kconfig b/drivers/media/i2c/et8ek8/Kconfig
> index 398dd4d21df1..9cd2bcedd550 100644
> --- a/drivers/media/i2c/et8ek8/Kconfig
> +++ b/drivers/media/i2c/et8ek8/Kconfig
> @@ -2,9 +2,6 @@
>  config VIDEO_ET8EK8
>  	tristate "ET8EK8 camera sensor support"
>  	depends on I2C && VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select V4L2_FWNODE
>  	help
>  	  This is a driver for the Toshiba ET8EK8 5 MP camera sensor.
>  	  It is used for example in Nokia N900 (RX-51).

