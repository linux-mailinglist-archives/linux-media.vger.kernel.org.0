Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4260D600945
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbiJQIxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiJQIwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F56D50043
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zom57FWOfLT++dLo3DRJn0dfMuacNy3UbMaI3Kq6QV0=;
        b=LFqXHbrFToHLPFpcCpkrMoCSzNDxYZ9Q/8EwGAmdDco6HD7ZXx5bs6BFi5fA0SfpvaVAr1
        V4YA577Hud55ig3r+tIcnNiNptc8rH969P+O+AwzNn57xM1YUadtk5dOmnxhiSXRSJZYtO
        kCcXcWEO9gEuUjr3dH4C2CZ1gqh77aE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-6iXk_CbzPQSi9-ip79b5vA-1; Mon, 17 Oct 2022 04:52:11 -0400
X-MC-Unique: 6iXk_CbzPQSi9-ip79b5vA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AC0686F14A;
        Mon, 17 Oct 2022 08:52:03 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1C97F10A58D0;
        Mon, 17 Oct 2022 08:51:54 +0000 (UTC)
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
Subject: [PATCH 16/17] media: atomisp: Remove __atomisp_get_pipe() helper
Date:   Mon, 17 Oct 2022 10:50:56 +0200
Message-Id: <20221017085057.7483-17-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the complicated __atomisp_get_pipe() helper, atomisp_buf_done()
only needs the pipe pointer in cases where it has a frame, so we can
simply get the pipe from the frame using the vb_to_pipe() helper.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 98 +------------------
 1 file changed, 4 insertions(+), 94 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b52c8e010752..82d936819ed6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -754,93 +754,6 @@ static void atomisp_recover_params_queue(struct atomisp_video_pipe *pipe)
 	atomisp_handle_parameter_and_buffer(pipe);
 }
 
-/* find atomisp_video_pipe with css pipe id, buffer type and atomisp run_mode */
-static struct atomisp_video_pipe *__atomisp_get_pipe(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    enum ia_css_pipe_id css_pipe_id,
-    enum ia_css_buffer_type buf_type)
-{
-	/* video is same in online as in continuouscapture mode */
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
-		/*
-		 * Disable vf_pp and run CSS in still capture mode. In this
-		 * mode, CSS does not cause extra latency with buffering, but
-		 * scaling is not available.
-		 */
-		return &asd->video_out_capture;
-	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
-		/*
-		 * Disable vf_pp and run CSS in video mode. This allows using
-		 * ISP scaling but it has one frame delay due to CSS internal
-		 * buffering.
-		 */
-		return &asd->video_out_video_capture;
-	} else if (css_pipe_id == IA_CSS_PIPE_ID_YUVPP) {
-		/*
-		 * to SOC camera, yuvpp pipe is run for capture/video/SDV/ZSL.
-		 */
-		if (asd->continuous_mode->val) {
-			if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-				/* SDV case */
-				switch (buf_type) {
-				case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-					return &asd->video_out_video_capture;
-				case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
-					return &asd->video_out_preview;
-				case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
-					return &asd->video_out_capture;
-				default:
-					return &asd->video_out_vf;
-				}
-			} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
-				/* ZSL case */
-				switch (buf_type) {
-				case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-					return &asd->video_out_preview;
-				case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
-					return &asd->video_out_capture;
-				default:
-					return &asd->video_out_vf;
-				}
-			}
-		} else if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
-			switch (asd->run_mode->val) {
-			case ATOMISP_RUN_MODE_VIDEO:
-				return &asd->video_out_video_capture;
-			case ATOMISP_RUN_MODE_PREVIEW:
-				return &asd->video_out_preview;
-			default:
-				return &asd->video_out_capture;
-			}
-		} else if (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) {
-			if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-				return &asd->video_out_preview;
-			else
-				return &asd->video_out_vf;
-		}
-	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		/* For online video or SDV video pipe. */
-		if (css_pipe_id == IA_CSS_PIPE_ID_VIDEO ||
-		    css_pipe_id == IA_CSS_PIPE_ID_COPY ||
-		    css_pipe_id == IA_CSS_PIPE_ID_YUVPP) {
-			if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
-				return &asd->video_out_video_capture;
-			return &asd->video_out_preview;
-		}
-	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
-		/* For online preview or ZSL preview pipe. */
-		if (css_pipe_id == IA_CSS_PIPE_ID_PREVIEW ||
-		    css_pipe_id == IA_CSS_PIPE_ID_COPY ||
-		    css_pipe_id == IA_CSS_PIPE_ID_YUVPP)
-			return &asd->video_out_preview;
-	}
-	/* For capture pipe. */
-	if (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
-		return &asd->video_out_vf;
-	return &asd->video_out_capture;
-}
-
 enum atomisp_metadata_type
 atomisp_get_metadata_type(struct atomisp_sub_device *asd,
 			  enum ia_css_pipe_id pipe_id)
@@ -898,13 +811,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		return;
 	}
 
-	/* need to know the atomisp pipe for frame buffers */
-	pipe = __atomisp_get_pipe(asd, stream_id, css_pipe_id, buf_type);
-	if (!pipe) {
-		dev_err(isp->dev, "error getting atomisp pipe\n");
-		return;
-	}
-
 	switch (buf_type) {
 	case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
 		list_for_each_entry_safe(s3a_iter, _s3a_buf_tmp,
@@ -987,6 +893,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		if (!frame->valid)
 			error = true;
 
+		pipe = vb_to_pipe(&frame->vb.vb2_buf);
+
 		/* FIXME:
 		 * YUVPP doesn't set postview exp_id correctlly in SDV mode.
 		 * This is a WORKAROUND to set exp_id. see HSDES-1503911606.
@@ -1036,6 +944,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		if (!frame->valid)
 			error = true;
 
+		pipe = vb_to_pipe(&frame->vb.vb2_buf);
+
 		/* FIXME:
 		 * YUVPP doesn't set preview exp_id correctlly in ZSL mode.
 		 * This is a WORKAROUND to set exp_id. see HSDES-1503911606.
-- 
2.37.3

