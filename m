Return-Path: <linux-media+bounces-55235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJusDg2BsGmwjwIAu9opvQ
	(envelope-from <linux-media+bounces-55235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:37:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97F257ED7
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D21A330F29E9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F093CA487;
	Tue, 10 Mar 2026 20:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVnxvIyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BF386C12
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175039; cv=none; b=YhjrZf0/Rb6lalC+6zM1y1nJhw4O8VemTUCw5Asst0kGz11aKi93SxPVt3atA+dUlGvagBM2t7xKU0RU0OzaQYPoWBSQGOcQL4DHgTQPqxSNMIkmJG6b6bhDylDKhz7mXxoIBg8lcq+8NKLX0IVhIdghQJ19Hxo4X45UgTh2fG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175039; c=relaxed/simple;
	bh=JXEmlR18YaMudzeYoY2Czh3VkL9MtWNXIpFpG3pbEL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gd/FF/XxOIZIBtLJXTJ1tmeFTQU53MJayoEJzAx+2lP9mnJBpvGELCcJLdYiebEyEgTXPANaiHANGNWmqR/krTCiVl9DwQGWf4nTp81eqrHaKUScXK0WAFbTNxxsgISd9VpT3z+2SaW+ElbJzshDbQ0KDwUWeuyYjSoB461Hh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVnxvIyH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12fbbd9d2so6399104e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773175035; x=1773779835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHeA3wgzdrXvBOJfH24mr65Pocl3f4thV8wzfUQwhY8=;
        b=jVnxvIyHijmHtFeDCQ4z2ILy0eeYNCr+A8ObwauELVlM8G+Qw3C4LvfkEgIpuKeovJ
         yUQwUzwc7+pKYoy73elayRjKk2mPU9TeSAunHMtsOaA5q11qbjcyi9lL0p79+74tLmOE
         wik1JKGt2VdX1xBprn89mPgnxr2BkjHZ47aZSLOm/0iixEBrd6WhA/UmsMW7VMCejLiB
         ntW2XInKtf08CkFO1Cz2NdY72hK/X4JXll6zqkL3heX5yfIPTYh4aNZGHQ57+xfBThLB
         YqTY6VmBIjqIV8f55LUjpUVQxaP6ZJuLFk/HrC/QBw1CydtfqdQmR6mDVgV1QB3dDvYZ
         63JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773175035; x=1773779835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHeA3wgzdrXvBOJfH24mr65Pocl3f4thV8wzfUQwhY8=;
        b=mIAvw9xS/cMtpU6vhHEGg0vciu3QSNWNgFZEPvI0yIK/HgqG4ePUJ4ADOKl8zaxEoY
         v8P0WXjt21yco9mt+nxIzhpmS0SqjmsZPHtpt9NRqiZQgOAqPFM76JmgfSRtOhuuGPVX
         SbSFzIMHHX9Xkk6QtvLZ+iqMKI5WK6AwDWJ21Xf7ph8pl+w8kKwPyMlH5/mKUaRhxIyr
         PeeQ1qCaKUxtZCCtexdwUemwfLY3u5mIqA5TIq6baQZAKnG5X/p1Bf6SmFOP6JU6X+uO
         RIiwo4RCEzZT/ekFzXHw1z408E4vfGcvEOFx/OWBOtZH/lMNQnOkNvuG4roqtJenHNRO
         RPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2DwYoqFf2VcJy/pXQ2wEAQjziAD5fiRcW4Hde3Y9vHi5B9RDr25UsAMNOvWOv/3tmhbfmU/H04pOL1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi5yBjiAzwZdmHiKhc0zJAU1u3Oqv0pgiMS9TNSbMN+7ECyXXa
	nL0Fz1oQJSRUnTFeo9qA9rO0SLGTv3TbMZA073l5u9iw+uqXwtEITbxp
X-Gm-Gg: ATEYQzw0ySVVWl5Fk6nCx6K+MBED+qtYlKB1QjllnhkJuavt5LMyKC+UdYILU9E7djG
	sJcwUInCn2+I5HOKhSYZx8MP3cpdVBfPRMI6A3nre0Yj7kboHgVhHw5tjrvq3vz/2/7D3LbkvCo
	VVWDNe3n+UwZtqhiYvNpFJG3/o10GJiN5igeaq2lxpdb6RR5KhFyKDpsA5fDYBfDAyMb5WvG4y8
	s8kHr81l6HwT5o/W8KafxjecoQFqKSgRoEPxkNxv2RQMAywgWb1SkSPssxuI1eRz/D2WRDHn/on
	qGpvIy9xMifEy//1I+1ak7akik3R+nJL3Bk8t+Xd3pYM5ct3y7HaxLt4it/U7SlKN4dTDqUMYcp
	I143EC0LJ9C9ZYqp2BlJ5zdcdEnDDJwJbKfCVCYox/WHxWpq3mGtqfua3yVqhcrL5EOx54ySOXm
	PAf9UpkymHCajR02ARlEKdnJs4JWQ8CHeH5jSek1R8BviQzFXDt0eX2XVXNUL0IDzhON91fBHbh
	A==
X-Received: by 2002:a05:6512:3e18:b0:5a1:381b:fae1 with SMTP id 2adb3069b0e04-5a13caadbccmr6998590e87.10.1773175035113;
        Tue, 10 Mar 2026 13:37:15 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162feasm25683e87.55.2026.03.10.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:37:13 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary braces in single statement blocks
Date: Tue, 10 Mar 2026 21:36:46 +0100
Message-ID: <20260310203646.8869-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E97F257ED7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55235-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Remove unnecessary braces around single statement blocks throughout
the atomisp driver to comply with kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../pci/camera/pipe/src/pipe_stagedesc.c      |  9 ++----
 .../atomisp/pci/camera/pipe/src/pipe_util.c   |  3 +-
 .../host/input_formatter.c                    |  3 +-
 .../hive_isp_css_common/host/input_system.c   | 14 ++++-----
 .../pci/hive_isp_css_common/host/irq.c        | 30 ++++++++-----------
 .../pci/hive_isp_css_common/host/mmu.c        |  3 +-
 .../pci/hive_isp_css_common/host/vmem.c       |  3 +-
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
 18 files changed, 47 insertions(+), 83 deletions(-)

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
index b66560bca625..7cf0103ae207 100644
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
index 722b684fbc37..6b5cb9db759b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -168,9 +168,8 @@ static void store_vector(
 	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since it will be overwritten. */
 	hive_uedge *data = (hive_uedge *)v;
 
-	for (i = 0; i < ISP_NWAY; i++) {
+	for (i = 0; i < ISP_NWAY; i++)
 		hive_sim_wide_pack(data, (hive_wide)&from[i], ISP_VEC_ELEMBITS, i);
-	}
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
index bd2def6c341a..0ca7ef5bb064 100644
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
index af93ca96747c..60ae7bf5512b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -670,9 +670,8 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		err = ia_css_isp_param_allocate_isp_parameters(
 		    &binary->mem_params, &binary->css_params,
 		    &info->mem_initializers);
-		if (err) {
+		if (err)
 			return err;
-		}
 	}
 	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 	{
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
index 0470871f8fff..8d11466fda1b 100644
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
 
 	stage = kvzalloc_obj(*stage);
 	if (!stage) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..8cbb5d598005 100644
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
2.43.0


