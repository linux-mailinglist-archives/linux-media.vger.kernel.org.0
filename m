Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC07845309C
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbhKPLcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:34708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235082AbhKPLcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33B7C6141B;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=4fK/0PlcIbl1Vh9sz7BLJ9GVmi1hHhKo+WyFTtXBSyw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e2EEe46jJCMA9lz24GOOllZZH5qHZ7zh7A84U3jJruGgt2vwiiqKcYrI34amZEqRr
         brjdF9yqFGlKsxOvcsfkmXGdz7hmd15HCBtWnxODa0Jq512PCIBcFKoJ2gL26cA6Ig
         vtatzx71LMyDVeHlhWhwJPRQh3XhbXi4S7wreoiptRbDs21XMoXMNp7jYUZNE28HAj
         N0T+5bvLtoimmwT5CFi1xCOodGLbgOxbF8fB5WuT8t4APmKn5e/J9TeDd16bb12Xu4
         AflueNLjIOZguxx9Fkg774yvl0tZMHthG1+TCSmrUnZy6PE6/7VfUcksys3LA/XoUz
         OqECOxZNQ1ODQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfF-By; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 03/23] media: atomisp: shift some structs from input_system_local
Date:   Tue, 16 Nov 2021 11:28:44 +0000
Message-Id: <7b895ec99ad983d407db12303db4bf90732c3db2.1637061474.git.mchehab+huawei@kernel.org>
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

There are several stucts under ISP2400 that could be moved
to the global file without causing any build issues.

Move those to the common header, in order to reduce the number
of things that are #ifdef dependent.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/input_system_local.h    | 134 ++++++++++++++++++
 .../atomisp/pci/isp2400_input_system_local.h  | 126 ----------------
 .../atomisp/pci/isp2401_input_system_local.h  |  26 ----
 3 files changed, 134 insertions(+), 152 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/input_system_local.h b/drivers/staging/media/atomisp/pci/input_system_local.h
index b33aa2838290..357987d629cd 100644
--- a/drivers/staging/media/atomisp/pci/input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/input_system_local.h
@@ -4,6 +4,140 @@
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
 
