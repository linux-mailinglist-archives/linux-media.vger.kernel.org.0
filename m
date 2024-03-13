Return-Path: <linux-media+bounces-6945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7B87A373
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A19D28344E
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E0D199B0;
	Wed, 13 Mar 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+fN7M5T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26E171CD
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314756; cv=none; b=GfxnVqGpGrZY/sk/tMa5jqoFTCGvvilO8jp1FNJiULpS9VhVJbnpRbZRdoJpFi/k+zTvY7F4xpntUAL8IQ4MRk82fX+Tb3AEs+344wMa83OD+LCTzvOUPBaL0upEaR9iIIpQPTPCPCmN41CtYAbXCpxqNLTH7pxY2vQ4NN//T2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314756; c=relaxed/simple;
	bh=cJs9NJLJFor6qDFtqRwW8zSZlgSD4Gd3g98y4VoA0wU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FiFoYCxausx9hiYwgMVf2luNWG/XCXLaSvCTAgJUczc5gmeCDbDAv49wsTLAkzb6IMtu6eiYw/NF4zDc0dTa2qbKqK6tivOMp7cZOvREoTrILeK4TbboBnn3kOxdZclJSZjHdUDCJsIWaKIwplNj9LYiauycA1QadUtMzmedKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+fN7M5T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314754; x=1741850754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cJs9NJLJFor6qDFtqRwW8zSZlgSD4Gd3g98y4VoA0wU=;
  b=G+fN7M5TqAdUhJdl+4hA0R5L86yWXm6skEt0N2RwLmeNpBw4/MgkktVc
   S7CdMFzCmGNat2QTyKo445WH11lED+kOfGL+WQ/pUbjSD/kKtNX1u0sd0
   gbgMmh4bxlksQaKEwuCOwBptlPPKkmuZ903nTg5iZqOM4TXr0ln0KAJWK
   sJgQ7hhXglsovThtnbuOfx1IsZ8Et0soNh53JDystb7/9BKLK0uR84aGw
   oolDOorm5k3Dh4XLmIxvzZ5RCo3/tr1QvJ5H6s/+/AsivbWozlwQ77SUH
   NzPBWYiDq8cNZbGlmgnrBW4jDEqn5X60oVJj0r39BjOyIp6nt3GW/UCE1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575563"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575563"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816385"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A71961204F6;
	Wed, 13 Mar 2024 09:25:31 +0200 (EET)
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
Subject: [PATCH v8 09/38] media: Documentation: v4l: Document internal source pads
Date: Wed, 13 Mar 2024 09:24:47 +0200
Message-Id: <20240313072516.241106-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document internal source pads, pads that have both SINK and INTERNAL flags
set. Use the IMX219 camera sensor as an example.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a387e8a15b8d..1808f40f63e3 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+.. _v4l2-subdev-internal-source-pads:
+
+Internal source pads and routing
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Cases where a single sub-device source pad is traversed by multiple streams, one
+or more of which originate from within the sub-device itself, are special as
+there is no external sink pad for such routes. In those cases, the sources of
+the internally generated streams are represented by internal source pads, which
+are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
+pad flag set.
+
+Internal pads have all the properties of an external pad, including formats and
+selections. The format in this case is the source format of the stream. An
+internal pad always has a single stream only (0).
+
+Routes from an internal source pad to an external source pad are typically not
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
+- An IMX219 camera sensor source sub-device, with one sink pad (0), one source pad
+  (1), an internal sink pad (2) that represents the source of embedded
+  data. There are two routes, one from the sink pad to the source, and another
+  from the internal sink pad to the source pad. Both streams are always active,
+  i.e. there is no need to separately enable the embedded data stream. The
+  sensor uses the CSI-2 bus.
+
+- A CSI-2 receiver in the SoC (Receiver). The receiver has a single sink pad
+  (pad 0), connected to the bridge, and two source pads (pads 1-2), going to the
+  DMA engine. The receiver demultiplexes the incoming streams to the source
+  pads.
+
+- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
+  connected to a single source pad in the receiver.
+
+The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
+exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
+modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
+
+To configure this pipeline, the userspace must take the following steps:
+
+1) Set up media links between entities: connect the sensors to the bridge,
+   bridge to the receiver, and the receiver to the DMA engines. This step does
+   not differ from normal non-multiplexed media controller setup.
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
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from the sink pad
+    * - 2/0
+      - 1/1
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
+    * - :rspan:`3` Camera sensor sub-device (IMX219)
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
+    * - :rspan:`3` Receiver
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


