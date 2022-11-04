Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D80D6199CE
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbiKDO2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbiKDO1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:30 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD336317FF
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:16 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 924FA100011;
        Fri,  4 Nov 2022 14:25:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 03/10] media: ar0521: Set maximum resolution to 2592x1944
Date:   Fri,  4 Nov 2022 15:24:46 +0100
Message-Id: <20221104142452.117135-4-jacopo@jmondi.org>
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

Change the largest visibile resolution to 2592x1944, which corresponds
to the active pixel array area size. Take into account the horizontal
and vertical limits when programming the visible sizes to skip
dummy/inactive pixels.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 20a87dde2289..bcbd6ffd8832 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -26,10 +26,17 @@
 #define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
 #define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
 
+#define AR0521_NATIVE_WIDTH		2604u
+#define AR0521_NATIVE_HEIGHT		1964u
+#define AR0521_MIN_X_ADDR_START		0u
+#define AR0521_MIN_Y_ADDR_START		0u
+#define AR0521_MAX_X_ADDR_END		2603u
+#define AR0521_MAX_Y_ADDR_END		1955u
+
 #define AR0521_WIDTH_MIN	       8u
-#define AR0521_WIDTH_MAX	    2608u
+#define AR0521_WIDTH_MAX	    2592u
 #define AR0521_HEIGHT_MIN	       8u
-#define AR0521_HEIGHT_MAX	    1958u
+#define AR0521_HEIGHT_MAX	    1944u
 
 #define AR0521_WIDTH_BLANKING_MIN     572u
 #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
@@ -176,13 +183,17 @@ static int ar0521_write_reg(struct ar0521_dev *sensor, u16 reg, u16 val)
 
 static int ar0521_set_geometry(struct ar0521_dev *sensor)
 {
+	/* Center the image in the visible output window. */
+	u16 x = clamp((AR0521_WIDTH_MAX - sensor->fmt.width) / 2,
+		       AR0521_MIN_X_ADDR_START, AR0521_MAX_X_ADDR_END);
+	u16 y = clamp(((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1,
+		       AR0521_MIN_Y_ADDR_START, AR0521_MAX_Y_ADDR_END);
+
 	/* All dimensions are unsigned 12-bit integers */
-	u16 x = (AR0521_WIDTH_MAX - sensor->fmt.width) / 2;
-	u16 y = ((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1;
 	__be16 regs[] = {
 		be(AR0521_REG_FRAME_LENGTH_LINES),
-		be(sensor->total_height),
-		be(sensor->total_width),
+		be(sensor->fmt.height + sensor->ctrls.vblank->val),
+		be(sensor->fmt.width + sensor->ctrls.hblank->val),
 		be(x),
 		be(y),
 		be(x + sensor->fmt.width - 1),
-- 
2.38.1

