Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7262D085F
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgLFX5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:57:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgLFX5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:57:41 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71B5618C0;
        Mon,  7 Dec 2020 00:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298848;
        bh=w9MxY1gccK5TSyW56Oau9PgfmFc8V1vm9meibZQC6qY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G1W0VS+gkq2UGh65ezFZPuQlpQBwz87o4jyIwq8XQaD4CF871BkT/sizR8hT00HV8
         qo+r+5j1YV/H3F4rSwUUs01eX03lalk/Wsr4xTW45EfR0+Te91ArJl+F/DIG0OxAfw
         bfcUY5vU6i2EQwSD8/UXVXvVvZzMV8QIMa8b3JHc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 19/24] media: ti-vpe: cal: Use list_first_entry()
Date:   Mon,  7 Dec 2020 01:53:48 +0200
Message-Id: <20201206235353.26968-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the list_first_entry() macro where appropriate to replace manual
usage of list_entry(head.next).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 2 +-
 drivers/media/platform/ti-vpe/cal.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index bfc3ba4a96af..c80c4643d8ed 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -511,7 +511,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	int ret;
 
 	spin_lock_irq(&ctx->slock);
-	buf = list_entry(dma_q->active.next, struct cal_buffer, list);
+	buf = list_first_entry(&dma_q->active, struct cal_buffer, list);
 	ctx->cur_frm = buf;
 	ctx->next_frm = buf;
 	list_del(&buf->list);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f1c2b8bc28f4..8f25e7a6f5e8 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -496,7 +496,7 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 		struct cal_buffer *buf;
 		unsigned long addr;
 
-		buf = list_entry(dma_q->active.next, struct cal_buffer, list);
+		buf = list_first_entry(&dma_q->active, struct cal_buffer, list);
 		addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		cal_ctx_wr_dma_addr(ctx, addr);
 
-- 
Regards,

Laurent Pinchart

