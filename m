Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFCC3A65C1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235973AbhFNLmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236924AbhFNLkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:40:15 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E83E15EA9;
        Mon, 14 Jun 2021 13:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669851;
        bh=2jJSL8XsQe0opH7Vz22AmL1wPipYaR8nYope9FMklQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MnWuj3iRirn5J7jaS0P/oWmQ8EYmTSGdYZ2DsTfMH4pDi43V0IR2VJAIQXTpXq8uL
         lT11QD2Y5xJRiXe/zORX8qT4A2V332/zUr7bxthboXE1x5VC/n94Atn/geIo5zRJO4
         XuQOxVQ45vK7hWrx4d1EX66bWHB/jGDrXxIK3owc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 21/35] media: ti-vpe: cal: handle cal_ctx_v4l2_register error
Date:   Mon, 14 Jun 2021 14:23:31 +0300
Message-Id: <20210614112345.2032435-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_async_notifier_complete() doesn't handle errors returned from
cal_ctx_v4l2_register(). Add the error handling.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 2d05fb3993d8..3a836813eda8 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -740,15 +740,33 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
 	unsigned int i;
-	int ret = 0;
+	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_register(cal->ctx[i]);
+		if (!cal->ctx[i])
+			continue;
+
+		ret = cal_ctx_v4l2_register(cal->ctx[i]);
+		if (ret)
+			goto err_ctx_unreg;
 	}
 
-	if (cal_mc_api)
-		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
+	if (!cal_mc_api)
+		return 0;
+
+	ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
+	if (ret)
+		goto err_ctx_unreg;
+
+	return 0;
+
+err_ctx_unreg:
+	for (; i > 0; --i) {
+		if (!cal->ctx[i - 1])
+			continue;
+
+		cal_ctx_v4l2_unregister(cal->ctx[i - 1]);
+	}
 
 	return ret;
 }
-- 
2.25.1

