Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8133734B58
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 07:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjFSF00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 01:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjFSF0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 01:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E24128
        for <linux-media@vger.kernel.org>; Sun, 18 Jun 2023 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687152332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KeCX7isjayLnIysJ6AoQ81f8YXXhflu+Y2GPGNslxe0=;
        b=Clc9Bg06rg+obPBwrNmXZQIy4JVvKlxBZ2TBiYZ8hPgKu/mSxcQnJvbPuSpmgcWUb4jLVD
        g/U81WC1X8mWdRCQ1+vnNoWAKWd1fmx+nHVeHS5dnhjWUS/ats1OBRQr3OIWC4WJ8Y+G/4
        N44ayeHVyNwqEkkOaBlVJiY2JK3oBEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-f435A7daO6etBpW9aFJY7A-1; Mon, 19 Jun 2023 01:25:28 -0400
X-MC-Unique: f435A7daO6etBpW9aFJY7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13D6685A58C;
        Mon, 19 Jun 2023 05:25:28 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.119])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3929563A59;
        Mon, 19 Jun 2023 05:25:23 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 3/3] media: atomisp: sh_css_internal: sh_css_params: Unifying sh_css_sp_group data structure
Date:   Mon, 19 Jun 2023 13:24:53 +0800
Message-Id: <20230619052453.48598-4-hpa@redhat.com>
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

Since some parts of the data structure elements are determined in compile
time, the configuration data structure should be compiled for both two
ISP models. In order to set the configuration for both ISP models in
runtime, The sh_css_sp_group is unified to one data structure for the
configuration to ensure the data structure can be used for both ISP2400
and 2401 in runtime. Also, the unused codes for debug purpose are removed.

Form the aspect of ISP setting, the length and the content of the
configuration structure for ISP2400 and ISP2401 are different. So, we
need to pick up the necessary part of sp_group configuration for both
models and then copy those parts into a temporary buffer. This buffer
is finally written to the ISP with the corresponding length.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/sh_css_internal.h       | 41 +------------------
 .../staging/media/atomisp/pci/sh_css_params.c | 41 ++++++++++++++++++-
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index d98f1323441e..2349eb4d3767 100644
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
@@ -86,31 +84,8 @@
 #define SH_CSS_MAX_IF_CONFIGS	3 /* Must match with IA_CSS_NR_OF_CONFIGS (not defined yet).*/
 #define SH_CSS_IF_CONFIG_NOT_NEEDED	0xFF
 
-/*
- * SH_CSS_MAX_SP_THREADS:
- *	 sp threads visible to host with connected communication queues
- *	 these threads are capable of running an image pipe
- * SH_CSS_MAX_SP_INTERNAL_THREADS:
- *	 internal sp service threads, no communication queues to host
- *	 these threads can't be used as image pipe
- */
-
-#if !defined(ISP2401)
-#define SH_CSS_SP_INTERNAL_METADATA_THREAD	1
-#else
-#define SH_CSS_SP_INTERNAL_METADATA_THREAD	0
-#endif
-
-#define SH_CSS_SP_INTERNAL_SERVICE_THREAD		1
-
 #define SH_CSS_MAX_SP_THREADS		5
 
-#define SH_CSS_MAX_SP_INTERNAL_THREADS	(\
-	 SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
-	 SH_CSS_SP_INTERNAL_METADATA_THREAD)
-
-#define SH_CSS_MAX_PIPELINES	SH_CSS_MAX_SP_THREADS
-
 /**
  * The C99 standard does not specify the exact object representation of structs;
  * the representation is compiler dependent.
@@ -357,14 +332,12 @@ struct sh_css_sp_debug_command {
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
 
@@ -377,7 +350,7 @@ struct sh_css_sp_config {
 	     frames are locked when their EOF event is successfully sent to the
 	     host (true) or when they are passed to the preview/video pipe
 	     (false). */
-#if !defined(ISP2401)
+
 	struct {
 		u8					a_changed;
 		u8					b_changed;
@@ -385,15 +358,13 @@ struct sh_css_sp_config {
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
@@ -409,7 +380,6 @@ enum sh_css_stage_type {
 #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
 	((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
 
-#if defined(ISP2401)
 struct sh_css_sp_pipeline_terminal {
 	union {
 		/* Input System 2401 */
@@ -442,7 +412,6 @@ struct sh_css_sp_pipeline_io_status {
 	u32	running[N_INPUT_SYSTEM_CSI_PORT];	/** configured streams */
 };
 
-#endif
 enum sh_css_port_dir {
 	SH_CSS_PORT_INPUT  = 0,
 	SH_CSS_PORT_OUTPUT  = 1
@@ -641,10 +610,8 @@ struct sh_css_sp_stage {
 struct sh_css_sp_group {
 	struct sh_css_sp_config		config;
 	struct sh_css_sp_pipeline	pipe[SH_CSS_MAX_SP_THREADS];
-#if defined(ISP2401)
 	struct sh_css_sp_pipeline_io	pipe_io[SH_CSS_MAX_SP_THREADS];
 	struct sh_css_sp_pipeline_io_status	pipe_io_status;
-#endif
 	struct sh_css_sp_debug_command	debug;
 };
 
@@ -922,13 +889,11 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
 			    unsigned int width,
 			    unsigned int aligned);
 
-#if !defined(ISP2401)
 
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port,
 				const unsigned int idx);
 
-#endif
 
 ia_css_ptr
 sh_css_store_sp_group_to_ddr(void);
@@ -971,11 +936,9 @@ sh_css_continuous_is_enabled(uint8_t pipe_num);
 struct ia_css_pipe *
 find_pipe_by_num(uint32_t pipe_num);
 
-#ifdef ISP2401
 void
 ia_css_get_crop_offsets(
     struct ia_css_pipe *pipe,
     struct ia_css_frame_info *in_frame);
-#endif
 
 #endif /* _SH_CSS_INTERNAL_H_ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 588f2adab058..5667e855da76 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3720,10 +3720,47 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 
 ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 {
+	u8 *write_buf;
+	u8 *buf_ptr;
+
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
+
+	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
+	if (!write_buf)
+		return 0;
+
+	buf_ptr = write_buf;
+	if (IS_ISP2401) {
+		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
+		buf_ptr += 3;
+		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
+		buf_ptr += 2;
+		memset(buf_ptr, 0, 3);
+		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
+	} else {
+		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
+		buf_ptr += sizeof(sh_css_sp_group.config);
+	}
+
+	memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pipe));
+	buf_ptr += sizeof(sh_css_sp_group.pipe);
+
+	if (IS_ISP2401) {
+		memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_sp_group.pipe_io));
+		buf_ptr += sizeof(sh_css_sp_group.pipe_io);
+		memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
+		       sizeof(sh_css_sp_group.pipe_io_status));
+		buf_ptr += sizeof(sh_css_sp_group.pipe_io_status);
+	}
+
+	memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.debug));
+	buf_ptr += sizeof(sh_css_sp_group.debug);
+
 	hmm_store(xmem_sp_group_ptrs,
-		   &sh_css_sp_group,
-		   sizeof(struct sh_css_sp_group));
+		  write_buf,
+		  buf_ptr - write_buf);
+
+	kfree(write_buf);
 	return xmem_sp_group_ptrs;
 }
 
-- 
2.40.1

