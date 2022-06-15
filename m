Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751C554D2FA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348125AbiFOUvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348008AbiFOUvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5988E54FB9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zb5mOSR/lh5HwUCUm9dz7Tr2MoqsSBbUA7kP6jaC3G0=;
        b=GKwpeG5zxYhN9JgRzwYQh+O3wsPAw4NsXx4IHKIYpJqryWRVYjm490cT5OWUUN7OAz+KHZ
        TWp6DvdcCuJR3YhCWK/LFWnQulBlRl2a1sTdchdhbz0YiKDjCemkP/HUKPxbYj11HbOO/z
        85a6tIaA6ois8AqZLoQzN6UxB+YZwGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-GEchsDVCNiqB2WfwaTobiw-1; Wed, 15 Jun 2022 16:51:37 -0400
X-MC-Unique: GEchsDVCNiqB2WfwaTobiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D37C185A581;
        Wed, 15 Jun 2022 20:51:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4133B1131D;
        Wed, 15 Jun 2022 20:51:35 +0000 (UTC)
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
Subject: [PATCH v2 31/40] media: atomisp: drop HMM_BO_SHARE type
Date:   Wed, 15 Jun 2022 22:50:28 +0200
Message-Id: <20220615205037.16549-32-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HMM_BO_SHARE is not supported by the hmm_bo code at all, drop it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 5ed83e1aaa79..a4b193c35127 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -76,7 +76,6 @@
 
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
-	HMM_BO_SHARE,
 	HMM_BO_USER,
 	HMM_BO_LAST,
 };
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index a6b7f2b6247f..e5796ab7dbcf 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -875,13 +875,10 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
  * allocate/free physical pages for the bo.
  *
  * type indicate where are the pages from. currently we have 3 types
- * of memory: HMM_BO_PRIVATE, HMM_BO_USER, HMM_BO_SHARE.
+ * of memory: HMM_BO_PRIVATE, HMM_BO_USER.
  *
  * userptr is only valid when type is HMM_BO_USER, it indicates
  * the start address from user space task.
- *
- * from_highmem and userptr will both be ignored when type is
- * HMM_BO_SHARE.
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
-- 
2.36.0

