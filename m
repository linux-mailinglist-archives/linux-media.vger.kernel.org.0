Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30451995F5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 14:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgCaMGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 08:06:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60648 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730357AbgCaMGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 08:06:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48EC2999;
        Tue, 31 Mar 2020 14:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585656374;
        bh=69F3Pbiv9NcehylvgReg9/hZmis3+hOaFKpfy24Zhfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EDnZFwMSX6B1MAbo4SLShhCUSk2/aILvoHny22bKbM+hh8EFTvMJEKCqoc947DNlI
         cd7/2YAwBoMiO+OjQIOxjOWEQq2bdqzc3PtKvgJaYvwe1Zhl2gDKfYZqNJse19rBQi
         m00KG2h9ROrQGam6ohaXURbZOZ+fdBV/r2dl7WNA=
Date:   Tue, 31 Mar 2020 15:06:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v4 17/33] media: add SPDX headers on Kconfig and Makefile
 files
Message-ID: <20200331120608.GB4767@pendragon.ideasonboard.com>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
 <981eea64742859c63d8ab88c24b1b3380ee32dd2.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <981eea64742859c63d8ab88c24b1b3380ee32dd2.1585651678.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Tue, Mar 31, 2020 at 01:11:53PM +0200, Mauro Carvalho Chehab wrote:
> Most of media Kconfig/Makefile files already has SPDX,
> but there are a few ones still missing. Add it to them.

I think it's a good idea to state the license of each source file, the
patch looks fine to me. I've however been thinking about licenses for
build system files recently, and I'll hijack this thread a bit to ask a
question :-)

For a project like the Linux kernel, and especially for subsystems that
are covered by a single license, the choice is easy, we can apply the
same license to the build files. However, for a project that contains
components covered by different licenses (such as, for instance, an LGPL
library, a GPL application and a BSD plugin), how should the license
covering the build system files be selected ? I searched a bit for
guidance on this topic, and couldn't find much.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/dvb-frontends/Kconfig             | 2 ++
>  drivers/media/mc/Kconfig                        | 2 ++
>  drivers/media/platform/sunxi/Kconfig            | 2 ++
>  drivers/media/platform/sunxi/Makefile           | 2 ++
>  drivers/media/platform/sunxi/sun4i-csi/Kconfig  | 2 ++
>  drivers/media/platform/sunxi/sun4i-csi/Makefile | 2 ++
>  drivers/staging/media/hantro/Makefile           | 2 ++
>  drivers/staging/media/rkisp1/Makefile           | 2 ++
>  8 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> index 1f45808d94da..aa24506257b3 100644
> --- a/drivers/media/dvb-frontends/Kconfig
> +++ b/drivers/media/dvb-frontends/Kconfig
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  if MEDIA_DIGITAL_TV_SUPPORT
>  
>  comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 3b9795cfcb36..0c5c52f14c64 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  #
>  # Media controller
>  #	Selectable only for webcam/grabbers, as other drivers don't use it
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
> index 71808e93ac2e..7151cc249afa 100644
> --- a/drivers/media/platform/sunxi/Kconfig
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -1,2 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
>  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
> index ff0993f70dc3..fc537c9f5ca9 100644
> --- a/drivers/media/platform/sunxi/Makefile
> +++ b/drivers/media/platform/sunxi/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  obj-y		+= sun4i-csi/
>  obj-y		+= sun6i-csi/
>  obj-y		+= sun8i-di/
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/Kconfig b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
> index e86e29b6a603..93b4e82a2655 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/Kconfig
> +++ b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  config VIDEO_SUN4I_CSI
>  	tristate "Allwinner A10 CMOS Sensor Interface Support"
>  	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API && HAS_DMA
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/Makefile b/drivers/media/platform/sunxi/sun4i-csi/Makefile
> index 7c790a57f5ee..5062b006d63e 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/Makefile
> +++ b/drivers/media/platform/sunxi/sun4i-csi/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  sun4i-csi-y += sun4i_csi.o
>  sun4i-csi-y += sun4i_dma.o
>  sun4i-csi-y += sun4i_v4l2.o
> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> index 68c29a9c4946..743ce08eb184 100644
> --- a/drivers/staging/media/hantro/Makefile
> +++ b/drivers/staging/media/hantro/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
>  
>  hantro-vpu-y += \
> diff --git a/drivers/staging/media/rkisp1/Makefile b/drivers/staging/media/rkisp1/Makefile
> index 69ca59c7ef34..ab32a77db8f7 100644
> --- a/drivers/staging/media/rkisp1/Makefile
> +++ b/drivers/staging/media/rkisp1/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
>  rockchip-isp1-objs += 	rkisp1-capture.o \
>  			rkisp1-common.o \

-- 
Regards,

Laurent Pinchart
