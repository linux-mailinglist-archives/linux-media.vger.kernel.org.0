Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79C74530C0
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235409AbhKPLdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:33:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:35212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235048AbhKPLca (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C6D761B30;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=wcPVqyqBHfYOV96dEkNXvZZye3BXJsLhbBktqxNEuMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sHm2lYnQXfWuA4KaK0iZzQh5+/nC40ViX9IUUwgsR0vNYVjar4QwndIXc5/KfozPm
         6JsodujS9uv/pkkKsVKL+aE4vIlW+25LcTDDrIPWdFA1NC2YFZW0a2ZzSR8qIxY5yP
         SPZ0FZqnnccUfFxkwHN/o95hOLNVYLejVkCIVg/v/HPQGXEkv491buRgJ65LmEujQD
         6F220Eb+PiTcqBJ2DAd65OXfNGCfx+j81HF6uYX4aG5/hPBJA0fVioM7a3Dx4ioCFh
         TLXc5IZljp8jUiigT0cF+dIM/rSqBqUHnZFfoV7V+a1sKmqKxddUCZmdbCVWL3x7n1
         ZvZib4XiM1QUw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfR-F6; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 07/23] media: atomisp: drop two vars that are currently ignored
Date:   Tue, 16 Nov 2021 11:28:48 +0000
Message-Id: <a2f938e506ff86d724d40520267da0ffaf00bce3.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those two vars are meaningful only with some ISP2401 firmwares.
The one we chose to support doesn't use, so simply drop the
extra code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 .../pci/runtime/pipeline/src/pipeline.c       |  3 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 49 +++----------------
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  7 +--
 drivers/staging/media/atomisp/pci/sh_css_sp.h |  7 +--
 4 files changed, 10 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index d03957d1ecf4..dfc50247ea8e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -140,8 +140,7 @@ void ia_css_pipeline_start(enum ia_css_pipe_id pipe_id,
 				false, false, false, true, SH_CSS_BDS_FACTOR_1_00,
 				SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD,
 				IA_CSS_INPUT_MODE_MEMORY, NULL, NULL,
-				(enum mipi_port_id)0,
-				NULL, NULL);
+				(enum mipi_port_id)0);
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 	if (!sh_css_sp_is_running()) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ac3519d08971..3aa4f8bc39c4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1426,20 +1426,11 @@ static void start_pipe(
     enum sh_css_pipe_config_override copy_ovrd,
     enum ia_css_input_mode input_mode)
 {
-	const struct ia_css_coordinate *coord = NULL;
-	const struct ia_css_isp_parameters *params = NULL;
-
-
 	IA_CSS_ENTER_PRIVATE("me = %p, copy_ovrd = %d, input_mode = %d",
 			     me, copy_ovrd, input_mode);
 
 	assert(me); /* all callers are in this file and call with non null argument */
 
-	if (IS_ISP2401) {
-		coord = &me->config.internal_frame_origin_bqs_on_sctbl;
-		params = me->stream->isp_params_configs;
-	}
-
 	sh_css_sp_init_pipeline(&me->pipeline,
 				me->mode,
 				(uint8_t)ia_css_pipe_get_pipe_num(me),
@@ -1454,9 +1445,7 @@ static void start_pipe(
 				&me->stream->info.metadata_info
 				, (input_mode == IA_CSS_INPUT_MODE_MEMORY) ?
 				(enum mipi_port_id)0 :
-				me->stream->config.source.port.port,
-				coord,
-				params);
+				me->stream->config.source.port.port);
 
 	if (me->config.mode != IA_CSS_PIPE_MODE_COPY) {
 		struct ia_css_pipeline_stage *stage;
@@ -3882,8 +3871,6 @@ preview_start(struct ia_css_pipe *pipe)
 	struct ia_css_pipe *acc_pipe;
 	enum sh_css_pipe_config_override copy_ovrd;
 	enum ia_css_input_mode preview_pipe_input_mode;
-	const struct ia_css_coordinate *coord = NULL;
-	const struct ia_css_isp_parameters *params = NULL;
 	unsigned int thread_id;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
@@ -3913,15 +3900,10 @@ preview_start(struct ia_css_pipe *pipe)
 
 	if (pipe->stream->cont_capt) {
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
-						    &thread_id);
+						 &thread_id);
 		copy_ovrd |= 1 << thread_id;
 	}
 
