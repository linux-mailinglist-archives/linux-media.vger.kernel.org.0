Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A92B5EDBA3
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbiI1LWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbiI1LWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:22:23 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5664DCE85
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=15812; q=dns/txt;
  s=iport; t=1664364142; x=1665573742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sQdcvxN5YHlCwnta0ArPmx3QaEqMv6Jy/G5jFqDq0y4=;
  b=YZkJf7FtJqCPCDNTpaBe8UijquRy8r4Wur6qKJ9BLQdErXot8yMv4djE
   cNpfB68SF/Ky5z53xZnWgUx3pPCCQV0CkAD0c8W22Mwlfni+rJRSMuFz1
   GwrTJ+w3HMw5f14FZQ9PRRdebjDl8+co1uIrlayB5YEHrZWrzM4lTvqR7
   E=;
X-IronPort-AV: E=Sophos;i="5.93,352,1654560000"; 
   d="scan'208";a="4176463"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Sep 2022 11:21:16 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 28SBLFeo008487;
        Wed, 28 Sep 2022 11:21:16 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Jonathan Selnes <jonathansb1@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v3 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
Date:   Wed, 28 Sep 2022 13:21:46 +0200
Message-Id: <20220928112147.358745-5-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928112147.358745-1-hljunggr@cisco.com>
References: <20220928112147.358745-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Selnes <jonathansb1@gmail.com>

Support reading and writing the EDID EEPROM through the
v4l2 API.

Signed-off-by: Jonathan Selnes <jonathansb1@gmail.com>
Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Co-developed-by: Erling Ljunggren <hljunggr@cisco.com>
Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 MAINTAINERS                   |   7 +
 drivers/media/i2c/Kconfig     |   9 +
 drivers/media/i2c/Makefile    |   1 +
 drivers/media/i2c/cat24c208.c | 480 ++++++++++++++++++++++++++++++++++
 4 files changed, 497 insertions(+)
 create mode 100644 drivers/media/i2c/cat24c208.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9490a5c15a..407d76c42bab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14912,6 +14912,13 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov9734.c
 
+ON SEMICONDUCTOR CAT24C208 EDID EEPROM DRIVER
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
+F:	drivers/media/i2c/cat24c208*
+
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2b20aa6c37b1..2f5f9f058b48 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1530,6 +1530,15 @@ endmenu
 menu "Miscellaneous helper chips"
 	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
+config VIDEO_CAT24C208
+	tristate "ON Semiconductor cat24c208 EDID EEPROM"
+	depends on VIDEO_DEV && I2C && OF
+	help
+	  Support for the ON Semiconductor CAT24C208 Dual Port EDID EEPROM.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called cat24c208.
+
 config VIDEO_I2C
 	tristate "I2C transport video support"
 	depends on VIDEO_DEV && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 3e1696963e7f..70e4360a21ba 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
 obj-$(CONFIG_VIDEO_BT856) += bt856.o
 obj-$(CONFIG_VIDEO_BT866) += bt866.o
+obj-$(CONFIG_VIDEO_CAT24C208) += cat24c208.o
 obj-$(CONFIG_VIDEO_CCS) += ccs/
 obj-$(CONFIG_VIDEO_CCS_PLL) += ccs-pll.o
 obj-$(CONFIG_VIDEO_CS3308) += cs3308.o
