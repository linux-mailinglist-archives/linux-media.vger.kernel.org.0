Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA92D77A029
	for <lists+linux-media@lfdr.de>; Sat, 12 Aug 2023 15:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjHLNgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Aug 2023 09:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjHLNgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Aug 2023 09:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB6F1FE1
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691847332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VUF8HwR7F5waM8QJMFBWPvhNq0TVpk5HmYOnQw/c0zU=;
        b=CV5Dc8Gw5Sfjfnj1B1I1ESsL40qJWLdMR6ri5n+juM9l9z0O3o48Ql93IGPFKKNOTvkKhW
        OBQf2laqCrCDspZ/vlJAk1u0YjRJvOsD79LyDOKhLvl0vLIn3uLiUdScIY2s7kEw8JrwpS
        ahpnMfPHqaZofK1XfLy5mzkxStuKIyk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-T87VHGYkOnKuSepYYfFdIQ-1; Sat, 12 Aug 2023 09:35:27 -0400
X-MC-Unique: T87VHGYkOnKuSepYYfFdIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 830A0856F67;
        Sat, 12 Aug 2023 13:35:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5328040C2063;
        Sat, 12 Aug 2023 13:35:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/2] media: atomisp: Drop ia_css_debug_dump_debug_info() and functions only used by it
Date:   Sat, 12 Aug 2023 15:35:22 +0200
Message-ID: <20230812133523.355581-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ia_css_debug_dump_debug_info() is defined but never called anywhere,
drop it.

Also drop all the other ia_css_debug_dump_* functions only called by
ia_css_debug_dump_debug_info(), as well as *_get_state() functions only
used by those.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../pci/hive_isp_css_common/host/dma.c        |  266 ----
 .../pci/hive_isp_css_common/host/dma_local.h  |  116 --
 .../hive_isp_css_common/host/input_system.c   |  371 ------
 .../pci/hive_isp_css_common/host/irq.c        |   19 -
 .../pci/hive_isp_css_common/host/irq_local.h  |    8 -
 .../pci/hive_isp_css_common/host/isp.c        |   60 -
 .../pci/hive_isp_css_common/host/isp_local.h  |   31 -
 .../atomisp/pci/hive_isp_css_common/host/sp.c |   47 -
 .../pci/hive_isp_css_common/host/sp_local.h   |   26 -
 .../hive_isp_css_include/host/dma_public.h    |   13 -
 .../hive_isp_css_include/host/irq_public.h    |   10 -
 .../hive_isp_css_include/host/isp_public.h    |   13 -
 .../pci/hive_isp_css_include/host/sp_public.h |   16 -
 .../atomisp/pci/isp2400_input_system_local.h  |  113 --
 .../atomisp/pci/isp2400_input_system_public.h |   28 -
 .../runtime/debug/interface/ia_css_debug.h    |   67 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 1072 -----------------
 17 files changed, 2276 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
index f85950c471c7..0b6647b2eb76 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
@@ -23,272 +23,6 @@
 #include "dma_private.h"
 #endif /* __INLINE_DMA__ */
 
