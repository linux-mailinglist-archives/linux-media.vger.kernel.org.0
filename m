Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C7F1D5BDD
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 23:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgEOVst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 17:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727958AbgEOVss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 17:48:48 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5CFC061A0C;
        Fri, 15 May 2020 14:48:48 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id o19so3291321qtr.10;
        Fri, 15 May 2020 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEbZMikl0ZZD1/1TAbVNROuxFxBRNtyMHfG+0TbSNV0=;
        b=bBRs31E8w273DWpoyYy6KdpTSEAzyD8M1aNPDuGzrKYHjRpJ4ejmuMLCvdWX64UwlF
         +0nv1VFgw5imK0XVissGokv3oYUzNqUKqXLyoSSEHp+temdBofWWlM7IM8Y/jWcqsBV5
         XWHaCpqfJ2nVHShp4utVUN39mpDucc2RwjBJXbCQLjy3ejZH4W1l+45oPiwd0xzIHXrB
         91PcFutmbmdS3OAROJAls1ys3dBsO1S7WkpqGOZUpnKBzbspeK0MCWhzXoIrDrpX+e94
         +lruxb3HbLK1INqPL4w8pSUhEUrQzvztIGLSK3UNvRRz5Xl85UrUTQdyy/MGQMxzNIbl
         BPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEbZMikl0ZZD1/1TAbVNROuxFxBRNtyMHfG+0TbSNV0=;
        b=JY9kRKaCw+soGMwa6yMLwuk9PeFltPjJO63GF4qJDL5zkPzeu0sKfi7Z2ooIeprHjc
         L3+HOELJR4/dS2tOYu5CW3Dd9FSVnxnHggvWhQduq1S7xVK3NGibL9ElRXEMTyIe705M
         uP0wKa0aoT8y4FYCW3meqZ/P6YkaSfJtPG1a8iava+2tY9dihbjJV6b82UziiGes/dty
         akMxvtBQYw4UwTeWwEE6qydqVAkZk2dykCrLDzEB+9hADAfcSJHRFa0M1oPiQbpHeJqX
         iMKPx5YSv9/yfFDkVk81kYBhEEf/9dRy/JgLXFF1wKCDhLk8N8+NFnaoxXJyvTCruW8s
         Ciag==
X-Gm-Message-State: AOAM532J7presvHktpIjFv4Dvle8UwUgBnLSzUtG47S3QENTiQLIk7tQ
        Q6AxjjJYpPHtWStaMBoRE34=
X-Google-Smtp-Source: ABdhPJyd3wQyZyoWah4E9UJY4fp8iJaRur6yBu+JhYIZ4ivqtHiZjYCtuU4zIwQvCXivluQ7ZwCqug==
X-Received: by 2002:ac8:7c8a:: with SMTP id y10mr5700134qtv.218.1589579327457;
        Fri, 15 May 2020 14:48:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
        by smtp.gmail.com with ESMTPSA id m21sm2495019qkh.50.2020.05.15.14.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:48:46 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v5 02/10] media: vidtv: implement a tuner driver
Date:   Fri, 15 May 2020 18:48:07 -0300
Message-Id: <20200515214815.15514-3-dwlsalmeida@gmail.com>
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

The virtual DVB test driver serves as a reference DVB driver and helps
validate the existing APIs in the media subsystem. It can also aid developers
working on userspace applications.

This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
ISDB-T and ATSC when completed.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile     |   1 +
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 408 ++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_tuner.h    |  26 ++
 3 files changed, 435 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index d1558d84eeaed..e625810a82603 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
