Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF13E2A854D
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 18:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgKERvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 12:51:43 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55131 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725862AbgKERvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 12:51:42 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ajQ8kCOECRiwVajQBkNAUf; Thu, 05 Nov 2020 18:51:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604598700; bh=n+I4LviKqnj7HqsHtVwRIEiGmjCq3TTHH6L1Szf9+aE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jZkInr7echv8KdXdT0AxWnTsq+tvb/DEwXzTVWVF3zqcTG23hq8XTCax87Tke/p0T
         yg+AXspVRDRIaOv8rmQlszRHmCutogP4S0uM7fQ8Jec07FaleLGwlFha3APicZO3tQ
         L53CmgD+K1vJoWjXGzucm/QYdcQm6UoaIyfKxBOfRIW5STum1N/UP2GCAlu7OG2xUx
         HDMEPHhWI3kOI7IKla3WI600mzUXm0ppRmbZo2dkJLf7d2fjNrmC9PfEyNPJJJT06T
         pH7eCK+wdM3NOSPiVEWeNTBsB7iOB//BtoetQlQ5rRjiHePtqRpmFHlo631oXi4XoO
         9mpO8n2VYU+zw==
Subject: Re: [PATCH v2 2/3] media: rockchip: rkisp1: destage Rockchip ISP1
 driver
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
References: <20201030112225.2095909-1-helen.koike@collabora.com>
 <20201030112225.2095909-3-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c007d388-72ac-ab77-93db-447fd64fbf31@xs4all.nl>
Date:   Thu, 5 Nov 2020 18:51:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030112225.2095909-3-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHYYfYHcyRLoZ2IR2479pf5+dYhBvc83csx6KhiqrK078TRklBguBs2xtlJD0bV3+Oail+/pafDvvS4LBSj5JHvnsJ9CV+Q9GevA4A/oLeL29vPN19nS
 53GqY8uhma2WgkE8A0o7Ts2bre3LZOHeY0l5WGtK4xlvn7+gtYiaWahBHCUdk5L1J1D57OIzHjy7Z8rf75B3k89E/w9iehNmJ4iDHZBj4mkEhtPlR+Jx+KSe
 xWn6X8c4AWagLMBm5gzeaq9nhh5InS74y7WUnytpj33LiJ9DVfUXXqYzAlawG1oyztAbkonwCAbYy7NxKOLwqIeQTRfhrbTZnicdXefTxI/6UEnIYXU3bu4R
 W5OhV7FwODMJAJ6kCdnlAveeqWyoszkoxolEpK8eBCTpy5GJ1kyeYDP2tMQ3pQvq49Av+0WBFEGs0wSga6Y1xkk3CFb2c87bj9cxY3Rrd4OudeqjHIvGI6Hr
 QIV+q1VBbaih5PtFe9iMMGTmIXJfeKFRYXwLyY74/zrL/sT9OKFedZ2ipfTM/n1ykVyY+p07g4dPtTcGVY14943ZVy3nZvtxUtS4ZgQU+cwi/v4x+srrSceD
 ET1XGdO6Aqu1wIfYQ0EiWaCjSzHFTWqPvUSHVt5YXhAfvDXQ22prn1Na2uWNrMCWYVM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 12:22, Helen Koike wrote:
> All the items in the TODO list were addressed, uapi was reviewed,
> documentation written, checkpatch errors fixed, several bugs fixed.
> 
> There is no big reason to keep this driver in staging, so move it out.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Mauro held off on the patch that moved the bindings out of staging. I think
that patch should be folded into this patch.

Ditto for the binding MAINTAINERS patch, that can be folded in the next patch.

