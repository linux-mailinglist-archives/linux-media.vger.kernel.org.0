Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14BF205A25
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733012AbgFWSGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:06:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:44039 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733201AbgFWSGp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:06:45 -0400
IronPort-SDR: A/rewdfkvsAb1EhOFqON/i29Kgw6E4ptagt5++lJWWLoKIP0LjNEjWuvk4FTHxkVjjy8VJt1he
 swHcGUU0af4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="209358597"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="209358597"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:41 -0700
IronPort-SDR: 9fh9SO6+exaoFjAXVGVTKZIEXvO11k1RLUS3ZHuhxwGB0samvRTTgU9melwTVz0QQXwLFTddmF
 hBUtNMYPFO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="263401075"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2020 11:05:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 35F44260; Tue, 23 Jun 2020 21:05:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/9] media: atomisp: Unify pdev to be pointer to struct pci_device
Date:   Tue, 23 Jun 2020 21:05:30 +0300
Message-Id: <20200623180533.65970-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
References: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Unify pdev to be pointer to struct pci_device.

While here, reindent some (touched) lines for better readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  24 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |   6 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 248 ++++++++----------
 3 files changed, 127 insertions(+), 151 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 0735df75841f..db3c3542457c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -360,39 +360,39 @@ static void clear_isp_irq(enum hrt_isp_css_irq irq)
 
 void atomisp_msi_irq_init(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = to_pci_dev(isp->dev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	u32 msg32;
 	u16 msg16;
 
-	pci_read_config_dword(dev, PCI_MSI_CAPID, &msg32);
+	pci_read_config_dword(pdev, PCI_MSI_CAPID, &msg32);
 	msg32 |= 1 << MSI_ENABLE_BIT;
-	pci_write_config_dword(dev, PCI_MSI_CAPID, msg32);
+	pci_write_config_dword(pdev, PCI_MSI_CAPID, msg32);
 
 	msg32 = (1 << INTR_IER) | (1 << INTR_IIR);
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, msg32);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, msg32);
 
-	pci_read_config_word(dev, PCI_COMMAND, &msg16);
+	pci_read_config_word(pdev, PCI_COMMAND, &msg16);
 	msg16 |= (PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
 		  PCI_COMMAND_INTX_DISABLE);
-	pci_write_config_word(dev, PCI_COMMAND, msg16);
+	pci_write_config_word(pdev, PCI_COMMAND, msg16);
 }
 
 void atomisp_msi_irq_uninit(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = to_pci_dev(isp->dev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	u32 msg32;
 	u16 msg16;
 
-	pci_read_config_dword(dev, PCI_MSI_CAPID, &msg32);
+	pci_read_config_dword(pdev, PCI_MSI_CAPID, &msg32);
 	msg32 &=  ~(1 << MSI_ENABLE_BIT);
-	pci_write_config_dword(dev, PCI_MSI_CAPID, msg32);
+	pci_write_config_dword(pdev, PCI_MSI_CAPID, msg32);
 
 	msg32 = 0x0;
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, msg32);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, msg32);
 
-	pci_read_config_word(dev, PCI_COMMAND, &msg16);
+	pci_read_config_word(pdev, PCI_COMMAND, &msg16);
 	msg16 &= ~(PCI_COMMAND_MASTER);
-	pci_write_config_word(dev, PCI_COMMAND, msg16);
+	pci_write_config_word(pdev, PCI_COMMAND, msg16);
 }
 
 static void atomisp_sof_event(struct atomisp_sub_device *asd)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 8acceae189a2..79cbde65d3c1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1148,10 +1148,10 @@ EXPORT_SYMBOL_GPL(camera_sensor_csi);
  * trying.  The driver itself does direct calls to the PUNIT to manage
  * ISP power.
  */
