Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDCCB5016B4
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343812AbiDNPKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 11:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353742AbiDNOzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:55:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A90DAFEA;
        Thu, 14 Apr 2022 07:42:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (153.162-64-87.adsl-dyn.isp.belgacom.be [87.64.162.153])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EC3E59D;
        Thu, 14 Apr 2022 16:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649947364;
        bh=2HTJtgZFHz7qhqQGcwPHayxgTCCdTNEwjpY0dhNY0pI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rM1/iM5zfbUfnobr4zSL+h+LIC5dzgitSmYmASipbWuwb7XOsmQxNq7dIRjPfckZI
         ArZA6EHBM/4bVbY3UtKoEEARxuwytrfgwY1dUur+mO0cAkOGULszzzYTAEyYPqhFLP
         uWam46M1ga5Hs4jFlzmANJjv50RoW54Cv9NchA5k=
Date:   Thu, 14 Apr 2022 17:42:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 2/6] media: cadence: cdns-csi2tx: Use mipi-csi2.h
Message-ID: <Ylgy45ND2r+L41f0@pendragon.ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220123160857.24161-3-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Ping on this patch in case someone wants to review it. I'll send a pull
request shortly for the part of this series that hasn't been merged yet,
and this is the last one missing a reviewed-by tag.

On Sun, Jan 23, 2022 at 06:08:53PM +0200, Laurent Pinchart wrote:
> Replace the hardcoded MIPI CSI-2 data types with macros from
> mipi-csi2.h.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2tx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
> index 8f8c36056354..58e405b69f67 100644
> --- a/drivers/media/platform/cadence/cdns-csi2tx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2tx.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -121,12 +122,12 @@ static const struct csi2tx_fmt csi2tx_formats[] = {
>  	{
>  		.mbus	= MEDIA_BUS_FMT_UYVY8_1X16,
>  		.bpp	= 2,
> -		.dt	= 0x1e,
> +		.dt	= MIPI_CSI2_DT_YUV422_8B,
>  	},
>  	{
>  		.mbus	= MEDIA_BUS_FMT_RGB888_1X24,
>  		.bpp	= 3,
> -		.dt	= 0x24,
> +		.dt	= MIPI_CSI2_DT_RGB888,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
