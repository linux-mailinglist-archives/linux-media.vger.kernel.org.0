Return-Path: <linux-media+bounces-37090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD3AFC8B0
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E3A7A58A7
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF542DC34D;
	Tue,  8 Jul 2025 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ilKdzPcm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D72DBF5C;
	Tue,  8 Jul 2025 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971283; cv=none; b=sWjc8r2X3eeb1CzRTpSFuubC7VwJRap4ZyCglHOKpl1JgkEAQED5e5Z6XZEjjRg1NzT8DY29oyc7v1YF0XKuQezoa6xT6nASeqjo8erWJc0888P/0E4uGp5oQthobPEwMnMWUDdH+xGCxdlUKJBVpaZF7yGrOsTAkJMGpStLQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971283; c=relaxed/simple;
	bh=R9qA7MNyVAfsHNo8l+6aisRM80FK3G5ZFSPJzZsHil4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6sZ3A56gHM2fBrNspX3lPYnJc+YfifNtN6E1Qii3nNRzXJ4nBTSMO+1jGb8R+Jn9/xNQRAl/u1EFdOvK10rEe+JMTBWq5I8SfvilGU6ftRuHWTYFBE6Ya7z+qt7QJkVUwyJ4KUUNlRJP9oD6OhwAdzxuoYeVz6HSzIixxohgK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ilKdzPcm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D31A2A6E;
	Tue,  8 Jul 2025 12:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971242;
	bh=R9qA7MNyVAfsHNo8l+6aisRM80FK3G5ZFSPJzZsHil4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilKdzPcmTmIYXwrIX6eiXQDtEKAv7UPq2wpU2iXfbPY22ioovVWN/pe8VUj/dIPNe
	 LFol441MfnOrP9c6OhNGr20IEhztp1GHRa3u2L69QHzBBPi0+3IcIhxv/ODuKGTP40
	 zTDLZyyVGsFa8z6eO/Wm3UrKq5uwP+c6ICqSkJVg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:51 +0200
Subject: [PATCH 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-4-9fc27c9c728c@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5898;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=R9qA7MNyVAfsHNo8l+6aisRM80FK3G5ZFSPJzZsHil4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXAinzzJaS2OSx2ymAzRAGd0xgVImUWJeK3w
 fR20Mi7/x6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PNzXEAChWjmh+edQ/l61iAp0yuf0mK6venOuMoyyilHNi+DtiQANVJqeGwue4dYevFQq89Cf6t/
 e7XEjkYAVncQFCIQJMpW0G2/a1FWfZy4PXI+UyXI27IGrbzOMJsuJH7L4IQcuDd8BL5t7Q/nBci
 BRiC67dVrSDKdGGVY9SHh0EX+6rFY5/wBi81KvUarku0TksfQSuiNUTwHQ1pf6Czzd6Fx8hLR20
 QJDiavfMNbrxHUrEJEJMIS8Z6xLMxs0zKAbPXktxS8/SHvQxpX7Nq6BELJ4DPOe+NNyAytXz1Re
 a9AEgwdKGYjvoNKJbWP6mLCEVvpijtBoBpPqNBG75WrT4d/AJVyWkyvI1xsGmEOGnOW7w7rxkM0
 6bKIbveGj63YRY9nGkTpC/niCQoG9ZjrGuSEeD0m+FKz0LXovjd5cIvu98jXKhCrvJ6XCmEN6XR
 OFI4N9fxTrnsFTlx75Pj4jcinFOi0LxVSyzJW3D6khl7ikgs3g6BY/4nimTYr3IxLUqLXSZtDf3
 +jKUMF9CNQ05NMAWxTi74C1n6DT3KXSqQeLsOIogkPES0RTAGYOtk0Er10CaFp1uQw0k8GDjLbp
 AkhwqvgIRO2VpT6Veyw8K1aVs7x8yBp4z6j/IgwYCmXjvMLCCW+lLpE9U0mxMah6s9VbIr1y9Nl
 VS5GHXJinAorLvw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add documentation for extensible parameters format to the V4L2
userspace API documentation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/extensible-parameters.rst            | 89 ++++++++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 MAINTAINERS                                        |  1 +
 3 files changed, 91 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/extensible-parameters.rst b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
new file mode 100644
index 0000000000000000000000000000000000000000..254d4087ae0448d3e545d8533c36d154967e202a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _extensible-parameters:
+
+**********************************
+ V4L2 extensible parameters format
+**********************************
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
+By defining a metadata output format that described the configuration parameters
+layout, driver developers make them part of the Linux kernel ABI. As it
+sometimes happens for most peripherals in Linux, ISP drivers development is
+often an iterative process, where sometimes not all the hardware features are
+supported in the very first driver version that lands in the kernel, and some
+parts of the interface have to later be modified for bug-fixes or improvements.
+
+If any later bug-fix/improvement requires changes to the metadata output format,
+this is considered an ABI-breakage that is strictly forbidden by the Linux
+kernel policies. For this reason, each new iteration of an ISP driver support
+would require defining a new metadata output format, implying drivers have to be
+made ready to handle several different formats.
+
+A new set of metadata output formats has then to be defined, with the design
+goals of being:
+
+- Extensible: new features can be added later on without breaking the existing
+  interface
+- Versioned: different versions of the interface can be defined without
+  breaking the existing interface
+
+The extensible parameters format
+================================
+
+Extensible configuration formats are realized by a defining a single C structure
+that contains a few control parameters and a binary buffer where userspace
+programs a variable number of *ISP block configuration* data.
+
+The generic :c:type:`v4l2_params_buffer` defines a base type that each driver
+shall extend with a type-convertible implementation
+
+Each *ISP block configuration* is identified by an header and contains the
+parameters for that specific block.
+
+The generic :c:type:`v4l2_params_block` defines a base type that each driver can
+re-use as it is or extend appropriately.
+
+Userspace applications program in the control buffer only the parameters of the
+ISP whose configuration has changed for the next frame. The ISP driver parses
+the configuration parameters and apply them to the hardware register.
+
+Any further development that happens after the ISP driver has been merged in
+Linux and which requires supporting new ISP features can be implemented by
+adding new block definitions without invalidating the existing ones. Similarly,
+any change to the existing ISP configuration blocks can be handled by versioning
+them, again without invalidating the existing ones.
+
+Implementations
+---------------
+
+ISP drivers that define an extensible parameters metadata output format:
+
+- :ref:`RkISP1 <v4l2-meta-fmt-rk-isp1-ext-params>`
+- :ref:`Amlogic C3 ISP <v4l2-meta-fmt-c3isp-params>`
+
+V4L2 extensible parameters uAPI data types
+==========================================
+
+.. kernel-doc:: include/uapi/linux/media/v4l2-extensible-params.h
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..58eb3c9c962bee008eee27d9c16678213c47baa9 100644
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
index 49a9329e5fe8874bdbaca13946ea28bd80134cb3..beecac86991d988c48d31366ba5201b09ef25715 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25972,6 +25972,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	include/uapi/linux/media/v4l2-extensible-params.h
 
 VF610 NAND DRIVER

-- 
2.49.0


