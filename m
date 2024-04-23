Return-Path: <linux-media+bounces-9936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50B8AE70C
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A081F25E6B
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B6F85C4E;
	Tue, 23 Apr 2024 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jxA28Ann"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5F86252
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876903; cv=none; b=CKKljXy7OYHh3tWdSo8/YnsAp9bbjvLfavBglwWGx4vANSmx356duUolF0M5UgrkUrHHpKHcCKJ3v4fOXyKKaJlGHU2iuky6UApiWsCY6VDQhwGSJMDaS9HSgMyDtrQu3rdIu7gBZkJyS26jBLMoZBgdPx+UC7m64xympNyWrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876903; c=relaxed/simple;
	bh=iILe2fzViVrmVa/1txPPezCxE2ACEysV017CEaFpDO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q94DEJZ7T/S3CqW/EXekRsDUCBfXmae+AaeRNoW0DGLnfXgO0k7erqFLXwnngzLkWzUYPx6Q9HR0UDPQw5Vy/dmGkxgPyqJ13cBGKSNrTz4NXaa9lxW7gYA2ZzllzopwFLCM6eVloj0LFZO4Q9E3fVDJvkp+gKHr+ippu+eiIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jxA28Ann; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-77-173-nat.elisa-mobile.fi [85.76.77.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A4C6E4;
	Tue, 23 Apr 2024 14:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713876848;
	bh=iILe2fzViVrmVa/1txPPezCxE2ACEysV017CEaFpDO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxA28AnnUKV8dJJlrDaE77f3Q6J+8e6nal6W2+yBPh9WVFJshTvLLfC3A4qoplOK+
	 lZ3kdtWMfzkxjYXxYe6sWhVoC3G5xlBWP4pY2+t8M+BaRFbIQBkK6T9mykjnHAGRiX
	 PKhRTYKHBOusz6P0uzlAqw1+1Ef0XEj6aM8tSnJc=
Date: Tue, 23 Apr 2024 15:54:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 15/46] media: v4l: subdev: Add len_routes field to
 struct v4l2_subdev_routing
Message-ID: <20240423125450.GD20623@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-16-sakari.ailus@linux.intel.com>
 <20240419224519.GJ6414@pendragon.ideasonboard.com>
 <ZieRYpg6zVjXOo2G@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZieRYpg6zVjXOo2G@kekkonen.localdomain>

Hi Sakari,

