Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527B322868
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 20:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfESSpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 14:45:09 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([134.130.5.49]:55912 "EHLO
        mail-out-4.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbfESSpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 14:45:09 -0400
X-Greylist: delayed 3603 seconds by postgrey-1.27 at vger.kernel.org; Sun, 19 May 2019 14:45:08 EDT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AEAwDnOuFc/54agoZkHAEBAQQBAQcEA?=
 =?us-ascii?q?QGBZYIRgTxZCoQIlHGTYocTCQEBAQEBAQEBAQcBLQIBAYRAAoI0IzgTAQMBAQU?=
 =?us-ascii?q?BAQEBBG0ohUsGIwQLAUYQJQImAgJXBg4FgyKCCwSpcXwziRuBDwkBgQIohnuEV?=
 =?us-ascii?q?oIWgTgMgx2FEYI9glgEiyaCH4cgkzMHAoEyXZJ2IYxBiV4toWACAgICCQIVgWY?=
 =?us-ascii?q?hgVdxgzuCRo4NPjJ8DCGNEQGBIAEB?=
X-IPAS-Result: =?us-ascii?q?A2AEAwDnOuFc/54agoZkHAEBAQQBAQcEAQGBZYIRgTxZCoQ?=
 =?us-ascii?q?IlHGTYocTCQEBAQEBAQEBAQcBLQIBAYRAAoI0IzgTAQMBAQUBAQEBBG0ohUsGI?=
 =?us-ascii?q?wQLAUYQJQImAgJXBg4FgyKCCwSpcXwziRuBDwkBgQIohnuEVoIWgTgMgx2FEYI?=
 =?us-ascii?q?9glgEiyaCH4cgkzMHAoEyXZJ2IYxBiV4toWACAgICCQIVgWYhgVdxgzuCRo4NP?=
 =?us-ascii?q?jJ8DCGNEQGBIAEB?=
Received: from rwthex-w2-a.rwth-ad.de ([134.130.26.158])
  by mail-in-4.itc.rwth-aachen.de with ESMTP; 19 May 2019 13:19:05 +0200
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
Subject: [PATCH v2 3/3] media: af9035: Remove duplicate error reporting for dvbsky_usb_generic_rw
Date:   Sun, 19 May 2019 13:18:31 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190519111831.26746-1-stefan.bruens@rwth-aachen.de>
References: <20190519111831.26746-1-stefan.bruens@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2.243.143.238]
X-ClientProxiedBy: rwthex-w3-a.rwth-ad.de (2a00:8a60:1:e500::26:162) To
 rwthex-w2-a.rwth-ad.de (2a00:8a60:1:e500::26:158)
Message-ID: <85c470fd-cba0-4447-9852-c09794883f10@rwthex-w2-a.rwth-ad.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All error cases inside the function already report errors via dev_err(),
and dvb_usb_v2_generic_rw also reports all error cases, so there is
no silent code path when an error has occured.

Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 1b7f1af399fb..15643e2f9395 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -120,8 +120,6 @@ static int af9035_ctrl_msg(struct dvb_usb_device *d, struct usb_req *req)
 		memcpy(req->rbuf, &state->buf[ACK_HDR_LEN], req->rlen);
 exit:
 	mutex_unlock(&d->usb_mutex);
-	if (ret < 0)
-		dev_dbg(&intf->dev, "failed=%d\n", ret);
 	return ret;
 }
 
-- 
2.21.0

