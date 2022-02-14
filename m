Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783A24B4885
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 10:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343856AbiBNJz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 04:55:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343852AbiBNJy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 04:54:27 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8087D280
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 01:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644831844; x=1676367844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OZbiG2RZ/F/bmopoD2efTawVSNakH6UZ5KaNVY+TLeM=;
  b=lmrVt9NDv/4OJd3wVNfudMrnjl3PZgyuFn2ZW/3/tlXc7WHDfGOUAQ+2
   TIpvOukYEdwUlapVjFdMW68pHnpknNVBJxguRCOT2IJO1ymPPaiKmbYkf
   HONBjOZFuXNoiJ4Vdczg0C949sg8VIJtDUQQKhLM+hxLWcKUeY8LyRV7L
   kPce0Bk4mss7yEdK62z1SkIFhAlvNIZKCB8dtbh8U6VyHJ4xzEZwDi8XU
   YUa9c3nv8RON6ePBIsl9fcSzBwa6mH5nV4TPpl534T7UOTAkjPnnS+H9/
   huwv6F80MFkQI3NKaFH6nnOFUAdmNaqi62N4dQH2Ax3bDcfvsO2Es+udT
   w==;
X-IronPort-AV: E=Sophos;i="5.88,367,1635199200"; 
   d="scan'208";a="22064560"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Feb 2022 10:44:02 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 14 Feb 2022 10:44:02 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 14 Feb 2022 10:44:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644831842; x=1676367842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OZbiG2RZ/F/bmopoD2efTawVSNakH6UZ5KaNVY+TLeM=;
  b=iY+dXzgLmEAmhHWNHDIX6lVkk05czVh5xmxlIEEtybaOfJPLtaCKXzEY
   JaCr8OlkSo/fpC7UFMsOHedXQOoQdb+mTJe8yMP8SvTDtHswz+kjUhvYy
   t/QNLnIDkzTycDHsfm8NuV9ietga7BXcoQLjpMiUFrO+wOfi2ENVlLjmJ
   QfCWcmpkhCYhsAJmkJQxsdGB3jSIpsBixhiNF+cGXNgOFdwbDBWt3859A
   NRG0X58D8TCGZqQT4nk9H/U51E7oo45Y95ZDAkXzHT3h6KhWL+fW3trbs
   ncwhIEGNtmVitlX/F7XCtP+WZdNNgGXWJAklP0UOc4CyOdS/jTQJka7mg
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,367,1635199200"; 
   d="scan'208";a="22064558"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Feb 2022 10:44:02 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EAF81280065;
        Mon, 14 Feb 2022 10:44:01 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     laurent.pinchart@ideasonboard.com, Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: (EXT) [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
Date:   Mon, 14 Feb 2022 10:43:59 +0100
Message-ID: <5885739.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220211180216.290133-2-jacopo@jmondi.org>
References: <20220211180216.290133-1-jacopo@jmondi.org> <20220211180216.290133-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, 11. Februar 2022, 19:02:14 CET schrieb Jacopo Mondi:
> The imx7-mipi-csis driver is in a good state and can be staged.
> 
> Move the imx7-mipi-csis.c driver to the newly created
> drivers/media/platform/imx directory and plumb the related
> options in Kconfig and in Makefile.

Please note that there is (at least) one pending patch at [1] which is crucial 
for my setup.
Also what about calculation for clk_settle in mipi_csis_calculate_params()? Is 
it really ok to leave it at 0?
Despite that I can't say if that driver is ready to be moved out of staging or 
not.

Laurent, do you have any preference in which order they should be applied?

Regards,
Alexander

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/
20220211142752.779952-6-alexander.stein@ew.tq-group.com/

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
>  rename drivers/{staging/media => media/platform}/imx/imx7-mipi-csis.c
> (100%)
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
> 
>  config VIDEO_TI_CAL
>  	tristate "TI CAL (Camera Adaptation Layer) driver"
> diff --git a/drivers/media/platform/Makefile
> b/drivers/media/platform/Makefile index 28eb4aadbf45..a9466c854610 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -20,6 +20,7 @@ obj-y	+= ti-vpe/
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
>  obj-$(CONFIG_VIDEO_CODA)		+= coda/
> 
> +obj-$(CONFIG_VIDEO_IMX)			+= imx/
>  obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
>  obj-$(CONFIG_VIDEO_IMX8_JPEG)		+= imx-jpeg/
> 
> diff --git a/drivers/media/platform/imx/Kconfig
> b/drivers/media/platform/imx/Kconfig new file mode 100644
> index 000000000000..0cf35733040c
> --- /dev/null
> +++ b/drivers/media/platform/imx/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig VIDEO_IMX
> +	bool "V4L2 capture drivers for NXP i.MX devices"
> +	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
> +	help
> +	  Say yes here to enable support for capture drivers on i.MX SoCs.
> +	  Support for the single SoC features are selectable in the sub-
menu
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
> +
> +endif # VIDEO_IMX
> diff --git a/drivers/media/platform/imx/Makefile
> b/drivers/media/platform/imx/Makefile new file mode 100644
> index 000000000000..ee272234c8d7
> --- /dev/null
> +++ b/drivers/media/platform/imx/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx7-mipi-csis.o
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c
> b/drivers/media/platform/imx/imx7-mipi-csis.c similarity index 100%
> rename from drivers/staging/media/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx7-mipi-csis.c
> diff --git a/drivers/staging/media/imx/Makefile
> b/drivers/staging/media/imx/Makefile index 19c2fc54d424..d82be898145b
> 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -15,5 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> 
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o




