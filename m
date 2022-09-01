Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0158E5A9384
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbiIAJrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbiIAJrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41D610DE54
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rdtZVxlT3hp9bRp1Lwp3vDkwIqYzZmT+LwA5w26YxXA=;
        b=ajW8ERTict+fEOQBRKMbaJ++9Yg3L39OAkGpoDmo7JBWA8rRSlKM3Z+IIM2g4EKrN7YWdE
        R5gaYQ2TaSKvWapmjkiapgaPsAqxf1bPdtmQLcudv3C3uhtihsdwgKHPRliQ7EeSp8aNmd
        LvQQwnFkNqBGvYzpCsNPyw1q/hNs180=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-3jYyVia8ONOV6vnAZLRqKA-1; Thu, 01 Sep 2022 05:47:06 -0400
X-MC-Unique: 3jYyVia8ONOV6vnAZLRqKA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69F1298D3A4;
        Thu,  1 Sep 2022 09:46:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F01294A927E;
        Thu,  1 Sep 2022 09:46:51 +0000 (UTC)
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
Subject: [PATCH 09/14] media: atomisp: Split subdev and video-node registration into 2 steps
Date:   Thu,  1 Sep 2022 11:46:21 +0200
Message-Id: <20220901094626.11513-10-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
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

Split subdev and video-node registration into 2 steps, this is
a preparation step for moving video-node registration to the
end of probe() so that the loading() mutex can be removed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_subdev.c   | 16 ++++++++--------
 .../staging/media/atomisp/pci/atomisp_subdev.h   |  6 ++++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c |  4 +++-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 5e66d6a69556..047e2e9d63d7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1281,8 +1281,14 @@ void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd)
 	atomisp_video_unregister(&asd->video_out_video_capture);
 }
 
-int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
-				     struct v4l2_device *vdev)
+int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
+				   struct v4l2_device *vdev)
+{
+	return v4l2_device_register_subdev(vdev, &asd->subdev);
+}
+
+int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
+					struct v4l2_device *vdev)
 {
 	int ret;
 
@@ -1291,12 +1297,6 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 	 * Should any of those use V4L2_CAP_META_CAPTURE? Probably yes.
 	 */
 
-	/* Register the subdev and video node. */
-
-	ret = v4l2_device_register_subdev(vdev, &asd->subdev);
-	if (ret < 0)
-		goto error;
-
 	asd->video_out_preview.vdev.v4l2_dev = vdev;
 	asd->video_out_preview.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_out_preview.vdev,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index d1a9857e5d68..d8b2dd00a792 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -417,8 +417,10 @@ int atomisp_update_run_mode(struct atomisp_sub_device *asd);
 void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
 
 void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd);
-int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
-				     struct v4l2_device *vdev);
+int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
+				   struct v4l2_device *vdev);
+int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
+					struct v4l2_device *vdev);
 int atomisp_subdev_init(struct atomisp_device *isp);
 void atomisp_subdev_cleanup(struct atomisp_device *isp);
 int atomisp_create_pads_links(struct atomisp_device *isp);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index bb48c74c0c07..9a1eae1ba8c0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1193,7 +1193,9 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
-		ret = atomisp_subdev_register_entities(asd, &isp->v4l2_dev);
+		ret = atomisp_subdev_register_subdev(asd, &isp->v4l2_dev);
+		if (ret == 0)
+			ret = atomisp_subdev_register_video_nodes(asd, &isp->v4l2_dev);
 		if (ret < 0) {
 			dev_err(isp->dev,
 				"atomisp_subdev_register_entities fail\n");
-- 
2.37.2

