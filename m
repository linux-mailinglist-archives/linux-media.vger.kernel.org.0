Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E815B5027
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiIKRRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIKRRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C8C275E9
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t3pm6/OEzs2xvyysMx3pwby5xows9r86rq1q7TpBO7w=;
        b=izhjZrWhvV+SNZBYUGZ471+mFoFWsLHGJn31GKqt1CswhgGJkEciggBd74wf4qQMcdIgd9
        QU1+NlZ2vNxwTeCfAJIGPHLMV2jSZWyszNGTobni7sSaJEgT/VMMWsjkEKKZIijCRtuEdR
        /JDChMtiGr5i1ESRHPMfzVzMsHpQdT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-DDoW3sBZN2a-RFZB1H6LQA-1; Sun, 11 Sep 2022 13:17:05 -0400
X-MC-Unique: DDoW3sBZN2a-RFZB1H6LQA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877CF101A56C;
        Sun, 11 Sep 2022 17:17:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3ED492C3B;
        Sun, 11 Sep 2022 17:17:02 +0000 (UTC)
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
Subject: [PATCH 04/17] media: atomisp: Remove asd == NULL checks from ioctl handling
Date:   Sun, 11 Sep 2022 19:16:40 +0200
Message-Id: <20220911171653.568932-5-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
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

At probe time isp_subdev_init_entities() sets pipe->asd to a non NULL
value for all four (preview/vf/capture/capture_video) pipes by calling
atomisp_init_subdev_pipe() for all 4 pipes.

So it can never be NULL. Remove the redundant NULL checks.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 18 ----
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 89 -------------------
 2 files changed, 107 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c7f825e38921..087078900415 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1755,12 +1755,6 @@ void atomisp_wdt_refresh(struct atomisp_sub_device *asd, unsigned int delay)
 /* ISP2401 */
 void atomisp_wdt_stop_pipe(struct atomisp_video_pipe *pipe, bool sync)
 {
-	if (!pipe->asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, pipe->vdev.name);
-		return;
-	}
-
 	if (!atomisp_is_wdt_running(pipe))
 		return;
 
@@ -5557,12 +5551,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 	lockdep_assert_held(&isp->mutex);
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (source_pad >= ATOMISP_SUBDEV_PADS_NUM)
 		return -EINVAL;
 
@@ -6587,12 +6575,6 @@ int atomisp_get_invalid_frame_num(struct video_device *vdev,
 	struct ia_css_pipe_info p_info;
 	int ret;
 
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (asd->isp->inputs[asd->input_curr].camera_caps->
 	    sensor[asd->sensor_curr].stream_num > 1) {
 		/* External ISP */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 21af5feca386..9c7022be3a06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -632,12 +632,6 @@ static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	mutex_lock(&isp->mutex);
 	*input = asd->input_curr;
 	mutex_unlock(&isp->mutex);
@@ -657,12 +651,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct v4l2_subdev *motor;
 	int ret;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	mutex_lock(&isp->mutex);
 	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
 		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
@@ -818,12 +806,6 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	unsigned int i, fi = 0;
 	int rval;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	camera = isp->inputs[asd->input_curr].camera;
 	if(!camera) {
 		dev_err(isp->dev, "%s(): camera is NULL, device is %s\n",
@@ -1152,11 +1134,6 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 	u16 stream_id;
 	int ret = 0, i = 0;
 
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
 	stream_id = atomisp_source_pad_to_stream_id(asd, source_pad);
 
 	if (req->count == 0) {
@@ -1261,12 +1238,6 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	u32 pgnr;
 	int ret = 0;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	mutex_lock(&isp->mutex);
 	if (isp->isp_fatal_error) {
 		ret = -EIO;
@@ -1449,12 +1420,6 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret = 0;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	mutex_lock(&isp->mutex);
 
 	if (isp->isp_fatal_error) {
@@ -1706,12 +1671,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 	int ret = 0;
 	unsigned long irqflags;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
 
@@ -1963,12 +1922,6 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	unsigned long flags;
 	bool first_streamoff = false;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	dev_dbg(isp->dev, "Stop stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
 
@@ -2213,12 +2166,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int i, ret = -EINVAL;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == control->id) {
 			ret = 0;
@@ -2298,12 +2245,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int i, ret = -EINVAL;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == control->id) {
 			ret = 0;
@@ -2385,12 +2326,6 @@ static int atomisp_queryctl(struct file *file, void *fh,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	switch (qc->id) {
 	case V4L2_CID_FOCUS_ABSOLUTE:
 	case V4L2_CID_FOCUS_RELATIVE:
@@ -2436,12 +2371,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
@@ -2553,12 +2482,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
@@ -2684,12 +2607,6 @@ static int atomisp_g_parm(struct file *file, void *fh,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		dev_err(isp->dev, "unsupported v4l2 buf type\n");
 		return -EINVAL;
@@ -2712,12 +2629,6 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	int rval;
 	int fps;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		dev_err(isp->dev, "unsupported v4l2 buf type\n");
 		return -EINVAL;
-- 
2.37.3

