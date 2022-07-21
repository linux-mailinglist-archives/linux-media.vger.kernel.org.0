Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544CE57C667
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiGUIgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiGUIgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:36:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4A122BC6
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:36:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7E0718F6;
        Thu, 21 Jul 2022 10:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392569;
        bh=qa0+KIiK8s2Ycv8PhMkHHxGUIvpuNQZWbwMUK10omfk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hU/3L2GkYzpj8b8jK/ZZkVv5Gxa/fZlPyzNnCun9ZnLUT/kXTcjTo/YDonaGG9zSl
         CNAxSQkyUDB8MjfFeIiUyXdR8+CVjd1uwLRP5Bk018O1ilHV68FyGpEs/v8t+uF71g
         JVIWmJtErVL7GM+lurIhKolOe0t/RX4uBYf3NX8Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 19/19] media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
Date:   Thu, 21 Jul 2022 11:35:40 +0300
Message-Id: <20220721083540.1525-20-laurent.pinchart@ideasonboard.com>
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

The IMX290 gain register controls the analogue gain. Replace the
V4L2_CID_GAIN control with V4L2_CID_ANALOGUE_GAIN.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 0cb11ec1cf0f..871e3e69a8a4 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -524,7 +524,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	switch (ctrl->id) {
-	case V4L2_CID_GAIN:
+	case V4L2_CID_ANALOGUE_GAIN:
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
 
@@ -1006,7 +1006,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	imx290->ctrls.lock = &imx290->lock;
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_GAIN, 0, 240, 1, 0);
+			  V4L2_CID_ANALOGUE_GAIN, 0, 240, 1, 0);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
-- 
Regards,

Laurent Pinchart

