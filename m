Return-Path: <linux-media+bounces-44361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA9BD80F5
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0E6A1921CE1
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079B530F948;
	Tue, 14 Oct 2025 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FCyKFkxl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E030F926;
	Tue, 14 Oct 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428886; cv=none; b=KgRf1BRIxfQcTfL8bGDcBttUviaoIiV5ZboaPmsztOw/4jBDIDVEwQwNw1P7mJmxukiuII/mgNYxTkcOZRA6/fxYvJ3PtYHPtIbTWNxXmHoezANZhEsUlic8AbqoLHKGjGAqlXOP08okjHBUK9uFKlOQECjVNnQfdt48jhOg12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428886; c=relaxed/simple;
	bh=XF6muoDpgftcMNaVPGf+dJ0kUhnTFQpZE9vUqI8xmTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SV+V/harf940NDndc6jkMw5nFHAOBTL9ie05eFNRGA9vcouNdVktZBKDCbRriA12tBDzrD6D/KhZkfufuLAr0OuC24KQSZddmQCPX37rUZl0qr6KdcvbhQkk4Iu2ke1b56qCZZzLxHiHd2RcfiJMZ10UrzdIanWZTAFTv0xSKT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FCyKFkxl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFB13EAE;
	Tue, 14 Oct 2025 09:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428776;
	bh=XF6muoDpgftcMNaVPGf+dJ0kUhnTFQpZE9vUqI8xmTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FCyKFkxly/gxs47ZOdWPJSQ5hgTR+W80/u79ATriQoJM4247+3IV7vi6PVto/Tvoq
	 PAd1IzpKc8wS+EznRdbi30c/rPLl4J+gRL6TsfWtk1/tJcNnKKjqIqCHIs2mnukAAV
	 nsA4XCeBfJpSjE617ujSf1Tgux6dKxTkaocN7tIs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:00:56 +0200
