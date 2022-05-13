Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810AA5263A6
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350796AbiEMOQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350930AbiEMOQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:45 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719A61207CC
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:42 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4CEE62000D;
        Fri, 13 May 2022 14:16:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 11/28] media: ov5640: Provide timings accessor
Date:   Fri, 13 May 2022 16:13:59 +0200
Message-Id: <20220513141416.120552-12-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide a function to shortcut access to the correct timings definition
to avoid repeating the same pattern when accessing the sensor timings.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ba4ef431594b..21ddbff19f95 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1123,6 +1123,16 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 	},
 };
 
+static const struct ov5640_timings *
+ov5640_timings(const struct ov5640_dev *sensor,
+	       const struct ov5640_mode_info *mode)
+{
+	if (ov5640_is_csi2(sensor))
+		return &mode->csi2_timings;
+
+	return &mode->dvp_timings;
+}
+
 static int ov5640_init_slave_id(struct ov5640_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
@@ -1635,11 +1645,7 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
 			return ret;
 	}
 
-	if (ov5640_is_csi2(sensor))
-		timings = &mode->csi2_timings;
-	else
-		timings = &mode->dvp_timings;
-
+	timings = ov5640_timings(sensor, mode);
 	analog_crop = &timings->analog_crop;
 	crop = &timings->crop;
 
-- 
2.35.1

