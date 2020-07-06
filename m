Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780E4215EDA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgGFSjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730043AbgGFSjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:16 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF871961;
        Mon,  6 Jul 2020 20:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060714;
        bh=3VuTGPdapliD+67wWCuOYsIoQjG7ozsvw3Ch1irxW+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SW8rP1sZHhLBI9sLtJ8qt12CTIeDweCUvFMxovzBIU1zy+mgE2Akxgtt62yKgdgVj
         zU/g7Nj/kR3/nZP7JxBju/dK+nzjXHkBcWkiOZB6NwtP2DhzMHUbXMkQ1z78zyg5gi
         vLrC+B3gNBToT9tJHgOQeXHnrHwtnJWDTeSqqFjU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 103/108] media: ti-vpe: cal: Use list_first_entry()
Date:   Mon,  6 Jul 2020 21:37:04 +0300
Message-Id: <20200706183709.12238-104-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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

