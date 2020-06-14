Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77A11F8BA4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgFOABV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgFOABV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:21 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDDDC2156;
        Mon, 15 Jun 2020 02:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179238;
        bh=iVJFL/zBmAKMK2n1sNpPxQWHwzx9uQjaFdpa+dQYD0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eglQ2LcZYyXiC72bD5yKaZ6eagI52GU3Q+jVTDfqzPRmD6vcG+UNxVxkcwfbq87Ge
         o8rU6CiuuCWANaiVtF8l6rmUlj/Oukpc9v/FBjuKQngiHxszm/VTnr2jmgByqO9VYX
         6nI7oqK2/11f2Hv7PM/3CtwAoDhHr4KQYICsghm4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 060/107] media: ti-vpe: cal: Allow multiple contexts per subdev notifier
Date:   Mon, 15 Jun 2020 02:58:57 +0300
Message-Id: <20200614235944.17716-61-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 52f6d4b68169..0ae88f3593c6 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2104,11 +2104,22 @@ static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
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
@@ -2137,6 +2148,7 @@ static const struct v4l2_async_notifier_operations cal_async_ops = {
 
 static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 {
+	struct cal_v4l2_async_subdev *casd;
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *fwnode;
 	int ret;
@@ -2152,6 +2164,9 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
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

