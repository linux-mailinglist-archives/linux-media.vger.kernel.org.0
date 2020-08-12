Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE2B2430A0
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 23:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHLVtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 17:49:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56368 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgHLVtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 17:49:45 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0B089E7;
        Wed, 12 Aug 2020 23:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597268982;
        bh=toVK7T7essJJqcbjiFw154KgUWLSYoKh3nWAwsQb6ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nuuZ5Df9B/fJS5S7uDzp7cJW+6ygVT5uFXrarbQdr8UX4waBKK0sa2aiLXFVTQHqN
         JAXSylJzOUPbChynOTqYr6qX7GB1OKOIT6ngORLOh5qTTubvIMudrYMfhjKTbGRjg4
         qxxUhECXGRvf2Azvzvw9f/EL+/4+o3gIcQ3yVPsI=
Date:   Thu, 13 Aug 2020 00:49:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx214: select V4L2_FWNODE
Message-ID: <20200812214928.GA22974@pendragon.ideasonboard.com>
References: <20200622164352.605546-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200622164352.605546-1-jacopo@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Mauro,

Could we get this merged ? It fixes a v5.8 regression. It's obviously
too late for v5.8, can we merge it as a v5.9 fix ?

On Mon, Jun 22, 2020 at 06:43:52PM +0200, Jacopo Mondi wrote:
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
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
