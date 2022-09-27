Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6ED45EBFA9
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 12:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbiI0KYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 06:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiI0KYB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 06:24:01 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1C2FCA67
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 03:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664274238; x=1695810238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ta1oy8wFKKUJeOk8gkIrJ3oIK0XlK5mvmQxNvo7A3Wk=;
  b=m4keL2Y1vneXDgZA0S+bBrFqaUQgHmjP6GWe1CtpUB3SFnPzHRlVvPjY
   jQzFgKQkhLBlEtHKhvrKI4QUASe3+RXDgxuoePWyXt60Ma56SefLrfosm
   iGI/SQVbdMnF3jXw/3w45oGutifezC0GJqcuyToKLDHp00ihoCj3NeLGV
   3WGtjaL8RRwjnjAgN5benK5yErOPwz/ambOalv10rP7LFa1G8eSS6Rlqe
   Qh7pKNxw4U2k1hcIpNyefRa2M8LVQUglIGeIYc+UDjAeAL9DmMxaKsOsj
   GtMDnWnXSYEJayaK8uKDTxhtXT91uroBb+sHt2grLeoNQXp/y5NnToLHe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="281649838"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="281649838"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 03:23:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="866521145"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="866521145"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 03:23:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D540B20077;
        Tue, 27 Sep 2022 13:23:53 +0300 (EEST)
Date:   Tue, 27 Sep 2022 10:23:53 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v14 19/34] media: Documentation: Add GS_ROUTING
 documentation
Message-ID: <YzLPOXkaWQe33g+q@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com>
 <YzKRMiumNoskMuxw@paasikivi.fi.intel.com>
 <97c4d4bc-9907-3ffc-1839-2678a30d53c4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97c4d4bc-9907-3ffc-1839-2678a30d53c4@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Heipparallaa Tomi,

On Tue, Sep 27, 2022 at 12:32:43PM +0300, Tomi Valkeinen wrote:
> On 27/09/2022 08:59, Sakari Ailus wrote:
> > Moi,
> > 
> > On Wed, Aug 31, 2022 at 05:13:42PM +0300, Tomi Valkeinen wrote:
> > > From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > 
> > > Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
> > > description of multiplexed media pads and internal routing to the
> > > V4L2-subdev documentation section.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > >   .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> > >   .../userspace-api/media/v4l/user-func.rst     |   1 +
> > >   .../media/v4l/vidioc-subdev-g-routing.rst     | 150 ++++++++++++++++++
> > >   3 files changed, 153 insertions(+)
> > >   create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index fd1de0a73a9f..a67c2749089a 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -29,6 +29,8 @@ will feature a character device node on which ioctls can be called to
> > >   -  negotiate image formats on individual pads
> > > +-  inspect and modify internal data routing between pads of the same entity
> > > +
> > >   Sub-device character device nodes, conventionally named
> > >   ``/dev/v4l-subdev*``, use major number 81.
> > > diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
> > > index 53e604bd7d60..228c1521f190 100644
> > > --- a/Documentation/userspace-api/media/v4l/user-func.rst
> > > +++ b/Documentation/userspace-api/media/v4l/user-func.rst
> > > @@ -70,6 +70,7 @@ Function Reference
> > >       vidioc-subdev-g-crop
> > >       vidioc-subdev-g-fmt
> > >       vidioc-subdev-g-frame-interval
> > > +    vidioc-subdev-g-routing
> > >       vidioc-subdev-g-selection
> > >       vidioc-subdev-querycap
> > >       vidioc-subscribe-event
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > new file mode 100644
> > > index 000000000000..a0d9c79e162f
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > @@ -0,0 +1,150 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +.. c:namespace:: V4L
> > > +
> > > +.. _VIDIOC_SUBDEV_G_ROUTING:
> > > +
> > > +******************************************************
> > > +ioctl VIDIOC_SUBDEV_G_ROUTING, VIDIOC_SUBDEV_S_ROUTING
> > > +******************************************************
> > > +
> > > +Name
> > > +====
> > > +
> > > +VIDIOC_SUBDEV_G_ROUTING - VIDIOC_SUBDEV_S_ROUTING - Get or set routing between streams of media pads in a media entity.
> > > +
> > > +
> > > +Synopsis
> > > +========
> > > +
> > > +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_ROUTING, struct v4l2_subdev_routing *argp )
> > > +    :name: VIDIOC_SUBDEV_G_ROUTING
> > > +
> > > +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_ROUTING, struct v4l2_subdev_routing *argp )
> > > +    :name: VIDIOC_SUBDEV_S_ROUTING
> > > +
> > > +
> > > +Arguments
> > > +=========
> > > +
> > > +``fd``
> > > +    File descriptor returned by :ref:`open() <func-open>`.
> > > +
> > > +``argp``
> > > +    Pointer to struct :c:type:`v4l2_subdev_routing`.
> > > +
> > > +
> > > +Description
> > > +===========
> > > +
> > > +These ioctls are used to get and set the routing in a media entity.
> > > +The routing configuration determines the flows of data inside an entity.
> > > +
> > > +Drivers report their current routing tables using the
> > > +``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> > > +with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> > > +setting or clearing flags of the  ``flags`` field of a
> > > +struct :c:type:`v4l2_subdev_route`.
> > 
> > How about adding:
> > 
> > Routes that have V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag cannot be removed.
> > Depending on the driver, their V4L2_SUBDEV_ROUTE_FL_ACTIVE flag may be set
> > or reset.
> 
> I have dropped the IMMUTABLE flag in my WIP branch, as I couldn't figure out
> a use for it. The only immutable routes are source routes, which are already
> special and there's no need for an extra flag.

