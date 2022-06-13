Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1476549FD6
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349830AbiFMUp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344519AbiFMUoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7ED3275F1
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=whwF76Q+43SpLpP8pIZE36crLAnd8esrwP7D/gxruK0=;
        b=HM++rLW4vZ0YxA5i0EKUxAqZ4Hxgn6+juuyiTDRcM0dbP3juZWhg7m16gk0Oep+YShme9X
        1S6dXDTYFBXKqohqOyFpaDUzyYjtgrA6gah8bkSRzegXm5y58GgI6ENm2/+NnJ1AcApaiC
        b6YJ+aIGU687USlZiwvK80gN6QPPBjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-fpeWPwndNCmuvHFCeCXT2A-1; Mon, 13 Jun 2022 15:52:35 -0400
X-MC-Unique: fpeWPwndNCmuvHFCeCXT2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F15A8101A54E;
        Mon, 13 Jun 2022 19:52:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 715C92166B26;
        Mon, 13 Jun 2022 19:52:33 +0000 (UTC)
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
Subject: [PATCH 31/40] media: atomisp: drop HMM_BO_SHARE type
Date:   Mon, 13 Jun 2022 21:51:28 +0200
Message-Id: <20220613195137.8117-32-hdegoede@redhat.com>
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

HMM_BO_SHARE is not supported by the hmm_bo code at all, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index dd96b5763dd2..7110a040f50a 100644
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
index a6b7f2b6247f..bcd96aa00529 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -875,13 +875,10 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
  * allocate/free physical pages for the bo.
  *
  * type indicate where are the pages from. currently we have 3 types
- * of memory: HMM_BO_PRIVATE, HMM_BO_USER, HMM_BO_SHARE.
+ * of memory: HMM_BO_PRIVATE, HMM_BO_USER..
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