-static void isp_pm_cap_fixup(struct pci_dev *dev)
+static void isp_pm_cap_fixup(struct pci_dev *pdev)
 {
-	dev_info(&dev->dev, "Disabling PCI power management on camera ISP\n");
-	dev->pm_cap = 0;
+	dev_info(&pdev->dev, "Disabling PCI power management on camera ISP\n");
+	pdev->pm_cap = 0;
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x0f38, isp_pm_cap_fixup);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 3ae9058b32ec..731a683e82f1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -512,30 +512,27 @@ void atomisp_acc_unregister(struct atomisp_acc_pipe *video)
 
 static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = to_pci_dev(isp->dev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
 	dev_dbg(isp->dev, "%s\n", __func__);
 
-	pci_read_config_word(dev, PCI_COMMAND, &isp->saved_regs.pcicmdsts);
+	pci_read_config_word(pdev, PCI_COMMAND, &isp->saved_regs.pcicmdsts);
 	/* isp->saved_regs.ispmmadr is set from the atomisp_pci_probe() */
-	pci_read_config_dword(dev, PCI_MSI_CAPID, &isp->saved_regs.msicap);
-	pci_read_config_dword(dev, PCI_MSI_ADDR, &isp->saved_regs.msi_addr);
-	pci_read_config_word(dev, PCI_MSI_DATA,  &isp->saved_regs.msi_data);
-	pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &isp->saved_regs.intr);
-	pci_read_config_dword(dev, PCI_INTERRUPT_CTRL,
-			      &isp->saved_regs.interrupt_control);
-
-	pci_read_config_dword(dev, MRFLD_PCI_PMCS,
-			      &isp->saved_regs.pmcs);
+	pci_read_config_dword(pdev, PCI_MSI_CAPID, &isp->saved_regs.msicap);
+	pci_read_config_dword(pdev, PCI_MSI_ADDR, &isp->saved_regs.msi_addr);
+	pci_read_config_word(pdev, PCI_MSI_DATA,  &isp->saved_regs.msi_data);
+	pci_read_config_byte(pdev, PCI_INTERRUPT_LINE, &isp->saved_regs.intr);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &isp->saved_regs.interrupt_control);
+
+	pci_read_config_dword(pdev, MRFLD_PCI_PMCS, &isp->saved_regs.pmcs);
 	/* Ensure read/write combining is enabled. */
-	pci_read_config_dword(dev, PCI_I_CONTROL,
-			      &isp->saved_regs.i_control);
+	pci_read_config_dword(pdev, PCI_I_CONTROL, &isp->saved_regs.i_control);
 	isp->saved_regs.i_control |=
 	    MRFLD_PCI_I_CONTROL_ENABLE_READ_COMBINING |
 	    MRFLD_PCI_I_CONTROL_ENABLE_WRITE_COMBINING;
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_ACCESS_CTRL_VIOL,
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_ACCESS_CTRL_VIOL,
 			      &isp->saved_regs.csi_access_viol);
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_RCOMP_CONTROL,
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_RCOMP_CONTROL,
 			      &isp->saved_regs.csi_rcomp_config);
 	/*
 	 * Hardware bugs require setting CSI_HS_OVR_CLK_GATE_ON_UPDATE.
@@ -545,65 +542,58 @@ static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 	 * is missed, and IUNIT can hang.
 	 * For both issues, setting this bit is a workaround.
 	 */
-	isp->saved_regs.csi_rcomp_config |=
-	    MRFLD_PCI_CSI_HS_OVR_CLK_GATE_ON_UPDATE;
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL,
+	isp->saved_regs.csi_rcomp_config |= MRFLD_PCI_CSI_HS_OVR_CLK_GATE_ON_UPDATE;
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL,
 			      &isp->saved_regs.csi_afe_dly);
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_CONTROL,
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_CONTROL,
 			      &isp->saved_regs.csi_control);
 	if (isp->media_dev.hw_revision >=
 	    (ATOMISP_HW_REVISION_ISP2401 << ATOMISP_HW_REVISION_SHIFT))
-		isp->saved_regs.csi_control |=
-		    MRFLD_PCI_CSI_CONTROL_PARPATHEN;
+		isp->saved_regs.csi_control |= MRFLD_PCI_CSI_CONTROL_PARPATHEN;
 	/*
 	 * On CHT CSI_READY bit should be enabled before stream on
 	 */
 	if (IS_CHT && (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
 		       ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)))
