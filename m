Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7951C744E3E
	for <lists+linux-media@lfdr.de>; Sun,  2 Jul 2023 16:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjGBO7w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jul 2023 10:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGBO7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jul 2023 10:59:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D0BE67
        for <linux-media@vger.kernel.org>; Sun,  2 Jul 2023 07:59:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-45-201.reb.o2.cz [85.160.45.201])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CED2BC;
        Sun,  2 Jul 2023 16:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688309946;
        bh=i6ld76QHT22LAcbvInKdFiQdVfIpttbLm0wWJcYKmbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HbB6eOtfDE+4O04sA2we+03msD6hIPO4j7Awt1aUogTbDovQHP1WcZxRWFM99aM/9
         B5HJ+tbn+k6Z2bZETwNd0aUBwQyyYQ1nJmtu7sNXrXJhnZUmoVbqTn7mLYDLPSN2GQ
         asQ8C4SOS67UwfS1LwYxpyy+66HMyDpiY5nZ/Buw=
Date:   Sun, 2 Jul 2023 17:59:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Message-ID: <20230702145949.GA9285@pendragon.ideasonboard.com>
References: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
 <20230630140354.111404-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630140354.111404-2-sakari.ailus@linux.intel.com>
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

On Fri, Jun 30, 2023 at 05:03:53PM +0300, Sakari Ailus wrote:
> Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
> also adds the options to drivers that don't specifically need them, these
> are still seldom used drivers using old APIs. The upside is that these
> should now all compile --- many drivers have had missing dependencies.
> 
> The "menu" is replaced by selectable "menuconfig" to select the needed
> V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
> 
> Also select MEDIA_CONTROLLER which VIDEO_V4L2_SUBDEV_API effectively
> depends on.
> 
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Cc: stable@vger.kernel.org # for >= 6.1

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 815c83135021..c7ffaa79abeb 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -25,8 +25,15 @@ config VIDEO_IR_I2C
>  # V4L2 I2C drivers that are related with Camera support
>  #
>  
> -menu "Camera sensor devices"
> -	visible if MEDIA_CAMERA_SUPPORT
> +menuconfig VIDEO_CAMERA_SENSOR
> +	bool "Camera sensor devices"
> +	depends on MEDIA_CAMERA_SUPPORT
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	default y
> +
> +if VIDEO_CAMERA_SENSOR
>  
>  config VIDEO_APTINA_PLL
>  	tristate
> @@ -810,7 +817,7 @@ config VIDEO_ST_VGXY61
>  source "drivers/media/i2c/ccs/Kconfig"
>  source "drivers/media/i2c/et8ek8/Kconfig"
>  
> -endmenu
> +endif
>  
>  menu "Lens drivers"
>  	visible if MEDIA_CAMERA_SUPPORT

-- 
Regards,

Laurent Pinchart
