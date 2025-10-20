Return-Path: <linux-media+bounces-45001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9AEBEFEC8
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B493B5A7E
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C352EBB93;
	Mon, 20 Oct 2025 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TwqVlWTd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36342ECD36;
	Mon, 20 Oct 2025 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948711; cv=none; b=Wt7PP5n5p/SuV7PPxVRu29EoQDUo5eI/JFaiux3FO1yZ6xPoErHKOWGMd4vXSt/27ZEiNacMNEerwFewiUhK5qC83nLU1Y3+IAna1YuK8S1oCcXbYgKfEt7z95kuMTlG/VYXvQ8nf7VvDShvgngUBQlPBgcgGtnVAVK4GXtnQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948711; c=relaxed/simple;
	bh=wpVWTqfmtcFpVy1LRpYeJajyDqC3wdOZWbgWcEU0KDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZELpTFZNUy24jYSo3lfctcUlFJ92xZMGNPMBwHsY4taWtCZ4Zg86ZS2Z7mfX55iHOccRpIhL4MJra6AQhZgQVHB1CscI+pnX0bYEnXgYUlYPl7SKWFHGCfWO5XG2A0NV00KiTqvR2+foDBmDVn4AYYtCrE4/ES85cZ3JfVvoQA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TwqVlWTd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FB751E34;
	Mon, 20 Oct 2025 10:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760948599;
	bh=wpVWTqfmtcFpVy1LRpYeJajyDqC3wdOZWbgWcEU0KDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TwqVlWTdHoshBZD9W8pzPO1mrQFW21X2+ioWivRgZtJPk62pQceDVNJNCrMqNPUVd
	 yJ8gV69BPV52E4QFldpidoj+MtK20sgqMBeFzB+qZ2JK5I4rrdGLXHkE/cZt6Et+2N
	 O9q6L9nkeCtQNmF78j2Is5f9Tno139+bJ4MC78i4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 20 Oct 2025 10:24:50 +0200
Subject: [PATCH v8 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-extensible-parameters-validation-v8-4-afba4ba7b42d@ideasonboard.com>
References: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
In-Reply-To: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7302;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=wpVWTqfmtcFpVy1LRpYeJajyDqC3wdOZWbgWcEU0KDA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo9fHYU9bN8VJN3Ly7EKmk5tIyqxZy6tFRby+c5
 TnoEFSVbQqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaPXx2AAKCRByNAaPFqFW
 PA01D/0Z9EA5x4y79Y/lBL0Q2pzpINm9Wi+yeTnFoMBhBU5Hn+KNaAvKMMViYKeOOTM2v/Mccdt
 aNuLx/AwUHC6IAsKBNbbhTM3CG9KmY/nCX3yvH9JeEtIBiCL4NnKY6q7MjrqLxuptID1nb5MGJy
 JBE9+oRaZxPW3tay5PUX+2uBMWwAnmEAqQE73Mz0x2gBCuibsr5OdMwSbCKlGg7r1F2pLuofFuk
 +hXPUcNnkxcqru8D0CghQ6Gtg2tejuMuUfGjtpOQnDDAAHMPHtRx8CJv2C0oK9g8cb58+TLNbqH
 2wg3RKN2glpgKb6fAGC9LTiqVhF6RLbea7PF8WIxvREZ1WB2Rgu1AsZgDhT9uo0QDZ0yGqakx3M
 H+TLS8UxbOT67zVqno4mfRC2xuAmrOMFroRpPLC9qdmFDQpbGbQBgEPkYmSG1N7ebDfIjt85sjr
 BoMiNLkg/3aNcSbNZ6XmuFISEE5rncGW93VElF06GSJozP6LN0YCbZTGwGoLdycXwB8HlpXIZ2U
 w7F/P7CKL43FbTpu9h3ZWhjyOAfMHOFZ8k+DlDx0PCc5ml0LPlquRDy7SAaEW1kLlKqVXsPbHFG
 r/HkkdCko4jLanVW1D+latdiaKinYmkP8ReQjfVDsIstzC+ZpZWja3M8SZ0lSTpQ7U0E83fAysB
 F0pzhEH3x7nn12Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add userspace documentation for V4L2 ISP generic parameters and
statistics formats.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 122 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index d9868ee88a0717c1acaa4ee477eaed96a6411f73..7b758ea9eb4ac3c4b354bf8e2f319985ed9e2b37 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -25,3 +25,4 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
+    v4l2-isp
diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..b53df722ed29117c3827314e844fc4de61343f40
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -0,0 +1,120 @@
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
+ISP statistics are collected at a specific time point and drivers use them to
+populate a *statistics buffer* which is then returned to userspace.
+
+The parameters and statistics buffers are organized in a driver-specific
+way, and their data layout differs between one driver and another.
+
+ISP drivers generally exchange parameters and statistics with userspace through
+a metadata output and capture node respectively, implementing the
+:c:type:`v4l2_meta_format` interface. Each ISP driver defines one metadata
+capture format and one metadata output format to be used on those video nodes,
+and the buffer content layout and organization is fixed by the format definition.
+
+The uAPI/ABI problem
+--------------------
+
+By upstreaming the metadata formats that describe the parameters and statistics
+buffers layout, driver developers make them part of the Linux kernel ABI. As for
+most peripherals, ISP driver development in Linux is often an iterative process,
+in which not all of the hardware features are supported in the first version.
+
+The support for new features and/or bug fixes may land in the kernel at a later
+stage and require changes to the metadata formats definition. This is
+considered an ABI breakage that is strictly forbidden by the Linux kernel
+policies. For this reason, any change in the ISP parameters and statistics
+buffer layout would require defining a new metadata format.
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
+Metadata output formats that describe ISP configuration parameters were
+typically realized by defining C structures that reflect the ISP registers
+layout and get populated by userspace before queueing the buffer to the ISP.
+Each C structure usually corresponds to one ISP *processing block*, with each
+block implementing one of the ISP supported features.
+
+The number of supported ISP blocks, the layout of their configuration data are
+fixed by the format definition, incurring in the above described uAPI/uABI
+problem.
+
+Generic ISP parameters
+----------------------
+
+The generic ISP configuration parameters format is realized by a defining a
+single C structure that contains a header, followed by a binary buffer where
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
index d925745077f21e5a1388a30217a24beeb4fff3b5..f52237d57710cadff78b297d2b4610b508f55092 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26856,6 +26856,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER

-- 
2.51.0


