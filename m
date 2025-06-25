Return-Path: <linux-media+bounces-35870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F78AE84D7
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2882164D7F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507A1264A9C;
	Wed, 25 Jun 2025 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="gzJOXPMe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC722641F9;
	Wed, 25 Jun 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858430; cv=none; b=A4fI3utZn6m9C/N0q/JBAmpKQtKGYXXd2T/MaksWGe/XtfQn6G0IrAXvWaNBHVI8DYt5kaj158ddqZvWuGWkD0uTCeFyfnzl7LkDqFpDmR6iIT5H7A4Bz9Cqnn0R6R02iMGnZzpMy3sPJRUb415NYguIajZAc19JkDAUN9rESI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858430; c=relaxed/simple;
	bh=9PM94jbIaN23LqSCDU+9vxJcEhBVzdh32bUit0iUUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiA7mgyG54r4/MCIXxyNtL6oDcwlA+GhqlAGfZSSEeM0HWjO6FBNcbvByw4sxNSWIvt0ulduRI/5uOCu3nkF8guJ+G5zwYUxaFQWZNlY0dk2wHfbd1WMjIeI+XC4sVjGZ7SKJs3NPoPO0qkPckRaBJ8pa1T/nQH798Ku5fxyyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=gzJOXPMe; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=x8IENQRgzPZWrL9KNIvqXNVUQa9JiB/LtQpuLaDdKOw=; b=gzJOXPMe8rKPo6Br
	Ku+D1531A9zlyAr/uaglD1KsrIAgk+2svQZbk2QjbIKfD30ZkxCOxc3BvVJjaL6tJUKmYaQOyqIuM
	ey+Wul8HIxtKxTP4Baf4YQ0VslrzX8WNCPRYb+n22xBKvEvx4imG/XLvwGurX4VOBjd4JWEI9teCE
	9mshg+zpvaF8vIgV+ZNlG+cjrMEK9qOf4+I4nfHTvq4yoQdLFCfyDC5v5nHWn3eBfv4dlaqNl7DCX
	7r0UnIECedfIJ8Xrgay3N/jQqJ+nrZWEKq3kV7v7UAkHTbVKm7e3BegbtgQbahfaTWiwj8owhY/rf
	8CFqIyfTXUPke8Pqow==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uUQFx-00Bvly-2N;
	Wed, 25 Jun 2025 13:33:41 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	lee@kernel.org,
	mchehab@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/4] mfd: wl1273-core: Remove
Date: Wed, 25 Jun 2025 14:32:57 +0100
Message-ID: <20250625133258.78133-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>
References: <20250625133258.78133-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The wl1273 FM radio is on Arnd's unused driver list:

  https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/

remove the core.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mfd/Kconfig       |  10 --
 drivers/mfd/Makefile      |   1 -
 drivers/mfd/wl1273-core.c | 262 --------------------------------------
 3 files changed, 273 deletions(-)
 delete mode 100644 drivers/mfd/wl1273-core.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..c635790afa75 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1889,16 +1889,6 @@ config MENELAUS
 	  and other features that are often used in portable devices like
 	  cell phones and PDAs.
 
-config MFD_WL1273_CORE
-	tristate "TI WL1273 FM radio"
-	depends on I2C
-	select MFD_CORE
-	default n
-	help
-	  This is the core driver for the TI WL1273 FM radio. This MFD
-	  driver connects the radio-wl1273 V4L2 module and the wl1273
-	  audio codec.
-
 config MFD_LM3533
 	tristate "TI/National Semiconductor LM3533 Lighting Power chip"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457..ca351cb0ddcc 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -200,7 +200,6 @@ obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
 obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
 obj-$(CONFIG_MFD_TPS6586X)	+= tps6586x.o
 obj-$(CONFIG_MFD_VX855)		+= vx855.o
-obj-$(CONFIG_MFD_WL1273_CORE)	+= wl1273-core.o
 
 si476x-core-y := si476x-cmd.o si476x-prop.o si476x-i2c.o
 obj-$(CONFIG_MFD_SI476X_CORE)	+= si476x-core.o
