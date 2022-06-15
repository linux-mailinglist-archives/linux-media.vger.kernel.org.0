Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E8654D30E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347679AbiFOUvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347588AbiFOUvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4184E54FB8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4PPvPz6YgG9+YP9CBYHzHqE3eLgaAkIIYmHYxABEPJc=;
        b=OlZ9/Zuy1tUxfyjrfzOLa3nbJ8d1Arbky+w1Xr6OFmach7QRndUXYFtaW7hDGdXJuTTotl
        gDDkHxMK9NMDba8tAyPNAF89qs1WhDisuUkSFumndIOMltY4/poMTiP0UDYasGJZk6WgEQ
        sz6C93wOZLnj22RJSzsUY+fYuwoBD7c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-XVwuayc1MC6OYYG8nsOwuw-1; Wed, 15 Jun 2022 16:51:12 -0400
X-MC-Unique: XVwuayc1MC6OYYG8nsOwuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4734C3C10227;
        Wed, 15 Jun 2022 20:51:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A61BC1131D;
        Wed, 15 Jun 2022 20:51:09 +0000 (UTC)
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
Subject: [PATCH v2 17/40] media: atomisp: remove bogus comment above hmm_bo_allocated() prototype
Date:   Wed, 15 Jun 2022 22:50:14 +0200
Message-Id: <20220615205037.16549-18-hdegoede@redhat.com>
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

The comment documenting hmm_bo_allocated() was copied (and not modified)
from the comment documenting hmm_bo_alloc(), so there are 2 copies
of the hmm_bo_alloc() documentation.

Remove the copy of the comment above the hmm_bo_allocated() prototype.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