-void dma_get_state(const dma_ID_t ID, dma_state_t *state)
-{
-	int			i;
-	hrt_data	tmp;
-
-	assert(ID < N_DMA_ID);
-	assert(state);
-
-	tmp = dma_reg_load(ID, DMA_COMMAND_FSM_REG_IDX);
-	//reg  [3:0] : flags error [3], stall, run, idle [0]
-	//reg  [9:4] : command
-	//reg[14:10] : channel
-	//reg [23:15] : param
-	state->fsm_command_idle = tmp & 0x1;
-	state->fsm_command_run = tmp & 0x2;
-	state->fsm_command_stalling = tmp & 0x4;
-	state->fsm_command_error    = tmp & 0x8;
-	state->last_command_channel = (tmp >> 10 & 0x1F);
-	state->last_command_param =  (tmp >> 15 & 0x0F);
-	tmp = (tmp >> 4) & 0x3F;
-	/* state->last_command = (dma_commands_t)tmp; */
-	/* if the enumerator is made non-linear */
-	/* AM: the list below does not cover all the cases*/
-	/*  and these are not correct */
-	/* therefore for just dumpinmg this command*/
-	state->last_command = tmp;
-
-	/*
-		if (tmp == 0)
-			state->last_command = DMA_COMMAND_READ;
-		if (tmp == 1)
-			state->last_command = DMA_COMMAND_WRITE;
-		if (tmp == 2)
-			state->last_command = DMA_COMMAND_SET_CHANNEL;
-		if (tmp == 3)
-			state->last_command = DMA_COMMAND_SET_PARAM;
-		if (tmp == 4)
-			state->last_command = DMA_COMMAND_READ_SPECIFIC;
-		if (tmp == 5)
-			state->last_command = DMA_COMMAND_WRITE_SPECIFIC;
-		if (tmp == 8)
-			state->last_command = DMA_COMMAND_INIT;
-		if (tmp == 12)
-			state->last_command = DMA_COMMAND_INIT_SPECIFIC;
-		if (tmp == 15)
-			state->last_command = DMA_COMMAND_RST;
-	*/
-
-	/* No sub-fields, idx = 0 */
-	state->current_command = dma_reg_load(ID,
-					      DMA_CG_INFO_REG_IDX(0, _DMA_FSM_GROUP_CMD_IDX));
-	state->current_addr_a = dma_reg_load(ID,
-					     DMA_CG_INFO_REG_IDX(0, _DMA_FSM_GROUP_ADDR_A_IDX));
-	state->current_addr_b = dma_reg_load(ID,
-					     DMA_CG_INFO_REG_IDX(0, _DMA_FSM_GROUP_ADDR_B_IDX));
-
-	tmp =  dma_reg_load(ID,
-			    DMA_CG_INFO_REG_IDX(
-				_DMA_FSM_GROUP_FSM_CTRL_STATE_IDX,
-				_DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_idle = tmp & 0x1;
-	state->fsm_ctrl_run = tmp & 0x2;
-	state->fsm_ctrl_stalling = tmp & 0x4;
-	state->fsm_ctrl_error = tmp & 0x8;
-	tmp = tmp >> 4;
-	/* state->fsm_ctrl_state = (dma_ctrl_states_t)tmp; */
-	if (tmp == 0)
-		state->fsm_ctrl_state = DMA_CTRL_STATE_IDLE;
-	if (tmp == 1)
-		state->fsm_ctrl_state = DMA_CTRL_STATE_REQ_RCV;
-	if (tmp == 2)
-		state->fsm_ctrl_state = DMA_CTRL_STATE_RCV;
-	if (tmp == 3)
-		state->fsm_ctrl_state = DMA_CTRL_STATE_RCV_REQ;
-	if (tmp == 4)
-		state->fsm_ctrl_state = DMA_CTRL_STATE_INIT;
-	state->fsm_ctrl_source_dev = dma_reg_load(ID,
-				     DMA_CG_INFO_REG_IDX(
-					 _DMA_FSM_GROUP_FSM_CTRL_REQ_DEV_IDX,
-					 _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_source_addr = dma_reg_load(ID,
-				      DMA_CG_INFO_REG_IDX(
-					  _DMA_FSM_GROUP_FSM_CTRL_REQ_ADDR_IDX,
-					  _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_source_stride = dma_reg_load(ID,
-					DMA_CG_INFO_REG_IDX(
-					    _DMA_FSM_GROUP_FSM_CTRL_REQ_STRIDE_IDX,
-					    _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_source_width = dma_reg_load(ID,
-				       DMA_CG_INFO_REG_IDX(
-					   _DMA_FSM_GROUP_FSM_CTRL_REQ_XB_IDX,
-					   _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_source_height = dma_reg_load(ID,
-					DMA_CG_INFO_REG_IDX(
-					    _DMA_FSM_GROUP_FSM_CTRL_REQ_YB_IDX,
-					    _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_source_dev = dma_reg_load(ID,
-					  DMA_CG_INFO_REG_IDX(
-					      _DMA_FSM_GROUP_FSM_CTRL_PACK_REQ_DEV_IDX,
-					      _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_dest_dev = dma_reg_load(ID,
-					DMA_CG_INFO_REG_IDX(
-					    _DMA_FSM_GROUP_FSM_CTRL_PACK_WR_DEV_IDX,
-					    _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_dest_addr = dma_reg_load(ID,
-				    DMA_CG_INFO_REG_IDX(
-					_DMA_FSM_GROUP_FSM_CTRL_WR_ADDR_IDX,
-					_DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_dest_stride = dma_reg_load(ID,
-				      DMA_CG_INFO_REG_IDX(
-					  _DMA_FSM_GROUP_FSM_CTRL_WR_STRIDE_IDX,
-					  _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_source_width = dma_reg_load(ID,
-					    DMA_CG_INFO_REG_IDX(
-						_DMA_FSM_GROUP_FSM_CTRL_PACK_REQ_XB_IDX,
-						_DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_dest_height = dma_reg_load(ID,
-					   DMA_CG_INFO_REG_IDX(
-					       _DMA_FSM_GROUP_FSM_CTRL_PACK_WR_YB_IDX,
-					       _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_dest_width = dma_reg_load(ID,
-					  DMA_CG_INFO_REG_IDX(
-					      _DMA_FSM_GROUP_FSM_CTRL_PACK_WR_XB_IDX,
-					      _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_source_elems = dma_reg_load(ID,
-					    DMA_CG_INFO_REG_IDX(
-						_DMA_FSM_GROUP_FSM_CTRL_PACK_ELEM_REQ_IDX,
-						_DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_dest_elems = dma_reg_load(ID,
-					  DMA_CG_INFO_REG_IDX(
-					      _DMA_FSM_GROUP_FSM_CTRL_PACK_ELEM_WR_IDX,
-					      _DMA_FSM_GROUP_FSM_CTRL_IDX));
-	state->fsm_ctrl_pack_extension = dma_reg_load(ID,
-					 DMA_CG_INFO_REG_IDX(
-					     _DMA_FSM_GROUP_FSM_CTRL_PACK_S_Z_IDX,
-					     _DMA_FSM_GROUP_FSM_CTRL_IDX));
-
-	tmp = dma_reg_load(ID,
-			   DMA_CG_INFO_REG_IDX(
-			       _DMA_FSM_GROUP_FSM_PACK_STATE_IDX,
-			       _DMA_FSM_GROUP_FSM_PACK_IDX));
-	state->pack_idle     = tmp & 0x1;
-	state->pack_run      = tmp & 0x2;
-	state->pack_stalling = tmp & 0x4;
-	state->pack_error    = tmp & 0x8;
-	state->pack_cnt_height = dma_reg_load(ID,
-					      DMA_CG_INFO_REG_IDX(
-						      _DMA_FSM_GROUP_FSM_PACK_CNT_YB_IDX,
-						      _DMA_FSM_GROUP_FSM_PACK_IDX));
-	state->pack_src_cnt_width = dma_reg_load(ID,
-				    DMA_CG_INFO_REG_IDX(
-					_DMA_FSM_GROUP_FSM_PACK_CNT_XB_REQ_IDX,
-					_DMA_FSM_GROUP_FSM_PACK_IDX));
-	state->pack_dest_cnt_width = dma_reg_load(ID,
-				     DMA_CG_INFO_REG_IDX(
-					 _DMA_FSM_GROUP_FSM_PACK_CNT_XB_WR_IDX,
-					 _DMA_FSM_GROUP_FSM_PACK_IDX));
-
-	tmp = dma_reg_load(ID,
-			   DMA_CG_INFO_REG_IDX(
-			       _DMA_FSM_GROUP_FSM_REQ_STATE_IDX,
-			       _DMA_FSM_GROUP_FSM_REQ_IDX));
-	/* state->read_state = (dma_rw_states_t)tmp; */
-	if (tmp == 0)
-		state->read_state = DMA_RW_STATE_IDLE;
-	if (tmp == 1)
-		state->read_state = DMA_RW_STATE_REQ;
-	if (tmp == 2)
-		state->read_state = DMA_RW_STATE_NEXT_LINE;
-	if (tmp == 3)
-		state->read_state = DMA_RW_STATE_UNLOCK_CHANNEL;
-	state->read_cnt_height = dma_reg_load(ID,
-					      DMA_CG_INFO_REG_IDX(
-						      _DMA_FSM_GROUP_FSM_REQ_CNT_YB_IDX,
-						      _DMA_FSM_GROUP_FSM_REQ_IDX));
-	state->read_cnt_width = dma_reg_load(ID,
-					     DMA_CG_INFO_REG_IDX(
-						     _DMA_FSM_GROUP_FSM_REQ_CNT_XB_IDX,
-						     _DMA_FSM_GROUP_FSM_REQ_IDX));
-
-	tmp = dma_reg_load(ID,
-			   DMA_CG_INFO_REG_IDX(
-			       _DMA_FSM_GROUP_FSM_WR_STATE_IDX,
-			       _DMA_FSM_GROUP_FSM_WR_IDX));
-	/* state->write_state = (dma_rw_states_t)tmp; */
-	if (tmp == 0)
-		state->write_state = DMA_RW_STATE_IDLE;
-	if (tmp == 1)
-		state->write_state = DMA_RW_STATE_REQ;
-	if (tmp == 2)
-		state->write_state = DMA_RW_STATE_NEXT_LINE;
-	if (tmp == 3)
-		state->write_state = DMA_RW_STATE_UNLOCK_CHANNEL;
-	state->write_height = dma_reg_load(ID,
-					   DMA_CG_INFO_REG_IDX(
-					       _DMA_FSM_GROUP_FSM_WR_CNT_YB_IDX,
-					       _DMA_FSM_GROUP_FSM_WR_IDX));
-	state->write_width = dma_reg_load(ID,
-					  DMA_CG_INFO_REG_IDX(
-					      _DMA_FSM_GROUP_FSM_WR_CNT_XB_IDX,
-					      _DMA_FSM_GROUP_FSM_WR_IDX));
-
-	for (i = 0; i < HIVE_ISP_NUM_DMA_CONNS; i++) {
-		dma_port_state_t *port = &state->port_states[i];
-
-		tmp = dma_reg_load(ID, DMA_DEV_INFO_REG_IDX(0, i));
-		port->req_cs   = ((tmp & 0x1) != 0);
-		port->req_we_n = ((tmp & 0x2) != 0);
-		port->req_run  = ((tmp & 0x4) != 0);
-		port->req_ack  = ((tmp & 0x8) != 0);
-
-		tmp = dma_reg_load(ID, DMA_DEV_INFO_REG_IDX(1, i));
-		port->send_cs   = ((tmp & 0x1) != 0);
-		port->send_we_n = ((tmp & 0x2) != 0);
-		port->send_run  = ((tmp & 0x4) != 0);
-		port->send_ack  = ((tmp & 0x8) != 0);
-
-		tmp = dma_reg_load(ID, DMA_DEV_INFO_REG_IDX(2, i));
-		if (tmp & 0x1)
-			port->fifo_state = DMA_FIFO_STATE_WILL_BE_FULL;
-		if (tmp & 0x2)
-			port->fifo_state = DMA_FIFO_STATE_FULL;
-		if (tmp & 0x4)
-			port->fifo_state = DMA_FIFO_STATE_EMPTY;
-		port->fifo_counter = tmp >> 3;
-	}
-
-	for (i = 0; i < HIVE_DMA_NUM_CHANNELS; i++) {
-		dma_channel_state_t *ch = &state->channel_states[i];
-
-		ch->connection = DMA_GET_CONNECTION(dma_reg_load(ID,
-						    DMA_CHANNEL_PARAM_REG_IDX(i,
-							    _DMA_PACKING_SETUP_PARAM)));
-		ch->sign_extend = DMA_GET_EXTENSION(dma_reg_load(ID,
-						    DMA_CHANNEL_PARAM_REG_IDX(i,
-							    _DMA_PACKING_SETUP_PARAM)));
-		ch->height = dma_reg_load(ID,
-					  DMA_CHANNEL_PARAM_REG_IDX(i,
-						  _DMA_HEIGHT_PARAM));
-		ch->stride_a = dma_reg_load(ID,
-					    DMA_CHANNEL_PARAM_REG_IDX(i,
-						    _DMA_STRIDE_A_PARAM));
-		ch->elems_a = DMA_GET_ELEMENTS(dma_reg_load(ID,
-					       DMA_CHANNEL_PARAM_REG_IDX(i,
-						       _DMA_ELEM_CROPPING_A_PARAM)));
-		ch->cropping_a = DMA_GET_CROPPING(dma_reg_load(ID,
-						  DMA_CHANNEL_PARAM_REG_IDX(i,
-							  _DMA_ELEM_CROPPING_A_PARAM)));
-		ch->width_a = dma_reg_load(ID,
-					   DMA_CHANNEL_PARAM_REG_IDX(i,
-						   _DMA_WIDTH_A_PARAM));
-		ch->stride_b = dma_reg_load(ID,
-					    DMA_CHANNEL_PARAM_REG_IDX(i,
-						    _DMA_STRIDE_B_PARAM));
-		ch->elems_b = DMA_GET_ELEMENTS(dma_reg_load(ID,
-					       DMA_CHANNEL_PARAM_REG_IDX(i,
-						       _DMA_ELEM_CROPPING_B_PARAM)));
-		ch->cropping_b = DMA_GET_CROPPING(dma_reg_load(ID,
-						  DMA_CHANNEL_PARAM_REG_IDX(i,
-							  _DMA_ELEM_CROPPING_B_PARAM)));
-		ch->width_b = dma_reg_load(ID,
-					   DMA_CHANNEL_PARAM_REG_IDX(i,
-						   _DMA_WIDTH_B_PARAM));
-	}
-}
-
 void
 dma_set_max_burst_size(const dma_ID_t ID, dma_connection conn,
 		       uint32_t max_burst_size)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
index 7e4cc75733cd..48a1ace79897 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
@@ -89,120 +89,4 @@
 #define DMA_GET_ELEMENTS(val)      _hrt_get_bits(val, _DMA_V2_ELEMENTS_IDX,      _DMA_V2_ELEMENTS_BITS)
 #define DMA_GET_CROPPING(val)      _hrt_get_bits(val, _DMA_V2_LEFT_CROPPING_IDX, _DMA_V2_LEFT_CROPPING_BITS)
 
-typedef enum {
-	DMA_CTRL_STATE_IDLE,
-	DMA_CTRL_STATE_REQ_RCV,
-	DMA_CTRL_STATE_RCV,
-	DMA_CTRL_STATE_RCV_REQ,
-	DMA_CTRL_STATE_INIT,
-	N_DMA_CTRL_STATES
-} dma_ctrl_states_t;
-
-typedef enum {
-	DMA_COMMAND_READ,
-	DMA_COMMAND_WRITE,
-	DMA_COMMAND_SET_CHANNEL,
-	DMA_COMMAND_SET_PARAM,
-	DMA_COMMAND_READ_SPECIFIC,
-	DMA_COMMAND_WRITE_SPECIFIC,
-	DMA_COMMAND_INIT,
-	DMA_COMMAND_INIT_SPECIFIC,
-	DMA_COMMAND_RST,
-	N_DMA_COMMANDS
-} dma_commands_t;
-
-typedef enum {
-	DMA_RW_STATE_IDLE,
-	DMA_RW_STATE_REQ,
-	DMA_RW_STATE_NEXT_LINE,
-	DMA_RW_STATE_UNLOCK_CHANNEL,
-	N_DMA_RW_STATES
-} dma_rw_states_t;
-
-typedef enum {
-	DMA_FIFO_STATE_WILL_BE_FULL,
-	DMA_FIFO_STATE_FULL,
-	DMA_FIFO_STATE_EMPTY,
-	N_DMA_FIFO_STATES
-} dma_fifo_states_t;
-
-/* typedef struct dma_state_s			dma_state_t; */
-typedef struct dma_channel_state_s	dma_channel_state_t;
-typedef struct dma_port_state_s		dma_port_state_t;
-
-struct dma_port_state_s {
-	bool                       req_cs;
-	bool                       req_we_n;
-	bool                       req_run;
-	bool                       req_ack;
-	bool                       send_cs;
-	bool                       send_we_n;
-	bool                       send_run;
-	bool                       send_ack;
-	dma_fifo_states_t          fifo_state;
-	int                        fifo_counter;
-};
-
-struct dma_channel_state_s {
-	int                        connection;
-	bool                       sign_extend;
-	int                        height;
-	int                        stride_a;
-	int                        elems_a;
-	int                        cropping_a;
-	int                        width_a;
-	int                        stride_b;
-	int                        elems_b;
-	int                        cropping_b;
-	int                        width_b;
-};
-
-struct dma_state_s {
-	bool                       fsm_command_idle;
-	bool                       fsm_command_run;
-	bool                       fsm_command_stalling;
-	bool                       fsm_command_error;
-	dma_commands_t             last_command;
-	int                        last_command_channel;
-	int                        last_command_param;
-	dma_commands_t             current_command;
-	int                        current_addr_a;
-	int                        current_addr_b;
-	bool                       fsm_ctrl_idle;
-	bool                       fsm_ctrl_run;
-	bool                       fsm_ctrl_stalling;
-	bool                       fsm_ctrl_error;
-	dma_ctrl_states_t          fsm_ctrl_state;
-	int                        fsm_ctrl_source_dev;
-	int                        fsm_ctrl_source_addr;
-	int                        fsm_ctrl_source_stride;
-	int                        fsm_ctrl_source_width;
-	int                        fsm_ctrl_source_height;
-	int                        fsm_ctrl_pack_source_dev;
-	int                        fsm_ctrl_pack_dest_dev;
-	int                        fsm_ctrl_dest_addr;
-	int                        fsm_ctrl_dest_stride;
-	int                        fsm_ctrl_pack_source_width;
-	int                        fsm_ctrl_pack_dest_height;
-	int                        fsm_ctrl_pack_dest_width;
-	int                        fsm_ctrl_pack_source_elems;
-	int                        fsm_ctrl_pack_dest_elems;
-	int                        fsm_ctrl_pack_extension;
-	int						   pack_idle;
-	int			       pack_run;
-	int				   pack_stalling;
-	int				   pack_error;
-	int                        pack_cnt_height;
-	int                        pack_src_cnt_width;
-	int                        pack_dest_cnt_width;
-	dma_rw_states_t            read_state;
-	int                        read_cnt_height;
-	int                        read_cnt_width;
-	dma_rw_states_t            write_state;
-	int                        write_height;
-	int                        write_width;
-	dma_port_state_t           port_states[HIVE_ISP_NUM_DMA_CONNS];
-	dma_channel_state_t        channel_states[HIVE_DMA_NUM_CHANNELS];
-};
-
 #endif /* __DMA_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index c60f0d5b01c6..ca1ce6689034 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -79,31 +79,6 @@ static input_system_err_t input_system_multiplexer_cfg(
     const input_system_multiplex_t			rhs,
     input_system_config_flags_t *const flags);
 
-static inline void capture_unit_get_state(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    capture_unit_state_t			*state);
-
-static inline void acquisition_unit_get_state(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    acquisition_unit_state_t		*state);
-
-static inline void ctrl_unit_get_state(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    ctrl_unit_state_t				*state);
-
-static inline void mipi_port_get_state(
-    const rx_ID_t					ID,
-    const enum mipi_port_id			port_ID,
-    mipi_port_state_t				*state);
-
-static inline void rx_channel_get_state(
-    const rx_ID_t					ID,
-    const unsigned int				ch_id,
-    rx_channel_state_t				*state);
-
 static void gp_device_rst(const gp_device_ID_t		ID);
 
 static void input_selector_cfg_for_sensor(const gp_device_ID_t	ID);
@@ -115,76 +90,6 @@ static void input_switch_cfg(
     const input_switch_cfg_t *const cfg
 );
 
-void receiver_get_state(
-    const rx_ID_t				ID,
-    receiver_state_t			*state)
-{
-	enum mipi_port_id	port_id;
-	unsigned int	ch_id;
-
-	assert(ID < N_RX_ID);
-	assert(state);
-
-	state->fs_to_ls_delay = (uint8_t)receiver_reg_load(ID,
-				_HRT_CSS_RECEIVER_FS_TO_LS_DELAY_REG_IDX);
-	state->ls_to_data_delay = (uint8_t)receiver_reg_load(ID,
-				  _HRT_CSS_RECEIVER_LS_TO_DATA_DELAY_REG_IDX);
-	state->data_to_le_delay = (uint8_t)receiver_reg_load(ID,
-				  _HRT_CSS_RECEIVER_DATA_TO_LE_DELAY_REG_IDX);
-	state->le_to_fe_delay = (uint8_t)receiver_reg_load(ID,
-				_HRT_CSS_RECEIVER_LE_TO_FE_DELAY_REG_IDX);
-	state->fe_to_fs_delay = (uint8_t)receiver_reg_load(ID,
-				_HRT_CSS_RECEIVER_FE_TO_FS_DELAY_REG_IDX);
-	state->le_to_fs_delay = (uint8_t)receiver_reg_load(ID,
-				_HRT_CSS_RECEIVER_LE_TO_LS_DELAY_REG_IDX);
-	state->is_two_ppc = (bool)receiver_reg_load(ID,
-			    _HRT_CSS_RECEIVER_TWO_PIXEL_EN_REG_IDX);
-	state->backend_rst = receiver_reg_load(ID,
-					       _HRT_CSS_RECEIVER_BACKEND_RST_REG_IDX);
-	state->raw18 = (uint16_t)receiver_reg_load(ID,
-		       _HRT_CSS_RECEIVER_RAW18_REG_IDX);
-	state->force_raw8 = (bool)receiver_reg_load(ID,
-			    _HRT_CSS_RECEIVER_FORCE_RAW8_REG_IDX);
-	state->raw16 = (uint16_t)receiver_reg_load(ID,
-		       _HRT_CSS_RECEIVER_RAW16_REG_IDX);
-
-	for (port_id = (enum mipi_port_id)0; port_id < N_MIPI_PORT_ID; port_id++) {
-		mipi_port_get_state(ID, port_id,
-				    &state->mipi_port_state[port_id]);
-	}
-	for (ch_id = 0U; ch_id < N_RX_CHANNEL_ID; ch_id++) {
-		rx_channel_get_state(ID, ch_id,
-				     &state->rx_channel_state[ch_id]);
-	}
-
-	state->be_gsp_acc_ovl = receiver_reg_load(ID,
-				_HRT_CSS_RECEIVER_BE_GSP_ACC_OVL_REG_IDX);
-	state->be_srst = receiver_reg_load(ID,
-					   _HRT_CSS_RECEIVER_BE_SRST_REG_IDX);
-	state->be_is_two_ppc = receiver_reg_load(ID,
-			       _HRT_CSS_RECEIVER_BE_TWO_PPC_REG_IDX);
-	state->be_comp_format0 = receiver_reg_load(ID,
-				 _HRT_CSS_RECEIVER_BE_COMP_FORMAT_REG0_IDX);
-	state->be_comp_format1 = receiver_reg_load(ID,
-				 _HRT_CSS_RECEIVER_BE_COMP_FORMAT_REG1_IDX);
-	state->be_comp_format2 = receiver_reg_load(ID,
-				 _HRT_CSS_RECEIVER_BE_COMP_FORMAT_REG2_IDX);
-	state->be_comp_format3 = receiver_reg_load(ID,
-				 _HRT_CSS_RECEIVER_BE_COMP_FORMAT_REG3_IDX);
-	state->be_sel = receiver_reg_load(ID,
-					  _HRT_CSS_RECEIVER_BE_SEL_REG_IDX);
-	state->be_raw16_config = receiver_reg_load(ID,
-				 _HRT_CSS_RECEIVER_BE_RAW16_CONFIG_REG_IDX);
-	state->be_raw18_config = receiver_reg_load(ID,
-				 _HRT_CSS_RECEIVER_BE_RAW18_CONFIG_REG_IDX);
-	state->be_force_raw8 = receiver_reg_load(ID,
-			       _HRT_CSS_RECEIVER_BE_FORCE_RAW8_REG_IDX);
-	state->be_irq_status = receiver_reg_load(ID,
-			       _HRT_CSS_RECEIVER_BE_IRQ_STATUS_REG_IDX);
-	state->be_irq_clear = receiver_reg_load(ID,
-						_HRT_CSS_RECEIVER_BE_IRQ_CLEAR_REG_IDX);
-}
-
 void receiver_set_compression(
     const rx_ID_t			ID,
     const unsigned int		cfg_ID,
@@ -287,282 +192,6 @@ void receiver_irq_clear(
 				port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX, irq_info);
 }
 
-static inline void capture_unit_get_state(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    capture_unit_state_t			*state)
-{
-	assert(/*(sub_id >= CAPTURE_UNIT0_ID) &&*/ (sub_id <= CAPTURE_UNIT2_ID));
-	assert(state);
-
-	state->StartMode = input_system_sub_system_reg_load(ID,
-			   sub_id,
-			   CAPT_START_MODE_REG_ID);
-	state->Start_Addr = input_system_sub_system_reg_load(ID,
-			    sub_id,
-			    CAPT_START_ADDR_REG_ID);
-	state->Mem_Region_Size = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 CAPT_MEM_REGION_SIZE_REG_ID);
-	state->Num_Mem_Regions = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 CAPT_NUM_MEM_REGIONS_REG_ID);
-//	AM: Illegal read from following registers.
-	/*	state->Init = input_system_sub_system_reg_load(ID,
-			sub_id,
-			CAPT_INIT_REG_ID);
-		state->Start = input_system_sub_system_reg_load(ID,
-			sub_id,
-			CAPT_START_REG_ID);
-		state->Stop = input_system_sub_system_reg_load(ID,
-			sub_id,
-			CAPT_STOP_REG_ID);
-	*/
-	state->Packet_Length = input_system_sub_system_reg_load(ID,
-			       sub_id,
-			       CAPT_PACKET_LENGTH_REG_ID);
-	state->Received_Length = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 CAPT_RECEIVED_LENGTH_REG_ID);
-	state->Received_Short_Packets = input_system_sub_system_reg_load(ID,
-					sub_id,
-					CAPT_RECEIVED_SHORT_PACKETS_REG_ID);
-	state->Received_Long_Packets = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       CAPT_RECEIVED_LONG_PACKETS_REG_ID);
-	state->Last_Command = input_system_sub_system_reg_load(ID,
-			      sub_id,
-			      CAPT_LAST_COMMAND_REG_ID);
-	state->Next_Command = input_system_sub_system_reg_load(ID,
-			      sub_id,
-			      CAPT_NEXT_COMMAND_REG_ID);
-	state->Last_Acknowledge = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  CAPT_LAST_ACKNOWLEDGE_REG_ID);
-	state->Next_Acknowledge = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  CAPT_NEXT_ACKNOWLEDGE_REG_ID);
-	state->FSM_State_Info = input_system_sub_system_reg_load(ID,
-				sub_id,
-				CAPT_FSM_STATE_INFO_REG_ID);
-}
-
-static inline void acquisition_unit_get_state(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    acquisition_unit_state_t		*state)
-{
-	assert(sub_id == ACQUISITION_UNIT0_ID);
-	assert(state);
-
-	state->Start_Addr = input_system_sub_system_reg_load(ID,
-			    sub_id,
-			    ACQ_START_ADDR_REG_ID);
-	state->Mem_Region_Size = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 ACQ_MEM_REGION_SIZE_REG_ID);
-	state->Num_Mem_Regions = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 ACQ_NUM_MEM_REGIONS_REG_ID);
-//	AM: Illegal read from following registers.
-	/*	state->Init = input_system_sub_system_reg_load(ID,
-			sub_id,
-			ACQ_INIT_REG_ID);
-	*/
-	state->Received_Short_Packets = input_system_sub_system_reg_load(ID,
-					sub_id,
-					ACQ_RECEIVED_SHORT_PACKETS_REG_ID);
-	state->Received_Long_Packets = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ACQ_RECEIVED_LONG_PACKETS_REG_ID);
-	state->Last_Command = input_system_sub_system_reg_load(ID,
-			      sub_id,
-			      ACQ_LAST_COMMAND_REG_ID);
-	state->Next_Command = input_system_sub_system_reg_load(ID,
-			      sub_id,
-			      ACQ_NEXT_COMMAND_REG_ID);
-	state->Last_Acknowledge = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  ACQ_LAST_ACKNOWLEDGE_REG_ID);
-	state->Next_Acknowledge = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  ACQ_NEXT_ACKNOWLEDGE_REG_ID);
-	state->FSM_State_Info = input_system_sub_system_reg_load(ID,
-				sub_id,
-				ACQ_FSM_STATE_INFO_REG_ID);
-	state->Int_Cntr_Info = input_system_sub_system_reg_load(ID,
-			       sub_id,
-			       ACQ_INT_CNTR_INFO_REG_ID);
-}
-
-static inline void ctrl_unit_get_state(
-    const input_system_ID_t			ID,
-    const sub_system_ID_t			sub_id,
-    ctrl_unit_state_t			*state)
-{
-	assert(sub_id == CTRL_UNIT0_ID);
-	assert(state);
-
-	state->captA_start_addr = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  ISYS_CTRL_CAPT_START_ADDR_A_REG_ID);
-	state->captB_start_addr = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  ISYS_CTRL_CAPT_START_ADDR_B_REG_ID);
-	state->captC_start_addr = input_system_sub_system_reg_load(ID,
-				  sub_id,
-				  ISYS_CTRL_CAPT_START_ADDR_C_REG_ID);
-	state->captA_mem_region_size = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ISYS_CTRL_CAPT_MEM_REGION_SIZE_A_REG_ID);
-	state->captB_mem_region_size = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ISYS_CTRL_CAPT_MEM_REGION_SIZE_B_REG_ID);
-	state->captC_mem_region_size = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ISYS_CTRL_CAPT_MEM_REGION_SIZE_C_REG_ID);
-	state->captA_num_mem_regions = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ISYS_CTRL_CAPT_NUM_MEM_REGIONS_A_REG_ID);
-	state->captB_num_mem_regions = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ISYS_CTRL_CAPT_NUM_MEM_REGIONS_B_REG_ID);
-	state->captC_num_mem_regions = input_system_sub_system_reg_load(ID,
-				       sub_id,
-				       ISYS_CTRL_CAPT_NUM_MEM_REGIONS_C_REG_ID);
-	state->acq_start_addr = input_system_sub_system_reg_load(ID,
-				sub_id,
-				ISYS_CTRL_ACQ_START_ADDR_REG_ID);
-	state->acq_mem_region_size = input_system_sub_system_reg_load(ID,
-				     sub_id,
-				     ISYS_CTRL_ACQ_MEM_REGION_SIZE_REG_ID);
-	state->acq_num_mem_regions = input_system_sub_system_reg_load(ID,
-				     sub_id,
-				     ISYS_CTRL_ACQ_NUM_MEM_REGIONS_REG_ID);
-//	AM: Illegal read from following registers.
-	/*	state->ctrl_init = input_system_sub_system_reg_load(ID,
-			sub_id,
-			ISYS_CTRL_INIT_REG_ID);
-	*/
-	state->last_cmd = input_system_sub_system_reg_load(ID,
-			  sub_id,
-			  ISYS_CTRL_LAST_COMMAND_REG_ID);
-	state->next_cmd = input_system_sub_system_reg_load(ID,
-			  sub_id,
-			  ISYS_CTRL_NEXT_COMMAND_REG_ID);
-	state->last_ack = input_system_sub_system_reg_load(ID,
-			  sub_id,
-			  ISYS_CTRL_LAST_ACKNOWLEDGE_REG_ID);
-	state->next_ack = input_system_sub_system_reg_load(ID,
-			  sub_id,
-			  ISYS_CTRL_NEXT_ACKNOWLEDGE_REG_ID);
-	state->top_fsm_state = input_system_sub_system_reg_load(ID,
-			       sub_id,
-			       ISYS_CTRL_FSM_STATE_INFO_REG_ID);
-	state->captA_fsm_state = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 ISYS_CTRL_CAPT_A_FSM_STATE_INFO_REG_ID);
-	state->captB_fsm_state = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 ISYS_CTRL_CAPT_B_FSM_STATE_INFO_REG_ID);
-	state->captC_fsm_state = input_system_sub_system_reg_load(ID,
-				 sub_id,
-				 ISYS_CTRL_CAPT_C_FSM_STATE_INFO_REG_ID);
-	state->acq_fsm_state = input_system_sub_system_reg_load(ID,
-			       sub_id,
-			       ISYS_CTRL_ACQ_FSM_STATE_INFO_REG_ID);
-	state->capt_reserve_one_mem_region = input_system_sub_system_reg_load(ID,
-					     sub_id,
-					     ISYS_CTRL_CAPT_RESERVE_ONE_MEM_REGION_REG_ID);
-}
-
-static inline void mipi_port_get_state(
-    const rx_ID_t				ID,
-    const enum mipi_port_id			port_ID,
-    mipi_port_state_t			*state)
-{
-	int	i;
-
-	assert(ID < N_RX_ID);
-	assert(port_ID < N_MIPI_PORT_ID);
-	assert(state);
-
-	state->device_ready = receiver_port_reg_load(ID,
-			      port_ID, _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
-	state->irq_status = receiver_port_reg_load(ID,
-			    port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX);
-	state->irq_enable = receiver_port_reg_load(ID,
-			    port_ID, _HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX);
-	state->timeout_count = receiver_port_reg_load(ID,
-			       port_ID, _HRT_CSS_RECEIVER_TIMEOUT_COUNT_REG_IDX);
-	state->init_count = (uint16_t)receiver_port_reg_load(ID,
-			    port_ID, _HRT_CSS_RECEIVER_INIT_COUNT_REG_IDX);
-	state->raw16_18 = (uint16_t)receiver_port_reg_load(ID,
-			  port_ID, _HRT_CSS_RECEIVER_RAW16_18_DATAID_REG_IDX);
-	state->sync_count = receiver_port_reg_load(ID,
-			    port_ID, _HRT_CSS_RECEIVER_SYNC_COUNT_REG_IDX);
-	state->rx_count = receiver_port_reg_load(ID,
-			  port_ID, _HRT_CSS_RECEIVER_RX_COUNT_REG_IDX);
-
-	for (i = 0; i < MIPI_4LANE_CFG ; i++) {
-		state->lane_sync_count[i] = (uint8_t)((state->sync_count) >> (i * 8));
-		state->lane_rx_count[i] = (uint8_t)((state->rx_count) >> (i * 8));
-	}
-}
-
-static inline void rx_channel_get_state(
-    const rx_ID_t					ID,
-    const unsigned int				ch_id,
-    rx_channel_state_t				*state)
-{
-	int	i;
-
-	assert(ID < N_RX_ID);
-	assert(ch_id < N_RX_CHANNEL_ID);
-	assert(state);
-
-	switch (ch_id) {
-	case 0:
-		state->comp_scheme0 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC0_REG0_IDX);
-		state->comp_scheme1 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC0_REG1_IDX);
-		break;
-	case 1:
-		state->comp_scheme0 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC1_REG0_IDX);
-		state->comp_scheme1 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC1_REG1_IDX);
-		break;
-	case 2:
-		state->comp_scheme0 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC2_REG0_IDX);
-		state->comp_scheme1 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC2_REG1_IDX);
-		break;
-	case 3:
-		state->comp_scheme0 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC3_REG0_IDX);
-		state->comp_scheme1 = receiver_reg_load(ID,
-							_HRT_CSS_RECEIVER_2400_COMP_SCHEME_VC3_REG1_IDX);
-		break;
-	}
-
-	/* See Table 7.1.17,..., 7.1.24 */
-	for (i = 0; i < 6; i++) {
-		u8	val = (uint8_t)((state->comp_scheme0) >> (i * 5)) & 0x1f;
-
-		state->comp[i] = (mipi_compressor_t)(val & 0x07);
-		state->pred[i] = (mipi_predictor_t)((val & 0x18) >> 3);
-	}
-	for (i = 6; i < N_MIPI_FORMAT_CUSTOM; i++) {
-		u8	val = (uint8_t)((state->comp_scheme0) >> ((i - 6) * 5)) & 0x1f;
-
-		state->comp[i] = (mipi_compressor_t)(val & 0x07);
-		state->pred[i] = (mipi_predictor_t)((val & 0x18) >> 3);
-	}
-}
-
 // MW: "2400" in the name is not good, but this is to avoid a naming conflict
 static input_system_cfg2400_t config;
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 80b5fd0dc9f6..4697d8d7b915 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -225,25 +225,6 @@ void irq_raise(
 	return;
 }
 
-void irq_controller_get_state(const irq_ID_t ID,
-			      struct irq_controller_state *state)
-{
-	assert(ID < N_IRQ_ID);
-	assert(state);
-
-	state->irq_edge = irq_reg_load(ID,
-				       _HRT_IRQ_CONTROLLER_EDGE_REG_IDX);
-	state->irq_mask = irq_reg_load(ID,
-				       _HRT_IRQ_CONTROLLER_MASK_REG_IDX);
-	state->irq_status = irq_reg_load(ID,
-					 _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-	state->irq_enable = irq_reg_load(ID,
-					 _HRT_IRQ_CONTROLLER_ENABLE_REG_IDX);
-	state->irq_level_not_pulse = irq_reg_load(ID,
-				     _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX);
-	return;
-}
-
 bool any_virq_signal(void)
 {
 	unsigned int irq_status = irq_reg_load(IRQ0_ID,
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
index 6a25345ae88e..8fd1bce85214 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
@@ -115,12 +115,4 @@ struct virq_info {
 	hrt_data		irq_status_reg[N_IRQ_ID];
 };
 
-struct irq_controller_state {
-	unsigned int	irq_edge;
-	unsigned int	irq_mask;
-	unsigned int	irq_status;
-	unsigned int	irq_enable;
-	unsigned int	irq_level_not_pulse;
-};
-
 #endif /* __IRQ_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 4ad5e2db8a89..b78cc324da6a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -39,66 +39,6 @@ void cnd_isp_irq_enable(
 	return;
 }
 
-void isp_get_state(
-    const isp_ID_t		ID,
-    isp_state_t			*state,
-    isp_stall_t			*stall)
-{
-	hrt_data sc = isp_ctrl_load(ID, ISP_SC_REG);
-
-	assert(state);
-	assert(stall);
-
-#if defined(_hrt_sysmem_ident_address)
-	/* Patch to avoid compiler unused symbol warning in C_RUN build */
-	(void)__hrt_sysmem_ident_address;
-	(void)_hrt_sysmem_map_var;
-#endif
-
-	state->pc = isp_ctrl_load(ID, ISP_PC_REG);
-	state->status_register = sc;
-	state->is_broken = isp_ctrl_getbit(ID, ISP_SC_REG, ISP_BROKEN_BIT);
-	state->is_idle = isp_ctrl_getbit(ID, ISP_SC_REG, ISP_IDLE_BIT);
-	state->is_sleeping = isp_ctrl_getbit(ID, ISP_SC_REG, ISP_SLEEPING_BIT);
-	state->is_stalling = isp_ctrl_getbit(ID, ISP_SC_REG, ISP_STALLING_BIT);
-	stall->stat_ctrl =
-	    !isp_ctrl_getbit(ID, ISP_CTRL_SINK_REG, ISP_CTRL_SINK_BIT);
-	stall->pmem =
-	    !isp_ctrl_getbit(ID, ISP_PMEM_SINK_REG, ISP_PMEM_SINK_BIT);
-	stall->dmem =
-	    !isp_ctrl_getbit(ID, ISP_DMEM_SINK_REG, ISP_DMEM_SINK_BIT);
-	stall->vmem =
-	    !isp_ctrl_getbit(ID, ISP_VMEM_SINK_REG, ISP_VMEM_SINK_BIT);
-	stall->fifo0 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO0_SINK_REG, ISP_FIFO0_SINK_BIT);
-	stall->fifo1 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO1_SINK_REG, ISP_FIFO1_SINK_BIT);
-	stall->fifo2 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO2_SINK_REG, ISP_FIFO2_SINK_BIT);
-	stall->fifo3 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO3_SINK_REG, ISP_FIFO3_SINK_BIT);
-	stall->fifo4 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO4_SINK_REG, ISP_FIFO4_SINK_BIT);
-	stall->fifo5 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO5_SINK_REG, ISP_FIFO5_SINK_BIT);
-	stall->fifo6 =
-	    !isp_ctrl_getbit(ID, ISP_FIFO6_SINK_REG, ISP_FIFO6_SINK_BIT);
-	stall->vamem1 =
-	    !isp_ctrl_getbit(ID, ISP_VAMEM1_SINK_REG, ISP_VAMEM1_SINK_BIT);
-	stall->vamem2 =
-	    !isp_ctrl_getbit(ID, ISP_VAMEM2_SINK_REG, ISP_VAMEM2_SINK_BIT);
-	stall->vamem3 =
-	    !isp_ctrl_getbit(ID, ISP_VAMEM3_SINK_REG, ISP_VAMEM3_SINK_BIT);
-	stall->hmem =
-	    !isp_ctrl_getbit(ID, ISP_HMEM_SINK_REG, ISP_HMEM_SINK_BIT);
-	/*
-		stall->icache_master =
-			!isp_ctrl_getbit(ID, ISP_ICACHE_MT_SINK_REG,
-				ISP_ICACHE_MT_SINK_BIT);
-	 */
-	return;
-}
-
 /* ISP functions to control the ISP state from the host, even in crun. */
 
 /* Inspect readiness of an ISP indexed by ID */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h
