Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 020726316E4
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiKTWmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiKTWmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:42:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E038423BDE
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hwB+7PEqq8+R/70CFvGMEUUbuAHNsgfUpCsfrcDtZVM=;
        b=aFINBj9bELoBUOl+xwLiQc6mEgiwERxmKaWq6k1I/qkQYxUHnd0hEnVdeP5iwRWYm2Wl+q
        Ds0Wk6VOpZBcqlISMyXs1CeSOo8yHkKX24B3wM7YUHnFt2N6/d8L0s3i8kXdQR1p+UxE7l
        DLSIPUHuvZuGarLxe4JItAskMjCejwU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-a3CKkP_2NOujBeca0DNZnA-1; Sun, 20 Nov 2022 17:41:19 -0500
X-MC-Unique: a3CKkP_2NOujBeca0DNZnA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C1A6801755;
        Sun, 20 Nov 2022 22:41:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 900BF47505E;
        Sun, 20 Nov 2022 22:41:17 +0000 (UTC)
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
Subject: [PATCH 05/20] media: atomisp: Log an error on failing to alloc private-mem
Date:   Sun, 20 Nov 2022 23:40:46 +0100
Message-Id: <20221120224101.746199-6-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I managed to trigger an atomisp_css_start() error by pushing my test
system towards an OOM situation, this resulted in the following errors:

atomisp-isp2 0000:00:03.0: alloc pages err...
atomisp-isp2 0000:00:03.0: hmm_bo_alloc_pages failed.
atomisp-isp2 0000:00:03.0: stream[0] start error.

But it is not entirely clear what the root cause of
the "alloc pages err..." error is. I suspect the root cause is
alloc_pages_bulk_array() failing. Add a log message to make
the root cause more clear if this is hit again.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 465ba837f2ed..3c150268db51 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -637,6 +637,7 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 
 	ret = alloc_pages_bulk_array(gfp, bo->pgnr, bo->pages);
 	if (ret != bo->pgnr) {
+		dev_err(atomisp_dev, "alloc_pages_bulk_array() failed\n");
 		free_pages_bulk_array(ret, bo->pages);
 		return -ENOMEM;
 	}
-- 
2.38.1

