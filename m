Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFA56D31CB
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjDAPBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjDAPBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B551EA2A
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C+k2Efp8d+jIakXKRtUBgc1U//gkR8koQpCncuHXyvE=;
        b=VHA9ggKt5azhyVS9yOoicnhITMUM2h0NPYHnsbPR+j1o5Zg2Pa0VNl1PZmQ55/NjzGZr+7
        Qnrr2n4wp3CIyGBI259a0gTs5ffogpJVZ1aUdOdCfLOxRcFjNH+YRytHy3FdGqEkTkxmQF
        abkeChiOXMjP7fioXrUQRGcM+OreugU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616--EH5SOEWP6WtXhSVCiwQ7w-1; Sat, 01 Apr 2023 11:00:17 -0400
X-MC-Unique: -EH5SOEWP6WtXhSVCiwQ7w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9386F1C051AA;
        Sat,  1 Apr 2023 15:00:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB570400F59;
        Sat,  1 Apr 2023 15:00:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 21/28] media: atomisp: Remove custom V4L2_CID_FMT_AUTO control
Date:   Sat,  1 Apr 2023 16:59:19 +0200
Message-Id: <20230401145926.596216-22-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The custom V4L2_CID_FMT_AUTO control, which defaults to true
controls whether the atomisp driver will automatically configure
the sensor and ISP settings to match.

This is necessary to make normal v4l2 apps to work. We do eventually
want to add libcamera support, but even then moving this to userspace
does not give any added value, while breaking classic v4l2 apps.

Moreover we really don't know all the exact pipeline constraints,
so moving this to userspace/libcamera will be tricky thus it is best
to keep the current in kernel code for this and make the kernel
unconditionally do this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/linux/atomisp.h   |  2 --
 drivers/staging/media/atomisp/pci/atomisp_cmd.c     |  8 +-------
 drivers/staging/media/atomisp/pci/atomisp_fops.c    |  2 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c  | 13 -------------
 drivers/staging/media/atomisp/pci/atomisp_subdev.h  |  1 -
 5 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index b3cceea570ca..c7ec56a1c064 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -1056,8 +1056,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define V4L2_2A_STATUS_AE_READY            BIT(0)
 #define V4L2_2A_STATUS_AWB_READY           BIT(1)
 
-#define V4L2_CID_FMT_AUTO			(V4L2_CID_CAMERA_LASTP1 + 19)
-
 #define V4L2_CID_RUN_MODE			(V4L2_CID_CAMERA_LASTP1 + 20)
 #define ATOMISP_RUN_MODE_VIDEO			1
 #define ATOMISP_RUN_MODE_STILL_CAPTURE		2
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9cf5ac55b867..c73931c77695 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4283,8 +4283,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	 * Configure viewfinder also when vfpp is disabled: the
 	 * CSS still requires viewfinder configuration.
 	 */
-	if (asd->fmt_auto->val ||
-	    asd->vfpp->val != ATOMISP_VFPP_ENABLE) {
+	{
 		struct v4l2_rect vf_size = {0};
 		struct v4l2_mbus_framefmt vf_ffmt = {0};
 
@@ -4633,10 +4632,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	snr_fmt = f->fmt.pix;
 	backup_fmt = snr_fmt;
 
-	/* Pipeline configuration done through subdevs. Bail out now. */
-	if (!asd->fmt_auto->val)
-		goto set_fmt_to_isp;
-
 	/* get sensor resolution and format */
 	ret = atomisp_try_fmt(vdev, &snr_fmt, &res_overflow);
 	if (ret) {
@@ -4797,7 +4792,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					     &main_compose);
 	}
 
-set_fmt_to_isp:
 	ret = atomisp_set_fmt_to_isp(vdev, &output_info, &f->fmt.pix, source_pad);
 	if (ret) {
 		dev_warn(isp->dev, "Can't set format on ISP. Error %d\n", ret);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 7f757f510190..e220f500aff4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -711,7 +711,7 @@ static int atomisp_release(struct file *file)
 	 * The sink pad setting can only be cleared when all device nodes
 	 * get released.
 	 */
-	if (asd->fmt_auto->val) {
+	{
 		struct v4l2_mbus_framefmt isp_sink_fmt = { 0 };
 
 		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 371991883076..011e67ccdbba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -754,17 +754,6 @@ static const struct v4l2_ctrl_ops ctrl_ops = {
 	.s_ctrl = &s_ctrl,
 };
 
-static const struct v4l2_ctrl_config ctrl_fmt_auto = {
-	.ops = &ctrl_ops,
-	.id = V4L2_CID_FMT_AUTO,
-	.name = "Automatic format guessing",
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.min = 0,
-	.max = 1,
-	.step = 1,
-	.def = 1,
-};
-
 static const char *const ctrl_run_mode_menu[] = {
 	NULL,
 	"Video",
@@ -1000,8 +989,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret)
 		return ret;
 
-	asd->fmt_auto = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-					     &ctrl_fmt_auto, NULL);
 	asd->run_mode = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 					     &ctrl_run_mode, NULL);
 	asd->vfpp = v4l2_ctrl_new_custom(&asd->ctrl_handler,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index bcb0fe8d0538..117803f3cbd1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -259,7 +259,6 @@ struct atomisp_sub_device {
 	/* struct isp_subdev_params params; */
 	struct atomisp_device *isp;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_ctrl *fmt_auto;
 	struct v4l2_ctrl *run_mode;
 	struct v4l2_ctrl *vfpp;
 	struct v4l2_ctrl *continuous_raw_buffer_size;
-- 
2.39.1

