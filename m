Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C967FC62
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbjA2Ces (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbjA2Cep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:34:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A2E233DD
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:34:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87142FE8;
        Sun, 29 Jan 2023 03:34:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959682;
        bh=gxeXGrKdiZbwcQszKCnIUXsMb5XT/hlCD79EmxriPFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KGQ/XVM8pnlneYqQTXjhTZF4hWNDFkIoeHD5Wu4PPLZacI2xYtAZPLeKvG97Y8Bj6
         QSPlz6WhVkcQPglL4u4qEN8bO10qQhWdy5VEbmPbcPIgsA0PI/VgIaRPOtcW4dVq2E
         5xpktnb2yIC6OkRkIePgDctw8aEUIFc2STxX8+cE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 6/8] media: imx: imx7-media-csi: Cleanup errors in imx7_csi_async_register()
Date:   Sun, 29 Jan 2023 04:34:27 +0200
Message-Id: <20230129023429.22467-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
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

It's good practice for functions to perform error cleanup internally
when they fail, in order to not leave the device in a half-initialized
state. Move the async notifier cleanup from the probe error path to the
imx7_csi_async_register(), and drop the v4l2_async_nf_unregister() call
as there is no error path after the async notifier gets registered.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 1adf5c3392d9..733e44700ff9 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2177,7 +2177,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 			ret = PTR_ERR(asd);
 			/* OK if asd already exists */
 			if (ret != -EEXIST)
-				return ret;
+				goto error;
 		}
 	}
 
@@ -2185,9 +2185,13 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 	ret = v4l2_async_nf_register(&csi->v4l2_dev, &csi->notifier);
 	if (ret)
-		return ret;
+		goto error;
 
 	return 0;
+
+error:
+	v4l2_async_nf_cleanup(&csi->notifier);
+	return ret;
 }
 
 static void imx7_csi_media_cleanup(struct imx7_csi *csi)
@@ -2329,13 +2333,10 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	ret = imx7_csi_async_register(csi);
 	if (ret)
-		goto subdev_notifier_cleanup;
+		goto media_cleanup;
 
 	return 0;
 
-subdev_notifier_cleanup:
-	v4l2_async_nf_unregister(&csi->notifier);
-	v4l2_async_nf_cleanup(&csi->notifier);
 media_cleanup:
 	imx7_csi_media_cleanup(csi);
 
-- 
Regards,

Laurent Pinchart

