Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B321B716B1E
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbjE3RbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbjE3RbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:01 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36751F3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30ae61354fbso2224580f8f.3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467845; x=1688059845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUThpILL4T/V94u7S3e1f/FLWPY1UKbhVsXY3sBoTvM=;
        b=kWNH+y9ZyNFRMDrxP2j1B18xVkLWKSxcZKOjaNbDjk2esJUXYVQcVxqohNPsZvADOA
         85Uwsytw94xHTbUolGqPZx9+JYlDbSSSlBwpf7C6KmP0mTfXWV7Ylsm+mZ2GA6rET3BF
         Y10+/cUWAclIzasjZ8+Tb4l7OE4cu40FvqJYSjiwTZZIRStQr+/5WxZrxZY5D4LhvTTx
         rLgJ8YYQk8Afdr4GJvegeZNGz77Og+4JvLQhIG6fmwMjgmApRdc1jMx5u22EzKw3hY4R
         JgUmCnlRPOXJo0cLUaf6bFJri+3lsqwFGAQGepupX4aJI6xWgLn3WpTcWNeNdR+ZX+SI
         jriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467845; x=1688059845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUThpILL4T/V94u7S3e1f/FLWPY1UKbhVsXY3sBoTvM=;
        b=NFv11VcMIKXf3I1kR1B30L93Je6OW+Ta3LQ/QPE6BqWhFLPARqUFqM3ivq9HGr82O9
         mfDJsoLQEV4meB5FRvLs6rT4CZdBeLR+cOvya2CbmRh7ythJiGneOnZmn0IsKoOxMgrP
         OIhPaXYFvtd+F8hmkaufD+R+FwvaWs4RHumoQ4jeIwImwyxQI8dfegfOxSkFClYPJEVn
         b9zCDDibjeCSaYPKMbHVXDNwfrFMiPPUdbcI3aPqeegIgWjg6Zpbua01YntyWKrvit00
         FdWt6jgfZuxCCCGZ8dInMOo3ejB8REaLruRsQ15zqfQPstoFqJnA7g6suUSVujdmikTB
         9BdQ==
X-Gm-Message-State: AC+VfDyk+RQDUhMVeMvFYsZBWuk/ixC4HYDxE7E5qQOk0GOggMtkoQIl
        S7kVsZ5QeLVcFh6k1B+R40XWkg==
X-Google-Smtp-Source: ACHHUZ4TvCLpRAjzLTHS5+42Go0XWDRlGJeuCvwmbQjSgRmgAodQ7zs/FN7Q3ItjXwdoY+XOM3O+KQ==
X-Received: by 2002:a5d:55cc:0:b0:30a:ebf6:b061 with SMTP id i12-20020a5d55cc000000b0030aebf6b061mr2332611wrw.60.1685467845780;
        Tue, 30 May 2023 10:30:45 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:45 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 15/21] media: i2c: imx258: Issue reset before starting streaming
Date:   Tue, 30 May 2023 18:29:54 +0100
Message-Id: <20230530173000.3060865-16-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Whilst not documented, register 0x0103 bit 0 is the soft
reset for the sensor, so send it before trying to configure
the sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 1e424058fcb9..7d6528f9ca4d 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -20,6 +20,8 @@
 #define IMX258_MODE_STANDBY		0x00
 #define IMX258_MODE_STREAMING		0x01
 
+#define IMX258_REG_RESET		0x0103
+
 /* Chip ID */
 #define IMX258_REG_CHIP_ID		0x0016
 #define IMX258_CHIP_ID			0x0258
@@ -1084,6 +1086,14 @@ static int imx258_start_streaming(struct imx258 *imx258)
 	const struct imx258_link_freq_config *link_freq_cfg;
 	int ret, link_freq_index;
 
+	ret = imx258_write_reg(imx258, IMX258_REG_RESET, IMX258_REG_VALUE_08BIT,
+			       0x01);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to reset sensor\n", __func__);
+		return ret;
+	}
+	usleep_range(10000, 15000);
+
 	/* Setup PLL */
 	link_freq_index = imx258->cur_mode->link_freq_index;
 	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
-- 
2.25.1

