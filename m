Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF13169CB2A
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 13:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjBTMlJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 07:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjBTMlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 07:41:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEDC1B561
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 04:41:07 -0800 (PST)
Received: from uno.homenet.telecomitalia.it (host-95-252-227-22.retail.telecomitalia.it [95.252.227.22])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8653AA49;
        Mon, 20 Feb 2023 13:41:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676896866;
        bh=rujmqGnJ/oR37BjpbMq5yAQrfqhHliE+cxkopZk4rrk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OIvDQhJVXSdT8rp1OF6Zf8A0IKyYrUwvKQ/Y4rCYbcx2+tEA22Oy14zuAvoe/k2hz
         1j5SBf7NRoldrDRC87tbVRmPC+FK6gmSH8OCDQXRkJ994jWgFwL5Hhk3+UdG6CmExo
         FzCxeVEZWsBwUjQCre3bmbymDLX4jUzuI2OyZzMk=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov5647: Use bus-locked i2c_transfer()
Date:   Mon, 20 Feb 2023 13:41:01 +0100
Message-Id: <20230220124101.1010317-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5647_read() functions calls i2c_master_send() and
i2c_master_read() in sequence. However this leaves space for other
clients to contend the bus and insert a unrelated transaction in between
the two calls.

Replace the two calls with a single i2c_transfer() one, that locks the
bus in between the transactions.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 0b88ac6dee41..a423ee8fe20c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -631,23 +631,29 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)

 static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
 {
-	unsigned char data_w[2] = { reg >> 8, reg & 0xff };
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	u8 buf[2] = { reg >> 8, reg & 0xff };
+	struct i2c_msg msg[2];
 	int ret;

-	ret = i2c_master_send(client, data_w, 2);
+	msg[0].addr = client->addr;
+	msg[0].flags = client->flags;
+	msg[0].buf = buf;
+	msg[0].len = sizeof(buf);
+
+	msg[1].addr = client->addr;
+	msg[1].flags = client->flags | I2C_M_RD;
+	msg[1].buf = buf;
+	msg[1].len = 1;
+
+	ret = i2c_transfer(client->adapter, msg, 2);
 	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
+		dev_err(&client->dev, "%s: i2c read error, reg: %x\n",
 			__func__, reg);
 		return ret;
 	}

-	ret = i2c_master_recv(client, val, 1);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c read error, reg: %x\n",
-				__func__, reg);
-		return ret;
-	}
+	*val = buf[0];

 	return 0;
 }
--
2.39.0

