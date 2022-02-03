Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23FF4A82C8
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 11:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243664AbiBCK6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 05:58:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbiBCK6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 05:58:20 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A47E49C;
        Thu,  3 Feb 2022 11:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643885899;
        bh=Z3vR3+/Y6JTlkKM5aGeHqGOpTr5BBjKoj1QI6EkE04E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NxyVcinddCqIZQgthhsRoKcMmjDW7CIJ5jPeKp/1wSOp1mBRT6UHhs0o+FQ24Vnfy
         krKe3NlbXwBMCJMuTnCxorZ9VUolN2lkKsSXPTARP7wjhURJI+W8UthP1mkkJAlJ9I
         YZxB8nCqTJ44E3pIU3MgSz4JNZJdtjLn/XcEDR7w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <164388570519.655634.6829425640508111816@Monstersaurus>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com> <20211130141536.891878-28-tomi.valkeinen@ideasonboard.com> <164388570519.655634.6829425640508111816@Monstersaurus>
Subject: Re: [PATCH v10 27/38] media: Documentation: Add GS_ROUTING documentation
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com
Date:   Thu, 03 Feb 2022 10:58:16 +0000
Message-ID: <164388589666.655634.10376247622401456036@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Kieran Bingham (2022-02-03 10:55:05)
> Quoting Tomi Valkeinen (2021-11-30 14:15:25)
> > From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >=20
> > Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
> > description of multiplexed media pads and internal routing to the
> > V4L2-subdev documentation section.
> >=20
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> >  .../userspace-api/media/v4l/user-func.rst     |   1 +
> >  .../media/v4l/vidioc-subdev-g-routing.rst     | 150 ++++++++++++++++++
> >  3 files changed, 153 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev=
-g-routing.rst
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Doc=
umentation/userspace-api/media/v4l/dev-subdev.rst
> > index fd1de0a73a9f..a67c2749089a 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -29,6 +29,8 @@ will feature a character device node on which ioctls =
can be called to
> > =20
> >  -  negotiate image formats on individual pads
> > =20
> > +-  inspect and modify internal data routing between pads of the same e=
ntity
> > +
> >  Sub-device character device nodes, conventionally named
> >  ``/dev/v4l-subdev*``, use major number 81.
> > =20
> > diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Docu=
mentation/userspace-api/media/v4l/user-func.rst
> > index 53e604bd7d60..228c1521f190 100644
> > --- a/Documentation/userspace-api/media/v4l/user-func.rst
> > +++ b/Documentation/userspace-api/media/v4l/user-func.rst
> > @@ -70,6 +70,7 @@ Function Reference
> >      vidioc-subdev-g-crop
> >      vidioc-subdev-g-fmt
> >      vidioc-subdev-g-frame-interval
> > +    vidioc-subdev-g-routing
> >      vidioc-subdev-g-selection
> >      vidioc-subdev-querycap
> >      vidioc-subscribe-event
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-rout=
ing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > new file mode 100644
> > index 000000000000..a0d9c79e162f
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -0,0 +1,150 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +.. c:namespace:: V4L
> > +
> > +.. _VIDIOC_SUBDEV_G_ROUTING:
> > +
> > +******************************************************
> > +ioctl VIDIOC_SUBDEV_G_ROUTING, VIDIOC_SUBDEV_S_ROUTING
> > +******************************************************
> > +
> > +Name
> > +=3D=3D=3D=3D
> > +
> > +VIDIOC_SUBDEV_G_ROUTING - VIDIOC_SUBDEV_S_ROUTING - Get or set routing=
 between streams of media pads in a media entity.
