Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D214530D2
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235360AbhKPLfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:35:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:35444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235195AbhKPLco (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B922B6322D;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=U3MxoBvsoXIfguUXs6arCKLGL8bv2YFAy4MwNhpa9R4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cf9gbY739oVGoT+0h7MmItQMeiy0mnEztOoCQV7iXAac8j2JWkrnw/9Erjq15ublV
         3Eaa6Dyp2PaNEF7PtmIKWxbcdd+Al8WPgdIr/nzbS3dDWK1jAPzp9QqXA4MUGhS5U1
         dIXfACfdVi1zuxmZerrYdwyhn8mgaAUZKCWXzZCIKjziw5BwPeE9HnCltSY9+Ir+P3
         Dq/DJa7uH2V1GQZeVMdl96YOqvWGdQHmJazhZQCUw1BiTbqDcmn2gOEG3KQ7yFoqP9
         PQ0oWOs9TOc4zAVsjAtc16cxZScobGPYCs88jm86JH10Hc1+ZlynTFnUPJOemcqsJm
         jKcNjWkvJP6hA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfs-KZ; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 16/23] media: atomisp: unify ia_css_stream stop logic
Date:   Tue, 16 Nov 2021 11:28:57 +0000
Message-Id: <9927884a147027f6103805db5e1a63244f2f2dbe.1637061474.git.mchehab+huawei@kernel.org>
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

There are two versions of those functions. It turns that the
choosen firmware use the old version. So, drop the unused
ones and ensure that all devices will use the right functions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 214 +--------------------
 1 file changed, 2 insertions(+), 212 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index c73ef67959c9..adec184c8536 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -189,27 +189,6 @@ allocate_delay_frames(struct ia_css_pipe *pipe);
 static int
 sh_css_pipe_start(struct ia_css_stream *stream);
 
-/* ISP 2401 */
-/*
- * @brief Stop all "ia_css_pipe" instances in the target
- * "ia_css_stream" instance.
- *
- * @param[in] stream	Point to the target "ia_css_stream" instance.
- *
- * @return
- * - 0, if the "stop" requests have been successfully sent out.
- * - CSS error code, otherwise.
- *
- *
- * NOTE
- * This API sends the "stop" requests to the "ia_css_pipe"
- * instances in the same "ia_css_stream" instance. It will
- * return without waiting for all "ia_css_pipe" instatnces
- * being stopped.
- */
-static int
-sh_css_pipes_stop(struct ia_css_stream *stream);
-
 /*
  * @brief Check if all "ia_css_pipe" instances in the target
  * "ia_css_stream" instance have stopped.
@@ -221,9 +200,6 @@ sh_css_pipes_stop(struct ia_css_stream *stream);
  *   instance have ben stopped.
  * - false, otherwise.
  */
-/* ISP 2401 */
-static bool
-sh_css_pipes_have_stopped(struct ia_css_stream *stream);
 
 /* ISP 2401 */
 static int
@@ -4786,185 +4762,6 @@ ia_css_stream_get_buffer_depth(struct ia_css_stream *stream,
 	return 0;
 }
 
