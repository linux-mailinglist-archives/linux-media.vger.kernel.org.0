Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406C21D5BE1
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgEOVs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 17:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726266AbgEOVs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 17:48:58 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12ABEC061A0C;
        Fri, 15 May 2020 14:48:58 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id x12so3302404qts.9;
        Fri, 15 May 2020 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QTgxjgP7ni5FQZNgtx5Ofdb6xnD87mdiS6TCPHM45aE=;
        b=UfspDq1NN19JqgY2PKdJ1hgyfLj6tTu7/iTIMov99cpFR83/Lq2+oW19awTc2u7W/R
         2RFhB0KoTN6GopGNSx0iIcejYooAiwAaCNqmAfdJ3aS+IFbmVV/MEqAldX3Sk8aftSdn
         jMpTuR1CW9aJdMtwut6sitp5c7x0GGgyv830Nl1WwIBmOj3jmUGpKK/QAxqu1bIwhAG6
         KWMvPfACbIXwtPOyXTWXUzj1oiMX4VoI2wfqq9/p4mbFl0+eop0wA8Iz9EGtidIeS+7Q
         rklMGREaZhlQJm9D8xRx1m98jd2FrhKJOIkZO+nekbksyMiXyHlB5+3GnpCL60o8ktyt
         62lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QTgxjgP7ni5FQZNgtx5Ofdb6xnD87mdiS6TCPHM45aE=;
        b=SHME7+PBHxcmkAuhi79ptJ4BiC9agviNPs+sFXNMEu0pzLQNHvTTQXNnvTwdtXgiDy
         zjBwygRmdhIrmcCjX4px/haBuZEtaMqn9z6HZfcV/KZoZVATb0wDccbfoNBlOACcRPhw
         ZZDEMzeMSV7rToAPSYbjNREDzgtv/xfbb/WeDhwmajd+DcWRgbdR4/WHdJfqOxhnJMhw
         liHK+OR5BPRf0mkqa8nbhZ1DCC//+v1/3STZnRkkUMJ1t8e/vTQtIEDEsWlmC3hJP+Vo
         QnN4DQG/1wJYeJnOU/mB4Zb+If6UGByUiXbwqQ1PpqUmturxkOXKBJTk06QFXoL70a6l
         1GQw==
X-Gm-Message-State: AOAM532/fJCnH2Y0jM40x/pmjlHXB4lXeRwBy+eJuQfR/QQABXZSn7ds
        APPHpVtrlrcLGDpB7drFao4=
X-Google-Smtp-Source: ABdhPJw7dBNVRXZ+av8gRw+36fCxay3apM0XPLTkerHg6iGAX9FoFbZYByje837MykjtvL4I3+3biQ==
X-Received: by 2002:ac8:4e38:: with SMTP id d24mr5675797qtw.343.1589579337091;
        Fri, 15 May 2020 14:48:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
        by smtp.gmail.com with ESMTPSA id m21sm2495019qkh.50.2020.05.15.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:48:56 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v5 04/10] media: vidtv: add a bridge driver
Date:   Fri, 15 May 2020 18:48:09 -0300
Message-Id: <20200515214815.15514-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515214815.15514-1-dwlsalmeida@gmail.com>
References: <20200515214815.15514-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Digital TV devices consist of several independent hardware components which
are controlled by different drivers.
Each media device is controlled by a group of cooperating drivers with the
bridge driver as the main driver.

This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].

The bridge driver binds to the other drivers, that is, vidtv_tuner and
vidtv_demod and implements the digital demux logic, providing userspace
with a MPEG Transport Stream.

Move config structs to a common header so they can be used by the bridge
driver and by their respective drivers.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile     |   4 +-
 .../media/test-drivers/vidtv/vidtv_bridg.c    | 380 ++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridg.h    |  37 ++
 3 files changed, 420 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridg.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridg.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index 36ba00ddc0d1e..e0bb1b3bedad6 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o  vidtv_demod.o
