Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D314708534
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjERPmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjERPmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C128B119
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fsBx2IUJo1FJJuPZ7Jw4/EiwOzCRMMmI9x+UKyPNyr4=;
        b=fsJZWhX8tZSfLmDTPiD+p77hOJvRN6Rhv9GZgBRWygQ4oc1bSO3QSvmTr4WVB6XpazzcXA
        isI81VS2+FxnmVyTiNyf3Ri6TSJs+3CUQf/C3wAtHdhnj1q8UvaMln47NneoDhvO6gzX25
        h23rb+o9NmVyQnz5EE6xQKofH9vWtsg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-KFPsuMxfNSa07lhyg4JtGQ-1; Thu, 18 May 2023 11:37:41 -0400
X-MC-Unique: KFPsuMxfNSa07lhyg4JtGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33311282CCBD;
        Thu, 18 May 2023 15:37:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A8C8663F5F;
        Thu, 18 May 2023 15:37:39 +0000 (UTC)
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
Subject: [PATCH 3/9] media: atomisp: Remove atomisp_video_init() parametrization
Date:   Thu, 18 May 2023 17:37:27 +0200
Message-Id: <20230518153733.195306-4-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
References: <20230518153733.195306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we only have a single /dev/video# node it is no longer
necessary for atomisp_video_init() to be parametrized.

Remove its parameters and while at it also change the name
from the single /dev/video# node from "ATOMISP ISP PREVIEW output"
to "ATOMISP video output".

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  |  2 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  2 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  2 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 24 +++++--------------
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |  3 +--
 5 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index fb42c2710795..36e441dce7d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -537,7 +537,7 @@ static int atomisp_open(struct file *file)
 
 	atomisp_subdev_init_struct(asd);
 	/* Ensure that a mode is set */
-	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
+	v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_PREVIEW);
 
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 8b99805bcc77..c2ae77cd77a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -898,7 +898,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out, "PREVIEW", ATOMISP_RUN_MODE_PREVIEW);
+	ret = atomisp_video_init(&asd->video_out);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index dc6970b48633..cd82554d5f65 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -67,8 +67,6 @@ struct atomisp_video_pipe {
 	/* Filled through atomisp_get_css_frame_info() on queue setup */
 	struct ia_css_frame_info frame_info;
 
-	/* Store here the initial run mode */
-	unsigned int default_run_mode;
 	/* Set from streamoff to disallow queuing further buffers in CSS */
 	bool stopping;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index a2440f270ffe..94b9908139ab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -333,34 +333,22 @@ const struct atomisp_dfs_config dfs_config_cht_soc = {
 	.dfs_table_size = ARRAY_SIZE(dfs_rules_cht_soc),
 };
 
-int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
-		       unsigned int run_mode)
+int atomisp_video_init(struct atomisp_video_pipe *video)
 {
 	int ret;
-	const char *direction;
-
-	switch (video->type) {
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		direction = "output";
-		video->pad.flags = MEDIA_PAD_FL_SINK;
-		video->vdev.fops = &atomisp_fops;
-		video->vdev.ioctl_ops = &atomisp_ioctl_ops;
-		video->vdev.lock = &video->isp->mutex;
-		break;
-	default:
-		return -EINVAL;
-	}
 
+	video->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&video->vdev.entity, 1, &video->pad);
 	if (ret < 0)
 		return ret;
 
 	/* Initialize the video device. */
-	snprintf(video->vdev.name, sizeof(video->vdev.name),
-		 "ATOMISP ISP %s %s", name, direction);
+	strscpy(video->vdev.name, "ATOMISP video output", sizeof(video->vdev.name));
+	video->vdev.fops = &atomisp_fops;
+	video->vdev.ioctl_ops = &atomisp_ioctl_ops;
+	video->vdev.lock = &video->isp->mutex;
 	video->vdev.release = video_device_release_empty;
 	video_set_drvdata(&video->vdev, video->isp);
-	video->default_run_mode = run_mode;
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
index ccf1c0ac17b2..c8ee3ad83320 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
@@ -26,8 +26,7 @@ struct v4l2_device;
 struct atomisp_device;
 struct firmware;
 
-int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
-		       unsigned int run_mode);
+int atomisp_video_init(struct atomisp_video_pipe *video);
 void atomisp_video_unregister(struct atomisp_video_pipe *video);
 const struct firmware *atomisp_load_firmware(struct atomisp_device *isp);
 int atomisp_csi_lane_config(struct atomisp_device *isp);
-- 
2.40.1

