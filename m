Return-Path: <linux-media+bounces-52413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF08Lj3viWn4EQAAu9opvQ
	(envelope-from <linux-media+bounces-52413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:29:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C011053C
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DB783006831
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 14:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51B437B3F9;
	Mon,  9 Feb 2026 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="pCCsjBtK"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533537A496
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 14:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.72.123.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647355; cv=none; b=LafFNSJVxxeEa9KTpl66kqPO/STf4yvVUIbASmoJMyhHXCiutgVCcSSVFaMh2yZTlchEJKFqNGngzNGq6GOvIaaEYxU99rdZolVU/hn5jUa7+/1AUMextCb0UnZ4OJ5kyY6ZV4CpiI2oN72uL3f8D/nyJO0JmNO2lLqy5GU7aDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647355; c=relaxed/simple;
	bh=kRMqr5xrPDZRamudhsdBXVPl+XCjGxQFE2w38BAFjTk=;
	h=From:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 To:Cc:Content-Type; b=sE7FPWwG3mujzvOsQRHyY/0qJph+VxiIx1btFS+P8HfRNZ4aDwxntI3z/jzEw1vnWtqbv/cWQOdfd5Gm3A0Nn25ef60HZ+ukx4PdLKQGbV+WPPACvk+RfxpcXjXPY+6ByFz/sLwVfgRVbI77vMeRLOJSShrALRAi/zK/js/mjAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=pCCsjBtK; arc=none smtp.client-ip=149.72.123.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=8h4ElfD8RLOMH+CoJ0ArRM9pRt/oNCYHnDkEj1Q0kg8=;
	b=pCCsjBtKkgl63XDYjSvHAimEXqgZwd/HIzMX8dH1/7y6ooRu4GwvqzIBUVxt0tF6HtKA
	wQH9KH34Fech5DkvZWE8KcaCDyBKVJCXFUSzkZPvtKHSOeNh1P4uKupnWMuB9z1bryqxwh
	oCuk7pDSwRB12vNzCRh9o7jl2yCqJEo7jF8GMHQJ7O5dP011Kna1vX1BwN8OgR1VmQm5VI
	lP48e3ZGtgOClEs0wJv+lD9K61XDUVbb1DHV01qXsszOioMWYlZjCFZzxieZr0rpn2sf7F
	cK8X4qjfMmJni/cNlmm+kutYvdp+EIuDWSM7cAEajCgMqNiFyc9kED1mcJ3Hnw8A==
Received: by recvd-5cfbd549cb-qnvmg with SMTP id recvd-5cfbd549cb-qnvmg-1-6989EF38-3
	2026-02-09 14:29:12.961714044 +0000 UTC m=+111003.335896806
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-7 (SG) with ESMTP
	id jHTa8d1pTU6rCul1ZJcq0g
	Mon, 09 Feb 2026 14:29:12.757 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id D7C8741178;
	Mon,  9 Feb 2026 14:29:11 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 2/3] staging: media: atomisp: Remove braces for single
 statement blocks
Date: Mon, 09 Feb 2026 14:29:13 +0000 (UTC)
Message-ID: <20260209142820.650334-3-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209142820.650334-1-matt@mattwardle.net>
References: <20260209142820.650334-1-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brRWSGClgYT5G?=
 =?us-ascii?Q?g+0l3Te8qooCKTCU5=2FT4KPDpqEDOmGpchr7mX6S?=
 =?us-ascii?Q?xKQLq+T94TrSzGNnkvuhDlZiI3DXNFKRETyJpl8?=
 =?us-ascii?Q?cPkPNmlyU4NVTpP+2RRsfukGyq1I4sdoT91vrBS?=
 =?us-ascii?Q?jguhvTQ8smXYrWJJN+SwBxxa9TQQL0Dd+T2w=2FSR?= =?us-ascii?Q?JMUU?=
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matt Wardle
	<matt@mattwardle.net>
X-Entity-ID: u001.OAl4HwJfzvoR6h5DRlrySA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[149.72.123.24:received];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52413-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[mattwardle.net,reject];
	R_DKIM_ALLOW(0.00)[mattwardle.net:s=s1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mattwardle.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@mattwardle.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	TAGGED_RCPT(0.00)[linux-media];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mattwardle.net:mid,mattwardle.net:dkim,mattwardle.net:email,checkpatch.pl:url]
