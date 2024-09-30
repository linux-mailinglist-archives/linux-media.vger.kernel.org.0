Return-Path: <linux-media+bounces-18874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938798A767
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 16:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC61AB2294D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6F21917F2;
	Mon, 30 Sep 2024 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3DRNoqA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992B23D2;
	Mon, 30 Sep 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707262; cv=none; b=n7Jp181dYvZOJFpReT79g8LYYvfVIEc0qbnJcWV7YStmllzQRmZbi7sfi90ZzWQCL6IqlK6VyNKIHylRvj3ga4IECSgPjwGtAKwd1XJucIKTcIRnhgQs0UjfOe1Tq/bCli4AJm76r7LHJj7DhGsCigHfDZxWbQGkberdHAh+TXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707262; c=relaxed/simple;
	bh=eCGxBwukXU9AhcTC9DwmQWbt9WtBgWUdKXNjfrH+vL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2QHYGwBod6snSqyU5+ZxU9D/v2esWsfuJo3xdMGXIr/wHKlTfQjbq837chylAlD7G+5mHhTl/x9RO5EzKOWb0wifyVK8TxBhUojcbkKi1meEA2KZa5fAYW8JtewYI7gEK8Oi//G/vWr9h9YfuNpTd+0whW6sEiJ69bJ2FtEMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3DRNoqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83B7C4CEC7;
	Mon, 30 Sep 2024 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727707262;
	bh=eCGxBwukXU9AhcTC9DwmQWbt9WtBgWUdKXNjfrH+vL8=;
	h=From:To:Cc:Subject:Date:From;
	b=G3DRNoqAU10hkSUeqgx9WMNsE16IiJWNWLDULU1gCPrzvi9Xunquflt3XbreOTZWZ
	 jDdke6JKVmd8+nHP8flpkFvyeX4m343alNN1SwjVzyr9lHEJtDjq2r19T5zFGJSWF0
	 PwgLVE5ayBEG4XvG1Ky0b1mlNAE48jIe8FJv9wqhNVFJsOj4YjK/CaYoNzHGtx5ZYy
	 5fO0HC0+Fw7c0P56wnxR5j5jXEWQduWOhAxghWZ+VY6asvFKr6P9y/xgUlvcjVBYrs
	 2o5Ks80hvqzwJBQw8IPsMox1vAhpRMGaElO+UJwMHw6BvOVB0Vchwl8eZ+58EaVZqX
	 jvLuMNVDqn8kQ==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
Date: Mon, 30 Sep 2024 16:40:57 +0200
Message-ID: <20240930144057.453751-1-mripard@kernel.org>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following a recent discussion at last Plumbers, John Stultz, Sumit
Sewal, TJ Mercier and I came to an agreement that we should document
what the dma-buf heaps names are expected to be, and what the buffers
attributes you'll get should be documented.

Let's create that doc to make sure those attributes and names are
guaranteed going forward.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

To: Jonathan Corbet <corbet@lwn.net>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: "T.J. Mercier" <tjmercier@google.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/userspace-api/dma-buf-heaps.rst | 71 +++++++++++++++++++
 Documentation/userspace-api/index.rst         |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
new file mode 100644
index 000000000000..00436227b542
--- /dev/null
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Allocating dma-buf using heaps
+==============================
+
+Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They are
+typically used to allocate buffers from a specific allocation pool, or to share
+buffers across frameworks.
+
+Heaps
+=====
+
+A heap represent a specific allocator. The Linux kernel currently supports the
+following heaps:
+
+ - The ``system`` heap allocates virtually contiguous, cacheable, buffers
+
+ - The ``reserved`` heap allocates physically contiguous, cacheable, buffers.
+   Depending on the platform, it might be called differently:
+
+    - Acer Iconia Tab A500: ``linux,cma``
+    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
+    - Amlogic A1: ``linux,cma``
+    - Amlogic G12A/G12B/SM1: ``linux,cma``
+    - Amlogic GXBB/GXL: ``linux,cma``
+    - ASUS EeePad Transformer TF101: ``linux,cma``
+    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cma``
+    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,cma``
+    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,cma``
+    - Asus Transformer Infinity TF700T: ``linux,cma``
+    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
+    - Asus Transformer Pad TF300T: ``linux,cma``
+    - Asus Transformer Pad TF701T: ``linux,cma``
+    - Asus Transformer Prime TF201: ``linux,cma``
+    - ASUS Vivobook S 15: ``linux,cma``
+    - Cadence KC705: ``linux,cma``
+    - Digi International ConnectCore 6UL: ``linux,cma``
+    - Freescale i.MX8DXL EVK: ``linux,cma``
+    - Freescale TQMa8Xx: ``linux,cma``
+    - Hisilicon Hikey: ``linux,cma``
+    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
+    - Lenovo ThinkPad X13s: ``linux,cma``
+    - Lenovo Yoga Slim 7x: ``linux,cma``
+    - LG Optimus 4X HD P880: ``linux,cma``
+    - LG Optimus Vu P895: ``linux,cma``
+    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
+    - Microsoft Romulus: ``linux,cma``
+    - NXP i.MX8ULP EVK: ``linux,cma``
+    - NXP i.MX93 9x9 QSB: ``linux,cma``
+    - NXP i.MX93 11X11 EVK: ``linux,cma``
+    - NXP i.MX93 14X14 EVK: ``linux,cma``
+    - NXP i.MX95 19X19 EVK: ``linux,cma``
+    - Ouya Game Console: ``linux,cma``
+    - Pegatron Chagall: ``linux,cma``
+    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
+    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
+    - Qualcomm SC8280XP CRD: ``linux,cma``
+    - Qualcomm X1E80100 CRD: ``linux,cma``
+    - Qualcomm X1E80100 QCP: ``linux,cma``
+    - RaspberryPi: ``linux,cma``
+    - Texas Instruments AM62x SK board family: ``linux,cma``
+    - Texas Instruments AM62A7 SK: ``linux,cma``
+    - Toradex Apalis iMX8: ``linux,cma``
+    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
+    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
+    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
+    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
+    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
+    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
+
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 274cc7546efc..4901ce7c6cb7 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -41,10 +41,11 @@ Devices and I/O
 
 .. toctree::
    :maxdepth: 1
 
    accelerators/ocxl
+   dma-buf-heaps
    dma-buf-alloc-exchange
    gpio/index
    iommufd
    media/index
    dcdbas
-- 
2.46.1


