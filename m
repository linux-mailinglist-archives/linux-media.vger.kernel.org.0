Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAB91DAB60
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgETHEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgETHEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:04:00 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFC3C061A0E;
        Wed, 20 May 2020 00:03:59 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f13so2622036qkh.2;
        Wed, 20 May 2020 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uLCVXlgBne+yFEqiU/CQ5gAVUjNmGnIWjShnPaU1SPg=;
        b=Lbphj2qsaeTsxwayrNGGp9jF0TUCQn0jAw6/XqThWBQf/QP16IyURqY/jsRaSOdPw3
         +/TxCz8gohorOzF9P3DPp5fVY1ZPAzrLQEj0bG4vnfyNPUWDl0Qx3ABQBWLh1qZQz+mH
         NFIYP2jFijoHJ736Eswb2YbG1nmVTAipCsTvudjMKHfPBbT6Q/Lm7gR3C94KunTqlYLJ
         7xfmwnNvvF9L34+xkxigVBl0ST7ncU6I2UhKQKdzUchgp72pZZGnl/dmlc2NHeGmWrbL
         qksa11FwYzAcxyIZR0JnVa6WooFBo7RDLTSWfqrROpNmdcdi01kMjOD/bdNPdPv2SuNT
         +7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uLCVXlgBne+yFEqiU/CQ5gAVUjNmGnIWjShnPaU1SPg=;
        b=eayIHRVa/OSfJc8VR+oSlt5vpPiTU9s96BQkag6hUcwQk9xeIpwOuTnesebBBKJrk6
         kGiEEZwjYQiE4K1+h4mibeNQmptXhifoX0/lKnAErCbhfeZ0SH1+nzGj9tV2JlmQg69c
         LoKg5QAFiCUrQ6WOfoa9mrIbTQ2Rwed9cgR5WMMhrBjJHdZAmX9/Uxbn9ARK0qlmvvbY
         3FCwOATWLDtTnLm4dcvgSC84+Dcrua8n0aZMaO2FAYyrypMQZyr1GiyhT1pOt0mzYa/J
         R05KADxImmkQ4nNH0UFrKnPBYIpdMJvtVZm8OTWd7e+VvQ/spXGZy/u177x2pK5bbBdU
         ktoQ==
X-Gm-Message-State: AOAM531di3E5evV0Y2OF6SdHr7FalQ4FBByVbTavXE5UhP++a0cOq1bz
        PvB2JUl75vXKlZ2D45g1gP0=
X-Google-Smtp-Source: ABdhPJwzhVJtc9YMXRYuLtYQaC0RxWdFHLnKb/3GEOasAH6GkJl47vLR7YEDm0cFVVBQy/7uMQ5G4Q==
X-Received: by 2002:ae9:ebd2:: with SMTP id b201mr3259189qkg.80.1589958238838;
        Wed, 20 May 2020 00:03:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 00:03:58 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v6 04/10] media: vidtv: add a bridge driver
Date:   Wed, 20 May 2020 04:03:28 -0300
Message-Id: <20200520070334.1778751-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
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

BRIDGE WIP
---
 arch/Kconfig                                  |   2 +-
 drivers/media/dvb-core/dvbdev.c               |   1 +
 drivers/media/test-drivers/vidtv/Makefile     |   4 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 435 ++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  39 ++
 5 files changed, 479 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h

diff --git a/arch/Kconfig b/arch/Kconfig
index 786a85d4ad40d..ddcb4a68ee940 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -868,7 +868,7 @@ config VMAP_STACK
 	  be enabled.
 
 config ARCH_OPTIONAL_KERNEL_RWX
-	def_bool n
+	def_bool y
 
 config ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	def_bool n
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 80b6a71aa33e4..38c8b848c921f 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -962,6 +962,7 @@ int dvb_usercopy(struct file *file,
 }
 
 #if IS_ENABLED(CONFIG_I2C)
