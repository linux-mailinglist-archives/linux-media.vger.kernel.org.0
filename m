Return-Path: <linux-media+bounces-40294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCB2B2C7BE
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217591BC7D77
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58FF2820A0;
	Tue, 19 Aug 2025 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a1/cUmhC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C56281503;
	Tue, 19 Aug 2025 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615304; cv=none; b=eaKiu3mPO3vqKVtBR0clXquDNlpAnWgfVM0D9DMlXs2e6BfuEd2mmOrM1JK712B6oexu7LyyICe2BR8uYbk5mzieeOjWJgiqOrEFDW6wTQMk4y0AZ5mFYDVczOTU9pThJ+lKj0xjoIAAw498AgP6efvWzGc7quUOsZ5dEIff7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615304; c=relaxed/simple;
	bh=aym/MtJwNFxDBbjW3PypqoxF19bnG7z0x64ukaMHAqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1XgpXV6/sKuKmaEQtSDgVotWEIoXUntOjxfVXhTL64EW8snJIV1c3uCrN7+92Y39wljUsnWmDd+yazjGnPc8CRYk+74aPIbMMuKKYTgcM82SNNAxiB4VhkqirmD5mXgT7ytlEdRxZ6VqgJJR3/VIFGY3s0oHbh3wNu5tbVIobw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a1/cUmhC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3045F3008;
	Tue, 19 Aug 2025 16:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755615242;
	bh=aym/MtJwNFxDBbjW3PypqoxF19bnG7z0x64ukaMHAqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a1/cUmhCsx2E2UpaXdOopanyybkEyD3OnjmMtqrmxHYRwGcX84rXTvMZn4HQBJidV
	 ppQh60GslnL2sYK/jgttaTYB4l7BPgdoLQLYntGzBsVF9480KRkC1QyE+RCL/RilSu
	 ev73XtwP1A8/nRjj4mESpcLK36QBtsrI4SP5bxIM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 19 Aug 2025 16:54:45 +0200
Subject: [PATCH v3 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-extensible-parameters-validation-v3-4-9dc008348b30@ideasonboard.com>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
In-Reply-To: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5954;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=aym/MtJwNFxDBbjW3PypqoxF19bnG7z0x64ukaMHAqo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopJA75XlyPwtLgk4rj7RKxFlMq4i50NyL4UWfN
 uMar5i+H+OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKSQOwAKCRByNAaPFqFW
 PB65D/0Ufjf+cdMaGf2rKP0MKS9IihXbFbcpgKYGuVFjosg6pYYnmfMJq9heO7XBT2zwomLc2kq
 O3dsrjIXgBi9Ejy4m4rMv1zhEELBjNri/eFU1qcTGjTUXRCQ+SQyh/v3hTPDc/DAA1N+TlDtzPA
 846aPpnpRH79ychydDlZxPwom6ndDDxcWjbmbuEeuUSpp2Yn0YnI1HI/fAIH/+HABS/+J+n+zlz
 w/9Ld/z9G3tpfZhwT/MwTrljzrFJIO1K/uZAOtNPwQgIykRaKH36Fa9ziqs8gCHHtM44eU6EHTx
 VsXKve5ceSRZCDcDKLBnKQVpwwaxcYdcz24cnO7m6+4WANBCWtKMl6zBESGj9XMGW08RztzRUj+
 t7tpMffSODQL8EzQtYnA2hPOW/eEfdzdtS+0d9BPgh6x/LmTDxF3d2wfEa0GxV7fM3HKrOGnVJN
 pB+bvIoeqAS6wZBDCBnL0lIstzGLhn3RSSWF4faopw4qzJNZZrafNXstAD1cKjT5b4JTkvCpW66
 ckd9EKxEl5t/eEgbDHGMOzJ0kmbXiJchdyibdko1aPPywUk1+7ZUwfwDMWqBK4zy5WQGOHFQyHP
 HsJQtX3goAUrPXloG/SQjX4g3PaYZfRU5da98CmrONfrZ071kYWoF0oePRDoCxC318aVtSRpF7m
 VJETJoZjFD7z/ig==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add documentation for extensible parameters format to the V4L2
userspace API documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/extensible-parameters.rst            | 89 ++++++++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 MAINTAINERS                                        |  1 +
 3 files changed, 91 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/extensible-parameters.rst b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
new file mode 100644
index 0000000000000000000000000000000000000000..c4caa5c1df991d4dd91f986571db55135d15204a
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
+A new set of metadata output formats has then to be defined, with the design
+goals of being:
+
+- Extensible: new features can be added later on without breaking the existing
+  interface
+- Versioned: different versions of the format can be defined without
+  breaking the existing interface
+
+The extensible parameters format
+================================
+
+Extensible configuration formats are realized by a defining a single C structure
+that contains a few control parameters and a binary buffer where userspace
+programs a variable number of *ISP configuration blocks* data.
+
+The generic :c:type:`v4l2_params_buffer` defines a base type that each driver
+can use by properly sizing the data buffer array.
+
+Each *ISP configuration block* is identified by an header and contains the
+parameters for that specific block.
+
+The generic :c:type:`v4l2_params_block_header` defines a base type that each
+driver can re-use as it is or extend appropriately.
+
+Userspace applications program in the control buffer only the parameters of the
+ISP whose configuration has changed for the next frame. The ISP driver parses
+the configuration parameters and apply them to the hardware register.
+
+Any further development that happens after the ISP driver has been merged in
+Linux and which requires supporting new ISP features can be implemented by
+adding new blocks definition without invalidating the existing ones. Similarly,
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
index 67216d1e92d7ac81617bb3c4329e4096aa205706..91df04e5d9022ccf2aea4445247369a8b86a4264 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26384,6 +26384,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	include/uapi/linux/media/v4l2-extensible-params.h
 
 VF610 NAND DRIVER

-- 
2.50.1


