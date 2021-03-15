Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC3D33B386
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCONPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:36 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:57337 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhCONPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:25 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 885A9FF814;
        Mon, 15 Mar 2021 13:15:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/18] media: i2c: rdacm21: Fix OV10640 powerdown
Date:   Mon, 15 Mar 2021 14:15:05 +0100
Message-Id: <20210315131512.133720-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV10640 image sensor powerdown signal is controlled by the first
line of the OV490 GPIO pad #1, but the pad #0 identifier
OV490_GPIO_OUTPUT_VALUE0 was erroneously used. As a result the image
sensor powerdown signal was never asserted but was kept high by an
internal pull-up resistor, causing sporadic failures during the
image sensor startup phase.

Fix this by using the correct GPIO pad identifier.

While at it also fix the GPIO signal handling sequence, as the reset
line was released before the powerdown one, and introduce the correct
delays in between the two operations.

Wait the mandatory 1 millisecond delay after the powerup lane is
asserted. The reset delay is not characterized in the chip manual if
not as "255 XVCLK + initialization". Wait for at least 3 milliseconds
to guarantee the SCCB bus is available.

This commit fixes a sporadic start-up error triggered by a failure to
read the OV10640 chip ID:
rdacm21 8-0054: OV10640 ID mismatch: (0x01)

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 7bce55adfd7c..50a9b0d8255d 100644
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
+
+	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE1, OV490_SPWDN0);
+	usleep_range(1500, 3000);
 	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
-	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
 	usleep_range(3000, 5000);
 
 	/* Read OV10640 ID to test communications. */
-- 
2.30.0

