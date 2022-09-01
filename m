Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF025A938A
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbiIAJrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiIAJrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E951A112ECF
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pXi08giSoWlWvDPUUPtw4t47TjlkrUmOB28boTaT1iw=;
        b=FMqEzABPiRHMNN+8cq+GVuXUbB/sulAqEZrAMhFSY3ms+x9cbfmR81p/mIi8RIvuPJ9VOU
        EqLydRJ3xQ38V5Vf2sb6rO8oqzNyyDDbCAsU9Osd2qteKo9rzpNVysHcPT0CxWQOZlbpy8
        EjgRboOrAsxb0uiYPmQ+URKz+T1oNXo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-E5BrQeZ5OSuPwSAJGyGQgQ-1; Thu, 01 Sep 2022 05:47:05 -0400
X-MC-Unique: E5BrQeZ5OSuPwSAJGyGQgQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAB7783DEB8;
        Thu,  1 Sep 2022 09:46:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 47AED40334F;
        Thu,  1 Sep 2022 09:46:50 +0000 (UTC)
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
Subject: [PATCH 08/14] media: atomisp: Remove empty atomisp_css_set_cont_prev_start_time() function
Date:   Thu,  1 Sep 2022 11:46:20 +0200
Message-Id: <20220901094626.11513-9-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_css_set_cont_prev_start_time() is a no-op, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat.h       | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 8 --------
 drivers/staging/media/atomisp/pci/atomisp_internal.h     | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c        | 2 --
 4 files changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 54c57bbf4c4d..af6ab8434b5e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -434,9 +434,6 @@ void atomisp_css_get_morph_table(struct atomisp_sub_device *asd,
 
 void atomisp_css_morph_table_free(struct ia_css_morph_table *table);
 
-void atomisp_css_set_cont_prev_start_time(struct atomisp_device *isp,
-	unsigned int overlap);
-
 int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 			     struct atomisp_dis_statistics *stats);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index ec47d84698ba..cda0b5eba16d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3763,14 +3763,6 @@ void atomisp_css_morph_table_free(struct ia_css_morph_table *table)
 	ia_css_morph_table_free(table);
 }
 
-void atomisp_css_set_cont_prev_start_time(struct atomisp_device *isp,
-	unsigned int overlap)
-{
-	/* CSS 2.0 doesn't support this API. */
-	dev_dbg(isp->dev, "set cont prev start time is not supported.\n");
-	return;
-}
-
 static struct atomisp_sub_device *__get_atomisp_subdev(
     struct ia_css_pipe *css_pipe,
     struct atomisp_device *isp,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 1d2326a40227..e299304c356b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -105,9 +105,6 @@
 #define ATOMISP_DELAYED_INIT_QUEUED	1
 #define ATOMISP_DELAYED_INIT_DONE	2
 
-#define ATOMISP_CALC_CSS_PREV_OVERLAP(lines) \
-	((lines) * 38 / 100 & 0xfffffe)
-
 /*
  * Define how fast CPU should be able to serve ISP interrupts.
  * The bigger the value, the higher risk that the ISP is not
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bdbb9dbbceec..caeb38eadc48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1934,8 +1934,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 		reinit_completion(&asd->init_done);
 		asd->delayed_init = ATOMISP_DELAYED_INIT_QUEUED;
 		queue_work(asd->delayed_init_workq, &asd->delayed_init_work);
-		atomisp_css_set_cont_prev_start_time(isp,
-						     ATOMISP_CALC_CSS_PREV_OVERLAP(sink->height));
 	} else {
 		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	}
-- 
2.37.2

