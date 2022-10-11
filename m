Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5F585FB0B0
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 12:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiJKKrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 06:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJKKrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 06:47:36 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCC983F05
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665485255; x=1697021255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=flj/FWSEUnx69ftnv6aqRZ3ZGqiyaL2G39ZsY5ox2Do=;
  b=ZNWv4hDjkkCdsUv0l8eQq51Tu6/fL54rDpBlLp8Lvde8ZBU4NAHW3ci8
   mgQYkPYQzZQoYPNtsyUUftZ+RL20ITOXL4CxdhfqS59UKiZAPSqmHJEQ7
   s7nFugDd+R7A19BHi9BokmI3CesZyJVcTVgIkO0p6USUYZu3Qv1E5v5+h
   8jygbG1ms8Msd5q0vFoj/tneS8zZaZPB7mGESRVPWseBXnck/niUsYLLb
   Wv+6IEGHwnBdIFagMZ6TzxTyo4frAs5pDzHOqblEnF+4jToVROmctx6wJ
   DIHVP91LK6Xbv/O6wUmQW33inZb8fhzdHo0FvFW/3AL7u8Ep6y8VLs8wa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291786860"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="291786860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 03:47:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="751693899"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="751693899"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 03:47:32 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 39D1120A43;
        Tue, 11 Oct 2022 13:47:30 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oiCnJ-0000Hr-NF; Tue, 11 Oct 2022 13:47:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 1/1] media: Documentation: Interaction between routes, formats and selections
Date:   Tue, 11 Oct 2022 13:47:29 +0300
Message-Id: <20221011104729.1058-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221003121852.616745-10-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-10-tomi.valkeinen@ideasonboard.com>
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

Document how setting up routes interacts with formats and selections.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Moi,

This could be added on top of the set.

Comments are welcome.

 .../userspace-api/media/v4l/dev-subdev.rst    | 48 ++++++++++++++-----
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 5075b1828b32d..830235eb01598 100644
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
+Commonly V4L2 subdevices do not support multiple, unrelated video streams.
+Only a single stream can pass through a media link and a media
+pad. Thus each pad contains a format and selection configuration for that single stream.
+A subdev can do stream processing and split a stream into
+two or compose two streams into one, but the inputs and outputs for the
+subdev are still a single stream per pad.
 
 Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
 data streams are transmitted on the same bus, which is represented by a media
@@ -539,15 +541,37 @@ streams from one end of the link to the other, and subdevices have routing
 tables which describe how the incoming streams from sink pads are routed to the
 source pads.
 
-A stream ID (often just "stream") is a media link-local identifier for a stream.
+A stream ID is a media link-local identifier for a stream.
 In other words, a particular stream ID must exist on both sides of a media
 link, but another stream ID can be used for the same stream at the other side
-of the subdevice.
+of the subdevice. The same stream ID is used to refer to the stream on
+both pads of the link on all ioctls operating on pads.
 
 A stream at a specific point in the media pipeline is identified with the
-subdev and a (pad, stream) pair. For subdevices that do not support
+subdev and a pad--stream pair. For subdevices that do not support
 multiplexed streams the 'stream' is always 0.
 
+Interaction between routes, formats and selections
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The addition of routes to the V4L2 sub-device interface moves the
+sub-device formats and selections from pads to pad--stream pairs. Instead
+of the sub-device wide merging of streams from all source pads towards all
+sink pads, this takes place separately for each route. The stream ID on
+the sink pad for each configured route is used to configure format and
+selections on the sink pad. Similarly, the stream ID on the source pad of
+each configured route is used to configure format and selections on the
+source pad.
+
+Any number of routes from streams on sink pads towards streams on source
+pads is allowed, to the extent supported by drivers. For every stream on a
+sink pad, however, only a single route is allowed.
+
+Pad--stream pairs are not static but are replaced by calls to the
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. This also
+applies to stream format and selection configurations which that are
+reverted to driver defaults.
+
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
 
@@ -565,8 +589,10 @@ Controller API <media_controller>`
 setting the routing table will reset all the stream configurations in a media
 entity.
 
-3) Configure streams. Each route endpoint must be configured
-with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+3) Configure formats and selections on routes. Each route is configured
+separately as documented plain subdevices in :ref:`<format-propagation>`.
+The stream ID is set to the same stream ID used on sink and source pads of
+the :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.30.2

