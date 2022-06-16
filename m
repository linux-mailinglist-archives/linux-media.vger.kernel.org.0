Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B64954DEA2
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 12:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359845AbiFPKIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiFPKIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 06:08:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1509929827
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 03:08:00 -0700 (PDT)
Received: from mail.ideasonboard.com (unknown [217.155.82.121])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E9128A3;
        Thu, 16 Jun 2022 12:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655374077;
        bh=Hg0LXOa/UCtro0Zz2Cv2mfJbZiYfyp2NSRIxJWcYtps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KboRNhq7k8Q4mtQPH9FfyMx3hjQL3uapqYwmFOhUQlSuEPEv81/BaM9KBYtzqRqLY
         S2eYOxIz6GtFUoFmB0TbGfIUYlVgm/+/d9zah6+K4lzOS+5Yw9/A41f4TyTXiNo3T1
         4v5HzJSq62xYhSowRqxsHaXEFsBzAtz//aGjY9DI=
From:   Daniel Oakley <daniel.oakley@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Daniel Oakley <daniel.oakley@ideasonboard.com>
Subject: [PATCH 2/3] media: vimc: enumerate data link entities for clarity
Date:   Thu, 16 Jun 2022 11:07:46 +0100
Message-Id: <20220616100747.48124-3-daniel.oakley@ideasonboard.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The data_links array was hard to read and understand. By implementing
enumerated vimc data link entities, clarity has been improved when
defining data_links. This therefore should help new programmers to
understand the codebase better. There is no functional change intended.

Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-core.c | 36 ++++++++++++++++-----
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index 27bdebeb58e1..f3437d4408ff 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -46,6 +46,21 @@ struct vimc_data_link {
 	u32 flags;
 };
 
+/* Enum to improve clarity when defining vimc_data_links */
+enum vimc_data_link_ents {
+	SENSOR_A,
+	SENSOR_B,
+	DEBAYER_A,
+	DEBAYER_B,
+	RAW_CAPTURE_0,
+	RAW_CAPTURE_1,
+	RGB_YUV_INPUT,
+	SCALER,
+	RGB_YUV_CAPTURE,
+	LENS_A,
+	LENS_B,
+};
+
 /* Structure which describes ancillary links between entities */
 struct vimc_ancillary_link {
 	unsigned int primary_ent;
@@ -116,21 +131,26 @@ static struct vimc_ent_config ent_config[] = {
 
 static const struct vimc_data_link data_links[] = {
 	/* Link: Sensor A (Pad 0)->(Pad 0) Debayer A */
-	VIMC_DATA_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(SENSOR_A, 0, DEBAYER_A, 0,
+		       MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Sensor A (Pad 0)->(Pad 0) Raw Capture 0 */
-	VIMC_DATA_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(SENSOR_A, 0, RAW_CAPTURE_0, 0,
+		       MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Sensor B (Pad 0)->(Pad 0) Debayer B */
-	VIMC_DATA_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(SENSOR_B, 0, DEBAYER_B, 0,
+		       MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
-	VIMC_DATA_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(SENSOR_B, 0, RAW_CAPTURE_1, 0,
+		       MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
-	VIMC_DATA_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
+	VIMC_DATA_LINK(DEBAYER_A, 1, SCALER, 0, MEDIA_LNK_FL_ENABLED),
 	/* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
-	VIMC_DATA_LINK(3, 1, 7, 0, 0),
+	VIMC_DATA_LINK(DEBAYER_B, 1, SCALER, 0, 0),
 	/* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
-	VIMC_DATA_LINK(6, 0, 7, 0, 0),
+	VIMC_DATA_LINK(RGB_YUV_INPUT, 0, SCALER, 0, 0),
 	/* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
-	VIMC_DATA_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	VIMC_DATA_LINK(SCALER, 1, RGB_YUV_CAPTURE, 0,
+		       MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
 static const struct vimc_ancillary_link ancillary_links[] = {
-- 
2.36.1

