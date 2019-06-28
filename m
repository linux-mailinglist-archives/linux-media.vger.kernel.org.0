Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCA359A65
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 14:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfF1MPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 08:15:33 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:51183 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfF1MPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 08:15:33 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N6KMR-1ielwM0j5F-016jEM; Fri, 28 Jun 2019 14:15:03 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>,
        Patrick Boettcher <pb@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Colin Ian King <colin.king@canonical.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] media: dib0700: fix link error for dibx000_i2c_set_speed
Date:   Fri, 28 Jun 2019 14:14:53 +0200
Message-Id: <20190628121501.1840412-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HON4n5fFrecoqodvQ+e/gJ5VhzHrIdn3pFXZ8e/NAv50eKrZz6y
 83FukMNmZZ2qrzfjd+y+jYUm8DwT2Y+ZREIHW3BXePoho77LeLeauo1sGEEWtfCuD5t490O
 GEeYs30vrOp9gVuwc/PfqpoO0QBEyt1+x8LyMBrsxIstho9pY6K+dPtRAJWLsVZcZESTigL
 9NMaGZsyzX0re0n8p9plw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cK7Nyvcq3gc=:CwNFs0u7kOB9DSqwm7+zck
 G5DiK0AlC1Ynt7PPjQ4OZayPdoO8HCZU05YnEJgkEaO8vJL19N9+REY+wqA+8Yu5rmfKtU6TU
 lLWzeJMWWhrE+x0K/bZq7RJj16kYpbsuVi+J8lP6jsgtYaJUJQc4pCl7kaN1NUK5KGemETY46
 zIfpbt5Esa0rXLIeo+QHUrkpsLV4BW4qaCwQV/6zEv1bYy5xTC81DQyp7vRcChMz5lPjUxEky
 kI3qxvEKTkkPeMzfFqoKvXrZdkzJcUTzGilLYLpCn942BcFzIWOmlu4Bmxs6vyV5p/C5T051R
 EJ7+mEEU17+DAyCf3dgD+znhMGg+xHxPR3rGms3ovL2vj0OiZVN6svr2zhbKhsVKDxLPSK13/
 1W1I/aGrS706UsI3GGXRl9EXetdrRBuNQF0o8TjxBhdFBp0zWiexDuEFe6E+pa+zh2G3VVeMS
 iJIQGSMl7IYBged6e0YEJUQaF8MUA3bE63x0FVh0xCwrKn8YvXDhXcFvab9WOKMOemQTt2bu0
 gsEIaW9Sh0sIKKJUZFsjOGAgQwvNR1Bg8fXYymcOTl9Gz9VR+23nhNdftuWfew8gOBHwjZooV
 KvlNxusSwmYQ7ymwEH8hoFxHpN29hktC3M612xP3KWDuuuT+WbQmceO/SFRE8IijdVrMtGSfg
 aC0TBwfk+L3Db2JWd1nhivhDtn60B2PI1wSuOlOYaCq3INWwFWvBcBKOpJyi7ueQBOLp8QSEG
 W2UK1SqwMHb95Dp2S3H9zlwfrvFf4IAon6xJ3g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When CONFIG_DVB_DIB9000 is disabled, we can still compile code that
now fails to link against dibx000_i2c_set_speed:

drivers/media/usb/dvb-usb/dib0700_devices.o: In function `dib01x0_pmu_update.constprop.7':
dib0700_devices.c:(.text.unlikely+0x1c9c): undefined reference to `dibx000_i2c_set_speed'

The call sites are both through dib01x0_pmu_update(), which gets passed
an 'i2c' pointer from dib9000_get_i2c_master(), which has returned
NULL. Checking this pointer seems to be a good idea anyway, and it avoids
the link failure in most cases.

Sean Young found another case that is not fixed by that, where certain
gcc versions leave an unused function in place that causes the link error,
but adding an explict IS_ENABLED() check also solves this.

Cc: Sean Young <sean@mess.org>
Fixes: b7f54910ce01 ("V4L/DVB (4647): Added module for DiB0700 based devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: add an IS_ENABLED() check as well.
---
 drivers/media/usb/dvb-usb/dib0700_devices.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 66d685065e06..ab7a100ec84f 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -2439,9 +2439,13 @@ static int dib9090_tuner_attach(struct dvb_usb_adapter *adap)
 		8, 0x0486,
 	};
 
+	if (!IS_ENABLED(CONFIG_DVB_DIB9000))
+		return -ENODEV;
 	if (dvb_attach(dib0090_fw_register, adap->fe_adap[0].fe, i2c, &dib9090_dib0090_config) == NULL)
 		return -ENODEV;
 	i2c = dib9000_get_i2c_master(adap->fe_adap[0].fe, DIBX000_I2C_INTERFACE_GPIO_1_2, 0);
+	if (!i2c)
+		return -ENODEV;
 	if (dib01x0_pmu_update(i2c, data_dib190, 10) != 0)
 		return -ENODEV;
 	dib0700_set_i2c_speed(adap->dev, 1500);
@@ -2517,10 +2521,14 @@ static int nim9090md_tuner_attach(struct dvb_usb_adapter *adap)
 		0, 0x00ef,
 		8, 0x0406,
 	};
+	if (!IS_ENABLED(CONFIG_DVB_DIB9000))
+		return -ENODEV;
 	i2c = dib9000_get_tuner_interface(adap->fe_adap[0].fe);
 	if (dvb_attach(dib0090_fw_register, adap->fe_adap[0].fe, i2c, &nim9090md_dib0090_config[0]) == NULL)
 		return -ENODEV;
 	i2c = dib9000_get_i2c_master(adap->fe_adap[0].fe, DIBX000_I2C_INTERFACE_GPIO_1_2, 0);
+	if (!i2c)
+		return -ENODEV;
 	if (dib01x0_pmu_update(i2c, data_dib190, 10) < 0)
 		return -ENODEV;
 
-- 
2.20.0

