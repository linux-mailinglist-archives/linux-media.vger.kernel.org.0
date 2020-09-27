Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D5527A189
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 17:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgI0PI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 11:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgI0PI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 11:08:29 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0635C0613CE;
        Sun, 27 Sep 2020 08:08:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so7013134pfg.13;
        Sun, 27 Sep 2020 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5SVq0w/G+BJ0BoVyLc2hLMW/0QGne7FVXE/0ouMIQTk=;
        b=UAJHbXD4pUnwppm9iqHuRKXE1T9OvaMBWCBVDP3NGuqJaNxJty/AMalHQ4a0dsVH++
         Plru0DNUbaHjINH3PkT1yubbx+UnOCNSIkhP4g7w57FjlZOsmbLu5QESZTKkUaCy+ISo
         3d4LXOyOkZn/zIfVkpgKSQ3VJQt45oZoWABEvCCHYhiTRXI2oEblHDqgdTQm+l11/pNU
         sNZ1XUp6OQ1pfpSP3RyoecxMipmqLcftJEXB62kmmwv/QHyXmR/9rJyT20tgAHIhTWT3
         6nYBC1CskgWEPkNC/pmsIulyjTD+EWcJRMFdxdqAC0OFxZwjXHZcudLFskQaoP5fg4kR
         2rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5SVq0w/G+BJ0BoVyLc2hLMW/0QGne7FVXE/0ouMIQTk=;
        b=T/W2lONbMFNrIGiq/zgUdkNb6gwd4Ubhv1XyQWssiptua47+CDrTc0yjELZQ9CC9sL
         8yGZecQw3TvSmwt4ZhW0krEgSV3ymhLzKAMBufokNc6RIsrOlSQWMpE/GS9urCAbMTDD
         HWPH1bX7JR27t6Y8UARtcvgUOpY3p8bS4nsax6PlbdAK+uphEA5jiEcx8GpyReRpEIfY
         2CbyWc3H68utGmlZD/eWJlpVqqAGu0h6bbjGplkQLjU2i/VvMmp50IL4dqeISbk360vZ
         1Sl0cwvxJCzasIQzlmN/FDZ2bELIu5qhopjMHAdDGoO0SGu9V9jtsabcaoSGmZpn1Z98
         Bn8g==
X-Gm-Message-State: AOAM532IGevs+v95JE3oxwL3gCVW5PjbXBRcaUmIFbwJJA5Qdclo0CZS
        p1AdooHhHxnpl2MXUpkRPUs=
X-Google-Smtp-Source: ABdhPJzxBslQerYnkiihEyJMATnZ9dRB/0v/TFlZdW7LYCAdJkD2VYfoNnC1t/1jYTH/LH8AZpPCxw==
X-Received: by 2002:a62:6147:0:b029:142:2501:34e8 with SMTP id v68-20020a6261470000b0290142250134e8mr7398794pfb.65.1601219308467;
        Sun, 27 Sep 2020 08:08:28 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.144.166])
        by smtp.gmail.com with ESMTPSA id t9sm1384795pgp.90.2020.09.27.08.08.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Sep 2020 08:08:27 -0700 (PDT)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, daniel.m.jordan@oracle.com,
        akpm@linux-foundation.org, walken@google.com, gustavoars@kernel.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] media: atomisp: Fixed error handling path
Date:   Sun, 27 Sep 2020 20:38:04 +0530
Message-Id: <1601219284-13275-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
---
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

