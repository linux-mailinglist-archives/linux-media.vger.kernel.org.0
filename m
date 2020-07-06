Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99CB215E7B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgGFShl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgGFShj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D8ADD98;
        Mon,  6 Jul 2020 20:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060653;
        bh=USYoXMaipwqJxdelAV1dYXNIMromSZMKWMNbZIV02d4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iWJYQtMX9m+z0lNtddc3pLWCUmovCGU+BCuEUNOZ5q0vWTZ9oL0+8UFC+8HagKwJm
         B/gnV5J6zXn0MoyVxh8vVsOo4xtn3xBqmf+sLQ66b/Zrehly5RLNw70Z1CUtEIGlZ4
         NPuVy0XEsEAFnWESxMzsx3VAXpPoIwMmWZ9+CIKg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 011/108] media: ti-vpe: cal: Remove needless casts
Date:   Mon,  6 Jul 2020 21:35:32 +0300
Message-Id: <20200706183709.12238-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Casting from a void pointer to a struct pointer doesn't require a cast.
Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d0390b23426d..ee6f700ad190 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1205,7 +1205,7 @@ static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
 
 static irqreturn_t cal_irq(int irq_cal, void *data)
 {
-	struct cal_dev *dev = (struct cal_dev *)data;
+	struct cal_dev *dev = data;
 	struct cal_ctx *ctx;
 	struct cal_dmaqueue *dma_q;
 	u32 status;
@@ -2404,8 +2404,7 @@ static int cal_probe(struct platform_device *pdev)
 
 static int cal_remove(struct platform_device *pdev)
 {
-	struct cal_dev *dev =
-		(struct cal_dev *)platform_get_drvdata(pdev);
+	struct cal_dev *dev = platform_get_drvdata(pdev);
 	struct cal_ctx *ctx;
 	int i;
 
-- 
Regards,

Laurent Pinchart

