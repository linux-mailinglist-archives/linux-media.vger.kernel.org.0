Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C96454D2ED
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346780AbiFOUvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346977AbiFOUvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA65955222
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=om4wonvZVlTVMBBis5t+mHgTh4vhCpc21QdAQd+2nsQ=;
        b=Ian6ww3qUBYjlVpOMYn5Z0fgvigJInB230AxMG+JN49BN/jZ/M/bcWJECNgyOU01T90cdV
        T5OOjE8MlIsEx1tlbCNkiAva9Oqk5mzcqORedsAvaWitIWlfr18eKVDo7PrY+aVjH5djiH
        b/casnAaOqIyhcFdO6Ar4LFbQEfSeJ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-zJ937xLvP9uU4tNFCFokEQ-1; Wed, 15 Jun 2022 16:50:55 -0400
X-MC-Unique: zJ937xLvP9uU4tNFCFokEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B358285A585;
        Wed, 15 Jun 2022 20:50:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5F618EA9;
        Wed, 15 Jun 2022 20:50:53 +0000 (UTC)
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
Subject: [PATCH v2 08/40] media: atomisp: drop ATOMISP_MAP_FLAG_CONTIGUOUS
Date:   Wed, 15 Jun 2022 22:50:05 +0200
Message-Id: <20220615205037.16549-9-hdegoede@redhat.com>
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

Drop the ATOMISP_MAP_FLAG_CONTIGUOUS hmm_alloc flag. After the contiguous
flag removal done in previous patches in this series it is never set.

And hmm_alloc already did a WARN_ON on the flag and otherwise ignored it,
proving that contiguous support was already never used.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp.h | 3 +--
 drivers/staging/media/atomisp/pci/hmm/hmm.c           | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 22c4103b0385..a6ec9691afb2 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -915,8 +915,7 @@ struct atomisp_acc_map {
 
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
-#define ATOMISP_MAP_FLAG_CONTIGUOUS	0x0004
-#define ATOMISP_MAP_FLAG_CLEARED	0x0008
+#define ATOMISP_MAP_FLAG_CLEARED	0x0004
 
 struct atomisp_acc_state {
 	__u32 flags;			/* Flags, see list below */
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 54188197c3dc..a4722155ddef 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -230,8 +230,6 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	bool cached = attrs & ATOMISP_MAP_FLAG_CACHED;
 	int ret;
 
-	WARN_ON(attrs & ATOMISP_MAP_FLAG_CONTIGUOUS);
-
 	/*
 	 * Check if we are initialized. In the ideal world we wouldn't need
 	 * this but we can tackle it once the driver is a lot cleaner
-- 
2.36.0

