Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962263A8F83
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 05:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhFPDmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 23:42:43 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:7285 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhFPDmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 23:42:37 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G4W6S2tNDz1BMRN;
        Wed, 16 Jun 2021 11:35:28 +0800 (CST)
Received: from SZX1000464847.huawei.com (10.21.59.169) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 16 Jun 2021 11:40:28 +0800
From:   Dongdong Liu <liudongdong3@huawei.com>
To:     <helgaas@kernel.org>, <hch@infradead.org>, <kw@linux.com>,
        <linux-pci@vger.kernel.org>, <rajur@chelsio.com>,
        <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH V4 6/6] PCI: Enable 10-Bit tag support for PCIe RP devices
Date:   Wed, 16 Jun 2021 11:39:26 +0800
Message-ID: <1623814766-91906-7-git-send-email-liudongdong3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623814766-91906-1-git-send-email-liudongdong3@huawei.com>
References: <1623814766-91906-1-git-send-email-liudongdong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.21.59.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PCIe spec 5.0r1.0 section 2.2.6.2 implementation note, In configurations
where a Requester with 10-Bit Tag Requester capability needs to target
multiple Completers, one needs to ensure that the Requester sends 10-Bit
Tag Requests only to Completers that have 10-Bit Tag Completer capability.
So we enable 10-Bit Tag Requester for root port only when the devices
under the root port support 10-Bit Tag Completer.

Signed-off-by: Dongdong Liu <liudongdong3@huawei.com>
---
 drivers/pci/pcie/portdrv_pci.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
index c7ff1ee..3588f6d 100644
--- a/drivers/pci/pcie/portdrv_pci.c
+++ b/drivers/pci/pcie/portdrv_pci.c
@@ -90,6 +90,76 @@ static const struct dev_pm_ops pcie_portdrv_pm_ops = {
 #define PCIE_PORTDRV_PM_OPS	NULL
 #endif /* !PM */
 
+static int pci_10bit_tag_comp_support(struct pci_dev *dev, void *data)
+{
+	u8 *support = data;
+
+	if (*support == 0)
+		return 0;
+
+	if (!pci_is_pcie(dev)) {
+		*support = 0;
+		return 0;
+	}
+
+	/*
+	 * PCIe spec 5.0r1.0 section 2.2.6.2 implementation note.
+	 * For configurations where a Requester with 10-Bit Tag Requester
+	 * capability targets Completers where some do and some do not have
+	 * 10-Bit Tag Completer capability, how the Requester determines which
+	 * NPRs include 10-Bit Tags is outside the scope of this specification.
+	 * So we do not consider hotplug scenario.
+	 */
+	if (dev->is_hotplug_bridge) {
+		*support = 0;
+		return 0;
+	}
+
+	if (!(dev->pcie_devcap2 & PCI_EXP_DEVCAP2_10BIT_TAG_COMP)) {
+		*support = 0;
+		return 0;
+	}
+
+	return 0;
+}
+
+static void pci_configure_rp_10bit_tag(struct pci_dev *dev)
+{
+	u8 support = 1;
+	struct pci_dev *pchild;
+
+	if (dev->subordinate == NULL)
+		return;
+
+	/* If no devices under the root port, no need to enable 10-Bit Tag. */
+	if (list_empty(&dev->subordinate->devices))
+		return;
+
+	pci_10bit_tag_comp_support(dev, &support);
+	if (!support)
+		return;
+
+	/*
+	 * PCIe spec 5.0r1.0 section 2.2.6.2 implementation note.
+	 * In configurations where a Requester with 10-Bit Tag Requester
+	 * capability needs to target multiple Completers, one needs to ensure
+	 * that the Requester sends 10-Bit Tag Requests only to Completers
+	 * that have 10-Bit Tag Completer capability. So we enable 10-Bit Tag
+	 * Requester for root port only when the devices under the root port
+	 * support 10-Bit Tag Completer.
+	 */
+	pci_walk_bus(dev->subordinate, pci_10bit_tag_comp_support, &support);
+	if (!support)
+		return;
+
+	if (!(dev->pcie_devcap2 & PCI_EXP_DEVCAP2_10BIT_TAG_REQ))
+		return;
+
+	pci_dbg(dev, "enabling 10-Bit Tag Requester\n");
+	pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
+				 PCI_EXP_DEVCTL2_10BIT_TAG_REQ_EN);
+}
+
 /*
  * pcie_portdrv_probe - Probe PCI-Express port devices
  * @dev: PCI-Express port device being probed
@@ -111,6 +181,9 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
 	     (type != PCI_EXP_TYPE_RC_EC)))
 		return -ENODEV;
 
+	if (type == PCI_EXP_TYPE_ROOT_PORT)
+		pci_configure_rp_10bit_tag(dev);
+
 	if (type == PCI_EXP_TYPE_RC_EC)
 		pcie_link_rcec(dev);
 
-- 
2.7.4

