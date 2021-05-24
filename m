Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EBD38E45F
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbhEXKqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbhEXKqL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:11 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3101329ED;
        Mon, 24 May 2021 12:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853082;
        bh=e54pkhKGmQwfu3DMdNEArchSeKIv/ab/yCWf0EF8QK0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PDscxyh1+BwJXoBYXW7zqkdfH3jx6MZqQB309GHlVCiO+zdQVKKGrRKfLuvFH3B/Z
         HOfLCaVPPmB2L2vMUfTXTgPmtnoagL9xn9cCvvFNhAzj2a1FWeoORZJpuM3LaK8Ezr
         KyonktWyWYgeJzi0aDJD+MF2uG+RDqbo/vNFoXFs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 18/27] media: Documentation: Add GS_ROUTING documentation
Date:   Mon, 24 May 2021 13:43:59 +0300
Message-Id: <20210524104408.599645-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
description of multiplexed media pads and internal routing to the
V4L2-subdev documentation section.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 128 ++++++++++++++++
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-subdev-g-routing.rst     | 142 ++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index fd1de0a73a9f..2868edb83eee 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -29,6 +29,8 @@ will feature a character device node on which ioctls can be called to
 
 -  negotiate image formats on individual pads
 
+-  inspect and modify internal data routing between pads of the same entity
+
 Sub-device character device nodes, conventionally named
 ``/dev/v4l-subdev*``, use major number 81.
 
@@ -501,3 +503,129 @@ source pads.
     :maxdepth: 1
 
     subdev-formats
