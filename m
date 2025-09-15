Return-Path: <linux-media+bounces-42584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24783B5834E
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8775C7B2A3C
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5AC2DFA2E;
	Mon, 15 Sep 2025 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HM/9r4vC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0D2DC328;
	Mon, 15 Sep 2025 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956727; cv=none; b=rdw353aARPMH2tXxlusp+YvAPAaSVexef6WOfsqemaidtv72HCTQVablftAPa1Z/ZqNqxjaKSY+aqHKRRMSSBG4wjXi0Bv5WNEmJCDnFbZ1Hcixl2cbbHekqS7EDxB6zvkV5fHDgrO13DGioZdie7YDyyi/t4cqZEn/b0ZW6iqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956727; c=relaxed/simple;
	bh=p5Km38yR3QQGPq5WsXlYQ0p2Qm9Mk6Ika0HPommr0nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZNSD2oNUotIHhIGnfB64COxLS0dQXFTLFtTi4Pz6tRK3zDGfTa6mIvYfuiXN0U1f6Rt+TLXnD8YFBZ0Wi1rYubVCuM3QlLELpUI6BP0vvLjOGepzPgd+5QraM1DQcCBYCcgQpwTb0DWVNXgZgneQbpZ0mIG9qAFeeCQbKZC92I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HM/9r4vC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 708631744;
	Mon, 15 Sep 2025 19:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956643;
	bh=p5Km38yR3QQGPq5WsXlYQ0p2Qm9Mk6Ika0HPommr0nQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HM/9r4vCeUBhtJnS18NnvOJQGmV8c+lJcTlCESNkxBAlUmUnFPQ9ssFYC4leg7zW4
	 7zfD/n6MiDax6u4wyT17a7vrEAEBkb+A3zoWR0sYE5bN8UGqjvwmf1wZXZ+v25Kihp
	 vcclg8EH9Wu5vs9QjW3Y8Mar/zH7l5Z1GtZEf8QE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:13 +0200
