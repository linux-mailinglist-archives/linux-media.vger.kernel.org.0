Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35817016B9
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238987AbjEMMeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238950AbjEMMed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0224217
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f9eeWR+ck0Ar6qXoiVrRec52TJYBegj5YcUGWcWNwYg=;
        b=HF5AxrX6FGy/nZw1sVnlm0ivezioCLEpzYU9Id3vZMUgWfGIfS/6soZFWyAGObHX1YErI3
        7yUWEZfXFiqbHxjot7lkHitT3rM80s2KOW9vneVLcCAPDpxkW6p/WhWatGvACvnZZs0/Rm
        ajJ+WpJnyd1Ur4LCOMJNxnwVw0phMsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-fPEM-GFENGSinqP1jGUv-w-1; Sat, 13 May 2023 08:32:55 -0400
X-MC-Unique: fPEM-GFENGSinqP1jGUv-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4972480067D;
        Sat, 13 May 2023 12:32:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B6E3B40C2076;
        Sat, 13 May 2023 12:32:53 +0000 (UTC)
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
Subject: [PATCH 30/30] media: atomisp: Set asd.subdev.devnode once from isp_subdev_init_entities()
Date:   Sat, 13 May 2023 14:31:59 +0200
Message-Id: <20230513123159.33234-31-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have only one /dev/video# node we can set asd.subdev.devnode
once from isp_subdev_init_entities(), replacing the hack to set it the
last opened/closed /dev/video# node from atomisp_open() /
atomisp_release().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c   | 4 ----
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 179c23ea7700..fb42c2710795 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -505,8 +505,6 @@ static int atomisp_open(struct file *file)
 
 	mutex_lock(&isp->mutex);
 
-	asd->subdev.devnode = vdev;
-
 	if (!isp->input_cnt) {
 		dev_err(isp->dev, "no camera attached\n");
 		ret = -EINVAL;
@@ -567,8 +565,6 @@ static int atomisp_release(struct file *file)
 
 	dev_dbg(isp->dev, "release device %s\n", vdev->name);
 
-	asd->subdev.devnode = vdev;
-
 	/* Note file must not be used after this! */
 	vb2_fop_release(file);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 98292530e330..9d4fa861f696 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -881,6 +881,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	sprintf(sd->name, "ATOMISP_SUBDEV");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->devnode = &asd->video_out.vdev;
 
 	pads[ATOMISP_SUBDEV_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	pads[ATOMISP_SUBDEV_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-- 
2.40.1

