Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5C61A64A1
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 11:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgDMJZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 05:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728241AbgDMJYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 05:24:43 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5827CC008614
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:18:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x23so6052757lfq.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=nJ3wGvHG21kZCcWWUmMVuJpwrK3OAJC5/GGoLYqeeoY=;
        b=LVIXHdasyTi15SI/wHfDn37mthCzFrgVVRH/hbaQzT7jVVePmdSUjWrJrz9DPvXa7d
         g9+e2hGItpjldKG7vYxDZ2sErky+gVlMsJI3J5QwnB6Gsfwsib3ztXf5eT2qR5kk43XX
         ScNvUlyVAuPQVZRWAxYSqXEKMz/4yxObbULY8vXeIpAk53I64Q0Qrx279X+OQV4QhJSY
         RqPRIi4rl2PttqZUPb8yn0zeQVm0G0h1vsNNnCKL5nqDocE9abkznTlwLIETmEVfUsgQ
         6Eb7cC30/iGkuvrUyiWx/U31G4HL9HWP00rQzGFuRNE6aa/6v42UB7U7Tti6Q86//tfY
         ysrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=nJ3wGvHG21kZCcWWUmMVuJpwrK3OAJC5/GGoLYqeeoY=;
        b=oLzwGjT4qy3shvkbImRE9QEUTLNd56yMefPnHT4XKL5/v0C7hcP4iDw9L3HIRZ6yAp
         dchi4cHYmBCVLFYCkSGHHZ/ao5cnr54CcLWkHMWcSez8QmLAafyYxkZi0W1Bhuh45Jmo
         f8NXAFGLrNfTDxkghBlILTu5hoFIqUQXMVQ9pUtPN86MFhNQPkKi9RteIUcvHAb04alG
         9mzcoYObSIER3z5TOBfwM8UXhpN/0PHxXMoFadRoK+kQAgCsezLb35tjmhRJG3lkx4d9
         2IwT8CNms6LTNq8E9qV7XPJDXxD6UHnGssFbRArk8MooJaCaoCUzYbc2CK0mCuOAwgd1
         9o/A==
X-Gm-Message-State: AGi0PuYg1nXWp7/6zKYc6UohoKYzjlrOBzUBdhAgdM3bRQSNnX8XCPXW
        KudncOyUrmwl26/8n6Yq6Zz7wg==
X-Google-Smtp-Source: APiQypKiy2ApL12LsEoupN/PJRDWla5hKyE1JxNkCto7raGjWSgpDEAN4JkcnruENvXmRtbY8pakUg==
X-Received: by 2002:ac2:5f92:: with SMTP id r18mr10304695lfe.154.1586769511832;
        Mon, 13 Apr 2020 02:18:31 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id e16sm8339049ljh.18.2020.04.13.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 02:18:31 -0700 (PDT)
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
Subject: [PATCH 4/4] media: ov5647: Use gpiod_set_value_cansleep
Date:   Mon, 13 Apr 2020 12:17:47 +0300
Message-Id: <f496fe5d364748e9d625a634581a404f30a13efa.1586759968.git.roman.kovalivskyi@globallogic.com>
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
index 8a1a515388e0..07550377be2e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -373,7 +373,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
 		if (ov5647->pwdn) {
-			gpiod_set_value(ov5647->pwdn, 0);
+			gpiod_set_value_cansleep(ov5647->pwdn, 0);
 			msleep(PWDN_ACTIVE_DELAY_MS);
 		}
 
@@ -415,7 +415,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 
 		clk_disable_unprepare(ov5647->xclk);
 
-		gpiod_set_value(ov5647->pwdn, 1);
+		gpiod_set_value_cansleep(ov5647->pwdn, 1);
 	}
 
 	/* Update the power count. */
@@ -648,13 +648,13 @@ static int ov5647_probe(struct i2c_client *client)
 		goto mutex_remove;
 
 	if (sensor->pwdn) {
-		gpiod_set_value(sensor->pwdn, 0);
+		gpiod_set_value_cansleep(sensor->pwdn, 0);
 		msleep(PWDN_ACTIVE_DELAY_MS);
 	}
 
 	ret = ov5647_detect(sd);
 
-	gpiod_set_value(sensor->pwdn, 1);
+	gpiod_set_value_cansleep(sensor->pwdn, 1);
 
 	if (ret < 0)
 		goto error;
-- 
2.17.1

