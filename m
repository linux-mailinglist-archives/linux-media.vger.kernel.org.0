Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA25C606933
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiJTT4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiJTT4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2403105341
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tSAfvOpTPfs45olrPvRu3409ppoiPz/StGpkDBR/pzk=;
        b=e8/Lio/RTh8Vh1/HSF6vL1CSSAO2yZoby+7BuemCWfo3D1Bwjah1bCU5CNXQ5mCm8xdZAQ
        DwelczyG6DpOevKjapojIwn6ou+RRaqycNcx0PMepMnbhEJ8k1rpfjhYE26gcm8mdwLwht
        KpjrXDW5rOWPzFotCpoWrtNr2jWu9wY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-j6cbFwp0OKitwIOM0u0zhg-1; Thu, 20 Oct 2022 15:55:53 -0400
X-MC-Unique: j6cbFwp0OKitwIOM0u0zhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A23D5101A52A;
        Thu, 20 Oct 2022 19:55:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2DD5240C6EC2;
        Thu, 20 Oct 2022 19:55:51 +0000 (UTC)
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
Subject: [PATCH v2 07/17] media: atomisp: Add an index helper variable to atomisp_buf_done()
Date:   Thu, 20 Oct 2022 21:55:23 +0200
Message-Id: <20221020195533.114049-8-hdegoede@redhat.com>
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the videobuf2 conversion accessing the index of a frame is going
to become more involved and writing this out each time is undesired.

Add an 'i' helper variable for the index and assing this once as
preparation for the videobuf2 conversion.

This also makes use of the new rules wrt max line-lengths in the kernel
to avoid breaking up a bunch of lines. Not breaking these lines results
in better readable code (IMHO).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 70 ++++++++-----------
 1 file changed, 28 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5f0bebefcadd..a97c54615ba4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -878,7 +878,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	struct atomisp_video_pipe *pipe = NULL;
 	struct atomisp_css_buffer buffer;
 	bool requeue = false;
-	int err;
 	unsigned long irqflags;
 	struct ia_css_frame *frame = NULL;
 	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf_tmp, *s3a_iter;
@@ -887,6 +886,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	enum atomisp_metadata_type md_type;
 	struct atomisp_device *isp = asd->isp;
 	struct v4l2_control ctrl;
+	int i, err;
 
 	lockdep_assert_held(&isp->mutex);
 
@@ -1072,66 +1072,52 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 			break;
 		}
 
+		i = vb->i;
+
 		/* free the parameters */
-		if (pipe->frame_params[vb->i]) {
-			if (asd->params.dvs_6axis ==
-			    pipe->frame_params[vb->i]->params.dvs_6axis)
+		if (pipe->frame_params[i]) {
+			if (asd->params.dvs_6axis == pipe->frame_params[i]->params.dvs_6axis)
 				asd->params.dvs_6axis = NULL;
-			atomisp_free_css_parameters(
-			    &pipe->frame_params[vb->i]->params);
-			kvfree(pipe->frame_params[vb->i]);
-			pipe->frame_params[vb->i] = NULL;
+			atomisp_free_css_parameters(&pipe->frame_params[i]->params);
+			kvfree(pipe->frame_params[i]);
+			pipe->frame_params[i] = NULL;
 		}
 
-		pipe->frame_config_id[vb->i] = frame->isp_config_id;
+		pipe->frame_config_id[i] = frame->isp_config_id;
 		ctrl.id = V4L2_CID_FLASH_MODE;
 		if (asd->params.flash_state == ATOMISP_FLASH_ONGOING) {
-			if (frame->flash_state
-			    == IA_CSS_FRAME_FLASH_STATE_PARTIAL) {
-				asd->frame_status[vb->i] =
-				    ATOMISP_FRAME_STATUS_FLASH_PARTIAL;
-				dev_dbg(isp->dev, "%s partially flashed\n",
-					__func__);
-			} else if (frame->flash_state
-				   == IA_CSS_FRAME_FLASH_STATE_FULL) {
-				asd->frame_status[vb->i] =
-				    ATOMISP_FRAME_STATUS_FLASH_EXPOSED;
+			if (frame->flash_state == IA_CSS_FRAME_FLASH_STATE_PARTIAL) {
+				asd->frame_status[i] = ATOMISP_FRAME_STATUS_FLASH_PARTIAL;
+				dev_dbg(isp->dev, "%s partially flashed\n", __func__);
+			} else if (frame->flash_state == IA_CSS_FRAME_FLASH_STATE_FULL) {
+				asd->frame_status[i] = ATOMISP_FRAME_STATUS_FLASH_EXPOSED;
 				asd->params.num_flash_frames--;
-				dev_dbg(isp->dev, "%s completely flashed\n",
-					__func__);
+				dev_dbg(isp->dev, "%s completely flashed\n", __func__);
 			} else {
-				asd->frame_status[vb->i] =
-				    ATOMISP_FRAME_STATUS_OK;
-				dev_dbg(isp->dev,
-					"%s no flash in this frame\n",
-					__func__);
+				asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
+				dev_dbg(isp->dev, "%s no flash in this frame\n", __func__);
 			}
 
 			/* Check if flashing sequence is done */
-			if (asd->frame_status[vb->i] ==
-			    ATOMISP_FRAME_STATUS_FLASH_EXPOSED)
+			if (asd->frame_status[i] == ATOMISP_FRAME_STATUS_FLASH_EXPOSED)
 				asd->params.flash_state = ATOMISP_FLASH_DONE;
 		} else if (isp->flash) {
-			if (v4l2_g_ctrl(isp->flash->ctrl_handler, &ctrl) ==
-			    0 && ctrl.value == ATOMISP_FLASH_MODE_TORCH) {
+			if (v4l2_g_ctrl(isp->flash->ctrl_handler, &ctrl) == 0 &&
+			    ctrl.value == ATOMISP_FLASH_MODE_TORCH) {
 				ctrl.id = V4L2_CID_FLASH_TORCH_INTENSITY;
-				if (v4l2_g_ctrl(isp->flash->ctrl_handler, &ctrl)
-				    == 0 && ctrl.value > 0) {
-					asd->frame_status[vb->i] =
-					    ATOMISP_FRAME_STATUS_FLASH_EXPOSED;
-				} else {
-					asd->frame_status[vb->i] =
-					    ATOMISP_FRAME_STATUS_OK;
-				}
+				if (v4l2_g_ctrl(isp->flash->ctrl_handler, &ctrl) == 0 &&
+				    ctrl.value > 0)
+					asd->frame_status[i] = ATOMISP_FRAME_STATUS_FLASH_EXPOSED;
+				else
+					asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
 			} else {
-				asd->frame_status[vb->i] =
-				    ATOMISP_FRAME_STATUS_OK;
+				asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
 			}
 		} else {
-			asd->frame_status[vb->i] = ATOMISP_FRAME_STATUS_OK;
+			asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
 		}
 
-		asd->params.last_frame_status = asd->frame_status[vb->i];
+		asd->params.last_frame_status = asd->frame_status[i];
 
 		if (asd->continuous_mode->val) {
 			if (css_pipe_id == IA_CSS_PIPE_ID_PREVIEW ||
-- 
2.37.3

