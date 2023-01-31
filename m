Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDF168365D
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbjAaTVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjAaTVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:21:03 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C566C599B7
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:57 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o36so5088891wms.1
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG4gjnujP2JmOKKu7SEk7EkBV7JyvS8Ps6UkgPfOjtQ=;
        b=IC9CprXpxGPpui3XdU/D8moKfztaS+te74bCJ0jj/zxDGAq4AfFqwamj6TBk47gNkV
         pgnNyke/ZygCSwvG/xudS9RCpFDksSOPXdNmeYLXtcvvtP1+YDrg4GjMuW/xl46PFUKa
         9JLZDaWzkfB0IP2qOYztdQIWUNVaK6D8oFgpSNGUzdhw5hqvV/X+2cxzsW8SPzzlDQY/
         yZWR+/0ikUhVDdmrJeldmQBbUWOihryLACx1i4XPev8FfNhr/oS6jXUlolcacyJ3uQpd
         gC/c4MZBy1NFYwLfuj4nAyFohsXKxSGPOEXH+t75X6Iphdo6CmotoNzp7+CTre2biHkd
         tOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG4gjnujP2JmOKKu7SEk7EkBV7JyvS8Ps6UkgPfOjtQ=;
        b=uwnsAi+etGQJoHW0JhrfGeNPnLBFX4c75yvZlWANcPQHqI0+whTsyO9zl10jqHJWmX
         hcztvx2fLGKWlKG2ckdIH5WWRlRLasqnGX57VAObag7tejDipcq1m6ocJVmiqN/HxchG
         J7BhBvPPX79QZ5ZMW3GraAMlxORSWSxj9n7uOBJYN1Kdm77NItR9KHe2tUTctW8fN3yf
         irX0eZ+U6Mk2XL9jw6h44tnXAwxnkMg+q2TNDJqtJu7BO981JwTUAcxnxtEGRrHB4MWN
         /Gv0mySmP4xHDDMChpq1lojlHSsP39sXfNPaxJxv5A3hbCnJ8olmUp/eM4IBSSfanEy1
         5rXw==
X-Gm-Message-State: AFqh2kr9PVD30OYPenIHgsUMEHcQ1e1+73vMy09ethTGB7h921RAy9MG
        vosLiZhndFOraP7k5bnawGoK6Q==
X-Google-Smtp-Source: AMrXdXvADqAZ2mjC/VnbRNVYN9z73CrZqkCaCx+p6iaU4Q4lIrvPhzKMcyU9roLselJc5CXnpJ/2Xw==
X-Received: by 2002:a05:600c:4687:b0:3db:2e06:4091 with SMTP id p7-20020a05600c468700b003db2e064091mr46256047wmo.37.1675192856321;
        Tue, 31 Jan 2023 11:20:56 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:55 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 05/11] media: i2c: imx290: Support 60fps in 2 lane operation
Date:   Tue, 31 Jan 2023 19:20:10 +0000
Message-Id: <20230131192016.3476937-6-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit "97589ad61c73 media: i2c: imx290: Add support for 2 data lanes"
added support for running in two lane mode (instead of 4), but
without changing the link frequency that resulted in a max of 30fps.

Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
and pixel rate" then doubled the link frequency when in 2 lane mode,
but didn't undo the correction for running at only 30fps, just extending
horizontal blanking instead.

Remove the 30fps limit on 2 lane by correcting the register config
in accordance with the datasheet for 60fps operation over 2 lanes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index bd8729aed43c..6bcfa535872f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -366,7 +366,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 4400,
+		.hmax = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -374,7 +374,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 6600,
+		.hmax = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -518,21 +518,10 @@ static int imx290_set_register_array(struct imx290 *imx290,
 static int imx290_set_data_lanes(struct imx290 *imx290)
 {
 	int ret = 0;
-	u32 frsel;
-
-	switch (imx290->nlanes) {
-	case 2:
-	default:
-		frsel = 0x02;
-		break;
-	case 4:
-		frsel = 0x01;
-		break;
-	}
 
 	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
 	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
-	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
+	imx290_write(imx290, IMX290_FR_FDG_SEL, 0x01, &ret);
 
 	return ret;
 }
-- 
2.34.1

