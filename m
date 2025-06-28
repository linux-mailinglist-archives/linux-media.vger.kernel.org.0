Return-Path: <linux-media+bounces-36147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9FAEC52A
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 07:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8401C4A68C7
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 05:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD85221E087;
	Sat, 28 Jun 2025 05:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1Z3fxyy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F67198A09;
	Sat, 28 Jun 2025 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751088387; cv=none; b=oqPS9xEYTJoR4QmAxmWL2/SS77JITmjLOPU+ewTSP9owl+qJj/12EyHHycSW27sN+nmwVA78HAtgkTyhodZT/2VnlKydCJwaH+Pb7R4HhXtlnQpBx+YdP/WiVg5e1IZSEtYPzoFxlmRY/iwLepekojhy03ji5BfKKuYcWBFiFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751088387; c=relaxed/simple;
	bh=boM0zRBXLjwthJwgYSDO0LB1VAaDDug+6PDOcd8jBGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ce1gZ3gYsMpCRDwel4wZKrftjtz3B9R1BPZtKd/8EYsnzAUcVLYJa+5slzF8u72N7idPYUOHmSYayoMwREBCCidVcuZWLDAwcvbIwpTpKOdW8Q64B/LxsC4hfAFoC6QqSivVjgf8gi/zc5Ig3PALdjiZy48r/xvEms2VqpIdk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1Z3fxyy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso407154f8f.2;
        Fri, 27 Jun 2025 22:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751088384; x=1751693184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKiNM7/pAXmiQj3djLWyWoHT8Gthrzr/6qV9hsqDsUI=;
        b=j1Z3fxyyD6tHbzSwj/YISqBys+3g2mc4OowbEOfXMAjeg1ERIlOOJc3WAF0UQ3VU9d
         HaQnVqb1/5qt7zXxWIRib2qn6e4qp/+eRIjiBLEK147Xj3CPZxU/HSKxKn0brJApkNVp
         bK7DTHXQ1pXqdt/8g0FEQ29QF2yBxRWX9fmQK/fs9Jcp95lxRbvoCZg4Xda42beasDvE
         gcX7gE3Qlfu+p7kdN/GcJpf/Psx7sR4sTAx+bMVA2H7XSzI/9CsiBPCqaU8kOgSzKJo3
         8e3rgOd6RefYsFlhc6kw29qRJzo7Cm6EGgz7pkCkVooIniLrlqJPqTcI7lazZ49kRut8
         5qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751088384; x=1751693184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKiNM7/pAXmiQj3djLWyWoHT8Gthrzr/6qV9hsqDsUI=;
        b=CFv8nJZ+igkADLmS4Me2bM4c1WjXvwUr+bjFUv48NSC5a710n1eegc7CMcox2teek6
         eQ1Dl88/5MUVw4kkHmKK9gsQ9Vk03dMB64aUuvaqy9fj2YFoG7M5q1l/Yln2xF6gpMym
         IQ6+sUjNMHVam2xw9SWlDJwU0HzJkd7JGSu3Q4JK+cp/yhJ5+5AHQA7hHJg6y8GQ4Ifu
         RTaKMS2DFZd7E6Xv3i6S07uUVOzYEJmquVlAdP7QtMZD9ctcwb62mgB31gX3JZ7O8YiV
         wxdh/Dw+0O8VovghpX5XQxZfY36In5cf0M6VS9bKVwcD8XnIDfqJxQpRRu9KCwYg2GB9
         EFvA==
X-Forwarded-Encrypted: i=1; AJvYcCVbPyXcbmhmALSLd2x6ms+q7URHYIUso4DHoHisRbFdQlYw0oLk8i4QqN+h8t7575WB2+Jk1eKTtO77tU8=@vger.kernel.org, AJvYcCVbYcR7G6Q2g7TbyYDwhmNEQDZDqzWjhJ9oxjfC7e3M3tYPpQI3BN4asKQWartNbQErt6e9+I1Tjnz9Vko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTAh/anZCl78c9rsOUt9z4jtzekvLDJlF3actUnTC5sdVxowh
	ZLSgQA6Saxk8Z/MtDqUBDhr/Qi7CWRGqfE+iTmeutoNtbf32qK3uL+6O
X-Gm-Gg: ASbGncvtpKanV4yFBwgXd5IV79DL7N8/enYQOKmyXlC1t8tkHDpHmPKgKwVP2B7YWFW
	geRUoFynTnQJRNACdei+tFRGO/svUhcldYmW7fXGXBsAIqWG52WfW9YY1QUvEGRP+VGLJumuk/y
	DhpbaSIAEdFdhC+Ks/VH2nSWIZToHurUY5kVDmysWGna6Bqk02DOp0zFwcikHYedxNJ8JiOIw3Z
	NScC++gGblIbfXraHBO6CCmhv8PQNMlhdomOWEzDxLGU194hmJxFGfVovr4EpTBUv+3yv2uLEhf
	Thje9KYj7slg983y0h2qTwWhepsRL5tde31O63xaNcoEdPkxuMFkDCl1K6/R2cKVle3+oIni6p7
	tXfn9aMbfIZkW7DOenpt7fJ4=
X-Google-Smtp-Source: AGHT+IEhmKtKJ6ishzSKPnEF+eduFX7OxjSKBg8TeE0H+zh5uxxd+nQywKJLgF9bYCuTnjTMwE84Dg==
X-Received: by 2002:a05:600c:c0c3:20b0:453:bf1:8895 with SMTP id 5b1f17b1804b1-453955642e3mr2860875e9.5.1751088383609;
        Fri, 27 Jun 2025 22:26:23 -0700 (PDT)
Received: from localhost.localdomain ([156.208.43.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm99905265e9.22.2025.06.27.22.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:26:23 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix premature setting of HMM_BO_DEVICE_INITED flag
Date: Sat, 28 Jun 2025 08:25:36 +0300
Message-Id: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
before key initialization steps like kmem_cache_create(),
kmem_cache_alloc(), and __bo_init().

This means that if any of these steps fail, the flag remains set,
misleading other parts of the driver (e.g. hmm_bo_alloc())
into thinking the device is initialized. This could lead
to undefined behavior or invalid memory use.

Additionally, since __bo_init() is called from inside
hmm_bo_device_init() after the flag was already set, its internal
check for HMM_BO_DEVICE_INITED is redundant.

- Move the flag assignment to the end after all allocations succeed.
- Remove redundant check of the flag inside __bo_init()

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 224ca8d42721..5d0cd5260d3a 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -37,8 +37,6 @@ static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
 		     unsigned int pgnr)
 {
 	check_bodev_null_return(bdev, -EINVAL);
-	var_equal_return(hmm_bo_device_inited(bdev), 0, -EINVAL,
-			 "hmm_bo_device not inited yet.\n");
 	/* prevent zero size buffer object */
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
@@ -341,7 +339,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 	spin_lock_init(&bdev->list_lock);
 	mutex_init(&bdev->rbtree_mutex);

-	bdev->flag = HMM_BO_DEVICE_INITED;

 	INIT_LIST_HEAD(&bdev->entire_bo_list);
 	bdev->allocated_rbtree = RB_ROOT;
@@ -376,6 +373,8 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,

 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);

+	bdev->flag = HMM_BO_DEVICE_INITED;
+
 	return 0;
 }

--
2.25.1


