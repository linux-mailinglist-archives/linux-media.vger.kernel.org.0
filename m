Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81B276C9FD
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbjHBJ6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234204AbjHBJ6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0703B2101
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970237;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fLJ4hA2Aat2rQAsWQHeOUvFWufmK3+WVRD6IXgYHqYo=;
        b=VXMfotUxRCG5Tv3YCIcu624KebktrbKYetkchfrPBLIiQBwd7qnGrXqjB9PJludWbH/kjp
        C/BTh2iOGvlDCW+kG4b4ryxX3V4FjsuY/b1cvCPw9eTcxoitPv6xqsQK5KkIL/ZZl20KkS
        NkuUwILnUA2zGONG1+EQktx1kIz5n+8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-RLfzqmJ9OL67NZuUwJYB0w-1; Wed, 02 Aug 2023 05:57:14 -0400
X-MC-Unique: RLfzqmJ9OL67NZuUwJYB0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD77729AA3B0;
        Wed,  2 Aug 2023 09:57:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 020A3401061;
        Wed,  2 Aug 2023 09:57:10 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 07/12] media: atomisp: sh_css_sp: Remove #ifdef ISP2401 to make driver generic
Date:   Wed,  2 Aug 2023 17:56:01 +0800
Message-ID: <20230802095606.1298152-8-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #ifdef ISP2401 to make the driver generic. The uncessary codes
were removed and the types of the ISP is determines in runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 60 +++++++------------
 drivers/staging/media/atomisp/pci/sh_css_sp.h |  2 -
 2 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 4ef1c9e61ea8..b225e33592f8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -17,9 +17,7 @@
 
 #include "sh_css_sp.h"
 
-#if !defined(ISP2401)
 #include "input_formatter.h"
-#endif
 
 #include "dma.h"	/* N_DMA_CHANNEL_ID */
 
@@ -227,11 +225,8 @@ sh_css_sp_start_binary_copy(unsigned int pipe_num,
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe->pipe_id, pipe->inout_port_config);
 
-#if !defined(ISP2401)
-	sh_css_sp_group.config.input_formatter.isp_2ppc = (uint8_t)two_ppc;
-#else
-	(void)two_ppc;
-#endif
+	if (!IS_ISP2401)
+		sh_css_sp_group.config.input_formatter.isp_2ppc = (uint8_t)two_ppc;
 
 	sh_css_sp_stage.num = stage_num;
 	sh_css_sp_stage.stage_type = SH_CSS_SP_STAGE_TYPE;
@@ -305,11 +300,8 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe->pipe_id, pipe->inout_port_config);
 
-#if !defined(ISP2401)
-	sh_css_sp_group.config.input_formatter.isp_2ppc = (uint8_t)two_ppc;
-#else
-	(void)two_ppc;
-#endif
+	if (!IS_ISP2401)
+		sh_css_sp_group.config.input_formatter.isp_2ppc = (uint8_t)two_ppc;
 
 	sh_css_sp_stage.num = stage_num;
 	sh_css_sp_stage.xmem_bin_addr = 0x0;
@@ -654,7 +646,6 @@ void sh_css_sp_set_if_configs(
 	return;
 }
 
-#if !defined(ISP2401)
 void
 sh_css_sp_program_input_circuit(int fmt_type,
 				int ch_id,
@@ -671,9 +662,7 @@ sh_css_sp_program_input_circuit(int fmt_type,
 	sh_css_sp_group.config.input_circuit_cfg_changed = true;
 	sh_css_sp_stage.program_input_circuit = true;
 }
-#endif
 
-#if !defined(ISP2401)
 void
 sh_css_sp_configure_sync_gen(int width, int height,
 			     int hblank_cycles,
@@ -704,7 +693,6 @@ sh_css_sp_configure_prbs(int seed)
 {
 	sh_css_sp_group.config.prbs.seed = seed;
 }
-#endif
 
 void
 sh_css_sp_configure_enable_raw_pool_locking(bool lock_all)
@@ -754,22 +742,18 @@ sh_css_sp_init_group(bool two_ppc,
 		     bool no_isp_sync,
 		     uint8_t if_config_index)
 {
-#if !defined(ISP2401)
-	sh_css_sp_group.config.input_formatter.isp_2ppc = two_ppc;
-#else
-	(void)two_ppc;
-#endif
+	if (!IS_ISP2401)
+		sh_css_sp_group.config.input_formatter.isp_2ppc = two_ppc;
 
 	sh_css_sp_group.config.no_isp_sync = (uint8_t)no_isp_sync;
 	/* decide whether the frame is processed online or offline */
 	if (if_config_index == SH_CSS_IF_CONFIG_NOT_NEEDED) return;
-#if !defined(ISP2401)
-	assert(if_config_index < SH_CSS_MAX_IF_CONFIGS);
-	sh_css_sp_group.config.input_formatter.set[if_config_index].stream_format =
-	    input_format;
-#else
-	(void)input_format;
-#endif
+
+	if (!IS_ISP2401) {
+		assert(if_config_index < SH_CSS_MAX_IF_CONFIGS);
+		sh_css_sp_group.config.input_formatter.set[if_config_index].stream_format =
+		    input_format;
+	}
 }
 
 void
@@ -1028,18 +1012,16 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	if (err)
 		return err;
 
-#ifdef ISP2401
-	pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
-	if (!pipe)
-		return -EINVAL;
+	if (IS_ISP2401) {
+		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
+		if (!pipe)
+			return -EINVAL;
 
-	if (args->in_frame)
-		ia_css_get_crop_offsets(pipe, &args->in_frame->frame_info);
-	else
-		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
-#else
-	(void)pipe; /*avoid build warning*/
-#endif
+		if (args->in_frame)
+			ia_css_get_crop_offsets(pipe, &args->in_frame->frame_info);
+		else
+			ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
+	}
 
 	err = configure_isp_from_args(&sh_css_sp_group.pipe[thread_id],
 				      binary, args, two_ppc, sh_css_sp_stage.deinterleaved);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index b052c40e69bc..36b693bd916a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -18,9 +18,7 @@
 
 #include <system_global.h>
 #include <type_support.h>
-#if !defined(ISP2401)
 #include "input_formatter.h"
-#endif
 
 #include "ia_css_binary.h"
 #include "ia_css_types.h"
-- 
2.41.0

