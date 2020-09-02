Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2201B25B0F5
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbgIBQNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728348AbgIBQLA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:11:00 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E6C8221E7;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=gll70D6GU5P8UxfSQJbH5W1Oo/6tkhIxKgLxAVOiR3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qk72ISxc1pOlH7TIicg8byDtrLhGffpeuLMixdWiaAp8z30tYFaC6ZgfQD7cLBgEQ
         SfUIjAejg8WgKlK53Qa6r4lOeWKm//lLp5VgEvoF6hcwZwchBeYxA7MCqIBtC8OqZH
         3MQ6/8Va7hJtqNn9lU+MMpuu1JKDrHlR0qH5cZD0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tBB-N8; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 32/38] media: atomisp: de-duplicate names at *_input_system_global.h
Date:   Wed,  2 Sep 2020 18:10:35 +0200
Message-Id: <efeee5606927939e59eb0e169a56aec0c0c12375.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some duplicated names between the ISP2401 and ISP2400
for the input system, with different meanings.

In order to avoid ubiquity, let's prepend those with the
name of the ISP.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/css_2401_system/ibuf_ctrl_global.h    |  6 +-
 .../pci/css_2401_system/pixelgen_global.h     |  8 +--
 .../hive_isp_css_common/host/input_system.c   | 12 ++--
 .../atomisp/pci/isp2400_input_system_global.h | 14 ++---
 .../atomisp/pci/isp2400_input_system_local.h  |  8 +--
 .../atomisp/pci/isp2401_input_system_global.h |  6 +-
 .../pci/runtime/isys/interface/ia_css_isys.h  |  4 +-
 .../media/atomisp/pci/runtime/isys/src/rx.c   |  2 +-
 .../pci/runtime/isys/src/virtual_isys.c       | 56 +++++++++----------
 9 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
index ce7b06b3f3c8..56c5ed89b3cc 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
@@ -33,7 +33,7 @@
 #define _IBUF_CNTRL_DMA_SYNC_WAIT_FOR_SYNC		1
 #define _IBUF_CNTRL_DMA_SYNC_FSM_WAIT_FOR_ACK		(0x3 << 1)
 
