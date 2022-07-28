Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5966F583DDC
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 13:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236852AbiG1LmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 07:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236766AbiG1Llw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 07:41:52 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A2E274
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 04:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13925; q=dns/txt;
  s=iport; t=1659008510; x=1660218110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IKXVV0ztDz0i+SZ/H4TZ5KDpyReoBLHDYk70U8ftTRw=;
  b=bYyamZSkpUDRiQDMuYO0Urj+QLEu6IK+bky6YKM2WUty9ccvXV++7xIk
   huu+rwlgfPuGEqFgLMmduXufBxZlkWMS0wHNf3TfVdJwYmy9vHHJ0gzPa
   8qzWh3nhvyx23E9/Y6Wv+NNb8HJFnkQYbUY13iMks6YAxOnA2b2aB1ZQJ
   g=;
X-IronPort-AV: E=Sophos;i="5.93,198,1654560000"; 
   d="scan'208";a="612022"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Jul 2022 11:40:44 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 26SBegI5010979;
        Thu, 28 Jul 2022 11:40:43 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Jonathan Selnes <jonathansb1@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
Date:   Thu, 28 Jul 2022 13:40:49 +0200
Message-Id: <20220728114050.2400475-5-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728114050.2400475-1-hljunggr@cisco.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
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
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 MAINTAINERS                   |   7 +
 drivers/media/i2c/Kconfig     |   9 +
 drivers/media/i2c/Makefile    |   1 +
 drivers/media/i2c/cat24c208.c | 421 ++++++++++++++++++++++++++++++++++
 4 files changed, 438 insertions(+)
 create mode 100644 drivers/media/i2c/cat24c208.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a1d3d2b42bc..97d7ead555ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14632,6 +14632,13 @@ S:	Maintained
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
index fae2baabb773..10d437f79a35 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1529,6 +1529,15 @@ endmenu
 menu "Miscellaneous helper chips"
 	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
+config VIDEO_CAT24C208
+	tristate "ON Semiconductor cat24c208 EDID EEPROM"
+	depends on VIDEO_DEV && I2C
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
index 3e1696963e7f..ae5a88204892 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
 obj-$(CONFIG_VIDEO_HI556) += hi556.o
 obj-$(CONFIG_VIDEO_HI846) += hi846.o
 obj-$(CONFIG_VIDEO_HI847) += hi847.o
+obj-$(CONFIG_VIDEO_CAT24C208) += cat24c208.o
 obj-$(CONFIG_VIDEO_I2C) += video-i2c.o
 obj-$(CONFIG_VIDEO_IMX208) += imx208.o
 obj-$(CONFIG_VIDEO_IMX214) += imx214.o
