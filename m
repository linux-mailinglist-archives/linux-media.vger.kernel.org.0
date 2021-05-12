Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758C737C053
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 16:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhELOi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 10:38:59 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2491 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhELOi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 10:38:56 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FgHPx2Nt6zRfyP;
        Wed, 12 May 2021 22:35:17 +0800 (CST)
Received: from SZX1000464847.huawei.com (10.21.59.169) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 22:37:45 +0800
From:   Dongdong Liu <liudongdong3@huawei.com>
To:     <helgaas@kernel.org>, <hch@infradead.org>,
        <linux-pci@vger.kernel.org>, <rajur@chelsio.com>,
        <verkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH V3 2/6] PCI: Use cached Device Capabilities 2 Register
Date:   Wed, 12 May 2021 22:37:33 +0800
Message-ID: <20210512143737.42352-3-liudongdong3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512143737.42352-1-liudongdong3@huawei.com>
References: <20210512143737.42352-1-liudongdong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.21.59.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It will make sense to store the pcie_devcap2 value in the pci_dev
structure instead of reading Device Capabilities 2 Register multiple
times. Add pci_init_devcap2() to get the pcie_devcap2 value, then
use cached pcie_devcap2 in the needed place.

Signed-off-by: Dongdong Liu <liudongdong3@huawei.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c |  4 +---
 drivers/pci/pci.c                               |  8 +++-----
 drivers/pci/probe.c                             | 18 ++++++++++++------
 include/linux/pci.h                             |  2 ++
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 6264bc6..7896c96 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -6303,7 +6303,6 @@ static int cxgb4_iov_configure(struct pci_dev *pdev, int num_vfs)
 		struct pci_dev *pbridge;
 		struct port_info *pi;
 		char name[IFNAMSIZ];
-		u32 devcap2;
 		u16 flags;
 
 		/* If we want to instantiate Virtual Functions, then our
@@ -6313,10 +6312,9 @@ static int cxgb4_iov_configure(struct pci_dev *pdev, int num_vfs)
 		 */
 		pbridge = pdev->bus->self;
 		pcie_capability_read_word(pbridge, PCI_EXP_FLAGS, &flags);
-		pcie_capability_read_dword(pbridge, PCI_EXP_DEVCAP2, &devcap2);
 
 		if ((flags & PCI_EXP_FLAGS_VERS) < 2 ||
-		    !(devcap2 & PCI_EXP_DEVCAP2_ARI)) {
+		    !(pbridge->pcie_devcap2 & PCI_EXP_DEVCAP2_ARI)) {
 			/* Our parent bridge does not support ARI so issue a
 			 * warning and skip instantiating the VFs.  They
 			 * won't be reachable.
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 68ccd77..11103bb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3690,7 +3690,7 @@ int pci_enable_atomic_ops_to_root(struct pci_dev *dev, u32 cap_mask)
 {
 	struct pci_bus *bus = dev->bus;
 	struct pci_dev *bridge;
-	u32 cap, ctl2;
+	u32 ctl2;
 
 	if (!pci_is_pcie(dev))
 		return -EINVAL;
@@ -3714,19 +3714,17 @@ int pci_enable_atomic_ops_to_root(struct pci_dev *dev, u32 cap_mask)
 	while (bus->parent) {
 		bridge = bus->self;
 
-		pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2, &cap);
-
 		switch (pci_pcie_type(bridge)) {
 		/* Ensure switch ports support AtomicOp routing */
 		case PCI_EXP_TYPE_UPSTREAM:
 		case PCI_EXP_TYPE_DOWNSTREAM:
-			if (!(cap & PCI_EXP_DEVCAP2_ATOMIC_ROUTE))
+			if (!(bridge->pcie_devcap2 & PCI_EXP_DEVCAP2_ATOMIC_ROUTE))
 				return -EINVAL;
 			break;
 
 		/* Ensure root port supports all the sizes we care about */
 		case PCI_EXP_TYPE_ROOT_PORT:
-			if ((cap & cap_mask) != cap_mask)
+			if ((bridge->pcie_devcap2 & cap_mask) != cap_mask)
 				return -EINVAL;
 			break;
 		}
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 7963ab2..b9942cc 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2093,7 +2093,7 @@ static void pci_configure_ltr(struct pci_dev *dev)
 #ifdef CONFIG_PCIEASPM
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	struct pci_dev *bridge;
-	u32 cap, ctl;
+	u32 ctl;
 
 	if (!pci_is_pcie(dev))
 		return;
@@ -2101,8 +2101,7 @@ static void pci_configure_ltr(struct pci_dev *dev)
 	/* Read L1 PM substate capabilities */
 	dev->l1ss = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_L1SS);
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_LTR))
+	if (!(dev->pcie_devcap2 & PCI_EXP_DEVCAP2_LTR))
 		return;
 
 	pcie_capability_read_dword(dev, PCI_EXP_DEVCTL2, &ctl);
@@ -2142,13 +2141,11 @@ static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 #ifdef CONFIG_PCI_PASID
 	struct pci_dev *bridge;
 	int pcie_type;
-	u32 cap;
 
 	if (!pci_is_pcie(dev))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
+	if (!(dev->pcie_devcap2 & PCI_EXP_DEVCAP2_EE_PREFIX))
 		return;
 
 	pcie_type = pci_pcie_type(dev);
@@ -2376,6 +2373,14 @@ void pcie_report_downtraining(struct pci_dev *dev)
 	__pcie_print_link_status(dev, false);
 }
 
+static void pci_init_devcap2(struct pci_dev *dev)
+{
+	if (!pci_is_pcie(dev))
+		return;
+
+	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &dev->pcie_devcap2);
+}
+
 static void pci_init_capabilities(struct pci_dev *dev)
 {
 	pci_ea_init(dev);		/* Enhanced Allocation */
@@ -2452,6 +2457,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 {
 	int ret;
 
+	pci_init_devcap2(dev);
 	pci_configure_device(dev);
 
 	device_initialize(&dev->dev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 555a3ac..2965620 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -341,6 +341,8 @@ struct pci_dev {
 	u8		pin;		/* Interrupt pin this device uses */
 	u16		pcie_flags_reg;	/* Cached PCIe Capabilities Register */
 	u32		pcie_devcap;	/* Cached Device Capabilities Register */
+	u32		pcie_devcap2;	/* Cached Device Capabilities 2
+					   Register */
 	unsigned long	*dma_alias_mask;/* Mask of enabled devfn aliases */
 
 	struct pci_driver *driver;	/* Driver bound to this device */
-- 
2.7.4

