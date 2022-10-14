Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF1E5FF35D
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 20:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiJNSEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 14:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJNSEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 14:04:32 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48841C5A5C
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:30 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so4148750wmq.1
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uePB6f3cOQ67QvrNVkkf4TASROMgpAHE8s8QFUOA3u0=;
        b=JU3xGPhdpIZfhk2w+xP49BNNZFOrTLNT0007vj6oG9mFtKX2UdIdPhuudxdZCHoX2Z
         2OD1MvZhxSlkwXV7Ev+C+gSBjlMsCc2MdGeWSjJzdzxuI1wnJi1AtJKB4Rjx+ylboyoH
         XK9IaHz1LNek6mzVFiAL433+6mtg0MFy9qH2OPJ+qLwe/TD/xxeQVj5pjFXz2Pn8jCah
         OwMDsQ2DSwLaklnsPL+opKmmaQoS4vqepPd9pMMVW9Kp5V7QQE4WQqd4yJx6HLQSKcFh
         +aAAkb4jp+SEnh+1MomG+ky5Sq9MWnALwim5A3fVZMlWHo1q1L+Ulxtv5+LFpimcO2oy
         mHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uePB6f3cOQ67QvrNVkkf4TASROMgpAHE8s8QFUOA3u0=;
        b=LEDeCKGwZ/fXwSlTbluNKwgVNxT1+MtE0bmPuRo5E+PXlLQio3Gm7yIPzUzVDjTiMg
         qFq1chZY4znZ2J62wnxCWflS8TA+q7+2Soz5aNWr2GOI/e9KLYY9DLrxctV5qrFRSOFL
         3dpsE7IevDlwHEgQzvi+Nh0rvUoVdB3QHE0epcY1vnXv0ZP+Ich+FqZe4wmXZXLUaeae
         3fh7wOSCIuz0zsIv+BY/i9U9AXveDKBwRCCMIX5yhb8fQRguPPagvkmzksW579v/yf3e
         TiSBGRoizpH8RCZs9cLXEzQMb0Ue3SzJN8Xu4cpn3E/QKZhwLl76SadJoHj2mNeRHUps
         fZBg==
X-Gm-Message-State: ACrzQf0Cgz8r9wOwre137rP+h/9NrxrYL7w5/nXbUEeyCuGMIbPhRjd7
        hnKA5EGSn7/4YOjf1ckFyqvqMg==
X-Google-Smtp-Source: AMsMyM7zcq45eVIihi84gKSOuqL1/ysYyMpzlUpusZQkFHq97VWiES73q9ZAYXahYwsH1/GuyovX6w==
X-Received: by 2002:a05:600c:310b:b0:3b4:c1ce:cd83 with SMTP id g11-20020a05600c310b00b003b4c1cecd83mr11087730wmo.91.1665770668879;
        Fri, 14 Oct 2022 11:04:28 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c001100b003c6bbe910fdsm8950346wmc.9.2022.10.14.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 11:04:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] media: i2c: imx412: Assign v4l2 device subname based on compat string
Date:   Fri, 14 Oct 2022 19:04:16 +0100
Message-Id: <20221014180417.3683285-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
References: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx412 and imx577 return the same chip-id when interrogated via i2c.
I've confirmed this myself by

Sakari suggested we should add a new compat which should be reflected in
the name of the media entity

https://patchwork.kernel.org/project/linux-media/patch/20220607134057.2427663-3-bryan.odonoghue@linaro.org/#24894500

Set up the .data parameter of of_device_id to pass a string which
we use to set the media entity name. Once done we can add in imx577 as a
compatible chips with the media names reflecting the directed compat string.

Cc: sakari.ailus@iki.fi
Cc: dave.stevenson@raspberrypi.com
Cc: jacopo@jmondi.org
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 7f6d29e0e7c4..353304312e1c 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1172,6 +1172,7 @@ static int imx412_init_controls(struct imx412 *imx412)
 static int imx412_probe(struct i2c_client *client)
 {
 	struct imx412 *imx412;
+	const char *name;
 	int ret;
 
 	imx412 = devm_kzalloc(&client->dev, sizeof(*imx412), GFP_KERNEL);
@@ -1179,6 +1180,9 @@ static int imx412_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	imx412->dev = &client->dev;
+	name = device_get_match_data(&client->dev);
+	if (!name)
+		return -ENODEV;
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
@@ -1218,6 +1222,8 @@ static int imx412_probe(struct i2c_client *client)
 	imx412->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx412->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
+	v4l2_i2c_subdev_set_name(&imx412->sd, client, name, NULL);
+
 	/* Initialize source pad */
 	imx412->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx412->sd.entity, 1, &imx412->pad);
@@ -1279,7 +1285,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 };
 
 static const struct of_device_id imx412_of_match[] = {
-	{ .compatible = "sony,imx412" },
+	{ .compatible = "sony,imx412", .data = "imx412" },
 	{ }
 };
 
-- 
2.34.1

