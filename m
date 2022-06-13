Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDCC3549FDB
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350535AbiFMUqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346756AbiFMUpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:45:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B4DC427FF7
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hSZMBNxnsB7j5qv9ISB5RFR/JfrygUvTPg3f4GiAdI0=;
        b=AMfA3g5kMyyVyCcMgIrSrGmrXUu+OSnJdJ+NbzfJ0CVQAEJ6ghl5gElMX1dbMgbEPFMo3C
        ulvYgMCyuF32MqdpOfRJTMF9CUbfLeJFvJ9PNoJaim3ILALiUV6hY7qNWFqyAbB8EYGwM8
        7K9hrfwMH91fTskS6hHyGrnf97N011Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-1I88YryNN2Ciswob3Yr-7A-1; Mon, 13 Jun 2022 15:52:44 -0400
X-MC-Unique: 1I88YryNN2Ciswob3Yr-7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFE0F801755;
        Mon, 13 Jun 2022 19:52:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 326792166B29;
        Mon, 13 Jun 2022 19:52:42 +0000 (UTC)
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
Subject: [PATCH 36/40] media: atomisp: use atomisp_create_pipes_stream() in more places
Date:   Mon, 13 Jun 2022 21:51:33 +0200
Message-Id: <20220613195137.8117-37-hdegoede@redhat.com>
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

Use atomisp_create_pipes_stream() in 2 more places,
instead of open coding it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 358ef29f27ba..76dab48cea67 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -810,7 +810,6 @@ int atomisp_create_pipes_stream(struct atomisp_sub_device *asd)
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd)
 {
-	int ret;
 	struct atomisp_device *isp = asd->isp;
 
 	if (__destroy_streams(asd, true))
@@ -819,20 +818,7 @@ int atomisp_css_update_stream(struct atomisp_sub_device *asd)
 	if (__destroy_pipes(asd, true))
 		dev_warn(isp->dev, "destroy pipe failed.\n");
 
-	ret = __create_pipes(asd);
-	if (ret) {
-		dev_err(isp->dev, "create pipe failed %d.\n", ret);
-		return -EIO;
-	}
-
-	ret = __create_streams(asd);
-	if (ret) {
-		dev_warn(isp->dev, "create stream failed %d.\n", ret);
-		__destroy_pipes(asd, true);
-		return -EIO;
-	}
-
-	return 0;
+	return atomisp_create_pipes_stream(asd);
 }
 
 int atomisp_css_init(struct atomisp_device *isp)
@@ -1150,15 +1136,9 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	 * recreated in the next stream on.
 	 */
 	if (!asd->stream_prepared) {
-		if (__create_pipes(asd)) {
-			dev_err(isp->dev, "create pipe error.\n");
-			return -EINVAL;
-		}
-		if (__create_streams(asd)) {
-			dev_err(isp->dev, "create stream error.\n");
-			ret = -EINVAL;
-			goto stream_err;
-		}
+		ret = atomisp_create_pipes_stream(asd);
+		if (ret)
+			return ret;
 	}
 	/*
 	 * SP can only be started one time
-- 
2.36.0

