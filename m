Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5394D549FCF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242428AbiFMUpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244902AbiFMUod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7193A21E03
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iXzF8c+G74R5pxjyKZKrh+13qimr9LWSmV/o7SjUfNo=;
        b=BF6NbUNvzuiLF/FsXv9nSray2PCbxXAX3eg34lLsccjAhbO65Sow9RdGRgzw6OeH+/QyIg
        xHEyy5z174yXU4F9i4LFqSXBNGPUHjXo+x+r1C5eGGmJdd1oqvkO5E0768Kt4EaCtIgwXp
        +x6f6BgRjn1LrgYFmxBF0t+o9KwifKg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-P1ekgWAFPlC5UdZswKM15A-1; Mon, 13 Jun 2022 15:52:28 -0400
X-MC-Unique: P1ekgWAFPlC5UdZswKM15A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E76943801F4A;
        Mon, 13 Jun 2022 19:52:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F0A42166B26;
        Mon, 13 Jun 2022 19:52:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 27/40] media: atomisp: remove unused hmm address translation functions
Date:   Mon, 13 Jun 2022 21:51:24 +0200
Message-Id: <20220613195137.8117-28-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hmm_isp_vaddr_to_host_vaddr() and hmm_host_vaddr_to_hrt_vaddr()
are unused, remove them.

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

