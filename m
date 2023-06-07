Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0889D726653
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjFGQs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjFGQs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30501FDC
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AyXctrUfoTwlvZnQqB5zl0vSAuCk35E4TLUju/L+FWM=;
        b=U702D/QNDH6PCP4E9pxD79zznk8uPc3WXSJToMsaao0JEdD85H4oEAr0XOXLnW74zYRcMZ
        LpkVNlyn06BkCa7Q9umqhWDpkRKkVJC1K/3L4rOENFMsIkYm1AdzcjVeDUWW4GgkcLdQ1r
        BIlPyUy0/ifS5WG1uVhEiAN0l0/tK/I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-p73RSC4UPB2lFOpuoQm7nA-1; Wed, 07 Jun 2023 12:47:31 -0400
X-MC-Unique: p73RSC4UPB2lFOpuoQm7nA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FF1F80231B;
        Wed,  7 Jun 2023 16:47:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 57452C1603B;
        Wed,  7 Jun 2023 16:47:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 08/28] media: Add MIPI CCI register access helper functions
Date:   Wed,  7 Jun 2023 18:46:52 +0200
Message-Id: <20230607164712.63579-9-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
only a single error check at the end, rather then needing to error
check each individual register access. The first failing call will
set the contents of err to a non 0 value and all other calls will
then become no-ops.

Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/driver-api/media/v4l2-cci.rst  |   5 +
 Documentation/driver-api/media/v4l2-core.rst |   1 +
 drivers/media/v4l2-core/Kconfig              |   5 +
 drivers/media/v4l2-core/Makefile             |   1 +
 drivers/media/v4l2-core/v4l2-cci.c           | 142 +++++++++++++++++++
 include/media/v4l2-cci.h                     | 109 ++++++++++++++
 6 files changed, 263 insertions(+)
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
index 000000000000..21207d137dbe
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MIPI Camera Control Interface (CCI) register access helpers.
+ *
+ * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <media/v4l2-cci.h>
+
+int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
+{
+	int i, len, ret;
+	u8 buf[4];
+
+	if (err && *err)
+		return *err;
+
+	/* Set len to register width in bytes */
+	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
+	reg &= CCI_REG_ADDR_MASK;
+
+	ret = regmap_bulk_read(map, reg, buf, len);
+	if (ret) {
+		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
+		if (err)
+			*err = ret;
+
+		return ret;
+	}
+
+	*val = 0;
+	for (i = 0; i < len; i++) {
+		*val <<= 8;
+		*val |= buf[i];
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cci_read);
+
+int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
+{
+	int i, len, ret;
+	u8 buf[4];
+
+	if (err && *err)
+		return *err;
+
+	/* Set len to register width in bytes */
+	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
+	reg &= CCI_REG_ADDR_MASK;
+
+	for (i = 0; i < len; i++) {
+		buf[len - i - 1] = val & 0xff;
+		val >>= 8;
+	}
+
+	ret = regmap_bulk_write(map, reg, buf, len);
+	if (ret) {
+		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
+		if (err)
+			*err = ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cci_write);
+
+int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
+{
+	int width, ret;
+	u32 readval;
+
+	if (err && *err)
+		return *err;
+
+	/*
+	 * For single byte updates use regmap_update_bits(), this uses
+	 * the regmap-lock to protect against other read-modify-writes racing.
+	 */
+	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
+	if (width == cci_reg_8) {
+		reg &= CCI_REG_ADDR_MASK;
+		ret = regmap_update_bits(map, reg, mask, val);
+		if (ret) {
+			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
+			if (err)
+				*err = ret;
+		}
+
+		return ret;
+	}
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
+int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
+{
+	int i, ret;
+
+	if (err && *err)
+		return *err;
+
+	for (i = 0; i < num_regs; i++) {
+		ret = cci_write(map, regs[i].reg, regs[i].def, err);
+		if (ret)
+			return ret;
+
+		if (regs[i].delay_us)
+			fsleep(regs[i].delay_us);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cci_multi_reg_write);
+
+struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
+{
+	struct regmap_config config = {
+		.reg_bits = reg_addr_bits,
+		.val_bits = 8,
+		.reg_format_endian = REGMAP_ENDIAN_BIG,
+	};
+
+	return devm_regmap_init_i2c(client, &config);
+}
+EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
new file mode 100644
index 000000000000..69b8a7c4a013
--- /dev/null
+++ b/include/media/v4l2-cci.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MIPI Camera Control Interface (CCI) register access helpers.
+ *
+ * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
+ */
+#ifndef _V4L2_CCI_H
+#define _V4L2_CCI_H
+
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/*
+ * Note cci_reg_8 deliberately is 0, not 1, so that raw
+ * (not wrapped in a CCI_REG*() macro) register addresses
+ * do 8 bit wide accesses. This allows unchanged use of register
+ * initialization lists of raw address, value pairs which only
+ * do 8 bit width accesses. Which makes porting drivers easier.
+ */
+enum cci_reg_type {
+	cci_reg_8 = 0,
+	cci_reg_16,
+	cci_reg_24,
+	cci_reg_32,
+};
+
+/*
+ * Macros to define register address with the register width encoded
+ * into the higher bits. CCI_REG8() is a no-op so its use is optional.
+ */
+#define CCI_REG_ADDR_MASK		GENMASK(15, 0)
+#define CCI_REG_WIDTH_SHIFT		16
+#define CCI_REG_WIDTH_MASK		GENMASK(17, 16)
+
+#define CCI_REG8(x)			((cci_reg_8 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG16(x)			((cci_reg_16 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG24(x)			((cci_reg_24 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG32(x)			((cci_reg_32 << CCI_REG_WIDTH_SHIFT) | (x))
+
+/**
+ * cci_read() - Read a value from a single CCI register
+ *
+ * @map: Register map to write to
+ * @reg: Register address to write, use CCI_REG#() macros to encode reg width
+ * @val: Pointer to store read value
+ * @err: optional pointer to store errors, if a previous error is set the write will be skipped
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_read(struct regmap *map, u32 reg, u32 *val, int *err);
+
+/**
+ * cci_write() - Write a value to a single CCI register
+ *
+ * @map: Register map to write to
+ * @reg: Register address to write, use CCI_REG#() macros to encode reg width
+ * @val: Value to be written
+ * @err: optional pointer to store errors, if a previous error is set the write will be skipped
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_write(struct regmap *map, u32 reg, u32 val, int *err);
+
+/**
+ * cci_update_bits() - Perform a read/modify/write cycle on a single CCI register
+ *
+ * @map: Register map to write to
+ * @reg: Register address to write, use CCI_REG#() macros to encode reg width
+ * @mask: Bitmask to change
+ * @val: New value for bitmask
+ * @err: optional pointer to store errors, if a previous error is set the update will be skipped
+ *
+ * For 8 bit width registers this is guaranteed to be atomic wrt other
+ * cci_*() register access functions. For multi-byte width registers
+ * atomicity is NOT guaranteed.
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err);
+
+/**
+ * cci_multi_reg_write() - Write multiple registers to the device
+ *
+ * @map: Register map to write to
+ * @regs: Array of structures containing register-address, value pairs to be written
+ *        register-addresses use CCI_REG#() macros to encode reg width
+ * @num_regs: Number of registers to write
+ * @err: optional pointer to store errors, if a previous error is set the update will be skipped
+ *
+ * Write multiple registers to the device where the set of register, value
+ * pairs are supplied in any order, possibly not all in a single range.
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err);
+
+/**
+ * cci_regmap_init_i2c() - Create regmap to use with cci_*() register access functions
+ *
+ * @client: i2c_client to create the regmap for
+ * @reg_addr_bits: register address width to use (8 or 16)
+ *
+ * Note the memory for the created regmap is devm() managed, tied to the client.
+ *
+ * Return: %0 on success or a negative error code on failure.
+ */
+struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits);
+
+#endif
-- 
2.40.1

