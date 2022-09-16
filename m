Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694035BAECE
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 16:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbiIPOCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 10:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbiIPOC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 10:02:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75843AE874
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id bg5-20020a05600c3c8500b003a7b6ae4eb2so19927382wmb.4
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=p+c48jxk3f8O5xMrsXo92bCrPamQN4CKrrxle6FJKe4=;
        b=uBmrjTMDHt9/i6L2/JajBFmTnCPoRwi0yfu64zihS590CRFoqrCBaPBnQHzCLarNFj
         xN7J0j1AU5bpWVSaVIAma6STz5xP8p8roycswgsA5yFfg/tQcTLQQtpFPg4vNTeB+2XS
         o5Ya2PsFsioqv7CyqGN9gsVooxUsgCMW6i0LrmmGWCBSp0h3dNihKxZumWgjNOPU/o+Q
         iR3zhfOeZePf4FrTWqaSMOh6kdlScfEQJEO7Vo9sh1yelg38DddaVmlkXrcZ0G3aTZ0X
         CgGoLAEwPFFmrCQOc05Bw3yIDM4gCtsdLX7VjqsMJ3rdAv5UqN+EjmjlrDYSnPk8SEgW
         VRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=p+c48jxk3f8O5xMrsXo92bCrPamQN4CKrrxle6FJKe4=;
        b=liktxIJ76TR+IjaoVRIKB+aU/fegfj+eEV/4bccUA8biorEpghZH6APYiYZ9WRQB27
         mjhMJUzu3N+ETVoxgxV1MyH2ljejreoOui5O3sN5yLAOvliOlM/HvhKsK/lrY0LcrGfb
         ST950TiRdr9w/LGuI4Pel4eDAs6v0eK8AVEYKXGhyzrWFitBYCKtJe2zhlsVANnnvbsK
         RbJo2QwikuV5mBOu30Jdf9P3f/A3llSX0wpFdJB3ZaGSHbpf+8BLzDThsAdepU7MGUJG
         tE/4tTEGGbwSN9RF8FvIk9iHXGYCn5zjOE5aCOZ2G5QGmIrgJuq5+Cyg9VSsA/utWFJB
         DNCA==
X-Gm-Message-State: ACgBeo1dB7jfkJBTgjMokoNOqK8EGdUqxWnOZcjacnHh05ApHs5SRuph
        q5CB3XBTuYwzp0uOj7LM4xF4Sw==
X-Google-Smtp-Source: AA6agR7UcByPsH3jNiZthdipTxqHSc8uV/IjuCmbusnJnCalqNqvKAfbDv6THEa5/xsMz3aIdDnHdw==
X-Received: by 2002:a05:600c:3d17:b0:3b4:adc7:976c with SMTP id bh23-20020a05600c3d1700b003b4adc7976cmr5488286wmb.108.1663336942737;
        Fri, 16 Sep 2022 07:02:22 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f17-20020a1cc911000000b003a61306d79dsm2615041wmb.41.2022.09.16.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:02:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 2/3] media: i2c: imx412: Assign v4l2 device subname based on compat string
Date:   Fri, 16 Sep 2022 15:02:12 +0100
Message-Id: <20220916140213.1310304-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
References: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
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
 drivers/media/i2c/imx412.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index a1394d6c1432..9f854a1a4c2f 100644
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
@@ -1281,7 +1287,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 };
 
 static const struct of_device_id imx412_of_match[] = {
-	{ .compatible = "sony,imx412" },
+	{ .compatible = "sony,imx412", .data = "imx412" },
 	{ }
 };
 
-- 
2.34.1

