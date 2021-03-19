Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AF4342413
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCSSH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:07:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230285AbhCSSHG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:07:06 -0400
IronPort-SDR: Nw6gXpnEF0tx2ue+mB2qSN+kw07pRLkWBPN4AzV+gXoKla50t7K0n0coJnBCWGv36N5d0FvlYX
 Xzx2dWOD8VpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036056"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:07:05 -0700
IronPort-SDR: rElUgfs7LyiAKG9gI2du4OUNK+miMjJ2L7dDa8plhROo9cTNzDdWs1Ne9sxQZIsAYvj/CWtpAu
 b1ismd4+YYgA==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605805"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:07:02 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 09/10] media: Keem Bay Camera: Add metadata video node
Date:   Fri, 19 Mar 2021 18:06:31 +0000
Message-Id: <20210319180632.585-10-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>

Metadata video node implements output and capture meta type
interface.

- Output video node is used to provide isp parameters for processing.

Each buffer internally has real vpu isp params structure
allocated. User space params are copied on every qbuf based on
update flags. Since vpu need every time all parameters to be provided,
params are copied on every qbuf. Based on update flags they are copied
from userspace buffer or last buffer processed.
To reduce coping of the tables, they are allocated separately
in table buffer pool.
The tables are copied only when there is update from the userspace,
otherwise they are only reference from last processed frame.
This is possible because vpu interface has separate address for each table.

- Capture video node is used to provide statistics to userspace.
Capture video node statistics memory addresses are copied to isp
params before processing, and corresponding update flags are set
based on statistics availability.

Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Co-developed-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
Signed-off-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
Co-developed-by: Martina Krasteva <martinax.krasteva@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/platform/keembay-camera/Makefile     |    4 +-
 .../platform/keembay-camera/keembay-metadata.c     | 1823 +++++++++++++++++++-
 .../platform/keembay-camera/keembay-metadata.h     |   14 +-
 .../keembay-camera/keembay-params-defaults.c       |  326 ++++
 .../keembay-camera/keembay-params-defaults.h       |   38 +
 5 files changed, 2194 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.h

diff --git a/drivers/media/platform/keembay-camera/Makefile b/drivers/media/platform/keembay-camera/Makefile
index 8b3ad715c5c4..1b949cf009ef 100644
--- a/drivers/media/platform/keembay-camera/Makefile
+++ b/drivers/media/platform/keembay-camera/Makefile
@@ -1,5 +1,5 @@
 keembay-cam-objs = keembay-camera.o keembay-pipeline.o \
-		      keembay-cam-xlink.o keembay-isp.o \
-		      keembay-metadata.o keembay-video.o
+		      keembay-cam-xlink.o keembay-params-defaults.o \
+		      keembay-isp.o keembay-metadata.o keembay-video.o
 
 obj-$(CONFIG_VIDEO_INTEL_KEEMBAY_CAMERA) += keembay-cam.o
diff --git a/drivers/media/platform/keembay-camera/keembay-metadata.c b/drivers/media/platform/keembay-camera/keembay-metadata.c
index a1df746d9582..8807e3f322c5 100644
--- a/drivers/media/platform/keembay-camera/keembay-metadata.c
+++ b/drivers/media/platform/keembay-camera/keembay-metadata.c
@@ -4,17 +4,1818 @@
  *
  * Copyright (C) 2021 Intel Corporation
  */
+
+#include <linux/keembay-isp-ctl.h>
+#include <linux/dmapool.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "keembay-pipeline.h"
 #include "keembay-metadata.h"
 
