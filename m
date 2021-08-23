Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCA53F4350
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 04:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhHWCKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 22:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhHWCKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 22:10:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911E7C061575;
        Sun, 22 Aug 2021 19:09:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7DD72A5;
        Mon, 23 Aug 2021 04:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629684571;
        bh=ohsQW+/YDgFqIiGot1kvbubt6/mwUgY1ZclHNtIAhH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n97zNr2rIrDQ88+QjkaUIxV93neS22H4a2dcXML9xOFbQDBONhTEgjO18colWl5jf
         kOIuEhSJqCN8dk/Fa5JO7CM7h935OBCBPZnGS7erIt714ckVaKkAh3pllMn3nUuVDg
         kbbZJaAEkKj9e5SMXt/MoyX/7k4PXffc+61+jxQI=
Date:   Mon, 23 Aug 2021 05:09:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC 1/5] media: i2c: max9271: Rename max9271 library driver
Message-ID: <YSMDUaqFQeesXl5P@pendragon.ideasonboard.com>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
 <20210817072703.1167-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817072703.1167-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 17, 2021 at 09:26:59AM +0200, Jacopo Mondi wrote:
> Support for the MAX9271 GMSL serializer was provided in the form of a
> library driver, with the RDACM20 and RDACM21 camera module drivers using
> the functions exported by the library.
> 
> In preparation to introduce an i2c subdevice driver to support the
> MAX9271 serializer, rename the library driver from max9271 to
> max9271-lib.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Even if the series ended up being rejected (due, for instance, to
realizing this would be a bad approach), this may make sense on its own.

> ---
>  MAINTAINERS                                    | 8 ++++----
>  drivers/media/i2c/Makefile                     | 2 +-
>  drivers/media/i2c/{max9271.c => max9271-lib.c} | 2 +-
>  drivers/media/i2c/{max9271.h => max9271-lib.h} | 0
>  drivers/media/i2c/rdacm20.c                    | 2 +-
>  drivers/media/i2c/rdacm21.c                    | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>  rename drivers/media/i2c/{max9271.c => max9271-lib.c} (99%)
>  rename drivers/media/i2c/{max9271.h => max9271-lib.h} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 524eabe50d79..7ad89cac19b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15625,8 +15625,8 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> -F:	drivers/media/i2c/max9271.c
> -F:	drivers/media/i2c/max9271.h
> +F:	drivers/media/i2c/max9271-lib.c
> +F:	drivers/media/i2c/max9271-lib.h
>  F:	drivers/media/i2c/rdacm20.c
>  
>  RDACM21 Camera Sensor
> @@ -15637,8 +15637,8 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> -F:	drivers/media/i2c/max9271.c
> -F:	drivers/media/i2c/max9271.h
> +F:	drivers/media/i2c/max9271-lib.c
> +F:	drivers/media/i2c/max9271-lib.h
>  F:	drivers/media/i2c/rdacm21.c
>  
>  RDC R-321X SoC
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 83268f20aa3a..4d879373bd48 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -129,7 +129,7 @@ obj-$(CONFIG_VIDEO_IMX335)	+= imx335.o
>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>  obj-$(CONFIG_VIDEO_IMX412)	+= imx412.o
>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> -obj-$(CONFIG_VIDEO_MAX9271_LIB)	+= max9271.o
> +obj-$(CONFIG_VIDEO_MAX9271_LIB)	+= max9271-lib.o
>  obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
>  obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271-lib.c
> similarity index 99%
> rename from drivers/media/i2c/max9271.c
> rename to drivers/media/i2c/max9271-lib.c
> index ff86c8c4ea61..c554bb0f42f4 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271-lib.c
> @@ -20,7 +20,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  
> -#include "max9271.h"
> +#include "max9271-lib.h"
>  
>  static int max9271_read(struct max9271_device *dev, u8 reg)
>  {
> diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271-lib.h
> similarity index 100%
> rename from drivers/media/i2c/max9271.h
> rename to drivers/media/i2c/max9271-lib.h
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index eb0e3dc22cc3..bf06a1c50306 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -27,7 +27,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-subdev.h>
>  
> -#include "max9271.h"
> +#include "max9271-lib.h"
>  
>  #define OV10635_I2C_ADDRESS		0x30
>  
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 35217782f693..3a05abe4e96c 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -21,7 +21,7 @@
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-subdev.h>
> -#include "max9271.h"
> +#include "max9271-lib.h"
>  
>  #define MAX9271_RESET_CYCLES		10
>  

-- 
Regards,

Laurent Pinchart