X-Rspamd-Queue-Id: 3E9C011053C
X-Rspamd-Action: no action

Fix checkpatch.pl warnings:

WARNING: braces {} are not necessary for single statement blocks
WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Matt Wardle <matt@mattwardle.net>
---
 .../base/circbuf/interface/ia_css_circbuf.h   |  3 +-
 .../circbuf/interface/ia_css_circbuf_desc.h   |  3 +-
 .../atomisp/pci/base/refcount/src/refcount.c  |  3 +-
 .../pci/camera/pipe/src/pipe_stagedesc.c      |  9 ++----
 .../atomisp/pci/camera/pipe/src/pipe_util.c   |  3 +-
 .../host/isys_stream2mmio_private.h           |  3 +-
 .../host/event_fifo_private.h                 |  3 +-
 .../host/input_formatter.c                    |  3 +-
 .../hive_isp_css_common/host/input_system.c   | 14 ++++-----
 .../pci/hive_isp_css_common/host/irq.c        | 30 ++++++++-----------
 .../pci/hive_isp_css_common/host/mmu.c        |  3 +-
 .../pci/hive_isp_css_common/host/vmem.c       |  4 +--
 .../isp/kernels/anr/anr_2/ia_css_anr2.host.c  |  3 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c   |  6 ++--
 .../isp/kernels/ctc/ctc2/ia_css_ctc2.host.c   |  7 ++---
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 13 ++++----
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c |  3 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  6 ++--
 .../atomisp/pci/runtime/binary/src/binary.c   |  3 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  6 ++--
 .../pci/runtime/isys/src/virtual_isys.c       |  3 +-
 .../pci/runtime/pipeline/src/pipeline.c       |  3 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 12 +++-----
 23 files changed, 53 insertions(+), 93 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 86300991d30e..148f9f6febfb 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -146,9 +146,8 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
 	OP___assert(cb->desc->size > 0);
 
 	/* step 1: adjudst the offset  */
-	while (offset < 0) {
+	while (offset < 0)
 		offset += cb->desc->size;
-	}
 
 	/* step 2: shift and round by the upper limit */
 	dest = OP_std_modadd(base, offset, cb->desc->size);
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
index 5645a7bf493c..3d89626a0733 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
@@ -84,9 +84,8 @@ static inline uint8_t ia_css_circbuf_desc_get_pos_at_offset(
 	OP___assert(cb_desc->size > 0);
 
 	/* step 1: adjust the offset  */
-	while (offset < 0) {
+	while (offset < 0)
 		offset += cb_desc->size;
-	}
 
 	/* step 2: shift and round by the upper limit */
 	dest = OP_std_modadd(base, offset, cb_desc->size);
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 58e4e3173b40..4a8675d0129a 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -238,9 +238,8 @@ void ia_css_refcount_clear(s32 id, clear_func clear_func_ptr)
 				hmm_free(entry->data);
 			}
 
-			if (entry->count != 0) {
+			if (entry->count != 0)
 				IA_CSS_WARNING("Ref count for entry %x is not zero!", entry->id);
-			}
 
 			assert(entry->count == 0);
 
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
index a9f736398f50..fa2f8ed5b053 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
@@ -32,9 +32,8 @@ void ia_css_pipe_get_generic_stage_desc(
 	stage_desc->max_input_width = 0;
 	stage_desc->mode = binary->info->sp.pipeline.mode;
 	stage_desc->in_frame = in_frame;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		stage_desc->out_frame[i] = out_frame[i];
-	}
 	stage_desc->vf_frame = vf_frame;
 ERR:
 	IA_CSS_LEAVE_PRIVATE("");
@@ -59,9 +58,8 @@ void ia_css_pipe_get_firmwares_stage_desc(
 	stage_desc->max_input_width = 0;
 	stage_desc->mode = mode;
 	stage_desc->in_frame = in_frame;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		stage_desc->out_frame[i] = out_frame[i];
-	}
 	stage_desc->vf_frame = vf_frame;
 }
 
