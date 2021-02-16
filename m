Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B341C31CF50
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhBPRmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:42:47 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:56179 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbhBPRmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:21 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C74D4200004;
        Tue, 16 Feb 2021 17:41:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/16] media: i2c: rdacm2x: Fix wake up delay
Date:   Tue, 16 Feb 2021 18:41:37 +0100
Message-Id: <20210216174146.106639-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9271 chip manual prescribes a delay of 5 milliseconds
after the chip exists from low power state.

Adjust the required delay in the rdacm21 camera module and add it
to the rdacm20 that currently doesn't implement one.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 1 +
 drivers/media/i2c/rdacm21.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index ea30cc936531..39e4b4241870 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -460,6 +460,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	/* Verify communication with the MAX9271: ping to wakeup. */
 	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
 	i2c_smbus_read_byte(dev->serializer.client);
+	usleep_range(5000, 8000);
 
 	/* Serial link disabled during config as it needs a valid pixel clock. */
 	ret = max9271_set_serial_link(&dev->serializer, false);
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 179d107f494c..b22a2ca5340b 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -453,7 +453,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 	/* Verify communication with the MAX9271: ping to wakeup. */
 	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
 	i2c_smbus_read_byte(dev->serializer.client);
-	usleep_range(3000, 5000);
+	usleep_range(5000, 8000);
 
 	/* Enable reverse channel and disable the serial link. */
 	ret = max9271_set_serial_link(&dev->serializer, false);
-- 
2.30.0