index 4dbec4063b3d..fb98696cc44d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h
@@ -22,35 +22,4 @@
 
 #define HIVE_ISP_VMEM_MASK	((1U << ISP_VMEM_ELEMBITS) - 1)
 
-typedef struct isp_state_s		isp_state_t;
-typedef struct isp_stall_s		isp_stall_t;
-
-struct isp_state_s {
-	int	pc;
-	int	status_register;
-	bool	is_broken;
-	bool	is_idle;
-	bool	is_sleeping;
-	bool	is_stalling;
-};
-
-struct isp_stall_s {
-	bool	fifo0;
-	bool	fifo1;
-	bool	fifo2;
-	bool	fifo3;
-	bool	fifo4;
-	bool	fifo5;
-	bool	fifo6;
-	bool	stat_ctrl;
-	bool	dmem;
-	bool	vmem;
-	bool	vamem1;
-	bool	vamem2;
-	bool	vamem3;
-	bool	hmem;
-	bool	pmem;
-	bool	icache_master;
-};
-
 #endif /* __ISP_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
index aae18465b6ae..3dc4d1289ea1 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
@@ -33,50 +33,3 @@ void cnd_sp_irq_enable(
 		sp_ctrl_clearbit(ID, SP_IRQ_READY_REG, SP_IRQ_READY_BIT);
 	}
 }
