Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3603E57C65F
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiGUIgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiGUIgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:36:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AAF12AA2
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B37C91AB7;
        Thu, 21 Jul 2022 10:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392558;
        bh=N8tjrelxZgcRUDIDtCbLLmR9Xs7A3Lf7IniVJY8pm7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B7bOc6IHHp3n1cFYdlNUC2xo2oTujYm35P8S0Jd0EhfR1wG1KuuqShQf9GPxlCHvL
         EDJpoGNy4zx+CdcQ8QhSKTTjKyyXnlck46PfR1GdPHjePQNQugyQbzc9ESEK50gZSz
         y7Zi+iuBXcOtxSotjcILab3X+c4fPZ40+Azn4Tmg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 11/19] media: i2c: imx290: Add exposure time control
Date:   Thu, 21 Jul 2022 11:35:32 +0300
Message-Id: <20220721083540.1525-12-laurent.pinchart@ideasonboard.com>
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

Support configuring the exposure time, which is expressed as the
complement if the exposure time (frame period minus integration time).
The frame period is currently fixed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index bec326a83952..3cb024b73ee7 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -103,6 +103,8 @@
 #define IMX290_PGCTRL_THRU				BIT(1)
 #define IMX290_PGCTRL_MODE(n)				((n) << 4)
 
+#define IMX290_VMAX_DEFAULT				1125
+
 static const char * const imx290_supply_name[] = {
 	"vdda",
 	"vddd",
@@ -176,7 +178,7 @@ static const char * const imx290_test_pattern_menu[] = {
 
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
-	{ IMX290_VMAX, 1125 },
+	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
@@ -480,6 +482,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_GAIN:
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
+
+	case V4L2_CID_EXPOSURE:
+		ret = imx290_write(imx290, IMX290_SHS1,
+				   IMX290_VMAX_DEFAULT - ctrl->val - 1, NULL);
+		break;
+
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
 			imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
@@ -1008,12 +1016,16 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
 	imx290->ctrls.lock = &imx290->lock;
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
 
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
+			  IMX290_VMAX_DEFAULT - 2);
+
 	imx290->link_freq =
 		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
-- 
Regards,

Laurent Pinchart

