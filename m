Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE81E760228
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 00:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGXWWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jul 2023 18:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGXWWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jul 2023 18:22:16 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500241FEE
        for <linux-media@vger.kernel.org>; Mon, 24 Jul 2023 15:21:50 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id EAEA286783;
        Tue, 25 Jul 2023 00:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690237284;
        bh=7u54zciyZBK2i8n7hvBtfvkaAfp2Qey633K8E4lTNXM=;
        h=From:To:Cc:Subject:Date:From;
        b=RwAZxAXh1TA10MyDwhH3Rva+SSRKuLfBUUWnRxR7rqpptDilvV7E7mZCfCsJ7kWPp
         FY+kQTovQrKNRJsTrZxefzzQKIHP/vJc3BKvw0ubOVyoR/9IVksonfK0peRpAzwqTg
         wjrz2+mfaBbzxKQ6txCywtaVpkHRJzoyMG29mQy4ozXhn1BHcwoiI6jO2hOQw1X+3B
         6slagFAE3qnuNe+Mzp32vuXDBtLlfYHNsJXoj0UPCww31qnmnAfx7O91N983PHsXBi
         f0+IyijiOgDzPUqwRuO9DIE2kXKnBI/9UJ/K0wVBpdXXiqphEPbNxaoHlNAUK5OSdT
         70dvhIMrQC6/w==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH] media: ov5640: Fix initial RESETB state and annotate timings
Date:   Tue, 25 Jul 2023 00:21:16 +0200
Message-Id: <20230724222116.162555-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initial state of RESETB input signal of OV5640 should be
asserted, i.e. the sensor should be in reset. This is not the
case, make it so.

Since the subsequent assertion of RESETB signal is no longer
necessary and the timing of the power sequencing could be
slightly adjusted, add annotations to the delays which match
OV5640 datasheet rev. 2.03, both:
  figure 2-3 power up timing with internal DVDD
  figure 2-4 power up timing with external DVDD source

The 5..10ms delay between PWDN assertion and RESETB assertion
is not even documented in the power sequencing diagram, and
with this reset fix, it is no longer even necessary.

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Reported-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: linux-media@vger.kernel.org
---
 drivers/media/i2c/ov5640.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 7c065c39082dd..74b58380b5e69 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2452,16 +2452,13 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
 static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 {
 	if (sensor->pwdn_gpio) {
-		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
 
 		/* camera power cycle */
 		ov5640_power(sensor, false);
-		usleep_range(5000, 10000);
+		usleep_range(5000, 10000);	/* t2 */
 		ov5640_power(sensor, true);
-		usleep_range(5000, 10000);
-
-		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
-		usleep_range(1000, 2000);
+		usleep_range(1000, 2000);	/* t3 */
 
 		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 	} else {
@@ -2469,7 +2466,7 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
 				 OV5640_REG_SYS_CTRL0_SW_RST);
 	}
-	usleep_range(20000, 25000);
+	usleep_range(20000, 25000);	/* t4 */
 
 	/*
 	 * software standby: allows registers programming;
-- 
2.40.1

