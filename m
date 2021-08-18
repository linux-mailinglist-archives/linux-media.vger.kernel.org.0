Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E323F03F6
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 14:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbhHRMtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 08:49:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47012 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234801AbhHRMtX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 08:49:23 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0ED4EE;
        Wed, 18 Aug 2021 14:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629290928;
        bh=NBfX/KCj7aeUsmA0FTfysiQW0zrzcviDvJ37rWP0bjo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bmUniYGP0E1RcJwOFJXqehMu7fokVykvZyKKnEgVhd41LUj0HVer1Igc4Rx7I/d4E
         Gffwh6Yi0ViCet5fQY/+GEagltOyE/1pnEszI4sn2IghstlZAoRrc5h566buJl3xgy
         5wgD4v7jUK8Xf2j+K4pwQm9fd5b/Bp3woipkuHYY=
Subject: Re: [RFC 1/5] media: i2c: max9271: Rename max9271 library driver
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
 <20210817072703.1167-2-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <bfe2547e-e824-63be-5380-03fb16bd26d0@ideasonboard.com>
Date:   Wed, 18 Aug 2021 13:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817072703.1167-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 17/08/2021 08:26, Jacopo Mondi wrote:
> Support for the MAX9271 GMSL serializer was provided in the form of a
> library driver, with the RDACM20 and RDACM21 camera module drivers using
> the functions exported by the library.
> 
> In preparation to introduce an i2c subdevice driver to support the
> MAX9271 serializer, rename the library driver from max9271 to
> max9271-lib.

I may as well add this here now to save me later if this continues ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
> 