-
-void sp_get_state(
-    const sp_ID_t			ID,
-    sp_state_t				*state,
-    sp_stall_t				*stall)
-{
-	hrt_data sc = sp_ctrl_load(ID, SP_SC_REG);
-
-	assert(state);
-	assert(stall);
-
-	state->pc = sp_ctrl_load(ID, SP_PC_REG);
-	state->status_register = sc;
-	state->is_broken   = (sc & (1U << SP_BROKEN_BIT)) != 0;
-	state->is_idle     = (sc & (1U << SP_IDLE_BIT)) != 0;
-	state->is_sleeping = (sc & (1U << SP_SLEEPING_BIT)) != 0;
-	state->is_stalling = (sc & (1U << SP_STALLING_BIT)) != 0;
-	stall->fifo0 =
-	    !sp_ctrl_getbit(ID, SP_FIFO0_SINK_REG, SP_FIFO0_SINK_BIT);
-	stall->fifo1 =
-	    !sp_ctrl_getbit(ID, SP_FIFO1_SINK_REG, SP_FIFO1_SINK_BIT);
-	stall->fifo2 =
-	    !sp_ctrl_getbit(ID, SP_FIFO2_SINK_REG, SP_FIFO2_SINK_BIT);
-	stall->fifo3 =
-	    !sp_ctrl_getbit(ID, SP_FIFO3_SINK_REG, SP_FIFO3_SINK_BIT);
-	stall->fifo4 =
-	    !sp_ctrl_getbit(ID, SP_FIFO4_SINK_REG, SP_FIFO4_SINK_BIT);
-	stall->fifo5 =
-	    !sp_ctrl_getbit(ID, SP_FIFO5_SINK_REG, SP_FIFO5_SINK_BIT);
-	stall->fifo6 =
-	    !sp_ctrl_getbit(ID, SP_FIFO6_SINK_REG, SP_FIFO6_SINK_BIT);
-	stall->fifo7 =
-	    !sp_ctrl_getbit(ID, SP_FIFO7_SINK_REG, SP_FIFO7_SINK_BIT);
-	stall->fifo8 =
-	    !sp_ctrl_getbit(ID, SP_FIFO8_SINK_REG, SP_FIFO8_SINK_BIT);
-	stall->fifo9 =
-	    !sp_ctrl_getbit(ID, SP_FIFO9_SINK_REG, SP_FIFO9_SINK_BIT);
-	stall->fifoa =
-	    !sp_ctrl_getbit(ID, SP_FIFOA_SINK_REG, SP_FIFOA_SINK_BIT);
-	stall->dmem =
-	    !sp_ctrl_getbit(ID, SP_DMEM_SINK_REG, SP_DMEM_SINK_BIT);
-	stall->control_master =
-	    !sp_ctrl_getbit(ID, SP_CTRL_MT_SINK_REG, SP_CTRL_MT_SINK_BIT);
-	stall->icache_master =
-	    !sp_ctrl_getbit(ID, SP_ICACHE_MT_SINK_REG,
-			    SP_ICACHE_MT_SINK_BIT);
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
index 2956c7023b33..e22d25a902f4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
@@ -19,32 +19,6 @@
 #include <type_support.h>
 #include "sp_global.h"
 
-struct sp_state_s {
-	int		pc;
-	int		status_register;
-	bool	is_broken;
-	bool	is_idle;
-	bool	is_sleeping;
-	bool	is_stalling;
-};
-
-struct sp_stall_s {
-	bool	fifo0;
-	bool	fifo1;
-	bool	fifo2;
-	bool	fifo3;
-	bool	fifo4;
-	bool	fifo5;
-	bool	fifo6;
-	bool	fifo7;
-	bool	fifo8;
-	bool	fifo9;
-	bool	fifoa;
-	bool	dmem;
-	bool	control_master;
-	bool	icache_master;
-};
-
 #define sp_address_of(var)	(HIVE_ADDR_ ## var)
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
index a23cbc9a2129..6fed47f04594 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
@@ -18,19 +18,6 @@
 
 #include "system_local.h"
 
-typedef struct dma_state_s		dma_state_t;
-
-/*! Read the control registers of DMA[ID]
-
- \param	ID[in]				DMA identifier
- \param	state[out]			input formatter state structure
-
- \return none, state = DMA[ID].state
- */
-void dma_get_state(
-    const dma_ID_t		ID,
-    dma_state_t			*state);
-
 /*! Write to a control register of DMA[ID]
 
  \param	ID[in]				DMA identifier
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index d335e7b0a76e..43787ab64078 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -19,16 +19,6 @@
 #include <type_support.h>
 #include "system_local.h"
 
-/*! Read the control registers of IRQ[ID]
-
- \param	ID[in]				IRQ identifier
- \param	state[out]			irq controller state structure
-
- \return none, state = IRQ[ID].state
- */
-void irq_controller_get_state(const irq_ID_t ID,
-			      struct irq_controller_state *state);
-
 /*! Write to a control register of IRQ[ID]
 
  \param	ID[in]				IRQ identifier
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
index a8ff75c639e5..34dd7f912df6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
@@ -30,19 +30,6 @@ void cnd_isp_irq_enable(
     const isp_ID_t		ID,
     const bool			cnd);
 
-/*! Read the state of cell ISP[ID]
-
- \param	ID[in]				ISP identifier
- \param	state[out]			isp state structure
- \param	stall[out]			isp stall conditions
-
- \return none, state = ISP[ID].state, stall = ISP[ID].stall
- */
-void isp_get_state(
-    const isp_ID_t		ID,
-    isp_state_t			*state,
-    isp_stall_t			*stall);
-
 /*! Write to the status and control register of ISP[ID]
 
  \param	ID[in]				ISP identifier
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
index b0b7f2e27854..e9166535ce09 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
@@ -19,9 +19,6 @@
 #include <type_support.h>
 #include "system_local.h"
 
-typedef struct sp_state_s		sp_state_t;
-typedef struct sp_stall_s		sp_stall_t;
-
 /*! Enable or disable the program complete irq signal of SP[ID]
 
  \param	ID[in]				SP identifier
@@ -33,19 +30,6 @@ void cnd_sp_irq_enable(
     const sp_ID_t		ID,
     const bool			cnd);
 
-/*! Read the state of cell SP[ID]
-
- \param	ID[in]				SP identifier
- \param	state[out]			sp state structure
- \param	stall[out]			isp stall conditions
-
- \return none, state = SP[ID].state, stall = SP[ID].stall
- */
-void sp_get_state(
-    const sp_ID_t		ID,
-    sp_state_t			*state,
-    sp_stall_t			*stall);
-
 /*! Write to the status and control register of SP[ID]
 
  \param	ID[in]				SP identifier
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 6319d6449f20..f9b9c3ae50aa 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -163,10 +163,6 @@ struct input_system_cfg2400_s {
 #define	_HRT_CSS_RECEIVER_DATA_TIMEOUT_IDX		_HRT_CSS_RECEIVER_2400_CSI2_DATA_TIMEOUT_IDX
 #define	_HRT_CSS_RECEIVER_DATA_TIMEOUT_BITS		_HRT_CSS_RECEIVER_2400_CSI2_DATA_TIMEOUT_BITS
 
-typedef struct capture_unit_state_s	capture_unit_state_t;
-typedef struct acquisition_unit_state_s	acquisition_unit_state_t;
-typedef struct ctrl_unit_state_s	ctrl_unit_state_t;
-
 typedef enum {
 	MIPI_FORMAT_2400_RGB888 = 0,
 	MIPI_FORMAT_2400_RGB555,
@@ -244,113 +240,4 @@ static const hrt_address __maybe_unused SUB_SYSTEM_OFFSET[N_SUB_SYSTEM_ID] = {
 	0x0000C000UL
 };
 
-struct capture_unit_state_s {
-	int	Packet_Length;
-	int	Received_Length;
-	int	Received_Short_Packets;
-	int	Received_Long_Packets;
-	int	Last_Command;
-	int	Next_Command;
-	int	Last_Acknowledge;
-	int	Next_Acknowledge;
-	int	FSM_State_Info;
-	int	StartMode;
-	int	Start_Addr;
-	int	Mem_Region_Size;
-	int	Num_Mem_Regions;
-	/*	int	Init;   write-only registers
-		int	Start;
-		int	Stop;      */
-};
-
-struct acquisition_unit_state_s {
-	/*	int	Init;   write-only register */
-	int	Received_Short_Packets;
-	int	Received_Long_Packets;
-	int	Last_Command;
-	int	Next_Command;
-	int	Last_Acknowledge;
-	int	Next_Acknowledge;
-	int	FSM_State_Info;
-	int	Int_Cntr_Info;
-	int	Start_Addr;
-	int	Mem_Region_Size;
-	int	Num_Mem_Regions;
-};
-
-struct ctrl_unit_state_s {
-	int	last_cmd;
-	int	next_cmd;
-	int	last_ack;
-	int	next_ack;
-	int	top_fsm_state;
-	int	captA_fsm_state;
-	int	captB_fsm_state;
-	int	captC_fsm_state;
-	int	acq_fsm_state;
-	int	captA_start_addr;
-	int	captB_start_addr;
-	int	captC_start_addr;
-	int	captA_mem_region_size;
-	int	captB_mem_region_size;
-	int	captC_mem_region_size;
-	int	captA_num_mem_regions;
-	int	captB_num_mem_regions;
-	int	captC_num_mem_regions;
-	int	acq_start_addr;
-	int	acq_mem_region_size;
-	int	acq_num_mem_regions;
-	/*	int	ctrl_init;  write only register */
-	int	capt_reserve_one_mem_region;
-};
-
-struct mipi_port_state_s {
-	int	device_ready;
-	int	irq_status;
-	int	irq_enable;
-	u32	timeout_count;
-	u16	init_count;
-	u16	raw16_18;
-	u32	sync_count;		/*4 x uint8_t */
-	u32	rx_count;		/*4 x uint8_t */
-	u8		lane_sync_count[MIPI_4LANE_CFG];
-	u8		lane_rx_count[MIPI_4LANE_CFG];
-};
-
-struct rx_channel_state_s {
-	u32	comp_scheme0;
-	u32	comp_scheme1;
-	mipi_predictor_t		pred[N_MIPI_FORMAT_CUSTOM];
-	mipi_compressor_t		comp[N_MIPI_FORMAT_CUSTOM];
-};
-
-struct receiver_state_s {
-	u8	fs_to_ls_delay;
-	u8	ls_to_data_delay;
-	u8	data_to_le_delay;
-	u8	le_to_fe_delay;
-	u8	fe_to_fs_delay;
-	u8	le_to_fs_delay;
-	bool	is_two_ppc;
-	int	backend_rst;
-	u16	raw18;
-	bool		force_raw8;
-	u16	raw16;
-	struct mipi_port_state_s	mipi_port_state[N_MIPI_PORT_ID];
-	struct rx_channel_state_s	rx_channel_state[N_RX_CHANNEL_ID];
-	int	be_gsp_acc_ovl;
-	int	be_srst;
-	int	be_is_two_ppc;
-	int	be_comp_format0;
-	int	be_comp_format1;
-	int	be_comp_format2;
-	int	be_comp_format3;
-	int	be_sel;
-	int	be_raw16_config;
-	int	be_raw18_config;
-	int	be_force_raw8;
-	int	be_irq_status;
-	int	be_irq_clear;
-};
-
 #endif /* __INPUT_SYSTEM_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index b1360eeb58df..447c7c5c55a1 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -18,34 +18,6 @@
 
 #include <type_support.h>
 
