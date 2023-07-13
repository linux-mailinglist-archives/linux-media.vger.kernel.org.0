Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4A3751E2A
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbjGMKEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234569AbjGMKEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E4326AF
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uS8K+yfO7UzWoVE9gOEq5LpVufWYAbuiGyt8V8rSVTc=;
        b=T3u3/LtWVv1OR2h0sSYhJmcpnli8EQXxwFsgYa+C8He+Srk1va/3mEb5QMGOP6uj/CIC9d
        MPI6Qpo8qftGmRa2j7RAzquC7y4Brx7d3XyOh97gu25OERq21L3PSD7I8oeFj0um6gdyyX
        aBjP0Q1QAUZxwXFTJ3x3pg+GQlhoWBk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-idWJGwMuOu6xRCAQ0kNr0g-1; Thu, 13 Jul 2023 06:02:51 -0400
X-MC-Unique: idWJGwMuOu6xRCAQ0kNr0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 361B63C0D848;
        Thu, 13 Jul 2023 10:02:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 91955111E3EC;
        Thu, 13 Jul 2023 10:02:46 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 01/11] media: atomisp: ia_css_debug: Removed debug codes for dumping status
Date:   Thu, 13 Jul 2023 18:02:21 +0800
Message-ID: <20230713100231.308923-2-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This portion of debug code was based on a structure for both ISP2400 and
2401 with the same name and controlled by #if defined(ISP2401). This
structure was only used to dump the status of atomisp. So, to make the
driver generic, this part of debug codes can be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../hive_isp_css_common/host/input_system.c   |  60 ----
 .../hive_isp_css_include/host/isys_public.h   |  19 --
 .../atomisp/pci/isp2400_input_system_local.h  |  17 --
 .../atomisp/pci/isp2400_input_system_public.h |   4 -
 .../atomisp/pci/isp2401_input_system_local.h  |  10 +-
 .../pci/isp2401_input_system_private.h        | 108 --------
 .../runtime/debug/interface/ia_css_debug.h    |   6 -
 .../pci/runtime/debug/src/ia_css_debug.c      | 256 ------------------
 drivers/staging/media/atomisp/pci/sh_css.c    |   2 -
 9 files changed, 1 insertion(+), 481 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 712e01c37870..09aca4e3db22 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -116,66 +116,6 @@ static void input_switch_cfg(
     const input_switch_cfg_t *const cfg
 );
 
-void input_system_get_state(
-    const input_system_ID_t			ID,
-    input_system_state_t			*state)
-{
-	sub_system_ID_t	sub_id;
-
-	assert(ID < N_INPUT_SYSTEM_ID);
-	assert(state);
-
-	state->str_multicastA_sel = input_system_sub_system_reg_load(ID,
-				    GPREGS_UNIT0_ID,
-				    HIVE_ISYS_GPREG_MULTICAST_A_IDX);
-	state->str_multicastB_sel = input_system_sub_system_reg_load(ID,
-				    GPREGS_UNIT0_ID,
-				    HIVE_ISYS_GPREG_MULTICAST_B_IDX);
-	state->str_multicastC_sel = input_system_sub_system_reg_load(ID,
-				    GPREGS_UNIT0_ID,
-				    HIVE_ISYS_GPREG_MULTICAST_C_IDX);
-	state->str_mux_sel = input_system_sub_system_reg_load(ID,
-			     GPREGS_UNIT0_ID,
-			     HIVE_ISYS_GPREG_MUX_IDX);
-	state->str_mon_status = input_system_sub_system_reg_load(ID,
-				GPREGS_UNIT0_ID,
-				HIVE_ISYS_GPREG_STRMON_STAT_IDX);
-	state->str_mon_irq_cond = input_system_sub_system_reg_load(ID,
-				  GPREGS_UNIT0_ID,
-				  HIVE_ISYS_GPREG_STRMON_COND_IDX);
-	state->str_mon_irq_en = input_system_sub_system_reg_load(ID,
-				GPREGS_UNIT0_ID,
-				HIVE_ISYS_GPREG_STRMON_IRQ_EN_IDX);
-	state->isys_srst = input_system_sub_system_reg_load(ID,
-			   GPREGS_UNIT0_ID,
-			   HIVE_ISYS_GPREG_SRST_IDX);
-	state->isys_slv_reg_srst = input_system_sub_system_reg_load(ID,
-				   GPREGS_UNIT0_ID,
-				   HIVE_ISYS_GPREG_SLV_REG_SRST_IDX);
-	state->str_deint_portA_cnt = input_system_sub_system_reg_load(ID,
-				     GPREGS_UNIT0_ID,
-				     HIVE_ISYS_GPREG_REG_PORT_A_IDX);
-	state->str_deint_portB_cnt = input_system_sub_system_reg_load(ID,
-				     GPREGS_UNIT0_ID,
-				     HIVE_ISYS_GPREG_REG_PORT_B_IDX);
-
-	for (sub_id = CAPTURE_UNIT0_ID; sub_id < CAPTURE_UNIT0_ID + N_CAPTURE_UNIT_ID;
-	     sub_id++) {
-		capture_unit_get_state(ID, sub_id,
-				       &state->capture_unit[sub_id - CAPTURE_UNIT0_ID]);
-	}
-	for (sub_id = ACQUISITION_UNIT0_ID;
-	     sub_id < ACQUISITION_UNIT0_ID + N_ACQUISITION_UNIT_ID; sub_id++) {
-		acquisition_unit_get_state(ID, sub_id,
-					   &state->acquisition_unit[sub_id - ACQUISITION_UNIT0_ID]);
-	}
-	for (sub_id = CTRL_UNIT0_ID; sub_id < CTRL_UNIT0_ID + N_CTRL_UNIT_ID;
-	     sub_id++) {
-		ctrl_unit_get_state(ID, sub_id,
-				    &state->ctrl_unit_state[sub_id - CTRL_UNIT0_ID]);
-	}
-}
-
 void receiver_get_state(
     const rx_ID_t				ID,
     receiver_state_t			*state)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
