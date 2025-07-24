Return-Path: <linux-media+bounces-38405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10744B10CF7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1291CC2163
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407432EB5AD;
	Thu, 24 Jul 2025 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tDF8ihNF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B22EACEF;
	Thu, 24 Jul 2025 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366267; cv=none; b=FHVHTX3F0U0u+tRq7UUxlJIyVMUOiHCNLA1HEXKKjEnMUPUP3hKwMV3OMavY/A1B36b2v6bapmxSqFG85KEhTWSw/CHx75REX2e2ujm+QZ5HgbgsRtwArsRBJVpvCUjzVsu4Sos+4f/vrkq6pmwbnFRSGfgGuCsUb3pmhHRTl5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366267; c=relaxed/simple;
	bh=V0WqgKr/zEfw+asoSaJEdqWVxbY1tSCJAuE38B6yIuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y50/mZ2/6M8qFiKYhfeAw1747/TSN/Kh6jIzJ8XfFYoLXSfhM6stowtbPoi4y0SQBQT+W/rneg5rRzGVeEjwQAQsq3IszX+59H3AKU6PTqZP08zF7dvXFtcUVWGkCRbzf9DcnzGIOGSRKWafD0iJd3hlRd085FzDl/7xv6wEvjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tDF8ihNF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23FFB19E7;
	Thu, 24 Jul 2025 16:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366214;
	bh=V0WqgKr/zEfw+asoSaJEdqWVxbY1tSCJAuE38B6yIuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tDF8ihNFzRturUk5ExkYHvqM//6DNG0tnFhewVa9QkTR95TLsa8g0W1Cde/D66EyB
	 82+ld9IZSD0BGF2qppIjZoja8jY3k+IIiPz2ck02E2kFR2dRMaf2R1hiJyCaMGYbRK
	 BVr/46+dwE58ZvUeHbCDWa7tfCEuA4sMYhIKi128=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:28 +0200
Subject: [PATCH v2 21/27] media: uapi: Add 'flags' to media_device_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-21-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5051;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V0WqgKr/zEfw+asoSaJEdqWVxbY1tSCJAuE38B6yIuk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7Q0UTep6lSZUTnL+csNpJBbJvZqx7bNQXb+
 a9RSvGGif2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PEJED/9eZYnxIRsTYgasIOWfgqMLm8sHX8coaxImLs+Vu0fI8Gb3H0dNKMAvYwBME4TmDRF49wQ
 659iKLTU4vmTOaqi443lCYObLjhUNpCim9PWkd1GFZKn+lCyyJU77aP+RfSSPjCkjb8x1mvi4AF
 uc3QfKiN4EJ8634LMwHxLPfW4aFmSLQhCTmDyLhgJ3+MQkSu+LSOG0fqVAYC3XemKLzvKR2HgvV
 lEUxihLaqSs8Ygc+99rWOLK7Dssj9LH7Yjfz2h5FhbiXX2HfZP3SV4hBq0fJh29PxOaO5t4CWij
 j+0Iba4iMDem78CH1a/wmYNTMai73ZpiFc+3xR0pc8/Cg0atvJmSimSYysbp3AVoFkCTsGid0FN
 5rbPx3lMkWE2+DBzwoI9ndIgOgvp3Y/z1FnEqB5rmPF2jNi8M1ZYp8PIsLW/k19lOaFLEynpiG5
 nNMA7a0QcetRQ1+u/OAv1rLYWsght7oBZ1hByN95Igsbbm9TNqDZz5djXAmNh9U/JPsNWN7lc/5
 wkDkc2cUZQ0apUV3zaONtXv7Nk2WRiGbRXf8dD2SE3RNK7R5eAcIHq9xVpB9Y8zsPei6UYavo2P
 hxtnXap39xuYInNuA75LxQKeMbx6RGVcVWwhjLJWk2Fy0FIT+/cltAlfpDo2m/is0qHpyfY85TM
 4fKe2htFb2ZL4oA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The 'struct media_device_info' type is used to return information
on the media device using the MEDIA_IOC_DEVICE_INFO ioctl.

Add a 'flags' field to the structure by using a 32-bit integers from
the reserved space to report the media device flags to userspace.

