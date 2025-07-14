Return-Path: <linux-media+bounces-37668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD8B042D8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DE837B54EB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25D725A2DA;
	Mon, 14 Jul 2025 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oYKHsOIP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3071259C83;
	Mon, 14 Jul 2025 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505638; cv=none; b=LpkdLnABoYwiHOKQ1ed9VpZUc9CGaYTc+vbP5UTeD1Zsv9rPOn1g+p6RHvureiew5Bl4U8vcJavvDj4j8S4+r8xiqQCZ8s1KGKZHVeA/6rAngRZUIuTqCzWHp4bsShodb5XcIYBkbiElMdgFbXZHZlfYgxFee1jy8pGWuNUXf1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505638; c=relaxed/simple;
	bh=bcUedfyQBUl7pkq+5tFha0TMf8BkPNwtxXEpnGwHKq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoIP4b3gdD+i96t5SLHsP0leyO+xPF2220Kz2PWhTVoVFnXi+r5JDgsNhoQsHWj8xLp0ZBB/GD2PgbdwuXIyOGvTMzH4zGhXZnu8klJz47PkXJi0yVFxhV8h48Qm0d0bymBlcWCcvox45/bMWigsfb67jjskhOXv1Rv7sr7H+EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oYKHsOIP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E90A75541;
	Mon, 14 Jul 2025 17:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505583;
	bh=bcUedfyQBUl7pkq+5tFha0TMf8BkPNwtxXEpnGwHKq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oYKHsOIPAFpCojNofET7U9haX7c0RN8CymQBItiDHuwXW+New2uIHUjYniqxcJfRv
	 bC5ZK7cIKrLXCCxLDHP+NRZwy3I3CDAPt4B8xCJCecK45OxDTxG1rE5coWsBnPDbak
	 8f+h4/hRQfomZXj1pPYv2XXf5eSfbmYqlALFSrTI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:41 +0100
Subject: [PATCH v11 15/19] Documentation: mali-c55: Add Statistics
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-15-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7951;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=bcUedfyQBUl7pkq+5tFha0TMf8BkPNwtxXEpnGwHKq4=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0CWV+3/FU5ScCf+GR7pQB2urOmUNjGLoKhv
 IKY8i55eUGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAgAKCRDISVd6bEV1
 MnrsD/9LffZ+IalXgsJxiJnT+btCpVGZhMcACDQ4DHBQxFDJsbkj2GV5b0nSFx8ybPp6mUZKQe4
 4rrZBx+AHk9bOWz4qNFL6pjC8PtVVy4sqHfYZeKcBqdV3zUWrRAxdS5JIDPifvNcadlXcl+5HC0
 H+J3IDqZMQt5Eat28JOa/bdgIdmrFQNb7S3HLnFOvVr1fT52MUKXgthXF1BEEp+pZB3E6OccZDS
 Zwwnr1kjn17WoEVcSdEBdGA6WwwsUwbWPiIngR9MXznmxL+x4+KZGQ3mIOdolsimKSeqfHUs6aR
 7z+yY++P3Qm3LDcpOPqbEdSjMAY6Y/NzP4H76JhOlXzPGbF5elnbZLbwzddrvwV7TSyOykkfUDv
 pXq0+qKgB1oqsr2rVgpYsQz8E9Rt5rAab2Jn+LWnrUBFpag15vSrKFfnjfWLzSY6U2KuqhuOpWx
 5BzwJK3JeXybpZm1jpXB89TXE6XdQDdU0KQpzSYg0priWreQl7ZE1gHJSrwYiF+NVSWfRj9M+aB
 ANVyv91nDTwZ4qtGuoleJl6KZwe67S+3+IOH33iycsEeiBEvjavi8ZTQIkR/UZCWsrSomjsfwYQ
 T9/or/etKCih9UK+yZKWhlmVh4vkjtxQ7hiJPnJ4B3Mq+nXekTHT4DBtLkyxeC9vgqRYbf7rrwJ
 0iE0t9MZoYHn9vQ==
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
index 72cdded507b3a7918e28d9bd9a1c6f72ddf9e664..7eaeac63ddf713730fac266d81866539310cc7e2 100644
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
+the :ref:`V4L2_META_FMT_MALI_C55_STATS <v4l2-meta-fmt-mali-c55-3a-stats>`
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
index 58eb3c9c962bee008eee27d9c16678213c47baa9..4d4b897b03d951ab4f9f7e9ba37f72d826208e1a 100644
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
index 0000000000000000000000000000000000000000..186e0deb9ece70ab1d2b22bb5ccb69196264a793
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-mali-c55-3a-stats:
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
index 87255112240dbce86bca8d9a6683015ce12a3bce..3a53565aa34897e5df13f0420908598add5b28fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2038,6 +2038,7 @@ F:	Documentation/admin-guide/media/mali-c55-graph.dot
 F:	Documentation/admin-guide/media/mali-c55.rst
 F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
 F:	Documentation/userspace-api/media/drivers/mali-c55.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
 F:	include/uapi/linux/media/arm/mali-c55-config.h
 

-- 
2.34.1


