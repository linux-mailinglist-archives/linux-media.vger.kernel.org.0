Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89395454DF8
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240545AbhKQThV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240507AbhKQThL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0D4861A3D;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177651;
        bh=gwVltAv0RDUi+65Bog+2WjWOfbT++yFD5KHj+aIDl70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zs8dnqoOfF6dRXIPaL69nhQkCAjgcC4l/F87K3CJ8UliHzxMX3m4O4Y2b303gvKej
         3yd6nL9YgKPU8T7XEfzY6DwlFFo6sFb4EwHALpIlGuxVHbTWw3+YVToBC+ZVNLmWCm
         GegeV6W7L7YXj5nQjDp0sloZlm4O3KYqnPUM3A++7znQV+bLtTUerYuFgL1/ZfKdsC
         mBFPD/yYXg1hwjCJwt6/Ht1VyKlw3thE4CsXrTqmQIoNMt5+SFabvxJ8zcK4VhBAhr
         +Y1ks6rkaAQ7IFq5XBqVtjtE5oz76ShJJR7HZ0LgCMlIFAgN8nJAfiEz7bKpdhLKOo
         h6ds8NIAGL2dA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHl-3B; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 4/8] media: atomisp: binary.c: drop logic incompatible with firmware
Date:   Wed, 17 Nov 2021 19:34:02 +0000
Message-Id: <93a6f1bfa6c25dda838dba1c3d505285ea930750.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we're using this firmware for ISP2401:
	https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

It makes no sense to try to select a non-existing binary
inside the firmware. So, revert it to reflect the Intel Aero
device driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 .../atomisp/pci/runtime/binary/src/binary.c   | 76 +++----------------
 1 file changed, 9 insertions(+), 67 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 5e435bec942b..406ed5fb4c6a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -108,7 +108,6 @@ ia_css_binary_internal_res(const struct ia_css_frame_info *in_info,
 			       binary_dvs_env.height);
 }
 
