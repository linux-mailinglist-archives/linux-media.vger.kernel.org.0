Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B760769E2E4
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbjBUPAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjBUPAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43832B2BF
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g7vtjw7t0Y+mu7x0uX29b3cxmwCxURZo059EiYH/NJw=;
        b=a3yMUpStiY9QVC7dxN/0AtThsShrbPuNlfL7FfkThJWtSxxhSO5bfZvH2kRoENPXQZ9q2G
        AaM1I0AjLI+T25R/8SYTptuqZRGbi81TOIr0n3cr8EtNQ1LkyAWWDkEauuvFgObqNKjfQA
        2PCAt6EWUfcNBnP2Gkv+qJQ8Kdxz0uI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-m6p3kl33OJOHyKU3iJGlDA-1; Tue, 21 Feb 2023 09:59:48 -0500
X-MC-Unique: m6p3kl33OJOHyKU3iJGlDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FC471C05AB3;
        Tue, 21 Feb 2023 14:59:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5565A2026D4B;
        Tue, 21 Feb 2023 14:59:44 +0000 (UTC)
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
Subject: [PATCH 08/10] media: atomisp: Remove ATOMISP_USE_YUVPP()
Date:   Tue, 21 Feb 2023 15:59:04 +0100
Message-Id: <20230221145906.8113-9-hdegoede@redhat.com>
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

