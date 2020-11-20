Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEBFE2BAFD9
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 17:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgKTQPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 11:15:42 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:63361 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgKTQPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 11:15:41 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 690A640044;
        Fri, 20 Nov 2020 16:15:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: rdacm20: Enable GPIO1 explicitly
Date:   Fri, 20 Nov 2020 17:15:29 +0100
Message-Id: <20201120161529.236447-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
References: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9271 GPIO1 line that controls the sensor reset is by default
enabled after a serializer chip reset.

As rdacm20 does not go through an explicit serializer reset, make sure
GPIO1 is enabled to make the camera module driver more robust.

Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 1ed928c4ca70..16bcb764b0e0 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -487,9 +487,18 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	 * Reset the sensor by cycling the OV10635 reset signal connected to the
 	 * MAX9271 GPIO1 and verify communication with the OV10635.
 	 */
-	max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	ret = max9271_enable_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
+
+	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
 	usleep_range(10000, 15000);
-	max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
+
+	ret = max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	if (ret)
+		return ret;
 	usleep_range(10000, 15000);

 again:
--
2.29.1

