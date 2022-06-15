Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327CB54D303
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347996AbiFOUvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347969AbiFOUvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E694854FBA
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N1k9PJysVwMTidAgnDgX6TaM5mfC+IQrzc6av0MUq/A=;
        b=iCVqnzEg7La8BaD3H30wNvbgvvvbK6lsNfb24Q2YLoPah3395HIGcVOKjzmYkUHqKKDXPC
        7CIqzAz6RRKNYc3SW5+mbc6WQ43/adnyImyiAL4jl61tXDVSBACHBO5P/GWqgq64ZBgaAd
        SNio0W6JScdI67/GyVXKgJhGdXrZVL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562--cPEY3X8OHyRU_ZPec9pPQ-1; Wed, 15 Jun 2022 16:51:30 -0400
X-MC-Unique: -cPEY3X8OHyRU_ZPec9pPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 903D7802D1F;
        Wed, 15 Jun 2022 20:51:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF501111F5;
        Wed, 15 Jun 2022 20:51:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 27/40] media: atomisp: remove unused hmm address translation functions
Date:   Wed, 15 Jun 2022 22:50:24 +0200
Message-Id: <20220615205037.16549-28-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hmm_isp_vaddr_to_host_vaddr() and hmm_host_vaddr_to_hrt_vaddr()
are unused, remove them.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   | 11 ----------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 20 -------------------
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 37366e333744..99bf7d01f9ef 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -66,17 +66,6 @@ void hmm_vunmap(ia_css_ptr virt);
  */
 void hmm_flush_vmap(ia_css_ptr virt);
 
-/*
- * Address translation from ISP shared memory address to kernel virtual address
- * if the memory is not vmmaped,  then do it.
- */
-void *hmm_isp_vaddr_to_host_vaddr(ia_css_ptr ptr, bool cached);
-
-/*
- * Address translation from kernel virtual address to ISP shared memory address
- */
-ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr);
-
 /*
  * map ISP memory starts with virt to specific vma.
  *
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 7de941d2c40a..1652b8b7ecec 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -598,23 +598,3 @@ void hmm_vunmap(ia_css_ptr virt)
 
 	hmm_bo_vunmap(bo);
 }
-
-void *hmm_isp_vaddr_to_host_vaddr(ia_css_ptr ptr, bool cached)
-{
-	return hmm_vmap(ptr, cached);
-	/* vmunmap will be done in hmm_bo_release() */
-}
-
-ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr)
-{
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_vmap_start(&bo_device, ptr);
-	if (bo)
-		return bo->start;
-
-	dev_err(atomisp_dev,
-		"can not find buffer object whose kernel virtual address is %p\n",
-		ptr);
-	return 0;
-}
-- 
2.36.0

