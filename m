Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B251B59EEF2
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 00:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbiHWWW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 18:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbiHWWWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 18:22:55 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F92886FE4
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 15:22:54 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 206D683FFF;
        Wed, 24 Aug 2022 00:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1661293372;
        bh=hOiSZugmoF9jVzqkdQoziypvzu4DRa2HP/VGKDMlXpQ=;
        h=From:To:Cc:Subject:Date:From;
        b=qhQIg6qbG9c/J289FI6jX6RP+u8Rxg3qJnpMcL5Mmo0N6SLFhLUtzrSCHXAtGnrgB
         z42Ou9dSRFOA7d/VYUv9a3jA09igg0DSJYpg4ngzo/CQR4TJ4pSGsb2zo0PFJLME3t
         yp/DH8uhpo25vFWSbsCRmjfK5oo89yXURQwOcOnryHrh9WXpZEKKIuSmtPPdalpqol
         3fFbYK3XjdHfBMkGxiVIWYN6H5kbwdtHSJSe/A2ruCR8wvKi2zGFIeatOpvHRqPSBP
         sKeTfsDr2aIRkpdvM0jDc6OwfFyjPMQTBRcdEZzqyGUorcJK5tr+kx/peP2o/jXX3a
         JnKbg/50fBKNg==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2] media: mt9p031: Increase post-reset delay
Date:   Wed, 24 Aug 2022 00:22:16 +0200
Message-Id: <20220823222216.411656-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MT9P006 sensor driver sporadically fails to probe because the sensor
responds with a NACK condition to I2C address on the bus during an attempt
to read the sensor MT9P031_CHIP_VERSION register in mt9p031_registered().

Neither the MT9P006 nor MT9P031 datasheets are clear on reset signal timing.
Older MT9M034 [1] datasheet provides those timing figures in Appendix-A and
indicates it is necessary to wait 850000 EXTCLK cycles before starting any
I2C communication.

Add such a delay, which does make the sporadic I2C NACK go away, so it is
likely similar constraint applies to this sensor.

[1] https://www.onsemi.com/pdf/datasheet/mt9m034-d.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
---
V2: - In case clk_get_rate() returns 0, use slowest supported clock
      to avoid division by zero
---
 drivers/media/i2c/mt9p031.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 45f7b5e52bc39..5f5caafe56887 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -307,6 +307,7 @@ static inline int mt9p031_pll_disable(struct mt9p031 *mt9p031)
 
 static int mt9p031_power_on(struct mt9p031 *mt9p031)
 {
+	unsigned long rate, delay;
 	int ret;
 
 	/* Ensure RESET_BAR is active */
@@ -334,7 +335,12 @@ static int mt9p031_power_on(struct mt9p031 *mt9p031)
 	/* Now RESET_BAR must be high */
 	if (mt9p031->reset) {
 		gpiod_set_value(mt9p031->reset, 0);
-		usleep_range(1000, 2000);
+		/* Wait 850000 EXTCLK cycles before de-asserting reset. */
+		rate = clk_get_rate(mt9p031->clk);
+		if (!rate)
+			rate = 6000000;	/* Slowest supported clock, 6 MHz */
+		delay = DIV_ROUND_UP(850000 * 1000, rate);
+		msleep(delay);
 	}
 
 	return 0;
-- 
2.35.1

