Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D103F6316E3
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiKTWmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKTWmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:42:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53810233B5
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xkkNE9U035MbC2RI3jIEbAZNJFuxF18nY4c2YS1SDdg=;
        b=WNro9i5qmmM7ddtfBYlxQV+ISRUMQGcVzvFHMuc9+RCTqUJPC589fbohiiyMtY0X1iaMgk
        5xyPrBUe4GhYGqDzK9JP509Va3cwqCSIvbKC7/qAioUGvqFNuK9f9sgyW6F+H88jcZ3VDg
        LGJVqHQgkcTE0G+JY3rBSCOUMXUQLkY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-Eg_S8Gu0NSGnUjPwKD37KQ-1; Sun, 20 Nov 2022 17:41:15 -0500
X-MC-Unique: Eg_S8Gu0NSGnUjPwKD37KQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 098653804072;
        Sun, 20 Nov 2022 22:41:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C0D547505E;
        Sun, 20 Nov 2022 22:41:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/20] media: atomisp: Remove accelerator pipe creation code
Date:   Sun, 20 Nov 2022 23:40:43 +0100
Message-Id: <20221120224101.746199-3-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ATOMISP_ACC_* custom ioctls and the ACC device node have been removed
in commit a5c17adbadcb ("media: atomisp: Remove the ACC device node").

This means that pipe_configs[pipe_id].acc_extension now never gets set
which causes atomisp_compat_css20.c: __create_pipe() to always skip
creation of pipes with a pipe_id of IA_CSS_PIPE_ID_ACC / a mode of
IA_CSS_PIPE_MODE_ACC.

