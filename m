Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D32328F9C3
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 21:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391974AbgJOTx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 15:53:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39802 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgJOTx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 15:53:29 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CA38556;
        Thu, 15 Oct 2020 21:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602791607;
        bh=DqRsKiWh2iDMzk9UG8EphvgTX7sjvvxEvN1tldd5LC8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=If14qJUMxgcEN6nS/NBy16ZTJdLZ9EjHW6D7Y1qlqmxqHtJ3h5BHXmnnLX6jUw3TQ
         ztVzwyEEfNV37pu+02K5EnlxpWZG6jUzlR8laPM3dvVjU1VuKi54dZmVKEsI22sU12
         Kx9pY9XUjAJtCnN6Z+WM3Hn52pU6hfhLRagNBfsY=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 3/7] media: i2c: max9286: Break-out reverse channel
 setup
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
 <20201015182710.54795-4-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c11390aa-c3af-8cad-141e-2cee7909ae97@ideasonboard.com>
Date:   Thu, 15 Oct 2020 20:53:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015182710.54795-4-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/10/2020 19:27, Jacopo Mondi wrote:
> Break out the reverse channel setup configuration procedure to its own
> function.
> 
> This change prepares for configuring the reverse channel conditionally
> to the remote side high threshold configuration.
> 
> No functional changes intended.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d969ac21a058..89a7248f5c25 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -906,6 +906,22 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
>   * Probe/Remove
>   */
>  
> +static void max9286_reverse_channel_setup(struct max9286_priv *priv)
> +{
> +	/*
> +	 * Reverse channel setup.
> +	 *
> +	 * - Enable custom reverse channel configuration (through register 0x3f)
> +	 *   and set the first pulse length to 35 clock cycles.
> +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> +	 *   high threshold enabled by the serializer driver.
> +	 */
> +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> +		      MAX9286_REV_AMP_X);
> +	usleep_range(2000, 2500);
> +}

This gets moved later on in the same series. It's probably better to put
it in the right place now.

With that,

Reviewed-by: Kieran Bingham <kieran.bingham+renesasa@ideasonboard.com>

> +
>  static int max9286_setup(struct max9286_priv *priv)
>  {
>  	/*
> @@ -941,19 +957,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -
> -	/*
> -	 * Reverse channel setup.
> -	 *
> -	 * - Enable custom reverse channel configuration (through register 0x3f)
> -	 *   and set the first pulse length to 35 clock cycles.
> -	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> -	 *   high threshold enabled by the serializer driver.
> -	 */
> -	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> -	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> -		      MAX9286_REV_AMP_X);
> -	usleep_range(2000, 2500);
> +	max9286_reverse_channel_setup(priv);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link
> 

