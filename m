Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC0E51B1F8
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355791AbiEDWed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379000AbiEDWe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12BC2D1DA
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p7-20020a05600c358700b00393e80c59daso3238415wmq.0
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q//Cu4YogdefU0EKJcTbOi9a92Qf7Ws9l0uO/SENgbc=;
        b=auv2J3yYnL1L41UECfImnXofbO2LvYaxl+pgS5/nH/FpNuBSPoEMXOko5uhI0WZHEQ
         OcReneKuFeAEaSJ+6w2Fy2Uw11D0UhESUo5zP2XyklBW0xDqYt3tOJudn68LUF2Yl5Ik
         4ajpW/jetXk7iRZUnPCZkBj+dlDYb3MNBaqQXbkTX8FZ/lkHVLTPP/FVBr7tI5yBXc1u
         U54ghnV4T5ChBDKkDjKw0aiP70LiOAI7D29ktaK4G0sDQUAvWx7gHb+SVikasjudCiUC
         eQF2uUKXgnfsdlcJB+UKeEwYkPUlQoIYJZsT99qLEoROgmLaQ4K3KnRHnoLCudxTBzlk
         U9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q//Cu4YogdefU0EKJcTbOi9a92Qf7Ws9l0uO/SENgbc=;
        b=m/yeSAbizrRD8Vj/iDEGdHRQL/BdmWV6kqQmWGFBCJpDPMLbx7KlNMnHyY+Jvcc0Mr
         ovCIShVPUJuoohCaj9xvzJvD9xWGKO7w//N4GLLAbIGiLgP78sKqoxY7T7m4zA4vF6ZZ
         aEnHrLLS00ewOh76Cwmn686Jw2dsWZI9L/vkmfToe1UNVAMFnopYiYKLUbYBN6856Yq7
         6Ib1/QCzZ4Ul52OR8aGxiGwx2ZgqgHzszLUrDm4BGTcKvK0jbuf7dcRN2b2oknoELYeB
         0RKBXHaZchebwEQTjCRfGIMirIadlJdeYEqRQEet+mpCd0D8c79Jp4R46t+YRhXtSRrT
         2Tlw==
X-Gm-Message-State: AOAM530phg2LdJEp/Ch5dnxBl6GUUG+ZdU7oCqQb3meniKL1Z01O1yA7
        KerjRyVaJx2szEfpOG/XKVpKjy/kE2M=
X-Google-Smtp-Source: ABdhPJwDn98qgDStIRppS/LOCqxMWIZuHeCh6ffjUka3rlFxjG68ZdKvhY0TbKmqFalWZZh4/QsNLQ==
X-Received: by 2002:a05:600c:3048:b0:394:436b:76b6 with SMTP id n8-20020a05600c304800b00394436b76b6mr1450415wmh.63.1651703444344;
        Wed, 04 May 2022 15:30:44 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:44 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 04/15] media: i2c: Provide ov7251_check_hwcfg()
Date:   Wed,  4 May 2022 23:30:16 +0100
Message-Id: <20220504223027.3480287-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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
Changes in v3:

	- Replaced freq_found variable (Andy)

Changes in v2:

	- Switched to use unsigned int (Sakari)
	- Dropped the checks for bus_type and number of data lanes (Sakari)
	- Fixed the double-loop break (Dave)
	- Stored the index to the configured link frequency so it can be used
	later on.

 drivers/media/i2c/ov7251.c | 77 +++++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d6fe574cb9e0..f1965c8adbd7 100644
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
@@ -1255,10 +1261,60 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
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
+		ret = -EINVAL;
+		dev_err_probe(ov7251->dev, ret,
+			      "no link frequencies defined\n");
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
+		ret = -EINVAL;
+		dev_err_probe(ov7251->dev, ret,
+			      "no supported link freq found\n");
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
@@ -1270,24 +1326,9 @@ static int ov7251_probe(struct i2c_client *client)
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

