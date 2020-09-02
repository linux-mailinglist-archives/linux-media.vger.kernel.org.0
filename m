Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A956925B0F4
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgIBQNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:53872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728031AbgIBQK7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:59 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8514B221E5;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=nIwf2Irhblv49+pQhNmKTUAi1wh7eY9UFjQPwAVsjOw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eL5MloL/sCMawoCSdjUStXLspXZdtLurNHTZVop/sJM/4FWmp23sHhJ9Y4qU8e+7X
         OSgdybQsgfhhpe6pjdAEsd1dn5Ths0T4ckayoA8YQntlLHlxWn5WDJSX1Av1wzOe9n
         1mDhvacnSori5x3ls21NH/Hd8/2FqiOkicgDScjw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tB9-Lt; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 31/38] media: atomisp: unify INPUT error return type
Date:   Wed,  2 Sep 2020 18:10:34 +0200
Message-Id: <b83557ffe822ae2cf6c31858c40d61e25d5a6c40.1599062230.git.mchehab+huawei@kernel.org>
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

There is a typedef for INPUT errors. This is different between
ISP2401 and ISP2400. Place both at the same struct, at the
global header file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/css_2401_system/ibuf_ctrl_global.h    |  2 +-
 .../hive_isp_css_common/host/input_system.c   | 56 +++++++++----------
 .../media/atomisp/pci/input_system_global.h   | 22 ++++++++
 .../atomisp/pci/isp2400_input_system_global.h |  7 ---
 .../atomisp/pci/isp2400_input_system_local.h  |  9 ---
 .../atomisp/pci/isp2400_input_system_public.h | 22 ++++----
 .../atomisp/pci/isp2401_input_system_global.h | 19 -------
 .../atomisp/pci/isp2401_input_system_local.h  |  2 -
 .../pci/runtime/isys/interface/ia_css_isys.h  |  2 +-
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  6 +-
 10 files changed, 66 insertions(+), 81 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
index 1b9f03d57659..ce7b06b3f3c8 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
@@ -33,7 +33,6 @@
 #define _IBUF_CNTRL_DMA_SYNC_WAIT_FOR_SYNC		1
 #define _IBUF_CNTRL_DMA_SYNC_FSM_WAIT_FOR_ACK		(0x3 << 1)
 
-typedef struct ib_buffer_s	ib_buffer_t;
 struct	ib_buffer_s {
 	u32	start_addr;	/* start address of the buffer in the
 					 * "input-buffer hardware block"
@@ -42,6 +41,7 @@ struct	ib_buffer_s {
 	u32	stride;		/* stride per buffer line (in bytes) */
 	u32	lines;		/* lines in the buffer */
 };