+#include "type_support.h"
+#include "input_system_global.h"
+
+typedef enum {
+	INPUT_SYSTEM_PORT_A = 0,
+	INPUT_SYSTEM_PORT_B,
+	INPUT_SYSTEM_PORT_C,
+	N_INPUT_SYSTEM_PORTS
+} input_system_csi_port_t;
+
+typedef struct ctrl_unit_cfg_s			ctrl_unit_cfg_t;
+typedef struct input_system_network_cfg_s	input_system_network_cfg_t;
+typedef struct target_cfg2400_s		target_cfg2400_t;
+typedef struct channel_cfg_s			channel_cfg_t;
+typedef struct backend_channel_cfg_s		backend_channel_cfg_t;
+typedef struct input_system_cfg2400_s		input_system_cfg2400_t;
+typedef struct mipi_port_state_s		mipi_port_state_t;
+typedef struct rx_channel_state_s		rx_channel_state_t;
+typedef struct input_switch_cfg_channel_s	input_switch_cfg_channel_t;
+typedef struct input_switch_cfg_s		input_switch_cfg_t;
+
+struct ctrl_unit_cfg_s {
+	isp2400_ib_buffer_t		buffer_mipi[N_CAPTURE_UNIT_ID];
+	isp2400_ib_buffer_t		buffer_acquire[N_ACQUISITION_UNIT_ID];
+};
+
+struct input_system_network_cfg_s {
+	input_system_connection_t	multicast_cfg[N_CAPTURE_UNIT_ID];
+	input_system_multiplex_t	mux_cfg;
+	ctrl_unit_cfg_t				ctrl_unit_cfg[N_CTRL_UNIT_ID];
+};
+
+typedef struct {
+// TBD.
+	u32	dummy_parameter;
+} target_isp_cfg_t;
+
+typedef struct {
+// TBD.
+	u32	dummy_parameter;
+} target_sp_cfg_t;
+
+typedef struct {
+// TBD.
+	u32	dummy_parameter;
+} target_strm2mem_cfg_t;
+
+struct input_switch_cfg_channel_s {
+	u32 hsync_data_reg[2];
+	u32 vsync_data_reg;
+};
+
+struct backend_channel_cfg_s {
+	u32	fmt_control_word_1; // Format config.
+	u32	fmt_control_word_2;
+	u32	no_side_band;
+};
+
+typedef union  {
+	csi_cfg_t	csi_cfg;
+	tpg_cfg_t	tpg_cfg;
+	prbs_cfg_t	prbs_cfg;
+	gpfifo_cfg_t	gpfifo_cfg;
+} source_cfg_t;
+
+struct input_switch_cfg_s {
+	u32 hsync_data_reg[N_RX_CHANNEL_ID * 2];
+	u32 vsync_data_reg;
+};
+
+/*
+ * In 2300 ports can be configured independently and stream
+ * formats need to be specified. In 2400, there are only 8
+ * supported configurations but the HW is fused to support
+ * only a single one.
+ *
+ * In 2300 the compressed format types are programmed by the
+ * user. In 2400 all stream formats are encoded on the stream.
+ *
+ * Use the enum to check validity of a user configuration
+ */
+typedef enum {
+	MONO_4L_1L_0L = 0,
+	MONO_3L_1L_0L,
+	MONO_2L_1L_0L,
+	MONO_1L_1L_0L,
+	STEREO_2L_1L_2L,
+	STEREO_3L_1L_1L,
+	STEREO_2L_1L_1L,
+	STEREO_1L_1L_1L,
+	N_RX_MODE
+} rx_mode_t;
+
+#define UNCOMPRESSED_BITS_PER_PIXEL_10	10
+#define UNCOMPRESSED_BITS_PER_PIXEL_12	12
+#define COMPRESSED_BITS_PER_PIXEL_6	6
+#define COMPRESSED_BITS_PER_PIXEL_7	7
+#define COMPRESSED_BITS_PER_PIXEL_8	8
+enum mipi_compressor {
+	MIPI_COMPRESSOR_NONE = 0,
+	MIPI_COMPRESSOR_10_6_10,
+	MIPI_COMPRESSOR_10_7_10,
+	MIPI_COMPRESSOR_10_8_10,
+	MIPI_COMPRESSOR_12_6_12,
+	MIPI_COMPRESSOR_12_7_12,
+	MIPI_COMPRESSOR_12_8_12,
+	N_MIPI_COMPRESSOR_METHODS
+};
+
+typedef enum mipi_compressor mipi_compressor_t;
+
+typedef enum {
+	MIPI_PREDICTOR_NONE = 0,
+	MIPI_PREDICTOR_TYPE1,
+	MIPI_PREDICTOR_TYPE2,
+	N_MIPI_PREDICTOR_TYPES
+} mipi_predictor_t;
+
+typedef struct rx_cfg_s		rx_cfg_t;
+
+/*
+ * Applied per port
+ */
+struct rx_cfg_s {
+	rx_mode_t			mode;	/* The HW config */
+	enum mipi_port_id		port;	/* The port ID to apply the control on */
+	unsigned int		timeout;
+	unsigned int		initcount;
+	unsigned int		synccount;
+	unsigned int		rxcount;
+	mipi_predictor_t	comp;	/* Just for backward compatibility */
+	bool                is_two_ppc;
+};
+
 #ifdef ISP2401
 #  include "isp2401_input_system_local.h"
 #else
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 2614b89b8e34..6880c9b6aa65 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -16,10 +16,6 @@
 #ifndef __INPUT_SYSTEM_LOCAL_H_INCLUDED__
 #define __INPUT_SYSTEM_LOCAL_H_INCLUDED__
 