diff --git a/drivers/mfd/wl1273-core.c b/drivers/mfd/wl1273-core.c
deleted file mode 100644
index 2f185e93318e..000000000000
--- a/drivers/mfd/wl1273-core.c
+++ /dev/null
@@ -1,262 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * MFD driver for wl1273 FM radio and audio codec submodules.
- *
- * Copyright (C) 2011 Nokia Corporation
- * Author: Matti Aaltonen <matti.j.aaltonen@nokia.com>
- */
-
-#include <linux/mfd/wl1273-core.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-
-#define DRIVER_DESC "WL1273 FM Radio Core"
-
-static const struct i2c_device_id wl1273_driver_id_table[] = {
-	{ WL1273_FM_DRIVER_NAME },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, wl1273_driver_id_table);
-
-static int wl1273_fm_read_reg(struct wl1273_core *core, u8 reg, u16 *value)
-{
-	struct i2c_client *client = core->client;
-	u8 b[2];
-	int r;
-
-	r = i2c_smbus_read_i2c_block_data(client, reg, sizeof(b), b);
-	if (r != 2) {
-		dev_err(&client->dev, "%s: Read: %d fails.\n", __func__, reg);
-		return -EREMOTEIO;
-	}
-
-	*value = (u16)b[0] << 8 | b[1];
-
-	return 0;
-}
-
-static int wl1273_fm_write_cmd(struct wl1273_core *core, u8 cmd, u16 param)
-{
-	struct i2c_client *client = core->client;
-	u8 buf[] = { (param >> 8) & 0xff, param & 0xff };
-	int r;
-
-	r = i2c_smbus_write_i2c_block_data(client, cmd, sizeof(buf), buf);
-	if (r) {
-		dev_err(&client->dev, "%s: Cmd: %d fails.\n", __func__, cmd);
-		return r;
-	}
-
-	return 0;
-}
-
-static int wl1273_fm_write_data(struct wl1273_core *core, u8 *data, u16 len)
-{
-	struct i2c_client *client = core->client;
-	struct i2c_msg msg;
-	int r;
-
-	msg.addr = client->addr;
-	msg.flags = 0;
-	msg.buf = data;
-	msg.len = len;
-
-	r = i2c_transfer(client->adapter, &msg, 1);
-	if (r != 1) {
-		dev_err(&client->dev, "%s: write error.\n", __func__);
-		return -EREMOTEIO;
-	}
-
-	return 0;
-}
-
-/**
- * wl1273_fm_set_audio() -	Set audio mode.
- * @core:			A pointer to the device struct.
- * @new_mode:			The new audio mode.
- *
- * Audio modes are WL1273_AUDIO_DIGITAL and WL1273_AUDIO_ANALOG.
- */
-static int wl1273_fm_set_audio(struct wl1273_core *core, unsigned int new_mode)
-{
-	int r = 0;
-
-	if (core->mode == WL1273_MODE_OFF ||
-	    core->mode == WL1273_MODE_SUSPENDED)
-		return -EPERM;
-
-	if (core->mode == WL1273_MODE_RX && new_mode == WL1273_AUDIO_DIGITAL) {
-		r = wl1273_fm_write_cmd(core, WL1273_PCM_MODE_SET,
-					WL1273_PCM_DEF_MODE);
-		if (r)
-			goto out;
-
-		r = wl1273_fm_write_cmd(core, WL1273_I2S_MODE_CONFIG_SET,
-					core->i2s_mode);
-		if (r)
-			goto out;
-
-		r = wl1273_fm_write_cmd(core, WL1273_AUDIO_ENABLE,
-					WL1273_AUDIO_ENABLE_I2S);
-		if (r)
-			goto out;
-
-	} else if (core->mode == WL1273_MODE_RX &&
-		   new_mode == WL1273_AUDIO_ANALOG) {
-		r = wl1273_fm_write_cmd(core, WL1273_AUDIO_ENABLE,
-					WL1273_AUDIO_ENABLE_ANALOG);
-		if (r)
-			goto out;
-
-	} else if (core->mode == WL1273_MODE_TX &&
-		   new_mode == WL1273_AUDIO_DIGITAL) {
-		r = wl1273_fm_write_cmd(core, WL1273_I2S_MODE_CONFIG_SET,
-					core->i2s_mode);
-		if (r)
-			goto out;
-
-		r = wl1273_fm_write_cmd(core, WL1273_AUDIO_IO_SET,
-					WL1273_AUDIO_IO_SET_I2S);
-		if (r)
-			goto out;
-
-	} else if (core->mode == WL1273_MODE_TX &&
-		   new_mode == WL1273_AUDIO_ANALOG) {
-		r = wl1273_fm_write_cmd(core, WL1273_AUDIO_IO_SET,
-					WL1273_AUDIO_IO_SET_ANALOG);
-		if (r)
-			goto out;
-	}
-
-	core->audio_mode = new_mode;
-out:
-	return r;
-}
-
-/**
- * wl1273_fm_set_volume() -	Set volume.
- * @core:			A pointer to the device struct.
- * @volume:			The new volume value.
- */
-static int wl1273_fm_set_volume(struct wl1273_core *core, unsigned int volume)
-{
-	int r;
-
-	if (volume > WL1273_MAX_VOLUME)
-		return -EINVAL;
-
-	if (core->volume == volume)
-		return 0;
-
-	r = wl1273_fm_write_cmd(core, WL1273_VOLUME_SET, volume);
-	if (r)
-		return r;
-
-	core->volume = volume;
-	return 0;
-}
-
-static int wl1273_core_probe(struct i2c_client *client)
-{
-	struct wl1273_fm_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct wl1273_core *core;
-	struct mfd_cell *cell;
-	int children = 0;
-	int r = 0;
-
-	dev_dbg(&client->dev, "%s\n", __func__);
-
-	if (!pdata) {
-		dev_err(&client->dev, "No platform data.\n");
-		return -EINVAL;
-	}
-
-	if (!(pdata->children & WL1273_RADIO_CHILD)) {
-		dev_err(&client->dev, "Cannot function without radio child.\n");
-		return -EINVAL;
-	}
-
-	core = devm_kzalloc(&client->dev, sizeof(*core), GFP_KERNEL);
-	if (!core)
-		return -ENOMEM;
-
-	core->pdata = pdata;
-	core->client = client;
-	mutex_init(&core->lock);
-
-	i2c_set_clientdata(client, core);
-
-	dev_dbg(&client->dev, "%s: Have V4L2.\n", __func__);
-
-	cell = &core->cells[children];
-	cell->name = "wl1273_fm_radio";
-	cell->platform_data = &core;
-	cell->pdata_size = sizeof(core);
-	children++;
-
-	core->read = wl1273_fm_read_reg;
-	core->write = wl1273_fm_write_cmd;
-	core->write_data = wl1273_fm_write_data;
-	core->set_audio = wl1273_fm_set_audio;
-	core->set_volume = wl1273_fm_set_volume;
-
-	if (pdata->children & WL1273_CODEC_CHILD) {
-		cell = &core->cells[children];
-
-		dev_dbg(&client->dev, "%s: Have codec.\n", __func__);
-		cell->name = "wl1273-codec";
-		cell->platform_data = &core;
-		cell->pdata_size = sizeof(core);
-		children++;
-	}
-
-	dev_dbg(&client->dev, "%s: number of children: %d.\n",
-		__func__, children);
-
-	r = devm_mfd_add_devices(&client->dev, -1, core->cells,
-				 children, NULL, 0, NULL);
-	if (r)
-		goto err;
-
-	return 0;
-
-err:
-	pdata->free_resources();
-
-	dev_dbg(&client->dev, "%s\n", __func__);
-
-	return r;
-}
-
-static struct i2c_driver wl1273_core_driver = {
-	.driver = {
-		.name = WL1273_FM_DRIVER_NAME,
-	},
-	.probe = wl1273_core_probe,
-	.id_table = wl1273_driver_id_table,
-};
-
-static int __init wl1273_core_init(void)
-{
-	int r;
-
-	r = i2c_add_driver(&wl1273_core_driver);
-	if (r) {
-		pr_err(WL1273_FM_DRIVER_NAME
-		       ": driver registration failed\n");
-		return r;
-	}
-
-	return r;
-}
-
-static void __exit wl1273_core_exit(void)
-{
-	i2c_del_driver(&wl1273_core_driver);
-}
-late_initcall(wl1273_core_init);
-module_exit(wl1273_core_exit);
-
-MODULE_AUTHOR("Matti Aaltonen <matti.j.aaltonen@nokia.com>");
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_LICENSE("GPL");
-- 
2.49.0