-struct	ib_buffer_s {
+struct	isp2401_ib_buffer_s {
 	u32	start_addr;	/* start address of the buffer in the
 					 * "input-buffer hardware block"
 					 */
@@ -41,7 +41,7 @@ struct	ib_buffer_s {
 	u32	stride;		/* stride per buffer line (in bytes) */
 	u32	lines;		/* lines in the buffer */
 };
-typedef struct ib_buffer_s	ib_buffer_t;
+typedef struct isp2401_ib_buffer_s	isp2401_ib_buffer_t;
 
 typedef struct ibuf_ctrl_cfg_s ibuf_ctrl_cfg_t;
 struct ibuf_ctrl_cfg_s {
@@ -58,7 +58,7 @@ struct ibuf_ctrl_cfg_s {
 		u32 elems_per_word_in_dest;
 	} dma_cfg;
 
-	ib_buffer_t ib_buffer;
+	isp2401_ib_buffer_t ib_buffer;
 
 	struct {
 		u32 stride;
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
index 75722ef572d0..f131f03cb8fa 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
@@ -24,8 +24,8 @@
 /*
  * Duplicates "sync_generator_cfg_t" in "input_system_global.h".
  */
-typedef struct sync_generator_cfg_s sync_generator_cfg_t;
-struct sync_generator_cfg_s {
+typedef struct isp2401_sync_generator_cfg_s isp2401_sync_generator_cfg_t;
+struct isp2401_sync_generator_cfg_s {
 	u32	hblank_cycles;
 	u32	vblank_cycles;
 	u32	pixels_per_clock;
@@ -72,7 +72,7 @@ struct pixelgen_tpg_cfg_s {
 		s32	v_delta;	/* vertical delta? */
 	} delta_cfg;
 
-	sync_generator_cfg_t	 sync_gen_cfg;
+	isp2401_sync_generator_cfg_t	 sync_gen_cfg;
 };
 
 /*
@@ -84,7 +84,7 @@ struct pixelgen_prbs_cfg_s {
 	s32	seed0;
 	s32	seed1;
 
-	sync_generator_cfg_t	sync_gen_cfg;
+	isp2401_sync_generator_cfg_t	sync_gen_cfg;
 };
 
 /* end of Pixel-generator: TPG. ("pixelgen_global.h") */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index cd516e4554fb..0f5a231672a8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -30,7 +30,7 @@
 #define ZERO (0x0)
 #define ONE  (1U)
 
-static const ib_buffer_t   IB_BUFFER_NULL = {0, 0, 0 };
+static const isp2400_ib_buffer_t   IB_BUFFER_NULL = {0, 0, 0 };
 
 static input_system_err_t input_system_configure_channel(
     const channel_cfg_t		channel);
@@ -48,12 +48,12 @@ static void input_system_network_rst(const input_system_ID_t ID);
 static void capture_unit_configure(
     const input_system_ID_t			ID,
     const sub_system_ID_t			sub_id,
-    const ib_buffer_t *const cfg);
+    const isp2400_ib_buffer_t *const cfg);
 
 static void acquisition_unit_configure(
     const input_system_ID_t			ID,
     const sub_system_ID_t			sub_id,
-    const ib_buffer_t *const cfg);
+    const isp2400_ib_buffer_t *const cfg);
 
 static void ctrl_unit_configure(
     const input_system_ID_t			ID,
@@ -953,7 +953,7 @@ static input_system_err_t input_buffer_configuration(void)
 	u32 current_address    = 0;
 	u32 unallocated_memory = IB_CAPACITY_IN_WORDS;
 
-	ib_buffer_t	candidate_buffer_acq  = IB_BUFFER_NULL;
+	isp2400_ib_buffer_t	candidate_buffer_acq  = IB_BUFFER_NULL;
 	u32 size_requested;
 	input_system_config_flags_t	acq_already_specified = INPUT_SYSTEM_CFG_FLAG_RESET;
 	input_system_csi_port_t port;
@@ -1062,7 +1062,7 @@ static input_system_err_t input_buffer_configuration(void)
 static void capture_unit_configure(
     const input_system_ID_t			ID,
     const sub_system_ID_t			sub_id,
-    const ib_buffer_t *const cfg)
+    const isp2400_ib_buffer_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(/*(sub_id >= CAPTURE_UNIT0_ID) &&*/ (sub_id <=
@@ -1088,7 +1088,7 @@ static void capture_unit_configure(
 static void acquisition_unit_configure(
     const input_system_ID_t			ID,
     const sub_system_ID_t			sub_id,
-    const ib_buffer_t *const cfg)
+    const isp2400_ib_buffer_t *const cfg)
 {
 	assert(ID < N_INPUT_SYSTEM_ID);
 	assert(sub_id == ACQUISITION_UNIT0_ID);
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
index 54dc53cf1528..61f23814e2fd 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
@@ -75,13 +75,13 @@ typedef enum {
 	N_INPUT_SYSTEM_BUFFERING_MODE
 } buffering_mode_t;
 
-typedef struct input_system_cfg_s	input_system_cfg_t;
+typedef struct isp2400_input_system_cfg_s	input_system_cfg_t;
 typedef struct sync_generator_cfg_s	sync_generator_cfg_t;
 typedef struct tpg_cfg_s			tpg_cfg_t;
 typedef struct prbs_cfg_s			prbs_cfg_t;
 
 /* MW: uint16_t should be sufficient */
-struct input_system_cfg_s {
+struct isp2400_input_system_cfg_s {
 	u32	no_side_band;
 	u32	fmt_type;
 	u32	ch_id;
@@ -118,7 +118,7 @@ struct gpfifo_cfg_s {
 typedef struct gpfifo_cfg_s		gpfifo_cfg_t;
 
 //ALX:Commented out to pass the compilation.
-//typedef struct input_system_cfg_s input_system_cfg_t;
+//typedef struct isp2400_input_system_cfg_s input_system_cfg_t;
 
 struct ib_buffer_s {
 	u32	mem_reg_size;
@@ -126,13 +126,13 @@ struct ib_buffer_s {
 	u32	mem_reg_addr;
 };
 
-typedef struct ib_buffer_s	ib_buffer_t;
+typedef struct ib_buffer_s	isp2400_ib_buffer_t;
 
 struct csi_cfg_s {
 	u32			csi_port;
 	buffering_mode_t	buffering_mode;
-	ib_buffer_t			csi_buffer;
-	ib_buffer_t			acquisition_buffer;
+	isp2400_ib_buffer_t	csi_buffer;
+	isp2400_ib_buffer_t	acquisition_buffer;
 	u32			nof_xmem_buffers;
 };
 
@@ -144,6 +144,6 @@ typedef enum {
 	INPUT_SYSTEM_CFG_FLAG_BLOCKED	= 1U << 1,
 	INPUT_SYSTEM_CFG_FLAG_REQUIRED	= 1U << 2,
 	INPUT_SYSTEM_CFG_FLAG_CONFLICT	= 1U << 3	// To mark a conflicting configuration.
-} input_system_cfg_flag_t;
+} isp2400_input_system_cfg_flag_t;
 
 typedef u32 input_system_config_flags_t;
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index b26c07478914..072a92199e05 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -52,8 +52,8 @@ typedef struct input_switch_cfg_channel_s	input_switch_cfg_channel_t;
 typedef struct input_switch_cfg_s		input_switch_cfg_t;
 
 struct ctrl_unit_cfg_s {
-	ib_buffer_t		buffer_mipi[N_CAPTURE_UNIT_ID];
-	ib_buffer_t		buffer_acquire[N_ACQUISITION_UNIT_ID];
+	isp2400_ib_buffer_t		buffer_mipi[N_CAPTURE_UNIT_ID];
+	isp2400_ib_buffer_t		buffer_acquire[N_ACQUISITION_UNIT_ID];
 };
 
 struct input_system_network_cfg_s {
@@ -128,9 +128,9 @@ struct input_system_cfg2400_s {
 
 	// Possible another struct for ib.
 	// This buffers set at the end, based on the all configurations.
-	ib_buffer_t			csi_buffer[N_CSI_PORTS];
+	isp2400_ib_buffer_t			csi_buffer[N_CSI_PORTS];
 	input_system_config_flags_t	csi_buffer_flags[N_CSI_PORTS];
-	ib_buffer_t			acquisition_buffer_unique;
+	isp2400_ib_buffer_t			acquisition_buffer_unique;
 	input_system_config_flags_t	acquisition_buffer_unique_flags;
 	u32			unallocated_ib_mem_words; // Used for check.DEFAULT = IB_CAPACITY_IN_WORDS.
 	//uint32_t			acq_allocated_ib_mem_words;
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index 29bffaa07ee8..f38773842646 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -55,7 +55,7 @@ struct input_system_channel_s {
 	stream2mmio_sid_ID_t	stream2mmio_sid_id;
 
 	ibuf_ctrl_ID_t		ibuf_ctrl_id;
-	ib_buffer_t		ib_buffer;
+	isp2401_ib_buffer_t	ib_buffer;
 
 	isys2401_dma_ID_t	dma_id;
 	isys2401_dma_channel	dma_channel;
@@ -105,8 +105,8 @@ struct input_system_input_port_cfg_s {
 	} pixelgen_cfg;
 };
 
-typedef struct input_system_cfg_s input_system_cfg_t;
-struct input_system_cfg_s {
+typedef struct isp2401_input_system_cfg_s isp2401_input_system_cfg_t;
+struct isp2401_input_system_cfg_s {
 	input_system_input_port_ID_t	input_port_id;
 
 	input_system_source_type_t	mode;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
index ea0b518e80c6..711a321e9a3f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
@@ -28,7 +28,7 @@
 /**
  * Virtual Input System. (Input System 2401)
  */
-typedef input_system_cfg_t	ia_css_isys_descr_t;
+typedef isp2401_input_system_cfg_t	ia_css_isys_descr_t;
 /* end of Virtual Input System */
 #endif
 
@@ -71,7 +71,7 @@ int ia_css_isys_csi_rx_unregister_stream(
 
 int ia_css_isys_convert_compressed_format(
     struct ia_css_csi2_compression *comp,
-    struct input_system_cfg_s *cfg);
+    struct isp2401_input_system_cfg_s *cfg);
 unsigned int ia_css_csi2_calculate_input_system_alignment(
     enum atomisp_input_format fmt_type);
 #endif
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index c4bb9fd9ce20..b4813cd50daa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -376,7 +376,7 @@ static mipi_predictor_t sh_css_csi2_compression_type_2_mipi_predictor(
 
 int ia_css_isys_convert_compressed_format(
     struct ia_css_csi2_compression *comp,
-    struct input_system_cfg_s *cfg)
+    struct isp2401_input_system_cfg_s *cfg)
 {
 	int err = 0;
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 037b9e71a655..317ea30ede7a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -33,7 +33,7 @@
  *************************************************/
 
 static bool create_input_system_channel(
-    input_system_cfg_t	*cfg,
+    isp2401_input_system_cfg_t	*cfg,
     bool			metadata,
     input_system_channel_t	*channel);
 
@@ -41,7 +41,7 @@ static void destroy_input_system_channel(
     input_system_channel_t	*channel);
 
 static bool create_input_system_input_port(
-    input_system_cfg_t		*cfg,
+    isp2401_input_system_cfg_t		*cfg,
     input_system_input_port_t	*input_port);
 
 static void destroy_input_system_input_port(
@@ -50,14 +50,14 @@ static void destroy_input_system_input_port(
 static bool calculate_input_system_channel_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     input_system_channel_cfg_t	*channel_cfg,
     bool metadata);
 
 static bool calculate_input_system_input_port_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     input_system_input_port_cfg_t	*input_port_cfg);
 
 static bool acquire_sid(
@@ -74,10 +74,10 @@ static bool acquire_ib_buffer(
     s32 lines_per_frame,
     s32 align_in_bytes,
     bool online,
-    ib_buffer_t *buf);
+    isp2401_ib_buffer_t *buf);
 
 static void release_ib_buffer(
-    ib_buffer_t *buf);
+    isp2401_ib_buffer_t *buf);
 
 static bool acquire_dma_channel(
     isys2401_dma_ID_t	dma_id,
@@ -100,43 +100,43 @@ static void release_be_lut_entry(
 static bool calculate_tpg_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_tpg_cfg_t		*cfg);
 
 static bool calculate_prbs_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg);
 
 static bool calculate_fe_cfg(
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     csi_rx_frontend_cfg_t		*cfg);
 
 static bool calculate_be_cfg(
     const input_system_input_port_t	*input_port,
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg);
 
 static bool calculate_stream2mmio_cfg(
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     stream2mmio_cfg_t		*cfg);
 
 static bool calculate_ibuf_ctrl_cfg(
     const input_system_channel_t	*channel,
     const input_system_input_port_t	*input_port,
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg);
 
 static bool calculate_isys2401_dma_cfg(
     const input_system_channel_t	*channel,
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     isys2401_dma_cfg_t		*cfg);
 
 static bool calculate_isys2401_dma_port_cfg(
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     bool				raw_packed,
     bool				metadata,
     isys2401_dma_port_cfg_t		*cfg);
@@ -287,7 +287,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
  *
  **************************************************/
 static bool create_input_system_channel(
-    input_system_cfg_t	*cfg,
+    isp2401_input_system_cfg_t	*cfg,
     bool			metadata,
     input_system_channel_t	*me)
 {
@@ -361,7 +361,7 @@ static void destroy_input_system_channel(
 }
 
 static bool create_input_system_input_port(
-    input_system_cfg_t		*cfg,
+    isp2401_input_system_cfg_t		*cfg,
     input_system_input_port_t	*me)
 {
 	csi_mipi_packet_type_t packet_type;
@@ -457,7 +457,7 @@ static void destroy_input_system_input_port(
 static bool calculate_input_system_channel_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     input_system_channel_cfg_t	*channel_cfg,
     bool metadata)
 {
@@ -508,7 +508,7 @@ static bool calculate_input_system_channel_cfg(
 static bool calculate_input_system_input_port_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     input_system_input_port_cfg_t	*input_port_cfg)
 {
 	bool rc;
@@ -595,7 +595,7 @@ static bool acquire_ib_buffer(
     s32 lines_per_frame,
     s32 align_in_bytes,
     bool online,
-    ib_buffer_t *buf)
+    isp2401_ib_buffer_t *buf)
 {
 	buf->stride = calculate_stride(bits_per_pixel, pixels_per_line, false,
 				       align_in_bytes);
@@ -610,7 +610,7 @@ static bool acquire_ib_buffer(
 }
 
 static void release_ib_buffer(
-    ib_buffer_t *buf)
+    isp2401_ib_buffer_t *buf)
 {
 	ia_css_isys_ibuf_rmgr_release(&buf->start_addr);
 }
@@ -648,7 +648,7 @@ static void release_be_lut_entry(
 static bool calculate_tpg_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_tpg_cfg_t		*cfg)
 {
 	memcpy(cfg, &isys_cfg->tpg_port_attr, sizeof(pixelgen_tpg_cfg_t));
@@ -659,7 +659,7 @@ static bool calculate_tpg_cfg(
 static bool calculate_prbs_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
-    input_system_cfg_t		*isys_cfg,
+    isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg)
 {
 	memcpy(cfg, &isys_cfg->prbs_port_attr, sizeof(pixelgen_prbs_cfg_t));
@@ -668,7 +668,7 @@ static bool calculate_prbs_cfg(
 }
 
 static bool calculate_fe_cfg(
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     csi_rx_frontend_cfg_t		*cfg)
 {
 	cfg->active_lanes = isys_cfg->csi_port_attr.active_lanes;
@@ -677,7 +677,7 @@ static bool calculate_fe_cfg(
 
 static bool calculate_be_cfg(
     const input_system_input_port_t	*input_port,
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg)
 {
@@ -707,7 +707,7 @@ static bool calculate_be_cfg(
 }
 
 static bool calculate_stream2mmio_cfg(
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     stream2mmio_cfg_t		*cfg
 )
@@ -725,7 +725,7 @@ static bool calculate_stream2mmio_cfg(
 static bool calculate_ibuf_ctrl_cfg(
     const input_system_channel_t	*channel,
     const input_system_input_port_t	*input_port,
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg)
 {
 	const s32 bits_per_byte = 8;
@@ -807,7 +807,7 @@ static bool calculate_ibuf_ctrl_cfg(
 
 static bool calculate_isys2401_dma_cfg(
     const input_system_channel_t	*channel,
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     isys2401_dma_cfg_t		*cfg)
 {
 	cfg->channel	= channel->dma_channel;
@@ -827,7 +827,7 @@ static bool calculate_isys2401_dma_cfg(
 
 /* See also: ia_css_dma_configure_from_info() */
 static bool calculate_isys2401_dma_port_cfg(
-    const input_system_cfg_t	*isys_cfg,
+    const isp2401_input_system_cfg_t	*isys_cfg,
     bool				raw_packed,
     bool				metadata,
     isys2401_dma_port_cfg_t		*cfg)
-- 
2.26.2

