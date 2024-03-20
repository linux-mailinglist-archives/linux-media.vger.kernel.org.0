Return-Path: <linux-media+bounces-7348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4988089B
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED422828FA
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B137CA32;
	Wed, 20 Mar 2024 00:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PceBzWci"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829A629
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710895066; cv=none; b=O25op4i61cv84w5f/Jr3HO8N7R0XtTEuFIhh3ZxWj6RUn2XSR0dSGpcFL0yF7uu+2Td+kEUCdLb4xGURzQ1fJap+sIPaMnUG4t2QeYVWCV0EwEjbrHMCn/+StTi1peJSeveMPUyAvq0Z1l3v7CSTMQad0vF1PQ/Mko8H17sR00Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710895066; c=relaxed/simple;
	bh=QUg1CYYVzOLp4QSmcu8PXWLuUZPSbD7MPb9R+lW9oCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoL3wKNg2sPgXgySDVO4o9drVFvUOBkQUMc31YxCGCxcySlLDA6yOre7WLrpV3eTuQyuUeLHnnRGHHMx284+SaWYgrb+ZF4bjlQU12BT+ltDvT6TGDYMRUqhsFPyL9qM2bm+SL/lADkcX2EtlA+bBu0EtY2OFIN/8JUagbGb/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PceBzWci; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D53DDB1;
	Wed, 20 Mar 2024 01:37:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710895036;
	bh=QUg1CYYVzOLp4QSmcu8PXWLuUZPSbD7MPb9R+lW9oCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PceBzWci9O1ZsrzNohDTc4eN6eX+qLVlqF3vzWrJTJLHpe0V2CLtdX3Yf1RD5zMjB
	 PuM2BFr50yFRGsYH39V2Thd3w+zI6w34jjpjMDjhC2lqB4WTd7UpUOvVtIo5BHUz3r
	 GjZsvfSLbLBNM74SJvRnKRdfbpJBhDPcQfK6bj24=
Date: Wed, 20 Mar 2024 02:37:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 12/38] media: v4l: subdev: Move G_ROUTING handling
 below S_ROUTING
Message-ID: <20240320003739.GQ8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-13-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:50AM +0200, Sakari Ailus wrote:
> Move G_ROUTING IOCTL handling below that of S_ROUTING. G_ROUTING
> implementation will soon needed in handling S_ROUTING as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 54 +++++++++++++--------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 6c34df19ea2f..ec8de3f872b9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -909,33 +909,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
>  
> -	case VIDIOC_SUBDEV_G_ROUTING: {
> -		struct v4l2_subdev_routing *routing = arg;
> -		struct v4l2_subdev_krouting *krouting;
> -
> -		if (!v4l2_subdev_enable_streams_api)
> -			return -ENOIOCTLCMD;
> -
> -		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> -			return -ENOIOCTLCMD;
> -
> -		memset(routing->reserved, 0, sizeof(routing->reserved));
> -
> -		krouting = &state->routing;
> -
> -		if (routing->num_routes < krouting->num_routes) {
> -			routing->num_routes = krouting->num_routes;
> -			return -ENOSPC;
> -		}
> -
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       krouting->routes,
> -		       krouting->num_routes * sizeof(*krouting->routes));
> -		routing->num_routes = krouting->num_routes;
> -
> -		return 0;
> -	}
> -
>  	case VIDIOC_SUBDEV_S_ROUTING: {
>  		struct v4l2_subdev_routing *routing = arg;
>  		struct v4l2_subdev_route *routes =
> @@ -984,6 +957,33 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  					routing->which, &krouting);
>  	}
>  
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting *krouting;
> +
> +		if (!v4l2_subdev_enable_streams_api)
> +			return -ENOIOCTLCMD;
> +
> +		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +			return -ENOIOCTLCMD;
> +
> +		memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +		krouting = &state->routing;
> +
> +		if (routing->num_routes < krouting->num_routes) {
> +			routing->num_routes = krouting->num_routes;
> +			return -ENOSPC;
> +		}
> +
> +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +		       krouting->routes,
> +		       krouting->num_routes * sizeof(*krouting->routes));
> +		routing->num_routes = krouting->num_routes;
> +
> +		return 0;
> +	}
> +
>  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>  

-- 
Regards,

Laurent Pinchart

