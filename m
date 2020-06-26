Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0982620B146
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgFZMTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:55587 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgFZMTe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:34 -0400
IronPort-SDR: /hZIwSkSAsEqu+TkblzSYJxDvI5xJke4ytu1DH1FJNAZQi/aMnyUFT3sEkyTGObTI7h4hO3pwN
 qTZ3eEOScbVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146793642"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="146793642"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: auVPtyLZZdLh9SH4/c8FT/PF1z+XhONSrnY/geNaALCzSoYtUyPfgI3BjWUdBKUHvRU/OJGt1e
 dgU1H1K0LDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="319992836"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5B7A1513; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 08/15] media: atomisp: Drop global atomisp_dev variable (easy cases)
Date:   Fri, 26 Jun 2020 15:19:18 +0300
Message-Id: <20200626121925.14365-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor code to avoid use of atomisp_dev global variable
where it's easy to achieve.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_acc.c  |  4 ++--
 .../media/atomisp/pci/atomisp_compat_css20.c     | 16 +++++++---------
 .../media/atomisp/pci/atomisp_compat_css20.h     |  2 +-
 .../staging/media/atomisp/pci/atomisp_drvfs.c    | 11 +++++------
 4 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index 76861396ba86..f638d0bd09fe 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -355,11 +355,11 @@ int atomisp_acc_map(struct atomisp_sub_device *asd, struct atomisp_acc_map *map)
 
 		pgnr = DIV_ROUND_UP(map->length, PAGE_SIZE);
 		if (pgnr < ((PAGE_ALIGN(map->length)) >> PAGE_SHIFT)) {
-			dev_err(atomisp_dev,
+			dev_err(asd->isp->dev,
 				"user space memory size is less than the expected size..\n");
 			return -ENOMEM;
 		} else if (pgnr > ((PAGE_ALIGN(map->length)) >> PAGE_SHIFT)) {
-			dev_err(atomisp_dev,
+			dev_err(asd->isp->dev,
 				"user space memory size is large than the expected size..\n");
 			return -ENOMEM;
 		}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 010b2b19d811..499916bc6aab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -182,10 +182,10 @@ void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 	*data = atomisp_css2_hw_load_32(addr);
 }
 
-static int hmm_get_mmu_base_addr(unsigned int *mmu_base_addr)
+static int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr)
 {
 	if (!sh_mmu_mrfld.get_pd_base) {
-		dev_err(atomisp_dev, "get mmu base address failed.\n");
+		dev_err(dev, "get mmu base address failed.\n");
 		return -EINVAL;
 	}
 
@@ -840,7 +840,7 @@ int atomisp_css_init(struct atomisp_device *isp)
 	int ret;
 	int err;
 
-	ret = hmm_get_mmu_base_addr(&mmu_base_addr);
+	ret = hmm_get_mmu_base_addr(isp->dev, &mmu_base_addr);
 	if (ret)
 		return ret;
 
@@ -942,7 +942,7 @@ int atomisp_css_resume(struct atomisp_device *isp)
 	unsigned int mmu_base_addr;
 	int ret;
 
-	ret = hmm_get_mmu_base_addr(&mmu_base_addr);
+	ret = hmm_get_mmu_base_addr(isp->dev, &mmu_base_addr);
 	if (ret) {
 		dev_err(isp->dev, "get base address error.\n");
 		return -EINVAL;
@@ -4337,7 +4337,7 @@ static const char * const fw_acc_type_name[] = {
 	[IA_CSS_ACC_STANDALONE] =	"Stand-alone acceleration",
 };
 
-int atomisp_css_dump_blob_infor(void)
+int atomisp_css_dump_blob_infor(struct atomisp_device *isp)
 {
 	struct ia_css_blob_descr *bd = sh_css_blob_info;
 	unsigned int i, nm = sh_css_num_binaries;
@@ -4354,8 +4354,7 @@ int atomisp_css_dump_blob_infor(void)
 	for (i = 0; i < sh_css_num_binaries - NUM_OF_SPS; i++) {
 		switch (bd[i].header.type) {
 		case ia_css_isp_firmware:
-			dev_dbg(atomisp_dev,
-				"Num%2d type %s (%s), binary id is %2d, name is %s\n",
+			dev_dbg(isp->dev, "Num%2d type %s (%s), binary id is %2d, name is %s\n",
 				i + NUM_OF_SPS,
 				fw_type_name[bd[i].header.type],
 				fw_acc_type_name[bd[i].header.info.isp.type],
@@ -4363,8 +4362,7 @@ int atomisp_css_dump_blob_infor(void)
 				bd[i].name);
 			break;
 		default:
-			dev_dbg(atomisp_dev,
-				"Num%2d type %s, name is %s\n",
+			dev_dbg(isp->dev, "Num%2d type %s, name is %s\n",
 				i + NUM_OF_SPS, fw_type_name[bd[i].header.type],
 				bd[i].name);
 		}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index 8376aec18e3e..e0601534380f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -153,7 +153,7 @@ int atomisp_css_debug_dump_isp_binary(void);
 
 int atomisp_css_dump_sp_raw_copy_linecount(bool reduced);
 
-int atomisp_css_dump_blob_infor(void);
+int atomisp_css_dump_blob_infor(struct atomisp_device *isp);
 
 void atomisp_css_set_isp_config_id(struct atomisp_sub_device *asd,
 				   uint32_t isp_config_id);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 3711df111fbf..f670faf978e6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -62,9 +62,9 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 
 	if (opt & OPTION_VALID) {
 		if (opt & OPTION_BIN_LIST) {
-			ret = atomisp_css_dump_blob_infor();
+			ret = atomisp_css_dump_blob_infor(isp);
 			if (ret) {
-				dev_err(atomisp_dev, "%s dump blob infor err[ret:%d]\n",
+				dev_err(isp->dev, "%s dump blob infor err[ret:%d]\n",
 					__func__, ret);
 				goto opt_err;
 			}
@@ -76,7 +76,7 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 				atomisp_css_debug_dump_isp_binary();
 			} else {
 				ret = -EPERM;
-				dev_err(atomisp_dev, "%s dump running bin err[ret:%d]\n",
+				dev_err(isp->dev, "%s dump running bin err[ret:%d]\n",
 					__func__, ret);
 				goto opt_err;
 			}
@@ -86,8 +86,7 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 			hmm_show_mem_stat(__func__, __LINE__);
 	} else {
 		ret = -EINVAL;
-		dev_err(atomisp_dev, "%s dump nothing[ret=%d]\n", __func__,
-			ret);
+		dev_err(isp->dev, "%s dump nothing[ret=%d]\n", __func__, ret);
 	}
 
 opt_err:
@@ -195,7 +194,7 @@ int atomisp_drvfs_init(struct atomisp_device *isp)
 
 	ret = iunit_drvfs_create_files(iunit_debug.drv);
 	if (ret) {
-		dev_err(atomisp_dev, "drvfs_create_files error: %d\n", ret);
+		dev_err(isp->dev, "drvfs_create_files error: %d\n", ret);
 		iunit_drvfs_remove_files(iunit_debug.drv);
 	}
 
-- 
2.27.0