-#include <type_support.h>
-
-#include "input_system_global.h"
-
 #include "input_system_defs.h"		/* HIVE_ISYS_GPREG_MULTICAST_A_IDX,... */
 
 /*
@@ -33,54 +29,7 @@
 #include "isp_acquisition_defs.h"
 #include "input_system_ctrl_defs.h"
 
-typedef enum {
-	INPUT_SYSTEM_PORT_A = 0,
-	INPUT_SYSTEM_PORT_B,
-	INPUT_SYSTEM_PORT_C,
-	N_INPUT_SYSTEM_PORTS
-} input_system_csi_port_t;
-
-typedef struct ctrl_unit_cfg_s			ctrl_unit_cfg_t;
-typedef struct input_system_network_cfg_s	input_system_network_cfg_t;
-typedef struct target_cfg2400_s		target_cfg2400_t;
-typedef struct channel_cfg_s			channel_cfg_t;
-typedef struct backend_channel_cfg_s		backend_channel_cfg_t;
 typedef struct input_system_cfg2400_s		input_system_cfg2400_t;
-typedef struct mipi_port_state_s		mipi_port_state_t;
-typedef struct rx_channel_state_s		rx_channel_state_t;
-typedef struct input_switch_cfg_channel_s	input_switch_cfg_channel_t;
-typedef struct input_switch_cfg_s		input_switch_cfg_t;
-
-struct ctrl_unit_cfg_s {
-	isp2400_ib_buffer_t		buffer_mipi[N_CAPTURE_UNIT_ID];
-	isp2400_ib_buffer_t		buffer_acquire[N_ACQUISITION_UNIT_ID];
-};
-
-struct input_system_network_cfg_s {
-	input_system_connection_t	multicast_cfg[N_CAPTURE_UNIT_ID];
-	input_system_multiplex_t	mux_cfg;
-	ctrl_unit_cfg_t				ctrl_unit_cfg[N_CTRL_UNIT_ID];
-};
-
-typedef struct {
-// TBD.
-	u32	dummy_parameter;
-} target_isp_cfg_t;
-
-typedef struct {
-// TBD.
-	u32	dummy_parameter;
-} target_sp_cfg_t;
-
-typedef struct {
-// TBD.
-	u32	dummy_parameter;
-} target_strm2mem_cfg_t;
-
-struct input_switch_cfg_channel_s {
-	u32 hsync_data_reg[2];
-	u32 vsync_data_reg;
-};
 
 struct target_cfg2400_s {
 	input_switch_cfg_channel_t		input_switch_channel_cfg;
@@ -89,24 +38,6 @@ struct target_cfg2400_s {
 	target_strm2mem_cfg_t	target_strm2mem_cfg;
 };
 
-struct backend_channel_cfg_s {
-	u32	fmt_control_word_1; // Format config.
-	u32	fmt_control_word_2;
-	u32	no_side_band;
-};
-
-typedef union  {
-	csi_cfg_t	csi_cfg;
-	tpg_cfg_t	tpg_cfg;
-	prbs_cfg_t	prbs_cfg;
-	gpfifo_cfg_t	gpfifo_cfg;
-} source_cfg_t;
-
-struct input_switch_cfg_s {
-	u32 hsync_data_reg[N_RX_CHANNEL_ID * 2];
-	u32 vsync_data_reg;
-};
-
 // Configuration of a channel.
 struct channel_cfg_s {
 	u32		ch_id;
@@ -238,47 +169,6 @@ typedef struct capture_unit_state_s	capture_unit_state_t;
 typedef struct acquisition_unit_state_s	acquisition_unit_state_t;
 typedef struct ctrl_unit_state_s	ctrl_unit_state_t;
 
-/*
- * In 2300 ports can be configured independently and stream
- * formats need to be specified. In 2400, there are only 8
- * supported configurations but the HW is fused to support
- * only a single one.
- *
- * In 2300 the compressed format types are programmed by the
- * user. In 2400 all stream formats are encoded on the stream.
- *
- * Use the enum to check validity of a user configuration
- */
-typedef enum {
-	MONO_4L_1L_0L = 0,
-	MONO_3L_1L_0L,
-	MONO_2L_1L_0L,
-	MONO_1L_1L_0L,
-	STEREO_2L_1L_2L,
-	STEREO_3L_1L_1L,
-	STEREO_2L_1L_1L,
-	STEREO_1L_1L_1L,
-	N_RX_MODE
-} rx_mode_t;
-
-typedef enum {
-	MIPI_PREDICTOR_NONE = 0,
-	MIPI_PREDICTOR_TYPE1,
-	MIPI_PREDICTOR_TYPE2,
-	N_MIPI_PREDICTOR_TYPES
-} mipi_predictor_t;
-
-typedef enum {
-	MIPI_COMPRESSOR_NONE = 0,
-	MIPI_COMPRESSOR_10_6_10,
-	MIPI_COMPRESSOR_10_7_10,
-	MIPI_COMPRESSOR_10_8_10,
-	MIPI_COMPRESSOR_12_6_12,
-	MIPI_COMPRESSOR_12_7_12,
-	MIPI_COMPRESSOR_12_8_12,
-	N_MIPI_COMPRESSOR_METHODS
-} mipi_compressor_t;
-
 typedef enum {
 	MIPI_FORMAT_RGB888 = 0,
 	MIPI_FORMAT_RGB555,
@@ -339,22 +229,6 @@ typedef enum {
 	RX_IRQ_INFO_ERR_LINE_SYNC    = 1UL << _HRT_CSS_RECEIVER_IRQ_ERR_LINE_SYNC_BIT,
 }  rx_irq_info_t;
 
-typedef struct rx_cfg_s		rx_cfg_t;
-
-/*
- * Applied per port
- */
-struct rx_cfg_s {
-	rx_mode_t			mode;	/* The HW config */
-	enum mipi_port_id		port;	/* The port ID to apply the control on */
-	unsigned int		timeout;
-	unsigned int		initcount;
-	unsigned int		synccount;
-	unsigned int		rxcount;
-	mipi_predictor_t	comp;	/* Just for backward compatibility */
-	bool                is_two_ppc;
-};
-
 /* NOTE: The base has already an offset of 0x0100 */
 static const hrt_address __maybe_unused MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
 	0x00000000UL,
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
index 24026090cd35..74bfa10e670e 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
@@ -16,9 +16,6 @@
 #ifndef __INPUT_SYSTEM_LOCAL_H_INCLUDED__
 #define __INPUT_SYSTEM_LOCAL_H_INCLUDED__
 
-#include "type_support.h"
-#include "input_system_global.h"
-
 #include "csi_rx.h"
 #include "pixelgen.h"
 #include "isys_stream2mmio.h"
@@ -69,29 +66,6 @@ typedef enum {
 
 /* The number of stores for compressed format types */
 #define	N_MIPI_COMPRESSOR_CONTEXT	(N_RX_CHANNEL_ID * N_MIPI_FORMAT_CUSTOM)
-#define UNCOMPRESSED_BITS_PER_PIXEL_10	10
-#define UNCOMPRESSED_BITS_PER_PIXEL_12	12
-#define COMPRESSED_BITS_PER_PIXEL_6	6
-#define COMPRESSED_BITS_PER_PIXEL_7	7
-#define COMPRESSED_BITS_PER_PIXEL_8	8
-enum mipi_compressor {
-	MIPI_COMPRESSOR_NONE = 0,
-	MIPI_COMPRESSOR_10_6_10,
-	MIPI_COMPRESSOR_10_7_10,
-	MIPI_COMPRESSOR_10_8_10,
-	MIPI_COMPRESSOR_12_6_12,
-	MIPI_COMPRESSOR_12_7_12,
-	MIPI_COMPRESSOR_12_8_12,
-	N_MIPI_COMPRESSOR_METHODS
-};
-
-typedef enum {
-	MIPI_PREDICTOR_NONE = 0,
-	MIPI_PREDICTOR_TYPE1,
-	MIPI_PREDICTOR_TYPE2,
-	N_MIPI_PREDICTOR_TYPES
-} mipi_predictor_t;
-
 typedef struct input_system_state_s	input_system_state_t;
 struct input_system_state_s {
 	ibuf_ctrl_state_t	ibuf_ctrl_state[N_IBUF_CTRL_ID];
-- 
2.33.1

