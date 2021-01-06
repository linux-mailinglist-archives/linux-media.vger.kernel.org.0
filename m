Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A882EBF7A
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbhAFOWW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbhAFOWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:22:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9192DC06134D
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:21:41 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9gx-0006Yu-EE; Wed, 06 Jan 2021 15:21:39 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9gx-0001xs-4a; Wed, 06 Jan 2021 15:21:39 +0100
Message-ID: <2699eea829fd3c22f7fcb66db3e92bc60fd60d06.camel@pengutronix.de>
Subject: Re: [PATCH 02/75] media: imx: Move dependency on VIDEO_DEV to
 common Kconfig symbol
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:21:39 +0100
In-Reply-To: <20210105152852.5733-3-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> All the i.MX staging media drivers depend on VIDEO_DEV. Move the
> dependency to the common VIDEO_IMX_MEDIA symbol to avoid repeating it.
> 
> While at it, sort the dependencies and selections alphabetically.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/Kconfig | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index 4782f7cfb709..76a9111c189c 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -2,13 +2,14 @@
>  config VIDEO_IMX_MEDIA
>  	tristate "i.MX5/6 V4L2 media core driver"
>  	depends on ARCH_MXC || COMPILE_TEST
> +	depends on HAS_DMA
> +	depends on VIDEO_DEV
>  	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
>  	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	depends on HAS_DMA
> -	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
>  	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  Say yes here to enable support for video4linux media controller
>  	  driver for the i.MX5/6 SOC.
> @@ -18,14 +19,14 @@ menu "i.MX5/6/7 Media Sub devices"
>  
>  config VIDEO_IMX_CSI
>  	tristate "i.MX5/6 Camera Sensor Interface driver"
> -	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
> +	depends on VIDEO_IMX_MEDIA
>  	default y
>  	help
>  	  A video4linux camera sensor interface driver for i.MX5/6.
>  
>  config VIDEO_IMX7_CSI
>  	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
> -	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
> +	depends on VIDEO_IMX_MEDIA
>  	default y
>  	help
>  	  Enable support for video4linux camera sensor interface driver for

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
