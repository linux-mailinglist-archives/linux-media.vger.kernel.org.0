Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBCA1AFF9F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 03:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTB4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 21:56:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgDTB4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 21:56:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E654A528;
        Mon, 20 Apr 2020 03:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587347802;
        bh=Gl/jXkvQKz6zzZX+7EOUuhVQ87BOF1fAFqSVTKSzfWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZU+n4OkM9DJiVThqRU/0IkaZCobCfkGeCXZT1IzMiOiGG1t5AZOK5jhs37iQdFpWh
         d3azqtN8pYZkdh26fLmdjTKYqVUBjQ0UfJJ5V0EMsMjz8JiSuLupVfWN/bI/oK+u3t
         ClF0uCAzcga82orOk9YdTMtiFvgCZywApGGNXsAo=
Date:   Mon, 20 Apr 2020 04:56:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: i2c: adv748x: Adjust TXA data lanes number
Message-ID: <20200420015627.GD15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415105004.2497356-5-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 15, 2020 at 12:50:01PM +0200, Jacopo Mondi wrote:
> When outputting SD-Core output through the TXA MIPI CSI-2 interface,
> the number of enabled data lanes should be reduced in order to guarantee
> the two video format produced by the SD-Core (480i and 576i) generate a
> MIPI CSI-2 link clock frequency compatible with the MIPI D-PHY
> specifications.
> 
> Limit the number of enabled data lanes to 2, which is guaranteed to
> support 480i and 576i formats.
> 
> Cache the number of enabled data lanes to be able to report it through
> the new get_mbus_config operation introduced in the following patches.

When this will be merged it won't be "following patches" anymore :-)

> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 31 ++++++++++++++++++------
>  drivers/media/i2c/adv748x/adv748x.h      |  1 +
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 23e02ff27b17..1fe7f97c6d52 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -241,10 +241,10 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
>  	int ret = 0;
>  
>  	/* Enable n-lane MIPI */
> -	adv748x_write_check(state, page, 0x00, 0x80 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0x80 | tx->active_lanes, &ret);
>  
>  	/* Set Auto DPHY Timing */
> -	adv748x_write_check(state, page, 0x00, 0xa0 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0xa0 | tx->active_lanes, &ret);
>  
>  	/* ADI Required Write */
>  	if (tx->src == &state->hdmi.sd) {
> @@ -270,7 +270,7 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
>  	usleep_range(2000, 2500);
>  
>  	/* Power-up CSI-TX */
> -	adv748x_write_check(state, page, 0x00, 0x20 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0x20 | tx->active_lanes, &ret);
>  	usleep_range(1000, 1500);
>  
>  	/* ADI Required Writes */
> @@ -292,7 +292,7 @@ static int adv748x_power_down_tx(struct adv748x_csi2 *tx)
>  	adv748x_write_check(state, page, 0x1e, 0x00, &ret);
>  
>  	/* Enable n-lane MIPI */
> -	adv748x_write_check(state, page, 0x00, 0x80 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0x80 | tx->active_lanes, &ret);
>  
>  	/* i2c_mipi_pll_en - 1'b1 */
>  	adv748x_write_check(state, page, 0xda, 0x01, &ret);
> @@ -357,14 +357,29 @@ static int adv748x_link_setup(struct media_entity *entity,
>  	if (state->afe.tx) {
>  		/* AFE Requires TXA enabled, even when output to TXB */
>  		io10 |= ADV748X_IO_10_CSI4_EN;
> -		if (is_txa(tx))
> +		if (is_txa(tx)) {
> +			/*
> +			 * Output from the SD-core (480i and 576i) from the TXA
> +			 * interface requires reducing the number of enabled
> +			 * data lanes in order to guarantee a valid link
> +			 * frequency.
> +			 */
> +			tx->active_lanes = min(tx->num_lanes, 2U);
>  			io10 |= ADV748X_IO_10_CSI4_IN_SEL_AFE;
> -		else
> +		} else {
> +			/* TXB has a single data lane, no need to adjust. */
>  			io10 |= ADV748X_IO_10_CSI1_EN;
> +		}
>  	}
>  
> -	if (state->hdmi.tx)
> +	if (state->hdmi.tx) {
> +		/*
> +		 * Restore the number of active lanes, in case we have gone
> +		 * through an AFE->TXA streaming sessions.
> +		 */
> +		tx->active_lanes = tx->num_lanes;
>  		io10 |= ADV748X_IO_10_CSI4_EN;
> +	}
>  
>  	return io_clrset(state, ADV748X_IO_10, io10_mask, io10);
>  }
> @@ -596,6 +611,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
>  		}
>  
>  		state->txa.num_lanes = num_lanes;
> +		state->txa.active_lanes = num_lanes;
>  		adv_dbg(state, "TXA: using %u lanes\n", state->txa.num_lanes);
>  	}
>  
> @@ -607,6 +623,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
>  		}
>  
>  		state->txb.num_lanes = num_lanes;
> +		state->txb.active_lanes = num_lanes;
>  		adv_dbg(state, "TXB: using %u lanes\n", state->txb.num_lanes);
>  	}
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index fccb388ce179..1061f425ece5 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -79,6 +79,7 @@ struct adv748x_csi2 {
>  	unsigned int page;
>  	unsigned int port;
>  	unsigned int num_lanes;
> +	unsigned int active_lanes;
>  
>  	struct media_pad pads[ADV748X_CSI2_NR_PADS];
>  	struct v4l2_ctrl_handler ctrl_hdl;

-- 
Regards,

Laurent Pinchart
