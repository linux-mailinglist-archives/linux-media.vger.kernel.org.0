Return-Path: <linux-media+bounces-41640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F7AB4186C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 742441BA3E5A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCA02EBDC2;
	Wed,  3 Sep 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO3cAMsm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC672EBB85;
	Wed,  3 Sep 2025 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888102; cv=none; b=HS6oOm1elVLWibmXKxdtfYzN4o6oMekPWvJGC3OEkTL8AcS9T1EU9OIFWjeFC3w8z1PTtIwPePLzQwjc4Y2kIB53bN3DjOZnfKqgOnUYOb8XPzzQZH199qNDLAHVi3dby8vD39m4IMKJRD068A05spQsV4L+WpmMMw8lMv+fK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888102; c=relaxed/simple;
	bh=u2jvfYRjrs+l2SSb7f6L40bEVftbU1269KUdxeWUUIU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nf5WExMNXB9nKZAd3MJFHTTg2Mk2Rmo++mds359HlyMhPUrhz4SAAQ8vw5Nf2p7R4U0K6v/jaH5UA7lmyNpVv10b38Nwm9gYxezlmJPZYyfoFYk+JHBxexdhieSqnYugEfMFTZIcv90wXO2QJk5jKQUq9wSCgjogP3U92K/MOSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO3cAMsm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2C3C4CEF0;
	Wed,  3 Sep 2025 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756888102;
	bh=u2jvfYRjrs+l2SSb7f6L40bEVftbU1269KUdxeWUUIU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HO3cAMsmF/CqJhWmJBm8x0orSUK6SDZeyb93VtenCrcFmPmLrpqYB3pMu9IhpuuCa
	 3Xwhas1R3IL7Nq+K6ZQ/+DItsZZlcZqVMLqcKblA6AFChK0kgQ/p4BU7lJ8U9+tfl1
	 S46ScQZalG0dmZQb+GH6YhBvilH7RM0zPJy3pQp3BZWgB8BQjP6kYfXXkC+gR6Zh30
	 0REbFOYgJ/1oFOpYwncSUuBb9rofQmkld2SJTVNa+oruFTxmC77R9Mnr6wukh5Kv2+
	 algRw6cx1asYT40vX04Ti8M5WT/F4ePXbCDMFnHkQ9l8sZvZVJ0uplhfpZWtlH/M+P
	 lPpTZlCefQsiw==
Message-ID: <797bd6af-2246-4fdf-ab46-e39ad6b69cbe@kernel.org>
Date: Wed, 3 Sep 2025 10:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 04/11] media: adv7180: Use v4l2-ctrls core to handle
 s_ctrl locking
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Lars-Peter Clausen
 <lars@metafoo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
 <20250828160654.1467762-5-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US, nl
In-Reply-To: <20250828160654.1467762-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2025 18:06, Niklas Söderlund wrote:
> Instead of handling the state lock ourself in .s_ctrl use the v4l2-ctrls
> core to handle it for us. This will allow us later to use the unlocked
> __v4l2_ctrl_handler_setup() in initialization code where the state lock
> is already held.
> 
> Add a lockdep assert to demonstrate the mutex must be held when setting
> controls.
> 
> There is no functional change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7180.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 9dbd33c4a30c..7b0387151c3a 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -601,11 +601,11 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = to_adv7180_sd(ctrl);
>  	struct adv7180_state *state = to_state(sd);
> -	int ret = mutex_lock_interruptible(&state->mutex);
> +	int ret = 0;
>  	int val;
>  
> -	if (ret)
> -		return ret;
> +	lockdep_assert_held(&state->mutex);
> +
>  	val = ctrl->val;
>  	switch (ctrl->id) {
>  	case V4L2_CID_BRIGHTNESS:
> @@ -647,7 +647,6 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = -EINVAL;
>  	}
>  
> -	mutex_unlock(&state->mutex);
>  	return ret;
>  }
>  
> @@ -668,6 +667,7 @@ static const struct v4l2_ctrl_config adv7180_ctrl_fast_switch = {
>  static int adv7180_init_controls(struct adv7180_state *state)
>  {
>  	v4l2_ctrl_handler_init(&state->ctrl_hdl, 4);
> +	state->ctrl_hdl.lock = &state->mutex;

While perfectly legal, I would really like to avoid drivers messing with internal
fields of the v4l2_ctrl_handler structure. I wondered why I hadn't noticed this
construct before, and it is primarily used in sensor drivers, which I typically
don't review.

What I would prefer to see is a new function: v4l2_ctrl_handler_init_with_mutex()
where the mutex pointer is passed as an extra argument.

And a static inline for the old function like this:

static inline int v4l2_ctrl_handler_init(struct v4l2_ctrl_handler *hdl,
					 unsigned nr_of_controls_hint)
{
	mutex_init(&hdl->_lock);
	return v4l2_ctrl_handler_init_with_mutex(hdl, nr_of_controls_hint, &hdl->_lock);
}

(it's actually a bit more work due to LOCKDEP class handling)

If a driver uses v4l2_ctrl_handler_init_with_mutex then hdl->_lock is never inited
(and will typically be all zeroes), so any use of that lock will cause errors.

v4l2_ctrl_handler_init_with_mutex() could actually check if the mutex is != _lock
and zero _lock explicitly, clearly marking it as unused.

If you prefer to do this as a follow-up series (also updating existing drivers
that use this), then that would be fine.

Regards,

	Hans

>  
>  	v4l2_ctrl_new_std(&state->ctrl_hdl, &adv7180_ctrl_ops,
>  			  V4L2_CID_BRIGHTNESS, ADV7180_BRI_MIN,


