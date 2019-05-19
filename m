Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD5E22870
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 20:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfESSrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 14:47:42 -0400
Received: from mail-out-3.itc.rwth-aachen.de ([134.130.5.48]:3720 "EHLO
        mail-out-3.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726970AbfESSrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 14:47:42 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BeBABgO+Fc/54agoZkHQEBBQEHBQGBZ?=
 =?us-ascii?q?YIRgTxZCoQIlHGTYocTCQEBAQEBAQEBAQcBLQIBAYRAAoI0IzgTAQMBAQUBAQE?=
 =?us-ascii?q?BBG0ohUsGIwQLAUYQJQImAgJXBg4FgyKCCwSpcXwziRuBDwkBgQIohnuEVoIWg?=
 =?us-ascii?q?TgMgx2FEYI9glgEiyYKghWHIJMzBwKBMl2SdiGMQYleLaFgAgICAgkCFYFmIYF?=
 =?us-ascii?q?XcYM7gkaODT4yfAwhjREBgSABAQ?=
X-IPAS-Result: =?us-ascii?q?A2BeBABgO+Fc/54agoZkHQEBBQEHBQGBZYIRgTxZCoQIlHG?=
 =?us-ascii?q?TYocTCQEBAQEBAQEBAQcBLQIBAYRAAoI0IzgTAQMBAQUBAQEBBG0ohUsGIwQLA?=
 =?us-ascii?q?UYQJQImAgJXBg4FgyKCCwSpcXwziRuBDwkBgQIohnuEVoIWgTgMgx2FEYI9glg?=
 =?us-ascii?q?EiyYKghWHIJMzBwKBMl2SdiGMQYleLaFgAgICAgkCFYFmIYFXcYM7gkaODT4yf?=
 =?us-ascii?q?AwhjREBgSABAQ?=
Received: from rwthex-w2-a.rwth-ad.de ([134.130.26.158])
  by mail-in-3.itc.rwth-aachen.de with ESMTP; 19 May 2019 13:19:01 +0200
Received: from pebbles.fritz.box (2.243.143.238) by rwthex-w2-a.rwth-ad.de
 (2a00:8a60:1:e500::26:158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 19
 May 2019 13:18:59 +0200
From:   =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
To:     <linux-media@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH v2 2/3] media: dvbsky: Remove duplicate error reporting for dvbsky_usb_generic_rw
Date:   Sun, 19 May 2019 13:18:30 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190519111831.26746-1-stefan.bruens@rwth-aachen.de>
References: <20190519111831.26746-1-stefan.bruens@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2.243.143.238]
X-ClientProxiedBy: rwthex-w3-a.rwth-ad.de (2a00:8a60:1:e500::26:162) To
 rwthex-w2-a.rwth-ad.de (2a00:8a60:1:e500::26:158)
Message-ID: <c6ebb00d-2d9c-4c35-8967-7d66dfaec39d@rwthex-w2-a.rwth-ad.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Errors are already reported by the common code in dvb_usb_v2_generic_io
(which dvbsky_usb_generic_rw is a wrapper of), so there is no reason
report the error again.

Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>
---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index ae0814dd202a..3ff9833597e5 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -100,8 +100,6 @@ static int dvbsky_gpio_ctrl(struct dvb_usb_device *d, u8 gport, u8 value)
 	obuf[1] = gport;
 	obuf[2] = value;
 	ret = dvbsky_usb_generic_rw(d, obuf, 3, ibuf, 1);
-	if (ret)
-		dev_err(&d->udev->dev, "failed=%d\n", ret);
 	return ret;
 }
 
@@ -139,8 +137,6 @@ static int dvbsky_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			obuf[3] = msg[0].addr;
 			ret = dvbsky_usb_generic_rw(d, obuf, 4,
 					ibuf, msg[0].len + 1);
-			if (ret)
-				dev_err(&d->udev->dev, "failed=%d\n", ret);
 			if (!ret)
 				memcpy(msg[0].buf, &ibuf[1], msg[0].len);
 		} else {
@@ -151,8 +147,6 @@ static int dvbsky_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			memcpy(&obuf[3], msg[0].buf, msg[0].len);
 			ret = dvbsky_usb_generic_rw(d, obuf,
 					msg[0].len + 3, ibuf, 1);
-			if (ret)
-				dev_err(&d->udev->dev, "failed=%d\n", ret);
 		}
 	} else {
 		if ((msg[0].len > 60) || (msg[1].len > 60)) {
@@ -170,9 +164,6 @@ static int dvbsky_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		memcpy(&obuf[4], msg[0].buf, msg[0].len);
 		ret = dvbsky_usb_generic_rw(d, obuf,
 			msg[0].len + 4, ibuf, msg[1].len + 1);
-		if (ret)
-			dev_err(&d->udev->dev, "failed=%d\n", ret);
-
 		if (!ret)
 			memcpy(msg[1].buf, &ibuf[1], msg[1].len);
 	}
@@ -201,8 +192,6 @@ static int dvbsky_rc_query(struct dvb_usb_device *d)
 
 	obuf[0] = 0x10;
 	ret = dvbsky_usb_generic_rw(d, obuf, 1, ibuf, 2);
-	if (ret)
-		dev_err(&d->udev->dev, "failed=%d\n", ret);
 	if (ret == 0)
 		code = (ibuf[0] << 8) | ibuf[1];
 	if (code != 0xffff) {
-- 
2.21.0

