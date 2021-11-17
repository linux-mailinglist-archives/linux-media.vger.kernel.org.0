Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DAA454460
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235856AbhKQKAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:00:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:35320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235773AbhKQJ7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A94061AED;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=aqW3DEFFmnMrbkhHtZypjbbOnxmSbhilhrCMnhR5Zgo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XCyo/4LqiSN1Urij+sDx0ReQJcRRqTGA61q7xakpl76X8aL31YeBLLEmIcfxHKYFa
         WJM6hngE3ZPx0NW4i9cBu4Ic9cPGs+ghs6KSuplOXPjqLPa4weptUMlN5EIrYMbjpp
         tsJPi9xRxjnwOn8wUseO9gsa/JfPZjWZY+9SMEKZlIpndCqOu/g1fdr2lx0fDi/lXk
         kf+s0coWanR+PeLBBnsUZ9lgqixlXcwq2urYlPxaOaK75OhMGoY5M2GXynl0rdtfN/
         JYSANHDv9u93ovyOhl49BvfPk2RrdBB9d9kqwc9WO9murcnnSRbzwYBDW113sgLEP+
         w7C6mq7LGtUVg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUa-5w; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 04/12] media: atomisp: sh_css_mipi: cleanup the code
Date:   Wed, 17 Nov 2021 09:56:46 +0000
Message-Id: <b541d4c9923154be7ae0518d01ce994acbef3f9b.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the ISP2401 firmware we're using, the code differences
are not that much from ISP2400. Cleanup the code in order
to make it closer to Intel Aero driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/sh_css_mipi.c   | 159 +++++-------------
 .../staging/media/atomisp/pci/sh_css_mipi.h   |  15 --
 2 files changed, 38 insertions(+), 136 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index cfaa4719177c..0acf75497ae7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -33,47 +33,6 @@
 static u32
 ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
 
-/*
- * Check if a source port or TPG/PRBS ID is valid
- */
-static bool ia_css_mipi_is_source_port_valid(struct ia_css_pipe *pipe,
-	unsigned int *pport)
-{
-	bool ret = true;
-	unsigned int port = 0;
-	unsigned int max_ports = 0;
-
-	switch (pipe->stream->config.mode) {
-	case IA_CSS_INPUT_MODE_BUFFERED_SENSOR:
-		port = (unsigned int)pipe->stream->config.source.port.port;
-		max_ports = N_CSI_PORTS;
-		break;
-	case IA_CSS_INPUT_MODE_TPG:
-		port = (unsigned int)pipe->stream->config.source.tpg.id;
-		max_ports = N_CSS_TPG_IDS;
-		break;
-	case IA_CSS_INPUT_MODE_PRBS:
-		port = (unsigned int)pipe->stream->config.source.prbs.id;
-		max_ports = N_CSS_PRBS_IDS;
-		break;
-	default:
-		assert(false);
-		ret = false;
-		break;
-	}
-
-	if (ret) {
-		assert(port < max_ports);
-
-		if (port >= max_ports)
-			ret = false;
-	}
-
-	*pport = port;
-
-	return ret;
-}
-
 /* Assumptions:
  *	- A line is multiple of 4 bytes = 1 word.
  *	- Each frame has SOF and EOF (each 1 word).
@@ -227,6 +186,10 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	return err;
 }
 
+/*
+ * Check if a source port or TPG/PRBS ID is valid
+ */
+
 #if !defined(ISP2401)
 int
 ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
@@ -272,16 +235,20 @@ bool mipi_is_free(void)
 	return true;
 }
 
-int
-calculate_mipi_buff_size(
-    struct ia_css_stream_config *stream_cfg,
-    unsigned int *size_mem_words)
+#if defined(ISP2401)
+/*
+ * @brief Calculate the required MIPI buffer sizes.
+ * Based on the stream configuration, calculate the
+ * required MIPI buffer sizes (in DDR words).
+ *
+ * @param[in]   stream_cfg              Point to the target stream configuration
+ * @param[out]  size_mem_words  MIPI buffer size in DDR words.
+ *
+ * @return
+ */
+static int calculate_mipi_buff_size(struct ia_css_stream_config *stream_cfg,
+				    unsigned int *size_mem_words)
 {
-#if !defined(ISP2401)
-	int err = -EINVAL;
-	(void)stream_cfg;
-	(void)size_mem_words;
-#else
 	unsigned int width;
 	unsigned int height;
 	enum atomisp_input_format format;
@@ -373,26 +340,9 @@ calculate_mipi_buff_size(
 	*size_mem_words = mem_words_per_buff;
 
 	IA_CSS_LEAVE_ERR(err);
-#endif
 	return err;
 }
-
-static bool buffers_needed(struct ia_css_pipe *pipe)
-{
-	if (!IS_ISP2401) {
-		if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-			return true;
-		else
-			return false;
-	}
-
-	if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR ||
-	    pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG ||
-	    pipe->stream->config.mode == IA_CSS_INPUT_MODE_PRBS)
-		return true;
-
-	return false;
-}
+#endif
 
 int
 allocate_mipi_frames(struct ia_css_pipe *pipe,
@@ -422,45 +372,25 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	}
 
 #endif
