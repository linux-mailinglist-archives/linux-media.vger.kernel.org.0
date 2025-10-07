Return-Path: <linux-media+bounces-43855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09290BC256D
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBDE4188F755
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FAB2E7BB4;
	Tue,  7 Oct 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IpYMUryx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F4521859A;
	Tue,  7 Oct 2025 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860752; cv=none; b=L/a7Fu08pqpbKfdm05Wy1vAY+/DfZKV8rnst8C2Ow/lYb5V8eoR8/36WgkjCYpDdPwd8kKi4pBnjhlSzhGNHSOuKmbmiL0qmuBXskYQhUY0yZ93K7NGV5ABcmPV1YtkE81tMIgw5olis09L5jXtqiwQuRMnj1waj7lGssfjwgyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860752; c=relaxed/simple;
	bh=LQ2X9ugosfqjzqJXgTJjdNawJro7eGQYKpCuJDqnl3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQOFo3HwHriDlpbrUNZg13wGb6BwG/wNDwufFKtIFDAujDyiOb1HIGvrA3e/oTQUDz48mGjSHeVJ2IUAIOPTVlEykYqGmaAFMyZYbKR9BU8p2xA8y4bCEa6tz1ZtwNZSFzzB7VQKfCSIBX9S6U2rzkpE2wTCYkCOx4L1rUdZO8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IpYMUryx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20B2C669;
	Tue,  7 Oct 2025 20:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860652;
	bh=LQ2X9ugosfqjzqJXgTJjdNawJro7eGQYKpCuJDqnl3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IpYMUryxdYAmQyX++xxaGaJooAuDNgJIWRDYvWiEON9PAa3MB6C99lEkIXR3WmdF9
	 WKTVJv6wRa+RJaScm+G2tYsdBX36Sn/Qzyz5+oj5hDuCI3eSiiTZF78ygPOzkFzXqX
	 DePSJjBSO/sES4ABJU0uEmmHjGoprIVZJR0vPFKM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:10 +0200
Subject: [PATCH v6 1/8] media: uapi: Introduce V4L2 generic ISP types
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-1-5f719d9f39e5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5520;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LQ2X9ugosfqjzqJXgTJjdNawJro7eGQYKpCuJDqnl3E=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgGrygJqfNGY1xYv5oRICWSDDOsg0DE3Drj5
 CiN4NWNk6SJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBgAKCRByNAaPFqFW
 PLD/D/4xjERbaUwksFLCcpjILoM50nEq+dQp+Padycu+U7HfkioBgSqOnBPOqJeuemvLtnO3zGR
 NDjsn2bic3I1E2VlVej44O6RhP3+4VibdHwbEWiA3dwjNGqE+EYhSGXVfYUdZQ87IdhIJvDxLw7
 F0Eq7QR/SAQ/HXdyeWuOT2hib+zfwiscaSfncuwPYVYMsAdTUY9eyXM8QS8LPkrpQsEllmJ/21a
 bw2Uygo/BVL5mWdQQjbtQSUDVzYdgHuSqcHWghwwu3ghiLl9YPdhL9XrViQ2SBaQvdp0ZkvKwGE
 eTtYTPCH32m6xtq/1J8Uye5045AWnsxHIr3VROeC5BMBpQrbGeQMmYYSZhwdnJAbv2hVCkXPiWs
 0F16V4foFP1EBbSFYvtzkyG0X65iTi6Mrc1G4l+JTPlFyrPfCmcBnBDpePDqKy+f43te7SePxGG
 +y/VQU/8vf+k+twvYphwXUOc6/JmU6a3gphqfq4KU9ee6RXIhcs23vO0WKE9Yzn6ynyAFx6b32q
 2GOk6DuH3YRckiRsuFXXhq+J0CA5BvEZEupJeDocwDN3nWlkqH1DByuYaBe1bhM5En22L1rp7+Y
 SLOTOWKsNMs32C2rlE3faOEBokqQxJKhvkfO/FjLir/pSa1D0lGUoR4aK0K8kf820XAFkjYOAJj
 LcyvATowMjKBCfA==
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
 MAINTAINERS                         |  6 +++
 include/uapi/linux/media/v4l2-isp.h | 82 +++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..e82c3d0758d6033fe8fcd56ffde2c03c4319fd11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26410,6 +26410,12 @@ F:	drivers/media/i2c/vd55g1.c
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
index 0000000000000000000000000000000000000000..809c950456b5048bd659db9d9f9349d87070d0f1
--- /dev/null
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -0,0 +1,82 @@
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
+#define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
+#define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
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


