Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457346316EA
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiKTWnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiKTWnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F6E24F17
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ydEudaLMwu1GbbCDNTca/QZvsWBrkDGdamoggPl9hAI=;
        b=SQiI1FgZGf0lKWVF63etnhi4D3o/XKXem9mFOZ1Y9aDXOMKOnEFQFCvwqQ5YBPUW5ya648
        2TeH8rWT7nWWwsMW+X4qH3gWfxMhgN1Rh8NVh72L3lUa2P8fF+6cJK7MWqTjZYnoVcTF4a
        ClEBa4ygW0SRJ+1VdMLpZ8jpqIMDcoY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-JFlknQptN-qKRTKnNjg7DA-1; Sun, 20 Nov 2022 17:41:34 -0500
X-MC-Unique: JFlknQptN-qKRTKnNjg7DA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7382A101A52A;
        Sun, 20 Nov 2022 22:41:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F210C47505F;
        Sun, 20 Nov 2022 22:41:31 +0000 (UTC)
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
Subject: [PATCH 13/20] media: atomisp: Remove clearing of config from atomisp_css_uninit()
Date:   Sun, 20 Nov 2022 23:40:54 +0100
Message-Id: <20221120224101.746199-14-hdegoede@redhat.com>
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

atomisp_css_uninit() only runs when all streams are stopped and
atomisp_css_stop() already clears the config, so the clearing
of the config can be dropped from atomisp_css_uninit().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index adf77c9e481e..3237585d3044 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -864,15 +864,6 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 
 void atomisp_css_uninit(struct atomisp_device *isp)
 {
-	struct atomisp_sub_device *asd;
-	unsigned int i;
-
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		memset(&asd->params.config, 0, sizeof(asd->params.config));
-		asd->params.css_update_params_needed = false;
-	}
-
 	isp->css_initialized = false;
 	ia_css_uninit();
 }
-- 
2.38.1

