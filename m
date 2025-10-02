Return-Path: <linux-media+bounces-43614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1BBB39D4
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F40ED16A04B
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6638530B504;
	Thu,  2 Oct 2025 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I+F30eJU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001063093B6;
	Thu,  2 Oct 2025 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400343; cv=none; b=eXJEwUqGRYv3xs9VWzwCxbDQXeVybP9JicBtec2YYZeNLUSJHd7MY5KaGm5mu+J/YVHeGOvyCulotoi0CdeGU2UE4YaSg3GkzrBc6ZnkzhNqZxIf/ORhX+T6MkZMteBL87Qay/Z5M+FhVGcwgaZk8EgnduvTn6yOuyuWDr3tcsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400343; c=relaxed/simple;
	bh=8R7NylMBPxT9GjCIi32tHOA8FH3GuYP7pVFsQWisD/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLMhIwfrAyNzkk0R2cgQBvQTchSp3ySTLb6sf7g3Q/ruYu5jFcyTtQ2hAVlHt82hYxK9gTDIbSBqvXStklC8A5/Xg05kEzvqEFGMtuhDZk/mnhSbAGyR2zXa+Jxx4TCd+RKqauI4x5PdtEq/TCgIooeOI9mExFCN/CLh9OAYB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I+F30eJU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95C1E1E62;
	Thu,  2 Oct 2025 12:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400235;
	bh=8R7NylMBPxT9GjCIi32tHOA8FH3GuYP7pVFsQWisD/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I+F30eJU0Y1pCSm+JCD+bnA47QeAV2sGVZlJMGKW8xyJ5axBA+UsMZ4RBUwCU+GfY
	 DEH0M1k3JB8wg23xow8p3EzLSUxD2I8/G53q4SKP7ejddTYVqOI94AGRCVMhSXmJkY
	 yUbTosmC9aBxaMdldAcjN+wZo+9PUyhZ2r6RIFig=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:30 +0100
Subject: [PATCH v12 11/15] Documentation: mali-c55: Add Statistics
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-11-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8028;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=8R7NylMBPxT9GjCIi32tHOA8FH3GuYP7pVFsQWisD/g=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF6vQeggPxrTYEXbjzosdktFyLv6pRPHsMqz
 6LDXiZzopeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5RegAKCRDISVd6bEV1
 MkUgD/0Q4GIKo1BmSBDVepAHUqje8+IVYB4C7xgSQ9N+Wne4433OnyoHroDuro/+oz+g00e03ce
 2OcrIzn2B9j3OLykt0vfvTtTAkNF0jXWSh+qq/1HSNyLexc5QN6aNYdDLsIxefCqID88seiOdc5
 dVQYXYHzbIftzmWtN176kdD0qxiZEXYft93NAxlu+l2pZqYdCzGbXlQn6fEefs+cKmx/FcwaxfD
 E1u+vvNiuvqy4569qLl9cLtzvNYVSGvmBkFPieF3bTSTfT/rZDALMK3i3b1QNbUPUTSjyQDabSz
 EgmeM2FCTSWvx3lOTouzgeuzGr188VWjW40qOQ/em5NFCXoauB3Af+AgbS3/4psMK9ddNqW21M6
 i4ovEQO4fYpnTFIFG7SDNRFGQyKvgUG65AUEsf4FlbLk1iQnPfSdp7uE5a6QXVdA4fr30Yf9A//
 +n8B9zTsgBMuh80Kjf55JfRSGvnDdx/wdFXi6hR27Ih8f1wVYexNAZzB5oXmuc51y/L7wL5umLU
 c0cI0ZarZvlxNwqma68AORM8bI3MyMIjcGO25lgF/pes0uFcHEkKtoMLJ2aZL7bJuDJRNlWk7mG
 8mENOS+/JPFOp6JFlJozX46jq6+Zjs7rJtFeywM5FGSmDohH07Sk9T9rQSj9WUMht0dRw1WP94F
 v67kDng0/g98hKQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add documentation explaining the ability to capture statistics from
the mali-c55 driver's new V4L2 device, as well as the various tap
points from which those statistics can be drawn in the ISP's
processing flow. Additionally add a page detailing the new V4L2
meta format for the mali-c55 statistics.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v12:

        - Fix reference

Changes in v11:

        - None

Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- New patch
---
 Documentation/admin-guide/media/mali-c55.rst       | 60 +++++++++++++++++++++-
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-arm-mali-c55.rst             | 29 +++++++++++
 MAINTAINERS                                        |  1 +
 4 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
index 72cdded507b3a7918e28d9bd9a1c6f72ddf9e664..03723e0e8e43f17a04ede0032b2ddbfdb859d1e3 100644
--- a/Documentation/admin-guide/media/mali-c55.rst
+++ b/Documentation/admin-guide/media/mali-c55.rst
@@ -67,10 +67,11 @@ The driver has 4 V4L2 subdevices:
 - `mali_c55 resizer fr`: The Full-Resolution pipe resizer
 - `mali_c55 resizer ds`: The Downscale pipe resizer
 
-The driver has 2 V4L2 video devices:
+The driver has 3 V4L2 video devices:
 
 - `mali-c55 fr`: The full-resolution pipe's capture device
 - `mali-c55 ds`: The downscale pipe's capture device
