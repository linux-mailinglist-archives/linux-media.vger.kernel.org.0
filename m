Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73BE1F92C7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 11:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbgFOJIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 05:08:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41906 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbgFOJIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 05:08:47 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95021F9;
        Mon, 15 Jun 2020 11:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592212124;
        bh=8+Z1OmokNv2/0B7lIPTqyx8vax/11S6KMylCnxuo8Yk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XKvSWcq5TpRoHsg6XuiBRKVf8QKFoRQn8cpaurl64rDq3KpGdjeZgwauDDjVOO3L+
         GAEjXLvpRsYX/vONwmVUOH/xBrI8W6Nqr8jEuCHxflpMLuMvRub7bPAqY/o/3RBUKU
         /0BOza+Ue0Caek54YjmAJQfyVZrjKpdAgzN0h9GA=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 7/9] media: i2c: adv748x: Adjust TXA data lanes number
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        dave.stevenson@raspberrypi.com, hyun.kwon@xilinx.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-8-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <2c05e23d-e2ca-afb4-88dd-84be19f42096@ideasonboard.com>
Date:   Mon, 15 Jun 2020 10:08:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611161651.264633-8-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 11/06/2020 17:16, Jacopo Mondi wrote:
> When outputting SD-Core output through the TXA MIPI CSI-2 interface,
> the number of enabled data lanes should be reduced in order to guarantee
> the two video format produced by the SD-Core (480i and 576i) generate a

s/the/that the/
s/format/formats/

> MIPI CSI-2 link clock frequency compatible with the MIPI D-PHY
> specifications.
> 
> Limit the number of enabled data lanes to 2, which is guaranteed to
> support 480i and 576i formats.
> 
> Cache the number of enabled data lanes to be able to report it through
> the new get_mbus_config operation.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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

Shouldn't tx->active_lanes still be set here though?

Ah, no - I see it's set as a default when parsed in
adv748x_parse_csi2_lanes().

Ok - that's fine by me then.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> 

-- 
Regards
--
Kieran
