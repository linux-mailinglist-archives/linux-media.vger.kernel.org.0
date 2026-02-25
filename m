Return-Path: <linux-media+bounces-53323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NM4Ft+7nmnwWwQAu9opvQ
	(envelope-from <linux-media+bounces-53323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:07:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D297194A4D
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6732A30CC7AA
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C076242D76;
	Wed, 25 Feb 2026 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="awQlA+tp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44112318131;
	Wed, 25 Feb 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009968; cv=none; b=n4XvCvYmcd0MAndmJpgcgaJ9B91ljpm9EG0BtLggpQQNBJ17pXtvzZBB4kgzOYQMhpIcTLdOJBEU874OeJy57ytKoml6WcpvYaRsTTIAL4pjaapk/2QQl+op6EzCsrAhXG6jaVqld9j1tKDSNCdQfzoJ3/SF8KNavfgpUQhpHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009968; c=relaxed/simple;
	bh=IT4zi5EZ6B+GvTyllDkNcJM0ZPjAJgNkRkJN1ldUvrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mQPAXKNEJKh0yJuKqPeVeXUxkLGYEUT2kn45HuGn611iIjBiwixWKvTrBTiWUjnMTvUE2k1HKXSROSBpkbOUMf6YoBpdfELEEb3Rs2lWEis8W/8wMxguTb8tJNLhClzOq0WQs4A+MRYZM3z+5a8A3ld6eyNpM9I9S4zlptxTQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=awQlA+tp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68FF2E47;
	Wed, 25 Feb 2026 09:58:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772009908;
	bh=IT4zi5EZ6B+GvTyllDkNcJM0ZPjAJgNkRkJN1ldUvrM=;
	h=From:Date:Subject:To:Cc:From;
	b=awQlA+tpoKnBKXNSaZY07a27rpTaqvfU/7A/w48vnjloY7xnzXcPPQPIRUI2oQtfu
	 CC7w8whOLelN/+1bb95eAttkLKUyLbOmHMmo+5C+uFwxYgzArlyk29SfLzsdXohKDL
	 tJSf6yrV+Z4aY5mmKpcl22N6U3pWuY4HZGQn2ccc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 25 Feb 2026 14:19:35 +0530
Subject: [PATCH v2] media: Documentation: Fix frame interval calculation
 for raw camera sensors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-media-fps-docs-v2-1-5cb222d41e4d@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAJ63nmkC/3XMyw6CQAyF4VchXVvDDOGiK9/DsBjbIl3AkKkhG
 sK7O7J3+Z/kfBuYJBWDa7FBklVN45zDnwqgMcxPQeXc4EvflN5dcBLWgMNiyJEMB3YcWu+Jqg7
 yaUky6PsA733uUe0V0+fwV/db/1KrQ4dl1bVUU101Hd2UJVicHzEkPlOcoN/3/QsZhvwRswAAA
 A==
X-Change-ID: 20260219-media-fps-docs-fd1da722cc38
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7577;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=IT4zi5EZ6B+GvTyllDkNcJM0ZPjAJgNkRkJN1ldUvrM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpnrnoToG4n1avMAQQ650J6dFdnhY0oQ0Y+vg8/
 6xebz3q7V2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaZ656AAKCRBD3pH5JJpx
 RTdrD/oDc72O4P6EqJh4DkKX6rRwWe/oj0sQJR20bAYrR5vHFnrVAFYzlX/Wa3E+tZW/m2oQoql
 SjFXKHtFRj5rVhpAvbPB/vuHZt6woZIQKY9HaZt0TDDHtuxWJBwIpadXOaLCXabGNMzyWFZqAVH
 Z+dxkle5TV9JR/4ixkSE4fuTxdE2L0SKOaJAoQzFmXky6g3HJuQvj4bedYL2clMbA7PStbdwRK5
 y4p8aMc1MvxVlmTwu9O+YadpI0IQa53x0ZzUBMA+BX4L9qhy8R0dvjrea4ZFd580H0mQSFSM0+r
 tPmcU8dVClds80akngKsY8q4JVz3k2GR3Nu1exSjbxIdYgX9fW7skDw2WTC9tgZ0e+JjYmA9m++
 D5tY0Oc9wk9ZAxrfKrc4JsBy67Cl7XvC2/GrDjHsNPxzOzh5d09UNCgBFczEmEiE9Pja9sfz4q9
 7A3CAc8/IHMCh0YHD4iyrdItbgbtUXRvBFrQdKko7DhIpJcYx9yTLgyQ3nqqjAc28atclM/1osh
 3KxB7U1eDk3SmU0tkRBk85H5AgQQWgXxy0b7sF5pTBP7Yzt02S2iYm1NLhdAFdpb5Bf1t4GAGnd
 KhNjw6a/VUoQUXjDsQEdS9f+QnDruiKEuDP6iHIASYa9WAjj/DvaQsrfQDksvvU4ZRqvct0wRWx
 mpqtc3Ctki66ZRQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53323-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D297194A4D
X-Rspamd-Action: no action

The previous frame interval formula used analogue crop dimensions. This
diverges from what most non-CCS camera sensor drivers do and what most
applications expect.

The CCS specification describes under section "8.2.6 Line Length and
Frame Length" how the horizontal and vertical readout minimums can be
different when binning.

We see the same thing in non-CCS sensor drivers, for example in imx219
the minimum FLL (frame length in lines) can be lower than the analogue
crop height when doing 2x2 or 4x4 binning. Similarly in imx283 HMAX
(line length) can be lower compared to the analogue crop width when
doing 2x2 or 3x3 binning.

While the CCS driver defines the HBLANK/VBLANK controls with respect to
the analogue crop rectangle, with possibly negative values for blanking,
most other raw sensor drivers instead define them with respect to the
output dimensions (format defined on the source pad) sent on the bus.

So fix the frame interval calculation described in the documentation to
match the reality of existing drivers, separating out the CCS and
non-CCS cases. In future, with the common raw sensor model, this may
need further updates.

While at it, also clarify the order of operations in the sensor pipeline
and give the "hardware" definition for frame interval using LLP (line
length in pixels) and FLL (frame length in lines) before the messy
definitions that use blanking controls.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Use reStructureText note box for describing the
  HBLANK/VBLANK/PIXEL_RATE controls
- Document the blanking formula for both CCS and non-CCS raw
  sensor drivers
- Drop driver-api documentation as common raw sensor model is coming
  soon
- Link to v1: https://lore.kernel.org/r/20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com
---
 .../userspace-api/media/drivers/camera-sensor.rst  | 80 ++++++++++++++++------
 1 file changed, 58 insertions(+), 22 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..e41ed4616593735bf78b73c2ed34b016ab46c783 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -49,34 +49,70 @@ depends on the type of the device.
 Raw camera sensors
 ~~~~~~~~~~~~~~~~~~
 
-Instead of a high level parameter such as frame interval, the frame interval is
-a result of the configuration of a number of camera sensor implementation
-specific parameters. Luckily, these parameters tend to be the same for more or
-less all modern raw camera sensors.
+Instead of a high level parameter such as frame interval, the frame interval on
+a raw camera sensor is determined by a number of sensor-specific parameters.
+These parameters tend to be common across most modern raw camera sensors.
 
-The frame interval is calculated using the following equation::
+The pixel array is the full grid of photosensitive elements on the camera
+sensor. A subregion of it is selected by the analogue crop. The cropped image
+may then be subject to binning (averaging of a NxN block) and subsampling which
+further reduce the image dimensions. The resulting image is then read out by
+the ADC (analogue-to-digital converter) line by line. After ADC readout,
+optional digital crop or scaling may further reduce the image dimensions, see
+:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
 
-	frame interval = (analogue crop width + horizontal blanking) *
-			 (analogue crop height + vertical blanking) / pixel rate
+The frame size is determined by two timing parameters: line length in pixels
+(LLP) and frame length in lines (FLL). These are fundamental sensor timing
+registers that control how fast the ADC reads out the image. They may go
+by different names for a particular sensor, like HMAX and VMAX, or HTOTAL and
+VTOTAL, or similar.
 
-The formula is bus independent and is applicable for raw timing parameters on
-large variety of devices beyond camera sensors. Devices that have no analogue
-crop, use the full source image size, i.e. pixel array size.
+LLP is the total number of pixel clock cycles per line, including both the
+active readout width and horizontal blanking. FLL is the total number of lines
+per frame, including both the active readout height and vertical blanking.
 
-Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
-``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
-is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
-the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
-sub-device. The unit of that control is pixels per second.
+The frame interval is::
 
-Register list-based drivers need to implement read-only sub-device nodes for the
-purpose. Devices that are not register list based need these to configure the
-device's internal processing pipeline.
+        frame interval = (line length in pixels) *
+                         (frame length in lines) / pixel rate
 
-The first entity in the linear pipeline is the pixel array. The pixel array may
-be followed by other entities that are there to allow configuring binning,
-skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
-<VIDIOC_SUBDEV_G_SELECTION>`.
+Application developers can calculate the frame interval using the pixel rate
+and blanking controls, relative to the reference rectangle used by the sensor
+driver::
+
+        frame interval = (width + horizontal blanking) *
+                         (height + vertical blanking) / pixel rate
+
+.. note::
+
+        Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK``
+        and ``V4L2_CID_VBLANK``, respectively. The unit of the
+        ``V4L2_CID_HBLANK`` control is pixels and the unit of the
+        ``V4L2_CID_VBLANK`` is lines. The pixel rate in the sensor's **pixel
+        array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device.
+        The unit of that control is pixels per second.
+
+        Drivers need to implement sub-device nodes that expose these controls.
+        They can be read-only or configurable depending on the device.
+
+        For non-CCS sensors, the blanking is defined relative to the size of
+        the image being sent out to the host over the bus (source pad format)::
+
+                LLP = output width + horizontal blanking
+                FLL = output height + vertical blanking
+
+        For CCS-compliant raw sensors (that use the CCS driver), the blanking
+        controls are defined relative to the analogue crop rectangle::
+
+                LLP = analogue crop width + horizontal blanking
+                FLL = analogue crop height + vertical blanking
+
+Sensors may achieve higher framerates by allowing lower minimums for line and
+frame length when binning or subsampling is enabled.
+
+The driver shall set the minimum and maximum values of the blanking controls
+such that the resulting LLP and FLL reigsters are programmed within the range
+permitted by the sensor hardware for the current mode.
 
 USB cameras etc. devices
 ~~~~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
change-id: 20260219-media-fps-docs-fd1da722cc38

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