new file mode 100644
index 0000000000000..da4d4b9bfffa3
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * The vidtv tuner should support common TV standards such as
+ * DVB-T/T2/S/S2, ISDB-T and ATSC when completed.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#include "vidtv_tuner.h"
+
+MODULE_DESCRIPTION("Virtual DVB Tuner");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
+
+struct vidtv_tuner_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok, cnr_good;
+};
+
+static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QAM_256, FEC_NONE,  34000, 38000},
+	{ QAM_64,  FEC_NONE,  30000, 34000},
+};
+
+static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK, FEC_1_2,  7000, 10000},
+
+	{ QPSK, FEC_2_3,  9000, 12000},
+	{ QPSK, FEC_3_4, 10000, 13000},
+	{ QPSK, FEC_5_6, 11000, 14000},
+
+	{ QPSK, FEC_7_8, 12000, 15000},
+};
+
+static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK,  FEC_1_2,   9000,  12000},
+	{ QPSK,  FEC_2_3,  11000,  14000},
+	{ QPSK,  FEC_3_4,  12000,  15000},
+	{ QPSK,  FEC_5_6,  12000,  15000},
+	{ QPSK,  FEC_8_9,  13000,  16000},
+	{ QPSK,  FEC_9_10, 13500,  16500},
+	{ PSK_8, FEC_2_3,  14500,  17500},
+	{ PSK_8, FEC_3_4,  16000,  19000},
+	{ PSK_8, FEC_5_6,  17500,  20500},
+	{ PSK_8, FEC_8_9,  19000,  22000},
+};
+
+static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db*/
+	{   QPSK, FEC_1_2,  4100,  5900},
+	{   QPSK, FEC_2_3,  6100,  9600},
+	{   QPSK, FEC_3_4,  7200, 12400},
+	{   QPSK, FEC_5_6,  8500, 15600},
+	{   QPSK, FEC_7_8,  9200, 17500},
+
+	{ QAM_16, FEC_1_2,  9800, 11800},
+	{ QAM_16, FEC_2_3, 12100, 15300},
+	{ QAM_16, FEC_3_4, 13400, 18100},
+	{ QAM_16, FEC_5_6, 14800, 21300},
+	{ QAM_16, FEC_7_8, 15700, 23600},
+
+	{ QAM_64, FEC_1_2, 14000, 16000},
+	{ QAM_64, FEC_2_3, 19900, 25400},
+	{ QAM_64, FEC_3_4, 24900, 27900},
+	{ QAM_64, FEC_5_6, 21300, 23300},
+	{ QAM_64, FEC_7_8, 22000, 24000},
+};
+
+struct vidtv_tuner_hardware_state {
+	bool asleep;
+	u32 lock_status;
+	u32 if_frequency;
+	u32 tuned_frequency;
+	u32 bandwidth;
+};
+
+struct vidtv_tuner_dev {
+	struct dvb_frontend *fe;
+	struct vidtv_tuner_hardware_state hw_state;
+	struct vidtv_tuner_config config;
+};
+
+static struct vidtv_tuner_dev*
+vidtv_tuner_get_dev(struct dvb_frontend *fe)
+{
+	struct i2c_client *client = fe->tuner_priv;
+
+	return i2c_get_clientdata(client);
+}
+
+static s32 vidtv_tuner_check_frequency_shift(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct vidtv_tuner_config config  = tuner_dev->config;
+	u32    *valid_freqs               = NULL;
+	u32    array_sz                   = 0;
+	u32 i;
+	u32 shift;
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		valid_freqs = config.vidtv_valid_dvb_t_freqs;
+		array_sz    = ARRAY_SIZE(config.vidtv_valid_dvb_t_freqs);
+		break;
+	case SYS_DVBS:
+	case SYS_DVBS2:
+		valid_freqs = config.vidtv_valid_dvb_s_freqs;
+		array_sz    = ARRAY_SIZE(config.vidtv_valid_dvb_s_freqs);
+		break;
+	case SYS_DVBC_ANNEX_A:
+		valid_freqs = config.vidtv_valid_dvb_c_freqs;
+		array_sz    = ARRAY_SIZE(config.vidtv_valid_dvb_c_freqs);
+		break;
+
+	default:
+		pr_warn("%s: unsupported delivery system: %u\n",
+			__func__,
+			c->delivery_system);
+
+		return -EINVAL;
+	}
+
+	for (i = 0; i < array_sz; i++) {
+		shift = abs(c->frequency - valid_freqs[i]);
+
+		if (!shift)
+			return 0;
+
+		/*
+		 * This will provide a value from 0 to 100 that would
+		 * indicate how far is the tuned frequency from the
+		 * right one.
+		 */
+		if (shift < config.max_frequency_shift_hz)
+			return shift * 100 / config.max_frequency_shift_hz;
+	}
+
+	return -EINVAL;
+}
+
+static int
+vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
+{
+	struct dtv_frontend_properties *c          = &fe->dtv_property_cache;
+	struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
+	u32    array_size                          = 0;
+	s32 shift;
+	u32 i;
+
+	shift = vidtv_tuner_check_frequency_shift(fe);
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual   = vidtv_tuner_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_tuner_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual   = vidtv_tuner_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_tuner_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual   = vidtv_tuner_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_tuner_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual   = vidtv_tuner_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(vidtv_tuner_c_cnr_2_qual);
+		break;
+
+	default:
+		pr_warn_ratelimited("%s: unsupported delivery system: %u\n",
+				    __func__,
+				    c->delivery_system);
+		return -EINVAL;
+	}
+
+	for (i = 0; i <= array_size; i++) {
+		if (cnr2qual[i].modulation != c->modulation ||
+		    cnr2qual[i].fec != c->fec_inner)
+			continue;
+
+		if (!shift) {
+			*strength = cnr2qual[i].cnr_good;
+			return 0;
+		}
+		if (shift < 0) {	/* Channel not tuned */
+			*strength = 0;
+			return 0;
+		}
+		/*
+		 * Channel tuned at wrong frequency. Simulate that the
+		 * Carrier S/N ratio is not too good.
+		 */
+
+		*strength = cnr2qual[i].cnr_ok -
+			    (cnr2qual[i].cnr_good - cnr2qual[i].cnr_ok);
+		return 0;
+	}
+
+	/*
+	 * do a linear interpolation between 34dB and 10dB if we can't
+	 * match against the table
+	 */
+	*strength = 34 - 24 * shift / 100;
+	return 0;
+}
+
+static int vidtv_tuner_init(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+	struct vidtv_tuner_config config  = tuner_dev->config;
+
+	msleep_interruptible(config.mock_power_up_delay_msec);
+
+	tuner_dev->hw_state.asleep       = false;
+	tuner_dev->hw_state.if_frequency = 5000;
+
+	return 0;
+}
+
+static int vidtv_tuner_sleep(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	tuner_dev->hw_state.asleep = true;
+	return 0;
+}
+
+static int vidtv_tuner_suspend(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	tuner_dev->hw_state.asleep = true;
+	return 0;
+}
+
+static int vidtv_tuner_resume(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	tuner_dev->hw_state.asleep = false;
+	return 0;
+}
+
+static int vidtv_tuner_set_params(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+	struct vidtv_tuner_config config  = tuner_dev->config;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	u32    min_freq               = fe->ops.tuner_ops.info.frequency_min_hz;
+	u32    max_freq               = fe->ops.tuner_ops.info.frequency_max_hz;
+	u32    min_bw                 = fe->ops.tuner_ops.info.bandwidth_min;
+	u32    max_bw                 = fe->ops.tuner_ops.info.bandwidth_max;
+
+	if (c->frequency < min_freq  || c->frequency > max_freq  ||
+	    c->bandwidth_hz < min_bw || c->bandwidth_hz > max_bw) {
+		tuner_dev->hw_state.lock_status = 0;
+		return -EINVAL;
+	}
+
+	tuner_dev->hw_state.tuned_frequency = c->frequency;
+	tuner_dev->hw_state.bandwidth       = c->bandwidth_hz;
+	tuner_dev->hw_state.lock_status     = TUNER_STATUS_LOCKED;
+
+	msleep_interruptible(config.mock_tune_delay_msec);
+	return 0;
+}
+
+static int vidtv_tuner_set_config(struct dvb_frontend *fe,
+				  void *priv_cfg)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	memcpy(&tuner_dev->config, priv_cfg, sizeof(tuner_dev->config));
+
+	return 0;
+}
+
+static int vidtv_tuner_get_frequency(struct dvb_frontend *fe,
+				     u32 *frequency)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	*frequency = tuner_dev->hw_state.tuned_frequency;
+
+	return 0;
+}
+
+static int vidtv_tuner_get_bandwidth(struct dvb_frontend *fe,
+				     u32 *bandwidth)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	*bandwidth = tuner_dev->hw_state.bandwidth;
+
+	return 0;
+}
+
+static int vidtv_tuner_get_if_frequency(struct dvb_frontend *fe,
+					u32 *frequency)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	*frequency = tuner_dev->hw_state.if_frequency;
+
+	return 0;
+}
+
+static int vidtv_tuner_get_status(struct dvb_frontend *fe, u32 *status)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+
+	*status = tuner_dev->hw_state.lock_status;
+
+	return 0;
+}
+
+static const struct dvb_tuner_ops vidtv_tuner_ops = {
+	.init             = vidtv_tuner_init,
+	.sleep            = vidtv_tuner_sleep,
+	.suspend          = vidtv_tuner_suspend,
+	.resume           = vidtv_tuner_resume,
+	.set_params       = vidtv_tuner_set_params,
+	.set_config       = vidtv_tuner_set_config,
+	.get_bandwidth    = vidtv_tuner_get_bandwidth,
+	.get_frequency    = vidtv_tuner_get_frequency,
+	.get_if_frequency = vidtv_tuner_get_if_frequency,
+	.get_status       = vidtv_tuner_get_status,
+	.get_rf_strength  = vidtv_tuner_get_signal_strength
+};
+
+static const struct i2c_device_id vidtv_tuner_i2c_id_table[] = {
+	{"vidtv_tuner", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, vidtv_tuner_i2c_id_table);
+
+static int vidtv_tuner_i2c_probe(struct i2c_client *client,
+				 const struct i2c_device_id *id)
+{
+	struct vidtv_tuner_config *config = client->dev.platform_data;
+	struct dvb_frontend *fe           = config->fe;
+	struct vidtv_tuner_dev *tuner_dev = NULL;
+
+	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
+	if (!tuner_dev)
+		return -ENOMEM;
+
+	tuner_dev->fe = config->fe;
+	i2c_set_clientdata(client, tuner_dev);
+
+	memcpy(&fe->ops.tuner_ops,
+	       &vidtv_tuner_ops,
+	       sizeof(struct dvb_tuner_ops));
+
+	fe->tuner_priv = client;
+
+	return 0;
+}
+
+static int vidtv_tuner_i2c_remove(struct i2c_client *client)
+{
+	struct vidtv_tuner_dev *tuner_dev = i2c_get_clientdata(client);
+	struct dvb_frontend *fe           = tuner_dev->fe;
+
+	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
+	fe->tuner_priv = NULL;
+	kfree(tuner_dev);
+
+	return 0;
+}
+
+static struct i2c_driver vidtv_tuner_i2c_driver = {
+	.driver = {
+		.name                = "vidtv_tuner",
+		.suppress_bind_attrs = true,
+	},
+	.probe    = vidtv_tuner_i2c_probe,
+	.remove   = vidtv_tuner_i2c_remove,
+	.id_table = vidtv_tuner_i2c_id_table,
+};
+module_i2c_driver(vidtv_tuner_i2c_driver);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.h b/drivers/media/test-drivers/vidtv/vidtv_tuner.h
new file mode 100644
index 0000000000000..46407739f5d44
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_TUNER_H
+#define VIDTV_TUNER_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+struct vidtv_tuner_config {
+	struct dvb_frontend *fe;
+	u32 mock_power_up_delay_msec;
+	u32 mock_tune_delay_msec;
+	u32 vidtv_valid_dvb_t_freqs[8];
+	u32 vidtv_valid_dvb_c_freqs[8];
+	u32 vidtv_valid_dvb_s_freqs[8];
+	u8  max_frequency_shift_hz;
+};
+
+#endif //VIDTV_TUNER_H
-- 
2.26.2

