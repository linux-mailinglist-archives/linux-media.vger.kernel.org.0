Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94E233B372
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhCONP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:27 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53705 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhCONO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:14:58 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2AABBFF815;
        Mon, 15 Mar 2021 13:14:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/18] media: i2c: rdacm20: Enable noise immunity
Date:   Mon, 15 Mar 2021 14:14:56 +0100
Message-Id: <20210315131512.133720-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
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
 drivers/media/i2c/rdacm20.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 90eb73f0e6e9..f7fd5ae955d0 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -541,7 +541,13 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 
 	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
 
-	return 0;
+	/*
+	 * Set reverse channel high threshold to increase noise immunity.
+	 *
+	 * This should be compensated by increasing the reverse channel
+	 * amplitude on the remote deserializer side.
+	 */
+	return max9271_set_high_threshold(&dev->serializer, true);
 }
 
 static int rdacm20_probe(struct i2c_client *client)
-- 
2.30.0