ATOMISP_USE_YUVPP() always returns false, so remove it and remove any
code-paths which only run when it would return true.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  15 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  | 215 ++----------------
 .../staging/media/atomisp/pci/atomisp_fops.c  |  33 ---
 .../media/atomisp/pci/atomisp_internal.h      |   2 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   3 -
 5 files changed, 21 insertions(+), 247 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e4519cab8b5e..2b95d8f0dbd2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -196,7 +196,6 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 			 enum atomisp_dfs_mode mode,
 			 bool force)
 {
-	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	/* FIXME! Only use subdev[0] status yet */
 	struct atomisp_sub_device *asd = &isp->asd[0];
 	const struct atomisp_dfs_config *dfs;
@@ -205,10 +204,6 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 	int i, ret;
 	unsigned short fps = 0;
 
-	if ((pdev->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
-	    ATOMISP_PCI_DEVICE_SOC_CHT && ATOMISP_USE_YUVPP(asd))
-		isp->dfs = &dfs_config_cht_soc;
-
 	dfs = isp->dfs;
 
 	if (dfs->lowest_freq == 0 || dfs->max_freq_at_vmin == 0 ||
@@ -4398,12 +4393,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		}
 	}
 
-	/*
-	 * to SOC camera, use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-
 	if (asd->copy_mode)
 		ret = atomisp_css_copy_configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL,
 							pix->width, pix->height,
@@ -5282,9 +5271,7 @@ static int atomisp_get_pipe_id(struct atomisp_video_pipe *pipe)
 		return -EINVAL;
 	}
 
-	if (ATOMISP_USE_YUVPP(asd)) {
-		return IA_CSS_PIPE_ID_YUVPP;
-	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
+	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
 		return IA_CSS_PIPE_ID_VIDEO;
 	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
 		return IA_CSS_PIPE_ID_CAPTURE;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index e8e39d0e412e..8bd7605fbe8f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1853,17 +1853,6 @@ void atomisp_css_enable_continuous(struct atomisp_sub_device *asd,
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
 	int i;
 
-	/*
-	 * To SOC camera, there is only one YUVPP pipe in any case
-	 * including ZSL/SDV/continuous viewfinder, so always set
-	 * stream_config.continuous to 0.
-	 */
-	if (ATOMISP_USE_YUVPP(asd)) {
-		stream_env->stream_config.continuous = 0;
-		stream_env->stream_config.online = 1;
-		return;
-	}
-
 	if (stream_env->stream_config.continuous != !!enable) {
 		stream_env->stream_config.continuous = !!enable;
 		stream_env->stream_config.pack_raw_pixels = true;
@@ -2081,42 +2070,6 @@ static void __configure_output(struct atomisp_sub_device *asd,
 		pipe_id, width, height, format);
 }
 
-static void __configure_video_preview_output(struct atomisp_sub_device *asd,
-	unsigned int stream_index,
-	unsigned int width, unsigned int height,
-	unsigned int min_width,
-	enum ia_css_frame_format format,
-	enum ia_css_pipe_id pipe_id)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[stream_index];
-	struct ia_css_frame_info *css_output_info;
-	struct ia_css_stream_config *stream_config = &stream_env->stream_config;
-
-	stream_env->pipe_configs[pipe_id].mode =
-	    __pipe_id_to_pipe_mode(asd, pipe_id);
-	stream_env->update_pipe[pipe_id] = true;
-
-	css_output_info =
-		&stream_env->pipe_configs[pipe_id].output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
-
-	css_output_info->res.width = width;
-	css_output_info->res.height = height;
-	css_output_info->format = format;
-	css_output_info->padded_width = min_width;
-
-	/* isp binary 2.2 specific setting*/
-	if (width > stream_config->input_config.effective_res.width ||
-	    height > stream_config->input_config.effective_res.height) {
-		stream_config->input_config.effective_res.width = width;
-		stream_config->input_config.effective_res.height = height;
-	}
-
-	dev_dbg(isp->dev, "configuring pipe[%d] output info w=%d.h=%d.f=%d.\n",
-		pipe_id, width, height, format);
-}
-
 /*
  * For CSS2.1, capture pipe uses capture_pp_in_res to configure yuv
  * downscaling input resolution.
@@ -2420,33 +2373,6 @@ static void __configure_vf_output(struct atomisp_sub_device *asd,
 		pipe_id, width, height, format);
 }
 
-static void __configure_video_vf_output(struct atomisp_sub_device *asd,
-					unsigned int width, unsigned int height,
-					unsigned int min_width,
-					enum ia_css_frame_format format,
-					enum ia_css_pipe_id pipe_id)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	struct ia_css_frame_info *css_output_info;
-
-	stream_env->pipe_configs[pipe_id].mode =
-	    __pipe_id_to_pipe_mode(asd, pipe_id);
-	stream_env->update_pipe[pipe_id] = true;
-
-	css_output_info =
-		&stream_env->pipe_configs[pipe_id].vf_output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
-
-	css_output_info->res.width = width;
-	css_output_info->res.height = height;
-	css_output_info->format = format;
-	css_output_info->padded_width = min_width;
-	dev_dbg(isp->dev,
-		"configuring pipe[%d] vf output info w=%d.h=%d.f=%d.\n",
-		pipe_id, width, height, format);
-}
-
 static int __get_frame_info(struct atomisp_sub_device *asd,
 			    unsigned int stream_index,
 			    struct ia_css_frame_info *info,
@@ -2506,11 +2432,6 @@ static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd,
 	uint16_t source_pad)
 {
 	struct atomisp_device *isp = asd->isp;
-	/*
-	 * to SOC camera, use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		return IA_CSS_PIPE_ID_YUVPP;
 
 	switch (source_pad) {
 	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
@@ -2651,16 +2572,8 @@ int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
 	unsigned int min_width,
 	enum ia_css_frame_format format)
 {
-	/*
-	 * to SOC camera, use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		__configure_video_preview_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width,
-						 height,
-						 min_width, format, IA_CSS_PIPE_ID_YUVPP);
-	else
-		__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
-				   min_width, format, IA_CSS_PIPE_ID_PREVIEW);
+	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
+			   min_width, format, IA_CSS_PIPE_ID_PREVIEW);
 	return 0;
 }
 
@@ -2669,18 +2582,8 @@ int atomisp_css_capture_configure_output(struct atomisp_sub_device *asd,
 	unsigned int min_width,
 	enum ia_css_frame_format format)
 {
-	enum ia_css_pipe_id pipe_id;
-
-	/*
-	 * to SOC camera, use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	else
-		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-
 	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
-			   min_width, format, pipe_id);
+			   min_width, format, IA_CSS_PIPE_ID_CAPTURE);
 	return 0;
 }
 
@@ -2689,16 +2592,8 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
 				       unsigned int min_width,
 				       enum ia_css_frame_format format)
 {
-	/*
-	 * to SOC camera, use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		__configure_video_preview_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width,
-						 height,
-						 min_width, format, IA_CSS_PIPE_ID_YUVPP);
-	else
-		__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
-				   min_width, format, IA_CSS_PIPE_ID_VIDEO);
+	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
+			   min_width, format, IA_CSS_PIPE_ID_VIDEO);
 	return 0;
 }
 
@@ -2708,15 +2603,8 @@ int atomisp_css_video_configure_viewfinder(
     unsigned int min_width,
     enum ia_css_frame_format format)
 {
-	/*
-	 * to SOC camera, video will use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		__configure_video_vf_output(asd, width, height, min_width, format,
-					    IA_CSS_PIPE_ID_YUVPP);
-	else
-		__configure_vf_output(asd, width, height, min_width, format,
-				      IA_CSS_PIPE_ID_VIDEO);
+	__configure_vf_output(asd, width, height, min_width, format,
+			      IA_CSS_PIPE_ID_VIDEO);
 	return 0;
 }
 
@@ -2726,18 +2614,7 @@ int atomisp_css_capture_configure_viewfinder(
     unsigned int min_width,
     enum ia_css_frame_format format)
 {
-	enum ia_css_pipe_id pipe_id;
-
-	/*
-	 * to SOC camera, video will use yuvpp pipe.
-	 */
-	if (ATOMISP_USE_YUVPP(asd))
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	else
-		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-
-	__configure_vf_output(asd, width, height, min_width, format,
-			      pipe_id);
+	__configure_vf_output(asd, width, height, min_width, format, IA_CSS_PIPE_ID_CAPTURE);
 	return 0;
 }
 
