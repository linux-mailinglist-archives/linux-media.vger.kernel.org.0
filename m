Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691FD54D2FD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347974AbiFOUvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347839AbiFOUve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A2AD54FB8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fz/z2YLq25ZCjQCq6TV9bCXZj16ZvJV7EQboGZckKDU=;
        b=YXthfGLin2tPpFhMAVDKcpxbv7o+YqAUFYXPxtAG/HwBczm4f7ZnhdDdvA+1UhPV6WrKbp
        EAuNMrQXLvVZ3ZQTvRWavi3H7bW6QEHjTUYUTFa3pVOC+JbMpCJW/anPdkMSjrSdamIt04
        HyG9MgoyUeXKWtt3/UAIaPBgfv5UQeM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-DrMfE_wwMf6Sh3Ug1Zme0A-1; Wed, 15 Jun 2022 16:51:32 -0400
X-MC-Unique: DrMfE_wwMf6Sh3Ug1Zme0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66098800971;
        Wed, 15 Jun 2022 20:51:31 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4DC61131D;
        Wed, 15 Jun 2022 20:51:29 +0000 (UTC)
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
Subject: [PATCH v2 28/40] media: atomisp: add hmm_create_from_userdata() helper
Date:   Wed, 15 Jun 2022 22:50:25 +0200
Message-Id: <20220615205037.16549-29-hdegoede@redhat.com>
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

Most hmm_alloc() callers want BO_PRIVATE type memory.

Add a hmm_create_from_userdata() helper for other cases so that
the hmm_alloc() calls for all the callers who don't want this
can be simplied.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h             | 1 +
 drivers/staging/media/atomisp/pci/hmm/hmm.c                 | 5 +++++
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 99bf7d01f9ef..615805d0dd91 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -39,6 +39,7 @@ void hmm_cleanup(void);
 ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		     int from_highmem, const void __user *userptr,
 		     const uint16_t attrs);
+ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr);
 void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 1652b8b7ecec..bc5beb5f8e97 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -221,6 +221,11 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	return 0;
 }
 
+ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr)
+{
+	return hmm_alloc(bytes, HMM_BO_USER, 0, userptr, 0);
+}
+
 void hmm_free(ia_css_ptr virt)
 {
 	struct hmm_buffer_object *bo;
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index f3b80650e1ad..b0ce288b76be 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -171,7 +171,7 @@ int ia_css_frame_map(struct ia_css_frame **frame,
 		goto error;
 	}
 
-	me->data = hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data, 0);
+	me->data = hmm_create_from_userdata(me->data_bytes, data);
 	if (me->data == mmgr_NULL)
 		err = -EINVAL;
 
-- 
2.36.0

