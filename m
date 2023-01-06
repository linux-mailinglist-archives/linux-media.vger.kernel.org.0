Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F9C660151
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 14:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjAFNdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 08:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbjAFNdd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 08:33:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D03077ADE
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 05:32:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A38A7A25;
        Fri,  6 Jan 2023 14:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673011955;
        bh=BeKFO+f992R9trITgQfCJYGcnAMzrR2lylc/cqrYKoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kFsgCNljc0PYEGsXnqjfcYRB9QJuhXdMlA3A/9Bfw4KeQderf6nXSX2vPHnny6P2d
         wCZjN4/z7YWwBccDxp6vRjHLhm7afixWiw+8sg4MYleNRyfa865hGgXbN+f71fnzC2
         atfb4mENEQ4Slfa6TiB+3wjTD/9luDAgJ13jPo8A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 2/6] media: imx-pxp: Add media controller support
Date:   Fri,  6 Jan 2023 15:32:23 +0200
Message-Id: <20230106133227.13685-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register a media device for the PXP, using the v4l2-mem2mem MC
infrastructure to populate the media graph. No media device operation is
implemented, the main use of the MC API is to allow consistent discovery
of media devices for userspace.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-pxp.c | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index dcb04217288b..132065c8b8b4 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -24,6 +24,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
+#include <media/media-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -200,6 +201,9 @@ struct pxp_pdata {
 struct pxp_dev {
 	struct v4l2_device	v4l2_dev;
 	struct video_device	vfd;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device	mdev;
+#endif
 
 	struct clk		*clk;
 	void __iomem		*mmio;
@@ -1832,8 +1836,36 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_m2m;
 	}
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+	dev->mdev.dev = &pdev->dev;
+	strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
+	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info), "platform:%s",
+		 dev_name(&pdev->dev));
+	media_device_init(&dev->mdev);
+	dev->v4l2_dev.mdev = &dev->mdev;
+
+	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
+						 MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize media device\n");
+		goto err_vfd;
+	}
+
+	ret = media_device_register(&dev->mdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register media device\n");
+		goto err_m2m_mc;
+	}
+#endif
+
 	return 0;
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+err_m2m_mc:
+	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
+err_vfd:
+	video_unregister_device(vfd);
+#endif
 err_m2m:
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
@@ -1854,6 +1886,11 @@ static int pxp_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dev->clk);
 
 	v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	media_device_unregister(&dev->mdev);
+	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
+#endif
 	video_unregister_device(&dev->vfd);
 	v4l2_m2m_release(dev->m2m_dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
-- 
Regards,

Laurent Pinchart

