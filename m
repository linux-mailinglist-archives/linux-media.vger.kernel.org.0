Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D428D22DC4C
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 08:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgGZGcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 02:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgGZGcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 02:32:45 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97C5C0619D2;
        Sat, 25 Jul 2020 23:32:45 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z5so7632067pgb.6;
        Sat, 25 Jul 2020 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7oq08pWsqC+7ZbxiG4oVUBRdN1rfZmC1v2wOZ7h0oaU=;
        b=J88NVTk66AGmqFQs1j4M5cz6W20FVVRdpcy+JE0CaHTtCwLrm9WPP1+M1qQE7VeN7/
         KwbAv+4C8jTc1vPw2JtTjljZHGg8T/0aY7++2hC8bDmwG22dHfWZYt3FOpS/t7Z7LBhK
         Swb76wZ0jQwsTXSvVZqfpxmv97ZGpl1KLo/jYfw8p/Wynd1v6eCu6MHpsW4zNmo39pFC
         yJPJ5DCzfxz4Nl51W4JtakDDvfYlAb/Wkk8vu7ioU1M5T11a5RkwbDxJtYSim/sjAq0X
         NBuDthn7xbjebYhxL0KEwNJrkvCcZWjYeMXCDxF8Nu5s7paywW7QH/dD3uHrhX1M3VAA
         enwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7oq08pWsqC+7ZbxiG4oVUBRdN1rfZmC1v2wOZ7h0oaU=;
        b=NZWdWJXRLlCsQ523cE6G+M9gYnlhFlTEGpMhz030Se9LziwG++PuPWS+fphs3NswmN
         iyTCCOGqiYxnaexT1CkTylOYHt9PO7tCmjuaT/lnI9IlJP6JkHso8c00+MNAEp5HUkpT
         XBksndn9cV2cmNKVcq878uPw+IKoWeMNzq775O1qUHnAl2x4xJeqL00+PlSWRE8pILFA
         lfA/wpULsG7YU5OXh88/EQ6/Z9hc+mCuWGG80YRg1lltHietrxyumZbisuVy6JproV45
         YQgDFlVmO+AmjAFN2OXlbabApPxpnqXjytmLwU0dIhpFf8DfcNv5NHRBQ3FP/wVpTchC
         u9Mw==
X-Gm-Message-State: AOAM531FDqjSRO6KrI4rMZjjD1sYiyaZqOSz1QnipUhLP9y+S5lCylkX
        B6M9XC443KwCx4UtV0+eX6Y=
X-Google-Smtp-Source: ABdhPJx3b1xpncwSGQhA+QQZa8VjfQ4BRdQr6qEdR/Re5XLzDvdlo1BAXJZ6Bj2yAWM4DgxNwESWRQ==
X-Received: by 2002:aa7:8e0c:: with SMTP id c12mr15314958pfr.38.1595745165093;
        Sat, 25 Jul 2020 23:32:45 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id v11sm12171343pfc.108.2020.07.25.23.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 23:32:44 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: fix code style issues
Date:   Sun, 26 Jul 2020 11:55:42 +0530
Message-Id: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patch fixes the warnings and errors generated after running checkpatch.pl on pci/sh_css_firmware.c

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
 .../media/atomisp/pci/sh_css_firmware.c       | 62 +++++++++++--------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index d4ab15b6d1ac..244c7c7780a3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -51,9 +51,11 @@ struct fw_param {
 
 static struct firmware_header *firmware_header;
 
-/* The string STR is a place holder
+/*
+ * The string STR is a place holder
  * which will be replaced with the actual RELEASE_VERSION
- * during package generation. Please do not modify  */
+ * during package generation. Please do not modify
+ */
 static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
 static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);
 
