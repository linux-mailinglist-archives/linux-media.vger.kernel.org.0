Return-Path: <linux-media+bounces-43859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7BBC2585
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5183A9400
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5CE2EA178;
	Tue,  7 Oct 2025 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mfVSmCAS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCE2E9ECC;
	Tue,  7 Oct 2025 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860760; cv=none; b=BLNNtGEKc8DpvyYmTJwVisLuPxwDCfRepnZbXX575PbcA9AzCZ55kb2riJTnz3QJYwmYRGO+twF6C50p2ICfdrR9DXeRQCV6FHK7PB8jEqhkfZQ5C4GPC6gv4Z7nV2vUJnPAwYscctCU0VG+YZp71jENd7Evrat8bk8VsC290dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860760; c=relaxed/simple;
	bh=gaVIBOMsqDepQjal6ydmfk9LMZ3g+ZkoHS6cx8St+7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejjQOwUrCi7QJWQcyD7NIOcHpqzawbQvi4Na3FuSwMHGHk4D880Qm6fn8JLbEWwFZEMVhD47KZ+IB/854Cfx44hB/pJtrtcDwE6El5UcoeW4OU68FtIchHNRYhmff331OjlHQgl1ibGv+fZHjz51xn+/B5tSxeOqdMJ3xaJqBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mfVSmCAS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81C35EB5;
	Tue,  7 Oct 2025 20:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860656;
	bh=gaVIBOMsqDepQjal6ydmfk9LMZ3g+ZkoHS6cx8St+7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mfVSmCASxxH1uOm2hz4ePAlam4qSwegZzixN3I6K5krQPTcZQWBboSFHVtdSiM3up
	 sTmlZF51Bbadsu8KGGah5HbxU7ASb6C/vVTGda1Gpxm6bkusVPHbKHiVe5/dn49EXA
	 54ng7Pz1IfNUaDHnm1pq609AjZxidrp/PT5vA5L4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:14 +0200
Subject: [PATCH v6 5/8] media: v4l2-core: Introduce v4l2-isp.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-5-5f719d9f39e5@ideasonboard.com>
References: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
In-Reply-To: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10289;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=gaVIBOMsqDepQjal6ydmfk9LMZ3g+ZkoHS6cx8St+7I=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgHtSzhzxu6ZUseIDgAeRfYQQCc+eWQucwvY
 Uj7FAwpU7eJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBwAKCRByNAaPFqFW
 PMjYD/9Z1yQ2AN/cz7dE9B80U2Bl33bYHlqRRlhrV0wTowPxNxckQ37m4ZbCAxYHAmaQ+yrtPOR
 04REGqE1wsj7L2Lh77LG0Na/xz2fHIbbHdpfpnvnr39PCT7tNuOTvR7ggs/58zdl15b4dUuYRnC
 0GRe5NEeM6ggX0/2GCWRoGaTbKSCfCs/eQXVym/98/ft15jzJx5bB+kJxjD2BQt6b+S6sENuQVY
 tnFSPKRZo0QdK1hWuRizLMh71d9YoCtmsy3FICXuZQINegYgK8rKIv3j+LW1gBJ5DaEcwpLyZKJ
 a36YrHWwlr8nLTZJDgzAkife1AMxnYf85y7ixG0Z35b/Qzf3NOBHrlk1ZSQLV+E5tVNx1tLCAb0
 BTPFR4UmWCII/V/1PZi1WYnisz9Qd7nRKsluM6dlqDqHXJyGPVL/NEkRoCAQsKJLIj033FyjjLk
 /sYXgK6WK/ZGixliLekvcpYCo18GMG8YazobK0KsSEc9mWHaDZ5eo4ULOwFlbXIIY/Z69JmaNbr
 8NFY1qbv8lmR3TZHUCOw+N8n1gUeqFurnhJO8PU26C1Iwk6AwKl3EdNTy0638Sgj34owQEAjYiI
 PwDwYE9OtO8t3lC7dkCGccb+R03g+XH79Zv+MJ1B+ztcx+rdXaXAEgeannO5+LEmsGGOv3spiDw
 9268LBZiM2satZQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add to the V4L2 framework helper functions to support drivers when
validating a buffer of V4L2 ISP parameters.

Driver shall use v4l2_isp_params_validate_buffer_size() to verify the
size correctness of the data received from userspace, and after having
copied the data to a kernel-only memory location, complete the
validation by calling v4l2_isp_params_validate_buffer().

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS                        |   2 +
 drivers/media/v4l2-core/Kconfig    |   4 ++
 drivers/media/v4l2-core/Makefile   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c | 114 +++++++++++++++++++++++++++++++++++++
 include/media/v4l2-isp.h           |  91 +++++++++++++++++++++++++++++
 5 files changed, 212 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bbc92829c3c413de7d7ba77f182a6916728b1a8c..ce57cf3774f6270bfaeffcea8fa63bcbd0a90dbd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26415,6 +26415,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
+F:	drivers/media/v4l2-core/v4l2-isp.c
+F:	include/media/v4l2-isp.h
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 331b8e535e5bbf33f22638b2ae8bc764ad5fc407..d50ccac9733cc39a43426ae7e7996dd0b5b45186 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -82,3 +82,7 @@ config V4L2_CCI_I2C
 	depends on I2C
 	select REGMAP_I2C
 	select V4L2_CCI
+
+config V4L2_ISP
+	tristate
+	depends on VIDEOBUF2_CORE
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..329f0eadce994cc1c8580beb435f68fa7e2a7aeb 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
+obj-$(CONFIG_V4L2_ISP) += v4l2-isp.o
 obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
