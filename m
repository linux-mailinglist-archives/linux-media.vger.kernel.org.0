Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C392F1850D4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgCMVQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:16:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgCMVQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:16:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F4B52D6;
        Fri, 13 Mar 2020 22:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584134208;
        bh=fxHorn7UuM1fDLI8Lt271tTqm19pZ50gn9WZ1vomREk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jrkQANpqeapfaL9IR9Njcr1VtSfnoFE2jelP11Ih3QgxWSSROriCC9L2GLM4YSzEq
         uMwmqth3Dz5ezP297vQaVogADiGPFXbsjFGLMEjgp6JJrt9fwiiUYgQK7KQThkriPu
         4O9OE75PAOWovQfBEyDkNvQY5m9REWdC9USeBQaY=
Date:   Fri, 13 Mar 2020 23:16:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] media: i2c: ov5645: Switch to assigned-clock-rates
Message-ID: <20200313211644.GK4751@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584133954-6953-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabakhar,

Thank you for the patch.

On Fri, Mar 13, 2020 at 09:12:32PM +0000, Lad Prabhakar wrote:
> This patch switches to assigned-clock-rates for specifying the clock rate.
> The clk-conf.c internally handles setting the clock rate when
> assigned-clock-rates is passed.
> 
> The driver now sets the clock frequency only if the deprecated property
> clock-frequency is defined instead assigned-clock-rates, this is to avoid
> breakage with existing DT binaries.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a6c17d1..4fbabf3 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1055,6 +1055,7 @@ static int ov5645_probe(struct i2c_client *client)
>  	struct device_node *endpoint;
>  	struct ov5645 *ov5645;
>  	u8 chip_id_high, chip_id_low;
> +	bool set_clk = false;

This isn't used.

>  	unsigned int i;
>  	u32 xclk_freq;
>  	int ret;
> @@ -1094,12 +1095,18 @@ static int ov5645_probe(struct i2c_client *client)
>  		return PTR_ERR(ov5645->xclk);
>  	}
>  
> -	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not get xclk frequency\n");
> -		return ret;
> +	/* check if deprecated property clock-frequency is defined */
> +	ret = of_property_read_u32(dev->of_node, "clock-frequency",
> +				   &xclk_freq);
> +	if (!ret) {
> +		ret = clk_set_rate(ov5645->xclk, xclk_freq);
> +		if (ret) {
> +			dev_err(dev, "could not set xclk frequency\n");
> +			return ret;
> +		}
>  	}
>  
> +	xclk_freq = clk_get_rate(ov5645->xclk);

I would move this line below the comment.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* external clock must be 24MHz, allow 1% tolerance */
>  	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
>  		dev_err(dev, "external clock frequency %u is not supported\n",
> @@ -1107,12 +1114,6 @@ static int ov5645_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not set xclk frequency\n");
> -		return ret;
> -	}
> -
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];
>  

-- 
Regards,

Laurent Pinchart
