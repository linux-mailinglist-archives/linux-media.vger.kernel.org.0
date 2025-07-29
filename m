Return-Path: <linux-media+bounces-38613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDCB14900
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 09:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E642D189A0A4
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF186260588;
	Tue, 29 Jul 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GB7o58lC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179DA263F4E
	for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753773382; cv=none; b=W7pCn7TMT8W3XtST37VrVJTRxlEEcNDjk+SUOs1Go35WTCb7j+oe69fFAyHaTtW2LdVDg3bxtlCWOGOrmDMZIDoRShukQWkXzgOKVrriv7iCf6lLy9gFvGy5qDHeHsQ9I0zD0MHqTKCajCozi1UNgXUpY4X5JsqcFUVak8EsxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753773382; c=relaxed/simple;
	bh=ouxWcyAB3vsEctfk984PCtbm105fHIqlt3FrgpVx99s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4jVytLN4Y+YNuoVwSdY3B85c5vQph5EkbSUJ55EZDPNt5sRZ3m00c1LmDL1KbNREYeK6hx7z491LN1EUUPycmcfNLoMmlKCzrSNmr+aV7xgw5M8UPtZNvjW8ksubna1LvLPDxF510onhnFreHR4Ov3SB9Um3QLimOG0VNlqNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GB7o58lC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2515A3A4;
	Tue, 29 Jul 2025 09:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753773331;
	bh=ouxWcyAB3vsEctfk984PCtbm105fHIqlt3FrgpVx99s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GB7o58lC0+TTBwPpk56tp9z8C8eXYuUHKc4nMjtBAEKqWP8auynZRIx+FtY72LoWn
	 q504qsoBr3aOcYNCjvNvIvGOKpmy/OOLU5yN7PDAHvlSQ3j+0Tfjnb/TtLZw2NmYGR
	 MD64/uZbW9XxoLXT6hao8R+Is9WmZz+lZNFS8IUc=
Date: Tue, 29 Jul 2025 09:16:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2 2/3] media: staging/ipu7: Disallow source multiplexing
Message-ID: <tqwniavoehnopc7insbkb2r6gyvsh2fgh4hcvqiaa3lk3hqfau@mi6v67owfohq>
References: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
 <20250728235010.2926-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250728235010.2926-3-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Tue, Jul 29, 2025 at 02:50:09AM +0300, Laurent Pinchart wrote:
> The IPU7 ISYS driver can't capture multiple streams on the same video
> device. Disallow source multiplexing in the routes of the internal
> subdev to reflect that limitation. As a result we can hardcode the
> source stream to 0, simplifying the driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-queue.c  |  3 +-
>  drivers/staging/media/ipu7/ipu7-isys-subdev.c | 35 ++++++-------------
>  drivers/staging/media/ipu7/ipu7-isys-subdev.h |  1 -
>  drivers/staging/media/ipu7/ipu7-isys-video.c  | 35 ++-----------------
>  4 files changed, 14 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-queue.c b/drivers/staging/media/ipu7/ipu7-isys-queue.c
> index 7046c29141f8..434d9d9c7158 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-queue.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-queue.c
> @@ -442,14 +442,13 @@ static int ipu7_isys_link_fmt_validate(struct ipu7_isys_queue *aq)
>  		media_pad_remote_pad_first(av->vdev.entity.pads);
>  	struct v4l2_mbus_framefmt format;
>  	struct v4l2_subdev *sd;
> -	u32 r_stream, code;
> +	u32 r_stream = 0, code;
>  	int ret;
>
>  	if (!remote_pad)
>  		return -ENOTCONN;
>
>  	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> -	r_stream = ipu7_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
>
>  	ret = ipu7_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
>  					   &format);
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
> index 98b6ef6a2f21..67a776033d5b 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
> @@ -194,13 +194,22 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.field = V4L2_FIELD_NONE,
>  	};
> +	struct v4l2_subdev_route *route;
>  	int ret;
>
>  	ret = v4l2_subdev_routing_validate(sd, routing,
> -					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>  	if (ret)
>  		return ret;
>
> +	/*
> +	 * The device doesn't support source multiplexing, set all source
> +	 * streams to 0 to simplify stream handling through the driver.
> +	 */
> +	for_each_active_route(routing, route)
> +		route->source_stream = 0;
> +
>  	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &fmt);
>  }
>
> @@ -222,30 +231,6 @@ int ipu7_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
>  	return fmt ? 0 : -EINVAL;
>  }
>
> -u32 ipu7_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
> -{
> -	struct v4l2_subdev_state *state;
> -	struct v4l2_subdev_route *routes;
> -	u32 source_stream = 0;
> -	unsigned int i;
> -
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	if (!state)
> -		return 0;
> -
> -	routes = state->routing.routes;
> -	for (i = 0; i < state->routing.num_routes; i++) {
> -		if (routes[i].source_pad == pad) {
> -			source_stream = routes[i].source_stream;
> -			break;
> -		}
> -	}
> -
> -	v4l2_subdev_unlock_state(state);
> -
> -	return source_stream;
> -}
> -
>  static int ipu7_isys_subdev_init_state(struct v4l2_subdev *sd,
>  				       struct v4l2_subdev_state *state)
>  {
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.h b/drivers/staging/media/ipu7/ipu7-isys-subdev.h
> index 1057ec39ae39..faa50031cf24 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-subdev.h
> +++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.h
> @@ -37,7 +37,6 @@ int ipu7_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_mbus_code_enum
>  				    *code);
> -u32 ipu7_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
>  int ipu7_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
>  				 struct v4l2_mbus_framefmt *format);
>  int ipu7_isys_subdev_set_routing(struct v4l2_subdev *sd,
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
> index 8756da3a8fb0..3d52634683d6 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-video.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
> @@ -291,7 +291,7 @@ static int link_validate(struct media_link *link)
>  	struct v4l2_mbus_framefmt *s_fmt;
>  	struct v4l2_subdev *s_sd;
>  	struct media_pad *s_pad;
> -	u32 s_stream, code;
> +	u32 s_stream = 0, code;
>  	int ret = -EPIPE;
>
>  	if (!link->source->entity)
> @@ -307,7 +307,6 @@ static int link_validate(struct media_link *link)
>  		link->sink->entity->name);
>
>  	s_pad = media_pad_remote_pad_first(&av->pad);
> -	s_stream = ipu7_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
>
>  	v4l2_subdev_lock_state(s_state);
>
> @@ -370,10 +369,9 @@ static int ipu7_isys_fw_pin_cfg(struct ipu7_isys_video *av,
>  	struct device *dev = &isys->adev->auxdev.dev;
>  	struct v4l2_mbus_framefmt fmt;
>  	int output_pins;
> -	u32 src_stream;
> +	u32 src_stream = 0;

very minor nit: this can now be moved up

>  	int ret;
>
> -	src_stream = ipu7_isys_get_src_stream_by_src_pad(sd, src_pad->index);
>  	ret = ipu7_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
>  					   &fmt);
>  	if (ret < 0) {
> @@ -781,32 +779,6 @@ ipu7_isys_query_stream_by_source(struct ipu7_isys *isys, int source, u8 vc)
>  	return stream;
>  }
>
> -static u32 get_remote_pad_stream(struct media_pad *r_pad)
> -{
> -	struct v4l2_subdev_state *state;
> -	struct v4l2_subdev *sd;
> -	u32 stream_id = 0;
> -	unsigned int i;
> -
> -	sd = media_entity_to_v4l2_subdev(r_pad->entity);
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	if (!state)
> -		return 0;
> -
> -	for (i = 0; i < state->stream_configs.num_configs; i++) {
> -		struct v4l2_subdev_stream_config *cfg =
> -			&state->stream_configs.configs[i];
> -		if (cfg->pad == r_pad->index) {
> -			stream_id = cfg->stream;
> -			break;
> -		}
> -	}
> -
> -	v4l2_subdev_unlock_state(state);
> -
> -	return stream_id;
> -}
> -
>  int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
>  				  struct ipu7_isys_buffer_list *bl)
>  {
> @@ -814,7 +786,7 @@ int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
>  	struct device *dev = &av->isys->adev->auxdev.dev;
>  	struct media_pad *r_pad;
>  	struct v4l2_subdev *sd;
> -	u32 r_stream;
> +	u32 r_stream = 0;
>  	int ret = 0;
>
>  	dev_dbg(dev, "set stream: %d\n", state);
> @@ -824,7 +796,6 @@ int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
>
>  	sd = &stream->asd->sd;
>  	r_pad = media_pad_remote_pad_first(&av->pad);
> -	r_stream = get_remote_pad_stream(r_pad);
>  	if (!state) {
>  		stop_streaming_firmware(av);
>

Here and in the other occurencies where s_stream/r_stream gets
hardcoded to 0, I wonder if using 0 directly instead of going through
a variable would make things easier to follow.

Either way:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j
> --
> Regards,
>
> Laurent Pinchart
>

