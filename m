Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED453705FD
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 08:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhEAGrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 02:47:14 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:42204 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhEAGrM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 May 2021 02:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619851572; bh=RW2kTU+ebVD9aurRDlDdYGUc0dR/7Y5g9PDXYxyEtEA=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=IzlmKR+xgkBr0vI1srM+TGDytYtkDNmoUhOft1iyqMzpUWgnV/nZYP/qAnIYkVIHb
         mfSnd2nFvG7rSGwj9b40YyCUgvzV+e+b9BbXRJ2kK5A6KkUqtbH6Gh9zXqGRDzcsox
         Jl1FyuYZYsQKhDcHbcrRjh7Wf9QFJJhnAIQ+WXJA=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat,  1 May 2021 08:46:12 +0200 (CEST)
X-EA-Auth: QGj4kSbG4pO7eQisQCoDzbJEP+p/GoSFPaN5wGq4olMRFUBAR4h/l7pF4FkX5/05KReg+A1gfwSJhvyeY5OuJDECm2Nmu9sK
Date:   Sat, 1 May 2021 12:16:07 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH 3/5] staging: media: atomisp: code formatting changes
 sh_css_params.c
Message-ID: <6bc123d66150ccaa6dc6fdf2f11c8669e2f493e2.1619850663.git.drv@mailo.com>
References: <cover.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619850663.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several trivial code reformatting changes done according to the coding
style guidelines. These code changes overall improve code organisation
and readability and also address many chackpatch error, warning and
check complaints.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 929 +++++++++---------
 1 file changed, 438 insertions(+), 491 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 644e14575987..cbb593580dc8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -120,8 +120,10 @@
 	(SH_CSS_MORPH_TABLE_ELEM_BYTES * (binary)->morph_tbl_aligned_width * \
 	 (binary)->morph_tbl_height)
 
-/* We keep a second copy of the ptr struct for the SP to access.
-   Again, this would not be necessary on the chip. */
+/*
+ * We keep a second copy of the ptr struct for the SP to access.
+ * Again, this would not be necessary on the chip.
+ */
 static ia_css_ptr sp_ddr_ptrs;
 
 /* sp group address on DDR */
@@ -667,7 +669,6 @@ static const struct ia_css_dz_config default_dz_config = {
 	HRT_GDC_N,
 	HRT_GDC_N,
 	{
-		\
 		{0, 0}, \
 		{0, 0}, \
 	}
@@ -690,27 +691,23 @@ struct ia_css_isp_skc_dvs_statistics {
 	ia_css_ptr p_data;
 };
 
-static int
-ref_sh_css_ddr_address_map(
-    struct sh_css_ddr_address_map *map,
-    struct sh_css_ddr_address_map *out);
+static int ref_sh_css_ddr_address_map(struct sh_css_ddr_address_map *map,
+				      struct sh_css_ddr_address_map *out);
 
-static int
-write_ia_css_isp_parameter_set_info_to_ddr(
-    struct ia_css_isp_parameter_set_info *me,
-    ia_css_ptr *out);
+static int write_ia_css_isp_parameter_set_info_to_ddr(
+		struct ia_css_isp_parameter_set_info *me,
+		ia_css_ptr *out);
 
 static int
 free_ia_css_isp_parameter_set_info(ia_css_ptr ptr);
 
-static int
-sh_css_params_write_to_ddr_internal(
-    struct ia_css_pipe *pipe,
-    unsigned int pipe_id,
-    struct ia_css_isp_parameters *params,
-    const struct ia_css_pipeline_stage *stage,
-    struct sh_css_ddr_address_map *ddr_map,
-    struct sh_css_ddr_address_map_size *ddr_map_size);
+static int sh_css_params_write_to_ddr_internal(
+		struct ia_css_pipe *pipe,
+		unsigned int pipe_id,
+		struct ia_css_isp_parameters *params,
+		const struct ia_css_pipeline_stage *stage,
+		struct sh_css_ddr_address_map *ddr_map,
+		struct sh_css_ddr_address_map_size *ddr_map_size);
 
 static int
 sh_css_create_isp_params(struct ia_css_stream *stream,
@@ -729,34 +726,30 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 				   struct ia_css_pipe *pipe_in);
 
 static int
-sh_css_set_global_isp_config_on_pipe(
-    struct ia_css_pipe *curr_pipe,
-    const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe);
+sh_css_set_global_isp_config_on_pipe(struct ia_css_pipe *curr_pipe,
+				     const struct ia_css_isp_config *config,
+				     struct ia_css_pipe *pipe);
 
 #if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
-static int
-sh_css_set_per_frame_isp_config_on_pipe(
-    struct ia_css_stream *stream,
-    const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe);
+static int sh_css_set_per_frame_isp_config_on_pipe(
+		struct ia_css_stream *stream,
+		const struct ia_css_isp_config *config,
+		struct ia_css_pipe *pipe);
 #endif
 
-static int
-sh_css_update_uds_and_crop_info_based_on_zoom_region(
-    const struct ia_css_binary_info *info,
-    const struct ia_css_frame_info *in_frame_info,
-    const struct ia_css_frame_info *out_frame_info,
-    const struct ia_css_resolution *dvs_env,
-    const struct ia_css_dz_config *zoom,
-    const struct ia_css_vector *motion_vector,
-    struct sh_css_uds_info *uds,		/* out */
-    struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
-    struct ia_css_resolution pipe_in_res,
-    bool enable_zoom);
-
-ia_css_ptr
-sh_css_params_ddr_address_map(void)
+static int sh_css_update_uds_and_crop_info_based_on_zoom_region(
+		const struct ia_css_binary_info *info,
+		const struct ia_css_frame_info *in_frame_info,
+		const struct ia_css_frame_info *out_frame_info,
+		const struct ia_css_resolution *dvs_env,
+		const struct ia_css_dz_config *zoom,
+		const struct ia_css_vector *motion_vector,
+		struct sh_css_uds_info *uds,		/* out */
+		struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
+		struct ia_css_resolution pipe_in_res,
+		bool enable_zoom);
+
+ia_css_ptr sh_css_params_ddr_address_map(void)
 {
 	return sp_ddr_ptrs;
 }
@@ -813,15 +806,15 @@ convert_allocate_fpntbl(struct ia_css_isp_parameters *params)
 }
 
 static int
