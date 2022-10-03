Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53A15F301D
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiJCMT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiJCMT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144E63A14E
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:25 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E7DCE35;
        Mon,  3 Oct 2022 14:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799562;
        bh=eHAoj8dpZ+QiMQ2BNDNSnR5wF8Oq8sxHQjxmendQRRE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CD5g5H9t+NIFnx7CptBlEfQZXjlM9FsJHItzK1ve2KME7Om6SOTsz1mmmXIYLRQO0
         JlqmV+ISPAI5qy+z+m1bpe3uFsB82fkq3DR7hswMfc8fC9LNJHG14BEuNMmC6XrTuT
         k4U6Zgq26/CPBIKk2PTDrJGr72qT/up36xrZv59Y=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v15 04/19] media: Documentation: Add GS_ROUTING documentation
Date:   Mon,  3 Oct 2022 15:18:37 +0300
Message-Id: <20221003121852.616745-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
description of multiplexed media pads and internal routing to the
V4L2-subdev documentation section.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-subdev-g-routing.rst     | 155 ++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index fd1de0a73a9f..a67c2749089a 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -29,6 +29,8 @@ will feature a character device node on which ioctls can be called to
 
 -  negotiate image formats on individual pads
 
+-  inspect and modify internal data routing between pads of the same entity
+
 Sub-device character device nodes, conventionally named
 ``/dev/v4l-subdev*``, use major number 81.
 
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
index 000000000000..6d8fc3b11352
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -0,0 +1,155 @@
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
+with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
+setting or clearing flags of the  ``flags`` field of a
+struct :c:type:`v4l2_subdev_route`.
+
+All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
+means that the userspace mut reconfigure all streams after calling the ioctl
+with e.g. ``VIDIOC_SUBDEV_S_FMT``.
+
+A special case for routing are routes marked with
+``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
+source endpoints on sensors and the sink fields are unused.
+
+When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
+provided ``num_routes`` is not big enough to contain all the available routes
+the subdevice exposes, drivers return the ENOSPC error code and adjust the
+value of the ``num_routes`` field. Application should then reserve enough memory
+for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
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
+   The application provided ``num_routes`` is not big enough to contain
+   all the available routes the subdevice exposes.
+
+EINVAL
+   The sink or source pad identifiers reference a non-existing pad, or reference
+   pads of different types (ie. the sink_pad identifiers refers to a source pad)
+   or the sink or source stream identifiers reference a non-existing stream on
+   the sink or source pad.
+
+E2BIG
+   The application provided ``num_routes`` for ``VIDIOC_SUBDEV_S_ROUTING`` is
+   larger than the number of routes the driver can handle.
-- 
2.34.1

