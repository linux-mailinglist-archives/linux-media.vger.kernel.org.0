Return-Path: <linux-media+bounces-44656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE297BE157D
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 05:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E212F4E5CD8
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 03:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D381C84B9;
	Thu, 16 Oct 2025 03:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="UhYVYe9K"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9421EDA0E;
	Thu, 16 Oct 2025 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760584719; cv=none; b=Lr3BhE4cQqvlXA+dmjyQGmH/AiXu2TNJsULktLMiPsCP4DG/TlBGnLijWzaiTJZgAu/0jQXtVREqrlaXMn6z4B2rFZnCVMHy3/jwyyan5ZVoKsiwEPCTQbWEZqJHHpYGAC8/n6RwIjcPRpmwfNXo1rwoWQ49kZNoqRF8+rG+alM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760584719; c=relaxed/simple;
	bh=Bw078PTee+bhxy1fXy+l68946A80K9F0MmPdf2cKjmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y74whSEnfNDOZtAFgu60llYcJvVdMhjfruoUwGCYCrRBXrsX7YsFk3BM1ABebHsEQUB0hHaiWXHLlwW8yVilV1UI79RqabCQ0vg9W2XzFpuUh/Axu1pHaYxIR1Aj9jM9o+v4q3lY9NugoVTxVArTRwS9DyZxdVmF1WU3R4IYi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=UhYVYe9K; arc=none smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 59G2UoEn2735058; Thu, 16 Oct 2025 11:30:50 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581822;x=1761791422;bh=Bw078PTee+bhxy1fXy+l68946A80K9F0MmPdf2cKjmw=;b=UhY
	VYe9K3a8U0NgE8z8AmAmMvXv7EeUcGu/TEqJejU/dLL1pFKTFDLXJavoY1XLf2a9g2uEsn+m50UWU
	yRb6WpvVbTJ3kdytl3VCMd+OkjkNtoE7CWlOfix+T5R4fym0B22vTiHEAeLKqXwQ+nHWU0l8MABHg
	BvF4cOYQynIK+HNU71wR67bHfpjDeFMyFG8BrWDMFibuCzQbtp7zsP6MKnGcjz2IwnzyDFYR6Rh3/
	CpSCj/+GDh/5Kqq/ocBIAWsAgmLygSIf1otGQMRc5EUjyg2cNqWAU6mIEGDvF9bFkVJmHblZ1hY1y
	TdIDdu1AdE3YSbeKxCOVGY9pACiv3AQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 59G2UM203796474; Thu, 16 Oct 2025 11:30:22 +0900
X-Iguazu-Qid: 2yAbS6oRblDrO02oR3
X-Iguazu-QSIG: v=2; s=0; t=1760581822; q=2yAbS6oRblDrO02oR3; m=WrOZsY1ZuuiFmRMJcQxDn29zK4KMyZVZarWAY/qOcHA=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkk25FZzyPQ; Thu, 16 Oct 2025 11:30:22 +0900 (JST)
X-SA-MID: 53072917
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:44 +0900
Subject: [PATCH v13 7/7] documentation: media: Add documentation for
 Toshiba Visconti Video Input Interface driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-7-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add description of Video Input Interface driver of
Toshiba Visconti architecture.
It includes hardware organization, structure of the driver
and metadata format for embedded image signal processor.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v3:
- Newly add documentation to describe SW and HW

Changelog v4:
- no change

Changelog v5:
- no change

Changelog v6:
- add description of CSI2RX subdevice
- add ordering of ioctl(S_FMT) and ioctl(S_EXT_CTRLS)

Changelog v7:
- no change

Changelog v8:
- add usage of V4L2_CTRL_TYPE_VISCONTI_ISP

Changelog v9:
- fix warning: set reference target for keyword V4L2_CTRL_TYPE_VISCONTI_ISP

Changelog v10:
- use parameter buffers instead of compound control
  - removed description of vendor specific compound control
  - add description of parameter buffers for ISP control
- update directory structure
  - remove documents under driver-api
  - add documents to admin-guide, userspace-api

Changelog v11:
- update usage of the driver

Changelog v12:
- add description of CSI2RX driver
- description of resizer subdevice
- add block diagrams of VIIF and ISP
- update usage of the driver