-	if (IS_ISP2401) {
-		coord = &pipe->config.internal_frame_origin_bqs_on_sctbl;
-		params = pipe->stream->isp_params_configs;
-	}
-
 	/* Construct and load the copy pipe */
 	if (pipe->stream->config.continuous) {
 		sh_css_sp_init_pipeline(&copy_pipe->pipeline,
@@ -3934,9 +3916,7 @@ preview_start(struct ia_css_pipe *pipe)
 					pipe->stream->config.mode,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-					pipe->stream->config.source.port.port,
-					coord,
-					params);
+					pipe->stream->config.source.port.port);
 
 		/*
 		 * make the preview pipe start with mem mode input, copy handles
@@ -3959,9 +3939,7 @@ preview_start(struct ia_css_pipe *pipe)
 					IA_CSS_INPUT_MODE_MEMORY,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-					(enum mipi_port_id)0,
-					coord,
-					params);
+					(enum mipi_port_id)0);
 	}
 
 	if (acc_pipe) {
@@ -3977,9 +3955,7 @@ preview_start(struct ia_css_pipe *pipe)
 					IA_CSS_INPUT_MODE_MEMORY,
 					NULL,
 					NULL,
-					(enum mipi_port_id)0,
-					coord,
-					params);
+					(enum mipi_port_id)0);
 	}
 
 	start_pipe(pipe, copy_ovrd, preview_pipe_input_mode);
@@ -5650,8 +5626,6 @@ static int video_start(struct ia_css_pipe *pipe)
 	struct ia_css_pipe *copy_pipe, *capture_pipe;
 	enum sh_css_pipe_config_override copy_ovrd;
 	enum ia_css_input_mode video_pipe_input_mode;
-	const struct ia_css_coordinate *coord = NULL;
-	const struct ia_css_isp_parameters *params = NULL;
 	unsigned int thread_id;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
@@ -5684,11 +5658,6 @@ static int video_start(struct ia_css_pipe *pipe)
 		copy_ovrd |= 1 << thread_id;
 	}
 
-	if (IS_ISP2401) {
-		coord = &pipe->config.internal_frame_origin_bqs_on_sctbl;
-		params = pipe->stream->isp_params_configs;
-	}
-
 	/* Construct and load the copy pipe */
 	if (pipe->stream->config.continuous) {
 		sh_css_sp_init_pipeline(&copy_pipe->pipeline,
@@ -5701,9 +5670,7 @@ static int video_start(struct ia_css_pipe *pipe)
 					pipe->stream->config.mode,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-					pipe->stream->config.source.port.port,
-					coord,
-					params);
+					pipe->stream->config.source.port.port);
 
 		/*
 		 * make the video pipe start with mem mode input, copy handles
@@ -5726,9 +5693,7 @@ static int video_start(struct ia_css_pipe *pipe)
 					IA_CSS_INPUT_MODE_MEMORY,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-					(enum mipi_port_id)0,
-					coord,
-					params);
+					(enum mipi_port_id)0);
 	}
 
 	start_pipe(pipe, copy_ovrd, video_pipe_input_mode);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 77ac720017a2..ff7c2c5fd94d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1217,12 +1217,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 			enum ia_css_input_mode input_mode,
 			const struct ia_css_metadata_config *md_config,
 			const struct ia_css_metadata_info *md_info,
-			const enum mipi_port_id port_id,
-			const struct ia_css_coordinate
-			*internal_frame_origin_bqs_on_sctbl, /* Origin of internal frame
-							positioned on shading table at shading correction in ISP. */
-			const struct ia_css_isp_parameters *params
-		       )
+			const enum mipi_port_id port_id)
 {
 	/* Get first stage */
 	struct ia_css_pipeline_stage *stage        = NULL;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index 832eed711525..f69a79b0b0da 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -66,12 +66,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 			enum ia_css_input_mode input_mode,
 			const struct ia_css_metadata_config *md_config,
 			const struct ia_css_metadata_info *md_info,
-			const enum mipi_port_id port_id,
-			const struct ia_css_coordinate
-			*internal_frame_origin_bqs_on_sctbl, /* Origin of internal frame
-							positioned on shading table at shading correction in ISP. */
-			const struct ia_css_isp_parameters *params
-		       );
+			const enum mipi_port_id port_id);
 
 void
 sh_css_sp_uninit_pipeline(unsigned int pipe_num);
-- 
2.33.1

