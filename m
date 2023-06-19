Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3689734B57
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 07:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjFSF0N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 01:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFSF0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 01:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345A8124
        for <linux-media@vger.kernel.org>; Sun, 18 Jun 2023 22:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687152327;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7CgKn5gFis2madHubJxGGtXshQW5zMyOSEJxLqT9crU=;
        b=B/eqsC7UnXNh39IYUtValyfFMdCh4DuPYRhDgmdBJmPdHP5pIWD3Dds3N77t7zeQTyiSoq
        kLrAyzaBztlcTbEoQlss9XxtY+ICFB79nroNQDnN0RDt3i/Rgk4nnStM2EBvwG1Io0jt1T
        MQi7uArxMsMu4LwGpGaBYYN7p6GmpHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-IVvWDBcTOge1U9CYf2lUPw-1; Mon, 19 Jun 2023 01:25:22 -0400
X-MC-Unique: IVvWDBcTOge1U9CYf2lUPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EA6B185A792;
        Mon, 19 Jun 2023 05:25:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.119])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 77A30440CB;
        Mon, 19 Jun 2023 05:25:18 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 2/3] media: atomisp: Removed unused HAS_WATCHDOG_SP_THREAD_DEBUG debug
Date:   Mon, 19 Jun 2023 13:24:52 +0800
Message-Id: <20230619052453.48598-3-hpa@redhat.com>
In-Reply-To: <20230619052453.48598-1-hpa@redhat.com>
References: <20230619052453.48598-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the debug codes around #ifdef HAS_WATCHDOG_SP_THREAD_DEBUG are
no longer used, the debug implementation of this can be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../pci/hive_isp_css_common/debug_global.h    |  7 --
 .../media/atomisp/pci/ia_css_acc_types.h      |  6 +-
 .../runtime/debug/interface/ia_css_debug.h    |  6 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 92 -------------------
 4 files changed, 1 insertion(+), 110 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
index b6538beca18a..f2e17945fd45 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
@@ -35,13 +35,6 @@
 
 #define DEBUG_BUFFER_ISP_DMEM_ADDR       0x0
 
-/*
- * Enable HAS_WATCHDOG_SP_THREAD_DEBUG for additional SP thread and
- * pipe information on watchdog output
- * #undef HAS_WATCHDOG_SP_THREAD_DEBUG
- * #define HAS_WATCHDOG_SP_THREAD_DEBUG
- */
-
 /*
  * The linear buffer mode will accept data until the first
  * overflow and then stop accepting new data
diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index a20879aedef6..d6e52b4971d6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -331,11 +331,7 @@ struct ia_css_sp_info {
 	of DDR debug queue */
 	u32 perf_counter_input_system_error; /** input system perf
 	counter array */
-#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
-	u32 debug_wait; /** thread/pipe post mortem debug */
-	u32 debug_stage; /** thread/pipe post mortem debug */
-	u32 debug_stripe; /** thread/pipe post mortem debug */
-#endif
+
 	u32 threads_stack; /** sp thread's stack pointers */
 	u32 threads_stack_size; /** sp thread's stack sizes */
 	u32 curr_binary_id;        /** current binary id */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index 3a3d72c6eaaa..efa136294836 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -306,12 +306,6 @@ void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
  */
 void ia_css_debug_dump_perf_counters(void);
 
-#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
-void sh_css_dump_thread_wait_info(void);
-void sh_css_dump_pipe_stage_info(void);
-void sh_css_dump_pipe_stripe_info(void);
-#endif
-
 void ia_css_debug_dump_isp_binary(void);
 
 void sh_css_dump_sp_raw_copy_linecount(bool reduced);
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 3af855d844e5..cf66a40bd6a4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -101,12 +101,6 @@
 
 #define ENABLE_LINE_MAX_LENGTH (25)
 
