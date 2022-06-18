Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E24550746
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbiFRWVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiFRWVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:21:19 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0AE10FFB
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:21:17 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2DE2983F6A;
        Sun, 19 Jun 2022 00:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655590874;
        bh=l3Nfidy/ECss9Wwgs79LDwLmT12rwop0BbbKE53CdCk=;
        h=From:To:Cc:Subject:Date:From;
        b=R1HMdYCdIGusnppA74LMvuyrATzDa5BTUCRPBblE7K90p4FFXpqLyDeOjIXObKije
         7ofDyopHSG83V+0bVaPGrU5EhbDFz0cUjA8KOdVSSdqyGzWKzdVUnbte34bdy5WnWa
         H5/JBKoPQorz9v6h1U3Nbwy3IQAfM1Zjlrlm03BHUKn8IkRODNqaOxXmx6ImfrI1in
         R81Z2y+sWwCczRCr7DmMg16HlPNIlNcv+RP5USdsOUWKAnHX45c7HKspzBnmogbkac
         wjieYMu7g58yLbONpA0PDsUdHAdsozKNIUXnbHpwTqdLEln3oeChMj0tKeXtsoKOHH
         v8lWegGWZ0MRg==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] media: mt9p031: Implement crop bounds get selection
Date:   Sun, 19 Jun 2022 00:21:08 +0200
Message-Id: <20220618222108.478082-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement V4L2_SEL_TGT_CROP_BOUNDS query in get_selection subdev op
for this sensor. This is required e.g. to bind it to STM32MP15x DCMI.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index cbce8b88dbcf5..e73e814c60207 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -623,12 +623,20 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
 
-	if (sel->target != V4L2_SEL_TGT_CROP)
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = MT9P031_COLUMN_START_DEF;
+		sel->r.top = MT9P031_ROW_START_DEF;
+		sel->r.width = MT9P031_WINDOW_WIDTH_DEF;
+		sel->r.height = MT9P031_WINDOW_HEIGHT_DEF;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *__mt9p031_get_pad_crop(mt9p031, sd_state,
+						 sel->pad, sel->which);
+		return 0;
+	default:
 		return -EINVAL;
-
-	sel->r = *__mt9p031_get_pad_crop(mt9p031, sd_state, sel->pad,
-					 sel->which);
-	return 0;
+	}
 }
 
 static int mt9p031_set_selection(struct v4l2_subdev *subdev,
-- 
2.35.1

