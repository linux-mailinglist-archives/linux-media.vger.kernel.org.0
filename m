Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1B442379D
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 07:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhJFFvl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Oct 2021 01:51:41 -0400
Received: from ni.piap.pl ([195.187.100.5]:44250 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235061AbhJFFvl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 01:51:41 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Add ADV7610 support for adv7604 driver.
Date:   Wed, 06 Oct 2021 07:49:48 +0200
Message-ID: <m3wnmqn1mr.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ADV7610 is another HDMI receiver chip, very similar to
the ADV7611.

Also: print chip names in upper case.
Fix an error message claiming that no ADV761x has been found,
while in reality a chip different than requested (though still
supported) may have been found.
Tested on TinyRex BaseBoard Lite.

Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 122e1fdccd96..4d7a19e6b8f1 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -41,7 +41,7 @@ static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-2)");
 
-MODULE_DESCRIPTION("Analog Devices ADV7604 video decoder driver");
+MODULE_DESCRIPTION("Analog Devices ADV7604/10/11/12 video decoder driver");
 MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com>");
 MODULE_AUTHOR("Mats Randgaard <mats.randgaard@cisco.com>");
 MODULE_LICENSE("GPL");
@@ -77,7 +77,7 @@ MODULE_LICENSE("GPL");
 
 enum adv76xx_type {
 	ADV7604,
-	ADV7611,
+	ADV7611, // including ADV7610
 	ADV7612,
 };
 
@@ -3176,6 +3176,7 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
 
 static const struct i2c_device_id adv76xx_i2c_id[] = {
 	{ "adv7604", (kernel_ulong_t)&adv76xx_chip_info[ADV7604] },
+	{ "adv7610", (kernel_ulong_t)&adv76xx_chip_info[ADV7611] },
 	{ "adv7611", (kernel_ulong_t)&adv76xx_chip_info[ADV7611] },
 	{ "adv7612", (kernel_ulong_t)&adv76xx_chip_info[ADV7612] },
 	{ }
@@ -3183,6 +3184,7 @@ static const struct i2c_device_id adv76xx_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, adv76xx_i2c_id);
 
 static const struct of_device_id adv76xx_of_id[] __maybe_unused = {
+	{ .compatible = "adi,adv7610", .data = &adv76xx_chip_info[ADV7611] },
 	{ .compatible = "adi,adv7611", .data = &adv76xx_chip_info[ADV7611] },
 	{ .compatible = "adi,adv7612", .data = &adv76xx_chip_info[ADV7612] },
 	{ }
@@ -3500,7 +3502,7 @@ static int adv76xx_probe(struct i2c_client *client,
 			return -ENODEV;
 		}
 		if (val != 0x68) {
-			v4l2_err(sd, "not an adv7604 on address 0x%x\n",
+			v4l2_err(sd, "not an ADV7604 on address 0x%x\n",
 					client->addr << 1);
 			return -ENODEV;
 		}
@@ -3525,7 +3527,8 @@ static int adv76xx_probe(struct i2c_client *client,
 		val |= val2;
 		if ((state->info->type == ADV7611 && val != 0x2051) ||
 			(state->info->type == ADV7612 && val != 0x2041)) {
-			v4l2_err(sd, "not an adv761x on address 0x%x\n",
+			v4l2_err(sd, "not an %s on address 0x%x\n",
+				 state->info->type == ADV7611 ? "ADV7610/11" : "ADV7612",
 					client->addr << 1);
 			return -ENODEV;
 		}

-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
