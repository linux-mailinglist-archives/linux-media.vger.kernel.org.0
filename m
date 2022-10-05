Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB785F5A5C
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbiJETG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbiJETG5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:06:57 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DE47FFB9
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:06:52 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E924FF805;
        Wed,  5 Oct 2022 19:06:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 06/10] media: ar0521: Configure pixel rate using LINK_FREQ
Date:   Wed,  5 Oct 2022 21:06:09 +0200
Message-Id: <20221005190613.394277-7-jacopo@jmondi.org>
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

Now that the V4L2_LINK_FREQUENCY control is available, use it to
configure the sensor pixel rate.

Adjust the default pixel rate to match the first listed link_frequency.

Validated with:

$ v4l2-ctl -l -d /dev/v4l-subdev3
 link_frequency 0x009f0901 (intmenu): min=0 max=1 default=0 value=0
 pixel_rate 0x009f0902 (int64)  : min=168000000 max=414000000 step=1 default=414000000 value=207000000 flags=read-only

26.493166 (30.78 fps) cam0-stream0 seq: 000008 bytesused: 1843200
26.525629 (30.80 fps) cam0-stream0 seq: 000009 bytesused: 1843200

$ yavta -w "0x009f0901 1" /dev/v4l-subdev3
$ v4l2-ctl -l -d /dev/v4l-subdev3
 link_frequency 0x009f0901 (intmenu): min=0 max=1 default=0 value=1
 pixel_rate 0x009f0902 (int64)  : min=168000000 max=414000000 step=1 default=414000000 value=414000000 flags=read-only

54.700859 (61.37 fps) cam0-stream0 seq: 000039 bytesused: 1843200
54.717192 (61.23 fps) cam0-stream0 seq: 000040 bytesused: 1843200

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index c5410b091654..b1580c99f5e3 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -24,7 +24,7 @@
 #define AR0521_PLL_MAX		(1280 * 1000 * 1000)
 
 /* Effective pixel sample rate on the pixel array. */
-#define AR0521_PIXEL_CLOCK_RATE	 (184 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_RATE	 (207 * 1000 * 1000)
 #define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
 #define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
 
@@ -91,7 +91,10 @@ static const char * const ar0521_supply_names[] = {
 };
 
 static const s64 ar0521_link_frequencies[] = {
-	184000000,
+	/* 30 FPS at full resolution */
+	207000000,
+	/* 60 FPS at full resolution */
+	414000000,
 };
 
 struct ar0521_ctrls {
@@ -330,10 +333,21 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
 static void ar0521_calc_mode(struct ar0521_dev *sensor)
 {
 	unsigned int pixel_clock;
+	unsigned int link_freq;
+	s64 frequency;
+	u32 pixel_rate;
 	u16 pre, mult;
 	u32 vco;
 	int bpp;
 
+	/* Update the PIXEL_RATE value using the desired link_frequency. */
+	bpp = ar0521_code_to_bpp(sensor);
+	link_freq = sensor->ctrls.link_freq->val;
+	frequency = ar0521_link_frequencies[link_freq];
+	pixel_rate = frequency * sensor->lane_count * 2 / bpp;
+
+	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixrate, pixel_rate);
+
 	/*
 	 * PLL1 and PLL2 are computed equally even if the application note
 	 * suggests a slower PLL1 clock. Maintain pll1 and pll2 divider and
@@ -380,8 +394,7 @@ static void ar0521_calc_mode(struct ar0521_dev *sensor)
 	 * VCO not to exceed the limits specified by the datasheet and
 	 * consequentially reduce the obtained pixel clock.
 	 */
-	pixel_clock = AR0521_PIXEL_CLOCK_RATE * 2 / sensor->lane_count;
-	bpp = ar0521_code_to_bpp(sensor);
+	pixel_clock = pixel_rate * 2 / sensor->lane_count;
 	sensor->pll.vt_pix = bpp / 2;
 	vco = pixel_clock * sensor->pll.vt_pix;
 
-- 
2.37.3

