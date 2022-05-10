Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA8D5214AC
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241429AbiEJMDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241426AbiEJMDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F445046D
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:36 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B161224;
        Tue, 10 May 2022 13:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183965;
        bh=zHEDlecSQr99fSBCxfJcECaZP6Pkmnn8f2Cu8iYM8vQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LUvCyi3KPApH3DqUMDEPxSak7LFElaW91HyrfMXGJVJbzOsoJikadJ+30G/FOzKIG
         TWaZe0Tn0HXEOPy3WZSJn38dLhXvCqVZxrHzW9ZB+haMX+06umze0Befcgg31vzCgy
         pTgoC0hQKblsZE+W77T3gU15RK0aX6zP5e6XxLis=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 18/50] staging: media: imx: imx7-media-csi: Import imx_media_dev_init() helper
Date:   Tue, 10 May 2022 14:58:27 +0300
Message-Id: <20220510115859.19777-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for code refactoring, copy the imx_media_dev_init() helper
used by this driver from imx-media-dev-common.c. Rename the function to
avoid name clashes, and leave the v4l2_device notify handler out as it
only serves to implement control inheritance, which this driver doesn't
use. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 50 +++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bd1bdc09e701..8b19792adfc6 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1809,13 +1809,61 @@ static void imx7_csi_media_cleanup(struct imx7_csi *csi)
 	media_device_cleanup(&imxmd->md);
 }
 
+static const struct media_device_ops imx7_csi_media_ops = {
+	.link_notify = v4l2_pipeline_link_notify,
+};
+
+static struct imx_media_dev *imx7_csi_media_dev_init(struct device *dev)
+{
+	struct imx_media_dev *imxmd;
+	int ret;
+
+	imxmd = devm_kzalloc(dev, sizeof(*imxmd), GFP_KERNEL);
+	if (!imxmd)
+		return ERR_PTR(-ENOMEM);
+
+	dev_set_drvdata(dev, imxmd);
+
+	strscpy(imxmd->md.model, "imx-media", sizeof(imxmd->md.model));
+	imxmd->md.ops = &imx7_csi_media_ops;
+	imxmd->md.dev = dev;
+
+	mutex_init(&imxmd->mutex);
+
+	imxmd->v4l2_dev.mdev = &imxmd->md;
+	strscpy(imxmd->v4l2_dev.name, "imx-media",
+		sizeof(imxmd->v4l2_dev.name));
+	snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
+		 "platform:%s", dev_name(imxmd->md.dev));
+
+	media_device_init(&imxmd->md);
+
+	ret = v4l2_device_register(dev, &imxmd->v4l2_dev);
+	if (ret < 0) {
+		v4l2_err(&imxmd->v4l2_dev,
+			 "Failed to register v4l2_device: %d\n", ret);
+		goto cleanup;
+	}
+
+	INIT_LIST_HEAD(&imxmd->vdev_list);
+
+	v4l2_async_nf_init(&imxmd->notifier);
+
+	return imxmd;
+
+cleanup:
+	media_device_cleanup(&imxmd->md);
+
+	return ERR_PTR(ret);
+}
+
 static int imx7_csi_media_init(struct imx7_csi *csi)
 {
 	struct imx_media_dev *imxmd;
 	int i, ret;
 
 	/* add media device */
-	imxmd = imx_media_dev_init(csi->dev, NULL);
+	imxmd = imx7_csi_media_dev_init(csi->dev);
 	if (IS_ERR(imxmd))
 		return PTR_ERR(imxmd);
 
-- 
Regards,

Laurent Pinchart

