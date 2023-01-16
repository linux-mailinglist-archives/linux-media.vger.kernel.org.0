Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3131B66BBAA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjAPK12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjAPK10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:27:26 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80E913D45
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 02:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673864845; x=1705400845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=11E/IBkILdr+fGjWeR9CS2U9H/3cvSXp2A8gf1WFMMI=;
  b=mrvB1go/9aP5dFIVqD8T3SAKingQQWV70n5pecBLx/EhqQ8UwpAAF2rU
   rQTY/u7HQ9Bd9y3KL9wHcyVDDRbrGUajk9YEXTSwd9mno/odD8dsQ9+Ps
   tA3eVSvdov1K610P51Om/OpEQF2msXLnzE+qojgOeHs/3cReHtln49RiY
   SjsxR8dWenvvyBGAfgkvJRQeDbD1DZfrjP+qJj+nOaeE+lqg2exwtGavw
   Y36xVmatdSGJORPv5yhtBLbcMKYR7HyTeYOOtQww3JbiLfaVeWJ99X+Dd
   R0eFt71hk6gROW6T8TrnrHgxkGG6tTCj4Mjf64XiDUkpIuwKUiAOpTh8A
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="351681682"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="351681682"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 02:27:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="691200614"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="691200614"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 02:27:18 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1DBB3204A8;
        Mon, 16 Jan 2023 12:27:16 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pHMiQ-008Rnr-Do; Mon, 16 Jan 2023 12:27:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v4 1/1] media: Documentation: Update documentation for streams
Date:   Mon, 16 Jan 2023 12:27:46 +0200
Message-Id: <20230116102746.2013454-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
since v3:

- Fix documentation reference

 .../userspace-api/media/v4l/dev-subdev.rst    | 84 ++++++++++++-------
 1 file changed, 55 insertions(+), 29 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 7d1b8ebd4e173..a4f1df7093e8e 100644
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
+Simple V4L2 sub-devices do not support multiple, unrelated video streams,
+and only a single stream can pass through a media link and a media pad.
+Thus each pad contains a format and selection configuration for that
+single stream. A subdev can do stream processing and split a stream into
+two or compose two streams into one, but the inputs and outputs for the
+subdev are still a single stream per pad.
 
 Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
 data streams are transmitted on the same bus, which is represented by a media
@@ -535,38 +537,62 @@ Understanding streams
 A stream is a stream of content (e.g. pixel data or metadata) flowing through
 the media pipeline from a source (e.g. a sensor) towards the final sink (e.g. a
 receiver and demultiplexer in a SoC). Each media link carries all the enabled
-streams from one end of the link to the other, and subdevices have routing
+streams from one end of the link to the other, and sub-devices have routing
 tables which describe how the incoming streams from sink pads are routed to the
 source pads.
 
-A stream ID (often just "stream") is a media link-local identifier for a stream.
-In other words, a particular stream ID must exist on both sides of a media
+A stream ID is a media pad-local identifier for a stream. Streams IDs of
+the same stream must be equal on both ends of a link. In other words,
+a particular stream ID must exist on both sides of a media
 link, but another stream ID can be used for the same stream at the other side
-of the subdevice.
+of the sub-device.
+
+A stream at a specific point in the media pipeline is identified by the
+sub-device and a (pad, stream) pair. For sub-devices that do not support
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
+Instead of the sub-device wide merging of streams from all sink pads
+towards all source pads, data flows for each route are separate from each
+other. Any number of routes from streams on sink pads towards streams on
+source pads is allowed, to the extent supported by drivers. For every
+stream on a source pad, however, only a single route is allowed.
 
-A stream at a specific point in the media pipeline is identified with the
-subdev and a (pad, stream) pair. For subdevices that do not support
-multiplexed streams the 'stream' is always 0.
+Any configurations of a stream within a pad, such as format or selections,
+are independent of similar configurations on other streams. This is
+subject to change in the future.
 
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
 
-The configuration of the streams is done individually for each subdevice and
-the validity of the streams between subdevices is validated when the pipeline
+The configuration of the streams is done individually for each sub-device and
+the validity of the streams between sub-devices is validated when the pipeline
 is started.
 
 There are three steps in configuring the streams:
 
-1) Set up links. Connect the pads between subdevices using the :ref:`Media
+1) Set up links. Connect the pads between sub-devices using the :ref:`Media
 Controller API <media_controller>`
 
-2) Routing. The routing table for the subdevice must be set with
+2) Streams. Streams are declared and their routing is configured by
+setting the routing table for the sub-device using
 :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
-setting the routing table will reset all the stream configurations in a media
-entity.
+setting the routing table will reset formats and selections in the
+sub-device to default values.
 
-3) Configure streams. Each route endpoint must be configured
-with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+3) Configure formats and selections. Formats and selections of each stream
+are configured separately as documented for plain sub-devices in
+:ref:`format-propagation`. The stream ID is set to the same stream ID
+associated with either sink or source pads of routes configured using the
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -586,7 +612,7 @@ A simple example of a multiplexed stream setup might be as follows:
 - DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
   connected to a single source pad in the receiver.
 
-The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
+The sensors, the bridge and the receiver are modeled as V4L2 sub-devices,
 exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
 modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
 
@@ -596,7 +622,7 @@ To configure this pipeline, the userspace must take the following steps:
 bridge to the receiver, and the receiver to the DMA engines. This step does
 not differ from normal non-multiplexed media controller setup.
 
-2) Configure routing.
+2) Configure routing
 
 .. flat-table:: Bridge routing table
     :header-rows:  1
@@ -630,14 +656,14 @@ not differ from normal non-multiplexed media controller setup.
       - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - Pixel data stream from Sensor B
 
-3) Configure streams
+3) Configure formats and selections
 
-After configuring the routing table, the next step is configuring the streams.
-This step is similar to configuring the pads in a non-multiplexed streams
-setup, with the difference that we need to configure each (pad, stream) pair
-(i.e. route endpoint) instead of just a pad.
+After configuring routing, the next step is configuring the formats and
+selections for the streams. This is similar to performing this step without
+streams, with just one exception: the ``stream`` field needs to be assigned
+to the value of the stream ID.
 
 A common way to accomplish this is to start from the sensors and propagate the
 configurations along the stream towards the receiver,
 using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
-stream endpoint in each subdev.
+stream endpoint in each sub-device.
-- 
2.30.2