> 
> ---
>  .../media/v4l/pixfmt-meta-rkisp1.rst          |  2 +-
>  drivers/media/platform/Kconfig                | 18 ++++++++++++++++++
>  drivers/media/platform/Makefile               |  1 +
>  .../platform/rockchip}/rkisp1/Makefile        |  0
>  .../rockchip}/rkisp1/rkisp1-capture.c         |  0
>  .../platform/rockchip}/rkisp1/rkisp1-common.c |  0
>  .../platform/rockchip}/rkisp1/rkisp1-common.h |  2 +-
>  .../platform/rockchip}/rkisp1/rkisp1-dev.c    |  0
>  .../platform/rockchip}/rkisp1/rkisp1-isp.c    |  0
>  .../platform/rockchip}/rkisp1/rkisp1-params.c |  0
>  .../platform/rockchip}/rkisp1/rkisp1-regs.h   |  0
>  .../rockchip}/rkisp1/rkisp1-resizer.c         |  0
>  .../platform/rockchip}/rkisp1/rkisp1-stats.c  |  0
>  drivers/staging/media/Kconfig                 |  2 --
>  drivers/staging/media/Makefile                |  1 -
>  drivers/staging/media/rkisp1/Kconfig          | 19 -------------------
>  drivers/staging/media/rkisp1/TODO             |  6 ------
>  .../uapi/linux}/rkisp1-config.h               |  0
>  18 files changed, 21 insertions(+), 30 deletions(-)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (100%)
>  rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
>  delete mode 100644 drivers/staging/media/rkisp1/Kconfig
>  delete mode 100644 drivers/staging/media/rkisp1/TODO
>  rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (100%)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> index 7e43837ed260a..f3671472d4105 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> @@ -46,4 +46,4 @@ important tuning tools using software control loop.
>  rkisp1 uAPI data types
>  ======================
>  
> -.. kernel-doc:: drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d56..202d447759fd8 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -448,6 +448,24 @@ config VIDEO_RENESAS_VSP1
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called vsp1.
>  
> +config VIDEO_ROCKCHIP_ISP1
> +	tristate "Rockchip Image Signal Processing v1 Unit driver"
> +	depends on VIDEO_V4L2 && OF
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_FWNODE
> +	select GENERIC_PHY_MIPI_DPHY
> +	default n
> +	help
> +	  Enable this to support the Image Signal Processing (ISP) module
> +	  present in RK3399 SoCs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-isp1.
> +

Hmm, this ends up in the 'Memory-to-memory multimedia devices' section
of the Kconfig, but this should be in 'V4L platform devices'.

Can you rebase this series and the two binding related patches to the
latest media_tree master? Everything else is in place, so it is time to
move this driver out of staging.

Regards,

	Hans

>  config VIDEO_ROCKCHIP_RGA
>  	tristate "Rockchip Raster 2d Graphic Acceleration Unit"
>  	depends on VIDEO_DEV && VIDEO_V4L2
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 62b6cdc8c7300..b342714228db4 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_VIDEO_RENESAS_FDP1)	+= rcar_fdp1.o
>  obj-$(CONFIG_VIDEO_RENESAS_JPU)		+= rcar_jpu.o
>  obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1/
>  
> +obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rockchip/rkisp1/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
>  
>  obj-y	+= omap/
> diff --git a/drivers/staging/media/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
> similarity index 100%
> rename from drivers/staging/media/rkisp1/Makefile
> rename to drivers/media/platform/rockchip/rkisp1/Makefile
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-capture.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-common.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> similarity index 99%
> rename from drivers/staging/media/rkisp1/rkisp1-common.h
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 692333c66f9d1..3a134e97161cb 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -13,6 +13,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/mutex.h>
> +#include <linux/rkisp1-config.h>
>  #include <media/media-device.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-ctrls.h>
> @@ -20,7 +21,6 @@
>  #include <media/videobuf2-v4l2.h>
>  
>  #include "rkisp1-regs.h"
> -#include "uapi/rkisp1-config.h"
>  
>  /*
>   * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-dev.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-isp.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-params.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> diff --git a/drivers/staging/media/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-regs.h
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-resizer.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> similarity index 100%
> rename from drivers/staging/media/rkisp1/rkisp1-stats.c
> rename to drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 747c6cf1d795e..e8996b1c3b351 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -44,6 +44,4 @@ source "drivers/staging/media/tegra-video/Kconfig"
>  
>  source "drivers/staging/media/ipu3/Kconfig"
>  
> -source "drivers/staging/media/rkisp1/Kconfig"
> -
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index b59571826ba69..24b5873ff7608 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -10,5 +10,4 @@ obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
>  obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
>  obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
>  obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
> -obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rkisp1/
>  obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
> diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
> deleted file mode 100644
> index 41f5def9ea442..0000000000000
> --- a/drivers/staging/media/rkisp1/Kconfig
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -
> -config VIDEO_ROCKCHIP_ISP1
> -	tristate "Rockchip Image Signal Processing v1 Unit driver"
> -	depends on VIDEO_V4L2 && OF
> -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select VIDEOBUF2_DMA_CONTIG
> -	select VIDEOBUF2_VMALLOC
> -	select V4L2_FWNODE
> -	select GENERIC_PHY_MIPI_DPHY
> -	default n
> -	help
> -	  Enable this to support the Image Signal Processing (ISP) module
> -	  present in RK3399 SoCs.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called rockchip-isp1.
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> deleted file mode 100644
> index bb5548cd6bd1b..0000000000000
> --- a/drivers/staging/media/rkisp1/TODO
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -NOTES:
> -* All v4l2-compliance test must pass.
> -* Stats and params can be tested with libcamera and ChromiumOS stack.
> -
> -Please CC patches to Linux Media <linux-media@vger.kernel.org> and
> -Helen Koike <helen.koike@collabora.com>.
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> similarity index 100%
> rename from drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> rename to include/uapi/linux/rkisp1-config.h
> 