-typedef struct receiver_state_s			receiver_state_t;
-
-/*! Read the state of INPUT_SYSTEM[ID]
-
- \param	ID[in]				INPUT_SYSTEM identifier
- \param	state[out]			input system state structure
-
- \return none, state = INPUT_SYSTEM[ID].state
- */
-
-/*! Read the state of RECEIVER[ID]
-
- \param	ID[in]				RECEIVER identifier
- \param	state[out]			receiver state structure
-
- \return none, state = RECEIVER[ID].state
- */
-void receiver_get_state(
-    const rx_ID_t				ID,
-    receiver_state_t			*state);
-
-/*! Flag whether a MIPI format is YUV420
-
- \param	mipi_format[in]		MIPI format
-
- \return mipi_format == YUV420
- */
-
 /*! Set compression parameters for cfg[cfg_ID] of RECEIVER[ID]
 
  \param	ID[in]				RECEIVER identifier
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index b74ab50ea01e..e9a09117e5e5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -154,18 +154,6 @@ void ia_css_debug_set_dtrace_level(
  */
 unsigned int ia_css_debug_get_dtrace_level(void);
 
-/*! @brief Dump isp hardware state.
- * Dumps the isp hardware state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_isp_state(void);
-
-/*! @brief Dump sp hardware state.
- * Dumps the sp hardware state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_sp_state(void);
-
 /* ISP2401 */
 /*! @brief Dump GAC hardware state.
  * Dumps the GAC ACB hardware registers. may be useful for
@@ -174,25 +162,12 @@ void ia_css_debug_dump_sp_state(void);
  */
 void ia_css_debug_dump_gac_state(void);
 
-/*! @brief Dump dma controller state.
- * Dumps the dma controller state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_dma_state(void);
-
 /*! @brief Dump internal sp software state.
  * Dumps the sp software state to tracing output.
  * @return	None
  */
 void ia_css_debug_dump_sp_sw_debug_info(void);
 
-/*! @brief Dump all related hardware state to the trace output
- * @param[in]  context	String to identify context in output.
- * @return	None
- */
-void ia_css_debug_dump_debug_info(
-    const char	*context);
-
 #if SP_DEBUG != SP_DEBUG_NONE
 void ia_css_debug_print_sp_debug_state(
     const struct sh_css_sp_debug_state *state);
