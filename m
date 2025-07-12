Return-Path: <linux-media+bounces-37547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE37B02C90
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 21:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B83E5A44D13
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 19:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414E328EA44;
	Sat, 12 Jul 2025 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls2NM+yo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3B128DB78;
	Sat, 12 Jul 2025 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347636; cv=none; b=AfhfKFfRN2NpFA+HhfpBelfqXLAihzVypivPZjbBbU9lZNGGSBmATjf0SsDX4ZQazqvb0NxEHWBXJ4co8CJMBAjoZmIUO9fvfkYw9pO5JAAX/+xOPoY7IGLGvKGjlA2vmUaV9/083ihCS0FqNzG987ev1UAuNZU0dy4EFXB9SWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347636; c=relaxed/simple;
	bh=OTZbWuBUP0apZL41jRuXYeU7ZawKrlOCNUiC4UM4KSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jzHXw0uTgKoquhlxcs2zszmIXJLwWiGr7JNv1GUa+FekNavw2IRrwjiikk2jB4GWkJtiL31QW9St7LA5+o2yPNVBc1SxiUC9TuJqenLxyd6TT/ZtgwxBgZVlcm3l2uzeSs6gJYhSzfqMIF9kJhu9ZOgIPvVk0ak7YXeVVz+gVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls2NM+yo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a577f164c8so312246f8f.2;
        Sat, 12 Jul 2025 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347633; x=1752952433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0pvYq16cvHI4govEM6VgKCqJMNYGnXFAARo3AapR7A=;
        b=ls2NM+yoPuneqGEDLgHckBCyE5WOvg1p/05HIpm0aqtTSpiHSWbZgOHhMxVb9eTdTe
         1Kvtoehk/XEGx+3fY2dXyUJw4ufJPZar1eFkUdACmd1ekwWPTKpA0biZ+LfSv6rmDM1T
         m78OHvxeSmKqFkdH/OF/REs0lzlzuYCpKzJoXlRJvMWnvlL9ZruvTveluk54xGsXXI+n
         EooI/tQoLftXSp1mTF5Tnfdsbyavdn9G7k/hiLlOnyf3SNDFLetmhZsVksJJjUvEvm5p
         y2ZMl3YMLy6gYQ9FA6aI1XWNmR/OFq1mkZz++gvtkwJ8/hvJqww4g0xrfR53neaQV2Zi
         3Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347633; x=1752952433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0pvYq16cvHI4govEM6VgKCqJMNYGnXFAARo3AapR7A=;
        b=ctmGQheJ2NIw5i1fAw3fjV6m6myuoieCv/ukb8YPJWoonwELBZVvxZD9LZOUYrQvf5
         ke2NMHJfTS+CwKjKoA4Y22vnzAJszh+VebumsqWmIDdz96fSjjhf+nP6jn+CcGcptNzT
         gGVbWH73kIwob+6QdvHmaWQ3CXUFflEyCWrlnrt/GDBMZusETdUs+Q8Jqn+KKENjuaTI
         I1Wk60gecbKemJjxfthEoxQN+aiVf41qTv6ZmYroL+tGpZdNIovyvfRPACiPjEL0OHmt
         Zskl6UiC5cRz4e2R2fTOlix8R7cxlq5xV5Mmulj6p0/l/1vNfCUielOLa0pBQPYTKO/O
         Wx8w==
X-Forwarded-Encrypted: i=1; AJvYcCUTAjros2EreK8gYr3anOlnauC6G7IZO9g+p4EWkqBhDjOoT6qbLIRuDaaQdro97NoQeVfeQPEWGik9MCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Ef4Dvgl9gP4Vh3dvbHN7bjvWOHnwQNhVY8MMQWV9Yq98+tti
	UWlfNuzVKpgA8EsJTzFtQ9Qky8Bmdw++tGc5Ugfz4J7wYbQnkJSFyE6y
X-Gm-Gg: ASbGncsJLpfQfRbM8vmZ+yHlPt/2NWiYNoFo9ijONuYW2P2YSKS7lTxXNxX24KxhNWL
	sTUFU1HCFibq9MaGevFEKk2DWjr9BSY1SipMqTZ3gRReh5gC7fpkq/vz2K1ut602EEV7fCEgw7G
	d2p6CHAScBUcd68hpiGLdfsmjtazqb53sjzgBbYB8GTi3D63HD+r5HcqroRUnwgHfUIhziXR0Ju
	yFFJkjwKecByolqCe0NRIcOHzKw6rlFROXe4MrKVLaIuWOk2te79VQi+9s2QxA5cb+sismE5VVD
	VWfLrRr4RdPyyQJUXJqrtCJNOlYtkqqowITsM/u+y48ZocC7o0vvYm1M44uEXsrRzTFcSqPpXsj
	T69w8a3EOkdK7aJsctECdeOwsrk6jPjyZRGZUoqkNl+GdNe8Por+I9N8Ojw==
