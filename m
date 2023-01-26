Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99D067D7C8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbjAZVeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjAZVet (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:34:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670C346A6
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:34:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B12AA975;
        Thu, 26 Jan 2023 22:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674768886;
        bh=+BgBOuOSg0761laj1IRwcjzzu5FFmWBFdvWHnpQxGdY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SH5cx1/nC6jyI9KZP0WUWoHu2cE5Pb7SIi+YyLY9IT75ubs79saj+2SYiKhkczU+o
         JQrns+aoEHu54aCy0u1bL15t765SLFyDoPGUP2B+dkXfVZsC1vJgFatkPDMSY2FVOH
         lirqgCx0srFQvUwniqSj9zdVjQvMGDFgsVccg/Xs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 1/5] media: imx-mipi-csis: Rename error labels with 'err_' prefix
Date:   Thu, 26 Jan 2023 23:34:33 +0200
Message-Id: <20230126213437.20796-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
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

It is customary to prefix error labels with 'err_' to make their purpose
clearer. Do so in the probe function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 905072871ed2..d949b2de8e74 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1496,20 +1496,20 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			       dev_name(dev), csis);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
-		goto disable_clock;
+		goto err_disable_clock;
 	}
 
 	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(csis);
 	if (ret < 0)
-		goto disable_clock;
+		goto err_disable_clock;
 
 	platform_set_drvdata(pdev, &csis->sd);
 
 	ret = mipi_csis_async_register(csis);
 	if (ret < 0) {
 		dev_err(dev, "async register failed: %d\n", ret);
-		goto cleanup;
+		goto err_cleanup;
 	}
 
 	/* Initialize debugfs. */
@@ -1520,7 +1520,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(dev)) {
 		ret = mipi_csis_runtime_resume(dev);
 		if (ret < 0)
-			goto unregister_all;
+			goto err_unregister_all;
 	}
 
 	dev_info(dev, "lanes: %d, freq: %u\n",
@@ -1528,14 +1528,14 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 	return 0;
 
-unregister_all:
+err_unregister_all:
 	mipi_csis_debugfs_exit(csis);
-cleanup:
+err_cleanup:
 	media_entity_cleanup(&csis->sd.entity);
 	v4l2_async_nf_unregister(&csis->notifier);
 	v4l2_async_nf_cleanup(&csis->notifier);
 	v4l2_async_unregister_subdev(&csis->sd);
-disable_clock:
+err_disable_clock:
 	mipi_csis_clk_disable(csis);
 	fwnode_handle_put(csis->sd.fwnode);
 	mutex_destroy(&csis->lock);
-- 
Regards,

Laurent Pinchart

