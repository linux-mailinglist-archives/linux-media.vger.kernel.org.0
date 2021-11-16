Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374094530B3
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbhKPLcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:35198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235043AbhKPLc3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9687B61BF5;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=8aIzejT9R8r2TfeRROVk+42WeMa9j/dB6aFaZiU+h/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lfpWdiJOo1jgtPr/GkkikkLKFHKM/6x9k0s36QcXEh4MSP2filaFjrfnS50roQZcq
         UDDRCwArrVKtsB5Gle4aZjljc7hJgcdPM81YFn0BfvMIHz1jkXe/uafuYFXyIuTuuq
         VC/VXPVZAfs6L849Q8I9CNnAjsqN9M4LZ9E3Sg/HsP92SX7apP2J1KyeGor0++HzrE
         rGqmSiFSXAweJhTiD0u5+TCUC38Ok9qSoluV2jos3lExCzK8DoXPGcR6u4l0vqsDBD
         jovb+/RJ0KYt9aneI/5rp40ZYfz2QhErbgFD7JH6ZS4Hir+/erce/sJoYs8YAY0AfV
         Y3aZMEmgX/YHQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfm-JJ; Tue, 16 Nov 2021 11:29:05 +0000
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
Subject: [PATCH 14/23] media: atomisp: drop crop code at stream create function
Date:   Tue, 16 Nov 2021 11:28:55 +0000
Message-Id: <c50051630e36643d2e0a9f424e4191af294b745c.1637061474.git.mchehab+huawei@kernel.org>
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

The firmware choosen for ISP2401 doesn't support it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 164 ---------------------
 1 file changed, 164 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index d1074c3d56c6..6f1dca0788b4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -400,17 +400,7 @@ static unsigned int get_crop_columns_for_bayer_order(const struct
 	ia_css_stream_config *config);
 static void get_pipe_extra_pixel(struct ia_css_pipe *pipe,
 				 unsigned int *extra_row, unsigned int *extra_column);
-static int
-aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
-		       struct ia_css_pipe *pipes[],
-		       bool *do_crop_status);
 
-static bool
-aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe);
-
-static int
-aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
-		  struct ia_css_resolution *effective_res);
 #endif
 
 static void
@@ -8999,9 +8989,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	int err = -EINVAL;
 	struct ia_css_metadata_info md_info;
 	struct ia_css_resolution effective_res;
-#ifdef ISP2401
-	bool aspect_ratio_crop_enabled = false;
-#endif
 
 	IA_CSS_ENTER("num_pipes=%d", num_pipes);
 	ia_css_debug_dump_stream_config(stream_config, num_pipes);
@@ -9178,14 +9165,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		IA_CSS_LOG("mode sensor/default");
 	}
 
