Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C17A5B91CB
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 02:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiIOAgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 20:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiIOAfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 20:35:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E60E42
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id bg5-20020a05600c3c8500b003a7b6ae4eb2so16622027wmb.4
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gCZyhrIVxKOUQevpKLXir1oy1yrvMRbNs/w8Pxbuo2Y=;
        b=d6YVcn3Yxos353wWPqhHlTheXT04P7IEg0Qk9PX41kZZ0phdyL4ap0t+0235pYUhwX
         ckFZAu/Ca+pB4ri7jpBlF8n006PDnB3Gkv/BgAvmIm0EN7fJ9FQZlyy+JDmiu4mz6Qly
         Rswcb9w7EIZIeSSVRHONFICBT3LQUtTGsYaryEGOOEI/gdogA488fefBO+wDQQdcozC/
         bExGNU2T4zu7qhS/bEEsv/4l4ZJnuX9XcAzKkdljSdTGucXyEpzs4+j7UKE864Oteipe
         A/p1XFBG0E64hMDbvsn6g0g/uUNLuUWYB5i//5sGpbSZvYKVyP/OE9lTt0F/UWoO4KOC
         tJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gCZyhrIVxKOUQevpKLXir1oy1yrvMRbNs/w8Pxbuo2Y=;
        b=a+pVNfPZN6f7dAfxrVFX+QuleHPzfDEFmMBYI05btloM8gg7MKuui3P0J3w75fmi6a
         kJbcswXYvZka0HXpTSnQ3Sro30CXOlWZM6c11wsuD55Fz7iXFyVYAoVzNDCr/rmdNuRw
         bb0d9o3HVKPOYPisEewpiurV1pgaMslVYzoNTxYf/dR9mw7HiG46tzp3f7174VUqy2Ga
         zwZJx2iZFYrlj8fFUEyOAYpOUs4yT+Mm4M2Eh9gJinS1dZ2kxhnD39RFTjGGdSs7dqtu
         IHN9KwyGNvlgtBd7GJ6tKDMYAN0WTP2Vnvxn0M8ZfMoVaUqDtf4v7HEJLD8rYFHXjfyD
         M+ZA==
X-Gm-Message-State: ACgBeo1ZzsvH0lfIZJZlBXWqbACm7XE+H6EcNlKeHw4V9rVxnkGqP4dC
        AjRtk1ClW6yFNhX9ElYPutYuX6QvmNKLgQ==
X-Google-Smtp-Source: AA6agR7KHCxHozytgMNRKGmaxROj3FDNwUZzHu+xYM9OgaaSPLvaez2zHae18x4RxOtBQ3da8z51xg==
X-Received: by 2002:a05:600c:198c:b0:3b4:a6c4:3e09 with SMTP id t12-20020a05600c198c00b003b4a6c43e09mr2267214wmq.121.1663202140784;
        Wed, 14 Sep 2022 17:35:40 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b002253af82fa7sm905235wrq.9.2022.09.14.17.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 17:35:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 3/5] media: i2c: imx412: Assign v4l2 device subname based on compat string
Date:   Thu, 15 Sep 2022 01:35:20 +0100
Message-Id: <20220915003522.1227073-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx412, imx477 and imx577 all return the same chip-id when interrogated via
i2c. I've confirmed this myself by

- Looking at the code in Qcom and Nvidia stacks
- Running the upstream imx412 driver on imx577 with a Qcom sm8250 RB5
- Running the downstream Qcom stack on the same hardware. This uses a
  commercial licensed stack with a driver/userspace pair that make no
  differentiation between imx412, imx477 and imx577.
- Running the imx412 and imx577 on a Nvidia Nano with cameras from Leopard
  Imaging. Again this is a commercial non-upstream user-space/kernel-space
  pairing and again the same imx driver, works for both parts.

Sakari suggested we should add a new compat but that the compat string
should also set the media entity name also

https://patchwork.kernel.org/project/linux-media/patch/20220607134057.2427663-3-bryan.odonoghue@linaro.org/#24894500

Set up the .data parameter of of_device_id to pass a string which
we use to set the media entity name. Once done we can add in imx477 and
imx577 as compatible chips with the media names reflecting the directed
compat string.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index a1394d6c1432..bc7fdb24235f 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1172,6 +1172,7 @@ static int imx412_init_controls(struct imx412 *imx412)
 static int imx412_probe(struct i2c_client *client)
 {
 	struct imx412 *imx412;
+	const char *name;
 	int ret;
 
 	imx412 = devm_kzalloc(&client->dev, sizeof(*imx412), GFP_KERNEL);
@@ -1179,6 +1180,10 @@ static int imx412_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	imx412->dev = &client->dev;
+	if (dev_fwnode(&client->dev))
+		name = device_get_match_data(&client->dev);
+	else
+		return -ENODEV;
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
@@ -1218,6 +1223,8 @@ static int imx412_probe(struct i2c_client *client)
 	imx412->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx412->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
+	v4l2_i2c_subdev_set_name(&imx412->sd, client, name, NULL);
+
 	/* Initialize source pad */
 	imx412->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx412->sd.entity, 1, &imx412->pad);
@@ -1281,7 +1288,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 };
 
 static const struct of_device_id imx412_of_match[] = {
-	{ .compatible = "sony,imx412" },
+	{ .compatible = "sony,imx412", .data = "imx412" },
 	{ }
 };
 
-- 
2.34.1