This allows removing of the acc_pipe creation / handling code
from mainly sh_css.c and a bunch of other places.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  |  27 +-
 .../staging/media/atomisp/pci/ia_css_pipe.h   |   3 +-
 .../media/atomisp/pci/ia_css_pipe_public.h    |  69 --
 .../pci/runtime/debug/src/ia_css_debug.c      |   7 -
 .../pci/runtime/pipeline/src/pipeline.c       |   8 -
 drivers/staging/media/atomisp/pci/sh_css.c    | 599 +-----------------
 .../media/atomisp/pci/sh_css_internal.h       |   1 -
 .../staging/media/atomisp/pci/sh_css_legacy.h |   1 -
 8 files changed, 6 insertions(+), 709 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index f282572d69da..c59f9e6b1e2b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -236,18 +236,6 @@ static void __dump_pipe_config(struct atomisp_sub_device *asd,
 		dev_dbg(isp->dev,
 			"pipe_config.isp_pipe_version:%d.\n",
 			p_config->isp_pipe_version);
-		dev_dbg(isp->dev,
-			"pipe_config.acc_extension=%p.\n",
-			p_config->acc_extension);
-		dev_dbg(isp->dev,
-			"pipe_config.acc_stages=%p.\n",
-			p_config->acc_stages);
-		dev_dbg(isp->dev,
-			"pipe_config.num_acc_stages=%d.\n",
-			p_config->num_acc_stages);
-		dev_dbg(isp->dev,
-			"pipe_config.acc_num_execs=%d.\n",
-			p_config->acc_num_execs);
 		dev_dbg(isp->dev,
 			"pipe_config.default_capture_config.capture_mode=%d.\n",
 			p_config->default_capture_config.mode);
@@ -629,10 +617,6 @@ static void __apply_additional_pipe_config(
 		else
 			stream_env->pipe_configs[pipe_id].enable_dz = false;
 		break;
-	case IA_CSS_PIPE_ID_ACC:
-		stream_env->pipe_configs[pipe_id].mode = IA_CSS_PIPE_MODE_ACC;
-		stream_env->pipe_configs[pipe_id].enable_dz = false;
-		break;
 	default:
 		break;
 	}
@@ -644,7 +628,7 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 	if (!asd)
 		return false;
 
-	if (pipe_id == IA_CSS_PIPE_ID_ACC || pipe_id == IA_CSS_PIPE_ID_YUVPP)
+	if (pipe_id == IA_CSS_PIPE_ID_YUVPP)
 		return true;
 
 	if (asd->vfpp) {
@@ -718,12 +702,7 @@ static int __create_pipe(struct atomisp_sub_device *asd,
 	if (pipe_id >= IA_CSS_PIPE_ID_NUM)
 		return -EINVAL;
 
-	if (pipe_id != IA_CSS_PIPE_ID_ACC &&
-	    !stream_env->pipe_configs[pipe_id].output_info[0].res.width)
-		return 0;
-
-	if (pipe_id == IA_CSS_PIPE_ID_ACC &&
-	    !stream_env->pipe_configs[pipe_id].acc_extension)
+	if (!stream_env->pipe_configs[pipe_id].output_info[0].res.width)
 		return 0;
 
 	if (!is_pipe_valid_to_current_run_mode(asd, pipe_id))
@@ -2141,8 +2120,6 @@ static enum ia_css_pipe_mode __pipe_id_to_pipe_mode(
 		return IA_CSS_PIPE_MODE_CAPTURE;
 	case IA_CSS_PIPE_ID_VIDEO:
 		return IA_CSS_PIPE_MODE_VIDEO;
-	case IA_CSS_PIPE_ID_ACC:
-		return IA_CSS_PIPE_MODE_ACC;
 	case IA_CSS_PIPE_ID_YUVPP:
 		return IA_CSS_PIPE_MODE_YUVPP;
 	default:
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe.h b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
index fb58535bff40..22522968b9e6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
@@ -37,7 +37,6 @@ struct ia_css_preview_settings {
 
 	struct ia_css_pipe *copy_pipe;
 	struct ia_css_pipe *capture_pipe;
-	struct ia_css_pipe *acc_pipe;
 };
 
 #define IA_CSS_DEFAULT_PREVIEW_SETTINGS { \
@@ -156,7 +155,7 @@ struct ia_css_pipe {
 #define IA_CSS_DEFAULT_PIPE { \
 	.config			= DEFAULT_PIPE_CONFIG, \
 	.info			= DEFAULT_PIPE_INFO, \
-	.mode			= IA_CSS_PIPE_ID_ACC, /* (pipe_id) */ \
+	.mode			= IA_CSS_PIPE_ID_VIDEO, /* (pipe_id) */ \
 	.pipeline		= DEFAULT_PIPELINE, \
 	.output_info		= {IA_CSS_BINARY_DEFAULT_FRAME_INFO}, \
 	.bds_output_info	= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 7352cbf779fb..8ac1586dce4e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -45,7 +45,6 @@ enum ia_css_pipe_mode {
 	IA_CSS_PIPE_MODE_PREVIEW,	/** Preview pipe */
 	IA_CSS_PIPE_MODE_VIDEO,		/** Video pipe */
 	IA_CSS_PIPE_MODE_CAPTURE,	/** Still capture pipe */
-	IA_CSS_PIPE_MODE_ACC,		/** Accelerated pipe */
 	IA_CSS_PIPE_MODE_COPY,		/** Copy pipe, only used for embedded/image data copying */
 	IA_CSS_PIPE_MODE_YUVPP,		/** YUV post processing pipe, used for all use cases with YUV input,
 									for SoC sensor and external ISP */
@@ -95,21 +94,11 @@ struct ia_css_pipe_config {
 	/** output of YUV scaling */
 	struct ia_css_frame_info vf_output_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
 	/** output of VF YUV scaling */
-	struct ia_css_fw_info *acc_extension;
-	/** Pipeline extension accelerator */
-	struct ia_css_fw_info **acc_stages;
-	/** Standalone accelerator stages */
-	u32 num_acc_stages;
-	/** Number of standalone accelerator stages */
 	struct ia_css_capture_config default_capture_config;
 	/** Default capture config for initial capture pipe configuration. */
 	struct ia_css_resolution dvs_envelope; /** temporary */
 	enum ia_css_frame_delay dvs_frame_delay;
 	/** indicates the DVS loop delay in frame periods */
-	int acc_num_execs;
-	/** For acceleration pipes only: determine how many times the pipe
-	     should be run. Setting this to -1 means it will run until
-	     stopped. */
 	bool enable_dz;
 	/** Disabling digital zoom for a pipeline, if this is set to false,
 	     then setting a zoom factor will have no effect.
@@ -153,7 +142,6 @@ struct ia_css_pipe_config {
 	.vf_output_info		= {IA_CSS_BINARY_DEFAULT_FRAME_INFO}, \
 	.default_capture_config	= DEFAULT_CAPTURE_CONFIG, \
 	.dvs_frame_delay	= IA_CSS_FRAME_DELAY_1, \
-	.acc_num_execs		= -1, \
 }
 
 /* Pipe info, this struct describes properties of a pipe after it's stream has
@@ -224,9 +212,6 @@ struct ia_css_pipe_info {
 		{{0, 0}, 0, 0, 0, 0}, // second_output_info
 		{{0, 0}, 0, 0, 0, 0}, // vf_output_info
 		{{0, 0}, 0, 0, 0, 0}, // second_vf_output_info
-		NULL,   // acc_extension
-		NULL,   // acc_stages
-		0,      // num_acc_stages
 		{
 			IA_CSS_CAPTURE_MODE_RAW, // mode
 			false, // enable_xnr
@@ -234,7 +219,6 @@ struct ia_css_pipe_info {
 		},      // default_capture_config
 		{0, 0}, // dvs_envelope
 		1,      // dvs_frame_delay
-		-1,     // acc_num_execs
 		true,   // enable_dz
 		NULL,   // p_isp_config
 	};
@@ -426,59 +410,6 @@ int
 ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			   struct ia_css_buffer *buffer);
 
-/* @brief  Set the state (Enable or Disable) of the Extension stage in the
- *          given pipe.
- * @param[in] pipe         Pipe handle.
- * @param[in] fw_handle    Extension firmware Handle (ia_css_fw_info.handle)
- * @param[in] enable       Enable Flag (1 to enable ; 0 to disable)
- *
- * @return
- * 0			: Success
- * -EINVAL		: Invalid Parameters
- * -EBUSY	: Inactive QOS Pipe
- *					(No active stream with this pipe)
- *
- * This function will request state change (enable or disable) for the Extension
- * stage (firmware handle) in the given pipe.
- *
- * Note:
- *	1. Extension can be enabled/disabled only on QOS Extensions
- *	2. Extension can be enabled/disabled only with an active QOS Pipe
- *	3. Initial(Default) state of QOS Extensions is Disabled
- *	4. State change cannot be guaranteed immediately OR on frame boundary
- *
- */
-int
-ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe,
-			      u32 fw_handle,
-			      bool  enable);
-
-/* @brief  Get the state (Enable or Disable) of the Extension stage in the
- *          given pipe.
- * @param[in]  pipe        Pipe handle.
- * @param[in]  fw_handle   Extension firmware Handle (ia_css_fw_info.handle)
- * @param[out] *enable     Enable Flag
- *
- * @return
- * 0			: Success
- * -EINVAL		: Invalid Parameters
- * -EBUSY	: Inactive QOS Pipe
- *					(No active stream with this pipe)
- *
- * This function will query the state of the Extension stage (firmware handle)
- * in the given Pipe.
- *
- * Note:
- *	1. Extension state can be queried only on QOS Extensions
- *	2. Extension can be enabled/disabled only with an active QOS Pipe
- *	3. Initial(Default) state of QOS Extensions is Disabled.
- *
- */
-int
-ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe,
-			      u32 fw_handle,
-			      bool *enable);
-
 /* @brief Get selected configuration settings
  * @param[in]	pipe	The pipe.
  * @param[out]	config	Configuration settings.
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index c10c2c598179..bb6204cb42c5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -133,7 +133,6 @@ static const char *const pipe_id_to_str[] = {
 	/* [IA_CSS_PIPE_ID_VIDEO]     =*/ "video",
 	/* [IA_CSS_PIPE_ID_CAPTURE]   =*/ "capture",
 	/* [IA_CSS_PIPE_ID_YUVPP]     =*/ "yuvpp",
-	/* [IA_CSS_PIPE_ID_ACC]       =*/ "accelerator"
 };
 
 static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
@@ -2989,16 +2988,10 @@ ia_css_debug_dump_pipe_config(
 		ia_css_debug_dump_frame_info(&config->vf_output_info[i],
 					     "vf_output_info");
 	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "acc_extension: %p\n",
-			    config->acc_extension);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "num_acc_stages: %d\n",
-			    config->num_acc_stages);
 	ia_css_debug_dump_capture_config(&config->default_capture_config);
 	ia_css_debug_dump_resolution(&config->dvs_envelope, "dvs_envelope");
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "dvs_frame_delay: %d\n",
 			    config->dvs_frame_delay);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "acc_num_execs: %d\n",
-			    config->acc_num_execs);
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "enable_dz: %d\n",
 			    config->enable_dz);
 	IA_CSS_LEAVE_PRIVATE("");
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index dfc50247ea8e..e9e187649a65 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -774,14 +774,6 @@ ia_css_pipeline_configure_inout_port(struct ia_css_pipeline *me,
 					    (uint8_t)SH_CSS_PORT_OUTPUT,
 					    (uint8_t)SH_CSS_HOST_TYPE, 1);
 		break;
