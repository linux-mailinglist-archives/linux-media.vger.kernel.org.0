Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CB225B0F8
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgIBQNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728327AbgIBQK6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:58 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4358321974;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=LlBArSVcBx9G5L28K5dHd7dtdCPvZewej8Keh2JV11E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fj3GG+YyUYZUAvmRRSzFXmBxQFhwKXloFpI2nvQpJX0wGSAHK/AbSsv7M/M2U1kqP
         sjEB+4Xg+/hzjBt1wtvXGgEguXdAuWT/OWINZapqwRgi06OmnyrE/p7/P5iNMKs+pB
         OLkvCQKo+HwSg/ANSY/MI/d7FykG+r+YcRVSHy9Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAw-DX; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 26/38] media: atomisp: cleanup ifdefs from ia_css_debug.c
Date:   Wed,  2 Sep 2020 18:10:29 +0200
Message-Id: <f418c7b19a4b307ff9005e236d751a23f372cd49.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are lots of code dependency there. Get rid of most of
them.

We can't remove everything, as there are some structs that
are conditionally built if ISP2401. So, keep ifdefs only
on such cases.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../runtime/debug/interface/ia_css_debug.h    |   6 -
 .../pci/runtime/debug/src/ia_css_debug.c      | 187 ++++--------------
 2 files changed, 42 insertions(+), 151 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index e04d2485ea75..0f9b7eb17647 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -158,12 +158,6 @@ void ia_css_debug_set_dtrace_level(
  */
 unsigned int ia_css_debug_get_dtrace_level(void);
 
-/*! @brief Dump input formatter state.
- * Dumps the input formatter state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_if_state(void);
-
 /*! @brief Dump isp hardware state.
  * Dumps the isp hardware state to tracing output.
  * @return	None
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 56d5d90634fa..ec598a1697b1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -52,9 +52,7 @@
 
 #include "fifo_monitor.h"
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
 #include "input_formatter.h"
-#endif
 #include "dma.h"
 #include "irq.h"
 #include "gp_device.h"
@@ -63,9 +61,7 @@
 #include "type_support.h"
 #include "math_support.h" /* CEIL_DIV */
 #include "input_system.h"	/* input_formatter_reg_load */
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #include "ia_css_tagger_common.h"
-#endif
 
 #include "sh_css_internal.h"
 #include "ia_css_isys.h"
@@ -105,17 +101,6 @@
 
 #define ENABLE_LINE_MAX_LENGTH (25)
 
-#ifdef ISP2401
-#define DBG_EXT_CMD_TRACE_PNTS_DUMP BIT(8)
-#define DBG_EXT_CMD_PUB_CFG_DUMP BIT(9)
-#define DBG_EXT_CMD_GAC_REG_DUMP BIT(10)
-#define DBG_EXT_CMD_GAC_ACB_REG_DUMP BIT(11)
-#define DBG_EXT_CMD_FIFO_DUMP BIT(12)
-#define DBG_EXT_CMD_QUEUE_DUMP BIT(13)
-#define DBG_EXT_CMD_DMA_DUMP BIT(14)
-#define DBG_EXT_CMD_MASK 0xAB0000CD
-
-#endif
 /*
  * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
  * future rework should fix this and remove the define MAX_THREAD_NUM
@@ -449,23 +434,21 @@ void ia_css_debug_dump_isp_state(void)
 	debug_print_isp_state(&state, "ISP");
 
 	if (state.is_stalling) {
-#if !defined(HAS_NO_INPUT_FORMATTER)
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "[0] if_prim_a_FIFO stalled", stall.fifo0);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "[1] if_prim_b_FIFO stalled", stall.fifo1);
-#endif
+		if (!IS_ISP2401) {
+			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
+					    "[0] if_prim_a_FIFO stalled", stall.fifo0);
+			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
+					    "[1] if_prim_b_FIFO stalled", stall.fifo1);
+		}
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[2] dma_FIFO stalled",
 				    stall.fifo2);
 
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[3] gdc0_FIFO stalled",
 				    stall.fifo3);
-#if !defined(IS_ISP_2500_SYSTEM)
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[4] gdc1_FIFO stalled",
 				    stall.fifo4);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[5] gpio_FIFO stalled",
 				    stall.fifo5);
-#endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[6] sp_FIFO stalled",
 				    stall.fifo6);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
@@ -505,24 +488,21 @@ void ia_css_debug_dump_sp_state(void)
 				    "str_to_mem_FIFO stalled", stall.fifo2);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dma_FIFO stalled",
 				    stall.fifo3);
-#if !defined(HAS_NO_INPUT_FORMATTER)
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "if_prim_a_FIFO stalled", stall.fifo4);
-#endif
+		if (!IS_ISP2401)
+			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
+					    "if_prim_a_FIFO stalled", stall.fifo4);
+
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "isp_FIFO stalled",
 				    stall.fifo5);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "gp_FIFO stalled",
 				    stall.fifo6);
-#if !defined(HAS_NO_INPUT_FORMATTER)
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "if_prim_b_FIFO stalled", stall.fifo7);
-#endif
+		if (!IS_ISP2401)
+			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
+					    "if_prim_b_FIFO stalled", stall.fifo7);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "gdc0_FIFO stalled",
 				    stall.fifo8);
-#if !defined(IS_ISP_2500_SYSTEM)
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "gdc1_FIFO stalled",
 				    stall.fifo9);
-#endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "irq FIFO stalled",
 				    stall.fifoa);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dmem stalled",
@@ -556,7 +536,6 @@ static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 	return;
 }
 
-#if !defined(HAS_NO_INPUT_FORMATTER) && defined(USE_INPUT_SYSTEM_VERSION_2)
 void ia_css_debug_dump_pif_a_isp_fifo_state(void)
 {
 	fifo_channel_state_t pif_to_isp, isp_to_pif;
@@ -593,13 +572,11 @@ void ia_css_debug_dump_str2mem_sp_fifo_state(void)
 	debug_print_fifo_channel_state(&sp_to_s2m, "SP to stream-to-memory");
 }
 
+#ifndef ISP2401
 static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 {
 	unsigned int val;
 
-#if defined(HAS_INPUT_FORMATTER_VERSION_1)
-	const char *st_reset = (state->reset ? "Active" : "Not active");
-#endif
 	const char *st_vsync_active_low =
 	    (state->vsync_active_low ? "low" : "high");
 	const char *st_hsync_active_low =
@@ -631,9 +608,6 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 
 	ia_css_debug_dtrace(2, "\tConfiguration:\n");
 
-#if defined(HAS_INPUT_FORMATTER_VERSION_1)
-	ia_css_debug_dtrace(2, "\t\t%-32s: %s\n", "Software reset", st_reset);
-#endif
 	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Start line", st_stline);
 	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Start column", st_stcol);
 	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Cropped height", st_crpht);
@@ -860,7 +834,6 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 			    state->vector_support);
 	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Fifo sensor data lost",
 			    state->sensor_data_lost);
-	return;
 }
 
 static void debug_print_if_bin_state(input_formatter_bin_state_t *state)
@@ -883,7 +856,7 @@ static void debug_print_if_bin_state(input_formatter_bin_state_t *state)
 			    state->en_status_update);
 }
 
-void ia_css_debug_dump_if_state(void)
+static void ia_css_debug_dump_if_state(void)
 {
 	input_formatter_state_t if_state;
 	input_formatter_bin_state_t if_bin_state;
@@ -1612,19 +1585,11 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 		"frame_buffer.sp.c"
 	};
 
-#if 1
 	/* Example SH_CSS_SP_DBG_NR_OF_TRACES==1 */
 	/* Adjust this to your trace case */
 	static char const *trace_name[SH_CSS_SP_DBG_NR_OF_TRACES] = {
 		"default"
 	};
-#else
-	/* Example SH_CSS_SP_DBG_NR_OF_TRACES==4 */
-	/* Adjust this to your trace case */
-	static char const *trace_name[SH_CSS_SP_DBG_NR_OF_TRACES] = {
-		"copy", "preview/video", "capture", "acceleration"
-	};
-#endif
 
 	/* Remember host_index_last because we only want to print new entries */
 	static int host_index_last[SH_CSS_SP_DBG_NR_OF_TRACES] = { 0 };
@@ -1696,7 +1661,7 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 }
 #endif
 
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 static void debug_print_rx_mipi_port_state(mipi_port_state_t *state)
 {
 	int i;
@@ -1893,17 +1858,15 @@ static void debug_print_rx_state(receiver_state_t *state)
 }
 #endif
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
 void ia_css_debug_dump_rx_state(void)
 {
-#if !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(ISP2401)
 	receiver_state_t state;
 
 	receiver_get_state(RX0_ID, &state);
 	debug_print_rx_state(&state);
 #endif
 }
