Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66BBE170AF9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 23:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbgBZWAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 17:00:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39918 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBZWAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 17:00:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id o15so884184ljg.6
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4YOgxx6r3afGhYc6lPiOHhyKgCrl1sOqiBB2Itl3m5s=;
        b=nXwnc1BO91TUBSvST7irz6/aCJY4ms204X6IkAZ48304Z6/HellAUfPTooG7QpYbfQ
         49JbjmxPTlt+WKC0GVdZ4uuvgU0JSlhg3R4Pp8bGwAQkBxkVozeHVm9/SmEma1u7McgI
         H80hJQpUAGQM5EZxrWF+lUjoMZhNoUcxY9Zg1p4ff9sDawykDVmYGW5wPdY0Lp7qg9z8
         NR5LC7SfN1CJaujxvPQllhZaP9e1ktwqAmdVESxANcLjy2s/7WlNrIpwvrSevUmfOv6x
         CrWjcrmbQRFTvHMLck1tJsXgErjJu1JqtVLuQMqAk69CvUuWYVtRgTBhE81yGWp8j5mZ
         bEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4YOgxx6r3afGhYc6lPiOHhyKgCrl1sOqiBB2Itl3m5s=;
        b=VY9ZGaIY6elaGyj//3V1dKgUo2vZAI1rwQYRlnR/KIdXIhurM7Vc5XjtvsToZvrrZe
         AUN5/d97o/Mt5pn0mYU3/FhaTSpQ6BjvKxF39ZvIjh+3ENTiqz6O09Cfhw3Hs9flOBCo
         AVTPcn+99uHzpw1cWHsxpY9rF2/SFIsMYCmxF3BhbBsr9LgAeycy28PqbJnyocUTa1kZ
         oD/0srSbWBkBQhPos9EHXFBo2i4ofROILGlsPA3zq0mO2s1v9ZIF6NegpKpks3PL7YKI
         wWB09wOu9Qts6ev2tz465gxB16v0ml6qeIUnAwIN0BfSTmxF0y6FBU5ymwNG6cB3ip8u
         PIXw==
X-Gm-Message-State: ANhLgQ3/JOqAtl9mvxXu6enV6wid1W1Yc88eBXbi4IBQapZzIkl60quv
        A7f8N/m31XjBzsF5AffhK1AGjQ==
X-Google-Smtp-Source: ADFU+vs78+nzViHBPIEbiewEFBUg+RwCXMDCT9d4tczbvxrgDA5nMJhrQzRORrWVa+yH4OSRZuZ/tw==
X-Received: by 2002:a2e:9041:: with SMTP id n1mr673031ljg.133.1582754408670;
        Wed, 26 Feb 2020 14:00:08 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id a9sm316856lfr.37.2020.02.26.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:00:08 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 1/3] media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is called
Date:   Thu, 27 Feb 2020 00:59:11 +0300
Message-Id: <20200226215913.10631-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226215913.10631-1-andrey.konovalov@linaro.org>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the current driver 'media-ctl -p' issued right after the imx290 driver
is loaded prints:
pad0: Source
             [fmt:unknown/0x0]

The format value of zero is due to the current_format field of the imx290
struct not being initialized yet.

As imx290_entity_init_cfg() calls imx290_set_fmt(), the current_mode field
is also initialized, so the line which set current_mode to a default value
in driver's probe() function is no longer needed.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index f7678e5a5d87..2d8c38ffe2f0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -722,9 +722,6 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
-	/* Set default mode to max resolution */
-	imx290->current_mode = &imx290_modes[0];
-
 	/* get system clock (xclk) */
 	imx290->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk)) {
@@ -809,6 +806,9 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
+	/* Initialize the frame format (this also sets imx290->current_mode) */
+	imx290_entity_init_cfg(&imx290->sd, NULL);
+
 	ret = v4l2_async_register_subdev(&imx290->sd);
 	if (ret < 0) {
 		dev_err(dev, "Could not register v4l2 device\n");
-- 
2.17.1

