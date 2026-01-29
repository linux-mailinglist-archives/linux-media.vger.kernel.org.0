Return-Path: <linux-media+bounces-51781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM0uJK1Je2kdDQIAu9opvQ
	(envelope-from <linux-media+bounces-51781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:51:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 251EFAFCEB
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C930A30214D4
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 11:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1A1381707;
	Thu, 29 Jan 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGHaAwCX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D32218592
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687464; cv=none; b=YjQmpzonOc81VcZtzXCWsawZpSrOIC0Xdb/Tft4RB4S50bCk3nZMV1CqwWlIpk6CrCTnlatpBm0dNjTkXUMxzCjSqRM1UBSzvfZkTX6f0t7vhO6KY8FPGenJJmH+gj/zVjT7rmev7gslHY23UmF2V4EgGfxsdu7CuxufKm8BqSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687464; c=relaxed/simple;
	bh=pMYimvPY+ASGS8tuTQ82CapExXgHP0Xm1BfnHacC5zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPD6JNZ8FWsequCR2I+AlxTKHvBOi65HvXIsQmkyLbBWcmmhRp0zocjWSOlFpVZ6r3n6Gg8yfeO8O6rzkmRbzHhWfmYpdhNch/nUoJSSzbCdfeCNHP9pAhXTAnCoRsw1E8jtiwMe6hlRFX2fq9bEqiWP2v9bIZou/a0BfdFl8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGHaAwCX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dd22b9895so1124654e87.0
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 03:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769687461; x=1770292261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ4UfEooGRwMgcE9zFs4goZGZioLEY6sdVTgIStKFEU=;
        b=MGHaAwCX5PuwqbTnH3a+h0Wd8Uo77kgKOseQb+v7aKKvnixeRnimqdtEaiyMCAkmP5
         A8UZtY/2FaUguKJvTOFCo/By0WEZ2MHSFmYZURqxXKUFd6bKrCPzRunINsubgqvY5SsO
         TDIUWcga9aOCptnk12C5MysTr5mEgldB43B2gWaNWpiJOJz3+zdUnQtbzLnsswnuGXuN
         dr7MeyFrdJ116C5i/pik52FTeztiVYTKdtxUBuxkXC8rMdRZcns5/iqZYEw2vwS6UOPB
         GwfSS0lzhKao9cuQB6g0RnJdnupoJJYWI64VniTUi2RZ68AdaQ//4SFMQfLQX0S/QaLa
         SgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687461; x=1770292261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ4UfEooGRwMgcE9zFs4goZGZioLEY6sdVTgIStKFEU=;
        b=sDtDhtCQfji+5RbWQu1PlFNzXrav/dgbSx4NMhP71jifJRqZl/KsNtc31En/u5uI1k
         RDZNuxO6C8+J8YQRUxoHJB/jRtOffPDw/s8KoAXKVerSAHGYNh14X9oljk/nAhWCSLXO
         Jp64iXvYFkyFD/r5XhGXgiYOFR4CXnIJz8CL4VREWhXAsUti157AVkQiu+1/c+zUDUjd
         u+y1PH31N7n6o/w6Fdtx67eSaDGzEkxvXiKjg8e1c3RaYJgoRwDRZ9ri4jPoJ9fOnJeV
         eZCZVGPu5ZYKR4hQZ/yyx1uebDdDtXcdYuP1/hy9zCG0dm0h1pACoiMlz8vU+YNa6/l5
         quOw==
X-Forwarded-Encrypted: i=1; AJvYcCWAedp0rJsMT9+6d26U1UHZ56p1qaFBE6NU5EjgaIq/vSxa+h/tBg+xYFTEUa4VYCy8wcpjfpQ9AeVnaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlKhV/XuYKkx4J4yNhICGZep8fqU941zM5q/son4v4hCxqYzoK
	qLihaJ4plso01BSKqMf2CJdJqh/jigDPqPT+VhUqZKjMV8TyGV1aiTWr
X-Gm-Gg: AZuq6aKGXOffXYtmIvo3QveHQevIwqplH404Zd7ztp+mGyAygsC+YeiBOgRoA0xDhVm
	7XjyO4QN0bcHGtIJR/lvkB0DQecvWHLfVF7Rig1THZ8sNIXHuO+T2eEI30pMlkfvlylZRCDpqNs
	7Fy/Pq6/E52Hl80eT2L7w69DD+g617YZ7zHMsHmyQyYyodKUaGlAw1ETmMEToSPgYEG2/v8XFXK
	LKE17f5fLcJGc6dxDDIz64wolnDJrb2u5Mo7zU/Bdqk11L8pRnxBv4dkHxMweNXFlVhp4F+/eFV
	HMRjuhlQLJ1Zhmbukt5itLgeZ7LcpuYOkTORTjYcWWj4R8c0vqCglkpIhNYw5UO/Cg2mF+wWjuA
	TL/p5En/AgS1fKfUwS6pT/xLWq+1O1ffS8TYK8AWFEODxmapmjNH9FXw=
X-Received: by 2002:a05:6512:3e1a:b0:59e:13e8:fdbf with SMTP id 2adb3069b0e04-59e13e8ff3dmr10262e87.23.1769687460550;
        Thu, 29 Jan 2026 03:51:00 -0800 (PST)
Received: from gentoo ([2a09:bac1:6180:68::387:49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481989sm1080603e87.3.2026.01.29.03.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:51:00 -0800 (PST)
From: Nikita Kobylkin <violet.develop@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	Nikita Kobylkin <violet.develop@gmail.com>
Subject: [PATCH] input_formatter.c: cleanup code for readability
Date: Thu, 29 Jan 2026 19:49:33 +0800
Message-ID: <20260129114933.10134-1-violet.develop@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51781-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[violetdevelop@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 251EFAFCEB
X-Rspamd-Action: no action

Just small cleanup for easier reading:
- Remove unnecessary 'return;' in void functions.
- Adjust indentation and spacing.

No functional changes here.

Signed-off-by: Nikita Kobylkin <violet.develop@gmail.com>
---
 .../host/input_formatter.c                    | 136 +++++++++---------
 1 file changed, 64 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48..de39b74dd 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -48,7 +48,7 @@ static const bool HIVE_IF_BIN_COPY[N_INPUT_FORMATTER_ID] = {
 };
 
 void input_formatter_rst(
-    const input_formatter_ID_t		ID)
+	const input_formatter_ID_t		ID)
 {
 	hrt_address	addr;
 	hrt_data	rst;
@@ -65,12 +65,10 @@ void input_formatter_rst(
 	if (!HIVE_IF_BIN_COPY[ID]) {
 		input_formatter_reg_store(ID, addr, rst);
 	}
-
-	return;
 }
 
 unsigned int input_formatter_get_alignment(
-    const input_formatter_ID_t		ID)
+	const input_formatter_ID_t		ID)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 
@@ -78,22 +76,21 @@ unsigned int input_formatter_get_alignment(
 }
 
 void input_formatter_set_fifo_blocking_mode(
-    const input_formatter_ID_t		ID,
-    const bool						enable)
+	const input_formatter_ID_t		ID,
+	const bool						enable)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 
 	/* cnd_input_formatter_reg_store() */
 	if (!HIVE_IF_BIN_COPY[ID]) {
 		input_formatter_reg_store(ID,
-					  HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS, enable);
+						HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS, enable);
 	}
-	return;
 }
 
 void input_formatter_get_switch_state(
-    const input_formatter_ID_t		ID,
-    input_formatter_switch_state_t	*state)
+	const input_formatter_ID_t		ID,
+	input_formatter_switch_state_t	*state)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 	assert(state);
@@ -102,113 +99,109 @@ void input_formatter_get_switch_state(
 	(void)ID;
 
 	state->if_input_switch_lut_reg[0] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg0);
