Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE37C3316EB
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 20:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCHTCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 14:02:14 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49526 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhCHTCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 14:02:05 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8006B1F4519D
Message-ID: <51c824c3115fc678c91660b9a12332242c1b1384.camel@collabora.com>
Subject: Re: [PATCH 1/1] v4l: async, fwnode: Improve module organisation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Date:   Mon, 08 Mar 2021 16:01:58 -0300
In-Reply-To: <20210308100256.26270-1-sakari.ailus@linux.intel.com>
References: <20210308100256.26270-1-sakari.ailus@linux.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks a lot for the patch. I like where this is going.

On Mon, 2021-03-08 at 12:02 +0200, Sakari Ailus wrote:
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
> This also moves the initialisation of the debufs entries for async subdevs
> to loading of the v4l2-async module. The directory is named as
> "v4l2-async".
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> This goes on top of my recent async patches.
> 
>  drivers/media/i2c/Kconfig                     | 80 +++++++++----------
>  drivers/media/i2c/ccs/Kconfig                 |  2 +-
>  drivers/media/i2c/et8ek8/Kconfig              |  2 +-
>  drivers/media/pci/intel/ipu3/Kconfig          |  2 +-
>  drivers/media/platform/Kconfig                | 16 ++--
>  drivers/media/platform/am437x/Kconfig         |  2 +-
>  drivers/media/platform/atmel/Kconfig          |  4 +-
>  drivers/media/platform/cadence/Kconfig        |  4 +-
>  drivers/media/platform/davinci/Kconfig        |  2 +-
>  drivers/media/platform/exynos4-is/Kconfig     |  4 +-
>  drivers/media/platform/marvell-ccic/Kconfig   |  1 +
>  drivers/media/platform/rcar-vin/Kconfig       |  4 +-
>  .../media/platform/sunxi/sun4i-csi/Kconfig    |  2 +-
>  .../media/platform/sunxi/sun6i-csi/Kconfig    |  2 +-
>  drivers/media/platform/xilinx/Kconfig         |  2 +-
>  drivers/media/v4l2-core/Kconfig               |  3 +-
>  drivers/media/v4l2-core/Makefile              |  6 +-
>  .../{v4l2-async.c => v4l2-async-core.c}       | 23 +++++-
>  drivers/media/v4l2-core/v4l2-dev.c            |  5 --
>  drivers/staging/media/imx/Kconfig             |  2 +-
>  drivers/staging/media/tegra-video/Kconfig     |  2 +-
>  21 files changed, 94 insertions(+), 76 deletions(-)
>  rename drivers/media/v4l2-core/{v4l2-async.c => v4l2-async-core.c} (96%)
> 
[..]
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index bf49f83cb86f..26e12db0a4e8 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -62,13 +62,14 @@ config V4L2_FLASH_LED_CLASS
>         tristate "V4L2 flash API for LED flash class devices"
>         depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>         depends on LEDS_CLASS_FLASH
> +       select V4L2_ASYNC
>         help
>           Say Y here to enable V4L2 flash API support for LED flash
>           class drivers.
>  
>           When in doubt, say N.
>  
> -config V4L2_FWNODE
> +config V4L2_ASYNC
>         tristate
>  

So we don't expect (or want) out-of-tree drivers to be able to use this.
Is that correct?

>  # Used by drivers that need Videobuf modules
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index e4cd589b99a5..298ca6ba4f32 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -7,14 +7,16 @@ tuner-objs    :=      tuner-core.o
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
> +v4l2-async-objs :=     v4l2-async-core.o v4l2-fwnode.o
> +

Looks good.

> +obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
>  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
>  obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
>  
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async-core.c
> similarity index 96%
> rename from drivers/media/v4l2-core/v4l2-async.c
> rename to drivers/media/v4l2-core/v4l2-async-core.c
> index 21b3890b96fc..6e49386f0284 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async-core.c
> @@ -852,8 +852,27 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
>  
> -void v4l2_async_debug_init(struct dentry *debugfs_dir)
> +static struct dentry *v4l2_async_debugfs_dir;
> +
> +static int __init v4l2_async_init(void)
>  {
> -       debugfs_create_file("pending_async_subdevices", 0444, debugfs_dir, NULL,
> +       v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
> +       debugfs_create_file("pending_async_subdevices", 0444,
> +                           v4l2_async_debugfs_dir, NULL,
>                             &pending_subdevs_fops);

I guess we could have kept the previous path,
but OTOH it's not really a big deal for debugfs.

Once we figure out the above about exposing V4L2_ASYNC:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

