Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A6A549FC2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241940AbiFMUp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242073AbiFMUob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F01B15730
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bxfozDPT5gRKbPz1zPXOxZwZt0GpJCKAlQtpWApaH8o=;
        b=SG96NYodp15ViVNhL7DRSZ8eIP2iMem5vhm/74Ra3VXKsrvLEU24vszDURk5gQlD4eUkIy
        +/udztP2Pp4wWmNssSJhBO9ijKnYfzSthW1Yhnq1rblJrBB1OUs0Gxh4mcwz6SiWPPjzxH
        NAnq5bJZiiFRVVBhOEkdOoI970+2nQM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-M0hSq-BWMfaMRzE9CmU1oA-1; Mon, 13 Jun 2022 15:52:10 -0400
X-MC-Unique: M0hSq-BWMfaMRzE9CmU1oA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C10101A54E;
        Mon, 13 Jun 2022 19:52:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 93E2C2166B29;
        Mon, 13 Jun 2022 19:52:08 +0000 (UTC)
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
Subject: [PATCH 17/40] media: atomisp: remove bogus comment above hmm_bo_allocated() prototype
Date:   Mon, 13 Jun 2022 21:51:14 +0200
Message-Id: <20220613195137.8117-18-hdegoede@redhat.com>
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

The comment documenting hmm_bo_allocated() was copied (and not modified)
from the comment documenting hmm_bo_alloc(), so there are 2 copies
of the hmm_bo_alloc() documentation.

Remove the copy of the comment above the hmm_bo_allocated() prototype.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index eba1ddcb7e64..654e329b7a6b 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -211,13 +211,6 @@ void hmm_bo_ref(struct hmm_buffer_object *bo);
  */
 void hmm_bo_unref(struct hmm_buffer_object *bo);
 
-/*
- * allocate/free physical pages for the bo. will try to alloc mem
- * from highmem if from_highmem is set, and type indicate that the
- * pages will be allocated by using video driver (for share buffer)
- * or by ISP driver itself.
- */
-
 int hmm_bo_allocated(struct hmm_buffer_object *bo);
 
 /*
-- 
2.36.0