@@ -207,24 +182,6 @@ void ia_css_debug_binary_print(
 
 void ia_css_debug_sp_dump_mipi_fifo_high_water(void);
 
-/*! @brief Dump isp gdc fifo state to the trace output
- * Dumps the isp gdc fifo state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_isp_gdc_fifo_state(void);
-
-/*! @brief Dump dma isp fifo state
- * Dumps the dma isp fifo state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_dma_isp_fifo_state(void);
-
-/*! @brief Dump dma sp fifo state
- * Dumps the dma sp fifo state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_dma_sp_fifo_state(void);
-
 /*! \brief Dump pif A isp fifo state
  * Dumps the primary input formatter state to tracing output.
  * @return	None
@@ -243,24 +200,12 @@ void ia_css_debug_dump_pif_b_isp_fifo_state(void);
  */
 void ia_css_debug_dump_str2mem_sp_fifo_state(void);
 
-/*! @brief Dump isp sp fifo state
- * Dumps the isp sp fifo state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_isp_sp_fifo_state(void);
-
 /*! @brief Dump all fifo state info to the output
  * Dumps all fifo state to tracing output.
  * @return	None
  */
 void ia_css_debug_dump_all_fifo_state(void);
 
-/*! @brief Dump the rx state to the output
- * Dumps the rx state to tracing output.
- * @return	None
- */
-void ia_css_debug_dump_rx_state(void);
-
 /*! @brief Dump the frame info to the trace output
  * Dumps the frame info to tracing output.
  * @param[in]	frame		pointer to struct ia_css_frame
@@ -294,12 +239,6 @@ void ia_css_debug_wake_up_sp(void);
 void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
 				  unsigned int enable);
 
-/*! @brief Function to dump some sp performance counters.
- * Dump sp performance counters, currently input system errors.
- * @return	None
- */
-void ia_css_debug_dump_perf_counters(void);
-
 void ia_css_debug_dump_isp_binary(void);
 
 void sh_css_dump_sp_raw_copy_linecount(bool reduced);
@@ -382,12 +321,6 @@ void ia_css_debug_dump_stream_config(
     const struct ia_css_stream_config *config,
     int num_pipes);
 
-/*! @brief Dump the state of the SP tagger
- * Dumps the internal state of the SP tagger
- * @return	None
- */
-void ia_css_debug_tagger_state(void);
-
 /**
  * @brief Initialize the debug mode.
  *
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index d40ed9c60f1d..321485f75fb5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -308,136 +308,6 @@ static const char *debug_frame_format2str(const enum ia_css_frame_format
 	}
 }
 
-static void debug_print_sp_state(const sp_state_t *state, const char *cell)
-{
-	assert(cell);
-	assert(state);
-
-	ia_css_debug_dtrace(2, "%s state:\n", cell);
-	ia_css_debug_dtrace(2, "\t%-32s: 0x%X\n", "PC", state->pc);
-	ia_css_debug_dtrace(2, "\t%-32s: 0x%X\n", "Status register",
-			    state->status_register);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is broken", state->is_broken);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is idle", state->is_idle);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is sleeping",
-			    state->is_sleeping);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is stalling",
-			    state->is_stalling);
-	return;
-}
-
-static void debug_print_isp_state(const isp_state_t *state, const char *cell)
-{
-	assert(state);
-	assert(cell);
-
-	ia_css_debug_dtrace(2, "%s state:\n", cell);
-	ia_css_debug_dtrace(2, "\t%-32s: 0x%X\n", "PC", state->pc);
-	ia_css_debug_dtrace(2, "\t%-32s: 0x%X\n", "Status register",
-			    state->status_register);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is broken", state->is_broken);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is idle", state->is_idle);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is sleeping",
-			    state->is_sleeping);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "Is stalling",
-			    state->is_stalling);
-	return;
-}
-
-void ia_css_debug_dump_isp_state(void)
-{
-	isp_state_t state;
-	isp_stall_t stall;
-
-	isp_get_state(ISP0_ID, &state, &stall);
-
-	debug_print_isp_state(&state, "ISP");
-
-	if (state.is_stalling) {
-		if (!IS_ISP2401) {
-			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-					    "[0] if_prim_a_FIFO stalled", stall.fifo0);
-			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-					    "[1] if_prim_b_FIFO stalled", stall.fifo1);
-		}
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[2] dma_FIFO stalled",
-				    stall.fifo2);
-
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[3] gdc0_FIFO stalled",
-				    stall.fifo3);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[4] gdc1_FIFO stalled",
-				    stall.fifo4);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[5] gpio_FIFO stalled",
-				    stall.fifo5);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "[6] sp_FIFO stalled",
-				    stall.fifo6);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "status & control stalled",
-				    stall.stat_ctrl);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dmem stalled",
-				    stall.dmem);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "vmem stalled",
-				    stall.vmem);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "vamem1 stalled",
-				    stall.vamem1);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "vamem2 stalled",
-				    stall.vamem2);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "vamem3 stalled",
-				    stall.vamem3);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "hmem stalled",
-				    stall.hmem);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "pmem stalled",
-				    stall.pmem);
-	}
-	return;
-}
-
-void ia_css_debug_dump_sp_state(void)
-{
-	sp_state_t state;
-	sp_stall_t stall;
-
-	sp_get_state(SP0_ID, &state, &stall);
-	debug_print_sp_state(&state, "SP");
-	if (state.is_stalling) {
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "isys_FIFO stalled",
-				    stall.fifo0);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "if_sec_FIFO stalled",
-				    stall.fifo1);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "str_to_mem_FIFO stalled", stall.fifo2);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dma_FIFO stalled",
-				    stall.fifo3);
-		if (!IS_ISP2401)
-			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-					    "if_prim_a_FIFO stalled", stall.fifo4);
-
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "isp_FIFO stalled",
-				    stall.fifo5);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "gp_FIFO stalled",
-				    stall.fifo6);
-		if (!IS_ISP2401)
-			ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-					    "if_prim_b_FIFO stalled", stall.fifo7);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "gdc0_FIFO stalled",
-				    stall.fifo8);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "gdc1_FIFO stalled",
-				    stall.fifo9);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "irq FIFO stalled",
-				    stall.fifoa);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dmem stalled",
-				    stall.dmem);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "control master stalled",
-				    stall.control_master);
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
-				    "i-cache master stalled",
-				    stall.icache_master);
-	}
-	ia_css_debug_dump_trace();
-	return;
-}
-
 static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 	const char *descr)
 {
@@ -492,634 +362,6 @@ void ia_css_debug_dump_str2mem_sp_fifo_state(void)
 	debug_print_fifo_channel_state(&sp_to_s2m, "SP to stream-to-memory");
 }
 
-#ifndef ISP2401
-static void debug_print_if_state(input_formatter_state_t *state, const char *id)
-{
-	unsigned int val;
-
-	const char *st_vsync_active_low =
-	    (state->vsync_active_low ? "low" : "high");
-	const char *st_hsync_active_low =
-	    (state->hsync_active_low ? "low" : "high");
-
-	const char *fsm_sync_status_str = "unknown";
-	const char *fsm_crop_status_str = "unknown";
-	const char *fsm_padding_status_str = "unknown";
-
-	int st_stline = state->start_line;
-	int st_stcol = state->start_column;
-	int st_crpht = state->cropped_height;
-	int st_crpwd = state->cropped_width;
-	int st_verdcm = state->ver_decimation;
-	int st_hordcm = state->hor_decimation;
-	int st_ver_deinterleaving = state->ver_deinterleaving;
-	int st_hor_deinterleaving = state->hor_deinterleaving;
-	int st_leftpd = state->left_padding;
-	int st_eoloff = state->eol_offset;
-	int st_vmstartaddr = state->vmem_start_address;
-	int st_vmendaddr = state->vmem_end_address;
-	int st_vmincr = state->vmem_increment;
-	int st_yuv420 = state->is_yuv420;
-	int st_allow_fifo_overflow = state->allow_fifo_overflow;
-	int st_block_fifo_when_no_req = state->block_fifo_when_no_req;
-
-	assert(state);
-	ia_css_debug_dtrace(2, "InputFormatter State (%s):\n", id);
-
-	ia_css_debug_dtrace(2, "\tConfiguration:\n");
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Start line", st_stline);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Start column", st_stcol);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Cropped height", st_crpht);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Cropped width", st_crpwd);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Ver decimation", st_verdcm);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Hor decimation", st_hordcm);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Ver deinterleaving", st_ver_deinterleaving);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Hor deinterleaving", st_hor_deinterleaving);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Left padding", st_leftpd);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "EOL offset (bytes)", st_eoloff);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%06X\n",
-			    "VMEM start address", st_vmstartaddr);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%06X\n",
-			    "VMEM end address", st_vmendaddr);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%06X\n",
-			    "VMEM increment", st_vmincr);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "YUV 420 format", st_yuv420);
-	ia_css_debug_dtrace(2, "\t\t%-32s: Active %s\n",
-			    "Vsync", st_vsync_active_low);
-	ia_css_debug_dtrace(2, "\t\t%-32s: Active %s\n",
-			    "Hsync", st_hsync_active_low);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Allow FIFO overflow", st_allow_fifo_overflow);
-	/* Flag that tells whether the IF gives backpressure on frames */
-	/*
-	 * FYI, this is only on the frame request (indicate), when the IF has
-	 * synch'd on a frame it will always give back pressure
-	 */
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "Block when no request", st_block_fifo_when_no_req);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "IF_BLOCKED_FIFO_NO_REQ_ADDRESS",
-			    input_formatter_reg_load(INPUT_FORMATTER0_ID,
-				    HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS)
-			   );
-
-	ia_css_debug_dtrace(2, "\t%-32s:\n", "InputSwitch State");
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg0",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg0));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg1",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg1));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg2",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg2));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg3",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg3));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg4",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg4));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg5",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg5));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg6",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg6));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_lut_reg7",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_lut_reg7));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_input_switch_fsync_lut",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_input_switch_fsync_lut));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_srst",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_srst));
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "_REG_GP_IFMT_slv_reg_srst",
-			    gp_device_reg_load(GP_DEVICE0_ID,
-					       _REG_GP_IFMT_slv_reg_srst));
-
-	ia_css_debug_dtrace(2, "\tFSM Status:\n");
-
-	val = state->fsm_sync_status;
-
-	if (val > 7)
-		fsm_sync_status_str = "ERROR";
-
-	switch (val & 0x7) {
-	case 0:
-		fsm_sync_status_str = "idle";
-		break;
-	case 1:
-		fsm_sync_status_str = "request frame";
-		break;
-	case 2:
-		fsm_sync_status_str = "request lines";
-		break;
-	case 3:
-		fsm_sync_status_str = "request vectors";
-		break;
-	case 4:
-		fsm_sync_status_str = "send acknowledge";
-		break;
-	default:
-		fsm_sync_status_str = "unknown";
-		break;
-	}
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: (0x%X: %s)\n",
-			    "FSM Synchronization Status", val,
-			    fsm_sync_status_str);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM Synchronization Counter",
-			    state->fsm_sync_counter);
-
-	val = state->fsm_crop_status;
-
-	if (val > 7)
-		fsm_crop_status_str = "ERROR";
-
-	switch (val & 0x7) {
-	case 0:
-		fsm_crop_status_str = "idle";
-		break;
-	case 1:
-		fsm_crop_status_str = "wait line";
-		break;
-	case 2:
-		fsm_crop_status_str = "crop line";
-		break;
-	case 3:
-		fsm_crop_status_str = "crop pixel";
-		break;
-	case 4:
-		fsm_crop_status_str = "pass pixel";
-		break;
-	case 5:
-		fsm_crop_status_str = "pass line";
-		break;
-	case 6:
-		fsm_crop_status_str = "lost line";
-		break;
-	default:
-		fsm_crop_status_str = "unknown";
-		break;
-	}
-	ia_css_debug_dtrace(2, "\t\t%-32s: (0x%X: %s)\n",
-			    "FSM Crop Status", val, fsm_crop_status_str);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM Crop Line Counter",
-			    state->fsm_crop_line_counter);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM Crop Pixel Counter",
-			    state->fsm_crop_pixel_counter);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM Deinterleaving idx buffer",
-			    state->fsm_deinterleaving_index);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM H decimation counter",
-			    state->fsm_dec_h_counter);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM V decimation counter",
-			    state->fsm_dec_v_counter);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM block V decimation counter",
-			    state->fsm_dec_block_v_counter);
-
-	val = state->fsm_padding_status;
-
-	if (val > 7)
-		fsm_padding_status_str = "ERROR";
-
-	switch (val & 0x7) {
-	case 0:
-		fsm_padding_status_str = "idle";
-		break;
-	case 1:
-		fsm_padding_status_str = "left pad";
-		break;
-	case 2:
-		fsm_padding_status_str = "write";
-		break;
-	case 3:
-		fsm_padding_status_str = "right pad";
-		break;
-	case 4:
-		fsm_padding_status_str = "send end of line";
-		break;
-	default:
-		fsm_padding_status_str = "unknown";
-		break;
-	}
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: (0x%X: %s)\n", "FSM Padding Status",
-			    val, fsm_padding_status_str);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "FSM Padding element idx counter",
-			    state->fsm_padding_elem_counter);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Vector support error",
-			    state->fsm_vector_support_error);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Vector support buf full",
-			    state->fsm_vector_buffer_full);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Vector support",
-			    state->vector_support);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Fifo sensor data lost",
-			    state->sensor_data_lost);
-}
-
-static void debug_print_if_bin_state(input_formatter_bin_state_t *state)
-{
-	ia_css_debug_dtrace(2, "Stream-to-memory state:\n");
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "reset", state->reset);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "input endianness",
-			    state->input_endianness);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "output endianness",
-			    state->output_endianness);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "bitswap", state->bitswap);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "block_synch",
-			    state->block_synch);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "packet_synch",
-			    state->packet_synch);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "readpostwrite_sync",
-			    state->readpostwrite_synch);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "is_2ppc", state->is_2ppc);
-	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "en_status_update",
-			    state->en_status_update);
-}
-
-static void ia_css_debug_dump_if_state(void)
-{
-	input_formatter_state_t if_state;
-	input_formatter_bin_state_t if_bin_state;
-
-	input_formatter_get_state(INPUT_FORMATTER0_ID, &if_state);
-	debug_print_if_state(&if_state, "Primary IF A");
-	ia_css_debug_dump_pif_a_isp_fifo_state();
-
-	input_formatter_get_state(INPUT_FORMATTER1_ID, &if_state);
-	debug_print_if_state(&if_state, "Primary IF B");
-	ia_css_debug_dump_pif_b_isp_fifo_state();
-
-	input_formatter_bin_get_state(INPUT_FORMATTER3_ID, &if_bin_state);
-	debug_print_if_bin_state(&if_bin_state);
-	ia_css_debug_dump_str2mem_sp_fifo_state();
-}
-#endif
-
-void ia_css_debug_dump_dma_state(void)
-{
-	/* note: the var below is made static as it is quite large;
-	   if it is not static it ends up on the stack which could
-	   cause issues for drivers
-	*/
-	static dma_state_t state;
-	int i, ch_id;
-
-	const char *fsm_cmd_st_lbl = "FSM Command flag state";
-	const char *fsm_ctl_st_lbl = "FSM Control flag state";
-	const char *fsm_ctl_state = NULL;
-	const char *fsm_ctl_flag = NULL;
-	const char *fsm_pack_st = NULL;
-	const char *fsm_read_st = NULL;
-	const char *fsm_write_st = NULL;
-	char last_cmd_str[64];
-
-	dma_get_state(DMA0_ID, &state);
-	/* Print header for DMA dump status */
-	ia_css_debug_dtrace(2, "DMA dump status:\n");
-
-	/* Print FSM command flag state */
-	if (state.fsm_command_idle)
-		ia_css_debug_dtrace(2, "\t%-32s: %s\n", fsm_cmd_st_lbl, "IDLE");
-	if (state.fsm_command_run)
-		ia_css_debug_dtrace(2, "\t%-32s: %s\n", fsm_cmd_st_lbl, "RUN");
-	if (state.fsm_command_stalling)
-		ia_css_debug_dtrace(2, "\t%-32s: %s\n", fsm_cmd_st_lbl,
-				    "STALL");
-	if (state.fsm_command_error)
-		ia_css_debug_dtrace(2, "\t%-32s: %s\n", fsm_cmd_st_lbl,
-				    "ERROR");
-
-	/* Print last command along with the channel */
-	ch_id = state.last_command_channel;
-
-	switch (state.last_command) {
-	case DMA_COMMAND_READ:
-		snprintf(last_cmd_str, 64,
-			 "Read 2D Block [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_WRITE:
-		snprintf(last_cmd_str, 64,
-			 "Write 2D Block [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_SET_CHANNEL:
-		snprintf(last_cmd_str, 64, "Set Channel [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_SET_PARAM:
-		snprintf(last_cmd_str, 64,
-			 "Set Param: %d [Channel: %d]",
-			 state.last_command_param, ch_id);
-		break;
-	case DMA_COMMAND_READ_SPECIFIC:
-		snprintf(last_cmd_str, 64,
-			 "Read Specific 2D Block [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_WRITE_SPECIFIC:
-		snprintf(last_cmd_str, 64,
-			 "Write Specific 2D Block [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_INIT:
-		snprintf(last_cmd_str, 64,
-			 "Init 2D Block on Device A [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_INIT_SPECIFIC:
-		snprintf(last_cmd_str, 64,
-			 "Init Specific 2D Block [Channel: %d]", ch_id);
-		break;
-	case DMA_COMMAND_RST:
-		snprintf(last_cmd_str, 64, "DMA SW Reset");
-		break;
-	case N_DMA_COMMANDS:
-		snprintf(last_cmd_str, 64, "UNKNOWN");
-		break;
-	default:
-		snprintf(last_cmd_str, 64,
-			 "unknown [Channel: %d]", ch_id);
-		break;
-	}
-	ia_css_debug_dtrace(2, "\t%-32s: (0x%X : %s)\n",
-			    "last command received", state.last_command,
-			    last_cmd_str);
-
-	/* Print DMA registers */
-	ia_css_debug_dtrace(2, "\t%-32s\n",
-			    "DMA registers, connection group 0");
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "Cmd Fifo Command",
-			    state.current_command);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "Cmd Fifo Address A",
-			    state.current_addr_a);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "Cmd Fifo Address B",
-			    state.current_addr_b);
-
-	if (state.fsm_ctrl_idle)
-		fsm_ctl_flag = "IDLE";
-	else if (state.fsm_ctrl_run)
-		fsm_ctl_flag = "RUN";
-	else if (state.fsm_ctrl_stalling)
-		fsm_ctl_flag = "STAL";
-	else if (state.fsm_ctrl_error)
-		fsm_ctl_flag = "ERROR";
-	else
-		fsm_ctl_flag = "UNKNOWN";
-
-	switch (state.fsm_ctrl_state) {
-	case DMA_CTRL_STATE_IDLE:
-		fsm_ctl_state = "Idle state";
-		break;
-	case DMA_CTRL_STATE_REQ_RCV:
-		fsm_ctl_state = "Req Rcv state";
-		break;
-	case DMA_CTRL_STATE_RCV:
-		fsm_ctl_state = "Rcv state";
-		break;
-	case DMA_CTRL_STATE_RCV_REQ:
-		fsm_ctl_state = "Rcv Req state";
-		break;
-	case DMA_CTRL_STATE_INIT:
-		fsm_ctl_state = "Init state";
-		break;
-	case N_DMA_CTRL_STATES:
-		fsm_ctl_state = "Unknown";
-		break;
-	}
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %s -> %s\n", fsm_ctl_st_lbl,
-			    fsm_ctl_flag, fsm_ctl_state);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl source dev",
-			    state.fsm_ctrl_source_dev);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "FSM Ctrl source addr",
-			    state.fsm_ctrl_source_addr);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "FSM Ctrl source stride",
-			    state.fsm_ctrl_source_stride);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl source width",
-			    state.fsm_ctrl_source_width);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl source height",
-			    state.fsm_ctrl_source_height);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack source dev",
-			    state.fsm_ctrl_pack_source_dev);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack dest dev",
-			    state.fsm_ctrl_pack_dest_dev);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "FSM Ctrl dest addr",
-			    state.fsm_ctrl_dest_addr);
-	ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "FSM Ctrl dest stride",
-			    state.fsm_ctrl_dest_stride);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack source width",
-			    state.fsm_ctrl_pack_source_width);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack dest height",
-			    state.fsm_ctrl_pack_dest_height);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack dest width",
-			    state.fsm_ctrl_pack_dest_width);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack source elems",
-			    state.fsm_ctrl_pack_source_elems);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack dest elems",
-			    state.fsm_ctrl_pack_dest_elems);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Ctrl pack extension",
-			    state.fsm_ctrl_pack_extension);
-
-	if (state.pack_idle)
-		fsm_pack_st = "IDLE";
-	if (state.pack_run)
-		fsm_pack_st = "RUN";
-	if (state.pack_stalling)
-		fsm_pack_st = "STALL";
-	if (state.pack_error)
-		fsm_pack_st = "ERROR";
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %s\n", "FSM Pack flag state",
-			    fsm_pack_st);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Pack cnt height",
-			    state.pack_cnt_height);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Pack src cnt width",
-			    state.pack_src_cnt_width);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Pack dest cnt width",
-			    state.pack_dest_cnt_width);
-
-	if (state.read_state == DMA_RW_STATE_IDLE)
-		fsm_read_st = "Idle state";
-	if (state.read_state == DMA_RW_STATE_REQ)
-		fsm_read_st = "Req state";
-	if (state.read_state == DMA_RW_STATE_NEXT_LINE)
-		fsm_read_st = "Next line";
-	if (state.read_state == DMA_RW_STATE_UNLOCK_CHANNEL)
-		fsm_read_st = "Unlock channel";
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %s\n", "FSM Read state",
-			    fsm_read_st);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Read cnt height",
-			    state.read_cnt_height);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Read cnt width",
-			    state.read_cnt_width);
-
-	if (state.write_state == DMA_RW_STATE_IDLE)
-		fsm_write_st = "Idle state";
-	if (state.write_state == DMA_RW_STATE_REQ)
-		fsm_write_st = "Req state";
-	if (state.write_state == DMA_RW_STATE_NEXT_LINE)
-		fsm_write_st = "Next line";
-	if (state.write_state == DMA_RW_STATE_UNLOCK_CHANNEL)
-		fsm_write_st = "Unlock channel";
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %s\n", "FSM Write state",
-			    fsm_write_st);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Write height",
-			    state.write_height);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "FSM Write width",
-			    state.write_width);
-
-	for (i = 0; i < HIVE_ISP_NUM_DMA_CONNS; i++) {
-		dma_port_state_t *port = &state.port_states[i];
-
-		ia_css_debug_dtrace(2, "\tDMA device interface %d\n", i);
-		ia_css_debug_dtrace(2, "\t\tDMA internal side state\n");
-		ia_css_debug_dtrace(2,
-				    "\t\t\tCS:%d - We_n:%d - Run:%d - Ack:%d\n",
-				    port->req_cs, port->req_we_n, port->req_run,
-				    port->req_ack);
-		ia_css_debug_dtrace(2, "\t\tMaster Output side state\n");
-		ia_css_debug_dtrace(2,
-				    "\t\t\tCS:%d - We_n:%d - Run:%d - Ack:%d\n",
-				    port->send_cs, port->send_we_n,
-				    port->send_run, port->send_ack);
-		ia_css_debug_dtrace(2, "\t\tFifo state\n");
-		if (port->fifo_state == DMA_FIFO_STATE_WILL_BE_FULL)
-			ia_css_debug_dtrace(2, "\t\t\tFiFo will be full\n");
-		else if (port->fifo_state == DMA_FIFO_STATE_FULL)
-			ia_css_debug_dtrace(2, "\t\t\tFifo Full\n");
-		else if (port->fifo_state == DMA_FIFO_STATE_EMPTY)
-			ia_css_debug_dtrace(2, "\t\t\tFifo Empty\n");
-		else
-			ia_css_debug_dtrace(2, "\t\t\tFifo state unknown\n");
-
-		ia_css_debug_dtrace(2, "\t\tFifo counter %d\n\n",
-				    port->fifo_counter);
-	}
-
-	for (i = 0; i < HIVE_DMA_NUM_CHANNELS; i++) {
-		dma_channel_state_t *ch = &state.channel_states[i];
-
-		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "DMA channel register",
-				    i);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Connection",
-				    ch->connection);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Sign extend",
-				    ch->sign_extend);
-		ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "Stride Dev A",
-				    ch->stride_a);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Elems Dev A",
-				    ch->elems_a);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Cropping Dev A",
-				    ch->cropping_a);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Width Dev A",
-				    ch->width_a);
-		ia_css_debug_dtrace(2, "\t\t%-32s: 0x%X\n", "Stride Dev B",
-				    ch->stride_b);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Elems Dev B",
-				    ch->elems_b);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Cropping Dev B",
-				    ch->cropping_b);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Width Dev B",
-				    ch->width_b);
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "Height", ch->height);
-	}
-	ia_css_debug_dtrace(2, "\n");
-	return;
-}
-
-void ia_css_debug_dump_dma_sp_fifo_state(void)
-{
-	fifo_channel_state_t dma_to_sp, sp_to_dma;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_DMA0_TO_SP0, &dma_to_sp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_SP0_TO_DMA0, &sp_to_dma);
-	debug_print_fifo_channel_state(&dma_to_sp, "DMA to SP");
-	debug_print_fifo_channel_state(&sp_to_dma, "SP to DMA");
-	return;
-}
-
-void ia_css_debug_dump_dma_isp_fifo_state(void)
-{
-	fifo_channel_state_t dma_to_isp, isp_to_dma;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_DMA0_TO_ISP0, &dma_to_isp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_ISP0_TO_DMA0, &isp_to_dma);
-	debug_print_fifo_channel_state(&dma_to_isp, "DMA to ISP");
-	debug_print_fifo_channel_state(&isp_to_dma, "ISP to DMA");
-	return;
-}
-
-void ia_css_debug_dump_isp_sp_fifo_state(void)
-{
-	fifo_channel_state_t sp_to_isp, isp_to_sp;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_SP0_TO_ISP0, &sp_to_isp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_ISP0_TO_SP0, &isp_to_sp);
-	debug_print_fifo_channel_state(&sp_to_isp, "SP to ISP");
-	debug_print_fifo_channel_state(&isp_to_sp, "ISP to SP");
-	return;
-}
-
-void ia_css_debug_dump_isp_gdc_fifo_state(void)
-{
-	fifo_channel_state_t gdc_to_isp, isp_to_gdc;
-
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_GDC0_TO_ISP0, &gdc_to_isp);
-	fifo_channel_get_state(FIFO_MONITOR0_ID,
-			       FIFO_CHANNEL_ISP0_TO_GDC0, &isp_to_gdc);
-	debug_print_fifo_channel_state(&gdc_to_isp, "GDC to ISP");
-	debug_print_fifo_channel_state(&isp_to_gdc, "ISP to GDC");
-	return;
-}
-
 void ia_css_debug_dump_all_fifo_state(void)
 {
 	int i;
@@ -1579,213 +821,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 }
 #endif
 
