Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9AA767DC3F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjA0C10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbjA0C1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:27:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936C14109C
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:27:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB68AF4E;
        Fri, 27 Jan 2023 03:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786442;
        bh=I32+3RJ3yVBazMDdNQa7yeNCb3a2uMKAgqzyMoyo+Fo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jDEY/3X5xDVPsPmAokFhPmRTyma79Em4B/SmsXEfZqI6nED5gM7s+JVsoM3Y+ihY2
         oiAdpnXJ4YuQPg7+iZ6SirvMHjScwWunzYwvKGB13F41rnQyPjt6jQeqMMLklsvw/3
         6HGGedj37DDnqVkurhLJ4t9HVQwUlVKPl7kkvFLE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 2/6] media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
Date:   Fri, 27 Jan 2023 04:27:11 +0200
Message-Id: <20230127022715.27234-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
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

The imx7_csi_video_init_format() function instantiates a
v4l2_subdev_format on the stack, to only use the .format field of that
structure. Replace it with a v4l2_mbus_framefmt instance.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index be3c1494cfb3..e96bee4e5921 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1598,17 +1598,15 @@ static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
 
 static int imx7_csi_video_init_format(struct imx7_csi *csi)
 {
-	struct v4l2_subdev_format fmt_src = {
-		.pad = IMX7_CSI_PAD_SRC,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	fmt_src.format.code = IMX7_CSI_DEF_MBUS_CODE;
-	fmt_src.format.width = IMX7_CSI_DEF_PIX_WIDTH;
-	fmt_src.format.height = IMX7_CSI_DEF_PIX_HEIGHT;
+	struct v4l2_mbus_framefmt format = { };
 
-	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
-	csi->vdev_compose.width = fmt_src.format.width;
-	csi->vdev_compose.height = fmt_src.format.height;
+	format.code = IMX7_CSI_DEF_MBUS_CODE;
+	format.width = IMX7_CSI_DEF_PIX_WIDTH;
+	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
+
+	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
+	csi->vdev_compose.width = format.width;
+	csi->vdev_compose.height = format.height;
 
 	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat);
 
-- 
Regards,

Laurent Pinchart

