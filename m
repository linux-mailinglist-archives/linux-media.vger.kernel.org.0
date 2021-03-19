Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB7A34223B
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhCSQmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:22 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:32797 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhCSQmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:42:11 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 58E4AC0008;
        Fri, 19 Mar 2021 16:42:07 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 12/19] media: i2c: rdacm21: Fix OV10640 powerup
Date:   Fri, 19 Mar 2021 17:41:41 +0100
Message-Id: <20210319164148.199192-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV10640 image sensor powerdown signal is controlled by the first
line of the OV490 GPIO pad #1, but the pad #0 identifier
OV490_GPIO_OUTPUT_VALUE0 was erroneously used. As a result the image
sensor powerdown signal was never asserted but was left floating and
kept high by an internal pull-up resistor, causing sporadic failures
during the image sensor startup phase.

Fix this by using the correct GPIO pad identifier and wait the mandatory
1.5 millisecond delay after the powerup lane is asserted. The reset
delay is not characterized in the chip manual if not as "255 XVCLK +
initialization". Wait for at least 3 milliseconds to guarantee the SCCB
bus is available.

While at it also fix the reset sequence, as the reset line was released
before the powerdown one, and the line was not cycled.

This commit fixes a sporadic start-up error triggered by a failure to
read the OV10640 chip ID:
rdacm21 8-0054: OV10640 ID mismatch: (0x01)

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 875bec9f7904..3f38c465b348 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -318,13 +318,19 @@ static int ov10640_initialize(struct rdacm21_device *dev)
 {
 	u8 val;
 
-	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
+	/* Enable GPIO0#0 (reset) and GPIO1#0 (pwdn) as output lines. */
 	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
 	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
 	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
 	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
+
+	/* Power up OV10640 and then reset it. */
+	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE1, OV490_SPWDN0);
+	usleep_range(1500, 3000);
+
+	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, 0x00);
+	usleep_range(1500, 3000);
 	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
-	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
 	usleep_range(3000, 5000);
 
 	/* Read OV10640 ID to test communications. */
-- 
2.30.0

