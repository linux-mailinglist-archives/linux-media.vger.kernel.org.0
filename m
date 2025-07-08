Return-Path: <linux-media+bounces-37087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7EFAFC8A8
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A874818C1
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22702DAFBB;
	Tue,  8 Jul 2025 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iyb/w8Ab"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861EB2DA768;
	Tue,  8 Jul 2025 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971277; cv=none; b=qvJSxduxuMz6NZ0/2OX5hk5CHAuUWcZBkCfsdi71m5U/sMyuI9+sNRZnih0ovNmRYCD9qMKSmDSmnb0zHBTzJL+IrWJwo47JHfMN6tx1H7l7PmDNleo3wTvIzI6KZeKyQQEbi0Aa5yPg8rJy/c8N6ITXLEiSpfC0F6hAyWzMV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971277; c=relaxed/simple;
	bh=4rqu3lKXSW/z1GKfzm8g/KZPUVyEVMcyGhy1+aiv3v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Omaq5I95ZDVVZeZm7RVbSKgAw9gzbJ1fQ2QUzD3pv56qo6WnDH6YkkDFcdAszjZ1WfUUM9FDAZ2wLvlrUtQXEQZPV7GHvmQXeqyLRrmweSDv6hVTM2A4ODsMr0k0wDf+8NukqHE3rsrpxHT6+yoj8r+AvOZi4kE/cBNIEcCLMXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iyb/w8Ab; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1373214B0;
	Tue,  8 Jul 2025 12:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971239;
	bh=4rqu3lKXSW/z1GKfzm8g/KZPUVyEVMcyGhy1+aiv3v8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iyb/w8AbiPdi0nwUEBnptdpKMDXGQnJco8eB6wL28h0xijseBrUJSGvlUKqvQJZk6
	 cMqQpydqoilhky+ICKu4JUdhIpHaU1O+ZRDCigZkgUJ3V3fXDWCYxJLuACE9/jgjH7
	 FfRSlwMexQ/Bqp5PxVHKPAyGVWSyD/UKrfgZxJQo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:48 +0200
Subject: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6273;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=4rqu3lKXSW/z1GKfzm8g/KZPUVyEVMcyGhy1+aiv3v8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXA0fKq+ElETn3DWuXQTzmQBxpkUSWsBLVjQ
 T+ynlSUnDKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PNHfD/9qd6BjrXX65+NS4vA4pUU0RV86NejPljM9gxLPbx0Wm5ctzZ77drMXGBlIPzfYFjt3Tk1
 c+0jnPgmaPX3IkdGfmk3n8MwhBOcGIX0a4EVFZoOp0m8uqpymaRkrLldMHQcSLTXVHlsnJQCv9a
 VK7xqW5KAqYZ8MiXjLfQ6M/iRNSkG96AkGBc7i5EMeygGncpHLALpgvSJW259/Di+LAK2twPrNc
 eQR7siA5IytYCk/+wByxExDzPA1jt5H8L7ZNrRRzlAePAsfMGOmsji8pWSdWsRwQY2xPtQbkSHj
 OAx0YiY0Vy95z2WsVwukGaR/cRg1j5mcVPq+zV01gZCiLV4CKnX32fT6SLd46YGlVfwlCKyFarM
 8Af7JgVC6egPiIUrjdihllT/mkcvpix5E3rA9vog41X4UWZhtwnWoG659L3DT02w0X2FMQb6s1/
 IBGj1DG+E/XEcv7M0jqx6lyQLH2y8qwRd+Buq6dzSrg/NGGd1SY0/3bF/gqM8LpUgdKe1EsYGn2
 PNoupq5DYgQGQ6GMn9hNjG9Ywj7FiTaQImie2S0wjSerNR+dAVlihwolqeaouwaIF4pjVPLHfo/
 vujbHcL6losWFZ6neuJqPXcnnzC4uDoKxrD/v1L0CFLV9xBbwlSLn2CT93mzxqXi/O24cNjC79t
 djmB60FD4+rvhaw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce v4l2-extensible-params.h in the Linux kernel uAPI.

The header defines two types that all drivers that use the extensible
parameters format for ISP configuration shall use to build their own
parameters format.

