Return-Path: <linux-media+bounces-34042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C158ACD8FB
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 576E87A890D
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E75239E95;
	Wed,  4 Jun 2025 07:57:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F924290D;
	Wed,  4 Jun 2025 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023857; cv=none; b=MYCRWZh6xuUJJV95aNn2v0QKIoEqrxq9rJ7hnbHse+vrETJYny4+VWRV7Thzy4qySD9KO2bQ+Qf8XBwEtP1HSpGXkkgMClKRCMO3gq2UFlYQdWUOQ4k4sjFNoa+b7mpQ6r6+VC8T0TsW9NU5Yj/6+3vzHaSKkrkJQlgqJgSAbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023857; c=relaxed/simple;
	bh=s6iRHVi52nJIFEpjOBnUjKUAFYw3SHtOxNcElb4R994=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e4FKVz6jKShpi20GKIBUGbHh69S2pq/sIaGAGkwWmWqoSKJ405ZofJIm7vO+B/9pN5kzmTJtQgYHvVKa6UG+ozYe1gRXH246DhoUm4g+ydp8yn2rmtuBlJf9pQGVvI0Wi6wWSw38l7IMEJ5HKPWlwkTTJEUk2vpWyvrtrctsRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso11813152a12.0;
        Wed, 04 Jun 2025 00:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023852; x=1749628652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXnfNSFEQQZHfEmq+WbkvmMf5v5jwPgxJu5RLHdqklc=;
        b=QoYZX3fwMCx5MBW2kCVYwcPA0a83qqFpc4GCaunhX14tAwS2erDaCWS2+d9GP6bxKQ
         WSSxudhHLxDTxz9ZvLaKLYfUSVDuYhsWBUD4DlX0HQLyKZ/YQzYOnRlr6RxKYTyusWLq
         ZpqviVgHuoHpAMdzy94BysHs+GYBJ5ABYFfHcx95Knp2ILl2cG4UEAV+iijO1gHTpwDP
         BRrsojr6+tj6sUxeo+J5VNtUdDF1zPyyvRAy7mjqAp3L0PkYYnL4uJcMR3EujXT1re56
         IPkRUYzZD5uOz0Yw4cJBvhpVmJgOmeEMKsnyX/lqD+BSDi6ZaFhr64NH1zHfNpKtv+MZ
         9MHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxKbzwZdla7S+mY5FQUD0+zLYagNWvAZYk/H+QzHAs1OxO/KJXmMbeWTH68aQARlkxGFUpYfOUt4U=@vger.kernel.org, AJvYcCXXP18H1t/yfyNlJsIaL2iW/bY3wJJyk0N3ZsKZzD/ZECRBp5466c9L06wTpsucIuN8TQPNbAiPlAJXpdA=@vger.kernel.org, AJvYcCXof5KiHnqjU1KJD/88EOuEIdKs/pb3NV4VrLmNnzrAeTDF/R68i+TyeAxDwZNP33soyAoa7i8qH3yyyTND@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxSq7BE+YyXHQPSs4adXUXtbJxYS6k5iH0YgmLzM5l7Fhv410
	NGAScWdMqp28XL4njiU0r+IRtGc8EO4Htz4U6LFvzDWlX4Z8yAloGanA
X-Gm-Gg: ASbGncusAj9cQpE/CJdzbthQ2RpRO3z4m5lYa4Nestryb7NF82FZSOB/KnIvv4pPU1e
	0egLGm9ddDxDH3yMdJE6npZaspSHY/g4s5F5VzewlzAuwPmaTsT85NQc3dLoTwAJbB15vNj/ym+
	YwnVHjyv3nFW0XhTk4myC13pEurmmbqnTBl2sv+XCv6z60wCbaVYZ3lxAe6o4isi0P31Y5Pz5Y6
	+v1jvhIjxoDyO/7xYX7Fu3FaA4APs3vwYXEYh38iA7x7/4jtQe2uer3JiCil3jGc0pPxeOU9jYh
	UkXBBh3zSh3NC8fwpb1USA8R3Q03uzy76ko2OZS33sEHqJsXPL8juXO3BnkOyMu074So3XBW02h
	ugBFTeFH4A5Hua5PbMdAN
X-Google-Smtp-Source: AGHT+IH7MaPldw8ETg49AyyXtnO1NIEBB7KhRQxEjuVPj8EaVSimQHYFPD2tgoKHc3MwZSDHcfD7MQ==
X-Received: by 2002:a05:6402:1d4b:b0:606:22fb:71ec with SMTP id 4fb4d7f45d1cf-606ea3b00a5mr1962132a12.19.1749023851857;
        Wed, 04 Jun 2025 00:57:31 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:31 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:18 +0200
Subject: [PATCH v6 05/10] accel/rocket: Add a new driver for Rockchip's NPU
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-5-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This initial version supports the NPU as shipped in the RK3588 SoC and
described in the first part of its TRM, in Chapter 36.

This NPU contains 3 independent cores that the driver can submit jobs
to.

This commit adds just hardware initialization and power management.

v2:
- Split cores and IOMMUs as independent devices (Sebastian Reichel)
- Add some documentation (Jeffrey Hugo)
- Be more explicit in the Kconfig documentation (Jeffrey Hugo)
- Remove resets, as these haven't been found useful so far (Zenghui Yu)
- Repack structs (Jeffrey Hugo)
- Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
- Use devm_drm_dev_alloc (Jeffrey Hugo)
- Use probe log helper (Jeffrey Hugo)
- Introduce UABI header in a later patch (Jeffrey Hugo)

v3:
- Adapt to a split of the register block in the DT bindings (Nicolas
  Frattaroli)
- Move registers header to its own commit (Thomas Zimmermann)
- Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
- Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
- PM improvements (Nicolas Frattaroli)

v4:
- Use bulk clk API (Krzysztof Kozlowski)

v6:
- Remove mention to NVDLA, as the hardware is only incidentally related
  (Kever Yang)
- Use calloc instead of GFP_ZERO (Jeff Hugo)
- Explicitly include linux/container_of.h (Jeff Hugo)
- pclk and npu clocks are now needed by all cores (Rob Herring)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 Documentation/accel/index.rst        |   1 +
 Documentation/accel/rocket/index.rst |  19 +++
 MAINTAINERS                          |  10 ++
 drivers/accel/Kconfig                |   1 +
 drivers/accel/Makefile               |   1 +
 drivers/accel/rocket/Kconfig         |  25 ++++
 drivers/accel/rocket/Makefile        |   8 +
 drivers/accel/rocket/rocket_core.c   |  70 +++++++++
 drivers/accel/rocket/rocket_core.h   |  45 ++++++
 drivers/accel/rocket/rocket_device.c |  25 ++++
 drivers/accel/rocket/rocket_device.h |  26 ++++
 drivers/accel/rocket/rocket_drv.c    | 278 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_drv.h    |  13 ++
 13 files changed, 522 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index bc85f26533d88891dde482f91e26c99991b22869..d8fa332d60a890dbb617454d2a26d9b6f9b196aa 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,6 +10,7 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   rocket/index
 
 .. only::  subproject and html
 
diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
new file mode 100644
index 0000000000000000000000000000000000000000..300eb3aeab1d8c6514c65af4d216b2d5a1669131
--- /dev/null
+++ b/Documentation/accel/rocket/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================
+ accel/rocket Rockchip NPU driver
+=====================================
+
+The accel/rocket driver supports the Neural Processing Units (NPUs) inside some
+Rockchip SoCs such as the RK3588. Rockchip calls it RKNN and sometimes RKNPU.
+
+The hardware is described in chapter 36 in the RK3588 TRM.
+
+This driver just powers the hardware on and off, allocates and maps buffers to
+the device and submits jobs to the frontend unit. Everything else is done in
+userspace, as a Gallium driver (also called rocket) that is part of the Mesa3D
+project.
+
+Hardware currently supported:
+
+* RK3588
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..2d8833bf1f2db06ca624d703f19066adab2f9fde 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7263,6 +7263,16 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/ivpu/
 F:	include/uapi/drm/ivpu_accel.h
 
+DRM ACCEL DRIVER FOR ROCKCHIP NPU
+M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/rocket/
+F:	Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
+F:	drivers/accel/rocket/
+F:	include/uapi/drm/rocket_accel.h
+
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 5b9490367a39fd12d35a8d9021768aa186c09308..bb01cebc42bf16ebf02e938040f339ff94869e33 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4c515430175c5e2ba9190f6dc9158..ffc3fa58866616d933184a7659573cd4d4780a8d 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..9a59c6c61bf4d6460d8008b16331f001c97de67d
--- /dev/null
+++ b/drivers/accel/rocket/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_ROCKET
+       tristate "Rocket (support for Rockchip NPUs)"
+       depends on DRM
+       depends on ARM64 || COMPILE_TEST
+       depends on MMU
+       select DRM_SCHED
+       select IOMMU_SUPPORT
+       select IOMMU_IO_PGTABLE_LPAE
+       select DRM_GEM_SHMEM_HELPER
+       help
+	  Choose this option if you have a Rockchip SoC that contains a
+	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
+	  Rockchip either RKNN or RKNPU, it accelerates inference of neural
+	  networks.
+
+	  The interface exposed to userspace is described in
+	  include/uapi/drm/rocket_accel.h and is used by the Rocket userspace
+	  driver in Mesa3D.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rocket.
diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96
--- /dev/null
+++ b/drivers/accel/rocket/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
+
+rocket-y := \
+	rocket_core.o \
+	rocket_device.o \
+	rocket_drv.o
diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
new file mode 100644
index 0000000000000000000000000000000000000000..3a6f25f2b4103075102739588bcdad96510e2a4e
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <linux/clk.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_core.h"
+
+int rocket_core_init(struct rocket_core *core)
+{
+	struct device *dev = core->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	u32 version;
+	int err = 0;
+
+	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
+	if (err)
+		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
+
+	core->pc_iomem = devm_platform_ioremap_resource_byname(pdev, "pc");
+	if (IS_ERR(core->pc_iomem)) {
+		dev_err(dev, "couldn't find PC registers %ld\n", PTR_ERR(core->pc_iomem));
+		return PTR_ERR(core->pc_iomem);
+	}
+
+	core->cna_iomem = devm_platform_ioremap_resource_byname(pdev, "cna");
+	if (IS_ERR(core->cna_iomem)) {
+		dev_err(dev, "couldn't find CNA registers %ld\n", PTR_ERR(core->cna_iomem));
+		return PTR_ERR(core->cna_iomem);
+	}
+
+	core->core_iomem = devm_platform_ioremap_resource_byname(pdev, "core");
+	if (IS_ERR(core->core_iomem)) {
+		dev_err(dev, "couldn't find CORE registers %ld\n", PTR_ERR(core->core_iomem));
+		return PTR_ERR(core->core_iomem);
+	}
+
+	pm_runtime_use_autosuspend(dev);
+
+	/*
+	 * As this NPU will be most often used as part of a media pipeline that
+	 * ends presenting in a display, choose 50 ms (~3 frames at 60Hz) as an
+	 * autosuspend delay as that will keep the device powered up while the
+	 * pipeline is running.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 50);
+
+	pm_runtime_enable(dev);
+
+	err = pm_runtime_get_sync(dev);
+
+	version = rocket_pc_readl(core, VERSION);
+	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
+
+	return 0;
+}
+
+void rocket_core_fini(struct rocket_core *core)
+{
+	pm_runtime_dont_use_autosuspend(core->dev);
+	pm_runtime_disable(core->dev);
+}
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
new file mode 100644
index 0000000000000000000000000000000000000000..1b1beb9798f03ec2ca325496a4d894674d0b798d
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_CORE_H__
+#define __ROCKET_CORE_H__
+
+#include <drm/gpu_scheduler.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mutex_types.h>
+
+#include "rocket_registers.h"
+
+#define rocket_pc_readl(core, reg) \
+	readl((core)->pc_iomem + (REG_PC_##reg))
+#define rocket_pc_writel(core, reg, value) \
+	writel(value, (core)->pc_iomem + (REG_PC_##reg))
+
+#define rocket_cna_readl(core, reg) \
+	readl((core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
+#define rocket_cna_writel(core, reg, value) \
+	writel(value, (core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
+
+#define rocket_core_readl(core, reg) \
+	readl((core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
+#define rocket_core_writel(core, reg, value) \
+	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
+
+struct rocket_core {
+	struct device *dev;
+	struct rocket_device *rdev;
+	struct device_link *link;
+	unsigned int index;
+
+	int irq;
+	void __iomem *pc_iomem;
+	void __iomem *cna_iomem;
+	void __iomem *core_iomem;
+	struct clk_bulk_data clks[4];
+};
+
+int rocket_core_init(struct rocket_core *core);
+void rocket_core_fini(struct rocket_core *core);
+
+#endif
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
new file mode 100644
index 0000000000000000000000000000000000000000..a05c103e117e3eaa6439884b7acb6e3483296edb
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/dev_printk.h>
+
+#include "rocket_device.h"
+
+int rocket_device_init(struct rocket_device *rdev)
+{
+	int err;
+
+	/* Initialize core 0 (top) */
+	err = rocket_core_init(&rdev->cores[0]);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void rocket_device_fini(struct rocket_device *rdev)
+{
+	rocket_core_fini(&rdev->cores[0]);
+}
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
new file mode 100644
index 0000000000000000000000000000000000000000..b5d5f1479d56e2fde59bbcad9de2b58cef9a9a4d
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DEVICE_H__
+#define __ROCKET_DEVICE_H__
+
+#include <drm/drm_device.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+
+#include "rocket_core.h"
+
+struct rocket_device {
+	struct drm_device ddev;
+
+	struct rocket_core *cores;
+	unsigned int num_cores;
+};
+
+int rocket_device_init(struct rocket_device *rdev);
+void rocket_device_fini(struct rocket_device *rdev);
+
+#define to_rocket_device(drm_dev) \
+	((struct rocket_device *)container_of(drm_dev, struct rocket_device, ddev))
+
+#endif
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
new file mode 100644
index 0000000000000000000000000000000000000000..f1996ef1ed3e9c99e968add7b4ee983a8139295d
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include "linux/device/devres.h"
+#include "linux/gfp_types.h"
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_of.h>
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_drv.h"
+
+static int
+rocket_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct rocket_file_priv *rocket_priv;
+
+	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
+	if (!rocket_priv)
+		return -ENOMEM;
+
+	rocket_priv->rdev = rdev;
+	file->driver_priv = rocket_priv;
+
+	return 0;
+}
+
+static void
+rocket_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	kfree(rocket_priv);
+}
+
+static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
+#define ROCKET_IOCTL(n, func) \
+	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+};
+
+DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+
+/*
+ * Rocket driver version:
+ * - 1.0 - initial interface
+ */
+static const struct drm_driver rocket_drm_driver = {
+	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.open			= rocket_open,
+	.postclose		= rocket_postclose,
+	.ioctls			= rocket_drm_driver_ioctls,
+	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
+	.fops			= &rocket_accel_driver_fops,
+	.name			= "rocket",
+	.desc			= "rocket DRM",
+};
+
+static int rocket_drm_bind(struct device *dev)
+{
+	struct device_node *core_node;
+	struct rocket_device *rdev;
+	struct drm_device *ddev;
+	unsigned int num_cores = 1;
+	int err;
+
+	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
+	if (IS_ERR(rdev))
+		return PTR_ERR(rdev);
+
+	ddev = &rdev->ddev;
+	dev_set_drvdata(dev, rdev);
+
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
+		if (of_device_is_available(core_node))
+			num_cores++;
+
+	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
+	if (IS_ERR(rdev->cores))
+		return PTR_ERR(rdev->cores);
+
+	/* Add core 0, any other cores will be added later when they are bound */
+	rdev->cores[0].rdev = rdev;
+	rdev->cores[0].dev = dev;
+	rdev->cores[0].index = 0;
+	rdev->num_cores = 1;
+
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	if (err)
+		return err;
+
+	err = rocket_device_init(rdev);
+	if (err) {
+		dev_err_probe(dev, err, "Fatal error during NPU init\n");
+		goto err_device_fini;
+	}
+
+	err = component_bind_all(dev, rdev);
+	if (err)
+		goto err_device_fini;
+
+	err = drm_dev_register(ddev, 0);
+	if (err < 0)
+		goto err_unbind;
+
+	return 0;
+
+err_unbind:
+	component_unbind_all(dev, rdev);
+err_device_fini:
+	rocket_device_fini(rdev);
+	return err;
+}
+
+static void rocket_drm_unbind(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	struct drm_device *ddev = &rdev->ddev;
+
+	drm_dev_unregister(ddev);
+
+	component_unbind_all(dev, rdev);
+
+	rocket_device_fini(rdev);
+}
+
+const struct component_master_ops rocket_drm_ops = {
+	.bind = rocket_drm_bind,
+	.unbind = rocket_drm_unbind,
+};
+
+static int rocket_core_bind(struct device *dev, struct device *master, void *data)
+{
+	struct rocket_device *rdev = data;
+	unsigned int core = rdev->num_cores;
+	int err;
+
+	dev_set_drvdata(dev, rdev);
+
+	rdev->cores[core].rdev = rdev;
+	rdev->cores[core].dev = dev;
+	rdev->cores[core].index = core;
+	rdev->cores[core].link = device_link_add(dev, rdev->cores[0].dev,
+						 DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+
+	rdev->num_cores++;
+
+	err = rocket_core_init(&rdev->cores[core]);
+	if (err) {
+		rocket_device_fini(rdev);
+		return err;
+	}
+
+	return 0;
+}
+
+static void rocket_core_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct rocket_device *rdev = data;
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		if (rdev->cores[core].dev == dev) {
+			rocket_core_fini(&rdev->cores[core]);
+			device_link_del(rdev->cores[core].link);
+			break;
+		}
+	}
+}
+
+const struct component_ops rocket_core_ops = {
+	.bind = rocket_core_bind,
+	.unbind = rocket_core_unbind,
+};
+
+static int rocket_probe(struct platform_device *pdev)
+{
+	struct component_match *match = NULL;
+	struct device_node *core_node;
+
+	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
+		return component_add(&pdev->dev, &rocket_core_ops);
+
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core") {
+		if (!of_device_is_available(core_node))
+			continue;
+
+		drm_of_component_match_add(&pdev->dev, &match,
+					   component_compare_of, core_node);
+	}
+
+	return component_master_add_with_match(&pdev->dev, &rocket_drm_ops, match);
+}
+
+static void rocket_remove(struct platform_device *pdev)
+{
+	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core-top"))
+		component_master_del(&pdev->dev, &rocket_drm_ops);
+	else if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
+		component_del(&pdev->dev, &rocket_core_ops);
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "rockchip,rk3588-rknn-core-top" },
+	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static int find_core_for_dev(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+
+	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+		if (dev == rdev->cores[core].dev)
+			return core;
+	}
+
+	return -1;
+}
+
+static int rocket_device_runtime_resume(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core = find_core_for_dev(dev);
+	int err = 0;
+
+	if (core < 0)
+		return -ENODEV;
+
+	err = clk_bulk_prepare_enable(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+	if (err) {
+		dev_err(dev, "failed to enable (%d) clocks for core %d\n", err, core);
+		return err;
+	}
+
+	return 0;
+}
+
+static int rocket_device_runtime_suspend(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core = find_core_for_dev(dev);
+
+	if (core < 0)
+		return -ENODEV;
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+
+	return 0;
+}
+
+EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
+	RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static struct platform_driver rocket_driver = {
+	.probe = rocket_probe,
+	.remove = rocket_remove,
+	.driver	 = {
+		.name = "rocket",
+		.pm = pm_ptr(&rocket_pm_ops),
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(rocket_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
+MODULE_AUTHOR("Tomeu Vizoso");
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
new file mode 100644
index 0000000000000000000000000000000000000000..bd3a697ab7c8e378967ce638b04d7d86845b53c7
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DRV_H__
+#define __ROCKET_DRV_H__
+
+#include "rocket_device.h"
+
+struct rocket_file_priv {
+	struct rocket_device *rdev;
+};
+
+#endif

-- 
2.49.0


