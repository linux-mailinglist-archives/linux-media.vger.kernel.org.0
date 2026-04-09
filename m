Return-Path: <linux-media+bounces-58442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNU3DT8K2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ED93CF6F2
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A84F302F99E
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D6634D3B9;
	Thu,  9 Apr 2026 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9MYj8JS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D333DEDF
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765737; cv=none; b=pW5F+vMd1HqPnAOzDdjrNsMygnA7Rs6ZsYrF0rUukdPXHqsbD6NumBpXmno/SHQ8MNvTZ5F3GOoq6fDJhtI2v8CKd86laFJPKvCHheb6OWbslD8YEf5hVTLaKk8G038usl9FUz7/SGcE6DJ4zHDJbXwZ6vF5lHINqRys1YKMsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765737; c=relaxed/simple;
	bh=nIPQY511UNTMFbKBi8r+dK7AoVg6JGxrJIV2oZmHKl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCRUGoWrbADxpE9vq1702OHN5I8pZpu+g4yAGqyc3SEHSWKp0P8IKUkz+n53EAABq2rMWOYxYI5jI9OPEPKFcgv6ud7r/eZYCHkXj2lacTcPN5pgwNej/SuNG/XYJDyzwBjmNyhMw7q5bmt6Dni4Aa9EaWfo1KN/Od+GrDsQTCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9MYj8JS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765736; x=1807301736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIPQY511UNTMFbKBi8r+dK7AoVg6JGxrJIV2oZmHKl8=;
  b=A9MYj8JSrNNSk+S6XFUVht1WeyaxfCB+DyDtwn1yiC8y2RLQhPe9ARoG
   UhAV0+hZQr1N4HA6WaxN2DW2yjuVzyQAzR9MgiUdtnch5Vsm/ci2Lu5Cn
   PdXCiOdTZ9QcJqgSbb4EXljRRAxOqLEvu48Hyjsk2poclq5c2oEVcDbb1
   nXWlYbj1GCaaMflA9pGst2jiPoRE3j6aGvRHcJK6kcmyTx2cy9U0huyp8
   3RkjreQHJzNJZsByUTG2Gwsp0lUZVeKPZW9In0wH4M9DQ8tKcOOEvpfXI
   RzeqHJ5jgbHxwP+owv/JlKliOVvU6r52LJgeTXoI6bT24Gol4Xorqje8D
   A==;
X-CSE-ConnectionGUID: bUgktdSYTxKJRUep2k14QQ==
X-CSE-MsgGUID: DgGPFXMBT16Dbq1/yNJrLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176558"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: ACkhWQITQpSwWFpnNmYxvQ==
X-CSE-MsgGUID: hmAbdQCqT/2ILuxeYRSPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047546"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BB1371228FF;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045n3-0mNc;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 37/86] media: Documentation: Add sub-device internal pads example
Date: Thu,  9 Apr 2026 23:14:12 +0300
Message-ID: <20260409201501.975242-38-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58442-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1ED93CF6F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an example using sub-device internal pads, with the Sony IMX219 camera
sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 2fc81e0205dc..a9d462b57b54 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -729,4 +729,133 @@ To configure this pipeline, the userspace must take the following steps:
    controls are present on the source sub-device to obtain the pixel array CFA
    pattern and metadata layout.
 
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
+  connected to the sensor's source pad (0), and two source pads (pads 1 and 2),
+  to two DMA engines. The receiver demultiplexes the incoming streams to the
+  source pads.
+
+- Two DMA engines in the SoC, one for each stream. Each DMA engine is connected
+  to a different source pad of the receiver.
+
+The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
+userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
+V4L2 video devices, exposed to userspace via /dev/videoX nodes.
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
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+        V4L2_SUBDEV_ROUTE_FL_STATIC
+      - Pixel data stream from the internal image sink pad
+    * - 2/0
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+        V4L2_SUBDEV_ROUTE_FL_STATIC
+      - Metadata stream from the internal embedded data sink pad
+
+While both routes are immutable for the IMX219, other camera sensors may offer
+more flexible configuration options. Routing configuration is dictated by the
+hardware capabilities: camera sensors typically always produce an image data
+stream, but some of them support enabling and disabling the embedded data
+stream.
+
+.. flat-table:: Receiver routing table. Typically both routes need to be
+		explicitly created.
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
+3) Configure formats
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
+      - 3296
+      - 2480
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
+
 .. include:: subdev-config-model.rst
-- 
2.47.3


