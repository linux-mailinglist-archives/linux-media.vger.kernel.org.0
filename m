Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1214D22DD5D
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 10:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgGZI4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 04:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZI4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 04:56:36 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99370C0619D2;
        Sun, 26 Jul 2020 01:56:36 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w2so7713597pgg.10;
        Sun, 26 Jul 2020 01:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cAjop5ZjgObLEdrvvwvFABP+HAGhe/69qePNfdSogC0=;
        b=RaucRnjPITiz7zCD20F3AtFvGykB2zfxUliQRoe3n//7YXiPTVXwUQfNc3dQS0y5ti
         KEApbPG6Y0mLcL1AhCMC78JRcP8Mk+N1W0Dy0JhoktzBQL0mhKavDpQ6WHysTHLrkpKm
         3YMax3j7YZ+BYaQub/5ozUcuoDmbbKLjQqbz4mHW31rB02U7dSAJQcg50c59bk95brEc
         WJrJOTQMVs19xKAxI5UzOrLKq9TUqqAxmh9FA46lbWvlW7kuy1XFsc6m5/R6dQ7/y2+j
         kKsLE5lp2m7d/g4D4docS8beW79E4kCu1vuHLVo3wun0KTxKQf5wZiGuYH+2HYQQIgeh
         zyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cAjop5ZjgObLEdrvvwvFABP+HAGhe/69qePNfdSogC0=;
        b=nNnKNMafn239Pkk3EYzidM9Xd1uUEI7/4+sX8JieLtH5LhtfU+r7/pxzzgDZudyMeo
         /0Kc/a04rT59nE/ZP8mLlN53ZofYAf48vgqXlPRTUwSVAZrbM1d+teB7oNdM1D+TvpVD
         yHT68QBDSs7JS+RTAdI0xMpxqMicYkNSevMqoGkj0/c6YDR6PQu/5vdEwqj+gr6zVzjl
         xwLXHUBkKpOmRw7neirO7v5K13Qs4A/kOqlMt4gEqhTgznKRdvzYty8yj2yOn06ICJka
         h5VZ73Htav6VitIfrIA9vw0FgtO1J0JuWhU1Mfx8lXLywc9YpbwZXSOSVMoOFM7ZrcjR
         Pe0Q==
X-Gm-Message-State: AOAM531d/fZEaKWXnERs503n8NDGg3x3J05Nz7Rc/4dlU4Oqooj9dBxs
        Clf72nEiAPRc3FZNhav54wA=
X-Google-Smtp-Source: ABdhPJxIrBw803YT5wSlbdopZtLISFYIUHaIoO3qYOqseXcgMSIdPoSuvOz/zXkIuLeexpWpsjbu1Q==
X-Received: by 2002:aa7:9575:: with SMTP id x21mr15510611pfq.140.1595753796078;
        Sun, 26 Jul 2020 01:56:36 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id o22sm4577041pfu.206.2020.07.26.01.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 01:56:35 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Subject: [PATCH v2 1/4] fix style of block comments
Date:   Sun, 26 Jul 2020 14:18:58 +0530
Message-Id: <20200726084900.19246-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patch fixes the coding style of block comments.

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v2: split patch into sequence of patches 
v1: fix all coding style issues in single patch

 .../media/atomisp/pci/sh_css_firmware.c       | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index d4ab15b6d1ac..2907aead98b7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -51,9 +51,12 @@ struct fw_param {
 
 static struct firmware_header *firmware_header;
 
-/* The string STR is a place holder
+/*
+ * The string STR is a place holder
  * which will be replaced with the actual RELEASE_VERSION
- * during package generation. Please do not modify  */
+ * during package generation. Please do not modify
+ */
+
 static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
 static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);
 
@@ -276,10 +279,11 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	for (i = 0; i < sh_css_num_binaries; i++)
 	{
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

