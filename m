Return-Path: <linux-media+bounces-44358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A56BD80C6
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5A03BBB02
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620FB30EF98;
	Tue, 14 Oct 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YLKlSu40"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798BC246BDE;
	Tue, 14 Oct 2025 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428879; cv=none; b=SVE0qZXDTL/nutHsm2+Uxmew+k4dRtb6vq2RVDi4W+8fx9P8QPbJTuGEF1r4ieEIGWZVeLp4vvCVICYPgyIpgLWpgtssAalq+SB/Z4FAfhs88DoVy8gh4M+/R3gsQTNS/RCoJydHvKUVLDQ13Fq5A/x9yu+XBTlWekD0NH9Qq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428879; c=relaxed/simple;
	bh=c5BbO5ZzrMgBc8XtdoZnE46jsbPx01eU8VmxIRnkHYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfiCBEUBAyav8TozB/gfaCfzPYQKnjMZL/gFwCimjvFlWRip+Nz8KRp+siYCdKTg1/817ksVeL7pwWHAJMLzmCWVTwQ5x9VnKszNn7uwRVI/HPjHeeRSEjxZWM0tr5UWQ4rC8NGYUaH2Cbi3NK914OoH1gL0ieRswqROC0vI6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YLKlSu40; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F35BC73;
	Tue, 14 Oct 2025 09:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428774;
	bh=c5BbO5ZzrMgBc8XtdoZnE46jsbPx01eU8VmxIRnkHYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YLKlSu40+n8wRCn00t33S2L9iG15b58dXqki4bhbDQ6nPfKB0ORfAD+coAbXqe8TC
	 iA0wSmdKEMtHexDPCc3gR2Ojlr7Z6hTDv6RTfvQtNhcGqEItlSCMFl7a2GH2o0CJZb
	 ojNNDKsSlASZcv7S4OEmNgMz42iUmGpfgZXBtTEM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:00:53 +0200
Subject: [PATCH v7 1/8] media: uapi: Introduce V4L2 generic ISP types
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-1-6628bed5ca98@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6283;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=c5BbO5ZzrMgBc8XtdoZnE46jsbPx01eU8VmxIRnkHYU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNGATS5FnpmXJkh8fVntvjyb1MJXtKm2dCkL
 uKblBwX37mJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRgAKCRByNAaPFqFW
 PE0AD/9rtgG0MpiYxkJ7o8K3tu6ztJhAMlr1GUsJT8SuNKq3nX0Ox+ptlwbSeusep6rv44UG95a
 yVqwUHzHWWvYpZ8wpX2EQXPJmI57Z+ziOMsSePXyv+uSoI9pHIbuy6lMMhS4wTiPhQXL0hli1Iw
 RF3eJZUaREKDiykp2VOmeb0ghX/3S+aHclWly6txNBcGc94yP7WMezGbTwErILuyIroBd6p3KvV
 +pbIKuvrbUu+Wb/CDmTiejhepNbDaoGBsKGUGq9ycpjbUUlWAedJOljMQhn8CPQc+aDjWQ+6XAE
 jpu7rII12NXWCnQDSa0J94BepiN7zpjyU/S0YNHh+Yu4Xcush4+UR5tGVrcKmcC5JGKy44q21Vn
 hpepiUOhfRc4/wvxcHD3MrJvEzfohhmCz4a2Y/jWv0pz7rxnJGUiLjbbxIhJmuqRWoLl4nH3cwU
 93L+45RqNw0PF1BpVDlfJtVWLyTeFo3A85J27gSMLA4Al5/ESWv8ZcBbSTmhcf/tHjVV+Xm4nv4
 PefP851j7YfrXXCAwK4SM9AjqITumn8WylCHjx7gzvQ56FG2OrRhtGkP+8Yo3nXDcf5G5H9Kdd0
 PBEJWBa3bBOkzv3Mbafsl/+rB6wl4D3BPm/KPEc/OygFzPRWumB2YcCsd2bF3YwTDLbyQp6Qe/E
 86o/18hxiwt6IAA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce v4l2-isp.h in the Linux kernel uAPI.