diff --git a/drivers/media/i2c/cat24c208.c b/drivers/media/i2c/cat24c208.c
new file mode 100644
index 000000000000..63b496f62c19
--- /dev/null
+++ b/drivers/media/i2c/cat24c208.c
@@ -0,0 +1,480 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HDMI i2c controlled EEPROM from ON Semiconductor or Catalyst Semiconductor
+ *
+ * Support for i2c based DDC EEPROM
+ *
+ * Copyright (C) 2021-2022 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * REF_01 - ON Semiconductor, cat24c208, Datasheet, URL : https://www.onsemi.com/pdf/datasheet/cat24c208-d.pdf
+ *	Revision 7, May 2018
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
+#include <linux/gpio/consumer.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+#include <linux/workqueue.h>
+
+#include <media/cec-notifier.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+
+MODULE_DESCRIPTION("cat24c208 EDID EEPROM driver");
+MODULE_AUTHOR("Jonathan Selnes Bognaes <jonathansb1@gmail.com>");
+MODULE_LICENSE("GPL");
+
+/*
+ * CAT24C208 setup
+ */
+#define BYTES_PER_BLOCK		128
+#define EDID_OFFSET_EXT_FLAG	126
+#define MAX_WRITE_BYTES		16
+#define NUM_BLOCKS		4
+#define NUM_CLIENTS		3
+#define CONFIG_NB_BIT		BIT(0)
+#define CONFIG_AB0_BIT		BIT(1)
+#define CONFIG_AB1_BIT		BIT(2)
+#define CONFIG_WE_BIT		BIT(3)
+
+/*
+ * From the datasheet: REF_01
+ *
+ * The write cycle time is the time from a valid stop condition of a write
+ * sequence to the end of the internal program/erase cycle. During the write
+ * cycle, the bus interface circuits are disabled, SDA is allowed to remain
+ * high, and the device does not respond to its slave address.
+ */
+#define WRITE_CYCLE_TIME_US	5000
+
+/*
+ * CAT24C208 addresses
+ */
+#define CONFIG_I2C_ADDR		0x31
+#define EEPROM_I2C_ADDR		0x50
+#define SEGMENT_I2C_ADDR	0x30
+
+struct cat24c208_state {
+	struct i2c_client *dev_client;
+	struct i2c_client *data_client;
+	struct i2c_client *seg_client;
+	// V4L2 ioctl serialization
+	struct mutex lock;
+	struct cec_notifier *notifier;
+	struct delayed_work dwork_enable_hpd;
+
+	struct v4l2_device v4l2_dev;
+	struct video_device vdev;
+	struct gpio_desc *hpd_gpio;
+
+	u8 edid_blocks;		// edid length can vary, one block = 128 bytes
+	u8 edid[BYTES_PER_BLOCK * NUM_BLOCKS]; // actual active edid data
+};
+
+static const struct v4l2_file_operations cat24c208_fops = {
+	.owner		= THIS_MODULE,
+	.open		= v4l2_fh_open,
+	.release	= v4l2_fh_release,
+	.unlocked_ioctl = video_ioctl2,
+};
+
+static int cat24c208_seg_write(struct cat24c208_state *state, u8 *data, u16 len, u8 seg)
+{
+	struct i2c_msg msg[] = {
+		{
+			.addr = state->seg_client->addr,	// Segment
+			.buf = &seg,
+			.len = 1,
+			.flags = 0,
+		},
+		{
+			.addr = state->data_client->addr,	// write data
+			.buf = data,
+			.len = len,
+			.flags = 0,
+		},
+	};
+	int err;
+
+	if (seg)
+		err = i2c_transfer(state->dev_client->adapter, msg, ARRAY_SIZE(msg));
+	else
+		err = i2c_transfer(state->dev_client->adapter, &msg[1], 1);
+
+	if (err < 0)
+		dev_err(&state->dev_client->dev, "Writing to 0x%x failed (segment %d)\n",
+			state->data_client->addr, seg);
+
+	usleep_range(WRITE_CYCLE_TIME_US, 2 * WRITE_CYCLE_TIME_US);
+	return err < 0 ? err : 0;
+}
+
+static int cat24c208_edid_read(struct cat24c208_state *state, u8 *data, u8 seg, u8 offset, u16 len)
+{
+	int err;
+
+	len *= BYTES_PER_BLOCK;
+	if (seg) {
+		struct i2c_msg msg[] = {
+			{
+				.addr = state->seg_client->addr,	// Segment
+				.buf = &seg,
+				.len = 1,
+				.flags = 0,
+			},
+			{
+				.addr = state->data_client->addr,	// read data
+				.buf = data,
+				.len = len,
+				.flags = I2C_M_RD,
+			},
+		};
+		err = i2c_transfer(state->dev_client->adapter, msg, ARRAY_SIZE(msg));
+	} else {
+		struct i2c_msg msg[] = {
+			{
+				.addr = state->data_client->addr,	// set offset
+				.buf = &offset,
+				.len = 1,
+				.flags = 0,
+			},
+			{
+				.addr = state->data_client->addr,	// read data
+				.buf = data,
+				.len = len,
+				.flags = I2C_M_RD,
+			},
+		};
+		err = i2c_transfer(state->dev_client->adapter, msg, ARRAY_SIZE(msg));
+	}
+
+	if (err < 0)
+		dev_err(&state->dev_client->dev, "Reading of EDID failed\n");
+	return err < 0 ? err : 0;
+}
+
+static int cat24c208_set_config(struct i2c_client *client)
+{
+	u8 buf[2] = { 0, CONFIG_NB_BIT };
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.buf = buf,
+		.len = sizeof(buf),
+		.flags = 0,
+	};
+	int err;
+
+	err = i2c_transfer(client->adapter, &msg, 1);
+	if (err < 0)
+		dev_err(&client->dev, "Could not set config register\n");
+
+	usleep_range(WRITE_CYCLE_TIME_US, 2 * WRITE_CYCLE_TIME_US);
+	return err < 0 ? err : 0;
+}
+
+static bool cat24c208_is_valid_edid(const u8 *block)
+{
+	static const u8 header_pattern[] = {
+		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
+	};
+
+	return !memcmp(block, header_pattern, sizeof(header_pattern));
+}
+
+static void cat24c208_delayed_work_release_hpd(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct cat24c208_state *state = container_of(dwork, struct cat24c208_state,
+						     dwork_enable_hpd);
+
+	gpiod_set_value(state->hpd_gpio, 1);
+}
+
+static int cat24c208_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+{
+	struct cat24c208_state *state = video_drvdata(file);
+	u8 buf[MAX_WRITE_BYTES + 1];
+	u16 pa;
+	int err;
+	int seg;
+	int i;
+
+	memset(edid->reserved, 0, sizeof(edid->reserved));
+
+	if (edid->pad)
+		return -EINVAL;
+
+	if (edid->blocks > NUM_BLOCKS) {
+		edid->blocks = NUM_BLOCKS;
+		return -E2BIG;
+	}
+
+	if (edid->start_block)
+		return -EINVAL;
+
+	pa = v4l2_get_edid_phys_addr(edid->edid, edid->blocks * BYTES_PER_BLOCK, NULL);
+
+	err = v4l2_phys_addr_validate(pa, NULL, NULL);
+	if (err)
+		return err;
+
+	if (state->hpd_gpio) {
+		cancel_delayed_work_sync(&state->dwork_enable_hpd);
+		gpiod_set_value(state->hpd_gpio, 0);
+	}
+
+	if (edid->blocks == 0) {
+		cec_notifier_set_phys_addr(state->notifier, pa);
+		return 0;
+	}
+
+	state->edid_blocks = edid->blocks;
+	memcpy(state->edid, edid->edid, state->edid_blocks * BYTES_PER_BLOCK);
+
+	/* Write EDID to EEPROM */
+	for (i = 0; i < edid->blocks * BYTES_PER_BLOCK; i = i + MAX_WRITE_BYTES) {
+		if (i >= 2 * BYTES_PER_BLOCK) {
+			seg = 1;
+			buf[0] = i - BYTES_PER_BLOCK * 2;
+		} else {
+			seg = 0;
+			buf[0] = i;
+		}
+
+		memcpy(buf + 1, &edid->edid[i], MAX_WRITE_BYTES);
+		err = cat24c208_seg_write(state, buf, MAX_WRITE_BYTES + 1, seg);
+		if (err) {
+			dev_err(&state->dev_client->dev,
+				"Could not write EDID to EEPROM, i: %d\n", i);
+			return err;
+		}
+	}
+
+	cec_notifier_set_phys_addr(state->notifier, pa);
+
+	if (state->hpd_gpio)
+		schedule_delayed_work(&state->dwork_enable_hpd, 110 * HZ / 1000);
+
+	return 0;
+}
+
+static int cat24c208_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+{
+	struct cat24c208_state *state = video_drvdata(file);
+
+	memset(edid->reserved, 0, sizeof(edid->reserved));
+
+	if (edid->pad != 0)
+		return -EINVAL;
+
+	if (edid->start_block == 0 && edid->blocks == 0) {
+		edid->blocks = state->edid_blocks;
+		return 0;
+	}
+
+	if (state->edid_blocks == 0)
+		return -ENODATA;
+
+	if (edid->start_block >= state->edid_blocks)
+		return -EINVAL;
+
+	if (edid->start_block + edid->blocks > state->edid_blocks)
+		edid->blocks = state->edid_blocks - edid->start_block;
+
+	memcpy(edid->edid, state->edid + edid->start_block * BYTES_PER_BLOCK,
+	       edid->blocks * BYTES_PER_BLOCK);
+
+	return 0;
+}
+
+static int cat24c208_get_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int cat24c208_set_input(struct file *file, void *priv, unsigned int i)
+{
+	return i > 0 ? -EINVAL : 0;
+}
+
+static int cat24c208_enum_input(struct file *file, void *priv,
+				struct v4l2_input *inp)
+{
+	if (inp->index)
+		return -EINVAL;
+	strscpy(inp->name, "HDMI", sizeof(inp->name));
+	inp->capabilities = 0;
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	return 0;
+}
+
+static int cat24c208_querycap(struct file *file,
+			      void *priv, struct v4l2_capability *cap)
+{
+	struct cat24c208_state *state = video_drvdata(file);
+	struct i2c_client *client = state->dev_client;
+
+	strscpy(cap->driver, "cat24c208", sizeof(cap->driver));
+	strscpy(cap->card, "cat24c208 EDID EEPROM", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "I2C:%d-%04x", client->adapter->nr, client->addr);
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops cat24c208_ioctl_ops = {
+	.vidioc_querycap	= cat24c208_querycap,
+	.vidioc_g_edid		= cat24c208_get_edid,
+	.vidioc_s_edid		= cat24c208_set_edid,
+	.vidioc_g_input		= cat24c208_get_input,
+	.vidioc_s_input		= cat24c208_set_input,
+	.vidioc_enum_input	= cat24c208_enum_input,
+};
+
+static void cat24c208_release(struct video_device *vdev)
+{
+	struct cat24c208_state *state = video_get_drvdata(vdev);
+
+	v4l2_device_unregister(&state->v4l2_dev);
+	mutex_destroy(&state->lock);
+	kfree(state);
+}
+
+static int cat24c208_probe(struct i2c_client *client)
+{
+	struct cat24c208_state *state;
+	struct v4l2_device *v4l2_dev;
+	int blocks;
+	int ret;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->dev_client = client;
+	state->data_client = i2c_new_ancillary_device(client, "eeprom", EEPROM_I2C_ADDR);
+	if (IS_ERR(state->data_client)) {
+		ret = PTR_ERR(state->data_client);
+		goto free_state;
+	}
+	state->seg_client = i2c_new_ancillary_device(client, "segment", SEGMENT_I2C_ADDR);
+	if (IS_ERR(state->seg_client)) {
+		ret = PTR_ERR(state->seg_client);
+		goto unreg_i2c_first;
+	}
+
+	ret = cat24c208_set_config(client);
+	if (ret)
+		goto unreg_i2c_all;
+
+	if (cat24c208_edid_read(state, state->edid, 0, 0, 2) >= 0 &&
+	    cat24c208_is_valid_edid(state->edid)) {
+		unsigned int i;
+
+		blocks = 1 + state->edid[EDID_OFFSET_EXT_FLAG];
+		state->edid_blocks = blocks;
+		for (i = 2; i < blocks; i += 2) {
+			if (cat24c208_edid_read(state, state->edid + i * BYTES_PER_BLOCK,
+						i / 2, 0, (i + 1 >= blocks ? 1 : 2))) {
+				state->edid_blocks = i;
+				break;
+			}
+		}
+	}
+
+	v4l2_dev = &state->v4l2_dev;
+	strscpy(v4l2_dev->name, "cat24c208", sizeof(v4l2_dev->name));
+	ret = v4l2_device_register(&client->dev, v4l2_dev);
+	if (ret) {
+		dev_err(&client->dev, "v4l2_device_register failed: %d\n", ret);
+		goto unreg_i2c_all;
+	}
+
+	mutex_init(&state->lock);
+
+	state->notifier = cec_notifier_conn_register(&client->dev, NULL, NULL);
+	if (!state->notifier) {
+		dev_err(&client->dev, "Failed to get CEC notifier\n");
+		ret = -ENOMEM;
+		goto unreg_i2c_all;
+	}
+
+	state->hpd_gpio = devm_gpiod_get_optional(&client->dev,
+						  "hpd", GPIOD_OUT_LOW);
+	if (IS_ERR(state->hpd_gpio)) {
+		ret = PTR_ERR(state->hpd_gpio);
+		dev_err(&client->dev, "Failed to get hpd-gpio err:%d\n", ret);
+		goto unreg_i2c_all;
+	}
+
+	INIT_DELAYED_WORK(&state->dwork_enable_hpd, cat24c208_delayed_work_release_hpd);
+
+	snprintf(state->vdev.name, sizeof(state->vdev.name),
+		 "cat24c208 %d-%d", client->adapter->nr, client->addr);
+
+	state->vdev.v4l2_dev = v4l2_dev;
+	state->vdev.fops = &cat24c208_fops;
+	state->vdev.ioctl_ops = &cat24c208_ioctl_ops;
+	state->vdev.lock = &state->lock;
+	state->vdev.release = cat24c208_release;
+	state->vdev.device_caps = V4L2_CAP_EDID;
+
+	video_set_drvdata(&state->vdev, state);
+	i2c_set_clientdata(client, state);
+	ret = video_register_device(&state->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret != 0) {
+		dev_err(&client->dev, "Video registering failed: %d\n", ret);
+		goto unreg_v4l2_dev;
+	}
+	return 0;
+
+unreg_v4l2_dev:
+	v4l2_device_unregister(&state->v4l2_dev);
+	cec_notifier_conn_unregister(state->notifier);
+	cancel_delayed_work_sync(&state->dwork_enable_hpd);
+unreg_i2c_all:
+	i2c_unregister_device(state->seg_client);
+unreg_i2c_first:
+	i2c_unregister_device(state->data_client);
+free_state:
+	kfree(state);
+	return ret;
+}
+
+static int cat24c208_remove(struct i2c_client *client)
+{
+	struct cat24c208_state *state = i2c_get_clientdata(client);
+
+	cancel_delayed_work_sync(&state->dwork_enable_hpd);
+	cec_notifier_conn_unregister(state->notifier);
+	i2c_unregister_device(state->data_client);
+	i2c_unregister_device(state->seg_client);
+	video_unregister_device(&state->vdev);
+
+	return 0;
+}
+
+static const struct of_device_id cat24c208_of_match[] = {
+	{ .compatible = "onnn,cat24c208"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, cat24c208_of_match);
+
+static struct i2c_driver cat24c208_driver = {
+	.driver = {
+		.name	= "cat24c208",
+		.of_match_table = cat24c208_of_match,
+	},
+	.probe_new	= cat24c208_probe,
+	.remove		= cat24c208_remove,
+};
+module_i2c_driver(cat24c208_driver);
-- 
2.37.3

