Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2822608BB8
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiJVKi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiJVKiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:38:11 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70DA25CE28
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 02:55:22 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id A0602C3B82
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:19 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5DF5F24000C;
        Sat, 22 Oct 2022 09:20:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 06/10] media: ar0521: Add LINK_FREQ control
Date:   Sat, 22 Oct 2022 11:20:11 +0200
Message-Id: <20221022092015.208592-7-jacopo@jmondi.org>
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

Add support for V4L2_CID_LINK_FREQ which currently reports a single
hard-coded frequency which depends on the fixed pixel clock.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index fcd852760750..2310346f11d5 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -89,6 +89,10 @@ static const char * const ar0521_supply_names[] = {
 	"vaa",		/* Analog (2.7V) supply */
 };
 
+static const s64 ar0521_link_frequencies[] = {
+	184000000,
+};
+
 struct ar0521_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct {
@@ -547,6 +551,13 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
 				       ctrl->val);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		/*
+		 * Link frequency index is used at PLL configuration time,
+		 * nothing to do here.
+		 */
+		ret = 0;
+		break;
 	default:
 		dev_err(&sensor->i2c_client->dev,
 			"Unsupported control %x\n", ctrl->id);
@@ -611,6 +622,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
 					    65535, 1, 360);
 
+	v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+			       ARRAY_SIZE(ar0521_link_frequencies) - 1,
+			       0, ar0521_link_frequencies);
+
 	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
 					V4L2_CID_TEST_PATTERN,
 					ARRAY_SIZE(test_pattern_menu) - 1,
-- 
2.37.3

