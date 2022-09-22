Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A54D5E601A
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 12:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbiIVKm6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 06:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiIVKm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 06:42:57 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06750B40CF
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 03:42:55 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r7so14873323wrm.2
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=p+c48jxk3f8O5xMrsXo92bCrPamQN4CKrrxle6FJKe4=;
        b=lGdZ7JGM0czygzCBQUx+/XQnScNbBHvg3JiqStEYuksbqy8vG8m+a1M4f31NFbIxzj
         zITJDr2x2eOnCUVrSG1u2CdYZVoPUM4wu7+muHDQ1XYGOxN1g0Q8ulzAdKx0dM70ZPpN
         cNbGXxmZoLNsppFdz92EI2c8JJLFYOVc+0VRAobS46OUE2eaMacJ96hJcv0X3FV2gKQe
         DhowcILXILtv8oTxJ1QAJFsp9dRCxn/MWpm7KmuJvJq9s9GuRjO8kQ8W5cPFcYwYsJTl
         tDplgS2H0TN7e2iBWN9Ahkj1OXROR5J3DgBKvXQT4Gqn/R7oTWrppp21mHVMigwuQyvE
         OA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=p+c48jxk3f8O5xMrsXo92bCrPamQN4CKrrxle6FJKe4=;
        b=UmuRPUkMqNCdO++Fo+f/N/jAcQEVzu1ToU4JRPMvE34zvvJvQ3iCUWEhzKYRFcbcih
         7o1jwKCmkD73cwo4Srcx7M2cBm2Peklr/8Q+PAa6OHoON36gx+dUZ82vrcf5l0SfNl2C
         6jW3PkdyvyMvrObo28ul/Vab1ULJepX7Z630wZZ3ZNigabT3S9ko6fubWNaMEE+Hrdaq
         CV+FMUIjlteXfd5dggy8kNu2iAdaHbRbaTXtSaR54cDw5va+wC6jpN/JVnuw6bnfAfBL
         rGyx5IRly9sCQsh6GQPpnqvjDeutGIIYIxi0TNPqc2FtXtkIObqp71LNlGIzsCBohx9h
         m6uQ==
X-Gm-Message-State: ACrzQf0HCtga5rRJTWLh6VWbktg0JWs6cejHOiViXXZl+Xs93DJkks7/
        4f6g3W9Y5awHJeZHSILJtC3Nxg==
X-Google-Smtp-Source: AMsMyM5xSALxhGxIVROTo02ChLevHK/9glk2v4D33SjsGgawbeZvDxg8DD0Dutjp04I8hpGfDjIVXg==
X-Received: by 2002:a5d:47c5:0:b0:22a:6c7a:10f3 with SMTP id o5-20020a5d47c5000000b0022a6c7a10f3mr1517392wrc.523.1663843373397;
        Thu, 22 Sep 2022 03:42:53 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x12-20020adfffcc000000b0022ac672654dsm4647150wrs.58.2022.09.22.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 03:42:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 RESEND 2/3] media: i2c: imx412: Assign v4l2 device subname based on compat string
Date:   Thu, 22 Sep 2022 11:42:24 +0100
Message-Id: <20220922104225.1375331-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
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

