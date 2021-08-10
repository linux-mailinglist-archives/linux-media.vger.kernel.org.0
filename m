Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A163E7D80
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 18:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbhHJQaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 12:30:08 -0400
Received: from mail.ispras.ru ([83.149.199.84]:53482 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231573AbhHJQaH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 12:30:07 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 12A644076258;
        Tue, 10 Aug 2021 16:29:44 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH v2] media: atomisp: Fix error handling in probe
Date:   Tue, 10 Aug 2021 19:29:43 +0300
Message-Id: <20210810162943.19852-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There were several issues with handling errors in lm3554_probe():
- Probe did not set the error code when v4l2_ctrl_handler_init() failed.
- It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
  and media_entity_pads_init().
- It did not set the error code for failures of v4l2_ctrl_new_custom().
- Probe did not free resources in case of failures of
  atomisp_register_i2c_module().

The patch fixes all these issues.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
v2: Fix suggestions from Dan Carpenter:
    - Rename labels for handling errors to clarify their meaning.
    - Set the error code for failures of v4l2_ctrl_new_custom().
---
 .../media/atomisp/i2c/atomisp-lm3554.c        | 37 ++++++++++++-------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 362ed44b4eff..e046489cd253 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -835,7 +835,6 @@ static int lm3554_probe(struct i2c_client *client)
 	int err = 0;
 	struct lm3554 *flash;
 	unsigned int i;
-	int ret;
 
 	flash = kzalloc(sizeof(*flash), GFP_KERNEL);
 	if (!flash)
@@ -844,7 +843,7 @@ static int lm3554_probe(struct i2c_client *client)
 	flash->pdata = lm3554_platform_data_func(client);
 	if (IS_ERR(flash->pdata)) {
 		err = PTR_ERR(flash->pdata);
-		goto fail1;
+		goto free_flash;
 	}
 
 	v4l2_i2c_subdev_init(&flash->sd, client, &lm3554_ops);
@@ -852,12 +851,12 @@ static int lm3554_probe(struct i2c_client *client)
 	flash->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	flash->mode = ATOMISP_FLASH_MODE_OFF;
 	flash->timeout = LM3554_MAX_TIMEOUT / LM3554_TIMEOUT_STEPSIZE - 1;
-	ret =
+	err =
 	    v4l2_ctrl_handler_init(&flash->ctrl_handler,
 				   ARRAY_SIZE(lm3554_controls));
-	if (ret) {
+	if (err) {
 		dev_err(&client->dev, "error initialize a ctrl_handler.\n");
-		goto fail3;
+		goto unregister_subdev;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
@@ -866,14 +865,15 @@ static int lm3554_probe(struct i2c_client *client)
 
 	if (flash->ctrl_handler.error) {
 		dev_err(&client->dev, "ctrl_handler error.\n");
-		goto fail3;
+		err = flash->ctrl_handler.error;
+		goto free_handler;
 	}
 
 	flash->sd.ctrl_handler = &flash->ctrl_handler;
 	err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
 	if (err) {
 		dev_err(&client->dev, "error initialize a media entity.\n");
-		goto fail2;
+		goto free_handler;
 	}
 
 	flash->sd.entity.function = MEDIA_ENT_F_FLASH;
@@ -884,16 +884,27 @@ static int lm3554_probe(struct i2c_client *client)
 
 	err = lm3554_gpio_init(client);
 	if (err) {
-		dev_err(&client->dev, "gpio request/direction_output fail");
-		goto fail3;
+		dev_err(&client->dev, "gpio request/direction_output fail.\n");
+		goto cleanup_media;
+	}
+
+	err = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
+	if (err) {
+		dev_err(&client->dev, "fail to register atomisp i2c module.\n");
+		goto uninit_gpio;
 	}
-	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
-fail3:
+
+	return 0;
+
+uninit_gpio:
+	lm3554_gpio_uninit(client);
+cleanup_media:
 	media_entity_cleanup(&flash->sd.entity);
+free_handler:
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
-fail2:
+unregister_subdev:
 	v4l2_device_unregister_subdev(&flash->sd);
-fail1:
+free_flash:
 	kfree(flash);
 
 	return err;
-- 
2.26.2

