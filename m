Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0733973A7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 14:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbhFAM6e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 08:58:34 -0400
Received: from mail.ispras.ru ([83.149.199.84]:54204 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233064AbhFAM6e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 08:58:34 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 4368A40755C4;
        Tue,  1 Jun 2021 12:56:50 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH v2] media: st_rc: Handle errors of clk_prepare_enable()
Date:   Tue,  1 Jun 2021 15:56:43 +0300
Message-Id: <20210601125643.26844-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hadle errors of clk_prepare_enable() in st_rc_hardware_init() and its
callers.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
v2: Add error loging (Sean Young)
---
 drivers/media/rc/st_rc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 3237fef5d502..d79d1e3996b2 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -157,8 +157,9 @@ static irqreturn_t st_rc_rx_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void st_rc_hardware_init(struct st_rc_device *dev)
+static int st_rc_hardware_init(struct st_rc_device *dev)
 {
+	int ret;
 	int baseclock, freqdiff;
 	unsigned int rx_max_symbol_per = MAX_SYMB_TIME;
 	unsigned int rx_sampling_freq_div;
@@ -166,7 +167,12 @@ static void st_rc_hardware_init(struct st_rc_device *dev)
 	/* Enable the IP */
 	reset_control_deassert(dev->rstc);
 
-	clk_prepare_enable(dev->sys_clock);
+	ret = clk_prepare_enable(dev->sys_clock);
+	if (ret) {
+		dev_err(dev->dev, "Failed to prepare/enable system clock\n");
+		return ret;
+	}
+
 	baseclock = clk_get_rate(dev->sys_clock);
 
 	/* IRB input pins are inverted internally from high to low. */
@@ -184,6 +190,8 @@ static void st_rc_hardware_init(struct st_rc_device *dev)
 	}
 
 	writel(rx_max_symbol_per, dev->rx_base + IRB_MAX_SYM_PERIOD);
+
+	return 0;
 }
 
 static int st_rc_remove(struct platform_device *pdev)
@@ -287,7 +295,9 @@ static int st_rc_probe(struct platform_device *pdev)
 
 	rc_dev->dev = dev;
 	platform_set_drvdata(pdev, rc_dev);
-	st_rc_hardware_init(rc_dev);
+	ret = st_rc_hardware_init(rc_dev);
+	if (ret)
+		goto err;
 
 	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* rx sampling rate is 10Mhz */
@@ -359,6 +369,7 @@ static int st_rc_suspend(struct device *dev)
 
 static int st_rc_resume(struct device *dev)
 {
+	int ret;
 	struct st_rc_device *rc_dev = dev_get_drvdata(dev);
 	struct rc_dev	*rdev = rc_dev->rdev;
 
@@ -367,7 +378,10 @@ static int st_rc_resume(struct device *dev)
 		rc_dev->irq_wake = 0;
 	} else {
 		pinctrl_pm_select_default_state(dev);
-		st_rc_hardware_init(rc_dev);
+		ret = st_rc_hardware_init(rc_dev);
+		if (ret)
+			return ret;
+
 		if (rdev->users) {
 			writel(IRB_RX_INTS, rc_dev->rx_base + IRB_RX_INT_EN);
 			writel(0x01, rc_dev->rx_base + IRB_RX_EN);
-- 
2.26.2

