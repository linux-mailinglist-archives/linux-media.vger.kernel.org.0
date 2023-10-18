Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA847CDAF1
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 13:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjJRLsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 07:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjJRLsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 07:48:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960DDFE
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 04:48:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A2C32B3;
        Wed, 18 Oct 2023 13:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697629685;
        bh=5S6/eUw9iGkZOuvejwS6tckuC0p2gvTJ3VFLQ7SE7Lk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EaNC/rZZDTTuIMMcn3gTPi2WYfmHZnnV9+v/4cULRrKTKPd39ZYRve77PBLYx+l0o
         87YA429EFg5dTZX8HhWpRXFbLRGLYxwaK/8LvtKBHEAjrdd0ZlcYYk0pFeLKlnGhKE
         RfDj+McjUtwZdjbwvRJxgRGLlPFuby+k28Z11btw=
Date:   Wed, 18 Oct 2023 14:48:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan =?utf-8?Q?Riedm=C3=BCller?= <s.riedmueller@phytec.de>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, upstream@phytec.de
Subject: Re: [PATCH] media: imx: imx7-media-csi: Sync frames to start of
 frame for MIPI
Message-ID: <20231018114819.GE11118@pendragon.ideasonboard.com>
References: <20231017150854.270003-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017150854.270003-1-s.riedmueller@phytec.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch.

On Tue, Oct 17, 2023 at 05:08:54PM +0200, Stefan Riedmüller wrote:
> The default behavior for a base address change is to do it automatically
> after a DMA completion. This can lead to the situation, were one
> corrupted frame, with less lines than configured, results in all
> following frames being corrupted as well, due to a missing
> re-synchronization to the beginning of the next frame.
> 
> Fix this by configuring the base address switch to be synced with the
> start of frame event.
> 
> Currently this is already implemented for the parallel interface. To
> have it with MIPI as well, simply configure it unconditionally.
> 
> Tested on i.MX 8MM.

I recall not doing this unconditionally as it didn't work on some of the
platforms I was testing, but I'm not sure of the details anymore. I'll
retest on i.MX7.

Do we have any buffer overflow protection in this mode ? If the sensor
happens to send more lines than expected, will extra lines be dropped,
or overflow the buffer ?

> Signed-off-by: Stefan Riedmüller <s.riedmueller@phytec.de>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 15049c6aab37..0c9e3f01e96d 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -529,13 +529,13 @@ static void imx7_csi_configure(struct imx7_csi *csi,
>  		stride = out_pix->width;
>  	}
>  
> +	cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> +		BIT_BASEADDR_CHG_ERR_EN;
> +
>  	if (!csi->is_csi2) {
>  		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL
>  		    | BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
>  
> -		cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> -			BIT_BASEADDR_CHG_ERR_EN;
> -
>  		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
>  		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
>  			width *= 2;

-- 
Regards,

Laurent Pinchart
