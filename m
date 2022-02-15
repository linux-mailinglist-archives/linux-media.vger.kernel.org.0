Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C854B7B00
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243039AbiBOXIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbiBOXIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:06 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C31E7673
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:55 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id k1so496572wrd.8
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P434KImp5liNoIFLNLhSQYwe4ebiOCGmzd94xVyT5uY=;
        b=oeN8qhkqjrAya6/RJNBj3N2mCi01Xsj7V32wf77jzxkV58g9Zwb3mL2LV1HjN28ywh
         3spiohF85EiOeqfOKUOM1jJQhLzGxPVqsbAIPATC4QFR8NDRoZnCsWrJygxmdZyJENJE
         Cikc+BRK2zpEkeyApPxHLGc05lSdi85vx1VQytgwICXJuEPCEOOKt76NdhLMhQOJHO0F
         YBGnnMWrpY5vrx5ORtjzuLWE1igsqRP3prbOIEF8CTmK02NcazVpFNg9gIs19eSjCKZL
         DwYuVEDCV5J1p4/TVNuQ/UzypywvmcvAfHG7iPTcYCX31OjfqKxR358aCHWeY08rEDnL
         /dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P434KImp5liNoIFLNLhSQYwe4ebiOCGmzd94xVyT5uY=;
        b=qfeS8t35PFKkohCaO749OpEbYpNUw0hVo5q66TzJ8jibFMYLujRW8ICuT2qhZSZfhD
         Mv32t+CyQ1+c1TbE1KNr+9kBs2lJSCnYfnAuSz0I0hJdCAYhLJpCJ1S3BhiO7yNuKCIz
         geJzfrmhTcOfFgkcKERZx9rdMHNDGXtj3wNZIFb+nrbbDViRvqTLwGhvLMviWERThcAv
         +b/VkH0pVNKMA/zA2FN/wZBtBSJbU1gVB4QXzWXoDhubTqPpefTVse3OIGyAiCb3vktM
         BZ4FwOjgELo1Nab60tqqZSJhTOcRDdPDVHwzBgC3CyJ+cFh4N83HxsvcvcCBuwxdJ7Ld
         g4xQ==
X-Gm-Message-State: AOAM530vg6g05672SSMHnWQDODKGVsRgaz71NsHugEgXCbI4OhkTj7qS
        7BCJ6ssoIfQ0b9HS/3aRB41CtA3ZzdGexw==
X-Google-Smtp-Source: ABdhPJyrD9RKCgOQx/G+DUKMVqSdPm4YDzFF/ntUo/SEL0qk9BBCw2zE0ogfyVx2XAO9WBv3M10s0A==
X-Received: by 2002:adf:9f4a:0:b0:1e3:1c28:c298 with SMTP id f10-20020adf9f4a000000b001e31c28c298mr138686wrg.233.1644966473739;
        Tue, 15 Feb 2022 15:07:53 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:53 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 04/10] media: i2c: Provide ov7251_check_hwcfg()
Date:   Tue, 15 Feb 2022 23:07:31 +0000
Message-Id: <20220215230737.1870630-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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
are a match for those supported by the driver. Finally, return
-EPROBE_DEFER if the endpoint is not available, as it could be built
by the ipu3-cio2 driver if that probes later.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov7251.c | 84 ++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d6fe574cb9e0..5c5f7a15a640 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1255,10 +1255,73 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
 	.pad = &ov7251_subdev_pad_ops,
 };
 
+static int ov7251_check_hwcfg(struct ov7251 *ov7251)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *endpoint;
+	bool freq_found;
+	int i, j;
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
+	if (bus_cfg.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		ret = -EINVAL;
+		dev_err(ov7251->dev, "invalid bus type (%u), must be (%u)\n",
+			bus_cfg.bus_type, V4L2_MBUS_CSI2_DPHY);
+		goto out_free_bus_cfg;
+	}
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
+		dev_err(ov7251->dev, "only a 1-lane CSI2 config is supported");
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
+
+	if (!bus_cfg.nr_of_link_frequencies) {
+		dev_err(ov7251->dev, "no link frequencies defined\n");
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
+
+	freq_found = false;
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
+		if (freq_found)
+			break;
+
+		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
+			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
+				freq_found = true;
+				break;
+			}
+	}
+
+	if (i == bus_cfg.nr_of_link_frequencies) {
+		dev_err(ov7251->dev, "no supported link freq found\n");
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
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
@@ -1270,24 +1333,9 @@ static int ov7251_probe(struct i2c_client *client)
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

