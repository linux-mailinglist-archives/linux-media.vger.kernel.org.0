Return-Path: <linux-media+bounces-1188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C517FB4EC
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 09:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8659E1C21021
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 08:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F258430CE2;
	Tue, 28 Nov 2023 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE4010A32
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 08:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD0AC433C8;
	Tue, 28 Nov 2023 08:55:09 +0000 (UTC)
Message-ID: <a3bfe0e7-45de-41ce-b720-078f69cdcd69@xs4all.nl>
Date: Tue, 28 Nov 2023 09:55:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] media: v4l2-subdev: Rename .init_cfg() operation
 to .init_state()
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Lars-Peter Clausen <lars@metafoo.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Ricardo Ribalda <ribalda@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jacopo Mondi <jacopo@jmondi.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Nicholas Roth <nicholas@rothemail.net>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Tim Harvey <tharvey@gateworks.com>, Maxime Ripard <mripard@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>, Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Benoit Parrot <bparrot@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20231127090744.30012-1-laurent.pinchart@ideasonboard.com>
 <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 27/11/2023 10:07, Laurent Pinchart wrote:
> The subdev .init_cfg() operation is affected by two issues:
> 
> - It has long been extended to initialize a whole v4l2_subdev_state
>   instead of just a v4l2_subdev_pad_config, but its name has stuck
>   around.
> 
> - Despite operating on a whole subdev state and not being directly
>   exposed to the subdev users (either in-kernel or through the userspace
>   API), .init_cfg() is categorized as a subdev pad operation.
> 
> This participates in making the subdev API confusing for new developers.
> Fix it by renaming the operation to .init_state(), and make it a subdev
> internal operation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Michael Riesch <michael.riesch@wolfvision.net> # for imx415
> Acked-by: Shuah Khan <skhan@linuxfoundation.org> # for vimc
> ---
> Changes since v3:
> 
> - Rebase on top of the new stm32-dcmipp driver
> - Fix uninitialized variable in __v4l2_subdev_state_alloc() due to bad
>   rebase
> 
> Changes since v2:
> 
> - Rebase on top of the latest media tree
> 
> Changes since v1:
> 
> - Fix compilation of the vsp1 driver
> ---

<snip>

> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index 0280b8ff7ba9..0a5a7f9cc870 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -170,33 +170,6 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
>  	}
>  }
>  
> -/*
> - * vsp1_entity_init_cfg - Initialize formats on all pads
> - * @subdev: V4L2 subdevice
> - * @sd_state: V4L2 subdev state
> - *
> - * Initialize all pad formats with default values in the given subdev state.
> - * This function can be used as a handler for the subdev pad::init_cfg
> - * operation.
> - */
> -int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
> -			 struct v4l2_subdev_state *sd_state)
> -{
> -	unsigned int pad;
> -
> -	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
> -		struct v4l2_subdev_format format = {
> -			.pad = pad,
> -			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
> -			       : V4L2_SUBDEV_FORMAT_ACTIVE,
> -		};
> -
> -		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
> -	}
> -
> -	return 0;
> -}
> -
>  /*
>   * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
>   * @subdev: V4L2 subdevice
> @@ -424,6 +397,29 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>  
> +static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_state *sd_state)
> +{
> +	unsigned int pad;
> +
> +	/* Initialize all pad formats with default values. */
> +	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
> +		struct v4l2_subdev_format format = {
> +			.pad = pad,
> +			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
> +			       : V4L2_SUBDEV_FORMAT_ACTIVE,
> +		};
> +
> +		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops vsp1_entity_internal_ops = {
> +	.init_state = vsp1_entity_init_state,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Media Operations
>   */
> @@ -658,6 +654,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	/* Initialize the V4L2 subdev. */
>  	subdev = &entity->subdev;
>  	v4l2_subdev_init(subdev, ops);
> +	subdev->internal_ops = &vsp1_entity_internal_ops;
>  
>  	subdev->entity.function = function;
>  	subdev->entity.ops = &vsp1->media_ops;
> @@ -666,7 +663,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
>  		 dev_name(vsp1->dev), name);
>  
> -	vsp1_entity_init_cfg(subdev, NULL);
> +	vsp1_entity_init_state(subdev, NULL);

This is the only media driver that calls init_cfg/state directly.
That's a bit unexpected, and perhaps this could use a comment. That
can be a follow-up patch as well.

>  
>  	/*
>  	 * Allocate the subdev state to store formats and selection

In any case, you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

to this patch.

Regards,

	Hans


