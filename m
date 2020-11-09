Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AC22AB37B
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 10:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgKIJXI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 9 Nov 2020 04:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgKIJXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 04:23:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB55C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 01:23:07 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kc3O4-0006TO-Q1; Mon, 09 Nov 2020 10:22:56 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kc3O3-0004Ta-Sc; Mon, 09 Nov 2020 10:22:55 +0100
Message-ID: <2aec3ae20bf5a9eefbe691a69c76c91b09af2a35.camel@pengutronix.de>
Subject: Re: [PATCH] staging: media: imx: drop dependency on ipuv3
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        rogerio.silva@nxp.com, slongerbeam@gmail.com, mchehab@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com
Cc:     iain.galloway@nxp.com, kernel@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 09 Nov 2020 10:22:55 +0100
In-Reply-To: <20201109091340.7223-1-martin.kepplinger@puri.sm>
References: <20201109091340.7223-1-martin.kepplinger@puri.sm>
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

Hi Martin,

On Mon, 2020-11-09 at 10:13 +0100, Martin Kepplinger wrote:
> As described in NXPs' linux tree, the imx8m SoC includes the same
> CSI bridge hardware that is part of imx7d. We should be able to
> use the "fsl,imx7-csi" driver for imx8m directly.
> 
> Since ipuv3 is not relevant for imx8m, drop the build dependency
> for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/staging/media/imx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index f555aac8a9d5..98272fd92fe4 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_IMX_MEDIA
>  	tristate "i.MX5/6 V4L2 media core driver"

VIDEO_IMX_MEDIA builds imx6-media, which does depend on IMX_IPUV3_CORE.
You only want imx-media-common. I think we have to split the
configuration option in two.

>  	depends on ARCH_MXC || COMPILE_TEST
> -	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
> +	depends on VIDEO_V4L2
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	depends on HAS_DMA

regards
Philipp