-	case IA_CSS_PIPE_ID_ACC:
-		SH_CSS_PIPE_PORT_CONFIG_SET(me->inout_port_config,
-					    (uint8_t)SH_CSS_PORT_INPUT,
-					    (uint8_t)SH_CSS_HOST_TYPE, 1);
-		SH_CSS_PIPE_PORT_CONFIG_SET(me->inout_port_config,
-					    (uint8_t)SH_CSS_PORT_OUTPUT,
-					    (uint8_t)SH_CSS_HOST_TYPE, 1);
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 5fae96bf447d..33348a43c1de 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -209,13 +209,6 @@ ia_css_pipe_check_format(struct ia_css_pipe *pipe,
 			 enum ia_css_frame_format format);
 
 /* ISP 2401 */
-static int
-ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
-			   struct ia_css_fw_info *firmware);
-
-static void
-ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
-			     struct ia_css_fw_info *firmware);
 static void
 ia_css_reset_defaults(struct sh_css *css);
 
@@ -286,10 +279,6 @@ static int
 init_out_frameinfo_defaults(struct ia_css_pipe *pipe,
 			    struct ia_css_frame *out_frame, unsigned int idx);
 
-static int
-sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
-			      const void *acc_fw);
-
 static int
 alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time);
 
@@ -329,9 +318,6 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe);
 static int
 create_host_yuvpp_pipeline(struct ia_css_pipe *pipe);
 
-static int
-create_host_acc_pipeline(struct ia_css_pipe *pipe);
-
 static unsigned int
 sh_css_get_sw_interrupt_value(unsigned int irq);
 
@@ -362,12 +348,6 @@ static struct sh_css_hmm_buffer_record
 *sh_css_hmm_buffer_record_validate(ia_css_ptr ddr_buffer_addr,
 				   enum ia_css_buffer_type type);
 
-void
-ia_css_get_acc_configs(
-    struct ia_css_pipe *pipe,
-    struct ia_css_isp_config *config);
-
-
 #ifdef ISP2401
 static unsigned int get_crop_lines_for_bayer_order(const struct
 	ia_css_stream_config *config);
@@ -1670,7 +1650,6 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	struct ia_css_pipe *main_pipe = NULL;
 	struct ia_css_pipe *copy_pipe = NULL;
 	struct ia_css_pipe *capture_pipe = NULL;
-	struct ia_css_pipe *acc_pipe = NULL;
 	int err = 0;
 	enum ia_css_pipe_id pipe_id;
 
@@ -1691,7 +1670,6 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	case IA_CSS_PIPE_ID_PREVIEW:
 		copy_pipe    = main_pipe->pipe_settings.preview.copy_pipe;
 		capture_pipe = main_pipe->pipe_settings.preview.capture_pipe;
-		acc_pipe     = main_pipe->pipe_settings.preview.acc_pipe;
 		break;
 
 	case IA_CSS_PIPE_ID_VIDEO:
@@ -1700,14 +1678,10 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 		break;
 
 	case IA_CSS_PIPE_ID_CAPTURE:
-	case IA_CSS_PIPE_ID_ACC:
 	default:
 		break;
 	}
 
-	if (acc_pipe)
-		ia_css_pipeline_map(acc_pipe->pipe_num, map);
-
 	if (capture_pipe)
 		ia_css_pipeline_map(capture_pipe->pipe_num, map);
 
@@ -1735,7 +1709,6 @@ static int
 create_host_pipeline_structure(struct ia_css_stream *stream)
 {
 	struct ia_css_pipe *copy_pipe = NULL, *capture_pipe = NULL;
-	struct ia_css_pipe *acc_pipe = NULL;
 	enum ia_css_pipe_id pipe_id;
 	struct ia_css_pipe *main_pipe = NULL;
 	int err = 0;
@@ -1763,7 +1736,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 		copy_pipe_delay = main_pipe->dvs_frame_delay;
 		capture_pipe = main_pipe->pipe_settings.preview.capture_pipe;
 		capture_pipe_delay = IA_CSS_FRAME_DELAY_0;
-		acc_pipe     = main_pipe->pipe_settings.preview.acc_pipe;
 		err = ia_css_pipeline_create(&main_pipe->pipeline, main_pipe->mode,
 					     main_pipe->pipe_num, main_pipe->dvs_frame_delay);
 		break;
@@ -1787,11 +1759,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 					     main_pipe->pipe_num, main_pipe->dvs_frame_delay);
 		break;
 
-	case IA_CSS_PIPE_ID_ACC:
-		err = ia_css_pipeline_create(&main_pipe->pipeline, main_pipe->mode,
-					     main_pipe->pipe_num, main_pipe->dvs_frame_delay);
-		break;
-
 	default:
 		err = -EINVAL;
 	}
