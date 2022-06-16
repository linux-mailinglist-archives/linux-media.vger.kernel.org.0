Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1B254E8B4
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 19:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbiFPRhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 13:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiFPRhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 13:37:13 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF0134643
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 10:37:10 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id i25so2667509oii.7
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fC6XXgD07YUjVo6QQQm26oiDnSaMn+RheAZSswR2ssE=;
        b=meYnBRQPjofCvR+scvfUhBHaXOcgkbqW2I0ivBVU3YCjoG4v+qb/LyCrpY7LP+sTNE
         z/1aHmoEkElqtdVGotMU8qpQjxfho+Bunpl78m50Zb2L8/gHoJ2qUpRSESo4Hzeiu/SE
         moqz1iKSPrC9XfpkY9AjPvuZh3+qKIn5osaclt0o9bs7gCmS7XMQbBOv1FV8siZ8V7YY
         H6wZ1zfUIUzyVuFUPDiQ9mw8lVLS+wdsK7lJZcPOZf9B0y93D9VTfu7veBC83VTEOvbs
         E2KIGw7e1Z+HDK05Vjvgs/0anjmqC6R9A2umd9+/NouIMVDiNRjDZSi5MBYvHO2DLyRz
         b1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fC6XXgD07YUjVo6QQQm26oiDnSaMn+RheAZSswR2ssE=;
        b=3BRyLal0KWlLJh5YTLEcQOdlVDC3IgXXcZg/rWzE7qD4ZjToaVLcN0vguCg4AwVKoU
         tvyTWFPdeTpn3xaMsSoc1fijdCxIQnlLHXMeF33EAMINH9lJZLGZz+mooN++9DJzJ8EP
         8FEi4ftPeaP/bdNZ80EkVmBHv54L+HpsY3Mim1x0x0GvH0aoiY4Tb+PqHBQ5Nb8hSm8g
         SLbqujQbVSNgnDscYWqXv7v34OSSTMmvR/pvFdf39Tlmyn1BaBkBHzkvKE8o563xn9V3
         0pwqNtiz0u5Exk+RUcsWziEuVDalpo5HG0tD905vf1CI01YNCYH9X7BU52hBp1WkBLOq
         M0nw==
X-Gm-Message-State: AJIora9Rd0T0uJk195jnv7W9pjii9kpbsoZ7scviozphgAubkrYh/uhp
        wFeQ9xiV+KkaxzIyQ+KJkuIMSQ==
X-Google-Smtp-Source: AGRyM1sDJ0YEylVm213W8ViRU+dh7cqiyWZubVgXBjNSI+YqAU+26gZLsPJrmy38p/YzGluPmCfF1w==
X-Received: by 2002:a05:6808:20a6:b0:32f:3376:46f1 with SMTP id s38-20020a05680820a600b0032f337646f1mr3238870oiw.182.1655401029959;
        Thu, 16 Jun 2022 10:37:09 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id x108-20020a9d37f5000000b0060c0be9ab73sm1105993otb.42.2022.06.16.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 10:37:09 -0700 (PDT)
Date:   Thu, 16 Jun 2022 14:37:04 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: Replace dependency on VIDEO_V4L2_SUBDEV_API with
 select
Message-ID: <YqtqQLStMZ5BSBfR@eze-laptop>
References: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 16, 2022 at 07:36:32PM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The VIDEO_V4L2_SUBDEV_API Kconfig symbol is mostly selected
> automatically, with a a handful of drivers still using it as a
> dependency. Fix them to use selection, and drop the symbol title text to
> not expose it for manual selection.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Makes sense.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/media/i2c/Kconfig            | 3 ++-
>  drivers/media/platform/atmel/Kconfig | 3 ++-
>  drivers/media/v4l2-core/Kconfig      | 5 +++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 2b20aa6c37b1..51fc3fb72d95 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -75,8 +75,9 @@ config VIDEO_HI847
>  
>  config VIDEO_IMX208
>  	tristate "Sony IMX208 sensor support"
> -	depends on I2C && VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	depends on I2C && VIDEO_DEV
>  	depends on MEDIA_CAMERA_SUPPORT
> +	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX208 camera.
> diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
> index 83aebee0c8eb..da8ffc39d11d 100644
> --- a/drivers/media/platform/atmel/Kconfig
> +++ b/drivers/media/platform/atmel/Kconfig
> @@ -20,12 +20,13 @@ config VIDEO_ATMEL_ISC
>  config VIDEO_ATMEL_XISC
>  	tristate "ATMEL eXtended Image Sensor Controller (XISC) support"
>  	depends on V4L_PLATFORM_DRIVERS
> -	depends on VIDEO_DEV && COMMON_CLK && VIDEO_V4L2_SUBDEV_API
> +	depends on VIDEO_DEV && COMMON_CLK
>  	depends on ARCH_AT91 || COMPILE_TEST
>  	select VIDEOBUF2_DMA_CONTIG
>  	select REGMAP_MMIO
>  	select V4L2_FWNODE
>  	select VIDEO_ATMEL_ISC_BASE
> +	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	   This module makes the ATMEL eXtended Image Sensor Controller
>  	   available as a v4l2 device.
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index 1be9a2cc947a..5141c8215b2f 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -9,7 +9,7 @@ config VIDEO_V4L2_I2C
>  	default y
>  
>  config VIDEO_V4L2_SUBDEV_API
> -	bool "V4L2 sub-device userspace API"
> +	bool
>  	depends on VIDEO_DEV && MEDIA_CONTROLLER
>  	help
>  	  Enables the V4L2 sub-device pad-level userspace API used to configure
> @@ -56,9 +56,10 @@ config V4L2_MEM2MEM_DEV
>  # Used by LED subsystem flash drivers
>  config V4L2_FLASH_LED_CLASS
>  	tristate "V4L2 flash API for LED flash class devices"
> -	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	depends on VIDEO_DEV
>  	depends on LEDS_CLASS_FLASH
>  	select V4L2_ASYNC
> +	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  Say Y here to enable V4L2 flash API support for LED flash
>  	  class drivers.
> -- 
> Regards,
> 
> Laurent Pinchart
> 
