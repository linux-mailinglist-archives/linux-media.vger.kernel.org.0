Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647FA4888F0
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 12:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbiAILnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 06:43:04 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48485 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233810AbiAILnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 06:43:04 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2DFBF240003;
        Sun,  9 Jan 2022 11:43:00 +0000 (UTC)
Date:   Sun, 9 Jan 2022 12:44:01 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 12/11] media: i2c: max9286: Print power-up GMSL link
 configuration
Message-ID: <20220109114401.bjrdkys3ojcfpiy3@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101232637.32104-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101232637.32104-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sun, Jan 02, 2022 at 01:26:37AM +0200, Laurent Pinchart wrote:
> The power-up GMSL link configuration is controlled by the HIM and BWS
> pins, whose state is reflected in register 0x1c. Print the detected
> power-up config in a debug message to help debugging.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/max9286.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 446fc238d642..f7cbfdde436e 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1147,6 +1147,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
>  		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
>  	};
> +	int cfg;
>
>  	/*
>  	 * Set the I2C bus speed.
> @@ -1168,21 +1169,23 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_set_video_format(priv, &max9286_default_format);
>  	max9286_set_fsync_period(priv);
>
> +	cfg = max9286_read(priv, 0x1c);
> +	if (cfg < 0)
> +		return cfg;
> +
> +	dev_dbg(&priv->client->dev, "power-up config: %s immunity, %u-bit bus\n",
> +		cfg & MAX9286_HIGHIMM(0) ? "high" : "legacy",
> +		cfg & MAX9286_BWS ? 32 : cfg & MAX9286_HIBW ? 27 : 24);
> +
>  	if (priv->bus_width) {
> -		int val;
> -
> -		val = max9286_read(priv, 0x1c);
> -		if (val < 0)
> -			return val;
> -
> -		val &= ~(MAX9286_HIBW | MAX9286_BWS);
> +		cfg &= ~(MAX9286_HIBW | MAX9286_BWS);
>
>  		if (priv->bus_width == 27)
> -			val |= MAX9286_HIBW;
> +			cfg |= MAX9286_HIBW;
>  		else if (priv->bus_width == 32)
> -			val |= MAX9286_BWS;
> +			cfg |= MAX9286_BWS;
>
> -		max9286_write(priv, 0x1c, val);
> +		max9286_write(priv, 0x1c, cfg);
>  	}
>
>  	/*
> --
> Regards,
>
> Laurent Pinchart
>
