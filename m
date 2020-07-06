Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8EA215EAB
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbgGFSi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729948AbgGFSi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:27 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA220214F;
        Mon,  6 Jul 2020 20:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060684;
        bh=M1c79LAPV7QhRJD2z6CEUOKAz+zoJIWihqdZqu/LkrY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PwdqZI2uEV401tmrc1+la9zi2nDSomBp1jkElEVug7VMxD3aCIg0udcPOKWrGbHUt
         9gqeSLoSSbaCuNBwXKAxmr83hxM+r75DKDkLZmhdjYAPI6VSK9eDacTi4wqBAi5jLm
         ML6M2exYQ6HnBPkBYlqMpX9DQD2mWgJe9ZgyQA9M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 059/108] media: ti-vpe: cal: Use ARRAY_SIZE to replace numerical value
Date:   Mon,  6 Jul 2020 21:36:20 +0300
Message-Id: <20200706183709.12238-60-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index a2c245ad23be..e91788519bb4 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1314,7 +1314,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		reg_write(cal, CAL_HL_IRQSTATUS(1), status);
 
-		for (i = 0; i < 2; ++i) {
+		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 			if (isportirqset(status, i)) {
 				ctx = cal->ctx[i];
 
@@ -1337,7 +1337,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		reg_write(cal, CAL_HL_IRQSTATUS(2), status);
 
-		for (i = 0; i < 2; ++i) {
+		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 			if (isportirqset(status, i)) {
 				ctx = cal->ctx[i];
 				dma_q = &ctx->vidq;
@@ -2345,7 +2345,7 @@ static int cal_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 error_context:
-	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
 		if (ctx) {
 			v4l2_async_notifier_unregister(&ctx->notifier);
@@ -2373,7 +2373,7 @@ static int cal_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 
-	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
 		if (ctx) {
 			ctx_dbg(1, ctx, "unregistering %s\n",
-- 
Regards,

Laurent Pinchart

