Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1705342409
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhCSSHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:07:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230205AbhCSSGt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:06:49 -0400
IronPort-SDR: q+K4fONuKVAlFQ6m4fcPP8MQCzy08zhQASGsBdHn4DdT0ag5wrzaOyHMgE3FBHXuT51XJYbJHM
 FVBYD2R6vbBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036011"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:47 -0700
IronPort-SDR: oNIVbVnwYGEWkwcmIhitpxuAxEtpPTqKs83EbnwmahcJuijoj2QOx+qhWfCRh0BBwrHH/SSEmF
 LF5QdXbYCTjg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605715"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:45 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 03/10] media: Keem Bay Camera: Add VPU camera interface
Date:   Fri, 19 Mar 2021 18:06:25 +0000
Message-Id: <20210319180632.585-4-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>

Communication with VPU firmware is over XLink.
XLink has a channel-based communication, each channel has a unique
ID. The communication between VPU FW and camera driver starts with
one channel with negotiated ID. Currently this ID it is hard-coded
on both sides and should not be changed.

Three main channel types are used for streaming session:

1. Pipeline management channel:
   This is fixed channel used to configure/build/delete
   the streaming pipelines. When pipeline is built the channel IDs
   used for communication are provided from linux kernel camera
   driver.

2. Isp control channel:
   This channel is used for ISP and MIPI RX configuration. For each
   pipeline a separate ISP channel is required.

3. Buffer pool channels:
   Each endpoint and buffer pool from VPU FW is associated with
   a separate XLink channel. This channel is used for buffer
   management.

Messages in "1" and "2" are using cmd sturct as payload data which
contains message type and physical address containing message payload.
"3" messages are small and the whole message is in XLink payload data.

Pipeline management:

Each pipeline instance is created on pipeline XLink channel "1".
The pipeline lifecycle states are:

- Configuration: Pipeline mode and input resolution are sent,
  as a result min/max resolutions for the available outputs in that mode
  are received.

- Build: The returned pipeline configuration is passed to build
  command in addition with filled output channel configurations for
  each output endpoint. After this command pipeline is ready for
  streaming and can accept messages on ISP and buffer pool channels.

- Delete: The  command deletes constructed pipeline.

NOTE: Now pipeline lifecycle should be always
configuration->build->delete it is not allowed to mix
the states. However an request was sent to VPU firmware team to
be able to delete configured pipeline without going in build state.

ISP control:

ISP control channel is used for controlling VPU ISP. This includes:
 - Isp source configuration: MIPI RX configuration
 - Isp source start/stop: start/stop MIPI RX
 - Sending ISP params for processing

Events from VPU ISP are also received on ISP control channel.
Those are MIPI RX events, ISP events and error events.

VPU ISP works in per-frame control mode - ISP configuration is
required for every processed endpoint.
ISP configuration has a lifecycle.
The following event sequence needs to be received for each ISP
configuration, then it is released by the VPU:
 - Readout start - MIPI SOF
 - Readout end - MIPI EOF
 - Isp start - Isp processing SOF
 - Isp end - Isp processing EOF

If VPU wants to discard ISP configuration because of some internal
error, ISP configuration skip event is sent.

NOTE: Received events' payload data contains an ISP configuration
address this event corresponds to or 0 if the event is not for
ISP configuration.

Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Co-developed-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
Signed-off-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 .../platform/keembay-camera/keembay-vpu-cmd.h      | 110 ++++
 .../platform/keembay-camera/keembay-vpu-frame.h    | 102 +++
 .../platform/keembay-camera/keembay-vpu-isp.h      | 724 +++++++++++++++++++++
 .../platform/keembay-camera/keembay-vpu-pipe.h     | 110 ++++
 .../platform/keembay-camera/keembay-vpu-src.h      | 193 ++++++
 5 files changed, 1239 insertions(+)
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-cmd.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-frame.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-isp.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-pipe.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-src.h

