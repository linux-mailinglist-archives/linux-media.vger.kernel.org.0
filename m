Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E08069E5A4
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 18:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbjBURLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 12:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234598AbjBURLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 12:11:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F9216321
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 09:11:26 -0800 (PST)
Received: from uno.homenet.telecomitalia.it (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 305EC6E0;
        Tue, 21 Feb 2023 18:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676999471;
        bh=J94INdMsM4g8iTa+KyiNHUaPiuzZHbLQb6cGRS6bfAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dlzuOY5YFrnTJWcKtggK5niVlBFadu7TPQtJOe4vOrVYAs2AW6hPXI+D5nC5s5u+7
         2ikRW3ej+b475gqXRLcNGgUpTV1LR9QMuLVlsunZMKKV56If/NZQ/90zJOlT1LQJ9W
         QJPpElnljZIaWwWORXjIcTh6X359tEQyttHUPFJE=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v2 2/2] media: i2c: ov5647: Use bus-locked i2c_transfer()
Date:   Tue, 21 Feb 2023 18:10:48 +0100
Message-Id: <20230221171048.203042-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
References: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
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
clients to contend the bus and insert an unrelated transaction in between
the two calls.

Replace the two calls with a single i2c_transfer() one, that locks the
bus in between the transactions.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index bde287e00c87..ca7079bb7589 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -629,23 +629,29 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 
 static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
 {
-	unsigned char data_w[2] = { reg >> 8, reg & 0xff };
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	u8 buf[2] = { reg >> 8, reg & 0xff };
+	struct i2c_msg msg[2];
 	int ret;
 
-	ret = i2c_master_send(client, data_w, 2);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-			__func__, reg);
-		return ret;
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
+	if (ret != 2) {
+		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
+			__func__, reg, ret);
+		return ret >= 0 ? -EINVAL : ret;
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