@@ -1808,10 +1775,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 					     capture_pipe->pipe_num,
 					     capture_pipe_delay);
 
-	if (!(err) && acc_pipe)
-		err = ia_css_pipeline_create(&acc_pipe->pipeline, acc_pipe->mode,
-					     acc_pipe->pipe_num, main_pipe->dvs_frame_delay);
-
 	/* DH regular multi pipe - not continuous mode: create the next pipelines too */
 	if (!stream->config.continuous) {
 		int i;
@@ -1837,7 +1800,6 @@ static int
 create_host_pipeline(struct ia_css_stream *stream)
 {
 	struct ia_css_pipe *copy_pipe = NULL, *capture_pipe = NULL;
-	struct ia_css_pipe *acc_pipe = NULL;
 	enum ia_css_pipe_id pipe_id;
 	struct ia_css_pipe *main_pipe = NULL;
 	int err = 0;
@@ -1881,27 +1843,17 @@ create_host_pipeline(struct ia_css_stream *stream)
 		}
 	}
 
-#if !defined(ISP2401)
 	/* old isys: need to allocate_mipi_frames() even in IA_CSS_PIPE_MODE_COPY */
-	if (pipe_id != IA_CSS_PIPE_ID_ACC) {
-		err = allocate_mipi_frames(main_pipe, &stream->info);
-		if (err)
-			goto ERR;
-	}
-#elif defined(ISP2401)
-	if ((pipe_id != IA_CSS_PIPE_ID_ACC) &&
-	    (main_pipe->config.mode != IA_CSS_PIPE_MODE_COPY)) {
+	if (!IS_ISP2401 || main_pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
 		err = allocate_mipi_frames(main_pipe, &stream->info);
 		if (err)
 			goto ERR;
 	}
-#endif
 
 	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		copy_pipe    = main_pipe->pipe_settings.preview.copy_pipe;
 		capture_pipe = main_pipe->pipe_settings.preview.capture_pipe;
-		acc_pipe     = main_pipe->pipe_settings.preview.acc_pipe;
 		max_input_width =
 		    main_pipe->pipe_settings.preview.preview_binary.info->sp.input.max_width;
 
@@ -1935,12 +1887,6 @@ create_host_pipeline(struct ia_css_stream *stream)
 
 		break;
 
-	case IA_CSS_PIPE_ID_ACC:
-		err = create_host_acc_pipeline(main_pipe);
-		if (err)
-			goto ERR;
-
-		break;
 	default:
 		err = -EINVAL;
 	}
@@ -1960,12 +1906,6 @@ create_host_pipeline(struct ia_css_stream *stream)
 			goto ERR;
 	}
 
-	if (acc_pipe) {
-		err = create_host_acc_pipeline(acc_pipe);
-		if (err)
-			goto ERR;
-	}
-
 	/* DH regular multi pipe - not continuous mode: create the next pipelines too */
 	if (!stream->config.continuous) {
 		int i;
@@ -1984,9 +1924,6 @@ create_host_pipeline(struct ia_css_stream *stream)
 			case IA_CSS_PIPE_ID_YUVPP:
 				err = create_host_yuvpp_pipeline(stream->pipes[i]);
 				break;
-			case IA_CSS_PIPE_ID_ACC:
-				err = create_host_acc_pipeline(stream->pipes[i]);
-				break;
 			default:
 				err = -EINVAL;
 			}
@@ -2037,9 +1974,6 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 		pipe->mode = IA_CSS_PIPE_ID_VIDEO;
 		memcpy(&pipe->pipe_settings.video, &video, sizeof(video));
 		break;
-	case IA_CSS_PIPE_MODE_ACC:
-		pipe->mode = IA_CSS_PIPE_ID_ACC;
-		break;
 	case IA_CSS_PIPE_MODE_COPY:
 		pipe->mode = IA_CSS_PIPE_ID_CAPTURE;
 		break;
@@ -2156,27 +2090,6 @@ find_pipe_by_num(uint32_t pipe_num)
 	return NULL;
 }
 
-static void sh_css_pipe_free_acc_binaries(
-    struct ia_css_pipe *pipe)
-{
-	struct ia_css_pipeline *pipeline;
-	struct ia_css_pipeline_stage *stage;
-
-	if (!pipe) {
-		IA_CSS_ERROR("NULL input pointer");
-		return;
-	}
-	pipeline = &pipe->pipeline;
-
-	/* loop through the stages and unload them */
-	for (stage = pipeline->stages; stage; stage = stage->next) {
-		struct ia_css_fw_info *firmware = (struct ia_css_fw_info *)
-						  stage->firmware;
-		if (firmware)
-			ia_css_pipe_unload_extension(pipe, firmware);
-	}
-}
-
 int
 ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 {
@@ -2241,9 +2154,6 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 		ia_css_frame_free_multiple(MAX_NUM_VIDEO_DELAY_FRAMES,
 					   pipe->pipe_settings.capture.delay_frames);
 		break;
-	case IA_CSS_PIPE_MODE_ACC:
-		sh_css_pipe_free_acc_binaries(pipe);
-		break;
 	case IA_CSS_PIPE_MODE_COPY:
 		break;
 	case IA_CSS_PIPE_MODE_YUVPP:
@@ -2261,10 +2171,6 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 	ia_css_pipeline_destroy(&pipe->pipeline);
 	pipe_release_pipe_num(ia_css_pipe_get_pipe_num(pipe));
 
-	/* Temporarily, not every sh_css_pipe has an acc_extension. */
-	if (pipe->config.acc_extension)
-		ia_css_pipe_unload_extension(pipe, pipe->config.acc_extension);
-
 	kfree(pipe);
 	IA_CSS_LEAVE("err = %d", err);
 	return err;
@@ -3433,31 +3339,6 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 		}
 	}
 
