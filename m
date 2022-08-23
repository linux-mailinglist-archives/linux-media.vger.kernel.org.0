Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E9E59EB1D
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiHWSfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbiHWSfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:35:15 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA5B110566
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 09:57:39 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A21768026A;
        Tue, 23 Aug 2022 18:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1661273857;
        bh=BDeCVftnuCgXaxiPhFize3amFk9iVRmyIRCcJbNw7+s=;
        h=From:To:Cc:Subject:Date:From;
        b=w+JeclIMDwK+Re3Hes/O0DK8sJWCPyQyqVZ7r1WTbBm1UD/l+5hp1VptnigrnoTXU
         QsY50mU2u0OGYcarGHZEOikiNzb/n4zXLcFK4w8HmnYHp5fug1l6qe7nMw35KrI/jk
         MSySeiDRJX2gLTr1Js9hDbXOG+CcKPAA8rnmd407rC9kA5BybECzR00+rLlbI0CbLx
         uQV0GvTPajN579lTPzVUG+ng6xmpnAhHwajQgsf0ncVWnCvze1tmHGrzFDwcAacFum
         VgtDNIhHG3uuVhPU1nzX0m1vIe9Le5EJe9EscYBqhDtuUIDR1XAxQ4fCYruFz1jjMq
         Q06fHgDGtxoHQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] media: mt9p031: Increase post-reset delay
Date:   Tue, 23 Aug 2022 18:57:23 +0200
Message-Id: <20220823165723.276156-1-marex@denx.de>
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
 drivers/media/i2c/mt9p031.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 45f7b5e52bc39..7c83be5b9ec9d 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -307,6 +307,7 @@ static inline int mt9p031_pll_disable(struct mt9p031 *mt9p031)
 
 static int mt9p031_power_on(struct mt9p031 *mt9p031)
 {
+	unsigned long delay;
 	int ret;
 
 	/* Ensure RESET_BAR is active */
@@ -334,7 +335,9 @@ static int mt9p031_power_on(struct mt9p031 *mt9p031)
 	/* Now RESET_BAR must be high */
 	if (mt9p031->reset) {
 		gpiod_set_value(mt9p031->reset, 0);
-		usleep_range(1000, 2000);
+		/* Wait 850000 EXTCLK cycles before de-asserting reset. */
+		delay = DIV_ROUND_UP(850000 * 1000, clk_get_rate(mt9p031->clk));
+		msleep(delay);
 	}
 
 	return 0;
-- 
2.35.1

