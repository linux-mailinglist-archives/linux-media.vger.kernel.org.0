Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7835119FBB4
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgDFRfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:35:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52704 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgDFRfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:35:13 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43CE11031;
        Mon,  6 Apr 2020 19:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586194512;
        bh=2GdPMyBtue+7HjxdIkmbI8MT7kHPXJlMQFDnms22Grg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iRfOGyoNHLTIP8t/BMlEzG8LaBpJJdwZ0CyoIc9N2yRm852YnFtRPoSf5UP26DDbC
         0st+N6m66yfe/0t2KgsS6J07tsRzMWM5aVHKGoPwLSOOC9P/ZRKScFg5W+5YFReJtL
         3c6SfeuVZYw/uXUa1eAVXBH1hJ+CcW8dnauutFxo=
Date:   Mon, 6 Apr 2020 20:35:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 3/5] media: i2c: ov5645: Turn probe error into warning
 for xvclk frequency mismatch
Message-ID: <20200406173503.GF16885@pendragon.ideasonboard.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586191361-16598-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Mon, Apr 06, 2020 at 05:42:39PM +0100, Lad Prabhakar wrote:
> PLL's on platforms might not be so accurate enough to generate the
> required clock frequency, so instead of erroring out on xvlck frequency
> mismatch just warn the user and continue ahead in probe.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 52848fff8a08..314760349adf 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1103,11 +1103,8 @@ static int ov5645_probe(struct i2c_client *client)
>  	}
>  	/* external clock must be 24MHz, allow 1% tolerance */
>  	xclk_freq = clk_get_rate(ov5645->xclk);
> -	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> -		dev_err(dev, "external clock frequency %u is not supported\n",
> -			xclk_freq);
> -		return -EINVAL;
> -	}
> +	if (xclk_freq < 23760000 || xclk_freq > 24240000)
> +		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
>  
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];

-- 
Regards,

Laurent Pinchart
