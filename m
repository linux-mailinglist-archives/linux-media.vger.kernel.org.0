Return-Path: <linux-media+bounces-17304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8C967C52
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 23:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDC7D1C21191
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19025139D13;
	Sun,  1 Sep 2024 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G3oB69bx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C056B7C
	for <linux-media@vger.kernel.org>; Sun,  1 Sep 2024 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725226145; cv=none; b=riLjOuOh4369tpyCt0g3uNInxzRzdUI72HLG8lMcOkRSrXqAwfQ5aJZ3rnLOoHCPqeCmN1MfdZk4eyrcUMvTaT67S2sEeTxGIbgyVcttduCA+USFT9i4VJUhQOK9mzj6RUCKmLCe+XW12dLe4M/pWQEUv1TpwJmnl3EQ0p4MV+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725226145; c=relaxed/simple;
	bh=+J/HzYQiwDyoHYde/VbbIU/MrDW0n9Mqxtw4dWHtmD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdE7q9ektVFe0ju4u4cfePLKbTwPyAIFmNW4qsnwY8KtuPUEqPNoFEbBPem/E5+ffjS5G5ulxpe9OWwkJX9hh4b2WzTP0WD80QZvbUP7fEGrylq+0RaPEWeBk/7NavbDnc50+28gZNGpPOhOhuSlMW9VImMqKrjTiYIdnqp91DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G3oB69bx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4C544CF;
	Sun,  1 Sep 2024 23:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725226070;
	bh=+J/HzYQiwDyoHYde/VbbIU/MrDW0n9Mqxtw4dWHtmD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3oB69bxpNj6AY9ndIhABWGzK51GlIUur6ioXwD9+f56KWgDg3IljLXxoD/1I5mp3
	 PSPxD2l7a29oyW6EkR/D2lcRzOD2BrY6nmzXSIYJqA32J7FkzebF8z7I86zk/XlRA9
	 TrxIcLMUzqWUuVx+R54tb8AuNmiHcL59AUuBdVsM=
Date: Mon, 2 Sep 2024 00:28:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: v4l: Call s_stream() on VCM when it is called
 on the associated sensor
Message-ID: <20240901212829.GA25983@pendragon.ideasonboard.com>
References: <20240901211834.145186-1-hdegoede@redhat.com>
 <20240901211834.145186-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240901211834.145186-2-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, Sep 01, 2024 at 11:18:33PM +0200, Hans de Goede wrote:
> Currently VCM drivers power-up the VCM as soon as the VCM's /dev node
> is opened and through the runtime-pm device-link to the sensor this
> also powers up the sensor.
> 
> Powering up the VCM and sensor when the /dev node is opened is undesirable,
> without a VCM sensors delay powering up until s_stream(1) is called. This
> allows querying / negotiating capabilities without powering things up.
> 
> Sometimes a long running daemon like pipewire may keep the /dev node open
> all the time. The kernel should still be able to powerdown the VCM + sensor
> in this scenario.
> 
> VCM drivers should be able to do the same as sensor drivers and only
> power-up the VCM when s_stream(1) is called on the VCM subdev, but this
> requires that s_stream() is actually called on the VCM when the sensor
> starts / stops streaming.

.s_stream() doesn't conceptually make sense for VCMs. Furthermore,
.s_stream() is being replaced with .enable_streams() and
.disable_streams(), which will make even less sense. We need a different
API.

> The s_stream() call on sensor subdevs is done by CSI-receiver/ISP drivers.
> To avoid needing to change all these call sites to also call s_stream()
> on the VCM (if there is one) handle the VCM in the v4l2-core similar to how
> the core takes care of turning on/off the privacy LED.

This needs to come with a design rationale, documented in
Documentation/. The design needs to explain the use cases. Lens motion
may take time, which I expect will influence how we will need to handle
power management.

