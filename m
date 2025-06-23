Return-Path: <linux-media+bounces-35586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F8AE3848
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7728116FB3F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816E62144B4;
	Mon, 23 Jun 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sJP+yHdv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759611A8F60
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666954; cv=none; b=kbWPLud7x54IXvfpC5r0CXx/+14+oROelSog0skSYx2A6LkDjCRkGPuOH7dsGTC0Y/C96uG6kcBaSUxzHvhs891uJiZa/ocm4YXQe1+UufhpQht7USPqgsYqnyx8gTluk/dXB8PADD5Z69JwEaSDH560RP1Xkeqohie0wWNxQZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666954; c=relaxed/simple;
	bh=URRKNCYQ/BAF9oa7X9+o4oFWW8zJsxMOAH1MRNyplSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiStj3Vjrdh6/YmbTAdeGuqfwRBlHybcvl+bhgmGcyeMOlNDwBQj3EyMLo8noGYfNIEF9ojL//sOJLAvHWHp04Pc14ZGXCjddldRTJ1JAaHHB0ugIk7PCyTo1GJSaEcEKaXU2ZkOtBZvRdsCY1fhfmY1vvlJE0I24dQc609eddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sJP+yHdv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B161CD77;
	Mon, 23 Jun 2025 10:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750666934;
	bh=URRKNCYQ/BAF9oa7X9+o4oFWW8zJsxMOAH1MRNyplSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJP+yHdvvAKayO44iX27QDn6hL32BIKOzlWJgMrzP4DYIVKKALicpx8xtPJioHzHo
	 vjAk5RUwiwCH6JLtz0JG8Xu0JXM4NLrZCF8XR8SOVS0cNXKV6YEDBbfjhawqFOUl8I
	 u78ldsqPzeALJsuhyec+Hk70R/yrXRgjznv2AU2U=
Date: Mon, 23 Jun 2025 10:22:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/5] media: v4l2-subdev: Limit the number of active
 routes to V4L2_FRAME_DESC_ENTRY_MAX
Message-ID: <ssyt7zhekhln6i6lf2ulrhomo5f24d54f55dhtusljnp5iqrfe@edwtnuga2po6>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
 <20250619204712.16099-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619204712.16099-2-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jun 19, 2025 at 11:47:08PM +0300, Laurent Pinchart wrote:
> Drivers that implement routing need to report a frame descriptor
> accordingly, with up to one entry per route. The number of frame
> descriptor entries is fixed to V4L2_FRAME_DESC_ENTRY_MAX, currently
> equal to 8. Multiple drivers therefore limit the number of routes to
> V4L2_FRAME_DESC_ENTRY_MAX, with a note indicating that the limit should
> be lifted when frame descriptor entries will be allocated dynamically.
>
> Duplicating the check in multiple drivers isn't ideal. Move it to the
> VIDIOC_SUBDEV_S_ROUTING handling code in the v4l2-subdev core.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e99647200e49..013ebb14b37b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -985,6 +985,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_route *routes =
>  			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
>  		struct v4l2_subdev_krouting krouting = {};
> +		unsigned int num_active_routes = 0;
>  		unsigned int i;
>
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> @@ -1019,8 +1020,21 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  			if (!(pads[route->source_pad].flags &
>  			      MEDIA_PAD_FL_SOURCE))
>  				return -EINVAL;
> +
> +			if (route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)
> +				num_active_routes++;

There also is the possibility to return here if num_active_routes >
V4L2_FRAME_DESC_ENTRY_MAX. If instead, like you're doing here, we
continue validating all route entries, if any further route is
malformed we will return -EINVAL and -E2BIG. I can't tell what error
should be prioritized, and this seems a corner-case anyway, so:

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>  		}
>
> +		/*
> +		 * Drivers that implement routing need to report a frame
> +		 * descriptor accordingly, with up to one entry per route. Until
> +		 * the frame descriptors entries get allocated dynamically,
> +		 * limit the number of active routes to
> +		 * V4L2_FRAME_DESC_ENTRY_MAX.
> +		 */
> +		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +			return -E2BIG;
> +
>  		/*
>  		 * If the driver doesn't support setting routing, just return
>  		 * the routing table.
> --
> Regards,
>
> Laurent Pinchart
>
>

