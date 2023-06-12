Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E2472B7D7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 07:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbjFLF6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 01:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjFLF6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 01:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B365EE68
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 22:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686549468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLlOUITgVVWHYQzzBeOY1TjWMEGny5oXw6fzlAhNcx4=;
        b=Ok/SSmQsQQ1Hd25F8gHxL9TbFwp/XmolyVKITG8wrmg8qHVso8TP7MkKW58riuMpcT0Yzx
        HK/HF1gxrO16wXlpwtV5OX6Py3Vwpb++3OgPVu+sSFVibgbLPsyGxfkkcnOiuAqS42J4dD
        1siLaxxzeOwh9aTAbfAJbozfOJUHufo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-r1cJ_m7sP3CD5w7pLU7QYw-1; Mon, 12 Jun 2023 01:57:45 -0400
X-MC-Unique: r1cJ_m7sP3CD5w7pLU7QYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D860800888;
        Mon, 12 Jun 2023 05:57:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B22201121314;
        Mon, 12 Jun 2023 05:57:41 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 1/3] media: atomisp: sh_css_internal: Unifying sh_css_sp_group to remove #ifdef ISP2401
Date:   Mon, 12 Jun 2023 13:57:16 +0800
Message-Id: <20230612055718.453554-2-hpa@redhat.com>
In-Reply-To: <20230612055718.453554-1-hpa@redhat.com>
References: <20230612055718.453554-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since some parts of the data scructure elements are determined in compile
time, the configuration data structure should be compiled for both two
ISP models. In order to set the configuration for both ISP model in
runtime, Thesh_css_sp_group is unified to one data structure for the
configuration to ensure the data structure can be used for both ISP2400
and 2401. Some of the unsed codes from ia_css_debug.c are also removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../runtime/debug/interface/ia_css_debug.h    |  6 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 76 +------------------
 .../media/atomisp/pci/sh_css_internal.h       | 35 +++------
 3 files changed, 13 insertions(+), 104 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index fff89e9b4b01..3a3d72c6eaaa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -141,12 +141,6 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
 __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
 					const char *fmt, ...);
 
-/*! @brief Dump sp thread's stack contents
- * SP thread's stack contents are set to 0xcafecafe. This function dumps the
- * stack to inspect if the stack's boundaries are compromised.
- * @return	None
- */
-void ia_css_debug_dump_sp_stack_info(void);
 
 /*! @brief Function to set the global dtrace verbosity level.
  * @param[in]	trace_level	Maximum level of the messages to be traced.
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index bb6204cb42c5..bb30146c5fe7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -105,7 +105,8 @@
  * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
  * future rework should fix this and remove the define MAX_THREAD_NUM
  */
-#define MAX_THREAD_NUM (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS)
+#define MAX_THREAD_NUM_2400 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2400)
+#define MAX_THREAD_NUM_2401 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2401)
 
 static struct pipe_graph_class {
 	bool do_init;
@@ -147,79 +148,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 	va_end(ap);
 }
 
-static void debug_dump_long_array_formatted(
-    const sp_ID_t sp_id,
-    hrt_address stack_sp_addr,
-    unsigned int stack_size)
-{
-	unsigned int i;
-	u32 val;
-	u32 addr = (uint32_t)stack_sp_addr;
-	u32 stack_size_words = CEIL_DIV(stack_size, sizeof(uint32_t));
-
-	/* When size is not multiple of four, last word is only relevant for
-	 * remaining bytes */
-	for (i = 0; i < stack_size_words; i++) {
-		val = sp_dmem_load_uint32(sp_id, (hrt_address)addr);
-		if ((i % 8) == 0)
-			ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
-
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "0x%08x ", val);
-		addr += sizeof(uint32_t);
-	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
-}
-
-static void debug_dump_sp_stack_info(
-    const sp_ID_t sp_id)
-{
-	const struct ia_css_fw_info *fw;
-	unsigned int HIVE_ADDR_sp_threads_stack;
-	unsigned int HIVE_ADDR_sp_threads_stack_size;
-	u32 stack_sizes[MAX_THREAD_NUM];
-	u32 stack_sp_addr[MAX_THREAD_NUM];
-	unsigned int i;
-
-	fw = &sh_css_sp_fw;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "sp_id(%u) stack info\n", sp_id);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-			    "from objects stack_addr_offset:0x%x stack_size_offset:0x%x\n",
-			    fw->info.sp.threads_stack,
-			    fw->info.sp.threads_stack_size);
-
-	HIVE_ADDR_sp_threads_stack = fw->info.sp.threads_stack;
-	HIVE_ADDR_sp_threads_stack_size = fw->info.sp.threads_stack_size;
-
-	if (fw->info.sp.threads_stack == 0 ||
-	    fw->info.sp.threads_stack_size == 0)
-		return;
-
-	(void)HIVE_ADDR_sp_threads_stack;
-	(void)HIVE_ADDR_sp_threads_stack_size;
-
-	sp_dmem_load(sp_id,
-		     (unsigned int)sp_address_of(sp_threads_stack),
-		     &stack_sp_addr, sizeof(stack_sp_addr));
-	sp_dmem_load(sp_id,
-		     (unsigned int)sp_address_of(sp_threads_stack_size),
-		     &stack_sizes, sizeof(stack_sizes));
-
-	for (i = 0 ; i < MAX_THREAD_NUM; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-				    "thread: %u stack_addr: 0x%08x stack_size: %u\n",
-				    i, stack_sp_addr[i], stack_sizes[i]);
-		debug_dump_long_array_formatted(sp_id, (hrt_address)stack_sp_addr[i],
-						stack_sizes[i]);
-	}
-}
-
-void ia_css_debug_dump_sp_stack_info(void)
-{
-	debug_dump_sp_stack_info(SP0_ID);
-}
-
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index d98f1323441e..2fa0b3e45fe0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -22,9 +22,7 @@
 #include <platform_support.h>
 #include <linux/stdarg.h>
 