-#if !defined(ISP2401)
-static void debug_print_rx_mipi_port_state(mipi_port_state_t *state)
-{
-	int i;
-	unsigned int bits, infos;
-
-	assert(state);
-
-	bits = state->irq_status;
-	infos = ia_css_isys_rx_translate_irq_infos(bits);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: (irq reg = 0x%X)\n",
-			    "receiver errors", bits);
-
-	if (infos & IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN)
-		ia_css_debug_dtrace(2, "\t\t\tbuffer overrun\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_SOT)
-		ia_css_debug_dtrace(2, "\t\t\tstart-of-transmission error\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_SOT_SYNC)
-		ia_css_debug_dtrace(2, "\t\t\tstart-of-transmission sync error\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_CONTROL)
-		ia_css_debug_dtrace(2, "\t\t\tcontrol error\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_ECC_DOUBLE)
-		ia_css_debug_dtrace(2, "\t\t\t2 or more ECC errors\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_CRC)
-		ia_css_debug_dtrace(2, "\t\t\tCRC mismatch\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ID)
-		ia_css_debug_dtrace(2, "\t\t\tunknown error\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_FRAME_SYNC)
-		ia_css_debug_dtrace(2, "\t\t\tframe sync error\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_FRAME_DATA)
-		ia_css_debug_dtrace(2, "\t\t\tframe data error\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_DATA_TIMEOUT)
-		ia_css_debug_dtrace(2, "\t\t\tdata timeout\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_UNKNOWN_ESC)
-		ia_css_debug_dtrace(2, "\t\t\tunknown escape command entry\n");
-	if (infos & IA_CSS_RX_IRQ_INFO_ERR_LINE_SYNC)
-		ia_css_debug_dtrace(2, "\t\t\tline sync error\n");
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "device_ready", state->device_ready);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "irq_status", state->irq_status);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "irq_enable", state->irq_enable);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "timeout_count", state->timeout_count);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "init_count", state->init_count);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "raw16_18", state->raw16_18);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "sync_count", state->sync_count);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "rx_count", state->rx_count);
-
-	for (i = 0; i < MIPI_4LANE_CFG; i++) {
-		ia_css_debug_dtrace(2, "\t\t%-32s%d%-32s: %d\n",
-				    "lane_sync_count[", i, "]",
-				    state->lane_sync_count[i]);
-	}
-
-	for (i = 0; i < MIPI_4LANE_CFG; i++) {
-		ia_css_debug_dtrace(2, "\t\t%-32s%d%-32s: %d\n",
-				    "lane_rx_count[", i, "]",
-				    state->lane_rx_count[i]);
-	}
-
-	return;
-}
-
-static void debug_print_rx_channel_state(rx_channel_state_t *state)
-{
-	int i;
-
-	assert(state);
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "compression_scheme0", state->comp_scheme0);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "compression_scheme1", state->comp_scheme1);
-
-	for (i = 0; i < N_MIPI_FORMAT_CUSTOM; i++) {
-		ia_css_debug_dtrace(2, "\t\t%-32s%d: %d\n",
-				    "MIPI Predictor ", i, state->pred[i]);
-	}
-
-	for (i = 0; i < N_MIPI_FORMAT_CUSTOM; i++) {
-		ia_css_debug_dtrace(2, "\t\t%-32s%d: %d\n",
-				    "MIPI Compressor ", i, state->comp[i]);
-	}
-
-	return;
-}
-
-static void debug_print_rx_state(receiver_state_t *state)
-{
-	int i;
-
-	assert(state);
-	ia_css_debug_dtrace(2, "CSI Receiver State:\n");
-
-	ia_css_debug_dtrace(2, "\tConfiguration:\n");
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "fs_to_ls_delay", state->fs_to_ls_delay);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "ls_to_data_delay", state->ls_to_data_delay);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "data_to_le_delay", state->data_to_le_delay);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "le_to_fe_delay", state->le_to_fe_delay);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "fe_to_fs_delay", state->fe_to_fs_delay);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "le_to_fs_delay", state->le_to_fs_delay);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "is_two_ppc", state->is_two_ppc);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "backend_rst", state->backend_rst);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "raw18", state->raw18);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "force_raw8", state->force_raw8);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "raw16", state->raw16);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_gsp_acc_ovl", state->be_gsp_acc_ovl);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "be_srst", state->be_srst);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_is_two_ppc", state->be_is_two_ppc);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_comp_format0", state->be_comp_format0);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_comp_format1", state->be_comp_format1);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_comp_format2", state->be_comp_format2);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_comp_format3", state->be_comp_format3);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n", "be_sel", state->be_sel);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_raw16_config", state->be_raw16_config);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_raw18_config", state->be_raw18_config);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_force_raw8", state->be_force_raw8);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_irq_status", state->be_irq_status);
-
-	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-			    "be_irq_clear", state->be_irq_clear);
-
-	/* mipi port state */
-	for (i = 0; i < N_MIPI_PORT_ID; i++) {
-		ia_css_debug_dtrace(2, "\tMIPI Port %d State:\n", i);
-
-		debug_print_rx_mipi_port_state(&state->mipi_port_state[i]);
-	}
-	/* end of mipi port state */
-
-	/* rx channel state */
-	for (i = 0; i < N_RX_CHANNEL_ID; i++) {
-		ia_css_debug_dtrace(2, "\tRX Channel %d State:\n", i);
-
-		debug_print_rx_channel_state(&state->rx_channel_state[i]);
-	}
-	/* end of rx channel state */
-
-	return;
-}
-#endif
-
-void ia_css_debug_dump_rx_state(void)
-{
-#if !defined(ISP2401)
-	receiver_state_t state;
-
-	receiver_get_state(RX0_ID, &state);
-	debug_print_rx_state(&state);
-#endif
-}
-
 void ia_css_debug_dump_sp_sw_debug_info(void)
 {
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -1799,57 +834,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 	return;
 }
 
