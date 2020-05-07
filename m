Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993541C8D0F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 15:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgEGNxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 09:53:41 -0400
Received: from gofer.mess.org ([88.97.38.141]:55479 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbgEGNxj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 09:53:39 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 00995C643A; Thu,  7 May 2020 14:53:37 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: rc: add support for Infrared Toy and IR Droid devices
Date:   Thu,  7 May 2020 14:53:37 +0100
Message-Id: <20200507135337.2343-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507135337.2343-1-sean@mess.org>
References: <20200507135337.2343-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These devices are connected via an usb serial port, and need to be
attached using "inputattach -irtoy /dev/ttyACM[0-9]" (patches will
be sent once this is merged).

http://dangerousprototypes.com/docs/USB_Infrared_Toy
https://www.irdroid.com/irdroid-usb-ir-transceiver/

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/Kconfig  |  15 ++
 drivers/media/rc/Makefile |   1 +
 drivers/media/rc/ir_toy.c | 448 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 464 insertions(+)
 create mode 100644 drivers/media/rc/ir_toy.c

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index c18dee6482536..aa690ba6a981a 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -530,6 +530,21 @@ config IR_ZX
 	   To compile this driver as a module, choose M here: the
 	   module will be called zx-irdec.
 
+config IR_TOY
+	tristate "Infrared Toy and IR Droid"
+	depends on RC_CORE
+	select USB
+	select USB_ACM
+	select SERIO
+	select SERIO_SERPORT
+	help
+	   Say Y here if you want to use the Infrared Toy or IR Droid. This
+	   is a serio driver which needs to be attached to the usb serial
+	   port using inputattach.
+
+	   To compile this driver as a module, choose M here: the module will be
+	   called ir_toy.
+
 endif #RC_DEVICES
 
 endif #RC_CORE
diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index 48d23433b3c06..5bb2932ab1195 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -50,3 +50,4 @@ obj-$(CONFIG_IR_MTK) += mtk-cir.o
 obj-$(CONFIG_IR_ZX) += zx-irdec.o
 obj-$(CONFIG_IR_TANGO) += tango-ir.o
 obj-$(CONFIG_RC_XBOX_DVD) += xbox_remote.o
+obj-$(CONFIG_IR_TOY) += ir_toy.o
diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
new file mode 100644
index 0000000000000..8c9dffa002f44
--- /dev/null
+++ b/drivers/media/rc/ir_toy.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Infrared Toy and IR Droid RC core driver
+ *
+ * Copyright (C) 2020 Sean Young <sean@mess.org>
+
+ * This driver is based on the lirc driver which can be found here:
+ * https://sourceforge.net/p/lirc/git/ci/master/tree/plugins/irtoy.c
+ * Copyright (C) 2011 Peter Kooiman <pkooiman@gmail.com>
+ */
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/serio.h>
+#include <linux/slab.h>
+
+#include <media/rc-core.h>
+
+static u8 COMMAND_VERSION[] = { 'v' };
+// End transmit and repeat reset command so we exit sump mode
+static u8 COMMAND_RESET[] = { 0xff, 0xff, 0, 0, 0, 0, 0 };
+static u8 COMMAND_SMODE_ENTER[] = { 's' };
+static u8 COMMAND_TXSTART[] = { 0x26, 0x24, 0x25, 0x03 };
+
+#define COMMAND_IO_WRITE 0x30
+#define COMMAND_IO_DIRECTION 0x31
+
+#define REPLY_XMITCOUNT 't'
+#define REPLY_XMITSUCCESS 'C'
+#define REPLY_VERSION 'V'
+#define REPLY_SAMPLEMODEPROTO 'S'
+
+#define TIMEOUT_READYFORDATA 1000000
+#define TIMEOUT_FLUSH 20000
+#define TIMEOUT_SMODE_ENTER 500000
+#define TIMEOUT_VERSION 500000
+
+#define LEN_XMITRES 4
+#define LEN_VERSION 4
+#define LEN_SAMPLEMODEPROTO 3
+
+#define MAX_MSG_SIZE 6
+
+#define MIN_FW_SUPPORTING_SETPIN 22
+#define MIN_FW_VERSION 20
+#define UNIT_NS 21333
+#define MAX_TIMEOUT_NS (UNIT_NS * U16_MAX)
+
+#define OPEN_PIN	5	// RA5
+#define RECEIVE_PIN	3	// RA3
+#define SENDING_PIN	4	// RA4
+
+struct irtoy {
+	struct device *dev;
+	struct rc_dev *rc;
+	struct serio *serio;
+
+	u8 rx[MAX_MSG_SIZE];
+	u8 rx_len;
+	u8 rx_needed;
+	bool pulse;
+	struct completion rx_done;
+
+	uint hw_version;
+	uint sw_version;
+	uint proto_version;
+};
+
+static irqreturn_t irtoy_interrupt(struct serio *serio, unsigned char data,
+				   unsigned int flags)
+{
+	struct irtoy *irtoy = serio_get_drvdata(serio);
+
+	// add byte to buffer
+	if (irtoy->rx_len < MAX_MSG_SIZE)
+		irtoy->rx[irtoy->rx_len++] = data;
+
+	if (irtoy->rx_needed == 0 && irtoy->rx_len == 2) {
+		u32 v = be16_to_cpup((__be16 *)irtoy->rx);
+
+		if (v != 0xffff) {
+			struct ir_raw_event rawir = {
+				.pulse = irtoy->pulse,
+				.duration = v * UNIT_NS,
+			};
+
+			ir_raw_event_store_with_timeout(irtoy->rc, &rawir);
+			ir_raw_event_handle(irtoy->rc);
+			irtoy->pulse = !irtoy->pulse;
+		} else {
+			irtoy->pulse = true;
+		}
+
+		irtoy->rx_len = 0;
+	} else if (irtoy->rx_len == irtoy->rx_needed) {
+		complete(&irtoy->rx_done);
+	}
+
+	return IRQ_HANDLED;
+}
+
+// Send a command and wait for a response of rx_len bytes, for at most
+// timeout microseconds. If rxlen is 0, then wait for timeout microseconds
+// and read all response bytes within that period
+static int irtoy_send_and_recv(struct irtoy *irtoy, u8 *cmd, int cmd_len,
+			       int rx_len, int timeout)
+{
+	int err;
+
+	serio_pause_rx(irtoy->serio);
+	init_completion(&irtoy->rx_done);
+	irtoy->rx_len = 0;
+	irtoy->rx_needed = rx_len;
+	serio_continue_rx(irtoy->serio);
+
+	err = serio_write_buf(irtoy->serio, cmd, cmd_len);
+	if (err)
+		return err;
+
+	if (!wait_for_completion_timeout(&irtoy->rx_done,
+					 usecs_to_jiffies(timeout)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+// Wait for timeout for rx_len bytes to arrive
+static int irtoy_recv(struct irtoy *irtoy, int rx_len, int timeout)
+{
+	bool done;
+
+	serio_pause_rx(irtoy->serio);
+	if (irtoy->rx_len >= rx_len) {
+		done = true;
+	} else {
+		init_completion(&irtoy->rx_done);
+		irtoy->rx_needed = rx_len;
+		done = false;
+	}
+	serio_continue_rx(irtoy->serio);
+
+	if (!done && !wait_for_completion_timeout(&irtoy->rx_done,
+						  usecs_to_jiffies(timeout)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int irtoy_send_tx(struct irtoy *irtoy, void *buf, uint size)
+{
+	uint buf_len, buf_size, count, emitted;
+	int err;
+
+	err = irtoy_send_and_recv(irtoy, COMMAND_TXSTART,
+				  sizeof(COMMAND_TXSTART),
+				  1, TIMEOUT_READYFORDATA);
+	if (err) {
+		dev_err(irtoy->dev, "failed to send tx start command: %d\n",
+			err);
+		return err;
+	}
+
+	buf_len = irtoy->rx[0];
+	count = size;
+
+	while (count) {
+		dev_dbg(irtoy->dev, "ready to receive: 0x%02x\n", buf_len);
+
+		if (buf_len == 0) {
+			dev_err(irtoy->dev, "not enough buffer space\n");
+			return -EINVAL;
+		}
+
+		buf_size = min(buf_len, count);
+
+		err = irtoy_send_and_recv(irtoy, buf, buf_size, 1,
+					  TIMEOUT_READYFORDATA);
+		if (err) {
+			dev_err(irtoy->dev, "failed to send tx buffer: %d\n",
+				err);
+			return err;
+		}
+
+		buf_len = irtoy->rx[0];
+
+		buf += buf_size;
+		count -= buf_size;
+	}
+
+	err = irtoy_recv(irtoy, 1 + LEN_XMITRES, TIMEOUT_READYFORDATA);
+	if (err) {
+		dev_err(irtoy->dev, "failed to receive tx result: %d\n", err);
+		return err;
+	}
+
+	dev_dbg(irtoy->dev, "tx result: %*phN", LEN_XMITRES, irtoy->rx + 1);
+
+	if (irtoy->rx[1] != REPLY_XMITCOUNT) {
+		dev_err(irtoy->dev, "invalid byte count indicator\n");
+		return -EINVAL;
+	}
+
+	emitted = be16_to_cpup((__be16 *)(irtoy->rx + 2));
+
+	if (size != emitted) {
+		dev_err(irtoy->dev, "expected %u emitted, got %u\n", count,
+			emitted);
+		return -EINVAL;
+	}
+
+	if (irtoy->rx[4] != REPLY_XMITSUCCESS) {
+		dev_err(irtoy->dev, "invalid byte count indicator\n");
+		return -EINVAL;
+	}
+
+	// switch to raw IR mode
+	irtoy->rx_needed = 0;
+	irtoy->rx_len = 0;
+
+	return 0;
+}
+
+static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
+{
+	struct irtoy *irtoy = rc->priv;
+	unsigned int i;
+	size_t size;
+	__be16 *buf;
+	int err;
+
+	size = sizeof(u16) * (count + 1);
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		u16 v = DIV_ROUND_CLOSEST(US_TO_NS(txbuf[i]), UNIT_NS);
+
+		if (!v)
+			v = 1;
+		buf[i] = cpu_to_be16(v);
+	}
+
+	buf[i] = cpu_to_be16(0xffff);
+
+	err = irtoy_send_tx(irtoy, buf, size);
+	kfree(buf);
+
+	return err == 0 ? count : err;
+}
+
+static int irtoy_reset(struct irtoy *irtoy)
+{
+	int err;
+
+	err = serio_write_buf(irtoy->serio, COMMAND_RESET,
+			      sizeof(COMMAND_RESET));
+	if (err != 0) {
+		dev_err(irtoy->dev, "could not write reset command: %d\n",
+			err);
+		return err;
+	}
+
+	usleep_range(50, 50);
+
+	return 0;
+}
+
+static int irtoy_setup(struct irtoy *irtoy)
+{
+	uint version;
+	int err;
+
+	// reset device
+	err = irtoy_reset(irtoy);
+	if (err)
+		return err;
+
+	// get version
+	err = irtoy_send_and_recv(irtoy, COMMAND_VERSION,
+				  sizeof(COMMAND_VERSION),
+				  LEN_VERSION, TIMEOUT_VERSION);
+	if (err) {
+		dev_err(irtoy->dev, "could not write version command: %d\n",
+			err);
+		return err;
+	}
+
+	irtoy->rx[LEN_VERSION] = 0;
+
+	if (irtoy->rx[0] != REPLY_VERSION ||
+	    kstrtouint(irtoy->rx + 1, 10, &version)) {
+		dev_err(irtoy->dev, "invalid version %*phN. Please make sure you are using firmware v20 or higher",
+			LEN_VERSION, irtoy->rx);
+		return -ENODEV;
+	}
+
+	dev_dbg(irtoy->dev, "version %s\n", irtoy->rx);
+
+	irtoy->hw_version = version / 100;
+	irtoy->sw_version = version % 100;
+
+	// enter sample mode
+	err = irtoy_send_and_recv(irtoy, COMMAND_SMODE_ENTER,
+				  sizeof(COMMAND_SMODE_ENTER),
+				  LEN_SAMPLEMODEPROTO, TIMEOUT_SMODE_ENTER);
+	if (err) {
+		dev_err(irtoy->dev, "could not write version command: %d\n",
+			err);
+		return err;
+	}
+
+	irtoy->rx[LEN_SAMPLEMODEPROTO] = 0;
+
+	if (irtoy->rx[0] != REPLY_SAMPLEMODEPROTO ||
+	    kstrtouint(irtoy->rx + 1, 10, &version)) {
+		dev_err(irtoy->dev, "invalid sample mode response %*phN",
+			LEN_SAMPLEMODEPROTO, irtoy->rx);
+		return -ENODEV;
+	}
+
+	dev_dbg(irtoy->dev, "protocol %s\n", irtoy->rx);
+
+	irtoy->proto_version = version;
+
+	return 0;
+}
+
+static int irtoy_connect(struct serio *serio, struct serio_driver *drv)
+{
+	struct irtoy *irtoy;
+	struct rc_dev *rc;
+	int err;
+
+	irtoy = kzalloc(sizeof(*irtoy), GFP_KERNEL);
+	if (!irtoy)
+		return -ENOMEM;
+
+	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
+	if (!rc) {
+		err = -ENOMEM;
+		goto free_irtoy;
+	}
+
+	irtoy->serio = serio;
+	irtoy->dev = &serio->dev;
+	irtoy->rc = rc;
+	irtoy->pulse = true;
+
+	serio_set_drvdata(serio, irtoy);
+
+	err = serio_open(serio, drv);
+	if (err)
+		goto free_device;
+
+	err = irtoy_setup(irtoy);
+	if (err)
+		goto close_serio;
+
+	dev_info(irtoy->dev, "version hardware %u, firmware %u, protocol %u",
+		 irtoy->hw_version, irtoy->sw_version, irtoy->proto_version);
+
+	if (irtoy->sw_version < MIN_FW_VERSION) {
+		dev_err(irtoy->dev, "need firmware V%02u or higher",
+			MIN_FW_VERSION);
+		err = -ENODEV;
+		goto close_serio;
+	}
+
+	rc->device_name = dev_name(&serio->dev);
+	rc->driver_name = KBUILD_MODNAME;
+	rc->input_phys = serio->phys;
+	rc->priv = irtoy;
+	rc->dev.parent = &serio->dev;
+	rc->tx_ir = irtoy_tx;
+	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
+	rc->map_name = RC_MAP_RC6_MCE;
+	rc->rx_resolution = UNIT_NS;
+	rc->timeout = IR_DEFAULT_TIMEOUT;
+	rc->min_timeout = US_TO_NS(1);
+	rc->max_timeout = MAX_TIMEOUT_NS;
+
+	err = rc_register_device(rc);
+	if (err)
+		goto close_serio;
+
+	// switch to raw IR mode
+	irtoy->rx_needed = 0;
+	irtoy->rx_len = 0;
+
+	return 0;
+
+close_serio:
+	serio_close(serio);
+free_device:
+	serio_set_drvdata(serio, NULL);
+	rc_free_device(rc);
+free_irtoy:
+	kfree(irtoy);
+	return err;
+}
+
+static void irtoy_disconnect(struct serio *serio)
+{
+	struct irtoy *irtoy = serio_get_drvdata(serio);
+
+	rc_unregister_device(irtoy->rc);
+
+	irtoy->serio = NULL;
+
+	serio_close(serio);
+	serio_set_drvdata(serio, NULL);
+	kfree(irtoy);
+}
+
+static const struct serio_device_id irtoy_serio_ids[] = {
+	{
+		.type	= SERIO_RS232,
+		.proto	= SERIO_IRTOY,
+		.id	= SERIO_ANY,
+		.extra	= SERIO_ANY,
+	},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(serio, irtoy_serio_ids);
+
+static struct serio_driver irtoy_drv = {
+	.driver		= {
+		.name	= "irtoy",
+	},
+	.description	= "Infrared Toy and IR Droid RC driver",
+	.id_table	= irtoy_serio_ids,
+	.interrupt	= irtoy_interrupt,
+	.connect	= irtoy_connect,
+	.disconnect	= irtoy_disconnect,
+};
+
+module_serio_driver(irtoy_drv);
+
+MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("Infrared Toy and IR Droid driver");
+MODULE_LICENSE("GPL");
-- 
2.26.2

