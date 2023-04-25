Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B6E6EDC8E
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbjDYH2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbjDYH1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:27:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959B2D32B;
        Tue, 25 Apr 2023 00:27:06 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92A7EAF2;
        Tue, 25 Apr 2023 09:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682407572;
        bh=5XbWTiIe1Ks+IxM3P1FELGZRBPkzubBirGzQluAPLj4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=biEbscUdM0Koz0k2DtysrhVrGJrpmaNC2WSEDiwmou6dRtN0upns2ErFVELMKeMNd
         rTOX/s3ZtPWio+sEqfFF/2iWiw9Rknt11Xsb+03psveG9wvWtb4xSr459wRZ/VIyiT
         72n6sh3USiiKYLX+l+VLuuciDksaZc/mGqij6yvI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v12 2/8] i2c: add I2C Address Translator (ATR) support
Date:   Tue, 25 Apr 2023 10:25:55 +0300
Message-Id: <20230425072601.51031-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
References: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Luca Ceresoli <luca@lucaceresoli.net>

An ATR is a device that looks similar to an i2c-mux: it has an I2C
slave "upstream" port and N master "downstream" ports, and forwards
transactions from upstream to the appropriate downstream port. But it
is different in that the forwarded transaction has a different slave
address. The address used on the upstream bus is called the "alias"
and is (potentially) different from the physical slave address of the
downstream chip.

Add a helper file (just like i2c-mux.c for a mux or switch) to allow
implementing ATR features in a device driver. The helper takes care or
adapter creation/destruction and translates addresses at each transaction.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
 Documentation/i2c/i2c-address-translators.rst |  96 +++
 Documentation/i2c/index.rst                   |   1 +
 MAINTAINERS                                   |   8 +
 drivers/i2c/Kconfig                           |   9 +
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-atr.c                         | 684 ++++++++++++++++++
 include/linux/i2c-atr.h                       | 116 +++
 7 files changed, 915 insertions(+)
 create mode 100644 Documentation/i2c/i2c-address-translators.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 include/linux/i2c-atr.h

diff --git a/Documentation/i2c/i2c-address-translators.rst b/Documentation/i2c/i2c-address-translators.rst
new file mode 100644
index 000000000000..b22ce9f41ecf
--- /dev/null
+++ b/Documentation/i2c/i2c-address-translators.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+I2C Address Translators
+=======================
+
+Author: Luca Ceresoli <luca@lucaceresoli.net>
+Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+Description
+-----------
+
+An I2C Address Translator (ATR) is a device with an I2C slave parent
+("upstream") port and N I2C master child ("downstream") ports, and
+forwards transactions from upstream to the appropriate downstream port
+with a modified slave address. The address used on the parent bus is
+called the "alias" and is (potentially) different from the physical
+slave address of the child bus. Address translation is done by the
+hardware.
+
+An ATR looks similar to an i2c-mux except:
+ - the address on the parent and child busses can be different
+ - there is normally no need to select the child port; the alias used on the
+   parent bus implies it
+
+The ATR functionality can be provided by a chip with many other features.
+The kernel i2c-atr provides a helper to implement an ATR within a driver.
+
+The ATR creates a new I2C "child" adapter on each child bus. Adding
+devices on the child bus ends up in invoking the driver code to select
+an available alias. Maintaining an appropriate pool of available aliases
+and picking one for each new device is up to the driver implementer. The
+ATR maintains a table of currently assigned alias and uses it to modify
+all I2C transactions directed to devices on the child buses.
+
+A typical example follows.
+
+Topology::
+
+                      Slave X @ 0x10
+              .-----.   |
+  .-----.     |     |---+---- B
+  | CPU |--A--| ATR |
+  `-----'     |     |---+---- C
+              `-----'   |
+                      Slave Y @ 0x10
+
+Alias table:
+
+A, B and C are three physical I2C busses, electrically independent from
+each other. The ATR receives the transactions initiated on bus A and
+propagates them on bus B or bus C or none depending on the device address
+in the transaction and based on the alias table.
+
+Alias table:
+
+.. table::
+
+   ===============   =====
+   Client            Alias
+   ===============   =====
+   X (bus B, 0x10)   0x20
+   Y (bus C, 0x10)   0x30
+   ===============   =====
+
+Transaction:
+
+ - Slave X driver requests a transaction (on adapter B), slave address 0x10
+ - ATR driver finds slave X is on bus B and has alias 0x20, rewrites
+   messages with address 0x20, forwards to adapter A
+ - Physical I2C transaction on bus A, slave address 0x20
+ - ATR chip detects transaction on address 0x20, finds it in table,
+   propagates transaction on bus B with address translated to 0x10,
+   keeps clock streched on bus A waiting for reply
+ - Slave X chip (on bus B) detects transaction at its own physical
+   address 0x10 and replies normally
+ - ATR chip stops clock stretching and forwards reply on bus A,
+   with address translated back to 0x20
+ - ATR driver receives the reply, rewrites messages with address 0x10
+   as they were initially
+ - Slave X driver gets back the msgs[], with reply and address 0x10
+
+Usage:
+
+ 1. In the driver (typically in the probe function) add an ATR by
+    calling i2c_atr_new() passing attach/detach callbacks
+ 2. When the attach callback is called pick an appropriate alias,
+    configure it in the chip and return the chosen alias in the
+    alias_id parameter
+ 3. When the detach callback is called, deconfigure the alias from
+    the chip and put the alias back in the pool for later usage
+
+I2C ATR functions and data structures
+-------------------------------------
+
+.. kernel-doc:: include/linux/i2c-atr.h
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 6270f1fd7d4e..2b213d4ce89c 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -18,6 +18,7 @@ Introduction
    i2c-topology
    muxes/i2c-mux-gpio
    i2c-sysfs
