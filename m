Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269425B1319
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 05:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiIHD60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 23:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiIHD6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 23:58:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF248C653C
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 20:58:23 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24C916CC;
        Thu,  8 Sep 2022 05:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662609502;
        bh=Dl/OxvEs/lUnrwcTkYct+2d3dro91/AMilIGZ5JyvcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iRPA3cd9dE3ORoElxo8C0vMzeRjZ1nFI07TBKx4s36jUKNdSQnbA5gyAUE9+iF0xc
         yFl0U5zNqNUGYdkwDmg0Jvx5V0Duhmf2G0IDUx79zu3yZ4U1h1DoEovtY1eC6pjO/t
         6QMarZbOeIWJRkpHqxZ8harCzktDZ+dHxsqrmF3w=
Date:   Thu, 8 Sep 2022 12:58:13 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/6] media: imx: Decouple imx8mq-mipi-csi2 from
 imx7-media-csi
Message-ID: <20220908035813.GE1140330@pyrite.rasen.tech>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Wed, Sep 07, 2022 at 11:04:19PM +0300, Laurent Pinchart wrote:
> The imx8mq-mipi-csi2 driver targets SoCs that also run the
> imx7-media-csi driver, but they are distinct. Decouple them in Kconfig
> to prepare for destaging of the imx7-media-csi driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

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