+vidtv_bridge-objs = vidtv_bridg.o
+
+obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridg.c b/drivers/media/test-drivers/vidtv/vidtv_bridg.c
new file mode 100644
index 0000000000000..95e564b91d4d1
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridg.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/time.h>
+#include "linux/printk.h"
+
+#include "vidtv_bridg.h"
+#include "vidtv_tuner.h"
+#include "vidtv_demod.h"
+
+#define TUNER_DEFAULT_ADDR 0x68
+#define DEMOD_DEFAULT_ADDR 0x60
+
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
+
+static unsigned int drop_tslock_prob_on_low_snr;
+module_param(drop_tslock_prob_on_low_snr, uint, 0);
+MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
+		 "Probability of losing the TS lock if the signal quality is bad");
+
+static unsigned int recover_tslock_prob_on_good_snr;
+module_param(recover_tslock_prob_on_good_snr, uint, 0);
+MODULE_PARM_DESC(recover_tslock_prob_on_good_snr,
+		 "Probability recovering the TS lock when the signal improves");
+
+static unsigned int mock_power_up_delay_msec;
+module_param(mock_power_up_delay_msec, uint, 0);
+MODULE_PARM_DESC(mock_power_up_delay_msec, "Simulate a power up delay");
+
+static unsigned int mock_tune_delay_msec;
+module_param(mock_tune_delay_msec, uint, 0);
+MODULE_PARM_DESC(mock_tune_delay_msec, "Simulate a tune delay");
+
+static unsigned int vidtv_valid_dvb_t_freqs[8];
+module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
+MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
+		 "Valid DVB-T frequencies to simulate");
+
+static unsigned int vidtv_valid_dvb_c_freqs[8];
+module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
+MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
+		 "Valid DVB-C frequencies to simulate");
+
+static unsigned int vidtv_valid_dvb_s_freqs[8];
+module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
+MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
+		 "Valid DVB-C frequencies to simulate");
+
+static unsigned int max_frequency_shift_hz;
+module_param(max_frequency_shift_hz, uint, 0);
+MODULE_PARM_DESC(max_frequency_shift_hz,
+		 "Maximum shift in HZ allowed when tuning in a channel");
+
+DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nums);
+
+static int vidtv_start_streaming(struct vidtv_dvb *dvb)
+{
+	if (dvb->streaming) {
+		pr_warn_ratelimited("Already streaming. Skipping.\n");
+		return 0;
+	}
+
+	dvb->streaming = true;
+	return 0;
+}
+
+static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
+{
+	dvb->streaming = false;
+
+	return 0;
+}
+
+static int vidtv_start_feed(struct dvb_demux_feed *feed)
+{
+	struct dvb_demux *demux = feed->demux;
+	struct vidtv_dvb *dvb   = demux->priv;
+	int rc;
+	int ret;
+
+	if (!demux->dmx.frontend)
+		return -EINVAL;
+
+	mutex_lock(&dvb->feed_lock);
+
+	dvb->nfeeds++;
+	rc = dvb->nfeeds;
+
+	if (dvb->nfeeds == 1) {
+		ret = vidtv_start_streaming(dvb);
+		if (ret < 0)
+			rc = ret;
+	}
+
+	mutex_unlock(&dvb->feed_lock);
+	return rc;
+}
+
+static int vidtv_stop_feed(struct dvb_demux_feed *feed)
+{
+	struct dvb_demux *demux = feed->demux;
+	struct vidtv_dvb *dvb   = demux->priv;
+	int    err              = 0;
+
+	mutex_lock(&dvb->feed_lock);
+	dvb->nfeeds--;
+
+	if (!dvb->nfeeds)
+		err = vidtv_stop_streaming(dvb);
+
+	mutex_unlock(&dvb->feed_lock);
+	return err;
+}
+
+static int vidtv_master_xfer(struct i2c_adapter *i2c_adap,
+			     struct i2c_msg msgs[],
+			     int num)
+{
+	return 0;
+}
+
+static u32 vidtv_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C;
+}
+
+static struct i2c_algorithm vidtv_i2c_algorithm = {
+	.master_xfer   = vidtv_master_xfer,
+	.functionality = vidtv_i2c_func,
+};
+
+static int vidtv_bridge_i2c_register_adap(struct vidtv_dvb *dvb)
+{
+	struct i2c_adapter *i2c_adapter = dvb->i2c_adapter;
+
+	strscpy(i2c_adapter->name, "vidtv_i2c", sizeof(i2c_adapter->name));
+	i2c_adapter->owner      = THIS_MODULE;
+	i2c_adapter->algo       = &vidtv_i2c_algorithm;
+	i2c_adapter->algo_data  = NULL;
+	i2c_adapter->timeout    = 500;
+	i2c_adapter->retries    = 3;
+	i2c_adapter->dev.parent = NULL;
+
+	i2c_set_adapdata(i2c_adapter, dvb);
+	return i2c_add_adapter(dvb->i2c_adapter);
+}
+
+static int vidtv_bridge_register_adap(struct vidtv_dvb *dvb)
+{
+	int ret = 0;
+
+	ret = dvb_register_adapter(&dvb->adapter,
+				   KBUILD_MODNAME,
+				   THIS_MODULE,
+				   &dvb->i2c_adapter->dev,
+				   adapter_nums);
+
+	return ret;
+}
+
+static int vidtv_bridge_dmx_init(struct vidtv_dvb *dvb)
+{
+	dvb->demux.dmx.capabilities = DMX_TS_FILTERING |
+				      DMX_SECTION_FILTERING;
+
+	dvb->demux.priv       = dvb;
+	dvb->demux.filternum  = 256;
+	dvb->demux.feednum    = 256;
+	dvb->demux.start_feed = vidtv_start_feed;
+	dvb->demux.stop_feed  = vidtv_stop_feed;
+
+	return dvb_dmx_init(&dvb->demux);
+}
+
+static int vidtv_bridge_dmxdev_init(struct vidtv_dvb *dvb)
+{
+	dvb->dmx_dev.filternum    = 256;
+	dvb->dmx_dev.demux        = &dvb->demux.dmx;
+	dvb->dmx_dev.capabilities = 0;
+
+	return dvb_dmxdev_init(&dvb->dmx_dev, &dvb->adapter);
+}
+
+static void vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
+{
+	struct vidtv_demod_config cfg = {0};
+	struct dvb_frontend *fe       = NULL;
+
+	cfg.frontend = &fe;
+	cfg.drop_tslock_prob_on_low_snr     = drop_tslock_prob_on_low_snr;
+	cfg.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr;
+
+	dvb->i2c_client_demod[n] = dvb_module_probe("vidtv_demod",
+						    NULL,
+						    dvb->i2c_adapter,
+						    DEMOD_DEFAULT_ADDR,
+						    &cfg);
+
+	/* retrieve a pointer to struct dvb_frontend */
+	dvb->fe[n] = *cfg.frontend;
+}
+
+static void vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
+{
+	struct vidtv_tuner_config cfg = {0};
+
+	cfg.fe                       = dvb->fe[n];
+	cfg.mock_power_up_delay_msec = mock_power_up_delay_msec;
+	cfg.mock_tune_delay_msec     = mock_tune_delay_msec;
+
+	memcpy(cfg.vidtv_valid_dvb_t_freqs,
+	       vidtv_valid_dvb_t_freqs,
+	       sizeof(vidtv_valid_dvb_t_freqs));
+
+	memcpy(cfg.vidtv_valid_dvb_c_freqs,
+	       vidtv_valid_dvb_c_freqs,
+	       sizeof(vidtv_valid_dvb_c_freqs));
+
+	memcpy(cfg.vidtv_valid_dvb_s_freqs,
+	       vidtv_valid_dvb_s_freqs,
+	       sizeof(vidtv_valid_dvb_s_freqs));
+
+	cfg.max_frequency_shift_hz = max_frequency_shift_hz;
+
+	dvb->i2c_client_tuner[n] = dvb_module_probe("vidtv_tuner",
+						    NULL,
+						    dvb->i2c_adapter,
+						    TUNER_DEFAULT_ADDR,
+						    &cfg);
+}
+
+static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
+{
+	int ret;
+	int i;
+	int j;
+
+	ret = vidtv_bridge_i2c_register_adap(dvb);
+	if (ret < 0)
+		goto fail_i2c;
+
+	ret = vidtv_bridge_register_adap(dvb);
+	if (ret < 0)
+		goto fail_adapter;
+
+	vidtv_bridge_probe_demod(dvb, 0);
+	vidtv_bridge_probe_tuner(dvb, 0);
+
+	for (i = 0; i < NUM_FE; ++i) {
+		ret = dvb_register_frontend(&dvb->adapter, dvb->fe[i]);
+		if (ret < 0)
+			goto fail_fe;
+	}
+
+	ret = vidtv_bridge_dmx_init(dvb);
+	if (ret < 0)
+		goto fail_dmx;
+
+	ret = vidtv_bridge_dmxdev_init(dvb);
+	if (ret < 0)
+		goto fail_dmx_dev;
+
+	for (j = 0; j < NUM_FE; ++j) {
+		ret = dvb->demux.dmx.connect_frontend(&dvb->demux.dmx,
+						      &dvb->dmx_fe[j]);
+		if (ret < 0)
+			goto fail_dmx_conn;
+
+		/*
+		 * The source of the demux is a frontend connected
+		 * to the demux.
+		 */
+		dvb->dmx_fe[j].source = DMX_FRONTEND_0;
+	}
+
+	return ret;
+
+fail_dmx_conn:
+	for (j = j - 1; j >= 0; --j)
+		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
+					       &dvb->dmx_fe[j]);
+fail_dmx_dev:
+	dvb_dmxdev_release(&dvb->dmx_dev);
+fail_dmx:
+	dvb_dmx_release(&dvb->demux);
+fail_fe:
+	for (i = i - 1; i >= 0; --i)
+		dvb_unregister_frontend(dvb->fe[i]);
+
+fail_adapter:
+	dvb_unregister_adapter(&dvb->adapter);
+
+fail_i2c:
+	i2c_del_adapter(dvb->i2c_adapter);
+
+	return ret;
+}
+
+static int vidtv_bridge_i2c_probe(struct i2c_client *client,
+				  const struct i2c_device_id *id)
+{
+	int ret;
+	struct vidtv_dvb *dvb;
+
+	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
+	if (!dvb)
+		return -ENOMEM;
+
+	ret = vidtv_bridge_dvb_init(dvb);
+	if (ret < 0)
+		goto err_dvb;
+
+	mutex_init(&dvb->feed_lock);
+
+	i2c_set_clientdata(client, dvb);
+
+	return ret;
+
+err_dvb:
+	kfree(dvb);
+	return ret;
+}
+
+static int vidtv_bridge_i2c_remove(struct i2c_client *client)
+{
+	struct vidtv_dvb *dvb;
+	u32 i;
+
+	dvb = i2c_get_clientdata(client);
+
+	mutex_destroy(&dvb->feed_lock);
+
+	for (i = 0; i < NUM_FE; ++i)
+		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
+					       &dvb->dmx_fe[i]);
+
+	dvb_dmxdev_release(&dvb->dmx_dev);
+	dvb_dmx_release(&dvb->demux);
+
+	for (i = 0; i < NUM_FE; ++i) {
+		dvb_unregister_frontend(dvb->fe[i]);
+		dvb_frontend_detach(dvb->fe[i]);
+	}
+
+	dvb_unregister_adapter(&dvb->adapter);
+
+	return 0;
+}
+
+static const struct i2c_device_id vidtv_bridge_id_table[] = {
+	{"vidtv_bridge", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
+
+static struct i2c_driver vidtv_bridge_driver = {
+	.driver = {
+		.name                = "vidtv_bridge",
+		.suppress_bind_attrs = true,
+	},
+	.probe    = vidtv_bridge_i2c_probe,
+	.remove   = vidtv_bridge_i2c_remove,
+	.id_table = vidtv_bridge_id_table,
+};
+
+module_i2c_driver(vidtv_bridge_driver);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridg.h b/drivers/media/test-drivers/vidtv/vidtv_bridg.h
new file mode 100644
index 0000000000000..dead155c2735c
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridg.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_BRIDG_H
+#define VIDTV_BRIDG_H
+
+#define NUM_FE 1
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+#include <media/dvb_demux.h>
+#include <media/dmxdev.h>
+#include <linux/i2c.h>
+
+struct vidtv_dvb {
+	struct dvb_frontend *fe[NUM_FE];
+	struct dvb_adapter adapter;
+	struct dvb_demux demux;
+	struct dmxdev dmx_dev;
+	struct dmx_frontend dmx_fe[NUM_FE];
+	struct i2c_adapter *i2c_adapter;
+	struct i2c_client *i2c_client_demod[NUM_FE];
+	struct i2c_client *i2c_client_tuner[NUM_FE];
+
+	u32 nfeeds;
+	struct mutex feed_lock; /* start/stop feed */
+
+	bool streaming;
+};
+
+#endif // VIDTV_BRIDG_H
-- 
2.26.2

