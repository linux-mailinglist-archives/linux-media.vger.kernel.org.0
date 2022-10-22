Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7379608B61
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiJVKQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJVKQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:16:28 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DCA2E982B
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 02:33:16 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 913A1CCC36
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:56 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2D68A24000A;
        Sat, 22 Oct 2022 09:20:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 03/10] media: ar0521: Set maximum resolution to 2592x1944
Date:   Sat, 22 Oct 2022 11:20:08 +0200
Message-Id: <20221022092015.208592-4-jacopo@jmondi.org>
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

Change the largest visibile resolution to 2592x1944, which corresponds
to the active pixel array area size. Take into account the horizontal
and vertical limits when programming the visible sizes to skip
dummy/inactive pixels.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index ba169f0218a9..dfa4de0f4996 100644
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
2.37.3

