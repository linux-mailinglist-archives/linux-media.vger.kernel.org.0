Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB05273163E
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 13:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240189AbjFOLOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 07:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245402AbjFOLOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 07:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E172721
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 04:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686827613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8t0mJgDjvP78MQYm99BtVcnlwjpOd2YZ6aXhlGuIPfU=;
        b=CLoEIW9qUFh7Fk7ddDdwq+qpTVzFzSJ1TiINqsyG6VauvzChIyFsyldDyg5IPrmmJhm47F
        au7nbJuHGcxda6up+ZqOuDWxxgR/iTB/d9hU4P1RoxL3OnG2hWR6JAf4sJdbZvlvob8lYr
        YqyU4OBe03VOqj6WD7lLhRH+cxl4bYQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-C7k0bc8XN9uHuz8YSvwIbQ-1; Thu, 15 Jun 2023 07:13:26 -0400
X-MC-Unique: C7k0bc8XN9uHuz8YSvwIbQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70BE29AA2DA;
        Thu, 15 Jun 2023 11:13:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B63E492C1B;
        Thu, 15 Jun 2023 11:13:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 1/5] media: Add MIPI CCI register access helper functions
Date:   Thu, 15 Jun 2023 13:13:18 +0200
Message-Id: <20230615111322.68204-2-hdegoede@redhat.com>
In-Reply-To: <20230615111322.68204-1-hdegoede@redhat.com>
References: <20230615111322.68204-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI2 specification specifies a standard method to access camera sensor
registers called "Camera Control Interface (CCI)".

This uses either 8 or 16 bit (big-endian wire order) register addresses
and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.

Currently a lot of Linux camera sensor drivers all have their own custom
helpers for this, often copy and pasted from other drivers.

Add a set of generic helpers for this so that all sensor drivers can
switch to a single common implementation.

These helpers take an extra optional "int *err" function parameter,
this can be used to chain a bunch of register accesses together with
only a single error check at the end, rather than needing to error
check each individual register access. The first failing call will
set the contents of err to a non 0 value and all other calls will
then become no-ops.

Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3
- Use unsigned int instead of int in a couple of places
- Run + fix checkpatch.pl --strict --max-line-length=80
- Rename cci_regmap_init_i2c() to devm_cci_regmap_init_i2c()
- Some small kerneldoc text tweaks

Changes in v2:
- Drop cci_reg_type enum
- Make having an encoded reg-width mandatory rather then using 0 to encode
  8 bit width making reg-addresses without an encoded width default to
  a width of 8
- Add support for 64 bit wide registers
- Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
  support and without the delay_us field
- Various kerneldoc updates
- Stop supporting delays in cci_multi_reg_write()
- Some includes cleanups
- Disable regmap locking
---
 Documentation/driver-api/media/v4l2-cci.rst  |   5 +
 Documentation/driver-api/media/v4l2-core.rst |   1 +
 drivers/media/v4l2-core/Kconfig              |   5 +
 drivers/media/v4l2-core/Makefile             |   1 +
 drivers/media/v4l2-core/v4l2-cci.c           | 163 +++++++++++++++++++
 include/media/v4l2-cci.h                     | 123 ++++++++++++++
 6 files changed, 298 insertions(+)
 create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
 create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
 create mode 100644 include/media/v4l2-cci.h

diff --git a/Documentation/driver-api/media/v4l2-cci.rst b/Documentation/driver-api/media/v4l2-cci.rst
new file mode 100644
index 000000000000..dd297a40ed20
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-cci.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 CCI kAPI
+^^^^^^^^^^^^^
+.. kernel-doc:: include/media/v4l2-cci.h
diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index 1a8c4a5f256b..239045ecc8f4 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -22,6 +22,7 @@ Video4Linux devices
     v4l2-mem2mem
     v4l2-async
     v4l2-fwnode
+    v4l2-cci
     v4l2-rect
     v4l2-tuner
     v4l2-common
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 348559bc2468..523ba243261d 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -74,6 +74,11 @@ config V4L2_FWNODE
 config V4L2_ASYNC
 	tristate
 
+config V4L2_CCI
+	tristate
+	depends on I2C
+	select REGMAP_I2C
+
 # Used by drivers that need Videobuf modules
 config VIDEOBUF_GEN
 	tristate
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 41d91bd10cf2..be2551705755 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -25,6 +25,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 # (e. g. LC_ALL=C sort Makefile)
 
 obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
+obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
new file mode 100644
index 000000000000..de1e59b2ebde
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MIPI Camera Control Interface (CCI) register access helpers.
+ *
+ * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <asm/unaligned.h>
+
+#include <media/v4l2-cci.h>
+
+int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
+{
+	unsigned int len;
+	u8 buf[8];
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
+	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
+
+	ret = regmap_bulk_read(map, reg, buf, len);
+	if (ret) {
+		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n",
+			reg, ret);
+		goto out;
+	}
+
+	switch (len) {
+	case 1:
+		*val = buf[0];
+		break;
+	case 2:
+		*val = get_unaligned_be16(buf);
+		break;
+	case 3:
+		*val = get_unaligned_be24(buf);
+		break;
+	case 4:
+		*val = get_unaligned_be32(buf);
+		break;
+	case 8:
+		*val = get_unaligned_be64(buf);
+		break;
+	default:
+		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
+			len, reg);
+		ret = -EINVAL;
+		break;
+	}
+
+out:
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cci_read);
+
+int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
+{
+	unsigned int len;
+	u8 buf[8];
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
+	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
+
+	switch (len) {
+	case 1:
+		buf[0] = val;
+		break;
+	case 2:
+		put_unaligned_be16(val, buf);
+		break;
+	case 3:
+		put_unaligned_be24(val, buf);
+		break;
+	case 4:
+		put_unaligned_be32(val, buf);
+		break;
+	case 8:
+		put_unaligned_be64(val, buf);
+		break;
+	default:
+		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
+			len, reg);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = regmap_bulk_write(map, reg, buf, len);
+	if (ret)
+		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n",
+			reg, ret);
+
+out:
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cci_write);
+
+int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err)
+{
+	u64 readval;
+	int ret;
+
+	ret = cci_read(map, reg, &readval, err);
+	if (ret)
+		return ret;
+
+	val = (readval & ~mask) | (val & mask);
+
+	return cci_write(map, reg, val, err);
+}
+EXPORT_SYMBOL_GPL(cci_update_bits);
+
+int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
+			unsigned int num_regs, int *err)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_regs; i++) {
+		ret = cci_write(map, regs[i].reg, regs[i].val, err);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cci_multi_reg_write);
+
+struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
+					int reg_addr_bits)
+{
+	struct regmap_config config = {
+		.reg_bits = reg_addr_bits,
+		.val_bits = 8,
+		.reg_format_endian = REGMAP_ENDIAN_BIG,
+		.disable_locking = true,
+	};
+
+	return devm_regmap_init_i2c(client, &config);
+}
+EXPORT_SYMBOL_GPL(devm_cci_regmap_init_i2c);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
new file mode 100644
index 000000000000..de5eb8c2a575
--- /dev/null
+++ b/include/media/v4l2-cci.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MIPI Camera Control Interface (CCI) register access helpers.
+ *
+ * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
+ */
+#ifndef _V4L2_CCI_H
+#define _V4L2_CCI_H
+
+#include <linux/types.h>
+
+struct i2c_client;
+struct regmap;
+
+/**
+ * struct cci_reg_sequence - An individual write from a sequence of CCI writes
+ *
+ * @reg: Register address, use CCI_REG#() macros to encode reg width
+ * @val: Register value
+ *
+ * Register/value pairs for sequences of writes.
+ */
+struct cci_reg_sequence {
+	u32 reg;
+	u64 val;
+};
+
+/*
+ * Macros to define register address with the register width encoded
+ * into the higher bits.
+ */
+#define CCI_REG_ADDR_MASK		GENMASK(15, 0)
+#define CCI_REG_WIDTH_SHIFT		16
+#define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
+
+#define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
+
+/**
+ * cci_read() - Read a value from a single CCI register
+ *
+ * @map: Register map to read from
+ * @reg: Register address to read, use CCI_REG#() macros to encode reg width
+ * @val: Pointer to store read value
+ * @err: Optional pointer to store errors, if a previous error is set
+ *       then the read will be skipped
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_read(struct regmap *map, u32 reg, u64 *val, int *err);
+
+/**
+ * cci_write() - Write a value to a single CCI register
+ *
+ * @map: Register map to write to
+ * @reg: Register address to write, use CCI_REG#() macros to encode reg width
+ * @val: Value to be written
+ * @err: Optional pointer to store errors, if a previous error is set
+ *       then the write will be skipped
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_write(struct regmap *map, u32 reg, u64 val, int *err);
+
+/**
+ * cci_update_bits() - Perform a read/modify/write cycle on
+ *                     a single CCI register
+ *
+ * @map: Register map to update
+ * @reg: Register address to update, use CCI_REG#() macros to encode reg width
+ * @mask: Bitmask to change
+ * @val: New value for bitmask
+ * @err: Optional pointer to store errors, if a previous error is set
+ *       then the update will be skipped
+ *
+ * Note this uses read-modify-write to update the bits, atomicity with regards
+ * to other cci_*() register access functions is NOT guaranteed.
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err);
+
+/**
+ * cci_multi_reg_write() - Write multiple registers to the device
+ *
+ * @map: Register map to write to
+ * @regs: Array of structures containing register-address, -value pairs to be
+ *        written, register-addresses use CCI_REG#() macros to encode reg width
+ * @num_regs: Number of registers to write
+ * @err: Optional pointer to store errors, if a previous error is set
+ *       then the write will be skipped
+ *
+ * Write multiple registers to the device where the set of register, value
+ * pairs are supplied in any order, possibly not all in a single range.
+ *
+ * Use of the CCI_REG#() macros to encode reg width is mandatory.
+ *
+ * For raw lists of register-address, -value pairs with only 8 bit
+ * wide writes regmap_multi_reg_write() can be used instead.
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
+			unsigned int num_regs, int *err);
+
+/**
+ * devm_cci_regmap_init_i2c() - Create regmap to use with cci_*() register
+ *                              access functions
+ *
+ * @client: i2c_client to create the regmap for
+ * @reg_addr_bits: register address width to use (8 or 16)
+ *
+ * Note the memory for the created regmap is devm() managed, tied to the client.
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
+					int reg_addr_bits);
+
+#endif
-- 
2.40.1

