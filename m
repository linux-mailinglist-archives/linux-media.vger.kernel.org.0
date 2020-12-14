Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15782D98C1
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 14:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439777AbgLNN2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 08:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439741AbgLNN2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 08:28:08 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4D2C0613D3
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 05:27:27 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id q4so2899230plr.7
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 05:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=w/xga15fpvf223g1LToCcvKonyr8d0IUXYfgkxm6LLw=;
        b=ZgUK/nAiJkiLJ84hMO3nR/+Zdeh13SON+QUAe8TvyR2XZf0Gkk6hXFOMJkDnU5q1wL
         FxNYSItxNDx5D3mQ+tGcbS+fdygzMIT7Mp6z29mkOuBog1zssOoWRRPvIi4TGG7Jnkd+
         Yz8T1RWFxYn5gjiCS4Lv7VpNv8gnFS5UC21G0LUa7YZEO/BGK/VAj5w3DR1PW9SXmF28
         JZn9fycsK7tI0YztyTrS1FqgNM2kb+GTTzosZwpi3VazmFdS/al7n9cBqGN7MTrWs/s2
         g1v16/YPxFiFe5N39TtPKgBPNGFhkyRZ8dbImxUh3wPFxl7t7j+gCc102Cr63odka6Fp
         V3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w/xga15fpvf223g1LToCcvKonyr8d0IUXYfgkxm6LLw=;
        b=JZy+6a1X+hqRquG9hW5SwJW37XRG28IX0BDJ4PXN5KbpV3A3pYYp7HrlZzZkJHqi6I
         C82TmTG/GsrIo2J2Z1E+hN7p5oWxHGni7dx+otA7TNlcxEvRyZlxjqCphOuT2XXa9ZeN
         35PhKFbrEKn9TF6SRm9lUzCDbPJyysLuAPUljWuEIgX9fxhVEWAvX+/R+GnA1mK/QuRR
         H0bYPSZ1rq9BnUTKZDgMXFVh13D/v2LoxTb7i0r2jlYGVFqBQvLJUo2e8AAYft8WFESp
         hybpPFP0yPBFrlHvOJ5kAJdz6xaSG8cwURns78ptKMq95Gnnd98GYJnLiwAxV3DghM7x
         GbbQ==
X-Gm-Message-State: AOAM530st6girEV93rEFbcYmR9ln2Fb2T5iwZEpk1wv3YX35gpoLAtJn
        tgSa2yBuyzaIU3U3p53Ob5VHwkHrkFxNbQ==
X-Google-Smtp-Source: ABdhPJzJUWP2hEoBaWY4snpg8ej0W+HdCMlhzSjpebEX80m5j2fm+jelBbjtFAOEE8w9WmVShQeBZQ==
X-Received: by 2002:a17:90a:cb8d:: with SMTP id a13mr25142870pju.155.1607952446672;
        Mon, 14 Dec 2020 05:27:26 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:434:48f9:6555:5055:78fe:89cf])
        by smtp.googlemail.com with ESMTPSA id k64sm19944081pfd.75.2020.12.14.05.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 05:27:26 -0800 (PST)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel-mentees@lists.linuxfoundation.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        lukas.bulwahn@gmail.com, yashsri421@gmail.com
Subject: [PATCH] media: atomisp: replace boolean comparison of values with bool variables
Date:   Mon, 14 Dec 2020 18:57:16 +0530
Message-Id: <20201214132716.28157-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are certain expressions in a condition in atomisp, where a boolean
variable is compared with true/false in forms such as (foo == true)
or (false != bar), which does not comply with the coding style rule by
checkpatch.pl (CHK: BOOL_COMPARISON), according to which the boolean
variables should be themselves used in the condition, rather than
comparing with true or false.

E.g. In drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:

if (asd->stream_prepared == false) {

Can be replaced with:
if (!asd->stream_prepared) {

Replace such expressions with boolean variables appropriately.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* The changes made are compile tested
* The patch applies perfectly over next-20201204

 .../staging/media/atomisp/pci/atomisp_compat_css20.c |  2 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c      | 12 ++++++------
 drivers/staging/media/atomisp/pci/sh_css.c           | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index faa0935e536a..6a80c676f668 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1142,7 +1142,7 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	 * Thus the stream created in set_fmt get destroyed and need to be
 	 * recreated in the next stream on.
 	 */
-	if (asd->stream_prepared == false) {
+	if (!asd->stream_prepared) {
 		if (__create_pipes(asd)) {
 			dev_err(isp->dev, "create pipe error.\n");
 			return -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 317ea30ede7a..82f3c19dc455 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -179,12 +179,12 @@ ia_css_isys_error_t ia_css_isys_stream_create(
 	isys_stream->linked_isys_stream_id = isys_stream_descr->linked_isys_stream_id;
 	rc = create_input_system_input_port(isys_stream_descr,
 					    &isys_stream->input_port);
-	if (rc == false)
+	if (!rc)
 		return false;
 
 	rc = create_input_system_channel(isys_stream_descr, false,
 					 &isys_stream->channel);
-	if (rc == false) {
+	if (!rc) {
 		destroy_input_system_input_port(&isys_stream->input_port);
 		return false;
 	}
@@ -204,7 +204,7 @@ ia_css_isys_error_t ia_css_isys_stream_create(
 	if (isys_stream_descr->metadata.enable) {
 		rc = create_input_system_channel(isys_stream_descr, true,
 						 &isys_stream->md_channel);
-		if (rc == false) {
+		if (!rc) {
 			destroy_input_system_input_port(&isys_stream->input_port);
 			destroy_input_system_channel(&isys_stream->channel);
 			return false;
@@ -248,7 +248,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 		  isys_stream_descr,
 		  &isys_stream_cfg->channel_cfg,
 		  false);
-	if (rc == false)
+	if (!rc)
 		return false;
 
 	/* configure metadata channel */
@@ -260,7 +260,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 			  isys_stream_descr,
 			  &isys_stream_cfg->md_channel_cfg,
 			  true);
-		if (rc == false)
+		if (!rc)
 			return false;
 	}
 
@@ -269,7 +269,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 		 &isys_stream->input_port,
 		 isys_stream_descr,
 		 &isys_stream_cfg->input_port_cfg);
-	if (rc == false)
+	if (!rc)
 		return false;
 
 	isys_stream->valid = 1;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ddee04c8248d..a71c1bbd984b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1063,7 +1063,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_config_input_network() enter 0x%p:\n", stream);
 
-	if (stream->config.continuous == true)
+	if (stream->config.continuous)
 	{
 		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
 			pipe = stream->last_pipe;
@@ -5626,7 +5626,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		} else {
 			/* output from main binary is not yuv line. currently this is
 			 * possible only when bci is enabled on vfpp output */
-			assert(pipe->config.enable_vfpp_bci == true);
+			assert(pipe->config.enable_vfpp_bci);
 			ia_css_pipe_get_yuvscaler_binarydesc(pipe, &vf_pp_descr,
 							     &mycs->video_binary.vf_frame_info,
 							     pipe_vf_out_info, NULL, NULL);
@@ -8072,7 +8072,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 		struct ia_css_frame *tmp_out_frame = NULL;
 
 		for (i = 0; i < num_yuv_scaler; i++) {
-			if (is_output_stage[i] == true)
+			if (is_output_stage[i])
 				tmp_out_frame = out_frame;
 			else
 				tmp_out_frame = NULL;
@@ -8464,7 +8464,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
 	/* In QoS case, load_extension already called, so skipping */
 	int	err = 0;
 
-	if (fw->loaded == false)
+	if (!fw->loaded)
 		err = acc_load_extension(fw);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -9701,8 +9701,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 			assert(entry);
 			if (entry) {
 				/* get the SP thread id */
-				if (ia_css_pipeline_get_sp_thread_id(
-					ia_css_pipe_get_pipe_num(entry), &sp_thread_id) != true)
+				if (!ia_css_pipeline_get_sp_thread_id(
+					ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
 					return -EINVAL;
 				/* get the target input terminal */
 				sp_pipeline_input_terminal =
-- 
2.17.1