-/*
- * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
- * future rework should fix this and remove the define MAX_THREAD_NUM
- */
-#define MAX_THREAD_NUM (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS)
-
 static struct pipe_graph_class {
 	bool do_init;
 	int height;
@@ -2074,12 +2068,6 @@ void ia_css_debug_dump_debug_info(const char *context)
 	ia_css_debug_dump_isp_gdc_fifo_state();
 	ia_css_debug_dump_sp_state();
 	ia_css_debug_dump_perf_counters();
-
-#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
-	sh_css_dump_thread_wait_info();
-	sh_css_dump_pipe_stage_info();
-	sh_css_dump_pipe_stripe_info();
-#endif
 	ia_css_debug_dump_dma_isp_fifo_state();
 	ia_css_debug_dump_dma_sp_fifo_state();
 	ia_css_debug_dump_dma_state();
@@ -2391,86 +2379,6 @@ static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
 	va_end(ap);
 }
 
-#ifdef HAS_WATCHDOG_SP_THREAD_DEBUG
-void sh_css_dump_thread_wait_info(void)
-{
-	const struct ia_css_fw_info *fw;
-	int i;
-	unsigned int HIVE_ADDR_sp_thread_wait;
-	s32 sp_thread_wait[MAX_THREAD_NUM];
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "SEM WAITS:\n");
-
-	fw = &sh_css_sp_fw;
-	HIVE_ADDR_sp_thread_wait =
-	    fw->info.sp.debug_wait;
-
-	(void)HIVE_ADDR_sp_thread_wait;
-
-	sp_dmem_load(SP0_ID,
-		     (unsigned int)sp_address_of(sp_thread_wait),
-		     &sp_thread_wait,
-		     sizeof(sp_thread_wait));
-	for (i = 0; i < MAX_THREAD_NUM; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-				    "\twait[%d] = 0x%X\n",
-				    i, sp_thread_wait[i]);
-	}
-}
-
-void sh_css_dump_pipe_stage_info(void)
-{
-	const struct ia_css_fw_info *fw;
-	int i;
-	unsigned int HIVE_ADDR_sp_pipe_stage;
-	s32 sp_pipe_stage[MAX_THREAD_NUM];
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "PIPE STAGE:\n");
-
-	fw = &sh_css_sp_fw;
-	HIVE_ADDR_sp_pipe_stage =
-	    fw->info.sp.debug_stage;
-
-	(void)HIVE_ADDR_sp_pipe_stage;
-
-	sp_dmem_load(SP0_ID,
-		     (unsigned int)sp_address_of(sp_pipe_stage),
-		     &sp_pipe_stage,
-		     sizeof(sp_pipe_stage));
-	for (i = 0; i < MAX_THREAD_NUM; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-				    "\tstage[%d] = %d\n",
-				    i, sp_pipe_stage[i]);
-	}
-}
-
-void sh_css_dump_pipe_stripe_info(void)
-{
-	const struct ia_css_fw_info *fw;
-	int i;
-	unsigned int HIVE_ADDR_sp_pipe_stripe;
-	s32 sp_pipe_stripe[MAX_THREAD_NUM];
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "PIPE STRIPE:\n");
-
-	fw = &sh_css_sp_fw;
-	HIVE_ADDR_sp_pipe_stripe =
-	    fw->info.sp.debug_stripe;
-
-	(void)HIVE_ADDR_sp_pipe_stripe;
-
-	sp_dmem_load(SP0_ID,
-		     (unsigned int)sp_address_of(sp_pipe_stripe),
-		     &sp_pipe_stripe,
-		     sizeof(sp_pipe_stripe));
-	for (i = 0; i < MAX_THREAD_NUM; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-				    "\tstripe[%d] = %d\n",
-				    i, sp_pipe_stripe[i]);
-	}
-}
-#endif
-
 static void
 ia_css_debug_pipe_graph_dump_frame(
     const struct ia_css_frame *frame,
-- 
2.40.1

