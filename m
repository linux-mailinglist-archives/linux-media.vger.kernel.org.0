Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E1331CF4E
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhBPRms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:42:48 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49305 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhBPRmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:25 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5DFDC200014;
        Tue, 16 Feb 2021 17:41:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] media: i2c: rdacm21: Re-work OV10640 initialization
Date:   Tue, 16 Feb 2021 18:41:39 +0100
Message-Id: <20210216174146.106639-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV10640 image sensor reset and powerdown on signals are controlled
by the embedded OV490 ISP. The current reset procedure does not respect
the 1 millisecond power-up delay and releases the reset signal before
the powerdown one.

Fix the OV10640 power up sequence by releasing the powerdown signal,
waiting the mandatory 1 millisecond power up delay and then releasing
the reset signal. The reset delay is not characterized in the chip
manual if not as "255 XVCLK + initialization". Wait for at least 3
milliseconds to guarantee the SCCB bus is available.

This commit fixes a sporadic start-up error triggered by a failure to
read the OV10640 chip ID:
rdacm21 8-0054: OV10640 ID mismatch: (0x01)

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index b22a2ca5340b..c420a6b96879 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -333,13 +333,15 @@ static int ov10640_initialize(struct rdacm21_device *dev)
 {
 	u8 val;
 
-	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
+	/* Power-up OV10640 by setting PWDNB and RESETB pins high. */
 	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
 	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
 	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
 	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
-	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
+
 	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
+	usleep_range(1500, 3000);
+	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
 	usleep_range(3000, 5000);
 
 	/* Read OV10640 ID to test communications. */
-- 
2.30.0

