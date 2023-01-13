Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE3666937E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241320AbjAMJ5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241076AbjAMJ5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:57:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681A36718B
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:18 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlL-0003cp-Ts; Fri, 13 Jan 2023 10:54:15 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Jan 2023 10:54:17 +0100
Subject: [PATCH v2 11/16] media: imx-pxp: Add media controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-imx-pxp-v2-11-e2281da1db55@pengutronix.de>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
In-Reply-To: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Register a media device for the PXP, using the v4l2-mem2mem MC
infrastructure to populate the media graph. No media device operation is
implemented, the main use of the MC API is to allow consistent discovery
of media devices for userspace.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog

Changes since v1:

- Drop manual setting of bus_info
- Pick from https://lore.kernel.org/linux-media/20230112172507.30579-1-laurent.pinchart@ideasonboard.com
---
 drivers/media/platform/nxp/imx-pxp.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 86ccc3c4aae3..351e76ee32ca 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -24,6 +24,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
+#include <media/media-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -201,6 +202,9 @@ struct pxp_pdata {
 struct pxp_dev {
 	struct v4l2_device	v4l2_dev;
 	struct video_device	vfd;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device	mdev;
+#endif
 
 	struct clk		*clk;
 	void __iomem		*mmio;
@@ -1815,8 +1819,34 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_m2m;
 	}
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+	dev->mdev.dev = &pdev->dev;
+	strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
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
@@ -1837,6 +1867,11 @@ static int pxp_remove(struct platform_device *pdev)
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
2.30.2