-#if !defined(ISP2401)
 #include "input_formatter.h"
-#endif
 #include "input_system.h"
 
 #include "ia_css_types.h"
@@ -95,19 +93,20 @@
  *	 these threads can't be used as image pipe
  */
 
-#if !defined(ISP2401)
-#define SH_CSS_SP_INTERNAL_METADATA_THREAD	1
-#else
-#define SH_CSS_SP_INTERNAL_METADATA_THREAD	0
-#endif
+#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2400	1
+#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2401	0
 
 #define SH_CSS_SP_INTERNAL_SERVICE_THREAD		1
 
 #define SH_CSS_MAX_SP_THREADS		5
 
-#define SH_CSS_MAX_SP_INTERNAL_THREADS	(\
-	 SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
-	 SH_CSS_SP_INTERNAL_METADATA_THREAD)
+#define SH_CSS_MAX_SP_INTERNAL_THREADS_2400	(\
+	SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
+	 SH_CSS_SP_INTERNAL_METADATA_THREAD_2400)
+
+#define SH_CSS_MAX_SP_INTERNAL_THREADS_2401	(\
+	SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
+	 SH_CSS_SP_INTERNAL_METADATA_THREAD_2401)
 
 #define SH_CSS_MAX_PIPELINES	SH_CSS_MAX_SP_THREADS
 
@@ -357,14 +356,12 @@ struct sh_css_sp_debug_command {
 	u32 dma_sw_reg;
 };
 
-#if !defined(ISP2401)
 /* SP input formatter configuration.*/
 struct sh_css_sp_input_formatter_set {
 	u32				stream_format;
 	input_formatter_cfg_t	config_a;
 	input_formatter_cfg_t	config_b;
 };
-#endif
 
 #define IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT (3)
 
@@ -377,7 +374,7 @@ struct sh_css_sp_config {
 	     frames are locked when their EOF event is successfully sent to the
 	     host (true) or when they are passed to the preview/video pipe
 	     (false). */
-#if !defined(ISP2401)
+
 	struct {
 		u8					a_changed;
 		u8					b_changed;
@@ -385,15 +382,13 @@ struct sh_css_sp_config {
 		struct sh_css_sp_input_formatter_set
 			set[SH_CSS_MAX_IF_CONFIGS]; /* CSI-2 port is used as index. */
 	} input_formatter;
-#endif
-#if !defined(ISP2401)
+
 	sync_generator_cfg_t	sync_gen;
 	tpg_cfg_t		tpg;
 	prbs_cfg_t		prbs;
 	input_system_cfg_t	input_circuit;
 	u8			input_circuit_cfg_changed;
 	u32		mipi_sizes_for_check[N_CSI_PORTS][IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT];
-#endif
 	u8                 enable_isys_event_queue;
 	u8			disable_cont_vf;
 };
@@ -409,7 +404,6 @@ enum sh_css_stage_type {
 #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
 	((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
 
-#if defined(ISP2401)
 struct sh_css_sp_pipeline_terminal {
 	union {
 		/* Input System 2401 */
@@ -442,7 +436,6 @@ struct sh_css_sp_pipeline_io_status {
 	u32	running[N_INPUT_SYSTEM_CSI_PORT];	/** configured streams */
 };
 
-#endif
 enum sh_css_port_dir {
 	SH_CSS_PORT_INPUT  = 0,
 	SH_CSS_PORT_OUTPUT  = 1
@@ -641,10 +634,8 @@ struct sh_css_sp_stage {
 struct sh_css_sp_group {
 	struct sh_css_sp_config		config;
 	struct sh_css_sp_pipeline	pipe[SH_CSS_MAX_SP_THREADS];
-#if defined(ISP2401)
 	struct sh_css_sp_pipeline_io	pipe_io[SH_CSS_MAX_SP_THREADS];
 	struct sh_css_sp_pipeline_io_status	pipe_io_status;
-#endif
 	struct sh_css_sp_debug_command	debug;
 };
 
@@ -922,13 +913,11 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
 			    unsigned int width,
 			    unsigned int aligned);
 
-#if !defined(ISP2401)
 
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port,
 				const unsigned int idx);
 
-#endif
 
 ia_css_ptr
 sh_css_store_sp_group_to_ddr(void);
@@ -971,11 +960,9 @@ sh_css_continuous_is_enabled(uint8_t pipe_num);
 struct ia_css_pipe *
 find_pipe_by_num(uint32_t pipe_num);
 
-#ifdef ISP2401
 void
 ia_css_get_crop_offsets(
     struct ia_css_pipe *pipe,
     struct ia_css_frame_info *in_frame);
-#endif
 
 #endif /* _SH_CSS_INTERNAL_H_ */
-- 
2.40.1