-/* ISP2400 */
 /* Computation results of the origin coordinate of bayer on the shading table. */
 struct sh_css_shading_table_bayer_origin_compute_results {
 	u32 bayer_scale_hor_ratio_in;	/* Horizontal ratio (in) of bayer scaling. */
@@ -119,23 +118,7 @@ struct sh_css_shading_table_bayer_origin_compute_results {
 	u32 sc_bayer_origin_y_bqs_on_shading_table; /* Y coordinate (in bqs) of bayer origin on shading table. */
 };
 
-/* ISP2401 */
-/* Requirements for the shading correction. */
-struct sh_css_binary_sc_requirements {
-	/* Bayer scaling factor, for the scaling which is applied before shading correction. */
-	u32 bayer_scale_hor_ratio_in;  /* Horizontal ratio (in) of scaling applied BEFORE shading correction. */
-	u32 bayer_scale_hor_ratio_out; /* Horizontal ratio (out) of scaling applied BEFORE shading correction. */
-	u32 bayer_scale_ver_ratio_in;  /* Vertical ratio (in) of scaling applied BEFORE shading correction. */
-	u32 bayer_scale_ver_ratio_out; /* Vertical ratio (out) of scaling applied BEFORE shading correction. */
-
-	/* ISP internal frame is composed of the real sensor data and the padding data. */
-	u32 sensor_data_origin_x_bqs_on_internal; /* X origin (in bqs) of sensor data on internal frame
-								at shading correction. */
-	u32 sensor_data_origin_y_bqs_on_internal; /* Y origin (in bqs) of sensor data on internal frame
-								at shading correction. */
-};
-
-/* ISP2400: Get the requirements for the shading correction. */
+/* Get the requirements for the shading correction. */
 static int
 ia_css_binary_compute_shading_table_bayer_origin(
     const struct ia_css_binary *binary,				/* [in] */
@@ -568,15 +551,9 @@ binary_grid_deci_factor_log2(int width, int height)
 	/* 3A/Shading decimation factor spcification (at August 2008)
 	 * ------------------------------------------------------------------
 	 * [Image Width (BQ)] [Decimation Factor (BQ)] [Resulting grid cells]
-	#ifndef ISP2401
 	 * 1280 ?c             32                       40 ?c
 	 *  640 ?c 1279        16                       40 ?c 80
 	 *      ?c  639         8                          ?c 80
-	#else
-	 * from 1280                   32                 from 40
-	 * from  640 to 1279           16                 from 40 to 80
-	 *           to  639            8                         to 80
-	#endif
 	 * ------------------------------------------------------------------
 	 */
 	/* Maximum and minimum decimation factor by the specification */
@@ -938,15 +915,9 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 
 	if (info->enable.sc)
 	{
-		if (!IS_ISP2401) {
-			binary->sctbl_width_per_color = _ISP_SCTBL_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
-			binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
-			binary->sctbl_height = _ISP_SCTBL_HEIGHT(sc_3a_dis_height, s3a_log_deci);
-		} else {
-			binary->sctbl_width_per_color = _ISP2401_SCTBL_WIDTH_PER_COLOR(isp_internal_width, s3a_log_deci);
-			binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
-			binary->sctbl_height = _ISP2401_SCTBL_HEIGHT(isp_internal_height, s3a_log_deci);
-		}
+		binary->sctbl_width_per_color = _ISP_SCTBL_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
+		binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
+		binary->sctbl_height = _ISP_SCTBL_HEIGHT(sc_3a_dis_height, s3a_log_deci);
 	} else
 	{
 		binary->sctbl_width_per_color         = 0;
@@ -980,11 +951,7 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		*req_vf_info;
 
 	struct ia_css_binary_xinfo *xcandidate;
-#ifndef ISP2401
 	bool need_ds, need_dz, need_dvs, need_xnr, need_dpc;
-#else
-	bool need_ds, need_dz, need_dvs, need_xnr, need_dpc, need_tnr;
-#endif
 	bool striped;
 	bool enable_yuv_ds;
 	bool enable_high_speed;
@@ -1012,33 +979,21 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	stream_format = descr->stream_format;
 	req_in_info = descr->in_info;
 	req_bds_out_info = descr->bds_out_info;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		req_out_info[i] = descr->out_info[i];
 		if (req_out_info[i] && (req_out_info[i]->res.width != 0))
 			req_bin_out_info = req_out_info[i];
 	}
 	if (!req_bin_out_info)
 		return -EINVAL;
-#ifndef ISP2401
 	req_vf_info = descr->vf_info;
-#else
-
-	if ((descr->vf_info) && (descr->vf_info->res.width == 0))
-		/* width==0 means that there is no vf pin (e.g. in SkyCam preview case) */
-		req_vf_info = NULL;
-	else
-		req_vf_info = descr->vf_info;
-#endif
 
 	need_xnr = descr->enable_xnr;
 	need_ds = descr->enable_fractional_ds;
 	need_dz = false;
 	need_dvs = false;
 	need_dpc = descr->enable_dpc;
-#ifdef ISP2401
-	need_tnr = descr->enable_tnr;
-#endif
+
 	enable_yuv_ds = descr->enable_yuv_ds;
 	enable_high_speed = descr->enable_high_speed;
 	enable_dvs_6axis  = descr->enable_dvs_6axis;
@@ -1053,8 +1008,7 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	internal_res.width = 0;
 	internal_res.height = 0;
 
-	if (mode == IA_CSS_BINARY_MODE_VIDEO)
-	{
+	if (mode == IA_CSS_BINARY_MODE_VIDEO) {
 		dvs_env = descr->dvs_env;
 		need_dz = descr->enable_dz;
 		/* Video is the only mode that has a nodz variant. */
@@ -1063,8 +1017,7 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 
 	/* print a map of the binary file */
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"BINARY INFO:\n");
-	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++) {
 		xcandidate = binary_infos[i];
 		if (xcandidate) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"%d:\n", i);
@@ -1079,8 +1032,7 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 
 	/* printf("sh_css_binary_find: pipe version %d\n", isp_pipe_version); */
 	for (xcandidate = binary_infos[mode]; xcandidate;
-	     xcandidate = xcandidate->next)
-	{
+	     xcandidate = xcandidate->next) {
 		struct ia_css_binary_info *candidate = &xcandidate->sp;
 		/* printf("sh_css_binary_find: evaluating candidate:
 		 * %d\n",candidate->id); */
@@ -1338,16 +1290,6 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 			continue;
 		}
 
-#ifdef ISP2401
-		if (!candidate->enable.tnr && need_tnr) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-					    __LINE__, candidate->enable.tnr,
-					    descr->enable_tnr);
-			continue;
-		}
-
-#endif
 		/* reconfigure any variable properties of the binary */
 		err = ia_css_binary_fill_info(xcandidate, online, two_ppc,
 					      stream_format, req_in_info,
-- 
2.33.1