index dac53e324118..9dacef7a5cc1 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
@@ -16,23 +16,4 @@
 #ifndef __ISYS_PUBLIC_H_INCLUDED__
 #define __ISYS_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
-/*! Read the state of INPUT_SYSTEM[ID]
- \param ID[in]		INPUT_SYSTEM identifier
- \param state[out]	pointer to input system state structure
- \return none, state = INPUT_SYSTEM[ID].state
- */
-STORAGE_CLASS_INPUT_SYSTEM_H input_system_err_t input_system_get_state(
-    const input_system_ID_t	ID,
-    input_system_state_t *state);
-/*! Dump the state of INPUT_SYSTEM[ID]
- \param ID[in]		INPUT_SYSTEM identifier
- \param state[in]	pointer to input system state structure
- \return none
- \depends on host supplied print function as part of ia_css_init()
- */
-STORAGE_CLASS_INPUT_SYSTEM_H void input_system_dump_state(
-    const input_system_ID_t	ID,
-    input_system_state_t *state);
-#endif /* ISP2401 */
 #endif /* __ISYS_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index c3ae5014a039..8701abc4c991 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -306,23 +306,6 @@ struct ctrl_unit_state_s {
 	int	capt_reserve_one_mem_region;
 };
 
-struct input_system_state_s {
-	int	str_multicastA_sel;
-	int	str_multicastB_sel;
-	int	str_multicastC_sel;
-	int	str_mux_sel;
-	int	str_mon_status;
-	int	str_mon_irq_cond;
-	int	str_mon_irq_en;
-	int	isys_srst;
-	int	isys_slv_reg_srst;
-	int	str_deint_portA_cnt;
-	int	str_deint_portB_cnt;
-	struct capture_unit_state_s		capture_unit[N_CAPTURE_UNIT_ID];
-	struct acquisition_unit_state_s	acquisition_unit[N_ACQUISITION_UNIT_ID];
-	struct ctrl_unit_state_s		ctrl_unit_state[N_CTRL_UNIT_ID];
-};
-
 struct mipi_port_state_s {
 	int	device_ready;
 	int	irq_status;
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 85cb61e34192..ad7448744519 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -21,7 +21,6 @@
 #include "isys_public.h"
 #else
 
-typedef struct input_system_state_s		input_system_state_t;
 typedef struct receiver_state_s			receiver_state_t;
 
 /*! Read the state of INPUT_SYSTEM[ID]
@@ -31,9 +30,6 @@ typedef struct receiver_state_s			receiver_state_t;
 
  \return none, state = INPUT_SYSTEM[ID].state
  */
-void input_system_get_state(
-    const input_system_ID_t		ID,
-    input_system_state_t		*state);
 
 /*! Read the state of RECEIVER[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
index 74bfa10e670e..7c7297b9c146 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
@@ -66,13 +66,5 @@ typedef enum {
 
 /* The number of stores for compressed format types */
 #define	N_MIPI_COMPRESSOR_CONTEXT	(N_RX_CHANNEL_ID * N_MIPI_FORMAT_CUSTOM)
-typedef struct input_system_state_s	input_system_state_t;
-struct input_system_state_s {
-	ibuf_ctrl_state_t	ibuf_ctrl_state[N_IBUF_CTRL_ID];
-	csi_rx_fe_ctrl_state_t	csi_rx_fe_ctrl_state[N_CSI_RX_FRONTEND_ID];
-	csi_rx_be_ctrl_state_t	csi_rx_be_ctrl_state[N_CSI_RX_BACKEND_ID];
-	pixelgen_ctrl_state_t	pixelgen_ctrl_state[N_PIXELGEN_ID];
-	stream2mmio_state_t	stream2mmio_state[N_STREAM2MMIO_ID];
-	isys_irqc_state_t	isys_irqc_state[N_ISYS_IRQ_ID];
-};
+
 #endif /* __INPUT_SYSTEM_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
index e4c76428f6dd..f3fdd9a2a5e6 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
@@ -231,112 +231,4 @@ static inline void ibuf_ctrl_dump_state(const ibuf_ctrl_ID_t ID,
 	}
 }
 
