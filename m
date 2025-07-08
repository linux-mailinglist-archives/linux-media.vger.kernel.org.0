Return-Path: <linux-media+bounces-37143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67451AFD29D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44AC175F8D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4BC2E6114;
	Tue,  8 Jul 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDMwWUNA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1552E6106;
	Tue,  8 Jul 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993105; cv=none; b=uAba/v2gjXwqjIGZ65o4t5t9olZg6lTJE1UCd/isT2Cb3zFLns+weZRxY2SI485Ht+VL8wdX22QJsi4QO9qZnQc/Or0FxiKU3mKGyLr9ni3Lz9vSgkrt9rHisoHmYFLiEn2Y368Oal1ioPk3rD/dGcRvReNkKN/pOgSaGnhRu7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993105; c=relaxed/simple;
	bh=pHamtUUjOA8ryouu3snUtyAR27Apfiwqlbd0r/Sargc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IuF45KyNRqxxEcALGBr0qjNvP8SrOEUxHj3ABty2qR97IH75PvPY3wGp1PrLOVCk9G93+agJ7UdTio8NkoSSeR9IvjwUmw4eGHK8ycpqTFO2AzJUjTBVOETtnhSblRLLSnqtzfLaE848YyznTqkb7gYRLf+57SKw2qzf11JXBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDMwWUNA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso5297055e9.0;
        Tue, 08 Jul 2025 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751993101; x=1752597901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLk2b9xAs78jTwaFIbSGjv7ZXKL01z3N/m48S9+9wRQ=;
        b=MDMwWUNASGPbXso0CebQRZ6Pg3YeNe3CBzB/XZ7NgNImFa8srgIZshSXSh9XuJxT1x
         T8F/u8DG9uc0ua9HpxYVpGHTEmGZejJ4hivzjONeN3mkG3mwWvvBkgcG/vR3B7TOEK3N
         VOs81mOjgRY06y4C/uKo7jR4ZmZKW+yC9+aktEOgthTIK9aC3qIrw6uRMVZH1WrJkOUu
         SI+Kt8M1hjQqKLJkSn5BXCcVWUqXGy+iB4NgFo2yaVflBPRpnhgrGO8TMtdaSt7DSldL
         I7rxcujNI00gyqAy7LBn3ajeiSFE6shvy8cz+8ACUPS54NmEZWlCQBzKZl4Dp3YBFTRK
         K+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751993101; x=1752597901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLk2b9xAs78jTwaFIbSGjv7ZXKL01z3N/m48S9+9wRQ=;
        b=bjtz9FQspkvguDg1zIkt2qFgYQCY1eNH2nI0irA7WBzoTXO7OjrDrIho8qd5Dvbiq8
         KZDp8K8m516V3TxTf1fEGWiGzaAuuLELLd4U2FkZH6KGImNCpQQLAnimvjvgVIFEPeQZ
         zH2+4n9Ny8RMI3wHspnfYOTHRLHfDmL7utoXOSPhnnx7hCWT/wAw1EHk+WHHYVPt/0p5
         MlOVbgonOsnYe3OP+37h4IB7/FLbHTZHd3/CMnVgAIonqXNfjwFl+Dav6SfiainGl1pr
         r06givP4956faaRHo0VrdnDVDH7InUcsaDnc18h5+YqVg1mM5thbf6RRmZKmInc8Gq/P
         SUKg==
X-Forwarded-Encrypted: i=1; AJvYcCWhNarO8C+J4beFGDHWWE0ocjuIEhtrTfgfs9ZqJl+0/HAd0n9mQqQXg9XVZwCmLq6KySh2DmTjL5TJXzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXoy1IgR6VPvXh3HIPsht+GGk5LhOmQTrmco75UZa72lz1VEL
	61pebQFIwawJLePjRP/cnJaqxminj4E6+C/RIy1acePJrRBFzKynzTC8
X-Gm-Gg: ASbGnctrUW6leOio/4YyCAif+NaaCouyS/ynYWUt/XMriRK4DXivSeBfKo1jYJuM38I
	an+ye1mwHD3YQFGb1LgqjjnFZ+rx8Kv3OIrxqwiTAfsEbPtrvPrVkY3iYt/toATgqteJEEO9kra
	1Fqtmm6MN/FKoLpQOoP6kqlEbc78zRcTiZnVc8K95bvyIN65mbQkVvjG798C9I/WkN5tAv7bdLd
	y5ityDlJ1GO0QkUim6GdTQBBaR9EVOF66WVo9rNDyNzZGIU8wIWY0S5EQRJM8XIMy4JSo7KkY89
	8bpnEgreQ99wYIJz7Rpg+Pjh5HtusILC6QZMqbNqKiOenyT3Oz7+ZpKeIJkhCwco8+LS+6JR03r
	gxOhS7ILd+z5HIvzagt1KPw==
X-Google-Smtp-Source: AGHT+IEiIM5e80NzDGvoO0PEoXobTmaoyRMDUTlMa0fnINQdt1Hc+MrCGBWhG9etfLV1Zx0zsGRGog==
X-Received: by 2002:a05:600c:3153:b0:453:6124:e70e with SMTP id 5b1f17b1804b1-454b384e532mr59938705e9.9.1751993101215;
        Tue, 08 Jul 2025 09:45:01 -0700 (PDT)
Received: from localhost.localdomain ([156.208.8.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm13184563f8f.5.2025.07.08.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:45:00 -0700 (PDT)
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
Subject: [PATCH v2 2/2] staging: media: atomisp: unify HMM initialization tracking
Date: Tue,  8 Jul 2025 19:44:08 +0300
Message-Id: <20250708164408.79863-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250708164408.79863-1-abdelrahmanfekry375@gmail.com>
References: <20250708164408.79863-1-abdelrahmanfekry375@gmail.com>
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

This patch:
- Replaces the device-specific `flag` with a boolean `initialized` field
- Removes the global `hmm_initialized` variable
- Eliminates the hmm_bo_device_inited() helper function since we can
  now simply check the boolean
- Removes the redundant hmm_init() call from __hmm_alloc() since its 
  always called after hmm_init()
  
Tested by:
- Building the Driver.
- Applying to media-committers [1] tree.


Link: https://gitlab.freedesktop.org/linux-media/media-committers.git [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- replaces the init state enum used in v1 with boolean
- moves setting the flag uninited to hmm_bo_device_exit()
  
v1: https://lore.kernel.org/all/20250707140923.58935-3-abdelrahmanfekry375@gmail.com/
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


