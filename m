Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289796659CF
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 12:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjAKLLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 06:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbjAKLKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 06:10:51 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60F318E19
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 03:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673435346; x=1704971346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kj8atyzMDlYQ6j+a228/7z4Ybjhat8Ww8HYoVNd7DDs=;
  b=gn+qnvA9UCZFwe5Zuag5Re+PpAyuCAV00UKACpaHOlLz1LCXFWBnq/TA
   BFq/N9OfULgmzIaz3n7N9aL6V7l1oiPi9FgAfB66rQ7ezHU8cSC2z1AaQ
   se1cKAhCllbf4sCO9x2jAcgpnVctgfp4t4hJOWL9uWuqxa+QWDuJZS+jw
   mtQmFL8M9xRgENRjvN1yar1EudLJR1FnTYbRpTcObuEv48V71adnpyXZk
   3EaPExVwmqGVxUeVG/TDwmA6XwkLH0UmyXua45xc6DL5n31pl6FIxzcUf
   gmHaQ60lVsW6iamTXoCgUfEMqSKYdV2RJS1a4Dvh8ydcA8BR4eD4PuQYz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311195910"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="311195910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 03:09:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="902722511"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="902722511"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 03:09:03 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 91AE82010E;
        Wed, 11 Jan 2023 13:09:01 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pFYyu-008PP2-Rn; Wed, 11 Jan 2023 13:09:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 1/1] media: Documentation: Update documentation for streams
Date:   Wed, 11 Jan 2023 13:09:20 +0200
Message-Id: <20230111110920.2004227-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
References: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how streams interacts with formats and selections.

Update documentation in respect to what is allowed, in particular streams
are only supported via full routes, source-only routes are not supported
right now.

The centerpiece of the API additions are streams. Albeit routes are
configured via S_ROUTING IOCTL that also declares streams, it is streams
that are accessed through other APIs. Thus refer to streams instead of
routes in documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Address Tomi's comments:

  - Fix wrong terms (sink vs. source, others)

  - Align subdev, subdevice to sub-device consistently

  - Improve wording in a number of places

  - Rebase on plain v16 streams set (i.e. not additional patches in between)

  - Drop a few redundant sentences

  See: <URL:https://lore.kernel.org/linux-media/Y76SpkZTxtPvpXtU@paasikivi.fi.intel.com/T/#me8bb137ec1bc7fb20efe8042be04b40753928f1d>  

 .../userspace-api/media/v4l/dev-subdev.rst    | 74 +++++++++++++------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 7d1b8ebd4e173..cf720a257a9bb 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
 size may also be smaller than the BOUNDS rectangle.
 
 
+.. _format-propagation:
+
 Order of configuration and format propagation
 ---------------------------------------------
 
@@ -507,12 +509,12 @@ source pads.
 Streams, multiplexed media pads and internal routing
 ----------------------------------------------------
 
-Commonly V4L2 subdevices support only separate video streams, that is, only a
-single stream can pass through a media link and a media pad. Thus each pad
-contains a format configuration for that single stream. In some cases a subdev
-can do stream processing and split a stream into two or compose two streams
-into one, but the inputs and outputs for the subdev are still a single stream
-per pad.
+Simple V4L2 subdevices do not support multiple, unrelated video streams,
+and only a single stream can pass through a media link and a media pad.
+Thus each pad contains a format and selection configuration for that
+single stream. A subdev can do stream processing and split a stream into
+two or compose two streams into one, but the inputs and outputs for the
+subdev are still a single stream per pad.
 
 Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
 data streams are transmitted on the same bus, which is represented by a media
@@ -539,14 +541,35 @@ streams from one end of the link to the other, and subdevices have routing
 tables which describe how the incoming streams from sink pads are routed to the
 source pads.
 
-A stream ID (often just "stream") is a media link-local identifier for a stream.
-In other words, a particular stream ID must exist on both sides of a media
+A stream ID is a media pad-local identifier for a stream. Streams IDs of
+the same stream must be equal on both ends of a link. In other words,
+a particular stream ID must exist on both sides of a media
 link, but another stream ID can be used for the same stream at the other side
-of the subdevice.
+of the subdevice. The same stream ID is used to refer to the stream on
+both pads of the link on all ioctls operating on pads.
+
+A stream at a specific point in the media pipeline is identified by the
+sub-devdev and a (pad, stream) pair. For subdevices that do not support
+multiplexed streams the 'stream' field is always 0.
+
+Interaction between routes, streams, formats and selections
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The addition of streams to the V4L2 sub-device interface moves the sub-device
+formats and selections from pads to (pad, stream) pairs. Besides the
+usual pad, also the stream ID needs to be provided for setting formats and
+selections. The order of configuring formats and selections along a stream is
+the same as without streams (see :ref:`format-propagation`).
+
+Instead of the sub-device wide merging of streams from all source pads
+towards all sink pads, data flows for each route are separate from each
+other. Any number of routes from streams on sink pads towards streams on
+source pads is allowed, to the extent supported by drivers. For every
+stream on a sink pad, however, only a single route is allowed.
 
-A stream at a specific point in the media pipeline is identified with the
-subdev and a (pad, stream) pair. For subdevices that do not support
-multiplexed streams the 'stream' is always 0.
+Any configurations of a stream within a pad, such as format or selections,
+are independent of similar configurations on other streams. This is
+subject to change in the future.
 
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
@@ -560,13 +583,17 @@ There are three steps in configuring the streams:
 1) Set up links. Connect the pads between subdevices using the :ref:`Media
 Controller API <media_controller>`
 
-2) Routing. The routing table for the subdevice must be set with
+2) Streams. Streams are declared and their routing is configured by
+setting the routing table for the subdevice must be set with
 :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
-setting the routing table will reset all the stream configurations in a media
-entity.
+setting the routing table will reset formats and selections in the
+sub-device to default values.
 
-3) Configure streams. Each route endpoint must be configured
-with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+3) Configure formats and selections. Formats and selections of each stream
+are configured separately as documented for plain subdevices in
+:ref:`<format-propagation>`. The stream ID is set to the same stream ID
+associated with either sink or source pads of routes configured using the
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -596,7 +623,7 @@ To configure this pipeline, the userspace must take the following steps:
 bridge to the receiver, and the receiver to the DMA engines. This step does
 not differ from normal non-multiplexed media controller setup.
 
-2) Configure routing.
+2) Configure routing
 
 .. flat-table:: Bridge routing table
     :header-rows:  1
@@ -630,12 +657,13 @@ not differ from normal non-multiplexed media controller setup.
       - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - Pixel data stream from Sensor B
 
-3) Configure streams
+3) Configure formats and selections
 
-After configuring the routing table, the next step is configuring the streams.
-This step is similar to configuring the pads in a non-multiplexed streams
-setup, with the difference that we need to configure each (pad, stream) pair
-(i.e. route endpoint) instead of just a pad.
+After configuring the routing table, the next step is configuring the
+formats and selections for the streams. This step is similar to
+configuring the pads in a non-multiplexed streams setup, with the
+difference that we need to configure each (pad, stream) pair instead of
+just a pad.
 
 A common way to accomplish this is to start from the sensors and propagate the
 configurations along the stream towards the receiver,
-- 
2.30.2