-store_fpntbl(struct ia_css_isp_parameters *params, ia_css_ptr ptr) {
+store_fpntbl(struct ia_css_isp_parameters *params, ia_css_ptr ptr)
+{
 	struct ia_css_host_data *isp_data;
 
 	assert(params);
 	assert(ptr != mmgr_NULL);
 
 	isp_data = convert_allocate_fpntbl(params);
-	if (!isp_data)
-	{
+	if (!isp_data) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
@@ -886,7 +879,8 @@ ia_css_process_kernel(struct ia_css_stream *stream,
 
 		/* update the other buffers to the pipe specific copies */
 		for (stage = pipeline->stages; stage; stage = stage->next) {
-			if (!stage || !stage->binary) continue;
+			if (!stage || !stage->binary)
+				continue;
 			process(pipeline->pipe_id, stage, params);
 		}
 	}
@@ -894,7 +888,8 @@ ia_css_process_kernel(struct ia_css_stream *stream,
 
 static int
 sh_css_select_dp_10bpp_config(const struct ia_css_pipe *pipe,
-			      bool *is_dp_10bpp) {
+			      bool *is_dp_10bpp)
+{
 	int err = 0;
 	/* Currently we check if 10bpp DPC configuration is required based
 	 * on the use case,i.e. if BDS and DPC is both enabled. The more cleaner
@@ -903,12 +898,10 @@ sh_css_select_dp_10bpp_config(const struct ia_css_pipe *pipe,
 	 * implementation. (This is because the configuration is set before a
 	 * binary is selected, and the binary info is not available)
 	 */
-	if ((!pipe) || (!is_dp_10bpp))
-	{
+	if (!pipe || !is_dp_10bpp) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		err = -EINVAL;
-	} else
-	{
+	} else {
 		*is_dp_10bpp = false;
 
 		/* check if DPC is enabled from the host */
@@ -936,7 +929,8 @@ sh_css_select_dp_10bpp_config(const struct ia_css_pipe *pipe,
 
 int
 sh_css_set_black_frame(struct ia_css_stream *stream,
-		       const struct ia_css_frame *raw_black_frame) {
+		       const struct ia_css_frame *raw_black_frame)
+{
 	struct ia_css_isp_parameters *params;
 	/* this function desperately needs to be moved to the ISP or SP such
 	 * that it can use the DMA.
@@ -957,13 +951,11 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	IA_CSS_ENTER_PRIVATE("black_frame=%p", raw_black_frame);
 
 	if (params->fpn_config.data &&
-	    (params->fpn_config.width != width || params->fpn_config.height != height))
-	{
+	    (params->fpn_config.width != width || params->fpn_config.height != height)) {
 		kvfree(params->fpn_config.data);
 		params->fpn_config.data = NULL;
 	}
-	if (!params->fpn_config.data)
-	{
+	if (!params->fpn_config.data) {
 		params->fpn_config.data = kvmalloc(height * width *
 						   sizeof(short), GFP_KERNEL);
 		if (!params->fpn_config.data) {
@@ -977,8 +969,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	}
 
 	/* store raw to fpntbl */
-	for (y = 0; y < height; y++)
-	{
+	for (y = 0; y < height; y++) {
 		for (x = 0; x < width; x += (ISP_VEC_NELEMS * 2)) {
 			int ofs = y * width + x;
 
@@ -1071,10 +1062,8 @@ sh_css_set_shading_table(struct ia_css_stream *stream,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-void
-ia_css_params_store_ia_css_host_data(
-    ia_css_ptr ddr_addr,
-    struct ia_css_host_data *data)
+void ia_css_params_store_ia_css_host_data(ia_css_ptr ddr_addr,
+					  struct ia_css_host_data *data)
 {
 	assert(data);
 	assert(data->address);
@@ -1089,10 +1078,9 @@ ia_css_params_store_ia_css_host_data(
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-struct ia_css_host_data *
-ia_css_params_alloc_convert_sctbl(
-    const struct ia_css_pipeline_stage *stage,
-    const struct ia_css_shading_table *shading_table)
+struct ia_css_host_data *ia_css_params_alloc_convert_sctbl(
+		const struct ia_css_pipeline_stage *stage,
+		const struct ia_css_shading_table *shading_table)
 {
 	const struct ia_css_binary *binary = stage->binary;
 	struct ia_css_host_data    *sctbl;
@@ -1137,10 +1125,9 @@ ia_css_params_alloc_convert_sctbl(
 	return sctbl;
 }
 
-int ia_css_params_store_sctbl(
-    const struct ia_css_pipeline_stage *stage,
-    ia_css_ptr sc_tbl,
-    const struct ia_css_shading_table  *sc_config)
+int ia_css_params_store_sctbl(const struct ia_css_pipeline_stage *stage,
+			      ia_css_ptr sc_tbl,
+			      const struct ia_css_shading_table  *sc_config)
 {
 	struct ia_css_host_data *isp_sc_tbl;
 
@@ -1165,8 +1152,7 @@ int ia_css_params_store_sctbl(
 	return 0;
 }
 
-static void
-sh_css_enable_pipeline(const struct ia_css_binary *binary)
+static void sh_css_enable_pipeline(const struct ia_css_binary *binary)
 {
 	if (!binary)
 		return;
@@ -1179,9 +1165,9 @@ sh_css_enable_pipeline(const struct ia_css_binary *binary)
 }
 
 static int
-ia_css_process_zoom_and_motion(
-    struct ia_css_isp_parameters *params,
-    const struct ia_css_pipeline_stage *first_stage) {
+ia_css_process_zoom_and_motion(struct ia_css_isp_parameters *params,
+			       const struct ia_css_pipeline_stage *first_stage)
+{
 	/* first_stage can be  NULL */
 	const struct ia_css_pipeline_stage *stage;
 	int err = 0;
@@ -1195,13 +1181,13 @@ ia_css_process_zoom_and_motion(
 	IA_CSS_ENTER_PRIVATE("");
 
 	/* Go through all stages to udate uds and cropping */
-	for (stage = first_stage; stage; stage = stage->next)
-	{
+	for (stage = first_stage; stage; stage = stage->next) {
 		struct ia_css_binary *binary;
-		/* note: the var below is made static as it is quite large;
-		   if it is not static it ends up on the stack which could
-		   cause issues for drivers
-		*/
+		/*
+		 * note: the var below is made static as it is quite large;
+		 * if it is not static it ends up on the stack which could
+		 * cause issues for drivers
+		 */
 		static struct ia_css_binary tmp_binary;
 
 		const struct ia_css_binary_xinfo *info = NULL;
@@ -1361,8 +1347,7 @@ sh_css_get_macc_table(const struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-void ia_css_morph_table_free(
-    struct ia_css_morph_table *me)
+void ia_css_morph_table_free(struct ia_css_morph_table *me)
 {
 	unsigned int i;
 
@@ -1387,8 +1372,7 @@ void ia_css_morph_table_free(
 }
 
 struct ia_css_morph_table *ia_css_morph_table_allocate(
-    unsigned int width,
-    unsigned int height)
+		unsigned int width, unsigned int height)
 {
 	unsigned int i;
 	struct ia_css_morph_table *me;
@@ -1427,9 +1411,8 @@ struct ia_css_morph_table *ia_css_morph_table_allocate(
 	return me;
 }
 
-static int sh_css_params_default_morph_table(
-    struct ia_css_morph_table **table,
-    const struct ia_css_binary *binary)
+static int sh_css_params_default_morph_table(struct ia_css_morph_table **table,
+					     const struct ia_css_binary *binary)
 {
 	/* MW 2400 advanced requires different scaling */
 	unsigned int i, j, k, step, width, height;
@@ -1499,10 +1482,9 @@ sh_css_set_morph_table(struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-void
-ia_css_translate_3a_statistics(
-    struct ia_css_3a_statistics               *host_stats,
-    const struct ia_css_isp_3a_statistics_map *isp_stats)
+void ia_css_translate_3a_statistics(
+		struct ia_css_3a_statistics *host_stats,
+		const struct ia_css_isp_3a_statistics_map *isp_stats)
 {
 	IA_CSS_ENTER("");
 	if (host_stats->grid.use_dmem) {
@@ -1521,8 +1503,7 @@ ia_css_translate_3a_statistics(
 	IA_CSS_LEAVE("void");
 }
 
-void
-ia_css_isp_3a_statistics_map_free(struct ia_css_isp_3a_statistics_map *me)
+void ia_css_isp_3a_statistics_map_free(struct ia_css_isp_3a_statistics_map *me)
 {
 	if (me) {
 		if (me->data_allocated) {
@@ -1534,14 +1515,15 @@ ia_css_isp_3a_statistics_map_free(struct ia_css_isp_3a_statistics_map *me)
 	}
 }
 
-struct ia_css_isp_3a_statistics_map *
-ia_css_isp_3a_statistics_map_allocate(
-    const struct ia_css_isp_3a_statistics *isp_stats,
-    void *data_ptr)
+struct ia_css_isp_3a_statistics_map *ia_css_isp_3a_statistics_map_allocate(
+		const struct ia_css_isp_3a_statistics *isp_stats,
+		void *data_ptr)
 {
 	struct ia_css_isp_3a_statistics_map *me;
-	/* Windows compiler does not like adding sizes to a void *
-	 * so we use a local char * instead. */
+	/*
+	 * Windows compiler does not like adding sizes to a void *
+	 * so we use a local char * instead.
+	 */
 	char *base_ptr;
 
 	me = kvmalloc(sizeof(*me), GFP_KERNEL);
@@ -1562,8 +1544,10 @@ ia_css_isp_3a_statistics_map_allocate(
 	base_ptr = me->data_ptr;
 
 	me->size = isp_stats->size;
-	/* GCC complains when we assign a char * to a void *, so these
-	 * casts are necessary unfortunately. */
+	/*
+	 * GCC complains when we assign a char * to a void *, so these
+	 * casts are necessary unfortunately.
+	 */
 	me->dmem_stats    = (void *)base_ptr;
 	me->vmem_stats_hi = (void *)(base_ptr + isp_stats->dmem_size);
 	me->vmem_stats_lo = (void *)(base_ptr + isp_stats->dmem_size +
@@ -1579,9 +1563,9 @@ ia_css_isp_3a_statistics_map_allocate(
 	return NULL;
 }
 
-int
-ia_css_get_3a_statistics(struct ia_css_3a_statistics           *host_stats,
-			 const struct ia_css_isp_3a_statistics *isp_stats) {
+int ia_css_get_3a_statistics(struct ia_css_3a_statistics *host_stats,
+			     const struct ia_css_isp_3a_statistics *isp_stats)
+{
 	struct ia_css_isp_3a_statistics_map *map;
 	int ret = 0;
 
@@ -1591,13 +1575,11 @@ ia_css_get_3a_statistics(struct ia_css_3a_statistics           *host_stats,
 	assert(isp_stats);
 
 	map = ia_css_isp_3a_statistics_map_allocate(isp_stats, NULL);
-	if (map)
-	{
+	if (map) {
 		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_3a_statistics(host_stats, map);
 		ia_css_isp_3a_statistics_map_free(map);
-	} else
-	{
+	} else {
 		IA_CSS_ERROR("out of memory");
 		ret = -ENOMEM;
 	}
@@ -1606,12 +1588,12 @@ ia_css_get_3a_statistics(struct ia_css_3a_statistics           *host_stats,
 	return ret;
 }
 
-/* Parameter encoding is not yet orthogonal.
-   This function hnadles some of the exceptions.
-*/
-static void
-ia_css_set_param_exceptions(const struct ia_css_pipe *pipe,
-			    struct ia_css_isp_parameters *params)
+/*
+ * Parameter encoding is not yet orthogonal.
+ * This function hnadles some of the exceptions.
+ */
+static void ia_css_set_param_exceptions(const struct ia_css_pipe *pipe,
+					struct ia_css_isp_parameters *params)
 {
 	assert(params);
 
@@ -1635,10 +1617,9 @@ ia_css_set_param_exceptions(const struct ia_css_pipe *pipe,
 }
 
 /* ISP2401 */
-static void
-sh_css_set_dp_config(const struct ia_css_pipe *pipe,
-		     struct ia_css_isp_parameters *params,
-		     const struct ia_css_dp_config *config)
+static void sh_css_set_dp_config(const struct ia_css_pipe *pipe,
+				 struct ia_css_isp_parameters *params,
+				 const struct ia_css_dp_config *config)
 {
 	if (!config)
 		return;
@@ -1656,10 +1637,9 @@ sh_css_set_dp_config(const struct ia_css_pipe *pipe,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_get_dp_config(const struct ia_css_pipe *pipe,
-		     const struct ia_css_isp_parameters *params,
-		     struct ia_css_dp_config *config)
+static void sh_css_get_dp_config(const struct ia_css_pipe *pipe,
+				 const struct ia_css_isp_parameters *params,
+				 struct ia_css_dp_config *config)
 {
 	if (!config)
 		return;
@@ -1673,9 +1653,8 @@ sh_css_get_dp_config(const struct ia_css_pipe *pipe,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_set_nr_config(struct ia_css_isp_parameters *params,
-		     const struct ia_css_nr_config *config)
+static void sh_css_set_nr_config(struct ia_css_isp_parameters *params,
+				 const struct ia_css_nr_config *config)
 {
 	if (!config)
 		return;
@@ -1693,9 +1672,8 @@ sh_css_set_nr_config(struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_set_ee_config(struct ia_css_isp_parameters *params,
-		     const struct ia_css_ee_config *config)
+static void sh_css_set_ee_config(struct ia_css_isp_parameters *params,
+				 const struct ia_css_ee_config *config)
 {
 	if (!config)
 		return;
@@ -1711,9 +1689,8 @@ sh_css_set_ee_config(struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_get_ee_config(const struct ia_css_isp_parameters *params,
-		     struct ia_css_ee_config *config)
+static void sh_css_get_ee_config(const struct ia_css_isp_parameters *params,
+				 struct ia_css_ee_config *config)
 {
 	if (!config)
 		return;
@@ -1781,9 +1758,8 @@ sh_css_get_pipe_dvs_6axis_config(const struct ia_css_pipe *pipe,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_set_baa_config(struct ia_css_isp_parameters *params,
-		      const struct ia_css_aa_config *config)
+static void sh_css_set_baa_config(struct ia_css_isp_parameters *params,
+				  const struct ia_css_aa_config *config)
 {
 	if (!config)
 		return;
@@ -1797,9 +1773,8 @@ sh_css_set_baa_config(struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_get_baa_config(const struct ia_css_isp_parameters *params,
-		      struct ia_css_aa_config *config)
+static void sh_css_get_baa_config(const struct ia_css_isp_parameters *params,
+				  struct ia_css_aa_config *config)
 {
 	if (!config)
 		return;
@@ -1812,9 +1787,8 @@ sh_css_get_baa_config(const struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_set_dz_config(struct ia_css_isp_parameters *params,
-		     const struct ia_css_dz_config *config)
+static void sh_css_set_dz_config(struct ia_css_isp_parameters *params,
+				 const struct ia_css_dz_config *config)
 {
 	if (!config)
 		return;
@@ -1833,9 +1807,8 @@ sh_css_set_dz_config(struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_get_dz_config(const struct ia_css_isp_parameters *params,
-		     struct ia_css_dz_config *config)
+static void sh_css_get_dz_config(const struct ia_css_isp_parameters *params,
+				 struct ia_css_dz_config *config)
 {
 	if (!config)
 		return;
@@ -1848,9 +1821,8 @@ sh_css_get_dz_config(const struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("dx=%d, dy=%d", config->dx, config->dy);
 }
 
-static void
-sh_css_set_motion_vector(struct ia_css_isp_parameters *params,
-			 const struct ia_css_vector *motion)
+static void sh_css_set_motion_vector(struct ia_css_isp_parameters *params,
+				     const struct ia_css_vector *motion)
 {
 	if (!motion)
 		return;
@@ -1866,9 +1838,8 @@ sh_css_set_motion_vector(struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void
-sh_css_get_motion_vector(const struct ia_css_isp_parameters *params,
-			 struct ia_css_vector *motion)
+static void sh_css_get_motion_vector(const struct ia_css_isp_parameters *params,
+				     struct ia_css_vector *motion)
 {
 	if (!motion)
 		return;
@@ -1881,8 +1852,7 @@ sh_css_get_motion_vector(const struct ia_css_isp_parameters *params,
 	IA_CSS_LEAVE_PRIVATE("x=%d, y=%d", motion->x, motion->y);
 }
 
-struct ia_css_isp_config *
-sh_css_pipe_isp_config_get(struct ia_css_pipe *pipe)
+struct ia_css_isp_config *sh_css_pipe_isp_config_get(struct ia_css_pipe *pipe)
 {
 	if (!pipe) {
 		IA_CSS_ERROR("pipe=%p", NULL);
@@ -1891,18 +1861,16 @@ sh_css_pipe_isp_config_get(struct ia_css_pipe *pipe)
 	return pipe->config.p_isp_config;
 }
 
-int
-ia_css_stream_set_isp_config(
-    struct ia_css_stream *stream,
-    const struct ia_css_isp_config *config) {
+int ia_css_stream_set_isp_config(struct ia_css_stream *stream,
+				 const struct ia_css_isp_config *config)
+{
 	return ia_css_stream_set_isp_config_on_pipe(stream, config, NULL);
 }
 
-int
-ia_css_stream_set_isp_config_on_pipe(
-    struct ia_css_stream *stream,
-    const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe) {
+int ia_css_stream_set_isp_config_on_pipe(struct ia_css_stream *stream,
+					 const struct ia_css_isp_config *config,
+					 struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
 	if ((!stream) || (!config))
@@ -1921,9 +1889,9 @@ ia_css_stream_set_isp_config_on_pipe(
 	return err;
 }
 
-int
-ia_css_pipe_set_isp_config(struct ia_css_pipe *pipe,
-			   struct ia_css_isp_config *config) {
+int ia_css_pipe_set_isp_config(struct ia_css_pipe *pipe,
+			       struct ia_css_isp_config *config)
+{
 	struct ia_css_pipe *pipe_in = pipe;
 	int err = 0;
 
@@ -1944,11 +1912,11 @@ ia_css_pipe_set_isp_config(struct ia_css_pipe *pipe,
 	return err;
 }
 
-static int
-sh_css_set_global_isp_config_on_pipe(
-    struct ia_css_pipe *curr_pipe,
-    const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe) {
+static int sh_css_set_global_isp_config_on_pipe(
+		struct ia_css_pipe *curr_pipe,
+		const struct ia_css_isp_config *config,
+		struct ia_css_pipe *pipe)
+{
 	int err = 0;
 	int err1 = 0;
 	int err2 = 0;
@@ -1960,11 +1928,13 @@ sh_css_set_global_isp_config_on_pipe(
 	/* Now commit all changes to the SP */
 	err2 = sh_css_param_update_isp_params(curr_pipe, curr_pipe->stream->isp_params_configs, sh_css_sp_is_running(), pipe);
 
-	/* The following code is intentional. The sh_css_init_isp_params_from_config interface
+	/*
+	 * The following code is intentional. The sh_css_init_isp_params_from_config interface
 	 * throws an error when both DPC and BDS is enabled. The CSS API must pass this error
 	 * information to the caller, ie. the host. We do not return this error immediately,
 	 * but instead continue with updating the ISP params to enable testing of features
-	 * which are currently in TR phase. */
+	 * which are currently in TR phase.
+	 */
 
 	err = (err1 != 0) ? err1 : ((err2 != 0) ? err2 : err);
 
@@ -1973,11 +1943,11 @@ sh_css_set_global_isp_config_on_pipe(
 }
 
 #if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
-static int
-sh_css_set_per_frame_isp_config_on_pipe(
-    struct ia_css_stream *stream,
-    const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe) {
+static int sh_css_set_per_frame_isp_config_on_pipe(
+		struct ia_css_stream *stream,
+		const struct ia_css_isp_config *config,
+		struct ia_css_pipe *pipe)
+{
 	unsigned int i;
 	bool per_frame_config_created = false;
 	int err = 0;
@@ -1991,17 +1961,16 @@ sh_css_set_per_frame_isp_config_on_pipe(
 
 	IA_CSS_ENTER_PRIVATE("stream=%p, config=%p, pipe=%p", stream, config, pipe);
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		err = -EINVAL;
 		goto exit;
 	}
 
-	/* create per-frame ISP params object with default values
+	/*
+	 * create per-frame ISP params object with default values
 	 * from stream->isp_params_configs if one doesn't already exist
-	*/
-	if (!stream->per_frame_isp_params_configs)
-	{
+	 */
+	if (!stream->per_frame_isp_params_configs) {
 		err = sh_css_create_isp_params(stream,
 					       &stream->per_frame_isp_params_configs);
 		if (err)
@@ -2013,14 +1982,11 @@ sh_css_set_per_frame_isp_config_on_pipe(
 
 	/* update new ISP params object with the new config */
 	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))
-	{
 		err1 = -EINVAL;
-	}
 
 	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
 
-	if (per_frame_config_created)
-	{
+	if (per_frame_config_created) {
 		ddr_ptrs = &params->ddr_ptrs;
 		ddr_ptrs_size = &params->ddr_ptrs_size;
 		/* create per pipe reference to general ddr_ptrs */
@@ -2033,11 +1999,13 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	/* now commit to ddr */
 	err3 = sh_css_param_update_isp_params(stream->pipes[0], params, sh_css_sp_is_running(), pipe);
 
-	/* The following code is intentional. The sh_css_init_sp_params_from_config and
+	/*
+	 * The following code is intentional. The sh_css_init_sp_params_from_config and
 	 * sh_css_init_isp_params_from_config throws an error when both DPC and BDS is enabled.
 	 * The CSS API must pass this error information to the caller, ie. the host.
 	 * We do not return this error immediately, but instead continue with updating the ISP params
-	 *  to enable testing of features which are currently in TR phase. */
+	 * to enable testing of features which are currently in TR phase.xi
+	 */
 	err = (err1 != 0) ? err1 :
 	      (err2 != 0) ? err2 :
 	      (err3 != 0) ? err3 : err;
@@ -2047,11 +2015,12 @@ sh_css_set_per_frame_isp_config_on_pipe(
 }
 #endif
 
-static int
-sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
-				   struct ia_css_isp_parameters *params,
-				   const struct ia_css_isp_config *config,
-				   struct ia_css_pipe *pipe_in) {
+static int sh_css_init_isp_params_from_config(
+		struct ia_css_pipe *pipe,
+		struct ia_css_isp_parameters *params,
+		const struct ia_css_isp_config *config,
+		struct ia_css_pipe *pipe_in)
+{
 	int err = 0;
 	bool is_dp_10bpp = true;
 
@@ -2064,9 +2033,11 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 	sh_css_set_nr_config(params, config->nr_config);
 	sh_css_set_ee_config(params, config->ee_config);
 	sh_css_set_baa_config(params, config->baa_config);
+
 	if ((pipe->mode < IA_CSS_PIPE_ID_NUM) &&
 	    (params->pipe_dvs_6axis_config[pipe->mode]))
 		sh_css_set_pipe_dvs_6axis_config(pipe, params, config->dvs_6axis_config);
+
 	sh_css_set_dz_config(params, config->dz_config);
 	sh_css_set_motion_vector(params, config->motion_vector);
 	sh_css_update_shading_table_status(pipe_in, params);
@@ -2085,28 +2056,29 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 	params->output_frame = config->output_frame;
 	params->isp_parameters_id = config->isp_config_id;
 
-	/* Currently we do not offer CSS interface to set different
+	/*
+	 * Currently we do not offer CSS interface to set different
 	 * configurations for DPC, i.e. depending on DPC being enabled
 	 * before (NORM+OBC) or after. The folllowing code to set the
 	 * DPC configuration should be updated when this interface is made
-	 * available */
+	 * available
+	 */
 	if (IS_ISP2401) {
 		sh_css_set_dp_config(pipe, params, config->dp_config);
 		ia_css_set_param_exceptions(pipe, params);
 	}
 
-	if (0 ==
-	    sh_css_select_dp_10bpp_config(pipe, &is_dp_10bpp))
-	{
-		/* return an error when both DPC and BDS is enabled by the
-		 * user. */
-		/* we do not exit from this point immediately to allow internal
-		 * firmware feature testing. */
+	if (0 == sh_css_select_dp_10bpp_config(pipe, &is_dp_10bpp)) {
+		/*
+		 * return an error when both DPC and BDS is enabled by the
+		 * user.
+		 * we do not exit from this point immediately to allow internal
+		 * firmware feature testing.
+		 */
 		if (is_dp_10bpp) {
 			err = -EINVAL;
 		}
-	} else
-	{
+	} else {
 		err = -EINVAL;
 		goto exit;
 	}
@@ -2119,19 +2091,16 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 	return err;
 }
 
-void
-ia_css_stream_get_isp_config(
-    const struct ia_css_stream *stream,
-    struct ia_css_isp_config *config)
+void ia_css_stream_get_isp_config(const struct ia_css_stream *stream,
+				  struct ia_css_isp_config *config)
 {
 	IA_CSS_ENTER("void");
 	ia_css_pipe_get_isp_config(stream->pipes[0], config);
 	IA_CSS_LEAVE("void");
 }
 
-void
-ia_css_pipe_get_isp_config(struct ia_css_pipe *pipe,
-			   struct ia_css_isp_config *config)
+void ia_css_pipe_get_isp_config(struct ia_css_pipe *pipe,
+				struct ia_css_isp_config *config)
 {
 	struct ia_css_isp_parameters *params = NULL;
 
@@ -2168,19 +2137,17 @@ ia_css_pipe_get_isp_config(struct ia_css_pipe *pipe,
  *
  * Deprecated: Implement mmgr_realloc()
  */
-static bool realloc_isp_css_mm_buf(
-    ia_css_ptr *curr_buf,
-    size_t *curr_size,
-    size_t needed_size,
-    bool force,
-    int *err,
-    uint16_t mmgr_attribute)
+static bool realloc_isp_css_mm_buf(ia_css_ptr *curr_buf, size_t *curr_size,
+				   size_t needed_size, bool force, int *err,
+				   uint16_t mmgr_attribute)
 {
 	s32 id;
 
 	*err = 0;
-	/* Possible optimization: add a function sh_css_isp_css_mm_realloc()
-	 * and implement on top of hmm. */
+	/*
+	 * Possible optimization: add a function sh_css_isp_css_mm_realloc()
+	 * and implement on top of hmm.
+	 */
 
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -2211,12 +2178,8 @@ static bool realloc_isp_css_mm_buf(
 	return true;
 }
 
-static bool reallocate_buffer(
-    ia_css_ptr *curr_buf,
-    size_t *curr_size,
-    size_t needed_size,
-    bool force,
-    int *err)
+static bool reallocate_buffer(ia_css_ptr *curr_buf, size_t *curr_size,
+			      size_t needed_size, bool force, int *err)
 {
 	bool ret;
 
@@ -2284,8 +2247,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	return me;
 }
 
-void
-ia_css_isp_3a_statistics_free(struct ia_css_isp_3a_statistics *me)
+void ia_css_isp_3a_statistics_free(struct ia_css_isp_3a_statistics *me)
 {
 	if (me) {
 		hmm_free(me->data_ptr);
@@ -2327,15 +2289,16 @@ ia_css_metadata_allocate(const struct ia_css_metadata_info *metadata_info)
 	return NULL;
 }
 
-void
-ia_css_metadata_free(struct ia_css_metadata *me)
+void ia_css_metadata_free(struct ia_css_metadata *me)
 {
 	if (me) {
-		/* The enter and leave macros are placed inside
+		/*
+		 * The enter and leave macros are placed inside
 		 * the condition to avoid false logging of metadata
 		 * free events when metadata is disabled.
 		 * We found this to be confusing during development
-		 * and debugging. */
+		 * and debugging.
+		 */
 		IA_CSS_ENTER("me=%p", me);
 		hmm_free(me->address);
 		kvfree(me);
@@ -2343,9 +2306,8 @@ ia_css_metadata_free(struct ia_css_metadata *me)
 	}
 }
 
-void
-ia_css_metadata_free_multiple(unsigned int num_bufs,
-			      struct ia_css_metadata **bufs)
+void ia_css_metadata_free_multiple(unsigned int num_bufs,
+				   struct ia_css_metadata **bufs)
 {
 	unsigned int i;
 
@@ -2358,8 +2320,8 @@ ia_css_metadata_free_multiple(unsigned int num_bufs,
 static unsigned int g_param_buffer_dequeue_count;
 static unsigned int g_param_buffer_enqueue_count;
 
-int
-ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
+int ia_css_stream_isp_parameters_init(struct ia_css_stream *stream)
+{
 	int err = 0;
 	unsigned int i;
 	struct sh_css_ddr_address_map *ddr_ptrs;
@@ -2369,8 +2331,7 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 	assert(stream);
 	IA_CSS_ENTER_PRIVATE("void");
 
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -2385,10 +2346,11 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 		goto ERR;
 
 	params = stream->isp_params_configs;
-	if (!sh_css_init_isp_params_from_global(stream, params, true, NULL))
-	{
-		/* we do not return the error immediately to enable internal
-		 * firmware feature testing */
+	if (!sh_css_init_isp_params_from_global(stream, params, true, NULL)) {
+		/*
+		 * we do not return the error immediately to enable internal
+		 * firmware feature testing
+		 */
 		err = -EINVAL;
 	}
 
@@ -2396,8 +2358,7 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 	ddr_ptrs_size = &params->ddr_ptrs_size;
 
 	/* create per pipe reference to general ddr_ptrs */
-	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		ref_sh_css_ddr_address_map(ddr_ptrs, &params->pipe_ddr_ptrs[i]);
 		params->pipe_ddr_ptrs_size[i] = *ddr_ptrs_size;
 	}
@@ -2407,10 +2368,9 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 	return err;
 }
 
-static void
-ia_css_set_sdis_config(
-    struct ia_css_isp_parameters *params,
-    const struct ia_css_dvs_coefficients *dvs_coefs)
+static void ia_css_set_sdis_config(
+		struct ia_css_isp_parameters *params,
+		const struct ia_css_dvs_coefficients *dvs_coefs)
 {
 	ia_css_set_sdis_horicoef_config(params, dvs_coefs);
 	ia_css_set_sdis_vertcoef_config(params, dvs_coefs);
@@ -2418,10 +2378,9 @@ ia_css_set_sdis_config(
 	ia_css_set_sdis_vertproj_config(params, dvs_coefs);
 }
 
-static void
-ia_css_set_sdis2_config(
-    struct ia_css_isp_parameters *params,
-    const struct ia_css_dvs2_coefficients *dvs2_coefs)
+static void ia_css_set_sdis2_config(
+		struct ia_css_isp_parameters *params,
+		const struct ia_css_dvs2_coefficients *dvs2_coefs)
 {
 	ia_css_set_sdis2_horicoef_config(params, dvs2_coefs);
 	ia_css_set_sdis2_vertcoef_config(params, dvs2_coefs);
@@ -2431,7 +2390,8 @@ ia_css_set_sdis2_config(
 
 static int
 sh_css_create_isp_params(struct ia_css_stream *stream,
-			 struct ia_css_isp_parameters **isp_params_out) {
+			 struct ia_css_isp_parameters **isp_params_out)
+{
 	bool succ = true;
 	unsigned int i;
 	struct sh_css_ddr_address_map *ddr_ptrs;
@@ -2441,23 +2401,20 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	struct ia_css_isp_parameters *params =
 	kvmalloc(sizeof(struct ia_css_isp_parameters), GFP_KERNEL);
 
-	if (!params)
-	{
+	if (!params) {
 		*isp_params_out = NULL;
 		err = -ENOMEM;
 		IA_CSS_ERROR("%s:%d error: cannot allocate memory", __FILE__, __LINE__);
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else
-	{
+	} else {
 		memset(params, 0, sizeof(struct ia_css_isp_parameters));
 	}
 
 	ddr_ptrs = &params->ddr_ptrs;
 	ddr_ptrs_size = &params->ddr_ptrs_size;
 
-	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		memset(&params->pipe_ddr_ptrs[i], 0,
 		       sizeof(params->pipe_ddr_ptrs[i]));
 		memset(&params->pipe_ddr_ptrs_size[i], 0,
@@ -2535,15 +2492,16 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 			for (i = 0; i < stream->num_pipes; i++) {
 				if (sh_css_select_dp_10bpp_config(stream->pipes[i],
 								&is_dp_10bpp) == 0) {
-					/* set the return value as false if both DPC and
-					* BDS is enabled by the user. But we do not return
-					* the value immediately to enable internal firmware
-					* feature testing. */
-					if (is_dp_10bpp) {
+					/*
+					 * set the return value as false if both DPC and
+					 * BDS is enabled by the user. But we do not return
+					 * the value immediately to enable internal firmware
+					 * feature testing.
+					 */
+					if (is_dp_10bpp)
 						sh_css_set_dp_config(stream->pipes[i], params, &default_dp_10bpp_config);
-					} else {
+					else
 						sh_css_set_dp_config(stream->pipes[i], params, &default_dp_config);
-					}
 				} else {
 					retval = false;
 					goto exit;
@@ -2643,10 +2601,12 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 		for (i = 0; i < stream->num_pipes; i++) {
 			if (0 ==
 			    sh_css_select_dp_10bpp_config(stream->pipes[i], &is_dp_10bpp)) {
-				/* set the return value as false if both DPC and
+				/*
+				 * set the return value as false if both DPC and
 				 * BDS is enabled by the user. But we do not return
 				 * the value immediately to enable internal firmware
-				 * feature testing. */
+				 * feature testing.
+				 */
 
 				if (is_dp_10bpp) {
 					retval = false;
@@ -2713,8 +2673,8 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 	return retval;
 }
 
-int
-sh_css_params_init(void) {
+int sh_css_params_init(void)
+{
 	int i, p;
 
 	IA_CSS_ENTER_PRIVATE("void");
@@ -2723,8 +2683,7 @@ sh_css_params_init(void) {
 	g_param_buffer_dequeue_count = 0;
 	g_param_buffer_enqueue_count = 0;
 
-	for (p = 0; p < IA_CSS_PIPE_ID_NUM; p++)
-	{
+	for (p = 0; p < IA_CSS_PIPE_ID_NUM; p++) {
 		for (i = 0; i < SH_CSS_MAX_STAGES; i++) {
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
@@ -2762,8 +2721,7 @@ sh_css_params_init(void) {
 								 ATOMISP_MAP_FLAG_CLEARED));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
-	    (xmem_sp_group_ptrs == mmgr_NULL))
-	{
+	    (xmem_sp_group_ptrs == mmgr_NULL)) {
 		ia_css_uninit();
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
@@ -2792,8 +2750,7 @@ inline void sh_css_params_free_gdc_lut(ia_css_ptr addr)
 		hmm_free(addr);
 }
 
-int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
-	const void *lut)
+int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe, const void *lut)
 {
 	int err = 0;
 	bool stream_started = false;
@@ -2806,10 +2763,12 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 		return err;
 	}
 
-	/* If the pipe belongs to a stream and the stream has started, it is not
+	/*
+	 * If the pipe belongs to a stream and the stream has started, it is not
 	 * safe to store lut to gdc HW. If pipe->stream is NULL, then no stream is
 	 * created with this pipe, so it is safe to do this operation as long as
-	 * ia_css_init() has been called. */
+	 * ia_css_init() has been called.
+	 */
 	if (pipe->stream && pipe->stream->started) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
 				    "unable to set scaler lut since stream has started\n");
@@ -2899,8 +2858,7 @@ ia_css_ptr sh_css_params_get_default_gdc_lut(void)
 	return default_gdc_lut;
 }
 
-static void free_param_set_callback(
-    ia_css_ptr ptr)
+static void free_param_set_callback(ia_css_ptr ptr)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -2909,8 +2867,7 @@ static void free_param_set_callback(
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static void free_buffer_callback(
-    ia_css_ptr ptr)
+static void free_buffer_callback(ia_css_ptr ptr)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -2919,8 +2876,7 @@ static void free_buffer_callback(
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-void
-sh_css_param_clear_param_sets(void)
+void sh_css_param_clear_param_sets(void)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -3040,12 +2996,9 @@ sh_css_params_uninit(void)
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static struct ia_css_host_data *
-convert_allocate_morph_plane(
-    unsigned short *data,
-    unsigned int width,
-    unsigned int height,
-    unsigned int aligned_width)
+static struct ia_css_host_data *convert_allocate_morph_plane(
+		unsigned short *data, unsigned int width,
+		unsigned int height, unsigned int aligned_width)
 {
 	unsigned int i, j, padding, w;
 	struct ia_css_host_data *me;
@@ -3054,9 +3007,11 @@ convert_allocate_morph_plane(
 
 	IA_CSS_ENTER_PRIVATE("void");
 
-	/* currently we don't have morph table interpolation yet,
+	/*
+	 * currently we don't have morph table interpolation yet,
 	 * so we allow a wider table to be used. This will be removed
-	 * in the future. */
+	 * in the future.
+	 */
 	if (width > aligned_width) {
 		padding = 0;
 		w = aligned_width;
@@ -3088,20 +3043,16 @@ convert_allocate_morph_plane(
 	return me;
 }
 
-static int
-store_morph_plane(
-    unsigned short *data,
-    unsigned int width,
-    unsigned int height,
-    ia_css_ptr dest,
-    unsigned int aligned_width) {
+static int store_morph_plane(unsigned short *data, unsigned int width,
+			     unsigned int height, ia_css_ptr dest,
+			     unsigned int aligned_width)
+{
 	struct ia_css_host_data *isp_data;
 
 	assert(dest != mmgr_NULL);
 
 	isp_data = convert_allocate_morph_plane(data, width, height, aligned_width);
-	if (!isp_data)
-	{
+	if (!isp_data) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
@@ -3112,8 +3063,8 @@ store_morph_plane(
 }
 
 static void sh_css_update_isp_params_to_ddr(
-    struct ia_css_isp_parameters *params,
-    ia_css_ptr ddr_ptr)
+		struct ia_css_isp_parameters *params,
+		ia_css_ptr ddr_ptr)
 {
 	size_t size = sizeof(params->uds);
 
@@ -3126,10 +3077,10 @@ static void sh_css_update_isp_params_to_ddr(
 }
 
 static void sh_css_update_isp_mem_params_to_ddr(
-    const struct ia_css_binary *binary,
-    ia_css_ptr ddr_mem_ptr,
-    size_t size,
-    enum ia_css_isp_memories mem)
+		const struct ia_css_binary *binary,
+		ia_css_ptr ddr_mem_ptr,
+		size_t size,
+		enum ia_css_isp_memories mem)
 {
 	const struct ia_css_host_data *params;
 
@@ -3200,10 +3151,10 @@ process_kernel_parameters(unsigned int pipe_id,
 		ia_css_ob_configure(&params->stream_configs.ob,
 				    isp_pipe_version, raw_bit_depth);
 	}
-	if (params->config_changed[IA_CSS_S3A_ID]) {
+	if (params->config_changed[IA_CSS_S3A_ID])
 		ia_css_s3a_configure(raw_bit_depth);
-	}
-	/* Copy stage uds parameters to config, since they can differ per stage.
+	/*
+	 * Copy stage uds parameters to config, since they can differ per stage.
 	 */
 	params->crop_config.crop_pos = params->uds[stage->stage_num].crop_pos;
 	params->uds_config.crop_pos  = params->uds[stage->stage_num].crop_pos;
@@ -3211,7 +3162,8 @@ process_kernel_parameters(unsigned int pipe_id,
 	/* Call parameter process functions for all kernels */
 	/* Skip SC, since that is called on a temp sc table */
 	for (param_id = 0; param_id < IA_CSS_NUM_PARAMETER_IDS; param_id++) {
-		if (param_id == IA_CSS_SC_ID) continue;
+		if (param_id == IA_CSS_SC_ID)
+			continue;
 		if (params->config_changed[param_id])
 			ia_css_kernel_process_param[param_id](pipe_id, stage, params);
 	}
@@ -3221,7 +3173,8 @@ int
 sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 			       struct ia_css_isp_parameters *params,
 			       bool commit,
-			       struct ia_css_pipe *pipe_in) {
+			       struct ia_css_pipe *pipe_in)
+{
 	int err = 0;
 	ia_css_ptr cpy;
 	int i;
@@ -3238,15 +3191,15 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 	raw_bit_depth = ia_css_stream_input_format_bits_per_pixel(curr_pipe->stream);
 
 	/* now make the map available to the sp */
-	if (!commit)
-	{
+	if (!commit) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-	/* enqueue a copies of the mem_map to
-	   the designated pipelines */
-	for (i = 0; i < curr_pipe->stream->num_pipes; i++)
-	{
+	/*
+	 * enqueue a copies of the mem_map to
+	 * the designated pipelines
+	 */
+	for (i = 0; i < curr_pipe->stream->num_pipes; i++) {
 		struct ia_css_pipe *pipe;
 		struct sh_css_ddr_address_map *cur_map;
 		struct sh_css_ddr_address_map_size *cur_map_size;
@@ -3279,11 +3232,12 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 		cur_map = &params->pipe_ddr_ptrs[pipeline->pipe_id];
 		cur_map_size = &params->pipe_ddr_ptrs_size[pipeline->pipe_id];
 
-		/* TODO: Normally, zoom and motion parameters shouldn't
+		/*
+		 * TODO: Normally, zoom and motion parameters shouldn't
 		 * be part of "isp_params" as it is resolution/pipe dependent
 		 * Therefore, move the zoom config elsewhere (e.g. shading
 		 * table can be taken as an example! @GC
-		 * */
+		 */
 		{
 			/* we have to do this per pipeline because */
 			/* the processing is a.o. resolution dependent */
@@ -3293,8 +3247,10 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 				return err;
 		}
 		/* check if to actually update the parameters for this pipe */
-		/* When API change is implemented making good distinction between
-		* stream config and pipe config this skipping code can be moved out of the #ifdef */
+		/*
+		 * When API change is implemented making good distinction between
+		 * stream config and pipe config this skipping code can be moved out of the #ifdef
+		 */
 		if (pipe_in && (pipe != pipe_in)) {
 			IA_CSS_LOG("skipping pipe %p", pipe);
 			continue;
@@ -3374,7 +3330,8 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 #endif
 			break;
 		} else {
-			/* TMP: check discrepancy between nr of enqueued
+			/*
+			 * TMP: check discrepancy between nr of enqueued
 			 * parameter sets and dequeued sets
 			 */
 			g_param_buffer_enqueue_count++;
@@ -3404,8 +3361,10 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 		ia_css_dequeue_param_buffers(/*pipe_num*/);
 		params->pipe_dvs_6axis_config_changed[pipeline->pipe_id] = false;
 	} /* end for each 'active' pipeline */
-	/* clear the changed flags after all params
-	for all pipelines have been updated */
+	/*
+	 * clear the changed flags after all params
+	 * for all pipelines have been updated
+	 */
 	params->isp_params_changed = false;
 	params->sc_table_changed = false;
 	params->dis_coef_table_changed = false;
@@ -3423,14 +3382,14 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 	return err;
 }
 
-static int
-sh_css_params_write_to_ddr_internal(
-    struct ia_css_pipe *pipe,
-    unsigned int pipe_id,
-    struct ia_css_isp_parameters *params,
-    const struct ia_css_pipeline_stage *stage,
-    struct sh_css_ddr_address_map *ddr_map,
-    struct sh_css_ddr_address_map_size *ddr_map_size) {
+static int sh_css_params_write_to_ddr_internal(
+		struct ia_css_pipe *pipe,
+		unsigned int pipe_id,
+		struct ia_css_isp_parameters *params,
+		const struct ia_css_pipeline_stage *stage,
+		struct sh_css_ddr_address_map *ddr_map,
+		struct sh_css_ddr_address_map_size *ddr_map_size)
+{
 	int err;
 	const struct ia_css_binary *binary;
 
@@ -3452,8 +3411,7 @@ sh_css_params_write_to_ddr_internal(
 
 	stage_num = stage->stage_num;
 
-	if (binary->info->sp.enable.fpnr)
-	{
+	if (binary->info->sp.enable.fpnr) {
 		buff_realloced = reallocate_buffer(&ddr_map->fpn_tbl,
 						   &ddr_map_size->fpn_tbl,
 						   (size_t)(FPNTBL_BYTES(binary)),
@@ -3474,8 +3432,7 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	if (binary->info->sp.enable.sc)
-	{
+	if (binary->info->sp.enable.sc) {
 		u32 enable_conv;
 		size_t bytes;
 
@@ -3573,12 +3530,13 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	/* DPC configuration is made pipe specific to allow flexibility in positioning of the
+	/*
+	 * DPC configuration is made pipe specific to allow flexibility in positioning of the
 	 * DPC kernel. The code below sets the pipe specific configuration to
-	 * individual binaries. */
+	 * individual binaries.
+	 */
 	if (IS_ISP2401 &&
-	    params->pipe_dpc_config_changed[pipe_id] && binary->info->sp.enable.dpc)
-	{
+	    params->pipe_dpc_config_changed[pipe_id] && binary->info->sp.enable.dpc) {
 		unsigned int size   =
 		    stage->binary->info->mem_offsets.offsets.param->dmem.dp.size;
 
@@ -3596,8 +3554,7 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	if (params->config_changed[IA_CSS_MACC_ID] && binary->info->sp.enable.macc)
-	{
+	if (params->config_changed[IA_CSS_MACC_ID] && binary->info->sp.enable.macc) {
 		unsigned int i, j, idx;
 		unsigned int idx_map[] = {
 			0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8
@@ -3646,9 +3603,9 @@ sh_css_params_write_to_ddr_internal(
 			   sizeof(converted_macc_table.data));
 	}
 
-	if (binary->info->sp.enable.dvs_6axis)
-	{
-		/* because UV is packed into the Y plane, calc total
+	if (binary->info->sp.enable.dvs_6axis) {
+		/*
+		 * because UV is packed into the Y plane, calc total
 		 * YYU size = /2 gives size of UV-only,
 		 * total YYU size = UV-only * 3.
 		 */
@@ -3667,11 +3624,13 @@ sh_css_params_write_to_ddr_internal(
 			const struct ia_css_frame_info *dvs_in_frame_info;
 
 			if (stage->args.delay_frames[0]) {
-				/*When delay frames are present(as in case of video),
-				they are used for dvs. Configure DVS using those params*/
+				/*
+				 * When delay frames are present(as in case of video),
+				 * they are used for dvs. Configure DVS using those paramsi
+				 */
 				dvs_in_frame_info = &stage->args.delay_frames[0]->info;
 			} else {
-				/*Otherwise, use input frame to configure DVS*/
+				/* Otherwise, use input frame to configure DVS */
 				dvs_in_frame_info = &stage->args.in_frame->info;
 			}
 
@@ -3682,9 +3641,8 @@ sh_css_params_write_to_ddr_internal(
 				if (!IS_ISP2401) {
 					dvs_offset.width = (PIX_SHIFT_FILTER_RUN_IN_X + binary->dvs_envelope.width) / 2;
 				} else {
-					if (binary->dvs_envelope.width || binary->dvs_envelope.height) {
+					if (binary->dvs_envelope.width || binary->dvs_envelope.height)
 						dvs_offset.width  = (PIX_SHIFT_FILTER_RUN_IN_X + binary->dvs_envelope.width) / 2;
-					}
 				}
 				dvs_offset.height = (PIX_SHIFT_FILTER_RUN_IN_Y + binary->dvs_envelope.height) / 2;
 
@@ -3705,21 +3663,13 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	if (binary->info->sp.enable.ca_gdc)
-	{
+	if (binary->info->sp.enable.ca_gdc) {
 		unsigned int i;
-		ia_css_ptr *virt_addr_tetra_x[
-
-		IA_CSS_MORPH_TABLE_NUM_PLANES];
-		size_t *virt_size_tetra_x[
-
-		IA_CSS_MORPH_TABLE_NUM_PLANES];
-		ia_css_ptr *virt_addr_tetra_y[
+		ia_css_ptr *virt_addr_tetra_x[IA_CSS_MORPH_TABLE_NUM_PLANES];
+		ia_css_ptr *virt_addr_tetra_y[IA_CSS_MORPH_TABLE_NUM_PLANES];
 
-		IA_CSS_MORPH_TABLE_NUM_PLANES];
-		size_t *virt_size_tetra_y[
-
-		IA_CSS_MORPH_TABLE_NUM_PLANES];
+		size_t *virt_size_tetra_x[IA_CSS_MORPH_TABLE_NUM_PLANES];
+		size_t *virt_size_tetra_y[IA_CSS_MORPH_TABLE_NUM_PLANES];
 
 		virt_addr_tetra_x[0] = &ddr_map->tetra_r_x;
 		virt_addr_tetra_x[1] = &ddr_map->tetra_gr_x;
@@ -3752,23 +3702,19 @@ sh_css_params_write_to_ddr_internal(
 		buff_realloced = false;
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			buff_realloced |=
-			    reallocate_buffer(virt_addr_tetra_x[i],
-					    virt_size_tetra_x[i],
-					    (size_t)
-					    (MORPH_PLANE_BYTES(binary)),
-					    params->morph_table_changed,
-					    &err);
+				reallocate_buffer(virt_addr_tetra_x[i],
+						  virt_size_tetra_x[i],
+						  (size_t) (MORPH_PLANE_BYTES(binary)),
+						  params->morph_table_changed, &err);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
 			}
 			buff_realloced |=
-			    reallocate_buffer(virt_addr_tetra_y[i],
-					    virt_size_tetra_y[i],
-					    (size_t)
-					    (MORPH_PLANE_BYTES(binary)),
-					    params->morph_table_changed,
-					    &err);
+				reallocate_buffer(virt_addr_tetra_y[i],
+						  virt_size_tetra_y[i],
+						  (size_t) (MORPH_PLANE_BYTES(binary)),
+						  params->morph_table_changed, &err);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
@@ -3795,15 +3741,15 @@ sh_css_params_write_to_ddr_internal(
 
 			for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 				store_morph_plane(table->coordinates_x[i],
-						table->width,
-						table->height,
-						*virt_addr_tetra_x[i],
-						binary->morph_tbl_aligned_width);
+						  table->width,
+						  table->height,
+						  *virt_addr_tetra_x[i],
+						  binary->morph_tbl_aligned_width);
 				store_morph_plane(table->coordinates_y[i],
-						table->width,
-						table->height,
-						*virt_addr_tetra_y[i],
-						binary->morph_tbl_aligned_width);
+						  table->width,
+						  table->height,
+						  *virt_addr_tetra_y[i],
+						  binary->morph_tbl_aligned_width);
 			}
 			if (id_table)
 				ia_css_morph_table_free(id_table);
@@ -3811,19 +3757,20 @@ sh_css_params_write_to_ddr_internal(
 	}
 
 	/* After special cases like SC, FPN since they may change parameters */
-	for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
 		const struct ia_css_isp_data *isp_data =
 		    ia_css_isp_param_get_isp_mem_init(&binary->info->sp.mem_initializers,
-						    IA_CSS_PARAM_CLASS_PARAM, mem);
+						      IA_CSS_PARAM_CLASS_PARAM, mem);
 		size_t size = isp_data->size;
 
-		if (!size) continue;
+		if (!size)
+			continue;
+
 		buff_realloced = reallocate_buffer(&ddr_map->isp_mem_param[stage_num][mem],
-						&ddr_map_size->isp_mem_param[stage_num][mem],
-						size,
-						params->isp_mem_params_changed[pipe_id][stage_num][mem],
-						&err);
+						   &ddr_map_size->isp_mem_param[stage_num][mem],
+						   size,
+						   params->isp_mem_params_changed[pipe_id][stage_num][mem],
+						   &err);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -3852,8 +3799,8 @@ const struct ia_css_fpn_table *ia_css_get_fpn_table(struct ia_css_stream
 	return &params->fpn_config;
 }
 
-struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
-	*stream)
+struct ia_css_shading_table *ia_css_get_shading_table(
+		struct ia_css_stream *stream)
 {
 	struct ia_css_shading_table *table = NULL;
 	struct ia_css_isp_parameters *params;
@@ -3870,8 +3817,8 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 		if (params->sc_table) {
 			table = (struct ia_css_shading_table *)params->sc_table;
 		} else {
-			const struct ia_css_binary *binary
-			    = ia_css_stream_get_shading_correction_binary(stream);
+			const struct ia_css_binary *binary =
+				ia_css_stream_get_shading_correction_binary(stream);
 			if (binary) {
 				/* generate the identical shading table */
 				if (params->sc_config) {
@@ -3882,19 +3829,23 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 									binary->sctbl_width_per_color,
 									binary->sctbl_height);
 				table = params->sc_config;
-				/* The sc_config will be freed in the
-				 * ia_css_stream_isp_parameters_uninit function. */
+				/*
+				 * The sc_config will be freed in the
+				 * ia_css_stream_isp_parameters_uninit function.xi
+				 */
 			}
 		}
 	} else {
 		/* ------ deprecated(bz675) : from ------ */
-		const struct ia_css_binary *binary
-		    = ia_css_stream_get_shading_correction_binary(stream);
+		const struct ia_css_binary *binary =
+			ia_css_stream_get_shading_correction_binary(stream);
 		struct ia_css_pipe *pipe;
 
 		/**********************************************************************/
-		/* following code is copied from function ia_css_stream_get_shading_correction_binary()
-		 * to match with the binary */
+		/*
+		 * following code is copied from function ia_css_stream_get_shading_correction_binary()
+		 * to match with the binary
+		 */
 		pipe = stream->pipes[0];
 
 		if (stream->num_pipes == 2) {
@@ -3916,8 +3867,10 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 			    binary, pipe->required_bds_factor);
 
 			table = params->sc_config;
-			/* The sc_config will be freed in the
-			 * ia_css_stream_isp_parameters_uninit function. */
+			/*
+			 * The sc_config will be freed in the
+			 * ia_css_stream_isp_parameters_uninit function.
+			 */
 		}
 		/* ------ deprecated(bz675) : to ------ */
 	}
@@ -3930,45 +3883,38 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
-	hmm_store(xmem_sp_group_ptrs,
-		   &sh_css_sp_group,
-		   sizeof(struct sh_css_sp_group));
+	hmm_store(xmem_sp_group_ptrs, &sh_css_sp_group,
+		  sizeof(struct sh_css_sp_group));
 	return xmem_sp_group_ptrs;
 }
 
-ia_css_ptr sh_css_store_sp_stage_to_ddr(
-    unsigned int pipe,
-    unsigned int stage)
+ia_css_ptr sh_css_store_sp_stage_to_ddr(unsigned int pipe, unsigned int stage)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
-	hmm_store(xmem_sp_stage_ptrs[pipe][stage],
-		   &sh_css_sp_stage,
-		   sizeof(struct sh_css_sp_stage));
+	hmm_store(xmem_sp_stage_ptrs[pipe][stage], &sh_css_sp_stage,
+		  sizeof(struct sh_css_sp_stage));
 	return xmem_sp_stage_ptrs[pipe][stage];
 }
 
-ia_css_ptr sh_css_store_isp_stage_to_ddr(
-    unsigned int pipe,
-    unsigned int stage)
+ia_css_ptr sh_css_store_isp_stage_to_ddr(unsigned int pipe, unsigned int stage)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
-	hmm_store(xmem_isp_stage_ptrs[pipe][stage],
-		   &sh_css_isp_stage,
-		   sizeof(struct sh_css_isp_stage));
+	hmm_store(xmem_isp_stage_ptrs[pipe][stage], &sh_css_isp_stage,
+		  sizeof(struct sh_css_isp_stage));
 	return xmem_isp_stage_ptrs[pipe][stage];
 }
 
-static int ref_sh_css_ddr_address_map(
-    struct sh_css_ddr_address_map *map,
-    struct sh_css_ddr_address_map *out)
+static int ref_sh_css_ddr_address_map(struct sh_css_ddr_address_map *map,
+				      struct sh_css_ddr_address_map *out)
 {
 	int err = 0;
 	unsigned int i;
 
-	/* we will use a union to copy things; overlaying an array
-	   with the struct; that way adding fields in the struct
-	   will keep things working, and we will not get type errors.
-	*/
+	/*
+	 * we will use a union to copy things; overlaying an array
+	 * with the struct; that way adding fields in the struct
+	 * will keep things working, and we will not get type errors.
+	 */
 	union {
 		struct sh_css_ddr_address_map *map;
 		ia_css_ptr *addrs;
@@ -3999,8 +3945,8 @@ static int ref_sh_css_ddr_address_map(
 }
 
 static int write_ia_css_isp_parameter_set_info_to_ddr(
-    struct ia_css_isp_parameter_set_info *me,
-    ia_css_ptr *out)
+		struct ia_css_isp_parameter_set_info *me,
+		ia_css_ptr *out)
 {
 	int err = 0;
 	bool succ;
@@ -4014,8 +3960,8 @@ static int write_ia_css_isp_parameter_set_info_to_ddr(
 					 hmm_alloc(sizeof(struct ia_css_isp_parameter_set_info), HMM_BO_PRIVATE, 0, NULL, 0));
 	succ = (*out != mmgr_NULL);
 	if (succ)
-		hmm_store(*out,
-			   me, sizeof(struct ia_css_isp_parameter_set_info));
+		hmm_store(*out, me,
+			  sizeof(struct ia_css_isp_parameter_set_info));
 	else
 		err = -ENOMEM;
 
@@ -4023,9 +3969,8 @@ static int write_ia_css_isp_parameter_set_info_to_ddr(
 	return err;
 }
 
-static int
-free_ia_css_isp_parameter_set_info(
-    ia_css_ptr ptr) {
+static int free_ia_css_isp_parameter_set_info(ia_css_ptr ptr)
+{
 	int err = 0;
 	struct ia_css_isp_parameter_set_info isp_params_info;
 	unsigned int i;
@@ -4034,8 +3979,7 @@ free_ia_css_isp_parameter_set_info(
 	IA_CSS_ENTER_PRIVATE("ptr = %u", ptr);
 
 	/* sanity check - ptr must be valid */
-	if (!ia_css_refcount_is_valid(ptr))
-	{
+	if (!ia_css_refcount_is_valid(ptr)) {
 		IA_CSS_ERROR("%s: IA_CSS_REFCOUNT_PARAM_SET_POOL(0x%x) invalid arg", __func__,
 			     ptr);
 		err = -EINVAL;
@@ -4046,8 +3990,7 @@ free_ia_css_isp_parameter_set_info(
 	hmm_load(ptr, &isp_params_info.mem_map, sizeof(struct sh_css_ddr_address_map));
 	/* copy map using size info */
 	for (i = 0; i < (sizeof(struct sh_css_ddr_address_map_size) /
-			 sizeof(size_t)); i++)
-	{
+			 sizeof(size_t)); i++) {
 		if (addrs[i] == mmgr_NULL)
 			continue;
 
@@ -4081,9 +4024,8 @@ sh_css_invalidate_params(struct ia_css_stream *stream)
 	params->isp_params_changed = true;
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		for (j = 0; j < SH_CSS_MAX_STAGES; j++) {
-			for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
+			for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++)
 				params->isp_mem_params_changed[i][j][mem] = true;
-			}
 		}
 	}
 
@@ -4106,18 +4048,16 @@ sh_css_invalidate_params(struct ia_css_stream *stream)
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-void
-sh_css_update_uds_and_crop_info(
-    const struct ia_css_binary_info *info,
-    const struct ia_css_frame_info *in_frame_info,
-    const struct ia_css_frame_info *out_frame_info,
-    const struct ia_css_resolution *dvs_env,
-    const struct ia_css_dz_config *zoom,
-    const struct ia_css_vector *motion_vector,
-    struct sh_css_uds_info *uds,		/* out */
-    struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
-
-    bool enable_zoom)
+void sh_css_update_uds_and_crop_info(
+		const struct ia_css_binary_info *info,
+		const struct ia_css_frame_info *in_frame_info,
+		const struct ia_css_frame_info *out_frame_info,
+		const struct ia_css_resolution *dvs_env,
+		const struct ia_css_dz_config *zoom,
+		const struct ia_css_vector *motion_vector,
+		struct sh_css_uds_info *uds,			/* out */
+		struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
+		bool enable_zoom)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
@@ -4195,20 +4135,26 @@ sh_css_update_uds_and_crop_info(
 			/* clip the motion vector to +/- half the envelope */
 			motion_x = clamp(motion_x, -half_env_x, half_env_x);
 			motion_y = clamp(motion_y, -half_env_y, half_env_y);
-			/* for video with downscaling, the envelope is included
-			    in the input resolution. */
+			/*
+			 * for video with downscaling, the envelope is included
+			 * in the input resolution.
+			 */
 			uds_xc = in_frame_info->res.width / 2 + motion_x;
 			uds_yc = in_frame_info->res.height / 2 + motion_y;
 			crop_x = info->pipeline.left_cropping;
-			/* ds == 2 (yuv_ds) can be pipelined, remove top
-			   lines */
+			/*
+			 * ds == 2 (yuv_ds) can be pipelined,
+			 * remove top lines
+			 */
 			if (info->enable.ds & 1)
 				crop_y = info->pipeline.top_cropping;
 			else
 				crop_y = 2;
 		} else {
-			/* video nodz: here we can only crop. We make sure we
-			   crop at least the first 8x8 pixels away. */
+			/*
+			 * video nodz: here we can only crop. We make sure we
+			 * crop at least the first 8x8 pixels away.
+			 */
 			env_width  = dvs_env->width -
 				     SH_CSS_MIN_DVS_ENVELOPE;
 			env_height = dvs_env->height -
@@ -4243,28 +4189,29 @@ sh_css_update_uds_and_crop_info(
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-static int
-sh_css_update_uds_and_crop_info_based_on_zoom_region(
-    const struct ia_css_binary_info *info,
-    const struct ia_css_frame_info *in_frame_info,
-    const struct ia_css_frame_info *out_frame_info,
-    const struct ia_css_resolution *dvs_env,
-    const struct ia_css_dz_config *zoom,
-    const struct ia_css_vector *motion_vector,
-    struct sh_css_uds_info *uds,		/* out */
-    struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
-    struct ia_css_resolution pipe_in_res,
-    bool enable_zoom) {
+static int sh_css_update_uds_and_crop_info_based_on_zoom_region(
+		const struct ia_css_binary_info *info,
+		const struct ia_css_frame_info *in_frame_info,
+		const struct ia_css_frame_info *out_frame_info,
+		const struct ia_css_resolution *dvs_env,
+		const struct ia_css_dz_config *zoom,
+		const struct ia_css_vector *motion_vector,
+		struct sh_css_uds_info *uds,			/* out */
+		struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
+		struct ia_css_resolution pipe_in_res,
+		bool enable_zoom)
+{
 	unsigned int x0 = 0, y0 = 0, x1 = 0, y1 = 0;
 	int err = 0;
-	/* Note:
-	* Filter_Envelope = 0 for NND/LUT
-	* Filter_Envelope = 1 for BCI
-	* Filter_Envelope = 3 for BLI
-	* Currently, not considering this filter envelope because, In uds.sp.c is recalculating
-	* the dx/dy based on filter envelope and other information (ia_css_uds_sp_scale_params)
-	* Ideally, That should be done on host side not on sp side.
-	*/
+	/*
+	 * Note:
+	 * Filter_Envelope = 0 for NND/LUT
+	 * Filter_Envelope = 1 for BCI
+	 * Filter_Envelope = 3 for BLI
+	 * Currently, not considering this filter envelope because, In uds.sp.c is recalculating
+	 * the dx/dy based on filter envelope and other information (ia_css_uds_sp_scale_params)
+	 * Ideally, That should be done on host side not on sp side.
+	 */
 	unsigned int filter_envelope = 0;
 
 	IA_CSS_ENTER_PRIVATE("void");
@@ -4285,24 +4232,24 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 	if ((x0 > x1) || (y0 > y1) || (x1 > pipe_in_res.width) || (y1 > pipe_in_res.height))
 		return -EINVAL;
 
-	if (!enable_zoom)
-	{
+	if (!enable_zoom) {
 		uds->curr_dx = HRT_GDC_N;
 		uds->curr_dy = HRT_GDC_N;
 	}
 
-	if (info->enable.dvs_envelope)
-	{
-		/* Zoom region is only supported by the UDS module on ISP
-		 * 2 and higher. It is not supported in video mode on ISP 1 */
+	if (info->enable.dvs_envelope) {
+		/*
+		 * Zoom region is only supported by the UDS module on ISP
+		 * 2 and higher. It is not supported in video mode on ISP 1
+		 */
 		return -EINVAL;
-	} else
-	{
+	} else {
 		if (enable_zoom) {
-			/* A. Calculate dx/dy based on crop region using in_frame_info
-			* Scale the crop region if in_frame_info to the stage is not same as
-			* actual effective input of the pipeline
-			*/
+			/*
+			 * A. Calculate dx/dy based on crop region using in_frame_info
+			 * Scale the crop region if in_frame_info to the stage is not same as
+			 * actual effective input of the pipeline
+			 */
 			if (in_frame_info->res.width != pipe_in_res.width ||
 			    in_frame_info->res.height != pipe_in_res.height) {
 				x0 = (x0 * in_frame_info->res.width) / (pipe_in_res.width);
-- 
2.30.2



