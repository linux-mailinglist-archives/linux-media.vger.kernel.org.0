Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F176054D190
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 21:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346383AbiFOT0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 15:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346472AbiFOT01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 15:26:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF44053A77
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 12:26:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E27546C7;
        Wed, 15 Jun 2022 21:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655321183;
        bh=ckZv0oL7PD1JjoYTV9oFCZLhKmgIhrSF+TXgNbDaNkc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Irwow8yZeq/3Z9SN/wXJs0fzG8KKDZpJyYd2FpChNVbQyf/5+M8V5QSAQ2WAiDgpA
         LOgvcxkw10Iv5KwsZKM6OSf8uKVAKpmKrHZtOOc3NuuPBLmXTInD98CC+5R5PkRic5
         sEmdhnxlzaTyBPKwJg9Tryam1O0YhVVoCBGABHUU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 3/4] media: imx: imx-mipi-csis: Implement the .get_frame_desc() operation
Date:   Wed, 15 Jun 2022 22:26:01 +0300
Message-Id: <20220615192602.25472-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSIS is connected to its sink through an SoC-specific gasket that
needs to be configured. Depending on the platform, the gasket
configuration requires knowing the CSI-2 DT. To provide the needed
information, implement the .get_frame_desc() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 8674aaad5fa0..905072871ed2 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1160,6 +1160,32 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				    struct v4l2_mbus_frame_desc *fd)
+{
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+
+	if (pad != CSIS_PAD_SOURCE)
+		return -EINVAL;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+	fd->num_entries = 1;
+
+	memset(entry, 0, sizeof(*entry));
+
+	mutex_lock(&csis->lock);
+
+	entry->flags = 0;
+	entry->pixelcode = csis->csis_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = csis->csis_fmt->data_type;
+
+	mutex_unlock(&csis->lock);
+
+	return 0;
+}
+
 static int mipi_csis_log_status(struct v4l2_subdev *sd)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -1184,6 +1210,7 @@ static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
 	.enum_mbus_code		= mipi_csis_enum_mbus_code,
 	.get_fmt		= mipi_csis_get_fmt,
 	.set_fmt		= mipi_csis_set_fmt,
+	.get_frame_desc		= mipi_csis_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
-- 
Regards,

Laurent Pinchart