Subject: [PATCH v7 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7257;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=XF6muoDpgftcMNaVPGf+dJ0kUhnTFQpZE9vUqI8xmTw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNGvtweY6kzNxleJHEu684WFSl2vUZCu7ygV
 nFpmrGNNoaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRgAKCRByNAaPFqFW
 PEUzD/9sCAs1ULlw3cNj1lmhEEh9OVkC5jKNU/iCyMUUV94KkvWBxfJqueBxYDqM4gSaCwDz3Qw
 /jD9Zwsks4LmOXBVKejuStgBlIcNVthue4APpf+9w4tfilK6Vm4UBzdydCd+IZNg2IoGdbRoNle
 NvdaPwRLe8B6IPIOTHqSkpk4dtTNhRHiSF9glq9O9614iTjNLhU5vz1c3duVq8CZQZ4l6vOMygr
 G7qqg/dMtDIjSlg2i+qNs9GYZAnN6Xurc+y4AKGzM+c6hpuU3os5KGEcgOtf7ViJmIuta7BWsmw
 rBAMyq8tt+LDjwADEZIl8/Pe72S6vF8uiqtCJ3XqFsF9ZINS5TquBFjd21yxBvfLhISO6MqSQae
 ppoqMBo12hg+5wGBJWi+Ic0N2NQUUU/3d9+xW5llJF4yvdSiuM9FNs6vOPn3JWLJeCkjIiA1Omz
 k7U3uBvF+IB004ERxeV1XH3HJRmWQfIIzkuOk22gHI2a+v2qYDRKg3IIDhGuI245sX+q2sa1Qz0
 lUwLlowDqBRN3FPj4cbjnvgZbVOnLwIrvb8cZN1rKppGnEKlE1kCTEJTh1cjqhpx7+tTkyh4OUW
 GOp6zgHAuK6SGZWo075oQ6JDJfXNXRX0rKAQnDhbup8DxUizjFDlnrfAaUjAigGKoDjGS217rFI
 OJDseE0CU/kdbng==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add userspace documentation for V4L2 ISP generic parameters and
statistics formats.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 121 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 123 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0de80328c36bf148051a19abe9e5241234ddfe5c..261483f8e4d832d3d0ce8aa11df4b4eb1645f22f 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -24,3 +24,4 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
+    v4l2-isp
diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..41078558ba5cc1faf922a9b9112e64c99ff37080
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -0,0 +1,121 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-isp:
+
+************************
+Generic V4L2 ISP formats
+************************
+
+ISP configuration and statistics: theory of operations
+======================================================
+
+ISP configuration parameters are computed by userspace and programmed into a
+*parameters buffer* which is queued to the ISP driver on a per-frame basis.
+
+ISP statistics are collected by the driver at a specific time point and drivers
+use them to populate a *statistics buffer* which is then returned to userspace.
+
+The parameters and statistics buffers are organized in a driver-specific
+way, and their data layout differs between one driver and another.
+
+ISP drivers generally exchange parameters and statistics with userspace through
+a metadata capture and output node respectively, implementing the
+:c:type:`v4l2_meta_format` interface. Each ISP driver defines a metadata capture
+and output format to be used on those video nodes, and the buffer layout and
+organization is fixed by the format definition.
+
+The uAPI/ABI problem
+--------------------
+
+By upstreaming the metadata formats that describe the parameters and statistics
+buffers layout, driver developers make them part of the Linux kernel ABI. As it
+sometimes happens for most peripherals in Linux, ISP drivers development is
+often an iterative process, where sometimes not all the hardware features are
+supported in the first version that lands in the kernel, and some parts of the
+interface have to later be modified for bug-fixes or improvements.
+
+If any later bug-fix/improvement requires changes to the metadata formats,
+this is considered an ABI-breakage that is strictly forbidden by the Linux
+kernel policies. For this reason, any change in the ISP parameters and
+statistics buffer layout would require defining a new metadata format.
+
+For these reasons Video4Linux2 has introduced support for generic ISP parameters
+and statistics data types, designed with the goal of being:
+
+- Extensible: new features can be added later on without breaking the existing
+  interface
+- Versioned: different versions of the format can be defined without
+  breaking the existing interface
+
+ISP configuration
+=================
+
+Before the introduction of generic formats
+------------------------------------------
+
+Metadata cature formats that describe ISP configuration parameters were most
+the time realized by defining C structures that reflect the ISP registers layout
+and gets populated by userspace before queueing the buffer to the ISP. Each
+C structure usually corresponds to one ISP *processing block*, with each block
+implementing one of the ISP supported features.
+
+The number of supported ISP blocks, the layout of their configuration data are
+fixed by the format definition, incurring the in the above described uAPI/uABI
+problems.
+
+Generic ISP parameters
+----------------------
+
+The generic ISP configuration parameters format is realized by a defining a
+single C structure that contains an header, followed by a binary buffer where
+userspace programs a variable number of ISP configuration data block, one for
+each supported ISP feature.
+
+The :c:type:`v4l2_isp_params_buffer` structure defines the parameters buffer
+header which is followed by a binary buffer of ISP configuration parameters.
+Userspace shall correctly populate the buffer header with the versioning
+information and with the size (in bytes) of the binary data buffer where it will
+store the ISP blocks configuration.
+
+Each *ISP configuration block* is preceded by an header implemented by the
+:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
+parameters for that specific block, defined by the ISP driver specific data
+types.
+
+Userspace applications are responsible for correctly populating each block's
+header fields (type, flags and size) and the block-specific parameters.
+
+ISP Block enabling, disabling and configuration
+-----------------------------------------------
+
+When userspace wants to configure and enable an ISP block it shall fully
+populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
+bit in the block header's `flags` field.
+
+When userspace simply wants to disable an ISP block the
+V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
+field. Drivers accept a configuration parameters block with no additional
+data after the header in this case.
+
+If the configuration of an already active ISP block has to be updated,
+userspace shall fully populate the ISP block parameters and omit setting the
+V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
+header's `flags` field.
+
+Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
+V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and not
+accepted.
+
+Any further extension to the parameters layout that happens after the ISP driver
+has been merged in Linux can be implemented by adding new blocks definition
+without invalidating the existing ones.
+
+ISP statistics
+==============
+
+Support for generic statistics format is not yet implemented in Video4Linux2.
+
+V4L2 ISP uAPI data types
+========================
+
+.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index e9ac834d212f88222437e8d806800b2516d44f01..340353334299cd5eebf1f72132b7e91b6f5fdbfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER

-- 
2.51.0


