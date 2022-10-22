Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61FB608B65
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJVKSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJVKSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:18:03 -0400
X-Greylist: delayed 342 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 22 Oct 2022 02:34:47 PDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B162A2CCB0
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 02:34:45 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 6A938CCDB1
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:58 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 7D655240012;
        Sat, 22 Oct 2022 09:20:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 10/10] media: ar0521: Tab-align definitions
Date:   Sat, 22 Oct 2022 11:20:15 +0200
Message-Id: <20221022092015.208592-11-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022092015.208592-1-jacopo@jmondi.org>
References: <20221022092015.208592-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Align some register and constant definitions using tab in place of
mixed tab+spaces.

Cosmetic change only.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0521.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 5560dc3d6605..608d0795e98e 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -14,17 +14,17 @@
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
-#define AR0521_PIXEL_CLOCK_RATE	 (184 * 1000 * 1000)
-#define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
-#define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_RATE		(184 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_MIN		(168 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_MAX		(414 * 1000 * 1000)
 
 #define AR0521_NATIVE_WIDTH		2604u
 #define AR0521_NATIVE_HEIGHT		1964u
@@ -33,15 +33,15 @@
 #define AR0521_MAX_X_ADDR_END		2603u
 #define AR0521_MAX_Y_ADDR_END		1955u
 
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
-#define AR0521_TOTAL_HEIGHT_MAX     65535u /* max_frame_lenght_lines */
-#define AR0521_TOTAL_WIDTH_MAX      65532u /* max_line_lenght_pck */
+#define AR0521_WIDTH_BLANKING_MIN	572u
+#define AR0521_HEIGHT_BLANKING_MIN	38u /* must be even */
+#define AR0521_TOTAL_HEIGHT_MAX		65535u /* max_frame_lenght_lines */
+#define AR0521_TOTAL_WIDTH_MAX		65532u /* max_line_lenght_pck */
 
 #define AR0521_ANA_GAIN_MIN		0x00
 #define AR0521_ANA_GAIN_MAX		0x3f
-- 
2.37.3

