Return-Path: <linux-media+bounces-40954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0FB33BE7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83C497B28DB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C522DA746;
	Mon, 25 Aug 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/S2ZDFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1822D94B6
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115504; cv=none; b=ojcPYsve4mh1qFYDAED9x2Eul8jqQ7tmhwmTFixqSx6Su1WX4OxljsbJIRcUuoQZJmpMQz8K6+yqFr/hmlPxuPLIADlD8Pl56d7p8U0oYSqQ0W/K3EK6wFPNjXXNYwnwD7cVF+XpRq7aOnh/xEOyZ43K2U+ngdCSwyZ3DEcwMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115504; c=relaxed/simple;
	bh=f5QiODiqIGss9ycAZ5zEqfZ7NDL3UwV3nmHZ6p9KAdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaizyMY0OEcfF2MVPPPYzXk0KZjTHxpb6mCzb0u6m6Vz9Ya/4pRRT4xlPc3QaFGpxsli1FNczcuVkOOvB8yKrb0tt3Os7kCh4hHoTtHaXZPPMMfO0b62br8k8244bK2EhPBrAzwGTxLQMzb2BMIIo2QDZiBJPVmIJzOAM/yOHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/S2ZDFT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115501; x=1787651501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f5QiODiqIGss9ycAZ5zEqfZ7NDL3UwV3nmHZ6p9KAdo=;
  b=U/S2ZDFT/isP2RUhJbT1PzdAtA8XirP5ru9PLpHGX9n1ufndbo77Y+Ad
   G1UKz8Flml/mWnoytvGOBenlt7IaRsE10Qhpkt72+wnsF+7vDmDLvS1Io
   Exzra5sodilWZ+C+oJZi6wbOb8gXhEEV4Jx4l2T16sCd1LVVhatBivifi
   phLIHhlc6PF1i2n7zLGp3C6P3s2jrhu9AYJzdWtfO7McbLg+Z3KyyrF58
   EJHlpL4FAEiQrVDkEFeYqYIFXN3I4ssnmaeD6Kdj5/C7LTNsHT+yqj7++
   JYS3tooWGnLwTetYjKYXUqHATbvsdlGcmEBv5umJ90IimNf6wekiU22cP
   A==;
X-CSE-ConnectionGUID: XqjAqgyxRSqccJG2ONSA7A==
X-CSE-MsgGUID: u69M7/AtRhudRucfNACrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696025"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: 0PZ5K54CRCKF/UOoJq/KQw==
X-CSE-MsgGUID: i6G1OdZMTr+CY33fd/4CyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195504"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6AB2F121FD1;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afD-1eTI;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 25/66] media: Documentation: v4l: Document internal sink pads
Date: Mon, 25 Aug 2025 12:50:26 +0300
Message-ID: <20250825095107.1332313-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
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
 .../userspace-api/media/v4l/dev-subdev.rst    | 151 ++++++++++++++++++
 .../media/v4l/ext-ctrls-image-source.rst      |   2 +
 2 files changed, 153 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 4da67ee0b290..bb86cadfad1c 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+.. _v4l2-subdev-internal-source-pads:
+
+Internal sink pads and routing
+------------------------------
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
 -----------------------------------------------------------
 
@@ -695,3 +716,133 @@ To configure this pipeline, the userspace must take the following steps:
    the configurations along the stream towards the receiver, using
    :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
    stream endpoint in each sub-device.
+
+   In case generic raw and metadata formats are used,
+   :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` and
+   :ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
+   controls are present on the source sub-device to obtain the pixel data color
+   pattern and metadata layout.
+
+Internal pads setup example
+---------------------------
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- An IMX219 camera sensor source sub-device, with one source pad (0), one
+  internal sink pad (1) as the source of the image data and an internal sink
+  pad (2) as the source of the embedded data. There are two routes, one from the
+  internal sink pad 1 to the source pad 0 (image data) and another from the
+  internal sink pad 2 to the source pad 0 (embedded data). Both streams are
+  always active, i.e. there is no need to separately enable the embedded data
+  stream. The sensor uses the CSI-2 interface.
+
+- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
+  connected to the sensor, and two source pads (pads 1 and 2), to the two DMA
+  engines. The receiver demultiplexes the incoming streams to the source pads.
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
+      - Pixel data stream from the internal image sink pad
+    * - 2/0
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from the internal embedded data sink pad
+
+The options available in the sensor's routing configuration are dictated by
+hardware capabilities: typically camera sensors always produce an image data
+stream while it may be possible to enable and disable the embedded data stream.
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
+      - MEDIA_BUS_FMT_RAW_10
+    * - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_RAW_10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - 0/1
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+    * - :rspan:`3` CSI-2 receiver
+      - 0/0
+      - **3296**
+      - **2480**
+      - **MEDIA_BUS_FMT_RAW_10**
+    * - 1/0
+      - 3296
+      - 2480
+      - MEDIA_BUS_FMT_RAW_10
+    * - 0/1
+      - **3296**
+      - **2**
+      - **MEDIA_BUS_FMT_META_10**
+    * - 2/0
+      - 3296
+      - 2
+      - MEDIA_BUS_FMT_META_10
+
+The embedded data format does not need to be configured on the sensor's pads as
+the format is dictated by the pixel data format in this case.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 64c0f9ff5b1b..d803a2f0f2f9 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -146,6 +146,8 @@ Image Source Control IDs
     ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
     ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
 
+.. _image_source_control_metadata_layout:
+
 ``V4L2_CID_METADATA_LAYOUT (integer)``
     The metadata layout control defines the on-bus metadata layout for metadata
     streams. The control is used in conjunction with :ref:`generic metadata
-- 
2.47.2


