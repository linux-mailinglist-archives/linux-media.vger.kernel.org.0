Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEA435C212
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240201AbhDLJih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:38:37 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37361 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbhDLJgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:36:37 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4AE2520001C;
        Mon, 12 Apr 2021 09:34:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/17] media: i2c: rdacm20: Enable noise immunity
Date:   Mon, 12 Apr 2021 11:34:45 +0200
Message-Id: <20210412093451.14198-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable the noise immunity threshold at the end of the rdacm20
initialization routine.

The rdacm20 camera module has been so far tested with a startup
delay that allowed the embedded MCU to program the serializer. If
the initialization routine is run before the MCU programs the
serializer and the image sensor and their addresses gets changed
by the rdacm20 driver it is required to manually enable the noise
immunity threshold to make the communication on the control channel
more reliable.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index c1a717153303..5e0314a2b1ca 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -539,7 +539,19 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 
 	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
 
-	return 0;
+	/*
+	 * Set reverse channel high threshold to increase noise immunity.
+	 *
+	 * This should be compensated by increasing the reverse channel
+	 * amplitude on the remote deserializer side.
+	 *
+	 * TODO Inspect the embedded MCU programming sequence to make sure
+	 * there are no conflicts with the configuration applied here.
+	 *
+	 * TODO Clarify the embedded MCU startup delay to avoid write
+	 * collisions on the I2C bus.
+	 */
+	return max9271_set_high_threshold(&dev->serializer, true);
 }
 
 static int rdacm20_probe(struct i2c_client *client)
-- 
2.31.1

