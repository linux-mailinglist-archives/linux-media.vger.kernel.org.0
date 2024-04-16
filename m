Return-Path: <linux-media+bounces-9477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B78A648A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 09:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9698282953
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 07:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00AD745FD;
	Tue, 16 Apr 2024 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liUycBxk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696138FA1
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713251389; cv=none; b=nRt/afDa/gYIHoqVZXE1YrjM9HwtlAclgMTxHnDJjFgZI0kYUkVfM+hLTJQ1WQIWDcdowBRJkj1Ep74nKm326f1e1E2Ef1EvmEoVzYXb27GOFiMb9C7ut9X7292m4770E9fLhtiEHLv+MTMhojwJU7/jihGBDYh+nGkjU9vfVqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713251389; c=relaxed/simple;
	bh=+7LgJtIPjM8aQ3qviz6OwY3srEWojnnTAXi+J9kzyi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH1SEZDbDCaFEqgv4v5ThZGZaBGyLZrXRmpmlWYM3gE2knifdKA6+CIcRRI3v0+KoMPsVP6U+bSWe6VhQ7MubimoB72cFruyhG8755MGKhCwlGNjnowSE+kvJTsSZq30RjXsz5hDPC7qr6Aoq82+4/pwPQSnJb4uXk0G+TxLqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liUycBxk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713251387; x=1744787387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7LgJtIPjM8aQ3qviz6OwY3srEWojnnTAXi+J9kzyi8=;
  b=liUycBxk39LBRiEdr11vBGzvpLBSFcp9IssiWP2PUJQhQp+0GSxztURb
   XMDvStDlkLH8Z460Wjasxn9QgoVGp3W9DdxXCN1YDgblLYSh/Gk3t5K98
   6OetyNCl5KdCFYhFgYW3OrhPzwNdWvRORzjBnwHIs7PHptQOkR+udfhW6
   iGdBDC7JGdWPnpz9oikOshy4Hnb2BUP8W6IJqQ/H4iiVeyHPF1EFx0FyB
   Ke6PdYl43xurzi/keeneRbFo6rd32Macc3Qs8Xuyds2oaYqIUbhEbryr4
   pCcgVU40bsnmTBsbRGJb9no4DYQrur5MzFpulREnyXYCB+H/fOS3HzdyN
   A==;
X-CSE-ConnectionGUID: p5ZsUeqCT2ydkj1DJDTuxg==
X-CSE-MsgGUID: oLEN+Qj9RHC90/ejTeJLiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26187078"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26187078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:09:46 -0700
X-CSE-ConnectionGUID: 2kOJxoglRMqPmSV1n+iyYw==
X-CSE-MsgGUID: BLQdjjk7SSKqqbFSZses/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22244509"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:09:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1CC4211FAB0;
	Tue, 16 Apr 2024 10:09:41 +0300 (EEST)
Date: Tue, 16 Apr 2024 07:09:41 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 14/38] media: v4l: subdev: Add len_routes field to
 struct v4l2_subdev_routing
Message-ID: <Zh4kNRMokwoSG9yd@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-15-sakari.ailus@linux.intel.com>
 <20240320013635.GS8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320013635.GS8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 03:36:35AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:52AM +0200, Sakari Ailus wrote:
> > The len_routes field is used to tell the size of the routes array in
> > struct v4l2_subdev_routing. This way the number of routes returned from
> > S_ROUTING IOCTL may be larger than the number of routes provided, in case
> > there are more routes returned by the driver.
> > 
> > Note that this uAPI is still disabled in the code, so this change can
> > safely be done. Anyone who manually patched the code to enable this uAPI
> > must update their code.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/vidioc-subdev-g-routing.rst     | 33 ++++++++++++-------
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
> >  drivers/media/v4l2-core/v4l2-subdev.c         |  6 +++-
> >  include/media/v4l2-subdev.h                   |  2 ++
> >  include/uapi/linux/v4l2-subdev.h              |  9 +++--
> >  5 files changed, 37 insertions(+), 17 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 26b5004bfe6d..8f9aa83275c5 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -46,20 +46,28 @@ with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> >  setting or clearing flags of the  ``flags`` field of a
> >  struct :c:type:`v4l2_subdev_route`.
> >  
> > -All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> > -means that the userspace must reconfigure all streams after calling the ioctl
> > -with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
> > +called. This means that the userspace must reconfigure all streams after calling
> > +the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> 
> Unrelated. If you really want to reflow, the first line is too short,
> 'called.' should be moved there.