+					_REG_GP_IFMT_input_switch_lut_reg0);
 	state->if_input_switch_lut_reg[1] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg1);
+					_REG_GP_IFMT_input_switch_lut_reg1);
 	state->if_input_switch_lut_reg[2] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg2);
+					_REG_GP_IFMT_input_switch_lut_reg2);
 	state->if_input_switch_lut_reg[3] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg3);
+					_REG_GP_IFMT_input_switch_lut_reg3);
 	state->if_input_switch_lut_reg[4] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg4);
+					_REG_GP_IFMT_input_switch_lut_reg4);
 	state->if_input_switch_lut_reg[5] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg5);
+					_REG_GP_IFMT_input_switch_lut_reg5);
 	state->if_input_switch_lut_reg[6] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg6);
+					_REG_GP_IFMT_input_switch_lut_reg6);
 	state->if_input_switch_lut_reg[7] = gp_device_reg_load(GP_DEVICE0_ID,
-					    _REG_GP_IFMT_input_switch_lut_reg7);
+					_REG_GP_IFMT_input_switch_lut_reg7);
 	state->if_input_switch_fsync_lut = gp_device_reg_load(GP_DEVICE0_ID,
-					   _REG_GP_IFMT_input_switch_fsync_lut);
+					_REG_GP_IFMT_input_switch_fsync_lut);
 	state->if_input_switch_ch_id_fmt_type = gp_device_reg_load(GP_DEVICE0_ID,
-						_REG_GP_IFMT_input_switch_ch_id_fmt_type);
-
-	return;
+					_REG_GP_IFMT_input_switch_ch_id_fmt_type);
 }
 
 void input_formatter_get_state(
-    const input_formatter_ID_t		ID,
-    input_formatter_state_t			*state)
+	const input_formatter_ID_t		ID,
+	input_formatter_state_t			*state)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 	assert(state);
 	/*
-		state->reset = input_formatter_reg_load(ID,
-			HIVE_IF_RESET_ADDRESS);
+	 *	state->reset = input_formatter_reg_load(ID,
+	 *		HIVE_IF_RESET_ADDRESS);
 	 */
 	state->start_line = input_formatter_reg_load(ID,
-			    HIVE_IF_START_LINE_ADDRESS);
+						HIVE_IF_START_LINE_ADDRESS);
 	state->start_column = input_formatter_reg_load(ID,
-			      HIVE_IF_START_COLUMN_ADDRESS);
+						HIVE_IF_START_COLUMN_ADDRESS);
 	state->cropped_height = input_formatter_reg_load(ID,
-				HIVE_IF_CROPPED_HEIGHT_ADDRESS);
+						HIVE_IF_CROPPED_HEIGHT_ADDRESS);
 	state->cropped_width = input_formatter_reg_load(ID,
-			       HIVE_IF_CROPPED_WIDTH_ADDRESS);
+						HIVE_IF_CROPPED_WIDTH_ADDRESS);
 	state->ver_decimation = input_formatter_reg_load(ID,
-				HIVE_IF_VERTICAL_DECIMATION_ADDRESS);
+						HIVE_IF_VERTICAL_DECIMATION_ADDRESS);
 	state->hor_decimation = input_formatter_reg_load(ID,
-				HIVE_IF_HORIZONTAL_DECIMATION_ADDRESS);
+						HIVE_IF_HORIZONTAL_DECIMATION_ADDRESS);
 	state->hor_deinterleaving = input_formatter_reg_load(ID,
-				    HIVE_IF_H_DEINTERLEAVING_ADDRESS);
+						HIVE_IF_H_DEINTERLEAVING_ADDRESS);
 	state->left_padding = input_formatter_reg_load(ID,
-			      HIVE_IF_LEFTPADDING_WIDTH_ADDRESS);
+						HIVE_IF_LEFTPADDING_WIDTH_ADDRESS);
 	state->eol_offset = input_formatter_reg_load(ID,
-			    HIVE_IF_END_OF_LINE_OFFSET_ADDRESS);
+						HIVE_IF_END_OF_LINE_OFFSET_ADDRESS);
 	state->vmem_start_address = input_formatter_reg_load(ID,
-				    HIVE_IF_VMEM_START_ADDRESS_ADDRESS);
+						HIVE_IF_VMEM_START_ADDRESS_ADDRESS);
 	state->vmem_end_address = input_formatter_reg_load(ID,
-				  HIVE_IF_VMEM_END_ADDRESS_ADDRESS);
+						HIVE_IF_VMEM_END_ADDRESS_ADDRESS);
 	state->vmem_increment = input_formatter_reg_load(ID,
-				HIVE_IF_VMEM_INCREMENT_ADDRESS);
+						HIVE_IF_VMEM_INCREMENT_ADDRESS);
 	state->is_yuv420 = input_formatter_reg_load(ID,
-			   HIVE_IF_YUV_420_FORMAT_ADDRESS);
+						HIVE_IF_YUV_420_FORMAT_ADDRESS);
 	state->vsync_active_low = input_formatter_reg_load(ID,
-				  HIVE_IF_VSYNCK_ACTIVE_LOW_ADDRESS);
+						HIVE_IF_VSYNCK_ACTIVE_LOW_ADDRESS);
 	state->hsync_active_low = input_formatter_reg_load(ID,
-				  HIVE_IF_HSYNCK_ACTIVE_LOW_ADDRESS);
+						HIVE_IF_HSYNCK_ACTIVE_LOW_ADDRESS);
 	state->allow_fifo_overflow = input_formatter_reg_load(ID,
-				     HIVE_IF_ALLOW_FIFO_OVERFLOW_ADDRESS);
+						HIVE_IF_ALLOW_FIFO_OVERFLOW_ADDRESS);
 	state->block_fifo_when_no_req = input_formatter_reg_load(ID,
-					HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS);
+						HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS);
 	state->ver_deinterleaving = input_formatter_reg_load(ID,
-				    HIVE_IF_V_DEINTERLEAVING_ADDRESS);
+						HIVE_IF_V_DEINTERLEAVING_ADDRESS);
 	/* FSM */
 	state->fsm_sync_status = input_formatter_reg_load(ID,
-				 HIVE_IF_FSM_SYNC_STATUS);
+						HIVE_IF_FSM_SYNC_STATUS);
 	state->fsm_sync_counter = input_formatter_reg_load(ID,
-				  HIVE_IF_FSM_SYNC_COUNTER);
+						HIVE_IF_FSM_SYNC_COUNTER);
 	state->fsm_crop_status = input_formatter_reg_load(ID,
-				 HIVE_IF_FSM_CROP_STATUS);
+						HIVE_IF_FSM_CROP_STATUS);
 	state->fsm_crop_line_counter = input_formatter_reg_load(ID,
-				       HIVE_IF_FSM_CROP_LINE_COUNTER);
+						HIVE_IF_FSM_CROP_LINE_COUNTER);
 	state->fsm_crop_pixel_counter = input_formatter_reg_load(ID,
-					HIVE_IF_FSM_CROP_PIXEL_COUNTER);
+						HIVE_IF_FSM_CROP_PIXEL_COUNTER);
 	state->fsm_deinterleaving_index = input_formatter_reg_load(ID,
-					  HIVE_IF_FSM_DEINTERLEAVING_IDX);
+						HIVE_IF_FSM_DEINTERLEAVING_IDX);
 	state->fsm_dec_h_counter = input_formatter_reg_load(ID,
-				   HIVE_IF_FSM_DECIMATION_H_COUNTER);
+						HIVE_IF_FSM_DECIMATION_H_COUNTER);
 	state->fsm_dec_v_counter = input_formatter_reg_load(ID,
-				   HIVE_IF_FSM_DECIMATION_V_COUNTER);
+						HIVE_IF_FSM_DECIMATION_V_COUNTER);
 	state->fsm_dec_block_v_counter = input_formatter_reg_load(ID,
-					 HIVE_IF_FSM_DECIMATION_BLOCK_V_COUNTER);
+						HIVE_IF_FSM_DECIMATION_BLOCK_V_COUNTER);
 	state->fsm_padding_status = input_formatter_reg_load(ID,
-				    HIVE_IF_FSM_PADDING_STATUS);
+						HIVE_IF_FSM_PADDING_STATUS);
 	state->fsm_padding_elem_counter = input_formatter_reg_load(ID,
-					  HIVE_IF_FSM_PADDING_ELEMENT_COUNTER);
+						HIVE_IF_FSM_PADDING_ELEMENT_COUNTER);
 	state->fsm_vector_support_error = input_formatter_reg_load(ID,
-					  HIVE_IF_FSM_VECTOR_SUPPORT_ERROR);
+						HIVE_IF_FSM_VECTOR_SUPPORT_ERROR);
 	state->fsm_vector_buffer_full = input_formatter_reg_load(ID,
-					HIVE_IF_FSM_VECTOR_SUPPORT_BUFF_FULL);
+						HIVE_IF_FSM_VECTOR_SUPPORT_BUFF_FULL);
 	state->vector_support = input_formatter_reg_load(ID,
-				HIVE_IF_FSM_VECTOR_SUPPORT);
+						HIVE_IF_FSM_VECTOR_SUPPORT);
 	state->sensor_data_lost = input_formatter_reg_load(ID,
-				  HIVE_IF_FIFO_SENSOR_STATUS);
-
-	return;
+						HIVE_IF_FIFO_SENSOR_STATUS);
 }
 
 void input_formatter_bin_get_state(
-    const input_formatter_ID_t		ID,
-    input_formatter_bin_state_t		*state)
+	const input_formatter_ID_t		ID,
+	input_formatter_bin_state_t		*state)
 {
 	assert(ID < N_INPUT_FORMATTER_ID);
 	assert(state);
@@ -216,20 +209,19 @@ void input_formatter_bin_get_state(
 	state->reset = input_formatter_reg_load(ID,
 						HIVE_STR2MEM_SOFT_RESET_REG_ADDRESS);
 	state->input_endianness = input_formatter_reg_load(ID,
-				  HIVE_STR2MEM_INPUT_ENDIANNESS_REG_ADDRESS);
+						HIVE_STR2MEM_INPUT_ENDIANNESS_REG_ADDRESS);
 	state->output_endianness = input_formatter_reg_load(ID,
-				   HIVE_STR2MEM_OUTPUT_ENDIANNESS_REG_ADDRESS);
+						HIVE_STR2MEM_OUTPUT_ENDIANNESS_REG_ADDRESS);
 	state->bitswap = input_formatter_reg_load(ID,
-			 HIVE_STR2MEM_BIT_SWAPPING_REG_ADDRESS);
+						HIVE_STR2MEM_BIT_SWAPPING_REG_ADDRESS);
 	state->block_synch = input_formatter_reg_load(ID,
-			     HIVE_STR2MEM_BLOCK_SYNC_LEVEL_REG_ADDRESS);
+						HIVE_STR2MEM_BLOCK_SYNC_LEVEL_REG_ADDRESS);
 	state->packet_synch = input_formatter_reg_load(ID,
-			      HIVE_STR2MEM_PACKET_SYNC_LEVEL_REG_ADDRESS);
+						HIVE_STR2MEM_PACKET_SYNC_LEVEL_REG_ADDRESS);
 	state->readpostwrite_synch = input_formatter_reg_load(ID,
-				     HIVE_STR2MEM_READ_POST_WRITE_SYNC_ENABLE_REG_ADDRESS);
+						HIVE_STR2MEM_READ_POST_WRITE_SYNC_ENABLE_REG_ADDRESS);
 	state->is_2ppc = input_formatter_reg_load(ID,
-			 HIVE_STR2MEM_DUAL_BYTE_INPUTS_ENABLED_REG_ADDRESS);
+						HIVE_STR2MEM_DUAL_BYTE_INPUTS_ENABLED_REG_ADDRESS);
 	state->en_status_update = input_formatter_reg_load(ID,
-				  HIVE_STR2MEM_EN_STAT_UPDATE_ADDRESS);
-	return;
+						HIVE_STR2MEM_EN_STAT_UPDATE_ADDRESS);
 }
-- 
2.52.0


