Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E7F73545D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 12:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjFSKzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 06:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbjFSKyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 06:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A658A213C
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687171948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6fZH45ssJsANik3k12zb3CLb/NGo4JpcHKoxT5jvC0E=;
        b=IprpvgZpjde8lZVx9Vh0caYzaPuQfcyMtH7tEYa4g/Qw2bDTgMq9B896lrQ8tul0jrsbrp
        FP5ZCc/+L9lC1LmrfSscUQQuArV4aD/K4DS4fRwNrwI8Mxao07qBX4CbxRFP/LeSi67mxv
        cA2qoZUdL0Agehn0toJ1z5VEY+InHL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-PZdgiYrgMp-jxMPc23uk5A-1; Mon, 19 Jun 2023 06:52:25 -0400
X-MC-Unique: PZdgiYrgMp-jxMPc23uk5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07414811E78;
        Mon, 19 Jun 2023 10:52:25 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5CACB112132C;
        Mon, 19 Jun 2023 10:52:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 6/7] media: atomisp: Remove support for custom run-mode v4l2-ctrl on sensors
Date:   Mon, 19 Jun 2023 12:52:11 +0200
Message-Id: <20230619105212.303653-6-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the support to update a V4L2_CID_RUN_MODE run-mode control
on sensors when changing the atomisp run-mode or directly by calling
the custom ATOMISP_IOC_S_SENSOR_RUNMODE IOCTL.

No sensor drivers implement this and having custom controls / IOCTLs
is undesirable.

Even if there was such a control on sensors then userspace should directly
talk to the sensor v4l2-subdev, rather than relying on a custom ioctl-s
on the output /dev/video# node to pass this through to the senor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     | 10 ----
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 22 ---------
 .../staging/media/atomisp/pci/atomisp_cmd.h   | 13 -----
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 12 -----
 .../media/atomisp/pci/atomisp_subdev.c        | 48 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  2 -
 6 files changed, 107 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 14b1757e6674..bbbd904b696a 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -713,13 +713,6 @@ enum atomisp_burst_capture_options {
 #define EXT_ISP_SHOT_MODE_ANIMATED_PHOTO	10
 #define EXT_ISP_SHOT_MODE_SPORTS	11
 
-/*
- * Set Senor run mode
- */
-struct atomisp_s_runmode {
-	__u32 mode;
-};
-
 /*Private IOCTLs for ISP */
 #define ATOMISP_IOC_G_XNR \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 0, int)
@@ -875,9 +868,6 @@ struct atomisp_s_runmode {
 #define ATOMISP_IOC_S_SENSOR_EE_CONFIG \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 47, unsigned int)
 
-#define ATOMISP_IOC_S_SENSOR_RUNMODE \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 48, struct atomisp_s_runmode)
-
 /*
  * Reserved ioctls. We have customer implementing it internally.
  * We can't use both numbers to not cause ABI conflict.
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 64456aedbf00..2e96d52922e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1248,28 +1248,6 @@ static void atomisp_update_capture_mode(struct atomisp_sub_device *asd)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_PRIMARY);
 }
 
-/* ISP2401 */
-int atomisp_set_sensor_runmode(struct atomisp_sub_device *asd,
-			       struct atomisp_s_runmode *runmode)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct v4l2_ctrl *c;
-	int ret = 0;
-
-	if (!(runmode && (runmode->mode & RUNMODE_MASK)))
-		return -EINVAL;
-
-	mutex_lock(asd->ctrl_handler.lock);
-	c = v4l2_ctrl_find(isp->inputs[asd->input_curr].camera->ctrl_handler,
-			   V4L2_CID_RUN_MODE);
-
-	if (c)
-		ret = v4l2_ctrl_s_ctrl(c, runmode->mode);
-
-	mutex_unlock(asd->ctrl_handler.lock);
-	return ret;
-}
-
 /*
  * Function to enable/disable lens geometry distortion correction (GDC) and
  * chromatic aberration correction (CAC)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 8305161d2062..b8cd957eebdc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -42,13 +42,6 @@ struct ia_css_frame;
 #define INTR_IER		24
 #define INTR_IIR		16
 
-/* ISP2401 */
-#define RUNMODE_MASK (ATOMISP_RUN_MODE_VIDEO | ATOMISP_RUN_MODE_STILL_CAPTURE \
-			| ATOMISP_RUN_MODE_PREVIEW)
-
-/* FIXME: check if can go */
-extern int atomisp_punit_hpll_freq;
-
 /* Helper function */
 void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 		  unsigned int size);
