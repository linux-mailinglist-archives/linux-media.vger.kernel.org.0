Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF127552D4
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 17:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731769AbfFYPFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 11:05:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39383 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731509AbfFYPFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 11:05:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so3322569wma.4;
        Tue, 25 Jun 2019 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FpH+UM6aXLaq6l6BvTOtpCJcQETrARYlRqLy5mqFk0w=;
        b=jdva9Z4q7eWLnc5r0xbr4kr7LNATl4gyMF7/X5ZbWEvnwUtUZOLj0dusuJ6WuJYAfL
         H5kEc9mZagu2yV2ANVsIWchR4IgzaYcwXaAyXzT9i+wgPmScCXKO09T/S4a4+otYkVn4
         2Wy+Udl1Mmp4dd27W+oikX3oKQDklCDhUVIGicZHf6OPCAtX461OYWnTZl76+dyTeB/2
         rU/UbXBG2yRIGtQWGz0yyOtRVChXEsxuA+N+TCFxlFhyWem3xRUBa3/YC66Jgwvjc3XW
         6ZOHcnV69x8eSIt6HlIPXPUjIJyAKHr7fHwNBd8gDuq42WaJgaBIxnkRRPOztcSRkpVH
         5Atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FpH+UM6aXLaq6l6BvTOtpCJcQETrARYlRqLy5mqFk0w=;
        b=I1ksHPEAh1OMdlGi3L5LQzq4R/RWDjEwy11U+mMUfBX5YGgQfKD16KdMLgcUcqR6PA
         mqzrkm6gR6giYtHnycazcbAtlQsGCynfCzQSxvKiBKC43ft0qNA0MAmOsa+DNCerH35G
         IVpGBKKpimiuWsEhuWDB4P1jh9zJ7UzyNUIcYiGIizhUeRLrDaplnHyxOJZTth8glAN+
         BFbkDlJGg0JBC48j1dGmhyacm/vsJvL2rnzZ1NzX+Vu/G2CRSFB7xJDsyf7YFeTeoSYj
         eIXvI+lrvNZjQ0jzs27BWbSjwZPWDP1Y/qYv+M5T912KQR5YfmYjVBBvq5eGsyzW8oC/
         s9vQ==
X-Gm-Message-State: APjAAAVYfttabP0og/RnCygeLxFqTbM96suS2c4HcJhinRvN15zygKe0
        DX+ktLLIBAFZOsK2PxbuZ/I=
X-Google-Smtp-Source: APXvYqwI09M/ZkTF+OmLqhKtNPqYEK3k8Yn7vu8rdsEmceLD/G+qlGSucQyphSYCjbXXiVYgq4dHxA==
X-Received: by 2002:a1c:ef0c:: with SMTP id n12mr19114755wmh.132.1561475099649;
        Tue, 25 Jun 2019 08:04:59 -0700 (PDT)
Received: from cat.mip.uni-hannover.de (ip43.172.mip.uni-hannover.de. [130.75.172.43])
        by smtp.gmail.com with ESMTPSA id j18sm17640371wre.23.2019.06.25.08.04.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 08:04:59 -0700 (PDT)
From:   Felix Winkler <fxmw.tnt@gmail.com>
To:     sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-kernel@i4.cs.fau.de, Felix Winkler <fxmw.tnt@gmail.com>,
        Niklas Witzel <nik.witzel@horsepower-hannover.de>
Subject: [PATCH] media: ipu3-imgu: Fixed some coding style issues in ipu3-css.c
Date:   Tue, 25 Jun 2019 17:03:46 +0200
Message-Id: <1561475026-21806-1-git-send-email-fxmw.tnt@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improved readability by fixing some issues related to maximum line length.

Signed-off-by: Felix Winkler <fxmw.tnt@gmail.com>
Signed-off-by: Niklas Witzel <nik.witzel@horsepower-hannover.de>
---
 drivers/staging/media/ipu3/ipu3-css.c | 274 +++++++++++++++-------------------
 1 file changed, 121 insertions(+), 153 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 23cf5b2..a34105f 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -663,17 +663,16 @@ static void imgu_css_hw_cleanup(struct imgu_css *css)
 static void imgu_css_pipeline_cleanup(struct imgu_css *css, unsigned int pipe)
 {
 	struct imgu_device *imgu = dev_get_drvdata(css->dev);
+	struct imgu_css_pipe *css_pipe = &css->pipes[pipe];
 	unsigned int i;
 
-	imgu_css_pool_cleanup(imgu,
-			      &css->pipes[pipe].pool.parameter_set_info);
-	imgu_css_pool_cleanup(imgu, &css->pipes[pipe].pool.acc);
-	imgu_css_pool_cleanup(imgu, &css->pipes[pipe].pool.gdc);
-	imgu_css_pool_cleanup(imgu, &css->pipes[pipe].pool.obgrid);
+	imgu_css_pool_cleanup(imgu, &css_pipe->pool.parameter_set_info);
+	imgu_css_pool_cleanup(imgu, &css_pipe->pool.acc);
+	imgu_css_pool_cleanup(imgu, &css_pipe->pool.gdc);
+	imgu_css_pool_cleanup(imgu, &css_pipe->pool.obgrid);
 
 	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)