-static inline input_system_err_t
-input_system_get_state(const input_system_ID_t ID,
-		       input_system_state_t *state)
-{
-	u32 i;
-
-	(void)(ID);
-
-	/*  get the states of all CSI RX frontend devices */
-	for (i = 0; i < N_CSI_RX_FRONTEND_ID; i++) {
-		csi_rx_fe_ctrl_get_state(
-		    (csi_rx_frontend_ID_t)i,
-		    &state->csi_rx_fe_ctrl_state[i]);
-	}
-
-	/*  get the states of all CIS RX backend devices */
-	for (i = 0; i < N_CSI_RX_BACKEND_ID; i++) {
-		csi_rx_be_ctrl_get_state(
-		    (csi_rx_backend_ID_t)i,
-		    &state->csi_rx_be_ctrl_state[i]);
-	}
-
-	/* get the states of all pixelgen devices */
-	for (i = 0; i < N_PIXELGEN_ID; i++) {
-		pixelgen_ctrl_get_state(
-		    (pixelgen_ID_t)i,
-		    &state->pixelgen_ctrl_state[i]);
-	}
-
-	/* get the states of all stream2mmio devices */
-	for (i = 0; i < N_STREAM2MMIO_ID; i++) {
-		stream2mmio_get_state(
-		    (stream2mmio_ID_t)i,
-		    &state->stream2mmio_state[i]);
-	}
-
-	/* get the states of all ibuf-controller devices */
-	for (i = 0; i < N_IBUF_CTRL_ID; i++) {
-		ibuf_ctrl_get_state(
-		    (ibuf_ctrl_ID_t)i,
-		    &state->ibuf_ctrl_state[i]);
-	}
-
-	/* get the states of all isys irq controllers */
-	for (i = 0; i < N_ISYS_IRQ_ID; i++) {
-		isys_irqc_state_get((isys_irq_ID_t)i, &state->isys_irqc_state[i]);
-	}
-
-	/* TODO: get the states of all ISYS2401 DMA devices  */
-	for (i = 0; i < N_ISYS2401_DMA_ID; i++) {
-	}
-
-	return INPUT_SYSTEM_ERR_NO_ERROR;
-}
-
-static inline void input_system_dump_state(const input_system_ID_t ID,
-					   input_system_state_t *state)
-{
-	u32 i;
-
-	(void)(ID);
-
-	/*  dump the states of all CSI RX frontend devices */
-	for (i = 0; i < N_CSI_RX_FRONTEND_ID; i++) {
-		csi_rx_fe_ctrl_dump_state(
-		    (csi_rx_frontend_ID_t)i,
-		    &state->csi_rx_fe_ctrl_state[i]);
-	}
-
-	/*  dump the states of all CIS RX backend devices */
-	for (i = 0; i < N_CSI_RX_BACKEND_ID; i++) {
-		csi_rx_be_ctrl_dump_state(
-		    (csi_rx_backend_ID_t)i,
-		    &state->csi_rx_be_ctrl_state[i]);
-	}
-
-	/* dump the states of all pixelgen devices */
-	for (i = 0; i < N_PIXELGEN_ID; i++) {
-		pixelgen_ctrl_dump_state(
-		    (pixelgen_ID_t)i,
-		    &state->pixelgen_ctrl_state[i]);
-	}
-
-	/* dump the states of all st2mmio devices */
-	for (i = 0; i < N_STREAM2MMIO_ID; i++) {
-		stream2mmio_dump_state(
-		    (stream2mmio_ID_t)i,
-		    &state->stream2mmio_state[i]);
-	}
-
-	/* dump the states of all ibuf-controller devices */
-	for (i = 0; i < N_IBUF_CTRL_ID; i++) {
-		ibuf_ctrl_dump_state(
-		    (ibuf_ctrl_ID_t)i,
-		    &state->ibuf_ctrl_state[i]);
-	}
-
-	/* dump the states of all isys irq controllers */
-	for (i = 0; i < N_ISYS_IRQ_ID; i++) {
-		isys_irqc_state_dump((isys_irq_ID_t)i, &state->isys_irqc_state[i]);
-	}
-
-	/* TODO: dump the states of all ISYS2401 DMA devices  */
-	for (i = 0; i < N_ISYS2401_DMA_ID; i++) {
-	}
-
-	return;
-}
 #endif /* __INPUT_SYSTEM_PRIVATE_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index efa136294836..b74ab50ea01e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -261,12 +261,6 @@ void ia_css_debug_dump_all_fifo_state(void);
  */
 void ia_css_debug_dump_rx_state(void);
 
