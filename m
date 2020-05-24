Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912681E0261
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388371AbgEXT0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388366AbgEXT0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:26:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977EFC05BD43
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:58 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z6so18503952ljm.13
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gOEmyTIXLGf07K4H6sbyOUY42DeO+G/ARk34mfyH9Kc=;
        b=PQ6va+bBos8A51P/Wj2BBF99a+zevl/gbe2oENYX3N1gUZQyc+SEAF4KQmNBB8Zt/l
         K5OUnbR74VUvV8nH5Z+GlVFjwKIeGzd1J0hiUMFdkqM3R1O22CGCxzo365512pREm/qf
         X28f38wZULiPdFMf3318ypK07QQ275PpSiqUWzpKHKmLIlCjwSS2i9+opfMxaGn8Y0e7
         bt6NDkScz+SyU+LxR/eWNCffvnRNGkW7gy7RDQSzK3ErA1yPI6ZoxmwCZ+G47Onr1LJl
         +wJzNRQZRGQ9Y4J62UeHaoWDEWiLUDx7Ob11nhwzE8NvaRKqSrM+EatW77eA2zlASbZo
         ywXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gOEmyTIXLGf07K4H6sbyOUY42DeO+G/ARk34mfyH9Kc=;
        b=pMqUYY1Y6++GuZ1OQeZAlAPnHsPoPanNF3U8AtfXH3uBaiJP9HAN09jGODGjJlqN8b
         LNyWbav7UCaPzPAL7283Si9483Kd1l/vq++kxx9jlkT9OJI8muoVc419gPcdNOd/icQp
         ddHp2Qn6I9Zmil/O7I0C5pYYOcpzcX5GytNldCZ1IGu6n8weVuPFH8v5028Heg6aqGfx
         1/ZEbjCyWHFWtaZOZFfdZGRYTVdQPizdf6sWC7fauRLBBtNvWC6TUCgek2DW64TYMLAE
         J1XHRrN46lfHjT8NFsj8Qb4Vs+nmD748dW5AeI239VLnzbyxJNtpjdNvzTfXS0xgkVDj
         VRyw==
X-Gm-Message-State: AOAM533ApCnWa/mVIcrbSA6wly8Reowhh7I57XDCv5sugj0kjpC9cDxz
        WwKupRkYribt3RvaKsKuEzLxXQ==
X-Google-Smtp-Source: ABdhPJzTJjWtrQpvchNNsRDE9WSqRA6ghX1gFq3L/OgHr76p50AS89FmNt0BQKK9wQJuovOMHBKI+w==
X-Received: by 2002:a2e:8e6c:: with SMTP id t12mr10024175ljk.376.1590348356964;
        Sun, 24 May 2020 12:25:56 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:56 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 10/10] media: i2c: imx290: set bus_type before calling v4l2_fwnode_endpoint_alloc_parse()
Date:   Sun, 24 May 2020 22:25:05 +0300
Message-Id: <20200524192505.20682-11-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus_type field of v4l2_fwnode_endpoint structure passed as the argument
to v4l2_fwnode_endpoint_alloc_parse() function must be initiaized.
Set it to V4L2_MBUS_CSI2_DPHY, and check for -ENXIO which is returned
when the requested media bus type doesn't match the fwnode.

Also remove v4l2_fwnode_endpoint field from struct imx290 as it is only
needed in the probe function: use the local variable for this purpose.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ee5c95cf64f3..05a3d897614e 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -74,7 +74,6 @@ struct imx290 {
 	u8 bpp;
 
 	struct v4l2_subdev sd;
-	struct v4l2_fwnode_endpoint ep;
 	struct media_pad pad;
 	struct v4l2_mbus_framefmt current_format;
 	const struct imx290_mode *current_mode;
@@ -887,6 +886,10 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
+	/* Only CSI2 is supported for now: */
+	struct v4l2_fwnode_endpoint ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
 	struct imx290 *imx290;
 	u32 xclk_freq;
 	int ret;
@@ -908,15 +911,18 @@ static int imx290_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &imx290->ep);
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
 	fwnode_handle_put(endpoint);
-	if (ret) {
+	if (ret == -ENXIO) {
+		dev_err(dev, "Unsupported bus type, should be CSI2\n");
+		goto free_err;
+	} else if (ret) {
 		dev_err(dev, "Parsing endpoint node failed\n");
 		goto free_err;
 	}
 
 	/* Get number of data lanes */
-	imx290->nlanes = imx290->ep.bus.mipi_csi2.num_data_lanes;
+	imx290->nlanes = ep.bus.mipi_csi2.num_data_lanes;
 	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
 		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
 		ret = -EINVAL;
@@ -925,19 +931,12 @@ static int imx290_probe(struct i2c_client *client)
 
 	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
 
-	if (!imx290->ep.nr_of_link_frequencies) {
+	if (!ep.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
 		goto free_err;
 	}
 
-	/* Only CSI2 is supported for now */
-	if (imx290->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "Unsupported bus type, should be CSI2\n");
-		ret = -EINVAL;
-		goto free_err;
-	}
-
 	/* get system clock (xclk) */
 	imx290->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk)) {
@@ -1063,7 +1062,7 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
 
-	v4l2_fwnode_endpoint_free(&imx290->ep);
+	v4l2_fwnode_endpoint_free(&ep);
 
 	return 0;
 
@@ -1073,7 +1072,7 @@ static int imx290_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&imx290->ctrls);
 	mutex_destroy(&imx290->lock);
 free_err:
-	v4l2_fwnode_endpoint_free(&imx290->ep);
+	v4l2_fwnode_endpoint_free(&ep);
 
 	return ret;
 }
-- 
2.17.1

