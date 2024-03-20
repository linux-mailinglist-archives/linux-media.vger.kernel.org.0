Return-Path: <linux-media+bounces-7362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5988094B
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 02:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0D0CB22B10
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415B77490;
	Wed, 20 Mar 2024 01:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ydez/y+f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8465747F
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 01:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710899766; cv=none; b=Gy2DtAfxkp8i3uPmKOT1c0FC/ly1NAHZJ5Wiz+H6Lz7w54hHhQ6/weod8wKS1XZYlTVQwWu3y4nI+eYRb4JGf8bvM8nE8lNoRzoFRaf75uRrbbi4w+SeArdtTWNSpoMJE29InRaXeUspmyqMKbqPGpyOm/1wjO261hov3CAF1As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710899766; c=relaxed/simple;
	bh=Dll0W8QZFjP5O+OmUH7t06x5+6RnozHmZRBWBCwIsVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmmHDLJolthYmPtewB1kHJ38c2MMJ1zYKQjRUa01vZuc5pohX6cpYQsUmSjpVQHNPKq0Y63zWWuXiQFYhL3Eb2Mn8nxvGnFAYDMjuOR4pCU7hNkG6aTTQ266f+twwuR4OxyLzUEOnoTsBawalSXM0uyEZ+2wQp36BY40d5J+Un8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ydez/y+f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C04619EC;
	Wed, 20 Mar 2024 02:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710899735;
	bh=Dll0W8QZFjP5O+OmUH7t06x5+6RnozHmZRBWBCwIsVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydez/y+ffIy2o50oZxqBtDZNHblSk4m4NgHavONp9G7yLVfBwMdTWQ0A+EHCgxsf3
	 cSlsOuv3Wefk5tULpIqeKYKwFOg6Y6pwVUE1RrU+9262t0c8X6eg7/hAo1mjg6eDm0
	 AQ+GypOXKNLnXCyb6B3edSDKQcAitTg2tvIW7prA=
Date: Wed, 20 Mar 2024 03:55:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 17/38] media: v4l: subdev: Add trivial set_routing
 support
Message-ID: <20240320015558.GV8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-18-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-18-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:55AM +0200, Sakari Ailus wrote:
> Add trivial S_ROUTING IOCTL support for drivers where routing is static.
> Essentially this means returning the same information G_ROUTING call would
> have done.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a6107e440ef0..c8c435df92c8 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -930,6 +930,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>  
> +		/*
> +		 * If the driver doesn't support setting routing, just return
> +		 * the routing table here.
> +		 */
> +		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> +			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +			       state->routing.routes,
> +			       min(state->routing.num_routes, routing->len_routes) *
> +			       sizeof(*state->routing.routes));
> +			routing->num_routes = state->routing.num_routes;
> +
> +			return 0;
> +		}
> +
>  		for (i = 0; i < routing->num_routes; ++i) {
>  			const struct v4l2_subdev_route *route = &routes[i];
>  			const struct media_pad *pads = sd->entity.pads;

-- 
Regards,

Laurent Pinchart

