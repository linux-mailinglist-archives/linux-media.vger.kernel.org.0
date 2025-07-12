Return-Path: <linux-media+bounces-37548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A07B02C92
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 21:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1C3A44E29
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 19:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E65728F51F;
	Sat, 12 Jul 2025 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drV0JbTS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C128EA62;
	Sat, 12 Jul 2025 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347639; cv=none; b=seKN68F2sCevLBlBjwV4P2ubb08257kWDFm74DfbB05DaskTyXiksPwmBi2Q4TgAwR5MJW9D9lBQ7LSlwHahKNUJZ4SFZPl8/EDha/YOLim9tOZ9mU+RuRDCTHDsVAv5dzguf/F2nLPlJZx9mvRYZEaWg6CbBV8uMWVNwig6D1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347639; c=relaxed/simple;
	bh=eIGX6hfIjI3Ap8U+0nUV7eri5iFkpqTQ9XPJWOYk7E8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5GP5FHpxtnNUlihgi9CUNt40lF0Ex9bB1SRX1LTbdy3STkyKp9INUcyqtUWdtuRwmmG30gbmQ6tWz2d4b4A9Yo+wLE3oZYH7KncYcU11sD0Pt4e4ek48ScpMPo/y3s4ehRc/oy9rF49chkPesBTMDZo3jtn9vQgo1dXqTKo/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drV0JbTS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-456133b8d47so25995e9.2;
        Sat, 12 Jul 2025 12:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347636; x=1752952436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU+STJheJ2cRenZESzxe2umi5oxN08RJOdFFWhNYDDU=;
        b=drV0JbTSsHYhZXUcRxxIdzeiYLYug8kea6lY2M1F2BHYBivAWhsdF1Mh9JeOMy80PF
         Z1s+wAwOCcd6xbmyhiigf6yrg8+l9TC9sKtPfnan/yT1WgDh9CseKIL6pTOlhly4Y04t
         VA2pgbmrC5OrE7k3i/UN6ueWmys2StzudpHf+mBw0tUIkgL/KVxX0L0NayDJ4aC2fMPs
         t7pVeT6sCjS5ynq65mLTQquJJN4F7hQjaEUz80/Lw/+bWBms9toX/83E9ckMyMmc/Nml
         Wwzqrm+dsXFSe8xPt+MxO5c/Go4I9YhD9mn3kWYN9oGOvC7Pjbbm++/pzAwDu3X/A/YO
         uq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347636; x=1752952436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU+STJheJ2cRenZESzxe2umi5oxN08RJOdFFWhNYDDU=;
        b=Si61avDEoiuijopXrhO/tVUYfNQnxWv59q0VdShbw6oo7vaEJKB/Uk11RlQWosVLLS
         nLmOMK+UQFnBISbO6y/tIEIsdDFZjdh5R45Rww5tC35LUAFGCRlTmJ71Zm3spYUl0j3F
         ZD3SKRP8rtgPn5deV/d69auzpRcifuCcjCEvwRIZ+zyn2/ijB5qWRHk3hMtZ9pOgp5fe
         6/SkzF1CInI5ROUdrcHPypLFwGKrkcrQB71JoU3QK4JbWNX02hHoHJSMJWLToUBH7nMi
         BvzJoq8nUiyR/JwhQrx3AyxxdLzQJaTSGE8aKZbR2ACB5qhsZktQjCzDiREKMB2lvmQ9
         0nCw==
X-Forwarded-Encrypted: i=1; AJvYcCUn60ZcACzoOxBoEF01+YWnvPF3YPRA+hpLwQ9NaJu44FbPBq1CVUGs6mHxAvcUQHDl8JofhCXnnkQs+3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKpWlDwHdT54mKQUkc/jb5gUn02RWC9HWwRo6sl4N91XMq8pcp
	nVf8idpaxsA5CgATVjsUX12lTIvB/ilLq97HjtdZzuBBWQZ3zXWnMi3q
X-Gm-Gg: ASbGnctSRfDkQefWWt8+35yo+zMrGwfZ5vP3yRFDWxWgFexCtX3nD6tWbADgWvvefeo
	KlcfP3mXY/yNCsL/iDFa88fz2+HhZ0uvTY8Jkvqapsuj1FtHMBkzAhbdFKSQCZO3xUfJeyGt6rO
	hMafsDQzChA9OnIL45XEpFo/IA6NgbHqMIhmolLF1ATVRmAhJBZww9lGttuXF69kuV5YYOgvMel
	pEQIHVGritFHsigCk+9e0bZXDEwg1KcFYnFjH7x4hta3J4HKthdqDflBgLY4z0sAXmE0WKYdILb
	onkdLXyqw/pWokcuLPulj6lnn1RX/9R0eYtwxfslwtkqg1LT8JoCo3Ojxmo2IViPKkQTHqzAQjl
	qKmBBAP2IY1NXShGsixfVK3UGRmvnd8BxFiZ1I1LLLT5iSJ0DjEsTBr84JA==
X-Google-Smtp-Source: AGHT+IECUvBi1C3fpaJkeu378YHO/wUV8hQgmJwaGFvLP5vaqOMKI5NAjpaj+pRBjjSsm8+4eTD1lg==
X-Received: by 2002:a05:6000:228a:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3b5f2d5f16amr2112016f8f.0.1752347635853;
        Sat, 12 Jul 2025 12:13:55 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:55 -0700 (PDT)
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
Subject: [PATCH 3/3] staging: media: atomisp: move hmm_get_mmu_base_addr()
Date: Sat, 12 Jul 2025 22:13:25 +0300
Message-Id: <20250712191325.132666-4-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
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


