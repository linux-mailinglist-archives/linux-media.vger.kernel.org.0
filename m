Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D879722377
	for <lists+linux-media@lfdr.de>; Mon,  5 Jun 2023 12:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjFEKaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 06:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjFEKaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 06:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B747EA
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 03:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685960973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EW+r5mVcnYlpwLyOeIK2ZT35iP27Rc6dTFWoa1at4Iw=;
        b=i5Dia12IXEBre51/JioIttwebuxjtGWjmOmrwZZKnLplLRcWIkVf/iZj0nWkQB1PbYPaEW
        +z+WJedlUEXp6SP4X+2Ik2bjKvdGAxpbYc344d2j73CFv/kvPyXVKWzQzv/FPaa+Llc/4A
        aQfvS8ljtaJtjeJuV/zwNYyxiqX/BEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-BDdrgvBkOXCQzLGoGSEA6g-1; Mon, 05 Jun 2023 06:29:30 -0400
X-MC-Unique: BDdrgvBkOXCQzLGoGSEA6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00DCA85A5BB;
        Mon,  5 Jun 2023 10:29:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E79519E72;
        Mon,  5 Jun 2023 10:29:26 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 3/3] media: atomisp: ia_css_debug: remove unused codes
Date:   Mon,  5 Jun 2023 18:29:03 +0800
Message-Id: <20230605102903.924283-4-hpa@redhat.com>
In-Reply-To: <20230605102903.924283-1-hpa@redhat.com>
References: <20230605102903.924283-1-hpa@redhat.com>
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

This portion of the codes was not referenced so it can be completely
removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../runtime/debug/interface/ia_css_debug.h    |  6 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 76 +------------------
 2 files changed, 2 insertions(+), 80 deletions(-)

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
-- 
2.40.1

