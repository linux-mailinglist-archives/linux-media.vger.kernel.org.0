Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A59C7016BA
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238990AbjEMMej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238824AbjEMMee (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C6C3C12
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=anGzYC1DEhyiHrDoAn21j4plLcVJ8KGFmYUFh/69x+0=;
        b=H1+4jf5T42ddc2Bu3emXopJyo2ayoCrzOXoiyP7WkfL48cFZK7CPczMJyU0qyGxcX77sAA
        9BGiFi2HZA8MHhiZV1UBalexZLlDWex9MBC8IRUXmdCbrBLupf3m5eiIbYQLMCA9u3gmU2
        kF8CTU7C6ii/5Rihn4jYFvJChAoediM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-vfeAA_M9PCKC6jWcMA7oFQ-1; Sat, 13 May 2023 08:32:48 -0400
X-MC-Unique: vfeAA_M9PCKC6jWcMA7oFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39C20185A790;
        Sat, 13 May 2023 12:32:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A925040C2076;
        Sat, 13 May 2023 12:32:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 26/30] media: atomisp: Remove atomisp_[sub]dev_users()
Date:   Sat, 13 May 2023 14:31:55 +0200
Message-Id: <20230513123159.33234-27-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp_[sub]dev_users() functions are not used anymore,
remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 10 ----------
 drivers/staging/media/atomisp/pci/atomisp_fops.h |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 223c5be072cc..179c23ea7700 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -489,16 +489,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 /*
  * file operation functions
  */
-static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
-{
-	return asd->video_out.users;
-}
-
-unsigned int atomisp_dev_users(struct atomisp_device *isp)
-{
-	return atomisp_subdev_users(&isp->asd);
-}
-
 static int atomisp_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 883c1851c1c9..ad1cb1ac8aa4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -22,9 +22,6 @@
 #define	__ATOMISP_FOPS_H__
 #include "atomisp_subdev.h"
 
-unsigned int atomisp_dev_users(struct atomisp_device *isp);
-unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
-
 /*
  * Memory help functions for image frame and private parameters
  */
-- 
2.40.1

