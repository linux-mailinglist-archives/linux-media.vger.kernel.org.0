Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4433A65E9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhFNLpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:45:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbhFNLmc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:42:32 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 280DD5EBB;
        Mon, 14 Jun 2021 13:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669855;
        bh=9m1Cr9V+O7ElFZOgFwmu+mdbVRYH1Nxz9Hsy3kFBTZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RqZTxv2uT+mZ5zBHEGA+zTJWyCuBIyM+epugeMW0CPPIB05+DufO0LzqTKBY0o9K7
         wOQM+QTKy1BrZLiwZ0NaoFLKjMWI+Rqg32bkKtdq3poYYIP2+TOhGXWM424ZqHAgaF
         sEoVKchg8gX5IlOW9T3nlqddn08swKJ7ICSGpHIo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 30/35] media: ti-vpe: cal: fix ctx uninitialization
Date:   Mon, 14 Jun 2021 14:23:40 +0300
Message-Id: <20210614112345.2032435-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9bba07647610..cce627c5519c 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -908,11 +908,6 @@ static int cal_media_init(struct cal_dev *cal)
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
 
@@ -929,7 +924,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	struct cal_ctx *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(cal->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
@@ -948,6 +943,13 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
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
@@ -1162,7 +1164,7 @@ static int cal_probe(struct platform_device *pdev)
 
 error_context:
 	for (i = 0; i < cal->num_contexts; i++)
-		cal_ctx_v4l2_cleanup(cal->ctx[i]);
+		cal_ctx_destroy(cal->ctx[i]);
 
 error_camerarx:
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
@@ -1191,11 +1193,14 @@ static int cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);
 
-	cal_media_cleanup(cal);
+	for (i = 0; i < cal->num_contexts; i++)
+		cal_ctx_destroy(cal->ctx[i]);
 
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
+	cal_media_cleanup(cal);
+
 	if (ret >= 0)
 		pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1

