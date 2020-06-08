Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0FE1F1F8C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 21:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgFHTNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 15:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgFHTNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 15:13:50 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6800DC08C5C2;
        Mon,  8 Jun 2020 12:13:50 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id y1so15610663qtv.12;
        Mon, 08 Jun 2020 12:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/PU8nxPZVDVFTO8tmDn0c/xAMuXK7qJ1IZOoAZXcPBk=;
        b=lTjRQPFnOUYJj4HRyoqP6/oWLTlrQIrpbCxDgMBjd66Vt+u3xur0JS3rtpU5b8b6UH
         KnOPPP0LSr6ybBT5Da0LBfOxMDt4LDfPUPK9Fsylg9fW14K8OzSTvzHIcN+cPpucjrWI
         /NqEyGDjaihIaQ0wRdM9Z/M6bPYn2qXGEuousEJkIYb6Atu6ctt+nUZDv4sd4tVfn9Tq
         j/2uPcHkRj5EwNLmr/0WOThrtIG7N1Uq6A63cEEHdgfPeSFCq0J131j2Oo2t4RGdSnK/
         xqtp5BI8nKB/1lK9VmE4Ku+0zsBRJU18JagVspjI2tumEBxVIian4D9SPSXqnaxfaa/b
         6M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/PU8nxPZVDVFTO8tmDn0c/xAMuXK7qJ1IZOoAZXcPBk=;
        b=InKfJuBl6wYFFjUilrS0RsRwORwIOmXBBCFwcnT2MuRgHuVjvOejGKrqW7s/oNQ2Dn
         H0M0rjP8d08OTfbXNUid9uI2FQGXGFFOZ0Zu6IbnCTKuq0iO4OHR+nXAMXPeFYX3xSrU
         WHCwOvPB0qcw31pmJaq3/Im1s8+DMm7BGYd5cUirJ/5N8yiukybkT2JGV57CW3TNr9rE
         jPigFg1IpazOI8A/XjcPPgc+HY4ydUgTZXz+/lFjvjpsHqiVmKdlmOW28/K4z7TUPULN
         RmxctCIx5LVzBk82ly4P5kzULraM5G14TLFcVSafeMsoBwdU0agcI/xdxnE/nmd2EBL6
         p8GA==
X-Gm-Message-State: AOAM533cibv+ECsO+K/yKil7N2vOcTea3wf+UW0nKunloEyJSH0B3Qt7
        a6nEUaISQc5ZYR3SUmV3goI=
X-Google-Smtp-Source: ABdhPJysaWLF17vUIEDr7/r/hhDB+boEUk/b+CuWak+k/sRNKyyTGbUzCu6R5oQMSltvlAMiVtwk5g==
X-Received: by 2002:ac8:42ce:: with SMTP id g14mr24569227qtm.117.1591643629288;
        Mon, 08 Jun 2020 12:13:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602e:f9c8:df8a:b245:7b29:c366])
        by smtp.gmail.com with ESMTPSA id k20sm8461022qtu.16.2020.06.08.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 12:13:48 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v7 1/4] media: vidtv: implement a tuner driver
Date:   Mon,  8 Jun 2020 16:13:30 -0300
Message-Id: <20200608191333.1784963-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200608191333.1784963-1-dwlsalmeida@gmail.com>
References: <20200608191333.1784963-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

The virtual DVB test driver serves as a reference DVB driver and helps
validate the existing APIs in the media subsystem. It can also aid
developers working on userspace applications.

