Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5365354D2F0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347623AbiFOUvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347606AbiFOUvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D424154FBE
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SMNKHHyVsBwQtDohVWgChA0zMdjTQMssPHjdKp8h++c=;
        b=aZmdESr6EfqmGmJgoENWGT+b+5YUspGKNFEw8/gL88BkRTTXc/M61NzdFkDY1uLebrXAJ/
        xKxnF8mqHbEmAfAkXDAI68mYhVi/Qj1X1Zs6H2inTO5BSXs8qwR7/hFGJLjGRv5q6BjJVU
        tJNYkZomKaEA3NJT47GUcPjNjgpHC1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-PdSneoy_NhWpm3Sb-QIjkw-1; Wed, 15 Jun 2022 16:51:06 -0400
X-MC-Unique: PdSneoy_NhWpm3Sb-QIjkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE95E382ECCB;
        Wed, 15 Jun 2022 20:51:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA081131D;
        Wed, 15 Jun 2022 20:51:03 +0000 (UTC)
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
Subject: [PATCH v2 14/40] media: atomisp: remove unused attribute argument from ia_css_frame_map()
Date:   Wed, 15 Jun 2022 22:50:11 +0200
Message-Id: <20220615205037.16549-15-hdegoede@redhat.com>
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

ia_css_frame_map() has only one caller which passes a hardcoded 0
for the attribute argument, drop it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c           | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_frame_public.h     | 1 -
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 5 +----
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8fd470efd658..fef7b08965b3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1371,7 +1371,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 
 		ret = ia_css_frame_map(&handle, &frame_info,
 					    (void __user *)buf->m.userptr,
-					    0, pgnr);
+					    pgnr);
 		if (ret) {
 			dev_err(isp->dev, "Failed to map user buffer\n");
 			goto error;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 8f05af6d4cc9..514d933f934d 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -295,7 +295,6 @@ int
 ia_css_frame_map(struct ia_css_frame **frame,
 		 const struct ia_css_frame_info *info,
 		 const void __user *data,
-		 u16 attribute,
 		 unsigned int pgnr);
 
 /* @brief Unmap a CSS frame structure.
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index b748b133f01e..f3b80650e1ad 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -146,7 +146,6 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 int ia_css_frame_map(struct ia_css_frame **frame,
 				 const struct ia_css_frame_info *info,
 				 const void __user *data,
-				 u16 attribute,
 				 unsigned int pgnr)
 {
 	int err = 0;
@@ -172,9 +171,7 @@ int ia_css_frame_map(struct ia_css_frame **frame,
 		goto error;
 	}
 
-	me->data = hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
-			     attribute & ATOMISP_MAP_FLAG_CACHED);
-
+	me->data = hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data, 0);
 	if (me->data == mmgr_NULL)
 		err = -EINVAL;
 
-- 
2.36.0

