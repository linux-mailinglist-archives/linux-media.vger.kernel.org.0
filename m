Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07444530C1
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhKPLdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:33:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:35234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235061AbhKPLcb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A47861A89;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=y0bvT3e6A5wjQrdKJvKDHFoCkwmYVwJFocAdvaP+0uU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bD3xrAT9HVcTx+WYy+CAP9BKwQOB+ck5xjfceqUMhpLIwW74LPuj4ivpVKynuKvkh
         NCy4dbEgVkRRQ0opKBHz2+zCjfZykufKiAjJD25RT7M9UpL6EOgOrMv16UmnoassPi
         jAE7B5oPjN7LVl0mbVl34bCkRlhQCx8TLEX/f91a9Ac5TtcFhxF6mTdXHM1k6xxDuu
         I0Y5G6SeujQF07Uj+DShqqvZ6+iaOh5OdGXG8nxQyNwFVo32EgwxSnZtXeA/FBWGo1
         r40vZnswLFCIYieJnz5MsZUQQj/jARaqdrmV38Bo/ZGRWMB6xenixkC5UCJKnoSmwb
         EKRHR5MJvCPXA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfL-DC; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 05/23] media: atomisp: fix comments coding style at sh_css.c
Date:   Tue, 16 Nov 2021 11:28:46 +0000
Message-Id: <6dda22e8880af08af094ac6b790d127b179e4875.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the coding style for the comments at this file.

While here, drop a do-nothing if logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 881 ++++++++++++---------
 1 file changed, 521 insertions(+), 360 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index bd3f96bd7d6d..5ee777909cce 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -62,9 +62,9 @@
 #include "ia_css_mmu_private.h" /* sh_css_mmu_set_page_table_base_index() */
 #include "gdc_device.h"		/* HRT_GDC_N */
 #include "dma.h"		/* dma_set_max_burst_size() */
-#include "irq.h"			/* virq */
-#include "sp.h"				/* cnd_sp_irq_enable() */
-#include "isp.h"			/* cnd_isp_irq_enable, ISP_VEC_NELEMS */
+#include "irq.h"		/* virq */
+#include "sp.h"			/* cnd_sp_irq_enable() */
+#include "isp.h"		/* cnd_isp_irq_enable, ISP_VEC_NELEMS */
 #include "gp_device.h"		/* gp_device_reg_store() */
 #define __INLINE_GPIO__
 #include "gpio.h"
@@ -97,8 +97,9 @@ static int thread_alive;
 /* Size of Refcount List */
 #define REFCOUNT_SIZE 1000
 
-/* for JPEG, we don't know the length of the image upfront,
- * but since we support sensor upto 16MP, we take this as
+/*
+ * for JPEG, we don't know the length of the image upfront,
+ * but since we support sensor up to 16MP, we take this as
  * upper limit.
  */
 #define JPEG_BYTES (16 * 1024 * 1024)
@@ -110,9 +111,10 @@ struct sh_css my_css;
 
 int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
 
-/* modes of work: stream_create and stream_destroy will update the save/restore data
-   only when in working mode, not suspend/resume
-*/
+/*
+ * modes of work: stream_create and stream_destroy will update the save/restore
+ * data only when in working mode, not suspend/resume
+ */
 enum ia_sh_css_modes {
 	sh_css_mode_none = 0,
 	sh_css_mode_working,
@@ -120,40 +122,55 @@ enum ia_sh_css_modes {
 	sh_css_mode_resume
 };
 
-/* a stream seed, to save and restore the stream data.
-   the stream seed contains all the data required to "grow" the seed again after it was closed.
+/**
+ * struct sh_css_stream_seed - a stream seed, to save and restore the
+ * stream data.
+ *
+ * @orig_stream:	pointer to restore the original handle
+ * @stream:		handle, used as ID too.
+ * @stream_config:	stream config struct
+ * @num_pipes:		number of pipes
+ * @pipes:		pipe handles
+ * @orig_pipes:		pointer to restore original handle
+ * @pipe_config:	pipe config structs
+ *
+ * the stream seed contains all the data required to "grow" the seed again
+ * after it was closed.
 */
 struct sh_css_stream_seed {
-	struct ia_css_stream
-		**orig_stream;                /* pointer to restore the original handle */
-	struct ia_css_stream		*stream;                      /* handle, used as ID too.*/
-	struct ia_css_stream_config	stream_config;				/* stream config struct */
+	struct ia_css_stream		**orig_stream;
+	struct ia_css_stream		*stream;
+	struct ia_css_stream_config	stream_config;
 	int				num_pipes;
-	struct ia_css_pipe		*pipes[IA_CSS_PIPE_ID_NUM];			/* pipe handles */
-	struct ia_css_pipe
-		**orig_pipes[IA_CSS_PIPE_ID_NUM];	/* pointer to restore original handle */
-	struct ia_css_pipe_config
-		pipe_config[IA_CSS_PIPE_ID_NUM];	/* pipe config structs */
+	struct ia_css_pipe		*pipes[IA_CSS_PIPE_ID_NUM];
+	struct ia_css_pipe		**orig_pipes[IA_CSS_PIPE_ID_NUM];
+	struct ia_css_pipe_config	pipe_config[IA_CSS_PIPE_ID_NUM];
 };
 
 #define MAX_ACTIVE_STREAMS	5
-/* A global struct for save/restore to hold all the data that should sustain power-down:
-   MMU base, IRQ type, env for routines, binary loaded FW and the stream seeds.
-*/
+/*
+ * A global struct for save/restore to hold all the data that should
+ * sustain power-down: MMU base, IRQ type, env for routines, binary loaded FW
+ * and the stream seeds.
+ */
 struct sh_css_save {
 	enum ia_sh_css_modes		mode;
-	u32		       mmu_base;				/* the last mmu_base */
+	u32		       mmu_base;		/* the last mmu_base */
 	enum ia_css_irq_type           irq_type;
 	struct sh_css_stream_seed      stream_seeds[MAX_ACTIVE_STREAMS];
-	struct ia_css_fw	       *loaded_fw;				/* fw struct previously loaded */
-	struct ia_css_env	       driver_env;				/* driver-supplied env copy */
+	struct ia_css_fw	       *loaded_fw;	/* fw struct previously loaded */
+	struct ia_css_env	       driver_env;	/* driver-supplied env copy */
 };
 
 static bool my_css_save_initialized;	/* if my_css_save was initialized */
 static struct sh_css_save my_css_save;
 
-/* pqiao NOTICE: this is for css internal buffer recycling when stopping pipeline,
-   this array is temporary and will be replaced by resource manager*/
+/*
+ * pqiao NOTICE: this is for css internal buffer recycling when stopping
+ * pipeline,
+ * this array is temporary and will be replaced by resource manager
+ */
+
 /* Taking the biggest Size for number of Elements */
 #define MAX_HMM_BUFFER_NUM	\
 	(SH_CSS_MAX_NUM_QUEUES * (IA_CSS_NUM_ELEMS_SP2HOST_BUFFER_QUEUE + 2))
@@ -443,9 +460,10 @@ static enum ia_css_frame_format yuv422_copy_formats[] = {
 	IA_CSS_FRAME_FORMAT_YUYV
 };
 
-/* Verify whether the selected output format is can be produced
+/*
+ * Verify whether the selected output format is can be produced
  * by the copy binary given the stream format.
- * */
+ */
 static int
 verify_copy_out_frame_format(struct ia_css_pipe *pipe)
 {
@@ -682,13 +700,13 @@ static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
 		/*
 		 * The frame format layout is shown below.
 		 *
-		 *		Line	0:	Pixel Pixel ... Pixel
-		 *		Line	1:	Pixel Pixel ... Pixel
-		 *		Line	2:	Pixel Pixel ... Pixel
-		 *		Line	3:	Pixel Pixel ... Pixel
+		 *		Line	0:	Pixel ... Pixel
+		 *		Line	1:	Pixel ... Pixel
+		 *		Line	2:	Pixel ... Pixel
+		 *		Line	3:	Pixel ... Pixel
 		 *		...
-		 *		Line (n-2):	Pixel Pixel ... Pixel
-		 *		Line (n-1):	Pixel Pixel ... Pixel
+		 *		Line (n-2):	Pixel ... Pixel
+		 *		Line (n-1):	Pixel ... Pixel
 		 *
 		 * In this frame format, the even-line is
 		 * as wide as the odd-line.
@@ -899,8 +917,10 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 			isys_stream_descr->metadata.lines_per_frame =
 			    stream_cfg->metadata_config.resolution.height;
 #ifdef ISP2401
-			/* For new input system, number of str2mmio requests must be even.
-			 * So we round up number of metadata lines to be even. */
+			/*
+			 * For new input system, number of str2mmio requests must be even.
+			 * So we round up number of metadata lines to be even.
+			 */
 			if (isys_stream_descr->metadata.lines_per_frame > 0)
 				isys_stream_descr->metadata.lines_per_frame +=
 				    (isys_stream_descr->metadata.lines_per_frame & 1);
@@ -1067,7 +1087,8 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 			binary = pipe->pipeline.stages->binary;
 
 	if (binary) {
-		/* this was being done in ifmtr in 2400.
+		/*
+		 * this was being done in ifmtr in 2400.
 		 * online and cont bypass the init_in_frameinfo_memory_defaults
 		 * so need to do it here
 		 */
@@ -1546,17 +1567,18 @@ ia_css_reset_defaults(struct sh_css *css)
 	/* Reset everything to zero */
 	memset(&default_css, 0, sizeof(default_css));
 
-	/* Initialize the non zero values*/
+	/* Initialize the non zero values */
 	default_css.check_system_idle = true;
 	default_css.num_cont_raw_frames = NUM_CONTINUOUS_FRAMES;
 
-	/* All should be 0: but memset does it already.
+	/*
+	 * All should be 0: but memset does it already.
 	 * default_css.num_mipi_frames[N_CSI_PORTS] = 0;
 	 */
 
 	default_css.irq_type = IA_CSS_IRQ_TYPE_EDGE;
 
-	/*Set the defaults to the output */
+	/* Set the defaults to the output */
 	*css = default_css;
 }
 
@@ -1619,6 +1641,7 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	 * the SIZE_OF_XXX macro of the corresponding struct. If they are not
 	 * equal, functionality will break.
 	 */
+
 	/* Check struct sh_css_ddr_address_map */
 	COMPILATION_ERROR_IF(sizeof(struct sh_css_ddr_address_map)		!= SIZE_OF_SH_CSS_DDR_ADDRESS_MAP_STRUCT);
 	/* Check struct host_sp_queues */
@@ -1688,8 +1711,11 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	mipi_init();
 
 #ifndef ISP2401
-	/* In case this has been programmed already, update internal
-	   data structure ... DEPRECATED */
+	/*
+	 * In case this has been programmed already, update internal
+	 * data structure ...
+	 * DEPRECATED
+	 */
 	my_css.page_table_base_index = mmu_get_page_table_base_index(MMU0_ID);
 
 #endif
@@ -1752,12 +1778,13 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 		IA_CSS_LEAVE_ERR(-EBUSY);
 		return -EBUSY;
 	}
-	/* can be called here, queuing works, but:
-	   - when sp is started later, it will wipe queued items
-	   so for now we leave it for later and make sure
-	   updates are not called to frequently.
-	sh_css_init_buffer_queues();
-	*/
+	/*
+	 * can be called here, queuing works, but:
+	 * - when sp is started later, it will wipe queued items
+	 * so for now we leave it for later and make sure
+	 * updates are not called to frequently.
+	 * sh_css_init_buffer_queues();
+	 */
 
 #if defined(ISP2401)
 	gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
@@ -1798,10 +1825,12 @@ sh_css_flush(struct ia_css_acc_fw *fw)
 		my_css.flush(fw);
 }
 