Subject: [PATCH v5 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-4-e6db94468af3@ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
In-Reply-To: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6487;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=p5Km38yR3QQGPq5WsXlYQ0p2Qm9Mk6Ika0HPommr0nQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEppXxDEFCLv0aWZE6O9yODYZ2ycvWVmRb8VL
 TUolpstblOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PNb0D/9uk7uJVDBrnmSF3Ttve6rmpYVaFssmwhF/0YixTEo5BGOMFsX/t6ZCEGPcUFd3R7m0KVz
 buQ9WwuUu11XtAxZVGsrpyJJpIcUuLrA7bq5hyYdIh4AcAVhwIaWEYrjhaN1GpkFcWaR3V7c8kP
 +VyTIOsS4XwvpxPbP27U0oUFheHBBtc0VeLZ1UShSS3Vx75auTawB+Af49RQzO7KtN4pZeAzg5R
 Lgt2swF03EE26g15eGgXaa89pwvx2qUuFiOQBAPH8o+Jm6fYg4J0TenureydJqVOqmoYQMDRI4j
 oL+DMEvlyv3Io20Iyi9Bb4i85fQtOnHh7TnyNDeF2zPVS4o1BOtu8dlGaycvN6nto9aQOi22S+t
 tQhEdUdjLKWjqKeEvLgnyPtuLVRW6RBkh1BsspY6MKPmfatS/PvC2J1vr8WksKA5+AJEpD3RIPl
 zRZW0p5vQcUyoB6JieEi/jyHHFtcRxcPFF5pZ7hMx1yM/aFPs4A5jrb1MLyw8aQc0mggAt6T3yg
 xS7UGf0x4XhzERQJtiQXBtSyd3Z7uxkYfbMqifX+XIsubbLrscFUOkS+61T01H3ZsnXFBOtunQ6
 M6FpIpCUQ+/MrfP6Wc6YUS/LUd/gXkX64PR5IC8fX1i+73LbBIyjnWyA40o4grHJx4IZ8c/uxxH
 QQoWBLpxzfoeiFg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add documentation for extensible parameters format to the V4L2
userspace API documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/extensible-parameters.rst            | 97 ++++++++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 MAINTAINERS                                        |  1 +
 3 files changed, 99 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/extensible-parameters.rst b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e95c84f90c1b472360306d97c9b27123cd4bb6af
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _extensible-parameters:
+
+*************************************
+V4L2 extensible ISP parameters format
+*************************************
+
+ISP configuration
+=================
+
+ISP configuration parameters are computed by userspace and programmed into a
+*parameters buffer* which is queued to the ISP driver on a per-frame basis. The
+layout of the *parameters buffer* generally reflects the ISP peripheral
+registers layout and is, for this reason, platform specific.
+
+The ISP configuration parameters are passed to the ISP driver through a metadata
+output video node, using the :c:type:`v4l2_meta_format` interface. Each ISP
+driver defines a metadata format that implements the configuration parameters
+layout.
+
+Metadata output formats that describe ISP configuration parameters are most of
+the time realized by implementing C structures that reflect the registers layout
+and gets populated by userspace before queueing the buffer to the ISP. Each
+C structure usually corresponds to one ISP *processing block*, with each block
+implementing one of the ISP supported features.
+
+The uAPI/ABI problem
+--------------------
+
+By upstreaming data types that describe the configuration parameters layout,
+driver developers make them part of the Linux kernel ABI. As it sometimes
+happens for most peripherals in Linux, ISP drivers development is often an
+iterative process, where sometimes not all the hardware features are supported
+in the first version that lands in the kernel, and some parts of the interface
+have to later be modified for bug-fixes or improvements.
+
+If any later bug-fix/improvement requires changes to the metadata output format,
+this is considered an ABI-breakage that is strictly forbidden by the Linux
+kernel policies. For this reason, each new iteration of an ISP driver support
+would require defining a new metadata output format, implying that drivers have
+to be made ready to handle several different configuration formats.
+
+Support for generic ISP parameters buffer has been designed with the goal of
+being:
+
+- Extensible: new features can be added later on without breaking the existing
+  interface
+- Versioned: different versions of the format can be defined without
+  breaking the existing interface
+
+The extensible parameters format
+================================
+
+Extensible configuration parameters formats are realized by a defining a single
+C structure that contains a few control parameters and a binary buffer where
+userspace programs a variable number of *ISP configuration blocks* data.
+
+The generic :c:type:`v4l2_params_buffer` defines a base type that each driver
+can use by properly sizing the data buffer array by providing a definition of
+maximum supported parameters buffer size.
+
+Each *ISP configuration block* is identified by an header and contains the
+parameters for that specific block.
+
+The generic :c:type:`v4l2_params_block_header` defines a base type that each
+driver can re-use as it is or extend appropriately.
+
+Userspace applications are responsible for correctly populating the parameters
+block header fields (type, flags and size) and the block-specific parameters.
+
+When userspace wants to configure and enable an ISP block it shall fully
+populate the block configuration and set the V4L2_PARAMS_FL_BLOCK_ENABLE
+bit in the flags field.
+
+When userspace simply wants to disable an ISP block the
+V4L2_PARAMS_FL_BLOCK_DISABLE bit should be set in flags field. The driver
+ignores the rest of the block configuration structure in this case.
+
+If a new configuration of an ISP block has to be applied, userspace shall fully
+populate the ISP block configuration and omit setting the
+V4L2_PARAMS_FL_BLOCK_ENABLE and V4L2_PARAMS_FL_BLOCK_DISABLE bits in
+the flags field.
+
+Setting both the V4L2_PARAMS_FL_BLOCK_ENABLE and V4L2_PARAMS_FL_BLOCK_DISABLE
+bits in the flags field is not allowed and not accepted.
+
+Any further development that happens after the ISP driver has been merged in
+Linux and which requires supporting new ISP features can be implemented by
+adding new blocks definition without invalidating the existing ones. Similarly,
+any change to the existing ISP configuration blocks can be handled by versioning
+them, again without invalidating the existing ones.
+
+V4L2 extensible parameters uAPI data types
+==========================================
+
+.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0de80328c36bf148051a19abe9e5241234ddfe5c..b900ed6af7bd9ad49baf7b5a9eef9423f8abfbcb 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
 .. toctree::
     :maxdepth: 1
 
+    extensible-parameters
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/MAINTAINERS b/MAINTAINERS
index e82c3d0758d6033fe8fcd56ffde2c03c4319fd11..abba872cb63f1430a49a2afbace4b9f9958c3991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER

-- 
2.51.0