-		imgu_css_pool_cleanup(imgu,
-				      &css->pipes[pipe].pool.binary_params_p[i]);
+		imgu_css_pool_cleanup(imgu, &css_pipe->pool.binary_params_p[i]);
 }
 
 /*
@@ -699,6 +698,12 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 	unsigned int i, j;
 
 	struct imgu_css_pipe *css_pipe = &css->pipes[pipe];
+	struct imgu_css_queue *css_queue_in =
+			&css_pipe->queue[IPU3_CSS_QUEUE_IN];
+	struct imgu_css_queue *css_queue_out =
+			&css_pipe->queue[IPU3_CSS_QUEUE_OUT];
+	struct imgu_css_queue *css_queue_vf =
+			&css_pipe->queue[IPU3_CSS_QUEUE_VF];
 	const struct imgu_fw_info *bi =
 			&css->fwp->binary_header[css_pipe->bindex];
 	const unsigned int stripes = bi->info.isp.sp.iterator.num_stripes;
@@ -711,6 +716,9 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 	struct imgu_abi_isp_stage *isp_stage;
 	struct imgu_abi_sp_stage *sp_stage;
 	struct imgu_abi_sp_group *sp_group;
+	struct imgu_abi_frames_sp *frames_sp;
+	struct imgu_abi_frame_sp *frame_sp;
+	struct imgu_abi_frame_sp_info *frame_sp_info;
 
 	const unsigned int bds_width_pad =
 				ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width,
@@ -732,61 +740,44 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 	if (!cfg_iter)
 		goto bad_firmware;
 
-	cfg_iter->input_info.res.width =
-				css_pipe->queue[IPU3_CSS_QUEUE_IN].fmt.mpix.width;
-	cfg_iter->input_info.res.height =
-				css_pipe->queue[IPU3_CSS_QUEUE_IN].fmt.mpix.height;
-	cfg_iter->input_info.padded_width =
-				css_pipe->queue[IPU3_CSS_QUEUE_IN].width_pad;
-	cfg_iter->input_info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_IN].css_fmt->frame_format;
-	cfg_iter->input_info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_IN].css_fmt->bit_depth;
-	cfg_iter->input_info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_IN].css_fmt->bayer_order;
-	cfg_iter->input_info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-
-	cfg_iter->internal_info.res.width = css_pipe->rect[IPU3_CSS_RECT_BDS].width;
-	cfg_iter->internal_info.res.height =
-					css_pipe->rect[IPU3_CSS_RECT_BDS].height;
-	cfg_iter->internal_info.padded_width = bds_width_pad;
-	cfg_iter->internal_info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->frame_format;
-	cfg_iter->internal_info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bit_depth;
-	cfg_iter->internal_info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bayer_order;
-	cfg_iter->internal_info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-
-	cfg_iter->output_info.res.width =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.width;
-	cfg_iter->output_info.res.height =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.height;
-	cfg_iter->output_info.padded_width =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].width_pad;
-	cfg_iter->output_info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->frame_format;
-	cfg_iter->output_info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bit_depth;
-	cfg_iter->output_info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bayer_order;
-	cfg_iter->output_info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-
-	cfg_iter->vf_info.res.width =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.width;
-	cfg_iter->vf_info.res.height =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height;
-	cfg_iter->vf_info.padded_width =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].width_pad;
-	cfg_iter->vf_info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->frame_format;
-	cfg_iter->vf_info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->bit_depth;
-	cfg_iter->vf_info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->bayer_order;
-	cfg_iter->vf_info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-
-	cfg_iter->dvs_envelope.width = css_pipe->rect[IPU3_CSS_RECT_ENVELOPE].width;
+	frame_sp_info = &cfg_iter->input_info;
+	frame_sp_info->res.width	= css_queue_in->fmt.mpix.width;
+	frame_sp_info->res.height	= css_queue_in->fmt.mpix.height;
+	frame_sp_info->padded_width	= css_queue_in->width_pad;
+	frame_sp_info->format		= css_queue_in->css_fmt->frame_format;
+	frame_sp_info->raw_bit_depth	= css_queue_in->css_fmt->bit_depth;
+	frame_sp_info->raw_bayer_order	= css_queue_in->css_fmt->bayer_order;
+	frame_sp_info->raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+
+	frame_sp_info = &cfg_iter->internal_info;
+	frame_sp_info->res.width = css_pipe->rect[IPU3_CSS_RECT_BDS].width;
+	frame_sp_info->res.height = css_pipe->rect[IPU3_CSS_RECT_BDS].height;
+	frame_sp_info->padded_width	= bds_width_pad;
+	frame_sp_info->format		= css_queue_out->css_fmt->frame_format;
+	frame_sp_info->raw_bit_depth	= css_queue_out->css_fmt->bit_depth;
+	frame_sp_info->raw_bayer_order	= css_queue_out->css_fmt->bayer_order;
+	frame_sp_info->raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+
+	frame_sp_info = &cfg_iter->output_info;
+	frame_sp_info->res.width	= css_queue_out->fmt.mpix.width;
+	frame_sp_info->res.height	= css_queue_out->fmt.mpix.height;
+	frame_sp_info->padded_width	= css_queue_out->width_pad;
+	frame_sp_info->format		= css_queue_out->css_fmt->frame_format;
+	frame_sp_info->raw_bit_depth	= css_queue_out->css_fmt->bit_depth;
+	frame_sp_info->raw_bayer_order	= css_queue_out->css_fmt->bayer_order;
+	frame_sp_info->raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+
+	frame_sp_info = &cfg_iter->vf_info;
+	frame_sp_info->res.width	= css_queue_vf->fmt.mpix.width;
+	frame_sp_info->res.height	= css_queue_vf->fmt.mpix.height;
+	frame_sp_info->padded_width	= css_queue_vf->width_pad;
+	frame_sp_info->format		= css_queue_vf->css_fmt->frame_format;
+	frame_sp_info->raw_bit_depth	= css_queue_vf->css_fmt->bit_depth;
+	frame_sp_info->raw_bayer_order	= css_queue_vf->css_fmt->bayer_order;
+	frame_sp_info->raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+
+	cfg_iter->dvs_envelope.width =
+				css_pipe->rect[IPU3_CSS_RECT_ENVELOPE].width;
 	cfg_iter->dvs_envelope.height =
 				css_pipe->rect[IPU3_CSS_RECT_ENVELOPE].height;
 
@@ -917,12 +908,13 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 	sp_stage = css_pipe->xmem_sp_stage_ptrs[pipe][stage].vaddr;
 	memset(sp_stage, 0, sizeof(*sp_stage));
 
-	sp_stage->frames.in.buf_attr = buffer_sp_init;
+	frames_sp = &sp_stage->frames;
+	frames_sp->in.buf_attr = buffer_sp_init;
 	for (i = 0; i < IMGU_ABI_BINARY_MAX_OUTPUT_PORTS; i++)
-		sp_stage->frames.out[i].buf_attr = buffer_sp_init;
-	sp_stage->frames.out_vf.buf_attr = buffer_sp_init;
-	sp_stage->frames.s3a_buf = buffer_sp_init;
-	sp_stage->frames.dvs_buf = buffer_sp_init;
+		frames_sp->out[i].buf_attr = buffer_sp_init;
+	frames_sp->out_vf.buf_attr = buffer_sp_init;
+	frames_sp->s3a_buf = buffer_sp_init;
+	frames_sp->dvs_buf = buffer_sp_init;
 
 	sp_stage->stage_type = IMGU_ABI_STAGE_TYPE_ISP;
 	sp_stage->num = stage;
@@ -932,94 +924,70 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 
 	sp_stage->enable.vf_output = css_pipe->vf_output_en;
 
-	sp_stage->frames.effective_in_res.width =
+	frames_sp->effective_in_res.width =
 				css_pipe->rect[IPU3_CSS_RECT_EFFECTIVE].width;
-	sp_stage->frames.effective_in_res.height =
+	frames_sp->effective_in_res.height =
 				css_pipe->rect[IPU3_CSS_RECT_EFFECTIVE].height;
-	sp_stage->frames.in.info.res.width =
-				css_pipe->queue[IPU3_CSS_QUEUE_IN].fmt.mpix.width;
-	sp_stage->frames.in.info.res.height =
-				css_pipe->queue[IPU3_CSS_QUEUE_IN].fmt.mpix.height;
-	sp_stage->frames.in.info.padded_width =
-					css_pipe->queue[IPU3_CSS_QUEUE_IN].width_pad;
-	sp_stage->frames.in.info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_IN].css_fmt->frame_format;
-	sp_stage->frames.in.info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_IN].css_fmt->bit_depth;
-	sp_stage->frames.in.info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_IN].css_fmt->bayer_order;
-	sp_stage->frames.in.info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-	sp_stage->frames.in.buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_C_ID;
-	sp_stage->frames.in.buf_attr.buf_type =
-					IMGU_ABI_BUFFER_TYPE_INPUT_FRAME;
-
-	sp_stage->frames.out[0].info.res.width =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.width;
-	sp_stage->frames.out[0].info.res.height =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.height;
-	sp_stage->frames.out[0].info.padded_width =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].width_pad;
-	sp_stage->frames.out[0].info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->frame_format;
-	sp_stage->frames.out[0].info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bit_depth;
-	sp_stage->frames.out[0].info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bayer_order;
-	sp_stage->frames.out[0].info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-	sp_stage->frames.out[0].planes.nv.uv.offset =
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].width_pad *
-				css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.height;
-	sp_stage->frames.out[0].buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_D_ID;
-	sp_stage->frames.out[0].buf_attr.buf_type =
-					IMGU_ABI_BUFFER_TYPE_OUTPUT_FRAME;
-
-	sp_stage->frames.out[1].buf_attr.buf_src.queue_id =
-							IMGU_ABI_QUEUE_EVENT_ID;
-
-	sp_stage->frames.internal_frame_info.res.width =
-					css_pipe->rect[IPU3_CSS_RECT_BDS].width;
-	sp_stage->frames.internal_frame_info.res.height =
-					css_pipe->rect[IPU3_CSS_RECT_BDS].height;
-	sp_stage->frames.internal_frame_info.padded_width = bds_width_pad;
-
-	sp_stage->frames.internal_frame_info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->frame_format;
-	sp_stage->frames.internal_frame_info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bit_depth;
-	sp_stage->frames.internal_frame_info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->bayer_order;
-	sp_stage->frames.internal_frame_info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-
-	sp_stage->frames.out_vf.info.res.width =
-				css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.width;
-	sp_stage->frames.out_vf.info.res.height =
-				css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height;
-	sp_stage->frames.out_vf.info.padded_width =
-					css_pipe->queue[IPU3_CSS_QUEUE_VF].width_pad;
-	sp_stage->frames.out_vf.info.format =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->frame_format;
-	sp_stage->frames.out_vf.info.raw_bit_depth =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->bit_depth;
-	sp_stage->frames.out_vf.info.raw_bayer_order =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->bayer_order;
-	sp_stage->frames.out_vf.info.raw_type = IMGU_ABI_RAW_TYPE_BAYER;
-	sp_stage->frames.out_vf.planes.yuv.u.offset =
-				css_pipe->queue[IPU3_CSS_QUEUE_VF].width_pad *
-				css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height;
-	sp_stage->frames.out_vf.planes.yuv.v.offset =
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].width_pad *
-			css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height * 5 / 4;
-	sp_stage->frames.out_vf.buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_E_ID;
-	sp_stage->frames.out_vf.buf_attr.buf_type =
-					IMGU_ABI_BUFFER_TYPE_VF_OUTPUT_FRAME;
-
-	sp_stage->frames.s3a_buf.buf_src.queue_id = IMGU_ABI_QUEUE_F_ID;
-	sp_stage->frames.s3a_buf.buf_type = IMGU_ABI_BUFFER_TYPE_3A_STATISTICS;
-
-	sp_stage->frames.dvs_buf.buf_src.queue_id = IMGU_ABI_QUEUE_G_ID;
-	sp_stage->frames.dvs_buf.buf_type = IMGU_ABI_BUFFER_TYPE_DIS_STATISTICS;
-
-	sp_stage->dvs_envelope.width = css_pipe->rect[IPU3_CSS_RECT_ENVELOPE].width;
+
+	frame_sp = &frames_sp->in;
+	frame_sp->info.res.width	= css_queue_in->fmt.mpix.width;
+	frame_sp->info.res.height	= css_queue_in->fmt.mpix.height;
+	frame_sp->info.padded_width	= css_queue_in->width_pad;
+	frame_sp->info.format		= css_queue_in->css_fmt->frame_format;
+	frame_sp->info.raw_bit_depth	= css_queue_in->css_fmt->bit_depth;
+	frame_sp->info.raw_bayer_order	= css_queue_in->css_fmt->bayer_order;
+	frame_sp->info.raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+	frame_sp->buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_C_ID;
+	frame_sp->buf_attr.buf_type	= IMGU_ABI_BUFFER_TYPE_INPUT_FRAME;
+
+	frame_sp = &frames_sp->out[0];
+	frame_sp->info.res.width	= css_queue_out->fmt.mpix.width;
+	frame_sp->info.res.height	= css_queue_out->fmt.mpix.height;
+	frame_sp->info.padded_width	= css_queue_out->width_pad;
+	frame_sp->info.format		= css_queue_out->css_fmt->frame_format;
+	frame_sp->info.raw_bit_depth	= css_queue_out->css_fmt->bit_depth;
+	frame_sp->info.raw_bayer_order	= css_queue_out->css_fmt->bayer_order;
+	frame_sp->info.raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+	frame_sp->planes.nv.uv.offset	= css_queue_out->width_pad *
+					  css_queue_out->fmt.mpix.height;
+	frame_sp->buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_D_ID;
+	frame_sp->buf_attr.buf_type	= IMGU_ABI_BUFFER_TYPE_OUTPUT_FRAME;
+
+	frame_sp = &frames_sp->out[1];
+	frame_sp->buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_EVENT_ID;
+
+	frame_sp_info = &frames_sp->internal_frame_info;
+	frame_sp_info->res.width = css_pipe->rect[IPU3_CSS_RECT_BDS].width;
+	frame_sp_info->res.height = css_pipe->rect[IPU3_CSS_RECT_BDS].height;
+	frame_sp_info->padded_width	= bds_width_pad;
+	frame_sp_info->format		= css_queue_out->css_fmt->frame_format;
+	frame_sp_info->raw_bit_depth	= css_queue_out->css_fmt->bit_depth;
+	frame_sp_info->raw_bayer_order	= css_queue_out->css_fmt->bayer_order;
+	frame_sp_info->raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+
+	frame_sp = &frames_sp->out_vf;
+	frame_sp->info.res.width	= css_queue_vf->fmt.mpix.width;
+	frame_sp->info.res.height	= css_queue_vf->fmt.mpix.height;
+	frame_sp->info.padded_width	= css_queue_vf->width_pad;
+	frame_sp->info.format		= css_queue_vf->css_fmt->frame_format;
+	frame_sp->info.raw_bit_depth	= css_queue_vf->css_fmt->bit_depth;
+	frame_sp->info.raw_bayer_order	= css_queue_vf->css_fmt->bayer_order;
+	frame_sp->info.raw_type		= IMGU_ABI_RAW_TYPE_BAYER;
+	frame_sp->planes.yuv.u.offset	= css_queue_vf->width_pad *
+					  css_queue_vf->fmt.mpix.height;
+	frame_sp->planes.yuv.v.offset	= css_queue_vf->width_pad *
+					  css_queue_vf->fmt.mpix.height * 5 / 4;
+	frame_sp->buf_attr.buf_src.queue_id = IMGU_ABI_QUEUE_E_ID;
+	frame_sp->buf_attr.buf_type	= IMGU_ABI_BUFFER_TYPE_VF_OUTPUT_FRAME;
+
+	frames_sp->s3a_buf.buf_src.queue_id = IMGU_ABI_QUEUE_F_ID;
+	frames_sp->s3a_buf.buf_type	= IMGU_ABI_BUFFER_TYPE_3A_STATISTICS;
+
+	frames_sp->dvs_buf.buf_src.queue_id = IMGU_ABI_QUEUE_G_ID;
+	frames_sp->dvs_buf.buf_type	= IMGU_ABI_BUFFER_TYPE_DIS_STATISTICS;
+
+	sp_stage->dvs_envelope.width =
+				css_pipe->rect[IPU3_CSS_RECT_ENVELOPE].width;
 	sp_stage->dvs_envelope.height =
 				css_pipe->rect[IPU3_CSS_RECT_ENVELOPE].height;
 
-- 
2.7.4

