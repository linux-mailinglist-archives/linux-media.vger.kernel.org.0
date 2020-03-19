Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A42818B9C0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 15:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgCSOuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 10:50:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47146 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgCSOuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 10:50:20 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5D2AA53;
        Thu, 19 Mar 2020 15:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584629417;
        bh=Pby7Rfq98gCjrIQMddd1yja9dLfow5voxs2h3guV+As=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/jB37cddxIH58tafwLvJabTiL6v7j8NXqUDy/OZfrKwJ5UmZYFYTKUgxkadrlMD+
         oXxrR2AZLl9dopTWTs2TaZczsuCSoZbZR6/N4YkrMlNAOp5huLu0H1288VEg2YJhsQ
         BRnZmQnWGxtddFyZ652yVvb07WU+SF2oFyagIiMw=
Date:   Thu, 19 Mar 2020 16:50:12 +0200
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
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 3/5] media: i2c: ov5645: Increase tolerance of
 external clock frequency
Message-ID: <20200319145012.GB14585@pendragon.ideasonboard.com>
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584620363-2255-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584620363-2255-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Thu, Mar 19, 2020 at 12:19:21PM +0000, Lad Prabhakar wrote:
> While testing on Renesas RZ/G2E platform, noticed the clock frequency to
> be 24242424 as a result the probe failed.
> 
> This patch increases the tolerance to 5% so that it avoids patching for
> new platforms and it warns the users if the frequency is not within the
> range and continue further in the probe instead of returning failure.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index e298acdadeef..52a185ed4368 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1105,13 +1105,11 @@ static int ov5645_probe(struct i2c_client *client)
>  		}
>  	}
>  
> -	/* external clock must be 24MHz, allow 1% tolerance */
> +	/* ideally external clock must be 24MHz, allow 5% tolerance */
>  	xclk_freq = clk_get_rate(ov5645->xclk);
> -	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> -		dev_err(dev, "external clock frequency %u is not supported\n",
> -			xclk_freq);
> -		return -EINVAL;
> -	}
> +	if (xclk_freq < 22800000 || xclk_freq > 25200000)
> +		dev_warn(dev, "external clock frequency is set to %u, sensor might misbehave\n",
> +			 xclk_freq);

The code looks good to me. You may want to mention in the commit subject
that the probe error is turned into a warning, but that may be hard to
do on a single line. Splitting this in two patches could be best, but is
not worth a new version if it's the only change required. If more
changes are required, you can consider it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];

-- 
Regards,

Laurent Pinchart
