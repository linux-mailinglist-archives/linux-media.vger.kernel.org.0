Return-Path: <linux-media+bounces-43858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0BBC257F
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 670364F2857
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E772EA15D;
	Tue,  7 Oct 2025 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pv85tzUg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F61E2E9EB1;
	Tue,  7 Oct 2025 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860759; cv=none; b=rOCMX1gZ3scOUKzd5L7UMpIrss+d9nSMZUDTyWNLsCC9HQs3C1Z2MITZrI4QSWPmlV+x+nXfGWdvfDJzxHLLtP+UOeWKtdEVks59LK9bqjvplmXpTXU8O+Ugw/oYhxjBmp51C4zMx1RCbxwj1snTTiuXlWhLfXEhNIj240eoKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860759; c=relaxed/simple;
	bh=lzx6pD2axhUMQg7cawHwevY5H1fq1fXzh8aNOBiMlps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WC0ei5w0Ry9VtM9pcTQPuk/wW9aBBxxWq0Gki47o1VqPcgBNRsVzuyQetxMlS7JUNUE4V1zXUepfdKTjen6HMZdy2ddFf5WHZAVVIyyBdgXEub9OgIRgAc4F2ewANHMu4cv4Ck/6FZ1h9tBeeu9ueJ8lfoB8+aZX1lFIRvfHIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pv85tzUg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AADFD929;
	Tue,  7 Oct 2025 20:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860655;
	bh=lzx6pD2axhUMQg7cawHwevY5H1fq1fXzh8aNOBiMlps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pv85tzUgLiUKYzoNJY76MYAvevMA/8qfItZM2Y15K4epWCGINwO5uHMMEcrvIrqIn
	 KXl3J9TD/Ho3kd+FaYue8Fsd9tFDSYeBp3IW14I51l5yzHI88oKsErmlF44nFRXxWK
	 yO6ItSAzk+U655X0iZK7XDFw3Fd938ESLeDveiMs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:13 +0200
Subject: [PATCH v6 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-4-5f719d9f39e5@ideasonboard.com>
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7257;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=lzx6pD2axhUMQg7cawHwevY5H1fq1fXzh8aNOBiMlps=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgH3cSaK2EgTsBev7wXrnA6iFpYHHWtVRvp+
 onwYzR4mE2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBwAKCRByNAaPFqFW
 PAdzEADE4K7q7d3M7Q7v8FarH3ECKrjqqqHvDkzYMFfC74BbCusUKqGIakA1wM0i5jN8+prKeEN
 2eZr0oy1jprxk13kGcgKAknWgOOC06esuo3sQQ4xVVlzdXMqF3VG55an90IRwMy7a0r+On6P3KA
 ugR13laRhhhHKRru5TcIESh7sbYH/e0LNL1WpruoRm/rr20+6cNgxOa4Uv7jd/OuNNN7NJblXOj
 tMbho72LuFilae7kmdfPRjTZjb2IMkgAhrwDSU/atu6PaeMQhDQGY1bVB5cd/FKM06RgQJFndKh
 HZGazX5yma2E3MbEyS+OjRw2vSxQuDcucwi3n/i3ObYIZSN4SnHo/ww9OwemK7P92LnXM7DqLSY
 hzBSodLHgdtqTJyVrx01uf+dUqzZY7dSavVvxbK2qbEuZg7A922+7RyG2B3sdZKNRZAyP9Zt/iC
 NsGsTHiT7KbaWpunILM0qfcfQ4ntLtlFe+9p67wT/iPrwgTTvEpQhBiZTjtcw3d1iCnmTNhG8x5
 dOl5IFFN8B/r1KgogpHVKJk3PPZD5OSll1O03HJSQG3NWuYx3cBV0B/ot2Am7iaX264bp8uqS4i
 ne+IZcTELIRz2Q24ERzANh5UkQUjhNimzRlGq8fRG50Yr77WBhBPB5JAVBoMN0FsAYNUzXucx8i
 SWHB0vOjxOjnTsw==
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
index e82c3d0758d6033fe8fcd56ffde2c03c4319fd11..bbc92829c3c413de7d7ba77f182a6916728b1a8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER

-- 
2.51.0


