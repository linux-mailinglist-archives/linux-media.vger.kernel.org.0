Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF44015BF7D
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 14:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbgBMNgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 08:36:40 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52781 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729588AbgBMNgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 08:36:39 -0500
Received: from [IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382]
 ([IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2EfSjF2NwP9a92EfTj83hc; Thu, 13 Feb 2020 14:36:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581600997; bh=LtGyJ7CDiFEWDWcam9XK4QYsQkwxQvCEMWSHGajydaU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fj3goOqQw/e3qSsPhkHcKCwP/Z9DuG7pXVkL0loZPstEul9LEYYglTPu8JS/VqKcP
         EwHEwkjPF6WzEEdbYjF1Wjq20NqzMp1+UISqQJgpEFocOdQxsxpllI55oLH0sL1PX/
         TJ6icl6xtVRHXNuB3Ems7W30hPcnSkjiC9dha/LFdl/hxfehV6O/Pu8qkAonladjI2
         UrKZACDlpfsVladbOUaWAbcqJED/V51gVtJcF4y0JkbRlLF82B9yth7PPPdtf3WRWp
         CiyASqgUBybHIYdiUKJCQ3kMdo8Uf4kvieJ8GEqRgvQrTW+PduG3ACLU9WYPUvmHIj
         IOpFF82xfxuDA==
Subject: Re: [PATCH v3 19/31] media: Documentation: Add GS_ROUTING
 documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190305185150.20776-1-jacopo+renesas@jmondi.org>
 <20190305185150.20776-20-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fbbd44a8-5d7e-db36-d620-44b6c80b77c1@xs4all.nl>
Date:   Thu, 13 Feb 2020 14:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20190305185150.20776-20-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPxJ2hqgWXVQ4001wFpdTVrC4NeaBndkV5EOGls62GgbkpBdxnl345ZIr4XjuGKo0p5AUmosuTNVTAY4oG712oyNnuSmcChPDHOI9vpdqwKyupq7p8cb
 1h9g2MTaJHRpcKM8ohYCmQ+c5QiwAB1D9gWNx9eCuw1BHsD1Tzezqf9Qyu409qWymUhUu0uQlaG5qmj5jdiwOhhGFOio8EASFv0+C5qEkrOKby28VEusUGMF
 9QFFCyxJg2KMR2fSpyxm7Ze+0Bs6wriv5bSZSV1WwqKmbI20Kc7+bFBGE/p0RRCs83SbEkPmNagTLlbBqM4iMIsyx0+IqJKimhesO3QDc0UXd7upWaa+2Bdg
 sx6WHKOuA/9mgqxkz7N+Mad21pzxcEYpLvWSonF6Be7jhizKbr+RjQ9AtLxgTxyz8gTp1ENAzyx25O533uP34g2U5B7Gj+Bg5srJtUz0c8FgXlmCiandvaQK
 nDNvbJ0FSu/kntVy2UZHBXBr8HQmrm9YF58cag==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent asked me to review the approach taken in this series since he wants
to restart this.

I'm not reviewing the code: it's old by now, and it is really the uAPI that is
of interest, so I am concentrating on this patch that documents this feature.

On 3/5/19 7:51 PM, Jacopo Mondi wrote:
> Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
> description of multiplexed media pads and internal routing to the
> V4L2-subdev documentation section.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/media/uapi/v4l/dev-subdev.rst   |  90 +++++++++++
>  Documentation/media/uapi/v4l/user-func.rst    |   1 +
>  .../uapi/v4l/vidioc-subdev-g-routing.rst      | 142 ++++++++++++++++++
>  3 files changed, 233 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/vidioc-subdev-g-routing.rst
> 
> diff --git a/Documentation/media/uapi/v4l/dev-subdev.rst b/Documentation/media/uapi/v4l/dev-subdev.rst
> index 2c2768c7343b..b9fbb5d2caec 100644
> --- a/Documentation/media/uapi/v4l/dev-subdev.rst
> +++ b/Documentation/media/uapi/v4l/dev-subdev.rst
> @@ -36,6 +36,8 @@ will feature a character device node on which ioctls can be called to
>  
>  -  negotiate image formats on individual pads
>  
> +-  inspect and modify internal data routing between pads of the same entity
> +
>  Sub-device character device nodes, conventionally named
>  ``/dev/v4l-subdev*``, use major number 81.
>  
> @@ -461,3 +463,91 @@ source pads.
>      :maxdepth: 1
>  
>      subdev-formats
> +
> +
> +Multiplexed media pads and internal routing
> +-------------------------------------------
> +
> +Subdevice drivers might expose the internal connections between media pads of an
> +entity by providing a routing table that applications can inspect and manipulate
> +to change the internal routing between sink and source pads' data connection
> +endpoints. A routing table is described by a struct
> +:c:type:`v4l2_subdev_routing`, which contains ``num_routes`` route entries, each
> +one represented by a struct :c:type:`v4l2_subdev_route`.
> +
> +Data routes do not just connect one pad to another in an entity, but they refer
> +instead to the ``streams`` a media pad provides. Streams are data connection
> +endpoints in a media pad. Multiplexed media pads expose multiple ``streams``
> +which represent, when the underlying hardware technology allows that, logical
> +data streams transported over a single physical media bus.
> +
> +One of the most notable examples of logical stream multiplexing techniques is
> +represented by the data interleaving mechanism implemented by mean of Virtual
> +Channels identifiers as defined by the MIPI CSI-2 media bus specifications. A
> +subdevice that implements support for Virtual Channel data interleaving might
> +expose up to 4 data ``streams``, one for each available Virtual Channel, on the
> +source media pad that represents a CSI-2 connection endpoint.
> +
> +Routes are defined as potential data connections between a ``(sink_pad,
> +sink_stream)`` pair and a ``(source_pad, source_stream)`` one, where
> +``sink_pad`` and ``source_pad`` are the indexes of two media pads part of the
> +same media entity, and ``sink_stream`` and ``source_stream`` are the identifiers
> +of the data streams to be connected in the media pads. Media pads that do not
> +support data multiplexing expose a single stream, usually with identifier 0.

Why usually? Is there any reason why it can be non-0?

Existing entities do not support routes. Will the new G/S_ROUTING ioctls
fail on those? How does userspace detect that an entity support routing?
I advice adding an entity flag or something similar.

If you have a pad that supports multiplexing, what is then the mediabus
format of that pad? Can each stream have a different mediabus format? If so,
how to you discover that? This really needs to be clarified and documented.

I assume both sink and source pads can be multiplexed, so you can have an
entity with two non-multiplexed sink pads that both route to the same
multiplexed source pad, or vice versa.

Can a single (sink pad, sink stream) be routed to two different source pads?

Can all routes be disabled?

> +
> +Routes are reported to applications in a routing table which can be
> +inspected and manipulated using the :ref:`routing <VIDIOC_SUBDEV_G_ROUTING>`
> +ioctls.
> +
> +Routes can be activated and deactivated by setting or clearing the
> +V4L2_SUBDEV_ROUTE_FL_ACTIVE flag in the ``flags`` field of struct
> +:c:type:`v4l2_subdev_route`.
> +
> +Subdev driver might create routes that cannot be modified by applications. Such
> +routes are identified by the presence of the V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> +flag in the ``flags`` field of struct :c:type:`v4l2_subdev_route`.
> +
> +As an example, the routing table of a source pad which supports two logical
> +video streams and can be connected to two sink pads is here below described.
> +
> +.. flat-table::
> +    :widths:       1 2 1
> +
> +    * - Pad Index
> +      - Function
> +      - Number of streams
> +    * - 0
> +      - SINK
> +      - 1
> +    * - 1
> +      - SINK
> +      - 1
> +    * - 2
> +      - SOURCE
> +      - 2
> +
> +In such an example, the source media pad will report a routing table with 4
> +entries, one entry for each possible ``(sink_pad, sink_stream) - (source_pad,
> +source_stream)`` combination.
> +
> +.. flat-table:: routing table
> +    :widths:       2 1 2
> +
> +    * - Sink Pad/Sink Stream
> +      - ->
> +      - Source Pad/Source Stream
> +    * - 0/0
> +      - ->
> +      - 2/0
> +    * - 0/0
> +      - ->
> +      - 2/1
> +    * - 1/0
> +      - ->
> +      - 2/0
> +    * - 1/0
> +      - ->
> +      - 2/1
> +
> +Subdev drivers are free to decide how many routes an application can enable on
> +a media pad at the same time, and refuse to enable or disable specific routes.
> diff --git a/Documentation/media/uapi/v4l/user-func.rst b/Documentation/media/uapi/v4l/user-func.rst
> index ca0ef21d77fe..0166446f4ab4 100644
> --- a/Documentation/media/uapi/v4l/user-func.rst
> +++ b/Documentation/media/uapi/v4l/user-func.rst
> @@ -77,6 +77,7 @@ Function Reference
>      vidioc-subdev-g-crop
>      vidioc-subdev-g-fmt
>      vidioc-subdev-g-frame-interval
> +    vidioc-subdev-g-routing
>      vidioc-subdev-g-selection
>      vidioc-subscribe-event
>      func-mmap
> diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-routing.rst b/Documentation/media/uapi/v4l/vidioc-subdev-g-routing.rst
> new file mode 100644
> index 000000000000..8b592722c477
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/vidioc-subdev-g-routing.rst
> @@ -0,0 +1,142 @@
> +.. Permission is granted to copy, distribute and/or modify this
> +.. document under the terms of the GNU Free Documentation License,
> +.. Version 1.1 or any later version published by the Free Software
> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> +.. and no Back-Cover Texts. A copy of the license is included at
> +.. Documentation/media/uapi/fdl-appendix.rst.
> +..
> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
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
> +These ioctls are used to get and set the routing informations associated to
> +media pads in a media entity. Routing informations are used to enable or disable
> +data connections between stream endpoints of multiplexed media pads.
> +
> +Drivers report their routing tables using VIDIOC_SUBDEV_G_ROUTING and
> +application use the information there reported to enable or disable data
> +connections between streams in a pad, by setting or clearing the
> +V4L2_SUBDEV_ROUTE_FL_ACTIVE flag of ``flags`` field of a struct
> +:c:type:`v4l2_subdev_route`.
> +
> +When inspecting routes through VIDIOC_SUBDEV_G_ROUTING and the application
> +provided ``num_routes`` is not big enough to contain all the available routes
> +the subdevice exposes, drivers return the ENOSPC error code and adjust the
> +``num_routes`` value. Application should then reserve enough memory for all the
> +route entries and call VIDIOC_SUBDEV_G_ROUTING again.
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

I'm wondering why this is done through a subdevice ioctl. Should this be done
through media controller ioctls? You are changing the topology, and if you want
to do that atomically through e.g. a future S_TOPOLOGY ioctl, then the routing
information inside an entity should be part of the topology. In fact, if multiple
sensors have their video streams combined into a multiplexed stream over CSI, and
then the streams are demultiplexed for post-processing, don't you have to be able
to follow the complete route the video takes anyway via the media topology?

It feels to me that you need MEDIA_IOC_ENUM_ROUTES and MEDIA_IOC_SETUP_ROUTE(S)
functions and integrate it into G_TOPOLOGY as well. Also, this isn't V4L2 specific,
it's a general routing issue that is much better handled by the media controller.
Especially since the routing support is added to the MC in the first half of this
series.

Regards,

	Hans

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
> +      - Sink pad number
> +    * - __u32
> +      - ``sink_stream``
> +      - Sink pad stream number
> +    * - __u32
> +      - ``source_stream``
> +      - Source pad stream number
> +    * - __u32
> +      - ``sink_stream``
> +      - Sink pad stream number
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
> +   The sink or source pad identifiers reference a non-existing pad, or refernce
> +   pads of different types (ie. the sink_pad identifiers refers to a source pad)
> +   The sink or source stream identifiers reference a non-existing stream
> +   in the sink or source pad.
> +
> 

