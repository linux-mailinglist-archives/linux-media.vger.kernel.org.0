Return-Path: <linux-media+bounces-62865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI5AL6nGFmqbrwcAu9opvQ
	(envelope-from <linux-media+bounces-62865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:25:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C574A5E2A6F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EAF8D3018328
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911383F20E4;
	Wed, 27 May 2026 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="cwc2HuK9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DD3EDE49;
	Wed, 27 May 2026 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877439; cv=none; b=mlX1sspywYuuYwqm67reNH63uKeUsMQwnIGPlS1CM+6yhP4CoOvq61te2sJiYE2bcCy3gwN8WGTQubqZXZbfa+kIz0g0XnZA7eV02tS+AifKUWKboP3o58jP7jTTZBlI/oHxEZCARCAwTEtqXsdDzxKfrse63I/YiLjInPPLKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877439; c=relaxed/simple;
	bh=kbESEVyr65NZ4RQa3X2siX+A6mJ1SVf+jkIjLR0Teoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDefx2I49MDTnDmwxhWnxxBIyJSnHDClvQgrBsO7ri+cMv5YAZNBnyOdFU5LOLQchIwbNQj0ktHc3nPUSBh01OIV4Nb6RsNpSA2Y/idsxzXJS8yFWM7n+XoEizTrGnEMit2huW0lOxSB+Oxi32/UJOcoXFJs0XKYgjs4rLb8udU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=cwc2HuK9; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8oZTY2830248;
	Wed, 27 May 2026 03:23:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=0dM+ibflGvjNJ9OOpb/CWIGy79O9UklXHD+jxx0h2vA=; b=cwc2HuK98bEk
	y3sftonaEb5DPcX0X0882y/cyrbMLXRy4/7kEjnh/XdRA3XpbT88y0jMxa9jL0OA
	NFu5hJVkQ2tAYGWa4APozNYEaZelDRnm6ftNOFDcg2rp7l1vmHqlHFmQ6/9PUW+O
	cXbWaCIj7lnF5Qg3uct3zmOFkHrzLpuv+HU1MX1DShtgwA7C81YnawB0bc5Xdv5A
	nqrQZtKZdEeXLAHUkBhM1DBLRv5L74eumH0PzfsZmH3q040xsv7HkEnzx/KYGeQ6
	W7zUimGINA9U4DyKLnE5j1v86lBuhl8+L8kRwhN675KA9fbgSOOuBPrFXivsU91r
	4Qbk+s3YoQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4edwf2gcu6-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:30 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::11) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:29 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Bjorn Helgaas
	<bhelgaas@google.com>,
        Logan Gunthorpe <logang@deltatee.com>
CC: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
	<ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
	<apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <kvm@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Date: Wed, 27 May 2026 03:23:04 -0700
Message-ID: <20260527102319.100128-2-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260527102319.100128-1-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: r69kDfeuS8IE7tKO5UaV2joeD0dQgTmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfXwSrHTweNVJ/i
 jabw+Z4NHU78PRjHP9AjOyrxFUlpjgORnITq2qglWf2bUWf3W3s8vmYa0w6YQRgCPzpWnC64vgT
 eH2Lj/ZaqIBJPSHt5Y879df1binaQ3w520KwBeMxAQWEfrDAeKjzWA3vjJinS+sCGvueTfZqJMi
 dVc+dFcyy4xvjNYLTXs3uIUjN/k+JMACX2WokhFOEPV11mlwNDB8NciX7pOo5XBZ2wnkXLT8Obn
 rmcIOU6v3V473mOxi2b4F8JOPrG71V+3UeLN9WEhsCZpPWCtHCac+BHYtTyeqj0v98HQMlPS8Dq
 pXqvy5hY50jR6lkWVuQODlRuIx/1+KSbizvGCnS26n9YJY5VZG/lZcAUpV6g9Xwoym+PoaIxAO8
 0sJ5ZG+tFMP38X3aAw12EXa10Hr9UPCmUrGS/Pa26AwOJEeuM6n/1zVLmwjwFDDq8raABGrmD+5
 2NaZH1XKvk0/oARp0XA==
