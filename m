Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6F8201542
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 18:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391281AbgFSQUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 12:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394621AbgFSQT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 12:19:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3953FC06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 09:19:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEF9D556;
        Fri, 19 Jun 2020 18:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592583595;
        bh=VRz71oSDy+WvJReKRYJzO+9HKInRIMWW4vFdhddFMPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qzVRo97vs5qWnBoNeMZnk56o7B7FMp0fwyGj1XFEFbCu/BAhJVFudztgiTFTJg+Gm
         DSDIuGEAllxVJhLswpD3VgSSe10yRnlnFbQUxTE34xUekDID06rxZetKZeYWre5WyM
         ezBJpKAOqieOLWcpFpbojeNqwkVnKqBAZ/FKQsp8=
Date:   Fri, 19 Jun 2020 19:19:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Kconfig: imx214: select V4L2_FWNODE'
Message-ID: <20200619161932.GL5823@pendragon.ideasonboard.com>
References: <20200619110940.164789-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200619110940.164789-1-jacopo@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jun 19, 2020 at 01:09:40PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> After the recent conversion of the media build infrastructure to select
> V4L2 components instead of depending on their presence, which took place
> in:
> 32a363d0b0b14 ("media: Kconfig files: use select for V4L2 subdevs and MC")
> 
> imx214 stands out as being the (only?) media I2C driver that still depends
> on a V4L2 core symbol instead of selecting it.
> 
> This confuses the build system which claims it has detected a circular
> dependency when other drivers select the same symbol as the imx214
> driver does.
> 
> drivers/media/i2c/Kconfig:728:error: recursive dependency detected!
> drivers/media/i2c/Kconfig:728:	symbol VIDEO_IMX214 depends on V4L2_FWNODE
> drivers/media/v4l2-core/Kconfig:71:	symbol V4L2_FWNODE is selected by VIDEO_BCM2835_UNICAM
> drivers/media/platform/bcm2835/Kconfig:3:	symbol VIDEO_BCM2835_UNICAM depends on VIDEO_V4L2_SUBDEV_API
> drivers/media/v4l2-core/Kconfig:19:	symbol VIDEO_V4L2_SUBDEV_API depends on MEDIA_CONTROLLER
> drivers/media/Kconfig:168:	symbol MEDIA_CONTROLLER is selected by VIDEO_IMX214
> 
> Fix this by making the imx214 driver select V4L2_FWNODE instead of
> depending on it and align it with all the other drivers.
> 
> Fixes: 32a363d0b0b14 ("media: Kconfig files: use select for V4L2 subdevs and MC")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

With the stray ' at the end of the commit message removed, and possibly
s/Kconfig: //,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index da11036ad804d..6b1a6851ccb0b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -728,7 +728,7 @@ config VIDEO_HI556
>  config VIDEO_IMX214
>  	tristate "Sony IMX214 sensor support"
>  	depends on GPIOLIB && I2C && VIDEO_V4L2
> -	depends on V4L2_FWNODE
> +	select V4L2_FWNODE
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C

-- 
Regards,

Laurent Pinchart