@@ -82,8 +80,7 @@ void ia_css_pipe_get_sp_func_stage_desc(
 	stage_desc->mode = (unsigned int)-1;
 	stage_desc->in_frame = NULL;
 	stage_desc->out_frame[0] = out_frame;
-	for (i = 1; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 1; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		stage_desc->out_frame[i] = NULL;
-	}
 	stage_desc->vf_frame = NULL;
 }
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
index c7c42b472cc7..6cb3ecbd7297 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
@@ -26,9 +26,8 @@ void ia_css_pipe_util_create_output_frames(
 	unsigned int i;
 
 	assert(frames);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		frames[i] = NULL;
-	}
 }
 
 void ia_css_pipe_util_set_output_frames(
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
index 3210dd6bf9ca..8e295cd78129 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
@@ -41,9 +41,8 @@ STORAGE_CLASS_STREAM2MMIO_C void stream2mmio_get_state(
 	 * Get the values of the register-set per
 	 * stream2mmio-controller sids.
 	 */
-	for (i = STREAM2MMIO_SID0_ID; i < N_STREAM2MMIO_SID_PROCS[ID]; i++) {
+	for (i = STREAM2MMIO_SID0_ID; i < N_STREAM2MMIO_SID_PROCS[ID]; i++)
 		stream2mmio_get_sid_state(ID, i, &state->sid_state[i]);
-	}
 }
 
 /**
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
index 439c69444942..e77d7cf61356 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
@@ -26,9 +26,8 @@ STORAGE_CLASS_EVENT_C void event_wait_for(const event_ID_t ID)
 STORAGE_CLASS_EVENT_C void cnd_event_wait_for(const event_ID_t ID,
 	const bool cnd)
 {
-	if (cnd) {
+	if (cnd)
 		event_wait_for(ID);
-	}
 }
 
 STORAGE_CLASS_EVENT_C hrt_data event_receive_token(const event_ID_t ID)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48c56..c353461dcdf2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -62,9 +62,8 @@ void input_formatter_rst(
 	 * WICH USES THE STREAM2MEMRY BLOCK.
 	 * MUST BE FIXED PROPERLY
 	 */
-	if (!HIVE_IF_BIN_COPY[ID]) {
+	if (!HIVE_IF_BIN_COPY[ID])
 		input_formatter_reg_store(ID, addr, rst);
-	}
 
 	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c4761c..68b0ad27615d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -138,11 +138,10 @@ void receiver_port_enable(
 	hrt_data	reg = receiver_port_reg_load(ID, port_ID,
 			  _HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX);
 
-	if (cnd) {
+	if (cnd)
 		reg |= 0x01;
-	} else {
+	else
 		reg &= ~0x01;
-	}
 
 	receiver_port_reg_store(ID, port_ID,
 				_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX, reg);
@@ -194,9 +193,8 @@ static void receiver_rst(
 	assert(ID < N_RX_ID);
 
 // Disable all ports.
-	for (port_id = MIPI_PORT0_ID; port_id < N_MIPI_PORT_ID; port_id++) {
+	for (port_id = MIPI_PORT0_ID; port_id < N_MIPI_PORT_ID; port_id++)
 		receiver_port_enable(ID, port_id, false);
-	}
 
 	// AM: Additional actions for stopping receiver?
 }
@@ -830,15 +828,13 @@ input_system_err_t input_system_configuration_commit(void)
 	// The last configuration step is to configure the input buffer.
 	input_system_err_t error = input_buffer_configuration();
 
-	if (error != INPUT_SYSTEM_ERR_NO_ERROR) {
+	if (error != INPUT_SYSTEM_ERR_NO_ERROR)
 		return error;
-	}
 
 	// Translate the whole configuration into registers.
 	error = configuration_to_registers();
-	if (error != INPUT_SYSTEM_ERR_NO_ERROR) {
+	if (error != INPUT_SYSTEM_ERR_NO_ERROR)
 		return error;
-	}
 
 	// Translate the whole configuration into ctrl commands etc.
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index b66560bca625..61dea386361a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -55,9 +55,8 @@ void irq_clear_all(
 	assert(ID < N_IRQ_ID);
 	assert(IRQ_N_CHANNEL[ID] <= HRT_DATA_WIDTH);
 
-	if (IRQ_N_CHANNEL[ID] < HRT_DATA_WIDTH) {
+	if (IRQ_N_CHANNEL[ID] < HRT_DATA_WIDTH)
 		mask = ~((~(hrt_data)0) >> IRQ_N_CHANNEL[ID]);
-	}
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
@@ -115,9 +114,9 @@ void irq_enable_pulse(
 {
 	unsigned int edge_out = 0x0;
 
-	if (pulse) {
+	if (pulse)
 		edge_out = 0xffffffff;
-	}
+
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
@@ -259,9 +258,9 @@ void virq_clear_all(void)
 {
 	irq_ID_t	irq_id;
 
-	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++) {
+	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++)
 		irq_clear_all(irq_id);
-	}
+
 	return;
 }
 
@@ -301,9 +300,9 @@ void virq_clear_info(struct virq_info *irq_info)
 
 	assert(irq_info);
 
-	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++) {
+	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++)
 		irq_info->irq_status_reg[ID] = 0;
-	}
+
 	return;
 }
 
