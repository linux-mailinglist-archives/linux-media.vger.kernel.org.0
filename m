Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4098622DD7D
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgGZJHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZJHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:07:22 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5877C0619D2;
        Sun, 26 Jul 2020 02:07:22 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e8so7736858pgc.5;
        Sun, 26 Jul 2020 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TE4WH5V1PjNKPvtTMrDOivZD9WEtomgUlgWMan48ZxE=;
        b=uhXn4kVy0oaA9ZPnoC9GsTva+siN9ZF/ExTW9LMFY/H5Bc4BsgDoebQ2YwEYChA8sh
         LNxct7T1xLzjgW+QRQNw0VYcui8I88igldfo4FvSGrMK9hcdyT1K8dMZ3UizwpHcFp91
         oDCe/pI4aX+LuEbHc5uaK5D28EXAAc6pokCSqZrUB5sOtgEUyjIwlpyDP3sPej91OSyV
         o1t2wg3edrx3jD3997Yn7np/pnDKI62tWoKCkFl5PrMKqI36WfBEmsTDNNlSOwOlsO7I
         BHhCImMs0tRuQ2i0zupqyrb/LJxUJIhdX0rmC8FD031jns3JSk5RDYoiSTWKO02GgvjL
         WBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TE4WH5V1PjNKPvtTMrDOivZD9WEtomgUlgWMan48ZxE=;
        b=tHEEbQthHUaGNQD8ss+cqwEK1P9fRACDMTofdgQp+fpDTY8KC0X9TqrwmJue+9kIvs
         YiF9RCLdxzBiaZPWQ00h8Uhhmuw72PoM0YJY/VV0BzY4IynADTMWjQ+Qc/rm8T+4inBQ
         ZcaH1094C9qW/A44iLO6KHrnip5lCxjnwXR60HI142JicMKrBbm8gsBPWv1r0RBBIATR
         JZm8LdCGVvwKImPrFkwYuxXT2EQ73yAhekuMRvunSugmhdvr3UaUckOeevqOaasayi8s
         Rqujmwla/wtcFsuEB79xvKw3hytCcrqfe5TEDDiyu/LlZJIRMJ4VCOW1jibscKYweVZR
         U4Qw==
X-Gm-Message-State: AOAM532zA60Uc5pmVz4BoFfUAvDrJAR3YrGU9uG2BXnpKoF3VTaXpkrb
        hfwzx3VKZNTkyP7CQdKHIwM=
X-Google-Smtp-Source: ABdhPJxdhVAyLhJhlakixUSaEi7TlhaMIolqf0rTviYwGQnxqsQXqtWf5IDyvqA5lL++d6/M9sCEfQ==
X-Received: by 2002:a65:66c4:: with SMTP id c4mr10209304pgw.442.1595754442248;
        Sun, 26 Jul 2020 02:07:22 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id a129sm1608215pfd.165.2020.07.26.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:07:21 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Subject: [PATCH v3 1/4] staging: media: atomisp: fix style of block comments
Date:   Sun, 26 Jul 2020 14:35:10 +0530
Message-Id: <20200726090512.20574-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patch fixes the coding style of block comments.

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v3: change patch subject prefix
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

