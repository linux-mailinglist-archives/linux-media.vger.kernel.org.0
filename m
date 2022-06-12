Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3EA0547AF4
	for <lists+linux-media@lfdr.de>; Sun, 12 Jun 2022 18:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiFLQGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 12:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbiFLQGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 12:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B7AB48E7A
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655049974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A13Tgu0+0ldCSVdWWfytuoNL33R3vDWsMrOpJ8spRz0=;
        b=hWqHIxzOAfoVO4MSs0PJcPaywyJgL76TowZpsLmdV4vagoaQ1C9uA1m97yDTjTlG26rRk0
        tD2r78Q7dX48XbMcXcAB8uzZSfU0jb8VISWdKqUQoFqm9IlWZ7rlWrgjYzlgKfGWoeMzVd
        cKxel8hci8374NVqNU/d+rEnrsps/fQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-er6C63x5PPejAU2D68HPYQ-1; Sun, 12 Jun 2022 12:06:12 -0400
X-MC-Unique: er6C63x5PPejAU2D68HPYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AE2B801E67;
        Sun, 12 Jun 2022 16:06:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 219BD2166B26;
        Sun, 12 Jun 2022 16:06:10 +0000 (UTC)
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
Subject: [PATCH 3/3] media: atomisp: fix -Wdangling-pointer warning
Date:   Sun, 12 Jun 2022 18:05:56 +0200
Message-Id: <20220612160556.108264-4-hdegoede@redhat.com>
In-Reply-To: <20220612160556.108264-1-hdegoede@redhat.com>
References: <20220612160556.108264-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

ia_css_rmgr_acq_vbuf() uses a local on stack
"struct ia_css_rmgr_vbuf_handle v" variable.

When this path using this is hit, either the rmgr_pop_handle() call
will make *handle point to another vbuf-handle, or because
v.count == 0, ia_css_rmgr_refcount_retain_vbuf() will alloc a new
vbuf-handle and make *handle point to it.

So on leaving the function *handle will never point to the on stack
vbuf-handle, but gcc does not know this and emits the following:

drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c: In function ‘ia_css_rmgr_acq_vbuf’:
drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:276:33: warning: storing the address of local variable ‘h’ in ‘*handle’ [-Wdangling-pointer=]
  276 |                         *handle = &h;
      |                         ~~~~~~~~^~~~
drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:257:40: note: ‘h’ declared here
  257 |         struct ia_css_rmgr_vbuf_handle h;
      |                                        ^
drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:257:40: note: ‘handle’ declared here

Rework the code using a new_handle helper to suppress this
false-postive compiler warning.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index afe2d22c603f..b84c6cff1499 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -254,14 +254,15 @@ void rmgr_pop_handle(struct ia_css_rmgr_vbuf_pool *pool,
 void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			  struct ia_css_rmgr_vbuf_handle **handle)
 {
-	struct ia_css_rmgr_vbuf_handle h = { 0 };
-
 	if ((!pool) || (!handle) || (!*handle)) {
 		IA_CSS_LOG("Invalid inputs");
 		return;
 	}
 
 	if (pool->copy_on_write) {
+		struct ia_css_rmgr_vbuf_handle *new_handle;
+		struct ia_css_rmgr_vbuf_handle h = { 0 };
+
 		/* only one reference, reuse (no new retain) */
 		if ((*handle)->count == 1)
 			return;
@@ -272,23 +273,30 @@ void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			h.size = (*handle)->size;
 			/* release ref to current buffer */
 			ia_css_rmgr_refcount_release_vbuf(handle);
-			*handle = &h;
+			new_handle = &h;
+		} else {
+			new_handle = *handle;
 		}
 		/* get new buffer for needed size */
-		if ((*handle)->vptr == 0x0) {
+		if (new_handle->vptr == 0x0) {
 			if (pool->recycle) {
 				/* try and pop from pool */
-				rmgr_pop_handle(pool, handle);
+				rmgr_pop_handle(pool, &new_handle);
 			}
-			if ((*handle)->vptr == 0x0) {
+			if (new_handle->vptr == 0x0) {
 				/* we need to allocate */
-				(*handle)->vptr = hmm_alloc((*handle)->size,
+				new_handle->vptr = hmm_alloc(new_handle->size,
 							     HMM_BO_PRIVATE, 0, NULL, 0);
 			} else {
 				/* we popped a buffer */
+				*handle = new_handle;
 				return;
 			}
 		}
+		/* Note that new_handle will change to an internally maintained one */
+		ia_css_rmgr_refcount_retain_vbuf(&new_handle);
+		*handle = new_handle;
+		return;
 	}
 	/* Note that handle will change to an internally maintained one */
 	ia_css_rmgr_refcount_retain_vbuf(handle);
-- 
2.36.0

