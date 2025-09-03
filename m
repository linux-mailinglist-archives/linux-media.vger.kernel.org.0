Return-Path: <linux-media+bounces-41641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA10B41898
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E06151BA47E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882C12EBDD0;
	Wed,  3 Sep 2025 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkHwxNEB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B832BF016;
	Wed,  3 Sep 2025 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888246; cv=none; b=YKsMUvQVhz78LeuDtT2OISIqzjjvS2pspk9HJ7KXKzFILu+MyHp6Uw5AM+N1KHh/+TJrBekq5hOnhaIqJr2nwqjGqHe+xp7iogPLDiEFlr+q3IR874oaDsN7laaqGJ4qfcT4Tg81OseTrzM67x3HltLAWZVsoLVtKBLXr0mWmSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888246; c=relaxed/simple;
	bh=JnLCWgleF+XfwxH0bSsslWnZ3ZJEuDsQf0CGnQyLAXQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tg6aPkQW0MJK3DHKp1p2mSuXilv9DYuwmrCrIK8JAGXo9HeHy0OMNF3aIHA5d8p4NFxhmGoJStHuOwhULAuGaX36ezuW8gl7zsI1i6lHp7QBas/m0klS2b78hyWQuv4Rkj2Ta8FRpUauO6IuHA4Z2xw+Mv9b22VXQRHvbir0Yx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkHwxNEB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90FBC4CEF0;
	Wed,  3 Sep 2025 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756888245;
	bh=JnLCWgleF+XfwxH0bSsslWnZ3ZJEuDsQf0CGnQyLAXQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=rkHwxNEBdY9nM0qOptEdyfty/qbTlm2SgPMfRThSY6lQLtX2QKzksnfv4W8fhq3YW
	 sltjS2U13K9QkcYxwWiO3oTHyoSXt9kGn8M+wQPkJAPpsuAHu6YaIUxDBwf3yVA5bW
	 6Jh6lviQcbfZh4VzEnOmbXiwhZhBIHwvFtF4nhyKf4Es8Be7p0WhHOjFRScUy0SkF2
	 Jz1RtznBIKqO8Hf3ze61/9zNs88JPOuo4GdbnelMgtRRhRa/PrQ/K6dngsAYA0MHeG
	 BSGs1FlrjcEJAXqVn27/VMfRyQ7i6QxsAKz8/RbB/zdMSaDVmrhnp3F+509uaidKaB
	 6xnJGEjEvFTPg==
Message-ID: <a8ca5ff0-17df-4330-a05b-ab892fdf2e6f@kernel.org>
Date: Wed, 3 Sep 2025 10:30:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 06/11] media: adv7180: Power down decoder when
 configuring the device
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Lars-Peter Clausen
 <lars@metafoo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
 <20250828160654.1467762-7-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US, nl
In-Reply-To: <20250828160654.1467762-7-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2025 18:06, Niklas Söderlund wrote:
> Some variants of the chip (ADV7180) have it's decoder powered up after
> reset, while others (ADV7280, ADV7281, ADV7282, ADV7283) have it powered
> down.
> 
> This is tracked by the feature flag ADV7180_FLAG_RESET_POWERED. At probe
> this flag is used to initialize the state variable powered which keeps
> track of if the decoder is powered on, or off, for the resume callback.
> 
> This however misses that the decoder needs to be powered off for some
> configuration of the device to take hold. So for devices where it's left
> on (ADV7180) the format configuration at probe time have little effect.
> This worked as the .set_fmt callback powers down the decoder, updates
> the format, and powers back on the decoder.
> 
> Before moving all configuration to .s_stream this needs to be fixed.
> Instead of tracking if the decoder is powered on or off, use the
> flag to determine if needs to be powered down after a reset to do the
> configuration.
> 
> To keep the behavior consistent with the currents implementation switch
> the decoder back on for devices where this is the reset behavior. The
> primary reason for this is that if not done the first 35+ frames or so
> of the capture session is garbage.
> 
> To keep the support of starting the decoder when resuming from sleep on
> devices where the reset behavior is to start with the decoder powered
> off, use the state variable streaming. If it is set the decoder was
> powered on when the system suspended so we know to start it again when
> resuming.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/i2c/adv7180.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 8409ee9acc4f..0bc608291df7 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -214,7 +214,6 @@ struct adv7180_state {
>  	struct gpio_desc	*pwdn_gpio;
>  	struct gpio_desc	*rst_gpio;
>  	v4l2_std_id		curr_norm;
> -	bool			powered;
>  	bool			streaming;
>  	u8			input;
>  
> @@ -556,8 +555,6 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
>  		return ret;
>  
>  	ret = adv7180_set_power(state, on);
> -	if (ret == 0)
> -		state->powered = on;
>  
>  	mutex_unlock(&state->mutex);
>  	return ret;
> @@ -887,6 +884,13 @@ static int init_device(struct adv7180_state *state)
>  	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
>  	usleep_range(5000, 10000);
>  
> +	/*
> +	 * If the devices decoder is power on after reset, power off so the
> +	 * device can be configured.
> +	 */
> +	if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
> +		adv7180_set_power(state, false);
> +
>  	ret = state->chip_info->init(state);
>  	if (ret)
>  		return ret;
> @@ -927,6 +931,14 @@ static int init_device(struct adv7180_state *state)
>  			return ret;
>  	}
>  
> +	/*
> +	 * If the devices decoder is power on after reset, restore the power
> +	 * after configuration. This is to preserve the behavior of the driver,
> +	 * not doing this result in the first 35+ frames captured being garbage.
> +	 */
> +	if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
> +		adv7180_set_power(state, true);
> +
>  	return 0;
>  }
>  
> @@ -1457,10 +1469,7 @@ static int adv7180_probe(struct i2c_client *client)
>  	state->irq = client->irq;
>  	mutex_init(&state->mutex);
>  	state->curr_norm = V4L2_STD_NTSC;
> -	if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
> -		state->powered = true;
> -	else
> -		state->powered = false;
> +
>  	state->input = 0;
>  	sd = &state->sd;
>  	v4l2_i2c_subdev_init(sd, client, &adv7180_ops);
> @@ -1568,11 +1577,12 @@ static int adv7180_resume(struct device *dev)
>  	if (ret < 0)
>  		return ret;
>  
> -	guard(mutex)(&state->mutex);
> -
> -	ret = adv7180_set_power(state, state->powered);
> -	if (ret)
> -		return ret;
> +	/* If we where streaming when suspending, start decoder. */

where -> were

> +	if (state->streaming) {
> +		ret = adv7180_set_power(state, true);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }


