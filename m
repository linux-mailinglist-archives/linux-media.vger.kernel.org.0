Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAEE1E8E94
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgE3G5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728848AbgE3G4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B819021883;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=wCDBIzjqzhZ/d4K5eGDiOf5Pm6lgLZ8FMLxcABcMHPc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rggABJFc4GRUfVgeOUTTTADGJ4v0cPCP68kGiuEyuuF1DyzbLpqTfA6Q3Pl9b8+EM
         Xx7aoRG4rBMrvU4V4z/erH/OFYPuJN0F4DFaN+T13+zFHlLdQ4eDpoxbMlbmIcb3/b
         A94X12BwzjTA1iFX2ri3/Ha8wsY0/i3VINLlwIgo=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hqF-M6; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <trivial@kernel.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 28/41] media: atomisp: remove some trivial wrappers from compat css20
Date:   Sat, 30 May 2020 08:55:45 +0200
Message-Id: <5df66951743b0e03efa24f2afacd7bd7fecc4258.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are tons of code inside atomisp_compat_css20.c, but
several of them are just trivial wrappers to other functions.

Getting rid of all of them will take some time, but let's
start getting rid of some of the trivial ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  5 +-
 .../media/atomisp/pci/atomisp_compat.h        | 10 +--
 .../media/atomisp/pci/atomisp_compat_css20.c  | 72 ++-----------------
 .../media/atomisp/pci/atomisp_compat_css20.h  |  6 --
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  4 +-
 .../staging/media/atomisp/pci/atomisp_drvfs.c |  5 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  2 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 15 ++--
 .../media/atomisp/pci/mmu/sh_mmu_mrfld.c      |  2 +-
 .../media/atomisp/pci/sh_css_firmware.c       |  8 +--
 11 files changed, 35 insertions(+), 98 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5f34e7586ee4..2758c2da60da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -57,6 +57,7 @@
 
 #include "ia_css_types.h"
 #include "ia_css_stream.h"
+#include "ia_css_debug.h"
 #include "error_support.h"
 #include "bits.h"
 
