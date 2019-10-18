Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85805DC8BD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633495AbfJRPcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47712 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392694AbfJRPcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWLBD013415;
        Fri, 18 Oct 2019 10:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412741;
        bh=fKnbl4rI7lxj8OVyJOMnIhdivu5BzUFIAmoern9RyCY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=I24zH4pmc+ZVwZkX6fe0RVNdjB4YZ4BL+L3DxYnmYz+Ng+2EvQ6YDDlkVmH/5/I9L
         u5ebqs/T8rFjBZU1ar6d/aXnkddj1WoS7zGeYLPDYZ5OprOw8AMMDiSL9zCMI2ooM4
         Shdlk2nhOMSA157FFduME3WOBeiPrBx/Q4/t205A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWLYV106161;
        Fri, 18 Oct 2019 10:32:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:20 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15T080266;
        Fri, 18 Oct 2019 10:32:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 15/19] media: ti-vpe: cal: Add subdev s_power hooks
Date:   Fri, 18 Oct 2019 10:34:33 -0500
Message-ID: <20191018153437.20614-16-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
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
index 42b0063b610e..e61d2f3fd1da 100644
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

