Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E61342249
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhCSQms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36899 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhCSQmR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:42:17 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4DCF9C0007;
        Fri, 19 Mar 2021 16:42:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/19] media: i2c: rdacm20: Enable noise immunity
Date:   Fri, 19 Mar 2021 17:41:43 +0100
Message-Id: <20210319164148.199192-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
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
index 2881e752efbe..554fd3b3ec3d 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -518,7 +518,19 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
 
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
 
 static const struct v4l2_subdev_core_ops rdacm20_core_ops = {
-- 
2.30.0

