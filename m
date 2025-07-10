Return-Path: <linux-media+bounces-37234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94565AFF649
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 03:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C094C189D2D3
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 01:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C2F25B2FF;
	Thu, 10 Jul 2025 01:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CThoAP8j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF70526F476;
	Thu, 10 Jul 2025 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752109312; cv=none; b=m5XUdHk3neju7jx7fUsFi85f4YKuzdP6kY8nxhaRFT6I0TAlp2p+RApjEZ8MJDGgvJEWfsAjnPMn3OlunRoIhvH0PZSqZH9ABblpaWIXUsARN1t6tvr4Bc97hjPxpfsCQ7pkNO4jHwy+g37wScVMZTmOkQAFhPHTNlG3JMS0AJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752109312; c=relaxed/simple;
	bh=M1YsmDbGJwWY/B0rcU4jVlyPC8PdNio+2N9SDx19JPA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hbqcZovLUXgb1iiG5MD2vPhkekiS7Ul/qW5n6Z1vf8HPEf5zcZ6cheRL2QhcwpSzTWWR/qrphogvhztfR1gJy/vfjhEUoeu5nNU+onez0eHAU6UMmuAtXIUz/SIWuah1z0a6qXDHwEieLf+1hsikoIdzojQ7pDy4MnGHjqTLCj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CThoAP8j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-454b9185d93so108115e9.2;
        Wed, 09 Jul 2025 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752109309; x=1752714109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lqJZbsPmHAs+IvsrdhKTt1/Tbcc/A+mUT/M0FKTBrw=;
        b=CThoAP8jONn/etfE7yMUWXKeoGbbAROiLs5aF3RhVjbAPBbIeaUbRVD61Lv1tcNuIQ
         bm1s4H0bwgV/LgeLmyTZSf6FLZFEv6yvr+CQta3B6kkWpJNmVTa09hKD1Y20Gcu8ELYI
         jxCk9CNHC0fj5N6Dbbiv472ZAGtxbqtxhD7tXQzLbSK2MoK0ZRD0CFjFBT/tPC3voFj1
         BMjZnT4t3meUS8fV2ipnCeXWbgHhf6WA94u+xJJ9kxddKyatzAcgo89IlB+JUOFg8XMC
         Kqmqa+TeX9rWGXATNnD1C/loqtG4goW7a1FMUflr+WzdBTVbv75elFSP63ulItWz8HKd
         wHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752109309; x=1752714109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lqJZbsPmHAs+IvsrdhKTt1/Tbcc/A+mUT/M0FKTBrw=;
        b=esw9DNgQHMbty3bd0MZY2qzQ0KQn4h3OIKl+HPSedFxuzG+aO96VYr5xXu+vmMOmRF
         U21DnzKQAPk3JtqcFTKE3gaprJmBZ30g3eU1QqUZDXRqy7g5BDhies/hbWt2eI71LGcr
         FL/rzzjsejZxoRVbigtcsE5LEQQJ01NLMlPAhFu96DmZxN8IG2cfQUN47KM4jNwWmp7E
         sSK9K0nUMsCQeQ99P5QgZa7FgJFCFHGXlb+rU7U1YuCZbIBD9QxP5MDkYnmslOWZbjxS
         tTG3rAbW61Q5xllJ86SXpvgxiJawWU4R+RZ1keUmd5/crsCQSpCbNdpla9vIVxQ1M9MC
         6wag==
X-Forwarded-Encrypted: i=1; AJvYcCU1XuahyAnA1MQswBlzYuulDGAxvVq5V/Zkc9j0aHlIBhYQ1ZBe3q6L2zUSxIjGTO7R2I5Y0k1wEq4fjd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVu4Gc5gz/yN30fx1a+KSxVJ1uvvrzzFGL9IMywbIq/PTbCm5T
	uZiSCfV832Onj8VXKsCm5b9/HgAPb3YQdq2O1MLSzhdY3+wFJ8WzLsYs