diff --git a/drivers/media/platform/keembay-camera/keembay-vpu-cmd.h b/drivers/media/platform/keembay-camera/keembay-vpu-cmd.h
new file mode 100644
index 000000000000..192deebf33c9
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-vpu-cmd.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera VPU Commands
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_VPU_CMD_H
+#define KEEMBAY_VPU_CMD_H
+
+enum {
+	/* IC_EVENT_TYPE enum to define event messages */
+	KMB_IC_EVENT_TYPE_SUCCESSFUL = 0,
+	KMB_IC_EVENT_TYPE_CONFIG_ISP_PIPE,
+	KMB_IC_EVENT_TYPE_BUILD_ISP_PIPE,
+	KMB_IC_EVENT_TYPE_DELETE_ISP_PIPE,
+
+	KMB_IC_EVENT_TYPE_INIT_MAX
+};
+
+enum {
+	/* Control -> Source */
+	KMB_IC_EVENT_TYPE_CONFIG_SOURCE = (KMB_IC_EVENT_TYPE_INIT_MAX + 1),
+	KMB_IC_EVENT_TYPE_START_SOURCE,
+	KMB_IC_EVENT_TYPE_STOP_SOURCE,
+	KMB_IC_EVENT_TYPE_CONFIG_SOURCE_DYNAMIC,
+	KMB_IC_EVENT_TYPE_SOURCE_SEND_USER_DATA,
+
+	/* Source -> Control */
+	KMB_IC_EVENT_TYPE_SOURCE_CONFIGURED,
+	KMB_IC_EVENT_TYPE_SOURCE_STARTED,
+	KMB_IC_EVENT_TYPE_SOURCE_STOPPED,
+	KMB_IC_EVENT_TYPE_SOURCE_DYN_CONFIGURED,
+
+	/* Source events */
+	KMB_IC_EVENT_TYPE_READOUT_START,
+	KMB_IC_EVENT_TYPE_READOUT_END,
+	KMB_IC_EVENT_TYPE_LINE_REACHED,
+
+	/* ISP events */
+	KMB_IC_EVENT_TYPE_ISP_START,
+	KMB_IC_EVENT_TYPE_ISP_END,
+	KMB_IC_EVENT_TYPE_STATS_READY,
+	KMB_IC_EVENT_TYPE_ISP_CONFIG_ACCEPTED,
+	KMB_IC_EVENT_TYPE_ZSL_LOCKED,
+	KMB_IC_EVENT_TYPE_CAPTURE_MADE,
+
+	/* Isp config events */
+	KMB_IC_EVENT_TYPE_CONFIG_ISP,
+	KMB_IC_EVENT_TYPE_LOCK_ZSL,
+	KMB_IC_EVENT_TYPE_CAPTURE,
+	KMB_IC_EVENT_TYPE_UNLOCK_ZSL,
+	KMB_IC_EVENT_TYPE_ZSL_ADD,
+	KMB_IC_EVENT_TYPE_ERROR,
+
+	KMB_IC_EVENT_MAX,
+};
+
+enum {
+	KMB_IC_ERROR_PIPE_INIT = (KMB_IC_EVENT_MAX + 1),
+	KMB_IC_ERROR_ISP_CONFIG,
+	KMB_IC_ERROR_YUV_BUFF_MISSING,
+
+	KMB_IC_ERROR_ISP_MAX,
+};
+
+enum {
+	KMB_IC_ERROR_SRC_MIPI_WRONG_STATE = (KMB_IC_ERROR_ISP_MAX + 1),
+	KMB_IC_ERROR_SRC_MIPI_BAD_PARAMETER,
+	KMB_IC_ERROR_SRC_MIPI_CFG_MISSING,
+	KMB_IC_ERROR_SRC_MIPI_CFG_SKIPPED,
+	KMB_IC_ERROR_SRC_MIPI_OUT_BUFFERS_NOT_AVAILABLE,
+	KMB_IC_ERROR_SRC_MIPI_EOF_TIMEOUT,
+	KMB_IC_ERROR_SRC_MIPI_LOC_BUF_NOT_AVAILABLE,
+	KMB_IC_ERROR_SRC_MIPI_INTERNAL_ERROR,
+	KMB_IC_ERROR_SRC_TRANSMISSION_ERROR,
+	KMB_IC_ERROR_SRC_DRIVER_UNEXPECTED,
+
+	KMB_IC_ERROR_SRC_MIPI_MAX,
+};
+
+enum {
+	KMB_IC_ERROR_NO_ZSL_BUFFS_AVAILABLE = (KMB_IC_ERROR_SRC_MIPI_MAX + 1),
+	KMB_IC_ERROR_TRIGGER_NOT_EXISTING_BUFF,
+
+	KMB_IC_ERROR_ISP_CTRL_MAX,
+};
+
+/**
+ * struct kmb_ic_ev - Event structure
+ *
+ * @ev_info: Describe ISP event
+ * @ev_info.inst_id: Pipe id
+ * @ev_info.seq_nr: Frame number
+ * @ev_info.user_data_base_addr01: Address of isp cfg buffer in CMA
+ * @ev_info.user_data_base_addr02: Address of isp cfg buffer in CMA
+ * @ev_info.ts: Timestamp in NS
+ * @ctrl: Value from the IC_EVENT_TYPE enum
+ */
+struct kmb_ic_ev {
+	struct {
+		u32 inst_id;
+		u32 seq_nr;
+		u32 user_data_base_addr01;
+		u32 user_data_base_addr02;
+		s64 ts;
+	} ev_info;
+	u32 ctrl;
+} __packed __aligned(64);
+
+#endif  /* KEEMBAY_VPU_CMD_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-vpu-frame.h b/drivers/media/platform/keembay-camera/keembay-vpu-frame.h
new file mode 100644
index 000000000000..aab99ab55077
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-vpu-frame.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera VPU frame data
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#ifndef KEEMBAY_VPU_FRAME_H_
+#define KEEMBAY_VPU_FRAME_H_
+
+/**
+ * enum kmb_frame_types - Frame types
+ *
+ * @KMB_FRAME_TYPE_YUV422I: Interleaved 8 bit
+ * @KMB_FRAME_TYPE_YUV444P: Planar 4:4:4 format
+ * @KMB_FRAME_TYPE_YUV420P: Planar 4:2:0 format
+ * @KMB_FRAME_TYPE_YUV422P: Planar 8-bit greyscale
+ * @KMB_FRAME_TYPE_YUV400P: 8-bit greyscale
+ * @KMB_FRAME_TYPE_RGBA8888: RGBA interleaved stored in 32 bit word
+ * @KMB_FRAME_TYPE_RGB888: Planar 8 bit RGB data
+ * @KMB_FRAME_TYPE_LUT2: 1 bit per pixel, Lookup table(used for graphics layers)
+ * @KMB_FRAME_TYPE_LUT4: 2 bit per pixel, Lookup table(used for graphics layers)
+ * @KMB_FRAME_TYPE_LUT16: 4 bit per pixel, Lookup table (used for
+ *                        graphics layers)
+ * @KMB_FRAME_TYPE_RAW16: Save any raw type (8, 10, 12bit) on 16 bits
+ * @KMB_FRAME_TYPE_RAW14: 14-bit value in 16-bit storage
+ * @KMB_FRAME_TYPE_RAW12: 12-bit value in 16-bit storage
+ * @KMB_FRAME_TYPE_RAW10: 10-bit value in 16-bit storage
+ * @KMB_FRAME_TYPE_RAW8: Raw 8 greyscale
+ * @KMB_FRAME_TYPE_PACK10: SIPP 10-bit packed format
+ * @KMB_FRAME_TYPE_PACK12: SIPP 12-bit packed format
+ * @KMB_FRAME_TYPE_YUV444I: Planar 4:4:4 interleaved format
+ * @KMB_FRAME_TYPE_NV12: Format NV12
+ * @KMB_FRAME_TYPE_NV21: Format NV21
+ * @KMB_FRAME_TYPE_BITSTREAM: Used for video encoder bitstream
+ * @KMB_FRAME_TYPE_HDR: Format HDR
+ * @KMB_FRAME_TYPE_NV12PACK10: NV12 format with pixels encoded in pack 10
+ * @KMB_FRAME_TYPE_NONE: Format None
+ */
+enum kmb_frame_types {
+	KMB_FRAME_TYPE_YUV422I,
+	KMB_FRAME_TYPE_YUV444P,
+	KMB_FRAME_TYPE_YUV420P,
+	KMB_FRAME_TYPE_YUV422P,
+	KMB_FRAME_TYPE_YUV400P,
+	KMB_FRAME_TYPE_RGBA8888,
+	KMB_FRAME_TYPE_RGB888,
+	KMB_FRAME_TYPE_LUT2,
+	KMB_FRAME_TYPE_LUT4,
+	KMB_FRAME_TYPE_LUT16,
+	KMB_FRAME_TYPE_RAW16,
+	KMB_FRAME_TYPE_RAW14,
+	KMB_FRAME_TYPE_RAW12,
+	KMB_FRAME_TYPE_RAW10,
+	KMB_FRAME_TYPE_RAW8,
+	KMB_FRAME_TYPE_PACK10,
+	KMB_FRAME_TYPE_PACK12,
+	KMB_FRAME_TYPE_YUV444I,
+	KMB_FRAME_TYPE_NV12,
+	KMB_FRAME_TYPE_NV21,
+	KMB_FRAME_TYPE_BITSTREAM,
+	KMB_FRAME_TYPE_HDR,
+	KMB_FRAME_TYPE_NV12PACK10,
+	KMB_FRAME_TYPE_NONE,
+};
+
+/**
+ * struct kmb_frame_spec - KMB frame specifications
+ *
+ * @type: Values from the enum kmb_frame_type
+ * @height: Height in pixels
+ * @width: Width in pixels
+ * @stride: Defines as distance in bytes from pix(y, x) to pix(y+1, x)
+ * @bpp: Bits per pixel (for unpacked types set to 8 or 16, for NV12 set only
+ *       luma pixel size)
+ */
+struct kmb_frame_spec {
+	u16 type;
+	u16 height;
+	u16 width;
+	u16 stride;
+	u16 bpp;
+};
+
+/**
+ * struct kmb_vpu_frame_buffer - KMB frame buffer elements
+ *
+ * @spec: Frame specifications parameters
+ * @p1: Address to first image plane
+ * @p2: Address to second image plane (if used)
+ * @p3: Address to third image plane (if used)
+ * @ts: Timestamp in NS
+ */
+struct kmb_vpu_frame_buffer {
+	struct kmb_frame_spec spec;
+	u64 p1;
+	u64 p2;
+	u64 p3;
+	s64 ts;
+};
+
+#endif /* KEEMBAY_VPU_FRAME_H_ */
diff --git a/drivers/media/platform/keembay-camera/keembay-vpu-isp.h b/drivers/media/platform/keembay-camera/keembay-vpu-isp.h
new file mode 100644
index 000000000000..c8b35c8ffbb0
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-vpu-isp.h
@@ -0,0 +1,724 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay VPU ISP params
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_VPU_ISP_H
+#define KEEMBAY_VPU_ISP_H
+
+/* Keembay VPU ISP Tables sizes and limits */
+#define KMB_VPU_MAX_EXPOSURES 3
+
+/**
+ * struct kmb_vpu_raw_stats - KMB Raw statisticsKMB
+ *
+ * @ae_awb_stats_addr: AE/AWB statistics addr
+ * @af_stats_addr: Base start offset for AF statistics addr
+ * @hist_luma_addr: Luma histogram addr
+ * @hist_rgb_addr: RGB histogram addr
+ * @flicker_rows_addr: Flicker detection raw addr
+ */
+struct kmb_vpu_raw_stats {
+	u64 ae_awb_stats_addr;
+	u64 af_stats_addr;
+	u64 hist_luma_addr;
+	u64 hist_rgb_addr;
+	u64 flicker_rows_addr;
+} __packed;
+
+/**
+ * struct kmb_vpu_blc_params - KMB Black Level Correction parameters
+ *
+ * @coeff1: Black level correction coefficient 1 parameter
+ * @coeff2: Black level correction coefficient 2 parameter
+ * @coeff3: Black level correction coefficient 3 parameter
+ * @coeff4: Black level correction coefficient 4 parameter
+ */
+struct kmb_vpu_blc_params {
+	u32 coeff1;
+	u32 coeff2;
+	u32 coeff3;
+	u32 coeff4;
+} __packed;
+
+/**
+ * struct kmb_vpu_sigma_dns_params - KMB Sigma Denoise parameters
+ *
+ * @noise: Sigma denoise noise parameter
+ * @threshold1: Sigma denoise min threshold1 parameter
+ * @threshold2: Sigma denoise max threshold2 parameter
+ * @threshold3: Sigma denoise min threshold3 parameter
+ * @threshold4: Sigma denoise max threshold4 parameter
+ * @threshold5: Sigma denoise min threshold5 parameter
+ * @threshold6: Sigma denoise max threshold6 parameter
+ * @threshold7: Sigma denoise min threshold7 parameter
+ * @threshold8: Sigma denoise max threshold8 parameter
+ */
+struct kmb_vpu_sigma_dns_params {
+	u32 noise;
+	u32 threshold1;
+	u32 threshold2;
+	u32 threshold3;
+	u32 threshold4;
+	u32 threshold5;
+	u32 threshold6;
+	u32 threshold7;
+	u32 threshold8;
+} __packed;
+
+/**
+ * struct kmb_vpu_lsc_params - KMB Lens Shading Correction parameters
+ *
+ * @threshold: Lens shading correction threshold parameter
+ * @width: Lens shading correction width parameter
+ * @height: Lens shading correction height parameter
+ * @reserved: Reserved for alignment purpose
+ * @addr: Lens shading correction table address
+ */
+struct kmb_vpu_lsc_params {
+	u32 threshold;
+	u32 width;
+	u32 height;
+	u8 reserved[4];
+	u64 addr;
+} __packed;
+
+/**
+ * struct kmb_vpu_raw_params - KMB Raw parameters
+ *
+ * @awb_stats_en: Enable AE/AWB stats output
+ * @awb_rgb_hist_en: Enable RGB histogram output
+ * @af_stats_en: Enable AF stats output
+ * @luma_hist_en: Enable Luma histogram output
+ * @flicker_accum_en: Enable flicker detection row accumulation output
+ * @bad_pixel_fix_en: Enable Hot/Cold pixel suppression
+ * @grgb_imb_en: Enable Gr/Gb imbalance correction
+ * @mono_imbalance_en: Enable mono imbalance correction
+ * @gain1: Raw gain1 parameter
+ * @gain2: Raw gain2 parameter
+ * @gain3: Raw gain3 parameter
+ * @gain4: Raw gain4 parameter
+ * @stop1: Raw stop1 parameter
+ * @stop2: Raw stop2 parameter
+ * @stop3: Raw stop3 parameter
+ * @stop4: Raw stop4 parameter
+ * @threshold1: Raw threshold1 parameter
+ * @alpha1: Raw alpha1 parameter
+ * @alpha2: Raw alpha2 parameter
+ * @alpha3: Raw alpha3 parameter
+ * @alpha4: Raw alpha4 parameter
+ * @threshold2: Raw threshold2 parameter
+ * @static_defect_size: Static defect data size
+ * @reserved: Reserved for alignment purpose
+ * @static_defect_addr: Static defect data address
+ * @flicker_first_row_acc: First row of flicker detection row accumulation
+ * @flicker_last_row_acc: First row of flicker detection row accumulation
+ * @stats: raw statistics buffers
+ */
+struct kmb_vpu_raw_params {
+	u32 awb_stats_en;
+	u32 awb_rgb_hist_en;
+	u32 af_stats_en;
+	u32 luma_hist_en;
+	u32 flicker_accum_en;
+	u32 bad_pixel_fix_en;
+	u32 grgb_imb_en;
+	u32 mono_imbalance_en;
+	u32 gain1;
+	u32 gain2;
+	u32 gain3;
+	u32 gain4;
+	u32 stop1;
+	u32 stop2;
+	u32 stop3;
+	u32 stop4;
+	u32 threshold1;
+	u32 alpha1;
+	u32 alpha2;
+	u32 alpha3;
+	u32 alpha4;
+	u32 threshold2;
+	u32 static_defect_size;
+	u8 reserved[4];
+	u64 static_defect_addr;
+	u32 flicker_first_row_acc;
+	u32 flicker_last_row_acc;
+	struct kmb_vpu_raw_stats stats[KMB_VPU_MAX_EXPOSURES];
+} __packed;
+
+/**
+ * struct kmb_vpu_ae_awb_params - KMB AE/AWB statistics parameters
+ *
+ * @start_x: AE/AWB start_x parameter
+ * @start_y: AE/AWB start_y parameter
+ * @width: AE/AWB width parameter
+ * @height: AE/AWB height parameter
+ * @skip_x: AE/AWB skip_x parameter
+ * @skip_y: AE/AWB skip_y parameter
+ * @patches_x: AE/AWB patches_x parameter
+ * @patches_y: AE/AWB patches_y parameter
+ * @threshold1: AE/AWB threshold1 parameter
+ * @threshold2: AE/AWB threshold2 parameter
+ */
+struct kmb_vpu_ae_awb_params {
+	u32 start_x;
+	u32 start_y;
+	u32 width;
+	u32 height;
+	u32 skip_x;
+	u32 skip_y;
+	u32 patches_x;
+	u32 patches_y;
+	u16 threshold1;
+	u16 threshold2;
+} __packed;
+
+/**
+ * struct kmb_vpu_af_params - KMB Auto Focus parameters
+ *
+ * @start_x: AF start_x parameter
+ * @start_y: AF start_y parameter
+ * @width: AF width parameter
+ * @height: AF height parameter
+ * @patches_x: AF patches_x parameter
+ * @patches_y: AF patches_y parameter
+ * @coeff: AF filter coeff parameter
+ * @threshold1: AF filer threshold1 parameter
+ * @threshold2: AF filer threshold2 parameter
+ * @coeffs1: AF filter coeffs1 parameter
+ * @coeffs2: AF filter coeffs2 parameter
+ */
+struct kmb_vpu_af_params {
+	u32 start_x;
+	u32 start_y;
+	u32 width;
+	u32 height;
+	u32 patches_x;
+	u32 patches_y;
+	s32 coeff;
+	s32 threshold1;
+	s32 threshold2;
+	s32 coeffs1[11];
+	s32 coeffs2[11];
+} __packed;
+
+/**
+ * struct kmb_vpu_hist_params - KMB Hist parameters
+ *
+ * @start_x: Hist start_x parameter
+ * @start_y: Hist start_y parameter
+ * @end_x: Hist end_x parameter
+ * @end_y: Hist end_y parameter
+ * @matrix: Hist matrix parameter
+ * @weight: Hist weight parameter
+ */
+struct kmb_vpu_hist_params {
+	u32 start_x;
+	u32 start_y;
+	u32 end_x;
+	u32 end_y;
+	u16 matrix[9];
+	u16 weight[3];
+} __packed;
+
+/**
+ * struct kmb_vpu_lca_params - KMB Lateral Chromatic Aberration parameters
+ *
+ * @addr: LCA table address
+ */
+struct kmb_vpu_lca_params {
+	u64 addr;
+} __packed;
+
+/**
+ * struct kmb_vpu_debayer_params - KMB Debayer parameters
+ *
+ * @coeff1: Filter coeff1 parameter
+ * @multiplier1: Filter multiplier1 parameter
+ * @multiplier2: Filter multiplier2 parameter
+ * @coeff2: Filter coeff2 parameter
+ * @coeff3: Filter coeff3 parameter
+ * @coeff4: Filter coeff4 parameter
+ */
+struct kmb_vpu_debayer_params {
+	s32 coeff1;
+	u32 multiplier1;
+	u32 multiplier2;
+	s32 coeff2;
+	s32 coeff3;
+	s32 coeff4;
+} __packed;
+
+/**
+ * struct kmb_vpu_hdr_params - KMB HDR parameters
+ *
+ * @ratio: HDR ratio parameter
+ * @scale: HDR scale parameter
+ * @offset1: HDR offset1 parameter
+ * @slope1: HDR slope1 parameter
+ * @offset2: HDR offset2 parameter
+ * @slope2: HDR slope2 parameter
+ * @offset3: HDR offset3 parameter
+ * @slope3: HDR slope3 parameter
+ * @offset4: HDR offset4 parameter
+ * @gain1: HDR gain1 parameter
+ * @blur1: HDR blur1 parameter
+ * @blur2: HDR blur2 parameter
+ * @contrast1: HDR contrast1 parameter
+ * @contrast2: HDR contrast2 parameter
+ * @enable1: HDR enable1 parameter
+ * @enable2: HDR enable2 parameter
+ * @offset5: HDR offset5 parameter
+ * @gain2: HDR gain2 parameter
+ * @offset6: HDR offset6 parameter
+ * @strength: HDR strength parameter
+ * @reserved1: Reserved for alignment purpose
+ * @luts_addr: HDR LUT address
+ * @offset7: HDR offset7 parameter
+ * @shift: HDR shift parameter
+ * @field1: HDR filed1 parameter
+ * @field2: HDR field2 parameter
+ * @gain3: HDR gain3 parameter
+ * @min: HDR min parameter
+ * @reserved2: Reserved for alignment purpose
+ */
+struct kmb_vpu_hdr_params {
+	u32 ratio[2];
+	u32 scale[3];
+	s32 offset1;
+	u32 slope1;
+	s32 offset2;
+	u32 slope2;
+	s32 offset3;
+	u32 slope3;
+	s32 offset4;
+	u32 gain1;
+	u32 blur1[3];
+	u32 blur2[5];
+	u32 contrast1;
+	u32 contrast2;
+	u32 enable1;
+	u32 enable2;
+	s32 offset5;
+	u32 gain2;
+	s32 offset6;
+	u32 strength;
+	u8 reserved1[4];
+	u64 luts_addr;
+	u16 offset7;
+	u32 shift;
+	u16 field1;
+	u16 field2;
+	u8 gain3;
+	u16 min;
+	u8 reserved2[3];
+} __packed;
+
+/**
+ * struct kmb_vpu_dog_dns_params - KMB Difference-of-Gaussians DNS parameters
+ *
+ * @threshold: Filter threshold parameter
+ * @strength: Filter strength parameter
+ * @coeffs11: Filter coeffs11 parameter
+ * @coeffs15: Filter coeffs15 parameter
+ * @reserved: Reserved for alignment purpose
+ */
+struct kmb_vpu_dog_dns_params {
+	u32 threshold;
+	u32 strength;
+	u8 coeffs11[6];
+	u8 coeffs15[8];
+	u8 reserved[2];
+} __packed;
+
+/**
+ * struct kmb_vpu_luma_dns_params - KMB Luma DNS parameters
+ *
+ * @threshold: Luma DNS threshold parameter
+ * @slope: Luma DNS slope parameter
+ * @shift: Luma DNS shift parameter
+ * @alpha: Luma DNS alpha parameter
+ * @weight: Luma DNS weight parameter
+ * @per_pixel_alpha_en: Enable adapt alpha
+ * @gain_bypass_en: Enable gain bypass
+ * @reserved: for alignment purpose
+ */
+struct kmb_vpu_luma_dns_params {
+	u32 threshold;
+	u32 slope;
+	u32 shift;
+	u32 alpha;
+	u32 weight;
+	u32 per_pixel_alpha_en;
+	u32 gain_bypass_en;
+	u8 reserved[4];
+} __packed;
+
+/**
+ * struct kmb_vpu_sharpen_params - KMB Sharpen parameters
+ *
+ * @coeffs1: Filter coeffs1 parameter
+ * @coeffs2: Filter coeffs2 parameter
+ * @coeffs3: Filter coeffs3 parameter
+ * @shift: Filter shift parameter
+ * @gain1: Filter gain1 parameter
+ * @gain2: Filter gain2 parameter
+ * @gain3: Filter gain3 parameter
+ * @gain4: Filter gain4 parameter
+ * @gain5: Filter gain5 parameter
+ * @stops1: Filter stops1 parameter
+ * @gains: Filter gains parameter
+ * @stops2: Filter stops2 parameter
+ * @overshoot: Filter overshoot parameter
+ * @undershoot: Filter undershoot parameter
+ * @alpha: Filter alpha parameter
+ * @gain6: Filter gain6 parameter
+ * @offset: Filter offset parameter
+ * @addr: Filter data address
+ */
+struct kmb_vpu_sharpen_params {
+	u16 coeffs1[6];
+	u16 coeffs2[6];
+	u16 coeffs3[6];
+	u32 shift;
+	u32 gain1;
+	u32 gain2;
+	u32 gain3;
+	u32 gain4;
+	u32 gain5;
+	u32 stops1[3];
+	u32 gains[3];
+	u32 stops2[4];
+	u32 overshoot;
+	u32 undershoot;
+	u32 alpha;
+	u32 gain6;
+	u32 offset;
+	u64 addr;
+} __packed;
+
+/**
+ * struct kmb_vpu_chroma_gen_params - KMB Chroma GEN parameters
+ *
+ * @epsilon: Chroma GEN epsilon parameter
+ * @coeff1: Chroma GEN coeff1 parameter
+ * @coeff2: Chroma GEN coeff2 parameter
+ * @coeff3: Chroma GEN coeff3 parameter
+ * @coeff4: Chroma GEN coeff4 parameter
+ * @coeff5: Chroma GEN coeff5 parameter
+ * @coeff6: Chroma GEN coeff6 parameter
+ * @strength1: Chroma GEN strength1 parameter
+ * @strength2: Chroma GEN strength2 parameter
+ * @coeffs: Chroma GEN coeffs parameter
+ * @offset1: Chroma GEN offset1 parameter
+ * @slope1: Chroma GEN slope1 parameter
+ * @slope2: Chroma GEN slope2 parameter
+ * @offset2: Chroma GEN offset2 parameter
+ * @limit: Chroma GEN limit parameter
+ */
+struct kmb_vpu_chroma_gen_params {
+	u32 epsilon;
+	u32 coeff1;
+	u32 coeff2;
+	u32 coeff3;
+	u32 coeff4;
+	u32 coeff5;
+	u32 coeff6;
+	u32 strength1;
+	u32 strength2;
+	u32 coeffs[3];
+	s32 offset1;
+	u32 slope1;
+	u32 slope2;
+	s32 offset2;
+	u32 limit;
+} __packed;
+
+/**
+ * struct kmb_vpu_median_params - KMB Median parameters
+ *
+ * @size: Filter size parameter
+ * @slope: Filter slope parameter
+ * @offset: Filter offset parameter
+ */
+struct kmb_vpu_median_params {
+	u32 size;
+	u32 slope;
+	s32 offset;
+} __packed;
+
+/**
+ * struct kmb_vpu_chroma_dns_params - KMB Chroma Denoise parameters
+ *
+ * @limit: Filter limit parameter
+ * @enable: Filter enable parameter
+ * @threshold1: Filter threshold1 parameter
+ * @threshold2: Filter threshold2 parameter
+ * @threshold3: Filter threshold3 parameter
+ * @threshold4: Filter threshold4 parameter
+ * @threshold5: Filter threshold5 parameter
+ * @threshold6: Filter threshold6 parameter
+ * @threshold7: Filter threshold7 parameter
+ * @threshold8: Filter threshold8 parameter
+ * @slope1: Filter slope1 parameter
+ * @offset1: Filter offset1 parameter
+ * @slope2: Filter slope2 parameter
+ * @offset2: Filter offset2 parameter
+ * @grey1: Filter grey1 parameter
+ * @grey2: Filter grey2 parameter
+ * @grey3: Filter grey3 parameter
+ * @coeff1: Filter coeff1 parameter
+ * @coeff2: Filter coeff2 parameter
+ * @coeff3: Filter coeff3 parameter
+ */
+struct kmb_vpu_chroma_dns_params {
+	u32 limit;
+	u32 enable;
+	u32 threshold1;
+	u32 threshold2;
+	u32 threshold3;
+	u32 threshold4;
+	u32 threshold5;
+	u32 threshold6;
+	u32 threshold7;
+	u32 threshold8;
+	u32 slope1;
+	s32 offset1;
+	u32 slope2;
+	s32 offset2;
+	u32 grey1;
+	u32 grey2;
+	u32 grey3;
+	u32 coeff1;
+	u32 coeff2;
+	u32 coeff3;
+} __packed;
+
+/**
+ * struct kmb_vpu_color_comb_params - KMB Color Combine parameters
+ *
+ * @matrix: Color combine matrix parameter
+ * @offsets:Color combine offsets parameter
+ * @coeff1: Color combine coeff1 parameter
+ * @coeff2: Color combine coeff2 parameter
+ * @coeff3: Color combine coeff3 parameter
+ * @reserved: Reserved for alignment purpose
+ * @addr: Color combine table address
+ * @enable: Color combine enable parameter
+ * @weight1: Color combine weight1 parameter
+ * @weight2: Color combine weight2 parameter
+ * @weight3: Color combine weight3 parameter
+ * @limit1: Color combine limit1 parameter
+ * @limit2: Color combine limit2 parameter
+ * @offset1: Color combine offset1 parameter
+ * @offset2: Color combine offset2 parameter
+ */
+struct kmb_vpu_color_comb_params {
+	u16 matrix[9];
+	u16 offsets[3];
+	u32 coeff1;
+	u32 coeff2;
+	u32 coeff3;
+	u8 reserved[4];
+	u64 addr;
+	u32 enable;
+	u32 weight1;
+	u32 weight2;
+	u32 weight3;
+	u32 limit1;
+	s32 limit2;
+	s32 offset1;
+	s32 offset2;
+} __packed;
+
+/**
+ * struct kmb_vpu_lut_params - KMB lut parameters
+ *
+ * @size: Lut size parameter
+ * @reserved: Reserved for alignment purpose
+ * @addr: Lut table address
+ * @matrix: Lut matrix parameter
+ * @offsets: Lut offsets parameter
+ */
+struct kmb_vpu_lut_params {
+	u32 size;
+	u8 reserved[4];
+	u64 addr;
+	u16 matrix[3 * 3];
+	u16 offsets[3];
+} __packed;
+
+/**
+ * struct kmb_vpu_tnf_params - KMB Temporal Noise Filter parameters
+ *
+ * @factor: Filter factor parameter
+ * @gain: Filter gain parameter
+ * @offset1: Filter offset1 parameter
+ * @slope1: Filter slope1 parameter
+ * @offset2: Filter offset2 parameter
+ * @slope2: Filter slope2 parameter
+ * @min1: Filter min1 parameter
+ * @min2: Filter min2 parameter
+ * @value: Filter value parameter
+ * @enable: Filter enable parameter
+ * @lut0_addr: Filter lut0 address
+ * @lut1_addr: Filter lut1 address
+ */
+struct kmb_vpu_tnf_params {
+	u32 factor;
+	u32 gain;
+	u32 offset1;
+	u32 slope1;
+	u32 offset2;
+	u32 slope2;
+	u32 min1;
+	u32 min2;
+	u32 value;
+	u32 enable;
+	u64 lut0_addr;
+	u64 lut1_addr;
+} __packed;
+
+/**
+ * struct kmb_vpu_dehaze_params - KMB dehaze parameters
+ *
+ * @gain1: Dehaze gain1 parameter
+ * @min: Dehaze min parameter
+ * @strength1: Dehaze strength1 parameter
+ * @strength2: Dehaze strength2 parameter
+ * @gain2: Dehaze gain2 parameter
+ * @saturation: Dehaze saturation parameter
+ * @value1: Dehaze value1 parameter
+ * @value2: Dehaze value2 parameter
+ * @value3: Dehaze value3 parameter
+ * @filter: Dehaze filter parameter
+ * @stats_addr: Dehaze statistics address
+ */
+struct kmb_vpu_dehaze_params {
+	u32 gain1;
+	u32 min;
+	u32 strength1;
+	u32 strength2;
+	u32 gain2;
+	u32 saturation;
+	u32 value1;
+	u32 value2;
+	u32 value3;
+	u32 filter[3];
+	u64 stats_addr;
+} __packed;
+
+/**
+ * struct kmb_vpu_warp_params - KMB Warp filter parameters
+ *
+ * @type: Warp filter type parameter
+ * @relative: Warp filter relative parameter
+ * @format: Warp filter format parameter
+ * @position: Warp filter position parameter
+ * @reserved: Reserved for alignment purposes
+ * @addr: Warp filter addr parameter
+ * @width: Warp filter width parameter
+ * @height: Warp filter height parameter
+ * @stride: Warp filter stride parameter
+ * @enable: Warp filter enable parameter
+ * @matrix: Warp matrix parameter
+ * @mode: Warp filter mode parameter
+ * @values: Warp filter values parameter
+ */
+struct kmb_vpu_warp_params {
+	u8 type;
+	u8 relative;
+	u8 format;
+	u8 position;
+	u8 reserved[4];
+	u64 addr;
+	u16 width;
+	u16 height;
+	u32 stride;
+	u8 enable;
+	u32 matrix[9];
+	u8 mode;
+	u16 values[3];
+} __packed;
+
+/**
+ * enum kmb_vpu_bayer_order - KMB sensor Bayer arrangement format types
+ *
+ * @KMB_ISP_BAYER_ORDER_GRBG: Gr R B Gr
+ * @KMB_ISP_BAYER_ORDER_RGGB: R Gr Gr B
+ * @KMB_ISP_BAYER_ORDER_GBRG: Gr B R Gr
+ * @KMB_ISP_BAYER_ORDER_BGGR: B Gr Gr R
+ */
+enum kmb_vpu_bayer_order {
+	KMB_VPU_ISP_BAYER_ORDER_GRBG = 0,
+	KMB_VPU_ISP_BAYER_ORDER_RGGB = 1,
+	KMB_VPU_ISP_BAYER_ORDER_GBRG = 2,
+	KMB_VPU_ISP_BAYER_ORDER_BGGR = 3,
+} __packed;
+
+/* Version of the VPU ISP ABI. It should be passed as
+ * first argument in the isp params struct
+ */
+#define KMB_VPU_ISP_ABI_VERSION 104
+
+/**
+ * struct kmb_vpu_isp_params - KMB  VPU ISP parameters structure
+ *
+ * @header_version: Header Version
+ * @image_data_width: Image data width
+ * @num_exposures: Number of exposures
+ * @bayer_order: enum kmb_isp_bayer_order
+ * @user_data_key: Private key used for the client
+ * @blc: Black Level correction parameters
+ * @sigma_dns: Sigma denoise parameters
+ * @lsc: Lens Shading Correction parameters
+ * @raw: Raw parameters
+ * @ae_awb: Auto exposure/Auto white balance parameters
+ * @af: Auto focus parameters
+ * @histogram: Histogram parameters
+ * @lca: Lateral Chromatic Aberration filter parameters
+ * @debayer: SIPP Bayer demosaicing filter parameters
+ * @dog_dns: Difference-of-Gaussians filter parameters
+ * @luma_dns: Luma denoise parameters
+ * @sharpen: Sharpen filter parameters
+ * @chroma_gen: Chroma GEN parameters
+ * @median: Median hardware filter parameters
+ * @chroma_dns: Chroma Denoise hardware filter parameters
+ * @color_comb: Color Combine parameters
+ * @hdr: HDR parameters applied only in HDR mode
+ * @lut: lut parameters
+ * @tnf: Temporal Noise Filter parameters
+ * @dehaze: Dehaze parameters
+ * @warp: Warp filter parameters
+ */
+struct kmb_vpu_isp_params {
+	u32 header_version;
+	u32 image_data_width;
+	u32 num_exposures;
+	u32 bayer_order;
+	u32 user_data_key;
+	struct kmb_vpu_blc_params blc[KMB_VPU_MAX_EXPOSURES];
+	struct kmb_vpu_sigma_dns_params sigma_dns[KMB_VPU_MAX_EXPOSURES];
+	struct kmb_vpu_lsc_params lsc;
+	struct kmb_vpu_raw_params raw;
+	struct kmb_vpu_ae_awb_params ae_awb;
+	struct kmb_vpu_af_params af;
+	struct kmb_vpu_hist_params histogram;
+	struct kmb_vpu_lca_params lca;
+	struct kmb_vpu_debayer_params debayer;
+	struct kmb_vpu_dog_dns_params dog_dns;
+	struct kmb_vpu_luma_dns_params luma_dns;
+	struct kmb_vpu_sharpen_params sharpen;
+	struct kmb_vpu_chroma_gen_params chroma_gen;
+	struct kmb_vpu_median_params median;
+	struct kmb_vpu_chroma_dns_params chroma_dns;
+	struct kmb_vpu_color_comb_params color_comb;
+	struct kmb_vpu_hdr_params hdr;
+	struct kmb_vpu_lut_params lut;
+	struct kmb_vpu_tnf_params tnf;
+	struct kmb_vpu_dehaze_params dehaze;
+	struct kmb_vpu_warp_params warp;
+} __packed;
+
+#endif /* KEEMBAY_VPU_ISP */
diff --git a/drivers/media/platform/keembay-camera/keembay-vpu-pipe.h b/drivers/media/platform/keembay-camera/keembay-vpu-pipe.h
new file mode 100644
index 000000000000..d400b59938b2
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-vpu-pipe.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera VPU pipe definitions
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_VPU_PIPE_H
+#define KEEMBAY_VPU_PIPE_H
+
+#include "keembay-vpu-src.h"
+
+#define PIPE_TYPE_ISP_MAX_EXP 3
+
+enum {
+	PIPE_TYPE_ISP_ISP_ULL = 1,
+	PIPE_TYPE_ISP_ISP_2DOL,
+	PIPE_TYPE_ISP_ISP_3DOL,
+	PIPE_TYPE_ISP_ISP_MONO,
+
+	PIPE_TYPE_MAX,
+};
+
+enum {
+	SRC_TYPE_ALLOC_VPU_DATA_MIPI = 0,
+	SRC_TYPE_ALLOC_VPU_DATA_DBG,
+	SRC_TYPE_ALLOC_ARM_DATA_ARM,
+	SRC_TYPE_ALLOC_ARM_DATA_MIPI,
+	SRC_TYPE_ALLOC_ARM_DATA_DBG,
+
+	SRC_TYPE_ALLOC_DATA_MAX,
+};
+
+enum {
+	PIPE_TRANSFORM_HUB_NONE = 0,
+	PIPE_TRANSFORM_HUB_BASIC,
+	PIPE_TRANSFORM_HUB_FULL,
+	PIPE_TRANSFORM_HUB_STITCH,
+	PIPE_TRANSFORM_HUB_EPTZ,
+
+	PIPE_TRANSFORM_HUB_MAX,
+};
+
+enum {
+	PIPE_OUTPUT_ID_RAW = 0,
+	PIPE_OUTPUT_ID_ISP_CTRL,
+	PIPE_OUTPUT_ID_0,
+	PIPE_OUTPUT_ID_1,
+	PIPE_OUTPUT_ID_2,
+	PIPE_OUTPUT_ID_3,
+	PIPE_OUTPUT_ID_4,
+	PIPE_OUTPUT_ID_5,
+	PIPE_OUTPUT_ID_6,
+
+	PIPE_OUTPUT_ID_MAX,
+};
+
+/*
+ * struct kmb_channel_cfg - KMB channel configuration
+ *
+ * @id: Channel id
+ * @frm_res: Frame resolution
+ */
+struct kmb_channel_cfg {
+	u32 id;
+	struct kmb_ic_img_size frm_res;
+};
+
+/*
+ * struct kmb_pipe_config_evs - VPU pipeline configuration
+ *
+ * @pipe_id: Pipe id
+ * @pipe_type: Pipe type
+ * @src_type: Source type
+ * @pipe_trans_hub: Transform hub type
+ * @in_isp_res: Input ISP resolution
+ * @out_isp_res: Output isp resolution
+ * @in_isp_stride: ISP input stride used in DOL interleaved mode
+ * @in_exp_offsets: Long and short exp frames offsets used in interleaved mode
+ * @out_min_res: Output min resolution
+ * @out_max_res: Output max resolution
+ * @pipe_xlink_chann: Output channel id from the enum PIPE_OUTPUT_ID
+ * @keep_aspect_ratio: If enabled, aspect ratio must be kept when image is
+ *                     resized
+ * @in_data_width: Input bits per pixel
+ * @in_data_packed: Flag to enable packed mode
+ * @out_data_width: Output bits per pixel for first plane
+ * @internal_memory_addr: Internal memory pool address
+ * @internal_memory_size: Internal memory pool size
+ */
+struct kmb_pipe_config_evs {
+	u8 pipe_id;
+	u8 pipe_type;
+	u8 src_type;
+	u8 pipe_trans_hub;
+	struct kmb_ic_img_size in_isp_res;
+	struct kmb_ic_img_size out_isp_res;
+	u16 in_isp_stride;
+	u32 in_exp_offsets[PIPE_TYPE_ISP_MAX_EXP];
+	struct kmb_ic_img_size out_min_res[PIPE_OUTPUT_ID_MAX];
+	struct kmb_ic_img_size out_max_res[PIPE_OUTPUT_ID_MAX];
+	struct kmb_channel_cfg pipe_xlink_chann[PIPE_OUTPUT_ID_MAX];
+	u8 keep_aspect_ratio;
+	u8 in_data_width;
+	u8 in_data_packed;
+	u8 out_data_width;
+	u64 internal_memory_addr;
+	u32 internal_memory_size;
+} __aligned(64);
+
+#endif /* KEEMBAY_VPU_PIPE_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-vpu-src.h b/drivers/media/platform/keembay-camera/keembay-vpu-src.h
new file mode 100644
index 000000000000..97f8febbc7e2
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-vpu-src.h
@@ -0,0 +1,193 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera VPU source configuration
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#ifndef KEEMBAY_VPU_SRC_H
+#define KEEMBAY_VPU_SRC_H
+
+/*
+ * struct kmb_ic_img_size - The structure contains information about image size
+ *
+ * @w: Image width
+ * @h: Image height
+ */
+struct kmb_ic_img_size {
+	u32 w;
+	u32 h;
+};
+
+/*
+ * struct kmb_ic_img_rect - The struct represents the coordinates of a
+ *                          rectangular image
+ *
+ * @x1: Position of the bottom left corner
+ * @y1: Position of the top left corner
+ * @x2: Position of the bottom right corner
+ * @y2: Position of the top right corner
+ */
+struct kmb_ic_img_rect {
+	s32 x1;
+	s32 y1;
+	s32 x2;
+	s32 y2;
+};
+
+/*
+ * enum kmb_ic_source_instance - HW mipi/cif input devices
+ *
+ * @KMB_IC_SOURCE_0:
+ * @KMB_IC_SOURCE_1:
+ * @KMB_IC_SOURCE_2:
+ * @KMB_IC_SOURCE_3:
+ * @KMB_IC_SOURCE_4:
+ * @KMB_IC_SOURCE_5:
+ */
+enum kmb_ic_source_instance {
+	KMB_IC_SOURCE_0 = 0,
+	KMB_IC_SOURCE_1 = 1,
+	KMB_IC_SOURCE_2 = 2,
+	KMB_IC_SOURCE_3 = 3,
+	KMB_IC_SOURCE_4 = 4,
+	KMB_IC_SOURCE_5 = 5,
+};
+
+/*
+ * enum kmb_ic_bayer_format - Bayer pattern order
+ *
+ * @KMB_IC_BAYER_FORMAT_GRBG: Gr R B Gr
+ * @KMB_IC_BAYER_FORMAT_RGGB: R Gr Gr B
+ * @KMB_IC_BAYER_FORMAT_GBRG: Gr B R Gr
+ * @KMB_IC_BAYER_FORMAT_BGGR: B Gr Gr R
+ */
+enum kmb_ic_bayer_format {
+	KMB_IC_BAYER_FORMAT_GRBG = 0,
+	KMB_IC_BAYER_FORMAT_RGGB = 1,
+	KMB_IC_BAYER_FORMAT_GBRG = 2,
+	KMB_IC_BAYER_FORMAT_BGGR = 3,
+};
+
+/*
+ * enum kmb_ic_mipi_rx_ctrl_rec_not - List of receiver Id's for a specific
+ *                                    sensor
+ *
+ * @KMB_IC_SIPP_DEVICE0:
+ * @KMB_IC_SIPP_DEVICE1:
+ * @KMB_IC_SIPP_DEVICE2:
+ * @KMB_IC_SIPP_DEVICE3:
+ * @KMB_IC_CIF0_DEVICE4:
+ * @KMB_IC_CIF1_DEVICE5:
+ */
+enum kmb_ic_mipi_rx_ctrl_rec_not {
+	KMB_IC_SIPP_DEVICE0 = 0,
+	KMB_IC_SIPP_DEVICE1 = 1,
+	KMB_IC_SIPP_DEVICE2 = 2,
+	KMB_IC_SIPP_DEVICE3 = 3,
+	KMB_IC_CIF0_DEVICE4 = 4,
+	KMB_IC_CIF1_DEVICE5 = 5,
+};
+
+/*
+ * enum kmb_ic_mipi_rx_ctrl_not - MIPI controller from chip
+ *
+ * @KMB_IC_MIPI_CTRL_0:
+ * @KMB_IC_MIPI_CTRL_1:
+ * @KMB_IC_MIPI_CTRL_2:
+ * @KMB_IC_MIPI_CTRL_3:
+ * @KMB_IC_MIPI_CTRL_4:
+ * @KMB_IC_MIPI_CTRL_5:
+ */
+enum kmb_ic_mipi_rx_ctrl_not {
+	KMB_IC_MIPI_CTRL_0 = 0,
+	KMB_IC_MIPI_CTRL_1 = 1,
+	KMB_IC_MIPI_CTRL_2 = 2,
+	KMB_IC_MIPI_CTRL_3 = 3,
+	KMB_IC_MIPI_CTRL_4 = 4,
+	KMB_IC_MIPI_CTRL_5 = 5,
+};
+
+/*
+ * enum kmb_ic_mipi_ex_data_type - All supported raw, sensor input formats
+ *
+ * @IC_IPIPE_YUV_420_B8:
+ * @IC_IPIPE_RAW_8:
+ * @IC_IPIPE_RAW_10:
+ * @IC_IPIPE_RAW_12:
+ * @IC_IPIPE_RAW_14:
+ * @IC_IPIPE_EMBEDDED_8BIT:
+ */
+enum kmb_ic_mipi_rx_data_type {
+	IC_IPIPE_YUV_420_B8       = 0x18,
+	IC_IPIPE_RAW_8            = 0x2A,
+	IC_IPIPE_RAW_10           = 0x2B,
+	IC_IPIPE_RAW_12           = 0x2C,
+	IC_IPIPE_RAW_14           = 0x2D,
+	IC_IPIPE_EMBEDDED_8BIT    = 0x12
+};
+
+/*
+ * struct kmb_ic_source_config_dynamic - Per-source configuration of parameters
+ *                                       which can be modified dynamically.
+ *                                       Setting will take effect during the
+ *                                       next blanking interval
+ *
+ * @notification_line: Line number upon which IC_EVENT_TYPE_LINE will be sent
+ *                     to the Lean OS. Set to -1 to disable notification
+ */
+struct kmb_ic_source_config_dynamic {
+	s32 notification_line;
+};
+
+/*
+ * struct kmb_ic_mipi_config - Mipi RX data configuration
+ *
+ * @no_controller: Number of controller
+ * @no_lanes: Number of lanes
+ * @lane_rate_mbps: Lane rate
+ * @data_type: Mipi RX data type
+ * @data_mode: Data mode
+ * @rec_nrl:
+ */
+struct kmb_ic_mipi_config {
+	u32 no_controller;
+	u32 no_lanes;
+	u32 lane_rate_mbps;
+	u32 data_type;
+	u32 data_mode;
+	u32 rec_nrl;
+};
+
+/*
+ * struct kmb_ic_source_config - Per-source configuration parameters - mostly
+ *                               information needed to configure the MIPI Rx
+ *                               filter
+ *
+ * @camera_output_size: Max frame size output by the camera
+ * @crop_window: Crop window coordinates
+ * @bayer_format: Bayer Format - Raw, Demosaic and LSC blocks should be
+ *                programmed to match the Bayer order specified here.
+ * @bpp: Bits per pixel
+ * @mipi_rx_data: MIPI RX data configuration
+ * @no_exposure: Number of different exposure frames
+ * @metadata_width: Metadata width
+ * @metadata_height: Medata height
+ * @metadata_data_type: Metadata data type
+ */
+struct kmb_ic_source_config {
+	struct kmb_ic_img_size camera_output_size;
+	struct kmb_ic_img_rect crop_window;
+
+	u32 bayer_format;
+	u32 bpp;
+
+	struct kmb_ic_mipi_config mipi_rx_data;
+
+	u32 no_exposure;
+	u32 metadata_width;
+	u32 metadata_height;
+	u32 metadata_data_type;
+} __aligned(64);
+
+#endif  /* KEEMBAY_VPU_SRC_H */
-- 
2.11.0

