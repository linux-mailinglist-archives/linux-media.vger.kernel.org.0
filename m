Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF2D5B502D
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiIKRRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiIKRRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6423427DDA
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aFxF96TIGiY897UorKY6YR6mJKnuPccy39iJrdVw1Go=;
        b=RWYwNV51SbAgDzrrut7TE7MHONJLOwqPyEfIGF2l0+oZvXuROd+Agp6oCvyqA1mlMi8r6o
        vAwGU13HLfbgfTYwgxHayuDd7GzYZsgH87VLJXphCfzZAScELUS7MlZcknxECkkJQtdIF/
        Qz+6JHZyp1QN7NMd9SQnKw/VqY3KjKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-nntPsY9PN_qI2h1ApYzJ9g-1; Sun, 11 Sep 2022 13:17:10 -0400
X-MC-Unique: nntPsY9PN_qI2h1ApYzJ9g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4D7C101A54E;
        Sun, 11 Sep 2022 17:17:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 53E7B40334C;
        Sun, 11 Sep 2022 17:17:08 +0000 (UTC)
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
Subject: [PATCH 07/17] media: atomisp: Move atomisp_streaming_count() check into __atomisp_css_recover()
Date:   Sun, 11 Sep 2022 19:16:43 +0200
Message-Id: <20220911171653.568932-8-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both callers of __atomisp_css_recover() check atomisp_streaming_count()
first, move the check into __atomisp_css_recover().

And __atomisp_css_recover() already calls lockdep_assert_held(&isp->mutex),
so drop that from atomisp_css_flush().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4b459c4c6d76..a96a4658e113 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1282,6 +1282,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 
 	lockdep_assert_held(&isp->mutex);
 
+	if (!atomisp_streaming_count(isp))
+		return;
+
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
 	BUG_ON(isp->num_of_streams > MAX_STREAM_NUM);
@@ -1434,20 +1437,12 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 						  assert_recovery_work);
 
 	mutex_lock(&isp->mutex);
-
-	if (atomisp_streaming_count(isp))
-		__atomisp_css_recover(isp, true);
-
+	__atomisp_css_recover(isp, true);
 	mutex_unlock(&isp->mutex);
 }
 
 void atomisp_css_flush(struct atomisp_device *isp)
 {
-	lockdep_assert_held(&isp->mutex);
-
-	if (!atomisp_streaming_count(isp))
-		return;
-
 	/* Start recover */
 	__atomisp_css_recover(isp, false);
 
-- 
2.37.3

