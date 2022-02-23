Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D724C1088
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiBWKoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239679AbiBWKoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:44:07 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA685F4D6
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:43:39 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 665F440011;
        Wed, 23 Feb 2022 10:43:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 11/27] media: ov5640: Provide timings accessor
Date:   Wed, 23 Feb 2022 11:40:18 +0100
Message-Id: <20220223104034.91550-12-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223104034.91550-1-jacopo@jmondi.org>
References: <20220223104034.91550-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide a function to shortcut access to the correct timings definition
to avoid repeating the same pattern when accessing the sensor timings.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 4040ace2fd55..ace956b7cdfc 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1123,6 +1123,16 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 	},
 };
 
+static inline const
+struct ov5640_timings *ov5640_timings(const struct ov5640_dev *sensor,
+				      const struct ov5640_mode_info *mode)
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
@@ -1630,11 +1640,7 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
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
2.35.0