+- `mali-c55 3a stats`: The 3A statistics capture device
 
 Frame sequences are synchronised across to two capture devices, meaning if one
 pipe is started later than the other the sequence numbers returned in its
@@ -333,6 +334,63 @@ configured, followed by formats in the appropriate places:
     # Set format on the video device and stream
     yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
 
+.. _mali-c55-3a-stats:
+
+Capturing ISP Statistics
+========================
+
+The ISP is capable of producing statistics for consumption by image processing
+algorithms running in userspace. These statistics can be captured by queueing
+buffers to the `mali-c55 3a stats` V4L2 Device whilst the ISP is streaming. Only
+the :ref:`V4L2_META_FMT_MALI_C55_STATS <v4l2-meta-fmt-mali-c55-stats>`
+format is supported, so no format-setting need be done:
+
+.. code-block:: none
+
+    # We assume the media graph has been configured to support RGB565 capture
+    # from the mali-c55 fr V4L2 Device, which is at /dev/video0. The statistics
+    # V4L2 device is at /dev/video3
+
+    yavta -f RGB565 -s 1920x1080 -c32 /dev/video0 && \
+    yavta -c10 -F /dev/video3
+
+The layout of the buffer is described by :c:type:`mali_c55_stats_buffer`,
+but broadly statistics are generated to support three image processing
+algorithms; AEXP (Auto-Exposure), AWB (Auto-White Balance) and AF (Auto-Focus).
+These stats can be drawn from various places in the Mali C55 ISP pipeline, known
+as "tap points". This high-level block diagram is intended to explain where in
+the processing flow the statistics can be drawn from::
+
+                  +--> AEXP-2            +----> AEXP-1          +--> AF-0
+                  |                      +----> AF-1            |
+                  |                      |                      |
+      +---------+ |   +--------------+   |   +--------------+   |
+      |  Input  +-+-->+ Digital Gain +---+-->+ Black Level  +---+---+
+      +---------+     +--------------+       +--------------+       |
+  +-----------------------------------------------------------------+
+  |
+  |   +--------------+ +---------+       +----------------+
+  +-->| Sinter Noise +-+  White  +--+--->|  Lens Shading  +--+---------------+
+      |   Reduction  | | Balance |  |    |                |  |               |
+      +--------------+ +---------+  |    +----------------+  |               |
+                                    +---> AEXP-0 (A)         +--> AEXP-0 (B) |
+  +--------------------------------------------------------------------------+
+  |
+  |   +----------------+      +--------------+  +----------------+
+  +-->|  Tone mapping  +-+--->| Demosaicing  +->+ Purple Fringe  +-+-----------+
+      |                | |    +--------------+  |   Correction   | |           |
+      +----------------+ +-> AEXP-IRIDIX        +----------------+ +---> AWB-0 |
+  +----------------------------------------------------------------------------+
+  |                    +-------------+        +-------------+
+  +------------------->|   Colour    +---+--->|    Output   |
+                       | Correction  |   |    |  Pipelines  |
+                       +-------------+   |    +-------------+
+                                         +-->  AWB-1
+
+At present all statistics are drawn from the 0th tap point for each algorithm;
+I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
+statistics from AF-0. In the future this will be configurable.
+
 References
 ==========
 .. [1] https://git.linuxtv.org/v4l-utils.git/
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b900ed6af7bd9ad49baf7b5a9eef9423f8abfbcb..74e7e82510680ce7da1f34a07ddce05ac64bd8a5 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -13,6 +13,7 @@ These formats are used for the :ref:`metadata` interface only.
     :maxdepth: 1
 
     extensible-parameters
+    metafmt-arm-mali-c55
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
new file mode 100644
index 0000000000000000000000000000000000000000..0bda9740a6be20df541ac7cf78e45e510f79ad19
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-mali-c55-stats:
+
+*************************************
+V4L2_META_FMT_MALI_C55_STATS ('C55S')
+*************************************
+
+3A Statistics
+=============
+
+The ISP device collects different statistics over an input bayer frame. Those
+statistics can be obtained by userspace from the
+:ref:`mali-c55 3a stats <mali-c55-3a-stats>` metadata capture video node, using
+the :c:type:`v4l2_meta_format` interface. The buffer contains a single instance
+of the C structure :c:type:`mali_c55_stats_buffer` defined in
+``mali-c55-config.h``, so the structure can be obtained from the buffer by:
+
+.. code-block:: C
+
+	struct mali_c55_stats_buffer *stats =
+		(struct mali_c55_stats_buffer *)buf;
+
+For details of the statistics see :c:type:`mali_c55_stats_buffer`.
+
+Arm Mali-C55 uAPI data types
+============================
+
+.. kernel-doc:: include/uapi/linux/media/arm/mali-c55-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index b4adf8c0bae063d9e2b25b0f2b2d5482d21ee3f0..1f16808feebd979e807ce36f4bd21379b6995f70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2085,6 +2085,7 @@ F:	Documentation/admin-guide/media/mali-c55-graph.dot
 F:	Documentation/admin-guide/media/mali-c55.rst
 F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
 F:	Documentation/userspace-api/media/drivers/mali-c55.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
 F:	include/uapi/linux/media/arm/mali-c55-config.h
 

-- 
2.43.0