+#define KMB_CAM_METADATA_STATS_NAME "keembay-metadata-stats"
+#define KMB_CAM_METADATA_PARAMS_NAME "keembay-metadata-params"
+
+#define KMB_TABLE_ALIGN 64
+
+/* Table names map */
+static const char *table_name[KMB_METADATA_TABLE_MAX] = {
+	"LSC",
+	"StaticDefect",
+	"LCA",
+	"HDR",
+	"Sharpness",
+	"Color cumb",
+	"LUT",
+	"TNF1",
+	"TNF2",
+	"Dehaze",
+	"Warp",
+};
+
+static void
+kmb_metadata_copy_blc(struct kmb_vpu_blc_params *dst,
+		      struct kmb_blc_params *src)
+{
+	int i;
+
+	for (i = 0; i < KMB_CAM_MAX_EXPOSURES; i++) {
+		dst[i].coeff1 = src[i].coeff1;
+		dst[i].coeff2 = src[i].coeff2;
+		dst[i].coeff3 = src[i].coeff3;
+		dst[i].coeff4 = src[i].coeff4;
+	}
+}
+
+static void
+kmb_metadata_copy_sigma_dns(struct kmb_vpu_sigma_dns_params *dst,
+			    struct kmb_sigma_dns_params *src)
+{
+	int i;
+
+	for (i = 0; i < KMB_CAM_MAX_EXPOSURES; i++) {
+		dst[i].noise = src[i].noise;
+		dst[i].threshold1 = src[i].threshold1;
+		dst[i].threshold2 = src[i].threshold2;
+		dst[i].threshold3 = src[i].threshold3;
+		dst[i].threshold4 = src[i].threshold4;
+		dst[i].threshold5 = src[i].threshold5;
+		dst[i].threshold6 = src[i].threshold6;
+		dst[i].threshold7 = src[i].threshold7;
+		dst[i].threshold8 = src[i].threshold8;
+	}
+}
+
+static void
+kmb_metadata_copy_lsc(struct kmb_vpu_lsc_params *dst,
+		      struct kmb_lsc_params *src)
+{
+	dst->threshold = src->threshold;
+	dst->width = src->width;
+	dst->height = src->height;
+}
+
+static void
+kmb_metadata_copy_raw(struct kmb_vpu_raw_params *dst,
+		      struct kmb_raw_params *src)
+{
+	dst->awb_stats_en = src->awb_stats_en;
+	dst->awb_rgb_hist_en = src->awb_rgb_hist_en;
+	dst->af_stats_en = src->af_stats_en;
+	dst->luma_hist_en = src->luma_hist_en;
+	dst->flicker_accum_en = src->flicker_accum_en;
+	dst->bad_pixel_fix_en = src->bad_pixel_fix_en;
+	dst->grgb_imb_en = src->grgb_imb_en;
+	dst->mono_imbalance_en = src->mono_imbalance_en;
+	dst->gain1 = src->gain1;
+	dst->gain2 = src->gain2;
+	dst->gain3 = src->gain3;
+	dst->gain4 = src->gain4;
+	dst->stop1 = src->stop1;
+	dst->stop2 = src->stop2;
+	dst->stop3 = src->stop3;
+	dst->stop4 = src->stop4;
+	dst->threshold1 = src->threshold1;
+	dst->alpha1 = src->alpha1;
+	dst->alpha2 = src->alpha2;
+	dst->alpha3 = src->alpha3;
+	dst->alpha4 = src->alpha4;
+	dst->threshold2 = src->threshold2;
+	dst->static_defect_size = src->static_defect_size;
+	dst->flicker_first_row_acc = src->start_row;
+	dst->flicker_last_row_acc = src->end_row;
+}
+
+static void
+kmb_metadata_copy_ae_awb(struct kmb_vpu_ae_awb_params *dst,
+			 struct kmb_ae_awb_params *src)
+{
+	dst->start_x = src->start_x;
+	dst->start_y = src->start_y;
+	dst->width = src->width;
+	dst->height = src->height;
+	dst->skip_x = src->skip_x;
+	dst->skip_y = src->skip_y;
+	dst->patches_x = src->patches_x;
+	dst->patches_y = src->patches_y;
+	dst->threshold1 = src->threshold1;
+	dst->threshold2 = src->threshold2;
+}
+
+static void
+kmb_metadata_copy_af(struct kmb_vpu_af_params *dst,
+		     struct kmb_af_params *src)
+{
+	int i;
+
+	dst->start_x = src->start_x;
+	dst->start_y = src->start_y;
+	dst->width = src->width;
+	dst->height = src->height;
+	dst->patches_x = src->patches_x;
+	dst->patches_y = src->patches_y;
+	dst->coeff = src->coeff;
+	dst->threshold1 = src->threshold1;
+	dst->threshold2 = src->threshold2;
+
+	for (i = 0; i < ARRAY_SIZE(dst->coeffs1); i++) {
+		dst->coeffs1[i] = src->coeffs1[i];
+		dst->coeffs2[i] = src->coeffs2[i];
+	}
+}
+
+static void
+kmb_metadata_copy_histogram(struct kmb_vpu_hist_params *dst,
+			    struct kmb_hist_params *src)
+{
+	int i;
+
+	dst->start_x = src->start_x;
+	dst->start_y = src->start_y;
+	dst->end_x = src->end_x;
+	dst->end_y = src->end_y;
+
+	for (i = 0; i < ARRAY_SIZE(dst->matrix); i++)
+		dst->matrix[i] = src->matrix[i];
+
+	for (i = 0; i < ARRAY_SIZE(dst->weight); i++)
+		dst->weight[i] = src->weight[i];
+}
+
+static void
+kmb_metadata_copy_debayer(struct kmb_vpu_debayer_params *dst,
+			  struct kmb_debayer_params *src)
+{
+	dst->coeff1 = src->coeff1;
+	dst->multiplier1 = src->multiplier1;
+	dst->multiplier2 = src->multiplier2;
+	dst->coeff2 = src->coeff2;
+	dst->coeff3 = src->coeff3;
+	dst->coeff4 = src->coeff4;
+}
+
+static void
+kmb_metadata_copy_dog_dns(struct kmb_vpu_dog_dns_params *dst,
+			  struct kmb_dog_dns_params *src)
+{
+	int i;
+
+	dst->threshold = src->threshold;
+	dst->strength = src->strength;
+
+	for (i = 0; i < ARRAY_SIZE(dst->coeffs11); i++)
+		dst->coeffs11[i] = src->coeffs11[i];
+
+	for (i = 0; i < ARRAY_SIZE(dst->coeffs15); i++)
+		dst->coeffs15[i] = src->coeffs15[i];
+}
+
+static void
+kmb_metadata_copy_luma_dns(struct kmb_vpu_luma_dns_params *dst,
+			   struct kmb_luma_dns_params *src)
+{
+	dst->threshold = src->threshold;
+	dst->slope = src->slope;
+	dst->shift = src->shift;
+	dst->alpha = src->alpha;
+	dst->weight = src->weight;
+	dst->per_pixel_alpha_en = src->per_pixel_alpha_en;
+	dst->gain_bypass_en = src->gain_bypass_en;
+}
+
+static void
+kmb_metadata_copy_sharpen(struct kmb_vpu_sharpen_params *dst,
+			  struct kmb_sharpen_params *src)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dst->coeffs1); i++) {
+		dst->coeffs1[i] = src->coeffs1[i];
+		dst->coeffs2[i] = src->coeffs2[i];
+		dst->coeffs3[i] = src->coeffs3[i];
+	}
+
+	dst->shift = src->shift;
+	dst->gain1 = src->gain1;
+	dst->gain2 = src->gain2;
+	dst->gain3 = src->gain3;
+	dst->gain4 = src->gain4;
+	dst->gain5 = src->gain5;
+
+	for (i = 0; i < ARRAY_SIZE(dst->stops1); i++) {
+		dst->stops1[i] = src->stops1[i];
+		dst->gains[i] = src->gains[i];
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dst->stops2); i++)
+		dst->stops2[i] = src->stops2[i];
+
+	dst->overshoot = src->overshoot;
+	dst->undershoot = src->undershoot;
+	dst->alpha = src->alpha;
+	dst->gain6 = src->gain6;
+	dst->offset = src->offset;
+}
+
+static void
+kmb_metadata_copy_chroma_gen(struct kmb_vpu_chroma_gen_params *dst,
+			     struct kmb_chroma_gen_params *src)
+{
+	int i;
+
+	dst->epsilon = src->epsilon;
+	dst->coeff1 = src->coeff1;
+	dst->coeff2 = src->coeff2;
+	dst->coeff3 = src->coeff3;
+	dst->coeff4 = src->coeff4;
+	dst->coeff5 = src->coeff5;
+	dst->coeff6 = src->coeff6;
+	dst->strength1 = src->strength1;
+	dst->strength2 = src->strength2;
+
+	for (i = 0; i < ARRAY_SIZE(dst->coeffs); i++)
+		dst->coeffs[i] = src->coeffs[i];
+
+	dst->offset1 = src->offset1;
+	dst->slope1 = src->slope1;
+	dst->slope2 = src->slope2;
+	dst->offset2 = src->offset2;
+	dst->limit = src->limit;
+}
+
+static void
+kmb_metadata_copy_median(struct kmb_vpu_median_params *dst,
+			 struct kmb_median_params *src)
+{
+	dst->size = src->size;
+	dst->slope = src->slope;
+	dst->offset = src->offset;
+}
+
+static void
+kmb_metadata_copy_chroma_dns(struct kmb_vpu_chroma_dns_params *dst,
+			     struct kmb_chroma_dns_params *src)
+{
+	dst->limit = src->limit;
+	dst->enable = src->enable;
+	dst->threshold1 = src->threshold1;
+	dst->threshold2 = src->threshold2;
+	dst->threshold3 = src->threshold3;
+	dst->threshold4 = src->threshold4;
+	dst->threshold5 = src->threshold5;
+	dst->threshold6 = src->threshold6;
+	dst->threshold7 = src->threshold7;
+	dst->threshold8 = src->threshold8;
+	dst->slope1 = src->slope1;
+	dst->offset1 = src->offset1;
+	dst->slope2 = src->slope2;
+	dst->offset2 = src->offset2;
+	dst->grey1 = src->grey1;
+	dst->grey2 = src->grey2;
+	dst->grey3 = src->grey3;
+	dst->coeff1 = src->coeff1;
+	dst->coeff2 = src->coeff2;
+	dst->coeff3 = src->coeff3;
+}
+
+static void
+kmb_metadata_copy_color_comb(struct kmb_vpu_color_comb_params *dst,
+			     struct kmb_color_comb_params *src)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dst->matrix); i++)
+		dst->matrix[i] = src->matrix[i];
+
+	for (i = 0; i < ARRAY_SIZE(dst->offsets); i++)
+		dst->offsets[i] = src->offsets[i];
+
+	dst->coeff1 = src->coeff1;
+	dst->coeff2 = src->coeff2;
+	dst->coeff3 = src->coeff3;
+	dst->enable = src->enable;
+	dst->weight1 = src->weight1;
+	dst->weight2 = src->weight2;
+	dst->weight3 = src->weight3;
+	dst->limit1 = src->limit1;
+	dst->limit2 = src->limit2;
+	dst->offset1 = src->offset1;
+	dst->offset2 = src->offset2;
+}
+
+static void
+kmb_metadata_copy_hdr(struct kmb_vpu_hdr_params *dst,
+		      struct kmb_hdr_params *src)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dst->ratio); i++)
+		dst->ratio[i] = src->ratio[i];
+
+	for (i = 0; i < ARRAY_SIZE(dst->scale); i++)
+		dst->scale[i] = src->scale[i];
+
+	dst->offset1 = src->offset1;
+	dst->slope1 = src->slope1;
+	dst->offset2 = src->offset2;
+	dst->slope2 = src->slope2;
+	dst->offset3 = src->offset3;
+	dst->slope3 = src->slope3;
+	dst->offset4 = src->offset4;
+	dst->gain1 = src->gain1;
+
+	for (i = 0; i < ARRAY_SIZE(dst->blur1); i++)
+		dst->blur1[i] = src->blur1[i];
+
+	for (i = 0; i < ARRAY_SIZE(dst->blur2); i++)
+		dst->blur2[i] = src->blur2[i];
+
+	dst->contrast1 = src->contrast1;
+	dst->contrast2 = src->contrast2;
+	dst->enable1 = src->enable1;
+	dst->enable2 = src->enable2;
+	dst->offset5 = src->offset5;
+	dst->gain2 = src->gain2;
+	dst->offset6 = src->offset6;
+	dst->strength = src->strength;
+	dst->offset7 = src->offset7;
+	dst->shift = src->shift;
+	dst->field1 = src->field1;
+	dst->field2 = src->field2;
+	dst->gain3 = src->gain3;
+	dst->min = src->min;
+}
+
+static void
+kmb_metadata_copy_lut(struct kmb_vpu_lut_params *dst,
+		      struct kmb_lut_params *src)
+{
+	int i;
+
+	dst->size = src->size;
+	for (i = 0; i < ARRAY_SIZE(dst->matrix); i++)
+		dst->matrix[i] = src->matrix[i];
+
+	for (i = 0; i < ARRAY_SIZE(dst->offsets); i++)
+		dst->offsets[i] = src->offsets[i];
+}
+
+static void
+kmb_metadata_copy_tnf(struct kmb_vpu_tnf_params *dst,
+		      struct kmb_tnf_params *src)
+{
+	dst->factor = src->factor;
+	dst->gain = src->gain;
+	dst->offset1 = src->offset1;
+	dst->slope1 = src->slope1;
+	dst->offset2 = src->offset2;
+	dst->slope2 = src->slope2;
+	dst->min1 = src->min1;
+	dst->min2 = src->min2;
+	dst->value = src->value;
+	dst->enable = src->enable;
+}
+
+static void
+kmb_metadata_copy_dehaze(struct kmb_vpu_dehaze_params *dst,
+			 struct kmb_dehaze_params *src)
+{
+	int i;
+
+	dst->gain1 = src->gain1;
+	dst->min = src->min;
+	dst->strength1 = src->strength1;
+	dst->strength2 = src->strength2;
+	dst->gain2 = src->gain2;
+	dst->saturation = src->saturation;
+	dst->value1 = src->value1;
+	dst->value2 = src->value2;
+	dst->value3 = src->value3;
+
+	for (i = 0; i < ARRAY_SIZE(dst->filter); i++)
+		dst->filter[i] = src->filter[i];
+}
+
+static void
+kmb_metadata_copy_warp(struct kmb_vpu_warp_params *dst,
+		       struct kmb_warp_params *src)
+{
+	int i;
+
+	dst->type = src->type;
+	dst->relative = src->relative;
+	dst->format = src->format;
+	dst->position = src->position;
+	dst->width = src->width;
+	dst->height = src->height;
+	dst->stride = src->stride;
+	dst->enable = src->enable;
+
+	for (i = 0; i < ARRAY_SIZE(dst->matrix); i++)
+		dst->matrix[i] = src->matrix[i];
+
+	dst->mode = src->mode;
+
+	for (i = 0; i < ARRAY_SIZE(dst->values); i++)
+		dst->values[i] = src->values[i];
+}
+
+/* VPU Params tables  */
+static struct kmb_metadata_table *
+kmb_metadata_cpalloc_table(struct kmb_metadata *kmb_meta,
+			   enum kmb_metadata_table_type type,
+			   size_t src_table_size)
+{
+	struct kmb_metadata_table *table;
+
+	lockdep_assert_held(&kmb_meta->lock);
+
+	/* First create pool if needed  */
+	if (!kmb_meta->table_pool[type]) {
+		kmb_meta->table_pool[type] =
+			dma_pool_create(table_name[type],
+					kmb_meta->dma_dev,
+					src_table_size + sizeof(*table),
+					KMB_TABLE_ALIGN, 0);
+		if (!kmb_meta->table_pool[type]) {
+			dev_err(kmb_meta->dma_dev,
+				"Fail to create %s pool", table_name[type]);
+			return NULL;
+		}
+	}
+
+	table = kmalloc(sizeof(*table), GFP_KERNEL);
+	if (!table)
+		return NULL;
+
+	kref_init(&table->refcount);
+	table->pool = kmb_meta->table_pool[type];
+
+	table->cpu_addr = dma_pool_alloc(kmb_meta->table_pool[type],
+					 GFP_KERNEL,
+					 &table->dma_addr);
+	if (!table->cpu_addr) {
+		kfree(table);
+		return NULL;
+	}
+
+	return table;
+}
+
+static void kmb_metadata_free_table(struct kref *ref)
+{
+	struct kmb_metadata_table *table =
+		container_of(ref, struct kmb_metadata_table, refcount);
+
+	dma_pool_free(table->pool, table->cpu_addr, table->dma_addr);
+	kfree(table);
+}
+
+static void
+kmb_metadata_release_tables(struct kmb_metadata_buf *meta_buf)
+{
+	int i;
+
+	for (i = 0; i < KMB_METADATA_TABLE_MAX; i++) {
+		if (meta_buf->params.tab[i]) {
+			kref_put(&meta_buf->params.tab[i]->refcount,
+				 kmb_metadata_free_table);
+			meta_buf->params.tab[i] = NULL;
+		}
+	}
+}
+
+static void
+kmb_metadata_destroy_table_pools(struct kmb_metadata *kmb_meta)
+{
+	int i;
+
+	/* Release allocated pools during streaming */
+	for (i = 0; i < KMB_METADATA_TABLE_MAX; i++) {
+		dma_pool_destroy(kmb_meta->table_pool[i]);
+		kmb_meta->table_pool[i] = NULL;
+	}
+}
+
+static dma_addr_t
+kmb_metadata_get_table_addr(struct kmb_metadata_buf *meta_buf,
+			    enum kmb_metadata_table_type type)
+{
+	struct kmb_metadata_table *table = meta_buf->params.tab[type];
+
+	if (!table)
+		return 0;
+
+	return table->dma_addr;
+}
+
+static struct kmb_metadata_table *
+kmb_metadata_create_table(struct kmb_metadata *kmb_meta,
+			  struct kmb_metadata_buf *meta_buf,
+			  enum kmb_metadata_table_type type,
+			  size_t user_table_size)
+{
+	struct kmb_metadata_table *table;
+
+	lockdep_assert_held(&kmb_meta->lock);
+
+	table = kmb_metadata_cpalloc_table(kmb_meta,
+					   type,
+					   user_table_size);
+	if (!table)
+		return NULL;
+
+	if (meta_buf->params.tab[type])
+		kref_put(&meta_buf->params.tab[type]->refcount,
+			 kmb_metadata_free_table);
+
+	meta_buf->params.tab[type] = table;
+
+	return table;
+}
+
+static int
+kmb_metadata_copy_table_usr(struct kmb_metadata *kmb_meta,
+			    struct kmb_metadata_buf *meta_buf,
+			    enum kmb_metadata_table_type type,
+			    u8 *user_table, size_t user_table_size)
+{
+	struct kmb_metadata_table *table;
+
+	table = kmb_metadata_create_table(kmb_meta, meta_buf,
+					  type, user_table_size);
+	if (!table)
+		return -ENOMEM;
+
+	memcpy(table->cpu_addr, user_table, user_table_size);
+
+	return 0;
+}
+
+static int kmb_metadata_create_default_table(struct kmb_metadata *kmb_meta,
+					     struct kmb_metadata_buf *meta_buf,
+					     enum kmb_metadata_table_type type,
+					     u8 *user_table,
+					     size_t user_table_size)
+{
+	struct kmb_metadata_table *table;
+
+	table = kmb_metadata_create_table(kmb_meta, meta_buf,
+					  type, user_table_size);
+	if (!table)
+		return -ENOMEM;
+
+	memset(table->cpu_addr, 0, user_table_size);
+
+	return 0;
+}
+
+static void
+kmb_metadata_copy_table_vpu(struct kmb_metadata_buf *meta_buf,
+			    struct kmb_metadata_buf *last_meta_buf,
+			    enum kmb_metadata_table_type type)
+{
+	/* Do nothing if params are the same */
+	if (WARN_ON(meta_buf->params.isp == last_meta_buf->params.isp))
+		return;
+
+	meta_buf->params.tab[type] = last_meta_buf->params.tab[type];
+	if (meta_buf->params.tab[type])
+		kref_get(&meta_buf->params.tab[type]->refcount);
+}
+
+static void
+kmb_metadata_fill_blc(struct kmb_vpu_isp_params *params,
+		      struct kmb_isp_params *user_params,
+		      struct kmb_vpu_isp_params *last_params,
+		      struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.blc) {
+		kmb_metadata_copy_blc(params->blc, user_params->blc);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(params->blc, last_params->blc,
+			       sizeof(params->blc));
+	} else {
+		memcpy(params->blc, def_params->blc, sizeof(params->blc));
+	}
+}
+
+static void
+kmb_metadata_fill_signma_dns(struct kmb_vpu_isp_params *params,
+			     struct kmb_isp_params *user_params,
+			     struct kmb_vpu_isp_params *last_params,
+			     struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.sigma_dns) {
+		kmb_metadata_copy_sigma_dns(params->sigma_dns,
+					    user_params->sigma_dns);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(params->sigma_dns, last_params->sigma_dns,
+			       sizeof(params->sigma_dns));
+	} else {
+		memcpy(params->sigma_dns, def_params->sigma_dns,
+		       sizeof(params->sigma_dns));
+	}
+}
+
+static void
+kmb_metadata_fill_ae_awb(struct kmb_vpu_isp_params *params,
+			 struct kmb_isp_params *user_params,
+			 struct kmb_vpu_isp_params *last_params,
+			 struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.ae_awb) {
+		kmb_metadata_copy_ae_awb(&params->ae_awb,
+					 &user_params->ae_awb);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->ae_awb, &last_params->ae_awb,
+			       sizeof(params->ae_awb));
+	} else {
+		memcpy(&params->ae_awb, def_params->ae_awb,
+		       sizeof(params->ae_awb));
+	}
+}
+
+static void
+kmb_metadata_fill_af(struct kmb_vpu_isp_params *params,
+		     struct kmb_isp_params *user_params,
+		     struct kmb_vpu_isp_params *last_params,
+		     struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.af) {
+		kmb_metadata_copy_af(&params->af, &user_params->af);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->af, &last_params->af,
+			       sizeof(params->af));
+	} else {
+		memcpy(&params->af, def_params->af, sizeof(params->af));
+	}
+}
+
+static void
+kmb_metadata_fill_histogram(struct kmb_vpu_isp_params *params,
+			    struct kmb_isp_params *user_params,
+			    struct kmb_vpu_isp_params *last_params,
+			    struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.histogram) {
+		kmb_metadata_copy_histogram(&params->histogram,
+					    &user_params->histogram);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->histogram, &last_params->histogram,
+			       sizeof(params->histogram));
+	} else {
+		memcpy(&params->histogram, def_params->histogram,
+		       sizeof(params->histogram));
+	}
+}
+
+static void
+kmb_metadata_fill_debayer(struct kmb_vpu_isp_params *params,
+			  struct kmb_isp_params *user_params,
+			  struct kmb_vpu_isp_params *last_params,
+			  struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.debayer) {
+		kmb_metadata_copy_debayer(&params->debayer,
+					  &user_params->debayer);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->debayer, &last_params->debayer,
+			       sizeof(params->debayer));
+	} else {
+		memcpy(&params->debayer, def_params->debayer,
+		       sizeof(params->debayer));
+	}
+}
+
+static void
+kmb_metadata_fill_dog_dns(struct kmb_vpu_isp_params *params,
+			  struct kmb_isp_params *user_params,
+			  struct kmb_vpu_isp_params *last_params,
+			  struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.dog_dns) {
+		kmb_metadata_copy_dog_dns(&params->dog_dns,
+					  &user_params->dog_dns);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->dog_dns, &last_params->dog_dns,
+			       sizeof(params->dog_dns));
+	} else {
+		memcpy(&params->dog_dns, def_params->dog_dns,
+		       sizeof(params->dog_dns));
+	}
+}
+
+static void
+kmb_metadata_fill_luma_dns(struct kmb_vpu_isp_params *params,
+			   struct kmb_isp_params *user_params,
+			   struct kmb_vpu_isp_params *last_params,
+			   struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.luma_dns) {
+		kmb_metadata_copy_luma_dns(&params->luma_dns,
+					   &user_params->luma_dns);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->luma_dns, &last_params->luma_dns,
+			       sizeof(params->luma_dns));
+	} else {
+		memcpy(&params->luma_dns, def_params->luma_dns,
+		       sizeof(params->luma_dns));
+	}
+}
+
+static void
+kmb_metadata_fill_chroma_gen(struct kmb_vpu_isp_params *params,
+			     struct kmb_isp_params *user_params,
+			     struct kmb_vpu_isp_params *last_params,
+			     struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.chroma_gen) {
+		kmb_metadata_copy_chroma_gen(&params->chroma_gen,
+					     &user_params->chroma_gen);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->chroma_gen, &last_params->chroma_gen,
+			       sizeof(params->chroma_gen));
+	} else {
+		memcpy(&params->chroma_gen, def_params->chroma_gen,
+		       sizeof(params->chroma_gen));
+	}
+}
+
+static void
+kmb_metadata_fill_median(struct kmb_vpu_isp_params *params,
+			 struct kmb_isp_params *user_params,
+			 struct kmb_vpu_isp_params *last_params,
+			 struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.median) {
+		kmb_metadata_copy_median(&params->median,
+					 &user_params->median);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->median, &last_params->median,
+			       sizeof(params->median));
+	} else {
+		memcpy(&params->median, def_params->median,
+		       sizeof(params->median));
+	}
+}
+
+static void
+kmb_metadata_fill_chroma_dns(struct kmb_vpu_isp_params *params,
+			     struct kmb_isp_params *user_params,
+			     struct kmb_vpu_isp_params *last_params,
+			     struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.chroma_dns) {
+		kmb_metadata_copy_chroma_dns(&params->chroma_dns,
+					     &user_params->chroma_dns);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->chroma_dns, &last_params->chroma_dns,
+			       sizeof(params->chroma_dns));
+	} else {
+		memcpy(&params->chroma_dns, def_params->chroma_dns,
+		       sizeof(params->chroma_dns));
+	}
+}
+
+static void
+kmb_metadata_fill_dehaze(struct kmb_vpu_isp_params *params,
+			 struct kmb_isp_params *user_params,
+			 struct kmb_vpu_isp_params *last_params,
+			 struct kmb_vpu_isp_params_defaults *def_params)
+{
+	if (user_params->update.dehaze) {
+		kmb_metadata_copy_dehaze(&params->dehaze,
+					 &user_params->dehaze);
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->dehaze, &last_params->dehaze,
+			       sizeof(params->dehaze));
+	} else {
+		memcpy(&params->dehaze, def_params->dehaze,
+		       sizeof(params->dehaze));
+	}
+}
+
+static int
+kmb_metadata_fill_lsc(struct kmb_metadata *kmb_meta,
+		      struct kmb_metadata_buf *meta_buf,
+		      struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.lsc) {
+		kmb_metadata_copy_lsc(&params->lsc,
+				      &user_params->lsc);
+		if (params->lsc.width && params->lsc.height) {
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_LSC,
+							  user_params->lsc.gain_mesh,
+							  params->lsc.width *
+							  params->lsc.height);
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->lsc, &last_params->lsc,
+			       sizeof(params->lsc));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_LSC);
+	} else {
+		memcpy(&params->lsc, def_params->lsc, sizeof(params->lsc));
+		kmb_metadata_create_default_table(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_LSC,
+						  user_params->lsc.gain_mesh,
+						  ARRAY_SIZE(user_params->lsc.gain_mesh));
+	}
+
+	if (params->lsc.width && params->lsc.height) {
+		params->lsc.addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_LSC);
+		if (!params->lsc.addr)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_raw(struct kmb_metadata *kmb_meta,
+		      struct kmb_metadata_buf *meta_buf,
+		      struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.raw) {
+		kmb_metadata_copy_raw(&params->raw,
+				      &user_params->raw);
+		if (params->raw.static_defect_size) {
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_SDEFECT,
+							  user_params->raw.static_defect_map,
+							  params->raw.static_defect_size);
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->raw, &last_params->raw,
+			       sizeof(params->raw));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_SDEFECT);
+	} else {
+		memcpy(&params->raw, def_params->raw, sizeof(params->raw));
+		kmb_metadata_create_default_table(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_SDEFECT,
+						  user_params->raw.static_defect_map,
+						  ARRAY_SIZE(user_params->raw.static_defect_map));
+	}
+
+	if (params->raw.static_defect_size) {
+		params->raw.static_defect_addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_SDEFECT);
+		if (!params->raw.static_defect_addr)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_lca(struct kmb_metadata *kmb_meta,
+		      struct kmb_metadata_buf *meta_buf,
+		      struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.lca) {
+		ret = kmb_metadata_copy_table_usr(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_LCA,
+						  user_params->lca.coeff,
+						  ARRAY_SIZE(user_params->lca.coeff));
+		if (ret < 0)
+			return ret;
+	} else if (last_params) {
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_LCA);
+	} else {
+		kmb_metadata_create_default_table(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_LCA,
+						  user_params->lca.coeff,
+						  ARRAY_SIZE(user_params->lca.coeff));
+	}
+
+	params->lca.addr = kmb_metadata_get_table_addr(meta_buf,
+						       KMB_METADATA_TABLE_LCA);
+	if (!params->lca.addr)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_sharpen(struct kmb_metadata *kmb_meta,
+			  struct kmb_metadata_buf *meta_buf,
+			  struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.sharpen) {
+		kmb_metadata_copy_sharpen(&params->sharpen,
+					  &user_params->sharpen);
+		ret = kmb_metadata_copy_table_usr(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_SHARP,
+						  user_params->sharpen.radial_lut,
+						  ARRAY_SIZE(user_params->sharpen.radial_lut));
+		if (ret < 0)
+			return ret;
+
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->sharpen, &last_params->sharpen,
+			       sizeof(params->sharpen));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_SHARP);
+	} else {
+		memcpy(&params->sharpen, def_params->sharpen,
+		       sizeof(params->sharpen));
+
+		kmb_metadata_create_default_table(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_SHARP,
+						  user_params->sharpen.radial_lut,
+						  ARRAY_SIZE(user_params->sharpen.radial_lut));
+	}
+
+	params->sharpen.addr =
+		kmb_metadata_get_table_addr(meta_buf,
+					    KMB_METADATA_TABLE_SHARP);
+	if (!params->sharpen.addr)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_color_comb(struct kmb_metadata *kmb_meta,
+			     struct kmb_metadata_buf *meta_buf,
+			     struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	struct kmb_color_comb_params *col = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.color_comb) {
+		col = &user_params->color_comb;
+		kmb_metadata_copy_color_comb(&params->color_comb,
+					     &user_params->color_comb);
+		if (params->color_comb.enable) {
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_COLOR_CUMB,
+							  col->lut_3d,
+							  ARRAY_SIZE(col->lut_3d));
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->color_comb, &last_params->color_comb,
+			       sizeof(params->color_comb));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_COLOR_CUMB);
+	} else {
+		memcpy(&params->color_comb, def_params->color_comb,
+		       sizeof(params->color_comb));
+	}
+
+	if (params->color_comb.enable) {
+		params->color_comb.addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_COLOR_CUMB);
+		if (!params->color_comb.addr)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_hdr(struct kmb_metadata *kmb_meta,
+		      struct kmb_metadata_buf *meta_buf,
+		      struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.hdr) {
+		kmb_metadata_copy_hdr(&params->hdr,
+				      &user_params->hdr);
+		if (params->hdr.enable1 || params->hdr.enable2) {
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_HDR,
+							  user_params->hdr.tm_lut,
+							  ARRAY_SIZE(user_params->hdr.tm_lut));
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->hdr, &last_params->hdr,
+			       sizeof(params->hdr));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_HDR);
+	} else {
+		memcpy(&params->hdr, def_params->hdr, sizeof(params->hdr));
+	}
+
+	if (params->hdr.enable1 || params->hdr.enable2) {
+		params->hdr.luts_addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_HDR);
+		if (!params->hdr.luts_addr)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_lut(struct kmb_metadata *kmb_meta,
+		      struct kmb_metadata_buf *meta_buf,
+		      struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.lut) {
+		kmb_metadata_copy_lut(&params->lut, &user_params->lut);
+		if (params->lut.size) {
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_LUT,
+							  user_params->lut.table,
+							  ARRAY_SIZE(user_params->lut.table));
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->lut, &last_params->lut,
+			       sizeof(params->lut));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_LUT);
+	} else {
+		memcpy(&params->lut, def_params->lut, sizeof(params->lut));
+		kmb_metadata_create_default_table(kmb_meta,
+						  meta_buf,
+						  KMB_METADATA_TABLE_LUT,
+						  user_params->lut.table,
+						  ARRAY_SIZE(user_params->lut.table));
+	}
+
+	if (params->lut.size) {
+		params->lut.addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_LUT);
+		if (!params->lut.size)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_warp(struct kmb_metadata *kmb_meta,
+		       struct kmb_metadata_buf *meta_buf,
+		       struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.warp) {
+		kmb_metadata_copy_warp(&params->warp, &user_params->warp);
+		if (params->warp.enable) {
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_WARP,
+							  user_params->warp.mesh_grid,
+							  ARRAY_SIZE(user_params->warp.mesh_grid));
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->warp, &last_params->warp,
+			       sizeof(params->warp));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf)
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_WARP);
+	} else {
+		memcpy(&params->warp, def_params->warp, sizeof(params->warp));
+	}
+
+	if (params->warp.enable) {
+		params->warp.addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_WARP);
+		if (!params->warp.addr)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+kmb_metadata_fill_tnf(struct kmb_metadata *kmb_meta,
+		      struct kmb_metadata_buf *meta_buf,
+		      struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	struct kmb_tnf_params *tnf = NULL;
+	int ret = 0;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	if (user_params->update.tnf) {
+		kmb_metadata_copy_tnf(&params->tnf, &user_params->tnf);
+		if (params->tnf.enable) {
+			tnf = &user_params->tnf;
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_TNF0,
+							  tnf->chroma_lut0,
+							  ARRAY_SIZE(tnf->chroma_lut0));
+			if (ret < 0)
+				return ret;
+
+			ret = kmb_metadata_copy_table_usr(kmb_meta,
+							  meta_buf,
+							  KMB_METADATA_TABLE_TNF1,
+							  tnf->chroma_lut1,
+							  ARRAY_SIZE(tnf->chroma_lut1));
+			if (ret < 0)
+				return ret;
+		}
+	} else if (last_params) {
+		if (last_params != params)
+			memcpy(&params->tnf, &last_params->tnf,
+			       sizeof(params->tnf));
+
+		if (kmb_meta->last_buf && meta_buf != kmb_meta->last_buf) {
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_TNF0);
+			kmb_metadata_copy_table_vpu(meta_buf, last_buf,
+						    KMB_METADATA_TABLE_TNF1);
+		}
+	} else {
+		memcpy(&params->tnf, def_params->tnf, sizeof(params->tnf));
+	}
+
+	if (params->tnf.enable) {
+		params->tnf.lut0_addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_TNF0);
+		if (!params->tnf.lut0_addr)
+			return -EINVAL;
+
+		params->tnf.lut1_addr =
+			kmb_metadata_get_table_addr(meta_buf,
+						    KMB_METADATA_TABLE_TNF1);
+		if (!params->tnf.lut1_addr)
+			return -EINVAL;
+	}
+
+	return ret;
+}
+
+/* Fill static functions for conversions here */
+static int kmb_metadata_fill_isp_params(struct kmb_metadata *kmb_meta,
+					struct kmb_metadata_buf *meta_buf,
+					struct kmb_isp_params *user_params)
+{
+	struct kmb_vpu_isp_params *params = meta_buf->params.isp;
+	struct kmb_metadata_buf *last_buf = kmb_meta->last_buf;
+	struct kmb_vpu_isp_params *last_params = NULL;
+	struct kmb_vpu_isp_params_defaults *def_params = &kmb_meta->def;
+	int ret;
+
+	if (last_buf)
+		last_params = last_buf->params.isp;
+
+	kmb_metadata_fill_blc(params, user_params, last_params, def_params);
+
+	kmb_metadata_fill_signma_dns(params, user_params, last_params,
+				     def_params);
+
+	kmb_metadata_fill_ae_awb(params, user_params, last_params, def_params);
+
+	kmb_metadata_fill_af(params, user_params, last_params, def_params);
+
+	kmb_metadata_fill_histogram(params, user_params, last_params,
+				    def_params);
+
+	kmb_metadata_fill_debayer(params, user_params, last_params,
+				  def_params);
+
+	kmb_metadata_fill_dog_dns(params, user_params, last_params,
+				  def_params);
+
+	kmb_metadata_fill_luma_dns(params, user_params, last_params,
+				   def_params);
+
+	kmb_metadata_fill_chroma_gen(params, user_params, last_params,
+				     def_params);
+
+	kmb_metadata_fill_median(params, user_params, last_params, def_params);
+
+	kmb_metadata_fill_chroma_dns(params, user_params, last_params,
+				     def_params);
+
+	kmb_metadata_fill_dehaze(params, user_params, last_params, def_params);
+
+	/* Copy params with tables */
+	ret = kmb_metadata_fill_lsc(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_raw(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_lca(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_sharpen(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_color_comb(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_hdr(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_lut(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_warp(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	ret = kmb_metadata_fill_tnf(kmb_meta, meta_buf, user_params);
+	if (ret < 0)
+		goto error_release_tables;
+
+	/* Store last buffer */
+	kmb_meta->last_buf = meta_buf;
+
+	return 0;
+
+error_release_tables:
+	kmb_metadata_release_tables(meta_buf);
+	return ret;
+}
+
+static int kmb_metadata_queue_setup(struct vb2_queue *q,
+				    unsigned int *num_buffers,
+				    unsigned int *num_planes,
+				    unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(q);
+
+	*num_planes = 1;
+	sizes[0] = kmb_meta->format.buffersize;
+
+	return 0;
+}
+
+#define to_kmb_meta_buf(vbuf) container_of(vbuf, struct kmb_metadata_buf, vb)
+
+static int kmb_metadata_buf_params_init(struct vb2_buffer *vb)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_metadata_buf *buf = to_kmb_meta_buf(vbuf);
+
+	buf->type = KMB_METADATA_PARAMS;
+	buf->params.isp = dma_alloc_coherent(kmb_meta->dma_dev,
+					     sizeof(*buf->params.isp),
+					     &buf->params.dma_addr_isp, 0);
+	if (!buf->params.isp)
+		return -ENOMEM;
+
+	memset(buf->params.isp, 0, sizeof(*buf->params.isp));
+	/*
+	 * Table pools will be allocated per need.
+	 * The pools need to be released when last buffer is finished.
+	 * Use table reference count for that purpose
+	 */
+	kmb_meta->table_pools_refcnt++;
+
+	return 0;
+}
+
+static int kmb_metadata_buf_params_prepare(struct vb2_buffer *vb)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(vb->vb2_queue);
+	struct kmb_isp_params *user_params = vb2_plane_vaddr(vb, 0);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_metadata_buf *buf = to_kmb_meta_buf(vbuf);
+
+	vb2_set_plane_payload(vb, 0, kmb_meta->format.buffersize);
+	return kmb_metadata_fill_isp_params(kmb_meta, buf, user_params);
+}
+
+static void kmb_metadata_buf_params_cleanup(struct vb2_buffer *vb)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_metadata_buf *buf = to_kmb_meta_buf(vbuf);
+
+	if (buf == kmb_meta->last_buf)
+		kmb_meta->last_buf = NULL;
+
+	kmb_metadata_release_tables(buf);
+	dma_free_coherent(kmb_meta->dma_dev, sizeof(*buf->params.isp),
+			  buf->params.isp, buf->params.dma_addr_isp);
+
+	/* Destroy allocated table pools on last finish */
+	if (kmb_meta->table_pools_refcnt-- == 1)
+		kmb_metadata_destroy_table_pools(kmb_meta);
+}
+
+static int kmb_metadata_buf_stats_init(struct vb2_buffer *vb)
+{
+	dma_addr_t stats_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_metadata_buf *buf = to_kmb_meta_buf(vbuf);
+	int i;
+
+	buf->type = KMB_METADATA_STATS;
+	memset(&buf->stats.raw, 0, sizeof(buf->stats.raw));
+	buf->stats.dehaze_stats_addr = 0;
+
+	/* Fill statistics addresses */
+	for (i = 0; i < KMB_CAM_MAX_EXPOSURES; i++) {
+		buf->stats.raw[i].ae_awb_stats_addr = stats_addr +
+			offsetof(struct kmb_isp_stats,
+				 exposure[i].ae_awb_stats[0]);
+
+		buf->stats.raw[i].af_stats_addr = stats_addr +
+			offsetof(struct kmb_isp_stats,
+				 exposure[i].af_stats[0]);
+
+		buf->stats.raw[i].hist_luma_addr = stats_addr +
+			offsetof(struct kmb_isp_stats,
+				 exposure[i].hist_luma[0]);
+
+		buf->stats.raw[i].hist_rgb_addr = stats_addr +
+			offsetof(struct kmb_isp_stats,
+				 exposure[i].hist_rgb[0]);
+
+		buf->stats.raw[i].flicker_rows_addr = stats_addr +
+			offsetof(struct kmb_isp_stats,
+				 exposure[i].flicker_rows[0]);
+	}
+
+	buf->stats.dehaze_stats_addr = stats_addr +
+		offsetof(struct kmb_isp_stats, dehaze);
+
+	return 0;
+}
+
+static int kmb_metadata_buf_stats_prepare(struct vb2_buffer *vb)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(vb->vb2_queue);
+
+	vb2_set_plane_payload(vb, 0, kmb_meta->format.buffersize);
+
+	return 0;
+}
+
+static void kmb_metadata_buf_queue(struct vb2_buffer *vb)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_metadata_buf *buf = to_kmb_meta_buf(vbuf);
+	int ret;
+
+	ret = kmb_meta->queue_ops->queue(kmb_meta->priv, buf);
+	if (ret)
+		dev_err(&kmb_meta->video.dev, "Fail metadata queue %d", ret);
+}
+
+static int kmb_metadata_start_streaming(struct vb2_queue *q,
+					unsigned int count)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(q);
+	int ret;
+
+	ret = kmb_pipe_prepare(kmb_meta->pipe);
+	if (ret < 0)
+		goto error_discard_all_bufs;
+
+	ret = kmb_pipe_run(kmb_meta->pipe, &kmb_meta->video.entity);
+	if (ret < 0)
+		goto error_pipeline_stop;
+
+	return 0;
+
+error_pipeline_stop:
+	kmb_pipe_stop(kmb_meta->pipe, &kmb_meta->video.entity);
+error_discard_all_bufs:
+	kmb_meta->queue_ops->flush(kmb_meta->priv);
+	return 0;
+}
+
+static void kmb_metadata_stop_streaming(struct vb2_queue *q)
+{
+	struct kmb_metadata *kmb_meta = vb2_get_drv_priv(q);
+
+	kmb_pipe_stop(kmb_meta->pipe, &kmb_meta->video.entity);
+
+	kmb_meta->queue_ops->flush(kmb_meta->priv);
+}
+
+/* driver-specific operations */
+static struct vb2_ops kmb_meta_params_vb2_q_ops = {
+	.queue_setup     = kmb_metadata_queue_setup,
+	.buf_init        = kmb_metadata_buf_params_init,
+	.buf_prepare     = kmb_metadata_buf_params_prepare,
+	.buf_cleanup	 = kmb_metadata_buf_params_cleanup,
+	.start_streaming = kmb_metadata_start_streaming,
+	.stop_streaming  = kmb_metadata_stop_streaming,
+	.buf_queue       = kmb_metadata_buf_queue,
+};
+
+static struct vb2_ops kmb_meta_stats_vb2_q_ops = {
+	.queue_setup     = kmb_metadata_queue_setup,
+	.buf_init        = kmb_metadata_buf_stats_init,
+	.buf_prepare     = kmb_metadata_buf_stats_prepare,
+	.start_streaming = kmb_metadata_start_streaming,
+	.stop_streaming  = kmb_metadata_stop_streaming,
+	.buf_queue       = kmb_metadata_buf_queue,
+};
+
+#define to_kmb_meta_dev(vdev) container_of(vdev, struct kmb_metadata, video)
+
+static int kmb_metadata_querycap(struct file *file, void *fh,
+				 struct v4l2_capability *cap)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct kmb_metadata *kmb_meta =
+		to_kmb_meta_dev(vfh->vdev);
+
+	cap->bus_info[0] = 0;
+	strscpy(cap->driver, kmb_meta->video.name, sizeof(cap->driver));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 kmb_meta->video.name);
+
+	return 0;
+}
+
+static int kmb_metadata_get_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct kmb_metadata *kmb_meta =
+		to_kmb_meta_dev(vfh->vdev);
+
+	f->fmt.meta = kmb_meta->format;
+
+	return 0;
+}
+
+static int kmb_metadata_try_fmt_cap(struct file *file, void *fh,
+				    struct v4l2_format *f)
+{
+	f->fmt.meta.dataformat = V4L2_META_FMT_KMB_STATS;
+	if (f->fmt.meta.buffersize < sizeof(struct kmb_isp_stats))
+		f->fmt.meta.buffersize = sizeof(struct kmb_isp_stats);
+
+	return 0;
+}
+
+static int kmb_metadata_set_fmt_cap(struct file *file, void *fh,
+				    struct v4l2_format *f)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct kmb_metadata *kmb_meta =
+		to_kmb_meta_dev(vfh->vdev);
+	int ret;
+
+	ret = kmb_metadata_try_fmt_cap(file, fh, f);
+	if (ret < 0)
+		return ret;
+
+	kmb_meta->format = f->fmt.meta;
+
+	return 0;
+}
+
+static int kmb_metadata_try_fmt_out(struct file *file, void *fh,
+				    struct v4l2_format *f)
+{
+	f->fmt.meta.dataformat = V4L2_META_FMT_KMB_PARAMS;
+	if (f->fmt.meta.buffersize < sizeof(struct kmb_isp_params))
+		f->fmt.meta.buffersize = sizeof(struct kmb_isp_params);
+
+	return 0;
+}
+
+static int kmb_metadata_set_fmt_out(struct file *file, void *fh,
+				    struct v4l2_format *f)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct kmb_metadata *kmb_meta =
+		to_kmb_meta_dev(vfh->vdev);
+	int ret;
+
+	ret = kmb_metadata_try_fmt_out(file, fh, f);
+	if (ret < 0)
+		return ret;
+
+	kmb_meta->format = f->fmt.meta;
+
+	return 0;
+}
+
+/* V4L2 ioctl operations */
+static const struct v4l2_ioctl_ops kmb_vid_ioctl_ops = {
+	.vidioc_querycap	 = kmb_metadata_querycap,
+	.vidioc_g_fmt_meta_out   = kmb_metadata_get_fmt,
+	.vidioc_s_fmt_meta_out   = kmb_metadata_set_fmt_out,
+	.vidioc_try_fmt_meta_out = kmb_metadata_try_fmt_out,
+	.vidioc_g_fmt_meta_cap   = kmb_metadata_get_fmt,
+	.vidioc_s_fmt_meta_cap	 = kmb_metadata_set_fmt_cap,
+	.vidioc_try_fmt_meta_cap = kmb_metadata_try_fmt_cap,
+	.vidioc_reqbufs		 = vb2_ioctl_reqbufs,
+	.vidioc_querybuf	 = vb2_ioctl_querybuf,
+	.vidioc_qbuf		 = vb2_ioctl_qbuf,
+	.vidioc_dqbuf		 = vb2_ioctl_dqbuf,
+	.vidioc_streamon	 = vb2_ioctl_streamon,
+	.vidioc_streamoff	 = vb2_ioctl_streamoff,
+};
+
+static int kmb_metadata_open(struct file *file)
+{
+	struct kmb_metadata *kmb_meta = video_drvdata(file);
+	int ret;
+
+	mutex_lock(&kmb_meta->lock);
+
+	ret = v4l2_fh_open(file);
+	if (ret) {
+		mutex_unlock(&kmb_meta->lock);
+		return ret;
+	}
+
+	ret = kmb_pipe_request(kmb_meta->pipe);
+	if (ret < 0)
+		goto error_fh_release;
+
+	mutex_unlock(&kmb_meta->lock);
+
+	return 0;
+
+error_fh_release:
+	_vb2_fop_release(file, NULL);
+	mutex_unlock(&kmb_meta->lock);
+	return ret;
+}
+
+static int kmb_metadata_release(struct file *file)
+{
+	struct kmb_metadata *kmb_meta = video_drvdata(file);
+	int ret;
+
+	mutex_lock(&kmb_meta->lock);
+
+	kmb_pipe_release(kmb_meta->pipe);
+
+	ret = _vb2_fop_release(file, NULL);
+
+	mutex_unlock(&kmb_meta->lock);
+
+	return ret;
+}
+
+/* V4L2 file operations */
+static const struct v4l2_file_operations kmb_vid_output_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= video_ioctl2,
+	.open		= kmb_metadata_open,
+	.release	= kmb_metadata_release,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+};
+
 /**
- * kmb_video_init - Initialize entity
+ * kmb_metadata_init - Initialize entity
  * @kmb_meta: pointer to kmb isp config device
  *
  * Return: 0 if successful, error code otherwise.
  */
 int kmb_metadata_init(struct kmb_metadata *kmb_meta)
 {
+	int ret;
+
+	mutex_init(&kmb_meta->lock);
+
+	kmb_meta->table_pools_refcnt = 0;
+	memset(kmb_meta->table_pool, 0, sizeof(kmb_meta->table_pool));
+
+	kmb_meta->video.fops  = &kmb_vid_output_fops;
+	kmb_meta->video.ioctl_ops = &kmb_vid_ioctl_ops;
+	kmb_meta->video.minor = -1;
+	kmb_meta->video.release  = video_device_release;
+	kmb_meta->video.vfl_type = VFL_TYPE_VIDEO;
+	kmb_meta->video.lock = &kmb_meta->lock;
+	kmb_meta->video.queue = &kmb_meta->vb2_q;
+	video_set_drvdata(&kmb_meta->video, kmb_meta);
+
+	kmb_meta->vb2_q.drv_priv = kmb_meta;
+	kmb_meta->vb2_q.buf_struct_size = sizeof(struct kmb_metadata_buf);
+	kmb_meta->vb2_q.io_modes = VB2_DMABUF | VB2_MMAP;
+	kmb_meta->vb2_q.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	kmb_meta->vb2_q.dev = kmb_meta->dma_dev;
+	kmb_meta->vb2_q.lock = &kmb_meta->lock;
+	kmb_meta->vb2_q.min_buffers_needed = 1;
+
+	/* Initialize per type variables */
+	kmb_meta->video.device_caps = V4L2_CAP_STREAMING;
+	if (kmb_meta->type == KMB_METADATA_PARAMS) {
+		kmb_meta->video.device_caps |= V4L2_CAP_META_OUTPUT;
+		kmb_meta->video.vfl_dir = VFL_DIR_TX;
+		snprintf(kmb_meta->video.name, sizeof(kmb_meta->video.name),
+			 KMB_CAM_METADATA_PARAMS_NAME);
+
+		kmb_meta->vb2_q.ops = &kmb_meta_params_vb2_q_ops;
+		kmb_meta->vb2_q.mem_ops = &vb2_dma_contig_memops;
+		kmb_meta->vb2_q.type = V4L2_BUF_TYPE_META_OUTPUT;
+
+		kmb_meta->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+		kmb_meta->format.dataformat = V4L2_META_FMT_KMB_PARAMS;
+		kmb_meta->format.buffersize = sizeof(struct kmb_isp_params);
+	} else {
+		kmb_meta->video.device_caps |= V4L2_CAP_META_CAPTURE;
+		kmb_meta->video.vfl_dir = VFL_DIR_RX;
+
+		snprintf(kmb_meta->video.name, sizeof(kmb_meta->video.name),
+			 KMB_CAM_METADATA_STATS_NAME);
+
+		kmb_meta->vb2_q.ops = &kmb_meta_stats_vb2_q_ops;
+		kmb_meta->vb2_q.mem_ops = &vb2_dma_contig_memops;
+		kmb_meta->vb2_q.type = V4L2_BUF_TYPE_META_CAPTURE;
+
+		kmb_meta->pad.flags = MEDIA_PAD_FL_SINK;
+
+		kmb_meta->format.dataformat = V4L2_META_FMT_KMB_STATS;
+		kmb_meta->format.buffersize = sizeof(struct kmb_isp_stats);
+	}
+
+	ret = media_entity_pads_init(&kmb_meta->video.entity,
+				     1, &kmb_meta->pad);
+	if (ret < 0)
+		goto error_mutex_destroy;
+
+	ret = vb2_queue_init(&kmb_meta->vb2_q);
+	if (ret < 0) {
+		dev_err(&kmb_meta->video.dev, "Error vb2 queue init");
+		goto error_metadata_cleanup;
+	}
+
+	kmb_params_get_defaults(&kmb_meta->def);
+
 	return 0;
+
+error_metadata_cleanup:
+	kmb_metadata_cleanup(kmb_meta);
+error_mutex_destroy:
+	mutex_destroy(&kmb_meta->lock);
+
+	return ret;
 }
 
 /**
@@ -22,7 +1823,10 @@ int kmb_metadata_init(struct kmb_metadata *kmb_meta)
  * @kmb_meta: pointer to kmb isp config device
  */
 void kmb_metadata_cleanup(struct kmb_metadata *kmb_meta)
