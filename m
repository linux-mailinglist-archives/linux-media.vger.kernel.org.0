Return-Path: <linux-media+bounces-25172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF183A19BFA
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 01:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412AC188B456
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 00:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A348D19BBC;
	Thu, 23 Jan 2025 00:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWp/yuGA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA8C1EB2F;
	Thu, 23 Jan 2025 00:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737593683; cv=none; b=HMo+HVmo65Lc5OIji0TNIeb1yStNGbSOaP7GGRUuwBshfH/NQoeVCDmEHjA+iwH57/BBJJg7jq6/EHE/YmR/CDbqJcBbSqwQYCHRpaHhZEWjPimX5EjogfxgD3t0IcnkUrEn2rBQODok2eYmcV1IbrzUob0twCU2UVQjInxqKdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737593683; c=relaxed/simple;
	bh=gsO/JbGArZafcZn82XkadKR84LNbCaZkoabHwwUt5Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TNdTfp3gI53QsgFUbCYBHl527DY1o9xctO2rMnrGMEuvCjpCNamhERq/WK2cxAopvAtdTkF5P7UB+lPndSOlnRSNHaiCCvOz2H4P8Xy8A9wuHm5TG2DbsQ0hGKH7ANuPFPondsFdp0ccCZA3eVZuOXIj7ru+ff7w0cifvfBOPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWp/yuGA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2efded08c79so609668a91.0;
        Wed, 22 Jan 2025 16:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737593677; x=1738198477; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vra0Q+RdRHMizv8YA/JJGHnhiaFn9hiP6gCZ43pubgc=;
        b=NWp/yuGAT4OvtNG88NuTBXZTo5hb2zSetk/3Si1Xau6seHCOkIeQgwI0Y/SXctx028
         Sxmh3GtHwShVfg8/NEY8FYf9/7ARvQw0HEqB595+2NqAI2ELC8Fi5D9xZP0Urk7zbltL
         qDpyCa0UU86J1fqFHpMZcq79ybDumbt6Afp9hmYLd/DqmWnJXzlVMPBOUlfk4PrMCI8M
         Orwbq0+VwF1vfC63xyjFqD6hFOyK4pVSkUWwNRxqdLLYBc126SqnJMPbCBx0Lt082kDH
         eukw2Q7BEMcQHxtgQNlbgZg4U2dzhfYvYz3xcYHzk8bnifpjWJFJy/UN0IQ4gemem/9q
         AsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737593677; x=1738198477;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vra0Q+RdRHMizv8YA/JJGHnhiaFn9hiP6gCZ43pubgc=;
        b=YYyXSmtRe3qKhhjROYPOIqZW0qELo8xDf1sHzb9CtyKsFHIt6V1bwWmM3tTDP+zQTu
         +R+gmksK96H9emxhGeAaVMAypQm30AhyHWoiVh+cLGtaJ4WnSvL2v7+vGOxEE5pOqxhD
         312QM1M8lkOL5NdWTlxjDJ540R2P1RM9bS4gIeTRp8zbfwh3678zM8E2AhOGIoG8vnpV
         bkFiG5Y4fBQrUTFPqTKEA2weSxfFvpI6K6SZs5o+pc13xySKqYLCXpNFI2R5sYUTZm+W
         mtkEpYOAiSjjK+AbHOxWBx7PgtK/6r5irMgFI10DyE/MAa99u7QlYQLh1KtO/raEZZXM
         xpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU418QradprlC0cTuwe1eo9oGU6EKJFFnJCEZECAucZ9oqamQmAyK++euPLg7MLXJG85AwLfsP9knwkx+c=@vger.kernel.org, AJvYcCX4vTr4ix9LmbXuFlQmG+HQvTWHrcnujD/BoleU9Nw0BKXKjKZHKa7/J6NclewocAzhWtr3v8DBGHgRNfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIPkiGc0WTN5W3bHr5oxEt7KCtPxVk4jOHaNTCHAfyohwkInkb
	lwnKPpj0opztfaYwhl+eQksRxSR+Omd3oDllAJwinGCkJhrRPBz8
X-Gm-Gg: ASbGncuabHyb57UvHGrW2rNGt1Y1UeOxL81Ypcw5sDNG+AJo5hFwunXpsPRGX9R6pTi
	QMyAk8k+3NY3Xnf8a5M5V1+r5f27TW3H3YcbmLfIwtEX+yCCZ4YygDLHCwLF5TFSjcZdlbaQIg9
	Vb1/UJV9I3FD9Ugjb4gATAp5kAedqiyXtxVI9Uot11sU+ljq9GKXB9KWseT+XwqAtR1kuFa+whH
	F63+0Wc3gRbE6ww1sTlS4ktpA1OPjc/15m+BdCDM+lqGbeT5gsDpRB18RqXjHdeHSLBzwylCFeD
	5hI=
X-Google-Smtp-Source: AGHT+IGo8fLdKovM6qxtCkonHxh7uJo2KUvVrBPDOpYIhCCIpqXKQpBXRmhCZCdN16AUN2gQfZ6A4w==
X-Received: by 2002:a17:90b:524b:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2f782c8fd41mr35751370a91.9.1737593675553;
        Wed, 22 Jan 2025 16:54:35 -0800 (PST)
Received: from [192.168.1.10] ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd309d91sm11502567a12.48.2025.01.22.16.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 16:54:34 -0800 (PST)
From: Alexandre Courbot <gnurou@gmail.com>
Date: Thu, 23 Jan 2025 09:54:14 +0900
Subject: [PATCH] media: add virtio-media driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-virtio-media-v1-1-81e2549b86b9@gmail.com>
X-B4-Tracking: v=1; b=H4sIADWTkWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNL3bLMopLMfN3c1JTMRF0jUwMz86QkI3NTIzMloJaCotS0zAqwcdG
 xtbUAo8cuKV4AAAA=
X-Change-ID: 20241229-virtio-media-25067bb27526
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve <aesteve@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: gurchetansingh@google.com, daniel.almeida@collabora.com, 
 changyeon@google.com, nicolas.dufresne@collabora.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 virtualization@lists.linux.dev, Alexandre Courbot <acourbot@google.com>, 
 Alexandre Courbot <gnurou@gmail.com>
X-Mailer: b4 0.14.2

Add the first version of the virtio-media driver.

This driver acts roughly as a V4L2 relay between user-space and the
virtio virtual device on the host, so it is relatively simple, yet
unconventional. It doesn't use VB2 or other frameworks typically used in
a V4L2 driver, and most of its complexity resides in correctly and
efficiently building the virtio descriptor chain to pass to the host,
avoiding copies whenever possible. This is done by
scatterlist_builder.[ch].

virtio_media_ioctls.c proxies each supported ioctl to the host, using
code generated through macros for ioctls that can be forwarded directly,
which is most of them.

virtio_media_driver.c provides the expected driver hooks, and support
for mmapping and polling.

 This version supports MMAP buffers, while USERPTR buffers can also be
 enabled through a driver option. DMABUF support is still pending.

Signed-off-by: Alexandre Courbot <acourbot@google.com>
Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
This patch adds the virtio-media kernel driver. Virtio-media [1]
encapsulates the V4L2 structures and protocol to enable the
virtualization of host media devices into a guest. It's specification is
in the final stages [2] of being merged and the virtualization of
cameras and video accelerator devices has already been demonstrated
using crosvm [3] and QEmu. v4l2-compliance also passes on all tested
devices, which includes the "simple" virtual test device, proxied host
UVC and vivid devices, and the FFmpeg virtual decoder devices (refer to
[3] in order to test these if desired).

Virtio-media is merged in AOSP [4] and ChromeOS. Upstreaming of the
driver is overdue, but I hope we can start the review process and
converged into something that can be merged.

Limitations:

- The driver is currently only available to little-endian, 64-bit
  kernels. This is because some of the V4L2 structures used for
  communication between guest and host have a layout dependent on the
  architecture, and the virtio-media protocol is standardized on the
  little-endian 64-bit versions. This can be fixed with a conversion
  layer similar to the one used to convert 32-bit ioctls to their 64-bit
  counterpart.
- DMABUF support is currently missing. It should be implemented using
  virtio objects, with possible support for memfds using the
  SHARED_PAGES memory type.
- No support for the media API and requests. While the use-case for
  these is less important on virtual devices where we want to present an
  abstraction as high as possible to limit VM exits, they do exist and
  it would be nice to add behind a virtio feature bit.
- Locking in the driver is still very basic. This is something I want to
  improve before merging, but I didn't want to delay upstream review any
  further.

[1] https://github.com/chromeos/virtio-media
[2] https://lore.kernel.org/virtio-comment/20250120085015.956057-1-aesteve@redhat.com/T/
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
[4] https://android.googlesource.com/platform/external/virtio-media/
---
 MAINTAINERS                                |    6 +
 drivers/media/Kconfig                      |   13 +
 drivers/media/Makefile                     |    2 +
 drivers/media/virtio/Makefile              |    9 +
 drivers/media/virtio/protocol.h            |  289 ++++++
 drivers/media/virtio/scatterlist_builder.c |  564 ++++++++++++
 drivers/media/virtio/scatterlist_builder.h |  111 +++
 drivers/media/virtio/session.h             |  109 +++
 drivers/media/virtio/virtio_media.h        |   93 ++
 drivers/media/virtio/virtio_media_driver.c |  960 ++++++++++++++++++++
 drivers/media/virtio/virtio_media_ioctls.c | 1302 ++++++++++++++++++++++++++++
 include/uapi/linux/virtio_ids.h            |    1 +
 12 files changed, 3459 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fa7c5728f1e64d031f4a47b6fce1db484ce0fc2..42319dc40b2e902d3a2d5b7cca030006bc575979 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24920,6 +24920,12 @@ S:	Maintained
 F:	drivers/iommu/virtio-iommu.c
 F:	include/uapi/linux/virtio_iommu.h
 
+VIRTIO MEDIA DRIVER
+M:	Alexandre Courbot <gnurou@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/virtio/
+
 VIRTIO MEM DRIVER
 M:	David Hildenbrand <david@redhat.com>
 L:	virtualization@lists.linux.dev
diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 6abc9302cd84d8563b7877d3d3da4b7e05a6b5d2..12bbb169c0b04565271092c7ac608b0fb11c0244 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -230,6 +230,19 @@ source "drivers/media/platform/Kconfig"
 source "drivers/media/mmc/Kconfig"
 endif
 
+config MEDIA_VIRTIO
+	tristate "Virtio-media Driver"
+	depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITTLE_ENDIAN))
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_MEMOPS
+	help
+	  Enables the virtio-media driver.
+
+	  This driver is used to virtualize media devices such as cameras or
+	  decoders from a host into a guest using the V4L2 protocol.
+
+	  If unsure, say N.
+
 if MEDIA_TEST_SUPPORT
 source "drivers/media/test-drivers/Kconfig"
 endif
diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index 20fac24e4f0f13134c12cd859141c8b0387030fa..7a1377661919701f27f4fa2b5ee2dcb1045deb3c 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -25,6 +25,8 @@ obj-y += rc/
 
 obj-$(CONFIG_CEC_CORE) += cec/
 
+obj-$(CONFIG_MEDIA_VIRTIO) += virtio/
+
 #
 # Finally, merge the drivers that require the core
 #
diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..16f91304420d70e1212cc46f3b12f314a510c051
--- /dev/null
+++ b/drivers/media/virtio/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the virtio-media device driver.
+
+virtio-media-objs := scatterlist_builder.o virtio_media_ioctls.o \
+			virtio_media_driver.o
+
+obj-$(CONFIG_MEDIA_VIRTIO) += virtio-media.o
+
diff --git a/drivers/media/virtio/protocol.h b/drivers/media/virtio/protocol.h
new file mode 100644
index 0000000000000000000000000000000000000000..473e9e2fd97d47f54c320f135f674af953d0ace8
--- /dev/null
+++ b/drivers/media/virtio/protocol.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Definitions of virtio-media protocol structures.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_PROTOCOL_H
+#define __VIRTIO_MEDIA_PROTOCOL_H
+
+#include "linux/videodev2.h"
+#include <linux/videodev2.h>
+
+/*
+ * Virtio protocol definition.
+ */
+
+/**
+ * struct virtio_media_cmd_header - Header for all virtio-media commands.
+ * @cmd: one of VIRTIO_MEDIA_CMD_*.
+ * @__reserved: must be set to zero by the driver.
+ *
+ * This header starts all commands from the driver to the device on the
+ * commandq.
+ */
+struct virtio_media_cmd_header {
+	u32 cmd;
+	u32 __reserved;
+};
+
+/**
+ * struct virtio_media_resp_header - Header for all virtio-media responses.
+ * @status: 0 if the command was successful, or one of the standard Linux error
+ * codes.
+ * @__reserved: must be set to zero by the device.
+ *
+ * This header starts all responses from the device to the driver on the
+ * commandq.
+ */
+struct virtio_media_resp_header {
+	u32 status;
+	u32 __reserved;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
+ *
+ * This is the equivalent of calling `open` on a V4L2 device node. Upon
+ * success, a session id is returned which can be used to perform other
+ * commands on the session, notably ioctls.
+ */
+#define VIRTIO_MEDIA_CMD_OPEN 1
+
+/**
+ * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_OPEN.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
+ */
+struct virtio_media_cmd_open {
+	struct virtio_media_cmd_header hdr;
+};
+
+/**
+ * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CMD_OPEN.
+ * @hdr: header containing the status of the command.
+ * @session_id: if hdr.status == 0, contains the id of the newly created session.
+ * @__reserved: must be set to zero by the device.
+ */
+struct virtio_media_resp_open {
+	struct virtio_media_resp_header hdr;
+	u32 session_id;
+	u32 __reserved;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
+ *
+ * This is the equivalent of calling `close` on a previously opened V4L2
+ * session. All resources associated with this session will be freed and the
+ * session ID shall not be used again after queueing this command.
+ *
+ * This command does not require a response from the device.
+ */
+#define VIRTIO_MEDIA_CMD_CLOSE 2
+
+/**
+ * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD_CLOSE.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
+ * @session_id: id of the session to close.
+ * @__reserved: must be set to zero by the driver.
+ */
+struct virtio_media_cmd_close {
+	struct virtio_media_cmd_header hdr;
+	u32 session_id;
+	u32 __reserved;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
+ *
+ * This command asks the device to run one of the `VIDIOC_*` ioctls on the
+ * active session.
+ *
+ * The code of the ioctl is extracted from the VIDIOC_* definitions in
+ * `videodev2.h`, and consists of the second argument of the `_IO*` macro.
+ *
+ * Each ioctl has a payload, which is defined by the third argument of the
+ * `_IO*` macro defining it. It can be writable by the driver (`_IOW`), the
+ * device (`_IOR`), or both (`_IOWR`).
+ *
+ * If an ioctl is writable by the driver, it must be followed by a
+ * driver-writable descriptor containing the payload.
+ *
+ * If an ioctl is writable by the device, it must be followed by a
+ * device-writable descriptor of the size of the payload that the device will
+ * write into.
+ *
+ */
+#define VIRTIO_MEDIA_CMD_IOCTL 3
+
+/**
+ * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD_IOCTL.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
+ * @session_id: id of the session to run the ioctl on.
+ * @code: code of the ioctl to run.
+ */
+struct virtio_media_cmd_ioctl {
+	struct virtio_media_cmd_header hdr;
+	u32 session_id;
+	u32 code;
+};
+
+/**
+ * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_CMD_IOCTL.
+ * @hdr: header containing the status of the ioctl.
+ */
+struct virtio_media_resp_ioctl {
+	struct virtio_media_resp_header hdr;
+};
+
+/**
+ * struct virtio_media_sg_entry - Description of part of a scattered guest memory.
+ * @start: start guest address of the memory segment.
+ * @len: length of this memory segment.
+ * @__reserved: must be set to zero by the driver.
+ */
+struct virtio_media_sg_entry {
+	u64 start;
+	u32 len;
+	u32 __reserved;
+};
+
+/**
+ * enum virtio_media_memory - Memory types supported by virtio-media.
+ * @VIRTIO_MEDIA_MMAP: memory allocated and managed by device. Can be mapped
+ * into the guest using VIRTIO_MEDIA_CMD_MMAP.
+ * @VIRTIO_MEDIA_SHARED_PAGES: memory allocated by the driver. Passed to the
+ * device using virtio_media_sg_entry.
+ * @VIRTIO_MEDIA_OBJECT: memory backed by a virtio object.
+ */
+enum virtio_media_memory {
+	VIRTIO_MEDIA_MMAP = V4L2_MEMORY_MMAP,
+	VIRTIO_MEDIA_SHARED_PAGES = V4L2_MEMORY_USERPTR,
+	VIRTIO_MEDIA_OBJECT = V4L2_MEMORY_DMABUF,
+};
+
+#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
+
+/**
+ * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the driver's
+ * address space.
+ *
+ */
+#define VIRTIO_MEDIA_CMD_MMAP 4
+
+/**
+ * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_MMAP.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
+ * @session_id: ID of the session we are mapping for.
+ * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
+ * @offset: mem_offset field of the plane to map, as returned by VIDIOC_QUERYBUF.
+ */
+struct virtio_media_cmd_mmap {
+	struct virtio_media_cmd_header hdr;
+	u32 session_id;
+	u32 flags;
+	u32 offset;
+};
+
+/**
+ * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CMD_MMAP.
+ * @hdr: header containing the status of the command.
+ * @driver_addr: offset into SHM region 0 of the start of the mapping.
+ * @len: length of the mapping.
+ */
+struct virtio_media_resp_mmap {
+	struct virtio_media_resp_header hdr;
+	u64 driver_addr;
+	u64 len;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped using
+ * VIRTIO_MEDIA_CMD_MMAP.
+ */
+#define VIRTIO_MEDIA_CMD_MUNMAP 5
+
+/**
+ * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CMD_MUNMAP.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
+ * @driver_addr: offset into SHM region 0 at which the buffer has been previously
+ * mapped.
+ */
+struct virtio_media_cmd_munmap {
+	struct virtio_media_cmd_header hdr;
+	u64 driver_addr;
+};
+
+/**
+ * struct virtio_media_resp_munmap - Device response for VIRTIO_MEDIA_CMD_MUNMAP.
+ * @hdr: header containing the status of the command.
+ */
+struct virtio_media_resp_munmap {
+	struct virtio_media_resp_header hdr;
+};
+
+#define VIRTIO_MEDIA_EVT_ERROR 0
+#define VIRTIO_MEDIA_EVT_DQBUF 1
+#define VIRTIO_MEDIA_EVT_EVENT 2
+
+/**
+ * struct virtio_media_event_header - Header for events on the eventq.
+ * @event: one of VIRTIO_MEDIA_EVT_*
+ * @session_id: ID of the session the event applies to.
+ */
+struct virtio_media_event_header {
+	u32 event;
+	u32 session_id;
+};
+
+/**
+ * struct virtio_media_event_error - Unrecoverable device-side error.
+ * @hdr: header for the event.
+ * @errno: error code describing the kind of error that occurred.
+ * @__reserved: must to set to zero by the device.
+ *
+ * Upon receiving this event, the session mentioned in the header is considered
+ * corrupted and closed.
+ *
+ */
+struct virtio_media_event_error {
+	struct virtio_media_event_header hdr;
+	u32 errno;
+	u32 __reserved;
+};
+
+#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
+
+/**
+ * struct virtio_media_event_dqbuf - Dequeued buffer event.
+ * @hdr: header for the event.
+ * @buffer: struct v4l2_buffer describing the buffer that has been dequeued.
+ * @planes: plane information for the dequeued buffer.
+ *
+ * This event is used to signal that a buffer is not being used anymore by the
+ * device and is returned to the driver.
+ */
+struct virtio_media_event_dqbuf {
+	struct virtio_media_event_header hdr;
+	struct v4l2_buffer buffer;
+	struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
+};
+
+/**
+ * struct virtio_media_event_event - V4L2 event.
+ * @hdr: header for the event.
+ * @event: description of the event that occurred.
+ *
+ * This event signals that a V4L2 event has been emitted for a session.
+ */
+struct virtio_media_event_event {
+	struct virtio_media_event_header hdr;
+	struct v4l2_event event;
+};
+
+/* Maximum size of an event. We will queue descriptors of this size on the eventq. */
+#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event_dqbuf)
+
+#endif // __VIRTIO_MEDIA_PROTOCOL_H
diff --git a/drivers/media/virtio/scatterlist_builder.c b/drivers/media/virtio/scatterlist_builder.c
new file mode 100644
index 0000000000000000000000000000000000000000..a9440bc35d4f72f213718f64ab34f629a0b9b4c6
--- /dev/null
+++ b/drivers/media/virtio/scatterlist_builder.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
+
+/*
+ * Scatterlist builder helpers for virtio-media.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#include "linux/videodev2.h"
+#include <linux/moduleparam.h>
+#include <linux/scatterlist.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-memops.h>
+
+#include "protocol.h"
+#include "scatterlist_builder.h"
+#include "session.h"
+
+/*
+ * If set to ``true``, then the driver will always copy the data passed to the
+ * host into the shadow buffer (instead of trying to map the source memory into
+ * the SG table directly when possible).
+ */
+static bool always_use_shadow_buffer;
+module_param(always_use_shadow_buffer, bool, 0660);
+
+/* Convert a V4L2 IOCTL into the IOCTL code we can give to the host */
+#define VIRTIO_MEDIA_IOCTL_CODE(IOCTL) ((IOCTL >> _IOC_NRSHIFT) & _IOC_NRMASK)
+
+/**
+ * scatterlist_builder_add_descriptor() - Add a descriptor to the chain.
+ * @builder: builder to use.
+ * @desc_index: index of the descriptor to add.
+ *
+ * Returns ``-ENOSPC`` if ``sgs`` is already full.
+ */
+int scatterlist_builder_add_descriptor(struct scatterlist_builder *builder,
+				       size_t desc_index)
+{
+	if (builder->cur_sg >= builder->num_sgs)
+		return -ENOSPC;
+	builder->sgs[builder->cur_sg++] = &builder->descs[desc_index];
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_data() - Append arbitrary data to the descriptor chain.
+ * @builder: builder to use.
+ * @data: pointer to the data to add to the descriptor chain.
+ * @len: length of the data to add.
+ *
+ * @data will either be directly referenced, or copied into the shadow buffer
+ * to be referenced from there.
+ */
+int scatterlist_builder_add_data(struct scatterlist_builder *builder,
+				 void *data, size_t len)
+{
+	const size_t cur_desc = builder->cur_desc;
+
+	if (len == 0)
+		return 0;
+
+	if (builder->cur_desc >= builder->num_descs)
+		return -ENOSPC;
+
+	if (!always_use_shadow_buffer && virt_addr_valid(data + len)) {
+		/*
+		 * If "data" is in the 1:1 physical memory mapping then we can
+		 * use a single SG entry and avoid copying.
+		 */
+		struct page *page = virt_to_page(data);
+		size_t offset = (((size_t)data) & ~PAGE_MASK);
+		struct scatterlist *next_desc =
+			&builder->descs[builder->cur_desc];
+
+		memset(next_desc, 0, sizeof(*next_desc));
+		sg_set_page(next_desc, page, len, offset);
+		builder->cur_desc++;
+	} else if (!always_use_shadow_buffer && is_vmalloc_addr(data)) {
+		int prev_pfn = -2;
+
+		/*
+		 * If "data" has been vmalloc'ed, we need at most one entry per
+		 * memory page but can avoid copying.
+		 */
+		while (len > 0) {
+			struct page *page = vmalloc_to_page(data);
+			int cur_pfn = page_to_pfn(page);
+			/* All pages but the first will start at offset 0. */
+			unsigned long offset =
+				(((unsigned long)data) & ~PAGE_MASK);
+			size_t len_in_page = min(PAGE_SIZE - offset, len);
+			struct scatterlist *next_desc =
+				&builder->descs[builder->cur_desc];
+
+			if (builder->cur_desc >= builder->num_descs)
+				return -ENOSPC;
+
+			/* Optimize contiguous pages */
+			if (cur_pfn == prev_pfn + 1) {
+				(next_desc - 1)->length += len_in_page;
+			} else {
+				memset(next_desc, 0, sizeof(*next_desc));
+				sg_set_page(next_desc, page, len_in_page,
+					    offset);
+				builder->cur_desc++;
+			}
+			data += len_in_page;
+			len -= len_in_page;
+			prev_pfn = cur_pfn;
+		}
+	} else {
+		/*
+		 * As a last resort, copy into the shadow buffer and reference
+		 * it with a single SG entry. Calling
+		 * `scatterlist_builder_retrieve_data` will be necessary to copy
+		 * the data written by the device back into @data.
+		 */
+		void *shadow_buffer =
+			builder->shadow_buffer + builder->shadow_buffer_pos;
+		struct page *page = virt_to_page(shadow_buffer);
+		unsigned long offset =
+			(((unsigned long)shadow_buffer) & ~PAGE_MASK);
+		struct scatterlist *next_desc =
+			&builder->descs[builder->cur_desc];
+
+		if (len >
+		    builder->shadow_buffer_size - builder->shadow_buffer_pos)
+			return -ENOSPC;
+
+		memcpy(shadow_buffer, data, len);
+		memset(next_desc, 0, sizeof(*next_desc));
+		sg_set_page(next_desc, page, len, offset);
+		builder->cur_desc++;
+		builder->shadow_buffer_pos += len;
+	}
+
+	sg_mark_end(&builder->descs[builder->cur_desc - 1]);
+	return scatterlist_builder_add_descriptor(builder, cur_desc);
+}
+
+/**
+ * scatterlist_builder_retrieve_data() - Retrieve a response written by the
+ * device on the shadow buffer.
+ * @builder: builder to use.
+ * @sg_index: index of the descriptor to read from.
+ * @data: destination for the shadowed data.
+ *
+ * If the shadow buffer is pointed to by the descriptor at index @sg_index of
+ * the chain, then ``sg->length`` bytes are copied back from it into @data.
+ * Otherwise nothing is done since the device has written into @data directly.
+ *
+ * @data must have originally been added by ``scatterlist_builder_add_data`` as
+ * the same size as passed to ``scatterlist_builder_add_data`` will be copied
+ * back.
+ */
+int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
+				      size_t sg_index, void *data)
+{
+	void *shadow_buf = builder->shadow_buffer;
+	struct scatterlist *sg;
+	void *kaddr;
+
+	/* We can only retrieve from the range of sgs currently set. */
+	if (sg_index >= builder->cur_sg)
+		return -ERANGE;
+
+	sg = builder->sgs[sg_index];
+	kaddr = pfn_to_kaddr(page_to_pfn(sg_page(sg))) + sg->offset;
+
+	if (kaddr >= shadow_buf &&
+	    kaddr < shadow_buf + VIRTIO_SHADOW_BUF_SIZE) {
+		if (kaddr + sg->length >= shadow_buf + VIRTIO_SHADOW_BUF_SIZE)
+			return -EINVAL;
+
+		memcpy(data, kaddr, sg->length);
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_ioctl_cmd() - Add an ioctl command to the descriptor
+ * chain.
+ * @builder: builder to use.
+ * @session: session on behalf of which the ioctl command is added.
+ * @ioctl_code: code of the ioctl to add (i.e. ``VIDIOC_*``).
+ */
+int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
+				      struct virtio_media_session *session,
+				      u32 ioctl_code)
+{
+	struct virtio_media_cmd_ioctl *cmd_ioctl = &session->cmd.ioctl;
+
+	cmd_ioctl->hdr.cmd = VIRTIO_MEDIA_CMD_IOCTL;
+	cmd_ioctl->session_id = session->id;
+	cmd_ioctl->code = VIRTIO_MEDIA_IOCTL_CODE(ioctl_code);
+
+	return scatterlist_builder_add_data(builder, cmd_ioctl,
+					    sizeof(*cmd_ioctl));
+}
+
+/**
+ * scatterlist_builder_add_ioctl_resp() - Add storage to receive an ioctl
+ * response to the descriptor chain.
+ * @builder: builder to use.
+ * @session: session on behalf of which the ioctl response is added.
+ */
+int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
+				       struct virtio_media_session *session)
+{
+	struct virtio_media_resp_ioctl *resp_ioctl = &session->resp.ioctl;
+
+	return scatterlist_builder_add_data(builder, resp_ioctl,
+					    sizeof(*resp_ioctl));
+}
+
+/**
+ * __scatterlist_builder_add_userptr() - Add user pages to @builder.
+ * @builder: builder to use.
+ * @userptr: pointer to userspace memory that we want to add.
+ * @length: length of the data to add.
+ * @sg_list: output parameter. Upon success, points to the area of the shadow
+ * buffer containing the array of SG entries to be added to the descriptor
+ * chain.
+ * @nents: output parameter. Upon success, contains the number of entries
+ * pointed to by @sg_list.
+ *
+ * Data referenced by userspace pointers can be potentially large and very
+ * scattered, which could overwhelm the descriptor chain if added as-is. For
+ * these, we instead build an array of ``struct virtio_media_sg_entry`` in the
+ * shadow buffer and reference it using a single descriptor.
+ *
+ * This function is a helper to perform that. Callers should then add the
+ * descriptor to the chain properly.
+ *
+ * Returns -EFAULT if @userptr is not a valid user address, which is a case the
+ * driver should consider as "normal" operation. All other failures signal a
+ * problem with the driver.
+ */
+static int
+__scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
+				  unsigned long userptr, unsigned long length,
+				  struct virtio_media_sg_entry **sg_list,
+				  int *nents)
+{
+	struct sg_table sg_table = {};
+	struct frame_vector *framevec;
+	struct scatterlist *sg_iter;
+	struct page **pages;
+	const unsigned int offset = userptr & ~PAGE_MASK;
+	unsigned int pages_count;
+	size_t entries_size;
+	int i;
+	int ret;
+
+	framevec = vb2_create_framevec(userptr, length, true);
+	if (IS_ERR(framevec)) {
+		if (PTR_ERR(framevec) != -EFAULT) {
+			pr_warn("error %ld creating frame vector for userptr 0x%lx, length 0x%lx\n",
+				PTR_ERR(framevec), userptr, length);
+		} else {
+			/* -EINVAL is expected in case of invalid userptr. */
+			framevec = ERR_PTR(-EINVAL);
+		}
+		return PTR_ERR(framevec);
+	}
+
+	pages = frame_vector_pages(framevec);
+	if (IS_ERR(pages)) {
+		pr_warn("error getting vector pages\n");
+		ret = PTR_ERR(pages);
+		goto done;
+	}
+	pages_count = frame_vector_count(framevec);
+	ret = sg_alloc_table_from_pages(&sg_table, pages, pages_count, offset,
+					length, 0);
+	if (ret) {
+		pr_warn("error creating sg table\n");
+		goto done;
+	}
+
+	/* Allocate our actual SG in the shadow buffer. */
+	*nents = sg_nents(sg_table.sgl);
+	entries_size = sizeof(**sg_list) * *nents;
+	if (builder->shadow_buffer_pos + entries_size >
+	    builder->shadow_buffer_size) {
+		ret = -ENOMEM;
+		goto free_sg;
+	}
+
+	*sg_list = builder->shadow_buffer + builder->shadow_buffer_pos;
+	builder->shadow_buffer_pos += entries_size;
+
+	for_each_sgtable_sg(&sg_table, sg_iter, i) {
+		struct virtio_media_sg_entry *sg_entry = &(*sg_list)[i];
+
+		sg_entry->start = sg_phys(sg_iter);
+		sg_entry->len = sg_iter->length;
+	}
+
+free_sg:
+	sg_free_table(&sg_table);
+
+done:
+	vb2_destroy_framevec(framevec);
+	return ret;
+}
+
+/**
+ * scatterlist_builder_add_userptr() - Add a user-memory buffer using an array
+ * of ``struct virtio_media_sg_entry``.
+ * @builder: builder to use.
+ * @userptr: pointer to userspace memory that we want to add.
+ * @length: length of the data to add.
+ *
+ * Upon success, an array of ``struct virtio_media_sg_entry`` referencing
+ * @userptr has been built into the shadow buffer, and that array added to the
+ * descriptor chain.
+ */
+static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
+					   unsigned long userptr,
+					   unsigned long length)
+{
+	int ret;
+	int nents;
+	struct virtio_media_sg_entry *sg_list;
+
+	ret = __scatterlist_builder_add_userptr(builder, userptr, length,
+						&sg_list, &nents);
+	if (ret)
+		return ret;
+
+	ret = scatterlist_builder_add_data(builder, sg_list,
+					   sizeof(*sg_list) * nents);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_buffer() - Add a ``v4l2_buffer`` and its planes to
+ * the descriptor chain.
+ * @builder: builder to use.
+ * @b: ``v4l2_buffer`` to add.
+ */
+int scatterlist_builder_add_buffer(struct scatterlist_builder *builder,
+				   struct v4l2_buffer *b)
+{
+	int i;
+	int ret;
+
+	/* Fixup: plane length must be zero if userptr is NULL */
+	if (!V4L2_TYPE_IS_MULTIPLANAR(b->type) &&
+	    b->memory == V4L2_MEMORY_USERPTR && b->m.userptr == 0)
+		b->length = 0;
+
+	/* v4l2_buffer */
+	ret = scatterlist_builder_add_data(builder, b, sizeof(*b));
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type) && b->length > 0) {
+		/* Fixup: plane length must be zero if userptr is NULL */
+		if (b->memory == V4L2_MEMORY_USERPTR) {
+			for (i = 0; i < b->length; i++) {
+				struct v4l2_plane *plane = &b->m.planes[i];
+
+				if (plane->m.userptr == 0)
+					plane->length = 0;
+			}
+		}
+
+		/* Array of v4l2_planes */
+		ret = scatterlist_builder_add_data(builder, b->m.planes,
+						   sizeof(struct v4l2_plane) *
+							   b->length);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_buffer_userptr() - Add the payload of a ``USERTPR``
+ * v4l2_buffer to the descriptor chain.
+ * @builder: builder to use.
+ * @b: ``v4l2_buffer`` which ``USERPTR`` payload we want to add.
+ *
+ * Add an array of ``virtio_media_sg_entry`` pointing to a ``USERPTR`` buffer's
+ * contents. Does nothing if the buffer is not of type ``USERPTR``. This is
+ * split out of :ref:`scatterlist_builder_add_buffer` because we only want to
+ * add these to the device-readable part of the descriptor chain.
+ */
+int scatterlist_builder_add_buffer_userptr(struct scatterlist_builder *builder,
+					   struct v4l2_buffer *b)
+{
+	int i;
+	int ret;
+
+	if (b->memory != V4L2_MEMORY_USERPTR)
+		return 0;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
+		for (i = 0; i < b->length; i++) {
+			struct v4l2_plane *plane = &b->m.planes[i];
+
+			if (b->memory == V4L2_MEMORY_USERPTR &&
+			    plane->length > 0) {
+				ret = scatterlist_builder_add_userptr(
+					builder, plane->m.userptr,
+					plane->length);
+				if (ret)
+					return ret;
+			}
+		}
+	} else if (b->length > 0) {
+		ret = scatterlist_builder_add_userptr(builder, b->m.userptr,
+						      b->length);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_retrieve_buffer() - Retrieve a v4l2_buffer written by
+ * the device on the shadow buffer, if needed.
+ * @builder: builder to use.
+ * @sg_index: index of the first SG entry of the buffer in the builder's
+ * descriptor chain.
+ * @b: v4l2_buffer to copy shadow buffer data into.
+ * @orig_planes: the original ``planes`` pointer, to be restored if the buffer
+ * is multi-planar.
+ *
+ * If the v4l2_buffer pointed by @buffer_sgs was copied into the shadow buffer,
+ * then its updated content is copied back into @b. Otherwise nothing is done
+ * as the device has written into @b directly.
+ *
+ * @orig_planes is used to restore the original ``planes`` pointer in case it
+ * gets modified by the host. The specification stipulates that the host should
+ * not modify it, but we enforce this for additional safety.
+ */
+int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *builder,
+					size_t sg_index, struct v4l2_buffer *b,
+					struct v4l2_plane *orig_planes)
+{
+	int ret;
+
+	ret = scatterlist_builder_retrieve_data(builder, sg_index++, b);
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
+		b->m.planes = orig_planes;
+
+		if (orig_planes != NULL) {
+			ret = scatterlist_builder_retrieve_data(
+				builder, sg_index++, b->m.planes);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_ext_ctrls() - Add a v4l2_ext_controls and its
+ * controls to @builder.
+ * @builder: builder to use.
+ * @ctrls: ``struct v4l2_ext_controls`` to add.
+ *
+ * Add @ctrls and its array of `struct v4l2_ext_control` to the descriptor chain.
+ */
+int scatterlist_builder_add_ext_ctrls(struct scatterlist_builder *builder,
+				      struct v4l2_ext_controls *ctrls)
+{
+	int ret;
+
+	/* v4l2_ext_controls */
+	ret = scatterlist_builder_add_data(builder, ctrls, sizeof(*ctrls));
+	if (ret)
+		return ret;
+
+	if (ctrls->count > 0) {
+		/* array of v4l2_controls */
+		ret = scatterlist_builder_add_data(builder, ctrls->controls,
+						   sizeof(ctrls->controls[0]) *
+							   ctrls->count);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_ext_ctrls_userptrs() - Add the userspace payloads of
+ * a ``struct v4l2_ext_controls`` to the descriptor chain.
+ * @builder: builder to use.
+ * @ctrls: ``struct v4l2_ext_controls`` from which we want to add the userspace payload of.
+ *
+ * Add the userspace payloads of @ctrls to the descriptor chain. This is split
+ * out of :ref:`scatterlist_builder_add_ext_ctrls` because we only want to add
+ * these to the device-readable part of the descriptor chain.
+ */
+int scatterlist_builder_add_ext_ctrls_userptrs(
+	struct scatterlist_builder *builder, struct v4l2_ext_controls *ctrls)
+{
+	int i;
+	int ret;
+
+	/* Pointers to user memory in individual controls */
+	for (i = 0; i < ctrls->count; i++) {
+		struct v4l2_ext_control *ctrl = &ctrls->controls[i];
+
+		if (ctrl->size > 0) {
+			ret = scatterlist_builder_add_userptr(
+				builder, (unsigned long)ctrl->ptr, ctrl->size);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_retrieve_ext_ctrls() - Retrieve controls written by the
+ * device on the shadow buffer, if needed.
+ * @builder: builder to use.
+ * @sg_index: index of the first SG entry of the controls in the builder's
+ * descriptor chain.
+ * @ctrls: ``struct v4l2_ext_controls`` to copy shadow buffer data into.
+ *
+ * If the shadow buffer is pointed to by @sg, copy its content back into @ctrls.
+ */
+int scatterlist_builder_retrieve_ext_ctrls(struct scatterlist_builder *builder,
+					   size_t sg_index,
+					   struct v4l2_ext_controls *ctrls)
+{
+	struct v4l2_ext_control *controls_backup = ctrls->controls;
+	int ret;
+
+	ret = scatterlist_builder_retrieve_data(builder, sg_index++, ctrls);
+	if (ret)
+		return ret;
+
+	ctrls->controls = controls_backup;
+
+	if (ctrls->count > 0 && ctrls->controls) {
+		ret = scatterlist_builder_retrieve_data(builder, sg_index++,
+							ctrls->controls);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/virtio/scatterlist_builder.h b/drivers/media/virtio/scatterlist_builder.h
new file mode 100644
index 0000000000000000000000000000000000000000..c8323c31ac21953580a0b4a4cb366841e510666f
--- /dev/null
+++ b/drivers/media/virtio/scatterlist_builder.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Scatterlist builder helpers for virtio-media.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
+#define __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
+
+#include <linux/scatterlist.h>
+
+#include "session.h"
+
+/**
+ * struct scatterlist_builder - helper to build a scatterlist from data.
+ * @descs: pool of descriptors to use.
+ * @num_descs: number of entries in descs.
+ * @cur_desc: next descriptor to be used in @descs.
+ * @shadow_buffer: pointer to a shadow buffer where elements that cannot be
+ * mapped directly into the scatterlist get copied.
+ * @shadow_buffer_size: size of @shadow_buffer.
+ * @shadow_buffer_pos: current position in @shadow_buffer.
+ * @sgs: descriptor chain to eventually pass to virtio functions.
+ * @num_sgs: total number of entries in @sgs.
+ * @cur_sg: next entry in @sgs to be used.
+ *
+ * Virtio passes data from the driver to the device (through e.g.
+ * ``virtqueue_add_sgs``) via a scatterlist that the device interprets as a
+ * linear view over scattered driver memory.
+ *
+ * In virtio-media, the payload of ioctls from user-space can for the most part
+ * be passed as-is, or after slight modification, which makes it tempting to
+ * just forward the ioctl payload received from user-space as-is instead of
+ * doing another copy into a dedicated buffer. This structure helps with this.
+ *
+ * virtio-media descriptor chains are typically made of the following parts:
+ *
+ * Device-readable:
+ * - A command structure, i.e. ``virtio_media_cmd_*``,
+ * - An ioctl payload (one of the regular ioctl parameters),
+ * - (optionally) arrays of ``virtio_media_sg_entry`` describing the content of
+ *   buffers in guest memory.
+ *
+ * Device-writable:
+ * - A response structure, i.e. ``virtio_media_resp_*``,
+ * - An ioctl payload, that the device will write to.
+ *
+ * This structure helps laying out the descriptor chain into its @sgs member in
+ * an optimal way, by building a scatterlist adapted to the originating memory
+ * of the data we want to pass to the device while avoiding copies when
+ * possible.
+ *
+ * It is made of a pool of ``struct scatterlist`` (@descs) that is used to
+ * build the final descriptor chain @sgs, and a @shadow_buffer where data that
+ * cannot (or should not) be mapped directly by the host can be temporarily
+ * copied.
+ */
+struct scatterlist_builder {
+	struct scatterlist *descs;
+	size_t num_descs;
+	size_t cur_desc;
+
+	void *shadow_buffer;
+	size_t shadow_buffer_size;
+	size_t shadow_buffer_pos;
+
+	struct scatterlist **sgs;
+	size_t num_sgs;
+	size_t cur_sg;
+};
+
+int scatterlist_builder_add_descriptor(struct scatterlist_builder *builder,
+				       size_t desc_index);
+
+int scatterlist_builder_add_data(struct scatterlist_builder *builder,
+				 void *data, size_t len);
+
+int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
+				      size_t sg_index, void *data);
+
+int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
+				      struct virtio_media_session *session,
+				      u32 ioctl_code);
+
+int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
+				       struct virtio_media_session *session);
+
+int scatterlist_builder_add_buffer(struct scatterlist_builder *builder,
+				   struct v4l2_buffer *buffer);
+
+int scatterlist_builder_add_buffer_userptr(struct scatterlist_builder *builder,
+					   struct v4l2_buffer *b);
+
+int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *builder,
+					size_t sg_index,
+					struct v4l2_buffer *buffer,
+					struct v4l2_plane *orig_planes);
+
+int scatterlist_builder_add_ext_ctrls(struct scatterlist_builder *builder,
+				      struct v4l2_ext_controls *ctrls);
+
+int scatterlist_builder_add_ext_ctrls_userptrs(
+	struct scatterlist_builder *builder, struct v4l2_ext_controls *ctrls);
+
+int scatterlist_builder_retrieve_ext_ctrls(struct scatterlist_builder *builder,
+					   size_t sg_index,
+					   struct v4l2_ext_controls *ctrls);
+
+#endif // __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
diff --git a/drivers/media/virtio/session.h b/drivers/media/virtio/session.h
new file mode 100644
index 0000000000000000000000000000000000000000..b643d0d950477d56d4bb5db481818a3912af5c1f
--- /dev/null
+++ b/drivers/media/virtio/session.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Definitions of virtio-media session related structures.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_SESSION_H
+#define __VIRTIO_MEDIA_SESSION_H
+
+#include <linux/scatterlist.h>
+#include <media/v4l2-fh.h>
+
+#include "protocol.h"
+
+#define VIRTIO_MEDIA_LAST_QUEUE (V4L2_BUF_TYPE_META_OUTPUT)
+
+/*
+ * Size of the per-session virtio shadow and event buffers. 16K should be
+ * enough to contain everything we need.
+ */
+#define VIRTIO_SHADOW_BUF_SIZE 0x4000
+
+/**
+ * struct virtio_media_buffer - Current state of a buffer.
+ * @buffer: ``struct v4l2_buffer`` with current information about the buffer.
+ * @planes: backing planes array for @buffer.
+ * @list: link into the list of buffers pending dequeue.
+ */
+struct virtio_media_buffer {
+	struct v4l2_buffer buffer;
+	struct v4l2_plane planes[VIDEO_MAX_PLANES];
+	struct list_head list;
+};
+
+/**
+ * struct virtio_media_queue_state - Represents the state of a V4L2 queue.
+ * @streaming: Whether the queue is currently streaming.
+ * @allocated_bufs: How many buffers are currently allocated.
+ * @is_capture_last: set to true when the last buffer has been received on a
+ * capture queue, so we can return -EPIPE on subsequent DQBUF requests.
+ * @buffers: Buffer state array of size @allocated_bufs.
+ * @queued_bufs: How many buffers are currently queued on the device.
+ * @pending_dqbufs: Buffers that are available for being dequeued.
+ */
+struct virtio_media_queue_state {
+	bool streaming;
+	size_t allocated_bufs;
+	bool is_capture_last;
+
+	struct virtio_media_buffer *buffers;
+	size_t queued_bufs;
+	struct list_head pending_dqbufs;
+};
+
+/**
+ * struct virtio_media_session - A session on a virtio_media device.
+ * @fh: file handler for the session.
+ * @id: session ID used to communicate with the device.
+ * @nonblocking_dequeue: whether dequeue should block or not (nonblocking if
+ * file opened with O_NONBLOCK).
+ * @uses_mplane: whether the queues for this session use the MPLANE API or not.
+ * @cmd: union of session-related commands. A session can have one command currently running.
+ * @resp: union of session-related responses. A session can wait on one command only.
+ * @shadow_buf: shadow buffer where data to be added to the descriptor chain can
+ * be staged before being sent to the device.
+ * @command_sgs: SG table gathering descriptors for a given command and its response.
+ * @queues: state of all the queues for this session.
+ * @queues_lock: protects all members fo the queues for this session.
+ * virtio_media_queue_state`.
+ * @dqbuf_wait: waitqueue for dequeued buffers, if ``VIDIOC_DQBUF`` needs to
+ * block or when polling.
+ * @list: link into the list of sessions for the device.
+ */
+struct virtio_media_session {
+	struct v4l2_fh fh;
+	u32 id;
+	bool nonblocking_dequeue;
+	bool uses_mplane;
+
+	union {
+		struct virtio_media_cmd_close close;
+		struct virtio_media_cmd_ioctl ioctl;
+		struct virtio_media_cmd_mmap mmap;
+	} cmd;
+
+	union {
+		struct virtio_media_resp_ioctl ioctl;
+		struct virtio_media_resp_mmap mmap;
+	} resp;
+
+	void *shadow_buf;
+
+	struct sg_table command_sgs;
+
+	struct virtio_media_queue_state queues[VIRTIO_MEDIA_LAST_QUEUE + 1];
+	struct mutex queues_lock;
+	wait_queue_head_t dqbuf_wait;
+
+	struct list_head list;
+};
+
+static inline struct virtio_media_session *fh_to_session(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct virtio_media_session, fh);
+}
+
+#endif // __VIRTIO_MEDIA_SESSION_H
diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio/virtio_media.h
new file mode 100644
index 0000000000000000000000000000000000000000..7d7805874a7dba1fc474b286ceb2867899c7dcc5
--- /dev/null
+++ b/drivers/media/virtio/virtio_media.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Virtio-media structures & functions declarations.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_H
+#define __VIRTIO_MEDIA_H
+
+#include <linux/virtio_config.h>
+#include <media/v4l2-device.h>
+
+#include "protocol.h"
+
+#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
+
+#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
+
+extern char *driver_name;
+extern bool allow_userptr;
+
+/**
+ * struct virtio_media - Virtio-media device.
+ * @v4l2_dev: v4l2_device for the media device.
+ * @video_dev: video_device for the media device.
+ * @virtio_dev: virtio device for the media device.
+ * @commandq: virtio command queue.
+ * @eventq: virtio event queue.
+ * @eventq_work: work to run when events are received on @eventq.
+ * @mmap_region: region into which MMAP buffers are mapped by the host.
+ * @event_buffer: buffer for event descriptors.
+ * @sessions: list of active sessions on the device.
+ * @sessions_lock: protects @sessions and ``virtio_media_session::list``.
+ * @events_lock: prevents concurrent processing of events.
+ * @cmd: union of device-related commands.
+ * @resp: union of device-related responses.
+ * @vlock: serializes access to the command queue.
+ * @wq: waitqueue for host responses on the command queue.
+ */
+struct virtio_media {
+	struct v4l2_device v4l2_dev;
+	struct video_device video_dev;
+
+	struct virtio_device *virtio_dev;
+	struct virtqueue *commandq;
+	struct virtqueue *eventq;
+	struct work_struct eventq_work;
+
+	struct virtio_shm_region mmap_region;
+
+	void *event_buffer;
+
+	struct list_head sessions;
+	struct mutex sessions_lock;
+
+	struct mutex events_lock;
+
+	union {
+		struct virtio_media_cmd_open open;
+		struct virtio_media_cmd_munmap munmap;
+	} cmd;
+
+	union {
+		struct virtio_media_resp_open open;
+		struct virtio_media_resp_munmap munmap;
+	} resp;
+
+	struct mutex vlock;
+	wait_queue_head_t wq;
+};
+
+static inline struct virtio_media *
+to_virtio_media(struct video_device *video_dev)
+{
+	return container_of(video_dev, struct virtio_media, video_dev);
+}
+
+/* virtio_media_driver.c */
+
+int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
+			      const size_t out_sgs, const size_t in_sgs,
+			      size_t minimum_resp_len, size_t *resp_len);
+void virtio_media_process_events(struct virtio_media *vv);
+
+/* virtio_media_ioctls.c */
+
+long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
+			       unsigned long arg);
+extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
+
+#endif // __VIRTIO_MEDIA_H
diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/virtio/virtio_media_driver.c
new file mode 100644
index 0000000000000000000000000000000000000000..a711ee24edf5dab0c582836002a4244a9ad14f93
--- /dev/null
+++ b/drivers/media/virtio/virtio_media_driver.c
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
+
+/*
+ * Virtio-media driver.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#include "linux/dev_printk.h"
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include <linux/vmalloc.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/version.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ids.h>
+
+#include <media/frame_vector.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/videobuf2-memops.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+
+#include "protocol.h"
+#include "session.h"
+#include "virtio_media.h"
+
+#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
+
+/* ID of the SHM region into which MMAP buffer will be mapped. */
+#define VIRTIO_MEDIA_SHM_MMAP 0
+
+/*
+ * Name of the driver to expose to user-space.
+ *
+ * This is configurable because v4l2-compliance has workarounds specific to
+ * some drivers. When proxying these directly from the host, this allows it to
+ * apply them as needed.
+ */
+char *driver_name;
+module_param(driver_name, charp, 0660);
+
+/*
+ * Whether USERPTR buffers are allowed.
+ *
+ * This is disabled by default as USERPTR buffers are dangerous, but the option
+ * is left to enable them if desired.
+ */
+bool allow_userptr;
+module_param(allow_userptr, bool, 0660);
+
+/**
+ * virtio_media_session_alloc - Allocate a new session.
+ * @vv: virtio-media device the session belongs to.
+ * @id: ID of the session.
+ * @nonblocking_dequeue: whether dequeuing of buffers should be blocking or
+ * not.
+ *
+ * The ``id`` and ``list`` fields must still be set by the caller.
+ */
+static struct virtio_media_session *
+virtio_media_session_alloc(struct virtio_media *vv, u32 id,
+			   bool nonblocking_dequeue)
+{
+	struct virtio_media_session *session;
+	int i;
+	int ret;
+
+	session = kzalloc(sizeof(*session), GFP_KERNEL);
+	if (!session)
+		goto err_session;
+
+	session->shadow_buf = kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNEL);
+	if (!session->shadow_buf)
+		goto err_shadow_buf;
+
+	ret = sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
+			     GFP_KERNEL);
+	if (ret)
+		goto err_payload_sgs;
+
+	session->id = id;
+	session->nonblocking_dequeue = nonblocking_dequeue;
+
+	INIT_LIST_HEAD(&session->list);
+	v4l2_fh_init(&session->fh, &vv->video_dev);
+	v4l2_fh_add(&session->fh);
+
+	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
+		INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
+	mutex_init(&session->queues_lock);
+
+	init_waitqueue_head(&session->dqbuf_wait);
+
+	mutex_lock(&vv->sessions_lock);
+	list_add_tail(&session->list, &vv->sessions);
+	mutex_unlock(&vv->sessions_lock);
+
+	return session;
+
+err_payload_sgs:
+	kfree(session->shadow_buf);
+err_shadow_buf:
+	kfree(session);
+err_session:
+	return ERR_PTR(-ENOMEM);
+}
+
+/**
+ * virtio_media_session_free - Free all resources of a session.
+ * @vv: virtio-media device the session belongs to.
+ * @session: session to destroy.
+ *
+ * All the resources of @sesssion, as well as the backing memory of @session
+ * itself, are freed.
+ */
+static void virtio_media_session_free(struct virtio_media *vv,
+				      struct virtio_media_session *session)
+{
+	int i;
+
+	mutex_lock(&vv->sessions_lock);
+	list_del(&session->list);
+	mutex_unlock(&vv->sessions_lock);
+
+	v4l2_fh_del(&session->fh);
+	v4l2_fh_exit(&session->fh);
+
+	sg_free_table(&session->command_sgs);
+
+	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
+		if (session->queues[i].buffers)
+			vfree(session->queues[i].buffers);
+
+	kfree(session->shadow_buf);
+	kfree(session);
+}
+
+/**
+ * virtio_media_session_close - Close and free a session.
+ * @vv: virtio-media device the session belongs to.
+ * @session: session to close and destroy.
+ *
+ * This send the ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and frees
+ * all resources used by @session.
+ */
+static int virtio_media_session_close(struct virtio_media *vv,
+				      struct virtio_media_session *session)
+{
+	struct virtio_media_cmd_close *cmd_close = &session->cmd.close;
+	struct scatterlist cmd_sg = {};
+	struct scatterlist *sgs[1] = { &cmd_sg };
+	int ret;
+
+	mutex_lock(&vv->vlock);
+
+	cmd_close->hdr.cmd = VIRTIO_MEDIA_CMD_CLOSE;
+	cmd_close->session_id = session->id;
+
+	sg_set_buf(&cmd_sg, cmd_close, sizeof(*cmd_close));
+	sg_mark_end(&cmd_sg);
+
+	ret = virtio_media_send_command(vv, sgs, 1, 0, 0, NULL);
+	mutex_unlock(&vv->vlock);
+	if (ret < 0)
+		return ret;
+
+	virtio_media_session_free(vv, session);
+
+	return 0;
+}
+
+/**
+ * virtio_media_find_session - Lookup for the session with a given ID.
+ * @vv: virtio-media device to lookup the session from.
+ * @id: ID of the session to lookup.
+ */
+static struct virtio_media_session *
+virtio_media_find_session(struct virtio_media *vv, u32 id)
+{
+	struct list_head *p;
+	struct virtio_media_session *session = NULL;
+
+	mutex_lock(&vv->sessions_lock);
+	list_for_each(p, &vv->sessions) {
+		struct virtio_media_session *s =
+			list_entry(p, struct virtio_media_session, list);
+		if (s->id == id) {
+			session = s;
+			break;
+		}
+	}
+	mutex_unlock(&vv->sessions_lock);
+
+	return session;
+}
+
+/**
+ * struct virtio_media_cmd_callback_param - Callback parameters to the virtio command queue.
+ * @vv: virtio-media device in use.
+ * @done: flag to be switched once the command is completed.
+ * @resp_len: length of the received response from the command. Only valid
+ * after @done_flag has switched to ``true``.
+ */
+struct virtio_media_cmd_callback_param {
+	struct virtio_media *vv;
+	bool done;
+	size_t resp_len;
+};
+
+/**
+ * commandq_callback: Callback for the command queue.
+ * @queue: command virtqueue.
+ *
+ * This just wakes up the thread that was waiting on the command to complete.
+ */
+static void commandq_callback(struct virtqueue *queue)
+{
+	unsigned int len;
+	struct virtio_media_cmd_callback_param *param;
+
+process_bufs:
+	while ((param = virtqueue_get_buf(queue, &len))) {
+		param->done = true;
+		param->resp_len = len;
+		wake_up(&param->vv->wq);
+	}
+
+	if (!virtqueue_enable_cb(queue)) {
+		virtqueue_disable_cb(queue);
+		goto process_bufs;
+	}
+}
+
+/**
+ * virtio_media_kick_command - send a command to the commandq.
+ * @vv: virtio-media device in use.
+ * @sgs: descriptor chain to send.
+ * @out_sgs: number of device-readable descriptors in @sgs.
+ * @in_sgs: number of device-writable descriptors in @sgs.
+ * @resp_len: output parameter. Upon success, contains the size of the response
+ * in bytes.
+ *
+ */
+static int virtio_media_kick_command(struct virtio_media *vv,
+				     struct scatterlist **sgs,
+				     const size_t out_sgs, const size_t in_sgs,
+				     size_t *resp_len)
+{
+	struct virtio_media_cmd_callback_param cb_param = {
+		.vv = vv,
+		.done = false,
+		.resp_len = 0,
+	};
+	struct virtio_media_resp_header *resp_header;
+	int ret;
+
+	ret = virtqueue_add_sgs(vv->commandq, sgs, out_sgs, in_sgs, &cb_param,
+				GFP_ATOMIC);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to add sgs to command virtqueue\n");
+		return ret;
+	}
+
+	if (!virtqueue_kick(vv->commandq)) {
+		v4l2_err(&vv->v4l2_dev, "failed to kick command virtqueue\n");
+		return -EINVAL;
+	}
+
+	/* Wait for the response. */
+	ret = wait_event_timeout(vv->wq, cb_param.done, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev,
+			 "timed out waiting for response to command\n");
+		return -ETIMEDOUT;
+	}
+
+	if (resp_len)
+		*resp_len = cb_param.resp_len;
+
+	if (in_sgs > 0) {
+		/*
+		 * If we expect a response, make sure we have at least a
+		 * response header - anything shorter is invalid.
+		 */
+		if (cb_param.resp_len < sizeof(*resp_header)) {
+			v4l2_err(&vv->v4l2_dev,
+				 "received response header is too short\n");
+			return -EINVAL;
+		}
+
+		resp_header = sg_virt(sgs[out_sgs]);
+		if (resp_header->status)
+			/* Host returns a positive error code. */
+			return -resp_header->status;
+	}
+
+	return 0;
+}
+
+/**
+ * virtio_media_send_command - Send a command to the device and wait for its
+ * response.
+ * @vv: virtio-media device in use.
+ * @sgs: descriptor chain to send.
+ * @out_sgs: number of device-readable descriptors in @sgs.
+ * @in_sgs: number of device-writable descriptors in @sgs.
+ * @minimum_resp_len: minimum length of the response expected by the caller
+ * when the command is successful. Anything shorter than that will result in
+ * ``-EINVAL`` being returned.
+ * @resp_len: output parameter. Upon success, contains the size of the response
+ * in bytes.
+ */
+int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
+			      const size_t out_sgs, const size_t in_sgs,
+			      size_t minimum_resp_len, size_t *resp_len)
+{
+	size_t local_resp_len = resp_len ? *resp_len : 0;
+	int ret = virtio_media_kick_command(vv, sgs, out_sgs, in_sgs,
+					    &local_resp_len);
+	if (resp_len)
+		*resp_len = local_resp_len;
+
+	/* If the host could not process the command, there is no valid response */
+	if (ret < 0)
+		return ret;
+
+	/* Make sure the host wrote a complete reply. */
+	if (local_resp_len < minimum_resp_len) {
+		v4l2_err(
+			&vv->v4l2_dev,
+			"received response is too short: received %zu, expected at least %zu\n",
+			local_resp_len, minimum_resp_len);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * virtio_media_send_event_buffer() - Sends an event buffer to the host so it
+ * can return it with an event.
+ * @vv: virtio-media device in use.
+ * @event_buffer: pointer to the event buffer to send to the device.
+ */
+static int virtio_media_send_event_buffer(struct virtio_media *vv,
+					  void *event_buffer)
+{
+	struct scatterlist *sgs[1], vresp;
+	int ret;
+
+	sg_init_one(&vresp, event_buffer, VIRTIO_MEDIA_EVENT_MAX_SIZE);
+	sgs[0] = &vresp;
+
+	ret = virtqueue_add_sgs(vv->eventq, sgs, 0, 1, event_buffer,
+				GFP_ATOMIC);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to add sgs to event virtqueue\n");
+		return ret;
+	}
+
+	if (!virtqueue_kick(vv->eventq)) {
+		v4l2_err(&vv->v4l2_dev, "failed to kick event virtqueue\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * eventq_callback() - Callback for the event queue.
+ * @queue: event virtqueue.
+ *
+ * This just schedules for event work to be run.
+ */
+static void eventq_callback(struct virtqueue *queue)
+{
+	struct virtio_media *vv = queue->vdev->priv;
+
+	schedule_work(&vv->eventq_work);
+}
+
+/**
+ * virtio_media_process_dqbuf_event() - Process a dequeued event for a session.
+ * @vv: virtio-media device in use.
+ * @session: session the event is addressed to.
+ * @dqbuf_evt: the dequeued event to process.
+ *
+ * Invalid events are ignored with an error log.
+ */
+static void
+virtio_media_process_dqbuf_event(struct virtio_media *vv,
+				 struct virtio_media_session *session,
+				 struct virtio_media_event_dqbuf *dqbuf_evt)
+{
+	struct virtio_media_buffer *dqbuf;
+	const enum v4l2_buf_type queue_type = dqbuf_evt->buffer.type;
+	struct virtio_media_queue_state *queue;
+	typeof(dqbuf->buffer.m) buffer_m;
+	typeof(dqbuf->buffer.m.planes[0].m) plane_m;
+	int i;
+
+	if (queue_type >= ARRAY_SIZE(session->queues)) {
+		v4l2_err(&vv->v4l2_dev,
+			 "unmanaged queue %d passed to dqbuf event",
+			 dqbuf_evt->buffer.type);
+		return;
+	}
+	queue = &session->queues[queue_type];
+
+	if (dqbuf_evt->buffer.index >= queue->allocated_bufs) {
+		v4l2_err(&vv->v4l2_dev,
+			 "invalid buffer ID %d for queue %d in dqbuf event",
+			 dqbuf_evt->buffer.index, dqbuf_evt->buffer.type);
+		return;
+	}
+
+	dqbuf = &queue->buffers[dqbuf_evt->buffer.index];
+
+	/*
+	 * Preserve the 'm' union that was passed to us during QBUF so userspace
+	 * gets back the information it submitted.
+	 */
+	buffer_m = dqbuf->buffer.m;
+	memcpy(&dqbuf->buffer, &dqbuf_evt->buffer, sizeof(dqbuf->buffer));
+	dqbuf->buffer.m = buffer_m;
+	if (V4L2_TYPE_IS_MULTIPLANAR(dqbuf->buffer.type)) {
+		if (dqbuf->buffer.length > VIDEO_MAX_PLANES) {
+			v4l2_err(
+				&vv->v4l2_dev,
+				"invalid number of planes received from host for a multiplanar buffer\n");
+			return;
+		}
+		for (i = 0; i < dqbuf->buffer.length; i++) {
+			plane_m = dqbuf->planes[i].m;
+			memcpy(&dqbuf->planes[i], &dqbuf_evt->planes[i],
+			       sizeof(struct v4l2_plane));
+			dqbuf->planes[i].m = plane_m;
+		}
+	}
+
+	/* Set the DONE flag as the buffer is waiting for being dequeued. */
+	dqbuf->buffer.flags |= V4L2_BUF_FLAG_DONE;
+
+	mutex_lock(&session->queues_lock);
+	list_add_tail(&dqbuf->list, &queue->pending_dqbufs);
+	queue->queued_bufs -= 1;
+	mutex_unlock(&session->queues_lock);
+
+	wake_up(&session->dqbuf_wait);
+}
+
+/**
+ * virtio_media_process_events() - Process all pending events on a device.
+ * @vv: device which pending events we want to process.
+ *
+ * Retrieves all pending events on @vv's event queue and dispatch them to their
+ * corresponding session.
+ *
+ * Invalid events are ignored with an error log.
+ */
+void virtio_media_process_events(struct virtio_media *vv)
+{
+	struct virtio_media_event_error *error_evt;
+	struct virtio_media_event_dqbuf *dqbuf_evt;
+	struct virtio_media_event_event *event_evt;
+	struct virtio_media_session *session;
+	struct virtio_media_event_header *evt;
+	unsigned int len;
+
+	mutex_lock(&vv->events_lock);
+
+process_bufs:
+	while ((evt = virtqueue_get_buf(vv->eventq, &len))) {
+		/* Make sure we received enough data */
+		if (len < sizeof(*evt)) {
+			v4l2_err(
+				&vv->v4l2_dev,
+				"event is too short: got %u, expected at least %zu\n",
+				len, sizeof(*evt));
+			goto end_of_event;
+		}
+
+		session = virtio_media_find_session(vv, evt->session_id);
+		if (session == NULL) {
+			v4l2_err(&vv->v4l2_dev, "cannot find session %d\n",
+				 evt->session_id);
+			goto end_of_event;
+		}
+
+		switch (evt->event) {
+		case VIRTIO_MEDIA_EVT_ERROR:
+			if (len < sizeof(*error_evt)) {
+				v4l2_err(
+					&vv->v4l2_dev,
+					"error event is too short: got %u, expected %zu\n",
+					len, sizeof(*error_evt));
+				break;
+			}
+			error_evt = (struct virtio_media_event_error *)evt;
+			v4l2_err(&vv->v4l2_dev,
+				 "received error %d for session %d",
+				 error_evt->errno, error_evt->hdr.session_id);
+			virtio_media_session_close(vv, session);
+			break;
+
+		/*
+		 * Dequeued buffer: put it into the right queue so user-space can dequeue
+		 * it.
+		 */
+		case VIRTIO_MEDIA_EVT_DQBUF:
+			if (len < sizeof(*dqbuf_evt)) {
+				v4l2_err(
+					&vv->v4l2_dev,
+					"dqbuf event is too short: got %u, expected %zu\n",
+					len, sizeof(*dqbuf_evt));
+				break;
+			}
+			dqbuf_evt = (struct virtio_media_event_dqbuf *)evt;
+			virtio_media_process_dqbuf_event(vv, session,
+							 dqbuf_evt);
+			break;
+
+		case VIRTIO_MEDIA_EVT_EVENT:
+			if (len < sizeof(*event_evt)) {
+				v4l2_err(
+					&vv->v4l2_dev,
+					"session event is too short: got %u expected %zu\n",
+					len, sizeof(*event_evt));
+				break;
+			}
+
+			event_evt = (struct virtio_media_event_event *)evt;
+			v4l2_event_queue_fh(&session->fh, &event_evt->event);
+			break;
+
+		default:
+			v4l2_err(&vv->v4l2_dev, "unknown event type %d\n",
+				 evt->event);
+			break;
+		}
+
+end_of_event:
+		virtio_media_send_event_buffer(vv, evt);
+	}
+
+	if (!virtqueue_enable_cb(vv->eventq)) {
+		virtqueue_disable_cb(vv->eventq);
+		goto process_bufs;
+	}
+
+	mutex_unlock(&vv->events_lock);
+}
+
+static void virtio_media_event_work(struct work_struct *work)
+{
+	struct virtio_media *vv =
+		container_of(work, struct virtio_media, eventq_work);
+
+	virtio_media_process_events(vv);
+}
+
+/**
+ * virtio_media_device_open() - Create a new session from an opened file.
+ * @file: opened file for the session.
+ */
+static int virtio_media_device_open(struct file *file)
+{
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_cmd_open *cmd_open = &vv->cmd.open;
+	struct virtio_media_resp_open *resp_open = &vv->resp.open;
+	struct scatterlist cmd_sg = {}, resp_sg = {};
+	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
+	struct virtio_media_session *session;
+	u32 session_id;
+	int ret;
+
+	mutex_lock(&vv->vlock);
+
+	sg_set_buf(&cmd_sg, cmd_open, sizeof(*cmd_open));
+	sg_mark_end(&cmd_sg);
+
+	sg_set_buf(&resp_sg, resp_open, sizeof(*resp_open));
+	sg_mark_end(&resp_sg);
+
+	cmd_open->hdr.cmd = VIRTIO_MEDIA_CMD_OPEN;
+	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_open),
+					NULL);
+	session_id = resp_open->session_id;
+	mutex_unlock(&vv->vlock);
+	if (ret < 0)
+		return ret;
+
+	session = virtio_media_session_alloc(vv, session_id,
+					     (file->f_flags & O_NONBLOCK));
+	if (IS_ERR(session))
+		return PTR_ERR(session);
+
+	file->private_data = &session->fh;
+
+	return 0;
+}
+
+/**
+ * virtio_media_device_close() - Close a previously opened session.
+ * @file: file of the session to close.
+ *
+ * This sends to ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and close
+ * the session on the driver side.
+ */
+static int virtio_media_device_close(struct file *file)
+{
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session =
+		fh_to_session(file->private_data);
+
+	return virtio_media_session_close(vv, session);
+}
+
+/**
+ * virtio_media_device_poll() - Poll logic for a virtio-media device.
+ * @file: file of the session to poll.
+ * @wait: poll table to wait on.
+ */
+static __poll_t virtio_media_device_poll(struct file *file, poll_table *wait)
+{
+	struct virtio_media_session *session =
+		fh_to_session(file->private_data);
+	enum v4l2_buf_type capture_type =
+		session->uses_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+				       V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	enum v4l2_buf_type output_type =
+		session->uses_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
+				       V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	struct virtio_media_queue_state *capture_queue =
+		&session->queues[capture_type];
+	struct virtio_media_queue_state *output_queue =
+		&session->queues[output_type];
+	__poll_t req_events = poll_requested_events(wait);
+	__poll_t rc = 0;
+
+	poll_wait(file, &session->dqbuf_wait, wait);
+	poll_wait(file, &session->fh.wait, wait);
+
+	mutex_lock(&session->queues_lock);
+	if (req_events & (EPOLLIN | EPOLLRDNORM)) {
+		if (!capture_queue->streaming ||
+		    (capture_queue->queued_bufs == 0 &&
+		     list_empty(&capture_queue->pending_dqbufs)))
+			rc |= EPOLLERR;
+		else if (!list_empty(&capture_queue->pending_dqbufs))
+			rc |= EPOLLIN | EPOLLRDNORM;
+	}
+	if (req_events & (EPOLLOUT | EPOLLWRNORM)) {
+		if (!output_queue->streaming)
+			rc |= EPOLLERR;
+		else if (output_queue->queued_bufs <
+			 output_queue->allocated_bufs)
+			rc |= EPOLLOUT | EPOLLWRNORM;
+	}
+	mutex_unlock(&session->queues_lock);
+
+	if (v4l2_event_pending(&session->fh))
+		rc |= EPOLLPRI;
+
+	return rc;
+}
+
+static void virtio_media_vma_close_locked(struct vm_area_struct *vma)
+{
+	struct virtio_media *vv = vma->vm_private_data;
+	struct virtio_media_cmd_munmap *cmd_munmap = &vv->cmd.munmap;
+	struct virtio_media_resp_munmap *resp_munmap = &vv->resp.munmap;
+	struct scatterlist cmd_sg = {}, resp_sg = {};
+	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
+	int ret;
+
+	sg_set_buf(&cmd_sg, cmd_munmap, sizeof(*cmd_munmap));
+	sg_mark_end(&cmd_sg);
+
+	sg_set_buf(&resp_sg, resp_munmap, sizeof(*resp_munmap));
+	sg_mark_end(&resp_sg);
+
+	cmd_munmap->hdr.cmd = VIRTIO_MEDIA_CMD_MUNMAP;
+	cmd_munmap->driver_addr =
+		(vma->vm_pgoff << PAGE_SHIFT) - vv->mmap_region.addr;
+	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_munmap),
+					NULL);
+	if (ret < 0) {
+		v4l2_err(&vv->v4l2_dev, "host failed to unmap buffer: %d\n",
+			 ret);
+	}
+}
+
+/**
+ * virtio_media_vma_close() - Close a MMAP buffer mapping.
+ * @vma: VMA of the mapping to close.
+ *
+ * Inform the host that a previously created MMAP mapping is no longer needed
+ * and can be removed.
+ */
+static void virtio_media_vma_close(struct vm_area_struct *vma)
+{
+	struct virtio_media *vv = vma->vm_private_data;
+
+	mutex_lock(&vv->vlock);
+	virtio_media_vma_close_locked(vma);
+	mutex_unlock(&vv->vlock);
+}
+
+static const struct vm_operations_struct virtio_media_vm_ops = {
+	.close = virtio_media_vma_close,
+};
+
+/**
+ * virtio_media_device_mmap - Perform a mmap request from userspace.
+ * @file: opened file of the session to map for.
+ * @vma: VM area struct describing the desired mapping.
+ *
+ * This requests the host to map a MMAP buffer for us, so we can then make that
+ * mapping visible into user-space address space.
+ */
+static int virtio_media_device_mmap(struct file *file,
+				    struct vm_area_struct *vma)
+{
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session =
+		fh_to_session(file->private_data);
+	struct virtio_media_cmd_mmap *cmd_mmap = &session->cmd.mmap;
+	struct virtio_media_resp_mmap *resp_mmap = &session->resp.mmap;
+	struct scatterlist cmd_sg = {}, resp_sg = {};
+	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
+	int ret;
+
+	if (!(vma->vm_flags & VM_SHARED))
+		return -EINVAL;
+	if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
+		return -EINVAL;
+
+	mutex_lock(&vv->vlock);
+
+	cmd_mmap->hdr.cmd = VIRTIO_MEDIA_CMD_MMAP;
+	cmd_mmap->session_id = session->id;
+	cmd_mmap->flags =
+		(vma->vm_flags & VM_WRITE) ? VIRTIO_MEDIA_MMAP_FLAG_RW : 0;
+	cmd_mmap->offset = vma->vm_pgoff << PAGE_SHIFT;
+
+	sg_set_buf(&cmd_sg, cmd_mmap, sizeof(*cmd_mmap));
+	sg_mark_end(&cmd_sg);
+
+	sg_set_buf(&resp_sg, resp_mmap, sizeof(*resp_mmap));
+	sg_mark_end(&resp_sg);
+
+	/*
+	 * The host performs reference counting and is smart enough to return the
+	 * same guest physical address if this is called several times on the same
+	 * buffer.
+	 */
+	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_mmap),
+					NULL);
+	if (ret < 0)
+		goto end;
+
+	vma->vm_private_data = vv;
+	/*
+	 * Keep the guest address at which the buffer is mapped since we will
+	 * use that to unmap.
+	 */
+	vma->vm_pgoff = (resp_mmap->driver_addr + vv->mmap_region.addr) >>
+			PAGE_SHIFT;
+
+	/*
+	 * We cannot let the mapping be larger than the buffer.
+	 */
+	if (vma->vm_end - vma->vm_start > PAGE_ALIGN(resp_mmap->len)) {
+		dev_dbg(&video_dev->dev,
+			"invalid MMAP, as it would overflow buffer length\n");
+		virtio_media_vma_close_locked(vma);
+		ret = -EINVAL;
+		goto end;
+	}
+
+	ret = io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+				 vma->vm_end - vma->vm_start,
+				 vma->vm_page_prot);
+	if (ret)
+		goto end;
+
+	vma->vm_ops = &virtio_media_vm_ops;
+
+end:
+	mutex_unlock(&vv->vlock);
+	return ret;
+}
+
+static const struct v4l2_file_operations virtio_media_fops = {
+	.owner = THIS_MODULE,
+	.open = virtio_media_device_open,
+	.release = virtio_media_device_close,
+	.poll = virtio_media_device_poll,
+	.unlocked_ioctl = virtio_media_device_ioctl,
+	.mmap = virtio_media_device_mmap,
+};
+
+static int virtio_media_probe(struct virtio_device *virtio_dev)
+{
+	struct device *dev = &virtio_dev->dev;
+	struct virtqueue *vqs[2];
+	static struct virtqueue_info vq_info[2] = {
+		{
+			.name = "command",
+			.callback = commandq_callback,
+		},
+		{
+			.name = "event",
+			.callback = eventq_callback,
+		},
+	};
+	struct virtio_media *vv;
+	struct video_device *vd;
+	int i;
+	int ret;
+
+	vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
+	if (!vv)
+		return -ENOMEM;
+
+	vv->event_buffer = devm_kzalloc(
+		dev, VIRTIO_MEDIA_EVENT_MAX_SIZE * VIRTIO_MEDIA_NUM_EVENT_BUFS,
+		GFP_KERNEL);
+	if (!vv->event_buffer)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&vv->sessions);
+	mutex_init(&vv->sessions_lock);
+	mutex_init(&vv->events_lock);
+	mutex_init(&vv->vlock);
+
+	vv->virtio_dev = virtio_dev;
+	virtio_dev->priv = vv;
+
+	init_waitqueue_head(&vv->wq);
+
+	ret = v4l2_device_register(dev, &vv->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
+	if (ret)
+		goto err_find_vqs;
+
+	vv->commandq = vqs[0];
+	vv->eventq = vqs[1];
+	INIT_WORK(&vv->eventq_work, virtio_media_event_work);
+
+	/* Get MMAP buffer mapping SHM region */
+	virtio_get_shm_region(virtio_dev, &vv->mmap_region,
+			      VIRTIO_MEDIA_SHM_MMAP);
+
+	vd = &vv->video_dev;
+
+	vd->v4l2_dev = &vv->v4l2_dev;
+	vd->vfl_type = VFL_TYPE_VIDEO;
+	vd->ioctl_ops = &virtio_media_ioctl_ops;
+	vd->fops = &virtio_media_fops;
+	vd->device_caps = virtio_cread32(virtio_dev, 0);
+	if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))
+		vd->vfl_dir = VFL_DIR_M2M;
+	else if (vd->device_caps &
+		 (V4L2_CAP_VIDEO_OUTPUT | V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+		vd->vfl_dir = VFL_DIR_TX;
+	else
+		vd->vfl_dir = VFL_DIR_RX;
+	vd->release = video_device_release_empty;
+	strscpy(vd->name, "virtio-media", sizeof(vd->name));
+
+	video_set_drvdata(vd, vv);
+
+	ret = video_register_device(vd, virtio_cread32(virtio_dev, 4), 0);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < VIRTIO_MEDIA_NUM_EVENT_BUFS; i++) {
+		ret = virtio_media_send_event_buffer(
+			vv, vv->event_buffer + VIRTIO_MEDIA_EVENT_MAX_SIZE * i);
+		if (ret)
+			goto send_event_buffer;
+	}
+
+	virtio_device_ready(virtio_dev);
+
+	return 0;
+
+send_event_buffer:
+	video_unregister_device(&vv->video_dev);
+	virtio_dev->config->del_vqs(virtio_dev);
+err_find_vqs:
+	v4l2_device_unregister(&vv->v4l2_dev);
+
+	return ret;
+}
+
+static void virtio_media_remove(struct virtio_device *virtio_dev)
+{
+	struct virtio_media *vv = virtio_dev->priv;
+	struct list_head *p, *n;
+
+	cancel_work_sync(&vv->eventq_work);
+	virtio_reset_device(virtio_dev);
+
+	v4l2_device_unregister(&vv->v4l2_dev);
+	virtio_dev->config->del_vqs(virtio_dev);
+	video_unregister_device(&vv->video_dev);
+
+	list_for_each_safe(p, n, &vv->sessions) {
+		struct virtio_media_session *s =
+			list_entry(p, struct virtio_media_session, list);
+
+		virtio_media_session_free(vv, s);
+	}
+}
+
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static unsigned int features[] = {};
+
+static struct virtio_driver virtio_media_driver = {
+	.feature_table = features,
+	.feature_table_size = ARRAY_SIZE(features),
+	.driver.name = VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
+	.driver.owner = THIS_MODULE,
+	.id_table = id_table,
+	.probe = virtio_media_probe,
+	.remove = virtio_media_remove,
+};
+
+module_virtio_driver(virtio_media_driver);
+
+MODULE_DEVICE_TABLE(virtio, id_table);
+MODULE_DESCRIPTION("virtio media driver");
+MODULE_AUTHOR("Alexandre Courbot <acourbot@google.com>");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/virtio/virtio_media_ioctls.c b/drivers/media/virtio/virtio_media_ioctls.c
new file mode 100644
index 0000000000000000000000000000000000000000..4d3643ece9a6ec14a2a5ff2966b8034f7029c2f2
--- /dev/null
+++ b/drivers/media/virtio/virtio_media_ioctls.c
@@ -0,0 +1,1302 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
+
+/*
+ * Ioctls implementations for the virtio-media driver.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#include <linux/mutex.h>
+#include <linux/videodev2.h>
+#include <linux/virtio_config.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+
+#include "scatterlist_builder.h"
+#include "virtio_media.h"
+
+/**
+ * virtio_media_send_r_ioctl() - Send a read-only ioctl to the device.
+ * @fh: file handler of the session doing the ioctl.
+ * @ioctl: ``VIDIOC_*`` ioctl code.
+ * @ioctl_data: pointer to the ioctl payload.
+ * @ioctl_data_len: length in bytes of the ioctl payload.
+ *
+ * Send an ioctl that has no driver payload, but expects a response from the
+ * host (i.e. an ioctl specified with ``_IOR``).
+ */
+static int virtio_media_send_r_ioctl(struct v4l2_fh *fh, u32 ioctl,
+				     void *ioctl_data, size_t ioctl_data_len)
+{
+	struct video_device *video_dev = fh->vdev;
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct scatterlist *sgs[3];
+	struct scatterlist_builder builder = {
+		.descs = session->command_sgs.sgl,
+		.num_descs = DESC_CHAIN_MAX_LEN,
+		.cur_desc = 0,
+		.shadow_buffer = session->shadow_buf,
+		.shadow_buffer_size = VIRTIO_SHADOW_BUF_SIZE,
+		.shadow_buffer_pos = 0,
+		.sgs = sgs,
+		.num_sgs = ARRAY_SIZE(sgs),
+		.cur_sg = 0,
+	};
+	int ret;
+
+	/* Command descriptor */
+	ret = scatterlist_builder_add_ioctl_cmd(&builder, session, ioctl);
+	if (ret)
+		return ret;
+
+	/* Response descriptor */
+	ret = scatterlist_builder_add_ioctl_resp(&builder, session);
+	if (ret)
+		return ret;
+
+	/* Response payload */
+	ret = scatterlist_builder_add_data(&builder, ioctl_data,
+					   ioctl_data_len);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to prepare command descriptor chain\n");
+		return ret;
+	}
+
+	ret = virtio_media_send_command(
+		vv, sgs, 1, 2,
+		sizeof(struct virtio_media_resp_ioctl) + ioctl_data_len, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = scatterlist_builder_retrieve_data(&builder, 2, ioctl_data);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to retrieve response descriptor chain\n");
+		return ret;
+	}
+
+	return 0;
+}
+/**
+ * virtio_media_send_w_ioctl() - Send a write-only ioctl to the device.
+ * @fh: file handler of the session doing the ioctl.
+ * @ioctl: ``VIDIOC_*`` ioctl code.
+ * @ioctl_data: pointer to the ioctl payload.
+ * @ioctl_data_len: length in bytes of the ioctl payload.
+ *
+ * Send an ioctl that does not expect a reply beyond an error status (i.e. an
+ * ioctl specified with ``_IOW``) to the host.
+ */
+static int virtio_media_send_w_ioctl(struct v4l2_fh *fh, u32 ioctl,
+				     const void *ioctl_data,
+				     size_t ioctl_data_len)
+{
+	struct video_device *video_dev = fh->vdev;
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct scatterlist *sgs[3];
+	struct scatterlist_builder builder = {
+		.descs = session->command_sgs.sgl,
+		.num_descs = DESC_CHAIN_MAX_LEN,
+		.cur_desc = 0,
+		.shadow_buffer = session->shadow_buf,
+		.shadow_buffer_size = VIRTIO_SHADOW_BUF_SIZE,
+		.shadow_buffer_pos = 0,
+		.sgs = sgs,
+		.num_sgs = ARRAY_SIZE(sgs),
+		.cur_sg = 0,
+	};
+	int ret;
+
+	/* Command descriptor */
+	ret = scatterlist_builder_add_ioctl_cmd(&builder, session, ioctl);
+	if (ret)
+		return ret;
+
+	/* Command payload */
+	ret = scatterlist_builder_add_data(&builder, (void *)ioctl_data,
+					   ioctl_data_len);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to prepare command descriptor chain\n");
+		return ret;
+	}
+
+	/* Response descriptor */
+	ret = scatterlist_builder_add_ioctl_resp(&builder, session);
+	if (ret)
+		return ret;
+
+	ret = virtio_media_send_command(
+		vv, sgs, 2, 1, sizeof(struct virtio_media_resp_ioctl), NULL);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * virtio_media_send_wr_ioctl() - Send a read-write ioctl to the device.
+ * @fh: file handler of the session doing the ioctl.
+ * @ioctl: ``VIDIOC_*`` ioctl code.
+ * @ioctl_data: pointer to the ioctl payload.
+ * @ioctl_data_len: length in bytes of the ioctl payload.
+ * @minimum_resp_payload: minimum expected length of the response's payload.
+ *
+ * Sends an ioctl that expects a response of exactly the same size as the
+ * input (i.e. an ioctl specified with ``_IOWR``) to the host.
+ *
+ * This corresponds to what most V4L2 ioctls do. For instance
+ * ``VIDIOC_ENUM_FMT`` takes a partially-initialized ``struct v4l2_fmtdesc``
+ * and returns its filled version.
+ */
+static int virtio_media_send_wr_ioctl(struct v4l2_fh *fh, u32 ioctl,
+				      void *ioctl_data, size_t ioctl_data_len,
+				      size_t minimum_resp_payload)
+{
+	struct video_device *video_dev = fh->vdev;
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct scatterlist *sgs[4];
+	struct scatterlist_builder builder = {
+		.descs = session->command_sgs.sgl,
+		.num_descs = DESC_CHAIN_MAX_LEN,
+		.cur_desc = 0,
+		.shadow_buffer = session->shadow_buf,
+		.shadow_buffer_size = VIRTIO_SHADOW_BUF_SIZE,
+		.shadow_buffer_pos = 0,
+		.sgs = sgs,
+		.num_sgs = ARRAY_SIZE(sgs),
+		.cur_sg = 0,
+	};
+	int ret;
+
+	/* Command descriptor */
+	ret = scatterlist_builder_add_ioctl_cmd(&builder, session, ioctl);
+	if (ret)
+		return ret;
+
+	/* Command payload */
+	ret = scatterlist_builder_add_data(&builder, ioctl_data,
+					   ioctl_data_len);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to prepare command descriptor chain\n");
+		return ret;
+	}
+
+	/* Response descriptor */
+	ret = scatterlist_builder_add_ioctl_resp(&builder, session);
+	if (ret)
+		return ret;
+
+	/* Response payload, same as command */
+	ret = scatterlist_builder_add_descriptor(&builder, 1);
+	if (ret)
+		return ret;
+
+	ret = virtio_media_send_command(vv, sgs, 2, 2,
+					sizeof(struct virtio_media_resp_ioctl) +
+						minimum_resp_payload,
+					NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = scatterlist_builder_retrieve_data(&builder, 3, ioctl_data);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to retrieve response descriptor chain\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * virtio_media_send_buffer_ioctl() - Send an ioctl taking a buffer as
+ * parameter to the device.
+ * @fh: file handler of the session doing the ioctl.
+ * @ioctl: ``VIDIOC_*`` ioctl code.
+ * @b: ``v4l2_buffer`` to be sent as the ioctl payload.
+ *
+ * Buffers can require an additional descriptor to send their planes array, and
+ * can have pointers to userspace memory hence this dedicated function.
+ */
+static int virtio_media_send_buffer_ioctl(struct v4l2_fh *fh, u32 ioctl,
+					  struct v4l2_buffer *b)
+{
+	struct video_device *video_dev = fh->vdev;
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct v4l2_plane *orig_planes = NULL;
+	struct scatterlist *sgs[64];
+	/* End of the device-readable buffer SGs, to reuse in device-writable section. */
+	size_t num_cmd_sgs;
+	size_t end_buf_sg;
+	struct scatterlist_builder builder = {
+		.descs = session->command_sgs.sgl,
+		.num_descs = DESC_CHAIN_MAX_LEN,
+		.cur_desc = 0,
+		.shadow_buffer = session->shadow_buf,
+		.shadow_buffer_size = VIRTIO_SHADOW_BUF_SIZE,
+		.shadow_buffer_pos = 0,
+		.sgs = sgs,
+		.num_sgs = ARRAY_SIZE(sgs),
+		.cur_sg = 0,
+	};
+	size_t resp_len;
+	int ret;
+	int i;
+
+	if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type))
+		orig_planes = b->m.planes;
+
+	/* Command descriptor */
+	ret = scatterlist_builder_add_ioctl_cmd(&builder, session, ioctl);
+	if (ret)
+		return ret;
+
+	/* Command payload (struct v4l2_buffer) */
+	ret = scatterlist_builder_add_buffer(&builder, b);
+	if (ret < 0)
+		return ret;
+
+	end_buf_sg = builder.cur_sg;
+
+	/* Payload of SHARED_PAGES buffers, if relevant */
+	ret = scatterlist_builder_add_buffer_userptr(&builder, b);
+	if (ret < 0)
+		return ret;
+
+	num_cmd_sgs = builder.cur_sg;
+
+	/* Response descriptor */
+	ret = scatterlist_builder_add_ioctl_resp(&builder, session);
+	if (ret)
+		return ret;
+
+	/* Response payload (same as input, but no userptr mapping) */
+	for (i = 1; i < end_buf_sg; i++) {
+		ret = scatterlist_builder_add_descriptor(&builder, i);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = virtio_media_send_command(
+		vv, builder.sgs, num_cmd_sgs, builder.cur_sg - num_cmd_sgs,
+		sizeof(struct virtio_media_resp_ioctl) + sizeof(*b), &resp_len);
+	if (ret < 0)
+		return ret;
+
+	resp_len -= sizeof(struct virtio_media_resp_ioctl);
+
+	/* Make sure that the reply length covers our v4l2_buffer */
+	if (resp_len < sizeof(*b))
+		return -EINVAL;
+
+	ret = scatterlist_builder_retrieve_buffer(&builder, num_cmd_sgs + 1, b,
+						  orig_planes);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to retrieve response descriptor chain\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * virtio_media_send_ext_controls_ioctl() - Send an ioctl taking extended
+ * controls as parameters to the device.
+ * @fh: file handler of the session doing the ioctl.
+ * @ioctl: ``VIDIOC_*`` ioctl code.
+ * @ctrls: ``v4l2_ext_controls`` to be sent as the ioctl payload.
+ *
+ * Queues an ioctl that sends a ``v4l2_ext_controls`` to the host and receives
+ * an updated version.
+ *
+ * ``v4l2_ext_controls`` has a pointer to an array of ``v4l2_ext_control``, and
+ * also potentially pointers to user-space memory that we need to map properly,
+ * hence the dedicated function.
+ */
+static int virtio_media_send_ext_controls_ioctl(struct v4l2_fh *fh, u32 ioctl,
+						struct v4l2_ext_controls *ctrls)
+{
+	struct video_device *video_dev = fh->vdev;
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session = fh_to_session(fh);
+	size_t num_cmd_sgs;
+	size_t end_ctrls_sg;
+	struct v4l2_ext_control *controls_backup = ctrls->controls;
+	const u32 num_ctrls = ctrls->count;
+	struct scatterlist *sgs[64];
+	struct scatterlist_builder builder = {
+		.descs = session->command_sgs.sgl,
+		.num_descs = DESC_CHAIN_MAX_LEN,
+		.cur_desc = 0,
+		.shadow_buffer = session->shadow_buf,
+		.shadow_buffer_size = VIRTIO_SHADOW_BUF_SIZE,
+		.shadow_buffer_pos = 0,
+		.sgs = sgs,
+		.num_sgs = ARRAY_SIZE(sgs),
+		.cur_sg = 0,
+	};
+	size_t resp_len = 0;
+	int ret;
+	int i;
+
+	/* Command descriptor */
+	ret = scatterlist_builder_add_ioctl_cmd(&builder, session, ioctl);
+	if (ret)
+		return ret;
+
+	/* v4l2_controls */
+	ret = scatterlist_builder_add_ext_ctrls(&builder, ctrls);
+	if (ret)
+		return ret;
+
+	end_ctrls_sg = builder.cur_sg;
+
+	ret = scatterlist_builder_add_ext_ctrls_userptrs(&builder, ctrls);
+	if (ret)
+		return ret;
+
+	num_cmd_sgs = builder.cur_sg;
+
+	/* Response descriptor */
+	ret = scatterlist_builder_add_ioctl_resp(&builder, session);
+	if (ret)
+		return ret;
+
+	/* Response payload (same as input but without userptrs) */
+	for (i = 1; i < end_ctrls_sg; i++) {
+		ret = scatterlist_builder_add_descriptor(&builder, i);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = virtio_media_send_command(
+		vv, builder.sgs, num_cmd_sgs, builder.cur_sg - num_cmd_sgs,
+		sizeof(struct virtio_media_resp_ioctl) + sizeof(*ctrls),
+		&resp_len);
+
+	/* Just in case the host touched these. */
+	ctrls->controls = controls_backup;
+	if (ctrls->count != num_ctrls) {
+		v4l2_err(
+			&vv->v4l2_dev,
+			"device returned a number of controls different than the one submitted\n");
+	}
+	if (ctrls->count > num_ctrls)
+		return -ENOSPC;
+
+	/* Event if we have received an error, we may need to read our payload back */
+	if (ret < 0 && resp_len >= sizeof(struct virtio_media_resp_ioctl) +
+					   sizeof(*ctrls)) {
+		/* Deliberately ignore the error here as we want to return the previous one */
+		scatterlist_builder_retrieve_ext_ctrls(&builder,
+						       num_cmd_sgs + 1, ctrls);
+		return ret;
+	}
+
+	resp_len -= sizeof(struct virtio_media_resp_ioctl);
+
+	/* Make sure that the reply's length covers our v4l2_ext_controls */
+	if (resp_len < sizeof(*ctrls))
+		return -EINVAL;
+
+	ret = scatterlist_builder_retrieve_ext_ctrls(&builder, num_cmd_sgs + 1,
+						     ctrls);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * virtio_media_clear_queue() - clear all pending buffers on a streamed-off queue.
+ * @session: session which the queue to clear belongs to.
+ * @queue: state of the queue to clear.
+ *
+ * Helper function to clear the list of buffers waiting to be dequeued on a
+ * queue that has just been streamed off.
+ */
+static void virtio_media_clear_queue(struct virtio_media_session *session,
+				     struct virtio_media_queue_state *queue)
+{
+	struct list_head *p, *n;
+	int i;
+
+	mutex_lock(&session->queues_lock);
+
+	list_for_each_safe(p, n, &queue->pending_dqbufs) {
+		struct virtio_media_buffer *dqbuf =
+			list_entry(p, struct virtio_media_buffer, list);
+
+		list_del(&dqbuf->list);
+	}
+
+	/* All buffers are now dequeued. */
+	for (i = 0; i < queue->allocated_bufs; i++)
+		queue->buffers[i].buffer.flags = 0;
+
+	queue->queued_bufs = 0;
+	queue->streaming = false;
+	queue->is_capture_last = false;
+
+	mutex_unlock(&session->queues_lock);
+}
+
+/*
+ * Macros suitable for defining ioctls with a constant size payload.
+ */
+
+#define SIMPLE_WR_IOCTL(name, ioctl, payload_t)                       \
+	static int virtio_media_##name(struct file *file, void *fh,   \
+				       payload_t *payload)            \
+	{                                                             \
+		return virtio_media_send_wr_ioctl(fh, ioctl, payload, \
+						  sizeof(*payload),   \
+						  sizeof(*payload));  \
+	}
+#define SIMPLE_R_IOCTL(name, ioctl, payload_t)                       \
+	static int virtio_media_##name(struct file *file, void *fh,  \
+				       payload_t *payload)           \
+	{                                                            \
+		return virtio_media_send_r_ioctl(fh, ioctl, payload, \
+						 sizeof(*payload));  \
+	}
+#define SIMPLE_W_IOCTL(name, ioctl, payload_t)                       \
+	static int virtio_media_##name(struct file *file, void *fh,  \
+				       payload_t *payload)           \
+	{                                                            \
+		return virtio_media_send_w_ioctl(fh, ioctl, payload, \
+						 sizeof(*payload));  \
+	}
+
+/*
+ * V4L2 ioctl handlers.
+ *
+ * Most of these functions just forward the ioctl to the host, for these we can
+ * use one of the SIMPLE_*_IOCTL macros. Exceptions that have their own
+ * standalone function follow.
+ */
+
+SIMPLE_WR_IOCTL(enum_fmt, VIDIOC_ENUM_FMT, struct v4l2_fmtdesc)
+SIMPLE_WR_IOCTL(g_fmt, VIDIOC_G_FMT, struct v4l2_format)
+SIMPLE_WR_IOCTL(s_fmt, VIDIOC_S_FMT, struct v4l2_format)
+SIMPLE_WR_IOCTL(try_fmt, VIDIOC_TRY_FMT, struct v4l2_format)
+SIMPLE_WR_IOCTL(enum_framesizes, VIDIOC_ENUM_FRAMESIZES,
+		struct v4l2_frmsizeenum)
+SIMPLE_WR_IOCTL(enum_frameintervals, VIDIOC_ENUM_FRAMEINTERVALS,
+		struct v4l2_frmivalenum)
+SIMPLE_WR_IOCTL(queryctrl, VIDIOC_QUERYCTRL, struct v4l2_queryctrl)
+SIMPLE_WR_IOCTL(g_ctrl, VIDIOC_G_CTRL, struct v4l2_control)
+SIMPLE_WR_IOCTL(s_ctrl, VIDIOC_S_CTRL, struct v4l2_control)
+SIMPLE_WR_IOCTL(query_ext_ctrl, VIDIOC_QUERY_EXT_CTRL,
+		struct v4l2_query_ext_ctrl)
+SIMPLE_WR_IOCTL(s_dv_timings, VIDIOC_S_DV_TIMINGS, struct v4l2_dv_timings)
+SIMPLE_WR_IOCTL(g_dv_timings, VIDIOC_G_DV_TIMINGS, struct v4l2_dv_timings)
+SIMPLE_R_IOCTL(query_dv_timings, VIDIOC_QUERY_DV_TIMINGS,
+	       struct v4l2_dv_timings)
+SIMPLE_WR_IOCTL(enum_dv_timings, VIDIOC_ENUM_DV_TIMINGS,
+		struct v4l2_enum_dv_timings)
+SIMPLE_WR_IOCTL(dv_timings_cap, VIDIOC_DV_TIMINGS_CAP,
+		struct v4l2_dv_timings_cap)
+SIMPLE_WR_IOCTL(enuminput, VIDIOC_ENUMINPUT, struct v4l2_input)
+SIMPLE_WR_IOCTL(querymenu, VIDIOC_QUERYMENU, struct v4l2_querymenu)
+SIMPLE_WR_IOCTL(enumoutput, VIDIOC_ENUMOUTPUT, struct v4l2_output)
+SIMPLE_WR_IOCTL(enumaudio, VIDIOC_ENUMAUDIO, struct v4l2_audio)
+SIMPLE_R_IOCTL(g_audio, VIDIOC_G_AUDIO, struct v4l2_audio)
+SIMPLE_W_IOCTL(s_audio, VIDIOC_S_AUDIO, const struct v4l2_audio)
+SIMPLE_WR_IOCTL(enumaudout, VIDIOC_ENUMAUDOUT, struct v4l2_audioout)
+SIMPLE_R_IOCTL(g_audout, VIDIOC_G_AUDOUT, struct v4l2_audioout)
+SIMPLE_W_IOCTL(s_audout, VIDIOC_S_AUDOUT, const struct v4l2_audioout)
+SIMPLE_WR_IOCTL(g_modulator, VIDIOC_G_MODULATOR, struct v4l2_modulator)
+SIMPLE_W_IOCTL(s_modulator, VIDIOC_S_MODULATOR, const struct v4l2_modulator)
+SIMPLE_WR_IOCTL(g_selection, VIDIOC_G_SELECTION, struct v4l2_selection)
+SIMPLE_WR_IOCTL(s_selection, VIDIOC_S_SELECTION, struct v4l2_selection)
+SIMPLE_R_IOCTL(g_enc_index, VIDIOC_G_ENC_INDEX, struct v4l2_enc_idx)
+SIMPLE_WR_IOCTL(encoder_cmd, VIDIOC_ENCODER_CMD, struct v4l2_encoder_cmd)
+SIMPLE_WR_IOCTL(try_encoder_cmd, VIDIOC_TRY_ENCODER_CMD,
+		struct v4l2_encoder_cmd)
+SIMPLE_WR_IOCTL(try_decoder_cmd, VIDIOC_TRY_DECODER_CMD,
+		struct v4l2_decoder_cmd)
+SIMPLE_WR_IOCTL(g_parm, VIDIOC_G_PARM, struct v4l2_streamparm)
+SIMPLE_WR_IOCTL(s_parm, VIDIOC_S_PARM, struct v4l2_streamparm)
+SIMPLE_R_IOCTL(g_std, VIDIOC_G_STD, v4l2_std_id)
+SIMPLE_R_IOCTL(querystd, VIDIOC_QUERYSTD, v4l2_std_id)
+SIMPLE_WR_IOCTL(enumstd, VIDIOC_ENUMSTD, struct v4l2_standard)
+SIMPLE_WR_IOCTL(g_tuner, VIDIOC_G_TUNER, struct v4l2_tuner)
+SIMPLE_W_IOCTL(s_tuner, VIDIOC_S_TUNER, const struct v4l2_tuner)
+SIMPLE_WR_IOCTL(g_frequency, VIDIOC_G_FREQUENCY, struct v4l2_frequency)
+SIMPLE_W_IOCTL(s_frequency, VIDIOC_S_FREQUENCY, const struct v4l2_frequency)
+SIMPLE_WR_IOCTL(enum_freq_bands, VIDIOC_ENUM_FREQ_BANDS,
+		struct v4l2_frequency_band)
+SIMPLE_WR_IOCTL(g_sliced_vbi_cap, VIDIOC_G_SLICED_VBI_CAP,
+		struct v4l2_sliced_vbi_cap)
+SIMPLE_W_IOCTL(s_hw_freq_seek, VIDIOC_S_HW_FREQ_SEEK,
+	       const struct v4l2_hw_freq_seek)
+
+/*
+ * QUERYCAP is handled by reading the configuration area.
+ *
+ */
+
+static int virtio_media_querycap(struct file *file, void *fh,
+				 struct v4l2_capability *cap)
+{
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_media *vv = to_virtio_media(video_dev);
+
+	strscpy(cap->bus_info, "platform:virtio-media");
+
+	if (!driver_name)
+		strscpy(cap->driver, VIRTIO_MEDIA_DEFAULT_DRIVER_NAME);
+	else
+		strscpy(cap->driver, driver_name);
+
+	virtio_cread_bytes(vv->virtio_dev, 8, cap->card, sizeof(cap->card));
+
+	cap->capabilities = video_dev->device_caps | V4L2_CAP_DEVICE_CAPS;
+	cap->device_caps = video_dev->device_caps;
+
+	return 0;
+}
+
+/*
+ * Extended control ioctls are handled mostly identically.
+ */
+
+static int virtio_media_g_ext_ctrls(struct file *file, void *fh,
+				    struct v4l2_ext_controls *ctrls)
+{
+	return virtio_media_send_ext_controls_ioctl(fh, VIDIOC_G_EXT_CTRLS,
+						    ctrls);
+}
+
+static int virtio_media_s_ext_ctrls(struct file *file, void *fh,
+				    struct v4l2_ext_controls *ctrls)
+{
+	return virtio_media_send_ext_controls_ioctl(fh, VIDIOC_S_EXT_CTRLS,
+						    ctrls);
+}
+
+static int virtio_media_try_ext_ctrls(struct file *file, void *fh,
+				      struct v4l2_ext_controls *ctrls)
+{
+	return virtio_media_send_ext_controls_ioctl(fh, VIDIOC_TRY_EXT_CTRLS,
+						    ctrls);
+}
+
+/*
+ * Subscribe/unsubscribe from an event.
+ */
+
+static int
+virtio_media_subscribe_event(struct v4l2_fh *fh,
+			     const struct v4l2_event_subscription *sub)
+{
+	struct video_device *video_dev = fh->vdev;
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	int ret;
+
+	/* First subscribe to the event in the guest. */
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		ret = v4l2_src_change_event_subscribe(fh, sub);
+		break;
+	default:
+		ret = v4l2_event_subscribe(fh, sub, 1, NULL);
+		break;
+	}
+	if (ret)
+		return ret;
+
+	/* Then ask the host to signal us these events. */
+	ret = virtio_media_send_w_ioctl(fh, VIDIOC_SUBSCRIBE_EVENT, sub,
+					sizeof(*sub));
+	if (ret < 0) {
+		v4l2_event_unsubscribe(fh, sub);
+		return ret;
+	}
+
+	/*
+	 * Subscribing to an event may result in that event being signaled
+	 * immediately. Process all pending events to make sure we don't miss it.
+	 */
+	if (sub->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL)
+		virtio_media_process_events(vv);
+
+	return 0;
+}
+
+static int
+virtio_media_unsubscribe_event(struct v4l2_fh *fh,
+			       const struct v4l2_event_subscription *sub)
+{
+	int ret;
+
+	ret = virtio_media_send_w_ioctl(fh, VIDIOC_UNSUBSCRIBE_EVENT, sub,
+					sizeof(*sub));
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_event_unsubscribe(fh, sub);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Streamon/off affect the local queue state.
+ */
+
+static int virtio_media_streamon(struct file *file, void *fh,
+				 enum v4l2_buf_type i)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	int ret;
+
+	if (i > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	ret = virtio_media_send_w_ioctl(fh, VIDIOC_STREAMON, &i, sizeof(i));
+	if (ret < 0)
+		return ret;
+
+	session->queues[i].streaming = true;
+
+	return 0;
+}
+
+static int virtio_media_streamoff(struct file *file, void *fh,
+				  enum v4l2_buf_type i)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	int ret;
+
+	if (i > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	ret = virtio_media_send_w_ioctl(fh, VIDIOC_STREAMOFF, &i, sizeof(i));
+	if (ret < 0)
+		return ret;
+
+	virtio_media_clear_queue(session, &session->queues[i]);
+
+	return 0;
+}
+
+/*
+ * Buffer creation/queuing functions deal with the local driver state.
+ */
+
+static int virtio_media_reqbufs(struct file *file, void *fh,
+				struct v4l2_requestbuffers *b)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct virtio_media_queue_state *queue;
+	int ret;
+
+	if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	if (b->memory == V4L2_MEMORY_USERPTR && !allow_userptr)
+		return -EINVAL;
+
+	ret = virtio_media_send_wr_ioctl(fh, VIDIOC_REQBUFS, b, sizeof(*b),
+					 sizeof(*b));
+	if (ret)
+		return ret;
+
+	queue = &session->queues[b->type];
+
+	/* REQBUFS(0) is an implicit STREAMOFF. */
+	if (b->count == 0)
+		virtio_media_clear_queue(session, queue);
+
+	vfree(queue->buffers);
+	queue->buffers = NULL;
+
+	if (b->count > 0) {
+		queue->buffers =
+			vzalloc(sizeof(struct virtio_media_buffer) * b->count);
+		if (!queue->buffers)
+			return -ENOMEM;
+	}
+
+	queue->allocated_bufs = b->count;
+
+	/*
+	 * If a multiplanar queue is successfully used here, this means
+	 * we are using the multiplanar interface.
+	 */
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type))
+		session->uses_mplane = true;
+
+	if (!allow_userptr)
+		b->capabilities &= ~V4L2_BUF_CAP_SUPPORTS_USERPTR;
+
+	/* We do not support DMABUF yet. */
+	b->capabilities &= ~V4L2_BUF_CAP_SUPPORTS_DMABUF;
+
+	return 0;
+}
+
+static int virtio_media_querybuf(struct file *file, void *fh,
+				 struct v4l2_buffer *b)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct virtio_media_queue_state *queue;
+	struct virtio_media_buffer *buffer;
+	int ret;
+
+	ret = virtio_media_send_buffer_ioctl(fh, VIDIOC_QUERYBUF, b);
+	if (ret)
+		return ret;
+
+	if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	queue = &session->queues[b->type];
+	if (b->index >= queue->allocated_bufs)
+		return -EINVAL;
+
+	buffer = &queue->buffers[b->index];
+	/* Set the DONE flag if the buffer is waiting in our own dequeue queue. */
+	b->flags |= (buffer->buffer.flags & V4L2_BUF_FLAG_DONE);
+
+	return 0;
+}
+
+static int virtio_media_create_bufs(struct file *file, void *fh,
+				    struct v4l2_create_buffers *b)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct virtio_media_queue_state *queue;
+	struct virtio_media_buffer *buffers;
+	u32 type = b->format.type;
+	int ret;
+
+	if (type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	queue = &session->queues[type];
+
+	ret = virtio_media_send_wr_ioctl(fh, VIDIOC_CREATE_BUFS, b, sizeof(*b),
+					 sizeof(*b));
+	if (ret)
+		return ret;
+
+	/* If count is zero, we were just checking for format. */
+	if (b->count == 0)
+		return 0;
+
+	buffers = queue->buffers;
+
+	queue->buffers = vzalloc(sizeof(struct virtio_media_buffer) *
+				 (b->index + b->count));
+	if (!queue->buffers) {
+		queue->buffers = buffers;
+		return -ENOMEM;
+	}
+
+	memcpy(queue->buffers, buffers,
+	       sizeof(*buffers) * queue->allocated_bufs);
+	vfree(buffers);
+
+	queue->allocated_bufs = b->index + b->count;
+
+	return 0;
+}
+
+static int virtio_media_prepare_buf(struct file *file, void *fh,
+				    struct v4l2_buffer *b)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct virtio_media_queue_state *queue;
+	struct virtio_media_buffer *buffer;
+	int i, ret;
+
+	if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+	queue = &session->queues[b->type];
+	if (b->index >= queue->allocated_bufs)
+		return -EINVAL;
+	buffer = &queue->buffers[b->index];
+
+	buffer->buffer.m = b->m;
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
+		if (b->length > VIDEO_MAX_PLANES)
+			return -EINVAL;
+		for (i = 0; i < b->length; i++)
+			buffer->planes[i].m = b->m.planes[i].m;
+	}
+
+	ret = virtio_media_send_buffer_ioctl(fh, VIDIOC_PREPARE_BUF, b);
+	if (ret)
+		return ret;
+
+	buffer->buffer.flags = V4L2_BUF_FLAG_PREPARED;
+
+	return 0;
+}
+
+static int virtio_media_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	struct virtio_media_queue_state *queue;
+	struct virtio_media_buffer *buffer;
+	bool prepared;
+	u32 old_flags;
+	int i, ret;
+
+	if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+	queue = &session->queues[b->type];
+	if (b->index >= queue->allocated_bufs)
+		return -EINVAL;
+	buffer = &queue->buffers[b->index];
+	prepared = buffer->buffer.flags & V4L2_BUF_FLAG_PREPARED;
+
+	/*
+	 * Store the buffer and plane `m` information so we can retrieve it again
+	 * when DQBUF occurs.
+	 */
+	if (!prepared) {
+		buffer->buffer.m = b->m;
+		if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
+			if (b->length > VIDEO_MAX_PLANES)
+				return -EINVAL;
+			for (i = 0; i < b->length; i++)
+				buffer->planes[i].m = b->m.planes[i].m;
+		}
+	}
+	old_flags = buffer->buffer.flags;
+	buffer->buffer.flags = V4L2_BUF_FLAG_QUEUED;
+
+	ret = virtio_media_send_buffer_ioctl(fh, VIDIOC_QBUF, b);
+	if (ret) {
+		/* Rollback the previous flags as the buffer is not queued. */
+		buffer->buffer.flags = old_flags;
+		return ret;
+	}
+
+	queue->queued_bufs += 1;
+
+	return 0;
+}
+
+static int virtio_media_dqbuf(struct file *file, void *fh,
+			      struct v4l2_buffer *b)
+{
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct virtio_media_session *session =
+		fh_to_session(file->private_data);
+	struct virtio_media_buffer *dqbuf;
+	struct virtio_media_queue_state *queue;
+	struct list_head *buffer_queue;
+	struct v4l2_plane *planes_backup = NULL;
+	const bool is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(b->type);
+	int ret;
+
+	if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
+		return -EINVAL;
+
+	queue = &session->queues[b->type];
+
+	/*
+	 * If a buffer with the LAST flag has been returned, subsequent calls to DQBUF
+	 * must return -EPIPE until the queue is cleared.
+	 */
+	if (queue->is_capture_last)
+		return -EPIPE;
+
+	buffer_queue = &queue->pending_dqbufs;
+
+	if (session->nonblocking_dequeue) {
+		if (list_empty(buffer_queue))
+			return -EAGAIN;
+	} else if (queue->allocated_bufs == 0) {
+		return -EINVAL;
+	} else if (!queue->streaming) {
+		return -EINVAL;
+	}
+
+	/*
+	 * vv->lock has been acquired by virtio_media_device_ioctl. Release it
+	 * while we want to other ioctls for this session can be processed and
+	 * potentially trigger dqbuf_wait.
+	 */
+	mutex_unlock(&vv->vlock);
+	ret = wait_event_interruptible(session->dqbuf_wait,
+				       !list_empty(buffer_queue));
+	mutex_lock(&vv->vlock);
+	if (ret)
+		return -EINTR;
+
+	mutex_lock(&session->queues_lock);
+	dqbuf = list_first_entry(buffer_queue, struct virtio_media_buffer,
+				 list);
+	list_del(&dqbuf->list);
+	mutex_unlock(&session->queues_lock);
+
+	/* Clear the DONE flag as the buffer is now being dequeued. */
+	dqbuf->buffer.flags &= ~V4L2_BUF_FLAG_DONE;
+
+	if (is_multiplanar) {
+		size_t nb_planes = min_t(u32, b->length, VIDEO_MAX_PLANES);
+
+		memcpy(b->m.planes, dqbuf->planes,
+		       nb_planes * sizeof(struct v4l2_plane));
+		planes_backup = b->m.planes;
+	}
+
+	memcpy(b, &dqbuf->buffer, sizeof(*b));
+
+	if (is_multiplanar)
+		b->m.planes = planes_backup;
+
+	if (V4L2_TYPE_IS_CAPTURE(b->type) && b->flags & V4L2_BUF_FLAG_LAST)
+		queue->is_capture_last = true;
+
+	return 0;
+}
+
+/*
+ * s/g_input/output work with an unsigned int - recast this to a u32 so the
+ * size is unambiguous.
+ */
+
+static int virtio_media_g_input(struct file *file, void *fh, unsigned int *i)
+{
+	u32 input;
+	int ret;
+
+	ret = virtio_media_send_wr_ioctl(fh, VIDIOC_G_INPUT, &input,
+					 sizeof(input), sizeof(input));
+	if (ret)
+		return ret;
+
+	*i = input;
+
+	return 0;
+}
+
+static int virtio_media_s_input(struct file *file, void *fh, unsigned int i)
+{
+	u32 input = i;
+
+	return virtio_media_send_wr_ioctl(fh, VIDIOC_S_INPUT, &input,
+					  sizeof(input), sizeof(input));
+}
+
+static int virtio_media_g_output(struct file *file, void *fh, unsigned int *o)
+{
+	u32 output;
+	int ret;
+
+	ret = virtio_media_send_wr_ioctl(fh, VIDIOC_G_OUTPUT, &output,
+					 sizeof(output), sizeof(output));
+	if (ret)
+		return ret;
+
+	*o = output;
+
+	return 0;
+}
+
+static int virtio_media_s_output(struct file *file, void *fh, unsigned int o)
+{
+	u32 output = o;
+
+	return virtio_media_send_wr_ioctl(fh, VIDIOC_S_OUTPUT, &output,
+					  sizeof(output), sizeof(output));
+}
+
+/*
+ * decoder_cmd can affect the state of the CAPTURE queue.
+ */
+
+static int virtio_media_decoder_cmd(struct file *file, void *fh,
+				    struct v4l2_decoder_cmd *cmd)
+{
+	struct virtio_media_session *session = fh_to_session(fh);
+	int ret;
+
+	ret = virtio_media_send_wr_ioctl(fh, VIDIOC_DECODER_CMD, cmd,
+					 sizeof(*cmd), sizeof(*cmd));
+	if (ret)
+		return ret;
+
+	/* A START command makes the CAPTURE queue able to dequeue again. */
+	if (cmd->cmd == V4L2_DEC_CMD_START) {
+		session->queues[V4L2_BUF_TYPE_VIDEO_CAPTURE].is_capture_last =
+			false;
+		session->queues[V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE]
+			.is_capture_last = false;
+	}
+
+	return 0;
+}
+
+/*
+ * s_std doesn't work with a pointer, so we cannot use SIMPLE_W_IOCTL.
+ */
+
+static int virtio_media_s_std(struct file *file, void *fh, v4l2_std_id s)
+{
+	int ret;
+
+	ret = virtio_media_send_w_ioctl(fh, VIDIOC_S_STD, &s, sizeof(s));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+const struct v4l2_ioctl_ops virtio_media_ioctl_ops = {
+	/* VIDIOC_QUERYCAP handler */
+	.vidioc_querycap = virtio_media_querycap,
+
+	/* VIDIOC_ENUM_FMT handlers */
+	.vidioc_enum_fmt_vid_cap = virtio_media_enum_fmt,
+	.vidioc_enum_fmt_vid_overlay = virtio_media_enum_fmt,
+	.vidioc_enum_fmt_vid_out = virtio_media_enum_fmt,
+	.vidioc_enum_fmt_sdr_cap = virtio_media_enum_fmt,
+	.vidioc_enum_fmt_sdr_out = virtio_media_enum_fmt,
+	.vidioc_enum_fmt_meta_cap = virtio_media_enum_fmt,
+	.vidioc_enum_fmt_meta_out = virtio_media_enum_fmt,
+
+	/* VIDIOC_G_FMT handlers */
+	.vidioc_g_fmt_vid_cap = virtio_media_g_fmt,
+	.vidioc_g_fmt_vid_overlay = virtio_media_g_fmt,
+	.vidioc_g_fmt_vid_out = virtio_media_g_fmt,
+	.vidioc_g_fmt_vid_out_overlay = virtio_media_g_fmt,
+	.vidioc_g_fmt_vbi_cap = virtio_media_g_fmt,
+	.vidioc_g_fmt_vbi_out = virtio_media_g_fmt,
+	.vidioc_g_fmt_sliced_vbi_cap = virtio_media_g_fmt,
+	.vidioc_g_fmt_sliced_vbi_out = virtio_media_g_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = virtio_media_g_fmt,
+	.vidioc_g_fmt_vid_out_mplane = virtio_media_g_fmt,
+	.vidioc_g_fmt_sdr_cap = virtio_media_g_fmt,
+	.vidioc_g_fmt_sdr_out = virtio_media_g_fmt,
+	.vidioc_g_fmt_meta_cap = virtio_media_g_fmt,
+	.vidioc_g_fmt_meta_out = virtio_media_g_fmt,
+
+	/* VIDIOC_S_FMT handlers */
+	.vidioc_s_fmt_vid_cap = virtio_media_s_fmt,
+	.vidioc_s_fmt_vid_overlay = virtio_media_s_fmt,
+	.vidioc_s_fmt_vid_out = virtio_media_s_fmt,
+	.vidioc_s_fmt_vid_out_overlay = virtio_media_s_fmt,
+	.vidioc_s_fmt_vbi_cap = virtio_media_s_fmt,
+	.vidioc_s_fmt_vbi_out = virtio_media_s_fmt,
+	.vidioc_s_fmt_sliced_vbi_cap = virtio_media_s_fmt,
+	.vidioc_s_fmt_sliced_vbi_out = virtio_media_s_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = virtio_media_s_fmt,
+	.vidioc_s_fmt_vid_out_mplane = virtio_media_s_fmt,
+	.vidioc_s_fmt_sdr_cap = virtio_media_s_fmt,
+	.vidioc_s_fmt_sdr_out = virtio_media_s_fmt,
+	.vidioc_s_fmt_meta_cap = virtio_media_s_fmt,
+	.vidioc_s_fmt_meta_out = virtio_media_s_fmt,
+
+	/* VIDIOC_TRY_FMT handlers */
+	.vidioc_try_fmt_vid_cap = virtio_media_try_fmt,
+	.vidioc_try_fmt_vid_overlay = virtio_media_try_fmt,
+	.vidioc_try_fmt_vid_out = virtio_media_try_fmt,
+	.vidioc_try_fmt_vid_out_overlay = virtio_media_try_fmt,
+	.vidioc_try_fmt_vbi_cap = virtio_media_try_fmt,
+	.vidioc_try_fmt_vbi_out = virtio_media_try_fmt,
+	.vidioc_try_fmt_sliced_vbi_cap = virtio_media_try_fmt,
+	.vidioc_try_fmt_sliced_vbi_out = virtio_media_try_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = virtio_media_try_fmt,
+	.vidioc_try_fmt_vid_out_mplane = virtio_media_try_fmt,
+	.vidioc_try_fmt_sdr_cap = virtio_media_try_fmt,
+	.vidioc_try_fmt_sdr_out = virtio_media_try_fmt,
+	.vidioc_try_fmt_meta_cap = virtio_media_try_fmt,
+	.vidioc_try_fmt_meta_out = virtio_media_try_fmt,
+
+	/* Buffer handlers */
+	.vidioc_reqbufs = virtio_media_reqbufs,
+	.vidioc_querybuf = virtio_media_querybuf,
+	.vidioc_qbuf = virtio_media_qbuf,
+	.vidioc_expbuf = NULL,
+	.vidioc_dqbuf = virtio_media_dqbuf,
+	.vidioc_create_bufs = virtio_media_create_bufs,
+	.vidioc_prepare_buf = virtio_media_prepare_buf,
+	/* Overlay interface not supported yet */
+	.vidioc_overlay = NULL,
+	/* Overlay interface not supported yet */
+	.vidioc_g_fbuf = NULL,
+	/* Overlay interface not supported yet */
+	.vidioc_s_fbuf = NULL,
+
+	/* Stream on/off */
+	.vidioc_streamon = virtio_media_streamon,
+	.vidioc_streamoff = virtio_media_streamoff,
+
+	/* Standard handling */
+	.vidioc_g_std = virtio_media_g_std,
+	.vidioc_s_std = virtio_media_s_std,
+	.vidioc_querystd = virtio_media_querystd,
+
+	/* Input handling */
+	.vidioc_enum_input = virtio_media_enuminput,
+	.vidioc_g_input = virtio_media_g_input,
+	.vidioc_s_input = virtio_media_s_input,
+
+	/* Output handling */
+	.vidioc_enum_output = virtio_media_enumoutput,
+	.vidioc_g_output = virtio_media_g_output,
+	.vidioc_s_output = virtio_media_s_output,
+
+	/* Control handling */
+	.vidioc_queryctrl = virtio_media_queryctrl,
+	.vidioc_query_ext_ctrl = virtio_media_query_ext_ctrl,
+	.vidioc_g_ctrl = virtio_media_g_ctrl,
+	.vidioc_s_ctrl = virtio_media_s_ctrl,
+	.vidioc_g_ext_ctrls = virtio_media_g_ext_ctrls,
+	.vidioc_s_ext_ctrls = virtio_media_s_ext_ctrls,
+	.vidioc_try_ext_ctrls = virtio_media_try_ext_ctrls,
+	.vidioc_querymenu = virtio_media_querymenu,
+
+	/* Audio ioctls */
+	.vidioc_enumaudio = virtio_media_enumaudio,
+	.vidioc_g_audio = virtio_media_g_audio,
+	.vidioc_s_audio = virtio_media_s_audio,
+
+	/* Audio out ioctls */
+	.vidioc_enumaudout = virtio_media_enumaudout,
+	.vidioc_g_audout = virtio_media_g_audout,
+	.vidioc_s_audout = virtio_media_s_audout,
+	.vidioc_g_modulator = virtio_media_g_modulator,
+	.vidioc_s_modulator = virtio_media_s_modulator,
+
+	/* Crop ioctls */
+	/* Not directly an ioctl (part of VIDIOC_CROPCAP), so no need to implement */
+	.vidioc_g_pixelaspect = NULL,
+	.vidioc_g_selection = virtio_media_g_selection,
+	.vidioc_s_selection = virtio_media_s_selection,
+
+	/* Compression ioctls */
+	/* Deprecated in V4L2. */
+	.vidioc_g_jpegcomp = NULL,
+	/* Deprecated in V4L2. */
+	.vidioc_s_jpegcomp = NULL,
+	.vidioc_g_enc_index = virtio_media_g_enc_index,
+	.vidioc_encoder_cmd = virtio_media_encoder_cmd,
+	.vidioc_try_encoder_cmd = virtio_media_try_encoder_cmd,
+	.vidioc_decoder_cmd = virtio_media_decoder_cmd,
+	.vidioc_try_decoder_cmd = virtio_media_try_decoder_cmd,
+
+	/* Stream type-dependent parameter ioctls */
+	.vidioc_g_parm = virtio_media_g_parm,
+	.vidioc_s_parm = virtio_media_s_parm,
+
+	/* Tuner ioctls */
+	.vidioc_g_tuner = virtio_media_g_tuner,
+	.vidioc_s_tuner = virtio_media_s_tuner,
+	.vidioc_g_frequency = virtio_media_g_frequency,
+	.vidioc_s_frequency = virtio_media_s_frequency,
+	.vidioc_enum_freq_bands = virtio_media_enum_freq_bands,
+
+	/* Sliced VBI cap */
+	.vidioc_g_sliced_vbi_cap = virtio_media_g_sliced_vbi_cap,
+
+	/* Log status ioctl */
+	/* Guest-only operation */
+	.vidioc_log_status = NULL,
+
+	.vidioc_s_hw_freq_seek = virtio_media_s_hw_freq_seek,
+
+	.vidioc_enum_framesizes = virtio_media_enum_framesizes,
+	.vidioc_enum_frameintervals = virtio_media_enum_frameintervals,
+
+	/* DV Timings IOCTLs */
+	.vidioc_s_dv_timings = virtio_media_s_dv_timings,
+	.vidioc_g_dv_timings = virtio_media_g_dv_timings,
+	.vidioc_query_dv_timings = virtio_media_query_dv_timings,
+	.vidioc_enum_dv_timings = virtio_media_enum_dv_timings,
+	.vidioc_dv_timings_cap = virtio_media_dv_timings_cap,
+	.vidioc_g_edid = NULL,
+	.vidioc_s_edid = NULL,
+
+	.vidioc_subscribe_event = virtio_media_subscribe_event,
+	.vidioc_unsubscribe_event = virtio_media_unsubscribe_event,
+
+	/* For other private ioctls */
+	.vidioc_default = NULL,
+};
+
+long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
+			       unsigned long arg)
+{
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_media *vv = to_virtio_media(video_dev);
+	struct v4l2_fh *vfh = NULL;
+	struct v4l2_standard standard;
+	v4l2_std_id std_id = 0;
+	int ret;
+
+	if (test_bit(V4L2_FL_USES_V4L2_FH, &video_dev->flags))
+		vfh = file->private_data;
+
+	mutex_lock(&vv->vlock);
+
+	/*
+	 * We need to handle a few ioctls manually because their result rely on
+	 * vfd->tvnorms, which is normally updated by the driver as S_INPUT is
+	 * called. Since we want to just pass these ioctls through, we have to hijack
+	 * them from here.
+	 */
+	switch (cmd) {
+	case VIDIOC_S_STD:
+		ret = copy_from_user(&std_id, (void __user *)arg,
+				     sizeof(std_id));
+		if (ret) {
+			ret = -EINVAL;
+			break;
+		}
+		ret = virtio_media_s_std(file, vfh, std_id);
+		break;
+	case VIDIOC_ENUMSTD:
+		ret = copy_from_user(&standard, (void __user *)arg,
+				     sizeof(standard));
+		if (ret) {
+			ret = -EINVAL;
+			break;
+		}
+		ret = virtio_media_enumstd(file, vfh, &standard);
+		if (ret)
+			break;
+		ret = copy_to_user((void __user *)arg, &standard,
+				   sizeof(standard));
+		if (ret)
+			ret = -EINVAL;
+		break;
+	case VIDIOC_QUERYSTD:
+		ret = virtio_media_querystd(file, vfh, &std_id);
+		if (ret)
+			break;
+		ret = copy_to_user((void __user *)arg, &std_id, sizeof(std_id));
+		if (ret)
+			ret = -EINVAL;
+		break;
+	default:
+		ret = video_ioctl2(file, cmd, arg);
+		break;
+	}
+
+	mutex_unlock(&vv->vlock);
+
+	return ret;
+}
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 7aa2eb76620508fdc915533f74973d76308d3ef5..b4bb0ace0b26e37224c975f89bbf669c51921816 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -68,6 +68,7 @@
 #define VIRTIO_ID_AUDIO_POLICY		39 /* virtio audio policy */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
+#define VIRTIO_ID_MEDIA			48 /* virtio media */
 
 /*
  * Virtio Transitional IDs

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20241229-virtio-media-25067bb27526

Best regards,
-- 
Alexandre Courbot <gnurou@gmail.com>


