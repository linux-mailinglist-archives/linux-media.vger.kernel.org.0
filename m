Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1935F5A5D
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbiJETG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiJETG5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:06:57 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9697FFB3
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:06:50 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 659DFFF804;
        Wed,  5 Oct 2022 19:06:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 05/10] media: ar0521: Add LINK_FREQ control
Date:   Wed,  5 Oct 2022 21:06:08 +0200
Message-Id: <20221005190613.394277-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005190613.394277-1-jacopo@jmondi.org>
References: <20221005190613.394277-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CID_LINK_FREQ which currently reports a single
hard-coded frequency which depends on the fixed pixel clock.

This will change in the next patches where the pixel rate will be
computed from the desired link_frequency.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 21649aecf442..c5410b091654 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
 	"vaa",		/* Analog (2.7V) supply */
 };
 
+static const s64 ar0521_link_frequencies[] = {
+	184000000,
+};
+
 struct ar0521_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *ana_gain;
@@ -104,6 +108,7 @@ struct ar0521_ctrls {
 	};
 	struct v4l2_ctrl *pixrate;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *test_pattern;
 };
 
@@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
 					    65535, 1, 360);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(ar0521_link_frequencies) - 1,
+					0, ar0521_link_frequencies);
+
 	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
 					V4L2_CID_TEST_PATTERN,
 					ARRAY_SIZE(test_pattern_menu) - 1,
-- 
2.37.3

