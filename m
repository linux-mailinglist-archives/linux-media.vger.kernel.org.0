Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C9C1D8D05
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 03:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgESBRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 21:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbgESBRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 21:17:02 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B2FC05BD0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:17:01 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h188so9773644lfd.7
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=xOPgjvAjIx8tLUowGcMfjYDQ/kMehnrvLIphz2d0rPY=;
        b=EkiEQDMfNl49SJQUh3VX4e4ZDXfYZkzM/bgAJ22dkDNT+EP8mBkjqYmyoOLAFAJQU0
         MSynuvhWa6CwBkkZLybzB/l17FH7MbM2L1h1ZNyQlmclrMKDmO851BzolEWeYwTrgTgL
         itAfqpHQ2dtpVS8HiZlIbzK3s5vT0Qmg28ESIM5EPpJgsr5GC/S/VSuDjL5bkP9L6d+J
         0M3xpnJkjiMTA/K0HXX3t8FkDBy7/vjN5IJ7+KnUoIZh6Xgbut8OYoPDkB9iKl+gfqVk
         Cz/Tu3eCHQF8Ui9x9TQNHW4/DumOaTkg6LwObSmeWEHcvGrHN/ii5+zu83WOiajNJxZO
         0cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=xOPgjvAjIx8tLUowGcMfjYDQ/kMehnrvLIphz2d0rPY=;
        b=IpXIxNe2eS38m2baUwqcSaOREmPsaoN3ttYkiHqNiFomKQ6pbhLF/zs+xktwdMaZoE
         DxIiGiQzarmu07INcdBcdrLV8LiCeLWAjPd/EzilBIM2x0ZMnbz52d4G32Kvq0BIxRP9
         h2GSptN357hZT3oejxtVK7Xjk27mK9DgpzZ/zE0kdK4qMfKKiLeyt4e0dmkhOL6BT/C1
         j+FZ8dzwTenA838EmLN0T/XNh+rs5khBEZHVZm9UZu3Ritq6a9otuniK8VkUYYIfcNAp
         nxTSTUQHOLSIk494wZE7fMJjxJoNBnKFQZiMXM7G7B+dIxesaov10i0dpTFuxk7Tkxfq
         QglQ==
X-Gm-Message-State: AOAM530pivWBRrGRfsoe5E4HdCloGoMabhOgUhRTIDsxX9CIW4bR1+L+
        ZUFTzuAOkvCYIKsMIoal2D7nKw==
X-Google-Smtp-Source: ABdhPJzVl+KELPsmRULh2Rc+eqv6+X6Lx0uX+EQYpcjDteuAXY8yjhlADFiglvYPcwsLTRa48Eey6Q==
X-Received: by 2002:a05:6512:3ea:: with SMTP id n10mr13576037lfq.127.1589851020077;
        Mon, 18 May 2020 18:17:00 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:16:59 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: ov5647: Use gpiod_set_value_cansleep
Date:   Tue, 19 May 2020 04:16:19 +0300
Message-Id: <ff9d9fe93a50efdeced9efab7b38d72c7dabc08f.1589850165.git.roman.kovalivskyi@globallogic.com>
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

All calls to the gpio library are in contexts that can sleep,
therefore there is no issue with having those GPIOs controlled
by controllers which require sleeping (eg I2C GPIO expanders).

Switch to using gpiod_set_value_cansleep instead of gpiod_set_value
to avoid triggering the warning in gpiolib should the GPIO
controller need to sleep.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 10f35c637f91..7600b4844f16 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -378,7 +378,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
 		if (ov5647->pwdn) {
-			gpiod_set_value(ov5647->pwdn, 0);
+			gpiod_set_value_cansleep(ov5647->pwdn, 0);
 			msleep_range(PWDN_ACTIVE_DELAY_MS);
 		}
 
@@ -420,7 +420,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 
 		clk_disable_unprepare(ov5647->xclk);
 
-		gpiod_set_value(ov5647->pwdn, 1);
+		gpiod_set_value_cansleep(ov5647->pwdn, 1);
 	}
 
 	/* Update the power count. */
@@ -661,13 +661,13 @@ static int ov5647_probe(struct i2c_client *client)
 		goto mutex_remove;
 
 	if (sensor->pwdn) {
-		gpiod_set_value(sensor->pwdn, 0);
+		gpiod_set_value_cansleep(sensor->pwdn, 0);
 		msleep_range(PWDN_ACTIVE_DELAY_MS);
 	}
 
 	ret = ov5647_detect(sd);
 
-	gpiod_set_value(sensor->pwdn, 1);
+	gpiod_set_value_cansleep(sensor->pwdn, 1);
 
 	if (ret < 0)
 		goto error;
-- 
2.17.1

