Return-Path: <linux-media+bounces-37311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33AB00466
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4B81BC214A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3A8275854;
	Thu, 10 Jul 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CcqQwlUE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC83273D71;
	Thu, 10 Jul 2025 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155575; cv=none; b=Nf4pfLnzdf5NSmlcs9dIEhV25hOGgT05h8OiFiAPSfD6JhgdApDJVov0oCk6lCiEYTRcZPet0sDocqkGs7sc0PS1Gi7yxTPD1/NFp40WaFsK9GpCPVvxk3eMb7fYl7S9OzSBfWcxJSETRsQkitO/vrKWt1JYKQXcKC7V6vITY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155575; c=relaxed/simple;
	bh=d7XUyzRrxvNfwTKUjtwnr/8Wt0x2t8Ril2GgGGU8mJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4E31nka/YgBU9Q1fdv7+lk+lLuolEPy8wk5dagDbX3Obt+gNtZ+GW71TOdjwcZEyfXozkCC82IrV1BEEXgM3asvhD8a6k8zVrQnUgbubmFg4OSk5nCjsxqqtZM6Os6fOacUs/tCqmlhNprwwBX44pAjo6LtYPDjLkTpaVZU0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CcqQwlUE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD6CB18B1;
	Thu, 10 Jul 2025 15:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752155540;
	bh=d7XUyzRrxvNfwTKUjtwnr/8Wt0x2t8Ril2GgGGU8mJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CcqQwlUEe6jWWSpeU45Uhkqu6oaccb9HuJyBEYco57zfcxTiYZqrxzDhpff56M71S
	 5vd1ONVEYCXU6CSEbhfTji7YWVzp/HgFCKrtdi/r3AultxS18lmKUAJ+qzRPXX9ovL
	 fdbyM3AroIY+U4UMhfzPG6+rDW3nWqc6VTCZxErw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:52:13 +0200
Subject: [PATCH v2 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-extensible-parameters-validation-v2-4-7ec8918ec443@ideasonboard.com>
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
In-Reply-To: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5896;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=d7XUyzRrxvNfwTKUjtwnr/8Wt0x2t8Ril2GgGGU8mJ8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBob8WrJtzhnI9KuhM2zMwOVznfah4C5H9uVOLIi
 6GGYkzO7BiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaG/FqwAKCRByNAaPFqFW
 PLOLD/9eEwPG6bqp8h1SKlOJHHpFbql+4THTOxcezzMQmir5opbA7wz9Y/yTO4S4B8o/cbbSnNL
 kGgxFGG48Tt+JQRDV8bD6pg8OMsAErDUkNINi4r+zKftHBuivchfnLNyR0UUsahen27KY5+Ewce
 9Qbtxq7/yoZYG0GaptjAOppXN/HqaEWKetKJNxVZsrtzcLXbmOZNnwy8UdNJe2BQYxc5Lc3n3yK
 FKtDTZrHKa1xBxHjjbI3bMxCjGKtjs5OsWeQN5DPz02fKGfFn3+KqKk1Urj5/ceink6jpgQ1hqC
 popGVtHSCgu4Isgr2ky32JLuhZEBVleVWXSfbdh200FyJ1gPc7hmSvGSrizvp29k2aDzKEXXOxi
 lJJka3Kq8doqEmwm8e9zfbLl82cU8TBSyQ7jeV3NTdhcTDFEZvbN11eRj/F2MU9CCjrFz0ZVKU8
 +oELnfiX0SBoMAKRyjE+vqdoMEofitIVDGr7H08mKDifnvvEyFtqMAXLo5/k9jcgmuCBsRjCeqW
 fSsKRAmWVnEcUAgh/NPwGbkoS7Eq0uRLizku1+Co6zqGSYNuRWhMN1estM+lVbwTCQ6BAhx0bGl
 94wpERmcPYDvr3rV1W5ZwqmnAudLKvPTBpJgDbOw5yeJtlASeQYFBxBpvEDY46AfjNmIFLnJLCq
 Fs759qjFH+QrzVA==
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


