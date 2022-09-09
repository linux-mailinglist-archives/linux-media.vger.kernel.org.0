Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080AF5B3EC0
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 20:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiIISW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 14:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIISWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 14:22:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43F4F7767
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 11:22:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10200A31;
        Fri,  9 Sep 2022 20:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662747742;
        bh=a6hkQTGK6Hg6ZbeXDaC5DTQQufNHAw+1kMWs9JBPvpE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sk6XHZRk6t6wTYmSuImKazoWFUpGiofmwNAKuTHDjlEvlUBOTBUNjsFRqbBmP19kz
         wwnYqXmYUPvSWazqiVDzZGKDIPMPOkWxN8eKjes+S3cH+AS9x3NAZpC92HZ4Y/aQjc
         9+k93w7OmE2eAzVNU0idFh6H3qBEdUoAVRrb24Pk=
Date:   Fri, 9 Sep 2022 21:22:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/6] media: imx: Decouple imx8mq-mipi-csi2 from
 imx7-media-csi
Message-ID: <YxuETLufyEzXWiRu@pendragon.ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220907200424.32136-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

It seems I forgot to CC you on this patch, sorry about that. Could you
give it a look ? I'd like to send a pull request for the series next
week.

On Wed, Sep 07, 2022 at 11:04:19PM +0300, Laurent Pinchart wrote:
> The imx8mq-mipi-csi2 driver targets SoCs that also run the
> imx7-media-csi driver, but they are distinct. Decouple them in Kconfig
> to prepare for destaging of the imx7-media-csi driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/Kconfig  | 10 ++++++++++
>  drivers/staging/media/imx/Makefile |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index 0bacac302d7e..bfb849701489 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -32,3 +32,13 @@ config VIDEO_IMX7_CSI
>  	  i.MX6UL/L, i.MX7 or i.MX8M.
>  endmenu
>  endif
> +
> +config VIDEO_IMX8MQ_MIPI_CSI2
> +	tristate "NXP i.MX8MQ MIPI CSI-2 receiver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  V4L2 driver for the MIPI CSI-2 receiver found in the i.MX8MQ SoC.
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index d82be898145b..cef9f30eb401 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -15,4 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
>  
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o

-- 
Regards,

Laurent Pinchart
