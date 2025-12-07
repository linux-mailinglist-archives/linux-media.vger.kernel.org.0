Return-Path: <linux-media+bounces-48362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7225CAB7BB
	for <lists+linux-media@lfdr.de>; Sun, 07 Dec 2025 17:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90AC93016352
	for <lists+linux-media@lfdr.de>; Sun,  7 Dec 2025 16:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C882C1596;
	Sun,  7 Dec 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hanne.name header.i=@hanne.name header.b="YxjUXn9x"
X-Original-To: linux-media@vger.kernel.org
Received: from dd11108.kasserver.com (dd11108.kasserver.com [85.13.147.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7DF239E9D
	for <linux-media@vger.kernel.org>; Sun,  7 Dec 2025 16:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.13.147.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125118; cv=none; b=MMH+2GMECbrUoQrHoKmr/fSCSKxaJa5PymTiWu4nvJZAAquwPUFYHybOnJCbxe8I6PbjoTzLhWez2b1vNvxzRT816HrhgqsBk5gfFM4FSIYhxZ32HkKic3OcUfSlTLQ7Sr2ILjxuIv7JGWbSqX8dMFDaNfCug1yIvevPi2K3m5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125118; c=relaxed/simple;
	bh=n2kIue6XYk4W7qjXFHuZmd3iqi4mnvFGccURHBgZNrA=;
	h=Subject:To:From:MIME-Version:Content-Type:Message-Id:Date; b=fTz3A0or76tW8XP+q1VbqVybxHq0vN+UPJXVyTweQGT4/8rizD79SnP45gGlGsJrajH8XiGgns68v2WYHSZCUlsZLzfyaaoxMCr63z9/oOe7F1F4B0Is6tFWcIqqxvNnPPvtfRjBPTSD9Cfbf4WSNeLnNAzd6oU+yXOymGPgOp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jf.hanne.name; spf=none smtp.mailfrom=jf.hanne.name; dkim=pass (2048-bit key) header.d=hanne.name header.i=@hanne.name header.b=YxjUXn9x; arc=none smtp.client-ip=85.13.147.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jf.hanne.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jf.hanne.name
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hanne.name;
	s=kas202509041024; t=1765124799;
	bh=FrXthLRjRHojQji9uxqidvbyg6DecFw8ZiSjIA0Y+mg=;
	h=Subject:To:From:Date:From;
	b=YxjUXn9xTEBuftKbUAW3vHz+wDe2o+fiDxdtwR2GuJv334/1IiSoaHqoHYPA7V4gg
	 9VRND7NeV+LEP4h2CMnaZ0UJXqgQxhLzX11DjrQvNXp5SO+FbuAKDZxxC2bqxPwWT+
	 b4zj/11Gkp6GeNWQEOp87msvpnSr73UWjJ1OFuwiA4JulbGyo6RTA3NCUc95lwFkBn
	 qf7tlcwaAvOoo3qS3uvMjncwEaw5fMfC1U/SIHpYFB8uQ8NYlTcJzBoMF+9nSwezqM
	 RzwHFk3WhYj65JI+1usWsadPMQKpe8hEhcWDYO0HeJgQIyFE8K9/zUVfivTQWA/ahA
	 +/yxWXb5OQU9A==
Received: from dd11108.kasserver.com (dd0802.kasserver.com [85.13.143.1])
	by dd11108.kasserver.com (Postfix) with ESMTPSA id 191BB2FC0C02
	for <linux-media@vger.kernel.org>; Sun,  7 Dec 2025 17:26:39 +0100 (CET)
Subject: [PATCH] media: Add support for Johann's Receiver Board
To: linux-media@vger.kernel.org
From: "J. Hanne" <media@jf.hanne.name>
User-Agent: ALL-INKL Webmail 2.11
X-SenderIP: 79.254.117.192
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <20251207162639.191BB2FC0C02@dd11108.kasserver.com>
Date: Sun,  7 Dec 2025 17:26:39 +0100 (CET)
X-Spamd-Bar: ----

Hi,

this adds support for the open hardware DVB-S2 USB receiver board at https://codeberg.org/jonnyh/jorebo

Regards,
  Johann

---

diff -uNr a/drivers/media/usb/dvb-usb-v2/Kconfig b/drivers/media/usb/dvb-usb-v2/Kconfig
--- a/drivers/media/usb/dvb-usb-v2/Kconfig	2025-12-07 17:06:51
+++ b/drivers/media/usb/dvb-usb-v2/Kconfig	2025-12-07 17:10:41
@@ -175,4 +175,12 @@
 	help
 	  Say Y here to support the ZyDAS ZD1301 DVB USB receiver.
 
+config DVB_USB_JOREBO
+	tristate "Johann's Receiver Board"
+	depends on DVB_USB_V2
+	select DVB_M88DS3103 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_TS2020 if MEDIA_SUBDRV_AUTOSELECT
+	help
+	  Say Y here to support the Johann's Receiver Board DVB-S2 USB receiver.
+
 endif
diff -uNr a/drivers/media/usb/dvb-usb-v2/Makefile b/drivers/media/usb/dvb-usb-v2/Makefile
--- a/drivers/media/usb/dvb-usb-v2/Makefile	2025-12-07 17:06:51
+++ b/drivers/media/usb/dvb-usb-v2/Makefile	2025-12-07 17:12:45
@@ -44,6 +44,9 @@
 dvb-usb-zd1301-objs := zd1301.o
 obj-$(CONFIG_DVB_USB_ZD1301) += zd1301.o
 
+dvb-usb-jorebo-objs := jorebo.o
+obj-$(CONFIG_DVB_USB_JOREBO) += jorebo.o
+
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
 ccflags-y += -I$(srctree)/drivers/media/tuners
 ccflags-y += -I$(srctree)/drivers/media/common
diff -uNr a/drivers/media/usb/dvb-usb-v2/jorebo.c b/drivers/media/usb/dvb-usb-v2/jorebo.c
--- a/drivers/media/usb/dvb-usb-v2/jorebo.c	1970-01-01 01:00:00
+++ b/drivers/media/usb/dvb-usb-v2/jorebo.c	2025-12-07 16:41:02
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: MIT or GPL-2.0-only
+/*
+ * Driver for Johann's Receiver Board
+ * Copyright (C) 2025 Johann Hanne
+ */
+
+#include <linux/module.h>
+
+#include "dvb_usb.h"
+#include "m88ds3103.h"
+#include "ts2020.h"
+
+DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
+
+struct jorebo_state {
+	struct i2c_client *i2c_client_demod;
+	struct i2c_client *i2c_client_tuner;
+	u8 buf[64];
+};
+
+static int jorebo_identify_state(struct dvb_usb_device *d, const char **name)
+{
+	struct usb_device *ud = d->udev;
+
+	if (ud->descriptor.iManufacturer == 0 &&
+	    ud->descriptor.iProduct == 0 &&
+	    ud->descriptor.iSerialNumber == 0) {
+		return COLD;
+	}
+
+	return WARM;
+}
+
+static int jorebo_download_firmware(struct dvb_usb_device *d,
+				    const struct firmware *fw)
+{
+	int retval = 0;
+	struct usb_device *ud = d->udev;
+	unsigned int pipe = usb_sndctrlpipe(ud, 0);
+	int r;
+	u8 *buf = 0;
+	int i;
+
+	buf = kmalloc(64, GFP_KERNEL);
+	if (buf == 0) {
+		retval = -ENOMEM;
+		goto cleanup;
+	}
+
+	buf[0] = 1;
+	r = usb_control_msg(ud, pipe, 0xa0, USB_DIR_OUT | USB_TYPE_VENDOR,
+			    0xe600, 0, buf, 1, 2000);
+	if (r != 1) {
+		retval = -EIO;
+		goto cleanup;
+	}
+
+	for (i = 0; i < fw->size; i += 64) {
+		memcpy(buf, fw->data + i, 64);
+
+		r = usb_control_msg(ud, pipe, 0xa0,
+				    USB_DIR_OUT | USB_TYPE_VENDOR, i, 0, buf,
+				    64, 2000);
+		if (r != 64) {
+			retval = -EIO;
+			goto cleanup;
+		}
+	}
+
+	buf[0] = 0;
+	r = usb_control_msg(ud, pipe, 0xa0, USB_DIR_OUT | USB_TYPE_VENDOR,
+			    0xe600, 0, buf, 1, 2000);
+	if (r != 1) {
+		retval = -EIO;
+		goto cleanup;
+	}
+
+cleanup:
+
+	if (buf != 0) {
+		kfree(buf);
+	}
+
+	return retval;
+}
+
+static int jorebo_set_voltage(struct dvb_frontend *fe,
+			      enum fe_sec_voltage voltage)
+{
+	struct dvb_usb_device *d = fe_to_d(fe);
+	struct usb_device *ud = d->udev;
+	unsigned int pipe;
+	u16 value;
+	int r;
+
+	switch (voltage) {
+	case SEC_VOLTAGE_13:
+		value = 1;
+		break;
+	case SEC_VOLTAGE_18:
+		value = 2;
+		break;
+	case SEC_VOLTAGE_OFF:
+		value = 0;
+		break;
+	}
+
+	pipe = usb_sndctrlpipe(ud, 0);
+	r = usb_control_msg(ud, pipe, 0xb1, USB_DIR_OUT | USB_TYPE_VENDOR,
+			    value, 0, 0, 0, 2000);
+
+	return 0;
+}
+
+static int jorebo_frontend_attach(struct dvb_usb_adapter *adap)
+{
+	struct jorebo_state *state = adap_to_priv(adap);
+	struct dvb_usb_device *d = adap_to_d(adap);
+	struct i2c_adapter *i2c_adapter;
+	struct m88ds3103_platform_data m88ds3103_pdata = {};
+	struct ts2020_config ts2020_config = {};
+
+	m88ds3103_pdata.clk = 27000000;
+	m88ds3103_pdata.i2c_wr_max = 33;
+	m88ds3103_pdata.ts_mode = M88DS3103_TS_PARALLEL;
+	m88ds3103_pdata.ts_clk = 14000;
+	m88ds3103_pdata.clk_out = M88DS3103_CLOCK_OUT_DISABLED;
+	m88ds3103_pdata.ts_clk_pol = 0;
+	m88ds3103_pdata.spec_inv = 0;
+	m88ds3103_pdata.agc = 0x99;
+	m88ds3103_pdata.agc_inv = 0;
+	m88ds3103_pdata.envelope_mode = 0;
+	m88ds3103_pdata.lnb_hv_pol = 0;
+	m88ds3103_pdata.lnb_en_pol = 0;
+
+	state->i2c_client_demod = dvb_module_probe(
+		"m88ds3103", NULL, &d->i2c_adap, 0x68, &m88ds3103_pdata);
+	if (state->i2c_client_demod == NULL) {
+		return -ENODEV;
+	}
+
+	adap->fe[0] = m88ds3103_pdata.get_dvb_frontend(state->i2c_client_demod);
+	i2c_adapter = m88ds3103_pdata.get_i2c_adapter(state->i2c_client_demod);
+
+	ts2020_config.frequency_div = 1103000;
+	ts2020_config.loop_through = 1;
+	ts2020_config.clk_out = TS2020_CLK_OUT_ENABLED;
+	ts2020_config.clk_out_div = 1;
+	ts2020_config.dont_poll = 0;
+	ts2020_config.fe = adap->fe[0];
+	ts2020_config.get_agc_pwm = m88ds3103_get_agc_pwm;
+
+	state->i2c_client_tuner = dvb_module_probe(
+		"ts2020", NULL, i2c_adapter, 0x60, &ts2020_config);
+	if (state->i2c_client_tuner == NULL) {
+		dvb_module_release(state->i2c_client_demod);
+		return -ENODEV;
+	}
+
+	/* LNB voltage is controlled via FX2 GPIOs, not via demod */
+	adap->fe[0]->ops.set_voltage = jorebo_set_voltage;
+
+	return 0;
+}
+
+static int jorebo_frontend_detach(struct dvb_usb_adapter *adap)
+{
+	struct dvb_usb_device *d = adap_to_d(adap);
+	struct jorebo_state *state = d_to_priv(d);
+
+	dvb_module_release(state->i2c_client_tuner);
+	dvb_module_release(state->i2c_client_demod);
+
+	return 0;
+}
+
+static int jorebo_streaming_ctrl(struct dvb_frontend *fe, int onoff)
+{
+	return 0;
+}
+
+static int jorebo_init(struct dvb_usb_device *d)
+{
+	return 0;
+}
+
+static int jorebo_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
+			   int num)
+{
+	int retval = num;
+	struct dvb_usb_device *d = i2c_get_adapdata(adap);
+	struct usb_device *ud = d->udev;
+	unsigned int pipe;
+	struct jorebo_state *state = d_to_priv(d);
+	u8 *buf = state->buf;
+	int r;
+	u16 value;
+	u16 index;
+
+	if (mutex_lock_interruptible(&d->i2c_mutex) < 0) {
+		return -EAGAIN;
+	}
+
+	if (num == 1) {
+		if (msgs[0].len > 64) {
+			retval = -ENOTSUPP;
+			goto cleanup;
+		}
+
+		if (msgs[0].flags == 0) {
+			value = msgs[0].addr;
+
+			/* 1- or 2-byte I2C write data can be squeezed into the
+			   wIndex field of the setup packet; for more, the data
+			   stage must be used */
+			if (msgs[0].len == 1) {
+				value |= 0x0100;
+				index = (u16)msgs[0].buf[0];
+
+				pipe = usb_sndctrlpipe(ud, 0);
+				r = usb_control_msg(ud, pipe, 0xb0,
+					USB_DIR_OUT | USB_TYPE_VENDOR,
+					value, index, 0, 0, 2000);
+				if (r != 0) {
+					retval = -EIO;
+					goto cleanup;
+				}
+			} else if (msgs[0].len == 2) {
+				value |= 0x0200;
+				index = (u16)msgs[0].buf[0] |
+					((u16)msgs[0].buf[1] << 8);
+
+				pipe = usb_sndctrlpipe(ud, 0);
+				r = usb_control_msg(ud, pipe, 0xb0,
+					USB_DIR_OUT | USB_TYPE_VENDOR,
+					value, index, 0, 0, 2000);
+				if (r != 0) {
+					retval = -EIO;
+					goto cleanup;
+				}
+			} else {
+				memcpy(buf, msgs[0].buf, msgs[0].len);
+				pipe = usb_sndctrlpipe(ud, 0);
+				r = usb_control_msg(
+					ud, pipe, 0xb0,
+					USB_DIR_OUT | USB_TYPE_VENDOR, value, 0,
+					buf, msgs[0].len, 2000);
+				if (r != msgs[0].len) {
+					retval = -EIO;
+					goto cleanup;
+				}
+			}
+		} else if (msgs[0].flags == I2C_M_RD) {
+			pipe = usb_rcvctrlpipe(ud, 0);
+			r = usb_control_msg(ud, pipe, 0xb0,
+					    USB_DIR_IN | USB_TYPE_VENDOR,
+					    msgs[0].addr, 0, buf, msgs[0].len,
+					    2000);
+			if (r != msgs[0].len) {
+				retval = -EIO;
+				goto cleanup;
+			}
+			memcpy(msgs[0].buf, buf, msgs[0].len);
+		} else {
+			retval = -ENOTSUPP;
+			goto cleanup;
+		}
+
+	} else if (num == 2 && msgs[0].flags == 0 &&
+		   msgs[1].flags == I2C_M_RD && msgs[0].addr == msgs[1].addr) {
+
+		if (msgs[0].len > 2 || msgs[1].len > 64) {
+			retval = -ENOTSUPP;
+			goto cleanup;
+		}
+
+		value = msgs[0].addr;
+
+		if (msgs[0].len >= 1) {
+			index = (u16)msgs[0].buf[0];
+
+			if (msgs[0].len == 2) {
+				value |= 0x0200;
+				index |= (u16)msgs[0].buf[1] << 8;
+			} else {
+				value |= 0x0100;
+			}
+		} else {
+			index = 0;
+		}
+
+		pipe = usb_rcvctrlpipe(ud, 0);
+		r = usb_control_msg(ud, pipe, 0xb0,
+				    USB_DIR_IN | USB_TYPE_VENDOR, value, index,
+				    buf, msgs[1].len, 2000);
+		if (r != msgs[1].len) {
+			retval = -EIO;
+			goto cleanup;
+		}
+		memcpy(msgs[1].buf, buf, msgs[1].len);
+	} else {
+		retval = -ENOTSUPP;
+		goto cleanup;
+	}
+
+cleanup:
+
+	mutex_unlock(&d->i2c_mutex);
+
+	return retval;
+}
+
+static u32 jorebo_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C;
+}
+
+static struct i2c_algorithm jorebo_i2c_algo = {
+	.master_xfer = jorebo_i2c_xfer,
+	.functionality = jorebo_i2c_functionality,
+};
+
+static struct dvb_usb_device_properties jorebo_props = {
+	.driver_name = KBUILD_MODNAME,
+	.owner = THIS_MODULE,
+	.adapter_nr = adapter_nr,
+	.size_of_priv = sizeof(struct jorebo_state),
+
+	.identify_state = jorebo_identify_state,
+	.firmware = "dvb-usb-jorebo.fw",
+	.download_firmware = jorebo_download_firmware,
+
+	.i2c_algo = &jorebo_i2c_algo,
+
+	.num_adapters = 1,
+	.adapter = { {
+		.stream = DVB_USB_STREAM_BULK(0x82, 8, 4096),
+	} },
+
+	.frontend_attach = jorebo_frontend_attach,
+	.frontend_detach = jorebo_frontend_detach,
+	.streaming_ctrl = jorebo_streaming_ctrl,
+	.init = jorebo_init,
+};
+
+static const struct usb_device_id jorebo_id_table[] = {
+	{ DVB_USB_DEVICE(0x1209, 0x4747, &jorebo_props, "jorebo", NULL) },
+	{},
+};
+
+static struct usb_driver jorebo_usb_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = jorebo_id_table,
+	.probe = dvb_usbv2_probe,
+	.disconnect = dvb_usbv2_disconnect,
+	.suspend = dvb_usbv2_suspend,
+	.resume = dvb_usbv2_resume,
+	.reset_resume = dvb_usbv2_reset_resume,
+	.no_dynamic_id = 1,
+	.soft_unbind = 1,
+};
+
+module_usb_driver(jorebo_usb_driver);
+
+MODULE_AUTHOR("Johann Hanne");
+MODULE_DESCRIPTION("Driver for Johann's Receiver Board");
+MODULE_LICENSE("Dual MIT/GPL");

