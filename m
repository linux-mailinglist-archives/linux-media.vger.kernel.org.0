Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DFF2EBF8E
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbhAFOZm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbhAFOZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:25:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010B4C06134D
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:25:01 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9kB-0006rR-CG; Wed, 06 Jan 2021 15:24:59 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9kB-00020J-2P; Wed, 06 Jan 2021 15:24:59 +0100
Message-ID: <a8378fe99945194924655fd9d84a99500712ab32.camel@pengutronix.de>
Subject: Re: [PATCH 04/75] media: imx: Move IMX_IPUV3_CORE dependency to
 VIDEO_IMX_CSI
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:24:58 +0100
In-Reply-To: <20210105152852.5733-5-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-5-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> The i.MX7 camera drivers, selected by VIDEO_IMX7_CSI, don't depend on
> IMX_IPUV3_CORE. Move the dependency from the common VIDEO_IMX_MEDIA
> symbol to VIDEO_IMX_CSI.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index ce270627a7c4..0f1277a58d3c 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -4,7 +4,7 @@ config VIDEO_IMX_MEDIA
>  	depends on ARCH_MXC || COMPILE_TEST
>  	depends on HAS_DMA
>  	depends on VIDEO_DEV
> -	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
> +	depends on VIDEO_V4L2
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select V4L2_MEM2MEM_DEV
> @@ -19,6 +19,7 @@ menu "i.MX5/6/7 Media Sub devices"
>  
>  config VIDEO_IMX_CSI
>  	tristate "i.MX5/6 Camera Sensor Interface driver"
> +	depends on IMX_IPUV3_CORE
>  	default y
>  	help
>  	  A video4linux camera sensor interface driver for i.MX5/6.

This patch drops the IMX_IPUV3_CORE dependency from VIDEO_IMX_MEDIA,
which still tries to build imx6-media.ko (and will fail if
IMX_IPUV3_CORE is disabled) until the following patch.

Would it make sense to squash this with the following patch for better
bisectability?

regards
Philipp