+#pragma clang optimize off
 struct i2c_client *dvb_module_probe(const char *module_name,
 				    const char *name,
 				    struct i2c_adapter *adap,
diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index 21e50c11c94d0..c99cd13f4adaf 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -2,5 +2,7 @@
 
 dvb-vidtv-tuner-objs := vidtv_tuner.o
 dvb-vidtv-demod-objs := vidtv_demod.o
+dvb-vidtv-bridge-objs := vidtv_bridge.o
 
-obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o
+obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o \
+			   dvb-vidtv-bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
new file mode 100644
index 0000000000000..bc1c612c23013
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -0,0 +1,435 @@
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
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "vidtv_bridge.h"
+#include "vidtv_demod.h"
+#include "vidtv_tuner.h"
+
+#define TUNER_DEFAULT_ADDR 0x68
+#define DEMOD_DEFAULT_ADDR 0x60
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
+static struct dvb_frontend *vidtv_get_frontend_ptr(struct i2c_client *c)
+{
+	/* the demod will set this when its probe function runs */
+	struct vidtv_demod_state *state = i2c_get_clientdata(c);
+
+	return &state->frontend;
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
+static const struct i2c_algorithm vidtv_i2c_algorithm = {
+	.master_xfer   = vidtv_master_xfer,
+	.functionality = vidtv_i2c_func,
+};
+
+static int vidtv_bridge_i2c_register_adap(struct vidtv_dvb *dvb)
+{
+	struct i2c_adapter *i2c_adapter = &dvb->i2c_adapter;
+
+	strscpy(i2c_adapter->name, "vidtv_i2c", sizeof(i2c_adapter->name));
+	i2c_adapter->owner      = THIS_MODULE;
+	i2c_adapter->algo       = &vidtv_i2c_algorithm;
+	i2c_adapter->algo_data  = NULL;
+	i2c_adapter->timeout    = 500;
+	i2c_adapter->retries    = 3;
+	i2c_adapter->dev.parent = &dvb->pdev->dev;
+
+	i2c_set_adapdata(i2c_adapter, dvb);
+	return i2c_add_adapter(&dvb->i2c_adapter);
+}
+
+static int vidtv_bridge_register_adap(struct vidtv_dvb *dvb)
+{
+	int ret = 0;
+
+	ret = dvb_register_adapter(&dvb->adapter,
+				   KBUILD_MODNAME,
+				   THIS_MODULE,
+				   &dvb->i2c_adapter.dev,
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
+static int vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
+{
+	struct vidtv_demod_config cfg = {};
+
+	cfg.drop_tslock_prob_on_low_snr     = drop_tslock_prob_on_low_snr;
+	cfg.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr;
+
+	dvb->i2c_client_demod[n] = dvb_module_probe("vidtv_demod",
+						    NULL,
+						    &dvb->i2c_adapter,
+						    DEMOD_DEFAULT_ADDR,
+						    &cfg);
+
+	/* driver will not work anyways so bail out */
+	if (!dvb->i2c_client_demod[n])
+		return -ENODEV;
+
+	/* retrieve a ptr to the frontend state */
+	dvb->fe[n] = vidtv_get_frontend_ptr(dvb->i2c_client_demod[n]);
+
+	return 0;
+}
+
+static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
+{
+	struct vidtv_tuner_config cfg = {};
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
+						    &dvb->i2c_adapter,
+						    TUNER_DEFAULT_ADDR,
+						    &cfg);
+
+	return (dvb->i2c_client_tuner[n]) ? 0 : -ENODEV;
+}
+
+static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
+{
+	int ret;
+	int i;
+	int j;
+	int k;
+	int w;
+	int l;
+
+	ret = vidtv_bridge_i2c_register_adap(dvb);
+	if (ret < 0)
+		goto fail_i2c;
+
+	ret = vidtv_bridge_register_adap(dvb);
+	if (ret < 0)
+		goto fail_adapter;
+
+	for (i = 0; i < NUM_FE; ++i) {
+		ret = vidtv_bridge_probe_demod(dvb, i);
+		if (ret < 0)
+			goto fail_demod_probe;
+
+		ret = vidtv_bridge_probe_tuner(dvb, i);
+		if (ret < 0)
+			goto fail_tuner_probe;
+
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
+	for (k = i; k >= 0; --k)
+		dvb_unregister_frontend(dvb->fe[k]);
+fail_tuner_probe:
+	for (w = i; w >= 0; --w)
+		dvb_module_release(dvb->i2c_client_tuner[w]);
+
+fail_demod_probe:
+	for (l = i; l >= 0; --l)
+		dvb_module_release(dvb->i2c_client_demod[l]);
+
+fail_adapter:
+	dvb_unregister_adapter(&dvb->adapter);
+
+fail_i2c:
+	i2c_del_adapter(&dvb->i2c_adapter);
+
+	return ret;
+}
+
+static int vidtv_bridge_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct vidtv_dvb *dvb;
+
+	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
+	if (!dvb)
+		return -ENOMEM;
+
+	dvb->pdev = pdev;
+
+	ret = vidtv_bridge_dvb_init(dvb);
+	if (ret < 0)
+		goto err_dvb;
+
+	mutex_init(&dvb->feed_lock);
+
+	platform_set_drvdata(pdev, dvb);
+
+	return ret;
+
+err_dvb:
+	kfree(dvb);
+	return ret;
+}
+
+static int vidtv_bridge_remove(struct platform_device *pdev)
+{
+	struct vidtv_dvb *dvb;
+	u32 i;
+
+	dvb = platform_get_drvdata(pdev);
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
+static void vidtv_bridge_dev_release(struct device *dev)
+{
+}
+
+static struct platform_device vidtv_bridge_dev = {
+	.name		= "vidtv_bridge",
+	.dev.release	= vidtv_bridge_dev_release,
+};
+
+static struct platform_driver vidtv_bridge_driver = {
+	.driver = {
+		.name                = "vidtv_bridge",
+		.suppress_bind_attrs = true,
+	},
+	.probe    = vidtv_bridge_probe,
+	.remove   = vidtv_bridge_remove,
+};
+
+static void __exit vidtv_bridge_exit(void)
+{
+	platform_driver_unregister(&vidtv_bridge_driver);
+	platform_device_unregister(&vidtv_bridge_dev);
+}
+
+static int __init vidtv_bridge_init(void)
+{
+	int ret;
+
+	ret = platform_device_register(&vidtv_bridge_dev);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&vidtv_bridge_driver);
+	if (ret)
+		platform_device_unregister(&vidtv_bridge_dev);
+
+	return ret;
+}
+
+module_init(vidtv_bridge_init);
+module_exit(vidtv_bridge_exit);
+
+MODULE_DESCRIPTION("Virtual Digital TV Test Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
new file mode 100644
index 0000000000000..4931bfb73273c
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_BRIDGE_H
+#define VIDTV_BRIDGE_H
+
+#define NUM_FE 1
+
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <media/dmxdev.h>
+#include <media/dvb_demux.h>
+#include <media/dvb_frontend.h>
+
+struct vidtv_dvb {
+	struct platform_device *pdev;
+	struct dvb_frontend *fe[NUM_FE];
+	struct dvb_adapter adapter;
+	struct dvb_demux demux;
+	struct dmxdev dmx_dev;
+	struct dmx_frontend dmx_fe[NUM_FE];
+	struct i2c_adapter i2c_adapter;
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

