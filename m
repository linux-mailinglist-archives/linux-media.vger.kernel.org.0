Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559FA45CCE5
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351141AbhKXTQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:52778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351101AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E63461055;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=aYMpgarbsAIo/Gs3IZ3+7TXpCUVheX2ETh/dnhTLa+o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uxPegxTMoJDWt4HPx2kiw6tOrVWKUKqw31nOwt5zrDG6FddWBuhAFuE+sQRX4jJRA
         mYp8IEgBUykVuC0GdY5pYCPUIWkUaQO1jcGbgKEk/8vpML54ByjBOKAwO/C4J75Gmt
         +j4rptpWsSs9kX3ZISd7Ad4KzpPJzj1n9o+dGqKT71qhxC4pBJBRZu1n4kK0nLwhza
         8oA2WFLxhK0GlcCV8vkvg+kZArArhTFM//QG47K1ipVQmeRcy+VYE3Oc/th1o+HowX
         372lGv8fIv/XSeKVFng/+uj6JaI6veQi6QPRmrtd8rvBMc2V/nFKltaoWbi6kmSq4z
         Nx+6xpgnqoMvg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5S-JB; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 09/20] media: si470x: fix printk warnings with clang
Date:   Wed, 24 Nov 2021 20:13:12 +0100
Message-Id: <d1282497070b1051d6b111fbfe752efea08deec2.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clang doesn't like "%hu" on macros:

	drivers/media/radio/si470x/radio-si470x-i2c.c:414:4: error: format specifies type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
	drivers/media/radio/si470x/radio-si470x-i2c.c:417:4: error: format specifies type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]

So, just replace them with "%u".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/radio/si470x/radio-si470x-i2c.c | 4 ++--
 drivers/media/radio/si470x/radio-si470x-usb.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index a972c0705ac7..7ea7c6326f53 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -410,10 +410,10 @@ static int si470x_i2c_probe(struct i2c_client *client)
 			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
 	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
 		dev_warn(&client->dev,
-			"This driver is known to work with firmware version %hu,\n",
+			"This driver is known to work with firmware version %u,\n",
 			RADIO_FW_VERSION);
 		dev_warn(&client->dev,
-			"but the device has firmware version %hu.\n",
+			"but the device has firmware version %u.\n",
 			radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE);
 		version_warning = 1;
 	}
diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index 3f8634a46573..1e70e6971fe4 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -681,10 +681,10 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
 	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
 		dev_warn(&intf->dev,
-			"This driver is known to work with firmware version %hu,\n",
+			"This driver is known to work with firmware version %u,\n",
 			RADIO_FW_VERSION);
 		dev_warn(&intf->dev,
-			"but the device has firmware version %hu.\n",
+			"but the device has firmware version %u.\n",
 			radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE);
 		version_warning = 1;
 	}
@@ -698,10 +698,10 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 			radio->software_version, radio->hardware_version);
 	if (radio->hardware_version < RADIO_HW_VERSION) {
 		dev_warn(&intf->dev,
-			"This driver is known to work with hardware version %hu,\n",
+			"This driver is known to work with hardware version %u,\n",
 			RADIO_HW_VERSION);
 		dev_warn(&intf->dev,
-			"but the device has hardware version %hu.\n",
+			"but the device has hardware version %u.\n",
 			radio->hardware_version);
 		version_warning = 1;
 	}
-- 
2.33.1