+typedef struct ib_buffer_s	ib_buffer_t;
 
 typedef struct ibuf_ctrl_cfg_s ibuf_ctrl_cfg_t;
 struct ibuf_ctrl_cfg_s {
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 4f3d75fac3e3..cd516e4554fb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -32,15 +32,15 @@
 
 static const ib_buffer_t   IB_BUFFER_NULL = {0, 0, 0 };
 
-static input_system_error_t input_system_configure_channel(
+static input_system_err_t input_system_configure_channel(
     const channel_cfg_t		channel);
 
-static input_system_error_t input_system_configure_channel_sensor(
+static input_system_err_t input_system_configure_channel_sensor(
     const channel_cfg_t		channel);
 
-static input_system_error_t input_buffer_configuration(void);
+static input_system_err_t input_buffer_configuration(void);
 
-static input_system_error_t configuration_to_registers(void);
+static input_system_err_t configuration_to_registers(void);
 
 static void receiver_rst(const rx_ID_t ID);
 static void input_system_network_rst(const input_system_ID_t ID);
@@ -65,17 +65,17 @@ static void input_system_network_configure(
     const input_system_network_cfg_t *const cfg);
 
 // MW: CSI is previously named as "rx" short for "receiver"
-static input_system_error_t set_csi_cfg(
+static input_system_err_t set_csi_cfg(
     csi_cfg_t *const lhs,
     const csi_cfg_t *const rhs,
     input_system_config_flags_t *const flags);
 
-static input_system_error_t set_source_type(
+static input_system_err_t set_source_type(
     input_system_source_t *const lhs,
     const input_system_source_t				rhs,
     input_system_config_flags_t *const flags);
 
-static input_system_error_t input_system_multiplexer_cfg(
+static input_system_err_t input_system_multiplexer_cfg(
     input_system_multiplex_t *const lhs,
     const input_system_multiplex_t			rhs,
     input_system_config_flags_t *const flags);
@@ -848,7 +848,7 @@ static void input_system_network_rst(const input_system_ID_t ID)
 }
 
 // Function that resets current configuration.
-input_system_error_t input_system_configuration_reset(void)
+input_system_err_t input_system_configuration_reset(void)
 {
 	unsigned int i;
 
@@ -890,10 +890,10 @@ input_system_error_t input_system_configuration_reset(void)
 
 // MW: Comments are good, but doxygen is required, place it at the declaration
 // Function that appends the channel to current configuration.
-static input_system_error_t input_system_configure_channel(
+static input_system_err_t input_system_configure_channel(
     const channel_cfg_t		channel)
 {
-	input_system_error_t error = INPUT_SYSTEM_ERR_NO_ERROR;
+	input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
 	// Check if channel is not already configured.
 	if (config.ch_flags[channel.ch_id] & INPUT_SYSTEM_CFG_FLAG_SET) {
 		return INPUT_SYSTEM_ERR_CHANNEL_ALREADY_SET;
@@ -948,7 +948,7 @@ static input_system_error_t input_system_configure_channel(
 }
 
 // Function that partitions input buffer space with determining addresses.
-static input_system_error_t input_buffer_configuration(void)
+static input_system_err_t input_buffer_configuration(void)
 {
 	u32 current_address    = 0;
 	u32 unallocated_memory = IB_CAPACITY_IN_WORDS;
@@ -1236,7 +1236,7 @@ static void input_system_network_configure(
 	return;
 }
 
-static input_system_error_t configuration_to_registers(void)
+static input_system_err_t configuration_to_registers(void)
 {
 	input_system_network_cfg_t input_system_network_cfg;
 	int i;
@@ -1335,10 +1335,10 @@ static input_system_error_t configuration_to_registers(void)
 }
 
 // Function that applies the whole configuration.
-input_system_error_t input_system_configuration_commit(void)
+input_system_err_t input_system_configuration_commit(void)
 {
 	// The last configuration step is to configure the input buffer.
-	input_system_error_t error = input_buffer_configuration();
+	input_system_err_t error = input_buffer_configuration();
 
 	if (error != INPUT_SYSTEM_ERR_NO_ERROR) {
 		return error;
@@ -1357,7 +1357,7 @@ input_system_error_t input_system_configuration_commit(void)
 
 // FIFO
 
-input_system_error_t	input_system_csi_fifo_channel_cfg(
+input_system_err_t	input_system_csi_fifo_channel_cfg(
     u32		ch_id,
     input_system_csi_port_t	port,
     backend_channel_cfg_t	backend_ch,
@@ -1380,7 +1380,7 @@ input_system_error_t	input_system_csi_fifo_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_error_t	input_system_csi_fifo_channel_with_counting_cfg(
+input_system_err_t	input_system_csi_fifo_channel_with_counting_cfg(
     u32				ch_id,
     u32				nof_frames,
     input_system_csi_port_t			port,
@@ -1411,7 +1411,7 @@ input_system_error_t	input_system_csi_fifo_channel_with_counting_cfg(
 
 // SRAM
 
-input_system_error_t	input_system_csi_sram_channel_cfg(
+input_system_err_t	input_system_csi_sram_channel_cfg(
     u32				ch_id,
     input_system_csi_port_t			port,
     backend_channel_cfg_t			backend_ch,
@@ -1443,7 +1443,7 @@ input_system_error_t	input_system_csi_sram_channel_cfg(
 //XMEM
 
 // Collects all parameters and puts them in channel_cfg_t.
-input_system_error_t	input_system_csi_xmem_channel_cfg(
+input_system_err_t	input_system_csi_xmem_channel_cfg(
     u32				ch_id,
     input_system_csi_port_t			port,
     backend_channel_cfg_t			backend_ch,
@@ -1475,7 +1475,7 @@ input_system_error_t	input_system_csi_xmem_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_error_t	input_system_csi_xmem_acquire_only_channel_cfg(
+input_system_err_t	input_system_csi_xmem_acquire_only_channel_cfg(
     u32				ch_id,
     u32				nof_frames,
     input_system_csi_port_t			port,
@@ -1502,7 +1502,7 @@ input_system_error_t	input_system_csi_xmem_acquire_only_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_error_t	input_system_csi_xmem_capture_only_channel_cfg(
+input_system_err_t	input_system_csi_xmem_capture_only_channel_cfg(
     u32				ch_id,
     u32				nof_frames,
     input_system_csi_port_t			port,
@@ -1535,7 +1535,7 @@ input_system_error_t	input_system_csi_xmem_capture_only_channel_cfg(
 
 // Non - CSI
 
-input_system_error_t	input_system_prbs_channel_cfg(
+input_system_err_t	input_system_prbs_channel_cfg(
     u32		ch_id,
     u32		nof_frames,//not used yet
     u32		seed,
@@ -1564,7 +1564,7 @@ input_system_error_t	input_system_prbs_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_error_t	input_system_tpg_channel_cfg(
+input_system_err_t	input_system_tpg_channel_cfg(
     u32		ch_id,
     u32		nof_frames,//not used yet
     u32		x_mask,
@@ -1601,7 +1601,7 @@ input_system_error_t	input_system_tpg_channel_cfg(
 }
 
 // MW: Don't use system specific names, (even in system specific files) "cfg2400" -> cfg
-input_system_error_t	input_system_gpfifo_channel_cfg(
+input_system_err_t	input_system_gpfifo_channel_cfg(
     u32		ch_id,
     u32		nof_frames, //not used yet
 
@@ -1625,11 +1625,11 @@ input_system_error_t	input_system_gpfifo_channel_cfg(
 ///////////////////////////////////////////////////////////////////////////
 
 // Fills the parameters to config.csi_value[port]
-static input_system_error_t input_system_configure_channel_sensor(
+static input_system_err_t input_system_configure_channel_sensor(
     const channel_cfg_t channel)
 {
 	const u32 port = channel.source_cfg.csi_cfg.csi_port;
-	input_system_error_t status = INPUT_SYSTEM_ERR_NO_ERROR;
+	input_system_err_t status = INPUT_SYSTEM_ERR_NO_ERROR;
 
 	input_system_multiplex_t mux;
 
@@ -1711,7 +1711,7 @@ static input_system_error_t input_system_configure_channel_sensor(
 }
 
 // Test flags and set structure.
-static input_system_error_t set_source_type(
+static input_system_err_t set_source_type(
     input_system_source_t *const lhs,
     const input_system_source_t			rhs,
     input_system_config_flags_t *const flags)
@@ -1747,7 +1747,7 @@ static input_system_error_t set_source_type(
 }
 
 // Test flags and set structure.
-static input_system_error_t set_csi_cfg(
+static input_system_err_t set_csi_cfg(
     csi_cfg_t *const lhs,
     const csi_cfg_t *const rhs,
     input_system_config_flags_t *const flags)
@@ -1814,7 +1814,7 @@ static input_system_error_t set_csi_cfg(
 }
 
 // Test flags and set structure.
-static input_system_error_t input_system_multiplexer_cfg(
+static input_system_err_t input_system_multiplexer_cfg(
     input_system_multiplex_t *const lhs,
     const input_system_multiplex_t		rhs,
     input_system_config_flags_t *const flags)
diff --git a/drivers/staging/media/atomisp/pci/input_system_global.h b/drivers/staging/media/atomisp/pci/input_system_global.h
index 5ac580ce64ed..5929d529950b 100644
--- a/drivers/staging/media/atomisp/pci/input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/input_system_global.h
@@ -4,8 +4,30 @@
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
 
+
+#ifndef __INPUT_SYSTEM_GLOBAL_H_INCLUDED__
+#define __INPUT_SYSTEM_GLOBAL_H_INCLUDED__
+typedef enum {
+	INPUT_SYSTEM_ERR_NO_ERROR = 0,
+	/* ISP2401 */
+	INPUT_SYSTEM_ERR_CREATE_CHANNEL_FAIL,
+	INPUT_SYSTEM_ERR_CONFIGURE_CHANNEL_FAIL,
+	INPUT_SYSTEM_ERR_OPEN_CHANNEL_FAIL,
+	INPUT_SYSTEM_ERR_TRANSFER_FAIL,
+	INPUT_SYSTEM_ERR_CREATE_INPUT_PORT_FAIL,
+	INPUT_SYSTEM_ERR_CONFIGURE_INPUT_PORT_FAIL,
+	INPUT_SYSTEM_ERR_OPEN_INPUT_PORT_FAIL,
+	/* ISP2400 */
+	INPUT_SYSTEM_ERR_GENERIC,
+	INPUT_SYSTEM_ERR_CHANNEL_ALREADY_SET,
+	INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE,
+	INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED,
+} input_system_err_t;
+
 #ifdef ISP2401
 #  include "isp2401_input_system_global.h"
 #else
 #  include "isp2400_input_system_global.h"
 #endif
+
+#endif /* __INPUT_SYSTEM_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
index b4142bdde51b..54dc53cf1528 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
@@ -13,11 +13,6 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_GLOBAL_H_INCLUDED__
-#define __INPUT_SYSTEM_GLOBAL_H_INCLUDED__
-
-#define IS_INPUT_SYSTEM_VERSION_2
-
 #include <type_support.h>
 
 //CSI reveiver has 3 ports.
@@ -152,5 +147,3 @@ typedef enum {
 } input_system_cfg_flag_t;
 
 typedef u32 input_system_config_flags_t;
-
-#endif /* __INPUT_SYSTEM_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 33ebf89ca053..b26c07478914 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -33,15 +33,6 @@
 #include "isp_acquisition_defs.h"
 #include "input_system_ctrl_defs.h"
 
-typedef enum {
-	INPUT_SYSTEM_ERR_NO_ERROR = 0,
-	INPUT_SYSTEM_ERR_GENERIC,
-	INPUT_SYSTEM_ERR_CHANNEL_ALREADY_SET,
-	INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE,
-	INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED,
-	N_INPUT_SYSTEM_ERR
-} input_system_error_t;
-
 typedef enum {
 	INPUT_SYSTEM_PORT_A = 0,
 	INPUT_SYSTEM_PORT_B,
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index c6e5b17b3c40..85cb61e34192 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -251,11 +251,11 @@ STORAGE_CLASS_INPUT_SYSTEM_H hrt_data input_system_sub_system_reg_load(
 
 // Function that resets current configuration.
 // remove the argument since it should be private.
-input_system_error_t input_system_configuration_reset(void);
+input_system_err_t input_system_configuration_reset(void);
 
 // Function that commits current configuration.
 // remove the argument since it should be private.
-input_system_error_t input_system_configuration_commit(void);
+input_system_err_t input_system_configuration_commit(void);
 
 ///////////////////////////////////////////////////////////////////////////
 //
@@ -269,14 +269,14 @@ input_system_error_t input_system_configuration_commit(void);
 
 // FIFO channel config function user
 
-input_system_error_t	input_system_csi_fifo_channel_cfg(
+input_system_err_t	input_system_csi_fifo_channel_cfg(
     u32				ch_id,
     input_system_csi_port_t	port,
     backend_channel_cfg_t	backend_ch,
     target_cfg2400_t			target
 );
 
-input_system_error_t	input_system_csi_fifo_channel_with_counting_cfg(
+input_system_err_t	input_system_csi_fifo_channel_with_counting_cfg(
     u32				ch_id,
     u32				nof_frame,
     input_system_csi_port_t	port,
@@ -288,7 +288,7 @@ input_system_error_t	input_system_csi_fifo_channel_with_counting_cfg(
 
 // SRAM channel config function user
 
-input_system_error_t	input_system_csi_sram_channel_cfg(
+input_system_err_t	input_system_csi_sram_channel_cfg(
     u32				ch_id,
     input_system_csi_port_t	port,
     backend_channel_cfg_t	backend_ch,
@@ -299,7 +299,7 @@ input_system_error_t	input_system_csi_sram_channel_cfg(
 
 //XMEM channel config function user
 
-input_system_error_t	input_system_csi_xmem_channel_cfg(
+input_system_err_t	input_system_csi_xmem_channel_cfg(
     u32				ch_id,
     input_system_csi_port_t port,
     backend_channel_cfg_t	backend_ch,
@@ -311,7 +311,7 @@ input_system_error_t	input_system_csi_xmem_channel_cfg(
     uint32_t				nof_xmem_buffers
 );
 
-input_system_error_t	input_system_csi_xmem_capture_only_channel_cfg(
+input_system_err_t	input_system_csi_xmem_capture_only_channel_cfg(
     u32				ch_id,
     u32				nof_frames,
     input_system_csi_port_t port,
@@ -322,7 +322,7 @@ input_system_error_t	input_system_csi_xmem_capture_only_channel_cfg(
     target_cfg2400_t			target
 );
 
-input_system_error_t	input_system_csi_xmem_acquire_only_channel_cfg(
+input_system_err_t	input_system_csi_xmem_acquire_only_channel_cfg(
     u32				ch_id,
     u32				nof_frames,
     input_system_csi_port_t port,
@@ -334,7 +334,7 @@ input_system_error_t	input_system_csi_xmem_acquire_only_channel_cfg(
 
 // Non - CSI channel config function user
 
-input_system_error_t	input_system_prbs_channel_cfg(
+input_system_err_t	input_system_prbs_channel_cfg(
     u32		ch_id,
     u32		nof_frames,
     u32		seed,
@@ -345,7 +345,7 @@ input_system_error_t	input_system_prbs_channel_cfg(
     target_cfg2400_t	target
 );
 
-input_system_error_t	input_system_tpg_channel_cfg(
+input_system_err_t	input_system_tpg_channel_cfg(
     u32		ch_id,
     u32		nof_frames,//not used yet
     u32		x_mask,
@@ -360,7 +360,7 @@ input_system_error_t	input_system_tpg_channel_cfg(
     target_cfg2400_t	target
 );
 
-input_system_error_t	input_system_gpfifo_channel_cfg(
+input_system_err_t	input_system_gpfifo_channel_cfg(
     u32		ch_id,
     u32		nof_frames,
     target_cfg2400_t	target
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index 362644856a6c..29bffaa07ee8 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -13,11 +13,6 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_GLOBAL_H_INCLUDED__
-#define __INPUT_SYSTEM_GLOBAL_H_INCLUDED__
-
-#define IS_INPUT_SYSTEM_VERSION_VERSION_2401
-
 /* CSI reveiver has 3 ports. */
 #define		N_CSI_PORTS (3)
 
@@ -41,18 +36,6 @@
 #define INPUT_SYSTEM_N_STREAM_ID  6	/* maximum number of simultaneous
 					virtual channels supported*/
 
-typedef enum {
-	INPUT_SYSTEM_ERR_NO_ERROR = 0,
-	INPUT_SYSTEM_ERR_CREATE_CHANNEL_FAIL,
-	INPUT_SYSTEM_ERR_CONFIGURE_CHANNEL_FAIL,
-	INPUT_SYSTEM_ERR_OPEN_CHANNEL_FAIL,
-	INPUT_SYSTEM_ERR_TRANSFER_FAIL,
-	INPUT_SYSTEM_ERR_CREATE_INPUT_PORT_FAIL,
-	INPUT_SYSTEM_ERR_CONFIGURE_INPUT_PORT_FAIL,
-	INPUT_SYSTEM_ERR_OPEN_INPUT_PORT_FAIL,
-	N_INPUT_SYSTEM_ERR
-} input_system_err_t;
-
 typedef enum {
 	INPUT_SYSTEM_SOURCE_TYPE_UNDEFINED = 0,
 	INPUT_SYSTEM_SOURCE_TYPE_SENSOR,
@@ -203,5 +186,3 @@ struct virtual_input_system_stream_cfg_s {
 #define NUM_OF_LINES_PER_BUF		2
 #define LINES_OF_ISP_INPUT_BUF		(NUM_OF_INPUT_BUF * NUM_OF_LINES_PER_BUF)
 #define ISP_INPUT_BUF_STRIDE		SH_CSS_MAX_SENSOR_WIDTH
-
-#endif /* __INPUT_SYSTEM_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
index c33b0341ce16..24026090cd35 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
@@ -24,8 +24,6 @@
 #include "isys_stream2mmio.h"
 #include "isys_irq.h"
 
-typedef input_system_err_t input_system_error_t;
-
 typedef enum {
 	MIPI_FORMAT_SHORT1 = 0x08,
 	MIPI_FORMAT_SHORT2,
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
index bd972d966fe2..ea0b518e80c6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
@@ -32,7 +32,7 @@ typedef input_system_cfg_t	ia_css_isys_descr_t;
 /* end of Virtual Input System */
 #endif
 
-input_system_error_t ia_css_isys_init(void);
+input_system_err_t ia_css_isys_init(void);
 void ia_css_isys_uninit(void);
 enum mipi_port_id ia_css_isys_port_to_mipi_port(
     enum mipi_port_id api_port);
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 484c5967ad1c..d0a43c44963c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -24,7 +24,7 @@
 #endif
 
 #if !defined(ISP2401)
-input_system_error_t ia_css_isys_init(void)
+input_system_err_t ia_css_isys_init(void)
 {
 	backend_channel_cfg_t backend_ch0;
 	backend_channel_cfg_t backend_ch1;
@@ -32,7 +32,7 @@ input_system_error_t ia_css_isys_init(void)
 	target_cfg2400_t targetC;
 	u32 acq_mem_region_size = 24;
 	u32 acq_nof_mem_regions = 2;
-	input_system_error_t error = INPUT_SYSTEM_ERR_NO_ERROR;
+	input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
 
 	memset(&backend_ch0, 0, sizeof(backend_channel_cfg_t));
 	memset(&backend_ch1, 0, sizeof(backend_channel_cfg_t));
@@ -87,7 +87,7 @@ input_system_error_t ia_css_isys_init(void)
 	return error;
 }
 #elif defined(ISP2401)
-input_system_error_t ia_css_isys_init(void)
+input_system_err_t ia_css_isys_init(void)
 {
 	ia_css_isys_csi_rx_lut_rmgr_init();
 	ia_css_isys_ibuf_rmgr_init();
-- 
2.26.2

