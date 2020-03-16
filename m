Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77382186E89
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731844AbgCPP0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41045 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731731AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lH-L2; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055A-Kt; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 07/18] media: allegro: fix reset if WAKEUP has not been set properly
Date:   Mon, 16 Mar 2020 16:26:27 +0100
Message-Id: <20200316152638.19457-8-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316152638.19457-1-m.tretter@pengutronix.de>
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Zynq UltraScale+ Devices Register Reference states that the WAKEUP
bit "should be set to 0 after the MCU sleep status bit gets back to 0."
If this is not done, the mcu is not going to sleep on reset and fail the
reset.

Set WAKEUP to 0 before triggering a reset to make sure that the reset is
successful.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v1 -> v2: None
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 87592419ec84..de50405ba907 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -1990,6 +1990,14 @@ static int allegro_mcu_reset(struct allegro_dev *dev)
 {
 	int err;
 
+	/*
+	 * Ensure that the AL5_MCU_WAKEUP bit is set to 0 otherwise the mcu
+	 * does not go to sleep after the reset.
+	 */
+	err = regmap_write(dev->regmap, AL5_MCU_WAKEUP, 0);
+	if (err)
+		return err;
+
 	err = regmap_write(dev->regmap,
 			   AL5_MCU_RESET_MODE, AL5_MCU_RESET_MODE_SLEEP);
 	if (err < 0)
-- 
2.20.1

