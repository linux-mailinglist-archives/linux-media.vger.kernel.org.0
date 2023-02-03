Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EC168A2CF
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbjBCTS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbjBCTSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:42 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100649A808
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:41 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d14so5529092wrr.9
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3qRwCguQfc6S4o7EqZyYm6Ixd/OxnoTvqE74zmYYZ0=;
        b=kaQCiatdPr4C+3nKtWmsRummtMdgWddpe6+33xNixYCmrhnQsOfjPSEHNdp52xcP8v
         5Af0GoPUp+LsVyd2uXZsNEQ3rQsQ9Q3XQXSarVA57QdMX37EpYme+tjUz3c2LNv/SVpy
         Nzyn/JUKP1yK5ZWamrxFbRSsq+uO29BzCCYhVj0ZLwUWli7/ZQuIlNScQ2P8eScYjEQq
         1maA8tghho9kcs4A49vzHkWDDQHXKqqwiC7DZJv7DMXhOfSU+RxTSlGrtcoAR4Z1+SaC
         pW19/guJC21h8spiZXMa+BFN/mssgfcNDLtbzp/+WaWp2CkecZudiZGjTUbZ03yKj7V9
         L/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3qRwCguQfc6S4o7EqZyYm6Ixd/OxnoTvqE74zmYYZ0=;
        b=QnM4x3jLHSmDgzC2SCLeEsEmC7CSvm1N9J1ppgscb+MWu3I2iZTne//DUxgCA6Mcct
         qFGxrHZGt4u/zA32gLSOsyX/5nTs/zXVjC6SguzTHnqAFMR9TfDmejt+s+WYleOTjpjW
         +q2uXwMQ9f6Erh4MMEh3bxeOHmDqvwy+dl8fO53KO3tY7oBNwCrlcP0wnsxwb64wHbB+
         8z2h+E143hr+NEBzTTq7FOrvfS7JlTgch2StOLscZBsMSJ8FBrgrBQsdugYonfL6c+3J
         uJd9NQyfmfvbSw8tvqacWrh4KGVpWKiR/uNjb9zigHhaZxtTdp7Azu2QHhMSS0fvIHJL
         Fw9g==
X-Gm-Message-State: AO0yUKWsnxXqqLxUtKTJcv+7udATBJmHat4u319E0l1y1jusbO7a2uDE
        qw8X/oZVGo0Snj6R4N2NEH+Cpw==
X-Google-Smtp-Source: AK7set/rT/MuTZvCPbpty8GIlP6B1rrjOXSuS1oquvwiBG7ovseXrTYx1zYiHyk4Er9d99f4Bw1f/w==
X-Received: by 2002:a05:6000:1448:b0:2bf:d428:a768 with SMTP id v8-20020a056000144800b002bfd428a768mr12485141wrx.49.1675451919435;
        Fri, 03 Feb 2023 11:18:39 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:38 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 09/13] media: i2c: imx290: VMAX is mode dependent
Date:   Fri,  3 Feb 2023 19:18:07 +0000
Message-Id: <20230203191811.947697-10-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
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

The default VMAX for 60fps in 720p mode is 750 according to
the datasheet, however the driver always left it at 1125
thereby stopping 60fps being achieved.

Make VMAX (and therefore V4L2_CID_VBLANK) mode dependent so
that 720p60 can be achieved.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 403bd7de875e..6235021a8d24 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -110,8 +110,6 @@
 /* Number of lines by which exposure must be less than VMAX) */
 #define IMX290_EXPOSURE_OFFSET				2
 
-#define IMX290_VMAX_DEFAULT				1125
-
 #define IMX290_PIXEL_RATE				148500000
 
 /*
@@ -189,6 +187,7 @@ struct imx290_mode {
 	u32 width;
 	u32 height;
 	u32 hmax_min;
+	u32 vmax_min;
 	u8 link_freq_index;
 
 	const struct imx290_regval *data;
@@ -432,6 +431,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.width = 1920,
 		.height = 1080,
 		.hmax_min = 2200,
+		.vmax_min = 1125,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -440,6 +440,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.width = 1280,
 		.height = 720,
 		.hmax_min = 3300,
+		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -451,6 +452,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.width = 1920,
 		.height = 1080,
 		.hmax_min = 2200,
+		.vmax_min = 1125,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -459,6 +461,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.width = 1280,
 		.height = 720,
 		.hmax_min = 3300,
+		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -779,7 +782,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank_min = mode->hmax_min - mode->width;
 	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
-	unsigned int vblank_min = IMX290_VMAX_DEFAULT - mode->height;
+	unsigned int vblank_min = mode->vmax_min - mode->height;
 	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-- 
2.34.1