Seems to be, indeed. This would look like a bug in an Emacs major mode. :-I

> 
> >  
> >  Only subdevices which have both sink and source pads can support routing.
> >  
> > -When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
> > -provided ``num_routes`` is not big enough to contain all the available routes
> > -the subdevice exposes, drivers return the ENOSPC error code and adjust the
> > -value of the ``num_routes`` field. Application should then reserve enough memory
> > -for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
> > +The ``num_routes`` field is used to denote the number of routes set (set by user
> > +space on ``VIDIOC_SUBDEV_S_ROUTING`` argument) on the routing table as well as
> > +the number of routes returned back from both IOCTLs. ``len_routes`` signifies
> > +the number of routes that can fit into the ``routes`` array. The userspace shall
> > +set ``len_routes`` for both IOCTLs and ``num_routes`` for
> > +``VIDIOC_SUBDEV_S_ROUTING``.
> >  
> > -On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> > -``num_routes`` field to reflect the actual number of routes returned.
> > +On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
> > +field to reflect the actual number of routes known by the driver.
> > +``num_routes`` larger than ``len_routes`` may be returned by both IOCTLs to
> > +indicate there are more routes than fits to the ``routes`` array. In this
> > +case first ``len_routes`` were returned back to the userspace in the
> > +``routes`` array. This is not considered as an error.
> > +
> > +Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> > +``num_routes`` field due to e.g. hardware properties.
> >  
> 
> An attempt at making this clearer (in my opinion, feel free to pick the
> pieces you like, or reject it outright).
> 
> 
> The ``len_routes`` field indicates the number of routes that can fit in the
> ``routes`` array allocated by userspace. It is set by applications for both
> ioctls to indicate how many routes the kernel can return, and is never modified
> by the kernel.
> 
> The ``num_routes`` field indicates the number of routes in the subdevice routing
> table. For ``VIDIOC_SUBDEV_S_ROUTING``, it is set by userspace to the number of

For S_ROUTING this is the number of routes in the IOCTL argument. The
routing table may contain more (static routes).

> routes that the application stored in the ``routes`` array. For both ioctls, it
> is returned by the kernel and indicates how many routes are stored in the
> subdevice routing table. This may be smaller or larger than the value of
> ``num_routes`` set by the application for ``VIDIOC_SUBDEV_S_ROUTING``, as
> drivers may adjust the requested routing table.

How about this (first sentence modified):

The ``num_routes`` field, when returned from the kernel on both IOCTLs,
indicates the number of routes in the subdevice routing table and when calling
``VIDIOC_SUBDEV_S_ROUTING``, it is set by userspace to the number of routes that
the application stored in the ``routes`` array. The value returned by the kernel
may be smaller or larger than the value of ``num_routes`` set by the application
for ``VIDIOC_SUBDEV_S_ROUTING``, as drivers may adjust the requested routing
table.

> 
> The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> both ioctls. This indicates thare are more routes in the routing table than fits
> the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> with the first ``len_routes`` entries of the subdevice routing table. This is
> not considered an array, and the ioctl call succeeds. If the applications wants

Too many arrays? :-)

s/not considered \Kan array/to be an error/

