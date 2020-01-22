Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92322144A41
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 04:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgAVDQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 22:16:03 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44223 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgAVDQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 22:16:03 -0500
Received: by mail-qk1-f196.google.com with SMTP id v195so4914911qkb.11;
        Tue, 21 Jan 2020 19:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=muLpfy5fi0MCMSJBQguUQ/yNJtcASm3thJACvz7P3kQ=;
        b=RhTTWk9nHg/iStqEbWido5yPl+LlqXEBGJIOIkvDjIw/CDFV1Mx1Nzt6wl8f217XBI
         zr9tOkylFU6T/6ri5aEI/cW5LYQ4GV8BS+AxaWi4Xd/qInOZP/gWUUM4MOcQl+VK3Jmj
         IL8+1bQOwtFYMjI1Wciw2uteTYMcwGZ1ZHZr7JjddZYLe1ufA86oUOxQV/otNZMG0nnp
         Xo8bXGnl2XtmtyeLahQm31Fc6rLXlWKmLvItuwzFwWEKcoVFITLvMRDQZWN0y2Qq5HQY
         YnoiTfetma/yptigt+r0iFM785HkLxDn3dCTvjy0Rt2n6oE7NAddh927/sTLxQMzsR9J
         +Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=muLpfy5fi0MCMSJBQguUQ/yNJtcASm3thJACvz7P3kQ=;
        b=rNHliwd2RbBl884t4vwFuV7j2I0yNE0PCJ0hWz1dGBTCLdyAX7iTCxWdA3WELfGUVh
         ZLXJJDZl3DICBFuVLian+fZA5o0XIFPym6C1r3ddAmA2mwXh+URoYhQsRy1p0xU35DGH
         qzKoGGLYTzw3r/F238nN7Pn9qMVPCOuLky3bb+/wcM1OLaZyzAOiY9FelDT7GfH6Z8oK
         IVgeurGI7w9JBtJM76UMkmk4r+3/oxpm7j+PA2lbPoeusXcTIhMQsyKdIydEsWyaQURG
         vPxLFM8rg2rT0+O03E6DaRV/q0idARecYNvt8qWug4W75MbIspnG0nEvLYCrhG22KG21
         om0A==
X-Gm-Message-State: APjAAAUV/hrc1W480XMMu52VAPHJmhlreKszCsNV6V8lqHUYMh4IazPo
        enZa+v/DC9VC6+hnYktGeQQ=
X-Google-Smtp-Source: APXvYqw48tpnEXB7qMFERIwZohHPGojqbt7Jmo87mMJgV0+CRos2/6BACWynNdoWH9tk7QAsCcyDkQ==
X-Received: by 2002:a37:9f94:: with SMTP id i142mr7974780qke.244.1579662961767;
        Tue, 21 Jan 2020 19:16:01 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id n1sm17878751qkk.122.2020.01.21.19.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 19:16:01 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        gregkh@linuxfoundation.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4] media: dvb_dummy_tuner: implement driver skeleton
Date:   Wed, 22 Jan 2020 00:14:45 -0300
Message-Id: <20200122031445.2316701-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113191939.1555533-1-dwlsalmeida@gmail.com>
References: <20200113191939.1555533-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

The virtual DVB test driver serves as a reference DVB driver and helps
validate the existing APIs in the media subsystem. It can also aid developers
working on userspace applications.

This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
ISDB-T and ATSC when completed.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
-----------------------------------------------------------
Changes in v4:
	dvb_dummy_tuner.c:
		implement the remaining functions for the tuner
		remove #include "dvb_dummy_tuner.h"
		remove "release" callback, since this driver does not use dvb_attach()

Changes in v3:
	KConfig:
		change config name to "Dummy DVB Media Tuner"
		remove useless 'default n'
		add module name on help, same as other drivers
	
	dvb_dummy_tuner.c:
		change license from GPL2+ to GPLv2.
		Remove LKMP reference from the source file
		Move the copyright notice to the top
		remove useless goto in dvb_tuner_i2c_probe
		only call i2c_set_clientdata after the pointer is ready

	remove dvb_dummy_tuner.h as it was not needed

	Fix this error:
		WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
		#15: 
		validate the existing APIs in the media subsystem. It can also aid developers
	
	Remove LKMP reference from commit message


Changes in v2:
	Commit message was rewritten
	Added better description in KConfig
	Added better description in .h and .c
	Added copyright notice in .h and .c
	Kconfig dummy tuner option now defaults to 'n'
	Removed calls to pr_err, pr_debug

----------------------------------------------------------
 drivers/media/tuners/Kconfig           |   9 +
 drivers/media/tuners/Makefile          |   1 +
 drivers/media/tuners/dvb_dummy_tuner.c | 241 +++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c

diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index e104bb7766e1..8ad54339ceee 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -296,4 +296,13 @@ config MEDIA_TUNER_QM1D1B0004
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Sharp QM1D1B0004 ISDB-S tuner driver.
+
+config MEDIA_TUNER_DVB_DUMMY_TUNER
+	tristate "Dummy DVB Media Tuner"
+	depends on MEDIA_SUPPORT && I2C
+	help
+	  Dummy DVB media tuner driver
+	  The virtual DVB test driver serves as a reference DVB driver and helps
+	  validate the existing APIs in the media subsystem. It can also aid
+	  developers working on userspace applications.
 endmenu
diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
index 7b4f8423501e..f98de1cf2e19 100644
--- a/drivers/media/tuners/Makefile
+++ b/drivers/media/tuners/Makefile
@@ -44,5 +44,6 @@ obj-$(CONFIG_MEDIA_TUNER_QM1D1C0042) += qm1d1c0042.o
 obj-$(CONFIG_MEDIA_TUNER_QM1D1B0004) += qm1d1b0004.o
 obj-$(CONFIG_MEDIA_TUNER_M88RS6000T) += m88rs6000t.o
 obj-$(CONFIG_MEDIA_TUNER_TDA18250) += tda18250.o
