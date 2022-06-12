Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C07F547AF3
	for <lists+linux-media@lfdr.de>; Sun, 12 Jun 2022 18:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbiFLQGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 12:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbiFLQGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 12:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 38ED7167E9
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655049975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Aov6pXO+yzf9WmB8y7bNLe3J7gyFYKqaeJT3/heNZac=;
        b=dbrvkfMlNnaLWq2tSvqfp3Rj3XLtUT/JIGvQW/V1emhg65r1aLcbGGG1/opZIboRNTpi8t
        /fYyvCPam92y+HGEk1sN37x8nmmgMBm8DRY/wYKOSDL5vVilb1/u0847K0SOhlw8/5AJIy
        VwWWmLiw6fwf56rigU0MMTclhZHEtbM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-oJL0rW8wP4mlEauxzn5S-A-1; Sun, 12 Jun 2022 12:06:08 -0400
X-MC-Unique: oJL0rW8wP4mlEauxzn5S-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D5901C00AC3;
        Sun, 12 Jun 2022 16:06:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AB25E2166B26;
        Sun, 12 Jun 2022 16:06:06 +0000 (UTC)
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
Subject: [PATCH 1/3] media: atomisp: revert "don't pass a pointer to a local variable"
Date:   Sun, 12 Jun 2022 18:05:54 +0200
Message-Id: <20220612160556.108264-2-hdegoede@redhat.com>
In-Reply-To: <20220612160556.108264-1-hdegoede@redhat.com>
References: <20220612160556.108264-1-hdegoede@redhat.com>
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

The gcc is warning about returning a pointer to a local variable
is a false positive.

The type of handle is "struct ia_css_rmgr_vbuf_handle **" and
"h.vptr" is left to NULL, so the "if ((*handle)->vptr == 0x0)"
check always succeeds when the "*handle = &h;" statement which
gcc warns about executes. Leading to this statement being executed:

	rmgr_pop_handle(pool, handle);

If that succeeds,  then *handle has been set to point to one of
the pre-allocated array of handles, so it no longer points to h.

If that fails the following statement will be executed:

	/* Note that handle will change to an internally maintained one */
	ia_css_rmgr_refcount_retain_vbuf(handle);

Which allocated a new handle from the array of pre-allocated handles
and then makes *handle point to this. So the address of h is actually
never returned.

The fix for the false-postive compiler warning actually breaks the code,
the new:

	**handle = h;

is part of a "if (pool->copy_on_write) { ... }" which means that the
handle where *handle points to should be treated read-only, IOW
**handle must never be set, instead *handle must be set to point to
a new handle (with a copy of the contents of the old handle).

The old code correctly did this and the new fixed code gets this wrong.

Note there is another patch in this series, which fixes the warning
in another way.

Fixes: fa1451374ebf ("media: atomisp: don't pass a pointer to a local variable")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 39604752785b..d96aaa4bc75d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -254,7 +254,7 @@ void rmgr_pop_handle(struct ia_css_rmgr_vbuf_pool *pool,
 void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			  struct ia_css_rmgr_vbuf_handle **handle)
 {
-	struct ia_css_rmgr_vbuf_handle h = { 0 };
+	struct ia_css_rmgr_vbuf_handle h;
 
 	if ((!pool) || (!handle) || (!*handle)) {
 		IA_CSS_LOG("Invalid inputs");
@@ -272,7 +272,7 @@ void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			h.size = (*handle)->size;
 			/* release ref to current buffer */
 			ia_css_rmgr_refcount_release_vbuf(handle);
-			**handle = h;
+			*handle = &h;
 		}
 		/* get new buffer for needed size */
 		if ((*handle)->vptr == 0x0) {
-- 
2.36.0

