Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C528425E7A0
	for <lists+linux-media@lfdr.de>; Sat,  5 Sep 2020 14:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgIEMw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Sep 2020 08:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEMw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Sep 2020 08:52:57 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268B3C061245;
        Sat,  5 Sep 2020 05:52:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so10110875wrn.0;
        Sat, 05 Sep 2020 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sW7CwIz7nHoVlUus2JZ0EZjErncmwvF3/D194oFFfUw=;
        b=tUYzWzXgO6/CT6DlVw/q0RFWNpnKyX9TT/oI8FPVercR6R2ZqxsIshHLMaY7/dJHvX
         CPacy12drAWVDyEvVQHQPYsmNTqp9il8dSkJg12I+mKKWY/mKeNa7+CM4KK4R+GQ6DcN
         cFP/Za8Q1Bi45WIi6TlM3deyE52RsrmI+B/owDGB5CrXG2UJMZ0FRxAFdJ2c32hm2RV5
         pFznmptuXr8+ovdi3u/t2WB1UUK7MeZC1aLXG+uB+mSOuRwBzTLbUAID0v4lX0rXYMkG
         jGk9EGpSZqwrb7G/v7OssI+vQAKwOoWAjtzxrMEwIGbwEXRCwYTtj+sdAHYqS2s6ZXzS
         Z7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sW7CwIz7nHoVlUus2JZ0EZjErncmwvF3/D194oFFfUw=;
        b=EM06lo0r8Gn2wg2AMwTcR1jLJsH7fxyktqDZp5ycB9oFizzh/HnaF+IlTuzgGkUaAa
         RVyiYYo3m6avS/asAYcnA3AEpesQBn5hja+1HSt2+ltIOilsylWsG9JgPCpJiMOgPeCR
         IQA49YF6Pir3Z4j1q0SqMr8cDgMbB8VYtfuPdDqwEtx72Bir1b/L2mk3BxZ1fx624KsB
         XIv0Fxwxm3gRH3NXA/9I7XxAo8uQRBGJkgN21NdBkFBALp/ZBqcdOIsi4+A9kNZC7D8+
         wGK+YthCs/06Tk+ZobyxRtmsCpKvpjrDHI2OAossM6EtHFhSVK+Kuas/p3mAH4lW8C/V
         r4uA==
X-Gm-Message-State: AOAM5329G48Wd2UhQeY9TGSJkgciRcQ9dDeuRx9l74NeWOoOLVwdcz+J
        0YAJiKcPlnfibmb1uDQ1m8Q=
X-Google-Smtp-Source: ABdhPJzH10pDeDkMwBg/ap9//oksqRaS8UV79Twt5Bol/lpiFmzGzvE5yrOTrs291vzoVDx9qJPotQ==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr13291759wrm.229.1599310369959;
        Sat, 05 Sep 2020 05:52:49 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id f14sm18241035wrv.72.2020.09.05.05.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 05:52:49 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Fix bool-related style issues
Date:   Sat,  5 Sep 2020 13:51:42 +0100
Message-Id: <20200905125152.96925-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Address the following issues:
 * unnecessary comparison to true/false
 * use of 0/1 instead of bool values
 * unnecessary conversion to bool

These were fixed using the following Coccinelle scripts:
 * scripts/coccinelle/misc/bool{init,conv,return}.cocci

Build-tested with allmodconfig.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  5 ++---
 drivers/staging/media/atomisp/pci/sh_css.c    | 20 +++++++++----------
 .../media/atomisp/pci/sh_css_firmware.c       |  2 +-
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a4e4eef55f35..5c32a71ce4de 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -654,8 +654,7 @@ bool atomisp_buffers_queued(struct atomisp_sub_device *asd)
 	return asd->video_out_capture.buffers_in_css ||
 	       asd->video_out_vf.buffers_in_css ||
 	       asd->video_out_preview.buffers_in_css ||
-	       asd->video_out_video_capture.buffers_in_css ?
-	       true : false;
+	       asd->video_out_video_capture.buffers_in_css;
 }
 
 /* ISP2401 */
