Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B656B35FF09
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhDOAtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:32 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59589 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhDOAtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:31 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E881E20009;
        Thu, 15 Apr 2021 00:49:06 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [1/6] Fix sh_css.c brace coding style issues
Date:   Wed, 14 Apr 2021 20:50:58 -0400
Message-Id: <20210415005106.530914-2-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
References: <20210415005106.530914-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix brace coding style issues.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 79 ++++++++++------------
 1 file changed, 35 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 27dd8ce8ba0a..10b70dfc0528 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -453,15 +453,15 @@ static enum ia_css_frame_format yuv422_copy_formats[] = {
  * by the copy binary given the stream format.
  * */
 static int
-verify_copy_out_frame_format(struct ia_css_pipe *pipe) {
+verify_copy_out_frame_format(struct ia_css_pipe *pipe)
+{
 	enum ia_css_frame_format out_fmt = pipe->output_info[0].format;
 	unsigned int i, found = 0;
 
 	assert(pipe);
 	assert(pipe->stream);
 
-	switch (pipe->stream->config.input_config.format)
-	{
+	switch (pipe->stream->config.input_config.format) {
 	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:
 	case ATOMISP_INPUT_FORMAT_YUV420_8:
 		for (i = 0; i < ARRAY_SIZE(yuv420_copy_formats) && !found; i++)
@@ -528,7 +528,8 @@ ia_css_stream_input_format_bits_per_pixel(struct ia_css_stream *stream)
 
 #if !defined(ISP2401)
 static int
-sh_css_config_input_network(struct ia_css_stream *stream) {
+sh_css_config_input_network(struct ia_css_stream *stream)
+{
 	unsigned int fmt_type;
 	struct ia_css_pipe *pipe = stream->last_pipe;
 	struct ia_css_binary *binary = NULL;
@@ -554,8 +555,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 					stream->config.mode);
 
 	if ((binary && (binary->online || stream->config.continuous)) ||
-	    pipe->config.mode == IA_CSS_PIPE_MODE_COPY)
-	{
+	    pipe->config.mode == IA_CSS_PIPE_MODE_COPY) {
 		err = ia_css_ifmtr_configure(&stream->config,
 					     binary);
 		if (err)
@@ -563,8 +563,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 	}
 
 	if (stream->config.mode == IA_CSS_INPUT_MODE_TPG ||
-	    stream->config.mode == IA_CSS_INPUT_MODE_PRBS)
-	{
+	    stream->config.mode == IA_CSS_INPUT_MODE_PRBS) {
 		unsigned int hblank_cycles = 100,
 		vblank_lines = 6,
 		width,
@@ -723,35 +722,32 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
 	switch (stream_cfg->mode) {
 	case IA_CSS_INPUT_MODE_TPG:
 
-		if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID0) {
+		if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID0)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT0_ID;
-		} else if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID1) {
+		else if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID1)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT1_ID;
-		} else if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID2) {
+		else if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID2)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT2_ID;
-		}
 
 		break;
 	case IA_CSS_INPUT_MODE_PRBS:
 
-		if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID0) {
+		if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID0)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT0_ID;
-		} else if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID1) {
+		else if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID1)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT1_ID;
-		} else if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID2) {
+		else if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID2)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT2_ID;
-		}
 
 		break;
 	case IA_CSS_INPUT_MODE_BUFFERED_SENSOR:
 
-		if (stream_cfg->source.port.port == MIPI_PORT0_ID) {
+		if (stream_cfg->source.port.port == MIPI_PORT0_ID)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_CSI_PORT0_ID;
-		} else if (stream_cfg->source.port.port == MIPI_PORT1_ID) {
+		else if (stream_cfg->source.port.port == MIPI_PORT1_ID)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_CSI_PORT1_ID;
-		} else if (stream_cfg->source.port.port == MIPI_PORT2_ID) {
+		else if (stream_cfg->source.port.port == MIPI_PORT2_ID)
 			isys_stream_descr->input_port_id = INPUT_SYSTEM_CSI_PORT2_ID;
-		}
 
 		break;
 	default:
@@ -804,15 +800,14 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 	rc = true;
 	switch (stream_cfg->mode) {
 	case IA_CSS_INPUT_MODE_TPG:
-		if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_RAMP) {
+		if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_RAMP)
 			isys_stream_descr->tpg_port_attr.mode = PIXELGEN_TPG_MODE_RAMP;
-		} else if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_CHECKERBOARD) {
+		else if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_CHECKERBOARD)
 			isys_stream_descr->tpg_port_attr.mode = PIXELGEN_TPG_MODE_CHBO;
-		} else if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_MONO) {
+		else if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_MONO)
 			isys_stream_descr->tpg_port_attr.mode = PIXELGEN_TPG_MODE_MONO;
-		} else {
+		else
 			rc = false;
-		}
 
 		/*
 		 * TODO
@@ -951,12 +946,12 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
 	     stream_cfg->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) &&
 	    stream_cfg->source.port.compression.type != IA_CSS_CSI2_COMPRESSION_TYPE_NONE) {
 		if (stream_cfg->source.port.compression.uncompressed_bits_per_pixel ==
-		    UNCOMPRESSED_BITS_PER_PIXEL_10) {
+		    UNCOMPRESSED_BITS_PER_PIXEL_10)
 			fmt_type = ATOMISP_INPUT_FORMAT_RAW_10;
-		} else if (stream_cfg->source.port.compression.uncompressed_bits_per_pixel ==
-			   UNCOMPRESSED_BITS_PER_PIXEL_12) {
+		else if (stream_cfg->source.port.compression.uncompressed_bits_per_pixel ==
+			   UNCOMPRESSED_BITS_PER_PIXEL_12)
 			fmt_type = ATOMISP_INPUT_FORMAT_RAW_12;
-		} else
+		else
 			return false;
 	}
 
@@ -1045,7 +1040,8 @@ static bool sh_css_translate_binary_info_to_input_system_output_port_attr(
 }
 
 static int
-sh_css_config_input_network(struct ia_css_stream *stream) {
+sh_css_config_input_network(struct ia_css_stream *stream)
+{
 	bool					rc;
 	ia_css_isys_descr_t			isys_stream_descr;
 	unsigned int				sp_thread_id;
@@ -1060,19 +1056,16 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_config_input_network() enter 0x%p:\n", stream);
 
-	if (stream->config.continuous)
-	{
-		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
+	if (stream->config.continuous) {
+		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE)
 			pipe = stream->last_pipe;
-		} else if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_YUVPP) {
+		else if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_YUVPP)
 			pipe = stream->last_pipe;
-		} else if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_PREVIEW) {
+		else if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_PREVIEW)
 			pipe = stream->last_pipe->pipe_settings.preview.copy_pipe;
-		} else if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_VIDEO) {
+		else if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_VIDEO)
 			pipe = stream->last_pipe->pipe_settings.video.copy_pipe;
-		}
-	} else
-	{
+	} else {
 		pipe = stream->last_pipe;
 		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
 			/*
@@ -1095,8 +1088,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 		if (pipe->pipeline.stages->binary)
 			binary = pipe->pipeline.stages->binary;
 
-	if (binary)
-	{
+	if (binary) {
 		/* this was being done in ifmtr in 2400.
 		 * online and cont bypass the init_in_frameinfo_memory_defaults
 		 * so need to do it here
@@ -1210,11 +1202,10 @@ static inline struct ia_css_pipe *stream_get_target_pipe(
 	struct ia_css_pipe *target_pipe;
 
 	/* get the pipe that consumes the stream */
-	if (stream->config.continuous) {
+	if (stream->config.continuous)
 		target_pipe = stream_get_copy_pipe(stream);
-	} else {
+	else
 		target_pipe = stream_get_last_pipe(stream);
-	}
 
 	return target_pipe;
 }
-- 
2.31.1