-/*! @brief Dump the input system state to the output
- * Dumps the input system state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_isys_state(void);
-
 /*! @brief Dump the frame info to the trace output
  * Dumps the frame info to tracing output.
  * @param[in]	frame		pointer to struct ia_css_frame
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index cf66a40bd6a4..d40ed9c60f1d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1799,258 +1799,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 	return;
 }
 
-#if !defined(ISP2401)
-static void debug_print_isys_capture_unit_state(capture_unit_state_t *state)
-{
-	assert(state);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Packet_Length", state->Packet_Length);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Received_Length", state->Received_Length);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Received_Short_Packets",
-			    state->Received_Short_Packets);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Received_Long_Packets",
-			    state->Received_Long_Packets);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Last_Command", state->Last_Command);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Next_Command", state->Next_Command);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Last_Acknowledge", state->Last_Acknowledge);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Next_Acknowledge", state->Next_Acknowledge);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM_State_Info", state->FSM_State_Info);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "StartMode", state->StartMode);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Start_Addr", state->Start_Addr);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Mem_Region_Size", state->Mem_Region_Size);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Num_Mem_Regions", state->Num_Mem_Regions);
-	return;
-}
-
-static void debug_print_isys_acquisition_unit_state(
-    acquisition_unit_state_t *state)
-{
-	assert(state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Received_Short_Packets",
-			    state->Received_Short_Packets);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Received_Long_Packets",
-			    state->Received_Long_Packets);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Last_Command", state->Last_Command);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Next_Command", state->Next_Command);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Last_Acknowledge", state->Last_Acknowledge);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Next_Acknowledge", state->Next_Acknowledge);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM_State_Info", state->FSM_State_Info);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Int_Cntr_Info", state->Int_Cntr_Info);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Start_Addr", state->Start_Addr);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Mem_Region_Size", state->Mem_Region_Size);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Num_Mem_Regions", state->Num_Mem_Regions);
-}
-
-static void debug_print_isys_ctrl_unit_state(ctrl_unit_state_t *state)
-{
-	assert(state);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "last_cmd", state->last_cmd);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "next_cmd", state->next_cmd);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "last_ack", state->last_ack);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "next_ack", state->next_ack);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "top_fsm_state", state->top_fsm_state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captA_fsm_state", state->captA_fsm_state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captB_fsm_state", state->captB_fsm_state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captC_fsm_state", state->captC_fsm_state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "acq_fsm_state", state->acq_fsm_state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captA_start_addr", state->captA_start_addr);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captB_start_addr", state->captB_start_addr);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captC_start_addr", state->captC_start_addr);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captA_mem_region_size",
-			    state->captA_mem_region_size);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captB_mem_region_size",
-			    state->captB_mem_region_size);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captC_mem_region_size",
-			    state->captC_mem_region_size);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captA_num_mem_regions",
-			    state->captA_num_mem_regions);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captB_num_mem_regions",
-			    state->captB_num_mem_regions);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "captC_num_mem_regions",
-			    state->captC_num_mem_regions);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "acq_start_addr", state->acq_start_addr);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "acq_mem_region_size", state->acq_mem_region_size);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "acq_num_mem_regions", state->acq_num_mem_regions);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "capt_reserve_one_mem_region",
-			    state->capt_reserve_one_mem_region);
-
-	return;
-}
-
-static void debug_print_isys_state(input_system_state_t *state)
-{
-	int i;
-
-	assert(state);
-	ia_css_debug_dtrace(2, "InputSystem State:\n");
-
-	/* configuration */
-	ia_css_debug_dtrace(2, "\tConfiguration:\n");
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_multiCastA_sel", state->str_multicastA_sel);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_multicastB_sel", state->str_multicastB_sel);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_multicastC_sel", state->str_multicastC_sel);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_mux_sel", state->str_mux_sel);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_mon_status", state->str_mon_status);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_mon_irq_cond", state->str_mon_irq_cond);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_mon_irq_en", state->str_mon_irq_en);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "isys_srst", state->isys_srst);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "isys_slv_reg_srst", state->isys_slv_reg_srst);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_deint_portA_cnt", state->str_deint_portA_cnt);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "str_deint_portB_cnd", state->str_deint_portB_cnt);
-	/* end of configuration */
-
-	/* capture unit state */
-	for (i = 0; i < N_CAPTURE_UNIT_ID; i++) {
-		capture_unit_state_t *capture_unit_state;
-
-		ia_css_debug_dtrace(2, "\tCaptureUnit %d State:\n", i);
-
-		capture_unit_state = &state->capture_unit[i];
-		debug_print_isys_capture_unit_state(capture_unit_state);
-	}
-	/* end of capture unit state */
-
-	/* acquisition unit state */
-	for (i = 0; i < N_ACQUISITION_UNIT_ID; i++) {
-		acquisition_unit_state_t *acquisition_unit_state;
-
-		ia_css_debug_dtrace(2, "\tAcquisitionUnit %d State:\n", i);
-
-		acquisition_unit_state = &state->acquisition_unit[i];
-		debug_print_isys_acquisition_unit_state(acquisition_unit_state);
-	}
-	/* end of acquisition unit state */
-
-	/* control unit state */
-	for (i = 0; i < N_CTRL_UNIT_ID; i++) {
-		ia_css_debug_dtrace(2, "\tControlUnit %d State:\n", i);
-
-		debug_print_isys_ctrl_unit_state(&state->ctrl_unit_state[i]);
-	}
-	/* end of control unit state */
-}
-#endif
-
-void ia_css_debug_dump_isys_state(void)
-{
-	static input_system_state_t state;
-
-	input_system_get_state(INPUT_SYSTEM0_ID, &state);
-
-#ifndef ISP2401
-	debug_print_isys_state(&state);
-#else
-	input_system_dump_state(INPUT_SYSTEM0_ID, &state);
-#endif
-}
-
 void ia_css_debug_dump_debug_info(const char *context)
 {
 	if (!context)
@@ -2075,8 +1823,6 @@ void ia_css_debug_dump_debug_info(const char *context)
 	if (!IS_ISP2401) {
 		struct irq_controller_state state;
 
-		ia_css_debug_dump_isys_state();
-
 		irq_controller_get_state(IRQ2_ID, &state);
 
 		ia_css_debug_dtrace(2, "\t%-32s:\n",
@@ -2097,8 +1843,6 @@ void ia_css_debug_dump_debug_info(const char *context)
 		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
 				    "irq_level_not_pulse",
 				    state.irq_level_not_pulse);
-	} else {
-		ia_css_debug_dump_isys_state();
 	}
 
 	ia_css_debug_tagger_state();
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4b3fa6d93fe0..67c581d3c1a6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7623,7 +7623,6 @@ void ia_css_stream_request_flash(struct ia_css_stream *stream)
 		if (!sh_css_write_host2sp_command(host2sp_cmd_start_flash)) {
 			IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
 			ia_css_debug_dump_sp_sw_debug_info();
-			ia_css_debug_dump_debug_info(NULL);
 		}
 	} else {
 		IA_CSS_LOG("SP is not running!");
@@ -9035,7 +9034,6 @@ ia_css_stop_sp(void)
 	if (!sh_css_write_host2sp_command(host2sp_cmd_terminate)) {
 		IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
 		ia_css_debug_dump_sp_sw_debug_info();
-		ia_css_debug_dump_debug_info(NULL);
 	}
 
 	sh_css_sp_set_sp_running(false);
-- 
2.41.0

