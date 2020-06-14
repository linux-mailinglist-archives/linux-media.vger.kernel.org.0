Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A828D1F8BCE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgFOACP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbgFOACN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:13 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCDEA2178;
        Mon, 15 Jun 2020 02:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179260;
        bh=BlBXT2qEpm0lGEdeWE0ijazOl2OKz6+fH7vEd98WDyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T6ZH4IbNijLq8BYtZuJeNPtj3wYFuR+7BDsyCMq70ucRI/fl/cub9nOqi98JXWOeS
         QzCQsCleV9aCnZZrFb8cC9ruBYgRmek9GzDHVz+GfXJAEt40JxJRMWs2mBlfNy1sUt
         mq1RGBbeDJFs2235+4HSjnszsDhKiZPKJS9Th4+Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 102/107] media: ti-vpe: cal: Use list_first_entry()
Date:   Mon, 15 Jun 2020 02:59:39 +0300
Message-Id: <20200614235944.17716-103-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the list_first_entry() macro where appropriate to replace manual
usage of list_entry(head.next).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 2 +-
 drivers/media/platform/ti-vpe/cal.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index d10c8c16abd3..1b9b0e0719d4 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -512,7 +512,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	int ret;
 
 	spin_lock_irq(&ctx->slock);
-	buf = list_entry(dma_q->active.next, struct cal_buffer, list);
+	buf = list_first_entry(&dma_q->active, struct cal_buffer, list);
 	ctx->cur_frm = buf;
 	ctx->next_frm = buf;
 	list_del(&buf->list);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 09cad8046910..ca9168fd7a13 100644
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

