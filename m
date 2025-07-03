Return-Path: <linux-media+bounces-36738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECCAF83D4
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47BB77BBFB6
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAED289E0B;
	Thu,  3 Jul 2025 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dyZbKajb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED838233D9C;
	Thu,  3 Jul 2025 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582744; cv=none; b=u4u26PDmHNqua6IMALs1RMKzFXxC7wDXF//dTX8VOjYELr/PzdF0oq9vGXwvVV7kFt7CxuJiMlAQCt2xDN9598dEAJVIskWuC+aQsA+BR6PAEYjYdgZs9r4jiSPwFifdZ0gmUi1d3FQMLlnHXTCkfPEr7jy7ZHJww0LqM0DmQ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582744; c=relaxed/simple;
	bh=g+Om81DZsX6qN6nBopHPbw5XG3KQObSt89jyESsaSrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZR7l4lk09ol18p+Ol1ce+l0eWoAzO51PZCo2SE/WZa876y7o9FA1vwyz+2QzGD7jIEa+SdfnhMaPjV4W4fjg/YWTUgap5AhBWjOBfEuBgLejGs3cTVP/Be42vtOKZFguOuBu86MOVgf4r0hZWxYyhncscxaoA9ML/Iti/IORao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dyZbKajb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3B82C667;
	Fri,  4 Jul 2025 00:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582717;
	bh=g+Om81DZsX6qN6nBopHPbw5XG3KQObSt89jyESsaSrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyZbKajbFuA+pMoXF6/juPGpfyYkqeFO4dwo6O3fdct62CJ5ndPQDQMwpD6gr1C0O
	 0qQJpTdopqWZYGuiY3htHjgqfyR+X1SxrzF7n/kPOc1hmzrPfgIy62+cCjKL5gDrXP
	 SWMuge7Fvplpi/Ge8PEUu4FIHKrTJqMVnbJb0Pek=
Date: Fri, 4 Jul 2025 01:45:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/11] media: adv7180: Move state mutex handling outside
 init_device()
Message-ID: <20250703224514.GE3798@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703205223.2810806-4-niklas.soderlund+renesas@ragnatech.se>

On Thu, Jul 03, 2025 at 10:52:15PM +0200, Niklas Söderlund wrote:
> Future rework to get rid of .s_power requires the state mutex to be
> held for multiple operations where initializing the device is one of
> them.
> 
> Move lock handling outside init_device() but enforce the lock is held
> with a lockdep_assert_held().
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv7180.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 0c5511a7667d..bef708916190 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -893,7 +893,7 @@ static int init_device(struct adv7180_state *state)
>  {
>  	int ret;
>  
> -	mutex_lock(&state->mutex);
> +	lockdep_assert_held(&state->mutex);
>  
>  	adv7180_set_power_pin(state, true);
>  	adv7180_set_reset_pin(state, false);
> @@ -903,11 +903,11 @@ static int init_device(struct adv7180_state *state)
>  
>  	ret = state->chip_info->init(state);
>  	if (ret)
> -		goto out_unlock;
> +		return ret;
>  
>  	ret = adv7180_program_std(state);
>  	if (ret)
> -		goto out_unlock;
> +		return ret;
>  
>  	adv7180_set_field_mode(state);
>  
> @@ -918,31 +918,28 @@ static int init_device(struct adv7180_state *state)
>  				    ADV7180_ICONF1_ACTIVE_LOW |
>  				    ADV7180_ICONF1_PSYNC_ONLY);
>  		if (ret < 0)
> -			goto out_unlock;
> +			return ret;
>  
>  		ret = adv7180_write(state, ADV7180_REG_IMR1, 0);
>  		if (ret < 0)
> -			goto out_unlock;
> +			return ret;
>  
>  		ret = adv7180_write(state, ADV7180_REG_IMR2, 0);
>  		if (ret < 0)
> -			goto out_unlock;
> +			return ret;
>  
>  		/* enable AD change interrupts */
>  		ret = adv7180_write(state, ADV7180_REG_IMR3,
>  				    ADV7180_IRQ3_AD_CHANGE);
>  		if (ret < 0)
> -			goto out_unlock;
> +			return ret;
>  
>  		ret = adv7180_write(state, ADV7180_REG_IMR4, 0);
>  		if (ret < 0)
> -			goto out_unlock;
> +			return ret;
>  	}
>  
> -out_unlock:
> -	mutex_unlock(&state->mutex);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static int adv7180_s_stream(struct v4l2_subdev *sd, int enable)
> @@ -1493,7 +1490,9 @@ static int adv7180_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_free_ctrl;
>  
> +	mutex_lock(&state->mutex);
>  	ret = init_device(state);
> +	mutex_unlock(&state->mutex);
>  	if (ret)
>  		goto err_media_entity_cleanup;
>  
> @@ -1576,6 +1575,8 @@ static int adv7180_resume(struct device *dev)
>  	struct adv7180_state *state = to_state(sd);
>  	int ret;
>  
> +	guard(mutex)(&state->mutex);
> +



>  	ret = init_device(state);
>  	if (ret < 0)
>  		return ret;

-- 
Regards,

Laurent Pinchart

