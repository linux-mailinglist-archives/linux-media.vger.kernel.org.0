Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B4B719B4B
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 13:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjFALz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 07:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjFALz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 07:55:27 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36209134
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 04:54:41 -0700 (PDT)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 1 Jun 2023
 19:53:58 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
        <kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v3 1/3] media: rc: meson-ir: sort Meson IR Controller register macros
Date:   Thu, 1 Jun 2023 19:54:31 +0800
Message-ID: <20230601115433.21809-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601115433.21809-1-zelong.dong@amlogic.com>
References: <20230601115433.21809-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.69]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zelong Dong <zelong.dong@amlogic.com>

There are more registers to come in the next Meson IR Controller.
For defining clearly, sort register macros and let address and bit
macros as a set.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 49aa309d1a8c..6d77a8c33dc1 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -19,44 +19,35 @@
 
 #define DRIVER_NAME		"meson-ir"
 
-/* valid on all Meson platforms */
 #define IR_DEC_LDR_ACTIVE	0x00
 #define IR_DEC_LDR_IDLE		0x04
 #define IR_DEC_LDR_REPEAT	0x08
 #define IR_DEC_BIT_0		0x0c
 #define IR_DEC_REG0		0x10
+#define REG0_RATE_MASK		GENMASK(11, 0)
 #define IR_DEC_FRAME		0x14
 #define IR_DEC_STATUS		0x18
+#define STATUS_IR_DEC_IN	BIT(8)
 #define IR_DEC_REG1		0x1c
-/* only available on Meson 8b and newer */
-#define IR_DEC_REG2		0x20
-
-#define REG0_RATE_MASK		GENMASK(11, 0)
-
-#define DECODE_MODE_NEC		0x0
-#define DECODE_MODE_RAW		0x2
-
-/* Meson 6b uses REG1 to configure the mode */
+#define REG1_TIME_IV_MASK	GENMASK(28, 16)
+#define REG1_ENABLE		BIT(15)
 #define REG1_MODE_MASK		GENMASK(8, 7)
 #define REG1_MODE_SHIFT		7
-
-/* Meson 8b / GXBB use REG2 to configure the mode */
+#define REG1_IRQSEL_MASK	GENMASK(3, 2)
+#define REG1_RESET		BIT(0)
+/* The following regs are only available on Meson 8b and newer */
+#define IR_DEC_REG2		0x20
 #define REG2_MODE_MASK		GENMASK(3, 0)
 #define REG2_MODE_SHIFT		0
 
-#define REG1_TIME_IV_MASK	GENMASK(28, 16)
+#define DECODE_MODE_NEC		0x0
+#define DECODE_MODE_RAW		0x2
 
-#define REG1_IRQSEL_MASK	GENMASK(3, 2)
 #define REG1_IRQSEL_NEC_MODE	0
 #define REG1_IRQSEL_RISE_FALL	1
 #define REG1_IRQSEL_FALL	2
 #define REG1_IRQSEL_RISE	3
 
-#define REG1_RESET		BIT(0)
-#define REG1_ENABLE		BIT(15)
-
-#define STATUS_IR_DEC_IN	BIT(8)
-
 #define MESON_TRATE		10	/* us */
 
 struct meson_ir {
-- 
2.35.1

