Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487D268A2D3
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbjBCTTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbjBCTS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:59 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714EA8627F
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:46 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j25so2007925wrc.4
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB+6XYV9fp+4PqV3sEDVlKkbKE212lgndbUm+hP8wtk=;
        b=di6+D8vU2YGlCCyliMZFbp8G3/d5g44p0rHVKOlfR1/a9ayq8823r/nYKhwXJ7qsKG
         ucuZavI0wizZSKBpRaJzWJW+ZpoJgP4DfEGhn7roJU6jX+tBCaoofePhE6P1tD8KG9EI
         /tt+CBNlq196yMqLu5VeC2MXxdtIH6TZAHoQ+4g81eimqn4U1CppiFoyUfJ8BoV3841t
         USTT3EWJm4Plje+donFZxjcBFUXmLS5SMojL0bgDw5e1tY89DvgpOllT/9+BEXsE8Mfn
         3bJvDwku9W7sXwq8Ze+28Udq7uqy/0w7op0n5t+9joDlpPPSCfS7XUnAt2jjjhxTghUG
         iYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB+6XYV9fp+4PqV3sEDVlKkbKE212lgndbUm+hP8wtk=;
        b=hlUd4FaQhD0g8KDESzSyU/mOb20iOjkXxVjzMxHG5nxfEDRjxew6Rmba7bCBjLxk2z
         +zbs9oJOPzVZQUrVCnLzKYPmP3uJYQFp0QjZu+R40b6eOJC2lIycp1TmX/QHRvOWu0kb
         rahOH35cfBonBr7+f64tCeqXDoL9Ve34lWlVI5Stnmx62H1XHfWEKRO+8vPxzi0f50mX
         6vKpuDai5XfzotGNcnbpeRXfgGvZz83//Gy5PBmAmdFoB6m55QmDKxkfFIvkryY5H2VO
         Hp7yJT3s/2qFLaq22fbP6KZ7pTW1bc4704h+fRsNX7knCQBAU9A3YBqZMAH44GY+gGRh
         uqtQ==
X-Gm-Message-State: AO0yUKV0Q/SBczZawrD8pUb/Gkf0wkIHGtutHCX8wMzLgjPcE8XKzd4E
        E9jeN736csFEcq3MZjzgSDk+fg==
X-Google-Smtp-Source: AK7set8PfEw0S0lNQe3en6IQp9kAfydEQhnOFM5CpV539jZShANDtiufQ35X8EtWtHaLNj8if678rw==
X-Received: by 2002:a5d:5147:0:b0:2bf:bd9f:23cb with SMTP id u7-20020a5d5147000000b002bfbd9f23cbmr8893526wrt.52.1675451926248;
        Fri, 03 Feb 2023 11:18:46 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:45 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 13/13] media: i2c: imx290: Add the error code to logs in start_streaming
Date:   Fri,  3 Feb 2023 19:18:11 +0000
Message-Id: <20230203191811.947697-14-dave.stevenson@raspberrypi.com>
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

imx290_start_streaming logs what failed, but not the error
code from that function. Add it into the log message.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7167eb1edb9b..f635f1213477 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1007,20 +1007,20 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	/* Set clock parameters based on mode and xclk */
 	ret = imx290_set_clock(imx290);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set clocks\n");
+		dev_err(imx290->dev, "Could not set clocks - %d\n", ret);
 		return ret;
 	}
 
 	/* Set data lane count */
 	ret = imx290_set_data_lanes(imx290);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set data lanes\n");
+		dev_err(imx290->dev, "Could not set data lanes - %d\n", ret);
 		return ret;
 	}
 
 	ret = imx290_set_csi_config(imx290);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set csi cfg\n");
+		dev_err(imx290->dev, "Could not set csi cfg - %d\n", ret);
 		return ret;
 	}
 
@@ -1028,7 +1028,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
 	ret = imx290_setup_format(imx290, format);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set frame format\n");
+		dev_err(imx290->dev, "Could not set frame format - %d\n", ret);
 		return ret;
 	}
 
@@ -1036,14 +1036,14 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	ret = imx290_set_register_array(imx290, imx290->current_mode->data,
 					imx290->current_mode->data_size);
 	if (ret < 0) {
-		dev_err(imx290->dev, "Could not set current mode\n");
+		dev_err(imx290->dev, "Could not set current mode - %d\n", ret);
 		return ret;
 	}
 
 	/* Apply customized values from user */
 	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
+		dev_err(imx290->dev, "Could not sync v4l2 controls - %d\n", ret);
 		return ret;
 	}
 
-- 
2.34.1