@@ -2745,41 +2622,22 @@ int atomisp_css_video_get_viewfinder_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info)
 {
-	enum ia_css_pipe_id pipe_id;
-	enum frame_info_type frame_type = ATOMISP_CSS_VF_FRAME;
-
-	if (ATOMISP_USE_YUVPP(asd)) {
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	} else {
-		pipe_id = IA_CSS_PIPE_ID_VIDEO;
-	}
-
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
-				frame_type, pipe_id);
+				ATOMISP_CSS_VF_FRAME, IA_CSS_PIPE_ID_VIDEO);
 }
 
 int atomisp_css_capture_get_viewfinder_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info)
 {
-	enum ia_css_pipe_id pipe_id;
-
-	if (ATOMISP_USE_YUVPP(asd))
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	else
-		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
-				ATOMISP_CSS_VF_FRAME, pipe_id);
+				ATOMISP_CSS_VF_FRAME, IA_CSS_PIPE_ID_CAPTURE);
 }
 
 int atomisp_css_capture_get_output_raw_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info)
 {
-	if (ATOMISP_USE_YUVPP(asd))
-		return 0;
-
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
 				ATOMISP_CSS_RAW_FRAME, IA_CSS_PIPE_ID_CAPTURE);
 }
@@ -2797,49 +2655,24 @@ int atomisp_css_preview_get_output_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info)
 {
-	enum ia_css_pipe_id pipe_id;
-	enum frame_info_type frame_type = ATOMISP_CSS_OUTPUT_FRAME;
-
-	if (ATOMISP_USE_YUVPP(asd)) {
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	} else {
-		pipe_id = IA_CSS_PIPE_ID_PREVIEW;
-	}
-
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
-				frame_type, pipe_id);
+				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_PREVIEW);
 }
 
 int atomisp_css_capture_get_output_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info)
 {
-	enum ia_css_pipe_id pipe_id;
-
-	if (ATOMISP_USE_YUVPP(asd))
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	else
-		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
-				ATOMISP_CSS_OUTPUT_FRAME, pipe_id);
+				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_CAPTURE);
 }
 
 int atomisp_css_video_get_output_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info)
 {
-	enum ia_css_pipe_id pipe_id;
-	enum frame_info_type frame_type = ATOMISP_CSS_OUTPUT_FRAME;
-
-	if (ATOMISP_USE_YUVPP(asd)) {
-		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-	} else {
-		pipe_id = IA_CSS_PIPE_ID_VIDEO;
-	}
-
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
-				frame_type, pipe_id);
+				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_VIDEO);
 }
 
 int atomisp_css_preview_configure_pp_input(
@@ -2848,15 +2681,12 @@ int atomisp_css_preview_configure_pp_input(
 {
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
-	__configure_preview_pp_input(asd, width, height,
-				     ATOMISP_USE_YUVPP(asd) ?
-				     IA_CSS_PIPE_ID_YUVPP : IA_CSS_PIPE_ID_PREVIEW);
+	__configure_preview_pp_input(asd, width, height, IA_CSS_PIPE_ID_PREVIEW);
 
 	if (width > stream_env->pipe_configs[IA_CSS_PIPE_ID_CAPTURE].
 	    capt_pp_in_res.width)
-		__configure_capture_pp_input(asd, width, height,
-					     ATOMISP_USE_YUVPP(asd) ?
-					     IA_CSS_PIPE_ID_YUVPP : IA_CSS_PIPE_ID_CAPTURE);
+		__configure_capture_pp_input(asd, width, height, IA_CSS_PIPE_ID_CAPTURE);
+
 	return 0;
 }
 
@@ -2864,9 +2694,7 @@ int atomisp_css_capture_configure_pp_input(
     struct atomisp_sub_device *asd,
     unsigned int width, unsigned int height)
 {
-	__configure_capture_pp_input(asd, width, height,
-				     ATOMISP_USE_YUVPP(asd) ?
-				     IA_CSS_PIPE_ID_YUVPP : IA_CSS_PIPE_ID_CAPTURE);
+	__configure_capture_pp_input(asd, width, height, IA_CSS_PIPE_ID_CAPTURE);
 	return 0;
 }
 
@@ -2877,15 +2705,12 @@ int atomisp_css_video_configure_pp_input(
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
 
-	__configure_video_pp_input(asd, width, height,
-				   ATOMISP_USE_YUVPP(asd) ?
-				   IA_CSS_PIPE_ID_YUVPP : IA_CSS_PIPE_ID_VIDEO);
+	__configure_video_pp_input(asd, width, height, IA_CSS_PIPE_ID_VIDEO);
 
 	if (width > stream_env->pipe_configs[IA_CSS_PIPE_ID_CAPTURE].
 	    capt_pp_in_res.width)
-		__configure_capture_pp_input(asd, width, height,
-					     ATOMISP_USE_YUVPP(asd) ?
-					     IA_CSS_PIPE_ID_YUVPP : IA_CSS_PIPE_ID_CAPTURE);
+		__configure_capture_pp_input(asd, width, height, IA_CSS_PIPE_ID_CAPTURE);
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index e5203f68f0f9..5ba5739c144b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -346,16 +346,6 @@ static int atomisp_get_css_buf_type(struct atomisp_sub_device *asd,
 				    enum ia_css_pipe_id pipe_id,
 				    uint16_t source_pad)
 {
-	if (ATOMISP_USE_YUVPP(asd)) {
-		if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE ||
-		    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO ||
-		    (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
-		     asd->run_mode->val != ATOMISP_RUN_MODE_VIDEO))
-			return IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
-		else
-			return IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME;
-	}
-
 	if (pipe_id == IA_CSS_PIPE_ID_COPY ||
 	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE ||
 	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO ||
@@ -424,12 +414,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 			       atomisp_subdev_source_pad(&capture_pipe->vdev));
 		input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
 
-		/*
-		 * use yuvpp pipe for SOC camera.
-		 */
-		if (ATOMISP_USE_YUVPP(asd))
-			css_capture_pipe_id = IA_CSS_PIPE_ID_YUVPP;
-
 		atomisp_q_video_buffers_to_css(asd, capture_pipe,
 					       input_stream_id,
 					       buf_type, css_capture_pipe_id);
@@ -444,11 +428,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		else
 			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
 
-		/*
-		 * use yuvpp pipe for SOC camera.
-		 */
-		if (ATOMISP_USE_YUVPP(asd))
-			css_capture_pipe_id = IA_CSS_PIPE_ID_YUVPP;
 		atomisp_q_video_buffers_to_css(asd, vf_pipe,
 					       input_stream_id,
 					       buf_type, css_capture_pipe_id);
@@ -466,12 +445,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		else
 			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
 
-		/*
-		 * use yuvpp pipe for SOC camera.
-		 */
-		if (ATOMISP_USE_YUVPP(asd))
-			css_preview_pipe_id = IA_CSS_PIPE_ID_YUVPP;
-
 		atomisp_q_video_buffers_to_css(asd, preview_pipe,
 					       input_stream_id,
 					       buf_type, css_preview_pipe_id);
@@ -486,12 +459,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		else
 			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
 
-		/*
-		 * use yuvpp pipe for SOC camera.
-		 */
-		if (ATOMISP_USE_YUVPP(asd))
-			css_video_pipe_id = IA_CSS_PIPE_ID_YUVPP;
-
 		atomisp_q_video_buffers_to_css(asd, video_pipe,
 					       input_stream_id,
 					       buf_type, css_video_pipe_id);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 1c1c4cf41e32..681a9258288d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -117,8 +117,6 @@
 #define ATOMISP_CSS_OUTPUT_SECOND_INDEX     1
 #define ATOMISP_CSS_OUTPUT_DEFAULT_INDEX    0
 
-#define ATOMISP_USE_YUVPP(asd)		false
-
 /* ISP2401 */
 #define ATOMISP_ION_DEVICE_FD_OFFSET   16
 #define ATOMISP_ION_SHARED_FD_MASK     (0xFFFF)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87e9b0b284d9..99cfe8a80bb1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1120,9 +1120,6 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 
 enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device *asd)
 {
-	if (ATOMISP_USE_YUVPP(asd))
-		return IA_CSS_PIPE_ID_YUVPP;
-
 	/*
 	 * Disable vf_pp and run CSS in video mode. This allows using ISP
 	 * scaling but it has one frame delay due to CSS internal buffering.
-- 
2.39.1