-#endif
 
 void ia_css_debug_dump_sp_sw_debug_info(void)
 {
@@ -1918,7 +1881,7 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 	return;
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
+#if !defined(ISP2401)
 static void debug_print_isys_capture_unit_state(capture_unit_state_t *state)
 {
 	assert(state);
@@ -2155,31 +2118,20 @@ static void debug_print_isys_state(input_system_state_t *state)
 	}
 	/* end of control unit state */
 }
-
-void ia_css_debug_dump_isys_state(void)
-{
-	input_system_state_t state;
-
-	input_system_get_state(INPUT_SYSTEM0_ID, &state);
-	debug_print_isys_state(&state);
-
-	return;
-}
 #endif
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
+
 void ia_css_debug_dump_isys_state(void)
 {
-	/* Android compilation fails if made a local variable
-	stack size on android is limited to 2k and this structure
-	is around 3.5K, in place of static malloc can be done but
-	if this call is made too often it will lead to fragment memory
-	versus a fixed allocation */
 	static input_system_state_t state;
 
 	input_system_get_state(INPUT_SYSTEM0_ID, &state);
-	input_system_dump_state(INPUT_SYSTEM0_ID, &state);
-}
+
+#ifndef ISP2401
+		debug_print_isys_state(&state);
+#else
+		input_system_dump_state(INPUT_SYSTEM0_ID, &state);
 #endif