On Tue, Apr 23, 2024 at 10:45:54AM +0000, Sakari Ailus wrote:
> On Sat, Apr 20, 2024 at 01:45:19AM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 10:32:48PM +0300, Sakari Ailus wrote:
> > > The len_routes field is used to tell the size of the routes array in
> > > struct v4l2_subdev_routing. This way the number of routes returned from
> > > S_ROUTING IOCTL may be larger than the number of routes provided, in case
> > > there are more routes returned by the driver.
> > > 
> > > Note that this uAPI is still disabled in the code, so this change can
> > > safely be done. Anyone who manually patched the code to enable this uAPI
> > > must update their code.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/v4l/vidioc-subdev-g-routing.rst     | 50 +++++++++++++------
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +-
> > >  drivers/media/v4l2-core/v4l2-subdev.c         | 12 ++---
> > >  include/media/v4l2-subdev.h                   |  2 +
> > >  include/uapi/linux/v4l2-subdev.h              |  9 ++--
> > >  5 files changed, 52 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > index 26b5004bfe6d..27eb4c82a0e1 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > @@ -43,23 +43,42 @@ The routing configuration determines the flows of data inside an entity.
> > >  Drivers report their current routing tables using the
> > >  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> > >  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> > > -setting or clearing flags of the  ``flags`` field of a
> > > -struct :c:type:`v4l2_subdev_route`.
> > > +setting or clearing flags of the ``flags`` field of a struct
> > > +:c:type:`v4l2_subdev_route`.
> > >  
> > > -All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> > > -means that the userspace must reconfigure all streams after calling the ioctl
> > > -with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > > +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called.
> > > +This means that the userspace must reconfigure all stream formats and selections
> > > +after calling the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > >  
> > >  Only subdevices which have both sink and source pads can support routing.
> > >  
> > > -When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
> > > -provided ``num_routes`` is not big enough to contain all the available routes
> > > -the subdevice exposes, drivers return the ENOSPC error code and adjust the
> > > -value of the ``num_routes`` field. Application should then reserve enough memory
> > > -for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
> > > -
> > > -On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> > > -``num_routes`` field to reflect the actual number of routes returned.
> > > +The ``len_routes`` field indicates the number of routes that can fit in the
> > > +``routes`` array allocated by userspace. It is set by applications for both
> > > +ioctls to indicate how many routes the kernel can return, and is never modified
> > > +by the kernel.
> > > +
> > > +The ``num_routes`` field, when returned from the kernel on both IOCTLs,
> > > +indicates the number of routes in the subdevice routing table and when calling
> > > +``VIDIOC_SUBDEV_S_ROUTING``, it is set by userspace to the number of routes that
> > > +the application stored in the ``routes`` array. The value returned by the kernel
> > > +may be smaller or larger than the value of ``num_routes`` set by the application
> > > +for ``VIDIOC_SUBDEV_S_ROUTING``, as drivers may adjust the requested routing
> > > +table.
> > 
> > I still think the proposal I made when reviewing the previous version is
> > clearer :-)
> > 
> > ----
> > The ``num_routes`` field indicates the number of routes in the subdevice routing
> > table. For ``VIDIOC_SUBDEV_S_ROUTING``, it is set by userspace to the number of
> > routes that the application stored in the ``routes`` array. For both ioctls, it
> > is returned by the kernel and indicates how many routes are stored in the
> > subdevice routing table. This may be smaller or larger than the value of
> > ``num_routes`` set by the application for ``VIDIOC_SUBDEV_S_ROUTING``, as
> > drivers may adjust the requested routing table.
> > ----
> > 
> > You replied that
> > 
> > > For S_ROUTING this is the number of routes in the IOCTL argument. The
> > > routing table may contain more (static routes).
> > 
> > and that's right, but, even when set by userspace for S_ROUTING, the
> > num_routes fields is the number of routes that userspace tries to set in
> > the routing table. I think starting with a first sentence that describes
> > what the field contains, and then explaining how it's used for the
> > different ioctls by userspace and kernel space, is clearer.
> 
> The problem with your suggestion is that it's not entirely correct:
> num_routes is indeed used for two different purposes. Removing " in the
> subdevice routing table" in the first sentence would be a simple fix.

How about dropping just "subdevice", and keeping "in the routing table"
? That should cover both cases.