Changelog v13:
- wrap one line at 80 characters
- add entries to MAINTAINERS flle
- update media subdevice diagram to remove resizer subdevices
- Clarify whether it is a line break around the 80-character mark or a paragraph transition.
- add detailed description for SLIC module.
- update description of HDRC: use of term "global and local tone mapping"
- update description of AWHB: algorithm of whitebalance is handled by hardware only
- what a keyword "AG" mean?: analog gain (general term for image sensors) / algorithm gain (VIIF specific term)
- PWL image have 14bit depth
- update illustration of preprocessing; most of the modules handle 12bit intermediate images
- update illustration of L2ISP
- add output format UYVY
- fix references to struct viif_l2_undist_config and viif_l2_roi_config
- add description of scaling and cropping
- add reference to viif_l2_crop_config
- update Capturing example
- add description of debugfs
---
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 Documentation/admin-guide/media/visconti-viif.dot  |  18 +
 Documentation/admin-guide/media/visconti-viif.rst  | 540 +++++++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../media/v4l/metafmt-visconti-viif.rst            |  48 ++
 MAINTAINERS                                        |   2 +
 6 files changed, 610 insertions(+)

diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 3bac5165b134..b6b0b22a12a6 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -33,5 +33,6 @@ Video4Linux (V4L) driver-specific documentation
 	si476x
 	starfive_camss
 	vimc
+	visconti-viif
 	visl
 	vivid
