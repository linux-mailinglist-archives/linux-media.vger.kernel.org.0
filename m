Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6EA4B2EA0
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 21:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345731AbiBKUlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 15:41:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbiBKUlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 15:41:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDB4CF9
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 12:41:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C04693;
        Fri, 11 Feb 2022 21:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644612061;
        bh=gFB9ji4kpoefH+0yb2VQDdCkZz4qZ849PqjD9kjXhY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOYQrsP7SFRrCk5jjJ93Kx5QE0W+cDEI83s16/zVr7wND/8VhI05QhQyiMvqKq0nH
         XVXHXQK2Ms5S5TFifD7ZyW+n9Vf6Qd6uu5ozsfqN6KYcSc19AjKM1paTrKGLb1fwBp
         exk+FgZo/TM7FuVdhrK8ODdJf2jENi0HFIo9RIyc=
Date:   Fri, 11 Feb 2022 22:40:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
Message-ID: <YgbJ2NezIvyKfRnR@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211180216.290133-2-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 11, 2022 at 07:02:14PM +0100, Jacopo Mondi wrote:
> The imx7-mipi-csis driver is in a good state and can be staged.
> 
> Move the imx7-mipi-csis.c driver to the newly created
> drivers/media/platform/imx directory and plumb the related
> options in Kconfig and in Makefile.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/media/platform/Kconfig                |  1 +
>  drivers/media/platform/Makefile               |  1 +
>  drivers/media/platform/imx/Kconfig            | 23 +++++++++++++++++++
>  drivers/media/platform/imx/Makefile           |  1 +
>  .../platform}/imx/imx7-mipi-csis.c            |  0
>  drivers/staging/media/imx/Makefile            |  1 -
>  7 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  rename drivers/{staging/media => media/platform}/imx/imx7-mipi-csis.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83d27b57016f..5bdb8c881b0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11891,8 +11891,8 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> +F:	drivers/media/platform/imx/imx7-mipi-csis.c
>  F:	drivers/staging/media/imx/imx7-media-csi.c
> -F:	drivers/staging/media/imx/imx7-mipi-csis.c
>  
>  MEDIA DRIVERS FOR HELENE
>  M:	Abylay Ospan <aospan@netup.ru>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9fbdba0fd1e7..d9eeccffea69 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -171,6 +171,7 @@ source "drivers/media/platform/xilinx/Kconfig"
>  source "drivers/media/platform/rcar-vin/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
> +source "drivers/media/platform/imx/Kconfig"

One day I'll order all this alphabetically.

>  
>  config VIDEO_TI_CAL
>  	tristate "TI CAL (Camera Adaptation Layer) driver"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 28eb4aadbf45..a9466c854610 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -20,6 +20,7 @@ obj-y	+= ti-vpe/
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
>  obj-$(CONFIG_VIDEO_CODA)		+= coda/
>  
> +obj-$(CONFIG_VIDEO_IMX)			+= imx/
>  obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
>  obj-$(CONFIG_VIDEO_IMX8_JPEG)		+= imx-jpeg/

No in this series, but it would be nice to move those drivers to imx/
one day.

> diff --git a/drivers/media/platform/imx/Kconfig b/drivers/media/platform/imx/Kconfig
> new file mode 100644
> index 000000000000..0cf35733040c
> --- /dev/null
> +++ b/drivers/media/platform/imx/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig VIDEO_IMX
> +	bool "V4L2 capture drivers for NXP i.MX devices"
> +	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)

It's quite common to list the platform dependencies separately:

	depends on ARCH_MXC || COMPILE_TEST
	depends on VIDEO_DEV && VIDEO_V4L2

Up to you.

> +	help
> +	  Say yes here to enable support for capture drivers on i.MX SoCs.
> +	  Support for the single SoC features are selectable in the sub-menu
> +	  options.
> +
> +if VIDEO_IMX
> +
> +config VIDEO_IMX_MIPI_CSIS
> +	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	default n
> +	help
> +	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> +	  v3.3/v3.6 found on some i.MX7 and i.MX8 SoCs.

The latter is v3.6.3.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +endif # VIDEO_IMX
> diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
> new file mode 100644
> index 000000000000..ee272234c8d7
> --- /dev/null
> +++ b/drivers/media/platform/imx/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx7-mipi-csis.o
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx7-mipi-csis.c
> similarity index 100%
> rename from drivers/staging/media/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx7-mipi-csis.c
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 19c2fc54d424..d82be898145b 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -15,5 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
>  
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o

-- 
Regards,

Laurent Pinchart