new file mode 100644
index 0000000000000000000000000000000000000000..0ae840e16b4710c350fd8671de8c1663d3ea1e26
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#include <media/v4l2-isp.h>
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+
+#include <media/videobuf2-core.h>
+
+int v4l2_isp_params_validate_buffer_size(struct device *dev,
+					 struct vb2_buffer *vb,
+					 size_t max_size)
+{
+	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+
+	/* Payload size can't be greater than the destination buffer size */
+	if (payload_size > max_size) {
+		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
+		return -EINVAL;
+	}
+
+	/* Payload size can't be smaller than the header size */
+	if (payload_size < header_size) {
+		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer_size);
+
+int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
+				    const struct v4l2_isp_params_buffer *buffer,
+				    const struct v4l2_isp_params_block_info *info,
+				    size_t num_blocks)
+{
+	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	size_t block_offset = 0;
+	size_t buffer_size;
+
+	/* Validate the size reported in the header */
+	buffer_size = header_size + buffer->data_size;
+	if (buffer_size != payload_size) {
+		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
+			buffer_size, payload_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of ISP configuration blocks and validate them. */
+	buffer_size = buffer->data_size;
+	while (buffer_size >= sizeof(struct v4l2_isp_params_block_header)) {
+		const struct v4l2_isp_params_block_info *block_info;
+		const struct v4l2_isp_params_block_header *block;
+
+		block = (const struct v4l2_isp_params_block_header *)
+			(buffer->data + block_offset);
+
+		if (block->type >= num_blocks) {
+			dev_dbg(dev,
+				"Invalid block type %u at offset %zu\n",
+				block->type, block_offset);
+			return -EINVAL;
+		}
+
+		if (block->size > buffer_size) {
+			dev_dbg(dev, "Premature end of parameters data\n");
+			return -EINVAL;
+		}
+
+		/* It's invalid to specify both ENABLE and DISABLE. */
+		if ((block->flags & (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+				     V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) ==
+		     (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+		     V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) {
+			dev_dbg(dev, "Invalid block flags %x at offset %zu\n",
+				block->flags, block_offset);
+			return -EINVAL;
+		}
+
+		/*
+		 * Match the block reported size against the info provided
+		 * one, but allow the block to only contain the header in
+		 * case it is going to be disabled.
+		 */
+		block_info = &info[block->type];
+		if (block->size != block_info->size &&
+		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
+		    block->size != sizeof(*block))) {
+			dev_dbg(dev,
+				"Invalid block size %u (expected %zu) at offset %zu\n",
+				block->size, block_info->size, block_offset);
+			return -EINVAL;
+		}
+
+		block_offset += block->size;
+		buffer_size -= block->size;
+	}
+
+	if (buffer_size) {
+		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
new file mode 100644
index 0000000000000000000000000000000000000000..8b4695663699e7f176384739cf54ed7fa2c578f8
--- /dev/null
+++ b/include/media/v4l2-isp.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#ifndef _V4L2_ISP_H_
+#define _V4L2_ISP_H_
+
+#include <linux/media/v4l2-isp.h>
+
+struct device;
+struct vb2_buffer;
+
+/**
+ * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
+ * @max_params_size: The total size of the ISP configuration blocks
+ *
+ * Users of the v4l2 extensible parameters will have differing sized data arrays
+ * depending on their specific parameter buffers. Drivers and userspace will
+ * need to be able to calculate the appropriate size of the struct to
+ * accommodate all ISP configuration blocks provided by the platform.
+ * This macro provides a convenient tool for the calculation.
+ */
+#define v4l2_isp_params_buffer_size(max_params_size) \
+	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
+
+/**
+ * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @max_size: the maximum allowed buffer size
+ *
+ * This function performs validation of the size of a V4L2 ISP parameters buffer
+ * before the driver can access the actual data buffer content.
+ *
+ * After the sizes validation, drivers should copy the buffer content to a
+ * kernel-only memory area to prevent userspace from modifying it,
+ * before completing validation using v4l2_isp_params_validate_buffer().
+ *
+ * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
+ * against @max_size and it's validated to be large enough to accommodate at
+ * least one ISP configuration block.
+ */
+int v4l2_isp_params_validate_buffer_size(struct device *dev,
+					 struct vb2_buffer *vb,
+					 size_t max_size);
+
+/**
+ * struct v4l2_isp_params_block_info - V4L2 ISP per-block info
+ * @size: the block expected size
+ *
+ * The v4l2_isp_params_block_info collects information of the ISP configuration
+ * blocks for validation purposes. It currently only contains the expected
+ * block size.
+ *
+ * Drivers shall prepare a list of block info, indexed by block type, one for
+ * each supported ISP block and correctly populate them with the expected block
+ * size.
+ */
+struct v4l2_isp_params_block_info {
+	size_t size;
+};
+
+/**
+ * v4l2_isp_params_validate_buffer - Validate a V4L2 ISP parameters buffer
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @buffer: the V4L2 ISP parameters buffer
+ * @info: the list of per-block validation info
+ * @num_blocks: the number of blocks
+ *
+ * This function completes the validation of a V4L2 ISP parameters buffer,
+ * verifying each configuration block correctness before the driver can use
+ * them to program the hardware.
+ *
+ * Drivers should use this function after having validated the correctness of
+ * the vb2 buffer sizes by using the v4l2_isp_params_validate_buffer_size()
+ * helper first. Once the buffer size has been validated, drivers should
+ * perform a copy of the user provided buffer into a kernel-only memory buffer
+ * to prevent userspace from modifying its content after it has been submitted
+ * to the driver, and then call this function to complete validation.
+ */
+int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
+				    const struct v4l2_isp_params_buffer *buffer,
+				    const struct v4l2_isp_params_block_info *info,
+				    size_t num_blocks);
+
+#endif /* _V4L2_ISP_H_ */

-- 
2.51.0