-void ia_css_debug_dump_debug_info(const char *context)
-{
-	if (!context)
-		context = "No Context provided";
-
-	ia_css_debug_dtrace(2, "CSS Debug Info dump [Context = %s]\n", context);
-	if (!IS_ISP2401)
-		ia_css_debug_dump_rx_state();
-
-#ifndef ISP2401
-	ia_css_debug_dump_if_state();
-#endif
-	ia_css_debug_dump_isp_state();
-	ia_css_debug_dump_isp_sp_fifo_state();
-	ia_css_debug_dump_isp_gdc_fifo_state();
-	ia_css_debug_dump_sp_state();
-	ia_css_debug_dump_perf_counters();
-	ia_css_debug_dump_dma_isp_fifo_state();
-	ia_css_debug_dump_dma_sp_fifo_state();
-	ia_css_debug_dump_dma_state();
-
-	if (!IS_ISP2401) {
-		struct irq_controller_state state;
-
-		irq_controller_get_state(IRQ2_ID, &state);
-
-		ia_css_debug_dtrace(2, "\t%-32s:\n",
-				    "Input System IRQ Controller State");
-
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-				    "irq_edge", state.irq_edge);
-
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-				    "irq_mask", state.irq_mask);
-
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-				    "irq_status", state.irq_status);
-
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-				    "irq_enable", state.irq_enable);
-
-		ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
-				    "irq_level_not_pulse",
-				    state.irq_level_not_pulse);
-	}
-
-	ia_css_debug_tagger_state();
-
-	return;
-}
-
 /* this function is for debug use, it can make SP go to sleep
   state after each frame, then user can dump the stable SP dmem.
   this function can be called after ia_css_start_sp()
@@ -2038,36 +1022,6 @@ void ia_css_debug_dump_isp_binary(void)
 	}
 }
 
-void ia_css_debug_dump_perf_counters(void)
-{
-	const struct ia_css_fw_info *fw;
-	int i;
-	unsigned int HIVE_ADDR_ia_css_isys_sp_error_cnt;
-	/* N_MIPI_PORT_ID + 1: 3 Capture Units and 1 Acquire Unit. */
-	s32 ia_css_sp_input_system_error_cnt[N_MIPI_PORT_ID + 1];
-
-	if (IS_ISP2401)
-		return;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "Input System Error Counters:\n");
-
-	fw = &sh_css_sp_fw;
-	HIVE_ADDR_ia_css_isys_sp_error_cnt =
-	    fw->info.sp.perf_counter_input_system_error;
-
-	(void)HIVE_ADDR_ia_css_isys_sp_error_cnt;
-
-	sp_dmem_load(SP0_ID,
-		     (unsigned int)sp_address_of(ia_css_isys_sp_error_cnt),
-		     &ia_css_sp_input_system_error_cnt,
-		     sizeof(ia_css_sp_input_system_error_cnt));
-
-	for (i = 0; i < N_MIPI_PORT_ID + 1; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\tport[%d] = %d\n",
-				    i, ia_css_sp_input_system_error_cnt[i]);
-	}
-}
-
 /*
  * @brief Initialize the debug mode.
  * Refer to "ia_css_debug.h" for more details.
@@ -2939,32 +1893,6 @@ void ia_css_debug_dump_trace(void)
 #endif
 }
 
-/* Tagger state dump function. The tagger is only available when the CSS
- * contains an input system (2400 or 2401). */
-void ia_css_debug_tagger_state(void)
-{
-	unsigned int i;
-	unsigned int HIVE_ADDR_tagger_frames;
-	ia_css_tagger_buf_sp_elem_t tbuf_frames[MAX_CB_ELEMS_FOR_TAGGER];
-
-	HIVE_ADDR_tagger_frames = sh_css_sp_fw.info.sp.tagger_frames_addr;
-
-	/* This variable is not used in crun */
-	(void)HIVE_ADDR_tagger_frames;
-
-	/* 2400 and 2401 only have 1 SP, so the tagger lives on SP0 */
-	sp_dmem_load(SP0_ID,
-		     (unsigned int)sp_address_of(tagger_frames),
-		     tbuf_frames,
-		     sizeof(tbuf_frames));
-
-	ia_css_debug_dtrace(2, "Tagger Info:\n");
-	for (i = 0; i < MAX_CB_ELEMS_FOR_TAGGER; i++) {
-		ia_css_debug_dtrace(2, "\t tagger frame[%d]: exp_id=%d, marked=%d, locked=%d\n",
-				    i, tbuf_frames[i].exp_id, tbuf_frames[i].mark, tbuf_frames[i].lock);
-	}
-}
-
 /* ISP2401 */
 void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps)
 {
-- 
2.41.0

