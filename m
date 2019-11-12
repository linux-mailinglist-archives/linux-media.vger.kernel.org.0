Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFBEBF930E
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfKLOvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:05 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43640 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbfKLOvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:04 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEp2ao052222;
        Tue, 12 Nov 2019 08:51:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570262;
        bh=cWIhxaWfs1VKoPfhzGdI1lG2Bp+nNVmsDFTtssjDckQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xl2baX29/lrLgqb6uwRAFwhtjuHYvrxH/RlOb85LpVieXfytEM+j6brs2Gehd1b2y
         nbXqKCHS+hCjzeknwt+TehSLoptL33EnvaidfYMhd462SmA8GObnxWYrpdRNka5Jdw
         cyyTNfG1uqEy7YF7eCugHE9ewtIPEcwytOXF5qe8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEp1So054959
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:51:01 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:51:01 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:51:01 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokf2068428;
        Tue, 12 Nov 2019 08:51:01 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 16/20] media: ti-vpe: cal: Add subdev s_power hooks
Date:   Tue, 12 Nov 2019 08:53:43 -0600
Message-ID: <20191112145347.23519-17-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Because V4L2 still uses a specific way to manage power state of devices
that predates runtime PM, bridge driver should power on and off sub
device explicitly.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 58d2edc087fb..5b5ff32b6120 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1654,6 +1654,12 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -1667,6 +1673,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = v4l2_subdev_call(ctx->sensor, video, s_stream, 1);
 	if (ret) {
+		v4l2_subdev_call(ctx->sensor, core, s_power, 0);
 		ctx_err(ctx, "stream on failed in subdev\n");
 		cal_runtime_put(ctx->dev);
 		goto err;
@@ -1695,6 +1702,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
 	unsigned long flags;
+	int ret;
 
 	csi2_ppi_disable(ctx);
 	disable_irqs(ctx);
@@ -1703,6 +1711,10 @@ static void cal_stop_streaming(struct vb2_queue *vq)
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

