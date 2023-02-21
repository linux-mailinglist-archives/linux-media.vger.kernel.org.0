Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631DC69E2E5
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbjBUPAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234551AbjBUPAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925E22B607
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Ue7yOV/J05gG3qNTTS35eXJ5nVwxV3Alxr9QkLAdVs=;
        b=cBQrOpu6V5X7iDtj+sjpkJZ3x+qZoI1JLaJzvAsi+0tfODGvFq6ByYJCuUq7oex+eZoKee
        JPhA0G8r+kDhW2i8UsQU0qtoxVibReKxtStyO90op/3DaIEnBlGaPhceL03/RifEp9Wjtc
        twS222p1pcRgyN/4A/OPZ7MGXUBpCNM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-ieTwQndAMlapMNMHSXthNg-1; Tue, 21 Feb 2023 09:59:51 -0500
X-MC-Unique: ieTwQndAMlapMNMHSXthNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 333C1380611C;
        Tue, 21 Feb 2023 14:59:51 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFCE82026D4B;
        Tue, 21 Feb 2023 14:59:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 09/10] media: atomisp: Remove yuvpp_mode
Date:   Tue, 21 Feb 2023 15:59:05 +0100
Message-Id: <20230221145906.8113-10-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

yuvpp_mode is never set, so it always is false remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c        |  1 -
 .../staging/media/atomisp/pci/atomisp_compat_css20.c   |  4 ----
 drivers/staging/media/atomisp/pci/atomisp_fops.c       | 10 ----------
 drivers/staging/media/atomisp/pci/atomisp_subdev.h     |  1 -
 4 files changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2b95d8f0dbd2..937cfe9489fc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4823,7 +4823,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	atomisp_csi_lane_config(isp);
 
 	atomisp_check_copy_mode(asd, source_pad, &backup_fmt);
-	asd->yuvpp_mode = false;			/* Reset variable */
 
 	isp_sink_crop = *atomisp_subdev_get_rect(&asd->subdev, NULL,
 			V4L2_SUBDEV_FORMAT_ACTIVE,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 8bd7605fbe8f..10be77c478b8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2435,8 +2435,6 @@ static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd,
 
 	switch (source_pad) {
 	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
-		if (asd->yuvpp_mode)
-			return IA_CSS_PIPE_ID_YUVPP;
 		if (asd->copy_mode)
 			return IA_CSS_PIPE_ID_COPY;
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO
@@ -2455,8 +2453,6 @@ static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd,
 		}
 		fallthrough;
 	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
-		if (asd->yuvpp_mode)
-			return IA_CSS_PIPE_ID_YUVPP;
 		if (asd->copy_mode)
 			return IA_CSS_PIPE_ID_COPY;
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 5ba5739c144b..d8d4c412f66a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -399,15 +399,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		css_video_pipe_id = IA_CSS_PIPE_ID_COPY;
 	}
 
-	if (asd->yuvpp_mode) {
-		capture_pipe = &asd->video_out_capture;
-		video_pipe   = &asd->video_out_video_capture;
-		preview_pipe = &asd->video_out_preview;
-		css_capture_pipe_id = IA_CSS_PIPE_ID_COPY;
-		css_video_pipe_id   = IA_CSS_PIPE_ID_YUVPP;
-		css_preview_pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	}
-
 	if (capture_pipe) {
 		buf_type = atomisp_get_css_buf_type(
 			       asd, css_capture_pipe_id,
@@ -583,7 +574,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 
 	asd->mipi_frame_size = 0;
 	asd->copy_mode = false;
-	asd->yuvpp_mode = false;
 
 	asd->stream_prepared = false;
 	asd->high_speed_mode = false;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 5583d6a02346..df6e2a8c5f84 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -330,7 +330,6 @@ struct atomisp_sub_device {
 	unsigned int mipi_frame_size;
 
 	bool copy_mode; /* CSI2+ use copy mode */
-	bool yuvpp_mode;	/* CSI2+ yuvpp pipe */
 
 	int raw_buffer_bitmap[ATOMISP_MAX_EXP_ID / 32 +
 						 1]; /* Record each Raw Buffer lock status */
-- 
2.39.1

