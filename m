Return-Path: <linux-media+bounces-9562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A341A8A74DF
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1960C1F214C2
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B054D13A268;
	Tue, 16 Apr 2024 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqxy+QHR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20BD139D01
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296023; cv=none; b=lMyciVx1mQR5z3JztzA5PPFLG+W7wo16PldRKhkmx9jKnQvCRdkcINbr2CPduR/Ydua6gBDZspv+2Ym2iJ+/JYU7uBXVD/6mGSQJrUxcwkZ6doNCLiv2cX5jT12+DiDaJxeAjePNF9skD1Hguf6VZ2QLGNfGT2+bQ7voqu7AUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296023; c=relaxed/simple;
	bh=2hHBHb9a2LHDXxsOGs2nNxxqI4BCTfEtOUY1FDAPwVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wv1LfS5bj3gcVA1RgoxaYL+teCvmbOzRvg3sYGVJMA8kMx7n6kAamGXx/NNpBcLJUvtE2fP2zSkEmdCQF19g24/y+cqzMcRxaNQeEphXmHGpVzEta3akHTo4zo46WA9qmIHrmgDsR8iethw9bIANXcjXTmMwxjyfo+3wFkYpgvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqxy+QHR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296022; x=1744832022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2hHBHb9a2LHDXxsOGs2nNxxqI4BCTfEtOUY1FDAPwVc=;
  b=eqxy+QHRNSi0NHUu4WhLcTYLMiOfC28/QkVl5LsK3G/TftVAI+5+dPzx
   Vkri41NhI3qs5Lb+2YilLTHVMhNJ6mBagoTlE5WVi/fgKFClu3A60lkVX
   HiSt9KodzIJKg1D5NNC5399cvOPo0Hs41K7o4hyc2gmjDYIwOES1rp46n
   s8sGWIeOMqn+oJJB58QlIm/ikm0OE6yVJ7vmhCO9rIx75obhVmZW3KQJV
   N0jb1TmkbzjZQSO1SAe23R/TVsil1DisoC0wGLvL/6aU93KQ0DyNlpoyn
   tCwoF2jryHGKbYbNgtZ8i6Z2OoFIpjzTmzI7Y8H1Jc4+TD00uC6HyXlcD
   Q==;
X-CSE-ConnectionGUID: EEi7DHMYRciiZcVyjit/6w==
X-CSE-MsgGUID: AKlfXrCMR3eUQidqfkYfQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906062"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:42 -0700
X-CSE-ConnectionGUID: XXibV3UET+yYjnzfCVe7bQ==
X-CSE-MsgGUID: 9zIc7MUhQlanw9dSz85O6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155285"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:39 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 320E312056F;
	Tue, 16 Apr 2024 22:33:35 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 10/46] media: Documentation: v4l: Document internal sink pads
Date: Tue, 16 Apr 2024 22:32:43 +0300
Message-Id: <20240416193319.778192-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document internal sink pads, pads that have both SINK and INTERNAL flags
set. Use the IMX219 camera sensor as an example.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by Julien Massot <julien.massot@collabora.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index b76e02e54512..d30dcb9e2537 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+.. _v4l2-subdev-internal-source-pads:
+
+Internal sink pads and routing
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Cases where a single sub-device source pad is traversed by multiple streams, one
+or more of which originate from within the sub-device itself, are special as
+there is no external sink pad for such routes. In those cases, the sources of
+the internally generated streams are represented by internal sink pads, which
+are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
+pad flag set.
+
+Internal pads have all the properties of an external pad, including formats and
+selections. The format in this case is the source format of the stream. An
+internal pad always has a single stream only (0).
+
+Routes from an internal sink pad to an external source pad are typically not
+modifiable but they can be activated and deactivated using the
+:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
+on driver capabilities.
+
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
    the configurations along the stream towards the receiver, using
    :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
    stream endpoint in each sub-device.
+
+Internal pads setup example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- An IMX219 camera sensor source sub-device, with one source pad (0), one
+  internal sink pad (1) as the source of the image data and an internal sink
+  pad (2) as the source of the embedded data. There are two routes, one from the
+  internal sink pad 1 to the source 0 (image data) and another from the internal
+  sink pad 2 to the source pad 0 (embedded data). Both streams are always
+  active, i.e. there is no need to separately enable the embedded data
+  stream. The sensor uses the CSI-2 interface.
+
+- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
+  connected to the sensor, and two source pads (pads 1 and 2), to the DMA
+  engine. The receiver demultiplexes the incoming streams to the source pads.
+
+- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a
+  single source pad of the receiver.
+
+The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
+userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
+V4L2 devices, exposed to userspace via /dev/videoX nodes.
+
+To configure this pipeline, the userspace must take the following steps:
+
+1) Set up media links between entities: enable the links from the sensor to the
+   receiver and from the receiver to the DMA engines. This step does not differ
+   from normal non-multiplexed media controller setup.
+
+2) Configure routing
+
+.. flat-table:: Camera sensor. There are no configurable routes.
+    :header-rows: 1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 1/0
+      - 0/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from the sink pad
+    * - 2/0
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from the internal sink pad
+
+.. flat-table:: Receiver routing table. Typically both routes need to be
+		explicitly set.
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from camera sensor
+    * - 0/1
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from camera sensor
+
+The options available in sensor's routing configuration are dictated by hardware
+capabilities: typically camera sensors always produce an image data stream while
+it may be possible to enable and disable the embedded data stream.
+
+3) Configure formats and selections
+
+   This example assumes that the formats are propagated from sink pad to the
+   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
+   and struct v4l2_mbus_framefmt.
+
+.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
+                static or propagated. The order is aligned with configured
+                routes.
+    :header-rows: 1
+    :fill-cells:
+
+    * - Sub-device
+      - Pad/Stream
+      - Width
+      - Height
+      - Code
+    * - :rspan:`3` IMX219
+      - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_SRGGB10
+    * - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_SRGGB10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_IMX219_EMBEDDED
+    * - 1/1
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` CSI-2 receiver
+      - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_SRGGB10**
+    * - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_SRGGB10
+    * - 0/1
+      - **3296**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+
+The embedded data format does not need to be configured as the format is
+dictated by the pixel data format in this case.
-- 
2.39.2


