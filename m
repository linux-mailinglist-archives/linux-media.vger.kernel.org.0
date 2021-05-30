Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18AC3952E3
	for <lists+linux-media@lfdr.de>; Sun, 30 May 2021 22:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhE3UqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 16:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhE3UqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 16:46:19 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B0AC061574;
        Sun, 30 May 2021 13:44:41 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id v8so9531414qkv.1;
        Sun, 30 May 2021 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qi3JBoSf3Tk8csxBRbacqjWH+rHIvvgIqkyXT5xbRxE=;
        b=kcbMbsWbjNZeEO9u1f9oPAMKyi/jwOvJPdY3+2td0LWGuredtKLlxiW1FAj4mDAnCI
         1Qn6lBrnFTu0ECw4eh1rwwBth1DoYj/yA4yCxhhSoy2iLbdwm2N9qVBGHur9nrHcZcWo
         NjKZaC8WB/OALPH+7nzaFgBID43yw2/eG3cK9JGCe4YOblKJAlRYxybNNqnNqbQHddMW
         YBrM2iDKl9HCR7AgkgaL1XeFoauoPRxO+OQvcS0Gz16bEx5847RJ+PmHJRNkgDOFu3Oh
         oJci70GLDMizzk7VtUVTmJUo2HS/VCQL3v6JALdeKSAjYY2UNABwXRm7IDZxxFw/0hMG
         /CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qi3JBoSf3Tk8csxBRbacqjWH+rHIvvgIqkyXT5xbRxE=;
        b=LGLLano2PNrjNjW7WJHo3tl9TbRUMczf0Kd6JPLhd/Qyg82ExXhOmqCg2KVyLh+MFU
         ZIaLEZoV8wb07O2GDxkKtIkJ0/4FIPpstZ6zEMgvimEGQosOGABOj0qzntlh1eoaGUrV
         Dtam4xNqN+euPgLw3F9RfwO0DcLnPDg+mo2V8I1gUGiVLq7OW8PxArw087r4lGVyz1LR
         TPd80QRmWOVrRm/FrMOxPDNmoWAlZ+qmhNyjN7v9kEm3UhSsghnZJ1vLchrbYTAW2Gg3
         ZHiFCwmZfTtW8pn0yVHyUMcnL0yTBHLdpAB+hHoaq959ywAVc8rCpsYRsjEwiZjs5nuW
         z53g==
X-Gm-Message-State: AOAM532EDZkENaMghi0JtD3EG69t8Skxje408+YNRSRL0RZkC+heQYyG
        rmGqXmgU2sXSU5H8q5POOPiOtkYjrvY3bA==
X-Google-Smtp-Source: ABdhPJzYzynUHw4wChRfN5l1k6bCpXUjHdE11ng/yYoh4iNyrSBZ7ECTNk45kM2FWp0ZMX8IPR7QOg==
X-Received: by 2002:a37:4386:: with SMTP id q128mr13776817qka.76.1622407480453;
        Sun, 30 May 2021 13:44:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:3dc6:a286:1b00:8f0a])
        by smtp.gmail.com with ESMTPSA id m14sm7192666qti.12.2021.05.30.13.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 13:44:40 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, niklas.soderlund@ragnatech.se,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] media: i2c: adv7180: Allow the control of the reset pin
Date:   Sun, 30 May 2021 17:44:09 -0300
Message-Id: <20210530204410.676831-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530204410.676831-1-festevam@gmail.com>
References: <20210530204410.676831-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On a design where the ADV7180 pin is pulled down, it is not possible
to make it functional unless the GPIO connected to this pin goes
high.

Add support for the reset GPIO by introducing an optional property
called 'reset-gpios'.

Note: the reset operation is still performed via software as recommended
by the Analog Devices, but the reset GPIO still needs to go high to make
the chip operational.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/adv7180.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 44bb6fe85644..2811f2c337fa 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -205,6 +205,7 @@ struct adv7180_state {
 	struct mutex		mutex; /* mutual excl. when accessing chip */
 	int			irq;
 	struct gpio_desc	*pwdn_gpio;
+	struct gpio_desc	*reset_gpio;
 	v4l2_std_id		curr_norm;
 	bool			powered;
 	bool			streaming;
@@ -473,13 +474,15 @@ static int adv7180_g_frame_interval(struct v4l2_subdev *sd,
 
 static void adv7180_set_power_pin(struct adv7180_state *state, bool on)
 {
-	if (!state->pwdn_gpio)
+	if (!state->pwdn_gpio && !state->reset_gpio)
 		return;
 
 	if (on) {
+		gpiod_set_value_cansleep(state->reset_gpio, 0);
 		gpiod_set_value_cansleep(state->pwdn_gpio, 0);
 		usleep_range(5000, 10000);
 	} else {
+		gpiod_set_value_cansleep(state->reset_gpio, 1);
 		gpiod_set_value_cansleep(state->pwdn_gpio, 1);
 	}
 }
@@ -1338,6 +1341,15 @@ static int adv7180_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	state->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(state->reset_gpio)) {
+		ret = PTR_ERR(state->reset_gpio);
+		v4l_err(client, "request for reset pin failed: %d\n", ret);
+		return ret;
+	}
+
+
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
 		state->csi_client = i2c_new_dummy_device(client->adapter,
 				ADV7180_DEFAULT_CSI_I2C_ADDR);
-- 
2.25.1

