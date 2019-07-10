Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0537364656
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 14:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfGJMhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 08:37:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34974 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfGJMhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 08:37:31 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E62731C;
        Wed, 10 Jul 2019 14:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562762249;
        bh=rXmN/ZP1jKpCFxlT6ZQ3Ed8fIwsZSXGnqlc6PGjlcj8=;
        h=From:To:Cc:Subject:Date:From;
        b=PkSp2haE0jZmJsqrMwJ1rxk/Cok03Jt0bZbMIZ/5e19X7e8fcGgs51dJLcALqvA41
         pAADSeNs5/vyArQ7vyiqt+t1x9fpsh4GaUv4Dg1kTyXlMn3fWBwaGULBbfBJ0KNOY5
         BprfaHdPT11bG4UE3ij96ouj+9QPnuVv5rNOY2C0=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: i2c: adv748x: Convert to new i2c device probe()
Date:   Wed, 10 Jul 2019 13:37:19 +0100
Message-Id: <20190710123719.3376-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The I2C core framework provides a simplified probe framework from commit
b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").

Convert the ADV748x to utilise this simplfied i2c driver registration.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 097e94279cf7..ae2b6eb93e09 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -677,8 +677,7 @@ static void adv748x_dt_cleanup(struct adv748x_state *state)
 		of_node_put(state->endpoints[i]);
 }
 
-static int adv748x_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int adv748x_probe(struct i2c_client *client)
 {
 	struct adv748x_state *state;
 	int ret;
@@ -806,13 +805,6 @@ static int adv748x_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id adv748x_id[] = {
-	{ "adv7481", 0 },
-	{ "adv7482", 0 },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, adv748x_id);
-
 static const struct of_device_id adv748x_of_table[] = {
 	{ .compatible = "adi,adv7481", },
 	{ .compatible = "adi,adv7482", },
@@ -825,9 +817,8 @@ static struct i2c_driver adv748x_driver = {
 		.name = "adv748x",
 		.of_match_table = adv748x_of_table,
 	},
-	.probe = adv748x_probe,
+	.probe_new = adv748x_probe,
 	.remove = adv748x_remove,
-	.id_table = adv748x_id,
 };
 
 module_i2c_driver(adv748x_driver);
-- 
2.20.1