The header includes types for generic ISP configuration parameters
and will be extended in the future with support for generic ISP statistics
formats.

Generic ISP parameters support is provided by introducing two new
types that represent an extensible and versioned buffer of ISP
configuration parameters.

The v4l2_params_buffer represents the container for the ISP
configuration data block. The generic type is defined with a 0-sized
data member that the ISP driver implementations shall properly size
according to their capabilities. The v4l2_params_block_header structure
represents the header to be prepend to each ISP configuration block.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS                         |   6 +++
 include/uapi/linux/media/v4l2-isp.h | 102 ++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..e9ac834d212f88222437e8d806800b2516d44f01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26853,6 +26853,12 @@ F:	drivers/media/i2c/vd55g1.c
 F:	drivers/media/i2c/vd56g3.c
 F:	drivers/media/i2c/vgxy61.c
 
+V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	include/uapi/linux/media/v4l2-isp.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
new file mode 100644
index 0000000000000000000000000000000000000000..779168f9058e3bcf6451f681e247d34d95676cc0
--- /dev/null
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Video4Linux2 generic ISP parameters and statistics support
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#ifndef _UAPI_V4L2_ISP_H_
+#define _UAPI_V4L2_ISP_H_
+
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+/**
+ * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
+ *
+ * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
+ *				(for compatibility)
+ * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
+ *
+ * V0 and V1 are identical in order to support drivers compatible with the V4L2
+ * ISP parameters format already upstreamed which use either 0 or 1 as their
+ * versioning identifier. Both V0 and V1 refers to the first version of the
+ * V4L2 ISP parameters format.
+ *
+ * Future revisions of the V4L2 ISP parameters format should start from the
+ * value of 2.
+ */
+enum v4l2_isp_params_version {
+	V4L2_ISP_PARAMS_VERSION_V0 = 0,
+	V4L2_ISP_PARAMS_VERSION_V1
+};
+
+#define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
+#define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
+
+/*
+ * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
+ *
+ * Driver-specific flags should be defined as:
+ * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+ * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
+ */
+#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+
+/**
+ * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
+ * @type: The parameters block type (driver-specific)
+ * @flags: A bitmask of block flags (driver-specific)
+ * @size: Size (in bytes) of the parameters block, including this header
+ *
+ * This structure represents the common part of all the ISP configuration
+ * blocks. Each parameters block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration data.
+ *
+ * The @type field is an ISP driver-specific value that identifies the block
+ * type. The @size field specifies the size of the parameters block.
+ *
+ * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
+ * driver-specific flags specified by the driver header.
+ */
+struct v4l2_isp_params_block_header {
+	__u16 type;
+	__u16 flags;
+	__u32 size;
+} __attribute__((aligned(8)));
+
+/**
+ * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
+ * @version: The parameters buffer version (driver-specific)
+ * @data_size: The configuration data effective size, excluding this header
+ * @data: The configuration data
+ *
+ * This structure contains the configuration parameters of the ISP algorithms,
+ * serialized by userspace into a data buffer. Each configuration parameter
+ * block is represented by a block-specific structure which contains a
+ * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
+ * populates the @data buffer with configuration parameters for the blocks that
+ * it intends to configure. As a consequence, the data buffer effective size
+ * changes according to the number of ISP blocks that userspace intends to
+ * configure and is set by userspace in the @data_size field.
+ *
+ * The parameters buffer is versioned by the @version field to allow modifying
+ * and extending its definition. Userspace shall populate the @version field to
+ * inform the driver about the version it intends to use. The driver will parse
+ * and handle the @data buffer according to the data layout specific to the
+ * indicated version and return an error if the desired version is not
+ * supported.
+ *
+ * For each ISP block that userspace wants to configure, a block-specific
+ * structure is appended to the @data buffer, one after the other without gaps
+ * in between. Userspace shall populate the @data_size field with the effective
+ * size, in bytes, of the @data buffer.
+ */
+struct v4l2_isp_params_buffer {
+	__u32 version;
+	__u32 data_size;
+	__u8 data[] __counted_by(data_size);
+};
+
+#endif /* _UAPI_V4L2_ISP_H_ */

-- 
2.51.0