-/*
- * @brief Stop all "ia_css_pipe" instances in the target
- * "ia_css_stream" instance.
- *
- * Refer to "Local prototypes" for more info.
- */
-/* ISP2401 */
-static int
-sh_css_pipes_stop(struct ia_css_stream *stream)
-{
-	int err = 0;
-	struct ia_css_pipe *main_pipe;
-	enum ia_css_pipe_id main_pipe_id;
-	int i;
-
-	if (!stream) {
-		IA_CSS_LOG("stream does NOT exist!");
-		err = -EINVAL;
-		goto ERR;
-	}
-
-	main_pipe = stream->last_pipe;
-	if (!main_pipe) {
-		IA_CSS_LOG("main_pipe does NOT exist!");
-		err = -EINVAL;
-		goto ERR;
-	}
-
-	main_pipe_id = main_pipe->mode;
-	IA_CSS_ENTER_PRIVATE("main_pipe_id=%d", main_pipe_id);
-
-	/*
-	 * Stop all "ia_css_pipe" instances in this target
-	 * "ia_css_stream" instance.
-	 */
-	for (i = 0; i < stream->num_pipes; i++) {
-		/* send the "stop" request to the "ia_css_pipe" instance */
-		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
-			   stream->pipes[i]->pipeline.pipe_id);
-		err = ia_css_pipeline_request_stop(&stream->pipes[i]->pipeline);
-
-		/*
-		* Exit this loop if "ia_css_pipeline_request_stop()"
-		* returns the error code.
-		*
-		* The error code would be generated in the following
-		* two cases:
-		* (1) The Scalar Processor has already been stopped.
-		* (2) The "Host->SP" event queue is full.
-		*
-		* As the convention of using CSS API 2.0/2.1, such CSS
-		* error code would be propogated from the CSS-internal
-		* API returned value to the CSS API returned value. Then
-		* the CSS driver should capture these error code and
-		* handle it in the driver exception handling mechanism.
-		*/
-		if (err)
-			goto ERR;
-	}
-
-	/*
-	 * In the CSS firmware use scenario "Continuous Preview"
-	 * as well as "Continuous Video", the "ia_css_pipe" instance
-	 * "Copy Pipe" is activated. This "Copy Pipe" is private to
-	 * the CSS firmware so that it is not listed in the target
-	 * "ia_css_stream" instance.
-	 *
-	 * We need to stop this "Copy Pipe", as well.
-	 */
-	if (main_pipe->stream->config.continuous) {
-		struct ia_css_pipe *copy_pipe = NULL;
-
-		/* get the reference to "Copy Pipe" */
-		if (main_pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-			copy_pipe = main_pipe->pipe_settings.preview.copy_pipe;
-		else if (main_pipe_id == IA_CSS_PIPE_ID_VIDEO)
-			copy_pipe = main_pipe->pipe_settings.video.copy_pipe;
-
-		/* return the error code if "Copy Pipe" does NOT exist */
-		if (!copy_pipe) {
-			IA_CSS_LOG("Copy Pipe does NOT exist!");
-			err = -EINVAL;
-			goto ERR;
-		}
-
-		/* send the "stop" request to "Copy Pipe" */
-		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
-			   copy_pipe->pipeline.pipe_id);
-		err = ia_css_pipeline_request_stop(&copy_pipe->pipeline);
-	}
-
-ERR:
-	IA_CSS_LEAVE_ERR_PRIVATE(err);
-	return err;
-}
-
-/*
- * @brief Check if all "ia_css_pipe" instances in the target
- * "ia_css_stream" instance have stopped.
- *
- * Refer to "Local prototypes" for more info.
- */
-/* ISP2401 */
-static bool
-sh_css_pipes_have_stopped(struct ia_css_stream *stream)
-{
-	bool rval = true;
-
-	struct ia_css_pipe *main_pipe;
-	enum ia_css_pipe_id main_pipe_id;
-
-	int i;
-
-	if (!stream) {
-		IA_CSS_LOG("stream does NOT exist!");
-		rval = false;
-		goto RET;
-	}
-
-	main_pipe = stream->last_pipe;
-
-	if (!main_pipe) {
-		IA_CSS_LOG("main_pipe does NOT exist!");
-		rval = false;
-		goto RET;
-	}
-
-	main_pipe_id = main_pipe->mode;
-	IA_CSS_ENTER_PRIVATE("main_pipe_id=%d", main_pipe_id);
-
-	/*
-	 * Check if every "ia_css_pipe" instance in this target
-	 * "ia_css_stream" instance has stopped.
-	 */
-	for (i = 0; i < stream->num_pipes; i++) {
-		rval = rval && ia_css_pipeline_has_stopped(&stream->pipes[i]->pipeline);
-		IA_CSS_LOG("Pipe has stopped: pipe_id=%d, stopped=%d",
-			   stream->pipes[i]->pipeline.pipe_id,
-			   rval);
-	}
-
-	/*
-	 * In the CSS firmware use scenario "Continuous Preview"
-	 * as well as "Continuous Video", the "ia_css_pipe" instance
-	 * "Copy Pipe" is activated. This "Copy Pipe" is private to
-	 * the CSS firmware so that it is not listed in the target
-	 * "ia_css_stream" instance.
-	 *
-	 * We need to check if this "Copy Pipe" has stopped, as well.
-	 */
-	if (main_pipe->stream->config.continuous) {
-		struct ia_css_pipe *copy_pipe = NULL;
-
-		/* get the reference to "Copy Pipe" */
-		if (main_pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-			copy_pipe = main_pipe->pipe_settings.preview.copy_pipe;
-		else if (main_pipe_id == IA_CSS_PIPE_ID_VIDEO)
-			copy_pipe = main_pipe->pipe_settings.video.copy_pipe;
-
-		/* return if "Copy Pipe" does NOT exist */
-		if (!copy_pipe) {
-			IA_CSS_LOG("Copy Pipe does NOT exist!");
-
-			rval = false;
-			goto RET;
-		}
-
-		/* check if "Copy Pipe" has stopped or not */
-		rval = rval && ia_css_pipeline_has_stopped(&copy_pipe->pipeline);
-		IA_CSS_LOG("Pipe has stopped: pipe_id=%d, stopped=%d",
-			   copy_pipe->pipeline.pipe_id,
-			   rval);
-	}
-
-RET:
-	IA_CSS_LEAVE_PRIVATE("rval=%d", rval);
-	return rval;
-}
-
 #if !defined(ISP2401)
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port, const unsigned int idx)
@@ -9619,11 +9416,7 @@ ia_css_stream_stop(struct ia_css_stream *stream)
 	}
 #endif
 
-	if (!IS_ISP2401)
-		err = ia_css_pipeline_request_stop(&stream->last_pipe->pipeline);
-	else
-		err = sh_css_pipes_stop(stream);
-
+	err = ia_css_pipeline_request_stop(&stream->last_pipe->pipeline);
 	if (err)
 		return err;
 
@@ -9643,10 +9436,7 @@ ia_css_stream_has_stopped(struct ia_css_stream *stream)
 
 	assert(stream);
 
-	if (!IS_ISP2401)
-		stopped = ia_css_pipeline_has_stopped(&stream->last_pipe->pipeline);
-	else
-		stopped = sh_css_pipes_have_stopped(stream);
+	stopped = ia_css_pipeline_has_stopped(&stream->last_pipe->pipeline);
 
 	return stopped;
 }
-- 
2.33.1

