Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E493466A3
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 18:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhCWRqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 13:46:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52862 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhCWRqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 13:46:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 356D01F455D6
Message-ID: <8f28218c90cdf22dd7f3d2cea259f4013ff263c4.camel@collabora.com>
Subject: Re: [PATCH v2 4/4] v4l: async, fwnode: Improve module organisation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel.garcia@collabora.com
Date:   Tue, 23 Mar 2021 14:46:04 -0300
In-Reply-To: <20210312125657.25442-5-sakari.ailus@linux.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
         <20210312125657.25442-5-sakari.ailus@linux.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-03-12 at 14:56 +0200, Sakari Ailus wrote:
> The V4L2 async framework is generally used with the V4L2 fwnode, which
> also depends on the former. There is only one exception, the CAFE_CCIC
> driver, which uses V4L2 async but does not need V4L2 fwnode.
> 
> At the same time there is a vast number of systems that need videodev
> module, but have no use for v4l2-async that's now part of videodev.
> 
> In order to improve, build v4l2-async and v4l2-fwnode as a single module
> called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> 

Seems this is not what this patch is doing: the symbol is not renamed,
and now we have two modules v4l2-fwnode.ko and v4l2-async.ko, unless
I'm confused.

I personally was more fond of having just one v4l2-async.ko module,
but I'm not sure if you found any obstacles.

> This also moves the initialisation of the debufs entries for async subdevs
> to loading of the v4l2-async module. The directory is named as
> "v4l2-async".
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/Kconfig            |  8 ++++++++
>  drivers/media/v4l2-core/Kconfig      |  4 ++++
>  drivers/media/v4l2-core/Makefile     | 11 +++++++++--
>  drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-dev.c   |  5 -----
>  5 files changed, 42 insertions(+), 9 deletions(-)
> 
[..]
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index e4cd589b99a5..eb5ebb5461fd 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -7,15 +7,22 @@ tuner-objs    :=      tuner-core.o
>  
>  videodev-objs  :=      v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>                         v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
> -                       v4l2-async.o v4l2-common.o
> +                       v4l2-common.o
>  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
>  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
>  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
>  videodev-$(CONFIG_SPI) += v4l2-spi.o
>  videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
>  
> -obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> +ifneq ($(findstring y,$(CONFIG_V4L2_ASYNC)$(CONFIG_V4L2_FWNODE)),)

Hm, to me this ifdefery is an indication that we are trying
to do something fishy.

Regards,
Ezequiel

