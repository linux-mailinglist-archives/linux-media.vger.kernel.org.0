Return-Path: <linux-media+bounces-7360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E8880944
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 02:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF0C6B233DA
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0DF748F;
	Wed, 20 Mar 2024 01:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qmRNls9Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970CA2CA2
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 01:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710899606; cv=none; b=lzUqHy8r+WjQ8o8GzBEcsAR4Q4W+gCnJHBmFPamTxxFtXnbNuvsP6CzHUecLuFZW5OQ6WOVpKnyqZiGnWP+wVauZPAg5D7Rq3xzY8fmysulSNjquuMMFs5AlHxzo4lsqm6iewNxQGludOGlMy2i/kiDfm4O533q4QPZpeofMF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710899606; c=relaxed/simple;
	bh=HkXcqv+L9yyySUQXC9XsgILrUY9I5FOOEN5m6aXlbu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9ABrhr8Kqrlw8iR07rbwp99m30YM/HCrEp5JL0mMGVtlBUF/lmpxs/9aZpVzySo9xqTzDq2FsaYsT7uQm3wCjeKXzqT4DKHerBvKFK4dq3dUBBD/zG/ObvYWdFOIPtgpkJU2KQhkHht8mRK9wxyLUuwtN0hE9qDA3uDhlg1XfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qmRNls9Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61C7E9EC;
	Wed, 20 Mar 2024 02:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710899575;
	bh=HkXcqv+L9yyySUQXC9XsgILrUY9I5FOOEN5m6aXlbu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmRNls9YGSUvT7Cmpju4dIuVWHmHjsb/vksCtQ0TGfeRWvfBDCOC4+ts/dQlnOEAo
	 KX9PaihKHqUexH6YdoZTTovIFL85N+fNOYybBQfeyLLbfcRJvj+7kyKOA+xNS/oKX6
	 B/kDiNXtP2p3eeAomhbqaTtCdWNIUN8koMzsNOek=
Date: Wed, 20 Mar 2024 03:53:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 16/38] media: v4l: subdev: Allow a larger number of
 routes than there's room for
Message-ID: <20240320015319.GU8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-17-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:54AM +0200, Sakari Ailus wrote:
> On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> as there's room. Do not consider it an error if more routes existed.
> Simply inform the user there are more routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/vidioc-subdev-g-routing.rst              |  4 ----
>  drivers/media/v4l2-core/v4l2-subdev.c                  | 10 +++-------
>  2 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 6eb6a59570dc..08b8d17cef3f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -147,10 +147,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
>  appropriately. The generic error codes are described at the
>  :ref:`Generic Error Codes <gen-errors>` chapter.
>  
> -ENOSPC
> -   The application provided ``num_routes`` is not big enough to contain
> -   all the available routes the subdevice exposes.
> -

I wonder if this patch should be squashed with the previous two. You
update the documentation in 14/38 already.

>  EINVAL
>     The sink or source pad identifiers reference a non-existing pad or reference
>     pads of different types (ie. the sink_pad identifiers refers to a source
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a357ce318192..a6107e440ef0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -964,7 +964,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>  		       state->routing.routes,
> -		       state->routing.num_routes *
> +		       min(state->routing.num_routes, routing->len_routes)  *
>  		       sizeof(*state->routing.routes));
>  		routing->num_routes = state->routing.num_routes;
>  
> @@ -985,14 +985,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		krouting = &state->routing;
>  
> -		if (routing->len_routes < krouting->num_routes) {
> -			routing->num_routes = krouting->num_routes;
> -			return -ENOSPC;
> -		}
> -
>  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>  		       krouting->routes,
> -		       krouting->num_routes * sizeof(*krouting->routes));
> +		       min(krouting->num_routes, routing->len_routes) *
> +		       sizeof(*krouting->routes));
>  		routing->num_routes = krouting->num_routes;
>  
>  		return 0;

-- 
Regards,

Laurent Pinchart

