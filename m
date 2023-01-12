Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE84B667D52
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 19:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240173AbjALSDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 13:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240148AbjALSC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 13:02:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C64D55644
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 09:25:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC99496;
        Thu, 12 Jan 2023 18:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673544312;
        bh=tPkjDPFGGYDS9bfX5sepCs/DfykhJC1/K5FUJno/98E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=voSpwVHApOOlNa8YCitHx5p9JqWN82y1TjqvfMmEq/VUt74pp2CWqBJbPzhFizZ/V
         77e+cy39barQ5lFPsM7wfTqN8FLiGBwXtoFBM+VO3DtCJ2EH1Tk4wSBCHjnX5e4yEQ
         yDWbgctScbcchLf1WJmo/pssEB4bJe/9sl6y5Gi0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 3/7] media: imx-pxp: Add media controller support
Date:   Thu, 12 Jan 2023 19:25:03 +0200
Message-Id: <20230112172507.30579-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Drop manual setting of bus_info
---
 drivers/media/platform/nxp/imx-pxp.c | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 945316edd580..c3d2df5d725d 100644
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
@@ -1830,8 +1834,34 @@ static int pxp_probe(struct platform_device *pdev)
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
@@ -1852,6 +1882,11 @@ static int pxp_remove(struct platform_device *pdev)
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

