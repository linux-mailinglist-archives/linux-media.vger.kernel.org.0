Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6A869E2E6
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbjBUPAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234590AbjBUPAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A539C2B29E
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vAnq26hgr7830+8KT0BiPGWYLndD2v5UVWfJTzp060g=;
        b=aLjIWAzj8WWqH/253CbtOxLLyAECEIX0XlVpCVFm4VeJMqrLQIb2L8ArR4c3w1mkDSXxti
        MxKeQiGbDnZNizZC/Scy1qeU1zrJ8fog82MLqjLIQIUqsJXo3IVHVMqX0j/S9fVAL3KyJo
        6IAiShytnU6DDNIjlJ/nQPlmXCofFo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-NlvNv1abPsKgMW9ChGSgQw-1; Tue, 21 Feb 2023 09:59:44 -0500
X-MC-Unique: NlvNv1abPsKgMW9ChGSgQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8644882820;
        Tue, 21 Feb 2023 14:59:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CE5522026D4B;
        Tue, 21 Feb 2023 14:59:40 +0000 (UTC)
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
Subject: [PATCH 07/10] media: atomisp: Remove unused SOC_CAMERA, XENON_FLASH and FILE_INPUT subdev types
Date:   Tue, 21 Feb 2023 15:59:03 +0100
Message-Id: <20230221145906.8113-8-hdegoede@redhat.com>
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