> > +
> > +
> > +Synopsis
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_ROUTING, struct v4l=
2_subdev_routing *argp )
> > +    :name: VIDIOC_SUBDEV_G_ROUTING
> > +
> > +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_ROUTING, struct v4l=
2_subdev_routing *argp )
> > +    :name: VIDIOC_SUBDEV_S_ROUTING
> > +
> > +
> > +Arguments
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``fd``
> > +    File descriptor returned by :ref:`open() <func-open>`.
> > +
> > +``argp``
> > +    Pointer to struct :c:type:`v4l2_subdev_routing`.
> > +
> > +
> > +Description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +These ioctls are used to get and set the routing in a media entity.
> > +The routing configuration determines the flows of data inside an entit=
y.
> > +
> > +Drivers report their current routing tables using the
> > +``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disabl=
e routes
> > +with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing rout=
es and
> > +setting or clearing flags of the  ``flags`` field of a
> > +struct :c:type:`v4l2_subdev_route`.
> > +
> > +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` i=
s called. This
> > +means that the userspace mut reconfigure all streams after calling the=
 ioctl
>=20
> s/mut/must/
>=20
> > +with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > +
> > +A special case for routing are routes marked with
> > +``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
> > +source endpoints on sensors and the sink fields are unused.
> > +
> > +When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the app=
lication
> > +provided ``num_routes`` is not big enough to contain all the available=
 routes
> > +the subdevice exposes, drivers return the ENOSPC error code and adjust=
 the
> > +value of the ``num_routes`` field. Application should then reserve eno=
ugh memory
> > +for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
> > +
> > +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > +
> > +.. c:type:: v4l2_subdev_routing
> > +
> > +.. flat-table:: struct v4l2_subdev_routing
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u32
> > +      - ``which``
> > +      - Format to modified, from enum
> > +        :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> > +    * - struct :c:type:`v4l2_subdev_route`
> > +      - ``routes[]``
> > +      - Array of struct :c:type:`v4l2_subdev_route` entries
> > +    * - __u32
> > +      - ``num_routes``
> > +      - Number of entries of the routes array
> > +    * - __u32
> > +      - ``reserved``\ [5]
> > +      - Reserved for future extensions. Applications and drivers must =
set
> > +       the array to zero.
> > +
> > +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > +
> > +.. c:type:: v4l2_subdev_route
> > +
> > +.. flat-table:: struct v4l2_subdev_route
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u32
> > +      - ``sink_pad``
> > +      - Sink pad number.
> > +    * - __u32
> > +      - ``sink_stream``
> > +      - Sink pad stream number.
> > +    * - __u32
> > +      - ``source_pad``
> > +      - Source pad number.
> > +    * - __u32
> > +      - ``source_stream``
> > +      - Source pad stream number.
> > +    * - __u32
> > +      - ``flags``
> > +      - Route enable/disable flags
> > +       :ref:`v4l2_subdev_routing_flags <v4l2-subdev-routing-flags>`.
> > +    * - __u32
> > +      - ``reserved``\ [5]
> > +      - Reserved for future extensions. Applications and drivers must =
set
> > +       the array to zero.
> > +
> > +.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
> > +
> > +.. _v4l2-subdev-routing-flags:
> > +
> > +.. flat-table:: enum v4l2_subdev_routing_flags
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       3 1 4
> > +
> > +    * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - 0
> > +      - The route is enabled. Set by applications.
> > +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > +      - 1
> > +      - The route is immutable. Set by the driver.
> > +    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
> > +      - 2
> > +      - The route is a source route, and the ``sink_pad`` and ``sink_s=
tream``
> > +        fields are unused. Set by the driver.
> > +
> > +Return Value
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +On success 0 is returned, on error -1 and the ``errno`` variable is set
> > +appropriately. The generic error codes are described at the
> > +:ref:`Generic Error Codes <gen-errors>` chapter.
> > +
> > +ENOSPC
> > +   The number of provided route entries is less than the available one=
s.
>=20
> This doesn't sound right. Maybe:
>=20
> "The number of route entries provided is less than the available
> routes on the device."
>=20
> But presumably this would be opposites for G_ROUTING and S_ROUTING,
> where on G_ROUTING the userspace must provide at least as many route
> entries as the driver/device has, and on S_ROUTING, they must provide
> not more than?

Aha, now I see in the next patch that it only really applies to the
G_ROUTING.

But it might be worth noting that if -ENOSPC is returned, num_routes is
set to the number of routes required by the kernel.

--
Kieran


>=20
>=20
>=20
> > +
> > +EINVAL
> > +   The sink or source pad identifiers reference a non-existing pad, or=
 reference
> > +   pads of different types (ie. the sink_pad identifiers refers to a s=
ource pad)
> > +   or the sink or source stream identifiers reference a non-existing s=
tream on
> > +   the sink or source pad.
> > --=20
> > 2.25.1
> >
