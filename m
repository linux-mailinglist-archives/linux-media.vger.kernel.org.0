Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758735F5A62
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbiJETHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiJETHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:07:05 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2C17FE79
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:07:02 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DA214FF802;
        Wed,  5 Oct 2022 19:06:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 10/10] media: ar0521: Tab-align definitions
Date:   Wed,  5 Oct 2022 21:06:13 +0200
Message-Id: <20221005190613.394277-11-jacopo@jmondi.org>
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

Align some register and constant definitions using tab in place of
mixed tab+spaces.

Cosmetic change only.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 670fa33acc6f..4373693fa3e9 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -16,17 +16,17 @@
 #include <media/v4l2-subdev.h>
 
 /* External clock (extclk) frequencies */
-#define AR0521_EXTCLK_MIN	  (10 * 1000 * 1000)
-#define AR0521_EXTCLK_MAX	  (48 * 1000 * 1000)
+#define AR0521_EXTCLK_MIN		(10 * 1000 * 1000)
+#define AR0521_EXTCLK_MAX		(48 * 1000 * 1000)
 
 /* PLL and PLL2 */
-#define AR0521_PLL_MIN		 (320 * 1000 * 1000)
-#define AR0521_PLL_MAX		(1280 * 1000 * 1000)
+#define AR0521_PLL_MIN			(320 * 1000 * 1000)
+#define AR0521_PLL_MAX			(1280 * 1000 * 1000)
 
 /* Effective pixel sample rate on the pixel array. */
-#define AR0521_PIXEL_CLOCK_RATE	 (207 * 1000 * 1000)
-#define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
-#define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_RATE		(207 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_MIN		(168 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_MAX		(414 * 1000 * 1000)
 
 #define AR0521_NATIVE_WIDTH		2604u
 #define AR0521_NATIVE_HEIGHT		1964u
@@ -35,15 +35,15 @@
 #define AR0521_MAX_X_ADDR_END		2603u
 #define AR0521_MAX_Y_ADDR_END		1963u
 
-#define AR0521_WIDTH_MIN	       8u
-#define AR0521_WIDTH_MAX	    2592u
-#define AR0521_HEIGHT_MIN	       8u
-#define AR0521_HEIGHT_MAX	    1944u
+#define AR0521_WIDTH_MIN		8u
+#define AR0521_WIDTH_MAX		2592u
+#define AR0521_HEIGHT_MIN		8u
+#define AR0521_HEIGHT_MAX		1944u
 
-#define AR0521_WIDTH_BLANKING_MIN     572u
-#define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
-#define AR0521_TOTAL_HEIGHT_MAX      2464u /* max value of y_addr_end reg */
-#define AR0521_TOTAL_WIDTH_MAX       3280u /* max value of x_addr_end reg */
+#define AR0521_WIDTH_BLANKING_MIN	572u
+#define AR0521_HEIGHT_BLANKING_MIN	38u /* must be even */
+#define AR0521_TOTAL_HEIGHT_MAX		2464u /* max value of y_addr_end reg */
+#define AR0521_TOTAL_WIDTH_MAX		3280u /* max value of x_addr_end reg */
 
 #define AR0521_ANA_GAIN_MIN		0x00
 #define AR0521_ANA_GAIN_MAX		0x3f
-- 
2.37.3