-	/* Append Extension on Video out, if enabled */
-	if (!need_vf_pp && video_stage && pipe->config.acc_extension &&
-	    (pipe->config.acc_extension->info.isp.type == IA_CSS_ACC_OUTPUT)) {
-		struct ia_css_frame *out = NULL;
-		struct ia_css_frame *in = NULL;
-
-		if ((pipe->config.acc_extension->info.isp.sp.enable.output) &&
-		    (pipe->config.acc_extension->info.isp.sp.enable.in_frame) &&
-		    (pipe->config.acc_extension->info.isp.sp.enable.out_frame)) {
-			/* In/Out Frame mapping to support output frame extension.*/
-			out = video_stage->args.out_frame[0];
-			err = ia_css_frame_allocate_from_info(&in, &pipe->output_info[0]);
-			if (err)
-				goto ERR;
-			video_stage->args.out_frame[0] = in;
-		}
-
-		err = add_firmwares(me, video_binary, pipe->output_stage,
-				    last_output_firmware(pipe->output_stage),
-				    IA_CSS_BINARY_MODE_VIDEO,
-				    in, out, NULL, &video_stage, NULL);
-		if (err)
-			goto ERR;
-	}
-
 	if (need_yuv_pp && video_stage) {
 		struct ia_css_frame *tmp_in_frame = video_stage->args.out_frame[0];
 		struct ia_css_frame *tmp_out_frame = NULL;
@@ -3489,45 +3370,6 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 	return err;
 }
 
-static int
-create_host_acc_pipeline(struct ia_css_pipe *pipe)
-{
-	int err = 0;
-	const struct ia_css_fw_info *fw;
-	unsigned int i;
-
-	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
-	if ((!pipe) || (!pipe->stream)) {
-		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-		return -EINVAL;
-	}
-
-	pipe->pipeline.num_execs = pipe->config.acc_num_execs;
-	/* Reset pipe_qos_config to default disable all QOS extension stages */
-	if (pipe->config.acc_extension)
-		pipe->pipeline.pipe_qos_config = 0;
-
-	for (fw = pipe->vf_stage; fw; fw = fw->next) {
-		err = sh_css_pipeline_add_acc_stage(&pipe->pipeline, fw);
-		if (err)
-			goto ERR;
-	}
-
-	for (i = 0; i < pipe->config.num_acc_stages; i++) {
-		struct ia_css_fw_info *fw = pipe->config.acc_stages[i];
-
-		err = sh_css_pipeline_add_acc_stage(&pipe->pipeline, fw);
-		if (err)
-			goto ERR;
-	}
-
-	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);
-
-ERR:
-	IA_CSS_LEAVE_ERR_PRIVATE(err);
-	return err;
-}
-
 /* Create stages for preview */
 static int
 create_host_preview_pipeline(struct ia_css_pipe *pipe)
@@ -3690,7 +3532,6 @@ preview_start(struct ia_css_pipe *pipe)
 {
 	int err = 0;
 	struct ia_css_pipe *copy_pipe, *capture_pipe;
-	struct ia_css_pipe *acc_pipe;
 	enum sh_css_pipe_config_override copy_ovrd;
 	enum ia_css_input_mode preview_pipe_input_mode;
 	unsigned int thread_id;
@@ -3705,7 +3546,6 @@ preview_start(struct ia_css_pipe *pipe)
 
 	copy_pipe    = pipe->pipe_settings.preview.copy_pipe;
 	capture_pipe = pipe->pipe_settings.preview.capture_pipe;
-	acc_pipe     = pipe->pipe_settings.preview.acc_pipe;
 
 	sh_css_metrics_start_frame();
 
@@ -3764,22 +3604,6 @@ preview_start(struct ia_css_pipe *pipe)
 					(enum mipi_port_id)0);
 	}
 
-	if (acc_pipe) {
-		sh_css_sp_init_pipeline(&acc_pipe->pipeline,
-					IA_CSS_PIPE_ID_ACC,
-					(uint8_t)ia_css_pipe_get_pipe_num(acc_pipe),
-					false,
-					pipe->stream->config.pixels_per_clock == 2,
-					false, /* continuous */
-					false, /* offline */
-					pipe->required_bds_factor,
-					0,
-					IA_CSS_INPUT_MODE_MEMORY,
-					NULL,
-					NULL,
-					(enum mipi_port_id)0);
-	}
-
 	start_pipe(pipe, copy_ovrd, preview_pipe_input_mode);
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -3850,9 +3674,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 
 	pipeline = &pipe->pipeline;
 
-	assert(pipeline ||
-	       pipe_id == IA_CSS_PIPE_ID_COPY ||
-	       pipe_id == IA_CSS_PIPE_ID_ACC);
+	assert(pipeline || pipe_id == IA_CSS_PIPE_ID_COPY);
 
 	assert(sizeof(NULL) <= sizeof(ddr_buffer.kernel_ptr));
 	ddr_buffer.kernel_ptr = HOST_ADDRESS(NULL);
@@ -4442,16 +4264,6 @@ ia_css_dequeue_isys_event(struct ia_css_event *event)
 	return err;
 }
 
-static void
-acc_start(struct ia_css_pipe *pipe)
-{
-	assert(pipe);
-	assert(pipe->stream);
-
-	start_pipe(pipe, SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD,
-		   pipe->stream->config.mode);
-}
-
 static int
 sh_css_pipe_start(struct ia_css_stream *stream)
 {
@@ -4496,9 +4308,6 @@ sh_css_pipe_start(struct ia_css_stream *stream)
 	case IA_CSS_PIPE_ID_YUVPP:
 		err = yuvpp_start(pipe);
 		break;
-	case IA_CSS_PIPE_ID_ACC:
-		acc_start(pipe);
-		break;
 	default:
 		err = -EINVAL;
 	}
@@ -4524,10 +4333,6 @@ sh_css_pipe_start(struct ia_css_stream *stream)
 				stream->pipes[i]->stop_requested = false;
 				err = yuvpp_start(stream->pipes[i]);
 				break;
-			case IA_CSS_PIPE_ID_ACC:
-				stream->pipes[i]->stop_requested = false;
-				acc_start(stream->pipes[i]);
-				break;
 			default:
 				err = -EINVAL;
 			}
