Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74013313120
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbhBHLmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:42:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33896 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhBHLi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 06:38:57 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 004B99FF;
        Mon,  8 Feb 2021 12:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612784292;
        bh=T49aQGOWlSj+zKKSggVixpH13+QPlKXNAM95nbXTPA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v4l7BozZ4hhWVRz+iYwyX1N6U+fK/anJIislfwk1v1hS/9iDnIy0AEQGRKAV+WABg
         JFZn+aJr2A+tz5wOHknkqWaQIGnQX+H+Mj/7drCd4d3niAqc7fy2eUL2pV/qdqgB3U
         IvOYN4oGFuzKSYyTy5XYLv+8/Us2stFv36qEIIrw=
Date:   Mon, 8 Feb 2021 13:37:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v8 1/5] media: i2c: Add driver for RDACM21 camera module
Message-ID: <YCEijDCVxBkc0Cq7@pendragon.ideasonboard.com>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210114170429.139762-2-jacopo+renesas@jmondi.org>
 <0b118385-70bc-01eb-8ddf-829c604d533b@xs4all.nl>
 <YCEgcPv1TWe0DN50@pendragon.ideasonboard.com>
 <c0db4607-7e2b-ac88-c9d2-d1c5f75bbf86@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0db4607-7e2b-ac88-c9d2-d1c5f75bbf86@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Feb 08, 2021 at 12:34:55PM +0100, Hans Verkuil wrote:
> On 08/02/2021 12:28, Laurent Pinchart wrote:
> > On Mon, Feb 08, 2021 at 12:21:01PM +0100, Hans Verkuil wrote:
> >> On 14/01/2021 18:04, Jacopo Mondi wrote:
> >>> The RDACM21 is a GMSL camera supporting 1280x1080 resolution images
> >>> developed by IMI based on an Omnivision OV10640 sensor, an Omnivision
> >>> OV490 ISP and a Maxim MAX9271 GMSL serializer.
> >>>
> >>> The driver uses the max9271 library module, to maximize code reuse with
> >>> other camera module drivers using the same serializer, such as rdacm20.
> >>>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>>  MAINTAINERS                 |  12 +
> >>>  drivers/media/i2c/Kconfig   |  13 +
> >>>  drivers/media/i2c/Makefile  |   2 +
> >>>  drivers/media/i2c/rdacm21.c | 623 ++++++++++++++++++++++++++++++++++++
> >>>  4 files changed, 650 insertions(+)
> >>>  create mode 100644 drivers/media/i2c/rdacm21.c
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 14adf87d90c7..1822d73ed615 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -14967,6 +14967,18 @@ F:	drivers/media/i2c/max9271.c
> >>>  F:	drivers/media/i2c/max9271.h
> >>>  F:	drivers/media/i2c/rdacm20.c
> >>>
> >>> +RDACM21 Camera Sensor
> >>> +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>> +L:	linux-media@vger.kernel.org
> >>> +S:	Maintained
> >>> +F:	Documentation/devicetree/bindings/media/i2c/rdacm2x-gmsl.yaml
> >>> +F:	drivers/media/i2c/max9271.c
> >>> +F:	drivers/media/i2c/max9271.h
> >>> +F:	drivers/media/i2c/rdacm21.c
> >>> +
> >>>  RDC R-321X SoC
> >>>  M:	Florian Fainelli <florian@openwrt.org>
> >>>  S:	Maintained
> >>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >>> index 2b9d81e4794a..d500edb8638b 100644
> >>> --- a/drivers/media/i2c/Kconfig
> >>> +++ b/drivers/media/i2c/Kconfig
> >>> @@ -1212,6 +1212,19 @@ config VIDEO_RDACM20
> >>>  	  This camera should be used in conjunction with a GMSL
> >>>  	  deserialiser such as the MAX9286.
> >>>
> >>> +config VIDEO_RDACM21
> >>> +	tristate "IMI RDACM21 camera support"
> >>> +	depends on I2C
> >>> +	select V4L2_FWNODE
> >>> +	select VIDEO_V4L2_SUBDEV_API
> >>> +	select MEDIA_CONTROLLER
> >>> +	help
> >>> +	  This driver supports the IMI RDACM21 GMSL camera, used in
> >>> +	  ADAS systems.
> >>> +
> >>> +	  This camera should be used in conjunction with a GMSL
> >>> +	  deserialiser such as the MAX9286.
> >>> +
> >>>  config VIDEO_RJ54N1
> >>>  	tristate "Sharp RJ54N1CB0C sensor support"
> >>>  	depends on I2C && VIDEO_V4L2
> >>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> >>> index a3149dce21bb..85b1edc62508 100644
> >>> --- a/drivers/media/i2c/Makefile
> >>> +++ b/drivers/media/i2c/Makefile
> >>> @@ -124,6 +124,8 @@ obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> >>>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> >>>  rdacm20-camera_module-objs	:= rdacm20.o max9271.o
> >>>  obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
> >>> +rdacm21-camera_module-objs	:= rdacm21.o max9271.o
> >>> +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
> >>>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> >>
> >> This isn't right. The max9271 code exports various functions, but since it is
> >> included with *two* modules (rdacm20/1-camera_module.ko) it is exported twice.
> >>
> >> Since max9271 is not a self-contained driver it should not export symbols.
> > 
> > Shouldn't we instead make max9271 a stand-alone module ?
> 
> If that makes sense, then that's the alternative option. I don't know if it
> can be used with anything else but rdacm20/21.
> 
> Either way, this needs to be fixed.

I've just noticed that Mauro has submitted a patch for this.

> >> Can you provide a patch fixing that?

-- 
Regards,

Laurent Pinchart
