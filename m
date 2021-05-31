Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BD33959A1
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhEaLYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhEaLYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:24:41 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC32C061574;
        Mon, 31 May 2021 04:23:02 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id h21so7678310qtu.5;
        Mon, 31 May 2021 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xrfxJ0vUNlyHJx75Ay206N50rBJDEg6+qdqzHboImHE=;
        b=fZMt9EaARWg7ten4vYUQJP4EW1nnBbv3E0tEwalPotIUJfbWZ0EYgj8Tku50Jk835s
         3t/va79wqBMrClGS/K8h0dqfm+FgbrCTNDDNbvd2lU5AOhnpIuPjmX8XevWntVWmfY2r
         khcDxYZ8H000+yfAsreDkTUhUN3BVQgCBPvwLHH5UcKufxcpF+X+DAX621/+LsgMY9IM
         2gbwfk/irgxEgqLz8ixIlclzhG4/b8ERfOBT5O67W+uNXskczV4mDbPdk6WY21ktBCVF
         mVNHOrHlIIB0hhD8rSHRDZpwum/uOjWR6wqMf4r+ew1wWVr0B6JeGt2UjWw4osGzwr+R
         IaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xrfxJ0vUNlyHJx75Ay206N50rBJDEg6+qdqzHboImHE=;
        b=fWbb+Ghyk0MA1CquQpVWqGm0AXTKdsyIgY8u0nq9bgq9X11qsJzPMI9cf0l8wddICs
         mKaoODoY7SRHzxEIGmoHaQpSOXqJ0vGkAW7498VIfr/I1UxHFuLsCosfCZARsBEPRKiz
         9THzPudFNP49NUuPl/7gW/G/BSu8upGtrK2LZZsXG0kcsRSWqc+tmOMBbwLmMi6ikoNe
         Nq0Ub/PAP2/hfpV6SqUI8JTFnfV3M122nz2Zr9By+fpdLRj6w13NAHjYhC0wTw5A/T1h
         o183MBo7uLXAOOoin7MWWTgmmboBtN1GfYEgJ9MOXsPc7FLT5mX6LkRK1taN9iZ7juRv
         whgQ==
X-Gm-Message-State: AOAM530FHYDkuBoXE03tqGQEurPT2UIx6rZeslON3dsRBOuDiw4vP/Wq
        s/qrjecXZbxfxt9ocD4ekr8=
X-Google-Smtp-Source: ABdhPJwre6+S9/iuADIyu3vZjblwYPYFlJIGUEQpe6jpyuLVb63qfp2WrWrOfQPTJgcVRwgY7MbLQQ==
X-Received: by 2002:ac8:1188:: with SMTP id d8mr14180945qtj.218.1622460181439;
        Mon, 31 May 2021 04:23:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:df45:f91c:ea2e:9334])
        by smtp.gmail.com with ESMTPSA id h5sm9105480qkg.122.2021.05.31.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 04:23:01 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, niklas.soderlund@ragnatech.se,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/3] media: adv7180: Add optional reset GPIO
Date:   Mon, 31 May 2021 08:22:36 -0300
Message-Id: <20210531112237.706063-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531112237.706063-1-festevam@gmail.com>
References: <20210531112237.706063-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

There is a reset input that can be controlled by GPIO. Let's add it
to let the driver control it if required.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Used Frieder's version of the patch.

 drivers/media/i2c/adv7180.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 44bb6fe85644..2890041cc231 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -205,6 +205,7 @@ struct adv7180_state {
 	struct mutex		mutex; /* mutual excl. when accessing chip */
 	int			irq;
 	struct gpio_desc	*pwdn_gpio;
+	struct gpio_desc	*rst_gpio;
 	v4l2_std_id		curr_norm;
 	bool			powered;
 	bool			streaming;
@@ -484,6 +485,19 @@ static void adv7180_set_power_pin(struct adv7180_state *state, bool on)
 	}
 }
 
+static void adv7180_set_reset_pin(struct adv7180_state *state, bool on)
+{
+	if (!state->rst_gpio)
+		return;
+
+	if (on) {
+		gpiod_set_value_cansleep(state->rst_gpio, 1);
+	} else {
+		gpiod_set_value_cansleep(state->rst_gpio, 0);
+		usleep_range(5000, 10000);
+	}
+}
+
 static int adv7180_set_power(struct adv7180_state *state, bool on)
 {
 	u8 val;
@@ -1263,6 +1277,7 @@ static int init_device(struct adv7180_state *state)
 	mutex_lock(&state->mutex);
 
 	adv7180_set_power_pin(state, true);
+	adv7180_set_reset_pin(state, false);
 
 	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
 	usleep_range(5000, 10000);
@@ -1338,6 +1353,14 @@ static int adv7180_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	state->rst_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(state->rst_gpio)) {
+		ret = PTR_ERR(state->rst_gpio);
+		v4l_err(client, "request for reset pin failed: %d\n", ret);
+		return ret;
+	}
+
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
 		state->csi_client = i2c_new_dummy_device(client->adapter,
 				ADV7180_DEFAULT_CSI_I2C_ADDR);
@@ -1428,6 +1451,7 @@ static int adv7180_remove(struct i2c_client *client)
 	i2c_unregister_device(state->vpp_client);
 	i2c_unregister_device(state->csi_client);
 
+	adv7180_set_reset_pin(state, true);
 	adv7180_set_power_pin(state, false);
 
 	mutex_destroy(&state->mutex);
-- 
2.25.1