X-Gm-Gg: ASbGncv+EIIDecQlpyMoaqz4pY12fX220aD40V7XjGFtuik4ZXO+8Yjb7R3gH8Z8p9L
	xsYQEP7Wbnl/f9kQS3djU7Oy0et3xWcc4RiKtTAd6bIvSiByfXOsWzwibYLtiG3E+emTKYkvTb6
	OzbelAmXzM9HwpeuoSP5225WZRD82idcT2Bk8pmWY60PcpYyM4VoslTcwkX8BUEg2+6nX+5nHe3
	wvX4v5j0DAq9ZMTyugZDGtWIBwgYSRrbRtg1ZgLOajMWxOB8opIUqvMBA2V51ku+73K+VcA7fwF
	DjQdQlQGPl56opCbexD4gbE8eCRQqqIV4kpmljBAPlx8VnDLPUIH1gW42aJJbESrmB3MIkR9ibB
	5s6Tn3deCtSHm2dOCnz51Mu8=
X-Google-Smtp-Source: AGHT+IF5UvDpLNDVjM54tSi8Gr5TA9ysTCFcSut/nKUTewLVf1mVhmlBgKi4jczA+xhIl606XbYwGw==
X-Received: by 2002:a05:600c:45c8:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-454d5301ea8mr16803995e9.1.1752109308466;
        Wed, 09 Jul 2025 18:01:48 -0700 (PDT)
Received: from localhost.localdomain ([154.182.167.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd43915dsm3587375e9.7.2025.07.09.18.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 18:01:48 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: move hmm_get_mmu_base_addr()
Date: Thu, 10 Jul 2025 04:01:30 +0300
Message-Id: <20250710010130.113441-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hmm_get_mmu_base_addr() is related to the functionality
of hmm so its better to be declared and defined in this scope.

- Move hmm_get_mmu_base_addr() to hmm.c.
- Change hmm_bo_device struct to be static.

Note:
This patch builds on [1], [2] that were not accepted yet.


Link: https://lore.kernel.org/all/20250708164408.79863-1-abdelrahmanfekry375@gmail.com/ [1]
Link: https://lore.kernel.org/all/20250708164408.79863-2-abdelrahmanfekry375@gmail.com/ [2]
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h    |  4 +---
 .../media/atomisp/pci/atomisp_compat_css20.c       | 12 ------------
 drivers/staging/media/atomisp/pci/hmm/hmm.c        | 14 +++++++++++++-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f54de..da85d835ec10 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -33,7 +33,7 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
 int hmm_flush(ia_css_ptr virt, unsigned int bytes);
-
+int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr);
 /*
  * get kernel memory physical address from ISP virtual address.
  */
@@ -65,6 +65,4 @@ void hmm_flush_vmap(ia_css_ptr virt);
  */
 int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
 
-extern struct hmm_bo_device bo_device;
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..b4913cb32a64 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -157,18 +157,6 @@ void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 	*data = atomisp_css2_hw_load_32(addr);
 }
 
-static int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr)
-{
-	if (!sh_mmu_mrfld.get_pd_base) {
-		dev_err(dev, "get mmu base address failed.\n");
-		return -EINVAL;
-	}
-
-	*mmu_base_addr = sh_mmu_mrfld.get_pd_base(&bo_device.mmu,
-			 bo_device.mmu.base_address);
-	return 0;
-}
-
 static void __dump_pipe_config(struct atomisp_sub_device *asd,
 			       struct atomisp_stream_env *stream_env,
 			       unsigned int pipe_id)
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 8d64e5fd812c..321166e58bb5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -24,7 +24,7 @@
 #include "mmu/isp_mmu.h"
 #include "mmu/sh_mmu_mrfld.h"
 
-struct hmm_bo_device bo_device;
+static struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 
 int hmm_init(void)
@@ -488,3 +488,15 @@ void hmm_vunmap(ia_css_ptr virt)
 
 	hmm_bo_vunmap(bo);
 }
+
+int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr)
+{
+	if (!sh_mmu_mrfld.get_pd_base) {
+		dev_err(dev, "get mmu base address failed.\n");
+		return -EINVAL;
+	}
+
+	*mmu_base_addr = sh_mmu_mrfld.get_pd_base(&bo_device.mmu,
+			 bo_device.mmu.base_address);
+	return 0;
+}
-- 
2.25.1


