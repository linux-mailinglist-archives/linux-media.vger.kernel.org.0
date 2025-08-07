Return-Path: <linux-media+bounces-39078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C17B1DE82
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 22:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD901AA5326
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 20:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83F32376FC;
	Thu,  7 Aug 2025 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="if3H0ODi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B03221269;
	Thu,  7 Aug 2025 20:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754600066; cv=none; b=NG4hlw90o1BWgAITtT2VJ7xCbsdKOcrjP6Vv8HkTOz7SPPyOoMRxd6FAQhdH3FoXZZ5cwlxl1Ngi+hXdlAsUkjgW2l94wGhHy+GrKdE23ufrQ1C8YCUkJvrFQ9wdqwDK3GmwXTAkBj5nwGn69ChFa7uuzY95DUPu0x+zssDJLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754600066; c=relaxed/simple;
	bh=bvW6h/SDGKuox4lFV0iT3YHecRUJJV15jJEMcASTIfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tfGa4r3dHyxwir9qP9A1cft07EnrDbxCc8ixvmY3IwFWY776P8CqKh2mJaVtkGJ9s3pKTyj/HZE0tqvT3l3E3GDWkA+REq+dhXnWmX53D7WCnIL/Tv8j92KpO1+iZGDe0318RxWdl9BJHIGI5BEb3S2FhaVr2nxDuoA89pMYmqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=if3H0ODi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EF2C4CEEB;
	Thu,  7 Aug 2025 20:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754600065;
	bh=bvW6h/SDGKuox4lFV0iT3YHecRUJJV15jJEMcASTIfc=;
	h=From:To:Cc:Subject:Date:From;
	b=if3H0ODixS0AdSgQu8GFrZZN8B9N9zIGpjhyQr7atLmwR6ITZqHwj+aumiUEmAf/q
	 FKaAYa7IAkRYKhhGPfMXQ92MAe7eOM6twQRb7iTESYAgDz8ZsAV6esBLuX4eYFhe7F
	 A6N/0t4riMMQ0l0sCGgCY4ffhYmBtohmttCTOtBIg0ZwGOg3R73fRrcnvW/mR5jgqY
	 OKdGZKOTTf8eu/NMKejlQWBupbmV3/kbKpYsFSBGLzGY6JsZyIc9CtPIoNbMteuHlF
	 YAt3WCX2bXbPGJYJiGGVh9ZpefaZlyFUU6AV0pgXNe/lyPZGZvUFssf/dPT627EpXH
	 YpLIbW6ic/UIw==
From: Arnd Bergmann <arnd@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jaeryul Oh <jaeryul.oh@samsung.com>,
	Arun Kumar K <arun.kk@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Janghyuck Kim <janghyuck.kim@samsung.com>,
	Jeongtae Park <jtp.park@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Naveen Krishna Chatradhi <ch.naveen@samsung.com>,
	Kamil Debski <k.debski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: s5p-mfc: remove an unused/unitialized variable
Date: Thu,  7 Aug 2025 22:54:15 +0200
Message-Id: <20250807205419.143208-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The s5p_mfc_cmd_args structure in the v6 driver is never used, not
initialized to anything other than zero, but as of clang-21 this
causes a warning:

/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:45:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
   45 |                                         &h2r_args);
      |                                          ^~~~~~~~

Just remove this for simplicity. Since the function is also called
through a callback, this does require adding a trivial wrapper with
the correct prototype.

Fixes: f96f3cfa0bb8 ("[media] s5p-mfc: Update MFC v4l2 driver to support MFC6.x")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c | 35 +++++++------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
index 47bc3014b5d8..f7c682fca645 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
@@ -14,8 +14,7 @@
 #include "s5p_mfc_opr.h"
 #include "s5p_mfc_cmd_v6.h"
 
-static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd,
-				    const struct s5p_mfc_cmd_args *args)
+static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd)
 {
 	mfc_debug(2, "Issue the command: %d\n", cmd);
 
@@ -31,7 +30,6 @@ static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd,
 
 static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
 {
-	struct s5p_mfc_cmd_args h2r_args;
 	const struct s5p_mfc_buf_size_v6 *buf_size = dev->variant->buf_size->priv;
 	int ret;
 
@@ -41,33 +39,23 @@ static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
 
 	mfc_write(dev, dev->ctx_buf.dma, S5P_FIMV_CONTEXT_MEM_ADDR_V6);
 	mfc_write(dev, buf_size->dev_ctx, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6,
-					&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6);
 }
 
 static int s5p_mfc_sleep_cmd_v6(struct s5p_mfc_dev *dev)
 {
-	struct s5p_mfc_cmd_args h2r_args;
-
-	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6,
-			&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6);
 }
 
 static int s5p_mfc_wakeup_cmd_v6(struct s5p_mfc_dev *dev)
 {
-	struct s5p_mfc_cmd_args h2r_args;
-
-	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6,
-					&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6);
 }
 
 /* Open a new instance and get its number */
 static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 {
 	struct s5p_mfc_dev *dev = ctx->dev;
-	struct s5p_mfc_cmd_args h2r_args;
 	int codec_type;
 
 	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
@@ -129,23 +117,20 @@ static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 	mfc_write(dev, ctx->ctx.size, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
 	mfc_write(dev, 0, S5P_FIMV_D_CRC_CTRL_V6); /* no crc */
 
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANCE_V6,
-					&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANCE_V6);
 }
 
 /* Close instance */
 static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 {
 	struct s5p_mfc_dev *dev = ctx->dev;
-	struct s5p_mfc_cmd_args h2r_args;
 	int ret = 0;
 
 	dev->curr_ctx = ctx->num;
 	if (ctx->state != MFCINST_FREE) {
 		mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
 		ret = s5p_mfc_cmd_host2risc_v6(dev,
-					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6,
-					&h2r_args);
+					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6);
 	} else {
 		ret = -EINVAL;
 	}
@@ -153,9 +138,15 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 	return ret;
 }
 
+static int s5p_mfc_cmd_host2risc_v6_args(struct s5p_mfc_dev *dev, int cmd,
+				    const struct s5p_mfc_cmd_args *ignored)
+{
+	return s5p_mfc_cmd_host2risc_v6(dev, cmd);
+}
+
 /* Initialize cmd function pointers for MFC v6 */
 static const struct s5p_mfc_hw_cmds s5p_mfc_cmds_v6 = {
-	.cmd_host2risc = s5p_mfc_cmd_host2risc_v6,
+	.cmd_host2risc = s5p_mfc_cmd_host2risc_v6_args,
 	.sys_init_cmd = s5p_mfc_sys_init_cmd_v6,
 	.sleep_cmd = s5p_mfc_sleep_cmd_v6,
 	.wakeup_cmd = s5p_mfc_wakeup_cmd_v6,
-- 
2.39.5


