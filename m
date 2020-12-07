Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6562D0A7A
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 07:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgLGGAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 01:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgLGGAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 01:00:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A75C0613D1
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 22:00:03 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1km9Yx-0003Dh-4W; Mon, 07 Dec 2020 06:59:55 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1km9Yu-00024l-PM; Mon, 07 Dec 2020 06:59:52 +0100
Date:   Mon, 7 Dec 2020 06:59:52 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     michael.srba@seznam.cz
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: imx219: add support for specifying
 clock-frequencies
Message-ID: <20201207055952.GB14307@pengutronix.de>
References: <20201206172720.9406-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206172720.9406-1-michael.srba@seznam.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:33:53 up 4 days, 18:00, 39 users,  load average: 0.07, 0.11, 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Sun, Dec 06, 2020 at 06:27:18PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds 1% tolerance on input clock, similar to other camera sensor
> drivers. It also allows for specifying the actual clock in the device tree,
> instead of relying on it being already set to the right frequency (which is
> often not the case).
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> 
> ---
> 
> changes since v1: default to exactly 24MHz when `clock-frequency` is not present
> 
> ---
>  drivers/media/i2c/imx219.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f64c0ef7a897..b6500e2ab19e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1443,13 +1443,28 @@ static int imx219_probe(struct i2c_client *client)
>  		return PTR_ERR(imx219->xclk);
>  	}
>  
> -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> -	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
> +	if (ret) {
> +		dev_warn(dev, "could not get xclk frequency\n");
> +
> +		/* default to 24MHz */
> +		imx219->xclk_freq = 24000000;
> +	}
> +
> +	/* this driver currently expects 24MHz; allow 1% tolerance */
> +	if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
>  		dev_err(dev, "xclk frequency not supported: %d Hz\n",
>  			imx219->xclk_freq);
>  		return -EINVAL;
>  	}
>  
> +	ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
> +	if (ret) {
> +		dev_err(dev, "could not set xclk frequency\n");
> +		return ret;
> +	}

clk_set_rate() returns successfully when the rate change has succeeded.
It tells you nothing about the actual rate that has been set. The rate
could be very different from what you want to get, depending on what the
hardware is able to archieve. There's clk_round_rate() that tells you
which rate you'll get when you call clk_set_rate() with that value.
You would have to call clk_round_rate() first and see if you are happy
with the result, afterwards set the rate. From that view it doesn't make
much sense to check the device tree if a number between 23760000 and
24240000 is specified there, the clk api will do rounding anyway.

Also there's the assigned-clocks device tree binding, see
Documentation/devicetree/bindings/clock/clock-bindings.txt. This allows
you to set the desired clock rate directly in the device tree. All
that's left to do in the driver is to replace the check for the exact
rate with a check which allows a certain tolerance.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
