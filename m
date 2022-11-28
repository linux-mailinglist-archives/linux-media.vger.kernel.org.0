Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90FF663AD9D
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 17:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbiK1QX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 11:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbiK1QXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 11:23:10 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528E024BF1
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:09 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q7so16816903wrr.8
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Tv/pFhgevsl9Hu0zmbLfmBjTOF9KQSurh2+NHp5DA=;
        b=ADOctLLB3qfGtoFM1BsNGENK9Ly6U59mumtdiZ02DMG29xoJvxKqlN+ScwX5+0e3VL
         byk1QpmBeKrn4UmbzFbr2CL7+wWPTFkb4JLjFX8BNkfGrhaJq6eHEqMfkHYw1/fkRkSj
         An2ejdawPoflAUonkRhqXOwoqqYQfXt/DwdntM4ll4GBN6WHFr1zW4RBLAoGos2GyPaA
         wdue8sTpNNP8nsHFOiTEk7OqiK5518HAbRpoisZH0UJElnI4H3P2GcygYfhv26pfY0Qd
         sVOubjbjgym92WuwHlQ/8sTbSu7tP5Fndo8UzBw13SQKAPLQwjWmZ59yt03f7RXt+mIc
         WiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9Tv/pFhgevsl9Hu0zmbLfmBjTOF9KQSurh2+NHp5DA=;
        b=ISxBccxyKTyaGfXve+PfviPRljoVEu2ThBBgcx60PDGF1TbOK6tf2SnUVcsRueFvnp
         6ip91KbmGKuvPbQMKmctXD2SYSbYKHNk+E419pCuwEod/GKZERhuxIRkAnvINZlyY/VJ
         ieQtiPYOHKXnWs/zSDeewhRzMSNDKMLB7Z0E5TNvZk4EK1EV1BSWnGSENlwLbLzjqkLZ
         dqhQakMcmjLCpX/EwfPk09FXmXbC7TotsTjECIn0OigritXCbu4Q4nTsAlKb+rtVWd3Q
         wlbpuaYQ1FKdkG6C6zj04tW2m4ZLwnw6WUSAaFosfRJFS+Um6mokqXAvM9PC1MsXtxTJ
         hh2A==
X-Gm-Message-State: ANoB5pnE+akbDQP+YoTSCgTO5YTWMGngZEJb8pRaaI5VN6ByZTL0pmKz
        Bb4MaKB1LtdGSlnjhtVAaKoXEw==
X-Google-Smtp-Source: AA0mqf7Caw79R6fuhS0qnP0ccrEdqzES2mHAOZ8dHT6+bfLnEsYtMIGEct43HJAVA0NKtbZP3jwR7A==
X-Received: by 2002:a5d:4946:0:b0:241:f7b9:7c05 with SMTP id r6-20020a5d4946000000b00241f7b97c05mr14792231wrs.528.1669652587893;
        Mon, 28 Nov 2022 08:23:07 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id o15-20020a5d474f000000b002421a8f4fa6sm2353530wrs.92.2022.11.28.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:23:07 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 3/3] media: i2c: ov9282: Add missing clk_disable_unprepare to error path
Date:   Mon, 28 Nov 2022 16:22:49 +0000
Message-Id: <20221128162249.536455-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128162249.536455-1-dave.stevenson@raspberrypi.com>
References: <20221128162249.536455-1-dave.stevenson@raspberrypi.com>
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

If ov9282_power_on failed the I2C write, it returned without releasing
clocks or regulators. Fix this.

Fixes: 6f7def3d8a65 ("media: i2c: ov9282: Add selection for CSI2 clock mode")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 94e18da55a05..38b8d33799d5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1253,11 +1253,13 @@ static int ov9282_power_on(struct device *dev)
 					OV9282_GATED_CLOCK : 0);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
-		return ret;
+		goto error_clk;
 	}
 
 	return 0;
 
+error_clk:
+	clk_disable_unprepare(ov9282->inclk);
 error_reset:
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
-- 
2.34.1

