Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB12D5639C
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfFZHp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:45:26 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37039 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZHpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:45:25 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hg2cN-0007JV-7o; Wed, 26 Jun 2019 09:45:23 +0200
Message-ID: <1561535121.4870.1.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Wed, 26 Jun 2019 09:45:21 +0200
In-Reply-To: <20190625203945.28081-1-ezequiel@collabora.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-06-25 at 17:39 -0300, Ezequiel Garcia wrote:
> Not all sensors will be able to guarantee a proper initial state.
> This may be either because the driver is not properly written,
> or (probably unlikely) because the hardware won't support it.
> 
> While the right solution in the former case is to fix the sensor
> driver, the real world not always allows right solutions, due to lack
> of available documentation and support on these sensors.

Do you have a real world example for this?

> Let's relax this requirement, and allow the driver to support stream start,
> even if the sensor initial sequence wasn't the expected.
> A warning is still emitted, so users should be hinted that something is off.

I think the messages could use a note that they may be due to a sensor
or sensor driver bug, and that there might be image artifacts or
outright failure to capture as a consequence.

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

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
