Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B52E1F8B6F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgFOAAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgFOAAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:23 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1C4CF9;
        Mon, 15 Jun 2020 02:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179215;
        bh=HjSGDvwY84i5xGsk9zG943CrLETOGMwEznwbV5pYqj8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=buqZaXcSawpmcJU4McrxOvPFhMvrTg4414H1ycLHuXe30QZkyl6Fk/zYPt/jUlHfL
         I5R6gumGmNaf3r/bXA0V/KRFAPYqKnYkdM6IwA+ktaJGTzYSZasTHYKTM876kw4fZW
         Ru+jF6Ij0U1ZpYbHVkb0G5VVJEJWJnd87vL57Sow=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 011/107] media: ti-vpe: cal: Remove needless casts
Date:   Mon, 15 Jun 2020 02:58:08 +0300
Message-Id: <20200614235944.17716-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Casting from a void pointer to a struct pointer doesn't require a cast.
Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 6728bac36f3c..34817f8d81b5 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1205,7 +1205,7 @@ static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
 
 static irqreturn_t cal_irq(int irq_cal, void *data)
 {
-	struct cal_dev *dev = (struct cal_dev *)data;
+	struct cal_dev *dev = data;
 	struct cal_ctx *ctx;
 	struct cal_dmaqueue *dma_q;
 	unsigned int i;
@@ -2399,8 +2399,7 @@ static int cal_probe(struct platform_device *pdev)
 
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

