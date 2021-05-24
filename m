Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D1838E50A
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhEXLLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33754 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbhEXLLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:15 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAEDA34C4;
        Mon, 24 May 2021 13:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854574;
        bh=ODzt38FhvwpdHqxhiB4sPof8xC4Asc8iv4WDpfG+PN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l7TZpEpOoUNz4VpYCGLZ1IpbwD7SM83OFbVonnl7i2oSUblWqlBidtEhdhFvkovbO
         mzcy1yNb0neAMGsSUkl3T7qFBG9wtSOkv+EuKki+ZL05kXJCFm351w8fMK/+H+w2fx
         rx1aDS29aiPqyU5MtuWYZFpx3Fvq05QoatES5wpA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 31/38] media: ti-vpe: cal: fix queuing of the initial buffer
Date:   Mon, 24 May 2021 14:09:02 +0300
Message-Id: <20210524110909.672432-32-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When starting streaming the driver currently programs the buffer
address to the CAL base-address register and assigns the buffer pointer
to ctx->dma.pending. This is not correct, as the buffer is not
"pending", but active, and causes the first buffer to be needlessly
written twice.

Fix this by assigning the buffer pointer to ctx->dma.active.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index d06488cb8c36..efa08a9ccbd5 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -731,7 +731,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	spin_lock_irq(&ctx->dma.lock);
 	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
-	ctx->dma.pending = buf;
+	ctx->dma.active = buf;
 	list_del(&buf->list);
 	spin_unlock_irq(&ctx->dma.lock);
 
-- 
2.25.1