@@ -6557,7 +6556,7 @@ int atomisp_enable_dz_capt_pipe(struct atomisp_sub_device *asd,
 	if (!enable)
 		return -EINVAL;
 
-	value = *enable > 0 ? true : false;
+	value = *enable > 0;
 
 	atomisp_en_dz_capt_pipe(asd, value);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index a68cbb4995f0..6c32afe810aa 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3733,7 +3733,7 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 		struct ia_css_frame *tmp_out_frame = NULL;
 
 		for (i = 0; i < num_yuv_scaler; i++) {
-			if (is_output_stage[i] == true) {
+			if (is_output_stage[i]) {
 				tmp_out_frame = out_frame;
 			} else {
 				tmp_out_frame = NULL;
@@ -4496,7 +4496,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			case IA_CSS_BUFFER_TYPE_INPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-				if ((pipe) && (pipe->stop_requested == true)) {
+				if (pipe && pipe->stop_requested) {
 #if defined(USE_INPUT_SYSTEM_VERSION_2)
 					/* free mipi frames only for old input system
 					 * for 2401 it is done in ia_css_stream_destroy call
@@ -4857,7 +4857,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 
 	pipe_id = pipe->mode;
 
-	if (stream->started == true)
+	if (stream->started)
 	{
 		IA_CSS_WARNING("Cannot start stream that is already started");
 		IA_CSS_LEAVE_ERR(err);
@@ -6010,7 +6010,7 @@ static bool need_capture_pp(
 
 	if (IS_ISP2401) {
 		/* ldc and capture_pp are not supported in the same pipeline */
-		if (need_capt_ldc(pipe) == true)
+		if (need_capt_ldc(pipe))
 			return false;
 	}
 
@@ -6230,8 +6230,8 @@ static int load_primary_binaries(
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
-		need_pp = 0;
-		need_ldc = 0;
+		need_pp = false;
+		need_ldc = false;
 	}
 
 	/* we build up the pipeline starting at the end */
@@ -9625,10 +9625,10 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 					IA_CSS_PIPE_MODE_VIDEO, false);
 		acc_pipe = find_pipe(pipes, num_pipes,
 					IA_CSS_PIPE_MODE_ACC, false);
-		if (acc_pipe && num_pipes == 2 && curr_stream->cont_capt == true)
+		if (acc_pipe && num_pipes == 2 && curr_stream->cont_capt)
 			curr_stream->cont_capt =
 			    false; /* preview + QoS case will not need cont_capt switch */
-		if (curr_stream->cont_capt == true) {
+		if (curr_stream->cont_capt) {
 			capture_pipe = find_pipe(pipes, num_pipes,
 						    IA_CSS_PIPE_MODE_CAPTURE, false);
 			if (!capture_pipe) {
@@ -9650,7 +9650,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			preview_pipe->pipe_settings.preview.copy_pipe = copy_pipe;
 			copy_pipe->stream = curr_stream;
 		}
-		if (preview_pipe && (curr_stream->cont_capt == true)) {
+		if (preview_pipe && curr_stream->cont_capt) {
 			preview_pipe->pipe_settings.preview.capture_pipe = capture_pipe;
 		}
 		if (video_pipe && !video_pipe->pipe_settings.video.copy_pipe) {
@@ -9661,7 +9661,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			video_pipe->pipe_settings.video.copy_pipe = copy_pipe;
 			copy_pipe->stream = curr_stream;
 		}
-		if (video_pipe && (curr_stream->cont_capt == true)) {
+		if (video_pipe && curr_stream->cont_capt) {
 			video_pipe->pipe_settings.video.capture_pipe = capture_pipe;
 		}
 		if (preview_pipe && acc_pipe) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index d4ab15b6d1ac..bc02aa726b06 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -204,7 +204,7 @@ sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 	}
 
 	/* For now, let's just accept a wrong version, even if wrong */
-	return 0;
+	return false;
 }
 
 static const char * const fw_type_name[] = {
-- 
2.28.0

