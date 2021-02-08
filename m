Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4D93130D8
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhBHL3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:29:25 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:48651 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233149AbhBHLWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 06:22:08 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 94bFljDb4W4yN94bIllNh2; Mon, 08 Feb 2021 12:21:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612783265; bh=VMA1Y905ai7UTcXVi3iY32oJPQPjKhiCbIAKjVbJA8M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tZRO5B6pU0AubLtA/RgyZSoWl8Ui5SGJh66FCxdufqO0O0sEVdotnzo/eHB2CppSJ
         rdIf8QHwP64tjwmcMOjJmI1bh4/y/otstqMXqMiHnM6StzNMuKRdcCAH9RuVzDFgmc
         PWTt8UfYokaluoefiVeZxLjVyWF54H8NJA/FCs6gc4iX4O1M9IHXO64UEqiRbLBito
         O6eef12SohfFnR84hEztDiAwdreh9OyU3LBnBbn0JPM6ubgNXDpb53FnWJ2E6DKGzj
         nPMyj85rc8li/xnzpAedKM0uKeI5A97DfpcfcYmkJX+2yhQTWrCSYgTKMugPQdc2lB
         zzolu7whhe3JQ==
Subject: Re: [PATCH v8 1/5] media: i2c: Add driver for RDACM21 camera module
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210114170429.139762-2-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0b118385-70bc-01eb-8ddf-829c604d533b@xs4all.nl>
Date:   Mon, 8 Feb 2021 12:21:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114170429.139762-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBcusml5AVZTuCNnwVBL9NKIzythbgrEDGpzqx+sBN9GYV+HYOm5899kHw1ROJmUuw4zzqnhkAC9bT5qHHJFoirv9YZE+F4zrKskcFPdGcf5BzEseq1m
 bkDXmh4GCvaog04qHt1rh4kk6/NhiNwavy/v5ZSLQ7rNCtSGocX0j6s4pwgsBvMozZo4//QMELUMxKZZYhxP6eDXpyvQgSJQk8ePvz5WQGjK6qw8TMVB64og
 GmuhzvlFc4PUAcPl0oCRAmxOS5Jtz9wnXwjUJ4maVpebJnkUABnZUCVaOPgta7tt4wU79mbdxKJVytAewU0bM4Zt66T6QEQip1+rp5gE01TH9FQWqis6cOEs
 p1wX/OapRjf20wyngTxTpgxjmwDRRszA+1743g7qPceEY8GLy0MqYrjlw8fnsHp9uFcwYYvMsT3dOirvPdhViQXAR8LrYTfSqfLbQ43FNTCwXpmJJdAVogrl
 GptkqvQSdQ0Y66Lmpk49jS8PFgP+boPIfUgGwpOZ2vPrNm68vzCZLc8UfW850BtZb6BdgEEXZd12BwnW9vLt99EJIvObkSPnUVkc5QL1FiivvLEk/yvOB35J
 76lQD7bVf/j4PTKyBRIaFh+SU8urZAtL78rD/HEjavMdTFcuHksUjSVVwevjuGJXoAoMW8o2UN8+DIb6H881WA16ChM03jrfokMjgpEso5iL1g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 14/01/2021 18:04, Jacopo Mondi wrote:
> The RDACM21 is a GMSL camera supporting 1280x1080 resolution images
> developed by IMI based on an Omnivision OV10640 sensor, an Omnivision
> OV490 ISP and a Maxim MAX9271 GMSL serializer.
> 
> The driver uses the max9271 library module, to maximize code reuse with
> other camera module drivers using the same serializer, such as rdacm20.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  MAINTAINERS                 |  12 +
>  drivers/media/i2c/Kconfig   |  13 +
>  drivers/media/i2c/Makefile  |   2 +
>  drivers/media/i2c/rdacm21.c | 623 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 650 insertions(+)
>  create mode 100644 drivers/media/i2c/rdacm21.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 14adf87d90c7..1822d73ed615 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14967,6 +14967,18 @@ F:	drivers/media/i2c/max9271.c
>  F:	drivers/media/i2c/max9271.h
>  F:	drivers/media/i2c/rdacm20.c
> 
> +RDACM21 Camera Sensor
> +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/rdacm2x-gmsl.yaml
> +F:	drivers/media/i2c/max9271.c
> +F:	drivers/media/i2c/max9271.h
> +F:	drivers/media/i2c/rdacm21.c
> +
>  RDC R-321X SoC
>  M:	Florian Fainelli <florian@openwrt.org>
>  S:	Maintained
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 2b9d81e4794a..d500edb8638b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1212,6 +1212,19 @@ config VIDEO_RDACM20
>  	  This camera should be used in conjunction with a GMSL
>  	  deserialiser such as the MAX9286.
> 
> +config VIDEO_RDACM21
> +	tristate "IMI RDACM21 camera support"
> +	depends on I2C
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	select MEDIA_CONTROLLER
> +	help
> +	  This driver supports the IMI RDACM21 GMSL camera, used in
> +	  ADAS systems.
> +
> +	  This camera should be used in conjunction with a GMSL
> +	  deserialiser such as the MAX9286.
> +
>  config VIDEO_RJ54N1
>  	tristate "Sharp RJ54N1CB0C sensor support"
>  	depends on I2C && VIDEO_V4L2
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a3149dce21bb..85b1edc62508 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -124,6 +124,8 @@ obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
>  rdacm20-camera_module-objs	:= rdacm20.o max9271.o
>  obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
> +rdacm21-camera_module-objs	:= rdacm21.o max9271.o
> +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o

This isn't right. The max9271 code exports various functions, but since it is
included with *two* modules (rdacm20/1-camera_module.ko) it is exported twice.

Since max9271 is not a self-contained driver it should not export symbols.

Can you provide a patch fixing that?

Thanks,

	Hans