+   i2c-address-translators
 
 Writing device drivers
 ======================
diff --git a/MAINTAINERS b/MAINTAINERS
index e25ebb7c781b..348bc924a56f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9559,6 +9559,14 @@ L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-core-acpi.c
 
+I2C ADDRESS TRANSLATOR (ATR)
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+R:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/i2c-atr.c
+F:	include/linux/i2c-atr.h
+
 I2C CONTROLLER DRIVER FOR NVIDIA GPU
 M:	Ajay Gupta <ajayg@nvidia.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 438905e2a1d0..c6d1a345ea6d 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -71,6 +71,15 @@ config I2C_MUX
 
 source "drivers/i2c/muxes/Kconfig"
 
+config I2C_ATR
+	tristate "I2C Address Translator (ATR) support"
+	help
+	  Enable support for I2C Address Translator (ATR) chips.
+
+	  An ATR allows accessing multiple I2C busses from a single
+	  physical bus via address translation instead of bus selection as
+	  i2c-muxes do.
+
 config I2C_HELPER_AUTO
 	bool "Autoselect pertinent helper modules"
 	default y
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index c1d493dc9bac..3f71ce4711e3 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -13,6 +13,7 @@ i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
 obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
+obj-$(CONFIG_I2C_ATR)		+= i2c-atr.o
 obj-y				+= algos/ busses/ muxes/
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
new file mode 100644
index 000000000000..402182a04efd
--- /dev/null
+++ b/drivers/i2c/i2c-atr.c
@@ -0,0 +1,684 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I2C Address Translator
+ *
+ * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
+ * Copyright (c) 2022,2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ *
+ * Originally based on i2c-mux.c
+ */
+
+#include <linux/fwnode.h>
+#include <linux/i2c-atr.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define ATR_MAX_ADAPTERS 100	/* Just a sanity limit */
+#define ATR_MAX_SYMLINK_LEN 11	/* Longest name is 10 chars: "channel-99" */
+
+/**
+ * struct i2c_atr_alias_pair - Holds the alias assigned to a client.
+ * @node:   List node
+ * @client: Pointer to the client on the child bus
+ * @alias:  I2C alias address assigned by the driver.
+ *          This is the address that will be used to issue I2C transactions
+ *          on the parent (physical) bus.
+ */
+struct i2c_atr_alias_pair {
+	struct list_head node;
+	const struct i2c_client *client;
+	u16 alias;
+};
+
+/**
+ * struct i2c_atr_chan - Data for a channel.
+ * @adap:            The &struct i2c_adapter for the channel
+ * @atr:             The parent I2C ATR
+ * @chan_id:         The ID of this channel
+ * @alias_list:      List of @struct i2c_atr_alias_pair containing the
+ *                   assigned aliases
+ * @orig_addrs_lock: Mutex protecting @orig_addrs
+ * @orig_addrs:      Buffer used to store the original addresses during transmit
+ * @orig_addrs_size: Size of @orig_addrs
+ */
+struct i2c_atr_chan {
+	struct i2c_adapter adap;
+	struct i2c_atr *atr;
+	u32 chan_id;
+
+	struct list_head alias_list;
+
+	/* Lock orig_addrs during xfer */
+	struct mutex orig_addrs_lock;
+	u16 *orig_addrs;
+	unsigned int orig_addrs_size;
+};
+
+/**
+ * struct i2c_atr - The I2C ATR instance
+ * @parent:    The parent &struct i2c_adapter
+ * @dev:       The device that owns the I2C ATR instance
+ * @ops:       &struct i2c_atr_ops
+ * @priv:      Private driver data, set with i2c_atr_set_driver_data()
+ * @algo:      The &struct i2c_algorithm for adapters
+ * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
+ * @max_adapters: Maximum number of adapters this I2C ATR can have
+ * @num_aliases: Number of aliases in the aliases array
+ * @aliases:   The aliases array
+ * @alias_mask_lock: Lock protecting alias_use_mask
+ * @alias_use_mask: Bitmask for used aliases in aliases array
+ * @i2c_nb:    Notifier for remote client add & del events
+ * @adapter:   Array of adapters
+ */
+struct i2c_atr {
+	struct i2c_adapter *parent;
+	struct device *dev;
+	const struct i2c_atr_ops *ops;
+
+	void *priv;
+
+	struct i2c_algorithm algo;
+	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
+	struct mutex lock;
+	int max_adapters;
+
+	size_t num_aliases;
+	const u16 *aliases;
+	/* Protects alias_use_mask */
+	spinlock_t alias_mask_lock;
+	unsigned long *alias_use_mask;
+
+	struct notifier_block i2c_nb;
+
+	struct i2c_adapter *adapter[];
+};
+
+static struct i2c_atr_alias_pair *
+i2c_atr_find_mapping_by_client(const struct list_head *list,
+			       const struct i2c_client *client)
+{
+	struct i2c_atr_alias_pair *c2a;
+
+	list_for_each_entry(c2a, list, node) {
+		if (c2a->client == client)
+			return c2a;
+	}
+
+	return NULL;
+}
+
+static struct i2c_atr_alias_pair *
+i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
+{
+	struct i2c_atr_alias_pair *c2a;
+
+	list_for_each_entry(c2a, list, node) {
+		if (c2a->client->addr == phys_addr)
+			return c2a;
+	}
+
+	return NULL;
+}
+
+/*
+ * Replace all message addresses with their aliases, saving the original
+ * addresses.
+ *
+ * This function is internal for use in i2c_atr_master_xfer(). It must be
+ * followed by i2c_atr_unmap_msgs() to restore the original addresses.
+ */
+static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
+			    int num)
+{
+	struct i2c_atr *atr = chan->atr;
+	static struct i2c_atr_alias_pair *c2a;
+	int i;
+
+	/* Ensure we have enough room to save the original addresses */
+	if (unlikely(chan->orig_addrs_size < num)) {
+		u16 *new_buf;
+
+		/* We don't care about old data, hence no realloc() */
+		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
+		if (!new_buf)
+			return -ENOMEM;
+
+		kfree(chan->orig_addrs);
+		chan->orig_addrs = new_buf;
+		chan->orig_addrs_size = num;
+	}
+
+	for (i = 0; i < num; i++) {
+		chan->orig_addrs[i] = msgs[i].addr;
+
+		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list,
+						   msgs[i].addr);
+		if (!c2a) {
+			dev_err(atr->dev, "client 0x%02x not mapped!\n",
+				msgs[i].addr);
+
+			while (i--)
+				msgs[i].addr = chan->orig_addrs[i];
+
+			return -ENXIO;
+		}
+
+		msgs[i].addr = c2a->alias;
+	}
+
+	return 0;
+}
+
+/*
+ * Restore all message address aliases with the original addresses. This
+ * function is internal for use in i2c_atr_master_xfer() and for this reason it
+ * needs no null and size checks on orig_addr.
+ *
+ * @see i2c_atr_map_msgs()
+ */
+static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
+			       int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		msgs[i].addr = chan->orig_addrs[i];
+}
+
+static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num)
+{
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_adapter *parent = atr->parent;
+	int ret;
+
+	/* Translate addresses */
+	mutex_lock(&chan->orig_addrs_lock);
+
+	ret = i2c_atr_map_msgs(chan, msgs, num);
+	if (ret < 0)
+		goto err_unlock;
+
+	/* Perform the transfer */
+	ret = i2c_transfer(parent, msgs, num);
+
+	/* Restore addresses */
+	i2c_atr_unmap_msgs(chan, msgs, num);
+
+err_unlock:
+	mutex_unlock(&chan->orig_addrs_lock);
+
+	return ret;
+}
+
+static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+			      unsigned short flags, char read_write, u8 command,
+			      int size, union i2c_smbus_data *data)
+{
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_adapter *parent = atr->parent;
+	struct i2c_atr_alias_pair *c2a;
+
+	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
+	if (!c2a) {
+		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
+		return -ENXIO;
+	}
+
+	return i2c_smbus_xfer(parent, c2a->alias, flags, read_write, command,
+			      size, data);
+}
+
+static u32 i2c_atr_functionality(struct i2c_adapter *adap)
+{
+	struct i2c_atr_chan *chan = adap->algo_data;
+	struct i2c_adapter *parent = chan->atr->parent;
+
+	return parent->algo->functionality(parent);
+}
+
+static void i2c_atr_lock_bus(struct i2c_adapter *adapter, unsigned int flags)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+
+	mutex_lock(&atr->lock);
+}
+
+static int i2c_atr_trylock_bus(struct i2c_adapter *adapter, unsigned int flags)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+
+	return mutex_trylock(&atr->lock);
+}
+
+static void i2c_atr_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+
+	mutex_unlock(&atr->lock);
+}
+
+static const struct i2c_lock_operations i2c_atr_lock_ops = {
+	.lock_bus =    i2c_atr_lock_bus,
+	.trylock_bus = i2c_atr_trylock_bus,
+	.unlock_bus =  i2c_atr_unlock_bus,
+};
+
+static int i2c_atr_reserve_alias(struct i2c_atr *atr)
+{
+	unsigned long idx;
+
+	spin_lock(&atr->alias_mask_lock);
+
+	idx = find_first_zero_bit(atr->alias_use_mask, atr->num_aliases);
+	if (idx >= atr->num_aliases) {
+		spin_unlock(&atr->alias_mask_lock);
+		dev_err(atr->dev, "failed to find a free alias\n");
+		return -EBUSY;
+	}
+
+	set_bit(idx, atr->alias_use_mask);
+
+	spin_unlock(&atr->alias_mask_lock);
+
+	return atr->aliases[idx];
+}
+
+static void i2c_atr_release_alias(struct i2c_atr *atr, u16 alias)
+{
+	unsigned int idx;
+
+	spin_lock(&atr->alias_mask_lock);
+
+	for (idx = 0; idx < atr->num_aliases; ++idx) {
+		if (atr->aliases[idx] == alias) {
+			clear_bit(idx, atr->alias_use_mask);
+			spin_unlock(&atr->alias_mask_lock);
+			return;
+		}
+	}
+
+	spin_unlock(&atr->alias_mask_lock);
+
+	 /* This should never happen */
+	dev_warn(atr->dev, "Unable to find mapped alias\n");
+}
+
+static int i2c_atr_attach_client(struct i2c_adapter *adapter,
+				 const struct i2c_client *client)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_atr_alias_pair *c2a;
+	u16 alias;
+	int ret;
+
+	ret = i2c_atr_reserve_alias(atr);
+	if (ret < 0)
+		return ret;
+
+	alias = ret;
+
+	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
+	if (!c2a) {
+		ret = -ENOMEM;
+		goto err_release_alias;
+	}
+
+	ret = atr->ops->attach_client(atr, chan->chan_id, client, alias);
+	if (ret)
+		goto err_free;
+
+	dev_dbg(atr->dev, "chan%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
+		chan->chan_id, client->addr, alias, client->name);
+
+	c2a->client = client;
+	c2a->alias = alias;
+	list_add(&c2a->node, &chan->alias_list);
+
+	return 0;
+
+err_free:
+	kfree(c2a);
+err_release_alias:
+	i2c_atr_release_alias(atr, alias);
+
+	return ret;
+}
+
+static void i2c_atr_detach_client(struct i2c_adapter *adapter,
+				  const struct i2c_client *client)
+{
+	struct i2c_atr_chan *chan = adapter->algo_data;
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_atr_alias_pair *c2a;
+
+	atr->ops->detach_client(atr, chan->chan_id, client);
+
+	c2a = i2c_atr_find_mapping_by_client(&chan->alias_list, client);
+	if (!c2a) {
+		 /* This should never happen */
+		dev_warn(atr->dev, "Unable to find address mapping\n");
+		return;
+	}
+
+	i2c_atr_release_alias(atr, c2a->alias);
+
+	dev_dbg(atr->dev,
+		"chan%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
+		chan->chan_id, client->addr, c2a->alias, client->name);
+
+	list_del(&c2a->node);
+	kfree(c2a);
+}
+
+static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
+				     unsigned long event, void *device)
+{
+	struct i2c_atr *atr = container_of(nb, struct i2c_atr, i2c_nb);
+	struct device *dev = device;
+	struct i2c_client *client;
+	u32 chan_id;
+	int ret;
+
+	client = i2c_verify_client(dev);
+	if (!client)
+		return NOTIFY_DONE;
+
+	/* Is the client in one of our adapters? */
+	for (chan_id = 0; chan_id < atr->max_adapters; ++chan_id) {
+		if (client->adapter == atr->adapter[chan_id])
+			break;
+	}
+
+	if (chan_id == atr->max_adapters)
+		return NOTIFY_DONE;
+
+	switch (event) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		ret = i2c_atr_attach_client(client->adapter, client);
+		if (ret)
+			dev_err(atr->dev,
+				"Failed to attach remote client '%s': %d\n",
+				dev_name(dev), ret);
+		break;
+
+	case BUS_NOTIFY_DEL_DEVICE:
+		i2c_atr_detach_client(client->adapter, client);
+		break;
+
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
+{
+	struct device *dev = atr->dev;
+	unsigned long *alias_use_mask;
+	size_t num_aliases;
+	u16 *aliases;
+	int ret;
+
+	ret = fwnode_property_count_u16(dev_fwnode(dev), "i2c-alias-pool");
+	if (ret < 0) {
+		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
+			ret);
+		return ret;
+	}
+
+	num_aliases = ret;
+
+	if (!num_aliases)
+		return 0;
+
+	aliases = kcalloc(num_aliases, sizeof(*aliases), GFP_KERNEL);
+	if (!aliases)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u16_array(dev_fwnode(dev), "i2c-alias-pool",
+					     aliases, num_aliases);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
+			ret);
+		kfree(aliases);
+		return ret;
+	}
+
+	alias_use_mask = bitmap_zalloc(num_aliases, GFP_KERNEL);
+	if (!alias_use_mask) {
+		kfree(aliases);
+		return -ENOMEM;
+	}
+
+	atr->num_aliases = num_aliases;
+	atr->aliases = aliases;
+	atr->alias_use_mask = alias_use_mask;
+
+	dev_dbg(dev, "i2c-alias-pool has %zu aliases", atr->num_aliases);
+
+	return 0;
+}
+
+struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
+			    const struct i2c_atr_ops *ops, int max_adapters)
+{
+	struct i2c_atr *atr;
+	int ret;
+
+	if (max_adapters > ATR_MAX_ADAPTERS)
+		return ERR_PTR(-EINVAL);
+
+	if (!ops || !ops->attach_client || !ops->detach_client)
+		return ERR_PTR(-EINVAL);
+
+	atr = kzalloc(struct_size(atr, adapter, max_adapters), GFP_KERNEL);
+	if (!atr)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&atr->lock);
+	spin_lock_init(&atr->alias_mask_lock);
+
+	atr->parent = parent;
+	atr->dev = dev;
+	atr->ops = ops;
+	atr->max_adapters = max_adapters;
+
+	if (parent->algo->master_xfer)
+		atr->algo.master_xfer = i2c_atr_master_xfer;
+	if (parent->algo->smbus_xfer)
+		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
+	atr->algo.functionality = i2c_atr_functionality;
+
+	ret = i2c_atr_parse_alias_pool(atr);
+	if (ret)
+		goto err_destroy_mutex;
+
+	atr->i2c_nb.notifier_call = i2c_atr_bus_notifier_call;
+	ret = bus_register_notifier(&i2c_bus_type, &atr->i2c_nb);
+	if (ret)
+		goto err_free_aliases;
+
+	return atr;
+
+err_free_aliases:
+	bitmap_free(atr->alias_use_mask);
+	kfree(atr->aliases);
+err_destroy_mutex:
+	mutex_destroy(&atr->lock);
+	kfree(atr);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_new, I2C_ATR);
+
+void i2c_atr_delete(struct i2c_atr *atr)
+{
+	unsigned int i;
+
+	for (i = 0; i < atr->max_adapters; ++i)
+		WARN_ON(atr->adapter[i]);
+
+	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
+	bitmap_free(atr->alias_use_mask);
+	kfree(atr->aliases);
+	mutex_destroy(&atr->lock);
+	kfree(atr);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
+
+int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
+			struct device *adapter_parent,
+			struct fwnode_handle *bus_handle)
+{
+	struct i2c_adapter *parent = atr->parent;
+	struct device *dev = atr->dev;
+	struct i2c_atr_chan *chan;
+	char symlink_name[ATR_MAX_SYMLINK_LEN];
+	int ret;
+
+	if (chan_id >= atr->max_adapters) {
+		dev_err(dev, "No room for more i2c-atr adapters\n");
+		return -EINVAL;
+	}
+
+	if (atr->adapter[chan_id]) {
+		dev_err(dev, "Adapter %d already present\n", chan_id);
+		return -EEXIST;
+	}
+
+	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	if (!adapter_parent)
+		adapter_parent = dev;
+
+	chan->atr = atr;
+	chan->chan_id = chan_id;
+	INIT_LIST_HEAD(&chan->alias_list);
+	mutex_init(&chan->orig_addrs_lock);
+
+	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
+		 i2c_adapter_id(parent), chan_id);
+	chan->adap.owner = THIS_MODULE;
+	chan->adap.algo = &atr->algo;
+	chan->adap.algo_data = chan;
+	chan->adap.dev.parent = adapter_parent;
+	chan->adap.retries = parent->retries;
+	chan->adap.timeout = parent->timeout;
+	chan->adap.quirks = parent->quirks;
+	chan->adap.lock_ops = &i2c_atr_lock_ops;
+
+	if (bus_handle) {
+		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
+	} else {
+		struct fwnode_handle *atr_node;
+		struct fwnode_handle *child;
+		u32 reg;
+
+		atr_node = device_get_named_child_node(dev, "i2c-atr");
+
+		fwnode_for_each_child_node(atr_node, child) {
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret)
+				continue;
+			if (chan_id == reg)
+				break;
+		}
+
+		device_set_node(&chan->adap.dev, child);
+		fwnode_handle_put(atr_node);
+	}
+
+	atr->adapter[chan_id] = &chan->adap;
+
+	ret = i2c_add_adapter(&chan->adap);
+	if (ret) {
+		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
+			chan_id, ret);
+		goto err_fwnode_put;
+	}
+
+	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
+		 chan->chan_id);
+
+	ret = sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device");
+	if (ret)
+		dev_warn(dev, "can't create symlink to atr device\n");
+	ret = sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name);
+	if (ret)
+		dev_warn(dev, "can't create symlink for channel %u\n", chan_id);
+
+	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
+
+	return 0;
+
+err_fwnode_put:
+	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
+	mutex_destroy(&chan->orig_addrs_lock);
+	kfree(chan);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_add_adapter, I2C_ATR);
+
+void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
+{
+	char symlink_name[ATR_MAX_SYMLINK_LEN];
+	struct i2c_adapter *adap;
+	struct i2c_atr_chan *chan;
+	struct fwnode_handle *fwnode;
+	struct device *dev = atr->dev;
+
+	adap = atr->adapter[chan_id];
+	if (!adap)
+		return;
+
+	chan = adap->algo_data;
+	fwnode = dev_fwnode(&adap->dev);
+
+	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
+
+	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
+		 chan->chan_id);
+	sysfs_remove_link(&dev->kobj, symlink_name);
+	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
+
+	i2c_del_adapter(adap);
+
+	atr->adapter[chan_id] = NULL;
+
+	fwnode_handle_put(fwnode);
+	mutex_destroy(&chan->orig_addrs_lock);
+	kfree(chan->orig_addrs);
+	kfree(chan);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_del_adapter, I2C_ATR);
+
+void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
+{
+	atr->priv = data;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
+
+void *i2c_atr_get_driver_data(struct i2c_atr *atr)
+{
+	return atr->priv;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
+MODULE_DESCRIPTION("I2C Address Translator");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
new file mode 100644
index 000000000000..4d5da161c225
--- /dev/null
+++ b/include/linux/i2c-atr.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * I2C Address Translator
+ *
+ * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
+ * Copyright (c) 2022,2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ *
+ * Based on i2c-mux.h
+ */
+
+#ifndef _LINUX_I2C_ATR_H
+#define _LINUX_I2C_ATR_H
+
+#include <linux/i2c.h>
+#include <linux/types.h>
+
+struct device;
+struct fwnode_handle;
+struct i2c_atr;
+
+/**
+ * struct i2c_atr_ops - Callbacks from ATR to the device driver.
+ * @attach_client: Notify the driver of a new device connected on a child
+ *                 bus, with the alias assigned to it. The driver must
+ *                 configure the hardware to use the alias.
+ * @detach_client: Notify the driver of a device getting disconnected. The
+ *                 driver must configure the hardware to stop using the
+ *                 alias.
+ *
+ * All these functions return 0 on success, a negative error code otherwise.
+ */
+struct i2c_atr_ops {
+	int (*attach_client)(struct i2c_atr *atr, u32 chan_id,
+			     const struct i2c_client *client, u16 alias);
+	void (*detach_client)(struct i2c_atr *atr, u32 chan_id,
+			      const struct i2c_client *client);
+};
+
+/**
+ * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
+ * @parent:       The parent (upstream) adapter
+ * @dev:          The device acting as an ATR
+ * @ops:          Driver-specific callbacks
+ * @max_adapters: Maximum number of child adapters
+ *
+ * The new ATR helper is connected to the parent adapter but has no child
+ * adapters. Call i2c_atr_add_adapter() to add some.
+ *
+ * Call i2c_atr_delete() to remove.
+ *
+ * Return: pointer to the new ATR helper object, or ERR_PTR
+ */
+struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
+			    const struct i2c_atr_ops *ops, int max_adapters);
+
+/**
+ * i2c_atr_delete - Delete an I2C ATR helper.
+ * @atr: I2C ATR helper to be deleted.
+ *
+ * Precondition: all the adapters added with i2c_atr_add_adapter() must be
+ * removed by calling i2c_atr_del_adapter().
+ */
+void i2c_atr_delete(struct i2c_atr *atr);
+
+/**
+ * i2c_atr_add_adapter - Create a child ("downstream") I2C bus.
+ * @atr:        The I2C ATR
+ * @chan_id:    Index of the new adapter (0 .. max_adapters-1).  This value is
+ *              passed to the callbacks in `struct i2c_atr_ops`.
+ * @adapter_parent: The device used as the parent of the new i2c adapter, or NULL
+ *                  to use the i2c-atr device as the parent.
+ * @bus_handle: The fwnode handle that points to the adapter's i2c
+ *              peripherals, or NULL.
+ *
+ * After calling this function a new i2c bus will appear. Adding and removing
+ * devices on the downstream bus will result in calls to the
+ * &i2c_atr_ops->attach_client and &i2c_atr_ops->detach_client callbacks for the
+ * driver to assign an alias to the device.
+ *
+ * The adapter's fwnode is set to @bus_handle, or if @bus_handle is NULL the
+ * function looks for a child node whose 'reg' property matches the chan_id
+ * under the i2c-atr device's 'i2c-atr' node.
+ *
+ * Call i2c_atr_del_adapter() to remove the adapter.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
+			struct device *adapter_parent,
+			struct fwnode_handle *bus_handle);
+
+/**
+ * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by
+ *                       i2c_atr_add_adapter(). If no I2C bus has been added
+ *                       this function is a no-op.
+ * @atr:     The I2C ATR
+ * @chan_id: Index of the adapter to be removed (0 .. max_adapters-1)
+ */
+void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id);
+
+/**
+ * i2c_atr_set_driver_data - Set private driver data to the i2c-atr instance.
+ * @atr:  The I2C ATR
+ * @data: Pointer to the data to store
+ */
+void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data);
+
+/**
+ * i2c_atr_get_driver_data - Get the stored drive data.
+ * @atr:     The I2C ATR
+ *
+ * Return: Pointer to the stored data
+ */
+void *i2c_atr_get_driver_data(struct i2c_atr *atr);
+
+#endif /* _LINUX_I2C_ATR_H */
-- 
2.34.1

