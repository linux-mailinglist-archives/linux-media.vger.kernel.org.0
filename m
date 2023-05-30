Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21CC3716B22
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbjE3RbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbjE3RbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:02 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E664110A
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:47 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f60e730bf2so49249555e9.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467846; x=1688059846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43TPLP/zbwjjcZHsJnlPOp0qUD2+JiyTZrGh8WQAfhs=;
        b=OM7iccpfdiTbONVwFnEGafOIBxIXpG0QTMDRHlQ3pxsGqKa3sK7W/PzPXwrDux0Aj/
         opKl17PGjdTfdfPPFuPtYYw4AhvgH+1ZKzC2Z3zkB93i1gdwKjNMXPG55MnkHtcIhoDK
         TRD2gJ6vHiKYyxumNhyhOhJ/Dyd5MUzw9V7Qn02iS50MtStVjLcrvaB/l/3R0ga4XawS
         EE5+RhmFRT7TDNS1axU6gP/IOu6fxtEjRuviCJUtSNJ3w8ssNDalDUV+d8SHAhGBmwK6
         SSJtWAqDVyBrHA7Nx+Fx87+FDQAQQQOPfAr2Dz4opdFU6HnDGYrNzBgKUL0QwQYhre+8
         /vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467846; x=1688059846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43TPLP/zbwjjcZHsJnlPOp0qUD2+JiyTZrGh8WQAfhs=;
        b=KWkBS+2uNZctl6f09mcJhkEHGuM9sPpiuWIBE0dRQE3FcNAYjuKvAKB7e7jk80DHq+
         cVJPA0VMcL4QBtYcdUq3giP0WMSg09Vyz1bnvEVUeIi9a6XOCs+2E+sycPQ3yEAPMZeG
         DEtBTcOrCSthRD93WTt7MeS7Xv4DcJRDqpSFe9iX6fNWjP7DZ2L1V1n9GEgQRrcAT6dS
         xQlY1humHsVWYlNAPnxD89hq4Z+w10HojJl20vGXtc5VtzPihQu12fS/XeXP+YJq5Eie
         aV6HQ5aOHhQeTBDzxMxHYJWyeIicJQJdrnCsc02AuKWPvVUzYKc8iaCLVbFzaU2TlK0i
         uY6w==
X-Gm-Message-State: AC+VfDxyNhfhT9CIoICRVLax7hg7lpLKF+VeGHcz+9xp24pJKV7gjAX4
        dzQGI2Xly51qQVogihmK22+Ekw==
X-Google-Smtp-Source: ACHHUZ5RwwXfjKiXmITxChOZWxmXXS3AWlzn00d34nzz6SvZdZqve5cgB9OfE5OgQAGB1OGJ3xb1aw==
X-Received: by 2002:a7b:cb99:0:b0:3f6:923:9ec with SMTP id m25-20020a7bcb99000000b003f6092309ecmr3101950wmi.25.1685467846477;
        Tue, 30 May 2023 10:30:46 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:46 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 16/21] media: i2c: imx258: Set pixel_rate range to the same as the value
Date:   Tue, 30 May 2023 18:29:55 +0100
Message-Id: <20230530173000.3060865-17-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With a read only control there is limited point in advertising
a minimum and maximum for the control, so change to set the
value, min, and max all to the selected pixel rate.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 7d6528f9ca4d..b9b650d40365 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1002,7 +1002,8 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 
 		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
 		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
-		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
+		__v4l2_ctrl_modify_range(imx258->pixel_rate, pixel_rate,
+					 pixel_rate, 1, pixel_rate);
 		/* Update limits and set FPS to default */
 		vblank_def = imx258->cur_mode->vts_def -
 			     imx258->cur_mode->height;
@@ -1328,8 +1329,7 @@ static int imx258_init_controls(struct imx258 *imx258)
 	struct v4l2_ctrl *vflip, *hflip;
 	s64 vblank_def;
 	s64 vblank_min;
-	s64 pixel_rate_min;
-	s64 pixel_rate_max;
+	s64 pixel_rate;
 	int ret;
 
 	ctrl_hdlr = &imx258->ctrl_handler;
@@ -1360,17 +1360,13 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (vflip)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate_max =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
-					imx258->nlanes);
-	pixel_rate_min =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
-					imx258->nlanes);
+	pixel_rate = link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
+					     imx258->nlanes);
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
-				pixel_rate_min, pixel_rate_max,
-				1, pixel_rate_max);
+				pixel_rate, pixel_rate,
+				1, pixel_rate);
 
 
 	vblank_def = imx258->cur_mode->vts_def - imx258->cur_mode->height;
-- 
2.25.1