-		isp->saved_regs.csi_control |=
-		    MRFLD_PCI_CSI_CONTROL_CSI_READY;
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_AFE_RCOMP_CONTROL,
+		isp->saved_regs.csi_control |= MRFLD_PCI_CSI_CONTROL_CSI_READY;
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_RCOMP_CONTROL,
 			      &isp->saved_regs.csi_afe_rcomp_config);
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_AFE_HS_CONTROL,
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_HS_CONTROL,
 			      &isp->saved_regs.csi_afe_hs_control);
-	pci_read_config_dword(dev, MRFLD_PCI_CSI_DEADLINE_CONTROL,
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_DEADLINE_CONTROL,
 			      &isp->saved_regs.csi_deadline_control);
 	return 0;
 }
 
 static int __maybe_unused atomisp_restore_iunit_reg(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = to_pci_dev(isp->dev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
 	dev_dbg(isp->dev, "%s\n", __func__);
 
-	pci_write_config_word(dev, PCI_COMMAND, isp->saved_regs.pcicmdsts);
-	pci_write_config_dword(dev, PCI_BASE_ADDRESS_0,
-			       isp->saved_regs.ispmmadr);
-	pci_write_config_dword(dev, PCI_MSI_CAPID, isp->saved_regs.msicap);
-	pci_write_config_dword(dev, PCI_MSI_ADDR, isp->saved_regs.msi_addr);
-	pci_write_config_word(dev, PCI_MSI_DATA, isp->saved_regs.msi_data);
-	pci_write_config_byte(dev, PCI_INTERRUPT_LINE, isp->saved_regs.intr);
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL,
-			       isp->saved_regs.interrupt_control);
-	pci_write_config_dword(dev, PCI_I_CONTROL,
-			       isp->saved_regs.i_control);
-
-	pci_write_config_dword(dev, MRFLD_PCI_PMCS,
-			       isp->saved_regs.pmcs);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_ACCESS_CTRL_VIOL,
+	pci_write_config_word(pdev, PCI_COMMAND, isp->saved_regs.pcicmdsts);
+	pci_write_config_dword(pdev, PCI_BASE_ADDRESS_0, isp->saved_regs.ispmmadr);
+	pci_write_config_dword(pdev, PCI_MSI_CAPID, isp->saved_regs.msicap);
+	pci_write_config_dword(pdev, PCI_MSI_ADDR, isp->saved_regs.msi_addr);
+	pci_write_config_word(pdev, PCI_MSI_DATA, isp->saved_regs.msi_data);
+	pci_write_config_byte(pdev, PCI_INTERRUPT_LINE, isp->saved_regs.intr);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, isp->saved_regs.interrupt_control);
+	pci_write_config_dword(pdev, PCI_I_CONTROL, isp->saved_regs.i_control);
+
+	pci_write_config_dword(pdev, MRFLD_PCI_PMCS, isp->saved_regs.pmcs);
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_ACCESS_CTRL_VIOL,
 			       isp->saved_regs.csi_access_viol);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_RCOMP_CONTROL,
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_RCOMP_CONTROL,
 			       isp->saved_regs.csi_rcomp_config);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL,
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL,
 			       isp->saved_regs.csi_afe_dly);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_CONTROL,
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_CONTROL,
 			       isp->saved_regs.csi_control);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_AFE_RCOMP_CONTROL,
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_RCOMP_CONTROL,
 			       isp->saved_regs.csi_afe_rcomp_config);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_AFE_HS_CONTROL,
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_HS_CONTROL,
 			       isp->saved_regs.csi_afe_hs_control);
-	pci_write_config_dword(dev, MRFLD_PCI_CSI_DEADLINE_CONTROL,
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_DEADLINE_CONTROL,
 			       isp->saved_regs.csi_deadline_control);
 
 	/*
@@ -619,7 +609,7 @@ static int __maybe_unused atomisp_restore_iunit_reg(struct atomisp_device *isp)
 
 static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = to_pci_dev(isp->dev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	u32 irq;
 	unsigned long flags;
 
@@ -635,11 +625,11 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	 * So, here we need to check if there is any pending
 	 * IRQ, if so, waiting for it to be served
 	 */
-	pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq = irq & 1 << INTR_IIR;
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
-	pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	if (!(irq & (1 << INTR_IIR)))
 		goto done;
 
@@ -652,11 +642,11 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return -EAGAIN;
 	} else {
-		pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 		irq = irq & 1 << INTR_IIR;
-		pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
+		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
-		pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 		if (!(irq & (1 << INTR_IIR))) {
 			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
 			goto done;
@@ -675,9 +665,9 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	* to IIR. It could block subsequent interrupt messages.
 	* HW sighting:4568410.
 	*/
-	pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq &= ~(1 << INTR_IER);
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
 	atomisp_msi_irq_uninit(isp);
 	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
@@ -1441,8 +1431,7 @@ atomisp_load_firmware(struct atomisp_device *isp)
  * Check for flags the driver was compiled with against the PCI
  * device. Always returns true on other than ISP 2400.
  */
-static bool is_valid_device(struct pci_dev *dev,
-			    const struct pci_device_id *id)
+static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	unsigned int a0_max_id = 0;
 	const char *name;
@@ -1466,14 +1455,14 @@ static bool is_valid_device(struct pci_dev *dev,
 		name = "Cherrytrail";
 		break;
 	default:
-		dev_err(&dev->dev, "%s: unknown device ID %x04:%x04\n",
+		dev_err(&pdev->dev, "%s: unknown device ID %x04:%x04\n",
 			product, id->vendor, id->device);
 		return false;
 	}
 
-	if (dev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
-		dev_err(&dev->dev, "%s revision %d is not unsupported\n",
-			name, dev->revision);
+	if (pdev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
+		dev_err(&pdev->dev, "%s revision %d is not unsupported\n",
+			name, pdev->revision);
 		return false;
 	}
 
@@ -1484,22 +1473,20 @@ static bool is_valid_device(struct pci_dev *dev,
 
 #if defined(ISP2400)
 	if (IS_ISP2401) {
-		dev_err(&dev->dev, "Support for %s (ISP2401) was disabled at compile time\n",
+		dev_err(&pdev->dev, "Support for %s (ISP2401) was disabled at compile time\n",
 			name);
 		return false;
 	}
 #else
 	if (!IS_ISP2401) {
-		dev_err(&dev->dev, "Support for %s (ISP2400) was disabled at compile time\n",
+		dev_err(&pdev->dev, "Support for %s (ISP2400) was disabled at compile time\n",
 			name);
 		return false;
 	}
 #endif
 
-	dev_info(&dev->dev, "Detected %s version %d (ISP240%c) on %s\n",
-		name, dev->revision,
-		IS_ISP2401 ? '1' : '0',
-		product);
+	dev_info(&pdev->dev, "Detected %s version %d (ISP240%c) on %s\n",
+		 name, pdev->revision, IS_ISP2401 ? '1' : '0', product);
 
 	return true;
 }
@@ -1539,8 +1526,7 @@ static int init_atomisp_wdts(struct atomisp_device *isp)
 
 #define ATOM_ISP_PCI_BAR	0
 
-static int atomisp_pci_probe(struct pci_dev *dev,
-			     const struct pci_device_id *id)
+static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct atomisp_platform_data *pdata;
 	struct atomisp_device *isp;
@@ -1549,47 +1535,45 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	int err, val;
 	u32 irq;
 
-	if (!is_valid_device(dev, id))
+	if (!is_valid_device(pdev, id))
 		return -ENODEV;
 
 	/* Pointer to struct device. */
-	atomisp_dev = &dev->dev;
+	atomisp_dev = &pdev->dev;
 
 	pdata = atomisp_get_platform_data();
 	if (!pdata)
-		dev_warn(&dev->dev, "no platform data available\n");
+		dev_warn(&pdev->dev, "no platform data available\n");
 
-	err = pcim_enable_device(dev);
+	err = pcim_enable_device(pdev);
 	if (err) {
-		dev_err(&dev->dev, "Failed to enable CI ISP device (%d)\n",
-			err);
+		dev_err(&pdev->dev, "Failed to enable CI ISP device (%d)\n", err);
 		return err;
 	}
 
-	start = pci_resource_start(dev, ATOM_ISP_PCI_BAR);
-	dev_dbg(&dev->dev, "start: 0x%x\n", start);
+	start = pci_resource_start(pdev, ATOM_ISP_PCI_BAR);
+	dev_dbg(&pdev->dev, "start: 0x%x\n", start);
 
-	err = pcim_iomap_regions(dev, 1 << ATOM_ISP_PCI_BAR, pci_name(dev));
+	err = pcim_iomap_regions(pdev, 1 << ATOM_ISP_PCI_BAR, pci_name(pdev));
 	if (err) {
-		dev_err(&dev->dev, "Failed to I/O memory remapping (%d)\n",
-			err);
+		dev_err(&pdev->dev, "Failed to I/O memory remapping (%d)\n", err);
 		goto ioremap_fail;
 	}
 
-	base = pcim_iomap_table(dev)[ATOM_ISP_PCI_BAR];
-	dev_dbg(&dev->dev, "base: %p\n", base);
+	base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
+	dev_dbg(&pdev->dev, "base: %p\n", base);
 
 	atomisp_io_base = base;
 
-	dev_dbg(&dev->dev, "atomisp_io_base: %p\n", atomisp_io_base);
+	dev_dbg(&pdev->dev, "atomisp_io_base: %p\n", atomisp_io_base);
 
-	isp = devm_kzalloc(&dev->dev, sizeof(struct atomisp_device), GFP_KERNEL);
+	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
 	if (!isp) {
 		err = -ENOMEM;
 		goto atomisp_dev_alloc_fail;
 	}
 
-	isp->dev = &dev->dev;
+	isp->dev = &pdev->dev;
 	isp->sw_contex.power_state = ATOM_ISP_POWER_UP;
 	isp->saved_regs.ispmmadr = start;
 
@@ -1598,7 +1582,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	spin_lock_init(&isp->lock);
 
 	/* This is not a true PCI device on SoC, so the delay is not needed. */
-	dev->d3_delay = 0;
+	pdev->d3_delay = 0;
 
 	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
 	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
@@ -1649,15 +1633,14 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		 * have specs yet for exactly how it varies.  Default to
 		 * BYT-CR but let provisioning set it via EFI variable
 		 */
-		isp->hpll_freq = gmin_get_var_int(&dev->dev, false, "HpllFreq",
-						  HPLL_FREQ_2000MHZ);
+		isp->hpll_freq = gmin_get_var_int(&pdev->dev, false, "HpllFreq", HPLL_FREQ_2000MHZ);
 
 		/*
 		 * for BYT/CHT we are put isp into D3cold to avoid pci registers access
 		 * in power off. Set d3cold_delay to 0 since default 100ms is not
 		 * necessary.
 		 */
-		dev->d3cold_delay = 0;
+		pdev->d3cold_delay = 0;
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_ANN:
 		isp->media_dev.hw_revision = (
@@ -1667,7 +1650,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 						 ATOMISP_HW_REVISION_ISP2401_LEGACY
 #endif
 						 << ATOMISP_HW_REVISION_SHIFT);
-		isp->media_dev.hw_revision |= dev->revision < 2 ?
+		isp->media_dev.hw_revision |= pdev->revision < 2 ?
 					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
 		isp->dfs = &dfs_config_merr;
 		isp->hpll_freq = HPLL_FREQ_1600MHZ;
@@ -1680,11 +1663,11 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 						 ATOMISP_HW_REVISION_ISP2401_LEGACY
 #endif
 						 << ATOMISP_HW_REVISION_SHIFT);
-		isp->media_dev.hw_revision |= dev->revision < 2 ?
+		isp->media_dev.hw_revision |= pdev->revision < 2 ?
 					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
 
 		isp->dfs = &dfs_config_cht;
-		dev->d3cold_delay = 0;
+		pdev->d3cold_delay = 0;
 
 		iosf_mbi_read(BT_MBI_UNIT_CCK, MBI_REG_READ, CCK_FUSE_REG_0, &val);
 		switch (val & CCK_FUSE_HPLL_FREQ_MASK) {
@@ -1699,18 +1682,16 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 			break;
 		default:
 			isp->hpll_freq = HPLL_FREQ_1600MHZ;
-			dev_warn(isp->dev,
-				 "read HPLL from cck failed. Default to 1600 MHz.\n");
+			dev_warn(&pdev->dev, "read HPLL from cck failed. Default to 1600 MHz.\n");
 		}
 		break;
 	default:
-		dev_err(&dev->dev, "un-supported IUNIT device\n");
+		dev_err(&pdev->dev, "un-supported IUNIT device\n");
 		err = -ENODEV;
 		goto atomisp_dev_alloc_fail;
 	}
 
-	dev_info(&dev->dev, "ISP HPLL frequency base = %d MHz\n",
-		 isp->hpll_freq);
+	dev_info(&pdev->dev, "ISP HPLL frequency base = %d MHz\n", isp->hpll_freq);
 
 	isp->max_isr_latency = ATOMISP_MAX_ISR_LATENCY;
 
@@ -1719,26 +1700,25 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		isp->firmware = atomisp_load_firmware(isp);
 		if (!isp->firmware) {
 			err = -ENOENT;
-			dev_dbg(&dev->dev, "Firmware load failed\n");
+			dev_dbg(&pdev->dev, "Firmware load failed\n");
 			goto load_fw_fail;
 		}
 
-		err = sh_css_check_firmware_version(isp->dev,
-						    isp->firmware->data);
+		err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
 		if (err) {
-			dev_dbg(&dev->dev, "Firmware version check failed\n");
+			dev_dbg(&pdev->dev, "Firmware version check failed\n");
 			goto fw_validation_fail;
 		}
 	} else {
-		dev_info(&dev->dev, "Firmware load will be deferred\n");
+		dev_info(&pdev->dev, "Firmware load will be deferred\n");
 	}
 
-	pci_set_master(dev);
-	pci_set_drvdata(dev, isp);
+	pci_set_master(pdev);
+	pci_set_drvdata(pdev, isp);
 
-	err = pci_enable_msi(dev);
+	err = pci_enable_msi(pdev);
 	if (err) {
-		dev_err(&dev->dev, "Failed to enable msi (%d)\n", err);
+		dev_err(&pdev->dev, "Failed to enable msi (%d)\n", err);
 		goto enable_msi_fail;
 	}
 
@@ -1763,8 +1743,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		 * Workaround for imbalance data eye issue which is observed
 		 * on TNG B0.
 		 */
-		pci_read_config_dword(dev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL,
-				      &csi_afe_trim);
+		pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, &csi_afe_trim);
 		csi_afe_trim &= ~((MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
 				   MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
 				  (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
@@ -1777,20 +1756,18 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 				 MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
 				(MRFLD_PCI_CSI3_HSRXCLKTRIM <<
 				 MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT);
-		pci_write_config_dword(dev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL,
-				       csi_afe_trim);
+		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, csi_afe_trim);
 	}
 
 	err = atomisp_initialize_modules(isp);
 	if (err < 0) {
-		dev_err(&dev->dev, "atomisp_initialize_modules (%d)\n", err);
+		dev_err(&pdev->dev, "atomisp_initialize_modules (%d)\n", err);
 		goto initialize_modules_fail;
 	}
 
 	err = atomisp_register_entities(isp);
 	if (err < 0) {
-		dev_err(&dev->dev, "atomisp_register_entities failed (%d)\n",
-			err);
+		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
 		goto register_entities_fail;
 	}
 	err = atomisp_create_pads_links(isp);
@@ -1803,24 +1780,24 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	/* save the iunit context only once after all the values are init'ed. */
 	atomisp_save_iunit_reg(isp);
 
-	pm_runtime_put_noidle(&dev->dev);
-	pm_runtime_allow(&dev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 
 	hmm_init_mem_stat(repool_pgnr, dypool_enable, dypool_pgnr);
 	err = hmm_pool_register(repool_pgnr, HMM_POOL_TYPE_RESERVED);
 	if (err) {
-		dev_err(&dev->dev, "Failed to register reserved memory pool.\n");
+		dev_err(&pdev->dev, "Failed to register reserved memory pool.\n");
 		goto hmm_pool_fail;
 	}
 
 	/* Init ISP memory management */
 	hmm_init();
 
-	err = devm_request_threaded_irq(&dev->dev, dev->irq,
+	err = devm_request_threaded_irq(&pdev->dev, pdev->irq,
 					atomisp_isr, atomisp_isr_thread,
 					IRQF_SHARED, "isp_irq", isp);
 	if (err) {
-		dev_err(&dev->dev, "Failed to request irq (%d)\n", err);
+		dev_err(&pdev->dev, "Failed to request irq (%d)\n", err);
 		goto request_irq_fail;
 	}
 
@@ -1828,11 +1805,11 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	if (!defer_fw_load) {
 		err = atomisp_css_load_firmware(isp);
 		if (err) {
-			dev_err(&dev->dev, "Failed to init css.\n");
+			dev_err(&pdev->dev, "Failed to init css.\n");
 			goto css_init_fail;
 		}
 	} else {
-		dev_dbg(&dev->dev, "Skip css init.\n");
+		dev_dbg(&pdev->dev, "Skip css init.\n");
 	}
 	/* Clear FW image from memory */
 	release_firmware(isp->firmware);
@@ -1844,7 +1821,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	return 0;
 
 css_init_fail:
-	devm_free_irq(&dev->dev, dev->irq, isp);
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
 request_irq_fail:
 	hmm_cleanup();
 	hmm_pool_unregister(HMM_POOL_TYPE_RESERVED);
@@ -1858,7 +1835,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 initialize_modules_fail:
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp);
-	pci_disable_msi(dev);
+	pci_disable_msi(pdev);
 enable_msi_fail:
 fw_validation_fail:
 	release_firmware(isp->firmware);
@@ -1870,13 +1847,13 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	 * The following lines have been copied from atomisp suspend path
 	 */
 
-	pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq = irq & 1 << INTR_IIR;
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
-	pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq &= ~(1 << INTR_IER);
-	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
 	atomisp_msi_irq_uninit(isp);
 
@@ -1884,21 +1861,20 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 
 	/* Address later when we worry about the ...field chips */
 	if (IS_ENABLED(CONFIG_PM) && atomisp_mrfld_power_down(isp))
-		dev_err(&dev->dev, "Failed to switch off ISP\n");
+		dev_err(&pdev->dev, "Failed to switch off ISP\n");
 
 atomisp_dev_alloc_fail:
-	pcim_iounmap_regions(dev, 1 << ATOM_ISP_PCI_BAR);
+	pcim_iounmap_regions(pdev, 1 << ATOM_ISP_PCI_BAR);
 
 ioremap_fail:
 	return err;
 }
 
-static void atomisp_pci_remove(struct pci_dev *dev)
+static void atomisp_pci_remove(struct pci_dev *pdev)
 {
-	struct atomisp_device *isp = (struct atomisp_device *)
-				     pci_get_drvdata(dev);
+	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
-	dev_info(&dev->dev, "Removing atomisp driver\n");
+	dev_info(&pdev->dev, "Removing atomisp driver\n");
 
 	atomisp_drvfs_exit();
 
@@ -1907,8 +1883,8 @@ static void atomisp_pci_remove(struct pci_dev *dev)
 	ia_css_unload_firmware();
 	hmm_cleanup();
 
-	pm_runtime_forbid(&dev->dev);
-	pm_runtime_get_noresume(&dev->dev);
+	pm_runtime_forbid(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 
 	atomisp_msi_irq_uninit(isp);
-- 
2.27.0

