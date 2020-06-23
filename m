Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE34F205A23
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733202AbgFWSFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:05:44 -0400
Received: from mga07.intel.com ([134.134.136.100]:44038 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733197AbgFWSFo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:05:44 -0400
IronPort-SDR: +muPSFfWIjzGHHYAy0PRcfHnTWuYeyzKoTMTB9s0oR3oVmicHRk6cQ8hckNnAA8TydOY3twPBZ
 BsPR0KNahgsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="209358581"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="209358581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:38 -0700
IronPort-SDR: hjaDMr5JiV6ImRbm3jg2oJAO84zLw3DlWSh6fMWC2fRNSiFfiMm2VIiltVkWDvL9rDxY8S1KIp
 b2m4+Vjx6wRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="263401076"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2020 11:05:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 400A826A; Tue, 23 Jun 2020 21:05:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 7/9] media: atomisp: Replace direct access to MMIO with proper helpers
Date:   Tue, 23 Jun 2020 21:05:31 +0300
Message-Id: <20200623180533.65970-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
References: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have special helpers to access MMIO. Use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 13 +++---
 .../media/atomisp/pci/atomisp_compat.h        |  2 -
 .../media/atomisp/pci/atomisp_compat_css20.c  | 43 ++++++++++---------
 .../media/atomisp/pci/atomisp_internal.h      |  1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 16 +++----
 5 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index db3c3542457c..ed01a0987da7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -21,6 +21,7 @@
 #include <linux/firmware.h>
 #include <linux/pci.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/pm_runtime.h>
