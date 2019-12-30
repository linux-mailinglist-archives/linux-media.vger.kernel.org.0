Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7719912D35A
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 19:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfL3SZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 13:25:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39256 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfL3SZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 13:25:24 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 045A128DFAB
Message-ID: <c6514f8e8bf49913e3cb907ba91c0a47de39e68c.camel@collabora.com>
Subject: Re: [PATCH v12 01/11] media: staging: phy-rockchip-dphy: add
 Rockchip MIPI Synopsys DPHY driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        gregkh@linuxfoundation.org, andrey.konovalov@linaro.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        linux-arm-kernel@lists.infradead.org
Date:   Mon, 30 Dec 2019 15:25:10 -0300
In-Reply-To: <20191227200116.2612137-2-helen.koike@collabora.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
         <20191227200116.2612137-2-helen.koike@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for taking care of this.

On Fri, 2019-12-27 at 17:01 -0300, Helen Koike wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Add driver for Rockchip MIPI Synopsys DPHY driver
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v12:
> - several cleanups
> - remove "rx" from function names, as this driver only supports rx
> 
> Changes in v11:
> - fix checkpatch errors
> 
> Changes in v10: None
> Changes in v9:
> - Move to staging
> - replace memcpy by a directly assignment
> - remove unecessary ret variable in rockchip_dphy_init
> - s/0x1/1
> - s/0x0/0
> - coding style changes
> - dphy_reg variable sizes
> - variables from int to unsigned int
> - rename functions to start with rk_
> - rename dphy0 to rx
> - fix hardcoded lane0 usage
> - disable rx on power off
> - general cleanups of unused variables
> 
> Changes in v8:
> - Remove boiler plate license text
> 
> Changes in v7:
> - Migrate dphy specific code from
> drivers/media/platform/rockchip/isp1/mipi_dphy_sy.c
> to drivers/phy/rockchip/phy-rockchip-dphy.c
> - Drop support for rk3288
> - Drop support for dphy txrx
> - code styling and checkpatch fixes
> 
>  drivers/staging/media/Kconfig                 |   2 +
>  drivers/staging/media/Makefile                |   1 +
>  .../staging/media/phy-rockchip-dphy/Kconfig   |  11 +
>  .../staging/media/phy-rockchip-dphy/Makefile  |   2 +
>  drivers/staging/media/phy-rockchip-dphy/TODO  |   6 +
>  .../phy-rockchip-dphy/phy-rockchip-dphy.c     | 396 ++++++++++++++++++
>  6 files changed, 418 insertions(+)
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Kconfig
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Makefile
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/TODO
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
> 
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 642adc4c24d2..a47484473883 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -38,4 +38,6 @@ source "drivers/staging/media/ipu3/Kconfig"
>  
>  source "drivers/staging/media/soc_camera/Kconfig"
>  
> +source "drivers/staging/media/phy-rockchip-dphy/Kconfig"
> +
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index 2f1711a8aeed..b0eae3906208 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
>  obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
>  obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
>  obj-$(CONFIG_SOC_CAMERA)	+= soc_camera/
> +obj-$(CONFIG_PHY_ROCKCHIP_DPHY)		+= phy-rockchip-dphy/
> diff --git a/drivers/staging/media/phy-rockchip-dphy/Kconfig b/drivers/staging/media/phy-rockchip-dphy/Kconfig
> new file mode 100644
> index 000000000000..7378bd75fa7c
> --- /dev/null

Seems I overlooked the Kconfig file for this driver,
sorry about that!

> +++ b/drivers/staging/media/phy-rockchip-dphy/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Rockchip platforms
> +#
> +config PHY_ROCKCHIP_DPHY
> +	tristate "Rockchip MIPI Synopsys DPHY driver"
> +	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> +	select GENERIC_PHY_MIPI_DPHY
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the Rockchip MIPI Synopsys DPHY.

Following a more user-friendly convention, this should read
more like:

"""
Enable this to support the Rockchip MIPI Synopsys DPHY
associated to the Rockchip ISP module present in RK3399 SoCs.

To compile this driver as a module, choose M here: the module
will be called phy-rockchip-dphy. 
"""

And I believe the same improvement should be applied to the
ISP driver Kconfig help.

Thanks,
Ezequiel

