Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B69A4358
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2019 10:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfHaIhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Aug 2019 04:37:41 -0400
Received: from gofer.mess.org ([88.97.38.141]:35693 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726600AbfHaIhl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Aug 2019 04:37:41 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8C431601AC; Sat, 31 Aug 2019 09:37:39 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>, Jan Pieter van Woerkom <jp@jpvw.nl>
Subject: [PATCH 2/2] media: rtl28xxu: fix idle handling
Date:   Sat, 31 Aug 2019 09:37:39 +0100
Message-Id: <20190831083739.18345-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190831083739.18345-1-sean@mess.org>
References: <20190831083739.18345-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the IR receiver is put into idle mode after each interrupt.
However longer IR like NEC can be distributed over mulitple interrupts,
so putting the IR into idle in the middle of such a message will break
decoding.

Every IR message has a trailing space of 0xbf (one less than
IR_IDE_LEN{0,1} which is programmed to 0xc0). So, set the timeout to that
value and rc-core will put the IR receiver into idle mode automatically.

Thanks to Jan Pieter van Woerkom <jp@jpvw.nl> for providing the hardware.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb.h      | 2 ++
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 1 +
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c     | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb.h b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
index b874a49ececf..52bcc2d2efe5 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb.h
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
@@ -121,6 +121,7 @@ struct dvb_usb_driver_info {
  * @interval: time in ms between two queries
  * @driver_type: used to point if a device supports raw mode
  * @bulk_mode: device supports bulk mode for rc (disable polling mode)
+ * @timeout: set to length of last space before raw IR goes idle
  */
 struct dvb_usb_rc {
 	const char *map_name;
@@ -130,6 +131,7 @@ struct dvb_usb_rc {
 	unsigned int interval;
 	enum rc_driver_type driver_type;
 	bool bulk_mode;
+	int timeout;
 };
 
 /**
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index e5e056bf9dfa..f1c79f351ec8 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -150,6 +150,7 @@ static int dvb_usbv2_remote_init(struct dvb_usb_device *d)
 	dev->map_name = d->rc.map_name;
 	dev->allowed_protocols = d->rc.allowed_protos;
 	dev->change_protocol = d->rc.change_protocol;
+	dev->timeout = d->rc.timeout;
 	dev->priv = d;
 
 	ret = rc_register_device(dev);
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 78ad9adfbeac..5016ede7b35f 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1781,7 +1781,6 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 	}
 
 	/* 'flush' ir_raw_event_store_with_filter() */
-	ir_raw_event_set_idle(d->rc_dev, true);
 	ir_raw_event_handle(d->rc_dev);
 exit:
 	return ret;
@@ -1804,6 +1803,8 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
 	rc->driver_type = RC_DRIVER_IR_RAW;
 	rc->query = rtl2832u_rc_query;
 	rc->interval = 200;
+	/* we program idle len to 0xc0, set timeout to one less */
+	rc->timeout = 0xbf * 50800;
 
 	return 0;
 }
-- 
2.21.0

