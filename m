Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC9142A7B9
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237250AbhJLO6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237062AbhJLO6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:58:46 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A317EC061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:56:44 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJCpmsbzsx7rIaJCsmMQ7t; Tue, 12 Oct 2021 16:56:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634050603; bh=zdW8OyGFEVGwtvp8870Q6y4yMaGKOt+ghyGSV6YlBuM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mw75zMH9eHNftO3kyryH6Ddcby6P3gt5BfIYM4y3pVQFsKb5ByUNgA+A35T2dCFpZ
         xyN2IKYWqbLxvTkIyZL7MYK+QW6+dJ8tu1o6sZ08IYFgmiebQbGc4U0HGGlJEXSUmy
         kpgQNt4I8Q4H0VdM1tTSKHzRWUzm385//bgnWrYTlLvYKcU5NbuXZai700TxCZXZbw
         hCZejawuQxyPO/AvexZTPFrPAjNFjJGpMEJr7jCjnKLutB34qPvOmwr7qf1Xwi4b3m
         YxSZlUVhjS86aVbeWOq1Jtppe4DaNm7n2alIhv4oN6qSe7smGFj8DYf9NikUZ1Lb/D
         Wzz92BUDd4lfA==
Subject: Re: [PATCH v9 26/36] media: Documentation: Add GS_ROUTING
 documentation
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-27-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <86247508-1381-1ba9-74fa-eb840dd0e817@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-27-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDsBzR4/SsKpII6h2oZavNZkbeEGBOlANMmRUlFQ+52u9oMBmrjWYAQLb8mg4bpM7Z3ycArlGmsk8jprmr1vjKYB83GWY6nbcaLTXs11JpZsNuZDvYsj
 svNkXOi79TtkE23U4tUr7ymqcFuCYHc9Qe3IsVj8RmtUUe+ZWyxQB3hhra6WyzTA0k4PDh24EDyqXV+eOPaA74+Vguno2fHJrRi8rDwYwREtAX4QjLwKp3Ae
 f41cyXYBw1S7ZsUE+/GHeQ6UCCdhs/W1J9AZqEdRE1rwNURUwsGo7q6lBwbpKVdO6UBTZox05do7IqafGjgB7EY682J9Yq3Yzu1EcqWr/hkXHfVJ+HRrQ1cP
 XqRDsS7ztA2/p71Wp4meCe+2yCRG6C8E+jSGb1Xxq2//ykTcrBDZdThUPFeVawZ76xMUhfRSE6SBbG7C5fcSiji7/3MGNRujtatMazHmqs+goXasBOw1xXZY
 nA1Zr0K4TMnbvyv2GH4IqIgOIHl8A+UGVU/u3w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
> description of multiplexed media pads and internal routing to the
> V4L2-subdev documentation section.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../media/v4l/vidioc-subdev-g-routing.rst     | 146 ++++++++++++++++++
>  3 files changed, 149 insertions(+)
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
> index 000000000000..41f4873c49f7
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -0,0 +1,146 @@
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
> +with the VIDIOC_SUBDEV_S_ROUTING ioctl, by adding or removing routes and setting
> +or clearing the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of the  ``flags`` field of
> +a struct :c:type:`v4l2_subdev_route`.
> +
> +A special case for routing are routes marked with
> +``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
> +source endpoints on sensors and the sink fields are unused.
> +
> +When inspecting routes through VIDIOC_SUBDEV_G_ROUTING and the application
> +provided ``num_routes`` is not big enough to contain all the available routes
> +the subdevice exposes, drivers return the ENOSPC error code and adjust the
> +value of the ``num_routes`` field. Application should then reserve enough memory
> +for all the route entries and call VIDIOC_SUBDEV_G_ROUTING again.
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
> +
> +EINVAL
> +   The sink or source pad identifiers reference a non-existing pad, or reference
> +   pads of different types (ie. the sink_pad identifiers refers to a source pad)
> +   or the sink or source stream identifiers reference a non-existing stream on
> +   the sink or source pad.
> 

