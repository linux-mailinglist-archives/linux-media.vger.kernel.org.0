Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4762E1D876F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 20:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbgERSos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 14:44:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgERSos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 14:44:48 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 494E5258;
        Mon, 18 May 2020 20:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589827485;
        bh=2OSQqdkIa3Grof311B8PMTBFkqU9R4KAIbRio4bvUC0=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=rGZkJG7ZOSEzBlVOX+ZdWXusQkXrPjxO9/ws9ba1n+kdZ5ljn7Cldftygxi7aoZIu
         gHMy2k6NscPcKrUBatvgSE9w3yKaxFYAkGwpjg3MIwaubeMcyEdJ/MehD7f08t3IQP
         eB/krimKijVISoNzMtqoxnnoZJzj621vYX1Q2NPc=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] fixes! [max9286]: Validate link formats
To:     Jacopo Mondi <jacopo@jmondi.org>, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <e898b72f-f793-6c0d-27a8-5a34c61f763e@ideasonboard.com>
 <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d09c4eef-ebeb-8577-18ed-233bc7f33786@ideasonboard.com>
Date:   Mon, 18 May 2020 19:44:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran

On 18/05/2020 17:11, Kieran Bingham wrote:
> Disallow setting a format on the source link, but enable link validation
> by returning the format of the first bound source when getting the
> format of the source pad.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index ef824d2b26b8..6c01595936d7 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -711,7 +711,10 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
>  
> -	if (format->pad >= MAX9286_SRC_PAD)
> +	/* \todo: Multiplexed streams support
> +	 * Prevent setting the format on the shared multiplexed bus.
> +	 */
> +	if (format->pad == MAX9286_SRC_PAD)
>  		return -EINVAL;
>  
>  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
> @@ -743,11 +746,17 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
> +	unsigned int pad = format->pad;
>  
> -	if (format->pad >= MAX9286_SRC_PAD)
> -		return -EINVAL;
> +	/* \todo: Multiplexed Stream Support
> +	 * Support link validation by returning the format of the first bound
> +	 * link. All links must have the same format, as we do not support
> +	 * mixing, and matching of cameras connected to the max9286.
> +	 */
> +	if (format->pad == MAX9286_SRC_PAD)
> +		pad = ffs(priv->bound_sources);

of course this would have to be (ffs(priv->bound_sources) - 1) as the
first pad index is 0 ;-)

>  
> -	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
> +	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
>  	if (!cfg_fmt)
>  		return -EINVAL;
>  
> 