X-Authority-Analysis: v=2.4 cv=BJ6DalQG c=1 sm=1 tr=0 ts=6a16c622 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=4h92JMTCafKA-fb_NiOh:22 a=VabnemYjAAAA:8 a=3w1EjqnpN93m_gGFsbMA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: r69kDfeuS8IE7tKO5UaV2joeD0dQgTmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-62865-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:mid,meta.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C574A5E2A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The P2PDMA code currently provides two features under the same
CONFIG_PCI_P2PDMA option:

 1.  Locate providers via pcim_p2pdma_provider()
 2.  Manage actual P2P DMA

Other code (such as vfio-pci) depends on 1, without having a hard
dependency on 2.

A future commit expands the use of DMABUF in vfio-pci for non-P2P
scenarios, relying on pcim_p2pdma_provider() always being present.  If
that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
when P2P is not needed.

To resolve this, introduce CONFIG_PCI_P2PDMA_CORE which contains the
basic provider functionality to make it available even if the
CONFIG_PCI_P2PDMA feature is disabled or unavailable due to
!CONFIG_ZONE_DEVICE.  Users such as vfio-pci can enable their own P2P
features based off the original CONFIG_PCI_P2PDMA (available when
CONFIG_ZONE_DEVICE is set).

Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/pci/Kconfig        | 10 +++++-----
 drivers/pci/Makefile       |  2 +-
 drivers/pci/p2pdma.c       | 16 ++++++++++++++++
 include/linux/pci-p2pdma.h | 24 ++++++++++++++----------
 include/linux/pci.h        |  2 +-
 5 files changed, 37 insertions(+), 17 deletions(-)

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
index 41ebc3b9a518..419b646a301d 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -30,7 +30,7 @@ obj-$(CONFIG_PCI_SYSCALL)	+= syscall.o
 obj-$(CONFIG_PCI_STUB)		+= pci-stub.o
 obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
 obj-$(CONFIG_PCI_ECAM)		+= ecam.o
-obj-$(CONFIG_PCI_P2PDMA)	+= p2pdma.o
+obj-$(CONFIG_PCI_P2PDMA_CORE)	+= p2pdma.o
 obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
 obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
 obj-$(CONFIG_PCI_DOE)		+= doe.o
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 7c898542af8d..619d46c652b8 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -28,6 +28,14 @@ struct pci_p2pdma {
 	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
 };
 
+/*
+ * CONFIG_PCI_P2PDMA_CORE provides just a bare-bones init and
+ * pcim_p2pdma_provider() interface (used by things like VFIO even if
+ * full P2PDMA isn't present).  The full P2PDMA feature is under the
+ * CONFIG_PCI_P2PDMA option.
+ */
+#ifdef CONFIG_PCI_P2PDMA
+
 struct pci_p2pdma_pagemap {
 	struct dev_pagemap pgmap;
 	struct p2pdma_provider *mem;
@@ -226,6 +234,8 @@ static const struct dev_pagemap_ops p2pdma_pgmap_ops = {
 	.folio_free = p2pdma_folio_free,
 };
 
+#endif /* CONFIG_PCI_P2PDMA */
+
 static void pci_p2pdma_release(void *data)
 {
 	struct pci_dev *pdev = data;
@@ -241,11 +251,13 @@ static void pci_p2pdma_release(void *data)
 		synchronize_rcu();
 	xa_destroy(&p2pdma->map_types);
 
+#ifdef CONFIG_PCI_P2PDMA
 	if (!p2pdma->pool)
 		return;
 
 	gen_pool_destroy(p2pdma->pool);
 	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
+#endif
 }
 
 /**
@@ -330,6 +342,8 @@ struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
 }
 EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
 
+#ifdef CONFIG_PCI_P2PDMA
+
 static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
 {
 	struct pci_p2pdma *p2pdma;
@@ -1207,3 +1221,5 @@ ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
 	return sprintf(page, "%s\n", pci_name(p2p_dev));
 }
 EXPORT_SYMBOL_GPL(pci_p2pdma_enable_show);
+
+#endif
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
2.47.3