diff --git a/Documentation/admin-guide/media/visconti-viif.dot b/Documentation/admin-guide/media/visconti-viif.dot
new file mode 100644
index 000000000000..fb74c350b50d
--- /dev/null
+++ b/Documentation/admin-guide/media/visconti-viif.dot
@@ -0,0 +1,18 @@
+digraph board {
+        rankdir=TB
+        n00000001 [label="{{<port0> 0 | <port4> 4} | visconti-viif:isp\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2 | <port3> 3 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000001:port1 -> n00000008
+        n00000001:port2 -> n0000000c
+        n00000001:port3 -> n00000010
+        n00000001:port5 -> n00000018
+        n00000008 [label="viif_capture_post0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n0000000c [label="viif_capture_post1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000010 [label="viif_capture_sub\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n00000014 [label="viif_params\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n00000014 -> n00000001:port4
+        n00000018 [label="viif_stats\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+        n00000026 [label="{{<port0> 0} | visconti_csi2rx 1c008000.csi2rx\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000026:port1 -> n00000001:port0
+        n0000002b [label="{{} | imx219 1-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000002b:port0 -> n00000026:port0 [style=bold]
+}
diff --git a/Documentation/admin-guide/media/visconti-viif.rst b/Documentation/admin-guide/media/visconti-viif.rst
new file mode 100644
index 000000000000..fbe177b0709a
--- /dev/null
+++ b/Documentation/admin-guide/media/visconti-viif.rst
@@ -0,0 +1,540 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================================
+Visconti Video Input Interface Driver (visconti-viif)
+======================================================
+
+Introduction
+============
+
+This file documents the driver for the Video Input Interface (VIIF) that is
+part of Toshiba Visconti SoCs. The driver is located under
+drivers/media/platform/toshiba/visconti and uses the Media-Controller API.
+
+The driver module is named visconti-viif, and is enabled through the
+CONFIG_VIDEO_VISCONTI_VIIF config option. The CSI-2 receiver part is controlled
+by another module named visconti-csi2rx, which is enabled through the
+CONFIG_VIDEO_VISCONTI_CSI2RX config option.
+
+The Visconti VIIF Hardware
+==========================
+
+The Visconti VIIF hardware is an internally developed video capture device.
+Following function modules are integrated:
+
+* MIPI CSI-2 receiver (CSI2RX)
+* L1 Image Signal Processor (L1ISP)
+
+  * Correction, enhancement, adjustment on bayer images.
+
+* L2 Image Signal Processor (L2ISP)
+
+  * Lens distortion correction
+  * Scaling & Cropping with up to 2 parameter sets
+  * Formatting picture (RGB, YUV, Grayscale, ...)
+  * Integrated DMAC: Writing picture into main memory
+
+* Video DMAC
+
+  * Writing picture into main memory
+
+Visconti5 SoC has two VIIF hardware instances.
+
+
+The hardware block diagram is shown below.::
+
+  The VIIF hardware
+                                                              "POST0"
+                                                              "RGB with scale 0"
+  +--------+    +----------+    +-----+    +-----+    +-----+    +--------+
+  | Sensor |--->|  CSI2RX  |--->|     |    |     |    |     |--->| memory |
+  +--------+    +----------+    |     |    |     |    |     |    +--------+
+                                |     |    | L1  |    | L2  | "POST1"
+                                |     |--->| ISP |--->| ISP | "RGB with scale 1"
+                                |     |    |     |    |     |    +--------+
+                                | MUX |    |     |    |     |--->| memory |
+                                |     |    +-----+    +-----+    +--------+
+                                |     |                       "SUB"
+                                |     |                       "RAW w/o scale"
+                                |     |        +------------+    +--------+
+                                |     |------> | Video DMAC |--->| memory |
+                                +-----+        +------------+    +--------+
+
+Topology
+========
+
+Graph
+-----
+
+.. _visconti_viif_topology_graph:
+
+.. kernel-figure:: visconti-viif.dot
+	:alt: Diagram of the default media pipeline topology
+	:align: center
+
+The driver has 3 video devices for capturing images:
+
+- viif_capture_post0: capture device for image.
+    - corresponds to L2ISP.
+- viif_capture_post1: capture device for image.
+    - corresponds to L2ISP.
+- viif_capture_sub: capture device for bayer image.
+    - corresponds to Video DMAC.
+
+The driver has 2 video devices for controlling ISP.
+
+- viif_params: a metadata output device that receives ISP parameters.
+    - corresponds to L1ISP and L2ISP.
+- viif_stats: a metadata capture device that sends statistics.
+    - corresponds to L1ISP and L2ISP.
+
+The driver has 2 subdevices:
+
+- visconti_csi2rx: CSI-2 receiver operation.
+    - corresponds to CSI2RX.
+- visconti-viif:isp: Image Signal Processor operation.
+    - corresponds to L1ISP and L2ISP.
+
+visconti_csi2rx - CSI2 Receiver Subdevice Node
+----------------------------------------------
+
+This subdevice node corresponds to a MIPI CSI2 receiver. It resides between
+an image sensor subdevice and the ISP subdevice. It controls CSI2 link
+configuration and training process.
+
+visconti-viif:isp - ISP Subdevice Node
+--------------------------------------
+
+This subdevice node corresponds to L1/L2 ISPs. It receives pictures from a
+sensor (via CSI2RX), applies multiple operations on pictures, then passes
+resulting images to capture nodes.
+
+ISP configurations/parameters are passed from userland via viif_params node.
+The statistics computed by the ISP are passed to userland via viif_stats node.
+
+L1 ISP provides following operations:
+
+- Input: accepts 8, 10, 12, 14bit bayer format
+    - Operation selector; see :c:type:`viif_l1_input_mode_config`
+        - HDR image / PWL (Piecewise Linear Compression) image
+        - with preprocessing / without preprocessing
+    - HDRE: HDR expansion (only for PWL image);
+      see :c:type:`viif_l1_hdre_config`
+- Preprocessing: generate intermediate data (24bit RAW)
+    - SLIC: Bit slicing
+        - see :c:type:`viif_l1_img_extraction_config`
+        - From a 24-bit input image, up to three 12-bit images with different
+          sensitivities (high, middle, low) are generated. Each preprocessing
+          operation is performed on the generated images. In preprocess,
+          parameters with the modifiers h, m, and l are used respectively.
+        - This driver does not skip SLIC operation. As a result, it does not
+          support DOL-HDR, in which multiple 12-bit images are directly
+          acquired from the sensor for preprocessing.
+    - ABPC/DPC: Blemish/Defect pixel correction :c:type:`viif_l1_dpc_config`
+    - PWHB: Preset white balance;
+      see :c:type:`viif_l1_preset_white_balance_config`
+    - RCNR: RAW color noise reduction;
+      see :c:type:`viif_l1_raw_color_noise_reduction_config`
+    - HDRS: HDR synthesis
+        - see :c:type:`viif_l1_hdrs_config`
+        - A 24-bit image is generated from the preprocessed 12-bit images.
+- Processing on RAW image: Main Process (MPRO)
+    - BLVC: black level correction and normalization;
+      see :c:type:`viif_l1_black_level_correction_config`
+    - LSSC: Lens shading correction; see :c:type:`viif_l1_lsc_config`
+    - MPRO: digital amplifier; see :c:type:`viif_l1_main_process_config`
+    - MPRO: bayer demosaicing; see :c:type:`viif_l1_main_process_config`
+    - MPRO: color matrix correction; see :c:type:`viif_l1_main_process_config`
+    - HDRC: HDR compression (global and local tone mapping);
+      see :c:type:`viif_l1_hdrc_config`, :c:type:`viif_l1_hdrc_ltm_config`,
+      :c:type:`viif_l1_rgb_to_y_coef_config`
+- Processing on RGB/YUV image: Video Process (VPRO)
+    - VPRO: gamma correction; see :c:type:`viif_l1_gamma_config`
+    - VPRO: RGB2YUV;
+      see :c:type:`viif_l1_rgb_to_y_coef_config`,
+      :c:type:`viif_l1_img_quality_adjustment_config`
+    - VPRO: image quality adjustment;
+      see :c:type:`viif_l1_img_quality_adjustment_config`
+- Output: 16bit YUV
+- Feedback loop
+    - AWHB: auto white balance
+        - see :c:type:`viif_l1_awb_config`, :c:type:`viif_isp_capture_status`
+        - The gain for the R and B components is adjusted so that the average U
+          and V components of the image become zero. This process is handled by
+          hardware and does not require feedback from external software.
+    - AEXP: auto exposure (average luminance calculation);
+      see :c:type:`viif_l1_avg_lum_generation_config`,
+      :c:type:`viif_l1_rgb_to_y_coef_config`, :c:type:`viif_isp_capture_status`
+    - AG: algorithm gain calculation;
+      see :c:type:`viif_l1_ag_mode_config`, :c:type:`viif_l1_ag_config`
+
+Below is the block diagram::
+
+  L1ISP::INPUT
+
+  +--------+                +-----+                      +-----+
+  | Input  |--------------->|     |--------------------->|     |
+  | 24bHDR |                |     |                      |     |
+  +--------+                | 24b |                      | 24b |
+                            | RAW |                      | RAW |
+  +--------+    +------+    | (0) |                      | (1) |
+  | Input  |--->| HDRE |--->|     |    +------------+    |     |
+  | 14bPWL |    |      |    |     |--->| preprocess |--->|     |
+  +--------+    +------+    +-----+    +------------+    +-----+
+
+  L1ISP::INPUT::preprocess
+
+  +-----+                +-----+
+  | 24b |    +------+    | 12b |
+  | RAW |--->| SLIC |--->| RAW |---+
+  | (0) |    +------+    |  x3 |   |
+  +-----+                +-----+   |
+                                   |
+     +-----------------------------+
+     |
+     |                                        +-----+                +-----+
+     |    +------+    +------+    +------+    | 12b |    +------+    | 24b |
+     +--->| ABPC |--->| PWHB |--->| RCNR |--->| RAW |--->| HDRS |--->| RAW |
+          +------+    +------+    +------+    |  x3 |    +------+    | (1) |
+                                              +-----+                +-----+
+
+
+  L1ISP::MainProcess(MPRO)
+
+  +-----+
+  | 24b |    +------+    +------+
+  | RAW |--->| BLVC |--->| LSSC |---+
+  | (1) |    +------+    +------+   |
+  +-----+                           |
+                                    |
+     +------------------------------+
+     |
+     |    +-----------+    +-------------+    +--------+                +-----+
+     +--->|   MPRO    |    |    MPRO     |    |  MPRO  |    +------+    | 16b |
+          |  Digital  |--->| Demosaicing |----| Color  |--->| HDRC |--->| RGB |
+     +--->| Amplifier |    |             |    | Matrix |    +------+    |     |
+     |    +-----------+    +-------------+    +--------+                +-----+
+     |                         |    |
+     |    +--------------+     |    |    +------+
+     +----| Auto         |<----+    +--->| AEXP |---> Auto-Exposure statistics
+          | Whitebalance |               +------+
+          +--------------+
+                 |
+                 +------------------------------> Auto-Whitebalance statistics
+
+  L1ISP::VideoProcess(VPRO)
+
+  +-----+    +------------+    +------------+    +---------------+    +--------+
+  | 16b |--->| Gamma      |--->| RGB2YUV    |--->| Image Quality |--->| Output |
+  | RGB |    | Correction |    | Conversion |    | Adjustment    |    |  16b   |
+  |     |    +------------+    +------------+    +---------------+    |  YUV   |
+  +-----+                                                             +--------+
+
+  L1ISP::AlgorithmGain
+
+  statistics                     +----------------+    +------------------+
+  information ---> (user SW) --->| Algorithm Gain |--->| ABPC, RCNR, LSSC |
+                                 +----------------+    |       MPRO, VPRO |
+                                                       +------------------+
+
+L2 ISP provides following operations:
+
+- Input: accepts 16bit YUV / RGB
+- Operations:
+    - Lens undistortion; see :c:type:`viif_l2_undist_config`
+    - Scaling; see :c:type:`viif_l2_roi_config`
+    - Cropping; see :c:type:`viif_l2_roi_config`, :c:type:`viif_l2_crop_config`
+    - Gamma correction; see :c:type:`viif_l2_gamma_config`
+    - YUV2RGB
+- Output: RGB, YUV422, YUV444
+
+Below is the block diagram::
+
+  L2ISP
+
+  +-------+    +------------+    +--------------+
+  | Input |--->| YUV2RGB    |--->| Lens         |---+
+  | Image |    | Conversion |    | Undistortion |   |
+  +-------+    +------------+    +--------------+   |
+                                                    |
+  +-------------------------------------------------+
+  |
+  |    +---------+    +------------+    +------------+    +--------+    +--------+
+  +--->| Scaling |--->| Gamma      |--->| Colorspace |--->| Data   |--->| Output |
+  |    |         |    | Correction |    | Conversion |    | Packer |    | Image  |
+  |    +---------+    +------------+    +------------+    +--------+    +--------+
+  |
+  |    +---------+    +------------+    +------------+    +--------+    +--------+
+  +--->| Scaling |--->| Gamma      |--->| Colorspace |--->| Data   |--->| Output |
+       |         |    | Correction |    | Conversion |    | Packer |    | Image  |
+       +---------+    +------------+    +------------+    +--------+    +--------+
+
+viif_capture_post0, viif_capture_post1 - Processed Image Capture Video Node
+---------------------------------------------------------------------------
+
+These video nodes are used for capturing images processed at ISPs. Supported
+capture formats are as follows:
+
+- V4L2_PIX_FMT_ABGR32
+- V4L2_PIX_FMT_RGB24
+- V4L2_PIX_FMT_UYVY
+- V4L2_PIX_FMT_Y16
+- V4L2_PIX_FMT_YUV422M
+- V4L2_PIX_FMT_YUV444M
+
+Bayer format is not supported. Use viif_capture_sub instead.
+
+POST0 and POST1 can output images from the same input image using different
+cropping and scaling settings.
+
+viif_capture_sub - Raw Image Capture Video Node
+-----------------------------------------------
+
+This video node is used for capturing bayer image from the sensor. The output
+picture has exactly the same resolution and format as the sensor input. The
+pipeline does not edit pixel values. However, when writing pixel values to
+memory, they are shifted to the MSB to match either 8bit or 16bit.
+
+Therefore, resulting capture formats are as follows:
+
+- for 8bit RAW input:
+    - V4L2_PIX_FMT_SRGGB8
+    - V4L2_PIX_FMT_SGRBG8
+    - V4L2_PIX_FMT_SGBRG8
+    - V4L2_PIX_FMT_SBGGR8
+- for 10, 12, 14bit RAW input:
+    - V4L2_PIX_FMT_SRGGB16
+    - V4L2_PIX_FMT_SGRBG16
+    - V4L2_PIX_FMT_SGBRG16
+    - V4L2_PIX_FMT_SBGGR16
+
+.. _viif_params:
+
+viif_params - ISP Parameters Video Node
+---------------------------------------
+
+The viif_params video node receives a set of ISP parameters from userspace to be
+applied to the hardware during a video stream.
+
+The buffer format is defined by struct :c:type:`visconti_viif_isp_config`, and
+userspace should set
+:ref:`V4L2_META_FMT_VISCONTI_VIIF_PARAMS <v4l2-meta-fmt-visconti-viif-params>`
+as the data format.
+
+.. _viif_stats:
+
+viif_stats - Statistics Video Node
+----------------------------------
+
+The viif_stats video node provides statistics computed by the ISP.
+
+Following information is included:
+
+* statistics of auto white balance
+* average luminance information which can be used by auto exposure software
+  implementation.
+
+The buffer format is defined by struct :c:type:`visconti_viif_isp_stat`, and
+userspace should set
+:ref:`V4L2_META_FMT_VISCONTI_VIIF_STATS <v4l2-meta-fmt-visconti-viif-stats>`
+as the data format.
+
+Feedback Operations
+===================
+
+Among the so-called 3A functions, VIIF provides only auto-whitebalance and
+auto-exposure. Auto-whitebalance is a standalone hardware feature. Some status
+information is available through the ISP statistics interface.
+
+Auto-exposure is realized through a combination of hardware and userland
+software. VIIF provides weighted average luminance information through the ISP
+statistics interface. The userland application calculates the sensor gain,
+sensor exposure and ISP digital gain. The calculated parameters are then passed
+to sensor's controls and the ISP parameter interface.
+
+AG (algorithm gain) is a mechanism that synchronously adjusts the processing
+strength across multiple functional blocks. For specific usage details please
+refer to :c:type:`viif_l1_ag_mode_config`. The following is the list of
+functions affected by AG parameters.
+
+- ABPC/DPC
+- RCNR
+- LSSC
+- MPRO: color matrix correction
+- VPRO
+
+Scaling and cropping
+====================
+
+The L2 ISP provides an image transformation operation that integrates
+undistortion and scaling. Therefore, scaling and cropping cannot be represented
+using the COMPOSE and CROP rectangles commonly used in V4L2.
+
+This driver represents scaling and cropping using the following method.
+
+- Scaling is configured using :c:type:`viif_l2_roi_config`.
+    - The scaling ratio can be specified within the range of 0.5 to 2.0.
+    - The aspect ratio cannot be changed.
+    - In :c:type:`viif_l2_roi_config`, it is necessary to properly specify the
+      boundaries used in coordinate calculations for scaling and undistortion.
+    - The final image size is specified by corrected_hsize and corrected_vsize.
+- Cropping is configured using following information.
+    - The source image size for cropping is corrected_hsize and corrected_vsize.
+    - The top-left coordinate is set using :c:type:`viif_l2_crop_config`.
+    - The cropped size is specified by the format size of the corresponding ISP
+      source pad.
+
+Capturing Video Frames Example
+==============================
+
+In the following example, imx219 camera is connected to pad 0 of
+'visconti_csi2rx' subdevice.
+
+The following commands yield three pictures:
+
+- main path 0: 1920x1080, RGB picture
+- main path 1: 640x480, UYVY picture, cropping (0, 0, 640, 480)
+- sub path: 1920x1080 RAW picture
+
+.. code-block:: bash
+
+	# set the links
+	media-ctl -d platform:1c000000.viif -r
+	media-ctl -d platform:1c000000.viif -l '"imx219 1-0010":0 -> "visconti_csi2rx 1c008000.csi2rx":0 [1]'
+	media-ctl -d platform:1c000000.viif -l '"visconti_csi2rx 1c008000.csi2rx":1 -> "visconti-viif:isp":0 [1]'
+	media-ctl -d platform:1c000000.viif -l '"visconti-viif:isp":1 -> "viif_capture_post0":0 [1]'
+	media-ctl -d platform:1c000000.viif -l '"visconti-viif:isp":2 -> "viif_capture_post1":0 [1]'
+	media-ctl -d platform:1c000000.viif -l '"visconti-viif:isp":3 -> "viif_capture_sub":0 [1]'
+	media-ctl -d platform:1c000000.viif -l '"viif_params":0 -> "visconti-viif:isp":4 [1]'
+	media-ctl -d platform:1c000000.viif -l '"visconti-viif:isp":5 -> "viif_stats":0 [1]'
+
+	# set format for imx219
+	media-ctl -d platform:1c000000.viif --set-v4l2 '"imx219 1-0010":0 [fmt:SRGGB10_1X10/1920x1080]'
+
+	# set format for csi2rx
+	media-ctl -d platform:1c000000.viif --set-v4l2 '"visconti_csi2rx 1c008000.csi2rx":0 [fmt:SRGGB10_1X10/1920x1080  field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]'
+
+	# set format for isp
+	media-ctl -d platform:1c000000.viif --set-v4l2 '"visconti-viif:isp":0 [fmt:SRGGB10_1X10/1920x1080]'
+	media-ctl -d platform:1c000000.viif --set-v4l2 '"visconti-viif:isp":1 [fmt:fmt:YUV8_1X24/1920x1080]'
+	media-ctl -d platform:1c000000.viif --set-v4l2 '"visconti-viif:isp":2 [fmt:fmt:YUV8_1X24/640x480]'
+
+	# set format for main path0
+	v4l2-ctl -z platform:1c000000.viif -d viif_capture_post0 -v "width=1920,height=1080"
+	v4l2-ctl -z platform:1c000000.viif -d viif_capture_post0 -v "pixelformat=RGB3"
+
+	# set format for main path1
+	v4l2-ctl -z platform:1c000000.viif -d viif_capture_post1 -v "width=640,height=480"
+	v4l2-ctl -z platform:1c000000.viif -d viif_capture_post1 -v "pixelformat=UYVY"
+
+	# start streaming
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 --stream-mmap --stream-count 1000 &
+
+	# start streaming with other devices while viif_capture_post0 is running
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post1 --stream-mmap --stream-count 10
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_sub --stream-mmap --stream-count 10
+
+Debug filesystem
+================
+
+Some status information of CSI2 receiver and VIIF can be obtained via debugfs.
+The driver exposes following files.
+
+- /sys/kernel/debug/<device-name-for-csi2rx>/calibration_status
+    - This file contains some key-value pairs representing status of
+      calibration.
+    - Value can be either of DONE(=0), ERROR(=-11) or DONE(=-5).
+    - Keys are:
+        - term_cal_with_rext: Result of termination calibration with rext
+        - clock_lane_offset_cal: Result of offset calibration of clock lane
+        - data_lane0_offset_cal: Result of offset calibration of data lane0
+        - data_lane1_offset_cal: Result of offset calibration of data lane1
+        - data_lane2_offset_cal: Result of offset calibration of data lane2
+        - data_lane3_offset_cal: Result of offset calibration of data lane3
+        - data_lane0_ddl_tuning_cal:
+          Result of digital delay line tuning calibration of data lane0
+        - data_lane1_ddl_tuning_cal:
+          Result of digital delay line tuning calibration of data lane1
+        - data_lane2_ddl_tuning_cal:
+          Result of digital delay line tuning calibration of data lane2
+        - data_lane3_ddl_tuning_cal:
+          Result of digital delay line tuning calibration of data lane3
+- /sys/kernel/debug/<device-name-for-csi2rx>/err_status
+    - This file contains some key-value pairs representing CSI2 receiver
+      errors.
+    - Each bit of values indicates a specific error status
+    - Keys are:
+        - err_phy_fatal: D-PHY FATAL error.
+            - bit 0-3: Start of transmission error on DATA lane 0-3
+        - err_pkt_fatal: Packet FATAL error.
+            - bit 16: Header ECC contains 2 errors, unrecoverable.
+            - bit 0-3: Checksum error detected on virtual channel 0-3
+        - err_frame_fatal: Frame FATAL error.
+            - bit 16-19:
+              Last received Frame, in virtual channel 0-3, has at least one CRC
+              error.
+            - bit 8-11:
+              Incorrect Frame Sequence detected in virtual channel 0-3.
+            - bit 0-3:
+              Error matching Frame Start with Frame End for virtual channel 0-3.
+        - err_phy: D-PHY error.
+            - bit 16-19: Escape Entry Error on Data Lane 0-3.
+            - bit 0-3:
+              Start of Transmission Error on Data Lane 3 (synchronization can
+              still be achieved).
+        - err_pkt: Packet error.
+            - bit 16-19:
+              Header Error detected and corrected on virtual channel 0-3.
+            - bit 0-3:
+              Unrecognized or unimplemented data type detected in virtual
+              channel 0-3.
+        - err_line: Line error.
+            - bit 16-23: Error in the sequence of lines for vc0-7 and dt0-7.
+            - bit 0-7:
+              Error matching Line Start with Line End for vc0-7 and dt0-7.
+- /sys/kernel/debug/<device-name-for-viif>/reported_err_main
+    - This file contains integer value representing errors occurred in
+      viif_capture_post0 and viif_capture_post1.
+    - Each bit of the value indicates a specific error status
+        - bit 24: VSync generator error
+        - bit 20: L1ISP input size inconsistency
+        - bit 19: L1ISP output size inconsistency
+        - bit 18: L1ISP ABPC table transfer error
+        - bit 17: L1ISP LSSC table transfer error
+        - bit 11: L2ISP grid table transfer error
+        - bit  9: L2ISP POST1 table transfer error
+        - bit  8: L2ISP POST0 table transfer error
+        - bit  0: L2ISP size error
+- /sys/kernel/debug/<device-name-for-viif>/reported_err_sub
+    - This file contains integer value representing errors occurred in
+      viif_capture_sub.
+    - Each bit of the value indicates a specific error status
+        - bit 24: Vsync generator error
+        - bit  0: data transfer error
+
+Use of coherent memory
+======================
+
+Visconti5 SoC has two independent DDR SDRAM controllers. Each controller is
+mapped to 36bit address space.
+
+Accelerator bus masters have two paths to access memory; one is directly
+connected to SDRAM controller, the another is connected via a cache coherency
+bus which keeps coherency among CPUs.
+
+From accelerators and CPUs, the address map is following:
+
+* 0x0_8000_0000 DDR0 direct access
+* 0x4_8000_0000 DDR0 coherency bus
+* 0x8_8000_0000 DDR1 direct access
+* 0xC_8000_0000 DDR1 coherency bus
+
+The base address can be specified with "memory" and "reserved-memory" elements
+in a device tree description. It's not recommended to mix direct address and
+coherent address.
+
+The Visconti5 VIIF driver always use only direct address to configure Video
+DMACs of the hardware. This design is to avoid great performance loss at
+coherency bus caused by massive memory access. You should not put the
+dma_coherent attribute to viif element in device tree. Cache operations are
+done automatically by videobuf2 driver.
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0de80328c36b..b4ff1a7f403d 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-rkisp1
     metafmt-uvc
     metafmt-uvc-msxu-1-5
+    metafmt-visconti-viif
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
diff --git a/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst b/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
new file mode 100644
index 000000000000..dc4b31627fe1
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-visconti-viif-params:
+
+.. _v4l2-meta-fmt-visconti-viif-stats:
+
+***************************************************************************************
+V4L2_META_FMT_VISCONTI_VIIF_PARAMS ('vifp'), V4L2_META_FMT_VISCONTI_VIIF_STATS ('vifs')
+***************************************************************************************
+
+Configuration parameters
+========================
+
+The configuration parameters are passed to the
+:ref:`viif_params <viif_params>` metadata output video node, using
+the :c:type:`v4l2_meta_format` interface. The buffer contains
+a single instance of the C structure :c:type:`visconti_viif_isp_config` defined in
+``visconti_viif.h``. So the structure can be obtained from the buffer by:
+
+.. code-block:: c
+
+	struct visconti_viif_isp_config *params = (struct visconti_viif_isp_config*) buffer;
+
+VIIF statistics
+===============
+
+The VIIF device collects different statistics over an input Bayer frame.
+Those statistics are obtained from the :ref:`viif_stats <viif_stats>`
+metadata capture video node,
+using the :c:type:`v4l2_meta_format` interface. The buffer contains a single
+instance of the C structure :c:type:`visconti_viif_isp_stat` defined in
+``visconti_viif.h``. So the structure can be obtained from the buffer by:
+
+.. code-block:: c
+
+	struct visconti_viif_isp_stat *stats = (struct visconti_viif_isp_stat*) buffer;
+
+The statistics collected are Exposure, AWB (auto white balance) and errors.
+See :c:type:`visconti_viif_isp_stat` for details of the statistics.
+
+The statistics and configuration parameters described here are usually
+consumed and produced by dedicated user space libraries that comprise the
+tuning tools using software control loop.
+
+visconti viif uAPI data types
+=============================
+
+.. kernel-doc:: include/uapi/linux/visconti_viif.h
diff --git a/MAINTAINERS b/MAINTAINERS
index cdd04f9a4459..f2475f07059f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25984,8 +25984,10 @@ M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
 M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/admin-guide/media/visconti-viif.*
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
 F:	drivers/media/platform/toshiba/visconti/
 F:	include/uapi/linux/visconti_viif.h
 

-- 
2.34.1