+
+
+Multiplexed media pads and internal routing
+-------------------------------------------
+
+Routing Table
+^^^^^^^^^^^^^
+
+Subdevice drivers may expose the internal connections between media pads of an
+entity by exposing a routing table that applications can inspect and manipulate.
+A routing table is described by a struct :c:type:`v4l2_subdev_routing`, which
+contains ``num_routes`` route entries, each one represented by a struct
+:c:type:`v4l2_subdev_route`.
+
+Data routes do not just connect one pad to another in an entity, but they refer
+instead to the ``streams`` a media pad provides. Streams are data connection
+endpoints in a media pad. Multiplexed media pads expose multiple ``streams``
+which represent, when the underlying hardware technology allows that, logical
+data flows transported over a single physical media bus.
+
+A noteworthy example of logical stream multiplexing techniques is represented
+by the data interleaving mechanism implemented by mean of Virtual Channels as
+defined by the MIPI CSI-2 media bus specifications. A subdevice that implements
+support for Virtual Channel data interleaving might expose up to 4 data
+``streams``, one for each available Virtual Channel, on the source media pad
+that represents a CSI-2 connection endpoint.
+
+A route is defined as a connection between a ``(sink_pad, sink_stream)`` pair
+and a ``(source_pad, source_stream)`` pair, where ``sink_pad`` and
+``source_pad`` are the indexes of two media pads part of the same media entity,
+and ``sink_stream`` and ``source_stream`` are the identifiers of the data
+streams to be connected in the media pads. The stream identifiers are arbitrary
+numbers, i.e. they have no relevance to the hardware, but they must be unique on
+a single pad, and the entity on the other side of the link must have a matching
+stream identifier.
+
+The current routes are reported to applications in a routing table which can be
+inspected using the :ref:`routing <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
+
+Routes can be added or removed by adding or removing them to/from the routing
+table. Also, a route in the routing table can be activated and deactivated by
+setting or clearing the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag in the ``flags``
+field of struct :c:type:`v4l2_subdev_route`.
+
+A subdev driver may create routes that cannot be modified by applications. Such
+routes are identified by the presence of the ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
+flag in the ``flags`` field of struct :c:type:`v4l2_subdev_route`. Immutable
+routes are always active.
+
+A special type of a route is a "source route", marked with
+``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. Such routes exists in e.g. sensors as the
+routes' origins are internal to the device. A source route has valid
+``source_pad`` and ``source_stream``, but ``sink_pad`` and ``sink_stream`` are
+not used. The purpose of a source route is to describe the streams.
+
+As an example, a subdevice with two sink pads and one output pad has the pads
+defined as follows:
+
+.. flat-table::
+    :header-rows:  1
+
+    * - Pad Index
+      - Function
+    * - 0
+      - SINK
+    * - 1
+      - SINK
+    * - 2
+      - SOURCE
+
+A case where the subdevice would receive a single stream via each sink pad, and
+combine them to the source pad would result in a routing table as follows:
+
+.. flat-table:: routing table
+    :header-rows:  1
+
+    * - Sink Pad/Sink Stream
+      - Source Pad/Source Stream
+    * - 0/0
+      - 2/0
+    * - 1/0
+      - 2/1
+
+Whereas if the same subdev would receive two streams via each sink pad, and
+output the combined 4 streams would result in a routing table as follows:
+
+.. flat-table:: routing table
+    :header-rows:  1
+
+    * - Sink Pad/Sink Stream
+      - Source Pad/Source Stream
+    * - 0/0
+      - 2/0
+    * - 0/1
+      - 2/1
+    * - 1/0
+      - 2/2
+    * - 1/1
+      - 2/3
+
+Some subdevices may have known set of routes, mutable or immutable, dictated by
+the hardware. An example would be a sensor which produces pixel data and
+metadata via CSI-2 bus. In such a case there can ever be only those two streams.
+
+A subdevice that does not produce the data is another matter. Consider a device
+with two CSI-2 sink pads and two CSI-2 source pads, with the ability to route
+streams freely between the sink and source pads based on HW configuration. Each
+sink pad could receive streams for all four CSI-2 virtual channel. If we only
+consider the virtual channels, we would have maximum number of routes of 8.
+
+But CSI-2 also defines a datatype for each CSI-2 packet, allowing one to send,
+say, pixel data and metadata using the same virtual channel but different
+datatype. Now we would have a maximum number of routes of 16.
+
+Generally speaking, the concept of "stream" is very flexible. As a contrived
+example, you might even consider each line of a pixel frame to be a separate
+stream, if your hardware would support such a thing.
+
+Multiplexed Streams
+^^^^^^^^^^^^^^^^^^^
+
+When a subdevice exposes multiple streams in a single pad (multiplexed streams),
+the subdevice driver needs to have ``V4L2_SUBDEV_FL_MULTIPLEXED`` flag set. This
+flag indicates that the subdev supports the uAPI extensions needed to support
+multiple streams, and the driver must handle the ``stream`` field in the various
+subdev ioctls.
diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 53e604bd7d60..228c1521f190 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -70,6 +70,7 @@ Function Reference
     vidioc-subdev-g-crop
     vidioc-subdev-g-fmt
     vidioc-subdev-g-frame-interval
+    vidioc-subdev-g-routing
     vidioc-subdev-g-selection
     vidioc-subdev-querycap
     vidioc-subscribe-event
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
new file mode 100644
index 000000000000..6d953ee23287
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -0,0 +1,142 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _VIDIOC_SUBDEV_G_ROUTING:
+
+******************************************************
+ioctl VIDIOC_SUBDEV_G_ROUTING, VIDIOC_SUBDEV_S_ROUTING
+******************************************************
+
+Name
+====
+
+VIDIOC_SUBDEV_G_ROUTING - VIDIOC_SUBDEV_S_ROUTING - Get or set routing between streams of media pads in a media entity.
+
+
+Synopsis
+========
+
+.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_ROUTING, struct v4l2_subdev_routing *argp )
+    :name: VIDIOC_SUBDEV_G_ROUTING
+
+.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_ROUTING, struct v4l2_subdev_routing *argp )
+    :name: VIDIOC_SUBDEV_S_ROUTING
+
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :ref:`open() <func-open>`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_subdev_routing`.
+
+
+Description
+===========
+
+These ioctls are used to get and set the routing in a media entity.
+The routing configuration determines the flows of data inside an entity.
+
+Drivers report their current routing tables using the
+``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
+with the VIDIOC_SUBDEV_S_ROUTING ioctl, by adding or removing routes and setting
+or clearing the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of the  ``flags`` field of
+a struct :c:type:`v4l2_subdev_route`.
+
+When inspecting routes through VIDIOC_SUBDEV_G_ROUTING and the application
+provided ``num_routes`` is not big enough to contain all the available routes
+the subdevice exposes, drivers return the ENOSPC error code and adjust the
+value of the ``num_routes`` field. Application should then reserve enough memory
+for all the route entries and call VIDIOC_SUBDEV_G_ROUTING again.
+
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+
+.. c:type:: v4l2_subdev_routing
+
+.. flat-table:: struct v4l2_subdev_routing
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``which``
+      - Format to modified, from enum
+        :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
+    * - struct :c:type:`v4l2_subdev_route`
+      - ``routes[]``
+      - Array of struct :c:type:`v4l2_subdev_route` entries
+    * - __u32
+      - ``num_routes``
+      - Number of entries of the routes array
+    * - __u32
+      - ``reserved``\ [5]
+      - Reserved for future extensions. Applications and drivers must set
+	the array to zero.
+
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+
+.. c:type:: v4l2_subdev_route
+
+.. flat-table:: struct v4l2_subdev_route
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``sink_pad``
+      - Sink pad number.
+    * - __u32
+      - ``sink_stream``
+      - Sink pad stream number.
+    * - __u32
+      - ``source_pad``
+      - Source pad number.
+    * - __u32
+      - ``source_stream``
+      - Source pad stream number.
+    * - __u32
+      - ``flags``
+      - Route enable/disable flags
+	:ref:`v4l2_subdev_routing_flags <v4l2-subdev-routing-flags>`.
+    * - __u32
+      - ``reserved``\ [5]
+      - Reserved for future extensions. Applications and drivers must set
+	the array to zero.
+
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+
+.. _v4l2-subdev-routing-flags:
+
+.. flat-table:: enum v4l2_subdev_routing_flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - 0
+      - The route is enabled. Set by applications.
+    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+      - 1
+      - The route is immutable. Set by the driver.
+    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
+      - 2
+      - The route is a source route, and the ``sink_pad`` and ``sink_stream``
+        fields are unused. Set by the driver.
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+ENOSPC
+   The number of provided route entries is less than the available ones.
+
+EINVAL
+   The sink or source pad identifiers reference a non-existing pad, or reference
+   pads of different types (ie. the sink_pad identifiers refers to a source pad)
+   or the sink or source stream identifiers reference a non-existing stream on
+   the sink or source pad.
-- 
2.25.1

