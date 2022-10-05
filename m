Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92CB45F5778
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiJEP3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiJEP24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:56 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6FD61709
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:55 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b4so19544597wrs.1
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zlo94kx4d/0h4pXbHO90YkVJN9vv7NJ7f1xqV+w4aSk=;
        b=KFWC/4eYIFbRKVqKYeSpjXdMxe8bbzsgmkCvNXOTZxlaHJRhNtAmg025qHpy01gUxY
         LshgslbbW7zoGivy+zhuZs0YSKsY7hAGVbFmSbhVjKYOZ6mkDniwkFC33dx1ONTIqSbk
         1ELDv5tkLMDi1kiYlht7+THObyTOLl2fhkUberKKWkqFv8z9fniR/FBv/zxyHUrQUZIu
         2OWWAPeL7L/xzwezBQVeOahgG1oThXs7eQzPLzw+UozG4p3BYfiFYBs3l/y7WELKdQwd
         0SUr/B6rQKa2KebKqCChJNs0mnyelGhdYWY4gQ42gk5p100qPvAxGham5CEfdxexqExh
         dCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zlo94kx4d/0h4pXbHO90YkVJN9vv7NJ7f1xqV+w4aSk=;
        b=NAC4GyUtu/j+4TWXqus0mSIFL3lROyViF5gQclcUaE1M2rAPDpmO1C8s1lOmdtfGLe
         YTA9Z+8ZypJKnBLI3agzzCYS+s6enDoXxWW8LmnHJ1b09iFksGsYR+33Bz+JzIe8sTv6
         r0YNOb7EwXndiA0190YFLsZwlPbY+MezWorJYj7XdZdPGFEEPMbbzKOkcIhPp4Vka7Nw
         Zde4oCFF0s+Brwf0GBt3EIaBxi0sES6CcO14BvaQWAjRf81mY0UwhLHPQosat2eZe03i
         my+ampLmdT8QRQIW40F7m0PtEPhzyKKT7PB7w0/4QSJEF4XNDPyMkG/CwgKoJAYWhd7n
         vUFg==
X-Gm-Message-State: ACrzQf1ioTBpmMNRoJik+Uagy/88fyz+5ux0JzWE+2GlwmfxIcM3b9Cr
        EgUb8nnp7JvtQXaGM1vH12Y6mA==
X-Google-Smtp-Source: AMsMyM7L809sxZHq+IW2V016tulXRpQFYEM1C3I6vpQFyGdZm2spAMBAFEQT4BwhBYu4yfLMA35x+w==
X-Received: by 2002:a05:6000:1f81:b0:22c:c692:5c49 with SMTP id bw1-20020a0560001f8100b0022cc6925c49mr194276wrb.630.1664983733614;
        Wed, 05 Oct 2022 08:28:53 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:53 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 08/16] media: i2c: ov9282: Add selection for CSI2 clock mode
Date:   Wed,  5 Oct 2022 16:28:01 +0100
Message-Id: <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor supports either having the CSI2 clock lane free
running, or gated when there is no packet to transmit.
The driver only selected gated (non-continuous) clock mode.

Add code to allow fwnode to configure whether the clock is
gated or free running.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index abb1223c0260..334b31af34a4 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -46,6 +46,9 @@
 /* Group hold register */
 #define OV9282_REG_HOLD		0x3308
 
+#define OV9282_REG_MIPI_CTRL00	0x4800
+#define OV9282_GATED_CLOCK	BIT(5)
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -138,6 +141,7 @@ struct ov9282 {
 	struct clk *inclk;
 	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
+	bool noncontinuous_clock;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *hblank_ctrl;
 	struct v4l2_ctrl *vblank_ctrl;
@@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
 	{0x4601, 0x04},
 	{0x470f, 0x00},
 	{0x4f07, 0x00},
-	{0x4800, 0x20},
 	{0x5000, 0x9f},
 	{0x5001, 0x00},
 	{0x5e00, 0x00},
@@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 		return ret;
 	}
 
+	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
+			       ov9282->noncontinuous_clock ?
+					OV9282_GATED_CLOCK : 0);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
+		return ret;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
 	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
@@ -861,6 +872,9 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	if (ret)
 		return ret;
 
+	ov9282->noncontinuous_clock =
+		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
 		dev_err(ov9282->dev,
 			"number of CSI2 data lanes %d is not supported",
-- 
2.34.1

