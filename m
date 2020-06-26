Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD2820B14C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgFZMVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:21:37 -0400
Received: from mga11.intel.com ([192.55.52.93]:29757 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728318AbgFZMVh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:21:37 -0400
IronPort-SDR: L4n/2vk7gf3LKJKwmFNTWLS3WT+KmZZVW3yJjPMXiwIhMSoxfS4aJdl22hmqbD/Jd8/jQAYfjZ
 Aks30eI6545A==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143544878"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="143544878"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: e1ghNnd6CDrDzq3FAgwN5ARdN1ZEMbLHST/aXv052egiztNdckj0BZvpkMisF450lfXfF6DAqb
 ZQ0ODyzOtZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="312306788"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 443FA426; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 05/15] media: atomisp: Get rid of struct pci_dev in struct atomisp_device
Date:   Fri, 26 Jun 2020 15:19:15 +0300
Message-Id: <20200626121925.14365-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct atomisp device has struct device and struct pci_dev pointers
which are basically duplicates of each other. Drop the latter
in favour of the former.

While here, unify pdev to be pointer to struct pci_device and reindent
some (touched) lines for better readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 24 +++++++++-----
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 +--
 .../media/atomisp/pci/atomisp_internal.h      |  1 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 +++++------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 33 ++++++++++---------
 5 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7b936e5a5f03..0735df75841f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -206,6 +206,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 			 enum atomisp_dfs_mode mode,
 			 bool force)
 {
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	/* FIXME! Only use subdev[0] status yet */
 	struct atomisp_sub_device *asd = &isp->asd[0];
 	const struct atomisp_dfs_config *dfs;
@@ -219,7 +220,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 		return -EINVAL;
 	}
 
