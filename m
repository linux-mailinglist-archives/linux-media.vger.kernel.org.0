Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A346A68A2CB
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbjBCTSj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbjBCTSh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:37 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD2D80171
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:36 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bk16so5524688wrb.11
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js11dA2ey08Ky6H5UqdPTtHT+g2+2gxctpS4sG1t1Pw=;
        b=E74GmhOa9bKNaN1EQdlLjl8UvbkcYeLI7L6Pp77OfWh8Ik5AeFqbtwR7vyzXM6YLZx
         KqJa6CYW9GPn3Wf39L7bxv8joPg19w+cfl8ShrN6ExVR5/lh3I0rb5mIV19obcUyeoFi
         ZWf85L9l3aRHfj4cNN1Iyd8gMWhHSlkd+syzgNxDaNHQXKxOjYp7Nm05FynDK8WY1wZt
         OYwoYBpNTyFFgMy57F26DqplvQN5QGd7IRzaahxZQNceTFL+AW/3ubkkwBMQ+U/4Sb+Z
         MBLE99WaBmV9R3NMOkR4BkrXrezhcowAyJlCTzccC93SowtgIa6E73mySexPpXVVqX1c
         gXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js11dA2ey08Ky6H5UqdPTtHT+g2+2gxctpS4sG1t1Pw=;
        b=Q2AufXLKnA83H69FgV/ZtoFN6Ez7RFLLiLasgn4xuPY0up1HfPRkcDCu3wV8vSi5aM
         9vlfmL0fzIBQ7lm2yqzV9gN+oLxFKT/MyPMshYNLrawIg4905JABVn+qPrB3+eAhmivT
         l9OZKBWkC9XcXMNt1v8E4+ex7cNXqS5vQW/fhDpXBuOFjJ846kMs2wRRh5d29garj937
         exG8Dy58U9Jkn7jnJKcyoHDCHhTnwO6Km+VGLdQ6zaCleAntcUjzKQMMiUj4uQ52ChUq
         kI5zN8JFzkAM8Cmio8f9Umw4PQqC5ULByaNzJ2VNJ3yztHLbBZhjv2gWjn6ZyhKwiny2
         +b1Q==
X-Gm-Message-State: AO0yUKXAybSl/ML+YOVlxrCNe372FbRCJH7eiRh9RTICvPbJ6MA99q+Z
        UccM7DFjGSEuj3FhrR/hupT4Zw==
X-Google-Smtp-Source: AK7set9uqzEabXtLcIEz9GFFNKkQukI5PvbSphuI+yXcAH93WY7MFW1itr9wmThiBo9Y7GP4Q6OFhw==
X-Received: by 2002:a5d:4b06:0:b0:2bf:bfc6:4358 with SMTP id v6-20020a5d4b06000000b002bfbfc64358mr8965468wrq.57.1675451914912;
        Fri, 03 Feb 2023 11:18:34 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:32 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 05/13] media: i2c: imx290: Support 60fps in 2 lane operation
Date:   Fri,  3 Feb 2023 19:18:03 +0000
Message-Id: <20230203191811.947697-6-dave.stevenson@raspberrypi.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index e83c458c7cf8..a5ea59353a4d 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -382,7 +382,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 4400,
+		.hmax = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -390,7 +390,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 6600,
+		.hmax = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -539,21 +539,10 @@ static int imx290_set_register_array(struct imx290 *imx290,
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

