Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F02C1D8D00
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 03:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgESBQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 21:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESBQ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 21:16:56 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E48C061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:55 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so11921278ljj.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=7L2zG59TWGJfih0i/D2e6VuwseQDT/Gv+Tbho6jYsmg=;
        b=YzLYBztLRqdtpL6C1U4ECjFv/yADbBd35LwtGHVt/KxEz3fwqf9t/hnhDYp6XlcH67
         cZwvtdNOweY6yzpU/HZ5jUVLcTjYHrKAi7cK4InMnRqWkOdsauygsNv4i3klzPFjbZg/
         hnGi4LYHu/pxsK1XI+NuHpZcAlCb2eQTsCR8ZCwNYrQ6GQu9hEeP1EQ/ZXIhmgK3+GtL
         3baaROyzKmSnzB7Z6wVi7HpzhhrpyNGrVR9034xiGdmgYCyWWPEnPr7ARHuWVbdpmaHV
         xuQVcpD56m2flFcJLiWFik5lUPi5h4v9OJaJJFjxLpknLQkVSJLWLuWnohjRZzb/nmN2
         HYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=7L2zG59TWGJfih0i/D2e6VuwseQDT/Gv+Tbho6jYsmg=;
        b=alYUJJORXE3YJEN9t8T0UC442DX5US86Eo6+eF28CjG2L2jfEtfaLbOrguZCxZuY26
         1DyiPJJYMN5qrUs1cAStCj8no//3guQcbhLpFFL4XR9L7QW/sdQs4oq9g/tk9rGPafs6
         XAjQFlZZLpbrkbUVMLe4ELrqU1ADYJio5tr0PJZiKXRelXaMsXhPNBc/76PCVBx4BP1S
         SYaAq4z44rO2fm0mQ09xLHmXp4LFqAxfUsc+PVD1ksj5y55LPqP0/6RUlU+1oeKTADs/
         EB3sG6X0J9RAQlz6qTqIc/ddrXsd0e/v6UHZKIq4hyc4Nts9f3lk+gOI+8aIZiWj0HrF
         0S6g==
X-Gm-Message-State: AOAM530s0uZG3kInC29yOj7FwdQGlcIEDxSHxWPZp3aO7EW/hQhXzX3c
        supl2tUv667704vxwNH6glZznQ==
X-Google-Smtp-Source: ABdhPJyeWgqpM3ZzdT87L7XvXU2AlmWEEpASGJl2ly6pgrw4CaVmYaYbFxX1LWcuTx/boW+LY6I5FA==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr12219584ljc.292.1589851014166;
        Mon, 18 May 2020 18:16:54 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:16:52 -0700 (PDT)
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
Subject: [PATCH v2 2/6] media: ov5647: Add support for PWDN GPIO.
Date:   Tue, 19 May 2020 04:16:17 +0300
Message-Id: <a97c0faa973bc97099efddd89f7b9e5bacf06bd6.1589850165.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
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
 drivers/media/i2c/ov5647.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3e587eb0a30e..796cc80f8ee1 100644
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
@@ -93,6 +102,11 @@ static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov5647, sd);
 }
 
+static inline void msleep_range(unsigned int delay_base)
+{
+	usleep_range(delay_base * 1000, delay_base * 1000 + 5000);
+}
+
 static struct regval_list sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
@@ -355,6 +369,11 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 	if (on && !ov5647->power_count)	{
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
+		if (ov5647->pwdn) {
+			gpiod_set_value(ov5647->pwdn, 0);
+			msleep_range(PWDN_ACTIVE_DELAY_MS);
+		}
+
 		ret = clk_prepare_enable(ov5647->xclk);
 		if (ret < 0) {
 			dev_err(&client->dev, "clk prepare enable failed\n");
@@ -392,6 +411,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 			dev_dbg(&client->dev, "soft stby failed\n");
 
 		clk_disable_unprepare(ov5647->xclk);
+
+		gpiod_set_value(ov5647->pwdn, 1);
 	}
 
 	/* Update the power count. */
@@ -603,6 +624,10 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	/* Request the power down GPIO asserted */
+	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
+					       GPIOD_OUT_HIGH);
+
 	mutex_init(&sensor->lock);
 
 	sd = &sensor->sd;
@@ -616,7 +641,15 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto mutex_remove;
 
+	if (sensor->pwdn) {
+		gpiod_set_value(sensor->pwdn, 0);
+		msleep_range(PWDN_ACTIVE_DELAY_MS);
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

