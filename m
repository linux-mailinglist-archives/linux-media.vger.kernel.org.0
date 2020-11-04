Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3EE2A5C8F
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 03:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbgKDCC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 21:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgKDCC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 21:02:26 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9EEC061A4D;
        Tue,  3 Nov 2020 18:02:26 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id b3so16021492pfo.2;
        Tue, 03 Nov 2020 18:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zLZ2B1qFXCWnVsySq4HnUvTNgYrIH/VL0K8QObmr1U0=;
        b=OdEs27YeZFJ7ENMGNloKWIAjFkabev0ketVmn74U7x0k3JKcPNahaybsTGU+ZNTpQs
         FdxnNdrB06C1iSbw3SRH4X2sB9uGZQPOYuE980iAJRpIpnoX1pIWTla1Bk22fX6Ectl6
         +yxXppm2WiU811fI2llEyrVjAVIi5458NZEe0w7L12dUjGZonwdmR2xS9v+RrTPzsST2
         Ai5WJ2hk+7d02soZ9jX3wPAwy5guA6DS/Z1JHBxkZ8fDMp7J9fdtBVHc0LvkFq47s2sl
         dqKRB5OvItYRoqJ4Q1Q6LyPLahuhAzxqPJRxJ3bEP6HvxmxNsdzgiNiu7MeLTTpLD7lr
         BSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zLZ2B1qFXCWnVsySq4HnUvTNgYrIH/VL0K8QObmr1U0=;
        b=Y8JwAGaDoTR8il4Jr2ZCPgog3zPNSuO+nNMu5JpSkrA1BcIwW4ifS2le8J5eG7J3sc
         0C84IK2WELdyXNGmnZrUFcFVibuisTWK8HjS5lk9WCZBJACU0q1sbynjtwKBIR3kBm46
         /G3oCT5hPf0A6L9SRD6m5x3Mh3uXj5B0n6jVZ+XXweqPw81kzKXTCp4VoDi6e3/mifhQ
         TjCHVoFOo1R8YgOEzdhWl1HcDM+4jfNx7bHhy8X1rZ3+i0kLBmjoDpI1TeBNc6XemNMz
         SGQGM0rthYyxwneJMU6UnfwzWhMx12PchlUfZedvcacZznVaDz4kJWPzBQrMxuX0je/t
         oQfg==
X-Gm-Message-State: AOAM531G7iHKpI61Ve/FHZPwt29FPtaUhk1eFEn+cc7DbZsJqS7HPQA0
        iZQ32CUEIGa5uoHHwC/RWDI=
X-Google-Smtp-Source: ABdhPJy3W+rqqTUMVNnBVx8pPGEeGA53ALYocNahJvGf4dk8IFBlNeYmMpfzStMN55qkRx8dQRBiwg==
X-Received: by 2002:a63:2247:: with SMTP id t7mr19576397pgm.215.1604455346168;
        Tue, 03 Nov 2020 18:02:26 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([171.61.79.67])
        by smtp.gmail.com with ESMTPSA id g16sm414689pju.5.2020.11.03.18.02.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2020 18:02:25 -0800 (PST)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, gustavoars@kernel.org,
        akpm@linux-foundation.org, vbabka@suse.cz,
        daniel.m.jordan@oracle.com, walken@google.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] media: atomisp: Fixed error handling path
Date:   Wed,  4 Nov 2020 07:32:11 +0530
Message-Id: <1604455331-28031-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside alloc_user_pages() based on flag value either pin_user_pages()
or get_user_pages_fast() will be called. However, these API might fail.

But free_user_pages() called in error handling path doesn't bother
about return value and will try to unpin bo->pgnr pages, which is
incorrect.

Fix this by passing the page_nr to free_user_pages(). If page_nr > 0
pages will be unpinned based on bo->mem_type. This will also take care
of non error handling path.

Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory
allocation")
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:
    Added review tag.

 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index f13af23..0168f98 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -857,16 +857,17 @@ static void free_private_pages(struct hmm_buffer_object *bo,
 	kfree(bo->page_obj);
 }
 
-static void free_user_pages(struct hmm_buffer_object *bo)
+static void free_user_pages(struct hmm_buffer_object *bo,
+			    unsigned int page_nr)
 {
 	int i;
 
 	hmm_mem_stat.usr_size -= bo->pgnr;
 
 	if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
-		unpin_user_pages(bo->pages, bo->pgnr);
+		unpin_user_pages(bo->pages, page_nr);
 	} else {
-		for (i = 0; i < bo->pgnr; i++)
+		for (i = 0; i < page_nr; i++)
 			put_page(bo->pages[i]);
 	}
 	kfree(bo->pages);
@@ -942,6 +943,8 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		dev_err(atomisp_dev,
 			"get_user_pages err: bo->pgnr = %d, pgnr actually pinned = %d.\n",
 			bo->pgnr, page_nr);
+		if (page_nr < 0)
+			page_nr = 0;
 		goto out_of_mem;
 	}
 
@@ -954,7 +957,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 
 out_of_mem:
 
-	free_user_pages(bo);
+	free_user_pages(bo, page_nr);
 
 	return -ENOMEM;
 }
@@ -1037,7 +1040,7 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 	if (bo->type == HMM_BO_PRIVATE)
 		free_private_pages(bo, &dynamic_pool, &reserved_pool);
 	else if (bo->type == HMM_BO_USER)
-		free_user_pages(bo);
+		free_user_pages(bo, bo->pgnr);
 	else
 		dev_err(atomisp_dev, "invalid buffer type.\n");
 	mutex_unlock(&bo->mutex);
-- 
1.9.1

