Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D9036587B
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbhDTMGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbhDTMGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:06:04 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5E5F1051;
        Tue, 20 Apr 2021 14:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920332;
        bh=bD13pVK5mHu8cIFvfAqNvhWA0dAykt4W04QhKLuRpwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LWp3c8kU2yZKVEVhSNbjbwxhhzlyoEMNrgALOHd54UoCyA62UGdkF39inB6xgg1tm
         Hiu2ApKO1mvxwnMxXFLpUjmMh/qPI5MraNzuFmlNq44BAENMkO2wH6FC946/lsftWK
         +cSt2uPJL/9emm2G0w132H+mrHbLjPQl6LctfNy0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 30/35] media: ti-vpe: cal: fix ctx uninitialization
Date:   Tue, 20 Apr 2021 15:04:28 +0300
Message-Id: <20210420120433.902394-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Somewhere along the way the context uninitialization has gone a bit odd:

* We have cal_ctx_create() but no matching destroy call, but we still
need to call cal_ctx_v4l2_cleanup() for each context.

* We have cal_media_cleanup() which calls cal_ctx_v4l2_cleanup() for all
contexts, but cal_media_init() is not where the contexts are created.

* The order of uninit steps in cal_remove() is different than the error
handling path in cal_probe().

* cal_probe()'s error handling calls cal_ctx_v4l2_cleanup() for each
context, but also calls cal_media_clean(), doing the same context
cleanup twice.

So fix these, by introducing cal_ctx_destroy(), and using that in
appropriate places instead of calling cal_ctx_v4l2_cleanup() in
cal_media_clean(). Also use normal kzalloc (and kfree) instead of devm
version as we anyway do manual cleanup for each context.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index bb99d0ce796f..888706187fd1 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -894,11 +894,6 @@ static int cal_media_init(struct cal_dev *cal)
  */
 static void cal_media_cleanup(struct cal_dev *cal)
 {
-	unsigned int i;
-
-	for (i = 0; i < cal->num_contexts; i++)
-		cal_ctx_v4l2_cleanup(cal->ctx[i]);
-
 	v4l2_device_unregister(&cal->v4l2_dev);
 	media_device_cleanup(&cal->mdev);
 
@@ -915,7 +910,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	struct cal_ctx *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(cal->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
@@ -934,6 +929,13 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	return ctx;
 }
 
+static void cal_ctx_destroy(struct cal_ctx *ctx)
+{
+	cal_ctx_v4l2_cleanup(ctx);
+
+	kfree(ctx);
+}
+
 static const struct of_device_id cal_of_match[] = {
 	{
 		.compatible = "ti,dra72-cal",
@@ -1148,7 +1150,7 @@ static int cal_probe(struct platform_device *pdev)
 
 error_context:
 	for (i = 0; i < cal->num_contexts; i++)
-		cal_ctx_v4l2_cleanup(cal->ctx[i]);
+		cal_ctx_destroy(cal->ctx[i]);
 
 error_camerarx:
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
@@ -1176,11 +1178,14 @@ static int cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);
 
-	cal_media_cleanup(cal);
+	for (i = 0; i < cal->num_contexts; i++)
+		cal_ctx_destroy(cal->ctx[i]);
 
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
+	cal_media_cleanup(cal);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.25.1

