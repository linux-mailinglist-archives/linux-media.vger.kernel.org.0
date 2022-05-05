Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A1251CC72
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386546AbiEEXH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386537AbiEEXH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:07:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A255EDC5
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i5so7855977wrc.13
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p991ONNHq387h8+TGxMod6UhA12KlgGHC0aWWdyIYEk=;
        b=ZIeT9NqqYiqSTvqUSSd4/FrqoPifRIBzrqpmeOPsN5bLMwtKlQCpMxPOhwn04lnoCM
         qHTZ7FKpCJ2khISrW0CBP4LcWRa8bEWhFRQ1cy74LUDSEEZuW+oz5bulPztQHxEwL5+8
         N8gSVxWm6u/Gq8PIdRHbqtXG1/+7FVw1Tp3ubzicHCI8hodCkGF+vpia1ffCwcdEIL/o
         QO2cEtAhnSaZCZHM/G9dycWxjUESRX2VJFYqhAuz65MNyPks/ar5T+puM3Uk9B3uiP3g
         nEsv0Y0h9FmaOjP+bpfuDDDyyqeAOXAaH6AYYFw+x4Cw26nDZrMI20qITNFoOr/aHvRZ
         qkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p991ONNHq387h8+TGxMod6UhA12KlgGHC0aWWdyIYEk=;
        b=lRUdwoqT74LBcaXUTn0HLRf1o5sOaVYMyFjJa25MvWitm0pl+1Hcfw40D2g6h6Mmw3
         jdndZw7nAABc71+9QP+XKsYFODxMev8Zgnn1UD9wAve/Qq/GvDF+o3B/zEUn1I/74vOJ
         eAWIFjDOa4+dwVUfGyTmXjZCzS+/ghLayn65RbymiYy/BXp5pa5/FA6HW8QZUXEG+Nq6
         THBTKBLvnzUjfMLp1/MNzPsMjDpSqpxZ0fTfskHk47f6LOaEjPN7M2b+x4AbA4s+lH7k
         f+Yj+ozni3y4q3FA/jNts32Vty3C0yYldckwAFRJC4SlX1Y+doEpRCg9KoWWPJ1qnqN4
         dKEA==
X-Gm-Message-State: AOAM530EsxJ3hmWKoqFGilZHluPWSim4SzZgHRqBscxVywcZgLmr7bTu
        ZrIQq+BgbvP3HYuQiau7J5kUsSLNXE0=
X-Google-Smtp-Source: ABdhPJwdVDLsubdklz1U2XwW5OrrruoOs5k81m0wwbMZZBwnSyGRttuOoDGc9hQmC4okIgUjBhFvaA==
X-Received: by 2002:a5d:4307:0:b0:207:9f82:e238 with SMTP id h7-20020a5d4307000000b002079f82e238mr312859wrq.430.1651791855568;
        Thu, 05 May 2022 16:04:15 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:15 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 04/15] media: i2c: Provide ov7251_check_hwcfg()
Date:   Fri,  6 May 2022 00:03:51 +0100
Message-Id: <20220505230402.449643-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
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
Changes in v4:

	- Used dev_err_probe() to set ret (Andy)

Changes in v3:

	- Replaced freq_found variable (Andy)

Changes in v2:

	- Switched to use unsigned int (Sakari)
	- Dropped the checks for bus_type and number of data lanes (Sakari)
	- Fixed the double-loop break (Dave)
	- Stored the index to the configured link frequency so it can be used
	later on.

 drivers/media/i2c/ov7251.c | 75 +++++++++++++++++++++++++++++---------
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d6fe574cb9e0..177b99eef3a5 100644
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
@@ -1255,10 +1261,58 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
 	.pad = &ov7251_subdev_pad_ops,
 };
 
+static int ov7251_check_hwcfg(struct ov7251 *ov7251)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *endpoint;
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
+		ret = dev_err_probe(ov7251->dev, -EINVAL,
+				    "no link frequencies defined\n");
+		goto out_free_bus_cfg;
+	}
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
+		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
+			if (bus_cfg.link_frequencies[i] == link_freq[j])
+				break;
+
+		if (j < ARRAY_SIZE(link_freq))
+			break;
+	}
+
+	if (i == bus_cfg.nr_of_link_frequencies) {
+		ret = dev_err_probe(ov7251->dev, -EINVAL,
+				    "no supported link freq found\n");
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
@@ -1270,24 +1324,9 @@ static int ov7251_probe(struct i2c_client *client)
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

