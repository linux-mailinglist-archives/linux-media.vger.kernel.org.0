Return-Path: <linux-media+bounces-61852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDqfCCHSCWp8rAQAu9opvQ
	(envelope-from <linux-media+bounces-61852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 16:35:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E7561B1F
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 16:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8306E30160EF
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A783E3090DE;
	Sun, 17 May 2026 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtKEv08m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F684283FC4
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028506; cv=none; b=h++8Q+X+6f4mTxyD9t3BVjT5MTpI8vGzoBnZxV6NOZ8NfP8Pz+k+StVRDgiqDFRCOXBil/I9MZ1scjXKgK0V36Rl5KmxYkikMu1bT4j50rrYh1TnfUy2rLUEw0HPayw/iI7ZQi+ZV0PCm7S3lFzkGD1ZgFBneWHUdjHlwlAUQTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028506; c=relaxed/simple;
	bh=FF9ZfazRE2/igLFALqrXMsLabkFJ7d22RgehowDupYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EdWame8t+vZiYDvgRiItcw5LKLSP/FN0FVQM4k4emXHHWVUoqf3zbuRZmRzij/TG0+h9nwiIXovcI2qM/6QIKmgRw3IX0NA9UHmrIeEb5/b+/pridAPhucu9j+dj/hwf0dRanaGAsx/L1zDOMYiwzAK1cvMt00vJim8eCrWgTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtKEv08m; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-434e69e943bso1231108fac.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028503; x=1779633303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5Tj8pIpwcuaWArASM+0sAuUc3qYDkIHm69X0MuttiY=;
        b=XtKEv08mBJZk2SURyGVbkq4zTvgklKutVPPiPHuJ1B5odCB+DLD87W+lIuxh8CIMjh
         qUGBvEwFfW+ajGlzipLds+zaR9RYQRdj8R5exPYdO8owM6+VBaXQgHBj8oD8vuGXbHoE
         cjcw1HB46TjpE3eJVnd0/jLMk6hI/OZGHfF2GlAalhjIVCazqGEu7xxyW3XpN2xt9FtZ
         ZU4cEAyZMMsIVJgR/5jdtYTUWndPXqLe93Epw6vPNSqugpkm686gQ0572hC/wjQ9W6Lk
         uW8TR78Zw2qTuPB+5nN3HX+K9lZlYI5e7nipjorOIz8gAEaLgGa2i+aPcXojrF9tprxe
         k5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028503; x=1779633303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5Tj8pIpwcuaWArASM+0sAuUc3qYDkIHm69X0MuttiY=;
        b=ZRwxEK4BDGNyd6+/VptbhANs+En9iM+P1EmIV7jWJkykjUfIHPcBP4mwSynLkmO8r/
         eszo+wTBFsAWn8xIwlVWDUgJOji0fEgYJ+lRUWM9B3cQgUkyiZMkhsR7HMaQ3xvnXZUk
         zMU9b47Cgy+XvkjXPU8UYop/w7yereHkZCh0G6qTwmhIZLGOVLDHL1yQKoF3wdmslzYI
         PZn0tckc7Xj5MKKiLESmqgh3fxR3Urb12X+s28p+4OWPqFkgGVpJwcxM8xzv9xG62mrg
         0f4iv9HUt+TdZgP3GR3/sDrR7J8yK/mhkZ7TsKA8HLi6+WIeAQfrYTKD98hCIlkaERY8
         hRAQ==
X-Gm-Message-State: AOJu0Yx/ERmNu/lG0ItbpSZNX9FUIIZagCD2coZdBN66HgB1wwjUm/52
	GFNGeQv3UVe4wO74DZ7Q83CpVFfnYaTVcmN2pDFhvDxbDkXWRMrLdM/n
X-Gm-Gg: Acq92OGj7VURbm/RNsfkeFNsM+tQVrYqaQ0QiJ7zMKBSU3oRtohgvNnqeR0vaJMrRoD
	64NYRCg4q+u9DZW0h2PSuUlTCnUKyLd3xiaBzYr6D1vXfhKwZJNWiKPFSDfvFI6KeEl1GRy1cfn
	RS+Ek7GVFnwyGXxYM3PkQhC9Jj3tMMxWrjbaLoLXbvWeYNl+gtGCDXDxbYNuy70kufQqFE/+Etf
	8xxt+OAzeAoWXAFhbau/jIvNLV8IHSSB7StCejQzBNqH+IpusG+HXw5qiNOnauA2+oq9lRMDFye
	OJHnazKPSr1sK9FcEMFJZOFVrX94vNE7s0hCHSef2bj8e6WpBztOd9hcdimN4PBeOvethEY4Cvi
	PcXdY1zJDFuhSHD3qPaDDIJ9VqPxXRV/l9bajXqLLSCHEutRUVG8zInuMkaT4UcdmlOMuMhXlNL
	t98iOxaj12IUgLnWyigyP6mGDQ9DAHKyPL0/4N6ecE
X-Received: by 2002:a05:6820:151f:b0:69c:502f:bcde with SMTP id 006d021491bc7-69c950fe8c7mr7870649eaf.49.1779028503353;
        Sun, 17 May 2026 07:35:03 -0700 (PDT)
Received: from MacMini.lan ([172.127.162.94])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d0465461bsm4114183eaf.7.2026.05.17.07.35.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 17 May 2026 07:35:02 -0700 (PDT)
From: shayderrr <darknessshayder@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: [PATCH] media: ipu7: fix boot config memory leak and replace polling loops
Date: Sun, 17 May 2026 09:34:56 -0500
Message-ID: <20260517143456.81109-1-darknessshayder@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7F1E7561B1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-61852-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[darknessshayder@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Pranav Bajjuri <darknessshayder@gmail.com>

Free boot_config DMA allocation if queue memory alloc fails in
ipu7_boot_init_boot_config(). Replace hand-rolled timeout loops in
ipu7_boot_start_fw() and ipu7_boot_stop_fw() with read_poll_timeout().
Fix variable declaration order in cell reset, start, and stop to follow
reverse Christmas tree convention.

Signed-off-by: Pranav Bajjuri <darknessshayder@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-boot.c | 88 +++++++++++---------------
 1 file changed, 36 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
index d7901ff78b38..f081c39604a7 100644
--- a/drivers/staging/media/ipu7/ipu7-boot.c
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -22,8 +22,8 @@
 #include "ipu7-platform-regs.h"
 #include "ipu7-syscom.h"
 
-#define IPU_FW_START_STOP_TIMEOUT		2000
-#define IPU_BOOT_CELL_RESET_TIMEOUT		(2 * USEC_PER_SEC)
+#define IPU_FW_START_STOP_TIMEOUT	2000
+#define IPU_BOOT_CELL_RESET_TIMEOUT	(2 * USEC_PER_SEC)
 #define BOOT_STATE_IS_CRITICAL(s)	IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(s)
 #define BOOT_STATE_IS_READY(s)		((s) == IA_GOFO_FW_BOOT_STATE_READY)
 #define BOOT_STATE_IS_INACTIVE(s)	((s) == IA_GOFO_FW_BOOT_STATE_INACTIVE)
@@ -39,17 +39,17 @@ struct ipu7_boot_context {
 static const struct ipu7_boot_context contexts[IPU_SUBSYS_NUM] = {
 	{
 		/* ISYS */
-		.dmem_address = IPU_ISYS_DMEM_OFFSET,
-		.status_ctrl_reg = BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS,
-		.fw_start_address_reg = BUTTRESS_REG_DRV_IS_UCX_START_ADDR,
-		.fw_code_base_reg = IS_UC_CTRL_BASE
+		.dmem_address		= IPU_ISYS_DMEM_OFFSET,
+		.status_ctrl_reg	= BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS,
+		.fw_start_address_reg	= BUTTRESS_REG_DRV_IS_UCX_START_ADDR,
+		.fw_code_base_reg	= IS_UC_CTRL_BASE
 	},
 	{
 		/* PSYS */
-		.dmem_address = IPU_PSYS_DMEM_OFFSET,
-		.status_ctrl_reg = BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS,
-		.fw_start_address_reg = BUTTRESS_REG_DRV_PS_UCX_START_ADDR,
-		.fw_code_base_reg = PS_UC_CTRL_BASE
+		.dmem_address		= IPU_PSYS_DMEM_OFFSET,
+		.status_ctrl_reg	= BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS,
+		.fw_start_address_reg	= BUTTRESS_REG_DRV_PS_UCX_START_ADDR,
+		.fw_code_base_reg	= PS_UC_CTRL_BASE
 	}
 };
 
@@ -85,9 +85,9 @@ static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
 {
 	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
 	const struct device *dev = &adev->auxdev.dev;
+	void __iomem *base = adev->isp->base;
 	u32 ucx_ctrl_status = ctx->status_ctrl_reg;
 	u32 timeout = IPU_BOOT_CELL_RESET_TIMEOUT;
-	void __iomem *base = adev->isp->base;
 	u32 val, val2;
 	int ret;
 
@@ -134,8 +134,8 @@ static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
 static void ipu7_boot_cell_start(const struct ipu7_bus_device *adev)
 {
 	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
-	void __iomem *base = adev->isp->base;
 	const struct device *dev = &adev->auxdev.dev;
+	void __iomem *base = adev->isp->base;
 	u32 val;
 
 	dev_dbg(dev, "starting cell...\n");
@@ -152,8 +152,8 @@ static void ipu7_boot_cell_start(const struct ipu7_bus_device *adev)
 static void ipu7_boot_cell_stop(const struct ipu7_bus_device *adev)
 {
 	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
-	void __iomem *base = adev->isp->base;
 	const struct device *dev = &adev->auxdev.dev;
+	void __iomem *base = adev->isp->base;
 	u32 val;
 
 	dev_dbg(dev, "stopping cell...\n");
@@ -187,16 +187,14 @@ static int ipu7_boot_cell_init(const struct ipu7_bus_device *adev)
 }
 
 static void init_boot_config(struct ia_gofo_boot_config *boot_config,
-			     u32 length, u8 major)
+			     u32 config_size, u8 major)
 {
-	/* syscom version, new syscom2 version */
-	boot_config->length = length;
+	boot_config->length = config_size;
 	boot_config->config_version.major = 1U;
 	boot_config->config_version.minor = 0U;
 	boot_config->config_version.subminor = 0U;
 	boot_config->config_version.patch = 0U;
 
-	/* msg version for task interface */
 	boot_config->client_version_support.num_versions = 1U;
 	boot_config->client_version_support.versions[0].major = major;
 	boot_config->client_version_support.versions[0].minor = 0U;
@@ -221,7 +219,7 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 
 	dev_dbg(dev, "boot config queues_nr: %d freq: %u sys_conf: 0x%pad\n",
 		num_queues, uc_freq, &subsys_config);
-	/* Allocate boot config. */
+
 	adev->boot_config_size =
 		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
 	adev->boot_config = ipu7_dma_alloc(adev, adev->boot_config_size,
@@ -257,12 +255,15 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 		qconfigs[i].queue_size = queue_size;
 	}
 
-	/* Allocate queue memory */
 	syscom->queue_mem = ipu7_dma_alloc(adev, total_queue_size_aligned,
 					   &syscom->queue_mem_dma_addr,
 					   GFP_KERNEL, 0);
 	if (!syscom->queue_mem) {
 		dev_err(dev, "Failed to allocate queue memory.\n");
+		ipu7_dma_free(adev, adev->boot_config_size,
+			      adev->boot_config,
+			      adev->boot_config_dma_addr, 0);
+		adev->boot_config = NULL;
 		return -ENOMEM;
 	}
 	syscom->queue_mem_size = total_queue_size_aligned;
@@ -312,7 +313,6 @@ EXPORT_SYMBOL_NS_GPL(ipu7_boot_release_boot_config, "INTEL_IPU7");
 int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
 {
 	const struct device *dev = &adev->auxdev.dev;
-	u32 timeout = IPU_FW_START_STOP_TIMEOUT;
 	void __iomem *base = adev->isp->base;
 	u32 boot_state, last_boot_state;
 	u32 indices_addr, msg_ver, id;
@@ -323,37 +323,26 @@ int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
 		return ret;
 
 	dev_dbg(dev, "start booting fw...\n");
-	/* store "uninit" state to syscom/boot state reg */
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
 			    IA_GOFO_FW_BOOT_STATE_UNINIT);
-	/*
-	 * Set registers to zero
-	 * (not strictly required, but recommended for diagnostics)
-	 */
 	write_fw_boot_param(adev,
 			    IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID, 0);
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID, 0);
-	/* store firmware configuration address */
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_CONFIG_ID,
 			    adev->boot_config_dma_addr);
 
-	/* Kick uC, then wait for boot complete */
 	ipu7_boot_cell_start(adev);
 
 	last_boot_state = IA_GOFO_FW_BOOT_STATE_UNINIT;
-	while (timeout--) {
-		boot_state = read_fw_boot_param(adev,
-						IA_GOFO_FW_BOOT_STATE_ID);
-		if (boot_state != last_boot_state) {
-			dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
-				last_boot_state, boot_state);
-			last_boot_state = boot_state;
-		}
-		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
-		    BOOT_STATE_IS_READY(boot_state))
-			break;
-		usleep_range(1000, 1200);
-	}
+	ret = read_poll_timeout(read_fw_boot_param, boot_state,
+				BOOT_STATE_IS_CRITICAL(boot_state) ||
+				BOOT_STATE_IS_READY(boot_state),
+				1000, IPU_FW_START_STOP_TIMEOUT * 1000ULL,
+				false, adev, IA_GOFO_FW_BOOT_STATE_ID);
+
+	if (boot_state != last_boot_state)
+		dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
+			last_boot_state, boot_state);
 
 	if (BOOT_STATE_IS_CRITICAL(boot_state)) {
 		ipu7_dump_fw_error_log(adev);
@@ -365,13 +354,11 @@ int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
 	}
 	dev_dbg(dev, "fw boot done.\n");
 
