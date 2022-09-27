Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2AEB5EBA41
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 07:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiI0F7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 01:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiI0F7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 01:59:23 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69374A61FD
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 22:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664258360; x=1695794360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VNVKcxReIVYZJ+tTBDMSslXU43zcPAgTji5Dxmamd1A=;
  b=nxCvJv/4abEiZc+NjCTNOnwzqXVdqx8NnvMK8dVibDJjjsergGWFy92r
   nrRN9r4rO/gH/troqF/ss5J9//KJI+dbnt/gKtimOvWhEiPlpq1xNwI0G
   fRVhapuEAllu9gxBucbbzCgbv63M34IxS+FS86EwAkwv8R/7s5S6CIQFo
   hcPsEeHR7cy87J7ZBNVlqkCwl9MpPQOSVZIQBIEzDM3TG2fPw5TsEFtr7
   6X5Hq3/TnYD4n6sdE1T+mmVrTNQ0Y+cNLIARBH8FWhnrLSWewmijBjXtC
   TjtXhpiQFqv6CySEvcOHc9uZXmUhZbU9UMW8Z1KcrgyNr5ie6KO6h9Vyu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284356196"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="284356196"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:59:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725379838"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="725379838"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:59:17 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E446D20077;
        Tue, 27 Sep 2022 08:59:14 +0300 (EEST)
Date:   Tue, 27 Sep 2022 05:59:14 +0000
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
Message-ID: <YzKRMiumNoskMuxw@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Aug 31, 2022 at 05:13:42PM +0300, Tomi Valkeinen wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
> description of multiplexed media pads and internal routing to the
> V4L2-subdev documentation section.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../media/v4l/vidioc-subdev-g-routing.rst     | 150 ++++++++++++++++++
>  3 files changed, 153 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index fd1de0a73a9f..a67c2749089a 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -29,6 +29,8 @@ will feature a character device node on which ioctls can be called to
>  
>  -  negotiate image formats on individual pads
>  
> +-  inspect and modify internal data routing between pads of the same entity
> +
>  Sub-device character device nodes, conventionally named
>  ``/dev/v4l-subdev*``, use major number 81.
>  
> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
> index 53e604bd7d60..228c1521f190 100644
> --- a/Documentation/userspace-api/media/v4l/user-func.rst
> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
> @@ -70,6 +70,7 @@ Function Reference
>      vidioc-subdev-g-crop
>      vidioc-subdev-g-fmt
>      vidioc-subdev-g-frame-interval
> +    vidioc-subdev-g-routing
>      vidioc-subdev-g-selection
>      vidioc-subdev-querycap
>      vidioc-subscribe-event
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> new file mode 100644
> index 000000000000..a0d9c79e162f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -0,0 +1,150 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +.. c:namespace:: V4L
> +
> +.. _VIDIOC_SUBDEV_G_ROUTING:
> +
> +******************************************************
> +ioctl VIDIOC_SUBDEV_G_ROUTING, VIDIOC_SUBDEV_S_ROUTING
> +******************************************************
> +
> +Name
> +====
> +
> +VIDIOC_SUBDEV_G_ROUTING - VIDIOC_SUBDEV_S_ROUTING - Get or set routing between streams of media pads in a media entity.
> +
> +
> +Synopsis
> +========
> +
> +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_ROUTING, struct v4l2_subdev_routing *argp )
> +    :name: VIDIOC_SUBDEV_G_ROUTING
> +
> +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_ROUTING, struct v4l2_subdev_routing *argp )
> +    :name: VIDIOC_SUBDEV_S_ROUTING
> +
> +
> +Arguments
> +=========
> +
> +``fd``
> +    File descriptor returned by :ref:`open() <func-open>`.
> +
> +``argp``
> +    Pointer to struct :c:type:`v4l2_subdev_routing`.
> +
> +
> +Description
> +===========
> +
> +These ioctls are used to get and set the routing in a media entity.
> +The routing configuration determines the flows of data inside an entity.
> +
> +Drivers report their current routing tables using the
> +``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> +with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> +setting or clearing flags of the  ``flags`` field of a
> +struct :c:type:`v4l2_subdev_route`.

How about adding:

Routes that have V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag cannot be removed.
Depending on the driver, their V4L2_SUBDEV_ROUTE_FL_ACTIVE flag may be set
or reset.

Also see a comment later on.

> +
> +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> +means that the userspace mut reconfigure all streams after calling the ioctl
> +with e.g. ``VIDIOC_SUBDEV_S_FMT``.

How about this:

Calling ``VIDIOC_SUBDEV_S_ROUTING`` will cause the selections and subdev
formats being propagated from the sink pads towards the sources.

> +
> +A special case for routing are routes marked with
> +``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
> +source endpoints on sensors and the sink fields are unused.
> +
> +When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
> +provided ``num_routes`` is not big enough to contain all the available routes
> +the subdevice exposes, drivers return the ENOSPC error code and adjust the
> +value of the ``num_routes`` field. Application should then reserve enough memory
> +for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
> +
> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> +
> +.. c:type:: v4l2_subdev_routing
> +
> +.. flat-table:: struct v4l2_subdev_routing
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``which``
> +      - Format to modified, from enum
> +        :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> +    * - struct :c:type:`v4l2_subdev_route`
> +      - ``routes[]``
> +      - Array of struct :c:type:`v4l2_subdev_route` entries
> +    * - __u32
> +      - ``num_routes``
> +      - Number of entries of the routes array
> +    * - __u32
> +      - ``reserved``\ [5]
> +      - Reserved for future extensions. Applications and drivers must set
> +	the array to zero.
> +
> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> +
> +.. c:type:: v4l2_subdev_route
> +
> +.. flat-table:: struct v4l2_subdev_route
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``sink_pad``
> +      - Sink pad number.
> +    * - __u32
> +      - ``sink_stream``
> +      - Sink pad stream number.
> +    * - __u32
> +      - ``source_pad``
> +      - Source pad number.
> +    * - __u32
> +      - ``source_stream``
> +      - Source pad stream number.
> +    * - __u32
> +      - ``flags``
> +      - Route enable/disable flags
> +	:ref:`v4l2_subdev_routing_flags <v4l2-subdev-routing-flags>`.
> +    * - __u32
> +      - ``reserved``\ [5]
> +      - Reserved for future extensions. Applications and drivers must set
> +	the array to zero.
> +
> +.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
> +
> +.. _v4l2-subdev-routing-flags:
> +
> +.. flat-table:: enum v4l2_subdev_routing_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - 0
> +      - The route is enabled. Set by applications.
> +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE

How about calling this STATIC instead of IMMUTABLE? IMMUTABLE is used as a
link flag to mean a link that may not be changed in any way. In this case
we rather want to say that the route is always there, albeit you can still
enable or disable it.

> +      - 1
> +      - The route is immutable. Set by the driver.
> +    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
> +      - 2
> +      - The route is a source route, and the ``sink_pad`` and ``sink_stream``
> +        fields are unused. Set by the driver.
> +
> +Return Value
> +============
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +ENOSPC
> +   The number of provided route entries is less than the available ones.

What does "available ones" mean in this context? More than is supported?
Wouldn't E2BIG be the appropriate code in that case?

> +
> +EINVAL
> +   The sink or source pad identifiers reference a non-existing pad, or reference
> +   pads of different types (ie. the sink_pad identifiers refers to a source pad)
> +   or the sink or source stream identifiers reference a non-existing stream on
> +   the sink or source pad.

-- 
Ystävällisin terveisin,

Sakari Ailus
