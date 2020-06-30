Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A18D20F1FD
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 11:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732078AbgF3Jyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 05:54:39 -0400
Received: from mga06.intel.com ([134.134.136.31]:28216 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729017AbgF3Jyi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 05:54:38 -0400
IronPort-SDR: 3egwSlgcvGrt7yz2u5URGRWNfd8k2WIdJ3WiNUvgXgIVdmTQyExZWv0CM0mI8owgekIueIXTas
 RNeNjSXOcJJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207707327"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="207707327"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 02:54:37 -0700
IronPort-SDR: hNZYhpiv341hl+Aaw19NRwC/RAT3wXvH0OvhwikoLADF8pd4rKS0TFT3hVl/6uQ/v9O66bnsKU
 Ub+CtVmIo0jA==
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="355732216"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 02:54:33 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C2250207F6; Tue, 30 Jun 2020 12:54:30 +0300 (EEST)
Date:   Tue, 30 Jun 2020 12:54:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630095430.GF16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630024942.20891-3-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

Thanks for the update.

On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   13 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1067 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02a10.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 378c961..a6a2f8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12566,6 +12566,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> +F:	drivers/media/i2c/ov02a10.c
>  
>  OMNIVISION OV13858 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index da11036..65519cf 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -812,6 +812,19 @@ config VIDEO_IMX355
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx355.
>  
> +config VIDEO_OV02A10
> +	tristate "OmniVision OV02A10 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV02A10 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov02a10.
> +
>  config VIDEO_OV2640
>  	tristate "OmniVision OV2640 sensor support"
>  	depends on VIDEO_V4L2 && I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 993acab..384e676 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
>  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
>  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
>  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
>  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
>  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> new file mode 100644
> index 0000000..f7fd329
> --- /dev/null
> +++ b/drivers/media/i2c/ov02a10.c

...

> +	ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);


Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
the sensor off the first time. Alternatively make reset signal high in
runtime suspend callback.

-- 
Kind regards,

Sakari Ailus
