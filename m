Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2841F78FA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 15:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgFLNyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 09:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgFLNyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 09:54:20 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B958C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id i27so11127188ljb.12
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xeJmQRJvkh8fRKHXAH/W536lRiSffIGCx+R099ed5PQ=;
        b=hiiHVTh1koKECwgkQFOYluvaR28/5xxQvqOjadxCulwyJAffd2ZpYXFjRWW1GzXVU0
         nomzxfGeylZ5u440WHBdRkGLZgok5eypFL+YQPilPO3CGrehGubk6rraAt64TSwIsJSe
         yoXR8k2FXymqMEqV+1cz4eaNbor9pimWSgDqjiRhRi8sHXkx+0HQezDhVNe4TygLUJQ0
         ftjs0JrFoSH+fnIq/YijvScx0OXsSbgEIYGNKa97Ei5JeWJNg9gIh4QEs9y9H6sOQ9Rp
         irk26liCEIf59CE2Ly8HkxSzVUgwP7NRijj7rokcaQu/kuCGVOP9smOd7pMii0QvDRpo
         hBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xeJmQRJvkh8fRKHXAH/W536lRiSffIGCx+R099ed5PQ=;
        b=CHDnPfZvcR8Qr5NpIAPVv/bLprGP7x2Lev2Cc0pU+g8ilzI2WVvhhRPjXi2vEyPn+Q
         Qm/pOBVb2Ku/D2NY2HXdaWZ/fFRiqzYLfJ1eZ5Kt5CXsbcVNTpP0SfqLdMDMDNP9i7zI
         cY3To08v15XrdKivvIKUF4hOOPsjkqEevxDHbFU5GpjURsNKzOKkn7xjxIyCQ70cwMpR
         7tcQqkhbekuaaeo5TeG86QKHrEb6aiI0RI76Ik2Lj6XYMYywm8HxcPoEOtjrKXVEcKDf
         gCa+a7b5qcuf6orcVabzOaG43OkzASpED6kOmspmLdkvqjI26KUwye+J+UCCbiRc5w1k
         /+4A==
X-Gm-Message-State: AOAM530+dcvqx7iT21e8ZWvMU8/ziYc/lHowwfFt/Wb8NCmQ+28YpNEf
        n+vzP8yXnSv1r94JhuE8/DEAGQ==
X-Google-Smtp-Source: ABdhPJxAs/p3JqvNSzkzmTG4KRwjrgYR0Zzdjszn5nAVDBlQ8woXvA/n+G+5ZPWyQVX+lnXJxldUWw==
X-Received: by 2002:a05:651c:108:: with SMTP id a8mr7069531ljb.326.1591970056778;
        Fri, 12 Jun 2020 06:54:16 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:16 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 01/10] media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is called
Date:   Fri, 12 Jun 2020 16:53:46 +0300
Message-Id: <20200612135355.30286-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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

