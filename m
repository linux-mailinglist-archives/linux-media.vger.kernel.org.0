Return-Path: <linux-media+bounces-41757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC1B43599
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 621527B3C17
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1388F2C11D9;
	Thu,  4 Sep 2025 08:23:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE692AE68
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756974193; cv=none; b=Q/gZMwtSu0lesrM41OxF9t+wL7DDdBkl/ADngHzRfDdXRWcljUEy/LWepXq/vj3DEYdHdqf5Imo3D7IZt7P8XZX3e5bNuQUAjbKDgMmuYfmtwCfxanGy9JxCuUrxrHhA13/biws5msDFNMw4yIHpTJhJNKnQUSeGylxFFf2BVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756974193; c=relaxed/simple;
	bh=0NXMQ43EVDbunJXI34RVxh2iWxPVfn9f3E0EIWXfkio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HLYq2vTk1wKHlpyHsMt0XBTSh6mwVnTlUbwgXQX25ogPvZFk4eA0eayCA18fLmHerQQLVtwFI8oijJIFFxDBHg36MfJuBYFVow5urcbaBWjN1Rd/TVguGCdlc/CsIjsWzPXlrUN/gKpbmNjLIpd7ByLUs4mhae8poF1R6mI+mDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn; spf=pass smtp.mailfrom=iie.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iie.ac.cn
Received: from localhost.localdomain (unknown [159.226.95.28])
	by APP-05 (Coremail) with SMTP id zQCowADniBJZTLlodVx8AA--.18339S2;
	Thu, 04 Sep 2025 16:22:51 +0800 (CST)
From: Chen Yufeng <chenyufeng@iie.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Chen Yufeng <chenyufeng@iie.ac.cn>
Subject: [PATCH] media: prevent memory leak in cx25840_ir_probe
Date: Thu,  4 Sep 2025 16:22:22 +0800
Message-ID: <20250904082222.928-1-chenyufeng@iie.ac.cn>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADniBJZTLlodVx8AA--.18339S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWkAw13Wr13ZF15Jr47urg_yoWDXwcE93
	4UXrW7WrWUKFs8K3W0kr4rZa4FyFZ8KF48XFnIq343AryFv3s7Za9rZ343Ww4UuFW09F1r
	KFn3uFy7Kws2yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjxR65UUUUU==
X-CM-SenderInfo: xfkh05xxih0wo6llvhldfou0/1tbiDAYPEmi5BtD1ggAAsn

In cx25840_ir_probe if kfifo_alloc fails the allocated memory for ir_state
should be released.

A patch similar to commit a7b2df76b42b ("media: rc: prevent memory leak in 
cx23888_ir_probe").

Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
---
 drivers/media/i2c/cx25840/cx25840-ir.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 8cef9656c612..ee80867755e5 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -1199,8 +1199,10 @@ int cx25840_ir_probe(struct v4l2_subdev *sd)
 
 	spin_lock_init(&ir_state->rx_kfifo_lock);
 	if (kfifo_alloc(&ir_state->rx_kfifo,
-			CX25840_IR_RX_KFIFO_SIZE, GFP_KERNEL))
+			CX25840_IR_RX_KFIFO_SIZE, GFP_KERNEL)) {
+		devm_kfree(&state->c->dev, ir_state);
 		return -ENOMEM;
+	}
 
 	ir_state->c = state->c;
 	state->ir_state = ir_state;
-- 
2.34.1


