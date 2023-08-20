Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5CED781CD9
	for <lists+linux-media@lfdr.de>; Sun, 20 Aug 2023 10:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjHTIBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Aug 2023 04:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjHTIBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Aug 2023 04:01:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19C0F4230;
        Sun, 20 Aug 2023 00:58:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="173381905"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Aug 2023 16:58:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDAB2417528E;
        Sun, 20 Aug 2023 16:58:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: i2c: video-i2c: Convert enum->pointer for data in the match tables
Date:   Sun, 20 Aug 2023 08:58:46 +0100
Message-Id: <20230820075846.51592-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert enum->pointer for data in the match tables, so that
device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
bus type match support added to it.

Replace enum->struct *video_i2c_chip for data in the match table. Simplify
the probe() by replacing device_get_match_data() and ID lookup for
retrieving data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/video-i2c.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 537ebd9fa8d7..178bd06cc2ed 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -759,7 +759,6 @@ static void video_i2c_release(struct video_device *vdev)
 
 static int video_i2c_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct video_i2c_data *data;
 	struct v4l2_device *v4l2_dev;
 	struct vb2_queue *queue;
@@ -769,11 +768,8 @@ static int video_i2c_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	if (dev_fwnode(&client->dev))
-		data->chip = device_get_match_data(&client->dev);
-	else if (id)
-		data->chip = &video_i2c_chip[id->driver_data];
-	else
+	data->chip = i2c_get_match_data(client);
+	if (!data->chip)
 		goto error_free_device;
 
 	data->regmap = regmap_init_i2c(client, data->chip->regmap_config);
@@ -940,8 +936,8 @@ static const struct dev_pm_ops video_i2c_pm_ops = {
 };
 
 static const struct i2c_device_id video_i2c_id_table[] = {
-	{ "amg88xx", AMG88XX },
-	{ "mlx90640", MLX90640 },
+	{ "amg88xx", (kernel_ulong_t)&video_i2c_chip[AMG88XX] },
+	{ "mlx90640", (kernel_ulong_t)&video_i2c_chip[MLX90640] },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, video_i2c_id_table);
-- 
2.25.1

