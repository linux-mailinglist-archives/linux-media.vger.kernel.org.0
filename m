Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DF51F8BA2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgFOABV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgFOABT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:19 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2148F2153;
        Mon, 15 Jun 2020 02:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179237;
        bh=IfWtuGfaaNXUgonwTUQn0OCNrYaY+MWU4ufj0nJjWsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tcSbINoHmTerU66lB/pMZjAlBZ6+qY/K1GTMTghFZJ66mvV+eo41IlQ94ilXJ0oKf
         SWP5P7v7eVHkKTYLyRjUOWmjIsgj0Z6CUEJ3b9M16XvSxzEmlsi9Mhe0Ojg01mi7DS
         9H6I1wgKuIz7nFm6a6WWq6/anADWLeDRYwJxHL9I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 058/107] media: ti-vpe: cal: Use ARRAY_SIZE to replace numerical value
Date:   Mon, 15 Jun 2020 02:58:55 +0300
Message-Id: <20200614235944.17716-59-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use ARRAY_SIZE(cal->ctx) to iterate over the cal->ctx array instead of
using the numerical value from the CAL_NUM_CONTEXT macro (or, worse,
hardcoding the value 2). This will allow reworking contexts with less
changes in the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index af142b00ee0b..ca8aa630b9b3 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1305,7 +1305,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		reg_write(cal, CAL_HL_IRQSTATUS(1), status);
 
-		for (i = 0; i < 2; ++i) {
+		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 			if (isportirqset(status, i)) {
 				ctx = cal->ctx[i];
 
@@ -1326,7 +1326,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		reg_write(cal, CAL_HL_IRQSTATUS(2), status);
 
-		for (i = 0; i < 2; ++i) {
+		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 			if (isportirqset(status, i)) {
 				ctx = cal->ctx[i];
 				dma_q = &ctx->vidq;
@@ -2323,7 +2323,7 @@ static int cal_probe(struct platform_device *pdev)
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
-	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
 		if (ctx) {
 			v4l2_async_notifier_unregister(&ctx->notifier);
@@ -2352,7 +2352,7 @@ static int cal_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 
-	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
 		if (ctx) {
 			ctx_dbg(1, ctx, "unregistering %s\n",
-- 
Regards,

Laurent Pinchart

