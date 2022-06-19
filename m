Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303B15507BA
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 02:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiFSAcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 20:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiFSAcJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 20:32:09 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C88212754
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 17:32:09 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A962C84011;
        Sun, 19 Jun 2022 02:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655598727;
        bh=Zvcp4X4KdNsJRnyDVBfmY7McmCaxjrR0FJcA7VzhJGA=;
        h=From:To:Cc:Subject:Date:From;
        b=x/6Ijx6L5gm7KhOgbgYtMahEG5FoffZM21RSpbSZO2l45thQn4EVTYFFAQzxNqX/A
         Tt/TS+/P9Mr90csFKnqEPGlqXwHxRLV+1VEfkgyIR59yysVP+14eNwrfacXeo67sCP
         3aXuQAbVxX9lESLwsi/Bb9pZg+xg0e41SD/J0xkNSYa2PhouD+lGFN/+Hbj0nY7YHJ
         fGBOKav08ra7P5MEJqd1xydHcpbjdgw+MnizDoT3RXuQrav182RsT5D74rwHij2p9n
         qjfROjO8daXK2KcEUrztdMZgzSy7nmzNcrpe1Q/TU5qUM17efhR/6ulZ0jO0n27hFd
         +oXJ8oivxZ6Cg==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2] media: mt9p031: Implement crop bounds get selection
Date:   Sun, 19 Jun 2022 02:31:58 +0200
Message-Id: <20220619003158.720050-1-marex@denx.de>
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
V2: Use min/max sizes for crop bounds
---
 drivers/media/i2c/mt9p031.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index cbce8b88dbcf5..69a3165b8fb91 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -623,12 +623,20 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
 
-	if (sel->target != V4L2_SEL_TGT_CROP)
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = MT9P031_COLUMN_START_MIN;
+		sel->r.top = MT9P031_ROW_START_MIN;
+		sel->r.width = MT9P031_WINDOW_WIDTH_MAX;
+		sel->r.height = MT9P031_WINDOW_HEIGHT_MAX;
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