The two flags still mean different things... but let's continue the
discussion later in the message.

> 
> > Also see a comment later on.
> > 
> > > +
> > > +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> > > +means that the userspace mut reconfigure all streams after calling the ioctl
> > > +with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > 
> > How about this:
> > 
> > Calling ``VIDIOC_SUBDEV_S_ROUTING`` will cause the selections and subdev
> > formats being propagated from the sink pads towards the sources.
> 
> Hmm, but that's not true. The selections and formats will be zeroed, unless
> the driver initializes them to a value. There's no propagation done.

They need to be propagated. The driver is responsible for maintaining a
valid configuration for the processing steps in a sub-device, and with
routes that must apply to routes as well.

> 
> > > +
> > > +A special case for routing are routes marked with
> > > +``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
> > > +source endpoints on sensors and the sink fields are unused.
> > > +
> > > +When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
> > > +provided ``num_routes`` is not big enough to contain all the available routes
> > > +the subdevice exposes, drivers return the ENOSPC error code and adjust the
> > > +value of the ``num_routes`` field. Application should then reserve enough memory
> > > +for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
> > > +
> > > +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > > +
> > > +.. c:type:: v4l2_subdev_routing
> > > +
> > > +.. flat-table:: struct v4l2_subdev_routing
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - __u32
> > > +      - ``which``
> > > +      - Format to modified, from enum
> > > +        :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> > > +    * - struct :c:type:`v4l2_subdev_route`
> > > +      - ``routes[]``
> > > +      - Array of struct :c:type:`v4l2_subdev_route` entries
> > > +    * - __u32
> > > +      - ``num_routes``
> > > +      - Number of entries of the routes array
> > > +    * - __u32
> > > +      - ``reserved``\ [5]
> > > +      - Reserved for future extensions. Applications and drivers must set
> > > +	the array to zero.
> > > +
> > > +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > > +
> > > +.. c:type:: v4l2_subdev_route
> > > +
> > > +.. flat-table:: struct v4l2_subdev_route
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - __u32
> > > +      - ``sink_pad``
> > > +      - Sink pad number.
> > > +    * - __u32
> > > +      - ``sink_stream``
> > > +      - Sink pad stream number.
> > > +    * - __u32
> > > +      - ``source_pad``
> > > +      - Source pad number.
> > > +    * - __u32
> > > +      - ``source_stream``
> > > +      - Source pad stream number.
> > > +    * - __u32
> > > +      - ``flags``
> > > +      - Route enable/disable flags
> > > +	:ref:`v4l2_subdev_routing_flags <v4l2-subdev-routing-flags>`.
> > > +    * - __u32
> > > +      - ``reserved``\ [5]
> > > +      - Reserved for future extensions. Applications and drivers must set
> > > +	the array to zero.
> > > +
> > > +.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
> > > +
> > > +.. _v4l2-subdev-routing-flags:
> > > +
> > > +.. flat-table:: enum v4l2_subdev_routing_flags
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       3 1 4
> > > +
> > > +    * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > +      - 0
> > > +      - The route is enabled. Set by applications.
> > > +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > 
> > How about calling this STATIC instead of IMMUTABLE? IMMUTABLE is used as a
> > link flag to mean a link that may not be changed in any way. In this case
> > we rather want to say that the route is always there, albeit you can still
> > enable or disable it.
> 
> If we think there's a need for this, I can add it back and name it static. I
> think what it then should mean is that the user can enable/disable it and
> also set the stream id, but the route must always exist.

But the static routes are recognised by the stream ID only, aren't they?

I think we'll definitely need a way to determine which routes are always
there and which ones can be removed at will.

> 
> But as I said above, I haven't figured out a use for this.
> 
> > > +      - 1
> > > +      - The route is immutable. Set by the driver.
> > > +    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
> > > +      - 2
> > > +      - The route is a source route, and the ``sink_pad`` and ``sink_stream``
> > > +        fields are unused. Set by the driver.
> > > +
> > > +Return Value
> > > +============
> > > +
> > > +On success 0 is returned, on error -1 and the ``errno`` variable is set
> > > +appropriately. The generic error codes are described at the
> > > +:ref:`Generic Error Codes <gen-errors>` chapter.
> > > +
> > > +ENOSPC
> > > +   The number of provided route entries is less than the available ones.
> > 
> > What does "available ones" mean in this context? More than is supported?
> > Wouldn't E2BIG be the appropriate code in that case?
> 
> Good question. I don't think I wrote this part =). ENOSPC refers to the case
> where VIDIOC_SUBDEV_G_ROUTING is called without enough space for the routing
> table. So "available ones" mean the routes in the subdev's routing table,
> and "provided route entries" refers to the userspace target routing table.
> 
> It sounds pretty odd, and obviously needs a clarification.

I think I actually can think what this did mean. It means that the
num_routes is smaller than the number of routes in a routing table when
G_ROUTING is called. For that I think ENOSPC is the right code actually.

But also I think we need to document what happens when there are too many
routes. For that E2BIG would be appropriate.

Should we have a field for telling which route was the bad one, if it was
one of them? That can be done later, too, if we'll ever need it.

-- 
Terveisin,

Sakari Ailus
