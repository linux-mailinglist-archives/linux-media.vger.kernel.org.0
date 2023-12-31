Return-Path: <linux-media+bounces-3117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A2820B01
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C5B71C21399
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85313D70;
	Sun, 31 Dec 2023 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TksYbddg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7936033CE
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+osCbdvrG1x7tsiXvrTIbEHYlquQIKkUtMcYRL+hNvw=;
	b=TksYbddgFQL101o9yNrc1ZKvq4TKSb6YTwqFfTXGhjXU8KYQbCusBFxX2Rn1PNqZ59C4wZ
	MjIh+hnOTvPciPyHmYSdfvhCe04FQRwqrO8e+4vDCBEPWN+uFAMK0BblKXlBf+Om6Zv6Pf
	CGACkqDrvmlNEQtk+7LTer6s3OhLToM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-gXLTiZL7OrKGfb4rQQrBzQ-1; Sun,
 31 Dec 2023 05:31:15 -0500
X-MC-Unique: gXLTiZL7OrKGfb4rQQrBzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58B632812FF3;
	Sun, 31 Dec 2023 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D53B7492BC6;
	Sun, 31 Dec 2023 10:31:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/15] media: atomisp: Remove remaining deferred firmware loading code
Date: Sun, 31 Dec 2023 11:30:46 +0100
Message-ID: <20231231103057.35837-5-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

There is a bunch of dead code left from the deferred firmware loading
support which was removed in commit 8972ed6ea7a0 ("media: atomisp: Remove
deferred firmware loading support").

Remove this dead code:
- Remove the skip_fwload module parameter
- Remove the now always NULL fw argument from ia_css_init()
- Remove the fw_explicitly_loaded boolean from sh_css.c
  (this was always true now)
- Adjust some function kernel-doc comments to match

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  9 -----
 .../media/atomisp/pci/ia_css_control.h        | 29 +++++-----------
 .../media/atomisp/pci/ia_css_firmware.h       |  6 ++--
 drivers/staging/media/atomisp/pci/sh_css.c    | 33 ++-----------------
 5 files changed, 14 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 02f06294bbfe..6fe8b0b7467a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -757,7 +757,7 @@ int atomisp_css_init(struct atomisp_device *isp)
 		return ret;
 
 	/* Init ISP */
-	err = ia_css_init(isp->dev, &isp->css_env.isp_css_env, NULL,
+	err = ia_css_init(isp->dev, &isp->css_env.isp_css_env,
 			  (uint32_t)mmu_base_addr, IA_CSS_IRQ_TYPE_PULSE);
 	if (err) {
 		dev_err(isp->dev, "css init failed --- bad firmware?\n");
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 547e1444ad97..206fdaee5952 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -55,10 +55,6 @@
 /* G-Min addition: pull this in from intel_mid_pm.h */
 #define CSTATE_EXIT_LATENCY_C1  1
 
-static uint skip_fwload;
-module_param(skip_fwload, uint, 0644);
-MODULE_PARM_DESC(skip_fwload, "Skip atomisp firmware load");
-
 /* cross componnet debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
@@ -1161,9 +1157,6 @@ atomisp_load_firmware(struct atomisp_device *isp)
 	int rc;
 	char *fw_path = NULL;
 
-	if (skip_fwload)
-		return NULL;
-
 	if (firmware_name[0] != '\0') {
 		fw_path = firmware_name;
 	} else {
@@ -1591,8 +1584,6 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 
 	atomisp_msi_irq_uninit(isp);
 	atomisp_unregister_entities(isp);
-
-	release_firmware(isp->firmware);
 }
 
 static const struct pci_device_id atomisp_pci_tbl[] = {
diff --git a/drivers/staging/media/atomisp/pci/ia_css_control.h b/drivers/staging/media/atomisp/pci/ia_css_control.h
index 88f031a63ba2..6a473459b346 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_control.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_control.h
@@ -30,39 +30,28 @@
  *				environment in which the CSS code runs. This is
  *				used for host side memory access and message
  *				printing. May not be NULL.
- * @param[in]	fw		Firmware package containing the firmware for all
- *				predefined ISP binaries.
- *				if fw is NULL the firmware must be loaded before
- *				through a call of ia_css_load_firmware
  * @param[in]	l1_base         Base index (isp2400)
  *                              of the L1 page table. This is a physical
  *                              address or index.
  * @param[in]	irq_type	The type of interrupt to be used (edge or level)
- * @return				Returns -EINVAL in case of any
+ * @return			Returns -EINVAL in case of any
  *				errors and 0 otherwise.
  *
  * This function initializes the API which includes allocating and initializing
- * internal data structures. This also interprets the firmware package. All
- * contents of this firmware package are copied into local data structures, so
- * the fw pointer could be freed after this function completes.
+ * internal data structures.
+ * ia_css_load_firmware() must be called to load the firmware before calling
+ * this function.
  */
 int ia_css_init(struct device           *dev,
-			    const struct ia_css_env *env,
-			    const struct ia_css_fw  *fw,
-			    u32                     l1_base,
-			    enum ia_css_irq_type    irq_type);
+		const struct ia_css_env *env,
+		u32                     l1_base,
+		enum ia_css_irq_type    irq_type);
 
 /* @brief Un-initialize the CSS API.
  * @return	None
  *
- * This function deallocates all memory that has been allocated by the CSS API
- * Exception: if you explicitly loaded firmware through ia_css_load_firmware
- * you need to call ia_css_unload_firmware to deallocate the memory reserved
- * for the firmware.
- * After this function is called, no other CSS functions should be called
- * with the exception of ia_css_init which will re-initialize the CSS code,
- * ia_css_unload_firmware to unload the firmware or ia_css_load_firmware
- * to load new firmware
+ * This function deallocates all memory that has been allocated by the CSS API.
+ * After this function is called, no other CSS functions should be called.
  */
 void
 ia_css_uninit(void);
diff --git a/drivers/staging/media/atomisp/pci/ia_css_firmware.h b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
index 01d2faf557cf..d3a66128b4de 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
@@ -46,10 +46,6 @@ struct device;
  * This function interprets the firmware package. All
  * contents of this firmware package are copied into local data structures, so
  * the fw pointer could be freed after this function completes.
- *
- * Rationale for this function is that it can be called before ia_css_init, and thus
- * speeds up ia_css_init (ia_css_init is called each time a stream is created but the
- * firmware only needs to be loaded once).
  */
 int
 ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
@@ -61,6 +57,8 @@ ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
  * This function unloads the firmware loaded by ia_css_load_firmware.
  * It is pointless to call this function if no firmware is loaded,
  * but it won't harm. Use this to deallocate all memory associated with the firmware.
+ * This function may only be called when the CSS API is in uninitialized state
+ * (e.g. after calling ia_css_uninit()).
  */
 void
 ia_css_unload_firmware(void);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index f35c90809414..1d1fbda75da1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -174,8 +174,6 @@ static struct sh_css_hmm_buffer_record hmm_buffer_record[MAX_HMM_BUFFER_NUM];
 
 #define GPIO_FLASH_PIN_MASK BIT(HIVE_GPIO_STROBE_TRIGGER_PIN)
 
-static bool fw_explicitly_loaded;
-
 /*
  * Local prototypes
  */
@@ -1360,7 +1358,6 @@ ia_css_unload_firmware(void)
 		ia_css_binary_uninit();
 		sh_css_unload_firmware();
 	}
-	fw_explicitly_loaded = false;
 }
 
 static void