@@ -4620,22 +4425,6 @@ sh_css_pipe_start(struct ia_css_stream *stream)
 		    (uint8_t)thread_id, 0,  0);
 	}
 
-	/* in case of PREVIEW mode, check whether QOS acc_pipe is available, then start the qos pipe */
-	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW) {
-		struct ia_css_pipe *acc_pipe = NULL;
-
-		acc_pipe = pipe->pipe_settings.preview.acc_pipe;
-
-		if (acc_pipe) {
-			ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(acc_pipe),
-							 &thread_id);
-			/* by the time we reach here q is initialized and handle is available.*/
-			ia_css_bufq_enqueue_psys_event(
-			    IA_CSS_PSYS_SW_EVENT_START_STREAM,
-			    (uint8_t)thread_id, 0, 0);
-		}
-	}
-
 	stream->started = true;
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -6861,8 +6650,6 @@ sh_css_pipe_load_binaries(struct ia_css_pipe *pipe)
 	case IA_CSS_PIPE_ID_YUVPP:
 		err = load_yuvpp_binaries(pipe);
 		break;
-	case IA_CSS_PIPE_ID_ACC:
-		break;
 	default:
 		err = -EINVAL;
 		break;
@@ -7755,154 +7542,6 @@ ia_css_stream_end_input_frame(const struct ia_css_stream *stream)
 	ia_css_inputfifo_end_frame(stream->config.channel_id);
 }
 
-static void
-append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware)
-{
-	IA_CSS_ENTER_PRIVATE("l = %p, firmware = %p", l, firmware);
-	if (!l) {
-		IA_CSS_ERROR("NULL fw_info");
-		IA_CSS_LEAVE_PRIVATE("");
-		return;
-	}
-	while (*l)
-		l = &(*l)->next;
-	*l = firmware;
-	/* when multiple acc extensions are loaded, 'next' can be not NULL */
-	/*firmware->next = NULL;*/
-	IA_CSS_LEAVE_PRIVATE("");
-}
-
-static void
-remove_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware)
-{
-	assert(*l);
-	assert(firmware);
-	(void)l;
-	(void)firmware;
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "remove_firmware() enter:\n");
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "remove_firmware() leave:\n");
-	return; /* removing single and multiple firmware is handled in acc_unload_extension() */
-}
-
-static int upload_isp_code(struct ia_css_fw_info *firmware)
-{
-	ia_css_ptr binary;
-
-	if (!firmware) {
-		IA_CSS_ERROR("NULL input parameter");
-		return -EINVAL;
-	}
-	binary = firmware->info.isp.xmem_addr;
-
-	if (!binary) {
-		unsigned int size = firmware->blob.size;
-		const unsigned char *blob;
-		const unsigned char *binary_name;
-
-		binary_name =
-		    (const unsigned char *)(IA_CSS_EXT_ISP_PROG_NAME(
-						firmware));
-		blob = binary_name +
-			strlen((const char *)binary_name) +
-			1;
-		binary = sh_css_load_blob(blob, size);
-		firmware->info.isp.xmem_addr = binary;
-	}
-
-	if (!binary)
-		return -ENOMEM;
-	return 0;
-}
-
-static int
-acc_load_extension(struct ia_css_fw_info *firmware)
-{
-	int err;
-	struct ia_css_fw_info *hd = firmware;
-
-	while (hd) {
-		err = upload_isp_code(hd);
-		if (err)
-			return err;
-		hd = hd->next;
-	}
-
-	if (!firmware)
-		return -EINVAL;
-	firmware->loaded = true;
-	return 0;
-}
-
-static void
-acc_unload_extension(struct ia_css_fw_info *firmware)
-{
-	struct ia_css_fw_info *hd = firmware;
-	struct ia_css_fw_info *hdn = NULL;
-
-	if (!firmware) /* should not happen */
-		return;
-	/* unload and remove multiple firmwares */
-	while (hd) {
-		hdn = (hd->next) ? &(*hd->next) : NULL;
-		if (hd->info.isp.xmem_addr) {
-			hmm_free(hd->info.isp.xmem_addr);
-			hd->info.isp.xmem_addr = mmgr_NULL;
-		}
-		hd->isp_code = NULL;
-		hd->next = NULL;
-		hd = hdn;
-	}
-
-	firmware->loaded = false;
-}
-
-/* Load firmware for extension */
-static int
-ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
-			   struct ia_css_fw_info *firmware)
-{
-	int err = 0;
-
-	IA_CSS_ENTER_PRIVATE("fw = %p pipe = %p", firmware, pipe);
-
-	if ((!firmware) || (!pipe)) {
-		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-		return -EINVAL;
-	}
-
-	if (firmware->info.isp.type == IA_CSS_ACC_OUTPUT)
-		append_firmware(&pipe->output_stage, firmware);
-	else if (firmware->info.isp.type == IA_CSS_ACC_VIEWFINDER)
-		append_firmware(&pipe->vf_stage, firmware);
-	err = acc_load_extension(firmware);
-
-	IA_CSS_LEAVE_ERR_PRIVATE(err);
-	return err;
-}
-
-/* Unload firmware for extension */
-static void
-ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
-			     struct ia_css_fw_info *firmware)
-{
-	IA_CSS_ENTER_PRIVATE("fw = %p pipe = %p", firmware, pipe);
-
-	if ((!firmware) || (!pipe)) {
-		IA_CSS_ERROR("NULL input parameters");
-		IA_CSS_LEAVE_PRIVATE("");
-		return;
-	}
-
-	if (firmware->info.isp.type == IA_CSS_ACC_OUTPUT)
-		remove_firmware(&pipe->output_stage, firmware);
-	else if (firmware->info.isp.type == IA_CSS_ACC_VIEWFINDER)
-		remove_firmware(&pipe->vf_stage, firmware);
-	acc_unload_extension(firmware);
-
-	IA_CSS_LEAVE_PRIVATE("");
-}
-
 bool
 ia_css_pipeline_uses_params(struct ia_css_pipeline *me)
 {
@@ -7924,35 +7563,6 @@ ia_css_pipeline_uses_params(struct ia_css_pipeline *me)
 	return false;
 }
 
