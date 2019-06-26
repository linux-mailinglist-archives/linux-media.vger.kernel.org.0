Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072FC563EF
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 10:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfFZIDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 04:03:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZIC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 04:02:59 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D434510;
        Wed, 26 Jun 2019 10:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561536177;
        bh=kV1d/j+iweV8CSrc8sup5nRG+6WmjllrbAPFylvDkaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HtLhF2a725qejGEgrb3dXF6CI/CarRiIAjzohRe0Uft+qLSrbi4eD/YmeMPXyai2j
         gJZNOseX+Y7XlmmUpDzABWxBskp2Wu80BUf0FwYGrGOh3wRVBdV/fu2bLqE7Ld1xP3
         xlbJ6gvW7LvZoxes0PagVXeFWUEZjbrwTqEwdhf4=
Date:   Wed, 26 Jun 2019 11:00:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@collabora.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
Message-ID: <20190626080027.GA4776@pendragon.ideasonboard.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190625203945.28081-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Tue, Jun 25, 2019 at 05:39:45PM -0300, Ezequiel Garcia wrote:
> Not all sensors will be able to guarantee a proper initial state.
> This may be either because the driver is not properly written,
> or (probably unlikely) because the hardware won't support it.
> 
> While the right solution in the former case is to fix the sensor
> driver, the real world not always allows right solutions, due to lack
> of available documentation and support on these sensors.
> 
> Let's relax this requirement, and allow the driver to support stream start,
> even if the sensor initial sequence wasn't the expected.
> A warning is still emitted, so users should be hinted that something is off.

I'm not sure this is a very good idea. Failure to detect the LP-11 state
may mean that the sensor is completely powered off, but it may also mean
that it is already streaming data. I don't know how the CSI-2 receiver
state machine will operate in the first case, but in the second case it
will not be able to synchronise to the incoming stream, so it won't work
anyway.

I think you should instead fix the problem in the sensor driver, as you
hinted. Relaxing the requirement here will only make it more confusing,
it's a hack, and isn't portable across CSI-2 receivers. The same buggy
sensor driver won't work with other CSI-2 receivers whose internal state
machine require starting in the LP-11 state.

Which sensor are you using ?

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 33 ++++++----------------
>  1 file changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index f29e28df36ed..10342434e797 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>  }
>  
>  /* Waits for low-power LP-11 state on data and clock lanes. */
> -static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>  {
>  	u32 mask, reg;
>  	int ret;
> @@ -253,29 +253,21 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>  
>  	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>  				 (reg & mask) == mask, 0, 500000);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
> -		return ret;
> -	}
> -
> -	return 0;
> +	if (ret)
> +		v4l2_warn(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
>  }
>  
>  /* Wait for active clock on the clock lane. */
> -static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
>  {
>  	u32 reg;
>  	int ret;
>  
>  	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>  				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
> -			 reg);
> -		return ret;
> -	}
> -
> -	return 0;
> +	if (ret)
> +		v4l2_warn(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
> +			  reg);
>  }
>  
>  /* Setup the i.MX CSI2IPU Gasket */
> @@ -316,9 +308,7 @@ static int csi2_start(struct csi2_dev *csi2)
>  	csi2_enable(csi2, true);
>  
>  	/* Step 5 */
> -	ret = csi2_dphy_wait_stopstate(csi2);
> -	if (ret)
> -		goto err_assert_reset;
> +	csi2_dphy_wait_stopstate(csi2);
>  
>  	/* Step 6 */
>  	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
> @@ -327,14 +317,9 @@ static int csi2_start(struct csi2_dev *csi2)
>  		goto err_assert_reset;
>  
>  	/* Step 7 */
> -	ret = csi2_dphy_wait_clock_lane(csi2);
> -	if (ret)
> -		goto err_stop_upstream;
> -
> +	csi2_dphy_wait_clock_lane(csi2);
>  	return 0;
>  
> -err_stop_upstream:
> -	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
>  err_assert_reset:
>  	csi2_enable(csi2, false);
>  err_disable_clk:

-- 
Regards,

Laurent Pinchart