Nothing registers subdevs with the SOC_CAMERA, XENON_FLASH and FILE_INPUT
types, remove the code for these.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/include/linux/atomisp_platform.h  |  9 +++------
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 20 ++-----------------
 .../media/atomisp/pci/atomisp_compat_css20.c  | 13 ++----------
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 ++----
 .../media/atomisp/pci/atomisp_internal.h      | 12 +----------
 .../media/atomisp/pci/atomisp_subdev.c        |  9 ---------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 10 ++--------
 7 files changed, 12 insertions(+), 67 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 539b21d39d3b..b77bf814a5a6 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -111,12 +111,9 @@ enum atomisp_input_format {
 
 enum intel_v4l2_subdev_type {
 	RAW_CAMERA = 1,
-	SOC_CAMERA = 2,
-	CAMERA_MOTOR = 3,
-	LED_FLASH = 4,
-	XENON_FLASH = 5,
-	FILE_INPUT = 6,
-	TEST_PATTERN = 7,
+	CAMERA_MOTOR = 2,
+	LED_FLASH = 3,
+	TEST_PATTERN = 4,
 };
 
 struct intel_v4l2_subdev_id {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2c73af9f039f..e4519cab8b5e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1068,9 +1068,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		if (!stream_restart[i])
 			continue;
 
-		if (isp->inputs[asd->input_curr].type != FILE_INPUT)
-			atomisp_css_input_set_mode(asd,
-						   IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
+		atomisp_css_input_set_mode(asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 
 		css_pipe_id = atomisp_get_css_pipe_id(asd);
 		if (atomisp_css_start(asd, css_pipe_id, true)) {
@@ -4269,8 +4267,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (!format)
 		return -EINVAL;
 
-	if (isp->inputs[asd->input_curr].type != TEST_PATTERN &&
-	    isp->inputs[asd->input_curr].type != FILE_INPUT) {
+	if (isp->inputs[asd->input_curr].type != TEST_PATTERN) {
 		mipi_info = atomisp_to_sensor_mipi_info(
 				isp->inputs[asd->input_curr].camera);
 		if (!mipi_info) {
@@ -4371,13 +4368,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		configure_pp_input = atomisp_css_preview_configure_pp_input;
 		pipe_id = IA_CSS_PIPE_ID_PREVIEW;
 	} else {
-		/* CSS doesn't support low light mode on SOC cameras, so disable
-		 * it. FIXME: if this is done elsewhere, it gives corrupted
-		 * colors into thumbnail image.
-		 */
-		if (isp->inputs[asd->input_curr].type == SOC_CAMERA)
-			asd->params.low_light = false;
-
 		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
 			atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_RAW);
 			atomisp_css_enable_dz(asd, false);
@@ -4468,12 +4458,6 @@ static void atomisp_get_dis_envelop(struct atomisp_sub_device *asd,
 				    unsigned int width, unsigned int height,
 				    unsigned int *dvs_env_w, unsigned int *dvs_env_h)
 {
-	struct atomisp_device *isp = asd->isp;
-
-	/* if subdev type is SOC camera,we do not need to set DVS */
-	if (isp->inputs[asd->input_curr].type == SOC_CAMERA)
-		asd->params.video_dis_en = false;
-
 	if (asd->params.video_dis_en &&
 	    asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 		/* envelope is 20% of the output resolution */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 914af04e9211..e8e39d0e412e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -590,8 +590,6 @@ static void __apply_additional_pipe_config(
 		.enable_reduced_pipe = true;
 		stream_env->pipe_configs[pipe_id]
 		.enable_dz = false;
-		if (ATOMISP_SOC_CAMERA(asd))
-			stream_env->pipe_configs[pipe_id].enable_dz = true;
 
 		if (asd->params.video_dis_en) {
 			stream_env->pipe_extra_configs[pipe_id]
@@ -605,10 +603,7 @@ static void __apply_additional_pipe_config(
 		break;
 	case IA_CSS_PIPE_ID_YUVPP:
 	case IA_CSS_PIPE_ID_COPY:
-		if (ATOMISP_SOC_CAMERA(asd))
-			stream_env->pipe_configs[pipe_id].enable_dz = true;
-		else
-			stream_env->pipe_configs[pipe_id].enable_dz = false;
+		stream_env->pipe_configs[pipe_id].enable_dz = false;
 		break;
 	default:
 		break;
@@ -2563,13 +2558,9 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 	int stream_index;
 	struct atomisp_device *isp = asd->isp;
 
-	if (ATOMISP_SOC_CAMERA(asd)) {
-		stream_index = ATOMISP_INPUT_STREAM_GENERAL;
-	} else {
-		stream_index = (pipe_index == IA_CSS_PIPE_ID_YUVPP) ?
+	stream_index = (pipe_index == IA_CSS_PIPE_ID_YUVPP) ?
 			       ATOMISP_INPUT_STREAM_VIDEO :
 			       ATOMISP_INPUT_STREAM_GENERAL;
-	}
 
 	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
 		.pipes[pipe_index], &info)) {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 55c9ff87c112..e5203f68f0f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -458,10 +458,8 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		buf_type = atomisp_get_css_buf_type(
 			       asd, css_preview_pipe_id,
 			       atomisp_subdev_source_pad(&preview_pipe->vdev));
-		if (ATOMISP_SOC_CAMERA(asd) && css_preview_pipe_id == IA_CSS_PIPE_ID_YUVPP)
-			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-		/* else for ext isp use case */
-		else if (css_preview_pipe_id == IA_CSS_PIPE_ID_YUVPP)
+
+		if (css_preview_pipe_id == IA_CSS_PIPE_ID_YUVPP)
 			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
 		else if (asd->stream_env[ATOMISP_INPUT_STREAM_PREVIEW].stream)
 			input_stream_id = ATOMISP_INPUT_STREAM_PREVIEW;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 7f346161c4b5..1c1c4cf41e32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -117,17 +117,7 @@
 #define ATOMISP_CSS_OUTPUT_SECOND_INDEX     1
 #define ATOMISP_CSS_OUTPUT_DEFAULT_INDEX    0
 
-/*
- * ATOMISP_SOC_CAMERA
- * This is to differentiate between ext-isp and soc camera in
- * Moorefield/Baytrail platform.
- */
-#define ATOMISP_SOC_CAMERA(asd)  \
-	(asd->isp->inputs[asd->input_curr].type == SOC_CAMERA)
-
-#define ATOMISP_USE_YUVPP(asd)  \
-	(ATOMISP_SOC_CAMERA(asd) && ATOMISP_CSS_SUPPORT_YUVPP && \
-	!asd->copy_mode)
+#define ATOMISP_USE_YUVPP(asd)		false
 
 /* ISP2401 */
 #define ATOMISP_ION_DEVICE_FD_OFFSET   16
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9f07ed9f5306..371991883076 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -409,11 +409,6 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			padding_h = 12;
 		}
 
-		if (isp->inputs[isp_sd->input_curr].type == SOC_CAMERA) {
-			padding_w = 0;
-			padding_h = 0;
-		}
-
 		if (atomisp_subdev_format_conversion(isp_sd,
 						     isp_sd->capture_pad)
 		    && crop[pad]->width && crop[pad]->height) {
@@ -421,10 +416,6 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			crop[pad]->height -= padding_h;
 		}
 
-		/* if subdev type is SOC camera,we do not need to set DVS */
-		if (isp->inputs[isp_sd->input_curr].type == SOC_CAMERA)
-			isp_sd->params.video_dis_en = 0;
-
 		if (isp_sd->params.video_dis_en &&
 		    isp_sd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 			/* This resolution contains 20 % of DVS slack
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index ce223fbb6640..4f5698e54711 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -842,8 +842,7 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 	for (i = 0; i < isp->input_cnt; i++) {
 		struct camera_mipi_info *mipi_info;
 
-		if (isp->inputs[i].type != RAW_CAMERA &&
-		    isp->inputs[i].type != SOC_CAMERA)
+		if (isp->inputs[i].type != RAW_CAMERA)
 			continue;
 
 		mipi_info = atomisp_to_sensor_mipi_info(isp->inputs[i].camera);
@@ -923,8 +922,7 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 		int camera_count = 0;
 
 		for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
-			if (subdevs->type == RAW_CAMERA ||
-			    subdevs->type == SOC_CAMERA)
+			if (subdevs->type == RAW_CAMERA)
 				camera_count++;
 		}
 		if (camera_count)
@@ -945,9 +943,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 		case RAW_CAMERA:
 			dev_dbg(isp->dev, "raw_index: %d\n", raw_index);
 			raw_index = isp->input_cnt;
-			fallthrough;
-		case SOC_CAMERA:
-			dev_dbg(isp->dev, "SOC_INDEX: %d\n", isp->input_cnt);
 			if (isp->input_cnt >= ATOM_ISP_MAX_INPUTS) {
 				dev_warn(isp->dev,
 					 "too many atomisp inputs, ignored\n");
@@ -974,7 +969,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			isp->motor = subdevs->subdev;
 			break;
 		case LED_FLASH:
-		case XENON_FLASH:
 			if (isp->flash) {
 				dev_warn(isp->dev, "too many atomisp flash devices\n");
 				continue;
-- 
2.39.1

