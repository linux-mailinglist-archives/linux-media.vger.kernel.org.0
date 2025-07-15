Return-Path: <linux-media+bounces-37819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2ECB06920
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 00:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 482133B360F
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 22:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9C52C15AF;
	Tue, 15 Jul 2025 22:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBj6oZO3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B22C08A2;
	Tue, 15 Jul 2025 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617602; cv=none; b=YodCUKOruTa+u0/ahnMZNLjyB44RqxYlNS9fG0bgC99HU+VyAxECc0so6E6PyUff3/Dzjr7ghbmsy9iBbdquM9ej2YqLf5fV3nvXq4VXYUTJ1OwDXVVUO1nmnc1xfVooMIX/nTQS34L0I/JuvSqI1qqzYYw/S+2JBMY7TANbulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617602; c=relaxed/simple;
	bh=Fibqw7NKYELDKQtz72tP8YYOcVBwgtPgzVnymvMd7mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MZEd4qJdn9biEH9XnVvo5FhOU8BEkALhbZsCte0u4sg7hyVudiy73r5nXygLPaBqQL0pqQllD7CVzlZysHfPHM5CCwNbBlsPY3dwovk24QFgGNApICWfuJZ+38xwyQWR4ofMvQGy3e0DeoAaa9aYvO1TsIzSmiXHGP84BcGS03M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBj6oZO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98E3C4CEE3;
	Tue, 15 Jul 2025 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752617601;
	bh=Fibqw7NKYELDKQtz72tP8YYOcVBwgtPgzVnymvMd7mM=;
	h=From:Date:Subject:To:Cc:From;
	b=iBj6oZO3pIXzFuaWEpWUH/0a/iYuiV4f4IoVpfnAj6bG/Lvvslhb0xim78aUSKXY9
	 QtUg13/mZGzfNqdnFg3ynd7Ao/u9taJ56cPG/5EAiWPs+8qUTDJGejuktRSKNV8ykU
	 L/JeUmrWlb6OnVEJEi4eYrfUEZuthawEnxCB//AsVchometCyiLDIeDeYcs9Lx7qx0
	 To8wihsfcN8ta0qpjwSCK35dokeSZ4o90d7dWuLcwaPcokTQIu61ChrY0LvXcUF6Fi
	 iaEQYjZ5S4y7LSJD+Kn1XLkBXndYnltXiLaGx+mbP51IIRTbgstnIYyCVgwYhz8lXv
	 eIbt0Gv8LlJeA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 15 Jul 2025 15:13:07 -0700
Subject: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHLSdmgC/x2NQQqDMBAAvyJ7dkElobRfKT0kcWP34CZkowji3
 w0eB4aZE5QKk8KnO6HQzspJGox9B+HvZCHkuTFMw2SH12hxpZkdqs24xoCRD9yEhSuGJFoxJ5Z
 KBYOPb2McGW88tFgu1Nxn9P1d1w13Dq1leAAAAA==
X-Change-ID: 20250715-media-s5p-mfc-fix-uninit-const-pointer-cbf944ae4b4b
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5013; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Fibqw7NKYELDKQtz72tP8YYOcVBwgtPgzVnymvMd7mM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlll+q/LxG+ybC9k9FkTXmXg8HNNQkprkYPl/2RvpD27
 NivBT33OkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEPJ8wMvSuVV6ndu5qLtuq
 b7w1Fbruej94Xof1Lbnf9NKH3fzCyyyG/1ky7zNuWxb5bL2lph/u3CvnPbFpPTtzxmSd+dPYXab
 v5AAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A new warning in clang [1] points out a few places in s5p_mfc_cmd_v6.c
where an uninitialized variable is passed as a const pointer:

  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:45:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
     45 |                                         &h2r_args);
        |                                          ^~~~~~~~
  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:133:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
    133 |                                         &h2r_args);
        |                                          ^~~~~~~~
  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:148:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
    148 |                                         &h2r_args);
        |                                          ^~~~~~~~

The args parameter in s5p_mfc_cmd_host2risc_v6() is never actually used,
so just pass NULL to it in the places where h2r_args is currently
passed, clearing up the warning and not changing the functionality of
the code.

Cc: stable@vger.kernel.org
Fixes: f96f3cfa0bb8 ("[media] s5p-mfc: Update MFC v4l2 driver to support MFC6.x")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Closes: https://github.com/ClangBuiltLinux/linux/issues/2103
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
From what I can tell, it seems like ->cmd_host2risc() is only ever
called from v6 code, which always passes NULL? It seems like it should
be possible to just drop .cmd_host2risc on the v5 side, then update
.cmd_host2risc to only take two parameters? If so, I can send a follow
up as a clean up, so that this can go back relatively conflict free.
---
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c      | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
index 47bc3014b5d8..735471c50dbb 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
@@ -31,7 +31,6 @@ static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd,
 
 static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
 {
-	struct s5p_mfc_cmd_args h2r_args;
 	const struct s5p_mfc_buf_size_v6 *buf_size = dev->variant->buf_size->priv;
 	int ret;
 
@@ -41,33 +40,23 @@ static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
 
 	mfc_write(dev, dev->ctx_buf.dma, S5P_FIMV_CONTEXT_MEM_ADDR_V6);
 	mfc_write(dev, buf_size->dev_ctx, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6,
-					&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6, NULL);
 }
 
 static int s5p_mfc_sleep_cmd_v6(struct s5p_mfc_dev *dev)
 {
-	struct s5p_mfc_cmd_args h2r_args;
-
-	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6,
-			&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6, NULL);
 }
 
 static int s5p_mfc_wakeup_cmd_v6(struct s5p_mfc_dev *dev)
 {
-	struct s5p_mfc_cmd_args h2r_args;
-
-	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
-	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6,
-					&h2r_args);
+	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6, NULL);
 }
 
 /* Open a new instance and get its number */
 static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 {
 	struct s5p_mfc_dev *dev = ctx->dev;
-	struct s5p_mfc_cmd_args h2r_args;
 	int codec_type;
 
 	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
@@ -130,14 +119,13 @@ static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 	mfc_write(dev, 0, S5P_FIMV_D_CRC_CTRL_V6); /* no crc */
 
 	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANCE_V6,
-					&h2r_args);
+					NULL);
 }
 
 /* Close instance */
 static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 {
 	struct s5p_mfc_dev *dev = ctx->dev;
-	struct s5p_mfc_cmd_args h2r_args;
 	int ret = 0;
 
 	dev->curr_ctx = ctx->num;
@@ -145,7 +133,7 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 		mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
 		ret = s5p_mfc_cmd_host2risc_v6(dev,
 					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6,
-					&h2r_args);
+					NULL);
 	} else {
 		ret = -EINVAL;
 	}

---
base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
change-id: 20250715-media-s5p-mfc-fix-uninit-const-pointer-cbf944ae4b4b

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