I'm not very comfortable handling this in v4l2-subdev.c, it seems that
we'll hardcode use cases. Without a clear and detailed designed
rationale, this patch feels we'll paint ourselves in a corner. We have
enough badly designed (or not designed at all) APIs for cameras, it's
time to do better.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c  | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++------
>  include/media/v4l2-subdev.h           |  2 ++
>  3 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index ee884a8221fb..9b854f1d1051 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -330,6 +330,11 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  		return 0;
>  	}
>  
> +	if (sd->entity.function == MEDIA_ENT_F_LENS) {
> +		dev_dbg(n->sd->dev, "Using %s VCM\n", dev_name(sd->dev));
> +		n->sd->vcm = sd;
> +	}
> +
>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>  
>  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> @@ -871,6 +876,21 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	if (!sd->async_list.next)
>  		return;
>  
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (sd->entity.function == MEDIA_ENT_F_LENS && sd->v4l2_dev && sd->v4l2_dev->mdev) {
> +		struct media_entity *entity;
> +
> +		media_device_for_each_entity(entity, sd->v4l2_dev->mdev) {
> +			struct v4l2_subdev *it = media_entity_to_v4l2_subdev(entity);
> +
> +			if (it->vcm == sd) {
> +				dev_dbg(it->dev, "Clearing VCM\n");
> +				it->vcm = NULL;
> +			}
> +		}
> +	}
> +#endif
> +
>  	v4l2_subdev_put_privacy_led(sd);
>  
>  	mutex_lock(&list_lock);
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7c5812d55315..24a68d90f686 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -148,17 +148,33 @@ static int subdev_close(struct file *file)
>  }
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
> -static void v4l2_subdev_enable_privacy_led(struct v4l2_subdev *sd)
> +static void v4l2_subdev_enable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>  {
>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>  		led_set_brightness(sd->privacy_led,
>  				   sd->privacy_led->max_brightness);
>  #endif
> +
> +	if (sd->vcm && !sd->vcm_enabled &&
> +	    v4l2_subdev_has_op(sd->vcm, video, s_stream)) {
> +		int ret;
> +
> +		ret = v4l2_subdev_call(sd->vcm, video, s_stream, 1);
> +		if (ret)
> +			dev_err(sd->vcm->dev, "Error powering on VCM: %d\n", ret);
> +		else
> +			sd->vcm_enabled = true;
> +	}
>  }
>  
> -static void v4l2_subdev_disable_privacy_led(struct v4l2_subdev *sd)
> +static void v4l2_subdev_disable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>  {
> +	if (sd->vcm && sd->vcm_enabled) {
> +		v4l2_subdev_call(sd->vcm, video, s_stream, 0);
> +		sd->vcm_enabled = false;
> +	}
> +
>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>  		led_set_brightness(sd->privacy_led, 0);
> @@ -466,9 +482,9 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  		sd->s_stream_enabled = enable;
>  
>  		if (enable)
> -			v4l2_subdev_enable_privacy_led(sd);
> +			v4l2_subdev_enable_privacy_led_and_vcm(sd);
>  		else
> -			v4l2_subdev_disable_privacy_led(sd);
> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>  	}
>  
>  	return ret;
> @@ -2289,7 +2305,7 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  	 * for all cases.
>  	 */
>  	if (!use_s_stream && !already_streaming)
> -		v4l2_subdev_enable_privacy_led(sd);
> +		v4l2_subdev_enable_privacy_led_and_vcm(sd);
>  
>  done:
>  	if (!use_s_stream)
> @@ -2382,7 +2398,7 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  done:
>  	if (!use_s_stream) {
>  		if (!v4l2_subdev_is_streaming(sd))
> -			v4l2_subdev_disable_privacy_led(sd);
> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>  
>  		v4l2_subdev_unlock_state(state);
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index bd235d325ff9..6568a0cc070b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1094,6 +1094,7 @@ struct v4l2_subdev {
>  	 */
>  
>  	struct led_classdev *privacy_led;
> +	struct v4l2_subdev *vcm;
>  
>  	/*
>  	 * TODO: active_state should most likely be changed from a pointer to an
> @@ -1104,6 +1105,7 @@ struct v4l2_subdev {
>  	struct v4l2_subdev_state *active_state;
>  	u64 enabled_pads;
>  	bool s_stream_enabled;
> +	bool vcm_enabled;
>  };
>  
>  

-- 
Regards,

Laurent Pinchart