-static int
-sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
-			      const void *acc_fw)
-{
-	struct ia_css_fw_info *fw = (struct ia_css_fw_info *)acc_fw;
-	/* In QoS case, load_extension already called, so skipping */
-	int	err = 0;
-
-	if (!fw->loaded)
-		err = acc_load_extension(fw);
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_pipeline_add_acc_stage() enter: pipeline=%p, acc_fw=%p\n",
-			    pipeline, acc_fw);
-
-	if (!err) {
-		struct ia_css_pipeline_stage_desc stage_desc;
-
-		ia_css_pipe_get_acc_stage_desc(&stage_desc, NULL, fw);
-		err = ia_css_pipeline_create_and_add_stage(pipeline,
-							   &stage_desc,
-							   NULL);
-	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_pipeline_add_acc_stage() leave: return_err=%d\n", err);
-	return err;
-}
-
 /*
  * @brief Tag a specific frame in continuous capture.
  * Refer to "sh_css_internal.h" for details.
@@ -8177,26 +7787,6 @@ void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config)
 	stream_config->source.port.rxcount = 0x04040404;
 }
 
-static int
-ia_css_acc_pipe_create(struct ia_css_pipe *pipe)
-{
-	int err = 0;
-
-	if (!pipe) {
-		IA_CSS_ERROR("NULL input parameter");
-		return -EINVAL;
-	}
-
-	/* There is not meaning for num_execs = 0 semantically. Run at least once. */
-	if (pipe->config.acc_num_execs == 0)
-		pipe->config.acc_num_execs = 1;
-
-	if (pipe->config.acc_extension)
-		err = ia_css_pipe_load_extension(pipe, pipe->config.acc_extension);
-
-	return err;
-}
-
 int ia_css_pipe_create(const struct ia_css_pipe_config *config,
 		       struct ia_css_pipe **pipe)
 {
@@ -8257,23 +7847,6 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	else
 		ia_css_pipe_extra_config_defaults(&internal_pipe->extra_config);
 
-	if (config->mode == IA_CSS_PIPE_MODE_ACC) {
-		/*
-		 * Temporary hack to migrate acceleration to CSS 2.0.
-		 * In the future the code for all pipe types should be
-		 * unified.
-		 */
-		*pipe = internal_pipe;
-		if (!internal_pipe->config.acc_extension &&
-		    internal_pipe->config.num_acc_stages ==
-		    0) { /* if no acc binary and no standalone stage */
-			*pipe = NULL;
-			IA_CSS_LEAVE_ERR_PRIVATE(0);
-			return 0;
-		}
-		return ia_css_acc_pipe_create(internal_pipe);
-	}
-
 	/*
 	 * Use config value when dvs_frame_delay setting equal to 2,
 	 * otherwise always 1 by default
@@ -8368,15 +7941,6 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 			}
 		}
 	}
-	if (internal_pipe->config.acc_extension) {
-		err = ia_css_pipe_load_extension(internal_pipe,
-						 internal_pipe->config.acc_extension);
-		if (err) {
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			kvfree(internal_pipe);
-			return err;
-		}
-	}
 	/* set all info to zeroes first */
 	memset(&internal_pipe->info, 0, sizeof(internal_pipe->info));
 
@@ -8524,57 +8088,6 @@ find_pipe(struct ia_css_pipe *pipes[], unsigned int num_pipes,
 	return NULL;
 }
 
-static int
-ia_css_acc_stream_create(struct ia_css_stream *stream)
-{
-	int i;
-	int err = 0;
-
-	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
-
-	if (!stream) {
-		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-		return -EINVAL;
-	}
-
-	for (i = 0;  i < stream->num_pipes; i++) {
-		struct ia_css_pipe *pipe = stream->pipes[i];
-
-		if (!pipe) {
-			IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-			return -EINVAL;
-		}
-
-		pipe->stream = stream;
-	}
-
-	/* Map SP threads before doing anything. */
-	err = map_sp_threads(stream, true);
-	if (err) {
-		IA_CSS_LEAVE_ERR_PRIVATE(err);
-		return err;
-	}
-
-	for (i = 0;  i < stream->num_pipes; i++) {
-		struct ia_css_pipe *pipe = stream->pipes[i];
-
-		assert(pipe);
-		ia_css_pipe_map_queue(pipe, true);
-	}
-
-	err = create_host_pipeline_structure(stream);
-	if (err) {
-		IA_CSS_LEAVE_ERR_PRIVATE(err);
-		return err;
-	}
-
-	stream->started = false;
-
-	IA_CSS_LEAVE_ERR_PRIVATE(0);
-
-	return 0;
-}
-
 static int
 metadata_info_init(const struct ia_css_metadata_config *mdc,
 		   struct ia_css_metadata_info *md)
@@ -8807,11 +8320,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		goto ERR;
 	IA_CSS_LOG("isp_params_configs: %p", curr_stream->isp_params_configs);
 
-	if (num_pipes == 1 && pipes[0]->config.mode == IA_CSS_PIPE_MODE_ACC) {
-		*stream = curr_stream;
-		err = ia_css_acc_stream_create(curr_stream);
-		goto ERR;
-	}
 	/* sensor binning */
 	if (!spcopyonly) {
 		sensor_binning_changed =
@@ -8832,7 +8340,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		/* Search for the preview pipe and create the copy pipe */
 		struct ia_css_pipe *preview_pipe;
 		struct ia_css_pipe *video_pipe;
-		struct ia_css_pipe *acc_pipe;
 		struct ia_css_pipe *capture_pipe = NULL;
 		struct ia_css_pipe *copy_pipe = NULL;
 
@@ -8847,11 +8354,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 					 IA_CSS_PIPE_MODE_PREVIEW, false);
 		video_pipe = find_pipe(pipes, num_pipes,
 				       IA_CSS_PIPE_MODE_VIDEO, false);
-		acc_pipe = find_pipe(pipes, num_pipes, IA_CSS_PIPE_MODE_ACC,
-				     false);
-		if (acc_pipe && num_pipes == 2 && curr_stream->cont_capt)
-			curr_stream->cont_capt =
-			    false; /* preview + QoS case will not need cont_capt switch */
+
 		if (curr_stream->cont_capt) {
 			capture_pipe = find_pipe(pipes, num_pipes,
 						 IA_CSS_PIPE_MODE_CAPTURE,
@@ -8888,9 +8391,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		}
 		if (video_pipe && curr_stream->cont_capt)
 			video_pipe->pipe_settings.video.capture_pipe = capture_pipe;
-
-		if (preview_pipe && acc_pipe)
-			preview_pipe->pipe_settings.preview.acc_pipe = acc_pipe;
 	}
 	for (i = 0; i < num_pipes; i++) {
 		curr_pipe = pipes[i];
@@ -9738,13 +9238,6 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 		if (!pipe->stream->config.continuous)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-	} else if (pipe->mode == IA_CSS_PIPE_ID_ACC) {
-		if (need_input_queue)
-			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);
-		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);
-		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);
-		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);
-		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
 	} else if (pipe->mode == IA_CSS_PIPE_ID_YUVPP) {
 		unsigned int idx;
 
@@ -9795,92 +9288,6 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
 	return ret;
 }
 