Introduce a new flag MEDIA_DEVICE_FL_CONTEXT that allows drivers to
report support for multi-context operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/mediactl/media-ioc-device-info.rst  |  6 +++++-
 Documentation/userspace-api/media/mediactl/media-types.rst  | 13 +++++++++++++
 drivers/media/mc/mc-device.c                                |  1 +
 include/media/media-device.h                                |  7 +++++++
 include/uapi/linux/media.h                                  |  6 +++++-
 5 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
index d56ee6669ab9eb17a77f3714ecd5e3ef9ad65358..f2ff7a2b860cb848683a31d5731a06c782c70316 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
@@ -87,7 +87,11 @@ ioctl never fails.
 	  this identifies a particular driver.
 
     *  -  __u32
-       -  ``reserved``\ [31]
+       -  ``flags``
+       -  Media device flags, see :ref:`media-device-flag` for more details.
+
+    *  -  __u32
+       -  ``reserved``\ [30]
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263b04935758d42a17adfe690fcd042..40e943af37c08339af928ff89e937740a48893a8 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -235,6 +235,19 @@ Types and flags used to represent the media graph elements
 
 ..  tabularcolumns:: |p{5.5cm}|p{12.0cm}|
 
+.. _media-device-flag:
+.. _MEDIA-DEVICE-FL-CONTEXT:
+
+.. flat-table:: Media device flags
+    :header-rows:  0
+    :stub-columns: 0
+
+    *  -  ``MEDIA_DEVICE_FL_CONTEXT``
+       -  The media device supports multi-context operations
+
+
+..  tabularcolumns:: |p{5.5cm}|p{12.0cm}|
+
 .. _media-entity-flag:
 .. _MEDIA-ENT-FL-DEFAULT:
 .. _MEDIA-ENT-FL-CONNECTOR:
diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index e1f34f884fee2e8c3750f9c1e85142ff2f6b7bf0..a5cdc679a4ef11c7ec35dd69ac9987eb5718069f 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -121,6 +121,7 @@ static long media_device_get_info(struct media_device *dev, void *arg)
 	info->media_version = LINUX_VERSION_CODE;
 	info->driver_version = info->media_version;
 	info->hw_revision = dev->hw_revision;
+	info->flags = dev->flags;
 
 	return 0;
 }
diff --git a/include/media/media-device.h b/include/media/media-device.h
index b3cc6793a8b5eff4c26e57b01e1a62ab71e8195b..e53334fc21fa353cb3e0e7948b08739855dd07ca 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -157,6 +157,7 @@ struct media_device_ops {
  * @serial:	Device serial number (optional)
  * @bus_info:	Unique and stable device location identifier
  * @hw_revision: Hardware device revision
+ * @flags:	Media device flags
  * @topology_version: Monotonic counter for storing the version of the graph
  *		topology. Should be incremented each time the topology changes.
  * @id:		Unique ID used on the last registered graph object
@@ -221,6 +222,11 @@ struct media_device_ops {
  *    necessary to run @enable_source and @disable_source handlers.
  *    Callers should hold graph_mutex to access and call @enable_source
  *    and @disable_source handlers.
+ *
+ * The @flags field reports the media device capabilities:
+ *
+ * %MEDIA_DEVICE_FL_CONTEXT
+ *    indicates that the media device supports multi-context operations.
  */
 struct media_device {
 	/* dev->driver_data points to this struct. */
@@ -232,6 +238,7 @@ struct media_device {
 	char serial[40];
 	char bus_info[32];
 	u32 hw_revision;
+	u32 flags;
 
 	u64 topology_version;
 
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf36b76aaf1363dec50751469d8fed..f711bdda595718092a294336d4d364ba8296e08d 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -23,6 +23,9 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/* Media device flags. */
+#define MEDIA_DEVICE_FL_CONTEXT			0x00000001
+
 struct media_device_info {
 	char driver[16];
 	char model[32];
@@ -31,7 +34,8 @@ struct media_device_info {
 	__u32 media_version;
 	__u32 hw_revision;
 	__u32 driver_version;
-	__u32 reserved[31];
+	__u32 flags;
+	__u32 reserved[30];
 };
 
 /*

-- 
2.49.0