+obj-$(CONFIG_MEDIA_TUNER_DVB_DUMMY_TUNER) += dvb_dummy_tuner.o
 
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
diff --git a/drivers/media/tuners/dvb_dummy_tuner.c b/drivers/media/tuners/dvb_dummy_tuner.c
new file mode 100644
index 000000000000..bb8ab4ac1292
--- /dev/null
+++ b/drivers/media/tuners/dvb_dummy_tuner.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ *
+ * The virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * This dummy tuner should support common TV standards such as
+ * DVB-T/T2/S/S2, ISDB-T and ATSC when completed.
+ *
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+#define MOCK_POWER_UP_DELAY_MSEC 1000
+#define MOCK_TUNE_DELAY_MSEC 1000
+#define MOCK_SLEEP_DELAY_MSEC 1000
+#define MOCK_RESUME_DELAY_MSEC 1000
+
+struct dvb_dummy_tuner_config {
+	struct dvb_frontend *fe;
+};
+
+enum dvb_dummy_tuner_lock_status {
+	STATUS_NO_LOCK = 0,
+	STATUS_LOCKED = TUNER_STATUS_LOCKED,
+};
+
+enum dvb_dummy_tuner_power_status {
+	STATUS_UNKNOWN,
+	STATUS_ASLEEP,
+	STATUS_ACTIVE
+};
+
+struct dvb_dummy_tuner_hardware_state {
+	enum dvb_dummy_tuner_power_status power_status;
+	enum dvb_dummy_tuner_lock_status lock_status;
+	u32 if_frequency;
+	u32 tuned_frequency;
+	u32 bandwidth;
+};
+
+struct dvb_dummy_tuner_dev {
+	struct dvb_frontend *fe;
+	struct dvb_dummy_tuner_hardware_state hw_state;
+	struct dvb_dummy_tuner_config config;
+};
+
+static struct dvb_dummy_tuner_dev*
+dvb_dummy_tuner_get_dev(struct dvb_frontend *fe)
+{
+	struct i2c_client *client = fe->tuner_priv;
+
+	return (struct dvb_dummy_tuner_dev *)i2c_get_clientdata(client);
+}
+
+static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	msleep_interruptible(MOCK_POWER_UP_DELAY_MSEC);
+
+	tuner_dev->hw_state.power_status = STATUS_ACTIVE;
+	tuner_dev->hw_state.if_frequency = 5000;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	msleep_interruptible(MOCK_SLEEP_DELAY_MSEC);
+	tuner_dev->hw_state.power_status = STATUS_ASLEEP;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
+{
+	return dvb_dummy_tuner_sleep(fe);
+}
+
+static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	msleep_interruptible(MOCK_RESUME_DELAY_MSEC);
+	tuner_dev->hw_state.power_status = STATUS_ACTIVE;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	u32 min_freq = fe->ops.tuner_ops.info.frequency_min_hz;
+	u32 max_freq = fe->ops.tuner_ops.info.frequency_max_hz;
+	u32 min_bw = fe->ops.tuner_ops.info.bandwidth_min;
+	u32 max_bw = fe->ops.tuner_ops.info.bandwidth_max;
+
+	msleep_interruptible(MOCK_TUNE_DELAY_MSEC);
+
+	if (c->frequency < min_freq  || c->frequency > max_freq  ||
+	    c->bandwidth_hz < min_bw || c->bandwidth_hz > max_bw) {
+		tuner_dev->hw_state.lock_status = STATUS_NO_LOCK;
+		return -EINVAL;
+	}
+
+	tuner_dev->hw_state.tuned_frequency = c->frequency;
+	tuner_dev->hw_state.bandwidth = c->bandwidth_hz;
+	tuner_dev->hw_state.lock_status = STATUS_LOCKED;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe,
+				      void *priv_cfg)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	WARN_ON(sizeof(tuner_dev->config) != sizeof(*priv_cfg));
+	memcpy(&tuner_dev->config, priv_cfg, sizeof(*priv_cfg));
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
+					 u32 *frequency)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*frequency = tuner_dev->hw_state.tuned_frequency;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
+					 u32 *bandwidth)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*bandwidth = tuner_dev->hw_state.bandwidth;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
+					    u32 *frequency)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*frequency = tuner_dev->hw_state.if_frequency;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*status = tuner_dev->hw_state.lock_status;
+
+	return 0;
+}
+
+static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
+	.init = dvb_dummy_tuner_init,
+	.sleep = dvb_dummy_tuner_sleep,
+	.suspend = dvb_dummy_tuner_suspend,
+	.resume = dvb_dummy_tuner_resume,
+	.set_params = dvb_dummy_tuner_set_params,
+	.set_config = dvb_dummy_tuner_set_config,
+	.get_bandwidth = dvb_dummy_tuner_get_bandwidth,
+	.get_frequency = dvb_dummy_tuner_get_frequency,
+	.get_if_frequency = dvb_dummy_tuner_get_if_frequency,
+	.get_status = dvb_dummy_tuner_get_status,
+};
+
+static const struct i2c_device_id dvb_dummy_tuner_i2c_id_table[] = {
+	{"dvb_dummy_tuner", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dvb_dummy_tuner_i2c_id_table);
+
+static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
+				     const struct i2c_device_id *id)
+{
+	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
+	struct dvb_frontend *fe = config->fe;
+	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
+
+	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
+	if (!tuner_dev)
+		return -ENOMEM;
+
+	tuner_dev->fe = config->fe;
+	i2c_set_clientdata(client, tuner_dev);
+
+	memcpy(&fe->ops.tuner_ops,
+	       &dvb_dummy_tuner_ops,
+	       sizeof(struct dvb_tuner_ops));
+
+	fe->tuner_priv = client;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
+	struct dvb_frontend *fe = tuner_dev->fe;
+
+	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
+	fe->tuner_priv = NULL;
+	kfree(tuner_dev);
+
+	return 0;
+}
+
+static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
+	.driver = {
+		.name = "dvb_dummy_tuner",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= dvb_dummy_tuner_i2c_probe,
+	.remove		= dvb_dummy_tuner_i2c_remove,
+	.id_table	= dvb_dummy_tuner_i2c_id_table,
+};
+module_i2c_driver(dvb_dummy_tuner_i2c_driver);
+
+MODULE_DESCRIPTION("DVB Dummy Tuner");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
-- 
2.24.1