-	/* Get FW syscom queue indices addr */
 	id = IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID;
 	indices_addr = read_fw_boot_param(adev, id);
 	adev->syscom->queue_indices = base + indices_addr;
 	dev_dbg(dev, "fw queue indices offset is 0x%x\n", indices_addr);
 
-	/* Get message version. */
 	msg_ver = read_fw_boot_param(adev,
 				     IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID);
 	dev_dbg(dev, "ipu message version is 0x%08x\n", msg_ver);
@@ -383,8 +370,8 @@ EXPORT_SYMBOL_NS_GPL(ipu7_boot_start_fw, "INTEL_IPU7");
 int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev)
 {
 	const struct device *dev = &adev->auxdev.dev;
-	u32 timeout = IPU_FW_START_STOP_TIMEOUT;
 	u32 boot_state;
+	int ret;
 
 	boot_state = read_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID);
 	if (BOOT_STATE_IS_CRITICAL(boot_state) ||
@@ -394,18 +381,15 @@ int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev)
 		return -EBUSY;
 	}
 
-	/* Issue shutdown to start shutdown process */
 	dev_dbg(dev, "stopping fw...\n");
 	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
 			    IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD);
-	while (timeout--) {
-		boot_state = read_fw_boot_param(adev,
-						IA_GOFO_FW_BOOT_STATE_ID);
-		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
-		    BOOT_STATE_IS_INACTIVE(boot_state))
-			break;
-		usleep_range(1000, 1200);
-	}
+
+	ret = read_poll_timeout(read_fw_boot_param, boot_state,
+				BOOT_STATE_IS_CRITICAL(boot_state) ||
+				BOOT_STATE_IS_INACTIVE(boot_state),
+				1000, IPU_FW_START_STOP_TIMEOUT * 1000ULL,
+				false, adev, IA_GOFO_FW_BOOT_STATE_ID);
 
 	if (BOOT_STATE_IS_CRITICAL(boot_state)) {
 		ipu7_dump_fw_error_log(adev);
-- 
2.50.1 (Apple Git-155)


