Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEA028F9DD
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 22:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392062AbgJOUAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 16:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392040AbgJOUAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 16:00:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECDBC061755;
        Thu, 15 Oct 2020 13:00:46 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0345556;
        Thu, 15 Oct 2020 22:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602792043;
        bh=izH9H8iQTzC30m7jO8b83gxSPSpkQpnsFsc295p+2gQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LaslllP2tLXqaertoBfp3WntC4heYm1W8By273rWKlQkyrZxzDO5A8Kq5JGEZJPkC
         dLC8pDPWJ9zZVgQ7GLL+6udaihaWK97uCTDO/xlyyAXwrCaF4pYJV5o4cyEqKnAYND
         99Nwzj4XVtPwjm98ZVEpQTtD6sHw8z+Acbc6ljec=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 4/7] media: i2c: max9286: Make channel amplitude
 programmable
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
 <20201015182710.54795-5-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c9506b37-2831-bdd9-fbf4-8b8fb53a6f87@ideasonboard.com>
Date:   Thu, 15 Oct 2020 21:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015182710.54795-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/10/2020 19:27, Jacopo Mondi wrote:
> Instrument the function that configures the reverse channel with a
> programmable amplitude value.
> 
> This change serves to prepare to adjust the reverse channel amplitude
> depending on the remote end high-threshold configuration.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 89a7248f5c25..163e102199e3 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -906,19 +906,29 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
>   * Probe/Remove
>   */
>  
> -static void max9286_reverse_channel_setup(struct max9286_priv *priv)
> +static void max9286_reverse_channel_setup(struct max9286_priv *priv,
> +					  unsigned int chan_amplitude)
>  {
> +	/* Reverse channel transmission time: default to 1. */
> +	u8 chan_config = MAX9286_REV_TRF(1);
> +
>  	/*
>  	 * Reverse channel setup.
>  	 *
>  	 * - Enable custom reverse channel configuration (through register 0x3f)
>  	 *   and set the first pulse length to 35 clock cycles.
> -	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> -	 *   high threshold enabled by the serializer driver.
> +	 * - Adjust reverse channel amplitude: values > 130 are programmed
> +	 *   using the additional +100mV REV_AMP_X boost flag
>  	 */
>  	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> -	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> -		      MAX9286_REV_AMP_X);
> +

Should we also clamp to min/max values at all?
Probably not needed, as it's only an internal helper.


> +	if (chan_amplitude > 100) {
> +		/* It is not possible express values (100 < x < 130) */

'possible to express'

> +		chan_amplitude = chan_amplitude < 130
> +			       ? 30 : chan_amplitude - 100;

We could round < 115 to 100, and >= 115 to 130, but that's probably more
effort that it's worth, so I think this is fine.

I think it's really helpful to codify this parameter though:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +		chan_config |= MAX9286_REV_AMP_X;
> +	}
> +	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
>  	usleep_range(2000, 2500);
>  }
>  
> @@ -957,7 +967,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -	max9286_reverse_channel_setup(priv);
> +	max9286_reverse_channel_setup(priv, 170);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link
> 

