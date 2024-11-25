Return-Path: <linux-media+bounces-21961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA39D8427
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 288DFB3386C
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139541922FD;
	Mon, 25 Nov 2024 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="FZrnAKQR"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4271922E7;
	Mon, 25 Nov 2024 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529583; cv=none; b=W/SKql3ow7Xln+wPGbjGrn5rhC8Ap2VFA9so8i+hc0oWwfp5S4afON3q8h37+PyjeIoq1mbMpNHNLjovKZ7EN8qnU5ZbV+oXAhrcylwuCzUCHLM7lgNxVmpLtTtO1tUome9D0zfmmFyEaTLm+DKoQncOFeRPknxJu8WRg/cLfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529583; c=relaxed/simple;
	bh=0Xke7bTPCy40jKbvH7RSfNmEJGkIw8BJ4hX6s5JfObU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kcJGxB0RQMmn1mKxsXsFszMMKODBwMjD+lTpIO/MNVUwwSHUEHJQsJE/bO5fwDVHkSiFNldbLhQ2Hk7cSq9JDCNnsXf59mb9vgKaqaqLdWSiJd2X8dQLHvzh0X5tc6IJ+Pr1/l/2L798JC/FClI1DpJeNmYnnwdsKeW1DtBMx8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=FZrnAKQR; arc=none smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 4AP9RkLL2159793; Mon, 25 Nov 2024 18:27:46 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526841;x=1733736441;bh=0Xke7bTPCy40jKbvH7RSfNmEJGkIw8BJ4hX6s5JfObU=;b=FZr
	nAKQRfNyA2lnxtzVgyW57HJemilhdJj1NCITH8lU1KGZxa/8ZkjbZlfzEHN06XsjN4ZHYh8A7d91N
	HW6tvDhInWFnDI1h27Lci1qGbgWhdes4cPVjjOWeYFnP6zsLiS6q3yx3aoCgWbsNeFVmOhmPId1QP
	tTQSHA1m9o8aUW8FDrj2SRQqSYcdIOSeYieCcpmUGa0817CDWS+8Xoxe1HGLm+02vObetSnxfvWWd
	LcliGFnrT/g4FZo4BX876E6UjZfR4JpCOZTRNai5e0KPzdLEjlgnDomjS1/ufPqjgDawcoQdRt3iJ
	Z+G6KGODZX0+tspEnkFBn9sUiUR2diQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4AP9RJIg024187; Mon, 25 Nov 2024 18:27:19 +0900
X-Iguazu-Qid: 2yAafc7cGiz43BXZue
X-Iguazu-QSIG: v=2; s=0; t=1732526838; q=2yAafc7cGiz43BXZue; m=+ThVAuMIKLy377WOKXKvorPZceR13tnluF7yD+ElZ7s=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1803) id 4AP9RHSQ3470709
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:17 +0900
X-SA-MID: 35004183
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 7/8] documentation: media: add documentation for Toshiba Visconti Video Input Interface driver
Date: Mon, 25 Nov 2024 18:21:45 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-8-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added description of Video Input Interface driver of
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

 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../admin-guide/media/visconti-viif.dot       |  22 +
 .../admin-guide/media/visconti-viif.rst       | 435 ++++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-visconti-viif.rst       |  48 ++
 5 files changed, 507 insertions(+)
 create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
 create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst

diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index b6af448b9fe9..81054512e768 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -32,5 +32,6 @@ Video4Linux (V4L) driver-specific documentation
 	si476x
 	starfive_camss
 	vimc
+	visconti-viif
 	visl
 	vivid
