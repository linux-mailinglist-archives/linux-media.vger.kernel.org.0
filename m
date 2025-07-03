Return-Path: <linux-media+bounces-36739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BCEAF83E0
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ACBA4E310C
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABF12D46C3;
	Thu,  3 Jul 2025 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t2cYCtHT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609572D322C;
	Thu,  3 Jul 2025 22:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582822; cv=none; b=Z2U9IXEHiteRyzuEaPX0MOPnkxAtcU01dIbH2XwSB/aUQa4ydvtuHEuIKrfX7JKMhOQbZKXYlyKYJytkGQYqbmALx7uE3yiNznftOgFATdr3AVJpLBPh7wjkPI59Yu+n2rEXeZOqsEHXuyp0PrcKVYEmyQFPblPwTVNXfFzk7Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582822; c=relaxed/simple;
	bh=URkmC9yBl06yNYB939SYZaOiq0JE3nYVZyK6hyTebxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWdD/mVVz07xhMccvTKBiBBjcOS2uOsCj+r4mpQoBHmIbEroiN6Y91mDutiM/WojfV990nx1/x8SyN9mF44rZwa3z2xkHG/1HuZOOauoXRMsWUxR+XWldOu2Dr4tTZ91nFxSXDjiOLsEkAGBHuAurOBZnJfE4/YgRsqbky0xAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t2cYCtHT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BE794667;
	Fri,  4 Jul 2025 00:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582796;
	bh=URkmC9yBl06yNYB939SYZaOiq0JE3nYVZyK6hyTebxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2cYCtHTPRnlgC0h92QTV8s3c+HbcNFuieSr7H6Eu+wTPf6FdWGULmMwu30ei9PVe
	 EoCB4mwJd+NElvgnP+PPnso8BFNf30IBaEGolJNw6ZOOGoa9189XVJrmDPwrpzKnHj
	 LZGoxISXUOnKbKU3+YuQHWXFGnXqMM+E2wgilKio=
Date: Fri, 4 Jul 2025 01:46:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] media: adv7180: Use v4l2-ctrls core to handle
 s_ctrl locking
Message-ID: <20250703224632.GF3798@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703205223.2810806-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

On Thu, Jul 03, 2025 at 10:52:16PM +0200, Niklas Söderlund wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv7180.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index bef708916190..c2a79eba4dcd 100644
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
>  
>  	v4l2_ctrl_new_std(&state->ctrl_hdl, &adv7180_ctrl_ops,
>  			  V4L2_CID_BRIGHTNESS, ADV7180_BRI_MIN,

-- 
Regards,

Laurent Pinchart

