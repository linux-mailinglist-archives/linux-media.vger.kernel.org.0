Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE64D70734
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 19:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731329AbfGVR0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 13:26:09 -0400
Received: from sauhun.de ([88.99.104.3]:42116 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731307AbfGVR0I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:08 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 983614A1493;
        Mon, 22 Jul 2019 19:26:06 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] media: dvb-frontends: mn88473: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:25:58 +0200
Message-Id: <20190722172604.3572-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
References: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
ERRPTR which we use in error handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.

 drivers/media/dvb-frontends/mn88473.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88473.c b/drivers/media/dvb-frontends/mn88473.c
index 08118b38533b..71cedce6c7d0 100644
--- a/drivers/media/dvb-frontends/mn88473.c
+++ b/drivers/media/dvb-frontends/mn88473.c
@@ -657,9 +657,9 @@ static int mn88473_probe(struct i2c_client *client,
 	 * Also, register bank 2 do not support sequential I/O. Only single
 	 * register write or read is allowed to that bank.
 	 */
-	dev->client[1] = i2c_new_dummy(client->adapter, 0x1a);
-	if (dev->client[1] == NULL) {
-		ret = -ENODEV;
+	dev->client[1] = i2c_new_dummy_device(client->adapter, 0x1a);
+	if (IS_ERR(dev->client[1])) {
+		ret = PTR_ERR(dev->client[1]);
 		dev_err(&client->dev, "I2C registration failed\n");
 		if (ret)
 			goto err_regmap_0_regmap_exit;
@@ -671,9 +671,9 @@ static int mn88473_probe(struct i2c_client *client,
 	}
 	i2c_set_clientdata(dev->client[1], dev);
 
-	dev->client[2] = i2c_new_dummy(client->adapter, 0x1c);
-	if (dev->client[2] == NULL) {
-		ret = -ENODEV;
+	dev->client[2] = i2c_new_dummy_device(client->adapter, 0x1c);
+	if (IS_ERR(dev->client[2])) {
+		ret = PTR_ERR(dev->client[2]);
 		dev_err(&client->dev, "2nd I2C registration failed\n");
 		if (ret)
 			goto err_regmap_1_regmap_exit;
-- 
2.20.1