diff --git a/Documentation/admin-guide/media/visconti-viif.dot b/Documentation/admin-guide/media/visconti-viif.dot
new file mode 100644
index 000000000000..cc75c73336fb
--- /dev/null
+++ b/Documentation/admin-guide/media/visconti-viif.dot
@@ -0,0 +1,22 @@
+digraph board {
+        rankdir=TB
+        n00000001 [label="{{<port0> 0 | <port4> 4} | visconti-viif:isp\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2 | <port3> 3 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000001:port1 -> n00000008:port0
+        n00000001:port2 -> n0000000b:port0
+        n00000001:port3 -> n00000016
+        n00000001:port5 -> n0000001e
+        n00000008 [label="{{<port0> 0} | visconti-viif:resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000008:port1 -> n0000000e
+        n0000000b [label="{{<port0> 0} | visconti-viif:resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000b:port1 -> n00000012
+        n0000000e [label="viif_capture_post0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n00000012 [label="viif_capture_post1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000016 [label="viif_capture_sub\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n0000001a [label="viif_params\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n0000001a -> n00000001:port4
+        n0000001e [label="viif_stats\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+        n00000030 [label="{{<port0> 0} | visconti_csi2rx 1c008000.csi2rx\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000030:port1 -> n00000001:port0
+        n00000035 [label="{{} | imx219 1-0010\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000035:port0 -> n00000030:port0
+}
diff --git a/Documentation/admin-guide/media/visconti-viif.rst b/Documentation/admin-guide/media/visconti-viif.rst
new file mode 100644
index 000000000000..c2e85fb6f8c1
--- /dev/null
+++ b/Documentation/admin-guide/media/visconti-viif.rst
@@ -0,0 +1,435 @@
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
+part of Toshiba Visconti SoCs.
+The driver is located under drivers/media/platform/toshiba/visconti and uses
+the Media-Controller API.
+
+The driver module is named visconti-viif,
+and is enabled through the CONFIG_VIDEO_VISCONTI_VIIF config option.
+The CSI-2 receiver part is controlled by another module named visconti-csi2rx,
+which is enabled through the CONFIG_VIDEO_VISCONTI_CSI2RX config option.
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
+- visconti-viif:resizer: Scaling operation of Image Signal Processor.
+    - corresponds to L2ISP.
+
+visconti_csi2rx - CSI2 Receiver Subdevice Node
+---------------------------------------------------
+
+This subdevice node corresponds to a MIPI CSI2 receiver.
+It resides between an image sensor subdevice and the ISP subdevice.
+It controls CSI2 link configuration and training process.
+
+visconti-viif:isp - ISP Subdevice Node
+--------------------------------------
+
+This subdevice node corresponds to L1/L2 ISPs.
+It receives pictures from an sensor (via CSI2RX),
+applies multiple operations on pictures, then passes resulting images to capture nodes.
+
+ISP configurations/parameters are passed from userland via viif_params node.
+The status of ISP operations are passed to userland via viif_stats node.
+
+L1 ISP provides following operations:
+
+- Input: accepts 8, 10, 12, 14bit bayer format
+    - Operation selector; :c:type:`viif_l1_input_mode_config`
+        - HDR image / PWL (Piecewse Linear Compression) image
+        - with preprocessing / without preprocessing
+    - HDRE: HDR expansion (only for PWL image);
+      see :c:type:`viif_l1_hdre_config`
+- Preprocessing: generate intermediate data (24bit RAW)
+    - SLIC: Bit slicing (x3 12bit planes for preprocessing);
+      see :c:type:`viif_l1_img_extraction_config`
+    - ABPC/DPC: Blemish/Defect pixel correction :c:type:`viif_l1_dpc_config`
+    - PWHB: Preset white balance; see :c:type:`viif_l1_preset_white_balance_config`
+    - RCNR: RAW color noise reduction; see :c:type:`viif_l1_raw_color_noise_reduction_config`
+    - HDRS: HDR synthesis; see :c:type:`viif_l1_hdrs_config`
+- Processing on RAW image: Main Process (MPRO)
+    - BLVC: black level correction and normalization;
+      see :c:type:`viif_l1_black_level_correction_config`
+    - LSSC: Lens shading correction; see :c:type:`viif_l1_lsc_config`
+    - MPRO: digital amplifier; see :c:type:`viif_l1_main_process_config`
+    - MPRO: bayer demosaicing; see :c:type:`viif_l1_main_process_config`
+    - MPRO: color matrix correction; see :c:type:`viif_l1_main_process_config`
+    - HDRC: HDR compression;
+      see :c:type:`viif_l1_hdrc_config`, :c:type:`viif_l1_hdrc_ltm_config`,
+      :c:type:`viif_l1_rgb_to_y_coef_config`
+- Processing on RGB/YUV image: Video Process (VPRO)
+    - VPRO: gamma correction; see :c:type:`viif_l1_gamma_config`
+    - VPRO: RGB2YUV;
+      see :c:type:`viif_l1_rgb_to_y_coef_config`,
+      :c:type:`viif_l1_img_quality_adjustment_config`
+    - VPRO: image quality adjustment; see :c:type:`viif_l1_img_quality_adjustment_config`
+- Output: 16bit YUV
+- Feedback loop
+    - AWHB: auto white balance; see :c:type:`viif_l1_awb_config`,
+      :c:type:`viif_isp_capture_status`
+    - AEXP: auto exposure (average luminance calculation);
+      see :c:type:`viif_l1_avg_lum_generation_config`,
+      :c:type:`viif_l1_rgb_to_y_coef_config`, :c:type:`viif_isp_capture_status`
+    - AG: analog gain calculation;
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
+  | 24bPWL |    |      |    |     |--->| preprocess |--->|     |
+  +--------+    +------+    +-----+    +------------+    +-----+
+
+  L1ISP::INPUT::preprocess
+
+  +-----+                                                                +-----+
+  | 24b |    +------+    +------+    +------+    +------+    +------+    | 24b |
+  | RAW |--->| SLIC |--->| ABPC |--->| PWHB |--->| RCNR |--->| HDRS |--->| RAW |
+  | (0) |    +------+    +------+    +------+    +------+    +------+    | (1) |
+  +-----+                                                                +-----+
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
+  L1ISP::AnalogGain
+
+  statistics                     +-------------+    +------------------+
+  information ---> (user SW) --->| Analog Gain |--->| ABPC, RCNR, LSSC |
+                                 +-------------+    |       MPRO, VPRO |
+                                                    +------------------+
+
+L2 ISP provides following operations:
+
+- Input: accepts 16bit YUV / RGB
+- Operations:
+    - Lens undistortion; see :c:type:`viif_l2_undist`
+    - Scaling; see :c:type:`viif_l2_roi`
+    - Cropping; see :c:type:`viif_l2_roi`
+    - Gamma correction; see :c:type:`viif_l2_gamma_config`
+    - YUV2RGB
+- Output: RGB, YUV422, YUV444
+
+Below is the block diagram::
+
+  L2ISP
+
+  +-------+    +------------+    +--------------+    +---------+
+  | Input |--->| YUV2RGB    |--->| Lens         |--->| Scaling |---> |
+  | Image |    | Conversion |    | Undistortion |    |         |---> |
+  +-------+    +------------+    +--------------+    +---------+     |
+                                                                     |
+          +----------------------------------------------------------+
+          |
+          |    +----------+    +------------+    +--------+    +--------+
+          +--->|Gamma     |--->| Colorspace |--->| Data   |--->| Output |
+          |    |Correction|    | Conversion |    | Packer |    | Image  |
+          |    +----------+    +------------+    +--------+    +--------+
+          |
+          |    +----------+    +------------+    +--------+    +--------+
+          +--->|Gamma     |--->| Colorspace |--->| Data   |--->| Output |
+               |Correction|    | Conversion |    | Packer |    | Image  |
+               +----------+    +------------+    +--------+    +--------+
+
+visconti-viif:resizer - Resizer Subdevice Node
+----------------------------------------------
+
+The resizer subdevice resides between ISP subdevice and Capture device
+on a capture path for post0 and post1.
+It receives resize and crop parameters for the specific capture path
+and controls L2ISP HW.
+
+following selection rectangles can be passed at VIDIOC_S_SELECTION ioctl.
+
+- sink pads's compose rectangle (V4L2_SEL_TGT_COMPOSE) for scaling
+- source pad's crop rectangle (V4L2_SEL_TGT_CROP) for cropping
+
+
+viif_capture_post0, viif_capture_post1 - Processed Image Capture Video Node
+---------------------------------------------------------------------------
+
+These video nodes are used for capturing images processed at ISPs.
+Supported capture formats are as follows:
+
+- V4L2_PIX_FMT_RGB24
+- V4L2_PIX_FMT_ABGR32
+- V4L2_PIX_FMT_YUV422M
+- V4L2_PIX_FMT_YUV444M
+- V4L2_PIX_FMT_Y16
+
+Bayer format is not supported. Use viif_capture_sub instead.
+
+POST0 and POST1 can output images from the same input image
+using different cropping and scaling settings.
+
+viif_capture_sub - Raw Image Capture Video Node
+-----------------------------------------------
+
+This video node is used for capturing bayer image from the sensor.
+The output picture has exactly the same resolution and format as the sensor input.
+The pipeline does not edit pixel values.
+However, when writing pixel values to memory, they are shifted to the MSB
+to match either 8bit or 16bit.
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
+The viif_params video node receives a set of ISP parameters from userspace
+to be applied to the hardware during a video stream.
+
+The buffer format is defined by struct :c:type:`visconti_viif_isp_config`, and userspace should set
+:ref:`V4L2_META_FMT_VISCONTI_VIIF_PARAMS <v4l2-meta-fmt-visconti-viif-params>` as the data format.
+
+.. _viif_stats:
+
+viif_stats - Statistics Video Node
+----------------------------------
+
+The viif_stats video node provides current status of ISP.
+
+Following information is included:
+
+* statistics of auto white balance
+* average luminance information which can be used by auto exposure software impl.
+
+The buffer format is defined by struct :c:type:`visconti_viif_isp_stat`, and userspace should set
+:ref:`V4L2_META_FMT_VISCONTI_VIIF_STATS <v4l2-meta-fmt-visconti-viif-stats>` as the data format.
+
+Feedback Operations
+===================
+
+Among the so-called 3A functions, VIIF provides only auto-whitebalance and auto-exposure.
+Auto-whitebalance is a standalone hardware feature.
+Some status information is available through the ISP statistics interface.
+
+Auto-exposure is realized through a combination of hardware and userland software.
+VIIF provides weighted average luminance information through the ISP statistics interface.
+The userland application calculates the sensor gain, sensor exposure and ISP digital gain.
+The calculated parameters are then passed to sensor's controls and the ISP parameter interface.
+
+Among ISP parameters, there are parameters called AG (analog gain).
+Actually, AG parameters have nothing to do with auto-exposure.
+It controls "strength" in several signal correction algorithms.
+Below is the list of the functions which may be affected by AG parameters:
+
+- ABPC/DPC
+- RCNR
+- LSSC
+- MPRO: color matrix correction
+- VPRO
+
+Capturing Video Frames Example
+==============================
+
+In the following example,
+imx219 camera is connected to pad 0 of 'visconti_csi2rx' subdevice.
+
+The following commands yield three pictures with different zoom ratio:
+- main path 0: 1.5x zoom, crop 1920x1080, RGB picture
+- main path 1: 0.67x zoom, crop 640x480, RGB picture
+- sub path: 1920x1080 RAW picture
+
+.. code-block:: bash
+
+	# set the links
+	media-ctl -d platform:visconti-viif-0 -r
+	media-ctl -d platform:visconti-viif-0 -l '"imx219 1-0010":0 -> "visconti_csi2rx 1c008000.csi2rx":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti_csi2rx 1c008000.csi2rx":1 -> "visconti-viif:isp":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":1 -> "visconti-viif:resizer0":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":2 -> "visconti-viif:resizer1":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":3 -> "viif_capture_sub":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:resizer0":1 -> "viif_capture_post0":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:resizer1":1 -> "viif_capture_post1":0 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"viif_params":0 -> "visconti-viif:isp":4 [1]'
+	media-ctl -d platform:visconti-viif-0 -l '"visconti-viif:isp":5 -> "viif_stats":0 [1]'
+
+	# set format for imx219
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"imx219 1-0010":0 [fmt:SRGGB10_1X10/1920x1080]'
+
+	# set format for csi2rx
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti_csi2rx 1c008000.csi2rx":0 [fmt:SRGGB10_1X10/1920x1080  field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]'
+
+	# set format for isp sink pad
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:isp":0 [fmt:SRGGB10_1X10/1920x1080]'
+
+	# set format for resizer pads
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer0":0 '"[fmt:YUV8_1X24/1920x1080 compose:(0,0)/2880x1620]"
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer0":1 '"[crop:(480,16)/1920x1080]"
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer1":0 '"[fmt:YUV8_1X24/1920x1080 compose:(0,0)/1280x720]"
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:resizer1":1 '"[crop:(320,32)/640x480]"
+
+	media-ctl -d platform:visconti-viif-0 --set-v4l2 '"visconti-viif:isp":1 [fmt:YUV8_1X24/1024 crop:(640,0)/1024x1024]'
+
+	# set format for main path0
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "width=1920,height=1080"
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "pixelformat=RGB3"
+
+	# set format for main path1
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "width=640,height=480"
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 -v "pixelformat=RGB3"
+
+	# start streaming
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post0 --stream-mmap --stream-count 1000 &
+
+	# start streaming with other devices while viif_capture_post0 is running
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_post1 --stream-mmap --stream-count 10
+	v4l2-ctl -z platform:visconti-viif-0 -d viif_capture_sub --stream-mmap --stream-count 10
+
+Use of coherent memory
+======================
+
+Visconti5 SoC has two independent DDR SDRAM controllers.
+Each controller is mapped to 36bit address space.
+
+Accelerator bus masters have two paths to access memory;
+one is directly connected to SDRAM controller,
+the another is connected via a cache coherency bus
+which keeps coherency among CPUs.
+
+From accelerators and CPUs, the address map is following:
+
+* 0x0_8000_0000 DDR0 direct access
+* 0x4_8000_0000 DDR0 coherency bus
+* 0x8_8000_0000 DDR1 direct access
+* 0xC_8000_0000 DDR1 coherency bus
+
+The base address can be specified with "memory" and "reserved-memory" elements
+in a device tree description.
+It's not recommended to mix direct address and coherent address.
+
+The Visconti5 VIIF driver always use only direct address to configure Video DMACs of the hardware.
+This design is to avoid great performance loss at coherency bus caused by massive memory access.
+You should not put the dma_coherent attribute to viif element in device tree.
+Cache operations are done automatically by videobuf2 driver.
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 86ffb3bc8ade..2336842f0c26 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-pisp-fe
     metafmt-rkisp1
     metafmt-uvc
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
-- 
2.25.1



