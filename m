Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92ACB4C3A1F
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbiBYAIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbiBYAIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED3A14562A
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:19 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id n14so2020626wrq.7
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CrSfojKpUTMrs7bPseKEErlNvIzPQpe6PW4G21xUlQw=;
        b=nf3ZPuygGzA9MvMqBvdm41tqsy1t0uDlteLZXIafcYEvyBlLhBHts6iNDDlOBcmllO
         IgqC3onyBuMjDCvWqmekNQvnl51iwFuaV7LkjAoyTNFQLDDpXYjnKsUsrdl/RWlyLB/x
         m0mJqjqIhX+oQQyVzXc5jl1MgbBHi4KxpvpHO+QK6HYqAXbGCsW09+4WD4tv8FFxjYPT
         W/doFg00VCLcRAOeTVQ3qHIKK+mhcB+vyqWRyksgwZBKuwZB3Zpm/4Q/kfcaLkhmQebw
         nLVzPktU7BqtOMxq/GQ3a+xOTT7xQZol51mUuk9RQMxufkVIp/WuO1ePGo/2QNK6WXpl
         9URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CrSfojKpUTMrs7bPseKEErlNvIzPQpe6PW4G21xUlQw=;
        b=yOX6QZFpDrMufruRLo9f+zVL29auwirQl4LD1IVIHdcxlfY/Ke2Fz6fOIdh+0Ve+UG
         A134ty95maFMMyGerGq58NhImgA+puwrwCtTPBHHhKkAuLCuLcZLt3h0ttzSKMh0q6BU
         MHudBveErIFtJbnoMQN+2Gbq7kSX9L1MHGTqaSkNrD4wJ0p24ZX7YbyTV+CuCtYT5owl
         yDOC/BH8O3uy7kSAXc9r5yE9V7PvY7CpFlB1sN0LK743BqeYKD1jfxpWn4u5OIvqL+bg
         PN7WJqFqM9PTgkaSI/C8s+BlgD71v6L3kJAMpJd0rhVLVAQFY1QBglUZbQnEqpBTdjcz
         n1GQ==
X-Gm-Message-State: AOAM532G+Ls4vUxnwf/hn4UdwH7qS+uS6twc1sJuqoUzxHvxhV8ZBSTO
        SSItdTNDrgMYhG2WZ9hhbQi5jtS0vg0C1w==
X-Google-Smtp-Source: ABdhPJw2QHy/gqoaQFpeOfwFTicZDse7wdhvuwf0+OUgJMyOZ2rKH+ZRTEPYKWVBsZcry8gejKY09g==
X-Received: by 2002:adf:9f0f:0:b0:1ed:c016:dfe5 with SMTP id l15-20020adf9f0f000000b001edc016dfe5mr3904497wrf.675.1645747698377;
        Thu, 24 Feb 2022 16:08:18 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:18 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 04/11] media: i2c: Provide ov7251_check_hwcfg()
Date:   Fri, 25 Feb 2022 00:07:46 +0000
Message-Id: <20220225000753.511996-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the endpoint checking from .probe() to a dedicated function,
and additionally check that the firmware provided link frequencies
are a match for those supported by the driver. Store the index to the
matching link frequency so it can be easily identified later.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Switched to use unsigned int (Sakari)
	- Dropped the checks for bus_type and number of data lanes (Sakari)
	- Fixed the double-loop break (Dave)
	- Stored the index to the configured link frequency so it can be used
	later on.

 drivers/media/i2c/ov7251.c | 78 +++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d6fe574cb9e0..613b2c80a2a8 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -60,6 +60,11 @@ struct ov7251_mode_info {
 	struct v4l2_fract timeperframe;
 };
 
+enum supported_link_freqs {
+	OV7251_LINK_FREQ_240_MHZ,
+	OV7251_NUM_SUPPORTED_LINK_FREQS
+};
+
 struct ov7251 {
 	struct i2c_client *i2c_client;
 	struct device *dev;
@@ -75,6 +80,7 @@ struct ov7251 {
 	struct regulator *core_regulator;
 	struct regulator *analog_regulator;
 
+	enum supported_link_freqs link_freq_idx;
 	const struct ov7251_mode_info *current_mode;
 
 	struct v4l2_ctrl_handler ctrls;
@@ -1255,10 +1261,61 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
 	.pad = &ov7251_subdev_pad_ops,
 };
 
+static int ov7251_check_hwcfg(struct ov7251 *ov7251)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *endpoint;
+	bool freq_found = false;
+	unsigned int i, j;
+	int ret;
+
+	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!endpoint)
+		return -EPROBE_DEFER; /* could be provided by cio2-bridge */
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return dev_err_probe(ov7251->dev, ret,
+				     "parsing endpoint node failed\n");
+
+	if (!bus_cfg.nr_of_link_frequencies) {
+		dev_err(ov7251->dev, "no link frequencies defined\n");
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
+		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
+			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
+				freq_found = true;
+				break;
+			}
+
+		if (freq_found)
+			break;
+	}
+
+	if (i == bus_cfg.nr_of_link_frequencies) {
+		dev_err(ov7251->dev, "no supported link freq found\n");
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
+
+	ov7251->link_freq_idx = i;
+
+out_free_bus_cfg:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
 static int ov7251_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct fwnode_handle *endpoint;
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
 	int ret;
@@ -1270,24 +1327,9 @@ static int ov7251_probe(struct i2c_client *client)
 	ov7251->i2c_client = client;
 	ov7251->dev = dev;
 
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
-	if (!endpoint) {
-		dev_err(dev, "endpoint node not found\n");
-		return -EINVAL;
-	}
-
-	ret = v4l2_fwnode_endpoint_parse(endpoint, &ov7251->ep);
-	fwnode_handle_put(endpoint);
-	if (ret < 0) {
-		dev_err(dev, "parsing endpoint node failed\n");
+	ret = ov7251_check_hwcfg(ov7251);
+	if (ret)
 		return ret;
-	}
-
-	if (ov7251->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "invalid bus type (%u), must be CSI2 (%u)\n",
-			ov7251->ep.bus_type, V4L2_MBUS_CSI2_DPHY);
-		return -EINVAL;
-	}
 
 	/* get system clock (xclk) */
 	ov7251->xclk = devm_clk_get(dev, "xclk");
-- 
2.25.1