-	if ((isp->pdev->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
+	if ((pdev->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
 	    ATOMISP_PCI_DEVICE_SOC_CHT && ATOMISP_USE_YUVPP(asd))
 		isp->dfs = &dfs_config_cht_soc;
 
@@ -357,8 +358,9 @@ static void clear_isp_irq(enum hrt_isp_css_irq irq)
 	irq_clear_all(IRQ0_ID);
 }
 
-void atomisp_msi_irq_init(struct atomisp_device *isp, struct pci_dev *dev)
+void atomisp_msi_irq_init(struct atomisp_device *isp)
 {
+	struct pci_dev *dev = to_pci_dev(isp->dev);
 	u32 msg32;
 	u16 msg16;
 
@@ -375,8 +377,9 @@ void atomisp_msi_irq_init(struct atomisp_device *isp, struct pci_dev *dev)
 	pci_write_config_word(dev, PCI_COMMAND, msg16);
 }
 
-void atomisp_msi_irq_uninit(struct atomisp_device *isp, struct pci_dev *dev)
+void atomisp_msi_irq_uninit(struct atomisp_device *isp)
 {
+	struct pci_dev *dev = to_pci_dev(isp->dev);
 	u32 msg32;
 	u16 msg16;
 
@@ -480,11 +483,12 @@ static void print_csi_rx_errors(enum mipi_port_id port,
 /* Clear irq reg */
 static void clear_irq_reg(struct atomisp_device *isp)
 {
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	u32 msg_ret;
 
-	pci_read_config_dword(isp->pdev, PCI_INTERRUPT_CTRL, &msg_ret);
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &msg_ret);
 	msg_ret |= 1 << INTR_IIR;
-	pci_write_config_dword(isp->pdev, PCI_INTERRUPT_CTRL, msg_ret);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, msg_ret);
 }
 
 static struct atomisp_sub_device *
@@ -1289,6 +1293,7 @@ void atomisp_delayed_init_work(struct work_struct *work)
 
 static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 {
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
 	bool stream_restart[MAX_STREAM_NUM] = {0};
 	bool depth_mode = false;
@@ -1372,8 +1377,8 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 	clear_isp_irq(hrt_isp_css_irq_sp);
 
 	/* Set the SRSE to 3 before resetting */
-	pci_write_config_dword(isp->pdev, PCI_I_CONTROL, isp->saved_regs.i_control |
-			       MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
+	pci_write_config_dword(pdev, PCI_I_CONTROL,
+			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
 
 	/* reset ISP and restore its state */
 	isp->isp_timeout = true;
@@ -6158,6 +6163,7 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 /*Turn off ISP dphy */
 int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 {
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	unsigned long flags;
 	u32 reg;
 
@@ -6179,9 +6185,9 @@ int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 	 * MRFLD HW design need all CSI ports are disabled before
 	 * powering down the IUNIT.
 	 */
-	pci_read_config_dword(isp->pdev, MRFLD_PCI_CSI_CONTROL, &reg);
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, &reg);
 	reg |= MRFLD_ALL_CSI_PORTS_OFF_MASK;
-	pci_write_config_dword(isp->pdev, MRFLD_PCI_CSI_CONTROL, reg);
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, reg);
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 0bde995f1a8d..1c0d464c2ac1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -68,8 +68,8 @@ bool atomisp_buffers_queued_pipe(struct atomisp_video_pipe *pipe);
 /*
  * Interrupt functions
  */
-void atomisp_msi_irq_init(struct atomisp_device *isp, struct pci_dev *dev);
-void atomisp_msi_irq_uninit(struct atomisp_device *isp, struct pci_dev *dev);
+void atomisp_msi_irq_init(struct atomisp_device *isp);
+void atomisp_msi_irq_uninit(struct atomisp_device *isp);
 void atomisp_wdt_work(struct work_struct *work);
 void atomisp_wdt(struct timer_list *t);
 void atomisp_setup_flash(struct atomisp_sub_device *asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index ff3becd41110..5af9bbce6284 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -216,7 +216,6 @@ struct atomisp_sw_contex {
  * ci device struct
  */
 struct atomisp_device {
-	struct pci_dev *pdev;
 	struct device *dev;
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9404a678fa6f..f8d616f08b51 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -549,8 +549,7 @@ static int atomisp_querycap(struct file *file, void *fh,
 
 	strscpy(cap->driver, DRIVER, sizeof(cap->driver));
 	strscpy(cap->card, CARD, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
-		 pci_name(isp->pdev));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", dev_name(isp->dev));
 
 	return 0;
 }
@@ -1635,6 +1634,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
 	unsigned int sensor_start_stream;
 	unsigned int wdt_duration = ATOMISP_ISP_TIMEOUT_DURATION;
@@ -1844,9 +1844,8 @@ static int atomisp_streamon(struct file *file, void *fh,
 	/* Enable the CSI interface on ANN B0/K0 */
 	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
 					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
-		pci_write_config_word(isp->pdev, MRFLD_PCI_CSI_CONTROL,
-				      isp->saved_regs.csi_control |
-				      MRFLD_PCI_CSI_CONTROL_CSI_READY);
+		pci_write_config_word(pdev, MRFLD_PCI_CSI_CONTROL,
+				      isp->saved_regs.csi_control | MRFLD_PCI_CSI_CONTROL_CSI_READY);
 	}
 
 	/* stream on the sensor */
@@ -1891,6 +1890,7 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_video_pipe *capture_pipe = NULL;
@@ -2076,9 +2076,8 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	/* Disable the CSI interface on ANN B0/K0 */
 	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
 					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
-		pci_write_config_word(isp->pdev, MRFLD_PCI_CSI_CONTROL,
-				      isp->saved_regs.csi_control &
-				      ~MRFLD_PCI_CSI_CONTROL_CSI_READY);
+		pci_write_config_word(pdev, MRFLD_PCI_CSI_CONTROL,
+				      isp->saved_regs.csi_control & ~MRFLD_PCI_CSI_CONTROL_CSI_READY);
 	}
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, false))
@@ -2111,8 +2110,8 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		}
 
 		/* disable  PUNIT/ISP acknowlede/handshake - SRSE=3 */
-		pci_write_config_dword(isp->pdev, PCI_I_CONTROL, isp->saved_regs.i_control |
-				       MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
+		pci_write_config_dword(pdev, PCI_I_CONTROL,
+				       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
 		dev_err(isp->dev, "atomisp_reset");
 		atomisp_reset(isp);
 		for (i = 0; i < isp->num_of_streams; i++) {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c6996b1f228b..3ae9058b32ec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -512,7 +512,7 @@ void atomisp_acc_unregister(struct atomisp_acc_pipe *video)
 
 static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = isp->pdev;
+	struct pci_dev *dev = to_pci_dev(isp->dev);
 
 	dev_dbg(isp->dev, "%s\n", __func__);
 
@@ -573,7 +573,7 @@ static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 
 static int __maybe_unused atomisp_restore_iunit_reg(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = isp->pdev;
+	struct pci_dev *dev = to_pci_dev(isp->dev);
 
 	dev_dbg(isp->dev, "%s\n", __func__);
 
@@ -619,7 +619,7 @@ static int __maybe_unused atomisp_restore_iunit_reg(struct atomisp_device *isp)
 
 static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 {
-	struct pci_dev *dev = isp->pdev;
+	struct pci_dev *dev = to_pci_dev(isp->dev);
 	u32 irq;
 	unsigned long flags;
 
@@ -679,7 +679,7 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	irq &= ~(1 << INTR_IER);
 	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
 
-	atomisp_msi_irq_uninit(isp, dev);
+	atomisp_msi_irq_uninit(isp);
 	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
 	spin_unlock_irqrestore(&isp->lock, flags);
 
@@ -902,6 +902,7 @@ static int __maybe_unused atomisp_resume(struct device *dev)
 
 int atomisp_csi_lane_config(struct atomisp_device *isp)
 {
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	static const struct {
 		u8 code;
 		u8 lanes[MRFLD_PORT_NUM];
@@ -1003,7 +1004,7 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 		return -EINVAL;
 	}
 
-	pci_read_config_dword(isp->pdev, MRFLD_PCI_CSI_CONTROL, &csi_control);
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, &csi_control);
 	csi_control &= ~port_config_mask;
 	csi_control |= (portconfigs[i].code << MRFLD_PORT_CONFIGCODE_SHIFT)
 		       | (portconfigs[i].lanes[0] ? 0 : (1 << MRFLD_PORT1_ENABLE_SHIFT))
@@ -1013,7 +1014,7 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 		       | (((1 << portconfigs[i].lanes[1]) - 1) << MRFLD_PORT2_LANES_SHIFT)
 		       | (((1 << portconfigs[i].lanes[2]) - 1) << port3_lanes_shift);
 
-	pci_write_config_dword(isp->pdev, MRFLD_PCI_CSI_CONTROL, csi_control);
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, csi_control);
 
 	dev_dbg(isp->dev,
 		"%s: the portconfig is %d-%d-%d, CSI_CONTROL is 0x%08X\n",
@@ -1587,7 +1588,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		err = -ENOMEM;
 		goto atomisp_dev_alloc_fail;
 	}
-	isp->pdev = dev;
+
 	isp->dev = &dev->dev;
 	isp->sw_contex.power_state = ATOM_ISP_POWER_UP;
 	isp->saved_regs.ispmmadr = start;
@@ -1597,7 +1598,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	spin_lock_init(&isp->lock);
 
 	/* This is not a true PCI device on SoC, so the delay is not needed. */
-	isp->pdev->d3_delay = 0;
+	dev->d3_delay = 0;
 
 	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
 	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
@@ -1656,7 +1657,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		 * in power off. Set d3cold_delay to 0 since default 100ms is not
 		 * necessary.
 		 */
-		isp->pdev->d3cold_delay = 0;
+		dev->d3cold_delay = 0;
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_ANN:
 		isp->media_dev.hw_revision = (
@@ -1666,7 +1667,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 						 ATOMISP_HW_REVISION_ISP2401_LEGACY
 #endif
 						 << ATOMISP_HW_REVISION_SHIFT);
-		isp->media_dev.hw_revision |= isp->pdev->revision < 2 ?
+		isp->media_dev.hw_revision |= dev->revision < 2 ?
 					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
 		isp->dfs = &dfs_config_merr;
 		isp->hpll_freq = HPLL_FREQ_1600MHZ;
@@ -1679,11 +1680,11 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 						 ATOMISP_HW_REVISION_ISP2401_LEGACY
 #endif
 						 << ATOMISP_HW_REVISION_SHIFT);
-		isp->media_dev.hw_revision |= isp->pdev->revision < 2 ?
+		isp->media_dev.hw_revision |= dev->revision < 2 ?
 					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
 
 		isp->dfs = &dfs_config_cht;
-		isp->pdev->d3cold_delay = 0;
+		dev->d3cold_delay = 0;
 
 		iosf_mbi_read(BT_MBI_UNIT_CCK, MBI_REG_READ, CCK_FUSE_REG_0, &val);
 		switch (val & CCK_FUSE_HPLL_FREQ_MASK) {
@@ -1741,7 +1742,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		goto enable_msi_fail;
 	}
 
-	atomisp_msi_irq_init(isp, dev);
+	atomisp_msi_irq_init(isp);
 
 	cpu_latency_qos_add_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -1856,7 +1857,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	atomisp_uninitialize_modules(isp);
 initialize_modules_fail:
 	cpu_latency_qos_remove_request(&isp->pm_qos);
-	atomisp_msi_irq_uninit(isp, dev);
+	atomisp_msi_irq_uninit(isp);
 	pci_disable_msi(dev);
 enable_msi_fail:
 fw_validation_fail:
@@ -1877,7 +1878,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	irq &= ~(1 << INTR_IER);
 	pci_write_config_dword(dev, PCI_INTERRUPT_CTRL, irq);
 
-	atomisp_msi_irq_uninit(isp, dev);
+	atomisp_msi_irq_uninit(isp);
 
 	atomisp_ospm_dphy_down(isp);
 
@@ -1910,7 +1911,7 @@ static void atomisp_pci_remove(struct pci_dev *dev)
 	pm_runtime_get_noresume(&dev->dev);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 
-	atomisp_msi_irq_uninit(isp, dev);
+	atomisp_msi_irq_uninit(isp);
 	atomisp_unregister_entities(isp);
 
 	destroy_workqueue(isp->wdt_work_queue);
-- 
2.27.0