This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
ISDB-T and ATSC when completed.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 MAINTAINERS                                   |   8 +
 drivers/media/test-drivers/Kconfig            |  16 +
 drivers/media/test-drivers/Makefile           |   1 +
 drivers/media/test-drivers/vidtv/Kconfig      |  11 +
 drivers/media/test-drivers/vidtv/Makefile     |   5 +
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 427 ++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_tuner.h    |  43 ++
 7 files changed, 511 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a5b1d3c8af0a..2a344226b88d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18043,6 +18043,14 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/test-drivers/vivid/*
 
+VIDTV VIRTUAL DIGITAL TV DRIVER
+M:	Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+W:	https://linuxtv.org
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/test-drivers/vidtv/*
+
 VLYNQ BUS
 M:	Florian Fainelli <f.fainelli@gmail.com>
 L:	openwrt-devel@lists.openwrt.org (subscribers-only)
diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
index 188381c855939..874fcc72c48c3 100644
--- a/drivers/media/test-drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -4,6 +4,16 @@ menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV
 
+menuconfig DVB_TEST_DRIVERS
+	bool "DVB test drivers"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+	help
+	  Enables DVB test drivers.
+
+	  This enables the DVB test drivers. They are meant as an aid for
+	  DVB device driver writers and developers working on userspace
+	  media applications.
+
 if V4L_TEST_DRIVERS
 
 source "drivers/media/test-drivers/vimc/Kconfig"
@@ -24,3 +34,9 @@ config VIDEO_VIM2M
 source "drivers/media/test-drivers/vicodec/Kconfig"
 
 endif #V4L_TEST_DRIVERS
+
+if DVB_TEST_DRIVERS
+
+source "drivers/media/test-drivers/vidtv/Kconfig"
+
+endif #DVB_TEST_DRIVERS
diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
index 74410d3a9f2d2..9f0e4ebb2efe7 100644
--- a/drivers/media/test-drivers/Makefile
+++ b/drivers/media/test-drivers/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
 obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
 obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
 obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
+obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
diff --git a/drivers/media/test-drivers/vidtv/Kconfig b/drivers/media/test-drivers/vidtv/Kconfig
new file mode 100644
index 0000000000000..22c4fd39461f1
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DVB_VIDTV
+	tristate "Virtual DVB Driver (vidtv)"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+	help
+	  The virtual DVB test driver serves as a reference DVB driver and helps
+	  validate the existing APIs in the media subsystem. It can also aid developers
+	  working on userspace applications.
+
+
+	  When in doubt, say N.
diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
new file mode 100644
index 0000000000000..58e022c094e5e
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dvb-vidtv-tuner-objs := vidtv_tuner.o
+
+obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
new file mode 100644
index 0000000000000..30a05194e556c
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * The vidtv tuner should support common TV standards such as
+ * DVB-T/T2/S/S2, ISDB-T and ATSC when completed.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
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
+struct vidtv_tuner_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok;
+	u32 cnr_good;
+};
+
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QAM_256, FEC_NONE,  34000, 38000},
+	{ QAM_64,  FEC_NONE,  30000, 34000},
+};
+
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK, FEC_1_2,  7000, 10000},
+	{ QPSK, FEC_2_3,  9000, 12000},
+	{ QPSK, FEC_3_4, 10000, 13000},
+	{ QPSK, FEC_5_6, 11000, 14000},
+	{ QPSK, FEC_7_8, 12000, 15000},
+};
+
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
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
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db*/
+	{   QPSK, FEC_1_2,  4100,  5900},
+	{   QPSK, FEC_2_3,  6100,  9600},
+	{   QPSK, FEC_3_4,  7200, 12400},
+	{   QPSK, FEC_5_6,  8500, 15600},
+	{   QPSK, FEC_7_8,  9200, 17500},
+	{ QAM_16, FEC_1_2,  9800, 11800},
+	{ QAM_16, FEC_2_3, 12100, 15300},
+	{ QAM_16, FEC_3_4, 13400, 18100},
+	{ QAM_16, FEC_5_6, 14800, 21300},
+	{ QAM_16, FEC_7_8, 15700, 23600},
+	{ QAM_64, FEC_1_2, 14000, 16000},
+	{ QAM_64, FEC_2_3, 19900, 25400},
+	{ QAM_64, FEC_3_4, 24900, 27900},
+	{ QAM_64, FEC_5_6, 21300, 23300},
+	{ QAM_64, FEC_7_8, 22000, 24000},
+};
+
+/**
+ * struct vidtv_tuner_hardware_state - Simulate the tuner hardware status
+ * @asleep: whether the tuner is asleep, i.e whether _sleep() or _suspend() was
+ * called.
+ * @lock_status: Whether the tuner has managed to lock on the requested
+ * frequency.
+ * @if_frequency: The tuner's intermediate frequency. Hardcoded for the purposes
+ * of simulation.
+ * @tuned_frequency: The actual tuned frequency.
+ * @bandwidth: The actual bandwidth.
+ *
+ * This structure is meant to simulate the status of the tuner hardware, as if
+ * we had a physical tuner hardware.
+ */
+struct vidtv_tuner_hardware_state {
+	bool asleep;
+	u32 lock_status;
+	u32 if_frequency;
+	u32 tuned_frequency;
+	u32 bandwidth;
+};
+
+/**
+ * struct vidtv_tuner_dev - The tuner struct
+ * @fe: A pointer to the dvb_frontend structure allocated by vidtv_demod
+ * @hw_state: A struct to simulate the tuner's hardware state as if we had a
+ * physical tuner hardware.
+ * @config: The configuration used to start the tuner module, usually filled
+ * by a bridge driver. For vidtv, this is filled by vidtv_bridge before the
+ * tuner module is probed.
+ */
+struct vidtv_tuner_dev {
+	struct dvb_frontend *fe;
+	struct vidtv_tuner_hardware_state hw_state;
+	struct vidtv_tuner_config config;
+};
+
+static struct vidtv_tuner_dev*
+vidtv_tuner_get_dev(struct dvb_frontend *fe)
+{
+	return i2c_get_clientdata(fe->tuner_priv);
+}
+
+static s32 vidtv_tuner_check_frequency_shift(struct dvb_frontend *fe)
+{
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct vidtv_tuner_config config  = tuner_dev->config;
+	u32 *valid_freqs = NULL;
+	u32 array_sz = 0;
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
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	const struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
+	u32 array_size = 0;
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
+	tuner_dev->hw_state.asleep = false;
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
+
+	u32 min_freq = fe->ops.tuner_ops.info.frequency_min_hz;
+	u32 max_freq = fe->ops.tuner_ops.info.frequency_max_hz;
+	u32 min_bw = fe->ops.tuner_ops.info.bandwidth_min;
+	u32 max_bw = fe->ops.tuner_ops.info.bandwidth_max;
+
+	if (c->frequency < min_freq  || c->frequency > max_freq  ||
+	    c->bandwidth_hz < min_bw || c->bandwidth_hz > max_bw) {
+		tuner_dev->hw_state.lock_status = 0;
+		return -EINVAL;
+	}
+
+	tuner_dev->hw_state.tuned_frequency = c->frequency;
+	tuner_dev->hw_state.bandwidth = c->bandwidth_hz;
+	tuner_dev->hw_state.lock_status = TUNER_STATUS_LOCKED;
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
+	{"dvb_vidtv_tuner", 0},
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
+		.name                = "dvb_vidtv_tuner",
+		.suppress_bind_attrs = true,
+	},
+	.probe    = vidtv_tuner_i2c_probe,
+	.remove   = vidtv_tuner_i2c_remove,
+	.id_table = vidtv_tuner_i2c_id_table,
+};
+module_i2c_driver(vidtv_tuner_i2c_driver);
+
+MODULE_DESCRIPTION("Virtual DVB Tuner");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.h b/drivers/media/test-drivers/vidtv/vidtv_tuner.h
new file mode 100644
index 0000000000000..8455b2d564b33
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_TUNER_H
+#define VIDTV_TUNER_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+#define NUM_VALID_TUNER_FREQS 8
+
+/**
+ * struct vidtv_tuner_config - Configuration used to init the tuner.
+ * @fe: A pointer to the dvb_frontend structure allocated by vidtv_demod.
+ * @mock_power_up_delay_msec: Simulate a power-up delay.
+ * @mock_tune_delay_msec: Simulate a tune delay.
+ * @vidtv_valid_dvb_t_freqs: The valid DVB-T frequencies to simulate.
+ * @vidtv_valid_dvb_c_freqs: The valid DVB-C frequencies to simulate.
+ * @vidtv_valid_dvb_s_freqs: The valid DVB-S frequencies to simulate.
+ * @max_frequency_shift_hz: The maximum frequency shift in HZ allowed when
+ * tuning in a channel
+ *
+ * The configuration used to init the tuner module, usually filled
+ * by a bridge driver. For vidtv, this is filled by vidtv_bridge before the
+ * tuner module is probed.
+ */
+struct vidtv_tuner_config {
+	struct dvb_frontend *fe;
+	u32 mock_power_up_delay_msec;
+	u32 mock_tune_delay_msec;
+	u32 vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS];
+	u32 vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS];
+	u32 vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS];
+	u8  max_frequency_shift_hz;
+};
+
+#endif //VIDTV_TUNER_H
-- 
2.27.0