@@ -1503,8 +1504,8 @@ void atomisp_wdt_work(struct work_struct *work)
 	}
 
 	if (css_recover) {
-		atomisp_css_debug_dump_sp_sw_debug_info();
-		atomisp_css_debug_dump_debug_info(__func__);
+		ia_css_debug_dump_sp_sw_debug_info();
+		ia_css_debug_dump_debug_info(__func__);
 		for (i = 0; i < isp->num_of_streams; i++) {
 			struct atomisp_sub_device *asd = &isp->asd[i];
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 8693f228a875..87677e1117ff 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -34,11 +34,7 @@ struct atomisp_metadata_buf {
 	struct list_head list;
 };
 
-void atomisp_css_debug_dump_sp_sw_debug_info(void);
-void atomisp_css_debug_dump_debug_info(const char *context);
-void atomisp_css_debug_set_dtrace_level(const unsigned int trace_level);
-
-void atomisp_store_uint32(hrt_address addr, uint32_t data);
+void atomisp_css2_hw_store_32(hrt_address addr, uint32_t data);
 void atomisp_load_uint32(hrt_address addr, uint32_t *data);
 
 int atomisp_css_init(struct atomisp_device *isp);
@@ -84,9 +80,9 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 				enum atomisp_input_stream_id stream_id,
 				enum ia_css_pipe_id css_pipe_id);
 
-void atomisp_css_mmu_invalidate_cache(void);
+void ia_css_mmu_invalidate_cache(void);
 
-void atomisp_css_mmu_invalidate_tlb(void);
+void ia_css_mmu_invalidate_cache(void);
 
 int atomisp_css_start(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index f7c3fdd5f670..59228d711048 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -66,26 +66,6 @@ struct bayer_ds_factor {
 	unsigned int denominator;
 };
 
-void atomisp_css_debug_dump_sp_sw_debug_info(void)
-{
-	ia_css_debug_dump_sp_sw_debug_info();
-}
-
-void atomisp_css_debug_dump_debug_info(const char *context)
-{
-	ia_css_debug_dump_debug_info(context);
-}
-
-void atomisp_css_debug_set_dtrace_level(const unsigned int trace_level)
-{
-	ia_css_debug_set_dtrace_level(trace_level);
-}
-
-unsigned int atomisp_css_debug_get_dtrace_level(void)
-{
-	return dbg_level;
-}
-
 static void atomisp_css2_hw_store_8(hrt_address addr, uint8_t data)
 {
 	unsigned long flags;
@@ -104,7 +84,7 @@ static void atomisp_css2_hw_store_16(hrt_address addr, uint16_t data)
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
-static void atomisp_css2_hw_store_32(hrt_address addr, uint32_t data)
+void atomisp_css2_hw_store_32(hrt_address addr, uint32_t data)
 {
 	unsigned long flags;
 
@@ -191,11 +171,6 @@ static int atomisp_css2_err_print(const char *fmt, va_list args)
 	return 0;
 }
 
-void atomisp_store_uint32(hrt_address addr, uint32_t data)
-{
-	atomisp_css2_hw_store_32(addr, data);
-}
-
 void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 {
 	*data = atomisp_css2_hw_load_32(addr);
@@ -213,16 +188,6 @@ static int hmm_get_mmu_base_addr(unsigned int *mmu_base_addr)
 	return 0;
 }
 
-static void atomisp_isp_parameters_clean_up(
-    struct ia_css_isp_config *config)
-{
-	/*
-	 * Set NULL to configs pointer to avoid they are set into isp again when
-	 * some configs are changed and need to be updated later.
-	 */
-	memset(config, 0, sizeof(*config));
-}
-
 static void __dump_pipe_config(struct atomisp_sub_device *asd,
 			       struct atomisp_stream_env *stream_env,
 			       unsigned int pipe_id)
@@ -905,14 +870,6 @@ static inline int __set_css_print_env(struct atomisp_device *isp, int opt)
 	return ret;
 }
 
-int atomisp_css_check_firmware_version(struct atomisp_device *isp)
-{
-	if (!sh_css_check_firmware_version(isp->dev, (void *)isp->firmware->data)) {
-		return -EINVAL;
-	}
-	return 0;
-}
-
 int atomisp_css_load_firmware(struct atomisp_device *isp)
 {
 	enum ia_css_err err;
@@ -952,11 +909,6 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 	return 0;
 }
 
-void atomisp_css_unload_firmware(struct atomisp_device *isp)
-{
-	ia_css_unload_firmware();
-}
-
 void atomisp_css_uninit(struct atomisp_device *isp)
 {
 	struct atomisp_sub_device *asd;
@@ -964,7 +916,7 @@ void atomisp_css_uninit(struct atomisp_device *isp)
 
 	for (i = 0; i < isp->num_of_streams; i++) {
 		asd = &isp->asd[i];
-		atomisp_isp_parameters_clean_up(&asd->params.config);
+		memset(&asd->params.config, 0, sizeof(asd->params.config));
 		asd->params.css_update_params_needed = false;
 	}
 
@@ -1152,16 +1104,6 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-void atomisp_css_mmu_invalidate_cache(void)
-{
-	ia_css_mmu_invalidate_cache();
-}
-
-void atomisp_css_mmu_invalidate_tlb(void)
-{
-	ia_css_mmu_invalidate_cache();
-}
-
 int atomisp_css_start(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset)
 {
@@ -1285,7 +1227,7 @@ void atomisp_css_update_isp_params(struct atomisp_sub_device *asd)
 	ia_css_stream_set_isp_config(
 	    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
 	    &asd->params.config);
-	atomisp_isp_parameters_clean_up(&asd->params.config);
+	memset(&asd->params.config, 0, sizeof(asd->params.config));
 }
 
 void atomisp_css_update_isp_params_on_pipe(struct atomisp_sub_device *asd,
@@ -1309,7 +1251,7 @@ void atomisp_css_update_isp_params_on_pipe(struct atomisp_sub_device *asd,
 	if (ret != IA_CSS_SUCCESS)
 		dev_warn(asd->isp->dev, "%s: ia_css_stream_set_isp_config_on_pipe failed %d\n",
 			 __func__, ret);
-	atomisp_isp_parameters_clean_up(&asd->params.config);
+	memset(&asd->params.config, 0, sizeof(asd->params.config));
 }
 
 int atomisp_css_queue_buffer(struct atomisp_sub_device *asd,
@@ -2264,7 +2206,7 @@ int atomisp_css_stop(struct atomisp_sub_device *asd,
 			ia_css_stream_config_defaults(
 			    &stream_env->stream_config);
 		}
-		atomisp_isp_parameters_clean_up(&asd->params.config);
+		memset(&asd->params.config, 0, sizeof(asd->params.config));
 		asd->params.css_update_params_needed = false;
 	}
 
@@ -4215,8 +4157,8 @@ int atomisp_css_wait_acc_finish(struct atomisp_sub_device *asd)
 	if (wait_for_completion_interruptible_timeout(&asd->acc.acc_done,
 		ATOMISP_ISP_TIMEOUT_DURATION) == 0) {
 		dev_err(isp->dev, "<%s: completion timeout\n", __func__);
-		atomisp_css_debug_dump_sp_sw_debug_info();
-		atomisp_css_debug_dump_debug_info(__func__);
+		ia_css_debug_dump_sp_sw_debug_info();
+		ia_css_debug_dump_debug_info(__func__);
 		ret = -EIO;
 	}
 	rt_mutex_lock(&isp->mutex);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index ba8e6aed12de..e8b330dacba9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -155,17 +155,11 @@ void atomisp_css_set_b_gamma_table(struct atomisp_sub_device *asd,
 void atomisp_css_set_anr_thres(struct atomisp_sub_device *asd,
 			       struct ia_css_anr_thres *anr_thres);
 
-int atomisp_css_check_firmware_version(struct atomisp_device *isp);
-
 int atomisp_css_load_firmware(struct atomisp_device *isp);
 
-void atomisp_css_unload_firmware(struct atomisp_device *isp);
-
 void atomisp_css_set_dvs_6axis(struct atomisp_sub_device *asd,
 			       struct ia_css_dvs_6axis_config *dvs_6axis);
 
-unsigned int atomisp_css_debug_get_dtrace_level(void);
-
 int atomisp_css_debug_dump_isp_binary(void);
 
 int atomisp_css_dump_sp_raw_copy_linecount(bool reduced);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index a2638863206e..24e421e3009d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -384,9 +384,9 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
-		atomisp_store_uint32(base + CSI2_REG_RX_CSI_DLY_CNT_TERMEN,
+		atomisp_css2_hw_store_32(base + CSI2_REG_RX_CSI_DLY_CNT_TERMEN,
 				     n == 0 ? clk_termen : dat_termen);
-		atomisp_store_uint32(base + CSI2_REG_RX_CSI_DLY_CNT_SETTLE,
+		atomisp_css2_hw_store_32(base + CSI2_REG_RX_CSI_DLY_CNT_SETTLE,
 				     n == 0 ? clk_settle : dat_settle);
 	}
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 4a6ea021ddcc..f14c7673653c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -24,6 +24,7 @@
 #include "atomisp_ioctl.h"
 #include "atomisp_drvfs.h"
 #include "hmm/hmm.h"
+#include "ia_css_debug.h"
 
 /*
  * _iunit_debug:
@@ -94,7 +95,7 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 
 static ssize_t iunit_dbglvl_show(struct device_driver *drv, char *buf)
 {
-	iunit_debug.dbglvl = atomisp_css_debug_get_dtrace_level();
+	iunit_debug.dbglvl = dbg_level;
 	return sprintf(buf, "dtrace level:%u\n", iunit_debug.dbglvl);
 }
 
@@ -106,7 +107,7 @@ static ssize_t iunit_dbglvl_store(struct device_driver *drv, const char *buf,
 	    || iunit_debug.dbglvl > 9) {
 		return -ERANGE;
 	}
-	atomisp_css_debug_set_dtrace_level(iunit_debug.dbglvl);
+	ia_css_debug_set_dtrace_level(iunit_debug.dbglvl);
 
 	return size;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 1588e84a6b91..3e5806403b31 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -997,7 +997,7 @@ static int atomisp_release(struct file *file)
 	atomisp_css_uninit(isp);
 
 	if (defer_fw_load) {
-		atomisp_css_unload_firmware(isp);
+		ia_css_unload_firmware();
 		isp->css_env.isp_css_fw.data = NULL;
 		isp->css_env.isp_css_fw.bytes = 0;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 765e1a8c31fa..d02c500d53b7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1619,9 +1619,9 @@ static void atomisp_dma_burst_len_cfg(struct atomisp_sub_device *asd)
 				       ATOMISP_SUBDEV_PAD_SINK);
 
 	if (sink->width * sink->height >= 4096 * 3072)
-		atomisp_store_uint32(DMA_BURST_SIZE_REG, 0x7F);
+		atomisp_css2_hw_store_32(DMA_BURST_SIZE_REG, 0x7F);
 	else
-		atomisp_store_uint32(DMA_BURST_SIZE_REG, 0x00);
+		atomisp_css2_hw_store_32(DMA_BURST_SIZE_REG, 0x00);
 }
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 374b1bb6c339..719ded53ffd8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -42,6 +42,8 @@
 #include "hmm/hmm.h"
 #include "atomisp_trace_event.h"
 
+#include "sh_css_firmware.h"
+
 #include "device_access.h"
 
 /* Timeouts to wait for all subdevs to be registered */
@@ -657,7 +659,7 @@ static int __maybe_unused atomisp_restore_iunit_reg(struct atomisp_device *isp)
 	 * which has bugs(like sighting:4567697 and 4567699) and
 	 * will be removed in B0
 	 */
-	atomisp_store_uint32(MRFLD_CSI_RECEIVER_SELECTION_REG, 1);
+	atomisp_css2_hw_store_32(MRFLD_CSI_RECEIVER_SELECTION_REG, 1);
 	return 0;
 }
 
@@ -687,7 +689,7 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	if (!(irq & (1 << INTR_IIR)))
 		goto done;
 
-	atomisp_store_uint32(MRFLD_INTR_CLEAR_REG, 0xFFFFFFFF);
+	atomisp_css2_hw_store_32(MRFLD_INTR_CLEAR_REG, 0xFFFFFFFF);
 	atomisp_load_uint32(MRFLD_INTR_STATUS_REG, &irq);
 	if (irq != 0) {
 		dev_err(isp->dev,
@@ -702,7 +704,7 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 
 		pci_read_config_dword(dev, PCI_INTERRUPT_CTRL, &irq);
 		if (!(irq & (1 << INTR_IIR))) {
-			atomisp_store_uint32(MRFLD_INTR_ENABLE_REG, 0x0);
+			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
 			goto done;
 		}
 		dev_err(isp->dev,
@@ -1763,7 +1765,8 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 			goto load_fw_fail;
 		}
 
-		err = atomisp_css_check_firmware_version(isp);
+		err = sh_css_check_firmware_version(isp->dev,
+						    isp->firmware->data);
 		if (err) {
 			dev_dbg(&dev->dev, "Firmware version check failed\n");
 			goto fw_validation_fail;
@@ -1792,7 +1795,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	 * bugs(like sighting:4567697 and 4567699) and will be removed
 	 * in B0
 	 */
-	atomisp_store_uint32(MRFLD_CSI_RECEIVER_SELECTION_REG, 1);
+	atomisp_css2_hw_store_32(MRFLD_CSI_RECEIVER_SELECTION_REG, 1);
 
 	if ((id->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
 	    ATOMISP_PCI_DEVICE_SOC_MRFLD) {
@@ -1943,7 +1946,7 @@ static void atomisp_pci_remove(struct pci_dev *dev)
 
 	atomisp_acc_cleanup(isp);
 
-	atomisp_css_unload_firmware(isp);
+	ia_css_unload_firmware();
 	hmm_cleanup();
 
 	pm_runtime_forbid(&dev->dev);
diff --git a/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c b/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
index 0f55978ad2bd..2e5ce822f55b 100644
--- a/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
+++ b/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
@@ -62,7 +62,7 @@ static unsigned int sh_get_pd_base(struct isp_mmu *mmu,
  */
 static void sh_tlb_flush(struct isp_mmu *mmu)
 {
-	atomisp_css_mmu_invalidate_cache();
+	ia_css_mmu_invalidate_cache();
 }
 
 struct isp_mmu_client sh_mmu_mrfld = {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index ee23d28b1bef..ddeb953a93cf 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -203,7 +203,7 @@ sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 	}
 
 	/* For now, let's just accept a wrong version, even if wrong */
-	return true;
+	return 0;
 }
 
 enum ia_css_err
@@ -212,7 +212,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	unsigned int i;
 	struct ia_css_fw_info *binaries;
 	struct sh_css_fw_bi_file_h *file_header;
-	bool valid_firmware = false;
+	int ret;
 	const char *release_version;
 
 	if (!atomisp_hw_is_isp2401)
@@ -224,8 +224,8 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	file_header = &firmware_header->file_header;
 	binaries = &firmware_header->binary_header;
 	strscpy(FW_rel_ver_name, file_header->version, min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
-	valid_firmware = sh_css_check_firmware_version(dev, fw_data);
-	if (!valid_firmware) {
+	ret = sh_css_check_firmware_version(dev, fw_data);
+	if (ret) {
 		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
 			     file_header->version, release_version);
 		return IA_CSS_ERR_VERSION_MISMATCH;
-- 
2.26.2

