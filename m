Return-Path: <linux-media+bounces-7359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6D880936
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 02:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60343281C92
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707607489;
	Wed, 20 Mar 2024 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uCfjjUaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057977464
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710899121; cv=none; b=HmbjDT141s2fAuoYxCKsZ0KRe+JtmC+xUAuphWCTQTyQU3G4gZ/CuWQU/6Oduw2y5jbdXwe8m432fzKCFYf1y0eCy2Hs+TVjqJAPJGti2Rf6JwW1HTB4DIXFDZxZyKNKFpeMVnGcWl9PxoOb7x3cBZ2Q7ih18EDxJo3ICretX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710899121; c=relaxed/simple;
	bh=3DAykgsS2tCtcAuDO5wlsgsZHQxxvGqA9oAlqhkQaFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obvoPTkUNV+RNnqxpfXxk6iVzLmNBiM0tRs/qBRmZ7R1xfJyIO1LEck1rCXb0mY+HNj+FNkoJoxmfLSXqIdVjdY6NKq33+OYREmhKE5kiGcCAaZqOyq6hmmXc1+KwG1/5UCbdU69ynzhR/tF7eCopZK1i+cZL3GgUqq774OUVYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uCfjjUaJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C6C39EC;
	Wed, 20 Mar 2024 02:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710899090;
	bh=3DAykgsS2tCtcAuDO5wlsgsZHQxxvGqA9oAlqhkQaFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCfjjUaJMpitcGL+B9Q9lcDRY9ZhEva3o+1pbnb1zy3Jp8xOY5gNq+fpsLohQtWF4
	 JJ8jHVaZ5R7iDP66yr3qRBtaptsOeYDOdCPQ38rbkoNoIjDu8CQ2SEFDlc1z/mPPHB
	 F9T/p0dCvtYUcdocQQirnoi8ZnT+GeZHLWfqd+Z4=
Date: Wed, 20 Mar 2024 03:45:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 15/38] media: v4l: subdev: Return routes set using
 S_ROUTING
Message-ID: <20240320014514.GT8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-16-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-16-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:53AM +0200, Sakari Ailus wrote:
> Return the routes set using S_ROUTING back to the user. Also reflect this
> in documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/vidioc-subdev-g-routing.rst            |  5 +++--
>  drivers/media/v4l2-core/v4l2-subdev.c                | 12 +++++++++++-
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 8f9aa83275c5..6eb6a59570dc 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -43,8 +43,9 @@ The routing configuration determines the flows of data inside an entity.
>  Drivers report their current routing tables using the
>  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
>  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> -setting or clearing flags of the  ``flags`` field of a
> -struct :c:type:`v4l2_subdev_route`.
> +setting or clearing flags of the ``flags`` field of a struct
> +:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
> +``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
>  
>  All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
>  called. This means that the userspace must reconfigure all streams after calling
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 486a5c3016de..a357ce318192 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -957,8 +957,18 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		krouting.len_routes = routing->len_routes;
>  		krouting.routes = routes;
>  
> -		return v4l2_subdev_call(sd, pad, set_routing, state,
> +		rval = v4l2_subdev_call(sd, pad, set_routing, state,
>  					routing->which, &krouting);
> +		if (rval < 0)
> +			return rval;
> +
> +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +		       state->routing.routes,
> +		       state->routing.num_routes *

I think this should be capped at len_routes.

> +		       sizeof(*state->routing.routes));
> +		routing->num_routes = state->routing.num_routes;
> +
> +		return 0;
>  	}
>  
>  	case VIDIOC_SUBDEV_G_ROUTING: {
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart

