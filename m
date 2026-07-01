Return-Path: <linux-media+bounces-66264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BszrCV9MRWoi+QoAu9opvQ
	(envelope-from <linux-media+bounces-66264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:20:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D16F04CD
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:20:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=IsvcSkQB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66264-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66264-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0EAA3100FC5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F9D38E8B1;
	Wed,  1 Jul 2026 17:13:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586C387566;
	Wed,  1 Jul 2026 17:13:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925990; cv=none; b=YnQogykK4nr9wjlX+YhkySRE8/hEsCvWqmTn8dSBilATB7kLE4UdTyWQoiC9JS+YaDXHzzPQVCwiGTL+8mPtb+/Y/GvD4l8F56NO0HrZ0Py9cDM8tRRRgHX4F0JTRziavMr3n+7zl8s2L4tWVLGB1q9LqZ6YqoX8g/h0+mCIkTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925990; c=relaxed/simple;
	bh=nAOV1Lfuw72vbfC+l67aNWTKhG9Umm5A9dhfyIHRWO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+1JZfBbBHiRlNzPUWb/qaXrghT8MjoYt2R06gtw2zb231Heq/z1VGOZrh9IyelITM2TpUhqi6d8EB6GPfjOvYDiTDb8Ijtcr8bG+z1Irc/VKKnKkNLr/6FB+vqCUHVG49GVFUwZrhENOUvYqfekm1/KblmmcicdewiOpL3Imt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=IsvcSkQB; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782925986;
	bh=4xWJwm8T18OeKGBb/rZPmIYYmLN8EHML9V847m096Pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsvcSkQBy+WumukFTheuV09mevAeEXbqHZjYzHbgS3DqJJUaBJPWgHTmK71j1BRni
	 VjvneU4CwOPVNceUsvXcDE69BeKL5A89a+kLw0eK6HAEKKn/syTF4cPe05Vq6MvwDY
	 WQh4kHsCYitRb+sKMOSrKBbD9DOtWxuCmjnxx8UeA8Ex0z6PZmT+ZE9J7SLU4JZiOX
	 C7xiQNqVU+xZeNdtdTeinmRG7uMAhKjHkeI4z3twKP3brNKyzJZqWqK26sA5b0YWxe
	 cXL2ncxCa6YCtCuT61L9iwQfegdyrAOmQQNFJUmRi60JIbw3plLP0rg0hy0Fxqm/Ma
	 dlHi6aU31UGLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gr6691wcVz58lX;
	Thu, 02 Jul 2026 03:13:05 +1000 (AEST)
From: Matt Evans <matt@ozlabs.org>
To: Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v4 02/10] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Date: Wed,  1 Jul 2026 18:12:14 +0100
Message-ID: <20260701171245.90111-3-matt@ozlabs.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701171245.90111-1-matt@ozlabs.org>
References: <20260701171245.90111-1-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66264-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 792D16F04CD

The P2PDMA code currently provides two features under the same
CONFIG_PCI_P2PDMA option:

 1.  Locate providers via pcim_p2pdma_provider()
 2.  Manage actual P2P DMA

Some drivers (such as vfio-pci) depend on (1), without having a hard
dependency on (2).

A future vfio-pci commit will rely on pcim_p2pdma_provider() always
being present.  If that depended on CONFIG_PCI_P2PDMA, it would make
vfio-pci only available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit
systems), even when P2P is not needed.

To resolve this, introduce CONFIG_PCI_P2PDMA_CORE and refactor the
basic provider functionality into a new p2pdma_core.c file.  This is
available even if the CONFIG_PCI_P2PDMA feature is disabled (or
unavailable due to !CONFIG_ZONE_DEVICE), satisfying (1).

Then, when the original CONFIG_PCI_P2PDMA is set, drivers have access
to the additional P2P features of (2).  This still depends on
CONFIG_ZONE_DEVICE.

Signed-off-by: Matt Evans <matt@ozlabs.org>
---
 MAINTAINERS                |   2 +-
 drivers/pci/Kconfig        |  10 ++--
 drivers/pci/Makefile       |   1 +
 drivers/pci/p2pdma.c       | 107 +--------------------------------
 drivers/pci/p2pdma.h       |  29 +++++++++
 drivers/pci/p2pdma_core.c  | 118 +++++++++++++++++++++++++++++++++++++
 include/linux/pci-p2pdma.h |  24 ++++----
 include/linux/pci.h        |   2 +-
 8 files changed, 171 insertions(+), 122 deletions(-)
 create mode 100644 drivers/pci/p2pdma.h
 create mode 100644 drivers/pci/p2pdma_core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c8d4b913f26c..713861af4484 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20626,7 +20626,7 @@ B:	https://bugzilla.kernel.org
 C:	irc://irc.oftc.net/linux-pci
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
 F:	Documentation/driver-api/pci/p2pdma.rst
-F:	drivers/pci/p2pdma.c
+F:	drivers/pci/p2pdma*
 F:	include/linux/pci-p2pdma.h
 
 PCI POWER CONTROL
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 33c88432b728..59d70bc84cc9 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -206,11 +206,7 @@ config PCIE_TPH
 config PCI_P2PDMA
 	bool "PCI peer-to-peer transfer support"
 	depends on ZONE_DEVICE
-	#
-	# The need for the scatterlist DMA bus address flag means PCI P2PDMA
-	# requires 64bit
-	#
-	depends on 64BIT
+	select PCI_P2PDMA_CORE
 	select GENERIC_ALLOCATOR
 	select NEED_SG_DMA_FLAGS
 	help
@@ -226,6 +222,10 @@ config PCI_P2PDMA
 
 	  If unsure, say N.
 
+config PCI_P2PDMA_CORE
+	default n
+	bool
+
 config PCI_LABEL
 	def_bool y if (DMI || ACPI)
 	select NLS
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 41ebc3b9a518..0b32572d57a1 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PCI_SYSCALL)	+= syscall.o
 obj-$(CONFIG_PCI_STUB)		+= pci-stub.o
 obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
 obj-$(CONFIG_PCI_ECAM)		+= ecam.o
+obj-$(CONFIG_PCI_P2PDMA_CORE)	+= p2pdma_core.o
 obj-$(CONFIG_PCI_P2PDMA)	+= p2pdma.o
 obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
 obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index a5a1baebc34e..50b1a7daf55c 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -21,12 +21,7 @@
 #include <linux/seq_buf.h>
 #include <linux/xarray.h>
 
-struct pci_p2pdma {
-	struct gen_pool *pool;
-	bool p2pmem_published;
-	struct xarray map_types;
-	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
-};
+#include "p2pdma.h"
 
 struct pci_p2pdma_pagemap {
 	struct dev_pagemap pgmap;
@@ -226,8 +221,7 @@ static const struct dev_pagemap_ops p2pdma_pgmap_ops = {
 	.folio_free = p2pdma_folio_free,
 };
 
-static void pci_p2pdma_release_pool(struct pci_dev *pdev,
-				    struct pci_p2pdma *p2pdma)
+void pci_p2pdma_release_pool(struct pci_dev *pdev, struct pci_p2pdma *p2pdma)
 {
 	if (!p2pdma->pool)
 		return;
@@ -237,103 +231,6 @@ static void pci_p2pdma_release_pool(struct pci_dev *pdev,
 	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
 }
 
-static void pci_p2pdma_release(void *data)
-{
-	struct pci_dev *pdev = data;
-	struct pci_p2pdma *p2pdma;
-
-	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
-	if (!p2pdma)
-		return;
-
-	/* Flush and disable pci_alloc_p2p_mem() */
-	pdev->p2pdma = NULL;
-	pci_p2pdma_release_pool(pdev, p2pdma);
-	xa_destroy(&p2pdma->map_types);
-}
-
-/**
- * pcim_p2pdma_init - Initialise peer-to-peer DMA providers
- * @pdev: The PCI device to enable P2PDMA for
- *
- * This function initializes the peer-to-peer DMA infrastructure
- * for a PCI device. It allocates and sets up the necessary data
- * structures to support P2PDMA operations, including mapping type
- * tracking.
- */
-int pcim_p2pdma_init(struct pci_dev *pdev)
-{
-	struct pci_p2pdma *p2p;
-	int i, ret;
-
-	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
-	if (p2p)
-		return 0;
-
-	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
-	if (!p2p)
-		return -ENOMEM;
-
-	xa_init(&p2p->map_types);
-	/*
-	 * Iterate over all standard PCI BARs and record only those that
-	 * correspond to MMIO regions. Skip non-memory resources (e.g. I/O
-	 * port BARs) since they cannot be used for peer-to-peer (P2P)
-	 * transactions.
-	 */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (!(pci_resource_flags(pdev, i) & IORESOURCE_MEM))
-			continue;
-
-		p2p->mem[i].owner = &pdev->dev;
-		p2p->mem[i].bus_offset =
-			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
-	}
-
-	ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
-	if (ret)
-		goto out_p2p;
-
-	rcu_assign_pointer(pdev->p2pdma, p2p);
-	return 0;
-
-out_p2p:
-	devm_kfree(&pdev->dev, p2p);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pcim_p2pdma_init);
-
-/**
- * pcim_p2pdma_provider - Get peer-to-peer DMA provider
- * @pdev: The PCI device to enable P2PDMA for
- * @bar: BAR index to get provider
- *
- * This function gets peer-to-peer DMA provider for a PCI device. The lifetime
- * of the provider (and of course the MMIO) is bound to the lifetime of the
- * driver. A driver calling this function must ensure that all references to the
- * provider, and any DMA mappings created for any MMIO, are all cleaned up
- * before the driver remove() completes.
- *
- * Since P2P is almost always shared with a second driver this means some system
- * to notify, invalidate and revoke the MMIO's DMA must be in place to use this
- * function. For example a revoke can be built using DMABUF.
- */
-struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
-{
-	struct pci_p2pdma *p2p;
-
-	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-		return NULL;
-
-	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
-	if (WARN_ON(!p2p))
-		/* Someone forgot to call to pcim_p2pdma_init() before */
-		return NULL;
-
-	return &p2p->mem[bar];
-}
-EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
-
 static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
 {
 	struct pci_p2pdma *p2pdma;
diff --git a/drivers/pci/p2pdma.h b/drivers/pci/p2pdma.h
new file mode 100644
index 000000000000..946383809981
--- /dev/null
+++ b/drivers/pci/p2pdma.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PCI peer-to-peer DMA support.
+ */
+
+#ifndef _PCI_P2PDMA_H
+#define _PCI_P2PDMA_H
+
+#include <linux/genalloc.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/xarray.h>
+
+struct pci_p2pdma {
+	struct gen_pool *pool;
+	bool p2pmem_published;
+	struct xarray map_types;
+	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
+};
+
+#ifdef CONFIG_PCI_P2PDMA
+void pci_p2pdma_release_pool(struct pci_dev *pdev, struct pci_p2pdma *p2pdma);
+#else
+static inline void pci_p2pdma_release_pool(struct pci_dev *pdev,
+					   struct pci_p2pdma *p2pdma)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/pci/p2pdma_core.c b/drivers/pci/p2pdma_core.c
new file mode 100644
index 000000000000..bb2138bf2bc7
--- /dev/null
+++ b/drivers/pci/p2pdma_core.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI peer-to-peer DMA support core, providing a bare-bones
+ * pcim_p2pdma_provider() interface to drivers even if full P2PDMA
+ * isn't present.  The full P2PDMA feature is in p2pdma.c (see
+ * CONFIG_PCI_P2PDMA).
+ *
+ * Copyright (c) 2016-2018, Logan Gunthorpe
+ * Copyright (c) 2016-2017, Microsemi Corporation
+ * Copyright (c) 2017, Christoph Hellwig
+ * Copyright (c) 2018, Eideticom Inc.
+ */
+
+#define pr_fmt(fmt) "pci-p2pdma: " fmt
+#include <linux/ctype.h>
+#include <linux/genalloc.h>
+#include <linux/memremap.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/xarray.h>
+
+#include "p2pdma.h"
+
+static void pci_p2pdma_release(void *data)
+{
+	struct pci_dev *pdev = data;
+	struct pci_p2pdma *p2pdma;
+
+	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (!p2pdma)
+		return;
+
+	/* Flush and disable pci_alloc_p2p_mem() */
+	pdev->p2pdma = NULL;
+	pci_p2pdma_release_pool(pdev, p2pdma);
+	xa_destroy(&p2pdma->map_types);
+}
+
+/**
+ * pcim_p2pdma_init - Initialise peer-to-peer DMA providers
+ * @pdev: The PCI device to enable P2PDMA for
+ *
+ * This function initializes the peer-to-peer DMA infrastructure
+ * for a PCI device. It allocates and sets up the necessary data
+ * structures to support P2PDMA operations, including mapping type
+ * tracking.
+ */
+int pcim_p2pdma_init(struct pci_dev *pdev)
+{
+	struct pci_p2pdma *p2p;
+	int i, ret;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (p2p)
+		return 0;
+
+	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
+	if (!p2p)
+		return -ENOMEM;
+
+	xa_init(&p2p->map_types);
+	/*
+	 * Iterate over all standard PCI BARs and record only those that
+	 * correspond to MMIO regions. Skip non-memory resources (e.g. I/O
+	 * port BARs) since they cannot be used for peer-to-peer (P2P)
+	 * transactions.
+	 */
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		if (!(pci_resource_flags(pdev, i) & IORESOURCE_MEM))
+			continue;
+
+		p2p->mem[i].owner = &pdev->dev;
+		p2p->mem[i].bus_offset =
+			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
+	if (ret)
+		goto out_p2p;
+
+	rcu_assign_pointer(pdev->p2pdma, p2p);
+	return 0;
+
+out_p2p:
+	devm_kfree(&pdev->dev, p2p);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pcim_p2pdma_init);
+
+/**
+ * pcim_p2pdma_provider - Get peer-to-peer DMA provider
+ * @pdev: The PCI device to enable P2PDMA for
+ * @bar: BAR index to get provider
+ *
+ * This function gets peer-to-peer DMA provider for a PCI device. The lifetime
+ * of the provider (and of course the MMIO) is bound to the lifetime of the
+ * driver. A driver calling this function must ensure that all references to the
+ * provider, and any DMA mappings created for any MMIO, are all cleaned up
+ * before the driver remove() completes.
+ *
+ * Since P2P is almost always shared with a second driver this means some system
+ * to notify, invalidate and revoke the MMIO's DMA must be in place to use this
+ * function. For example a revoke can be built using DMABUF.
+ */
+struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
+{
+	struct pci_p2pdma *p2p;
+
+	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+		return NULL;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (WARN_ON(!p2p))
+		/* Someone forgot to call to pcim_p2pdma_init() before */
+		return NULL;
+
+	return &p2p->mem[bar];
+}
+EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 873de20a2247..4c42a7b2ee85 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -67,9 +67,22 @@ enum pci_p2pdma_map_type {
 	PCI_P2PDMA_MAP_THRU_HOST_BRIDGE,
 };
 
-#ifdef CONFIG_PCI_P2PDMA
+#ifdef CONFIG_PCI_P2PDMA_CORE
 int pcim_p2pdma_init(struct pci_dev *pdev);
 struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar);
+#else
+static inline int pcim_p2pdma_init(struct pci_dev *pdev)
+{
+	return -EOPNOTSUPP;
+}
+static inline struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev,
+							   int bar)
+{
+	return NULL;
+}
+#endif
+
+#ifdef CONFIG_PCI_P2PDMA
 int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 		u64 offset);
 int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
@@ -89,15 +102,6 @@ ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
 enum pci_p2pdma_map_type pci_p2pdma_map_type(struct p2pdma_provider *provider,
 					     struct device *dev);
 #else /* CONFIG_PCI_P2PDMA */
-static inline int pcim_p2pdma_init(struct pci_dev *pdev)
-{
-	return -EOPNOTSUPP;
-}
-static inline struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev,
-							   int bar)
-{
-	return NULL;
-}
 static inline int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar,
 		size_t size, u64 offset)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..531aec355686 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -557,7 +557,7 @@ struct pci_dev {
 	u16		pasid_cap;	/* PASID Capability offset */
 	u16		pasid_features;
 #endif
-#ifdef CONFIG_PCI_P2PDMA
+#ifdef CONFIG_PCI_P2PDMA_CORE
 	struct pci_p2pdma __rcu *p2pdma;
 #endif
 #ifdef CONFIG_PCI_DOE
-- 
2.50.1 (Apple Git-155)


