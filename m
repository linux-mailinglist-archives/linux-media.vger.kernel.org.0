Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB5A57C663
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbiGUIgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbiGUIgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:36:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DFF165AA
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:36:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9920E1B62;
        Thu, 21 Jul 2022 10:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392563;
        bh=fwq+pd06azQ/eIE5iaa/BuavJmC4PmxDPyhjjT3dx04=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sQbVJ4lkfhotV1qmSCjNCMXTk5WL41zghdIwLTQHut7rJm4MHfK+FAOtSUuiQ5P+b
         FQE0wtLy95EZDLKn1ZpcK1qy2nOs759Li7fQfzGBPSFtAvnvKoC7kuJNwajyWAy/9u
         hS5ZAEJMNOOo5KPQ6QS5WdPNUtkmqKaEbS/rmFOo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 15/19] media: i2c: imx290: Create controls for fwnode properties
Date:   Thu, 21 Jul 2022 11:35:36 +0300
Message-Id: <20220721083540.1525-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/i2c/imx290.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7190399f4111..78772c6327a2 100644
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
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
@@ -947,6 +952,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
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

