Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13DE551A501
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 18:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352806AbiEDQPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 12:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353094AbiEDQPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 12:15:46 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC7E25EBA
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 09:12:09 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1C8941BF203;
        Wed,  4 May 2022 16:12:04 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com, eddy.khan@vergesense.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 11/28] media: ov5640: Provide timings accessor
Date:   Wed,  4 May 2022 18:11:45 +0200
Message-Id: <20220504161153.185169-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504155157.184047-1-jacopo@jmondi.org>
References: <20220504155157.184047-1-jacopo@jmondi.org>
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