@@ -77,12 +70,6 @@ bool atomisp_is_viewfinder_support(struct atomisp_device *isp);
 
 /* ISP features control function */
 
-/*
- * Function to set sensor runmode by user when
- * ATOMISP_IOC_S_SENSOR_RUNMODE ioctl was called
- */
-int atomisp_set_sensor_runmode(struct atomisp_sub_device *asd,
-			       struct atomisp_s_runmode *runmode);
 /*
  * Function to enable/disable lens geometry distortion correction (GDC) and
  * chromatic aberration correction (CAC)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8fd981f49659..a8e4779d007f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -665,11 +665,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		dev_err(isp->dev, "Failed to power-on sensor\n");
 		return ret;
 	}
-	/*
-	 * Some sensor driver resets the run mode during power-on, thus force
-	 * update the run mode to sensor after power-on.
-	 */
-	atomisp_update_run_mode(asd);
 
 	/* select operating sensor */
 	ret = v4l2_subdev_call(isp->inputs[input].camera, video, s_routing,
@@ -1784,13 +1779,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	int err;
 
 	switch (cmd) {
-	case ATOMISP_IOC_S_SENSOR_RUNMODE:
-		if (IS_ISP2401)
-			err = atomisp_set_sensor_runmode(asd, arg);
-		else
-			err = -EINVAL;
-		break;
-
 	case ATOMISP_IOC_G_XNR:
 		err = atomisp_xnr(asd, 0, arg);
 		break;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 45073e401bac..471912dea5cd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -663,52 +663,6 @@ static const struct media_entity_operations isp_subdev_media_ops = {
 	/*	 .set_power = v4l2_subdev_set_power,	*/
 };
 
-static int __atomisp_update_run_mode(struct atomisp_sub_device *asd)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct v4l2_ctrl *ctrl = asd->run_mode;
-	struct v4l2_ctrl *c;
-	s32 mode;
-
-	mode = ctrl->val;
-
-	c = v4l2_ctrl_find(
-		isp->inputs[asd->input_curr].camera->ctrl_handler,
-		V4L2_CID_RUN_MODE);
-
-	if (c)
-		return v4l2_ctrl_s_ctrl(c, mode);
-
-	return 0;
-}
-
-int atomisp_update_run_mode(struct atomisp_sub_device *asd)
-{
-	int rval;
-
-	mutex_lock(asd->ctrl_handler.lock);
-	rval = __atomisp_update_run_mode(asd);
-	mutex_unlock(asd->ctrl_handler.lock);
-
-	return rval;
-}
-
-static int s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct atomisp_sub_device *asd = container_of(
-					     ctrl->handler, struct atomisp_sub_device, ctrl_handler);
-	switch (ctrl->id) {
-	case V4L2_CID_RUN_MODE:
-		return __atomisp_update_run_mode(asd);
-	}
-
-	return 0;
-}
-
-static const struct v4l2_ctrl_ops ctrl_ops = {
-	.s_ctrl = &s_ctrl,
-};
-
 static const char *const ctrl_run_mode_menu[] = {
 	[ATOMISP_RUN_MODE_VIDEO]		= "Video",
 	[ATOMISP_RUN_MODE_STILL_CAPTURE]	= "Still capture",
@@ -716,7 +670,6 @@ static const char *const ctrl_run_mode_menu[] = {
 };
 
 static const struct v4l2_ctrl_config ctrl_run_mode = {
-	.ops = &ctrl_ops,
 	.id = V4L2_CID_RUN_MODE,
 	.name = "Atomisp run mode",
 	.type = V4L2_CTRL_TYPE_MENU,
@@ -754,7 +707,6 @@ static const struct v4l2_ctrl_config ctrl_vfpp = {
  * the CSS subsystem.
  */
 static const struct v4l2_ctrl_config ctrl_continuous_raw_buffer_size = {
-	.ops = &ctrl_ops,
 	.id = V4L2_CID_ATOMISP_CONTINUOUS_RAW_BUFFER_SIZE,
 	.type = V4L2_CTRL_TYPE_INTEGER,
 	.name = "Continuous raw ringbuffer size",
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 9a04511b9efd..9c1703bf439c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -360,8 +360,6 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     uint32_t which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt);
 
-int atomisp_update_run_mode(struct atomisp_sub_device *asd);
-
 void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
 
 void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd);
-- 
2.40.1