-#ifdef ISP2401
-	err = aspect_ratio_crop_init(curr_stream, pipes,
-				     &aspect_ratio_crop_enabled);
-	if (err) {
-		IA_CSS_LEAVE_ERR(err);
-		goto ERR;
-	}
-#endif
 	for (i = 0; i < num_pipes; i++) {
 		struct ia_css_resolution effective_res;
 
@@ -9198,22 +9177,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		if (effective_res.height == 0 || effective_res.width == 0) {
 			effective_res = curr_pipe->stream->config.input_config.effective_res;
 
-#if defined(ISP2401)
-			/* The aspect ratio cropping is currently only
-			    * supported on the new input system. */
-			if (aspect_ratio_crop_check(aspect_ratio_crop_enabled, curr_pipe)) {
-				struct ia_css_resolution crop_res;
-
-				err = aspect_ratio_crop(curr_pipe, &crop_res);
-				if (!err) {
-					effective_res = crop_res;
-				} else {
-					/* in case of error fallback to default
-					    * effective resolution from driver. */
-					IA_CSS_LOG("aspect_ratio_crop() failed with err(%d)", err);
-				}
-			}
-#endif
 			curr_pipe->config.input_effective_res = effective_res;
 		}
 		IA_CSS_LOG("effective_res=%dx%d",
@@ -10470,133 +10433,6 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 	return err;
 }
 
-#ifdef ISP2401
-static int
-aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
-		       struct ia_css_pipe *pipes[],
-		       bool *do_crop_status)
-{
-	int err = 0;
-	int i;
-	struct ia_css_pipe *curr_pipe;
-	u32 pipe_mask = 0;
-
-	if ((!curr_stream) ||
-	    (curr_stream->num_pipes == 0) ||
-	    (!pipes) ||
-	    (!do_crop_status)) {
-		err = -EINVAL;
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
-
-	for (i = 0; i < curr_stream->num_pipes; i++) {
-		curr_pipe = pipes[i];
-		pipe_mask |= (1 << curr_pipe->config.mode);
-	}
-
-	*do_crop_status =
-	(((pipe_mask & (1 << IA_CSS_PIPE_MODE_PREVIEW)) ||
-	    (pipe_mask & (1 << IA_CSS_PIPE_MODE_VIDEO))) &&
-	    (pipe_mask & (1 << IA_CSS_PIPE_MODE_CAPTURE)) &&
-	    curr_stream->config.continuous);
-	return 0;
-}
-
-static bool
-aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe)
-{
-	bool status = false;
-
-	if ((curr_pipe) && enabled) {
-		if ((curr_pipe->config.mode == IA_CSS_PIPE_MODE_PREVIEW) ||
-		    (curr_pipe->config.mode == IA_CSS_PIPE_MODE_VIDEO) ||
-		    (curr_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE))
-			status = true;
-	}
-
-	return status;
-}
-
-static int
-aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
-		  struct ia_css_resolution *effective_res)
-{
-	int err = 0;
-	struct ia_css_resolution crop_res;
-	struct ia_css_resolution *in_res = NULL;
-	struct ia_css_resolution *out_res = NULL;
-	bool use_bds_output_info = false;
-	bool use_vf_pp_in_res = false;
-	bool use_capt_pp_in_res = false;
-
-	if ((!curr_pipe) ||
-	    (!effective_res)) {
-		err = -EINVAL;
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
-
-	if ((curr_pipe->config.mode != IA_CSS_PIPE_MODE_PREVIEW) &&
-	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_VIDEO) &&
-	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_CAPTURE)) {
-		err = -EINVAL;
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
-
-	use_bds_output_info =
-	((curr_pipe->bds_output_info.res.width != 0) &&
-	    (curr_pipe->bds_output_info.res.height != 0));
-
-	use_vf_pp_in_res =
-	((curr_pipe->config.vf_pp_in_res.width != 0) &&
-	    (curr_pipe->config.vf_pp_in_res.height != 0));
-
-	use_capt_pp_in_res =
-	((curr_pipe->config.capt_pp_in_res.width != 0) &&
-	    (curr_pipe->config.capt_pp_in_res.height != 0));
-
-	in_res = &curr_pipe->stream->config.input_config.effective_res;
-	out_res = &curr_pipe->output_info[0].res;
-
-	switch (curr_pipe->config.mode) {
-	case IA_CSS_PIPE_MODE_PREVIEW:
-		if (use_bds_output_info)
-			out_res = &curr_pipe->bds_output_info.res;
-		else if (use_vf_pp_in_res)
-			out_res = &curr_pipe->config.vf_pp_in_res;
-		break;
-	case IA_CSS_PIPE_MODE_VIDEO:
-		if (use_bds_output_info)
-			out_res = &curr_pipe->bds_output_info.res;
-		break;
-	case IA_CSS_PIPE_MODE_CAPTURE:
-		if (use_capt_pp_in_res)
-			out_res = &curr_pipe->config.capt_pp_in_res;
-		break;
-	case IA_CSS_PIPE_MODE_ACC:
-	case IA_CSS_PIPE_MODE_COPY:
-	case IA_CSS_PIPE_MODE_YUVPP:
-	default:
-		IA_CSS_ERROR("aspect ratio cropping invalid args: mode[%d]\n",
-			     curr_pipe->config.mode);
-		assert(0);
-		break;
-	}
-
-	err = ia_css_frame_find_crop_resolution(in_res, out_res, &crop_res);
-	if (!err)
-		*effective_res = crop_res;
-	else
-		/* in case of error fallback to default
-		    * effective resolution from driver. */
-		IA_CSS_LOG("ia_css_frame_find_crop_resolution() failed with err(%d)", err);
-
-	return err;
-}
-#endif
-
 static void
 sh_css_hmm_buffer_record_init(void)
 {
-- 
2.33.1

