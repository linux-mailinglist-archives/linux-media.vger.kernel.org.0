Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCED51850FC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgCMVXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:23:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58376 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbgCMVXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:23:52 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 589F32D6;
        Fri, 13 Mar 2020 22:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584134629;
        bh=IMhiV5Vz2k3pdowwWoR/Qmpwd2H11u0gvTUhvGhrkpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cScPnew9RSEDN1y6Bo/x86i3wEKy0MJ4GhQWNbCMn/G/d8Q7+Wr/Jet/KQ1ZmdV9y
         AYjE1YhPmlrrIW0zAfFtOVVL+dI1jLg0ST/7YW0uLCu87SJvE5gu0c7+EIH6fhmMSM
         AEnyqZCGg3arV/tDA+KNWVeSmY1Z6qTa2N14cSGk=
Date:   Fri, 13 Mar 2020 23:23:45 +0200
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
Subject: Re: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
Message-ID: <20200313212345.GM4751@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Mar 13, 2020 at 09:12:33PM +0000, Lad Prabhakar wrote:
> While testing on Renesas RZ/G2E platform, noticed the clock frequency to
> be 24242424 as a result the probe failed. However increasing the maximum
> leverage of external clock frequency to 24480000 fixes this issue. Since
> this difference is small enough and is insignificant set the same in the
> driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 4fbabf3..b49359b 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1107,8 +1107,10 @@ static int ov5645_probe(struct i2c_client *client)
>  	}
>  
>  	xclk_freq = clk_get_rate(ov5645->xclk);
> -	/* external clock must be 24MHz, allow 1% tolerance */
> -	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> +	/* external clock must be 24MHz, allow a minimum 1% and a maximum of 2%
> +	 * tolerance

So where do these numbers come from ? I understand that 2% is what you
need to make your clock fit in the range, but why -1%/+2% instead of
-2%/+2% ? And why not 2.5 or 3% ? The sensor datasheet documents the
range of supported xvclk frequencies to be 6MHz to 54MHz. I understand
that PLL parameters depend on the clock frequency, but could they be
calculated instead of hardcoded, to avoid requiring an exact 24MHz input
frequency ?

> +	 */
> +	if (xclk_freq < 23760000 || xclk_freq > 24480000) {
>  		dev_err(dev, "external clock frequency %u is not supported\n",
>  			xclk_freq);
>  		return -EINVAL;

-- 
Regards,

Laurent Pinchart
