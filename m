Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9B93A4DDA
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 11:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbhFLJQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 05:16:00 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:43880 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhFLJQA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 05:16:00 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 77C09BC9B1A; Sat, 12 Jun 2021 11:13:59 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Maciej Nowak <tmn505@gmail.com>, Sean Young <sean@mess.org>,
        Gon Solo <gonsolo@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: usb: dvb-usb-v2: af9035: report if i2c client isn't bound
Date:   Sat, 12 Jun 2021 11:13:50 +0200
Message-Id: <20210612091351.7169-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a sub device doesn't immediately bind after it was added, emit an
error indication to the kernel log to help debugging. This happens for
example if the needed driver isn't available at all.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 22fda53e219a..6b7db903a365 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -210,6 +210,7 @@ static int af9035_add_i2c_dev(struct dvb_usb_device *d, const char *type,
 	/* register I2C device */
 	client = i2c_new_client_device(adapter, &board_info);
 	if (!i2c_client_has_driver(client)) {
+		dev_err(&intf->dev, "failed to bind i2c device to %s driver\n", type);
 		ret = -ENODEV;
 		goto err;
 	}
-- 
2.30.2

