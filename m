Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C4E54D2F6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348302AbiFOUv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348281AbiFOUv4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA39154FB8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xn1BjcqbjOPjfLSq1HvKxJhbEfuR4scFLQSnAuk4tOU=;
        b=jJPaKHJrPRyZWqJ26SWtnZYK1AP7n2F6UZowwNM5gb7eDFjxhkibOEv1jJ2r6BfR7MeLCI
        f+FmGe5dcoYuLo4IeBVCVb1Rza/uCPoVFR7lovcSN9y9FNi5aw7zP4H1FylDHZRGWLBOZL
        aGbc6G38lNiJnlGMb78wc+bCrueeYgI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-bHhn8jbBPAuLia0Jbnz33A-1; Wed, 15 Jun 2022 16:51:52 -0400
X-MC-Unique: bHhn8jbBPAuLia0Jbnz33A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF4E382ECC4;
        Wed, 15 Jun 2022 20:51:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3020F18EA9;
        Wed, 15 Jun 2022 20:51:46 +0000 (UTC)
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
Subject: [PATCH v2 37/40] media: atomisp: use atomisp_css_update_stream() in more places
Date:   Wed, 15 Jun 2022 22:50:34 +0200
Message-Id: <20220615205037.16549-38-hdegoede@redhat.com>
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

Use atomisp_css_update_stream() in 2 more places,
instead of open coding it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 37 +++----------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 76dab48cea67..889ada3e5923 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1105,21 +1105,10 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	int ret = 0, i = 0;
 
 	if (in_reset) {
-		if (__destroy_streams(asd, true))
-			dev_warn(isp->dev, "destroy stream failed.\n");
-
-		if (__destroy_pipes(asd, true))
-			dev_warn(isp->dev, "destroy pipe failed.\n");
+		ret = atomisp_css_update_stream(asd);
+		if (ret)
+			return ret;
 
-		if (__create_pipes(asd)) {
-			dev_err(isp->dev, "create pipe error.\n");
-			return -EINVAL;
-		}
-		if (__create_streams(asd)) {
-			dev_err(isp->dev, "create stream error.\n");
-			ret = -EINVAL;
-			goto stream_err;
-		}
 		/* Invalidate caches. FIXME: should flush only necessary buffers */
 		wbinvd();
 	}
@@ -1178,7 +1167,6 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 
 start_err:
 	__destroy_streams(asd, true);
-stream_err:
 	__destroy_pipes(asd, true);
 
 	/* css 2.0 API limitation: ia_css_stop_sp() could be only called after
@@ -2630,21 +2618,9 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 	struct ia_css_pipe_info p_info;
 
 	/* FIXME! No need to destroy/recreate all streams */
-	if (__destroy_streams(asd, true))
-		dev_warn(isp->dev, "destroy stream failed.\n");
-
-	if (__destroy_pipes(asd, true))
-		dev_warn(isp->dev, "destroy pipe failed.\n");
-
-	if (__create_pipes(asd)) {
-		dev_err(isp->dev, "can't create pipes\n");
-		return -EINVAL;
-	}
-
-	if (__create_streams(asd)) {
-		dev_err(isp->dev, "can't create streams\n");
-		goto stream_err;
-	}
+	ret = atomisp_css_update_stream(asd);
+	if (ret)
+		return ret;
 
 	ret = ia_css_pipe_get_info(asd->stream_env[stream_index].pipes[pipe_id],
 				   &p_info);
@@ -2683,7 +2659,6 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 
 get_info_err:
 	__destroy_streams(asd, true);
-stream_err:
 	__destroy_pipes(asd, true);
 	return -EINVAL;
 }
-- 
2.36.0