diff --git a/drivers/media/i2c/cat24c208.c b/drivers/media/i2c/cat24c208.c
new file mode 100644
index 000000000000..b56e5f829a8d
--- /dev/null
+++ b/drivers/media/i2c/cat24c208.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * cat24c208 - HDMI i2c controlled EEPROM from ON Semiconductor or Catalyst Semiconductor
+ *
+ * cat24c208.c - Support for i2c based DDC EEPROM
+ *
+ * Copyright (C) 2021-2022 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * REF_01 - ON Semiconductor, cat24c208, Datasheet, URL : https://www.onsemi.com/pdf/datasheet/cat24c208-d.pdf
+ *	Revision 7, May 2018
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+#include <linux/kernel.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
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
+#define EDID_EXT_FLAG_BIT	126
+#define MAX_WRITE_BYTES		16
+#define NUM_BLOCKS		4
+#define NUM_CLIENTS		3
+#define CONFIG_NB_BIT		BIT(0)
+#define CONFIG_AB0_BIT		BIT(1)
+#define CONFIG_AB1_BIT		BIT(2)
+#define CONFIG_WE_BIT		BIT(3)
+
+/*
+ * From the datasheet:
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
+	struct i2c_client *i2c_clients[NUM_CLIENTS];
+	// V4L2 ioctl serialization
+	struct mutex lock;
+
+	struct v4l2_device v4l2_dev;
+	struct video_device vdev;
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
+	struct i2c_client *dev_client = state->i2c_clients[0];
+	struct i2c_client *data_client = state->i2c_clients[1];
+	struct i2c_client *seg_client = state->i2c_clients[2];
+
+	struct i2c_msg msg[] = {
+		{
+			.addr = seg_client->addr,	// Segment
+			.buf = &seg,
+			.len = 1,
+			.flags = 0,
+		},
+		{
+			.addr = data_client->addr,	// write data
+			.buf = data,
+			.len = len,
+			.flags = 0,
+		},
+	};
+	int err;
+
+	if (seg)
+		err = i2c_transfer(dev_client->adapter, msg, ARRAY_SIZE(msg));
+	else
+		err = i2c_transfer(dev_client->adapter, &msg[1], 1);
+	if (err < 0)
+		dev_err(&dev_client->dev, "Writing to 0x%x failed (segment %d)\n",
+			data_client->addr, seg);
+
+	usleep_range(WRITE_CYCLE_TIME_US, 2 * WRITE_CYCLE_TIME_US);
+	return err < 0 ? err : 0;
+}
+
+static int cat24c208_edid_read(struct cat24c208_state *state, u8 *data, u8 seg, u8 offset, u16 len)
+{
+	struct i2c_client *dev_client = state->i2c_clients[0];
+	struct i2c_client *data_client = state->i2c_clients[1];
+	struct i2c_client *seg_client = state->i2c_clients[2];
+	int err;
+
+	len *= BYTES_PER_BLOCK;
+	if (seg) {
+		struct i2c_msg msg[] = {
+			{
+				.addr = seg_client->addr,	// Segment
+				.buf = &seg,
+				.len = 1,
+				.flags = 0,
+			},
+			{
+				.addr = data_client->addr,	// read data
+				.buf = data,
+				.len = len,
+				.flags = I2C_M_RD,
+			},
+		};
+		err = i2c_transfer(dev_client->adapter, msg, ARRAY_SIZE(msg));
+	} else {
+		struct i2c_msg msg[] = {
+			{
+				.addr = data_client->addr,	// set offset
+				.buf = &offset,
+				.len = 1,
+				.flags = 0,
+			},
+			{
+				.addr = data_client->addr,	// read data
+				.buf = data,
+				.len = len,
+				.flags = I2C_M_RD,
+			},
+		};
+		err = i2c_transfer(dev_client->adapter, msg, ARRAY_SIZE(msg));
+	}
+
+	if (err < 0)
+		dev_err(&dev_client->dev, "Reading of EDID failed\n");
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
+static int cat24c208_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+{
+	struct cat24c208_state *state = video_drvdata(file);
+	u8 buf[MAX_WRITE_BYTES + 1];
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
+			dev_err(&state->i2c_clients[0]->dev,
+				"Could not write EDID to EEPROM, i: %d\n", i);
+			return err;
+		}
+	}
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
+	strscpy(cap->driver, "cat24c208", sizeof(cap->driver));
+	strscpy(cap->card, "cat24c208 EDID EEPROM", sizeof(cap->card));
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
+	state->i2c_clients[0] = client;
+	state->i2c_clients[1] = i2c_new_ancillary_device(client, "eeprom", EEPROM_I2C_ADDR);
+	if (IS_ERR(state->i2c_clients[1])) {
+		ret = PTR_ERR(state->i2c_clients[1]);
+		goto free_state;
+	}
+	state->i2c_clients[2] = i2c_new_ancillary_device(client, "segment", SEGMENT_I2C_ADDR);
+	if (IS_ERR(state->i2c_clients[2])) {
+		ret = PTR_ERR(state->i2c_clients[2]);
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
+		blocks = 1 + state->edid[126];
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
+	snprintf(state->vdev.name, sizeof(state->vdev.name),
+		 "cat24c208 %d-%d", client->adapter->nr, client->addr);
+
+	state->vdev.v4l2_dev = v4l2_dev;
+	state->vdev.fops = &cat24c208_fops;
+	state->vdev.ioctl_ops = &cat24c208_ioctl_ops;
+	state->vdev.lock = &state->lock;
+	state->vdev.release = cat24c208_release;
+	state->vdev.device_caps = V4L2_CAP_EDID_MEMORY;
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
+unreg_i2c_all:
+	i2c_unregister_device(state->i2c_clients[2]);
+unreg_i2c_first:
+	i2c_unregister_device(state->i2c_clients[1]);
+free_state:
+	kfree(state);
+	return ret;
+}
+
+static int cat24c208_remove(struct i2c_client *client)
+{
+	struct cat24c208_state *state = i2c_get_clientdata(client);
+
+	i2c_unregister_device(state->i2c_clients[1]);
+	i2c_unregister_device(state->i2c_clients[2]);
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
+		.of_match_table = of_match_ptr(cat24c208_of_match),
+	},
+	.probe_new	= cat24c208_probe,
+	.remove		= cat24c208_remove,
+};
+module_i2c_driver(cat24c208_driver);
-- 
2.37.1

