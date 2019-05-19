Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D242286E
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 20:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbfESSrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 14:47:12 -0400
Received: from mail-out-2.itc.rwth-aachen.de ([134.130.5.47]:39836 "EHLO
        mail-out-2.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfESSrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 14:47:12 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BKBABgO+Fc/54agoZkHQEBBQEHBQGBZ?=
 =?us-ascii?q?YFnKoE8WQqECK9mCQEBAQEBAQEBAQcBLQIBAYRAAoI0IzgTAQMBAQUBAQEBBG0?=
 =?us-ascii?q?ohUsGIwQLAUYQJQImAgJXBg4FgyKCCwSpcXwziRuBDwkBgQIohnuEVoIWgTiCP?=
 =?us-ascii?q?WxphCiCPYJYBIsmgh+HIJMzBwKBMl2SdiGMQYleog0CAgICCQIVgWYhgVdxgzu?=
 =?us-ascii?q?DMwECjR0+MnwMIY0RAYEgAQE?=
X-IPAS-Result: =?us-ascii?q?A2BKBABgO+Fc/54agoZkHQEBBQEHBQGBZYFnKoE8WQqECK9?=
 =?us-ascii?q?mCQEBAQEBAQEBAQcBLQIBAYRAAoI0IzgTAQMBAQUBAQEBBG0ohUsGIwQLAUYQJ?=
 =?us-ascii?q?QImAgJXBg4FgyKCCwSpcXwziRuBDwkBgQIohnuEVoIWgTiCPWxphCiCPYJYBIs?=
 =?us-ascii?q?mgh+HIJMzBwKBMl2SdiGMQYleog0CAgICCQIVgWYhgVdxgzuDMwECjR0+MnwMI?=
 =?us-ascii?q?Y0RAYEgAQE?=
X-IronPort-AV: E=Sophos;i="5.60,487,1549926000"; 
   d="scan'208";a="78475710"
Received: from rwthex-w2-a.rwth-ad.de ([134.130.26.158])
  by mail-in-2.itc.rwth-aachen.de with ESMTP; 19 May 2019 13:19:00 +0200
Received: from pebbles.fritz.box (2.243.143.238) by rwthex-w2-a.rwth-ad.de
 (2a00:8a60:1:e500::26:158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 19
 May 2019 13:18:58 +0200
From:   =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
To:     <linux-media@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH v2 1/3] media: dvb-usb-v2: Report error on all error paths
Date:   Sun, 19 May 2019 13:18:29 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190519111831.26746-1-stefan.bruens@rwth-aachen.de>
References: <20190519111831.26746-1-stefan.bruens@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2.243.143.238]
X-ClientProxiedBy: rwthex-w3-a.rwth-ad.de (2a00:8a60:1:e500::26:162) To
 rwthex-w2-a.rwth-ad.de (2a00:8a60:1:e500::26:158)
Message-ID: <e2ccd471-13c6-46a2-a33f-adac93e8b8de@rwthex-w2-a.rwth-ad.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

actual_length != wlen is the only error path which does not generate an
error message. Adding an error message here allows to report a more
specific error and to remove the error reporting from the call sites.

Also clean up the error paths - in case of an error, the remaining
code is skipped, and ret is returned. Skip setting ret and return
immediately (no cleanup necessary).

Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c
index 5bafeb6486be..5b32d159f968 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c
@@ -37,14 +37,19 @@ static int dvb_usb_v2_generic_io(struct dvb_usb_device *d,
 	ret = usb_bulk_msg(d->udev, usb_sndbulkpipe(d->udev,
 			d->props->generic_bulk_ctrl_endpoint), wbuf, wlen,
 			&actual_length, 2000);
-	if (ret < 0)
+	if (ret) {
 		dev_err(&d->udev->dev, "%s: usb_bulk_msg() failed=%d\n",
 				KBUILD_MODNAME, ret);
-	else
-		ret = actual_length != wlen ? -EIO : 0;
+		return ret;
+	}
+	if (actual_length != wlen) {
+		dev_err(&d->udev->dev, "%s: usb_bulk_msg() write length=%d, actual=%d\n",
+				KBUILD_MODNAME, wlen, actual_length);
+		return -EIO;
+	}
 
-	/* an answer is expected, and no error before */
-	if (!ret && rbuf && rlen) {
+	/* an answer is expected */
+	if (rbuf && rlen) {
 		if (d->props->generic_bulk_ctrl_delay)
 			usleep_range(d->props->generic_bulk_ctrl_delay,
 					d->props->generic_bulk_ctrl_delay
-- 
2.21.0

