Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE42268C44
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 15:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgINNeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 09:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgINN3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 09:29:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13B5C06178B;
        Mon, 14 Sep 2020 06:29:32 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g4so17638622edk.0;
        Mon, 14 Sep 2020 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2sgKFqAzyYTWFS7DpgNkPf7xuqkExWpe0vtA6hya4p8=;
        b=LNYaV5htN1AoGcRr3qutKAdIAJ9K2NpHJmZnCLnFDlG8+zhSr8pFBVrIVZbK7upLCy
         XuYIA5pbVz06HyYiXjA0CX8OrBfsP8QYVTX6yJ60VAjafiTzs3Dr1q7h1S6WN1SGAvlY
         UXlmfxZ5/aBJS18uzwRmNUI3/lYVMDzcdWcPZzIRtlGG2B6QiV90AnQEfAOpca3J5cuM
         fi/i79PCqkzlb/1pkXfPwtPFhCm+AEfUwe9iWPeCcG3ahwbSU9PfGzYe8A8PulfEuuIe
         /yCSNERBUwZ4Herw4m2hVxb+aHQ2rdJcpWKX6iPZoqfXgRCIkWGGqsSIIr4ud7pRIc3R
         2DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2sgKFqAzyYTWFS7DpgNkPf7xuqkExWpe0vtA6hya4p8=;
        b=AdEobLBxLwsypFTpwwmuXPs3IJYWarxtMVuuDDMehBV0ap8bz/C9eaDqvAMwr5xWhf
         LatGiZRNvPyJSIceFYo+OdA+zJIqBd6LrkiivACMfRS7fhQGM/jvecHfbrDrudhdF++0
         u86No2bvYWZg6eEEgRhG9idyxKPidBPqVrgUweEJiu9l9eD6iC9jNxbmD8E8H6ML1xLg
         IIaXFx30rtFojSumicyAon89mousZPc5zAdywMRmHki4HdKP+AFUs2OueePk8oK6FAFt
         Ty8vWS4DiVH65NgH/m9RMYoylR4HzCMAtQITx3Hh/6djMEX8Ac0YxL3y1yzPkEQKq7OK
         6I4g==
X-Gm-Message-State: AOAM5304ixko22aLBDbL+mKEGgZ08GcSCONvwRgRKzUte8lh9M99aesM
        U1+HiJ1ThN/R9n/pPxSSPUE=
X-Google-Smtp-Source: ABdhPJwqz+YzShnzPAVkh+LgWPDH996EZ9R5Asg2qCZETs+L6ijZw4dfeniXkQwebJgtgDxC1+lltA==
X-Received: by 2002:aa7:cad3:: with SMTP id l19mr16523629edt.352.1600090171724;
        Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6179:d701:8021:da3d])
        by smtp.gmail.com with ESMTPSA id d6sm9575625edm.31.2020.09.14.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:29:30 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 2/2] mm: introduce vma_set_file function
Date:   Mon, 14 Sep 2020 15:29:20 +0200
Message-Id: <20200914132920.59183-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914132920.59183-1-christian.koenig@amd.com>
References: <20200914132920.59183-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the new vma_set_file() function to allow changing
vma->vm_file with the necessary refcount dance.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 16 +++++-----------
 include/linux/mm.h        |  2 ++
 mm/mmap.c                 | 16 ++++++++++++++++
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1699a8e309ef..672f3525ba74 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1163,20 +1163,14 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		return -EINVAL;
 
 	/* readjust the vma */
-	get_file(dmabuf->file);
-	oldfile = vma->vm_file;
-	vma->vm_file = dmabuf->file;
+	oldfile = vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
 	ret = dmabuf->ops->mmap(dmabuf, vma);
-	if (ret) {
-		/* restore old parameters on failure */
-		vma->vm_file = oldfile;
-		fput(dmabuf->file);
-	} else {
-		if (oldfile)
-			fput(oldfile);
-	}
+	/* restore old parameters on failure */
+	if (ret)
+		vma_set_file(vma, oldfile);
+
 	return ret;
 
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1983e08f5906..398a6fdaad1e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2688,6 +2688,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
 }
 #endif
 
+struct file *vma_set_file(struct vm_area_struct *vma, struct file *file);
+
 #ifdef CONFIG_NUMA_BALANCING
 unsigned long change_prot_numa(struct vm_area_struct *vma,
 			unsigned long start, unsigned long end);
diff --git a/mm/mmap.c b/mm/mmap.c
index 40248d84ad5f..d3c3c510f643 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vma)
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
 }
 
+/*
+ * Change backing file, only valid to use during initial VMA setup.
+ */
+struct file *vma_set_file(struct vm_area_struct *vma, struct file *file)
+{
+	if (file)
+	        get_file(file);
+
+	swap(vma->vm_file, file);
+
+	if (file)
+		fput(file);
+
+	return file;
+}
+
 /*
  * Requires inode->i_mapping->i_mmap_rwsem
  */
-- 
2.17.1