@@ -1405,13 +1402,9 @@ ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
 		my_css.flush = env->cpu_mem_env.flush;
 	}
 
-	ia_css_unload_firmware(); /* in case we are called twice */
 	err = sh_css_load_firmware(dev, fw->data, fw->bytes);
-	if (!err) {
+	if (!err)
 		err = ia_css_binary_init_infos();
-		if (!err)
-			fw_explicitly_loaded = true;
-	}
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_load_firmware() leave\n");
 	return err;
@@ -1419,9 +1412,7 @@ ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
 
 int
 ia_css_init(struct device *dev, const struct ia_css_env *env,
-	    const struct ia_css_fw  *fw,
-	    u32                 mmu_l1_base,
-	    enum ia_css_irq_type     irq_type)
+	    u32 mmu_l1_base, enum ia_css_irq_type irq_type)
 {
 	int err;
 	ia_css_spctrl_cfg spctrl_cfg;
@@ -1466,8 +1457,6 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	/* Check struct ia_css_init_dmem_cfg */
 	COMPILATION_ERROR_IF(sizeof(struct ia_css_sp_init_dmem_cfg)		!= SIZE_OF_IA_CSS_SP_INIT_DMEM_CFG_STRUCT);
 
-	if (!fw && !fw_explicitly_loaded)
-		return -EINVAL;
 	if (!env)
 		return -EINVAL;
 
@@ -1543,22 +1532,7 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
-	if (fw) {
-		ia_css_unload_firmware(); /* in case we already had firmware loaded */
-		err = sh_css_load_firmware(dev, fw->data, fw->bytes);
-		if (err) {
-			IA_CSS_LEAVE_ERR(err);
-			return err;
-		}
-		err = ia_css_binary_init_infos();
-		if (err) {
-			IA_CSS_LEAVE_ERR(err);
-			return err;
-		}
-		fw_explicitly_loaded = false;
 
-		my_css_save.loaded_fw = (struct ia_css_fw *)fw;
-	}
 	if (!sh_css_setup_spctrl_config(&sh_css_sp_fw, SP_PROG_NAME, &spctrl_cfg))
 		return -EINVAL;
 
@@ -2163,9 +2137,6 @@ ia_css_uninit(void)
 		ifmtr_set_if_blocking_mode_reset = true;
 	}
 
-	if (!fw_explicitly_loaded)
-		ia_css_unload_firmware();
-
 	ia_css_spctrl_unload_fw(SP0_ID);
 	sh_css_sp_set_sp_running(false);
 	/* check and free any remaining mipi frames */
-- 
2.43.0