> to retrieve the missing routes, it can issue a new ``VIDIOC_SUBDEV_G_ROUTING``
> call with a large enough ``routes`` array.
> 
> >  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> >  
> > @@ -74,6 +82,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> >        - ``which``
> >        - Routing table to be accessed, from enum
> >          :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> > +    * - __u32
> > +      - ``len_routes``
> > +      - The length of the array (as in memory reserved for the array)
> >      * - struct :c:type:`v4l2_subdev_route`
> >        - ``routes[]``
> >        - Array of struct :c:type:`v4l2_subdev_route` entries
> > @@ -81,7 +92,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> >        - ``num_routes``
> >        - Number of entries of the routes array
> >      * - __u32
> > -      - ``reserved``\ [5]
> > +      - ``reserved``\ [11]
> >        - Reserved for future extensions. Applications and drivers must set
> >  	the array to zero.
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 95bd56145d38..018e7efc21ca 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -3155,13 +3155,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> >  	case VIDIOC_SUBDEV_S_ROUTING: {
> >  		struct v4l2_subdev_routing *routing = parg;
> >  
> > -		if (routing->num_routes > 256)
> > +		if (routing->len_routes > 256)
> >  			return -E2BIG;
> >  
> >  		*user_ptr = u64_to_user_ptr(routing->routes);
> >  		*kernel_ptr = (void **)&routing->routes;
> >  		*array_size = sizeof(struct v4l2_subdev_route)
> > -			    * routing->num_routes;
> > +			    * routing->len_routes;
> >  		ret = 1;
> >  		break;
> >  	}
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ec8de3f872b9..486a5c3016de 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -925,6 +925,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> >  			return -EPERM;
> >  
> > +		if (routing->num_routes > routing->len_routes)
> > +			return -EINVAL;
> > +
> >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> >  
> >  		for (i = 0; i < routing->num_routes; ++i) {
> > @@ -951,6 +954,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		}
> >  
> >  		krouting.num_routes = routing->num_routes;
> > +		krouting.len_routes = routing->len_routes;
> >  		krouting.routes = routes;
> >  
> >  		return v4l2_subdev_call(sd, pad, set_routing, state,
> > @@ -971,7 +975,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  
> >  		krouting = &state->routing;
> >  
> > -		if (routing->num_routes < krouting->num_routes) {
> > +		if (routing->len_routes < krouting->num_routes) {
> >  			routing->num_routes = krouting->num_routes;
> >  			return -ENOSPC;
> 
> Do we still want to return -ENOSPC here ?

Indeed, this part should have been changed, too.

The code in the case would then become:

		struct v4l2_subdev_routing *routing = arg;
		struct v4l2_subdev_krouting *krouting;

		if (!v4l2_subdev_enable_streams_api)
			return -ENOIOCTLCMD;

		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
			return -ENOIOCTLCMD;

		memset(routing->reserved, 0, sizeof(routing->reserved));

		krouting = &state->routing;

		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
		       krouting->routes,
		       min(krouting->num_routes, routing->len_routes) *
		       sizeof(*krouting->routes));
		routing->num_routes = krouting->num_routes;

		return 0;

> 
> >  		}
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 9cce48365975..1df6b963a1c9 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -728,12 +728,14 @@ struct v4l2_subdev_stream_configs {
> >  /**
> >   * struct v4l2_subdev_krouting - subdev routing table
> >   *
> > + * @len_routes: length of routes array, in routes
> >   * @num_routes: number of routes
> >   * @routes: &struct v4l2_subdev_route
> >   *
> >   * This structure contains the routing table for a subdev.
> >   */
> >  struct v4l2_subdev_krouting {
> > +	unsigned int len_routes;
> >  	unsigned int num_routes;
> >  	struct v4l2_subdev_route *routes;
> >  };
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 7048c51581c6..ca543982460c 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -224,15 +224,18 @@ struct v4l2_subdev_route {
> >   * struct v4l2_subdev_routing - Subdev routing information
> >   *
> >   * @which: configuration type (from enum v4l2_subdev_format_whence)
> > - * @num_routes: the total number of routes in the routes array
> > + * @len_routes: the length of the routes array, in routes
> >   * @routes: pointer to the routes array
> > + * @num_routes: the total number of routes, possibly more than fits in the
> > + *		routes array
> >   * @reserved: drivers and applications must zero this array
> >   */
> >  struct v4l2_subdev_routing {
> >  	__u32 which;
> > -	__u32 num_routes;
> > +	__u32 len_routes;
> >  	__u64 routes;
> > -	__u32 reserved[6];
> > +	__u32 num_routes;
> > +	__u32 reserved[11];
> >  };
> >  
> >  /*
> 

-- 
Kind regards,

Sakari Ailus

