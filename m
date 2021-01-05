Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4022EAE98
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbhAEPet (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:34:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbhAEPet (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:34:49 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF44F1876;
        Tue,  5 Jan 2021 16:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860596;
        bh=EhTxzIWmf/lVUrkhx09lbkqts+y6uk7LMTG/znrYlWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UDtTrD3TPWS58RIrohKoqkq02jJoElHuxhbhmJBNkvY5ERkSq8fmM5tdeOdWP+RCY
         yJNfPQCp4bSGwqQfP3/bbB+3HIqqmR2ozNRzwe4ssW08rFfNjDJi9ABBK1ZuLpMMud
         bJcUZdcir43HDUxLjZJndtyHzz5nCMmcNoqwK2r4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 32/75] media: imx: imx7-media-csi: Remove control handler
Date:   Tue,  5 Jan 2021 17:28:09 +0200
Message-Id: <20210105152852.5733-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The control handler isn't used, drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index c087a212efdd..69ff491671a3 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -18,7 +18,6 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
-#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -173,8 +172,6 @@ struct imx7_csi {
 	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
 	struct v4l2_fract frame_interval[IMX7_CSI_PADS_NUM];
 
-	struct v4l2_ctrl_handler ctrl_hdlr;
-
 	void __iomem *regbase;
 	int irq;
 	struct clk *mclk;
@@ -476,8 +473,6 @@ static int imx7_csi_link_setup(struct media_entity *entity,
 		}
 		csi->sink = remote->entity;
 	} else {
-		v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
-		v4l2_ctrl_handler_init(&csi->ctrl_hdlr, 0);
 		csi->sink = NULL;
 	}
 
@@ -1284,9 +1279,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	csi->sd.grp_id = IMX_MEDIA_GRP_ID_CSI;
 	snprintf(csi->sd.name, sizeof(csi->sd.name), "csi");
 
-	v4l2_ctrl_handler_init(&csi->ctrl_hdlr, 0);
-	csi->sd.ctrl_handler = &csi->ctrl_hdlr;
-
 	for (i = 0; i < IMX7_CSI_PADS_NUM; i++)
 		csi->pad[i].flags = (i == IMX7_CSI_PAD_SINK) ?
 			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
@@ -1294,7 +1286,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&csi->sd.entity, IMX7_CSI_PADS_NUM,
 				     csi->pad);
 	if (ret < 0)
-		goto free;
+		goto cleanup;
 
 	ret = imx7_csi_async_register(csi);
 	if (ret)
@@ -1306,9 +1298,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	v4l2_async_notifier_unregister(&csi->notifier);
 	v4l2_async_notifier_cleanup(&csi->notifier);
 
-free:
-	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
-
 cleanup:
 	v4l2_async_notifier_unregister(&imxmd->notifier);
 	v4l2_async_notifier_cleanup(&imxmd->notifier);
@@ -1338,7 +1327,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_async_notifier_unregister(&csi->notifier);
 	v4l2_async_notifier_cleanup(&csi->notifier);
 	v4l2_async_unregister_subdev(sd);
-	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
 	mutex_destroy(&csi->lock);
 
-- 
Regards,

Laurent Pinchart

