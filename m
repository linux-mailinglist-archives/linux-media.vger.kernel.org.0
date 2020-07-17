Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB06223C8E
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgGQN0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:26:02 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42619 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgGQN0B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:26:01 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E16A11C000C;
        Fri, 17 Jul 2020 13:25:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/13] media: i2c: ov5640: Initialize DVP polarities as default
Date:   Fri, 17 Jul 2020 15:28:57 +0200
Message-Id: <20200717132859.237120-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the bindings now updated to initialize the DVP synchronism
signals to the values reported by the datasheet, update the driver
to respect the same default values.

The driver works-around a documentation bug and reports the VSYNC
polarity control bit to be inverted. Regardless of the actual
value written to the hardware register, initialize the DVP configuration
to the defaults reported by the chip manual and the bindings document:

- VSYNC: active low
- HREF:	active low
- PCLK:	active high

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2fe4a7ac0592..012ef1df59aa 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1212,9 +1212,9 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 {
 	int ret;
 	unsigned int flags = sensor->ep.bus.parallel.flags;
-	u8 pclk_pol = 0;
+	u8 pclk_pol = 1;
 	u8 hsync_pol = 0;
-	u8 vsync_pol = 0;
+	u8 vsync_pol = 1;
 
 	/*
 	 * Note about parallel port configuration.
@@ -1229,9 +1229,9 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 	 * devicetree endpoint control lines properties.
 	 * If no endpoint control lines properties are set,
 	 * polarity will be as below:
-	 * - VSYNC:	active high
+	 * - VSYNC:	active low
 	 * - HREF:	active low
-	 * - PCLK:	active low
+	 * - PCLK:	active high
 	 */
 
 	if (on) {
@@ -1245,12 +1245,12 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 		 *		datasheet and hardware, 0 is active high
 		 *		and 1 is active low...)
 		 */
-		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-			pclk_pol = 1;
+		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
+			pclk_pol = 0;
 		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
 			hsync_pol = 1;
-		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-			vsync_pol = 1;
+		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
+			vsync_pol = 0;
 
 		ret = ov5640_write_reg(sensor,
 				       OV5640_REG_POLARITY_CTRL00,
-- 
2.27.0

