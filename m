Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD641C8D0E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 15:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgEGNxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 09:53:39 -0400
Received: from gofer.mess.org ([88.97.38.141]:34379 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgEGNxj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 09:53:39 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D4542C6424; Thu,  7 May 2020 14:53:37 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/3] input: serio: allow more than one byte to be sent at once
Date:   Thu,  7 May 2020 14:53:36 +0100
Message-Id: <20200507135337.2343-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507135337.2343-1-sean@mess.org>
References: <20200507135337.2343-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

serio drivers can only send one byte at a time. If the underlying tty
is a usb serial port, then each byte will be put into separate usb
urbs, which is not efficient.

Additionally, the Infrared Toy device refuses to transmit IR if the
IR data is sent one byte at a time. IR data is formatted in u16 values,
and the firmware expects complete u16 values in the packet.

https://github.com/DangerousPrototypes/USB_IR_Toy/blob/master/Firmware-main/IRs.c#L240

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/input/serio/serport.c |  9 +++++++++
 include/linux/serio.h         | 23 ++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/serport.c b/drivers/input/serio/serport.c
index 8ac970a423de6..887801691dddc 100644
--- a/drivers/input/serio/serport.c
+++ b/drivers/input/serio/serport.c
@@ -47,6 +47,14 @@ static int serport_serio_write(struct serio *serio, unsigned char data)
 	return -(serport->tty->ops->write(serport->tty, &data, 1) != 1);
 }
 
+static int serport_serio_write_buf(struct serio *serio, unsigned char *data,
+				   uint count)
+{
+	struct serport *serport = serio->port_data;
+
+	return -(serport->tty->ops->write(serport->tty, data, count) != count);
+}
+
 static int serport_serio_open(struct serio *serio)
 {
 	struct serport *serport = serio->port_data;
@@ -173,6 +181,7 @@ static ssize_t serport_ldisc_read(struct tty_struct * tty, struct file * file, u
 	serio->id = serport->id;
 	serio->id.type = SERIO_RS232;
 	serio->write = serport_serio_write;
+	serio->write_buf = serport_serio_write_buf;
 	serio->open = serport_serio_open;
 	serio->close = serport_serio_close;
 	serio->port_data = serport;
diff --git a/include/linux/serio.h b/include/linux/serio.h
index 6c27d413da921..3918e56aec51c 100644
--- a/include/linux/serio.h
+++ b/include/linux/serio.h
@@ -32,6 +32,7 @@ struct serio {
 	spinlock_t lock;
 
 	int (*write)(struct serio *, unsigned char);
+	int (*write_buf)(struct serio *serio, unsigned char *buf, uint size);
 	int (*open)(struct serio *);
 	void (*close)(struct serio *);
 	int (*start)(struct serio *);
@@ -121,12 +122,32 @@ void serio_unregister_driver(struct serio_driver *drv);
 
 static inline int serio_write(struct serio *serio, unsigned char data)
 {
-	if (serio->write)
+	if (serio->write_buf)
+		return serio->write_buf(serio, &data, 1);
+	else if (serio->write)
 		return serio->write(serio, data);
 	else
 		return -1;
 }
 
+static inline int serio_write_buf(struct serio *serio, unsigned char *data,
+				  uint size)
+{
+	if (serio->write_buf) {
+		return serio->write_buf(serio, data, size);
+	} else if (serio->write) {
+		int ret;
+
+		do {
+			ret = serio->write(serio, *data++);
+		} while (ret == 0 && --size);
+
+		return ret;
+	} else {
+		return -1;
+	}
+}
+
 static inline void serio_drv_write_wakeup(struct serio *serio)
 {
 	if (serio->drv && serio->drv->write_wakeup)
-- 
2.26.2

