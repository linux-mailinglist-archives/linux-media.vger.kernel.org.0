Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 933F7EE87B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729812AbfKDTcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:23 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47588 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbfKDTcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:32:22 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWKUp000870;
        Mon, 4 Nov 2019 13:32:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895940;
        bh=cZMcYbYV8hOTD0/O4FmJl9iJAKdUp1+IfyYKelCaakQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M1jems9EAJPXXTZ8CxLuWqq9f2vR2nDs7mz63YDNjP2Ae4HHevKJ7CUOFveRazfz4
         +7n+awh/SR5m205HeJNhVP2rxdBe5w+9gNEj38PFNw1mIsdW1jYZHMyB1FJ1c0AT5o
         EgwE145rGfkzo6Llhdt/IXZLpf5ROCiTOwhRW7eQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JWK3h021932
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:32:20 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:32:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:32:19 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmdE096934;
        Mon, 4 Nov 2019 13:32:19 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 15/20] media: ti-vpe: cal: Add subdev s_power hooks
Date:   Mon, 4 Nov 2019 13:31:35 -0600
Message-ID: <20191104193140.31145-16-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Based on V4L2 documentations bridge driver must power on and off sub
device explicitly if media-controller mode is not used.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 45653e9ed6cd..f0210a743bdc 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1661,6 +1661,12 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret < 0)
 		goto err;
 
+	ret = v4l2_subdev_call(ctx->sensor, core, s_power, 1);
+	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
+		ctx_err(ctx, "power on failed in subdev\n");
+		goto err;
+	}
+
 	cal_runtime_get(ctx->dev);
 
 	csi2_ctx_config(ctx);
@@ -1674,6 +1680,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = v4l2_subdev_call(ctx->sensor, video, s_stream, 1);
 	if (ret) {
+		v4l2_subdev_call(ctx->sensor, core, s_power, 0);
 		ctx_err(ctx, "stream on failed in subdev\n");
 		cal_runtime_put(ctx->dev);
 		goto err;
@@ -1702,6 +1709,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
 	unsigned long flags;
+	int ret;
 
 	csi2_ppi_disable(ctx);
 	disable_irqs(ctx);
@@ -1710,6 +1718,10 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	if (v4l2_subdev_call(ctx->sensor, video, s_stream, 0))
 		ctx_err(ctx, "stream off failed in subdev\n");
 
+	ret = v4l2_subdev_call(ctx->sensor, core, s_power, 0);
+	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
+		ctx_err(ctx, "power off failed in subdev\n");
+
 	/* Release all active buffers */
 	spin_lock_irqsave(&ctx->slock, flags);
 	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
-- 
2.17.1

