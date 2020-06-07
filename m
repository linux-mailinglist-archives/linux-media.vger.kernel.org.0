Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312A01F0D16
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgFGQav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgFGQat (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:30:49 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9215EC08C5C5
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:30:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id e125so8741176lfd.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xeJmQRJvkh8fRKHXAH/W536lRiSffIGCx+R099ed5PQ=;
        b=cWHbKehKHIDF062O/92MuKOTWDReA/eMg+2MWo7iENt0FzGGlbcQHmhxWZorGSbmAM
         uc7zGnxHEe1MUmNlY+bGjoJMYJ6MtMyIKDi42imxeId/vOh3PE1qgbEJVCUdbk/ZQlTq
         BPB2NjB2AWvTlQ0eFu9CzcpTKCowVtbXC/UNqY8R/PzETERaT9zsc+VUAXXaF6zoHUqB
         G21musHG+MCTXQW9HLMc5rOj4gujqvo0V1Xnga40s8Rjx/sLUD8Jf0a+9VblX/NHDMbP
         +CfTEdGPe0aKpfM3Zbl3qOk3Tk5BdJLCEW8d4W5NdkVAN/hkC2MLSstUvfCCMFBYtKs9
         ehMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xeJmQRJvkh8fRKHXAH/W536lRiSffIGCx+R099ed5PQ=;
        b=oZaao9uUprYnv8UgGJK7Ny8J97JiHhCJkfX33TvK2VIb7B8gfe/jYwag3EIMgZ219a
         aOn7GgjLVL+L80DFCc0dxE+RDMu8avVIbTGaQ5ORgxAaiQazsxW1Hbrwj5+5HhE5UYDS
         Ntogf+P2Ys1ItNdTe/TLl3malwp2o8Ht2mTAEbfXj8LzAlxsIGclLzTwv+j5wqmQKT2R
         Hi741sZOUARznyz7LVuASvgnKG/+h7cVrYQ42XC9XjjaN1qbCoyfl01BdUs8JFueJzHy
         JE2J+vQQYpBXLqJad7IzN2wP2uXY3cLs9sUVr4fy54w/M79hAJ6VDwpy/WbWBJs/p+wU
         BEDA==
X-Gm-Message-State: AOAM532QgF8aa+P/mQakD37K0jW2P+j3it9r+TPv+sX/+y17PkmcpXFC
        0IZzZBoxr1xcsZhNqm9gqWZfPw==
X-Google-Smtp-Source: ABdhPJxth+i63WhQaXwjfVhDSLOI1ZX4ELYq67YtASPe86NC6Fn9Cnu2AFDuq7cDjzyYCb5ga9xmZw==
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr10414421lfk.87.1591547446112;
        Sun, 07 Jun 2020 09:30:46 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:45 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 01/10] media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is called
Date:   Sun,  7 Jun 2020 19:30:16 +0300
Message-Id: <20200607163025.8409-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
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

