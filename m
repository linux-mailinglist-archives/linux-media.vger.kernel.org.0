Return-Path: <linux-media+bounces-1275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BB7FBB98
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 14:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB9F282C93
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570D558AB4;
	Tue, 28 Nov 2023 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU2qhO3E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA7EBC
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701178251; x=1732714251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xLgSgidT55+5+cojOGRgJmXKPgqNemWApRY4RVjbvnU=;
  b=EU2qhO3EUW1oPADZApIWjccnWG942KAnC5jWQsnWPeiyVljTYqdcFE6K
   jw0pLXakIn7aEexiTWD3IwRrCZ+beKMu4/f/qajcy4MCdi/a5Tm5de9GM
   PUuUgEa5tbR9uMQrN8vd22d8j+ORByUqJb72pm6zCrWzvCj8jp12I74zH
   q9yMs0LhVSZCWZDKJ9zijMovoGg0ij9hp3FYJYGhBOudwmoz0amRyUTxz
   JEf0VhpswK2HA1L/uLxLCJ4naP55oqoR+Ym9mehy3jmZdQVoWE0gdIVkJ
   2cwR3NyOzcbm0WfFa6TE1aBS3ce7Rfm8E3MB5FnrJ2PdPGYQVnVCDe7SM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="390076399"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="390076399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744899672"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="744899672"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:30:47 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 704C411FBF0;
	Tue, 28 Nov 2023 15:30:44 +0200 (EET)
Date: Tue, 28 Nov 2023 13:30:44 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 16/28] media: v4l: subdev: Add len_routes field to
 struct v4l2_subdev_routing
Message-ID: <ZWXrhE3FTLVdgcUS@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-7-sakari.ailus@linux.intel.com>
 <a7afd593-b90c-4109-88b7-84d368ee9e5d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7afd593-b90c-4109-88b7-84d368ee9e5d@xs4all.nl>

Hi Hans,

Thank you for the review. I somehow missed replying to this earlier, before
posting v7.

On Thu, Oct 05, 2023 at 01:00:15PM +0200, Hans Verkuil wrote:
> On 03/10/2023 14:08, Sakari Ailus wrote:
> > The len_routes field is used to tell the size of the routes array in
> > struct v4l2_subdev_routing. This way the number of routes returned from
> > S_ROUTING IOCTL may be larger than the number of routes provided, in case
> > there are more routes returned by the driver.
> > 
> > Note that this changes the (now-disabled) UAPI, users must be updated.
> 
> With "now-disabled" you mean "still disabled", right?
> 
> So:
> 
> "Note that this uAPI is still disabled in the code, so this change can
> safely be done. Anyone who manually patched the code to enable this uAPI
> must update their code."

I can add that.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/vidioc-subdev-g-routing.rst     | 31 ++++++++++++-------
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
> >  drivers/media/v4l2-core/v4l2-subdev.c         |  6 +++-
> >  include/media/v4l2-subdev.h                   |  2 ++
> >  include/uapi/linux/v4l2-subdev.h              |  8 +++--
> >  5 files changed, 34 insertions(+), 17 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 72677a280cd6..9a9765ddc316 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -46,20 +46,26 @@ with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> >  setting or clearing flags of the  ``flags`` field of a
> >  struct :c:type:`v4l2_subdev_route`.
> >  
> > -All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> > -means that the userspace must reconfigure all streams after calling the ioctl
> > -with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
> > +called. This means that the userspace must reconfigure all streams after calling
> > +the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
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
> > +the number of routes returned back from both IOCTLs. The ``len_routes``
> > +signifies the number of routes that can fit into the ``routes`` array. The
> > +userspace shall set ``len_routes`` for both IOCTLs and ``num_routes`` for
> > +``VIDIOC_SUBDEV_S_ROUTING``.
> >  
> > -On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> > -``num_routes`` field to reflect the actual number of routes returned.
> > +On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
> > +field to reflect the actual number of routes known by the driver. ``num_routes``
> > +larger than ``len_routes`` in both IOCTLs. In this ``len_routes`` were returned
> > +back to the userspace. This is not an error.
> 
> This paragraph is garbled.

