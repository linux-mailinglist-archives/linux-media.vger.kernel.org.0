Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D5035C1FE
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241262AbhDLJhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:37:33 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:58373 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240692AbhDLJfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:35:00 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 20D4C20001A;
        Mon, 12 Apr 2021 09:34:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 09/17] media: i2c: rdacm21: Fix OV10640 powerup
Date:   Mon, 12 Apr 2021 11:34:43 +0200
Message-Id: <20210412093451.14198-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
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
index 6be8ce130e78..7c0a4a84340a 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -333,13 +333,19 @@ static int ov10640_initialize(struct rdacm21_device *dev)
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
2.31.1

