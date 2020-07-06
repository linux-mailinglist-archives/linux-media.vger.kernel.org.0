Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AE1215EAD
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729957AbgGFSia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbgGFSi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C29871961;
        Mon,  6 Jul 2020 20:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060685;
        bh=WuhUAshEWjr9Zw+/giJmXHZL4RFhsuH1UwsDMPfWhao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MAP1GHXrkxvwTAgV95j7MFH5/efRtmoPpGGovWS1aJ4Xvv31D1RPH+qGegHdMqIvc
         uQz6tnrS7HvVxmumO7c/qes+xzw4nu22ZoJWAqAdlu3nCKmy5LJuTGPnJa05i/KtHj
         48n95rKVOh+caDlPvDCZyvVF8p2LLTGPJDW8NvDo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 061/108] media: ti-vpe: cal: Allow multiple contexts per subdev notifier
Date:   Mon,  6 Jul 2020 21:36:22 +0300
Message-Id: <20200706183709.12238-62-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev notifier handling assumes a 1:1 mapping between CAL contexts
and notifiers. To prepare for merging the multiple notifiers into a
single one, retrieve the CAL context from the async subdev structure
instead of from the notifier.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b5eb6a640d70..83e790941e22 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2115,11 +2115,22 @@ static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
  * ------------------------------------------------------------------
  */
 
+struct cal_v4l2_async_subdev {
+	struct v4l2_async_subdev asd;
+	struct cal_ctx *ctx;
+};
+
+static inline struct cal_v4l2_async_subdev *
+to_cal_asd(struct v4l2_async_subdev *asd)
+{
+	return container_of(asd, struct cal_v4l2_async_subdev, asd);
+}
+
 static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_subdev *subdev,
 			   struct v4l2_async_subdev *asd)
 {
-	struct cal_ctx *ctx = notifier_to_ctx(notifier);
+	struct cal_ctx *ctx = to_cal_asd(asd)->ctx;
 
 	if (ctx->phy->sensor) {
 		ctx_info(ctx, "Rejecting subdev %s (Already set!!)",
@@ -2148,6 +2159,7 @@ static const struct v4l2_async_notifier_operations cal_async_ops = {
 
 static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 {
+	struct cal_v4l2_async_subdev *casd;
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *fwnode;
 	int ret;
@@ -2163,6 +2175,9 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 		return PTR_ERR(asd);
 	}
 
+	casd = to_cal_asd(asd);
+	casd->ctx = ctx;
+
 	ret = v4l2_async_notifier_register(&ctx->cal->v4l2_dev,
 					   &ctx->notifier);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