+}
 
 void ia_css_debug_dump_debug_info(const char *context)
 {
@@ -2187,10 +2139,10 @@ void ia_css_debug_dump_debug_info(const char *context)
 		context = "No Context provided";
 
 	ia_css_debug_dtrace(2, "CSS Debug Info dump [Context = %s]\n", context);
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
-	ia_css_debug_dump_rx_state();
-#endif
-#if !defined(HAS_NO_INPUT_FORMATTER) && defined(USE_INPUT_SYSTEM_VERSION_2)
+	if (!IS_ISP2401)
+		ia_css_debug_dump_rx_state();
+
+#ifndef ISP2401
 	ia_css_debug_dump_if_state();
 #endif
 	ia_css_debug_dump_isp_state();
@@ -2207,12 +2159,12 @@ void ia_css_debug_dump_debug_info(const char *context)
 	ia_css_debug_dump_dma_isp_fifo_state();
 	ia_css_debug_dump_dma_sp_fifo_state();
 	ia_css_debug_dump_dma_state();
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
-	ia_css_debug_dump_isys_state();
 
-	{
+	if (!IS_ISP2401) {
 		struct irq_controller_state state;
 
+		ia_css_debug_dump_isys_state();
+
 		irq_controller_get_state(IRQ2_ID, &state);
 
 		ia_css_debug_dtrace(2, "\t%-32s:\n",
@@ -2233,14 +2185,12 @@ void ia_css_debug_dump_debug_info(const char *context)
 		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
 				    "irq_level_not_pulse",
 				    state.irq_level_not_pulse);
+	} else {
+		ia_css_debug_dump_isys_state();
 	}
-#endif
-#if defined(USE_INPUT_SYSTEM_VERSION_2401)
-	ia_css_debug_dump_isys_state();
-#endif
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
+
 	ia_css_debug_tagger_state();
-#endif
+
 	return;
 }
 
@@ -2270,7 +2220,6 @@ void ia_css_debug_wake_up_sp(void)
 	sp_ctrl_setbit(SP0_ID, SP_SC_REG, SP_START_BIT);
 }
 
-#if !defined(IS_ISP_2500_SYSTEM)
 #define FIND_DMEM_PARAMS_TYPE(stream, kernel, type) \
 	(struct HRTCAT(HRTCAT(sh_css_isp_, type), _params) *) \
 	findf_dmem_params(stream, offsetof(struct ia_css_memory_offsets, dmem.kernel))
@@ -2302,16 +2251,11 @@ findf_dmem_params(struct ia_css_stream *stream, short idx)
 	}
 	return NULL;
 }
-#endif
 
 void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
 				  unsigned int enable)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "ISP PARAMETERS:\n");
-#if defined(IS_ISP_2500_SYSTEM)
-	(void)enable;
-	(void)stream;
-#else
 
 	assert(stream);
 	if ((enable & IA_CSS_DEBUG_DUMP_FPN)
@@ -2375,7 +2319,6 @@ void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
 	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
 		ia_css_ce_dump(FIND_DMEM_PARAMS(stream, ce), IA_CSS_DEBUG_VERBOSE);
 	}
