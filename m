Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAD66183CEF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgCLXA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:00:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33724 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCLXA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:00:58 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EB8E5F;
        Fri, 13 Mar 2020 00:00:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584054055;
        bh=jnmOzIxaCTZh1F1zNSt0BgEhkqnAzDOwvfCybQjDan8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nLveb5QcQBAu4GpysEGt6gXx3fDGzyxucsJXf77FqzvYBnyukI3CNdTOgqTGWljmm
         Xd8xT0JYCJk0uT7dXNeXlNsQ+vWy/dj/gNzi5x9j0xtJL3Qy7HhP9ZrdN7Xkks4Uy5
         d28ZIca83jrqkAZVN6CChdChqYy4yPi5QLT5Xgp8=
Date:   Fri, 13 Mar 2020 01:00:51 +0200
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] media: i2c: ov5645: Switch to assigned-clock-rates
Message-ID: <20200312230051.GA30932@pendragon.ideasonboard.com>
References: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabakhar,

Thank you for the patch.

On Thu, Mar 12, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
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
>  drivers/media/i2c/ov5645.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a6c17d1..6cd16c5 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1055,6 +1055,7 @@ static int ov5645_probe(struct i2c_client *client)
>  	struct device_node *endpoint;
>  	struct ov5645 *ov5645;
>  	u8 chip_id_high, chip_id_low;
> +	bool set_clk = false;
>  	unsigned int i;
>  	u32 xclk_freq;
>  	int ret;
> @@ -1094,10 +1095,17 @@ static int ov5645_probe(struct i2c_client *client)
>  		return PTR_ERR(ov5645->xclk);
>  	}
>  
> -	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> +	ret = of_property_read_u32(dev->of_node, "assigned-clock-rates",
> +				   &xclk_freq);

You shouldn't read the assigned-clock-rates property, you should instead
get the rate from the clock with clk_get_rate().

>  	if (ret) {
> -		dev_err(dev, "could not get xclk frequency\n");
> -		return ret;
> +		/* check if deprecated property clock-frequency is defined */
> +		ret = of_property_read_u32(dev->of_node, "clock-frequency",
> +					   &xclk_freq);
> +		if (ret) {
> +			dev_err(dev, "could not get xclk frequency\n");
> +			return ret;
> +		}
> +		set_clk = true;
>  	}
>  
>  	/* external clock must be 24MHz, allow 1% tolerance */
> @@ -1107,10 +1115,12 @@ static int ov5645_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not set xclk frequency\n");
> -		return ret;
> +	if (set_clk) {
> +		ret = clk_set_rate(ov5645->xclk, xclk_freq);
> +		if (ret) {
> +			dev_err(dev, "could not set xclk frequency\n");
> +			return ret;
> +		}
>  	}
>  
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)

-- 
Regards,

Laurent Pinchart
