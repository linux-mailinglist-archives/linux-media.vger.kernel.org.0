Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3799A1F0D08
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgFGQbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbgFGQbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:31:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B57C08C5C4
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:31:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s1so17519956ljo.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dfWTJRln/wUkUezGYMWTWyc7bZ4R2M6yJEVL+/18MoU=;
        b=JhsWDMxQZ1/NcZTwhhTdjBGtnXX8mULfjvyeevpeheQhRviLws+dfkfdQQLxDVl7XV
         kQYSxeIEb3bwXQcd/xxgN7wftXcZhFuWXw1Y3/OSDttBaHgtpHvyJSBjkBxv/NvRCzZY
         OQzXZmRokwALTD+miJSukeoL7BDilVnyKmxe++oZBGg1yJ0sB3YJFTw4X8/2iPRCg2sp
         WvLs6+AEZkY6J2r9jYaLN7UlJuLa7EeEMYBmXiyu65TTLJ7elaktN3aXkEB/JbnBCCRv
         5gZxFwmw4m1zYZke5l3KcAJ3+E8603d/UBkq2Wh+JRaGFvyVu4nVqHm/7crlEN3x2i43
         d85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dfWTJRln/wUkUezGYMWTWyc7bZ4R2M6yJEVL+/18MoU=;
        b=MKl2Y1C5q7UMf5g9+wBGfbqO7z65qMJPz3cUJslfFfKj/iRvxcetBK1WlG513He6ZP
         Dq7KcGJM14f7ZCjTbzBVqqyYj5+1sRwlp1ILYCvQNKqogeofuT+j9yKoUJE0echS4MI1
         f1nZw1icsoqx50n2wzuHcBa35EUPpqUF+2eLTg0+ugpLIXgX0OVkWvqT/MbGISEXF2+k
         c96QJ/b7TAeynlpXVBBLz6EkDV9IsrYYxCd1fSPCS98dk/+pLtulPwZJB+6cFIY1nM1T
         i4MeQIgYOBYq7G8iHoMaglU/krnbW1DR+Wq5tWZ2d8z18xVMaqaMq7EYLUTT26oDiATl
         pAtQ==
X-Gm-Message-State: AOAM53153+hH00/M0IQgA4Zn8xU75eCtvZ0sGCbREftDZek2psD+x7UJ
        VJ0aDU5iAIRVn51Vf/PSC/WaeA==
X-Google-Smtp-Source: ABdhPJy7RVt9fRqw1XY48kyWG2iJArPS9Cv81DF9HQ1xCb1mlZVeQ5/Ic48+BpzKbmrWsyCDcUCcpw==
X-Received: by 2002:a2e:7303:: with SMTP id o3mr9826431ljc.100.1591547469072;
        Sun, 07 Jun 2020 09:31:09 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:31:08 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 10/10] media: i2c: imx290: set bus_type before calling v4l2_fwnode_endpoint_alloc_parse()
Date:   Sun,  7 Jun 2020 19:30:25 +0300
Message-Id: <20200607163025.8409-11-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
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
 drivers/media/i2c/imx290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 02001c1b0dfc..9c97830164e9 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -70,7 +70,6 @@ struct imx290 {
 	u8 bpp;
 
 	struct v4l2_subdev sd;
-	struct v4l2_fwnode_endpoint ep;
 	struct media_pad pad;
 	struct v4l2_mbus_framefmt current_format;
 	const struct imx290_mode *current_mode;
@@ -914,17 +913,18 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
  * of MIPI data lanes are mentioned in the device tree, or the value of the
  * first missing frequency otherwise.
  */
-static s64 imx290_check_link_freqs(const struct imx290 *imx290)
+static s64 imx290_check_link_freqs(const struct imx290 *imx290,
+				   const struct v4l2_fwnode_endpoint *ep)
 {
 	int i, j;
 	const s64 *freqs = imx290_link_freqs_ptr(imx290);
 	int freqs_count = imx290_link_freqs_num(imx290);
 
 	for (i = 0; i < freqs_count; i++) {
-		for (j = 0; j < imx290->ep.nr_of_link_frequencies; j++)
-			if (freqs[i] == imx290->ep.link_frequencies[j])
+		for (j = 0; j < ep->nr_of_link_frequencies; j++)
+			if (freqs[i] == ep->link_frequencies[j])
 				break;
-		if (j == imx290->ep.nr_of_link_frequencies)
+		if (j == ep->nr_of_link_frequencies)
 			return freqs[i];
 	}
 	return 0;
@@ -934,6 +934,10 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
+	/* Only CSI2 is supported for now: */
+	struct v4l2_fwnode_endpoint ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
 	struct imx290 *imx290;
 	u32 xclk_freq;
 	s64 fq;
@@ -956,15 +960,18 @@ static int imx290_probe(struct i2c_client *client)
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
@@ -973,27 +980,20 @@ static int imx290_probe(struct i2c_client *client)
 
 	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
 
-	if (!imx290->ep.nr_of_link_frequencies) {
+	if (!ep.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
 		goto free_err;
 	}
 
 	/* Check that link frequences for all the modes are in device tree */
-	fq = imx290_check_link_freqs(imx290);
+	fq = imx290_check_link_freqs(imx290, &ep);
 	if (fq) {
 		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
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
@@ -1108,7 +1108,7 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
 
-	v4l2_fwnode_endpoint_free(&imx290->ep);
+	v4l2_fwnode_endpoint_free(&ep);
 
 	return 0;
 
@@ -1118,7 +1118,7 @@ static int imx290_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&imx290->ctrls);
 	mutex_destroy(&imx290->lock);
 free_err:
-	v4l2_fwnode_endpoint_free(&imx290->ep);
+	v4l2_fwnode_endpoint_free(&ep);
 
 	return ret;
 }
-- 
2.17.1