-
-	if (!buffers_needed(pipe)) {
+	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for pipe mode.\n",
 				    pipe);
 		return 0; /* AM TODO: Check  */
 	}
 
-	if (!IS_ISP2401) {
-		port = (unsigned int)pipe->stream->config.source.port.port;
-	} else {
-		/* Returns true if port is valid. So, invert it */
-		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
-	}
-
-	assert(port < N_CSI_PORTS);
-
-	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
-	    (IS_ISP2401 && err)) {
+	port = (unsigned int)pipe->stream->config.source.port.port;
+	if (port >= N_CSI_PORTS) {
 		IA_CSS_ERROR("allocate_mipi_frames(%p) exit: port is not correct (port=%d).",
 			     pipe, port);
 		return -EINVAL;
 	}
 
 #ifdef ISP2401
-	err = calculate_mipi_buff_size(
-	    &pipe->stream->config,
-	    &my_css.mipi_frame_size[port]);
-#endif
-
-#if !defined(ISP2401)
-	if (ref_count_mipi_allocation[port] != 0) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
-				    pipe, port);
-		return 0;
-	}
-#else
-	/* 2401 system allows multiple streams to use same physical port. This is not
+	err = calculate_mipi_buff_size(&pipe->stream->config,
+				       &my_css.mipi_frame_size[port]);
+	/*
+	 * 2401 system allows multiple streams to use same physical port. This is not
 	 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
 	 * TODO AM: Once that is changed (removed) this code should be removed as well.
 	 * In that case only 2400 related code should remain.
@@ -472,6 +402,13 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 				    pipe, port);
 		return 0;
 	}
+#else
+	if (ref_count_mipi_allocation[port] != 0) {
+		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
+				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
+				    pipe, port);
+		return 0;
+	}
 #endif
 
 	ref_count_mipi_allocation[port]++;
@@ -552,23 +489,15 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 			return -EINVAL;
 		}
 
-		if (!buffers_needed(pipe)) {
+		if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 			IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong mode.",
 				     pipe);
 			return err;
 		}
 
-		if (!IS_ISP2401) {
-			port = (unsigned int)pipe->stream->config.source.port.port;
-		} else {
-			/* Returns true if port is valid. So, invert it */
-			err = !ia_css_mipi_is_source_port_valid(pipe, &port);
-		}
+		port = (unsigned int)pipe->stream->config.source.port.port;
 
-		assert(port < N_CSI_PORTS);
-
-		if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
-		    (IS_ISP2401 && err)) {
+		if (port >= N_CSI_PORTS) {
 			IA_CSS_ERROR("free_mipi_frames(%p, %d) exit: pipe port is not correct.",
 				     pipe, port);
 			return err;
@@ -647,11 +576,7 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 {
 	int err = -EINVAL;
 	unsigned int i;
-#ifndef ISP2401
 	unsigned int port;
-#else
-	unsigned int port = 0;
-#endif
 
 	IA_CSS_ENTER_PRIVATE("pipe=%p", pipe);
 
@@ -664,23 +589,15 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	/* multi stream video needs mipi buffers */
 	/* nothing to be done in other cases. */
-	if (!buffers_needed(pipe)) {
+	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		IA_CSS_LOG("nothing to be done for this mode");
 		return 0;
 		/* TODO: AM: maybe this should be returning an error. */
 	}
 
-	if (!IS_ISP2401) {
-		port = (unsigned int)pipe->stream->config.source.port.port;
-	} else {
-		/* Returns true if port is valid. So, invert it */
-		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
-	}
+	port = (unsigned int)pipe->stream->config.source.port.port;
 
-	assert(port < N_CSI_PORTS);
-
-	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
-	    (IS_ISP2401 && err)) {
+	if (port >= N_CSI_PORTS) {
 		IA_CSS_ERROR("send_mipi_frames(%p) exit: invalid port specified (port=%d).",
 			     pipe, port);
 		return err;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.h b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
index dffec2205620..e6c86d0ac483 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
@@ -34,19 +34,4 @@ free_mipi_frames(struct ia_css_pipe *pipe);
 int
 send_mipi_frames(struct ia_css_pipe *pipe);
 
-/**
- * @brief Calculate the required MIPI buffer sizes.
- * Based on the stream configuration, calculate the
- * required MIPI buffer sizes (in DDR words).
- *
- * @param[in]	stream_cfg		Point to the target stream configuration
- * @param[out]	size_mem_words	MIPI buffer size in DDR words.
- *
- * @return
- */
-int
-calculate_mipi_buff_size(
-    struct ia_css_stream_config *stream_cfg,
-    unsigned int *size_mem_words);
-
 #endif /* __SH_CSS_MIPI_H */
-- 
2.33.1