@@ -78,7 +80,8 @@ char *sh_css_get_fw_version(void)
 /* Setup sp/sp1 binary */
 static int
 setup_binary(struct ia_css_fw_info *fw, const char *fw_data,
-	     struct ia_css_fw_info *sh_css_fw, unsigned int binary_id) {
+	     struct ia_css_fw_info *sh_css_fw, unsigned int binary_id)
+{
 	const char *blob_data;
 
 	if ((!fw) || (!fw_data))
@@ -102,7 +105,8 @@ setup_binary(struct ia_css_fw_info *fw, const char *fw_data,
 int
 sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 		      struct ia_css_blob_descr *bd,
-		      unsigned int index) {
+		      unsigned int index)
+{
 	const char *name;
 	const unsigned char *blob;
 
@@ -110,14 +114,16 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 		return -EINVAL;
 
 	/* Special case: only one binary in fw */
-	if (!bi) bi = (const struct ia_css_fw_info *)fw;
+	if (!bi)
+		bi = (const struct ia_css_fw_info *)fw;
 
 	name = fw + bi->blob.prog_name_offset;
 	blob = (const unsigned char *)fw + bi->blob.offset;
 
 	/* sanity check */
-	if (bi->blob.size != bi->blob.text_size + bi->blob.icache_size + bi->blob.data_size + bi->blob.padding_size)
-	{
+	if (bi->blob.size !=
+		bi->blob.text_size + bi->blob.icache_size +
+			bi->blob.data_size + bi->blob.padding_size) {
 		/* sanity check, note the padding bytes added for section to DDR alignment */
 		return -EINVAL;
 	}
@@ -128,21 +134,18 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 	bd->blob = blob;
 	bd->header = *bi;
 
-	if (bi->type == ia_css_isp_firmware || bi->type == ia_css_sp_firmware)
-	{
+	if (bi->type == ia_css_isp_firmware || bi->type == ia_css_sp_firmware) {
 		char *namebuffer;
 
 		namebuffer = kstrdup(name, GFP_KERNEL);
 		if (!namebuffer)
 			return -ENOMEM;
 		bd->name = fw_minibuffer[index].name = namebuffer;
-	} else
-	{
+	} else {
 		bd->name = name;
 	}
 
-	if (bi->type == ia_css_isp_firmware)
-	{
+	if (bi->type == ia_css_isp_firmware) {
 		size_t paramstruct_size = sizeof(struct ia_css_memory_offsets);
 		size_t configstruct_size = sizeof(struct ia_css_config_memory_offsets);
 		size_t statestruct_size = sizeof(struct ia_css_state_memory_offsets);
@@ -223,7 +226,8 @@ static const char * const fw_acc_type_name[] = {
 
 int
 sh_css_load_firmware(struct device *dev, const char *fw_data,
-		     unsigned int fw_size) {
+		     unsigned int fw_size)
+{
 	unsigned int i;
 	struct ia_css_fw_info *binaries;
 	struct sh_css_fw_bi_file_h *file_header;
@@ -238,7 +242,8 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
 	binaries = &firmware_header->binary_header;
-	strscpy(FW_rel_ver_name, file_header->version, min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
+	strscpy(FW_rel_ver_name, file_header->version,
+		min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
 	ret = sh_css_check_firmware_version(dev, fw_data);
 	if (ret) {
 		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
@@ -257,8 +262,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
-	if (sh_css_num_binaries > NUM_OF_SPS)
-	{
+	if (sh_css_num_binaries > NUM_OF_SPS) {
 		sh_css_blob_info = kmalloc(
 		    (sh_css_num_binaries - NUM_OF_SPS) *
 		    sizeof(*sh_css_blob_info), GFP_KERNEL);
@@ -273,13 +277,13 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	if (!fw_minibuffer)
 		return -ENOMEM;
 
-	for (i = 0; i < sh_css_num_binaries; i++)
-	{
+	for (i = 0; i < sh_css_num_binaries; i++) {
 		struct ia_css_fw_info *bi = &binaries[i];
-		/* note: the var below is made static as it is quite large;
-		   if it is not static it ends up on the stack which could
-		   cause issues for drivers
-		*/
+		/*
+		 * note: the var below is made static as it is quite large;
+		 * if it is not static it ends up on the stack which could
+		 * cause issues for drivers
+		 */
 		static struct ia_css_blob_descr bd;
 		int err;
 
@@ -333,7 +337,11 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 				return err;
 
 		} else {
-			/* All subsequent binaries (including bootloaders) (i>NUM_OF_SPS) are ISP firmware */
+			/*
+			 * All subsequent binaries
+			 * (including bootloaders) (i>NUM_OF_SPS)
+			 * are ISP firmware
+			 */
 			if (i < NUM_OF_SPS)
 				return -EINVAL;
 
@@ -374,8 +382,10 @@ ia_css_ptr
 sh_css_load_blob(const unsigned char *blob, unsigned int size)
 {
 	ia_css_ptr target_addr = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, 0);
-	/* this will allocate memory aligned to a DDR word boundary which
-	   is required for the CSS DMA to read the instructions. */
+	/*
+	 * this will allocate memory aligned to a DDR word boundary which
+	 * is required for the CSS DMA to read the instructions.
+	 */
 
 	assert(blob);
 	if (target_addr)
-- 
2.25.1

