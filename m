Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0968C608BE3
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiJVKrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiJVKrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:47:33 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E901D8F28
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 03:05:16 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 4DB70CCC1F
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:54 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D37EC240009;
        Sat, 22 Oct 2022 09:20:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Date:   Sat, 22 Oct 2022 11:20:07 +0200
Message-Id: <20221022092015.208592-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022092015.208592-1-jacopo@jmondi.org>
References: <20221022092015.208592-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
gain register which applies to all color channels.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 0daa61df2603..ba169f0218a9 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -35,6 +35,11 @@
 #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
 #define AR0521_TOTAL_WIDTH_MIN	     2968u
 
+#define AR0521_ANA_GAIN_MIN		0x00
+#define AR0521_ANA_GAIN_MAX		0x3f
+#define AR0521_ANA_GAIN_STEP		0x01
+#define AR0521_ANA_GAIN_DEFAULT		0x00
+
 /* AR0521 registers */
 #define AR0521_REG_VT_PIX_CLK_DIV		0x0300
 #define AR0521_REG_FRAME_LENGTH_LINES		0x0340
@@ -50,6 +55,8 @@
 #define   AR0521_REG_RESET_RESTART		  BIT(1)
 #define   AR0521_REG_RESET_INIT			  BIT(0)
 
+#define AR0521_REG_ANA_GAIN_CODE_GLOBAL		0x3028
+
 #define AR0521_REG_GREEN1_GAIN			0x3056
 #define AR0521_REG_BLUE_GAIN			0x3058
 #define AR0521_REG_RED_GAIN			0x305A
@@ -456,6 +463,10 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		ret = ar0521_set_geometry(sensor);
 		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ar0521_write_reg(sensor, AR0521_REG_ANA_GAIN_CODE_GLOBAL,
+				       ctrl->val);
+		break;
 	case V4L2_CID_GAIN:
 	case V4L2_CID_RED_BALANCE:
 	case V4L2_CID_BLUE_BALANCE:
@@ -499,6 +510,11 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	/* We can use our own mutex for the ctrl lock */
 	hdl->lock = &sensor->lock;
 
+	/* Analog gain */
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+			  AR0521_ANA_GAIN_MIN, AR0521_ANA_GAIN_MAX,
+			  AR0521_ANA_GAIN_STEP, AR0521_ANA_GAIN_DEFAULT);
+
 	/* Manual gain */
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
 	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,
-- 
2.37.3

