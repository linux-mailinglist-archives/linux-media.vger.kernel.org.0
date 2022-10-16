Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0666A5FFD83
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJPGQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiJPGQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82E63685D
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDCE210CA;
        Sun, 16 Oct 2022 08:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900972;
        bh=A8uIjH8kPeWmvhtq3SeNr+Izw98hSJHQmWSm3X/XpoY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n2iqorGMvMSx7NQpge6zHeW9Bm4At7IqbtdUE0CQjZfGGaOZ8u5p5dADGzvdZFx9U
         pvGyth7/C4y0TkqCPlI/uU0NbwkN207u9wq8mgPUhdvEQi2wgL1fk7zrAK1OaKycKr
         dxfXM3qnvZnofd8r8zuTY4YChWIBF/ooRCE9IWew=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 16/20] media: i2c: imx290: Create controls for fwnode properties
Date:   Sun, 16 Oct 2022 09:15:19 +0300
Message-Id: <20221016061523.30127-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
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

Create the V4L2_CID_ORIENTATION and V4L2_CID_ROTATION controls to
expose the corresponding fwnode properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index c5cecfd5d24c..93eab6c96ca0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -896,10 +896,15 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 
 static int imx290_ctrl_init(struct imx290 *imx290)
 {
+	struct v4l2_fwnode_device_properties props;
 	unsigned int blank;
 	int ret;
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 7);
+	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
+	if (ret < 0)
+		return ret;
+
+	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
 	imx290->ctrls.lock = &imx290->lock;
 
 	/*
@@ -954,6 +959,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (imx290->vblank)
 		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
+					&props);
+
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
 	if (imx290->ctrls.error) {
-- 
Regards,

Laurent Pinchart

