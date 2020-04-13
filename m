Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8041A652F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 12:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgDMJYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 05:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728242AbgDMJYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 05:24:44 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17703C00860E
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:18:29 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j14so680166lfg.9
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Dazg0uCSqaIHQUhsMcqRqSvCcoSDDbmA2fiSqaBN9MM=;
        b=IGBO35OFdsIktkEWxvs2u4uJJPxlcgyZgAtOmQLDnMg9+1yf2x6K4oow82u3Vlikj4
         qyRasUsMsWEzeVunT6ep688hAfUTx3p1Ce7s93jQ+yNgHVwkPBClqTLofhCwfPw6Hc0C
         L3tXbx24BUqaoG3IrXoDbIGfTt746UnzFEMJNf5RGfElay0pVSBBwKn5eWVnq3tPAj5+
         2Y0yWyJpilbcfw6QMj5hxIP7rJcXmxpzi6TJDXMQ8ml0lpav44aUEbOtUYD2KK/U6e2p
         BDP0Bk+FEb8MMXT3lYkvqBclo/Ov6Ki7F6DEXnOINF4F6fscfQdZZ1PJ8IiOAvGDp3JH
         K0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Dazg0uCSqaIHQUhsMcqRqSvCcoSDDbmA2fiSqaBN9MM=;
        b=nucLrBBXq9oe61tV5DIV4cm2P8ByUP545hITwBGy43GBR2rZk5jdTD/m1cprRKc84n
         yVmCMwNg4Aj9XdSvRBys1w5CAFPK1KGpVDTzIV8HicP0Fx1oxgDwPvbh7nyrSzPqMuNW
         48mseWCR0iD6CfLTTBH+lzt9tIG3yy2rB3CAe+d5Zw+/2I0c2mRXHfXIQPNnqhq2DGKH
         EZwK7vZg+fIjLsxAbufrBw7CSh5ndh1/iv+qu6y049HtkgVlosaKD6DkIiiYn6ItZQYv
         09PgCXYuJEZ1vEjmJR750gplRkrzvi40ZqwDpsTrfxiWNu2lOj+hml0+yhRsIxdWLt9b
         hboQ==
X-Gm-Message-State: AGi0PuYteljNEdxa6z+FNyUykaGXd6n2bcOoRzf0LrYbpHky0FtP15yI
        8eG/2OmpeRSNAba+Wq6iwcv8wQ==
X-Google-Smtp-Source: APiQypJtWZRgeuhBdwNVv/BYkC/v97z1lki6YGoNZ8np1IQMVGV5tfmu6geF0iOgUiJOhok3iuHfpQ==
X-Received: by 2002:a19:114:: with SMTP id 20mr9943824lfb.169.1586769507484;
        Mon, 13 Apr 2020 02:18:27 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id e16sm8339049ljh.18.2020.04.13.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 02:18:27 -0700 (PDT)
From:   Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Luis Oliveira <lolivei@synopsys.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: [PATCH 2/4] media: ov5647: Add support for PWDN GPIO.
Date:   Mon, 13 Apr 2020 12:17:45 +0300
Message-Id: <f88b99899eb5e680607349b37eb3679dbd12433e.1586759968.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586758372.git.roman.kovalivskyi@globallogic.com>
References: <cover.1586758372.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Add support for an optional GPIO connected to PWDN on the sensor. This
allows the use of hardware standby mode where internal device clock
and circuit activities are halted.

Please nothe that power is off when PWDN is high.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
---
 drivers/media/i2c/ov5647.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3e587eb0a30e..c39e3d20e3ef 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -21,6 +21,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -35,6 +36,13 @@
 
 #define SENSOR_NAME "ov5647"
 
+/*
+ * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
+ * high if reset is inserted after PWDN goes high, host can access sensor's
+ * SCCB to initialize sensor."
+ */
+#define PWDN_ACTIVE_DELAY_MS	20
+
 #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
@@ -86,6 +94,7 @@ struct ov5647 {
 	unsigned int			height;
 	int				power_count;
 	struct clk			*xclk;
+	struct gpio_desc		*pwdn;
 };
 
 static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
@@ -355,6 +364,11 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 	if (on && !ov5647->power_count)	{
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
+		if (ov5647->pwdn) {
+			gpiod_set_value(ov5647->pwdn, 0);
+			msleep(PWDN_ACTIVE_DELAY_MS);
+		}
+
 		ret = clk_prepare_enable(ov5647->xclk);
 		if (ret < 0) {
 			dev_err(&client->dev, "clk prepare enable failed\n");
@@ -392,6 +406,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 			dev_dbg(&client->dev, "soft stby failed\n");
 
 		clk_disable_unprepare(ov5647->xclk);
+
+		gpiod_set_value(ov5647->pwdn, 1);
 	}
 
 	/* Update the power count. */
@@ -603,6 +619,10 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	/* Request the power down GPIO asserted */
+	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
+					       GPIOD_OUT_HIGH);
+
 	mutex_init(&sensor->lock);
 
 	sd = &sensor->sd;
@@ -616,7 +636,15 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto mutex_remove;
 
+	if (sensor->pwdn) {
+		gpiod_set_value(sensor->pwdn, 0);
+		msleep(PWDN_ACTIVE_DELAY_MS);
+	}
+
 	ret = ov5647_detect(sd);
+
+	gpiod_set_value(sensor->pwdn, 1);
+
 	if (ret < 0)
 		goto error;
 
-- 
2.17.1