-/*
- * @brief	Set the state (Enable or Disable) of the Extension stage in the
- *		given pipe.
- */
-int
-ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
-			      bool enable)
-{
-	unsigned int thread_id;
-	struct ia_css_pipeline_stage *stage;
-	int err = 0;
-
-	IA_CSS_ENTER("");
-
-	/* Parameter Check */
-	if (!pipe || !pipe->stream) {
-		IA_CSS_ERROR("Invalid Pipe.");
-		err = -EINVAL;
-	} else if (!(pipe->config.acc_extension)) {
-		IA_CSS_ERROR("Invalid Pipe(No Extension Firmware)");
-		err = -EINVAL;
-	} else if (!sh_css_sp_is_running()) {
-		IA_CSS_ERROR("Leaving: queue unavailable.");
-		err = -EBUSY;
-	} else {
-		/* Query the threadid and stage_num for the Extension firmware*/
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);
-		if (!err) {
-			/* Set the Extension State;. TODO: Add check for stage firmware.type (QOS)*/
-			err = ia_css_bufq_enqueue_psys_event(
-			    (uint8_t)IA_CSS_PSYS_SW_EVENT_STAGE_ENABLE_DISABLE,
-			    (uint8_t)thread_id,
-			    (uint8_t)stage->stage_num,
-			    enable ? 1 : 0);
-			if (!err) {
-				if (enable)
-					SH_CSS_QOS_STAGE_ENABLE(&sh_css_sp_group.pipe[thread_id], stage->stage_num);
-				else
-					SH_CSS_QOS_STAGE_DISABLE(&sh_css_sp_group.pipe[thread_id], stage->stage_num);
-			}
-		}
-	}
-	IA_CSS_LEAVE("err:%d handle:%u enable:%d", err, fw_handle, enable);
-	return err;
-}
-
-/*
- * @brief	Get the state (Enable or Disable) of the Extension stage in the
- * given pipe.
- */
-int
-ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
-			      bool *enable)
-{
-	struct ia_css_pipeline_stage *stage;
-	unsigned int thread_id;
-	int err = 0;
-
-	IA_CSS_ENTER("");
-
-	/* Parameter Check */
-	if (!pipe || !pipe->stream) {
-		IA_CSS_ERROR("Invalid Pipe.");
-		err = -EINVAL;
-	} else if (!(pipe->config.acc_extension)) {
-		IA_CSS_ERROR("Invalid Pipe (No Extension Firmware).");
-		err = -EINVAL;
-	} else if (!sh_css_sp_is_running()) {
-		IA_CSS_ERROR("Leaving: queue unavailable.");
-		err = -EBUSY;
-	} else {
-		/* Query the threadid and stage_num corresponding to the Extension firmware*/
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);
-
-		if (!err) {
-			/* Get the Extension State */
-			*enable = (SH_CSS_QOS_STAGE_IS_ENABLED(&sh_css_sp_group.pipe[thread_id],
-								stage->stage_num)) ? true : false;
-		}
-	}
-	IA_CSS_LEAVE("err:%d handle:%u enable:%d", err, fw_handle, *enable);
-	return err;
-}
-
 static void
 sh_css_hmm_buffer_record_init(void)
 {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 435b3cedd1c3..98267707a5fc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -497,7 +497,6 @@ ia_css_metadata_free_multiple(unsigned int num_bufs,
 #define SH_CSS_QOS_STAGE_IS_ALL_DISABLED(pipe) ((pipe)->pipe_qos_config == QOS_ALL_STAGES_DISABLED)
 #define SH_CSS_QOS_MODE_PIPE_ADD(mode, pipe)    ((mode) |= (0x1 << (pipe)->pipe_id))
 #define SH_CSS_QOS_MODE_PIPE_REMOVE(mode, pipe) ((mode) &= ~(0x1 << (pipe)->pipe_id))
-#define SH_CSS_IS_QOS_ONLY_MODE(mode)           ((mode) == (0x1 << IA_CSS_PIPE_ID_ACC))
 
 /* Information for a pipeline */
 struct sh_css_sp_pipeline {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_legacy.h b/drivers/staging/media/atomisp/pci/sh_css_legacy.h
index 567c8d6dcc2c..cdf239b070a8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_legacy.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_legacy.h
@@ -32,7 +32,6 @@ enum ia_css_pipe_id {
 	IA_CSS_PIPE_ID_VIDEO,
 	IA_CSS_PIPE_ID_CAPTURE,
 	IA_CSS_PIPE_ID_YUVPP,
-	IA_CSS_PIPE_ID_ACC,
 	IA_CSS_PIPE_ID_NUM
 };
 
-- 
2.38.1

