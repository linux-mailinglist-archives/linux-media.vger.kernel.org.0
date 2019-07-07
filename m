Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D25961799
	for <lists+linux-media@lfdr.de>; Sun,  7 Jul 2019 23:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfGGVJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jul 2019 17:09:26 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:38738 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfGGVJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jul 2019 17:09:26 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id A5A16713FA8; Sun,  7 Jul 2019 22:59:36 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] [media] af9035: issue an error message when i2c stuff fails
Date:   Sun,  7 Jul 2019 22:59:33 +0200
Message-Id: <20190707205933.23059-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of failing silent give a hint what went wrong.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index de52309eaaab..f5701fab192c 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -211,13 +211,19 @@ static int af9035_add_i2c_dev(struct dvb_usb_device *d, const char *type,
 
 	/* register I2C device */
 	client = i2c_new_device(adapter, &board_info);
-	if (client == NULL || client->dev.driver == NULL) {
+	if (client == NULL) {
+		dev_err(&intf->dev, "failed to register i2c device\n");
+		ret = -ENODEV;
+		goto err;
+	} else if (client->dev.driver == NULL) {
+		dev_err(&intf->dev, "no driver for i2c device (type=%s)\n", type);
 		ret = -ENODEV;
 		goto err;
 	}
 
 	/* increase I2C driver usage count */
 	if (!try_module_get(client->dev.driver->owner)) {
+		dev_err(&intf->dev, "failed to get module for i2c driver\n");
 		i2c_unregister_device(client);
 		ret = -ENODEV;
 		goto err;
-- 
2.20.1

