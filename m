Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ABA315AC7
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 01:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhBJAMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 19:12:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:54298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233814AbhBIXZA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 18:25:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23F6A64DED;
        Tue,  9 Feb 2021 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612913055;
        bh=L2ymRxGDKr1/CMeTw1M5We+NqO3B9OwoCehMFDhBuLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mKyRNYgBCRmMFPmy85Ps+nb6KEI85rO0dzbKj3/K+wo48RW5KhxSzRYe8oIiWQJf+
         i14dBV2oAZjnKAQpNLQM5wJ3h3pXsuUvlSXQ6/EBIQt4cGZZ/vuf/JiFDnB7vv0pmP
         WvyYFv2+4WyKLAIu+APCb0VfeVGA/R+PQ4bxkTqjh9mAoWFEgFX0llPK20hCnKnRch
         GiCTRCKXYeJKROg3byU9lLLc2y91DE+QN7CgB9WO9+ON4pJxql9dIWHW16E7odwOrU
         O1uw3buPv8K2ECLC5cilXYV8AWPfpiD1EF0QDSOkVCki644+RpwD+sNSgSuQLKdN77
         1I3z6BbvOy0CA==
Date:   Tue, 9 Feb 2021 16:24:13 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] media: i2c: Kconfig: Make MAX9271 a module
Message-ID: <20210209232413.GA673593@ubuntu-m3-large-x86>
References: <20210208182006.178740-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208182006.178740-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 08, 2021 at 07:20:06PM +0100, Jacopo Mondi wrote:
> With the introduction of the RDACM21 camera module support in
> commit a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> the symbols defined by the max9271 library were exported twice
> if multiple users of the library were compiled in at the same time.
> 
> In example:
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module:
> 'max9271_set_serial_link' exported twice. Previous export was in
> drivers/media/i2c/rdacm20-camera_module.ko
> 
> Fix this by making the rdacm21 file a module and have the driver
> using its functions select it.
> 
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

That file needs a MODULE_LICENSE now otherwise there will be a fatal
build error:

ERROR: modpost: missing MODULE_LICENSE() in drivers/media/i2c/max9271.o

Cheers,
Nathan

> ---
>  drivers/media/i2c/Kconfig  | 5 +++++
>  drivers/media/i2c/Makefile | 7 +++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 2d3dc0d82f9e..84645f751da3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1240,12 +1240,16 @@ config VIDEO_NOON010PC30
> 
>  source "drivers/media/i2c/m5mols/Kconfig"
> 
> +config VIDEO_MAX9271
> +	tristate
> +
>  config VIDEO_RDACM20
>  	tristate "IMI RDACM20 camera support"
>  	depends on I2C
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
> +	select VIDEO_MAX9271
>  	help
>  	  This driver supports the IMI RDACM20 GMSL camera, used in
>  	  ADAS systems.
> @@ -1259,6 +1263,7 @@ config VIDEO_RDACM21
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
> +	select VIDEO_MAX9271
>  	help
>  	  This driver supports the IMI RDACM21 GMSL camera, used in
>  	  ADAS systems.
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 6bd22d63e1a7..c34a7de3158b 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -125,10 +125,9 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
>  obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> -rdacm20-camera_module-objs	:= rdacm20.o max9271.o
> -obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
> -rdacm21-camera_module-objs	:= rdacm21.o max9271.o
> -obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
> +obj-$(CONFIG_VIDEO_MAX9271)	+= max9271.o
> +obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
> +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> 
>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> --
> 2.30.0
> 
