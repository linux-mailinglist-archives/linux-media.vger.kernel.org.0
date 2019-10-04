Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94275CC097
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfJDQ2l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:28:41 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35290 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731161AbfJDQ2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:28:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GS0qx008103;
        Fri, 4 Oct 2019 11:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206480;
        bh=E3rMcw7U0ktsEGYukudUhIDdBCppNQ7594aPdfV/7Hw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Gf7jOwttefBc/wmIYO/wDv23OH1pt33UMdsS7MsA4dYKYZ8K1UqjgFjQhfA81sQCR
         bxkh/LkhDvFB8l15YZwjBswKe0Y48vUhRuUutV7Z1gzT2ssptl4FAltSASMmkUiJhe
         6qVUPQACyOicUHYO4pzRaU05xHsQUBWVwiOIwBmg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GS0Op065054
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:28:00 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:27:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:28:00 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgAF028904;
        Fri, 4 Oct 2019 11:28:00 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 13/21] media: ti-vpe: vpe: ensure buffers are cleaned up properly in abort cases
Date:   Fri, 4 Oct 2019 11:29:44 -0500
Message-ID: <20191004162952.4963-14-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance fails with this message:

   fail: v4l2-test-buffers.cpp(691): ret == 0
   fail: v4l2-test-buffers.cpp(974): captureBufs(node, q, m2m_q,
frame_count, true)
   test MMAP: FAIL

This caused the following Kernel Warning:

WARNING: CPU: 0 PID: 961 at
drivers/media/v4l2-core/videobuf2-core.c:1658
__vb2_queue_cancel+0x174/0x1d8
...
CPU: 0 PID: 961 Comm: v4l2-compliance Not tainted
4.14.62-01720-g20ecd717e87a #6
Hardware name: Generic DRA72X (Flattened Device Tree)
Backtrace:
[<c020b5bc>] (dump_backtrace) from [<c020b8a0>] (show_stack+0x18/0x1c)
 r7:00000009 r6:60070013 r5:00000000 r4:c1053824
[<c020b888>] (show_stack) from [<c09232e8>] (dump_stack+0x90/0xa4)
[<c0923258>] (dump_stack) from [<c022b740>] (__warn+0xec/0x104)
  r7:00000009 r6:c0c0ad50 r5:00000000 r4:00000000
[<c022b654>] (__warn) from [<c022b810>] (warn_slowpath_null+0x28/0x30)
  r9:00000008 r8:00000000 r7:eced4808 r6:edbc9bac r5:eced4844
r4:eced4808
[<c022b7e8>] (warn_slowpath_null) from [<c0726f48>]
(__vb2_queue_cancel+0x174/0x1d8)
[<c0726dd4>] (__vb2_queue_cancel) from [<c0727648>]
(vb2_core_queue_release+0x20/0x40)
  r10:ecc7bd70 r9:00000008 r8:00000000 r7:edb73010 r6:edbc9bac
r5:eced4844
  r4:eced4808 r3:00000004
[<c0727628>] (vb2_core_queue_release) from [<c0729528>]
(vb2_queue_release+0x10/0x14)
  r5:edbc9810 r4:eced4800
[<c0729518>] (vb2_queue_release) from [<c0724d08>]
(v4l2_m2m_ctx_release+0x1c/0x30)
[<c0724cec>] (v4l2_m2m_ctx_release) from [<bf0e8f28>]
(vpe_release+0x74/0xb0 [ti_vpe])
  r5:edbc9810 r4:ed67a400
[<bf0e8eb4>] (vpe_release [ti_vpe]) from [<c070fccc>]
(v4l2_release+0x3c/0x80)
  r7:edb73010 r6:ed176aa0 r5:edbc9868 r4:ed5119c0
[<c070fc90>] (v4l2_release) from [<c033cf1c>] (__fput+0x8c/0x1dc)
  r5:ecc7bd70 r4:ed5119c0
[<c033ce90>] (__fput) from [<c033d0cc>] (____fput+0x10/0x14)
  r10:00000000 r9:ed5119c0 r8:ece392d0 r7:c1059544 r6:ece38d80
r5:ece392b4
  r4:00000000
[<c033d0bc>] (____fput) from [<c0246e00>] (task_work_run+0x98/0xb8)
[<c0246d68>] (task_work_run) from [<c022f1d8>] (do_exit+0x170/0xa80)
  r9:ece351fc r8:00000000 r7:ecde3f58 r6:ffffe000 r5:ece351c0
r4:ece38d80
[<c022f068>] (do_exit) from [<c022fb6c>] (do_group_exit+0x48/0xc4)
  r7:000000f8
[<c022fb24>] (do_group_exit) from [<c022fc00>]
(__wake_up_parent+0x0/0x28)
  r7:000000f8 r6:b6c6a798 r5:00000001 r4:00000001
[<c022fbe8>] (SyS_exit_group) from [<c0207c80>]
(ret_fast_syscall+0x0/0x4c)

These warnings are caused by buffers which not properly cleaned
up/release during an abort use case.

In the abort cases the VPDMA desc buffers would still be mapped and the
in-flight VB2 buffers would not be released properly causing a kernel
warning from being generated by the videobuf2-core level.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 8ab1c3241b74..ad9d8b559cad 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1427,9 +1427,6 @@ static irqreturn_t vpe_irq(int irq_vpe, void *data)
 	 /* the previous dst mv buffer becomes the next src mv buffer */
 	ctx->src_mv_buf_selector = !ctx->src_mv_buf_selector;
 
-	if (ctx->aborting)
-		goto finished;
-
 	s_vb = ctx->src_vbs[0];
 	d_vb = ctx->dst_vb;
 
@@ -1494,6 +1491,9 @@ static irqreturn_t vpe_irq(int irq_vpe, void *data)
 	ctx->src_vbs[0] = NULL;
 	ctx->dst_vb = NULL;
 
+	if (ctx->aborting)
+		goto finished;
+
 	ctx->bufs_completed++;
 	if (ctx->bufs_completed < ctx->bufs_per_job && job_ready(ctx)) {
 		device_run(ctx);
@@ -2404,6 +2404,12 @@ static int vpe_release(struct file *file)
 
 	mutex_lock(&dev->dev_mutex);
 	free_mv_buffers(ctx);
+
+	vpdma_unmap_desc_buf(dev->vpdma, &ctx->desc_list.buf);
+	vpdma_unmap_desc_buf(dev->vpdma, &ctx->mmr_adb);
+	vpdma_unmap_desc_buf(dev->vpdma, &ctx->sc_coeff_h);
+	vpdma_unmap_desc_buf(dev->vpdma, &ctx->sc_coeff_v);
+
 	vpdma_free_desc_list(&ctx->desc_list);
 	vpdma_free_desc_buf(&ctx->mmr_adb);
 
-- 
2.17.1