X-Google-Smtp-Source: AGHT+IF4xHdrbMof8MSup6DPX1MvMV0SmDtV4pn1bO4gAJpdVgg+02aR+oiNNd7QW5WZw915Yrod9Q==
X-Received: by 2002:a05:6000:2f84:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3b5f2db436cmr1967373f8f.3.1752347632831;
        Sat, 12 Jul 2025 12:13:52 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:52 -0700 (PDT)
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
Subject: [PATCH 2/3] staging: media: atomisp: unify HMM initialization tracking
Date: Sat, 12 Jul 2025 22:13:24 +0300
Message-Id: <20250712191325.132666-3-abdelrahmanfekry375@gmail.com>
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

The HMM subsystem previously used two separate mechanisms to track
initialization state:
1. A global boolean `hmm_initialized` in hmm.c
2. A device-specific `flag` in struct hmm_bo_device with magic values

This dual approach was redundant and error-prone. Additionally, a
redundant hmm_init() call existed in the allocation path.

- Replaces the device-specific `flag` with a boolean `initialized` field
- Removes the global `hmm_initialized` variable
- Eliminates the hmm_bo_device_inited() helper function
- Removes the redundant hmm_init() call from __hmm_alloc()

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm_bo.h  | 11 +++--------
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 11 -----------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c  | 17 ++++++-----------
 3 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e09ac29ac43d..ac556c1d71bb 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -58,8 +58,6 @@
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
 
-#define	HMM_BO_DEVICE_INITED	0x1
-
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
 	HMM_BO_VMALLOC,
@@ -86,7 +84,9 @@ struct hmm_bo_device {
 
 	/* list lock is used to protect the entire_bo_list */
 	spinlock_t	list_lock;
-	int flag;
+
+	/* boolean to indicate whether the bo device is inited or not*/
+	bool initialized;
 
 	/* linked list for entire buffer object */
 	struct list_head entire_bo_list;
@@ -142,11 +142,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
  */
 void hmm_bo_device_exit(struct hmm_bo_device *bdev);
 
-/*
- * whether the bo device is inited or not.
- */
-int hmm_bo_device_inited(struct hmm_bo_device *bdev);
-
 /*
  * increase buffer object reference.
  */
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 97c7ce970aef..8d64e5fd812c 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -26,7 +26,6 @@
 
 struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
-static bool hmm_initialized;
 
 int hmm_init(void)
 {
@@ -39,8 +38,6 @@ int hmm_init(void)
 		return ret;
 	}
 
-	hmm_initialized = true;
-
 	/*
 	 * As hmm use NULL to indicate invalid ISP virtual address,
 	 * and ISP_VM_START is defined to 0 too, so we allocate
@@ -63,7 +60,6 @@ void hmm_cleanup(void)
 	dummy_ptr = 0;
 
 	hmm_bo_device_exit(&bo_device);
-	hmm_initialized = false;
 }
 
 static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
@@ -73,13 +69,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	struct hmm_buffer_object *bo;
 	int ret;
 
-	/*
-	 * Check if we are initialized. In the ideal world we wouldn't need
-	 * this but we can tackle it once the driver is a lot cleaner
-	 */
-
-	if (!hmm_initialized)
-		hmm_init();
 	/* Get page number from size */
 	pgnr = size_to_pgnr_ceil(bytes);
 
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 5d0cd5260d3a..aabb2a126caa 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -373,7 +373,7 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
-	bdev->flag = HMM_BO_DEVICE_INITED;
+	bdev->initialized = true;
 
 	return 0;
 }
@@ -385,9 +385,10 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	struct rb_root *root = &bdev->free_rbtree;
 
 	check_bodev_null_return(bdev, NULL);
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
-
+	if (!bdev->initialized) {
+		dev_err(atomisp_dev, "hmm_bo_device is not initialized!\n");
+		return NULL;
+	}
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
 		return NULL;
@@ -522,13 +523,7 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev)
 	kmem_cache_destroy(bdev->bo_cache);
 
 	isp_mmu_exit(&bdev->mmu);
-}
-
-int hmm_bo_device_inited(struct hmm_bo_device *bdev)
-{
-	check_bodev_null_return(bdev, -EINVAL);
-
-	return bdev->flag == HMM_BO_DEVICE_INITED;
+	bdev->initialized = false;
 }
 
 int hmm_bo_allocated(struct hmm_buffer_object *bo)
-- 
2.25.1


