Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9280549FD3
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344486AbiFMUpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245018AbiFMUod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC84223166
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iFynd70RKd+ifH9nt8FoEcWZ/87kXgJcfOjH5JcDGCM=;
        b=QsJum5XAuAI5eyukj70lwlfw2cDDTweTNvJZQSn/y0jxdzGi71/ZQQRMtTYBuh4lTOyBHy
        2q4IfbroOU1c9gQeV/z6kSMzqhIwC70oAuLkD+j3F2nsfENNwSVNtOwykRLBuS0kf1OtJ4
        Figa0EwFBaIb7SZAZoHSHkFeRnDDuRY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-n_x3M6I_PeKG0GFl35gFcg-1; Mon, 13 Jun 2022 15:52:30 -0400
X-MC-Unique: n_x3M6I_PeKG0GFl35gFcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3B1080B71A;
        Mon, 13 Jun 2022 19:52:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2E96D2166B2A;
        Mon, 13 Jun 2022 19:52:28 +0000 (UTC)
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
Subject: [PATCH 28/40] media: atomisp: add hmm_create_from_userdata() helper
Date:   Mon, 13 Jun 2022 21:51:25 +0200
Message-Id: <20220613195137.8117-29-hdegoede@redhat.com>
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

Most hmm_alloc() callers want BO_PRIVATE type memory.

Add a hmm_create_from_userdata() helper for other cases so that
the hmm_alloc() calls for all the callers who don't want this
can be simplied.

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

