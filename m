Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC37932144B
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 11:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhBVKoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 05:44:13 -0500
Received: from gofer.mess.org ([88.97.38.141]:54829 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230138AbhBVKoM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 05:44:12 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 53F21C6480; Mon, 22 Feb 2021 10:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613990610; bh=l29aVxnxfxzqtcg2MM8RZ5w3zkSqUCbfa7eGqNUFfsw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Z94cm1KKml1u/krMtG/QyZiLoZsfBN8Shl7vMhO8KFzGB8HVVDZ6+a/QLt62gVaG/
         tl9LMmg+2Sql6pFM1Re1W2vkenRtiCAKK1c6wE/zSfmsrviyCKnih0xB3oDcnurLFr
         L5OUGJnaIDgBptg1PI7Fp9K9do5V7KJB8Wjw7jxAuiG46thkiv8JuGOjExrcxgff1N
         p4EPHxqU/M5CIRk272H9DffUzFa9d+Rp/xy5qKZrmVT7tkqmUMWNNmRoN3DnxHoKo8
         mL1KBIBiJP/eK61vsf77XcVEOo4u/e3+CycZU5S4oLD5xAYnl099hHvNqcYXD/t9rN
         lJCH4e/v87Rng==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Matthias Reichl <hias@horus.com>,
        =?UTF-8?q?Juan=20Jes=C3=BAs=20Garc=C3=ADa=20de=20Soria?= 
        <skandalfo@gmail.com>
Subject: [PATCH 4/6] media: ite-cir: carrier and duty cycle can be set via ioctl
Date:   Mon, 22 Feb 2021 10:43:27 +0000
Message-Id: <3cbd3f7f50d64bae20ae4f583a0402956e1c8591.1613989288.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613989288.git.sean@mess.org>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The lirc ioctls should be used for this, not module parameters.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index c5c7631849d0..748788a43da5 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -33,26 +33,6 @@
 
 /* module parameters */
 
-/* low limit for RX carrier freq, Hz, 0 for no RX demodulation */
-static int rx_low_carrier_freq;
-module_param(rx_low_carrier_freq, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(rx_low_carrier_freq, "Override low RX carrier frequency, Hz, 0 for no RX demodulation");
-
-/* high limit for RX carrier freq, Hz, 0 for no RX demodulation */
-static int rx_high_carrier_freq;
-module_param(rx_high_carrier_freq, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(rx_high_carrier_freq, "Override high RX carrier frequency, Hz, 0 for no RX demodulation");
-
-/* override tx carrier frequency */
-static int tx_carrier_freq;
-module_param(tx_carrier_freq, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(tx_carrier_freq, "Override TX carrier frequency, Hz");
-
-/* override tx duty cycle */
-static int tx_duty_cycle;
-module_param(tx_duty_cycle, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(tx_duty_cycle, "Override TX duty cycle, 1-100");
-
 /* override default sample period */
 static long sample_period;
 module_param(sample_period, long, S_IRUGO | S_IWUSR);
@@ -1410,18 +1390,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	if (sample_period > 0)
 		itdev->params.sample_period = sample_period;
 
-	if (tx_carrier_freq > 0)
-		itdev->params.tx_carrier_freq = tx_carrier_freq;
-
-	if (tx_duty_cycle > 0 && tx_duty_cycle <= 100)
-		itdev->params.tx_duty_cycle = tx_duty_cycle;
-
-	if (rx_low_carrier_freq > 0)
-		itdev->params.rx_low_carrier_freq = rx_low_carrier_freq;
-
-	if (rx_high_carrier_freq > 0)
-		itdev->params.rx_high_carrier_freq = rx_high_carrier_freq;
-
 	/* set up hardware initial state */
 	itdev->params.init_hardware(itdev);
 
-- 
2.29.2

