Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87D57016A1
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238623AbjEMMds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238348AbjEMMdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589473A89
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sWXGSa0z5CFwYizucVe2FkHyOf8pOSXomUvLZFl67kY=;
        b=K8PFLt/WZPjXFFuBEHssQsRN8ozXx+jeqa3uIUl7fLR4VHog+hjl5lkQCemnS+dJLxSGNC
        f3MJ6CvwNKj8x2SmGaO3e/Yh5eQdz8gRoAPz37Fkt1ThaH6rOJ9/ZDeew9mrf4jYqYdljJ
        qG7IDqWixemqcbZJUkJsFlobuDsBrvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-lmN8cbe8OP-dVY1aTNeJ0A-1; Sat, 13 May 2023 08:32:22 -0400
X-MC-Unique: lmN8cbe8OP-dVY1aTNeJ0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFFFC857E60;
        Sat, 13 May 2023 12:32:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE0240C2076;
        Sat, 13 May 2023 12:32:20 +0000 (UTC)
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
Subject: [PATCH 11/30] media: atomisp: Remove atomisp_subdev_register_video_nodes() helper
Date:   Sat, 13 May 2023 14:31:40 +0200
Message-Id: <20230513123159.33234-12-hdegoede@redhat.com>
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

Now that there is only 1 /dev/video# node left there is no need to
do this in a helper. Just make atomisp_register_device_nodes()
call ideo_register_device() directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_subdev.c | 18 ------------------
 .../staging/media/atomisp/pci/atomisp_subdev.h |  2 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +++-
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 1c5e489b4405..98292530e330 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1002,24 +1002,6 @@ int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
 	return v4l2_device_register_subdev(vdev, &asd->subdev);
 }
 
-int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
-					struct v4l2_device *vdev)
-{
-	int ret;
-
-	asd->video_out.vdev.v4l2_dev = vdev;
-	asd->video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_out.vdev, VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
-
-	return 0;
-
-error:
-	atomisp_subdev_unregister_entities(asd);
-	return ret;
-}
-
 /*
  * atomisp_subdev_init - ISP Subdevice  initialization.
  * @dev: Device pointer specific to the ATOM ISP.
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index ee7d0ee5d6e4..28afcdd41ef3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -367,8 +367,6 @@ void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
 void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd);
 int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
 				   struct v4l2_device *vdev);
-int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
-					struct v4l2_device *vdev);
 int atomisp_subdev_init(struct atomisp_device *isp);
 void atomisp_subdev_cleanup(struct atomisp_device *isp);
 int atomisp_create_pads_links(struct atomisp_device *isp);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 4370d560308e..f914ab9068c1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1016,7 +1016,9 @@ static int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
 	int err;
 
-	err = atomisp_subdev_register_video_nodes(&isp->asd, &isp->v4l2_dev);
+	isp->asd.video_out.vdev.v4l2_dev = &isp->v4l2_dev;
+	isp->asd.video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	err = video_register_device(&isp->asd.video_out.vdev, VFL_TYPE_VIDEO, -1);
 	if (err)
 		return err;
 
-- 
2.40.1