> > > +
> > > +The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> > > +both ioctls. This indicates thare are more routes in the routing table than fits
> > > +the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> > > +with the first ``len_routes`` entries of the subdevice routing table. This is
> > > +not considered to be an error, and the ioctl call succeeds. If the applications
> > > +wants to retrieve the missing routes, it can issue a new
> > > +``VIDIOC_SUBDEV_G_ROUTING`` call with a large enough ``routes`` array.
> > > +
> > > +indicate there are more routes than fits to the ``routes`` array. In this
> > > +case first ``len_routes`` were returned back to the userspace in the
> > > +``routes`` array. This is not considered as an error.
> > 
> > I think these 3 lines are a leftover.
> 
> Yes, I'll remove them.
> 
> > > +
> > > +Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> > 
> > s/Also //
> > s/route/routes/
> 
> Yes.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > 
> > > +``num_routes`` field due to e.g. hardware properties.
> > >  
> > >  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > >  
> > > @@ -74,6 +93,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> > >        - ``which``
> > >        - Routing table to be accessed, from enum
> > >          :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> > > +    * - __u32
> > > +      - ``len_routes``
> > > +      - The length of the array (as in memory reserved for the array)
> > >      * - struct :c:type:`v4l2_subdev_route`
> > >        - ``routes[]``
> > >        - Array of struct :c:type:`v4l2_subdev_route` entries
> > > @@ -81,7 +103,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> > >        - ``num_routes``
> > >        - Number of entries of the routes array
> > >      * - __u32
> > > -      - ``reserved``\ [5]
> > > +      - ``reserved``\ [11]
> > >        - Reserved for future extensions. Applications and drivers must set
> > >  	the array to zero.
> > >  
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 1863ecae9ec9..f30f61c008c7 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -3185,13 +3185,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> > >  	case VIDIOC_SUBDEV_S_ROUTING: {
> > >  		struct v4l2_subdev_routing *routing = parg;
> > >  
> > > -		if (routing->num_routes > 256)
> > > +		if (routing->len_routes > 256)
> > >  			return -E2BIG;
> > >  
> > >  		*user_ptr = u64_to_user_ptr(routing->routes);
> > >  		*kernel_ptr = (void **)&routing->routes;
> > >  		*array_size = sizeof(struct v4l2_subdev_route)
> > > -			    * routing->num_routes;
> > > +			    * routing->len_routes;
> > >  		ret = 1;
> > >  		break;
> > >  	}
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 2ba11e5343f0..904378007a79 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -927,6 +927,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> > >  			return -EPERM;
> > >  
> > > +		if (routing->num_routes > routing->len_routes)
> > > +			return -EINVAL;
> > > +
> > >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> > >  
> > >  		for (i = 0; i < routing->num_routes; ++i) {
> > > @@ -953,6 +956,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		}
> > >  
> > >  		krouting.num_routes = routing->num_routes;
> > > +		krouting.len_routes = routing->len_routes;
> > >  		krouting.routes = routes;
> > >  
> > >  		return v4l2_subdev_call(sd, pad, set_routing, state,
> > > @@ -973,14 +977,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  
> > >  		krouting = &state->routing;
> > >  
> > > -		if (routing->num_routes < krouting->num_routes) {
> > > -			routing->num_routes = krouting->num_routes;
> > > -			return -ENOSPC;
> > > -		}
> > > -
> > >  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > >  		       krouting->routes,
> > > -		       krouting->num_routes * sizeof(*krouting->routes));
> > > +		       min(krouting->num_routes, routing->len_routes) *
> > > +		       sizeof(*krouting->routes));
> > >  		routing->num_routes = krouting->num_routes;
> > >  
> > >  		return 0;
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index 9cce48365975..1df6b963a1c9 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -728,12 +728,14 @@ struct v4l2_subdev_stream_configs {
> > >  /**
> > >   * struct v4l2_subdev_krouting - subdev routing table
> > >   *
> > > + * @len_routes: length of routes array, in routes
> > >   * @num_routes: number of routes
> > >   * @routes: &struct v4l2_subdev_route
> > >   *
> > >   * This structure contains the routing table for a subdev.
> > >   */
> > >  struct v4l2_subdev_krouting {
> > > +	unsigned int len_routes;
> > >  	unsigned int num_routes;
> > >  	struct v4l2_subdev_route *routes;
> > >  };
> > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > index 81a24bd38003..6a39128d0606 100644
> > > --- a/include/uapi/linux/v4l2-subdev.h
> > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > @@ -228,15 +228,18 @@ struct v4l2_subdev_route {
> > >   * struct v4l2_subdev_routing - Subdev routing information
> > >   *
> > >   * @which: configuration type (from enum v4l2_subdev_format_whence)
> > > - * @num_routes: the total number of routes in the routes array
> > > + * @len_routes: the length of the routes array, in routes
> > >   * @routes: pointer to the routes array
> > > + * @num_routes: the total number of routes, possibly more than fits in the
> > > + *		routes array
> > >   * @reserved: drivers and applications must zero this array
> > >   */
> > >  struct v4l2_subdev_routing {
> > >  	__u32 which;
> > > -	__u32 num_routes;
> > > +	__u32 len_routes;
> > >  	__u64 routes;
> > > -	__u32 reserved[6];
> > > +	__u32 num_routes;
> > > +	__u32 reserved[11];
> > >  };
> > >  
> > >  /*

-- 
Regards,

Laurent Pinchart