The newly introduce type v4l2_params_block represent the
header to be prepend to each ISP configuration block and the
v4l2_params_buffer type represent the base type for the configuration
parameters buffer.

The newly introduced header is not meant to be used directly by
applications which should instead use the platform-specific ones.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                                       |   6 ++
 include/uapi/linux/media/v4l2-extensible-params.h | 106 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
 F:	drivers/media/i2c/vd56g3.c
 F:	drivers/media/i2c/vgxy61.c
 
+V4L2 EXTENSIBLE PARAMETERS FORMAT
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	include/uapi/linux/media/v4l2-extensible-params.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9befde5c0dee601cfb
--- /dev/null
+++ b/include/uapi/linux/media/v4l2-extensible-params.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
+/*
+ * Video4Linux2 extensible configuration parameters base types
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+ */
+
+#ifndef _UAPI_V4L2_PARAMS_H_
+#define _UAPI_V4L2_PARAMS_H_
+
+#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
+/*
+ * Note: each ISP driver exposes a different uAPI, where the types layout
+ * match (more or less strictly) the hardware registers layout.
+ *
+ * This file defines the base types on which each ISP driver can implement its
+ * own types that define its uAPI.
+ *
+ * This file is not meant to be included directly by applications which shall
+ * instead only include the ISP-specific implementation.
+ */
+#error "This file should not be included directly by applications"
+#endif
+
+#include <linux/types.h>
+
+/**
+ * struct v4l2_params_block - V4L2 extensible parameters block header
+ *
+ * This structure represents the common part of all the ISP configuration
+ * blocks. Each parameters block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration data. The
+ * driver inspects this common header to discern the block type and its size and
+ * properly handle the block content by casting it to the correct block-specific
+ * type.
+ *
+ * The @type field is one of the values enumerated by each platform-specific ISP
+ * block types which specifies how the data should be interpreted by the driver.
+ * The @size field specifies the size of the parameters block and is used by the
+ * driver for validation purposes.
+ *
+ * The @flags field is a bitmask of platform-specific control flags.
+ *
+ * Userspace shall never use this type directly but use the platform specific
+ * one with the associated data types.
+ *
+ * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
+ * - Amlogic C3: :c:type:`c3_isp_params_block_type`
+ *
+ * @type: The parameters block type (platform-specific)
+ * @flags: A bitmask of block flags (platform-specific)
+ * @size: Size (in bytes) of the parameters block, including this header
+ */
+struct v4l2_params_block {
+	__u16 type;
+	__u16 flags;
+	__u32 size;
+} __attribute__((aligned(8)));
+
+/**
+ * struct v4l2_params_buffer - V4L2 extensible parameters configuration
+ *
+ * This struct contains the configuration parameters of the ISP algorithms,
+ * serialized by userspace into a data buffer. Each configuration parameter
+ * block is represented by a block-specific structure which contains a
+ * :c:type:`v4l2_params_block` entry as first member. Userspace populates
+ * the @data buffer with configuration parameters for the blocks that it intends
+ * to configure. As a consequence, the data buffer effective size changes
+ * according to the number of ISP blocks that userspace intends to configure and
+ * is set by userspace in the @data_size field.
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
+ * in between nor overlaps. Userspace shall populate the @data_size field with
+ * the effective size, in bytes, of the @data buffer.
+ *
+ * Each ISP driver using the extensible parameters format shall define a
+ * type which is type-convertible to this one, with the difference that the
+ * @data member shall actually a memory buffer of platform-specific size and
+ * not a pointer.
+ *
+ * Userspace shall never use this type directly but use the platform specific
+ * one with the associated data types.
+ *
+ * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
+ * - Amlogic C3: :c:type:`c3_isp_params_cfg`
+ *
+ * @version: The parameters buffer version (platform-specific)
+ * @data_size: The configuration data effective size, excluding this header
+ * @data: The configuration data
+ */
+struct v4l2_params_buffer {
+	__u32 version;
+	__u32 data_size;
+	__u8 data[];
+};
+
+#endif /* _UAPI_V4L2_PARAMS_H_ */

-- 
2.49.0


