Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 694E31A614E
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 03:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgDMBOj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 21:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgDMBOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 21:14:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E468C0A3BE0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2020 18:14:39 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CD9BA42;
        Mon, 13 Apr 2020 03:14:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586740473;
        bh=h0qqxzp/8ELNuoOcfJHD2OLJfeEL4sUW1wzZuvIqn74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aUfSVAlqlJ+pxxQ9F1VWRkpkfjcOtF9dclUQ9L/8LhtHDklqYa+IeR+J8F4OjoT3B
         eb77lp92pP9oqz7Ic94YoQ//ZK8KjA6SDjrekgMCRjZ5bMNCQpoPit0gErCcErFd1/
         fVKTzTLy+/niArD9xe1is+N+nhHsV62Sp+sgn+rg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] media: staging/imx: Don't create links between external entities
Date:   Mon, 13 Apr 2020 04:14:16 +0300
Message-Id: <20200413011416.2355-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
References: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When creating links between media entities, the driver walks all the
subdevs that are part of the media device and attempts to create links
for all of them. This is wrong, as external subdevs are responsible for
creating links outside of the SoC.

To fix this, replace the default case by two explicit cases, to only
create links for the CSI MUXes and the CSI-2 receiver. This requires
assigning a group ID to the CSI MUX subdevs, as they're handled by a
separate driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-csi.c     | 19 +++++++++++++++++++
 .../staging/media/imx/imx-media-dev-common.c  |  7 ++-----
 drivers/staging/media/imx/imx-media.h         |  1 +
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index d275decc79be..b7dcdb004cc2 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1875,6 +1875,24 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
 	.unregistered = csi_unregistered,
 };
 
+static int imx_csi_notifier_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	/*
+	 * If the subdev has no group id, it must be one of the csi muxes. Mark
+	 * it as such to help with link creation in imx_media_create_links().
+	 */
+	if (!sd->grp_id)
+		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations imx_csi_notifier_ops = {
+	.bound = imx_csi_notifier_bound,
+};
+
 static int imx_csi_parse_endpoint(struct device *dev,
 				  struct v4l2_fwnode_endpoint *vep,
 				  struct v4l2_async_subdev *asd)
@@ -1894,6 +1912,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
 		return -ENOMEM;
 
 	v4l2_async_notifier_init(notifier);
+	notifier->ops = &imx_csi_notifier_ops;
 
 	fwnode = dev_fwnode(priv->dev);
 
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 66b505f7e8df..abbb8c74910b 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -54,11 +54,8 @@ static int imx_media_create_links(struct v4l2_async_notifier *notifier)
 		case IMX_MEDIA_GRP_ID_CSI:
 			imx_media_create_csi_of_links(imxmd, sd);
 			break;
-		default:
-			/*
-			 * if this subdev has fwnode links, create media
-			 * links for them.
-			 */
+		case IMX_MEDIA_GRP_ID_CSI2:
+		case IMX_MEDIA_GRP_ID_CSI_MUX:
 			imx_media_create_of_links(imxmd, sd);
 			break;
 		}
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index ca36beca16de..b5b7d3245727 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -311,5 +311,6 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRP    BIT(13)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPENC BIT(14)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPVF  BIT(15)
+#define IMX_MEDIA_GRP_ID_CSI_MUX       BIT(16)
 
 #endif
-- 
Regards,

Laurent Pinchart