@@ -324,20 +323,17 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 			break;
 	}
 
-	if (idx == IRQ_N_CHANNEL[IRQ0_ID]) {
+	if (idx == IRQ_N_CHANNEL[IRQ0_ID])
 		return hrt_isp_css_irq_status_error;
-	}
 
 	/* Check whether there are more bits set on device 0 */
-	if (irq_status != (1U << idx)) {
+	if (irq_status != (1U << idx))
 		status = hrt_isp_css_irq_status_more_irqs;
-	}
 
 	/* Check whether we have an IRQ on one of the nested devices */
 	for (ID = N_IRQ_ID - 1 ; ID > (irq_ID_t)0; ID--) {
-		if (IRQ_NESTING_ID[ID] == (enum virq_id)idx) {
+		if (IRQ_NESTING_ID[ID] == (enum virq_id)idx)
 			break;
-		}
 	}
 
 	/* If we have a nested IRQ, load that state, discard the device 0 state */
@@ -350,9 +346,8 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 				break;
 		}
 
-		if (idx == IRQ_N_CHANNEL[ID]) {
+		if (idx == IRQ_N_CHANNEL[ID])
 			return hrt_isp_css_irq_status_error;
-		}
 
 		/* Alternatively check whether there are more bits set on this device */
 		if (irq_status != (1U << idx)) {
@@ -408,9 +403,8 @@ static inline irq_ID_t virq_get_irq_id(
 	assert(channel_ID);
 
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++) {
-		if (irq_ID < IRQ_N_ID_OFFSET[ID + 1]) {
+		if (irq_ID < IRQ_N_ID_OFFSET[ID + 1])
 			break;
-		}
 	}
 
 	*channel_ID = (unsigned int)irq_ID - IRQ_N_ID_OFFSET[ID];
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index 064e88a5e064..70d118fe1e70 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -32,7 +32,6 @@ void mmu_invalidate_cache_all(void)
 {
 	mmu_ID_t	mmu_id;
 
-	for (mmu_id = (mmu_ID_t)0; mmu_id < N_MMU_ID; mmu_id++) {
+	for (mmu_id = (mmu_ID_t)0; mmu_id < N_MMU_ID; mmu_id++)
 		mmu_invalidate_cache(mmu_id);
-	}
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..1c5c50406633 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -168,9 +168,9 @@ static void store_vector(
 	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since it will be overwritten. */
 	hive_uedge *data = (hive_uedge *)v;
 
-	for (i = 0; i < ISP_NWAY; i++) {
+	for (i = 0; i < ISP_NWAY; i++)
 		hive_sim_wide_pack(data, (hive_wide)&from[i], ISP_VEC_ELEMBITS, i);
-	}
+
 	assert(ISP_BAMEM_BASE[ID] != (hrt_address) - 1);
 #if !defined(HRT_MEMORY_ACCESS)
 	ia_css_device_store(ISP_BAMEM_BASE[ID] + (unsigned long)to, &v, size);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 09599884bdae..08af8a848fbf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -22,9 +22,8 @@ ia_css_anr2_vmem_encode(
 	for (i = 0; i < ANR_PARAM_SIZE; i++) {
 		unsigned int j;
 
-		for (j = 0; j < ISP_VEC_NELEMS; j++) {
+		for (j = 0; j < ISP_VEC_NELEMS; j++)
 			to->data[i][j] = from->data[i * ISP_VEC_NELEMS + j];
-		}
 	}
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
index cd867937ee13..fcd7d7e2afe8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
@@ -125,14 +125,12 @@ ia_css_bnlm_vmem_encode(
 	bnlm_lut_encode(&to->div_lut, div_lut_nearests, div_lut_slopes,
 			BNLM_DIV_LUT_SIZE);
 	memset(to->div_lut_intercepts, 0, sizeof(to->div_lut_intercepts));
-	for (i = 0; i < BNLM_DIV_LUT_SIZE; i++) {
+	for (i = 0; i < BNLM_DIV_LUT_SIZE; i++)
 		to->div_lut_intercepts[0][i] = div_lut_intercepts[i];
-	}
 
 	memset(to->power_of_2, 0, sizeof(to->power_of_2));
-	for (i = 0; i < (ISP_VEC_ELEMBITS - 1); i++) {
+	for (i = 0; i < (ISP_VEC_ELEMBITS - 1); i++)
 		to->power_of_2[0][i] = 1 << i;
-	}
 }
 
 /* - Encodes BNLM public parameters into DMEM parameters */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
index 38751b8e9e6a..177487b6b237 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
@@ -52,13 +52,12 @@ static int ctc2_slope(int y1, int y0, int x1, int x0)
 	/*the slope must lie within the range
 	  (-max_slope-1) >= (dydx) >= (max_slope)
 	*/
-	if (slope <= -max_slope - 1) {
+	if (slope <= -max_slope - 1)
 		dydx = -max_slope - 1;
-	} else if (slope >= max_slope) {
+	else if (slope >= max_slope)
 		dydx = max_slope;
-	} else {
+	else
 		dydx = slope;
-	}
 
 	return dydx;
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index 8e4451fcc8e3..76d76ca4401a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -140,17 +140,14 @@ ia_css_eed1_8_vmem_encode(
 	assert(tcinv_x[0] == 0);
 	assert(fcinv_x[0] == 0);
 
-	for (j = 1; j < NUMBER_OF_CHGRINV_POINTS; j++) {
+	for (j = 1; j < NUMBER_OF_CHGRINV_POINTS; j++)
 		assert(chgrinv_x[j] > chgrinv_x[j - 1]);
-	}
 
-	for (j = 1; j < NUMBER_OF_TCINV_POINTS; j++) {
+	for (j = 1; j < NUMBER_OF_TCINV_POINTS; j++)
 		assert(tcinv_x[j] > tcinv_x[j - 1]);
-	}
 
-	for (j = 1; j < NUMBER_OF_FCINV_POINTS; j++) {
+	for (j = 1; j < NUMBER_OF_FCINV_POINTS; j++)
 		assert(fcinv_x[j] > fcinv_x[j - 1]);
-	}
 
 	/* The implementation of the calculating 1/x is based on the availability
 	 * of the OP_vec_shuffle16 operation.
@@ -260,9 +257,9 @@ ia_css_eed1_8_encode(
 	to->margin_neg_diff = (from->neg_margin1 - from->neg_margin0);
 
 	/* Encode DEWEnhance exp (e_dew_enh_asr) */
-	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++) {
+	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++)
 		min_exp = max(min_exp, from->dew_enhance_seg_exp[i]);
-	}
+
 	to->e_dew_enh_asr = 13 - clamp(min_exp, 0, 13);
 
 	to->dedgew_max = from->dedgew_max;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
index 13678138c48c..823a1b0c0991 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
@@ -240,9 +240,8 @@ ia_css_s3a_hmem_decode(
 	/* Calculate sum of histogram of R,
 	   which should not be less than count_for_3a */
 	sum_r = 0;
-	for (i = 0; i < HMEM_UNIT_SIZE; i++) {
+	for (i = 0; i < HMEM_UNIT_SIZE; i++)
 		sum_r += out_ptr[i].r;
-	}
 	if (sum_r < count_for_3a) {
 		/* histogram is invalid */
 		return;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index a1bea8bd1a39..f483e690a114 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -50,9 +50,8 @@ void ia_css_sdis_horicoef_vmem_encode(
 	assert(size % (IA_CSS_DVS_NUM_COEF_TYPES * ISP_VEC_NELEMS * sizeof(
 			   short)) == 0);
 
-	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++) {
+	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++)
 		fill_row(&private[type * stride], &public[type * width], width, padding);
-	}
 }
 
 void ia_css_sdis_vertcoef_vmem_encode(
@@ -77,9 +76,8 @@ void ia_css_sdis_vertcoef_vmem_encode(
 	assert(size % (IA_CSS_DVS_NUM_COEF_TYPES * ISP_VEC_NELEMS * sizeof(
 			   short)) == 0);
 
-	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++) {
+	for (type = 0; type < IA_CSS_DVS_NUM_COEF_TYPES; type++)
 		fill_row(&private[type * stride], &public[type * height], height, padding);
-	}
 }
 
 void ia_css_sdis_horiproj_encode(
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 315cce008d3c..78c0457b16b5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -672,9 +672,8 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		err = ia_css_isp_param_allocate_isp_parameters(
 		    &binary->mem_params, &binary->css_params,
 		    &info->mem_initializers);
-		if (err) {
+		if (err)
 			return err;
-		}
 	}
 	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		if (out_info[i] && (out_info[i]->res.width != 0)) {
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e..58d99abe70aa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1123,9 +1123,8 @@ ia_css_debug_pipe_graph_dump_prologue(void)
 
 void ia_css_debug_pipe_graph_dump_epilogue(void)
 {
-	if (strlen(ring_buffer) > 0) {
+	if (strlen(ring_buffer) > 0)
 		dtrace_dot(ring_buffer);
-	}
 
 	if (pg_inst.stream_format != N_ATOMISP_INPUT_FORMAT) {
 		/* An input stream format has been set so assume we have
@@ -1778,9 +1777,8 @@ static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
 				* When tid value is 111b, the data will be interpreted differently:
 				* tid val is ignored, major field contains 2 bits (msb) for format type
 				*/
-				if (tid_val == FIELD_TID_SEL_FORMAT_PAT) {
+				if (tid_val == FIELD_TID_SEL_FORMAT_PAT)
 					dump_format = FIELD_FORMAT_UNPACK(trace_read_buf[j]);
-				}
 			}
 			switch (dump_format) {
 			case TRACE_DUMP_FORMAT_POINT:
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index e6c11d5f77b4..8e8433f5b07a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -295,9 +295,8 @@ static bool create_input_system_channel(
 	if (!rc)
 		return false;
 
-	if (!acquire_sid(me->stream2mmio_id, &me->stream2mmio_sid_id)) {
+	if (!acquire_sid(me->stream2mmio_id, &me->stream2mmio_sid_id))
 		return false;
-	}
 
 	if (!acquire_ib_buffer(
 		metadata ? cfg->metadata.bits_per_pixel :
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index cb8d652227a7..fb79ac07e270 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -575,9 +575,8 @@ static int pipeline_stage_create(
 	binary = stage_desc->binary;
 	firmware = stage_desc->firmware;
 	vf_frame = stage_desc->vf_frame;
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		out_frame[i] = stage_desc->out_frame[i];
-	}
 
 	stage = kvzalloc(sizeof(*stage), GFP_KERNEL);
 	if (!stage) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c908..992acbf758cb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1928,9 +1928,8 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	params = stream->per_frame_isp_params_configs;
 
 	/* update new ISP params object with the new config */
-	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
+	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))
 		err1 = -EINVAL;
-	}
 
 	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
 
@@ -2004,9 +2003,8 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 		 * user. */
 		/* we do not exit from this point immediately to allow internal
 		 * firmware feature testing. */
-		if (is_dp_10bpp) {
+		if (is_dp_10bpp)
 			err = -EINVAL;
-		}
 	} else {
 		err = -EINVAL;
 		goto exit;
@@ -3034,9 +3032,8 @@ process_kernel_parameters(unsigned int pipe_id,
 		ia_css_ob_configure(&params->stream_configs.ob,
 				    isp_pipe_version, raw_bit_depth);
 	}
-	if (params->config_changed[IA_CSS_S3A_ID]) {
+	if (params->config_changed[IA_CSS_S3A_ID])
 		ia_css_s3a_configure(raw_bit_depth);
-	}
 	/* Copy stage uds parameters to config, since they can differ per stage.
 	 */
 	params->crop_config.crop_pos = params->uds[stage->stage_num].crop_pos;
@@ -3899,9 +3896,8 @@ sh_css_invalidate_params(struct ia_css_stream *stream)
 	params->isp_params_changed = true;
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		for (j = 0; j < SH_CSS_MAX_STAGES; j++) {
-			for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
+			for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++)
 				params->isp_mem_params_changed[i][j][mem] = true;
-			}
 		}
 	}
 
-- 
2.53.0