@@ -669,11 +670,10 @@ bool atomisp_buffers_queued_pipe(struct atomisp_video_pipe *pipe)
 void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 		  unsigned int size)
 {
-	u32 __iomem *io_virt_addr;
 	unsigned int data = 0;
 	unsigned int size32 = DIV_ROUND_UP(size, sizeof(u32));
 
-	dev_dbg(isp->dev, "atomisp_io_base:%p\n", atomisp_io_base);
+	dev_dbg(isp->dev, "atomisp mmio base: %p\n", isp->base);
 	dev_dbg(isp->dev, "%s, addr:0x%x, size: %d, size32: %d\n", __func__,
 		addr, size, size32);
 	if (size32 * 4 + addr > 0x4000) {
@@ -682,13 +682,12 @@ void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 		return;
 	}
 	addr += SP_DMEM_BASE;
-	io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	addr &= 0x003FFFFF;
 	do {
-		data = *io_virt_addr;
+		data = readl(isp->base + addr);
 		dev_dbg(isp->dev, "%s, \t [0x%x]:0x%x\n", __func__, addr, data);
-		io_virt_addr += sizeof(u32);
-		size32 -= 1;
-	} while (size32 > 0);
+		addr += sizeof(u32);
+	} while (--size32);
 }
 
 static struct videobuf_buffer *atomisp_css_frame_to_vbuf(
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index b2ed83c2f337..6a2a81a3eb23 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -29,8 +29,6 @@ struct atomisp_sub_device;
 struct video_device;
 enum atomisp_input_stream_id;
 
-extern void __iomem *atomisp_io_base;
-
 struct atomisp_metadata_buf {
 	struct ia_css_metadata *metadata;
 	void *md_vptr;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index df352be06474..010b2b19d811 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -38,6 +38,7 @@
 #include "sh_css_hrt.h"
 #include "ia_css_isys.h"
 
+#include <linux/io.h>
 #include <linux/pm_runtime.h>
 
 /* Assume max number of ACC stages */
@@ -67,92 +68,94 @@ struct bayer_ds_factor {
 
 static void atomisp_css2_hw_store_8(hrt_address addr, uint8_t data)
 {
-	s8 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&mmio_lock, flags);
-	*io_virt_addr = data;
+	writeb(data, isp->base + (addr & 0x003FFFFF));
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
 static void atomisp_css2_hw_store_16(hrt_address addr, uint16_t data)
 {
-	s16 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&mmio_lock, flags);
-	*io_virt_addr = data;
+	writew(data, isp->base + (addr & 0x003FFFFF));
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
 void atomisp_css2_hw_store_32(hrt_address addr, uint32_t data)
 {
-	s32 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&mmio_lock, flags);
-	*io_virt_addr = data;
+	writel(data, isp->base + (addr & 0x003FFFFF));
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
 static uint8_t atomisp_css2_hw_load_8(hrt_address addr)
 {
-	s8 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 	u8 ret;
 
 	spin_lock_irqsave(&mmio_lock, flags);
-	ret = *io_virt_addr;
+	ret = readb(isp->base + (addr & 0x003FFFFF));
 	spin_unlock_irqrestore(&mmio_lock, flags);
 	return ret;
 }
 
 static uint16_t atomisp_css2_hw_load_16(hrt_address addr)
 {
-	s16 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 	u16 ret;
 
 	spin_lock_irqsave(&mmio_lock, flags);
-	ret = *io_virt_addr;
+	ret = readw(isp->base + (addr & 0x003FFFFF));
 	spin_unlock_irqrestore(&mmio_lock, flags);
 	return ret;
 }
 
 static uint32_t atomisp_css2_hw_load_32(hrt_address addr)
 {
-	s32 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 	u32 ret;
 
 	spin_lock_irqsave(&mmio_lock, flags);
-	ret = *io_virt_addr;
+	ret = readl(isp->base + (addr & 0x003FFFFF));
 	spin_unlock_irqrestore(&mmio_lock, flags);
 	return ret;
 }
 
-static void atomisp_css2_hw_store(hrt_address addr,
-				  const void *from, uint32_t n)
+static void atomisp_css2_hw_store(hrt_address addr, const void *from, uint32_t n)
 {
-	s8 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 	unsigned int i;
 
+	addr &= 0x003FFFFF;
 	spin_lock_irqsave(&mmio_lock, flags);
-	for (i = 0; i < n; i++, io_virt_addr++, from++)
-		*io_virt_addr = *(s8 *)from;
+	for (i = 0; i < n; i++, from++)
+		writeb(*(s8 *)from, isp->base + addr + i);
+
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
 static void atomisp_css2_hw_load(hrt_address addr, void *to, uint32_t n)
 {
-	s8 __iomem *io_virt_addr = atomisp_io_base + (addr & 0x003FFFFF);
+	struct atomisp_device *isp = dev_get_drvdata(atomisp_dev);
 	unsigned long flags;
 	unsigned int i;
 
+	addr &= 0x003FFFFF;
 	spin_lock_irqsave(&mmio_lock, flags);
-	for (i = 0; i < n; i++, to++, io_virt_addr++)
-		*(s8 *)to = *io_virt_addr;
+	for (i = 0; i < n; i++, to++)
+		*(s8 *)to = readb(isp->base + addr + i);
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 5af9bbce6284..c01db10bb735 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -221,6 +221,7 @@ struct atomisp_device {
 	struct media_device media_dev;
 	struct atomisp_platform_data *pdata;
 	void *mmu_l1_base;
+	void __iomem *base;
 	const struct firmware *firmware;
 
 	struct pm_qos_request pm_qos;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 731a683e82f1..17ca730aa358 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -127,8 +127,6 @@ MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
 
 struct device *atomisp_dev;
 
-void __iomem *atomisp_io_base;
-
 static const struct atomisp_freq_scaling_rule dfs_rules_merr[] = {
 	{
 		.width = ISP_FREQ_RULE_ANY,
@@ -1531,7 +1529,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	const struct atomisp_platform_data *pdata;
 	struct atomisp_device *isp;
 	unsigned int start;
-	void __iomem *base;
 	int err, val;
 	u32 irq;
 
@@ -1560,13 +1557,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		goto ioremap_fail;
 	}
 
-	base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
-	dev_dbg(&pdev->dev, "base: %p\n", base);
-
-	atomisp_io_base = base;
-
-	dev_dbg(&pdev->dev, "atomisp_io_base: %p\n", atomisp_io_base);
-
 	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
 	if (!isp) {
 		err = -ENOMEM;
@@ -1574,9 +1564,12 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	}
 
 	isp->dev = &pdev->dev;
+	isp->base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
 	isp->sw_contex.power_state = ATOM_ISP_POWER_UP;
 	isp->saved_regs.ispmmadr = start;
 
+	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
+
 	rt_mutex_init(&isp->mutex);
 	mutex_init(&isp->streamoff_mutex);
 	spin_lock_init(&isp->lock);
@@ -1584,6 +1577,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	/* This is not a true PCI device on SoC, so the delay is not needed. */
 	pdev->d3_delay = 0;
 
+	pci_set_drvdata(pdev, isp);
+
 	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
 	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
 		isp->media_dev.hw_revision =
@@ -1714,7 +1709,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	}
 
 	pci_set_master(pdev);
-	pci_set_drvdata(pdev, isp);
 
 	err = pci_enable_msi(pdev);
 	if (err) {
-- 
2.27.0

