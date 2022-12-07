Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7495B645851
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 11:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiLGK6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 05:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiLGK6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 05:58:03 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CD3DF11
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 02:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670410682; x=1701946682;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0qjqEEAOOB/REGpln7EoIYdnP77LDKiwQUgPjK8YUp0=;
  b=HFyeN3VKu55FzoDcbsBathyb3Cn/Pxw4/8BRAqX6DBpBXT6jz4qCO8Vq
   t4wvzARFW+wMITNKR6IjSZxjMcXS9T8ONL49o89/E4gfJVIPrUkPJ1mGV
   oVY4/sXFm7iNJ5dYT3GK1y8AZeWYLv0nDqbNqxsr3VwE8b67/TWGHDuNP
   HGjWJtJ+1096HEW2msZGm+7uvKI+QrO1Kc7Fw7kmg7to9K1FDHT/yjN97
   s76RBby1gbJj+NU4vwCU3plMRsLzhQBf7arytIRWXZYBZwjTc7Naf1ccN
   pkSkB4jtxZt79KnW7EXSa509khM/3f6RjIvSgkrCV2iGH6nKT4hDrBtwP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="318005100"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="318005100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 02:57:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="640207794"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="640207794"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 02:57:52 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9D6792029D;
        Wed,  7 Dec 2022 12:57:49 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1p2s7u-003p87-2i; Wed, 07 Dec 2022 12:58:10 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 1/1] media: Documentation: Interaction between routes, formats and selections
Date:   Wed,  7 Dec 2022 12:58:09 +0200
Message-Id: <20221207105809.911482-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
since v1:

- Rewording changes based on Tomi's comments. In particular stricter
  separation between "stream" and "stream ID".

 .../userspace-api/media/v4l/dev-subdev.rst    | 50 ++++++++++++++-----
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 5075b1828b32d..92710bb9a0caa 100644
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
@@ -539,14 +541,33 @@ streams from one end of the link to the other, and subdevices have routing
 tables which describe how the incoming streams from sink pads are routed to the
 source pads.
 
-A stream ID (often just "stream") is a media link-local identifier for a stream.
+A stream ID is a media link-local identifier for a stream.
 In other words, a particular stream ID must exist on both sides of a media
 link, but another stream ID can be used for the same stream at the other side
-of the subdevice.
+of the subdevice. The same stream ID is used to refer to the stream on
+both pads of the link on all ioctls operating on pads.
+
+A stream at a specific point in the media pipeline is identified by the
+sub-devdev and a pad ID-stream ID pair. For subdevices that do not support
+multiplexed streams the 'stream' field is always 0.
+
+Interaction between routes, formats and selections
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The addition of routes to the V4L2 sub-device interface moves the
+sub-device formats and selections from pads to pad ID-stream ID pairs.
+Besides the usual pad ID, also the stream ID needs to be provided for
+setting formats and selections.
+
+Instead of the sub-device wide merging of streams from all source pads
+towards all sink pads, data flows for each route are separate from each
+other. Any number of routes from streams on sink pads towards streams on
+source pads is allowed, to the extent supported by drivers. For every
+stream on a sink pad, however, only a single route is allowed.
 
-A stream at a specific point in the media pipeline is identified with the
-subdev and a (pad, stream) pair. For subdevices that do not support
-multiplexed streams the 'stream' is always 0.
+Stream IDs, part of routes, are configured by using the
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. This will
+also revert the format and selection configuration to device defaults.
 
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
@@ -565,8 +586,11 @@ Controller API <media_controller>`
 setting the routing table will reset all the stream configurations in a media
 entity.
 
-3) Configure streams. Each route endpoint must be configured
-with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+3) Configure formats and selections. Each route is configured separately
+as documented plain subdevices in :ref:`<format-propagation>`. The stream
+ID is set to the same stream ID associated with either sink or source pads
+of routes configured using the :ref:`VIDIOC_SUBDEV_S_ROUTING
+<VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.30.2

