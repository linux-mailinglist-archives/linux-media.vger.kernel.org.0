Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E116199CC
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiKDO2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbiKDO1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:32 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F2B31DC0
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:23 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 82A5410000F;
        Fri,  4 Nov 2022 14:25:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 06/10] media: ar0521: Add LINK_FREQ control
Date:   Fri,  4 Nov 2022 15:24:49 +0100
Message-Id: <20221104142452.117135-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142452.117135-1-jacopo@jmondi.org>
References: <20221104142452.117135-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CID_LINK_FREQ which currently reports a single
hard-coded frequency which depends on the fixed pixel clock.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index acb9509d7708..c9c578b223ef 100644
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
@@ -570,6 +574,7 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ar0521_ctrl_ops;
 	struct ar0521_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_ctrl *link_freq;
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 32);
@@ -608,6 +613,12 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
 					    65535, 1, 360);
 
+	link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(ar0521_link_frequencies) - 1,
+					0, ar0521_link_frequencies);
+	if (link_freq)
+		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
 					V4L2_CID_TEST_PATTERN,
 					ARRAY_SIZE(test_pattern_menu) - 1,
-- 
2.38.1