-/* Mapping sp threads. Currently, this is done when a stream is created and
+/*
+ * Mapping sp threads. Currently, this is done when a stream is created and
  * pipelines are ready to be converted to sp pipelines. Be careful if you are
  * doing it from stream_create since we could run out of sp threads due to
- * allocation on inactive pipelines. */
+ * allocation on inactive pipelines.
+ */
 static int
 map_sp_threads(struct ia_css_stream *stream, bool map)
 {
@@ -1865,8 +1894,10 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	return err;
 }
 
-/* creates a host pipeline skeleton for all pipes in a stream. Called during
- * stream_create. */
+/*
+ * creates a host pipeline skeleton for all pipes in a stream. Called during
+ * stream_create.
+ */
 static int
 create_host_pipeline_structure(struct ia_css_stream *stream)
 {
@@ -1965,8 +1996,10 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 	return err;
 }
 
-/* creates a host pipeline for all pipes in a stream. Called during
- * stream_start. */
+/*
+ * creates a host pipeline for all pipes in a stream. Called during
+ * stream_start.
+ */
 static int
 create_host_pipeline(struct ia_css_stream *stream)
 {
@@ -1986,15 +2019,25 @@ create_host_pipeline(struct ia_css_stream *stream)
 	main_pipe	= stream->last_pipe;
 	pipe_id	= main_pipe->mode;
 
-	/* No continuous frame allocation for capture pipe. It uses the
-	 * "main" pipe's frames. */
+	/*
+	 * No continuous frame allocation for capture pipe. It uses the
+	 * "main" pipe's frames.
+	 */
 	if ((pipe_id == IA_CSS_PIPE_ID_PREVIEW) ||
 	    (pipe_id == IA_CSS_PIPE_ID_VIDEO)) {
-		/* About pipe_id == IA_CSS_PIPE_ID_PREVIEW && stream->config.mode != IA_CSS_INPUT_MODE_MEMORY:
-		 * The original condition pipe_id == IA_CSS_PIPE_ID_PREVIEW is too strong. E.g. in SkyCam (with memory
-		 * based input frames) there is no continuous mode and thus no need for allocated continuous frames
-		 * This is not only for SkyCam but for all preview cases that use DDR based input frames. For this
-		 * reason the stream->config.mode != IA_CSS_INPUT_MODE_MEMORY has beed added.
+		/*
+		 * About
+		 *    pipe_id == IA_CSS_PIPE_ID_PREVIEW &&
+		 *    stream->config.mode != IA_CSS_INPUT_MODE_MEMORY:
+		 *
+		 * The original condition pipe_id == IA_CSS_PIPE_ID_PREVIEW is
+		 * too strong. E.g. in SkyCam (with memory based input frames)
+		 * there is no continuous mode and thus no need for allocated
+		 * continuous frames.
+		 * This is not only for SkyCam but for all preview cases that
+		 * use DDR based input frames. For this reason the
+		 * stream->config.mode != IA_CSS_INPUT_MODE_MEMORY has beed
+		 * added.
 		 */
 		if (stream->config.continuous ||
 		    (pipe_id == IA_CSS_PIPE_ID_PREVIEW &&
@@ -2204,7 +2247,7 @@ pipe_generate_pipe_num(const struct ia_css_pipe *pipe,
 	/* Assign a new pipe_num .... search for empty place */
 	for (i = 0; i < IA_CSS_PIPELINE_NUM_MAX; i++) {
 		if (!my_css.all_pipes[i]) {
-			/*position is reserved */
+			/* position is reserved */
 			my_css.all_pipes[i] = (struct ia_css_pipe *)pipe;
 			pipe_num = i;
 			break;
@@ -2321,8 +2364,10 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 
 	switch (pipe->config.mode) {
 	case IA_CSS_PIPE_MODE_PREVIEW:
-		/* need to take into account that this function is also called
-		   on the internal copy pipe */
+		/*
+		 * need to take into account that this function is also called
+		 * on the internal copy pipe
+		 */
 		if (pipe->mode == IA_CSS_PIPE_ID_PREVIEW) {
 			ia_css_frame_free_multiple(NUM_CONTINUOUS_FRAMES,
 						   pipe->continuous_frames);
@@ -2454,8 +2499,10 @@ int ia_css_irq_translate(
 
 		switch (irq) {
 		case virq_sp:
-			/* When SP goes to idle, info is available in the
-			 * event queue. */
+			/*
+			 * When SP goes to idle, info is available in the
+			 * event queue.
+			 */
 			infos |= IA_CSS_IRQ_INFO_EVENTS_READY;
 			break;
 		case virq_isp:
@@ -2563,8 +2610,10 @@ sh_css_get_sw_interrupt_value(unsigned int irq)
 	return irq_value;
 }
 
-/* configure and load the copy binary, the next binary is used to
-   determine whether the copy binary needs to do left padding. */
+/*
+ * configure and load the copy binary, the next binary is used to
+ * determine whether the copy binary needs to do left padding.
+ */
 static int load_copy_binary(
     struct ia_css_pipe *pipe,
     struct ia_css_binary *copy_binary,
@@ -2761,7 +2810,8 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	if (err)
 		return err;
 
-	/* Note: the current selection of vf_pp binary and
+	/*
+	 * Note: the current selection of vf_pp binary and
 	 * parameterization of the preview binary contains a few pieces
 	 * of hardcoded knowledge. This needs to be cleaned up such that
 	 * the binary selection becomes more generic.
@@ -2774,7 +2824,7 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	 * The decision if the vf_pp binary is needed for YUV downscaling is
 	 * made after the preview binary selection, since some preview binaries
 	 * can perform the requested YUV downscaling.
-	 * */
+	 */
 	need_vf_pp = pipe->config.enable_dz;
 	need_vf_pp |= pipe_out_info->format != IA_CSS_FRAME_FORMAT_YUV_LINE &&
 	!(pipe_out_info->format == IA_CSS_FRAME_FORMAT_NV12 ||
@@ -2786,11 +2836,12 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 		prev_vf_info = pipe->vf_yuv_ds_input_info;
 	else
 		prev_vf_info = *pipe_out_info;
-	/* If vf_pp is needed, then preview must output yuv_line.
+	/*
+	 * If vf_pp is needed, then preview must output yuv_line.
 	 * The exception is when vf_pp is manually disabled, that is only
 	 * used in combination with a pipeline extension that requires
 	 * yuv_line as input.
-	 * */
+	 */
 	if (need_vf_pp)
 		ia_css_frame_info_set_format(&prev_vf_info,
 					     IA_CSS_FRAME_FORMAT_YUV_LINE);
@@ -2823,7 +2874,8 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	need_vf_pp |= mycs->preview_binary.out_frame_info[0].res.width != pipe_out_info->res.width;
 	need_vf_pp |= mycs->preview_binary.out_frame_info[0].res.height != pipe_out_info->res.height;
 
-	/* When vf_pp is needed, then the output format of the selected
+	/*
+	 * When vf_pp is needed, then the output format of the selected
 	 * preview binary must be yuv_line. If this is not the case,
 	 * then the preview binary selection is done again.
 	 */
@@ -2867,12 +2919,14 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	}
 
 #ifdef ISP2401
-	/* When the input system is 2401, only the Direct Sensor Mode
+	/*
+	 * When the input system is 2401, only the Direct Sensor Mode
 	 * Offline Preview uses the ISP copy binary.
 	 */
 	need_isp_copy_binary = !online && sensor;
 #else
-	/* About pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY:
+	/*
+	 * About pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY:
 	 * This is typical the case with SkyCam (which has no input system) but it also applies to all cases
 	 * where the driver chooses for memory based input frames. In these cases, a copy binary (which typical
 	 * copies sensor data to DDR) does not have much use.
@@ -3226,8 +3280,10 @@ get_crop_columns_for_bayer_order(const struct ia_css_stream_config *config)
 	return 0;
 }
 
-/* This function is to get the sum of all extra pixels in addition to the effective
- * input, it includes dvs envelop and filter run-in */
+/*
+ * This function is to get the sum of all extra pixels in addition to the effective
+ * input, it includes dvs envelop and filter run-in
+ */
 static void get_pipe_extra_pixel(struct ia_css_pipe *pipe,
 				 unsigned int *extra_row, unsigned int *extra_column)
 {
@@ -3236,7 +3292,8 @@ static void get_pipe_extra_pixel(struct ia_css_pipe *pipe,
 	unsigned int i;
 	struct ia_css_resolution dvs_env = pipe->config.dvs_envelope;
 
-	/* The dvs envelope info may not be correctly sent down via pipe config
+	/*
+	 * The dvs envelope info may not be correctly sent down via pipe config
 	 * The check is made and the correct value is populated in the binary info
 	 * Use this value when computing crop, else excess lines may get trimmed
 	 */
@@ -3330,7 +3387,8 @@ ia_css_get_crop_offsets(
 	 * 2. Require the special support for the online use cases.
 	 */
 
-	/* ISP expects GRBG bayer order, we skip one line and/or one row
+	/*
+	 * ISP expects GRBG bayer order, we skip one line and/or one row
 	 * to correct in case the input bayer order is different.
 	 */
 	column += get_crop_columns_for_bayer_order(&pipe->stream->config);
@@ -3448,7 +3506,8 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 	me->dvs_frame_delay = pipe->dvs_frame_delay;
 
 #ifdef ISP2401
-	/* When the input system is 2401, always enable 'in_frameinfo_memory'
+	/*
+	 * When the input system is 2401, always enable 'in_frameinfo_memory'
 	 * except for the following: online or continuous
 	 */
 	need_in_frameinfo_memory = !(pipe->stream->config.online ||
@@ -3504,7 +3563,8 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 		in_frame = me->stages->args.out_frame[0];
 	} else if (pipe->stream->config.continuous) {
 #ifdef ISP2401
-		/* When continuous is enabled, configure in_frame with the
+		/*
+		 * When continuous is enabled, configure in_frame with the
 		 * last pipe, which is the copy pipe.
 		 */
 		in_frame = pipe->stream->last_pipe->continuous_frames[0];
@@ -3516,8 +3576,10 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 	ia_css_pipe_util_set_output_frames(out_frames, 0,
 					   need_yuv_pp ? NULL : out_frame);
 
-	/* when the video binary supports a second output pin,
-	   it can directly produce the vf_frame.  */
+	/*
+	 * when the video binary supports a second output pin,
+	 * it can directly produce the vf_frame.
+	 */
 	if (need_vf_pp) {
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, video_binary,
 						   out_frames, in_frame, NULL);
@@ -3689,7 +3751,8 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 	ia_css_pipeline_clean(me);
 
 #ifdef ISP2401
-	/* When the input system is 2401, always enable 'in_frameinfo_memory'
+	/*
+	 * When the input system is 2401, always enable 'in_frameinfo_memory'
 	 * except for the following:
 	 * - Direct Sensor Mode Online Preview
 	 * - Buffered Sensor Mode Online Preview
@@ -3738,7 +3801,8 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 		in_frame = me->stages->args.out_frame[0];
 	} else if (pipe->stream->config.continuous) {
 #ifdef ISP2401
-		/* When continuous is enabled, configure in_frame with the
+		/*
+		 * When continuous is enabled, configure in_frame with the
 		 * last pipe, which is the copy pipe.
 		 */
 		if (continuous || !online)
@@ -3877,8 +3941,10 @@ preview_start(struct ia_css_pipe *pipe)
 					coord,
 					params);
 
-		/* make the preview pipe start with mem mode input, copy handles
-		   the actual mode */
+		/*
+		 * make the preview pipe start with mem mode input, copy handles
+		 * the actual mode
+		 */
 		preview_pipe_input_mode = IA_CSS_INPUT_MODE_MEMORY;
 	}
 
@@ -4096,8 +4162,10 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		}
 
 		for (stage = pipeline->stages; stage; stage = stage->next) {
-			/* The SP will read the params
-				after it got empty 3a and dis */
+			/*
+			 * The SP will read the params after it got
+			 * empty 3a and dis
+			 */
 			if (STATS_ENABLED(stage)) {
 				/* there is a stage that needs it */
 				return_err = ia_css_bufq_enqueue_buffer(thread_id,
@@ -4163,7 +4231,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 
 /*
  * TODO: Free up the hmm memory space.
-	 */
+ */
 int
 ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			   struct ia_css_buffer *buffer)
@@ -4230,7 +4298,8 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 		hmm_buffer_record = sh_css_hmm_buffer_record_validate(
 		    ddr_buffer_addr, buf_type);
 		if (hmm_buffer_record) {
-			/* valid hmm_buffer_record found. Save the kernel_ptr
+			/*
+			 * valid hmm_buffer_record found. Save the kernel_ptr
 			 * for validation after performing hmm_load.  The
 			 * vbuf handle and buffer_record can be released.
 			 */
@@ -4248,7 +4317,8 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			 &ddr_buffer,
 			 sizeof(struct sh_css_hmm_buffer));
 
-		/* if the kernel_ptr is 0 or an invalid, return an error.
+		/*
+		 * if the kernel_ptr is 0 or an invalid, return an error.
 		 * do not access the buffer via the kernal_ptr.
 		 */
 		if ((ddr_buffer.kernel_ptr == 0) ||
@@ -4262,8 +4332,11 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 		}
 
 		if (ddr_buffer.kernel_ptr != 0) {
-			/* buffer->exp_id : all instances to be removed later once the driver change
-			 * is completed. See patch #5758 for reference */
+			/*
+			 * buffer->exp_id : all instances to be removed later
+			 * once the driver change is completed. See patch #5758
+			 * for reference
+			 */
 			buffer->exp_id = 0;
 			buffer->driver_cookie = ddr_buffer.cookie_ptr;
 			buffer->timing_data = ddr_buffer.timing_data;
@@ -4279,8 +4352,10 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
 				if (pipe && pipe->stop_requested) {
 #if !defined(ISP2401)
-					/* free mipi frames only for old input system
-					 * for 2401 it is done in ia_css_stream_destroy call
+					/*
+					 * free mipi frames only for old input
+					 * system for 2401 it is done in
+					 * ia_css_stream_destroy call
 					 */
 					return_err = free_mipi_frames(pipe);
 					if (return_err) {
@@ -4391,22 +4466,22 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
  * 4) "enum ia_css_event_type convert_event_sp_to_host_domain"	(sh_css.c)
  */
 static enum ia_css_event_type convert_event_sp_to_host_domain[] = {
-	IA_CSS_EVENT_TYPE_OUTPUT_FRAME_DONE,	/** Output frame ready. */
-	IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE,	/** Second output frame ready. */
-	IA_CSS_EVENT_TYPE_VF_OUTPUT_FRAME_DONE,	/** Viewfinder Output frame ready. */
-	IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE,	/** Second viewfinder Output frame ready. */
-	IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE,	/** Indication that 3A statistics are available. */
-	IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE,	/** Indication that DIS statistics are available. */
-	IA_CSS_EVENT_TYPE_PIPELINE_DONE,	/** Pipeline Done event, sent after last pipeline stage. */
-	IA_CSS_EVENT_TYPE_FRAME_TAGGED,		/** Frame tagged. */
-	IA_CSS_EVENT_TYPE_INPUT_FRAME_DONE,	/** Input frame ready. */
-	IA_CSS_EVENT_TYPE_METADATA_DONE,	/** Metadata ready. */
-	IA_CSS_EVENT_TYPE_LACE_STATISTICS_DONE,	/** Indication that LACE statistics are available. */
-	IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE,	/** Extension stage executed. */
-	IA_CSS_EVENT_TYPE_TIMER,		/** Timing measurement data. */
-	IA_CSS_EVENT_TYPE_PORT_EOF,		/** End Of Frame event, sent when in buffered sensor mode. */
-	IA_CSS_EVENT_TYPE_FW_WARNING,		/** Performance warning encountered by FW */
-	IA_CSS_EVENT_TYPE_FW_ASSERT,		/** Assertion hit by FW */
+	IA_CSS_EVENT_TYPE_OUTPUT_FRAME_DONE,	/* Output frame ready. */
+	IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE,	/* Second output frame ready. */
+	IA_CSS_EVENT_TYPE_VF_OUTPUT_FRAME_DONE,	/* Viewfinder Output frame ready. */
+	IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE,	/* Second viewfinder Output frame ready. */
+	IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE,	/* Indication that 3A statistics are available. */
+	IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE,	/* Indication that DIS statistics are available. */
+	IA_CSS_EVENT_TYPE_PIPELINE_DONE,	/* Pipeline Done event, sent after last pipeline stage. */
+	IA_CSS_EVENT_TYPE_FRAME_TAGGED,		/* Frame tagged. */
+	IA_CSS_EVENT_TYPE_INPUT_FRAME_DONE,	/* Input frame ready. */
+	IA_CSS_EVENT_TYPE_METADATA_DONE,	/* Metadata ready. */
+	IA_CSS_EVENT_TYPE_LACE_STATISTICS_DONE,	/* Indication that LACE statistics are available. */
+	IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE,	/* Extension stage executed. */
+	IA_CSS_EVENT_TYPE_TIMER,		/* Timing measurement data. */
+	IA_CSS_EVENT_TYPE_PORT_EOF,		/* End Of Frame event, sent when in buffered sensor mode. */
+	IA_CSS_EVENT_TYPE_FW_WARNING,		/* Performance warning encountered by FW */
+	IA_CSS_EVENT_TYPE_FW_ASSERT,		/* Assertion hit by FW */
 	0,					/* error if sp passes  SH_CSS_SP_EVENT_NR_OF_TYPES as a valid event. */
 };
 
@@ -4417,13 +4492,15 @@ ia_css_dequeue_psys_event(struct ia_css_event *event)
 	u8 payload[4] = {0, 0, 0, 0};
 	int ret_err;
 
-	/*TODO:
+	/*
+	 * TODO:
 	 * a) use generic decoding function , same as the one used by sp.
 	 * b) group decode and dequeue into eventQueue module
 	 *
 	 * We skip the IA_CSS_ENTER logging call
 	 * to avoid flooding the logs when the host application
-	 * uses polling. */
+	 * uses polling.
+	 */
 	if (!event)
 		return -EINVAL;
 
@@ -4442,9 +4519,11 @@ ia_css_dequeue_psys_event(struct ia_css_event *event)
 	ia_css_bufq_enqueue_psys_event(
 	    IA_CSS_PSYS_SW_EVENT_EVENT_DEQUEUED, 0, 0, 0);
 
-	/* Events are decoded into 4 bytes of payload, the first byte
+	/*
+	 * Events are decoded into 4 bytes of payload, the first byte
 	 * contains the sp event type. This is converted to a host enum.
-	 * TODO: can this enum conversion be eliminated */
+	 * TODO: can this enum conversion be eliminated
+	 */
 	event->type = convert_event_sp_to_host_domain[payload[0]];
 	/* Some sane default values since not all events use all fields. */
 	event->pipe = NULL;
@@ -4457,7 +4536,10 @@ ia_css_dequeue_psys_event(struct ia_css_event *event)
 	event->timer_subcode = 0;
 
 	if (event->type == IA_CSS_EVENT_TYPE_TIMER) {
-		/* timer event ??? get the 2nd event and decode the data into the event struct */
+		/*
+		 * timer event ??? get the 2nd event and decode the data
+		 * into the event struct
+		 */
 		u32 tmp_data;
 		/* 1st event: LSB 16-bit timer data and code */
 		event->timer_data = ((payload[1] & 0xFF) | ((payload[3] & 0xFF) << 8));
@@ -4466,8 +4548,10 @@ ia_css_dequeue_psys_event(struct ia_css_event *event)
 		ret_err = ia_css_bufq_dequeue_psys_event(payload);
 		if (ret_err) {
 			/* no 2nd event ??? an error */
-			/* Putting IA_CSS_ERROR is resulting in failures in
-			 * Merrifield smoke testing  */
+			/*
+			 * Putting IA_CSS_ERROR is resulting in failures in
+			 * Merrifield smoke testing
+			 */
 			IA_CSS_WARNING("Timer: Error de-queuing the 2nd TIMER event!!!\n");
 			return ret_err;
 		}
@@ -4481,11 +4565,15 @@ ia_css_dequeue_psys_event(struct ia_css_event *event)
 			event->timer_data |= (tmp_data << 16);
 			event->timer_subcode = payload[2];
 		} else {
-		/* It's a non timer event. So clear first half of the timer event data.
-		* If the second part of the TIMER event is not received, we discard
-		* the first half of the timer data and process the non timer event without
-		* affecting the flow. So the non timer event falls through
-		* the code. */
+			/*
+			 * It's a non timer event. So clear first half of the
+			 * timer event data.
+			 * If the second part of the TIMER event is not
+			 * received, we discard the first half of the timer
+			 * data and process the non timer event without
+			 * affecting the flow. So the non timer event falls
+			 * through the code.
+			 */
 			event->timer_data = 0;
 			event->timer_code = 0;
 			event->timer_subcode = 0;
@@ -4506,9 +4594,11 @@ ia_css_dequeue_psys_event(struct ia_css_event *event)
 		event->fw_assert_line_no = (payload[2] << 8) + payload[3];
 		/* payload[2] is line_no>>8, payload[3] is line_no&0xff */
 	} else if (event->type != IA_CSS_EVENT_TYPE_TIMER) {
-		/* pipe related events.
+		/*
+		 * pipe related events.
 		 * payload[1] contains the pipe_num,
-		 * payload[2] contains the pipe_id. These are different. */
+		 * payload[2] contains the pipe_id. These are different.
+		 */
 		event->pipe = find_pipe_by_num(payload[1]);
 		pipe_id = (enum ia_css_pipe_id)payload[2];
 		/* Check to see if pipe still exists */
@@ -4560,9 +4650,11 @@ ia_css_dequeue_isys_event(struct ia_css_event *event)
 	u8 payload[4] = {0, 0, 0, 0};
 	int err = 0;
 
-	/* We skip the IA_CSS_ENTER logging call
+	/*
+	 * We skip the IA_CSS_ENTER logging call
 	 * to avoid flooding the logs when the host application
-	 * uses polling. */
+	 * uses polling.
+	 */
 	if (!event)
 		return -EINVAL;
 
@@ -4686,7 +4778,8 @@ sh_css_pipe_start(struct ia_css_stream *stream)
 		return err;
 	}
 
-	/* Force ISP parameter calculation after a mode change
+	/*
+	 * Force ISP parameter calculation after a mode change
 	 * Acceleration API examples pass NULL for stream but they
 	 * don't use ISP parameters anyway. So this should be okay.
 	 * The SP binary (jpeg) copy does not use any parameters.
@@ -5103,11 +5196,13 @@ sh_css_pipe_get_shading_info(struct ia_css_pipe *pipe,
 						     (const struct ia_css_stream_config *)&pipe->stream->config,
 						     shading_info, pipe_config);
 
-		/* Other function calls can be added here when other shading correction types will be added
-		 * in the future.
+		/*
+		 * Other function calls can be added here when other shading
+		 * correction types will be added in the future.
 		 */
 	} else {
-		/* When the pipe does not have a binary which has the shading
+		/*
+		 * When the pipe does not have a binary which has the shading
 		 * correction, this function does not need to fill the shading
 		 * information. It is not a error case, and then
 		 * this function should return 0.
@@ -5220,7 +5315,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 	IA_CSS_ENTER_PRIVATE("");
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_VIDEO);
-	/* we only test the video_binary because offline video doesn't need a
+	/*
+	 * we only test the video_binary because offline video doesn't need a
 	 * vf_pp binary and online does not (always use) the copy_binary.
 	 * All are always reset at the same time anyway.
 	 */
@@ -5333,7 +5429,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		if (err)
 			return err;
 
-		/* In the case where video_vf_info is not NULL, this allows
+		/*
+		 * In the case where video_vf_info is not NULL, this allows
 		 * us to find a potential video library with desired vf format.
 		 * If success, no vf_pp binary is needed.
 		 * If failed, we will look up video binary with YUV_LINE vf format
@@ -5348,17 +5445,23 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			else
 				return err;
 		} else if (video_vf_info) {
-			/* The first video binary lookup is successful, but we may
-			 * still need vf_pp binary based on additiona check */
+			/*
+			 * The first video binary lookup is successful, but we
+			 * may still need vf_pp binary based on additional check
+			 */
 			num_output_pins = mycs->video_binary.info->num_output_pins;
 			vf_ds_log2 = mycs->video_binary.vf_downscale_log2;
 
-			/* If the binary has dual output pins, we need vf_pp if the resolution
-			* is different. */
+			/*
+			 * If the binary has dual output pins, we need vf_pp
+			 * if the resolution is different.
+			 */
 			need_vf_pp |= ((num_output_pins == 2) && vf_res_different_than_output);
 
-			/* If the binary has single output pin, we need vf_pp if additional
-			* scaling is needed for vf */
+			/*
+			 * If the binary has single output pin, we need vf_pp
+			 * if additional scaling is needed for vf
+			 */
 			need_vf_pp |= ((num_output_pins == 1) &&
 				       ((video_vf_info->res.width << vf_ds_log2 != pipe_out_info->res.width) ||
 					(video_vf_info->res.height << vf_ds_log2 != pipe_out_info->res.height)));
@@ -5388,19 +5491,25 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		}
 	}
 
-	/* If a video binary does not use a ref_frame, we set the frame delay
-	 * to 0. This is the case for the 1-stage low-power video binary. */
+	/*
+	 * If a video binary does not use a ref_frame, we set the frame delay
+	 * to 0. This is the case for the 1-stage low-power video binary.
+	 */
 	if (!mycs->video_binary.info->sp.enable.ref_frame)
 		pipe->dvs_frame_delay = 0;
 
-	/* The delay latency determines the number of invalid frames after
-	 * a stream is started. */
+	/*
+	 * The delay latency determines the number of invalid frames after
+	 * a stream is started.
+	 */
 	pipe->num_invalid_frames = pipe->dvs_frame_delay;
 	pipe->info.num_invalid_frames = pipe->num_invalid_frames;
 
-	/* Viewfinder frames also decrement num_invalid_frames. If the pipe
+	/*
+	 * Viewfinder frames also decrement num_invalid_frames. If the pipe
 	 * outputs a viewfinder output, then we need double the number of
-	 * invalid frames */
+	 * invalid frames
+	 */
 	if (video_vf_info)
 		pipe->num_invalid_frames *= 2;
 
@@ -5412,7 +5521,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 #if !defined(ISP2401)
 	/* Copy */
 	if (!online && !continuous) {
-		/* TODO: what exactly needs doing, prepend the copy binary to
+		/*
+		 * TODO: what exactly needs doing, prepend the copy binary to
 		 *	 video base this only on !online?
 		 */
 		err = load_copy_binary(pipe,
@@ -5435,8 +5545,11 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 							&mycs->video_binary.vf_frame_info,
 							pipe_vf_out_info);
 		} else {
-			/* output from main binary is not yuv line. currently this is
-			 * possible only when bci is enabled on vfpp output */
+			/*
+			 * output from main binary is not yuv line. currently
+			 * this is possible only when bci is enabled on vfpp
+			 * output
+			 */
 			assert(pipe->config.enable_vfpp_bci);
 			ia_css_pipe_get_yuvscaler_binarydesc(pipe, &vf_pp_descr,
 							     &mycs->video_binary.vf_frame_info,
@@ -5598,8 +5711,10 @@ static int video_start(struct ia_css_pipe *pipe)
 					coord,
 					params);
 
-		/* make the video pipe start with mem mode input, copy handles
-		   the actual mode */
+		/*
+		 * make the video pipe start with mem mode input, copy handles
+		 * the actual mode
+		 */
 		video_pipe_input_mode = IA_CSS_INPUT_MODE_MEMORY;
 	}
 
@@ -5857,9 +5972,11 @@ static int load_primary_binaries(
 	}
 	need_pp = need_capture_pp(pipe);
 
-	/* we use the vf output info to get the primary/capture_pp binary
-	   configured for vf_veceven. It will select the closest downscaling
-	   factor. */
+	/*
+	 * we use the vf output info to get the primary/capture_pp binary
+	 * configured for vf_veceven. It will select the closest downscaling
+	 * factor.
+	 */
 	vf_info = *pipe_vf_out_info;
 
 	/*
@@ -5871,13 +5988,15 @@ static int load_primary_binaries(
 	 * required. This should not be considered as a clean solution.
 	 * Proper investigation should be done to come up with the clean
 	 * solution.
-	 * */
+	 */
 	ia_css_frame_info_set_format(&vf_info, IA_CSS_FRAME_FORMAT_YUV_LINE);
 
-	/* TODO: All this yuv_scaler and capturepp calculation logic
+	/*
+	 * TODO: All this yuv_scaler and capturepp calculation logic
 	 * can be shared later. Capture_pp is also a yuv_scale binary
 	 * with extra XNR funcionality. Therefore, it can be made as the
-	 * first step of the cascade. */
+	 * first step of the cascade.
+	 */
 	capt_pp_out_info = pipe->out_yuv_ds_input_info;
 	capt_pp_out_info.format = IA_CSS_FRAME_FORMAT_YUV420;
 	capt_pp_out_info.res.width  /= MAX_PREFERRED_YUV_DS_PER_STEP;
@@ -6023,15 +6142,15 @@ static int load_primary_binaries(
 		vf_pp_in_info = &mycs->primary_binary[mycs->num_primary_stage - 1].vf_frame_info;
 
 	/*
-	    * WARNING: The #if def flag has been added below as a
-	    * temporary solution to solve the problem of enabling the
-	    * view finder in a single binary in a capture flow. The
-	    * vf-pp stage has been removed for Skycam in the solution
-	    * provided. The vf-pp stage should be re-introduced when
-	    * required. Thisshould not be considered as a clean solution.
-	    * Proper  * investigation should be done to come up with the clean
-	    * solution.
-	    * */
+	 * WARNING: The #if def flag has been added below as a
+	 * temporary solution to solve the problem of enabling the
+	 * view finder in a single binary in a capture flow. The
+	 * vf-pp stage has been removed for Skycam in the solution
+	 * provided. The vf-pp stage should be re-introduced when
+	 * required. Thisshould not be considered as a clean solution.
+	 * Proper  * investigation should be done to come up with the clean
+	 * solution.
+	 */
 	if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0]) {
 		struct ia_css_binary_descr vf_pp_descr;
 
@@ -6049,9 +6168,10 @@ static int load_primary_binaries(
 		return err;
 
 #ifdef ISP2401
-	/* When the input system is 2401, only the Direct Sensor Mode
-	    * Offline Capture uses the ISP copy binary.
-	    */
+	/*
+	 * When the input system is 2401, only the Direct Sensor Mode
+	 * Offline Capture uses the ISP copy binary.
+	 */
 	need_isp_copy_binary = !online && sensor;
 #else
 	need_isp_copy_binary = !online && !continuous && !memory;
@@ -6105,17 +6225,19 @@ allocate_delay_frames(struct ia_css_pipe *pipe)
 		struct ia_css_video_settings *mycs_video = &pipe->pipe_settings.video;
 
 		ref_info = mycs_video->video_binary.internal_frame_info;
-		/*The ref frame expects
-		    *	1. Y plane
-		    *	2. UV plane with line interleaving, like below
-		    *		UUUUUU(width/2 times) VVVVVVVV..(width/2 times)
-		    *
-		    *	This format is not YUV420(which has Y, U and V planes).
-		    *	Its closer to NV12, except that the UV plane has UV
-		    *	interleaving, like UVUVUVUVUVUVUVUVU...
-		    *
-		    *	TODO: make this ref_frame format as a separate frame format
-		    */
+
+		/*
+		 * The ref frame expects
+		 * 1. Y plane
+		 * 2. UV plane with line interleaving, like below
+		 *	UUUUUU(width/2 times) VVVVVVVV..(width/2 times)
+		 *
+		 * This format is not YUV420(which has Y, U and V planes).
+		 * Its closer to NV12, except that the UV plane has UV
+		 * interleaving, like UVUVUVUVUVUVUVUVU...
+		 *
+		 * TODO: make this ref_frame format as a separate frame format
+		 */
 		ref_info.format        = IA_CSS_FRAME_FORMAT_NV12;
 		delay_frames = mycs_video->delay_frames;
 	}
@@ -6124,17 +6246,19 @@ allocate_delay_frames(struct ia_css_pipe *pipe)
 		struct ia_css_preview_settings *mycs_preview = &pipe->pipe_settings.preview;
 
 		ref_info = mycs_preview->preview_binary.internal_frame_info;
-		/*The ref frame expects
-		    *	1. Y plane
-		    *	2. UV plane with line interleaving, like below
-		    *		UUUUUU(width/2 times) VVVVVVVV..(width/2 times)
-		    *
-		    *	This format is not YUV420(which has Y, U and V planes).
-		    *	Its closer to NV12, except that the UV plane has UV
-		    *	interleaving, like UVUVUVUVUVUVUVUVU...
-		    *
-		    *	TODO: make this ref_frame format as a separate frame format
-		    */
+
+		/*
+		 * The ref frame expects
+		 * 1. Y plane
+		 * 2. UV plane with line interleaving, like below
+		 *	UUUUUU(width/2 times) VVVVVVVV..(width/2 times)
+		 *
+		 * This format is not YUV420(which has Y, U and V planes).
+		 * Its closer to NV12, except that the UV plane has UV
+		 * interleaving, like UVUVUVUVUVUVUVUVU...
+		 *
+		 * TODO: make this ref_frame format as a separate frame format
+		 */
 		ref_info.format        = IA_CSS_FRAME_FORMAT_NV12;
 		delay_frames = mycs_preview->delay_frames;
 	}
@@ -6591,9 +6715,11 @@ need_yuv_scaler_stage(const struct ia_css_pipe *pipe)
 	return false;
 }
 
-/* TODO: it is temporarily created from ia_css_pipe_create_cas_scaler_desc */
-/* which has some hard-coded knowledge which prevents reuse of the function. */
-/* Later, merge this with ia_css_pipe_create_cas_scaler_desc */
+/*
+ * TODO: it is temporarily created from ia_css_pipe_create_cas_scaler_desc
+ * which has some hard-coded knowledge which prevents reuse of the function.
+ * Later, merge this with ia_css_pipe_create_cas_scaler_desc
+ */
 static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	    struct ia_css_frame_info *cas_scaler_in_info,
 	    struct ia_css_frame_info *cas_scaler_out_info,
@@ -6990,22 +7116,22 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 
 #if defined(ISP2401)
 	/*
-	    * NOTES
-	    * - Why does the "yuvpp" pipe needs "isp_copy_binary" (i.e. ISP Copy) when
-	    *   its input is "ATOMISP_INPUT_FORMAT_YUV422_8"?
-	    *
-	    *   In most use cases, the first stage in the "yuvpp" pipe is the "yuv_scale_
-	    *   binary". However, the "yuv_scale_binary" does NOT support the input-frame
-	    *   format as "IA_CSS_STREAM _FORMAT_YUV422_8".
-	    *
-	    *   Hence, the "isp_copy_binary" is required to be present in front of the "yuv
-	    *   _scale_binary". It would translate the input-frame to the frame formats that
-	    *   are supported by the "yuv_scale_binary".
-	    *
-	    *   Please refer to "FrameWork/css/isp/pipes/capture_pp/capture_pp_1.0/capture_
-	    *   pp_defs.h" for the list of input-frame formats that are supported by the
-	    *   "yuv_scale_binary".
-	    */
+	 * NOTES
+	 * - Why does the "yuvpp" pipe needs "isp_copy_binary" (i.e. ISP Copy) when
+	 *   its input is "ATOMISP_INPUT_FORMAT_YUV422_8"?
+	 *
+	 *   In most use cases, the first stage in the "yuvpp" pipe is the "yuv_scale_
+	 *   binary". However, the "yuv_scale_binary" does NOT support the input-frame
+	 *   format as "IA_CSS_STREAM _FORMAT_YUV422_8".
+	 *
+	 *   Hence, the "isp_copy_binary" is required to be present in front of the "yuv
+	 *   _scale_binary". It would translate the input-frame to the frame formats that
+	 *   are supported by the "yuv_scale_binary".
+	 *
+	 *   Please refer to "FrameWork/css/isp/pipes/capture_pp/capture_pp_1.0/capture_
+	 *   pp_defs.h" for the list of input-frame formats that are supported by the
+	 *   "yuv_scale_binary".
+	 */
 	need_isp_copy_binary =
 	    (pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_YUV422_8);
 #else  /* !ISP2401 */
@@ -7021,23 +7147,23 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 			goto ERR;
 
 		/*
-		    * NOTES
-		    * - Why is "pipe->pipe_settings.capture.copy_binary.online" specified?
-		    *
-		    *   In some use cases, the first stage in the "yuvpp" pipe is the
-		    *   "isp_copy_binary". The "isp_copy_binary" is designed to process
-		    *   the input from either the system DDR or from the IPU internal VMEM.
-		    *   So it provides the flag "online" to specify where its input is from,
-		    *   i.e.:
-		    *
-		    *      (1) "online <= true", the input is from the IPU internal VMEM.
-		    *      (2) "online <= false", the input is from the system DDR.
-		    *
-		    *   In other use cases, the first stage in the "yuvpp" pipe is the
-		    *   "yuv_scale_binary". "The "yuv_scale_binary" is designed to process the
-		    *   input ONLY from the system DDR. So it does not provide the flag "online"
-		    *   to specify where its input is from.
-		    */
+		 * NOTES
+		 * - Why is "pipe->pipe_settings.capture.copy_binary.online" specified?
+		 *
+		 *   In some use cases, the first stage in the "yuvpp" pipe is the
+		 *   "isp_copy_binary". The "isp_copy_binary" is designed to process
+		 *   the input from either the system DDR or from the IPU internal VMEM.
+		 *   So it provides the flag "online" to specify where its input is from,
+		 *   i.e.:
+		 *
+		 *      (1) "online <= true", the input is from the IPU internal VMEM.
+		 *      (2) "online <= false", the input is from the system DDR.
+		 *
+		 *   In other use cases, the first stage in the "yuvpp" pipe is the
+		 *   "yuv_scale_binary". "The "yuv_scale_binary" is designed to process the
+		 *   input ONLY from the system DDR. So it does not provide the flag "online"
+		 *   to specify where its input is from.
+		 */
 		pipe->pipe_settings.capture.copy_binary.online = pipe->stream->config.online;
 	}
 
@@ -7230,8 +7356,11 @@ sh_css_pipe_load_binaries(struct ia_css_pipe *pipe)
 	}
 	if (err) {
 		if (sh_css_pipe_unload_binaries(pipe)) {
-			/* currently css does not support multiple error returns in a single function,
-			    * using -EINVAL in this case */
+			/*
+			 * currently css does not support multiple error
+			 * returns in a single function, using -EINVAL in
+			 * this case
+			 */
 			err = -EINVAL;
 		}
 	}
@@ -7282,12 +7411,13 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 	num_output_stage   = pipe->pipe_settings.yuvpp.num_output;
 
 #ifdef ISP2401
-	/* When the input system is 2401, always enable 'in_frameinfo_memory'
-	    * except for the following:
-	    * - Direct Sensor Mode Online Capture
-	    * - Direct Sensor Mode Continuous Capture
-	    * - Buffered Sensor Mode Continuous Capture
-	    */
+	/*
+	 * When the input system is 2401, always enable 'in_frameinfo_memory'
+	 * except for the following:
+	 * - Direct Sensor Mode Online Capture
+	 * - Direct Sensor Mode Continuous Capture
+	 * - Buffered Sensor Mode Continuous Capture
+	 */
 	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 	buffered_sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
 	online = pipe->stream->config.online;
@@ -7298,19 +7428,23 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 	/* Construct in_frame info (only in case we have dynamic input */
 	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 #endif
-	/* the input frame can come from:
-	    *  a) memory: connect yuvscaler to me->in_frame
-	    *  b) sensor, via copy binary: connect yuvscaler to copy binary later on */
+	/*
+	 * the input frame can come from:
+	 *
+	 *  a) memory: connect yuvscaler to me->in_frame
+	 *  b) sensor, via copy binary: connect yuvscaler to copy binary later
+	 *     on
+	 */
 	if (need_in_frameinfo_memory) {
 		/* TODO: improve for different input formats. */
 
 		/*
-		    * "pipe->stream->config.input_config.format" represents the sensor output
-		    * frame format, e.g. YUV422 8-bit.
-		    *
-		    * "in_frame_format" represents the imaging pipe's input frame format, e.g.
-		    * Bayer-Quad RAW.
-		    */
+		 * "pipe->stream->config.input_config.format" represents the sensor output
+		 * frame format, e.g. YUV422 8-bit.
+		 *
+		 * "in_frame_format" represents the imaging pipe's input frame format, e.g.
+		 * Bayer-Quad RAW.
+		 */
 		int in_frame_format;
 
 		if (pipe->stream->config.input_config.format ==
@@ -7319,22 +7453,22 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 		} else if (pipe->stream->config.input_config.format ==
 			    ATOMISP_INPUT_FORMAT_YUV422_8) {
 			/*
-			    * When the sensor output frame format is "ATOMISP_INPUT_FORMAT_YUV422_8",
-			    * the "isp_copy_var" binary is selected as the first stage in the yuvpp
-			    * pipe.
-			    *
-			    * For the "isp_copy_var" binary, it reads the YUV422-8 pixels from
-			    * the frame buffer (at DDR) to the frame-line buffer (at VMEM).
-			    *
-			    * By now, the "isp_copy_var" binary does NOT provide a separated
-			    * frame-line buffer to store the YUV422-8 pixels. Instead, it stores
-			    * the YUV422-8 pixels in the frame-line buffer which is designed to
-			    * store the Bayer-Quad RAW pixels.
-			    *
-			    * To direct the "isp_copy_var" binary reading from the RAW frame-line
-			    * buffer, its input frame format must be specified as "IA_CSS_FRAME_
-			    * FORMAT_RAW".
-			    */
+			 * When the sensor output frame format is "ATOMISP_INPUT_FORMAT_YUV422_8",
+			 * the "isp_copy_var" binary is selected as the first stage in the yuvpp
+			 * pipe.
+			 *
+			 * For the "isp_copy_var" binary, it reads the YUV422-8 pixels from
+			 * the frame buffer (at DDR) to the frame-line buffer (at VMEM).
+			 *
+			 * By now, the "isp_copy_var" binary does NOT provide a separated
+			 * frame-line buffer to store the YUV422-8 pixels. Instead, it stores
+			 * the YUV422-8 pixels in the frame-line buffer which is designed to
+			 * store the Bayer-Quad RAW pixels.
+			 *
+			 * To direct the "isp_copy_var" binary reading from the RAW frame-line
+			 * buffer, its input frame format must be specified as "IA_CSS_FRAME_
+			 * FORMAT_RAW".
+			 */
 			in_frame_format = IA_CSS_FRAME_FORMAT_RAW;
 		} else {
 			in_frame_format = IA_CSS_FRAME_FORMAT_NV12;
@@ -7633,13 +7767,14 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	ia_css_pipe_util_create_output_frames(out_frames);
 
 #ifdef ISP2401
-	/* When the input system is 2401, always enable 'in_frameinfo_memory'
-	    * except for the following:
-	    * - Direct Sensor Mode Online Capture
-	    * - Direct Sensor Mode Online Capture
-	    * - Direct Sensor Mode Continuous Capture
-	    * - Buffered Sensor Mode Continuous Capture
-	    */
+	/*
+	 * When the input system is 2401, always enable 'in_frameinfo_memory'
+	 * except for the following:
+	 * - Direct Sensor Mode Online Capture
+	 * - Direct Sensor Mode Online Capture
+	 * - Direct Sensor Mode Continuous Capture
+	 * - Buffered Sensor Mode Continuous Capture
+	 */
 	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
 	buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 	online = pipe->stream->config.online;
@@ -7772,15 +7907,15 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 				local_out_frame = NULL;
 			ia_css_pipe_util_set_output_frames(out_frames, 0, local_out_frame);
 			/*
-			    * WARNING: The #if def flag has been added below as a
-			    * temporary solution to solve the problem of enabling the
-			    * view finder in a single binary in a capture flow. The
-			    * vf-pp stage has been removed from Skycam in the solution
-			    * provided. The vf-pp stage should be re-introduced when
-			    * required. This  * should not be considered as a clean solution.
-			    * Proper investigation should be done to come up with the clean
-			    * solution.
-			    * */
+			 * WARNING: The #if def flag has been added below as a
+			 * temporary solution to solve the problem of enabling the
+			 * view finder in a single binary in a capture flow. The
+			 * vf-pp stage has been removed from Skycam in the solution
+			 * provided. The vf-pp stage should be re-introduced when
+			 * required. This  * should not be considered as a clean solution.
+			 * Proper investigation should be done to come up with the clean
+			 * solution.
+			 */
 			ia_css_pipe_get_generic_stage_desc(&stage_desc,
 							   primary_binary[i],
 							   out_frames,
@@ -7794,8 +7929,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 				return err;
 			}
 		}
-		/* If we use copy iso primary,
-		    the input must be yuv iso raw */
+		/* If we use copy iso primary, the input must be yuv iso raw */
 		current_stage->args.copy_vf =
 		    primary_binary[0]->info->sp.pipeline.mode ==
 		    IA_CSS_BINARY_MODE_COPY;
@@ -7920,14 +8054,14 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	}
 
 	/*
-	    * WARNING: The #if def flag has been added below as a
-	    * temporary solution to solve the problem of enabling the
-	    * view finder in a single binary in a capture flow. The vf-pp
-	    * stage has been removed from Skycam in the solution provided.
-	    * The vf-pp stage should be re-introduced when required. This
-	    * should not be considered as a clean solution. Proper
-	    * investigation should be done to come up with the clean solution.
-	    * */
+	 * WARNING: The #if def flag has been added below as a
+	 * temporary solution to solve the problem of enabling the
+	 * view finder in a single binary in a capture flow. The vf-pp
+	 * stage has been removed from Skycam in the solution provided.
+	 * The vf-pp stage should be re-introduced when required. This
+	 * should not be considered as a clean solution. Proper
+	 * investigation should be done to come up with the clean solution.
+	 */
 	if (mode != IA_CSS_CAPTURE_MODE_RAW &&
 	    mode != IA_CSS_CAPTURE_MODE_BAYER &&
 	    current_stage && vf_frame) {
@@ -8021,10 +8155,10 @@ static int capture_start(struct ia_css_pipe *pipe)
 
 #if !defined(ISP2401)
 	/*
-	    * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,
-	    * which is currently done in start_binary(); but COPY pipe contains no binary,
-	    * and does not call start_binary(); so we need to configure the rx here.
-	    */
+	 * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,
+	 * which is currently done in start_binary(); but COPY pipe contains no binary,
+	 * and does not call start_binary(); so we need to configure the rx here.
+	 */
 	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY &&
 	    pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
@@ -8140,7 +8274,8 @@ append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware)
 	while (*l)
 		l = &(*l)->next;
 	*l = firmware;
-	/*firmware->next = NULL;*/ /* when multiple acc extensions are loaded, 'next' can be not NULL */
+	/* when multiple acc extensions are loaded, 'next' can be not NULL */
+	/*firmware->next = NULL;*/
 	IA_CSS_LEAVE_PRIVATE("");
 }
 
@@ -8326,9 +8461,9 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
 }
 
 /*
-    * @brief Tag a specific frame in continuous capture.
-    * Refer to "sh_css_internal.h" for details.
-    */
+ * @brief Tag a specific frame in continuous capture.
+ * Refer to "sh_css_internal.h" for details.
+ */
 int ia_css_stream_capture_frame(struct ia_css_stream *stream,
 				unsigned int exp_id)
 {
@@ -8355,10 +8490,12 @@ int ia_css_stream_capture_frame(struct ia_css_stream *stream,
 	sh_css_create_tag_descr(0, 0, 0, exp_id, &tag_descr);
 	/* Encode the tag descriptor into a 32-bit value */
 	encoded_tag_descr = sh_css_encode_tag_descr(&tag_descr);
-	/* Enqueue the encoded tag to the host2sp queue.
-	    * Note: The pipe and stage IDs for tag_cmd queue are hard-coded to 0
-	    * on both host and the SP side.
-	    * It is mainly because it is enough to have only one tag_cmd queue */
+	/*
+	 * Enqueue the encoded tag to the host2sp queue.
+	 * Note: The pipe and stage IDs for tag_cmd queue are hard-coded to 0
+	 * on both host and the SP side.
+	 * It is mainly because it is enough to have only one tag_cmd queue
+	 */
 	err = ia_css_bufq_enqueue_tag_cmd(encoded_tag_descr);
 
 	IA_CSS_LEAVE_ERR(err);
@@ -8366,9 +8503,9 @@ int ia_css_stream_capture_frame(struct ia_css_stream *stream,
 }
 
 /*
-    * @brief Configure the continuous capture.
-    * Refer to "sh_css_internal.h" for details.
-    */
+ * @brief Configure the continuous capture.
+ * Refer to "sh_css_internal.h" for details.
+ */
 int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
 			  unsigned int skip, int offset)
 {
@@ -8404,10 +8541,12 @@ int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
 		return -EBUSY;
 	}
 
-	/* Enqueue the encoded tag to the host2sp queue.
-	    * Note: The pipe and stage IDs for tag_cmd queue are hard-coded to 0
-	    * on both host and the SP side.
-	    * It is mainly because it is enough to have only one tag_cmd queue */
+	/*
+	 * Enqueue the encoded tag to the host2sp queue.
+	 * Note: The pipe and stage IDs for tag_cmd queue are hard-coded to 0
+	 * on both host and the SP side.
+	 * It is mainly because it is enough to have only one tag_cmd queue
+	 */
 	return_err = ia_css_bufq_enqueue_tag_cmd((uint32_t)encoded_tag_descr);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -8552,9 +8691,11 @@ void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config)
 	stream_config->online = true;
 	stream_config->left_padding = -1;
 	stream_config->pixels_per_clock = 1;
-	/* temporary default value for backwards compatibility.
-	    * This field used to be hardcoded within CSS but this has now
-	    * been moved to the stream_config struct. */
+	/*
+	 * temporary default value for backwards compatibility.
+	 * This field used to be hardcoded within CSS but this has now
+	 * been moved to the stream_config struct.
+	 */
 	stream_config->source.port.rxcount = 0x04040404;
 }
 
@@ -8568,7 +8709,7 @@ ia_css_acc_pipe_create(struct ia_css_pipe *pipe)
 		return -EINVAL;
 	}
 
-	/* There is not meaning for num_execs = 0 semantically. Run atleast once. */
+	/* There is not meaning for num_execs = 0 semantically. Run at least once. */
 	if (pipe->config.acc_num_execs == 0)
 		pipe->config.acc_num_execs = 1;
 
@@ -8639,9 +8780,11 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 		ia_css_pipe_extra_config_defaults(&internal_pipe->extra_config);
 
 	if (config->mode == IA_CSS_PIPE_MODE_ACC) {
-		/* Temporary hack to migrate acceleration to CSS 2.0.
-		    * In the future the code for all pipe types should be
-		    * unified. */
+		/*
+		 * Temporary hack to migrate acceleration to CSS 2.0.
+		 * In the future the code for all pipe types should be
+		 * unified.
+		 */
 		*pipe = internal_pipe;
 		if (!internal_pipe->config.acc_extension &&
 		    internal_pipe->config.num_acc_stages ==
@@ -8653,21 +8796,23 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 		return ia_css_acc_pipe_create(internal_pipe);
 	}
 
-	/* Use config value when dvs_frame_delay setting equal to 2, otherwise always 1 by default */
+	/*
+	 * Use config value when dvs_frame_delay setting equal to 2,
+	 * otherwise always 1 by default
+	 */
 	if (internal_pipe->config.dvs_frame_delay == IA_CSS_FRAME_DELAY_2)
 		internal_pipe->dvs_frame_delay = 2;
 	else
 		internal_pipe->dvs_frame_delay = 1;
 
-	/* we still keep enable_raw_binning for backward compatibility, for any new
-	    fractional bayer downscaling, we should use bayer_ds_out_res. if both are
-	    specified, bayer_ds_out_res will take precedence.if none is specified, we
-	    set bayer_ds_out_res equal to IF output resolution(IF may do cropping on
-	    sensor output) or use default decimation factor 1. */
-	if (internal_pipe->extra_config.enable_raw_binning &&
-	    internal_pipe->config.bayer_ds_out_res.width) {
-		/* fill some code here, if no code is needed, please remove it during integration */
-	}
+	/*
+	 * we still keep enable_raw_binning for backward compatibility,
+	 * for any new fractional bayer downscaling, we should use
+	 * bayer_ds_out_res. if both are specified, bayer_ds_out_res will
+	 * take precedence.if none is specified, we set bayer_ds_out_res
+	 * equal to IF output resolution(IF may do cropping on sensor output)
+	 * or use default decimation factor 1.
+	 */
 
 	/* YUV downscaling */
 	if ((internal_pipe->config.vf_pp_in_res.width ||
@@ -8871,8 +9016,10 @@ ia_css_stream_configure_rx(struct ia_css_stream *stream)
 	if (config->compression.type == IA_CSS_CSI2_COMPRESSION_TYPE_NONE)
 		stream->csi_rx_config.comp = MIPI_PREDICTOR_NONE;
 	else
-		/* not implemented yet, requires extension of the rx_cfg_t
-		    * struct */
+		/*
+		 * not implemented yet, requires extension of the rx_cfg_t
+		 * struct
+		 */
 		return -EINVAL;
 
 	stream->csi_rx_config.is_two_ppc = (stream->config.pixels_per_clock == 2);
@@ -8959,8 +9106,10 @@ metadata_info_init(const struct ia_css_metadata_config *mdc,
 		return -EINVAL;
 
 	md->resolution = mdc->resolution;
-	/* We round up the stride to a multiple of the width
-	    * of the port going to DDR, this is a HW requirements (DMA). */
+	/*
+	 * We round up the stride to a multiple of the width
+	 * of the port going to DDR, this is a HW requirements (DMA).
+	 */
 	md->stride = CEIL_MUL(mdc->resolution.width, HIVE_ISP_DDR_WORD_BYTES);
 	md->size = mdc->resolution.height * md->stride;
 	return 0;
@@ -9523,10 +9672,13 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 		if (free_mpi) {
 			for (i = 0; i < stream->num_pipes; i++) {
 				struct ia_css_pipe *entry = stream->pipes[i];
-				/* free any mipi frames that are remaining:
-				    * some test stream create-destroy cycles do not generate output frames
-				    * and the mipi buffer is not freed in the deque function
-				    */
+				/*
+				 * free any mipi frames that are remaining:
+				 * some test stream create-destroy cycles do
+				 * not generate output frames
+				 * and the mipi buffer is not freed in the
+				 * deque function
+				 */
 				if (entry)
 					free_mipi_frames(entry);
 			}
@@ -9605,11 +9757,11 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
 }
 
 /*
-    * Rebuild a stream, including allocating structs, setting configuration and
-    * building the required pipes.
-    * The data is taken from the css_save struct updated upon stream creation.
-    * The stream handle is used to identify the correct entry in the css_save struct
-    */
+ * Rebuild a stream, including allocating structs, setting configuration and
+ * building the required pipes.
+ * The data is taken from the css_save struct updated upon stream creation.
+ * The stream handle is used to identify the correct entry in the css_save struct
+ */
 int
 ia_css_stream_load(struct ia_css_stream *stream)
 {
@@ -9737,8 +9889,10 @@ ia_css_stream_stop(struct ia_css_stream *stream)
 	if (err)
 		return err;
 
-	/* Ideally, unmapping should happen after pipeline_stop, but current
-	    * semantics do not allow that. */
+	/*
+	 * Ideally, unmapping should happen after pipeline_stop, but current
+	 * semantics do not allow that.
+	 */
 	/* err = map_sp_threads(stream, false); */
 
 	return err;
@@ -9761,9 +9915,9 @@ ia_css_stream_has_stopped(struct ia_css_stream *stream)
 
 /* ISP2400 */
 /*
-    * Destroy the stream and all the pipes related to it.
-    * The stream handle is used to identify the correct entry in the css_save struct
-    */
+ * Destroy the stream and all the pipes related to it.
+ * The stream handle is used to identify the correct entry in the css_save struct
+ */
 int
 ia_css_stream_unload(struct ia_css_stream *stream)
 {
@@ -10026,11 +10180,12 @@ ia_css_pipe_get_pipe_num(const struct ia_css_pipe *pipe)
 {
 	assert(pipe);
 
-	/* KW was not sure this function was not returning a value
-	    that was out of range; so added an assert, and, for the
-	    case when asserts are not enabled, clip to the largest
-	    value; pipe_num is unsigned so the value cannot be too small
-	*/
+	/*
+	 * KW was not sure this function was not returning a value
+	 * that was out of range; so added an assert, and, for the
+	 * case when asserts are not enabled, clip to the largest
+	 * value; pipe_num is unsigned so the value cannot be too small
+	 */
 	assert(pipe->pipe_num < IA_CSS_PIPELINE_NUM_MAX);
 
 	if (pipe->pipe_num >= IA_CSS_PIPELINE_NUM_MAX)
@@ -10085,10 +10240,10 @@ ia_css_start_sp(void)
 }
 
 /*
-    *	Time to wait SP for termincate. Only condition when this can happen
-    *	is a fatal hw failure, but we must be able to detect this and emit
-    *	a proper error trace.
-    */
+ * Time to wait SP for termincate. Only condition when this can happen
+ * is a fatal hw failure, but we must be able to detect this and emit
+ * a proper error trace.
+ */
 #define SP_SHUTDOWN_TIMEOUT_US 200000
 
 int
@@ -10306,8 +10461,10 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
 
 	IA_CSS_ENTER("");
 
-	/* Only continuous streams have a tagger to which we can send the
-	    * unlock message. */
+	/*
+	 * Only continuous streams have a tagger to which we can send the
+	 * unlock message.
+	 */
 	if (!stream || !stream->config.continuous) {
 		IA_CSS_ERROR("invalid stream pointer");
 		return -EINVAL;
@@ -10319,8 +10476,10 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
 		return -EINVAL;
 	}
 
-	/* Send the event. Since we verified that the exp_id is valid,
-	    * we can safely assign it to an 8-bit argument here. */
+	/*
+	 * Send the event. Since we verified that the exp_id is valid,
+	 * we can safely assign it to an 8-bit argument here.
+	 */
 	ret = ia_css_bufq_enqueue_psys_event(
 	    IA_CSS_PSYS_SW_EVENT_UNLOCK_RAW_BUFFER, exp_id, 0, 0);
 
@@ -10328,9 +10487,10 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
 	return ret;
 }
 
-/* @brief	Set the state (Enable or Disable) of the Extension stage in the
-    *		given pipe.
-    */
+/*
+ * @brief	Set the state (Enable or Disable) of the Extension stage in the
+ *		given pipe.
+ */
 int
 ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 			      bool enable)
@@ -10374,9 +10534,10 @@ ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 	return err;
 }
 
-/*	@brief	Get the state (Enable or Disable) of the Extension stage in the
-    *	given pipe.
-    */
+/*
+ * @brief	Get the state (Enable or Disable) of the Extension stage in the
+ * given pipe.
+ */
 int
 ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 			      bool *enable)
-- 
2.33.1

