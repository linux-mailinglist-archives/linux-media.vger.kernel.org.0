Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0B9168A2C7
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbjBCTS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbjBCTSZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:25 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF1A761C5
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q5so5591097wrv.0
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pq7cAaa5YCWtfkDJToG1qTV8iLIyoimpB23UZGTLuXc=;
        b=IZnF0SrODwfywIkfuchzl16TIDllOtZoa9GLftOph85xBBK05oJylmGt2LrgZrWttB
         golBnoHAQN6EmgTnf8om810o3CoaZd6ZVlUb5PV8f9idE61Zw48HACCCId/hbyMeU9N7
         TIImWqTXUXcFl7hVeCxyRJyslRXIHM/o5vnswpCK0Falssz5NVV9HZU5YrGC1PQF7uQ1
         m4HdjOYvw08ojOS1IZKsTyAvoIgr58S7TD/2xF6WdKHLVc7RjZuKZROTMK5Fweq8rhBv
         CkNBwbIWi6X2bf8RFwF3Mn7HdbC9VD0xIXS09j1eTIaSO2v3pBVnqxIzkDZ94YRUD6K8
         p6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq7cAaa5YCWtfkDJToG1qTV8iLIyoimpB23UZGTLuXc=;
        b=Ohad3bKbT876xhlvZYyWAMOJNcIpWejzMQZ5P3ITnAlCtqEnv7eS9pXcdVuX8vtQgb
         ZmWGgXzS2AXWq3v9095XBmBfJgp575tzXoEzmNHYtB4eC2T80yYylKtJSEHPUoGKO8GD
         Gt3oy9xv2dFh8AENv0Re97aSM42bRxFOHjtYIsROLAZeLfLkv+qToZHULPX2eIbM5OIf
         mXF1hZ+0qClfe6qXwZQHLdVLEItH2QGA+jag4Vr1utb7SEIS+hWgzUkXSrdd40yEgW2/
         p+e21nCQCKQnS0tWY5FGNPcEyT+zklUuFVlNBTt9tDe4H+bq24eTo5o6lCfFdtGZ3XLc
         j31w==
X-Gm-Message-State: AO0yUKV4U0lJY8Ot8NTwnUu4JBMZQxLui5SuEtg1SuAHHzwSyHYxI71i
        smdAsQBclgj51TJR9wNm/9N7vg==
X-Google-Smtp-Source: AK7set9+VOaNG4NK6/2AFJVfKjk81f07uoxurQKj+uczrCOVKqwyQTRdAtJ3evshMlQiyGG9bOgeCw==
X-Received: by 2002:adf:fb92:0:b0:2c2:de2b:e7cc with SMTP id a18-20020adffb92000000b002c2de2be7ccmr9155108wrr.40.1675451903090;
        Fri, 03 Feb 2023 11:18:23 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:22 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 02/13] media: i2c: imx290: Set the colorspace fields in the format
Date:   Fri,  3 Feb 2023 19:18:00 +0000
Message-Id: <20230203191811.947697-3-dave.stevenson@raspberrypi.com>
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

The colorspace fields were left untouched in imx290_set_fmt
which lead to a v4l2-compliance failure.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 22d6194678bc..827c0804792f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -917,6 +917,10 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		fmt->format.code = imx290_formats[0].code[imx290->model->colour_variant];
 
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
-- 
2.34.1