-{ }
+{
+	media_entity_cleanup(&kmb_meta->video.entity);
+	mutex_destroy(&kmb_meta->lock);
+}
 
 /**
  * kmb_metadata_register - Register V4L2 device
@@ -34,7 +1838,15 @@ void kmb_metadata_cleanup(struct kmb_metadata *kmb_meta)
 int kmb_metadata_register(struct kmb_metadata *kmb_meta,
 			  struct v4l2_device *v4l2_dev)
 {
-	return 0;
+	int ret;
+
+	kmb_meta->video.v4l2_dev = v4l2_dev;
+
+	ret = video_register_device(&kmb_meta->video, VFL_TYPE_VIDEO, -1);
+	if (ret < 0)
+		dev_err(&kmb_meta->video.dev, "Failed to register video device");
+
+	return ret;
 }
 
 /**
@@ -42,4 +1854,7 @@ int kmb_metadata_register(struct kmb_metadata *kmb_meta,
  * @kmb_meta: pointer to kmb isp config device
  */
 void kmb_metadata_unregister(struct kmb_metadata *kmb_meta)
-{ }
+{
+	mutex_destroy(&kmb_meta->lock);
+	video_unregister_device(&kmb_meta->video);
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-metadata.h b/drivers/media/platform/keembay-camera/keembay-metadata.h
index 88e85d3caba0..ab77ed11bd15 100644
--- a/drivers/media/platform/keembay-camera/keembay-metadata.h
+++ b/drivers/media/platform/keembay-camera/keembay-metadata.h
@@ -12,6 +12,7 @@
 #include <media/videobuf2-v4l2.h>
 
 #include "keembay-vpu-isp.h"
+#include "keembay-params-defaults.h"
 
 /**
  * enum kmb_metadata_table_type - Keembay metadata table type
@@ -68,12 +69,12 @@ struct kmb_metadata_table {
  * @vb: Video buffer for v4l2
  * @type: Metadata type
  * @stats: Statistics physical addresses
- *   @raw: VPU raw statistics physical addresses
- *   @dehaze_stats_addr: VPU dehaze statistics physical address
+ * @stats.raw: VPU raw statistics physical addresses
+ * @stats.dehaze_stats_addr: VPU dehaze statistics physical address
  * @params: VPU ISP parameters
- *   @isp: VPU ISP parameters virtual address
- *   @dma_addr_isp: VPU ISP parameters physical address
- *   @tab: Metadata tables
+ * @params.isp: VPU ISP parameters virtual address
+ * @params.dma_addr_isp: VPU ISP parameters physical address
+ * @params.tab: Metadata tables
  * @list: List for buffer queue
  */
 struct kmb_metadata_buf {
@@ -118,6 +119,7 @@ struct kmb_metabuf_queue_ops {
  * @table_pool: ISP tables dma pool
  * @last_buf: Pointer to last enqueued buffer
  * @format: Active format
+ * @def: Default ISP params
  */
 struct kmb_metadata {
 	struct mutex lock;
@@ -138,6 +140,8 @@ struct kmb_metadata {
 	struct kmb_metadata_buf *last_buf;
 
 	struct v4l2_meta_format format;
+
+	struct kmb_vpu_isp_params_defaults def;
 };
 
 int kmb_metadata_init(struct kmb_metadata *kmb_meta);
diff --git a/drivers/media/platform/keembay-camera/keembay-params-defaults.c b/drivers/media/platform/keembay-camera/keembay-params-defaults.c
new file mode 100644
index 000000000000..a2dd7888375e
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-params-defaults.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera ISP parameter defaults.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+#include "keembay-params-defaults.h"
+
+static const struct kmb_vpu_blc_params blc_default[KMB_VPU_MAX_EXPOSURES] = {
+		{
+			.coeff1 = 800,
+			.coeff2 = 800,
+			.coeff3 = 800,
+			.coeff4 = 800,
+		},
+		{
+			.coeff1 = 800,
+			.coeff2 = 800,
+			.coeff3 = 800,
+			.coeff4 = 800,
+		},
+		{
+			.coeff1 = 800,
+			.coeff2 = 800,
+			.coeff3 = 800,
+			.coeff4 = 800,
+		}
+
+};
+
+static const struct kmb_vpu_sigma_dns_params
+	sigma_dns_default[KMB_VPU_MAX_EXPOSURES] = { 0 };
+
+static const struct kmb_vpu_lsc_params lsc_default = {
+	.threshold = 2048,
+	.width = 64,
+	.height = 44,
+	.reserved = { 0 },
+};
+
+static const struct kmb_vpu_raw_params raw_default = {
+	.awb_stats_en = 0,
+	.awb_rgb_hist_en = 0,
+	.af_stats_en = 0,
+	.luma_hist_en = 0,
+	.flicker_accum_en = 0,
+	.bad_pixel_fix_en = 0,
+	.grgb_imb_en = 1,
+	.mono_imbalance_en = 0,
+	.gain1 = 269,
+	.gain2 = 452,
+	.gain3 = 634,
+	.gain4 = 269,
+	.stop1 = 400,
+	.stop2 = 450,
+	.stop3 = 700,
+	.stop4 = 800,
+	.threshold1 = 128,
+	.alpha1 = 12,
+	.alpha2 = 12,
+	.alpha3 = 12,
+	.alpha4 = 12,
+	.threshold2 = 53,
+	.static_defect_size = 1,
+	.reserved = { 0 },
+	.flicker_first_row_acc = 0,
+	.flicker_last_row_acc = 0,
+};
+
+static const struct kmb_vpu_ae_awb_params ae_awb_default = {
+	.start_x = 0,
+	.start_y = 0,
+	.width = 100,
+	.height = 98,
+	.skip_x = 100,
+	.skip_y = 98,
+	.patches_x = 38,
+	.patches_y = 22,
+	.threshold1 = 0,
+	.threshold2 = 4095,
+};
+
+static const struct kmb_vpu_af_params af_default = {
+	.start_x = 0,
+	.start_y = 0,
+	.width = 192,
+	.height = 144,
+	.patches_x = 20,
+	.patches_y = 15,
+	.coeff = 0,
+	.threshold1 = 0,
+	.threshold2 = 0,
+	.coeffs1 = {31, 19, -32, 31, 63, 31, -50, -35, 35, -70, 35},
+	.coeffs2 = {35, 11, -29, 8, 17, 8, 78, -39, 119, -238, 119},
+};
+
+static const struct kmb_vpu_hist_params histogram_default = {
+	.start_x = 0,
+	.start_y = 0,
+	.end_x = 3839,
+	.end_y = 2156,
+	.matrix = {1719, 0, 0, 0, 1024, 0, 0, 0, 2414},
+	.weight = {64, 128, 64},
+};
+
+// only address - nothing to init...
+static const struct kmb_vpu_lca_params lca_default = { 0 };
+
+static const struct kmb_vpu_debayer_params debayer_default = {
+	.coeff1 = 51,
+	.multiplier1 = 13107,
+	.multiplier2 = 13107,
+	.coeff2 = 77,
+	.coeff3 = 150,
+	.coeff4 = 29,
+};
+
+static const struct kmb_vpu_dog_dns_params dog_dns_default = {
+	.threshold = 0,
+	.strength = 0,
+	.coeffs11 = {0, 0, 0, 0, 0, 255},
+	.coeffs15 = {0, 0, 0, 0, 0, 0, 0, 255},
+	.reserved = { 0 },
+};
+
+static const struct kmb_vpu_luma_dns_params luma_dns_default = {
+	.threshold = 13094,
+	.slope = 967,
+	.shift = 7,
+	.alpha = 50,
+	.weight = 0,
+	.per_pixel_alpha_en = 0,
+	.gain_bypass_en = 0,
+	.reserved = { 0 },
+};
+
+static const struct kmb_vpu_sharpen_params sharpen_default =  {
+	.coeffs1 = {0, 0, 0, 4, 182, 396},
+	.coeffs2 = {0, 0, 0, 1, 141, 740},
+	.coeffs3 = {0, 0, 2, 42, 246, 444},
+	.shift = 15,
+	.gain1 = 3396,
+	.gain2 = 3378,
+	.gain3 = 3270,
+	.gain4 = 3400,
+	.gain5 = 207,
+	.stops1 = {20, 40, 605},
+	.gains = {10, 120, 60},
+	.stops2 = {11, 100, 2500, 4000},
+	.overshoot = 359,
+	.undershoot = 146,
+	.alpha = 36,
+	.gain6 = 128,
+	.offset = 637,
+};
+
+static const struct kmb_vpu_chroma_gen_params chroma_gen_default  = {
+	.epsilon = 2,
+	.coeff1 = 426,
+	.coeff2 = 767,
+	.coeff3 = 597,
+	.coeff4 = 77,
+	.coeff5 = 150,
+	.coeff6 = 29,
+	.strength1 = 0,
+	.strength2 = 32,
+	.coeffs = {33, 59, 71},
+	.offset1 = 2,
+	.slope1 = 230,
+	.slope2 = 256,
+	.offset2 = 0,
+	.limit = 767,
+};
+
+static const struct kmb_vpu_median_params median_default = {
+	.size = 7,
+	.slope = 32,
+	.offset = -19,
+};
+
+static const struct kmb_vpu_chroma_dns_params chroma_dns_default = {
+	.limit = 255,
+	.enable = 0,
+	.threshold1 = 30,
+	.threshold2 = 30,
+	.threshold3 = 30,
+	.threshold4 = 30,
+	.threshold5 = 45,
+	.threshold6 = 45,
+	.threshold7 = 45,
+	.threshold8 = 45,
+	.slope1 = 77,
+	.offset1 = -15,
+	.slope2 = 255,
+	.offset2 = 127,
+	.grey1 = 421,
+	.grey2 = 758,
+	.grey3 = 590,
+	.coeff1 = 52,
+	.coeff2 = 32,
+	.coeff3 = 19,
+};
+
+static const struct kmb_vpu_color_comb_params color_comb_default = {
+	.matrix = {1303, 65427, 65367, 65172, 1463, 65462, 55, 65034, 1459},
+	.offsets = { 0 },
+	.coeff1 = 615,
+	.coeff2 = 342,
+	.coeff3 = 439,
+	.reserved = { 0 },
+	.enable = 0,
+	.weight1 = 85,
+	.weight2 = 86,
+	.weight3 = 85,
+	.limit1 = 512,
+	.limit2 = -8192,
+	.offset1 = 0,
+	.offset2 = 0,
+};
+
+static const struct kmb_vpu_hdr_params hdr_default = {
+	.ratio = {256, 256},
+	.scale = {262143, 262143, 262143},
+	.offset1 = -3275,
+	.slope1 = 320,
+	.offset2 = -3685,
+	.slope2 = 641,
+	.offset3 = -4054,
+	.slope3 = 4095,
+	.offset4 = 3686,
+	.gain1 = 16,
+	.blur1 = {0, 0, 255},
+	.blur2 = {0, 0, 0, 0, 255},
+	.contrast1 = 20,
+	.contrast2 = 16,
+	.enable1 = 0,
+	.enable2 = 0,
+	.offset5 = 0,
+	.offset6 = 0,
+	.strength = 0,
+	.reserved1 = { 0 },
+	.offset7 = 15,
+	.shift = 1702133760,
+	.field1 = 16,
+	.field2 = 123,
+	.gain3 = 0,
+	.min = 0,
+	.reserved2 = { 0 },
+};
+
+static const struct kmb_vpu_lut_params lut_default = {
+	.size = 512,
+	.reserved = { 0 },
+	.matrix = {262, 516, 100, 3945, 3799, 449, 449, 3720, 4023},
+	.offsets = {256, 2048, 2048},
+};
+
+static const struct kmb_vpu_tnf_params tnf_default = {
+	.factor = 179,
+	.gain = 0,
+	.offset1 = 217,
+	.slope1 = 162,
+	.offset2 = 299,
+	.slope2 = 121,
+	.min1 = 0,
+	.min2 = 40,
+	.value = 128,
+	.enable = 0,
+};
+
+static const struct kmb_vpu_dehaze_params dehaze_default = {
+	.gain1 = 512,
+	.min = 70,
+	.strength1 = 0,
+	.strength2 = 0,
+	.gain2 = 128,
+	.saturation = 127,
+	.value1 = 2048,
+	.value2 = 2048,
+	.value3 = 2048,
+	.filter = {0, 0, 255},
+};
+
+static const struct kmb_vpu_warp_params warp_default = {
+	.type = 0,
+	.relative = 0,
+	.format = 0,
+	.position = 0,
+	.reserved = { 0 },
+	.width = 8,
+	.height = 4,
+	.stride = 128,
+	.enable = 0,
+	.matrix = {1, 0, 0, 0, 1, 0, 0, 0, 1},
+	.mode = 1,
+	.values = {0, 128, 128},
+};
+
+void kmb_params_get_defaults(struct kmb_vpu_isp_params_defaults *defaults)
+{
+	defaults->blc = blc_default;
+	defaults->sigma_dns = sigma_dns_default;
+	defaults->lsc = &lsc_default;
+	defaults->raw = &raw_default;
+	defaults->ae_awb = &ae_awb_default;
+	defaults->af = &af_default;
+	defaults->histogram = &histogram_default;
+	defaults->lca = &lca_default;
+	defaults->debayer = &debayer_default;
+	defaults->dog_dns = &dog_dns_default;
+	defaults->luma_dns = &luma_dns_default;
+	defaults->sharpen = &sharpen_default;
+	defaults->chroma_gen = &chroma_gen_default;
+	defaults->median = &median_default;
+	defaults->chroma_dns = &chroma_dns_default;
+	defaults->color_comb = &color_comb_default;
+	defaults->hdr = &hdr_default;
+	defaults->lut = &lut_default;
+	defaults->tnf = &tnf_default;
+	defaults->dehaze = &dehaze_default;
+	defaults->warp = &warp_default;
+}
+
diff --git a/drivers/media/platform/keembay-camera/keembay-params-defaults.h b/drivers/media/platform/keembay-camera/keembay-params-defaults.h
new file mode 100644
index 000000000000..d6134d64be7c
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-params-defaults.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera ISP parameter defaults.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_DEFAULTS_H
+#define KEEMBAY_DEFAULTS_H
+
+#include "keembay-vpu-isp.h"
+
+struct kmb_vpu_isp_params_defaults {
+	const struct kmb_vpu_blc_params *blc;
+	const struct kmb_vpu_sigma_dns_params *sigma_dns;
+	const struct kmb_vpu_lsc_params *lsc;
+	const struct kmb_vpu_raw_params *raw;
+	const struct kmb_vpu_ae_awb_params *ae_awb;
+	const struct kmb_vpu_af_params *af;
+	const struct kmb_vpu_hist_params *histogram;
+	const struct kmb_vpu_lca_params *lca;
+	const struct kmb_vpu_debayer_params *debayer;
+	const struct kmb_vpu_dog_dns_params *dog_dns;
+	const struct kmb_vpu_luma_dns_params *luma_dns;
+	const struct kmb_vpu_sharpen_params *sharpen;
+	const struct kmb_vpu_chroma_gen_params *chroma_gen;
+	const struct kmb_vpu_median_params *median;
+	const struct kmb_vpu_chroma_dns_params *chroma_dns;
+	const struct kmb_vpu_color_comb_params *color_comb;
+	const struct kmb_vpu_hdr_params *hdr;
+	const struct kmb_vpu_lut_params *lut;
+	const struct kmb_vpu_tnf_params *tnf;
+	const struct kmb_vpu_dehaze_params *dehaze;
+	const struct kmb_vpu_warp_params *warp;
+};
+
+void kmb_params_get_defaults(struct kmb_vpu_isp_params_defaults *defaults);
+
+#endif /* KEEMBAY_DEFAULTS_H */
-- 
2.11.0