Oops. This intended to read:

On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
field to reflect the actual number of routes known by the driver.
``num_routes`` larger than ``len_routes`` may be returned by both IOCTLs to
indicate there are more routes than fits to the ``routes`` array. In this
case first ``len_routes`` were returned back to the userspace in the
``routes`` array. This is not considered as an error.

> 
> > +
> > +Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> > +``num_routes`` field due to e.g. hardware properties.
> >  
> >  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> >  
> > @@ -74,6 +80,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> >        - ``which``
> >        - Format to modified, from enum
> >          :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> > +    * - __u32
> > +      - ``len_routes``
> > +      - The length of the array (as in memory reserved for the array)
> 
> So is this in bytes or in number of route entries?
> 
> I think 'len_routes' is a terribly confusing name.
> 
> How about 'max_num_routes'? Or 'max_route_elems/entries'?
> 
> >      * - struct :c:type:`v4l2_subdev_route`
> >        - ``routes[]``
> >        - Array of struct :c:type:`v4l2_subdev_route` entries
> > @@ -81,7 +90,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> >        - ``num_routes``
> >        - Number of entries of the routes array
> 
> This is now a very confusing field description.
> 
> How about:
> 
> 'max_num_routes': Maximum number of entries that can fit in the routes array
> 'num_routes': Actual number of entries stored in the routes array.
> 
> >      * - __u32
> > -      - ``reserved``\ [5]
> > +      - ``reserved``\ [11]
> >        - Reserved for future extensions. Applications and drivers must set
> >  	the array to zero.
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 6921a72566df..1e3da9d64958 100644
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
> > index 614ff0031831..bd1e8205913c 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -903,6 +903,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> >  			return -EPERM;
> >  
> > +		if (routing->num_routes > routing->len_routes)
> > +			return -EINVAL;
0> > +
> >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> >  
> >  		for (i = 0; i < routing->num_routes; ++i) {
> > @@ -929,6 +932,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		}
> >  
> >  		krouting.num_routes = routing->num_routes;
> > +		krouting.len_routes = routing->len_routes;
> >  		krouting.routes = routes;
> >  
> >  		return v4l2_subdev_call(sd, pad, set_routing, state,
> > @@ -949,7 +953,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  
> >  		krouting = &state->routing;
> >  
> > -		if (routing->num_routes < krouting->num_routes) {
> > +		if (routing->len_routes < krouting->num_routes) {
> >  			routing->num_routes = krouting->num_routes;
> >  			return -ENOSPC;
> >  		}
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e49e8af2fb52..baaa81a9497e 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -741,12 +741,14 @@ struct v4l2_subdev_stream_configs {
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
> > index 4a195b68f28f..b57fb89caa9e 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -222,15 +222,17 @@ struct v4l2_subdev_route {
> >   * struct v4l2_subdev_routing - Subdev routing information
> >   *
> >   * @which: configuration type (from enum v4l2_subdev_format_whence)
> > - * @num_routes: the total number of routes in the routes array
> > + * @len_routes: the length of the routes array, in routes
> >   * @routes: pointer to the routes array
> > + * @num_routes: the total number of routes in the routes array

I'll change this to reflect there may be more routes than fits to the
array.

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
> I'm going with a NACK for the 'len_routes' name, it's a really, really
> bad name.
> 
> So:
> 
> Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

That's bit harsh judgement due to a differing opinion on a field name. I
think len_routes is fine as it's the length of the routes array, not the
number of entries in it but I'm totally fine changing it.

max_num_routes isn't great either as num_routes can effectively be larger
than max_num_routes.

How about "size_routes", for instance? Or "max_elems_routes"?

-- 
Regards,

Sakari Ailus