-#endif
 }
 
 void sh_css_dump_sp_raw_copy_linecount(bool reduced)
@@ -2441,12 +2384,14 @@ void ia_css_debug_dump_isp_binary(void)
 
 void ia_css_debug_dump_perf_counters(void)
 {
-#if defined(USE_INPUT_SYSTEM_VERSION_2)
 	const struct ia_css_fw_info *fw;
 	int i;
 	unsigned int HIVE_ADDR_ia_css_isys_sp_error_cnt;
-	s32 ia_css_sp_input_system_error_cnt[N_MIPI_PORT_ID +
-							    1]; /* 3 Capture Units and 1 Acquire Unit. */
+	/* N_MIPI_PORT_ID + 1: 3 Capture Units and 1 Acquire Unit. */
+	s32 ia_css_sp_input_system_error_cnt[N_MIPI_PORT_ID + 1];
+
+	if (IS_ISP2401)
+		return;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "Input System Error Counters:\n");
 
@@ -2465,48 +2410,8 @@ void ia_css_debug_dump_perf_counters(void)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\tport[%d] = %d\n",
 				    i, ia_css_sp_input_system_error_cnt[i]);
 	}
-#endif
 }
 
-/*
-
-void sh_css_init_ddr_debug_queue(void)
-{
-	ia_css_ptr ddr_debug_queue_addr =
-			hmm_alloc(sizeof(debug_data_ddr_t), HMM_BO_PRIVATE, 0, NULL, 0);
-	const struct ia_css_fw_info *fw;
-	unsigned int HIVE_ADDR_debug_buffer_ddr_address;
-
-	fw = &sh_css_sp_fw;
-	HIVE_ADDR_debug_buffer_ddr_address =
-			fw->info.sp.debug_buffer_ddr_address;
-
-	(void)HIVE_ADDR_debug_buffer_ddr_address;
-
-	debug_buffer_ddr_init(ddr_debug_queue_addr);
-
-	sp_dmem_store_uint32(SP0_ID,
-		(unsigned int)sp_address_of(debug_buffer_ddr_address),
-		(uint32_t)(ddr_debug_queue_addr));
-}
-
-void sh_css_load_ddr_debug_queue(void)
-{
-	debug_synch_queue_ddr();
-}
-
-void ia_css_debug_dump_ddr_debug_queue(void)
-{
-	int i;
-	sh_css_load_ddr_debug_queue();
-	for (i = 0; i < DEBUG_BUF_SIZE; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-			"ddr_debug_queue[%d] = 0x%x\n",
-			i, debug_data_ptr->buf[i]);
-	}
-}
-*/
-
 /*
  * @brief Initialize the debug mode.
  * Refer to "ia_css_debug.h" for more details.
@@ -3252,22 +3157,16 @@ ia_css_debug_dump_stream_config(
 	byte 2-3: data
 */
 #if TRACE_ENABLE_SP0 || TRACE_ENABLE_SP1 || TRACE_ENABLE_ISP
-#ifndef ISP2401
-static void debug_dump_one_trace(TRACE_CORE_ID proc_id)
-#else
 static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
-#endif
 {
 #if defined(HAS_TRACER_V2)
 	u32 start_addr;
 	u32 start_addr_data;
 	u32 item_size;
-#ifndef ISP2401
 	u32 tmp;
-#else
 	u8 tid_val;
 	enum TRACE_DUMP_FORMAT dump_format;
-#endif
+
 	int i, j, max_trace_points, point_num, limit = -1;
 	/* using a static buffer here as the driver has issues allocating memory */
 	static u32 trace_read_buf[TRACE_BUFF_SIZE] = {0};
@@ -3471,7 +3370,6 @@ void ia_css_debug_dump_trace(void)
 #endif
 }
 
-#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 /* Tagger state dump function. The tagger is only available when the CSS
  * contains an input system (2400 or 2401). */
 void ia_css_debug_tagger_state(void)
@@ -3497,7 +3395,6 @@ void ia_css_debug_tagger_state(void)
 				    i, tbuf_frames[i].exp_id, tbuf_frames[i].mark, tbuf_frames[i].lock);
 	}
 }
-#endif /* defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401) */
 
 /* ISP2401 */
 void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps)
-- 
2.26.2

