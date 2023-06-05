Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68AA4722376
	for <lists+linux-media@lfdr.de>; Mon,  5 Jun 2023 12:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjFEKaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 06:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjFEKaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 06:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF95EA1
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685960963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jRUfEx2Pzx69tvMujYPlNCj6FLKMjsKqoC90U24VjjU=;
        b=SkVbstUjTw/2K0MEEsKeq9bMg8P4Z7f/8Mu12/tVjSPtx69+nRPEyE8fTbLVt/lgeIfzDj
        O2dCdSyFUUnDY4MEOdxfGxj2B6BVLYMnAlMRsCY0Rlj8EEzsMjbfGdI8GkinuykmJBAom4
        gRhXrkzWkSC/bkpNdW8XZt81HOazAwE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-koe1bNkBNlGtxPDACuzLqQ-1; Mon, 05 Jun 2023 06:29:20 -0400
X-MC-Unique: koe1bNkBNlGtxPDACuzLqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80A77185A78E;
        Mon,  5 Jun 2023 10:29:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 723329E75;
        Mon,  5 Jun 2023 10:29:16 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/3] media: atomisp: sh_css_internal: Unifying sh_css_sp_group to remove #ifdef ISP2401
Date:   Mon,  5 Jun 2023 18:29:01 +0800
Message-Id: <20230605102903.924283-2-hpa@redhat.com>
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

Since some parts of the data scructure elements are determined in compile
time, the configuration data structure should be compiled for both two
ISP models. In order to set the configuration for both ISP model in
runtime, Thesh_css_sp_group is unified to one data structure for the
configuration to ensure the data structure can be used for both ISP2400
and 2401.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/sh_css_internal.h       | 35 ++++++-------------
 1 file changed, 11 insertions(+), 24 deletions(-)

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

