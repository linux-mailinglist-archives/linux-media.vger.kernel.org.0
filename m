Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F4D249133
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 00:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgHRWvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 18:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgHRWvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 18:51:00 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74F1C061389;
        Tue, 18 Aug 2020 15:50:59 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id x69so19962150qkb.1;
        Tue, 18 Aug 2020 15:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=088w4zVkVRvFXaoA5Sy5jfEZwMiuE65O21DvH8Ipjes=;
        b=cT9/8tPVfdvX92l4U8galdl7Q7sqWt8sEXPEFokK0e7PQ7fDMrPQ2T48lRyV0Q2eQi
         JLFNDo9cG0o1cDo/d1NXb4rKZSSEilEqLzb4WIs5hONFPDVmkA5ZvPbk2Eie0TRKpa94
         +qrg2nvpC3f3h1npeSVy4ilGEN7FjmDm8XBODo21rJ9UiakDO9d2NLvWih/3/RthCnXB
         Iijo2Ybt7f7KCu+ZRUFdAtpUFFwNBI7LXbud6Ens3erQroY5bX0dfxWcZBorI4VHWEbr
         I9NRHXqLieFwaUlpHkHcXj2mazgt8hmAee8d4b1LugErKWNGsPSUNgtXLwQvv6Y3uuhJ
         3xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=088w4zVkVRvFXaoA5Sy5jfEZwMiuE65O21DvH8Ipjes=;
        b=PSo3kuNO6s1lrlnVlzYRr74Vk9Prni827ubwwcjOV6gTajWjcFZuVUfbBSVEH3Qw6C
         SudYaz439P8+NI/JCio0n6vv22H7tBy8O7JP89WtSyq2gMWfrJ9k/vgNG8iTO60jmDeK
         5U4typiMJ4wnBLBYqNFxsSwmrFLi5rqTv6z/1LwvSIs9GFmEtAFrqdDpW3XMDBgQp//+
         Qcl+Cgb4gSgL15tItbFD+okc0QskCnS4gE79yOt61uDmnAGXtwlQthmmth4L/e/4lKnZ
         9UKkvmk+90NCiH1XgEfWePeCDYy/87WF3jkvS6DxzrlvOPQG32/bsog7wyVXXvmkJEmW
         LMaA==
X-Gm-Message-State: AOAM531lZY2QPUJkchZHE6PdfSzeBvxGj3hW7MikOc6eN6/zXn/q+gkC
        BjxrgTjlp2fAdwSIosLx5oRQzdRNF52vMQ==
X-Google-Smtp-Source: ABdhPJx9Oi1cHPW/p28IKBkqqK8ejWJVdpUAb4F0F4jsbTk2RQSCsfHTy8g7WVhRH4YPhjkVjr6T1A==
X-Received: by 2002:a37:2750:: with SMTP id n77mr19094864qkn.26.1597791057865;
        Tue, 18 Aug 2020 15:50:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id h13sm24566519qtu.7.2020.08.18.15.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 15:50:57 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [v9 3/4] media: vidtv: add a bridge driver
Date:   Tue, 18 Aug 2020 19:50:40 -0300
Message-Id: <20200818225041.1133770-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818225041.1133770-1-dwlsalmeida@gmail.com>
References: <20200818225041.1133770-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Digital TV devices consist of several independent hardware components
which are controlled by different drivers.
Each media device is controlled by a group of cooperating drivers with the
bridge driver as the main driver.

This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].

The bridge driver binds to the other drivers, that is, vidtv_tuner and
vidtv_demod and implements the digital demux logic, providing userspace
with a MPEG Transport Stream.

The MPEG related code is split in the following way:

- vidtv_ts: code to work with MPEG TS packets, such as TS headers,
adaptation fields, PCR packets and NULL packets.

- vidtv_psi: this is the PSI generator.
PSI packets contain general information about a MPEG Transport Stream.
A PSI generator is needed so userspace apps can retrieve information
about the Transport Stream and eventually tune into a (dummy) channel.

Because the generator is implemented in a separate file, it can be
reused elsewhere in the media subsystem.

Currently vidtv supports working with 3 PSI tables:
PAT, PMT and SDT.

- vidtv_pes: implements the PES logic to convert encoder data into
MPEG TS packets. These can then be fed into a TS multiplexer and
eventually into userspace.

- vidtv_s302m: implements a S302M encoder to make it possible to
insert PCM audio data in the generated MPEG Transport Stream.

This shall enable passing an audio signal into userspace so it can be
decoded and played by media software.

- vidtv_channels: Implements a 'channel' abstraction

When vidtv boots, it will create some hardcoded channels:

Their services will be concatenated to populate the SDT.
Their programs will be concatenated to populate the PAT
For each program in the PAT, a PMT section will be created
The PMT section for a channel will be assigned its streams.
Every stream will have its corresponding encoder polled to produce TS
packets
These packets may be interleaved by the mux and then delivered to the
bridge

- vidtv_mux - Implements a MPEG TS mux, loosely based on the ffmpeg
implementation

The multiplexer is responsible for polling encoders,
interleaving packets, padding the resulting stream with NULL packets if
necessary and then delivering the resulting TS packets to the bridge
driver so it can feed the demux.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile     |    5 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  548 +++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   60 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  364 +++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   85 ++
 .../media/test-drivers/vidtv/vidtv_common.c   |   90 ++
 .../media/test-drivers/vidtv/vidtv_common.h   |   33 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   96 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  479 ++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  160 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  396 +++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  189 +++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1350 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  593 ++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  627 ++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  110 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  137 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  130 ++
 18 files changed, 5451 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index 21e50c11c94d..330089e3b70c 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -2,5 +2,8 @@

 dvb-vidtv-tuner-objs := vidtv_tuner.o
 dvb-vidtv-demod-objs := vidtv_demod.o
+dvb-vidtv-bridge-objs := vidtv_bridge.o vidtv_common.o vidtv_ts.o vidtv_psi.o \
+			 vidtv_pes.o vidtv_s302m.o vidtv_channel.o vidtv_mux.o

-obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o
+obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o \
+			   dvb-vidtv-bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
new file mode 100644
index 000000000000..20dc6b67c483
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * When this module is loaded, it will attempt to modprobe 'dvb_vidtv_tuner' and 'dvb_vidtv_demod'.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
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
+#include "vidtv_ts.h"
+#include "vidtv_mux.h"
+#include "vidtv_common.h"
+
+//#define MUX_BUF_MAX_SZ
+//#define MUX_BUF_MIN_SZ
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
+static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS];
+module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
+MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
+		 "Valid DVB-T frequencies to simulate");
+
+static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS];
+module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
+MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
+		 "Valid DVB-C frequencies to simulate");
+
+static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS];
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
+/*
+ * Influences the signal acquisition time. See ISO/IEC 13818-1 : 2000. p. 113.
+ */
+static unsigned int si_period_msec = 40;
+module_param(si_period_msec, uint, 0);
+MODULE_PARM_DESC(si_period_msec, "How often to send SI packets. Default: 40ms");
+
+static unsigned int pcr_period_msec = 40;
+module_param(pcr_period_msec, uint, 0);
+MODULE_PARM_DESC(pcr_period_msec, "How often to send PCR packets. Default: 40ms");
+
+static unsigned int mux_rate_kbytes_sec = 4096;
+module_param(mux_rate_kbytes_sec, uint, 0);
+MODULE_PARM_DESC(mux_rate_kbytes_sec, "Mux rate: will pad stream if below");
+
+static unsigned int pcr_pid = 0x200;
+module_param(pcr_pid, uint, 0);
+MODULE_PARM_DESC(pcr_pid, "PCR PID for all channels: defaults to 0x200");
+
+static unsigned int mux_buf_sz_pkts;
+module_param(mux_buf_sz_pkts, uint, 0);
+MODULE_PARM_DESC(mux_buf_sz_pkts, "Size for the internal mux buffer in multiples of 188 bytes");
+
+static u32 vidtv_bridge_mux_buf_sz_for_mux_rate(void)
+{
+	u64 max_elapsed_time_msecs =  VIDTV_MAX_SLEEP_USECS / 1000;
+	u32 nbytes_expected;
+	u32 mux_buf_sz = mux_buf_sz_pkts * TS_PACKET_LEN;
+	u32 slack;
+
+	nbytes_expected = div64_u64(mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
+	nbytes_expected *= max_elapsed_time_msecs;
+
+	mux_buf_sz = roundup(nbytes_expected, TS_PACKET_LEN);
+	slack = mux_buf_sz / 10;
+
+	//if (mux_buf_sz < MUX_BUF_MIN_SZ)
+	//	mux_buf_sz = MUX_BUF_MIN_SZ;
+
+	//if (mux_buf_sz > MUX_BUF_MAX_SZ)
+	//	mux_buf_sz = MUX_BUF_MAX_SZ;
+
+	return mux_buf_sz + slack;
+}
+
+static bool vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
+{
+	enum fe_status status;
+
+	dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
+
+	return status == (FE_HAS_SIGNAL  |
+			  FE_HAS_CARRIER |
+			  FE_HAS_VITERBI |
+			  FE_HAS_SYNC    |
+			  FE_HAS_LOCK);
+}
+
+static void
+vidtv_bridge_on_new_pkts_avail(void *priv, u8 *buf, u32 npkts)
+{
+	/*
+	 * called on a separate thread by the mux when new packets become
+	 * available
+	 */
+	struct vidtv_dvb *dvb = (struct vidtv_dvb *)priv;
+
+	/* drop packets if we lose the lock */
+	if (vidtv_bridge_check_demod_lock(dvb, 0))
+		dvb_dmx_swfilter_packets(&dvb->demux, buf, npkts);
+}
+
+static int vidtv_start_streaming(struct vidtv_dvb *dvb)
+{
+	struct vidtv_mux_init_args mux_args = {0};
+	u32 mux_buf_sz;
+
+	if (dvb->streaming) {
+		pr_warn_ratelimited("Already streaming. Skipping.\n");
+		return 0;
+	}
+
+	mux_buf_sz = (mux_buf_sz_pkts) ? mux_buf_sz_pkts : vidtv_bridge_mux_buf_sz_for_mux_rate();
+
+	mux_args.mux_rate_kbytes_sec         = mux_rate_kbytes_sec;
+	mux_args.on_new_packets_available_cb = vidtv_bridge_on_new_pkts_avail;
+	mux_args.mux_buf_sz                  = mux_buf_sz;
+	mux_args.pcr_period_usecs            = pcr_period_msec * 1000;
+	mux_args.si_period_usecs             = si_period_msec * 1000;
+	mux_args.pcr_pid                     = pcr_pid;
+	mux_args.transport_stream_id         = VIDTV_DEFAULT_TS_ID;
+	mux_args.priv                        = dvb;
+
+	dvb->streaming = true;
+	dvb->mux = vidtv_mux_init(mux_args);
+	vidtv_mux_start_thread(dvb->mux);
+
+	pr_info_ratelimited("Started streaming\n");
+	return 0;
+}
+
+static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
+{
+	dvb->streaming = false;
+	vidtv_mux_stop_thread(dvb->mux);
+	vidtv_mux_destroy(dvb->mux);
+	dvb->mux = NULL;
+
+	pr_info_ratelimited("Stopped streaming\n");
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
+	int err = 0;
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
+	dvb->i2c_client_demod[n] = dvb_module_probe("dvb_vidtv_demod",
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
+	dvb->i2c_client_tuner[n] = dvb_module_probe("dvb_vidtv_tuner",
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
+	for (j = i; j >= 0; --j)
+		dvb_unregister_frontend(dvb->fe[j]);
+fail_tuner_probe:
+	for (j = i; j >= 0; --j)
+		if (dvb->i2c_client_tuner[j])
+			dvb_module_release(dvb->i2c_client_tuner[j]);
+
+fail_demod_probe:
+	for (j = i; j >= 0; --j)
+		if (dvb->i2c_client_demod[j])
+			dvb_module_release(dvb->i2c_client_demod[j]);
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
+	pr_info("Successfully initialized vidtv!\n");
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
+	vidtv_mux_destroy(dvb->mux);
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
+	for (i = 0; i < NUM_FE; i++)
+		dvb_module_release(dvb->i2c_client_tuner[i]);
+
+	for (i = 0; i < NUM_FE ; i++)
+		dvb_module_release(dvb->i2c_client_demod[i]);
+
+	dvb_unregister_adapter(&dvb->adapter);
+
+	i2c_del_adapter(&dvb->i2c_adapter);
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
index 000000000000..fd65f9838b10
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * When this module is loaded, it will attempt to modprobe 'dvb_vidtv_tuner' and 'dvb_vidtv_demod'.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
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
+#include "vidtv_mux.h"
+
+/**
+ * struct vidtv_dvb - Vidtv bridge state
+ * @pdev: The platform device. Obtained when the bridge is probed.
+ * @fe: The frontends. Obtained when probing the demodulator modules.
+ * @adapter: Represents a DTV adapter. See 'dvb_register_adapter'.
+ * @demux: The demux used by the dvb_dmx_swfilter_packets() call.
+ * @dmx_dev: Represents a demux device.
+ * @dmx_frontend: The frontends associated with the demux.
+ * @i2c_adapter: The i2c_adapter associated with the bridge driver.
+ * @i2c_client_demod: The i2c_clients associated with the demodulator modules.
+ * @i2c_client_tuner: The i2c_clients associated with the tuner modules.
+ * @nfeeds: The number of feeds active.
+ * @feed_lock: Protects access to the start/stop stream logic/data.
+ * @streaming: Whether we are streaming now.
+ * @mux: The abstraction responsible for delivering MPEG TS packets to the bridge.
+ */
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
+	struct mutex feed_lock; /* Protects access to the start/stop stream logic/data. */
+
+	bool streaming;
+
+	struct vidtv_mux *mux;
+};
+
+#endif // VIDTV_BRIDG_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
new file mode 100644
index 000000000000..b3ea2b11448b
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the code for a 'channel' abstraction.
+ *
+ * When vidtv boots, it will create some hardcoded channels.
+ * Their services will be concatenated to populate the SDT.
+ * Their programs will be concatenated to populate the PAT
+ * For each program in the PAT, a PMT section will be created
+ * The PMT section for a channel will be assigned its streams.
+ * Every stream will have its corresponding encoder polled to produce TS packets
+ * These packets may be interleaved by the mux and then delivered to the bridge
+ *
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#include "vidtv_channel.h"
+#include "vidtv_psi.h"
+#include "vidtv_encoder.h"
+#include "vidtv_mux.h"
+#include "vidtv_common.h"
+#include "vidtv_s302m.h"
+
+static void vidtv_channel_encoder_destroy(struct vidtv_encoder *e)
+{
+	struct vidtv_encoder *curr = e;
+	struct vidtv_encoder *tmp = NULL;
+
+	while (curr) {
+		/* forward the call to the derived type */
+		tmp = curr;
+		curr = curr->next;
+		tmp->destroy(tmp);
+	}
+}
+
+struct vidtv_channel
+*vidtv_channel_s302m_init(struct vidtv_channel *head, u16 transport_stream_id)
+{
+	/*
+	 * init an audio only channel with a s302m encoder
+	 */
+	const u16 s302m_service_id          = 0x880;
+	const u16 s302m_program_num         = 0x880;
+	const u16 s302m_program_pid         = 0x101; /* packet id for PMT*/
+	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
+	char *name = "S302m: Sine Wave PCM Audio";
+
+	struct vidtv_channel *s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
+	struct vidtv_s302m_encoder_init_args encoder_args = {};
+
+	s302m->name = kstrdup(name, GFP_KERNEL);
+
+	s302m->service = vidtv_psi_sdt_service_init(NULL, s302m_service_id);
+
+	s302m->service->descriptor = (struct vidtv_psi_desc *)
+				     vidtv_psi_service_desc_init(NULL,
+								 DIGITAL_TELEVISION_SERVICE,
+								 name,
+								 NULL);
+
+	s302m->transport_stream_id = transport_stream_id;
+
+	s302m->program = vidtv_psi_pat_program_init(NULL,
+						    s302m_service_id,
+						    s302m_program_pid);
+
+	s302m->program_num = s302m_program_num;
+
+	s302m->streams = vidtv_psi_pmt_stream_init(NULL,
+						   STREAM_PRIVATE_DATA,
+						   s302m_es_pid);
+
+	encoder_args.es_pid = s302m_es_pid;
+
+	s302m->encoders = vidtv_s302m_encoder_init(encoder_args);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = s302m;
+	}
+
+	return s302m;
+}
+
+static struct vidtv_psi_table_sdt_service
+*vidtv_channel_sdt_serv_cat_into_new(const struct vidtv_channel *channels)
+{
+	/* Concatenate the services */
+	const struct vidtv_channel *cur_chnl = channels;
+
+	struct vidtv_psi_table_sdt_service *curr = NULL;
+	struct vidtv_psi_table_sdt_service *head = NULL;
+	struct vidtv_psi_table_sdt_service *tail = NULL;
+
+	struct vidtv_psi_desc *desc = NULL;
+	u16 service_id;
+
+	if (!cur_chnl)
+		return NULL;
+
+	while (cur_chnl) {
+		curr = cur_chnl->service;
+
+		if (!curr)
+			pr_warn_ratelimited("No services found for channel %s\n", cur_chnl->name);
+
+		while (curr) {
+			service_id = be16_to_cpu(curr->service_id);
+			tail = vidtv_psi_sdt_service_init(tail, service_id);
+
+			desc = vidtv_psi_desc_clone(curr->descriptor);
+			vidtv_psi_desc_assign(&tail->descriptor, desc);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+
+		cur_chnl = cur_chnl->next;
+	}
+
+	return head;
+}
+
+static struct vidtv_psi_table_pat_program*
+vidtv_channel_pat_prog_cat_into_new(const struct vidtv_channel *channels)
+{
+	/* Concatenate the programs */
+	const struct vidtv_channel *cur_chnl = channels;
+	struct vidtv_psi_table_pat_program *curr = NULL;
+	struct vidtv_psi_table_pat_program *head = NULL;
+	struct vidtv_psi_table_pat_program *tail = NULL;
+	u16 serv_id;
+	u16 pid;
+
+	if (!cur_chnl)
+		return NULL;
+
+	while (cur_chnl) {
+		curr = cur_chnl->program;
+
+		if (!curr)
+			pr_warn_ratelimited("No programs found for channel %s\n", cur_chnl->name);
+
+		while (curr) {
+			serv_id = be16_to_cpu(curr->service_id);
+			pid = vidtv_psi_get_pat_program_pid(curr);
+			tail = vidtv_psi_pat_program_init(tail,
+							  serv_id,
+							  pid);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+
+		cur_chnl = cur_chnl->next;
+	}
+
+	return head;
+}
+
+static void
+vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
+				 struct vidtv_psi_table_pmt **sections,
+				 u32 nsections)
+{
+	/*
+	 * Match channels to their respective PMT sections, then assign the
+	 * streams
+	 */
+	struct vidtv_psi_table_pmt *curr_section = NULL;
+	struct vidtv_channel *cur_chnl = channels;
+
+	struct vidtv_psi_table_pmt_stream *s = NULL;
+	struct vidtv_psi_table_pmt_stream *head = NULL;
+	struct vidtv_psi_table_pmt_stream *tail = NULL;
+
+	struct vidtv_psi_desc *desc = NULL;
+	u32 j;
+	u16 curr_id;
+	u16 e_pid; /* elementary stream pid */
+
+	while (cur_chnl) {
+		for (j = 0; j < nsections; ++j) {
+			curr_section = sections[j];
+
+			if (!curr_section)
+				continue;
+
+			curr_id = be16_to_cpu(curr_section->header.id);
+
+			/* we got a match */
+			if (curr_id == cur_chnl->program_num) {
+				s = cur_chnl->streams;
+
+				/* clone the streams for the PMT */
+				while (s) {
+					e_pid = vidtv_psi_pmt_stream_get_elem_pid(s);
+					tail = vidtv_psi_pmt_stream_init(tail,
+									 s->type,
+									 e_pid);
+
+					if (!head)
+						head = tail;
+
+					desc = vidtv_psi_desc_clone(s->descriptor);
+					vidtv_psi_desc_assign(&tail->descriptor, desc);
+
+					s = s->next;
+				}
+
+				vidtv_psi_pmt_stream_assign(curr_section, head);
+				break;
+			}
+		}
+
+		cur_chnl = cur_chnl->next;
+	}
+}
+
+void vidtv_channel_si_init(struct vidtv_mux *m)
+{
+	struct vidtv_psi_table_pat_program *programs = NULL;
+	struct vidtv_psi_table_sdt_service *services = NULL;
+
+	m->si.pat = vidtv_psi_pat_table_init(m->transport_stream_id);
+
+	m->si.sdt = vidtv_psi_sdt_table_init(m->transport_stream_id);
+
+	programs = vidtv_channel_pat_prog_cat_into_new(m->channels);
+	services = vidtv_channel_sdt_serv_cat_into_new(m->channels);
+
+	/* assemble all programs and assign to PAT */
+	vidtv_psi_pat_program_assign(m->si.pat, programs);
+
+	/* assemble all services and assign to SDT */
+	vidtv_psi_sdt_service_assign(m->si.sdt, services);
+
+	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat, m->pcr_pid);
+
+	vidtv_channel_pmt_match_sections(m->channels,
+					 m->si.pmt_secs,
+					 m->si.pat->programs);
+}
+
+void vidtv_channel_si_destroy(struct vidtv_mux *m)
+{
+	u32 i;
+
+	vidtv_psi_pat_table_destroy(m->si.pat);
+
+	for (i = 0; i < m->si.pat->programs; ++i)
+		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
+
+	kfree(m->si.pmt_secs);
+	vidtv_psi_sdt_table_destroy(m->si.sdt);
+}
+
+void vidtv_channels_init(struct vidtv_mux *m)
+{
+	/* this is the place to add new 'channels' for vidtv */
+	m->channels = vidtv_channel_s302m_init(NULL, m->transport_stream_id);
+}
+
+void vidtv_channels_destroy(struct vidtv_mux *m)
+{
+	struct vidtv_channel *curr = m->channels;
+	struct vidtv_channel *tmp = NULL;
+
+	while (curr) {
+		kfree(curr->name);
+		vidtv_psi_sdt_service_destroy(curr->service);
+		vidtv_psi_pat_program_destroy(curr->program);
+		vidtv_psi_pmt_stream_destroy(curr->streams);
+		vidtv_channel_encoder_destroy(curr->encoders);
+
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+static void
+vidtv_channels_add_registration_s302m(struct vidtv_psi_table_pmt *sec)
+{
+	struct vidtv_psi_desc_registration *s302m_r_desc;
+
+	/*
+	 * there might be some descriptor loop there already, in which case we
+	 * concatenate
+	 */
+	struct vidtv_psi_desc *parent = sec->descriptor;
+
+	s302m_r_desc = vidtv_psi_registration_desc_init(parent,
+							cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER),
+							NULL,
+							0);
+
+	/* but if there is no descriptor loop, then assign one */
+	if (!parent)
+		vidtv_pmt_desc_assign(sec,
+				      &sec->descriptor,
+				      (struct vidtv_psi_desc *)s302m_r_desc);
+	else
+		vidtv_psi_pmt_table_update_sec_len(sec);
+}
+
+void vidtv_channels_add_registration_descs(struct vidtv_mux *m)
+{
+	/*
+	 * Some formats might need a registration descriptor to be recognized.
+	 * S302M needs it, and ffmpeg actually checks for it, so add such
+	 * descriptor at the PMT section that contains the stream
+	 */
+	struct vidtv_channel *cur_chnl  = m->channels;
+	struct vidtv_encoder *e         = NULL;
+	struct vidtv_psi_table_pmt *sec = NULL;
+
+	while (cur_chnl) {
+		e   = cur_chnl->encoders;
+		sec = vidtv_psi_find_pmt_sec(m->si.pmt_secs,
+					     m->si.pat->programs,
+					     cur_chnl->program_num);
+
+		/* bug somewhere */
+		if (!sec) {
+			pr_warn_ratelimited("No section for prog_num %d\n",
+					    cur_chnl->program_num);
+
+			goto next;
+		}
+
+		while (e) {
+			switch (e->id) {
+			case S302M:
+				vidtv_channels_add_registration_s302m(sec);
+				break;
+			default:
+				break;
+			}
+
+			e = e->next;
+		}
+next:
+		cur_chnl = cur_chnl->next;
+	}
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.h b/drivers/media/test-drivers/vidtv/vidtv_channel.h
new file mode 100644
index 000000000000..dd5b0eeed267
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the code for a 'channel' abstraction.
+ *
+ * When vidtv boots, it will create some hardcoded channels.
+ * Their services will be concatenated to populate the SDT.
+ * Their programs will be concatenated to populate the PAT
+ * For each program in the PAT, a PMT section will be created
+ * The PMT section for a channel will be assigned its streams.
+ * Every stream will have its corresponding encoder polled to produce TS packets
+ * These packets may be interleaved by the mux and then delivered to the bridge
+ *
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_CHANNEL_H
+#define VIDTV_CHANNEL_H
+
+#include <linux/types.h>
+#include "vidtv_psi.h"
+#include "vidtv_encoder.h"
+#include "vidtv_mux.h"
+
+/**
+ * struct vidtv_channel - A 'channel' abstraction
+ *
+ * When vidtv boots, it will create some hardcoded channels.
+ * Their services will be concatenated to populate the SDT.
+ * Their programs will be concatenated to populate the PAT
+ * For each program in the PAT, a PMT section will be created
+ * The PMT section for a channel will be assigned its streams.
+ * Every stream will have its corresponding encoder polled to produce TS packets
+ * These packets may be interleaved by the mux and then delivered to the bridge
+ *
+ * @transport_stream_id: a number to identify the TS, chosen at will.
+ * @service: A _single_ service. Will be concatenated into the SDT.
+ * @program_num: The link between PAT, PMT and SDT.
+ * @program: A _single_ program with one or more streams associated with it.
+ * Will be concatenated into the PAT.
+ * @streams: A stream loop used to populate the PMT section for 'program'
+ * @encoders: A encoder loop. There must be one encoder for each stream.
+ * @next: Optionally chain this channel.
+ */
+struct vidtv_channel {
+	char *name;
+	u16 transport_stream_id;
+	struct vidtv_psi_table_sdt_service *service;
+	u16 program_num;
+	struct vidtv_psi_table_pat_program *program;
+	struct vidtv_psi_table_pmt_stream *streams;
+	struct vidtv_encoder *encoders;
+	struct vidtv_channel *next;
+};
+
+/**
+ * vidtv_channel_si_init - Init the PSI tables from the channels in the mux
+ * @m: The mux containing the channels.
+ */
+void vidtv_channel_si_init(struct vidtv_mux *m);
+void vidtv_channel_si_destroy(struct vidtv_mux *m);
+
+/**
+ * vidtv_channels_init - Init hardcoded, fake 'channels'.
+ * @m: The mux to store the channels into.
+ */
+void vidtv_channels_init(struct vidtv_mux *m);
+struct vidtv_channel
+*vidtv_channel_s302m_init(struct vidtv_channel *head, u16 transport_stream_id);
+void vidtv_channels_destroy(struct vidtv_mux *m);
+
+/**
+ * vidtv_add_registration_descs - Add registration descriptors, if needed.
+ * @m: The mux containing the channels.
+ *
+ * Some content might be carried in 'private streams' and thus need some more
+ * metadata in order to be decoded. This function will add this descriptor if needed.
+ */
+void vidtv_channels_add_registration_descs(struct vidtv_mux *m);
+
+#endif //VIDTV_CHANNEL_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
new file mode 100644
index 000000000000..bac7cf4b9ea9
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "vidtv_common.h"
+
+/**
+ * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
+ *	generator, in order to avoid going past the
+ *	output buffer.
+ * @to:	Starting element to where a MPEG-TS packet will
+ *	be copied.
+ * @to_offset:	Starting position of the @to buffer to be filled.
+ * @to_size:	Size of the @to buffer.
+ * @from:	Starting element of the buffer to be copied.
+ * @len:	Number of elements to be copy from @from buffer
+ *	into @to+ @to_offset buffer.
+ *
+ * Note:
+ *	Real digital TV demod drivers should not have memcpy
+ *	wrappers. We use it here because emulating MPEG-TS
+ *	generation at kernelspace requires some extra care.
+ *
+ * Return:
+ *	Returns the number of bytes written
+ */
+u32 vidtv_memcpy(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const void *from,
+		 size_t len)
+{
+	if (unlikely(to_offset + len > to_size)) {
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %lu, had %zu\n",
+				   to_offset + len,
+				   to_size);
+		return 0;
+	}
+
+	memcpy(to + to_offset, from, len);
+	return len;
+}
+
+/**
+ * vidtv_memset() - wrapper routine to be used by MPEG-TS
+ *	generator, in order to avoid going past the
+ *	output buffer.
+ * @to:	Starting element to set
+ * @to_offset:	Starting position of the @to buffer to be filled.
+ * @to_size:	Size of the @to buffer.
+ * @c:		The value to set the memory to.
+ * @len:	Number of elements to be copy from @from buffer
+ *	into @to+ @to_offset buffer.
+ *
+ * Note:
+ *	Real digital TV demod drivers should not have memset
+ *	wrappers. We use it here because emulating MPEG-TS
+ *	generation at kernelspace requires some extra care.
+ *
+ * Return:
+ *	Returns the number of bytes written
+ */
+u32 vidtv_memset(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const int c,
+		 size_t len)
+{
+	if (unlikely(to_offset + len > to_size)) {
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %lu, had %zu\n",
+				   to_offset + len,
+				   to_size);
+		return 0;
+	}
+
+	memset(to + to_offset, c, len);
+	return len;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
new file mode 100644
index 000000000000..818e7f2b9ec5
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_COMMON_H
+#define VIDTV_COMMON_H
+
+#include <linux/types.h>
+
+#define CLOCK_UNIT_90KHZ 90000
+#define CLOCK_UNIT_27MHZ 27000000
+#define VIDTV_SLEEP_USECS 10000
+#define VIDTV_MAX_SLEEP_USECS (2 * VIDTV_SLEEP_USECS)
+#define VIDTV_DEFAULT_TS_ID 0x744
+
+u32 vidtv_memcpy(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const void *from,
+		 size_t len);
+
+u32 vidtv_memset(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 int c,
+		 size_t len);
+
+#endif // VIDTV_COMMON_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
new file mode 100644
index 000000000000..83d4bbf56b45
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains a generic encoder type that can provide data for a stream
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_ENCODER_H
+#define VIDTV_ENCODER_H
+
+#include <linux/types.h>
+
+enum vidtv_encoder_id {
+	/* add IDs here when implementing new encoders */
+	S302M,
+};
+
+struct vidtv_access_unit {
+	u32 num_samples;
+	u64 pts;
+	u64 dts;
+	u32 nbytes;
+	u32 offset;
+	struct vidtv_access_unit *next;
+};
+
+/**
+ * struct vidtv_encoder - A generic encoder type.
+ * @id: So we can cast to a concrete implementation when needed.
+ * @name: Usually the same as the stream name.
+ * @encoder_buf: The encoder internal buffer for the access units.
+ * @encoder_buf_sz: The encoder buffer size, in bytes
+ * @encoder_buf_offset: Our byte position in the encoder buffer.
+ * @sample_count: How many samples we have encoded in total.
+ * @src_buf: The source of raw data to be encoded, encoder might set a
+ * default if null.
+ * @src_buf_offset: Our position in the source buffer.
+ * @is_video_encoder: Whether this a video encoder (as opposed to audio)
+ * @ctx: Encoder-specific state.
+ * @stream_id: Examples: Audio streams (0xc0-0xdf), Video streams
+ * (0xe0-0xef).
+ * @es_id: The TS PID to use for the elementary stream in this encoder.
+ * @encode: Prepare enough AUs for the given amount of time.
+ * @clear: Clear the encoder output.
+ * @sync: Attempt to synchronize with this encoder.
+ * @sampling_rate_hz: The sampling rate (or fps, if video) used.
+ * @last_sample_cb: Called when the encoder runs out of data. The encoder
+ *		    might optionally wrap around the src data if this is not
+ *		    implemented. This is so the source can read data in a
+ *		    piecemeal fashion instead of having to
+ *		    provide it all at once.
+ * @destroy: Destroy this encoder, freeing allocated resources.
+ */
+struct vidtv_encoder {
+	enum vidtv_encoder_id id;
+	char *name;
+
+	u8 *encoder_buf;
+	u32 encoder_buf_sz;
+	u32 encoder_buf_offset;
+
+	u64 sample_count;
+
+	struct vidtv_access_unit *access_units;
+
+	void *src_buf;
+	u32 src_buf_sz;
+	u32 src_buf_offset;
+
+	bool is_video_encoder;
+	void *ctx;
+
+	__be16 stream_id;
+
+	__be16 es_pid;
+
+	void *(*encode)(struct vidtv_encoder *e, u64 elapsed_time_usecs);
+
+	u32 (*clear)(struct vidtv_encoder *e);
+
+	struct vidtv_encoder *sync;
+
+	u32 sampling_rate_hz;
+
+	void (*last_sample_cb)(u32 sample_no);
+
+	void (*destroy)(struct vidtv_encoder *e);
+
+	struct vidtv_encoder *next;
+};
+
+#endif /* VIDTV_ENCODER_H */
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
new file mode 100644
index 000000000000..b3a786e5fbd8
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the multiplexer logic for TS packets from different
+ * elementary streams
+ *
+ * Loosely based on libavcodec/mpegtsenc.c
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/delay.h>
+#include <linux/vmalloc.h>
+#include <linux/math64.h>
+#include "vidtv_mux.h"
+#include "vidtv_ts.h"
+#include "vidtv_pes.h"
+#include "vidtv_encoder.h"
+#include "vidtv_channel.h"
+#include "vidtv_common.h"
+#include "vidtv_psi.h"
+
+static struct vidtv_mux_pid_ctx
+*vidtv_mux_get_pid_ctx(struct vidtv_mux *m, u16 pid)
+{
+	struct vidtv_mux_pid_ctx *ctx;
+
+	hash_for_each_possible(m->pid_ctx, ctx, h, pid)
+		if (ctx->pid == pid)
+			return ctx;
+	return NULL;
+}
+
+static struct vidtv_mux_pid_ctx
+*vidtv_mux_create_pid_ctx_once(struct vidtv_mux *m, u16 pid)
+{
+	struct vidtv_mux_pid_ctx *ctx;
+
+	ctx = vidtv_mux_get_pid_ctx(m, pid);
+
+	if (ctx)
+		goto end;
+
+	ctx      = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	ctx->pid = pid;
+	ctx->cc  = 0;
+	hash_add(m->pid_ctx, &ctx->h, pid);
+
+end:
+	return ctx;
+}
+
+static void vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
+{
+	struct vidtv_psi_table_pat_program *p = m->si.pat->program;
+	u16 pid;
+
+	hash_init(m->pid_ctx);
+	/* push the pcr pid ctx */
+	vidtv_mux_create_pid_ctx_once(m, m->pcr_pid);
+	/* push the null packet pid ctx */
+	vidtv_mux_create_pid_ctx_once(m, TS_NULL_PACKET_PID);
+	/* push the PAT pid ctx */
+	vidtv_mux_create_pid_ctx_once(m, VIDTV_PAT_PID);
+	/* push the SDT pid ctx */
+	vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID);
+
+	/* add a ctx for all PMT sections */
+	while (p) {
+		pid = vidtv_psi_get_pat_program_pid(p);
+		vidtv_mux_create_pid_ctx_once(m, pid);
+		p = p->next;
+	}
+}
+
+static void vidtv_mux_pid_ctx_destroy(struct vidtv_mux *m)
+{
+	int bkt;
+	struct vidtv_mux_pid_ctx *ctx;
+
+	hash_for_each(m->pid_ctx, bkt, ctx, h) {
+		hash_del(&ctx->h);
+		kfree(ctx);
+	}
+}
+
+static void vidtv_mux_update_clk(struct vidtv_mux *m)
+{
+	/* call this at every thread iteration */
+	u64 elapsed_time;
+
+	/* this will not hold a value yet if we have just started */
+	m->timing.past_jiffies = m->timing.current_jiffies ?
+				 m->timing.current_jiffies :
+				 get_jiffies_64();
+
+	m->timing.current_jiffies = get_jiffies_64();
+
+	elapsed_time = jiffies_to_usecs(m->timing.current_jiffies -
+					m->timing.past_jiffies);
+
+	/* update the 27Mhz clock proportionally to the elapsed time */
+	m->timing.clk += (CLOCK_UNIT_27MHZ / USEC_PER_SEC) * elapsed_time;
+}
+
+static u32 vidtv_mux_push_si(struct vidtv_mux *m)
+{
+	u32 initial_offset = m->mux_buf_offset;
+
+	struct vidtv_mux_pid_ctx *pat_ctx;
+	struct vidtv_mux_pid_ctx *pmt_ctx;
+	struct vidtv_mux_pid_ctx *sdt_ctx;
+
+	struct vidtv_psi_pat_write_args pat_args = {};
+	struct vidtv_psi_pmt_write_args pmt_args = {};
+	struct vidtv_psi_sdt_write_args sdt_args = {};
+
+	u32 nbytes; /* the number of bytes written by this function */
+	u16 pmt_pid;
+	u32 i;
+
+	pat_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_PAT_PID);
+	sdt_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_SDT_PID);
+
+	pat_args.buf                = m->mux_buf;
+	pat_args.offset             = m->mux_buf_offset;
+	pat_args.pat                = m->si.pat;
+	pat_args.buf_sz             = m->mux_buf_sz;
+	pat_args.continuity_counter = &pat_ctx->cc;
+
+	m->mux_buf_offset += vidtv_psi_pat_write_into(pat_args);
+
+	for (i = 0; i < m->si.pat->programs; ++i) {
+		pmt_pid = vidtv_psi_pmt_get_pid(m->si.pmt_secs[i],
+						m->si.pat);
+
+		if (pmt_pid > TS_LAST_VALID_PID) {
+			pr_warn_ratelimited("PID: %d not found\n", pmt_pid);
+			continue;
+		}
+
+		pmt_ctx = vidtv_mux_get_pid_ctx(m, pmt_pid);
+
+		pmt_args.buf                = m->mux_buf;
+		pmt_args.offset             = m->mux_buf_offset;
+		pmt_args.pmt                = m->si.pmt_secs[i];
+		pmt_args.pid                = pmt_pid;
+		pmt_args.buf_sz             = m->mux_buf_sz;
+		pmt_args.continuity_counter = &pmt_ctx->cc;
+		pmt_args.pcr_pid            = m->pcr_pid;
+
+		/* write each section into buffer */
+		m->mux_buf_offset += vidtv_psi_pmt_write_into(pmt_args);
+	}
+
+	sdt_args.buf                = m->mux_buf;
+	sdt_args.offset             = m->mux_buf_offset;
+	sdt_args.sdt                = m->si.sdt;
+	sdt_args.buf_sz             = m->mux_buf_sz;
+	sdt_args.continuity_counter = &sdt_ctx->cc;
+
+	m->mux_buf_offset += vidtv_psi_sdt_write_into(sdt_args);
+
+	nbytes = m->mux_buf_offset - initial_offset;
+
+	m->num_streamed_si++;
+
+	return nbytes;
+}
+
+static u32 vidtv_mux_push_pcr(struct vidtv_mux *m)
+{
+	struct pcr_write_args args = {};
+	struct vidtv_mux_pid_ctx *ctx;
+	u32 nbytes = 0;
+
+	ctx                     = vidtv_mux_get_pid_ctx(m, m->pcr_pid);
+	args.dest_buf           = m->mux_buf;
+	args.pid                = m->pcr_pid;
+	args.buf_sz             = m->mux_buf_sz;
+	args.continuity_counter = &ctx->cc;
+
+	/* the 27Mhz clock will feed both parts of the PCR bitfield */
+	args.pcr = m->timing.clk;
+
+	nbytes += vidtv_ts_pcr_write_into(args);
+	m->mux_buf_offset += nbytes;
+
+	m->num_streamed_pcr++;
+
+	return nbytes;
+}
+
+static bool vidtv_mux_should_push_pcr(struct vidtv_mux *m)
+{
+	u64 next_pcr_at;
+
+	if (m->num_streamed_pcr == 0)
+		return true;
+
+	next_pcr_at = m->timing.start_jiffies +
+		      usecs_to_jiffies(m->num_streamed_pcr *
+				       m->timing.pcr_period_usecs);
+
+	return time_after64(m->timing.current_jiffies, next_pcr_at);
+}
+
+static bool vidtv_mux_should_push_si(struct vidtv_mux *m)
+{
+	u64 next_si_at;
+
+	if (m->num_streamed_si == 0)
+		return true;
+
+	next_si_at = m->timing.start_jiffies +
+		     usecs_to_jiffies(m->num_streamed_si *
+				      m->timing.si_period_usecs);
+
+	return time_after64(m->timing.current_jiffies, next_si_at);
+}
+
+static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
+					    struct vidtv_encoder *e)
+{
+	u32 nbytes = 0;
+
+	struct pes_write_args args = {};
+	u32 initial_offset = m->mux_buf_offset;
+	struct vidtv_access_unit *au = e->access_units;
+
+	u8 *buf = NULL;
+	struct vidtv_mux_pid_ctx *pid_ctx = vidtv_mux_create_pid_ctx_once(m,
+									  be16_to_cpu(e->es_pid));
+
+	args.dest_buf           = m->mux_buf;
+	args.dest_buf_sz        = m->mux_buf_sz;
+	args.pid                = be16_to_cpu(e->es_pid);
+	args.encoder_id         = e->id;
+	args.continuity_counter = &pid_ctx->cc;
+	args.stream_id          = be16_to_cpu(e->stream_id);
+	args.send_pts           = true;
+
+	while (au) {
+		buf                  = e->encoder_buf + au->offset;
+		args.from            = buf;
+		args.access_unit_len = au->nbytes;
+		args.dest_offset     = m->mux_buf_offset;
+		args.pts             = au->pts;
+
+		m->mux_buf_offset += vidtv_pes_write_into(args);
+
+		au = au->next;
+	}
+
+	/*
+	 * clear the encoder state once the ES data has been written to the mux
+	 * buffer
+	 */
+	e->clear(e);
+
+	nbytes = m->mux_buf_offset - initial_offset;
+	return nbytes;
+}
+
+static u32 vidtv_mux_poll_encoders(struct vidtv_mux *m)
+{
+	u32 nbytes = 0;
+	u32 au_nbytes;
+	struct vidtv_channel *cur_chnl = m->channels;
+	struct vidtv_encoder *e = NULL;
+
+	u64 elapsed_time_usecs = jiffies_to_usecs(m->timing.current_jiffies -
+						  m->timing.past_jiffies);
+
+	elapsed_time_usecs = min_t(u64, elapsed_time_usecs, (u64)VIDTV_MAX_SLEEP_USECS);
+
+	while (cur_chnl) {
+		e = cur_chnl->encoders;
+
+		while (e) {
+			/* encode for 'elapsed_time_usecs' */
+			e->encode(e, elapsed_time_usecs);
+			/* get the TS packets into the mux buffer */
+			au_nbytes = vidtv_mux_packetize_access_units(m, e);
+			nbytes += au_nbytes;
+			m->mux_buf_offset += au_nbytes;
+			/* grab next encoder */
+			e = e->next;
+		}
+
+		/* grab the next channel */
+		cur_chnl = cur_chnl->next;
+	}
+
+	return nbytes;
+}
+
+static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
+{
+	struct null_packet_write_args args = {};
+	u32 initial_offset = m->mux_buf_offset;
+	u32 nbytes; /* the number of bytes written by this function */
+	u32 i;
+	struct vidtv_mux_pid_ctx *ctx;
+
+	ctx = vidtv_mux_get_pid_ctx(m, TS_NULL_PACKET_PID);
+
+	args.dest_buf           = m->mux_buf;
+	args.buf_sz             = m->mux_buf_sz;
+	args.continuity_counter = &ctx->cc;
+	args.dest_offset        = m->mux_buf_offset;
+
+	for (i = 0; i < npkts; ++i) {
+		m->mux_buf_offset += vidtv_ts_null_write_into(args);
+		args.dest_offset  = m->mux_buf_offset;
+	}
+
+	nbytes = m->mux_buf_offset - initial_offset;
+
+	/* sanity check */
+	if (nbytes != npkts * TS_PACKET_LEN)
+		pr_err_ratelimited("%d != %d\n", nbytes, npkts * TS_PACKET_LEN);
+
+	return nbytes;
+}
+
+static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
+{
+	/*
+	 * attempt to maintain a constant mux rate, padding with null packets
+	 * if needed
+	 */
+
+	u32 nbytes = 0;  /* the number of bytes written by this function */
+
+	u64 nbytes_expected; /* the number of bytes we should have written */
+	u64 nbytes_streamed; /* the number of bytes we actually wrote */
+	u32 num_null_pkts; /* number of null packets to bridge the gap */
+
+	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
+						  m->timing.past_jiffies);
+
+	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
+	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
+	nbytes_expected *= elapsed_time_msecs;
+
+	nbytes_streamed = m->mux_buf_offset;
+
+	if (nbytes_streamed < nbytes_expected) {
+		/* can't write half a packet: roundup to a 188 multiple */
+		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
+		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;
+		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
+	}
+
+	return nbytes;
+}
+
+static void vidtv_mux_clear(struct vidtv_mux *m)
+{
+	/* clear the packets currently in the mux */
+	memset(m->mux_buf, 0, m->mux_buf_sz * sizeof(*m->mux_buf));
+	/* point to the beginning of the buffer again */
+	m->mux_buf_offset = 0;
+}
+
+static void vidtv_mux_tick(struct work_struct *work)
+{
+	struct vidtv_mux *m = container_of(work,
+					   struct vidtv_mux,
+					   mpeg_thread);
+	u32 nbytes;
+	u32 npkts;
+
+	while (m->streaming) {
+		nbytes = 0;
+
+		vidtv_mux_update_clk(m);
+
+		if (vidtv_mux_should_push_pcr(m))
+			nbytes += vidtv_mux_push_pcr(m);
+
+		if (vidtv_mux_should_push_si(m))
+			nbytes += vidtv_mux_push_si(m);
+
+		nbytes += vidtv_mux_poll_encoders(m);
+		nbytes += vidtv_mux_check_mux_rate(m);
+
+		npkts = nbytes / TS_PACKET_LEN;
+
+		/* if the buffer is not aligned there is a bug somewhere */
+		if (nbytes % TS_PACKET_LEN)
+			pr_err_ratelimited("Misaligned buffer\n");
+
+		if (m->on_new_packets_available_cb)
+			m->on_new_packets_available_cb(m->priv,
+						       m->mux_buf,
+						       npkts);
+
+		vidtv_mux_clear(m);
+
+		usleep_range(VIDTV_SLEEP_USECS, VIDTV_MAX_SLEEP_USECS);
+	}
+}
+
+void vidtv_mux_start_thread(struct vidtv_mux *m)
+{
+	if (m->streaming) {
+		pr_warn_ratelimited("Already streaming. Skipping.\n");
+		return;
+	}
+
+	m->streaming = true;
+	m->timing.start_jiffies = get_jiffies_64();
+	schedule_work(&m->mpeg_thread);
+}
+
+void vidtv_mux_stop_thread(struct vidtv_mux *m)
+{
+	if (m->streaming) {
+		m->streaming = false; /* thread will quit */
+		cancel_work_sync(&m->mpeg_thread);
+	}
+}
+
+struct vidtv_mux *vidtv_mux_init(struct vidtv_mux_init_args args)
+{
+	struct vidtv_mux *m = kzalloc(sizeof(*m), GFP_KERNEL);
+
+	m->timing.pcr_period_usecs = args.pcr_period_usecs;
+	m->timing.si_period_usecs  = args.si_period_usecs;
+
+	m->mux_rate_kbytes_sec = args.mux_rate_kbytes_sec;
+
+	m->on_new_packets_available_cb = args.on_new_packets_available_cb;
+
+	m->mux_buf    = vzalloc(args.mux_buf_sz);
+	m->mux_buf_sz = args.mux_buf_sz;
+
+	m->pcr_pid = args.pcr_pid;
+	m->transport_stream_id = args.transport_stream_id;
+	m->priv    = args.priv;
+
+	if (args.channels)
+		m->channels = args.channels;
+	else
+		vidtv_channels_init(m);
+
+	/* will alloc data for pmt_sections after initializing pat */
+	vidtv_channel_si_init(m);
+
+	INIT_WORK(&m->mpeg_thread, vidtv_mux_tick);
+
+	vidtv_mux_pid_ctx_init(m);
+	vidtv_channels_add_registration_descs(m);
+
+	return m;
+}
+
+void vidtv_mux_destroy(struct vidtv_mux *m)
+{
+	vidtv_mux_stop_thread(m);
+	vidtv_mux_pid_ctx_destroy(m);
+	vidtv_channel_si_destroy(m);
+	vidtv_channels_destroy(m);
+	vfree(m->mux_buf);
+	kfree(m);
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
new file mode 100644
index 000000000000..8622a62cd9bc
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the muxer logic for TS packets from different
+ * elementary streams.
+ *
+ * Loosely based on libavcodec/mpegtsenc.c
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_MUX_H
+#define VIDTV_MUX_H
+
+#include <linux/types.h>
+#include <linux/hashtable.h>
+#include <linux/workqueue.h>
+#include "vidtv_psi.h"
+
+/**
+ * struct vidtv_mux_timing - Timing related information
+ *
+ * This is used to decide when PCR or PSI packets should be sent. This will also
+ * provide storage for the clock, which is used to compute the value for the PCR.
+ *
+ * @start_jiffies: The value of 'jiffies' when we started the mux thread.
+ * @current_jiffies: The value of 'jiffies' for the current iteration.
+ * @past_jiffies: The value of 'jiffies' for the past iteration.
+ * @clk: A 27Mhz clock from which we will drive the PCR. Updated proportionally
+ * on every iteration.
+ * @pcr_period_usecs: How often we should send PCR packets.
+ * @si_period_usecs: How often we should send PSI packets.
+ */
+struct vidtv_mux_timing {
+	u64 start_jiffies;
+	u64 current_jiffies;
+	u64 past_jiffies;
+
+	u64 clk;
+
+	u64 pcr_period_usecs;
+	u64 si_period_usecs;
+};
+
+/**
+ * struct vidtv_mux_si - Store the PSI context.
+ *
+ * This is used to store the PAT, PMT sections and SDT in use by the muxer.
+ *
+ * The muxer acquire these by looking into the hardcoded channels in
+ * vidtv_channel and then periodically sends the TS packets for them>
+ *
+ * @pat: The PAT in use by the muxer.
+ * @pmt_secs: The PMT sections in use by the muxer. One for each program in the PAT.
+ * @sdt: The SDT in use by the muxer.
+ */
+struct vidtv_mux_si {
+	/* the SI tables */
+	struct vidtv_psi_table_pat *pat;
+	struct vidtv_psi_table_pmt **pmt_secs; /* the PMT sections */
+	struct vidtv_psi_table_sdt *sdt;
+};
+
+/**
+ * struct vidtv_mux_pid_ctx - Store the context for a given TS PID.
+ * @pid: The TS PID.
+ * @cc: The continuity counter for this PID. It is incremented on every TS
+ * pack and it will wrap around at 0xf0. If the decoder notices a sudden jump in
+ * this counter this will trigger a discontinuity state.
+ * @h: This is embedded in a hash table, mapping pid -> vidtv_mux_pid_ctx
+ */
+struct vidtv_mux_pid_ctx {
+	u16 pid;
+	u8 cc; /* continuity counter */
+	struct hlist_node h;
+};
+
+/**
+ * struct vidtv_mux - A muxer abstraction loosely based in libavcodec/mpegtsenc.c
+ * @mux_rate_kbytes_sec: The bit rate for the TS, in kbytes.
+ * @timing: Keeps track of timing related information.
+ * @pid_ctx: A hash table to keep track of per-PID metadata.
+ * @on_new_packets_available_cb: A callback to inform of new TS packets ready.
+ * @mux_buf: A pointer to a buffer for this muxer. TS packets are stored there
+ * and then passed on to the bridge driver.
+ * @mux_buf_sz: The size for 'mux_buf'.
+ * @mux_buf_offset: The current offset into 'mux_buf'.
+ * @channels: The channels associated with this muxer.
+ * @si: Keeps track of the PSI context.
+ * @num_streamed_pcr: Number of PCR packets streamed.
+ * @num_streamed_si: The number of PSI packets streamed.
+ * @mpeg_thread: Thread responsible for the muxer loop.
+ * @streaming: whether 'mpeg_thread' is running.
+ * @pcr_pid: The TS PID used for the PSI packets. All channels will share the
+ * same PCR.
+ * @transport_stream_id: The transport stream ID
+ * @priv: Private data.
+ */
+struct vidtv_mux {
+	struct vidtv_mux_timing timing;
+
+	u32 mux_rate_kbytes_sec;
+
+	DECLARE_HASHTABLE(pid_ctx, 3);
+
+	void (*on_new_packets_available_cb)(void *priv, u8 *buf, u32 npackets);
+
+	u8 *mux_buf;
+	u32 mux_buf_sz;
+	u32 mux_buf_offset;
+
+	struct vidtv_channel  *channels;
+
+	struct vidtv_mux_si si;
+	u64 num_streamed_pcr;
+	u64 num_streamed_si;
+
+	struct work_struct mpeg_thread;
+	bool streaming;
+
+	u16 pcr_pid;
+	u16 transport_stream_id;
+	void *priv;
+};
+
+/**
+ * struct vidtv_mux_init_args - Arguments used to inix the muxer.
+ * @mux_rate_kbytes_sec: The bit rate for the TS, in kbytes.
+ * @on_new_packets_available_cb: A callback to inform of new TS packets ready.
+ * @mux_buf_sz: The size for 'mux_buf'.
+ * @pcr_period_usecs: How often we should send PCR packets.
+ * @si_period_usecs: How often we should send PSI packets.
+ * @pcr_pid: The TS PID used for the PSI packets. All channels will share the
+ * same PCR.
+ * @transport_stream_id: The transport stream ID
+ * @channels: an optional list of channels to use
+ * @priv: Private data.
+ */
+struct vidtv_mux_init_args {
+	u32 mux_rate_kbytes_sec;
+	void (*on_new_packets_available_cb)(void *priv, u8 *buf, u32 npackets);
+	u32 mux_buf_sz;
+	u64 pcr_period_usecs;
+	u64 si_period_usecs;
+	u16 pcr_pid;
+	u16 transport_stream_id;
+	struct vidtv_channel *channels;
+	void *priv;
+};
+
+struct vidtv_mux *vidtv_mux_init(struct vidtv_mux_init_args args);
+void vidtv_mux_destroy(struct vidtv_mux *m);
+
+void vidtv_mux_start_thread(struct vidtv_mux *m);
+void vidtv_mux_stop_thread(struct vidtv_mux *m);
+
+#endif //VIDTV_MUX_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
new file mode 100644
index 000000000000..a1693cc0b299
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the logic to translate the ES data for one access unit
+ * from an encoder into MPEG TS packets. It does so by first encapsulating it
+ * with a PES header and then splitting it into TS packets.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#include "vidtv_pes.h"
+#include "vidtv_common.h"
+#include "vidtv_encoder.h"
+#include "vidtv_ts.h"
+
+#define PRIVATE_STREAM_1_ID 0xbd /* private_stream_1. See SMPTE 302M-2007 p.6 */
+#define PES_HEADER_MAX_STUFFING_BYTES 32
+#define PES_TS_HEADER_MAX_STUFFING_BYTES 182
+
+static u32 vidtv_pes_op_get_len(bool send_pts, bool send_dts)
+{
+	u32 len = 0;
+
+	/* the flags must always be sent */
+	len += sizeof(struct vidtv_pes_optional);
+
+	/* From all optionals, we might send these for now */
+	if (send_pts && send_dts)
+		len += sizeof(struct vidtv_pes_optional_pts_dts);
+	else if (send_pts)
+		len += sizeof(struct vidtv_pes_optional_pts);
+
+	return len;
+}
+
+static u32 vidtv_pes_h_get_len(bool send_pts, bool send_dts)
+{
+	/* PES header length notwithstanding stuffing bytes */
+	u32 len = 0;
+
+	len += sizeof(struct vidtv_mpeg_pes);
+	len += vidtv_pes_op_get_len(send_pts, send_dts);
+
+	return len;
+}
+
+static u32 vidtv_pes_write_header_stuffing(struct pes_header_write_args args)
+{
+	/*
+	 * This is a fixed 8-bit value equal to '0xFF' that can be inserted
+	 * by the encoder, for example to meet the requirements of the channel.
+	 * It is discarded by the decoder. No more than 32 stuffing bytes shall
+	 * be present in one PES packet header.
+	 */
+	if (args.n_pes_h_s_bytes > PES_HEADER_MAX_STUFFING_BYTES) {
+		pr_warn_ratelimited("More than %d stuffing bytes in PES packet header\n",
+				    PES_HEADER_MAX_STUFFING_BYTES);
+		args.n_pes_h_s_bytes = PES_HEADER_MAX_STUFFING_BYTES;
+	}
+
+	return vidtv_memset(args.dest_buf,
+			    args.dest_offset,
+			    args.dest_buf_sz,
+			    TS_FILL_BYTE,
+			    args.n_pes_h_s_bytes);
+}
+
+static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
+{
+	u32 nbytes = 0;  /* the number of bytes written by this function */
+
+	struct vidtv_pes_optional_pts pts = {};
+	struct vidtv_pes_optional_pts_dts pts_dts = {};
+	void *op = NULL;
+	size_t op_sz = 0;
+	u64 mask1;
+	u64 mask2;
+	u64 mask3;
+
+	if (!args.send_pts && args.send_dts)
+		return 0;
+
+	#ifdef BIG_ENDIAN
+	mask1 = GENMASK(30, 32);
+	mask2 = GENMASK(15, 29);
+	mask3 = GENMASK(0, 14);
+	#else
+	mask1 = GENMASK(32, 30);
+	mask2 = GENMASK(29, 15);
+	mask3 = GENMASK(14, 0);
+	#endif
+
+	/* see ISO/IEC 13818-1 : 2000 p. 32 */
+	if (args.send_pts && args.send_dts) {
+		pts_dts.pts1 = (0x3 << 4) | ((args.pts & mask1) >> 29) | 0x1;
+		pts_dts.pts2 = cpu_to_be16(((args.pts & mask2) >> 14) | 0x1);
+		pts_dts.pts3 = cpu_to_be16(((args.pts & mask3) << 1) | 0x1);
+
+		pts_dts.dts1 = (0x1 << 4) | ((args.dts & mask1) >> 29) | 0x1;
+		pts_dts.dts2 = cpu_to_be16(((args.dts & mask2) >> 14) | 0x1);
+		pts_dts.dts3 = cpu_to_be16(((args.dts & mask3) << 1) | 0x1);
+
+		op = &pts_dts;
+		op_sz = sizeof(pts_dts);
+
+	} else if (args.send_pts) {
+		pts.pts1 = (0x1 << 5) | ((args.pts & mask1) >> 29) | 0x1;
+		pts.pts2 = cpu_to_be16(((args.pts & mask2) >> 14) | 0x1);
+		pts.pts3 = cpu_to_be16(((args.pts & mask3) << 1) | 0x1);
+
+		op = &pts;
+		op_sz = sizeof(pts);
+	}
+
+	/* copy PTS/DTS optional */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       op,
+			       op_sz);
+
+	return nbytes;
+}
+
+static u32 vidtv_pes_write_h(struct pes_header_write_args args)
+{
+	u32 nbytes = 0;  /* the number of bytes written by this function */
+
+	struct vidtv_mpeg_pes pes_header          = {};
+	struct vidtv_pes_optional pes_optional    = {};
+	struct pes_header_write_args pts_dts_args = args;
+	u32 stream_id = (args.encoder_id == S302M) ? PRIVATE_STREAM_1_ID : args.stream_id;
+	u16 pes_opt_bitfield = 0x2 << 13;
+
+	pes_header.bitfield = cpu_to_be32((PES_START_CODE_PREFIX << 8) | stream_id);
+
+	pes_header.length = cpu_to_be16(vidtv_pes_op_get_len(args.send_pts,
+							     args.send_dts) +
+							     args.access_unit_len);
+
+	if (args.send_pts && args.send_dts)
+		pes_opt_bitfield |= (0x3 << 6);
+	else if (args.send_pts)
+		pes_opt_bitfield |= (0x1 << 7);
+
+	pes_optional.bitfield = cpu_to_be16(pes_opt_bitfield);
+	pes_optional.length = vidtv_pes_op_get_len(args.send_pts, args.send_dts) +
+			      args.n_pes_h_s_bytes;
+
+	/* copy header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       &pes_header,
+			       sizeof(pes_header));
+
+	/* copy optional header bits */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       &pes_optional,
+			       sizeof(pes_optional));
+
+	/* copy the timing information */
+	pts_dts_args.dest_offset = args.dest_offset + nbytes;
+	nbytes += vidtv_pes_write_pts_dts(pts_dts_args);
+
+	/* write any PES header stuffing */
+	nbytes += vidtv_pes_write_header_stuffing(args);
+
+	return nbytes;
+}
+
+static u32 vidtv_pes_write_stuffing(void *dest_buf,
+				    u32 dest_offset,
+				    u32 n_stuffing_bytes,
+				    u32 buf_sz)
+{
+	u32 nbytes = 0;
+	struct vidtv_mpeg_ts_adaption ts_adap = {};
+	u32 stuff_nbytes = 0;
+
+	if (!n_stuffing_bytes)
+		goto out;
+
+	if (n_stuffing_bytes > PES_TS_HEADER_MAX_STUFFING_BYTES) {
+		pr_warn_ratelimited("More than %d stuffing bytes for a PES packet!\n",
+				    PES_TS_HEADER_MAX_STUFFING_BYTES);
+
+		n_stuffing_bytes = PES_TS_HEADER_MAX_STUFFING_BYTES;
+	}
+
+	/* the AF will only be its 'length' field with a value of zero */
+	if (n_stuffing_bytes == 1) {
+		nbytes += vidtv_memset(dest_buf,
+				       dest_offset + nbytes,
+				       buf_sz,
+				       0,
+				       n_stuffing_bytes);
+
+		goto out;
+	}
+
+	stuff_nbytes = n_stuffing_bytes - sizeof(ts_adap);
+
+	/* length _immediately_ following 'adaptation_field_length' */
+	ts_adap.length = sizeof(ts_adap) -
+			 sizeof(ts_adap.length) +
+			 stuff_nbytes;
+
+	/* write the adap after the TS header */
+	nbytes += vidtv_memcpy(dest_buf,
+			       dest_offset + nbytes,
+			       buf_sz,
+			       &ts_adap,
+			       sizeof(ts_adap));
+
+	/* write the stuffing bytes */
+	nbytes += vidtv_memset(dest_buf,
+			       dest_offset + nbytes,
+			       buf_sz,
+			       TS_FILL_BYTE,
+			       stuff_nbytes);
+
+out:
+	if (nbytes != n_stuffing_bytes)
+		pr_warn_ratelimited("write size was %d, expected %d\n",
+				    nbytes,
+				    n_stuffing_bytes);
+
+	return nbytes;
+}
+
+static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args)
+{
+	/* number of bytes written by this function */
+	u32 nbytes = 0;
+	struct vidtv_mpeg_ts ts_header = {};
+	u16 payload_start = !args.wrote_pes_header;
+
+	ts_header.sync_byte        = TS_SYNC_BYTE;
+	ts_header.bitfield         = cpu_to_be16((payload_start << 14) | args.pid);
+	ts_header.scrambling       = 0;
+	ts_header.adaptation_field = (args.n_stuffing_bytes) > 0;
+	ts_header.payload          = (args.n_stuffing_bytes) < PES_TS_HEADER_MAX_STUFFING_BYTES;
+
+	ts_header.continuity_counter = *args.continuity_counter;
+
+	vidtv_ts_inc_cc(args.continuity_counter);
+
+	/* write the TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	/* write stuffing, if any */
+	nbytes += vidtv_pes_write_stuffing(args.dest_buf,
+					   args.dest_offset + nbytes,
+					   args.n_stuffing_bytes,
+					   args.dest_buf_sz);
+
+	return nbytes;
+}
+
+u32 vidtv_pes_write_into(struct pes_write_args args)
+{
+	u32 nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
+	bool aligned = (nbytes_past_boundary == 0);
+
+	struct pes_ts_header_write_args ts_header_args = {};
+	struct pes_header_write_args pes_header_args   = {};
+
+	/* number of bytes written by this function */
+	u32 nbytes        = 0;
+	u32 remaining_len = args.access_unit_len;
+
+	bool wrote_pes_header = false;
+
+	/* whether we need to stuff the TS packet to align the buffer */
+	bool should_insert_stuffing_bytes = false;
+
+	u32 available_space    = 0;
+	u32 payload_write_len  = 0;
+	u32 num_stuffing_bytes = 0;
+
+	if (!aligned) {
+		pr_warn_ratelimited("Cannot start a PES packet in a misaligned buffer\n");
+
+		/* forcibly align and hope for the best */
+		nbytes += vidtv_memset(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       TS_FILL_BYTE,
+				       TS_PACKET_LEN - nbytes_past_boundary);
+
+		aligned = true;
+	}
+
+	if (args.send_dts && !args.send_pts) {
+		pr_warn_ratelimited("forbidden value '01' for PTS_DTS flags\n");
+		args.send_pts = true;
+		args.pts      = args.dts;
+	}
+
+	/* see SMPTE 302M clause 6.4 */
+	if (args.encoder_id == S302M) {
+		args.send_dts = false;
+		args.send_pts = true;
+	}
+
+	while (remaining_len) {
+		/*
+		 * The amount of space initially available in the TS packet.
+		 * if this is the beginning of the PES packet, take into account
+		 * the space needed for the TS header _and_ for the PES header
+		 */
+		available_space = (!wrote_pes_header) ?
+				  TS_PAYLOAD_LEN -
+				  vidtv_pes_h_get_len(args.send_pts, args.send_dts) :
+				  TS_PAYLOAD_LEN;
+
+		/* if the encoder has inserted stuffing bytes in the PES
+		 * header, account for them.
+		 */
+		available_space -= args.n_pes_h_s_bytes;
+
+		/* whether stuffing bytes are needed to align the buffer */
+		should_insert_stuffing_bytes = remaining_len < available_space;
+
+		/*
+		 * how much of the _actual_ payload should be written in this
+		 * packet.
+		 */
+		payload_write_len = (should_insert_stuffing_bytes) ?
+				    remaining_len :
+				    available_space;
+
+		num_stuffing_bytes = available_space - payload_write_len;
+
+		/* write ts header */
+		ts_header_args.dest_buf           = args.dest_buf;
+		ts_header_args.dest_offset        = args.dest_offset + nbytes;
+		ts_header_args.dest_buf_sz        = args.dest_buf_sz;
+		ts_header_args.pid                = args.pid;
+		ts_header_args.continuity_counter = args.continuity_counter;
+		ts_header_args.wrote_pes_header   = wrote_pes_header;
+		ts_header_args.n_stuffing_bytes   = num_stuffing_bytes;
+
+		nbytes += vidtv_pes_write_ts_h(ts_header_args);
+
+		if (!wrote_pes_header) {
+			/* write the PES header only once */
+			pes_header_args.dest_buf        = args.dest_buf;
+
+			pes_header_args.dest_offset     = args.dest_offset +
+							  nbytes;
+
+			pes_header_args.dest_buf_sz     = args.dest_buf_sz;
+			pes_header_args.encoder_id      = args.encoder_id;
+			pes_header_args.send_pts        = args.send_pts;
+			pes_header_args.pts             = args.pts;
+			pes_header_args.send_dts        = args.send_dts;
+			pes_header_args.dts             = args.dts;
+			pes_header_args.stream_id       = args.stream_id;
+			pes_header_args.n_pes_h_s_bytes = args.n_pes_h_s_bytes;
+			pes_header_args.access_unit_len = args.access_unit_len;
+
+			nbytes           += vidtv_pes_write_h(pes_header_args);
+			wrote_pes_header  = true;
+		}
+
+		/* write as much of the payload as we possibly can */
+		nbytes += vidtv_memcpy(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       args.from,
+				       payload_write_len);
+
+		args.from += payload_write_len;
+
+		remaining_len -= payload_write_len;
+	}
+
+	return nbytes;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.h b/drivers/media/test-drivers/vidtv/vidtv_pes.h
new file mode 100644
index 000000000000..36443a6e30d3
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.h
@@ -0,0 +1,189 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the logic to translate the ES data for one access unit
+ * from an encoder into MPEG TS packets. It does so by first encapsulating it
+ * with a PES header and then splitting it into TS packets.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_PES_H
+#define VIDTV_PES_H
+
+#include <asm/byteorder.h>
+#include <linux/types.h>
+
+#include "vidtv_common.h"
+
+#define PES_MAX_LEN 65536 /* Set 'length' to 0 if greater. Only possible for video. */
+#define PES_START_CODE_PREFIX 0x001 /* 00 00 01 */
+
+/* Used when sending PTS, but not DTS */
+struct vidtv_pes_optional_pts {
+	u8 pts1;
+	__be16 pts2;
+	__be16 pts3;
+} __packed;
+
+/* Used when sending both PTS and DTS */
+struct vidtv_pes_optional_pts_dts {
+	u8 pts1;
+	__be16 pts2;
+	__be16 pts3;
+
+	u8 dts1;
+	__be16 dts2;
+	__be16 dts3;
+} __packed;
+
+/* PES optional flags */
+struct vidtv_pes_optional {
+	/*
+	 * These flags show which components are actually
+	 * present in the "optinal fields" in the optinal PES
+	 * header and which are not
+	 *
+	 * u16 two:2;  //0x2
+	 * u16 PES_scrambling_control:2;
+	 * u16 PES_priority:1;
+	 * u16 data_alignment_indicator:1; // unused
+	 * u16 copyright:1;
+	 * u16 original_or_copy:1;
+	 * u16 PTS_DTS:2;
+	 * u16 ESCR:1;
+	 * u16 ES_rate:1;
+	 * u16 DSM_trick_mode:1;
+	 * u16 additional_copy_info:1;
+	 * u16 PES_CRC:1;
+	 * u16 PES_extension:1;
+	 */
+	__be16 bitfield;
+	u8 length;
+} __packed;
+
+/* The PES header */
+struct vidtv_mpeg_pes {
+	__be32 bitfield; /* packet_start_code_prefix:24, stream_id: 8 */
+	/* after this field until the end of the PES data payload */
+	__be16 length;
+	struct vidtv_pes_optional optional[];
+} __packed;
+
+/**
+ * struct pes_header_write_args - Arguments to write a PES header.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @dest_buf_sz: The size of the dest_buffer
+ * @encoder_id: Encoder id (see vidtv_encoder.h)
+ * @send_pts: Should we send PTS?
+ * @pts: PTS value to send.
+ * @send_dts: Should we send DTS?
+ * @dts: DTS value to send.
+ * @stream_id: The stream id to use. Ex: Audio streams (0xc0-0xdf), Video
+ * streams (0xe0-0xef).
+ * @n_pes_h_s_bytes: Padding bytes. Might be used by an encoder if needed, gets
+ * discarded by the decoder.
+ * @access_unit_len: The size of _one_ access unit (with any headers it might need)
+ */
+struct pes_header_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 dest_buf_sz;
+	u32 encoder_id;
+
+	bool send_pts;
+	u64 pts;
+
+	bool send_dts;
+	u64 dts;
+
+	u16 stream_id;
+	/* might be used by an encoder if needed, gets discarded by decoder */
+	u32 n_pes_h_s_bytes;
+	u32 access_unit_len;
+};
+
+/**
+ * struct pes_ts_header_write_args - Arguments to write a TS header.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @dest_buf_sz: The size of the dest_buffer
+ * @pid: The PID to use for the TS packets.
+ * @continuity_counter: Incremented on every new TS packet.
+ * @n_pes_h_s_bytes: Padding bytes. Might be used by an encoder if needed, gets
+ * discarded by the decoder.
+ */
+struct pes_ts_header_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 dest_buf_sz;
+	u16 pid;
+	u8 *continuity_counter;
+	bool wrote_pes_header;
+	u32 n_stuffing_bytes;
+};
+
+/**
+ * struct pes_write_args - Arguments for the packetizer.
+ * @dest_buf: The buffer to write into.
+ * @from: A pointer to the encoder buffer containing one access unit.
+ * @access_unit_len: The size of _one_ access unit (with any headers it might need)
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @dest_buf_sz: The size of the dest_buffer
+ * @pid: The PID to use for the TS packets.
+ * @encoder_id: Encoder id (see vidtv_encoder.h)
+ * @continuity_counter: Incremented on every new TS packet.
+ * @stream_id: The stream id to use. Ex: Audio streams (0xc0-0xdf), Video
+ * streams (0xe0-0xef).
+ * @send_pts: Should we send PTS?
+ * @pts: PTS value to send.
+ * @send_dts: Should we send DTS?
+ * @dts: DTS value to send.
+ * @n_pes_h_s_bytes: Padding bytes. Might be used by an encoder if needed, gets
+ * discarded by the decoder.
+ */
+struct pes_write_args {
+	void *dest_buf;
+	void *from;
+	u32 access_unit_len;
+
+	u32 dest_offset;
+	u32 dest_buf_sz;
+	u16 pid;
+
+	u32 encoder_id;
+
+	u8 *continuity_counter;
+
+	u16 stream_id;
+
+	bool send_pts;
+	u64 pts;
+
+	bool send_dts;
+	u64 dts;
+
+	u32 n_pes_h_s_bytes;
+};
+
+/**
+ * vidtv_pes_write_into - Write a PES packet as MPEG-TS packets into a buffer.
+ * @args: The args to use when writing
+ *
+ * This function translate the ES data for one access unit
+ * from an encoder into MPEG TS packets. It does so by first encapsulating it
+ * with a PES header and then splitting it into TS packets.
+ *
+ * The data is then written into the buffer pointed to by 'args.buf'
+ *
+ * Return: The number of bytes written into the buffer. This is usually NOT
+ * equal to the size of the access unit, since we need space for PES headers, TS headers
+ * and padding bytes, if any.
+ */
+u32 vidtv_pes_write_into(struct pes_write_args args);
+
+#endif // VIDTV_PES_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
new file mode 100644
index 000000000000..74e64f1ac8cb
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -0,0 +1,1350 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file contains the logic to work with MPEG Program-Specific Information.
+ * These are defined both in ISO/IEC 13818-1 (systems) and ETSI EN 300 468.
+ * PSI is carried in the form of table structures, and although each table might
+ * technically be broken into one or more sections, we do not do this here,
+ * hence 'table' and 'section' are interchangeable for vidtv.
+ *
+ * This code currently supports three tables: PAT, PMT and SDT. These are the
+ * bare minimum to get userspace to recognize our MPEG transport stream. It can
+ * be extended to support more PSI tables in the future.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/string.h>
+
+#include "vidtv_psi.h"
+#include "vidtv_common.h"
+#include "vidtv_ts.h"
+
+#define CRC_SIZE_IN_BYTES 4
+#define MAX_VERSION_NUM 32
+
+static const u32 CRC_LUT[256] = {
+	/* from libdvbv5 */
+	0x00000000, 0x04c11db7, 0x09823b6e, 0x0d4326d9, 0x130476dc, 0x17c56b6b,
+	0x1a864db2, 0x1e475005, 0x2608edb8, 0x22c9f00f, 0x2f8ad6d6, 0x2b4bcb61,
+	0x350c9b64, 0x31cd86d3, 0x3c8ea00a, 0x384fbdbd, 0x4c11db70, 0x48d0c6c7,
+	0x4593e01e, 0x4152fda9, 0x5f15adac, 0x5bd4b01b, 0x569796c2, 0x52568b75,
+	0x6a1936c8, 0x6ed82b7f, 0x639b0da6, 0x675a1011, 0x791d4014, 0x7ddc5da3,
+	0x709f7b7a, 0x745e66cd, 0x9823b6e0, 0x9ce2ab57, 0x91a18d8e, 0x95609039,
+	0x8b27c03c, 0x8fe6dd8b, 0x82a5fb52, 0x8664e6e5, 0xbe2b5b58, 0xbaea46ef,
+	0xb7a96036, 0xb3687d81, 0xad2f2d84, 0xa9ee3033, 0xa4ad16ea, 0xa06c0b5d,
+	0xd4326d90, 0xd0f37027, 0xddb056fe, 0xd9714b49, 0xc7361b4c, 0xc3f706fb,
+	0xceb42022, 0xca753d95, 0xf23a8028, 0xf6fb9d9f, 0xfbb8bb46, 0xff79a6f1,
+	0xe13ef6f4, 0xe5ffeb43, 0xe8bccd9a, 0xec7dd02d, 0x34867077, 0x30476dc0,
+	0x3d044b19, 0x39c556ae, 0x278206ab, 0x23431b1c, 0x2e003dc5, 0x2ac12072,
+	0x128e9dcf, 0x164f8078, 0x1b0ca6a1, 0x1fcdbb16, 0x018aeb13, 0x054bf6a4,
+	0x0808d07d, 0x0cc9cdca, 0x7897ab07, 0x7c56b6b0, 0x71159069, 0x75d48dde,
+	0x6b93dddb, 0x6f52c06c, 0x6211e6b5, 0x66d0fb02, 0x5e9f46bf, 0x5a5e5b08,
+	0x571d7dd1, 0x53dc6066, 0x4d9b3063, 0x495a2dd4, 0x44190b0d, 0x40d816ba,
+	0xaca5c697, 0xa864db20, 0xa527fdf9, 0xa1e6e04e, 0xbfa1b04b, 0xbb60adfc,
+	0xb6238b25, 0xb2e29692, 0x8aad2b2f, 0x8e6c3698, 0x832f1041, 0x87ee0df6,
+	0x99a95df3, 0x9d684044, 0x902b669d, 0x94ea7b2a, 0xe0b41de7, 0xe4750050,
+	0xe9362689, 0xedf73b3e, 0xf3b06b3b, 0xf771768c, 0xfa325055, 0xfef34de2,
+	0xc6bcf05f, 0xc27dede8, 0xcf3ecb31, 0xcbffd686, 0xd5b88683, 0xd1799b34,
+	0xdc3abded, 0xd8fba05a, 0x690ce0ee, 0x6dcdfd59, 0x608edb80, 0x644fc637,
+	0x7a089632, 0x7ec98b85, 0x738aad5c, 0x774bb0eb, 0x4f040d56, 0x4bc510e1,
+	0x46863638, 0x42472b8f, 0x5c007b8a, 0x58c1663d, 0x558240e4, 0x51435d53,
+	0x251d3b9e, 0x21dc2629, 0x2c9f00f0, 0x285e1d47, 0x36194d42, 0x32d850f5,
+	0x3f9b762c, 0x3b5a6b9b, 0x0315d626, 0x07d4cb91, 0x0a97ed48, 0x0e56f0ff,
+	0x1011a0fa, 0x14d0bd4d, 0x19939b94, 0x1d528623, 0xf12f560e, 0xf5ee4bb9,
+	0xf8ad6d60, 0xfc6c70d7, 0xe22b20d2, 0xe6ea3d65, 0xeba91bbc, 0xef68060b,
+	0xd727bbb6, 0xd3e6a601, 0xdea580d8, 0xda649d6f, 0xc423cd6a, 0xc0e2d0dd,
+	0xcda1f604, 0xc960ebb3, 0xbd3e8d7e, 0xb9ff90c9, 0xb4bcb610, 0xb07daba7,
+	0xae3afba2, 0xaafbe615, 0xa7b8c0cc, 0xa379dd7b, 0x9b3660c6, 0x9ff77d71,
+	0x92b45ba8, 0x9675461f, 0x8832161a, 0x8cf30bad, 0x81b02d74, 0x857130c3,
+	0x5d8a9099, 0x594b8d2e, 0x5408abf7, 0x50c9b640, 0x4e8ee645, 0x4a4ffbf2,
+	0x470cdd2b, 0x43cdc09c, 0x7b827d21, 0x7f436096, 0x7200464f, 0x76c15bf8,
+	0x68860bfd, 0x6c47164a, 0x61043093, 0x65c52d24, 0x119b4be9, 0x155a565e,
+	0x18197087, 0x1cd86d30, 0x029f3d35, 0x065e2082, 0x0b1d065b, 0x0fdc1bec,
+	0x3793a651, 0x3352bbe6, 0x3e119d3f, 0x3ad08088, 0x2497d08d, 0x2056cd3a,
+	0x2d15ebe3, 0x29d4f654, 0xc5a92679, 0xc1683bce, 0xcc2b1d17, 0xc8ea00a0,
+	0xd6ad50a5, 0xd26c4d12, 0xdf2f6bcb, 0xdbee767c, 0xe3a1cbc1, 0xe760d676,
+	0xea23f0af, 0xeee2ed18, 0xf0a5bd1d, 0xf464a0aa, 0xf9278673, 0xfde69bc4,
+	0x89b8fd09, 0x8d79e0be, 0x803ac667, 0x84fbdbd0, 0x9abc8bd5, 0x9e7d9662,
+	0x933eb0bb, 0x97ffad0c, 0xafb010b1, 0xab710d06, 0xa6322bdf, 0xa2f33668,
+	0xbcb4666d, 0xb8757bda, 0xb5365d03, 0xb1f740b4
+};
+
+static inline u32 dvb_crc32(u32 crc, u8 *data, u32 len)
+{
+	/* from libdvbv5 */
+	while (len--)
+		crc = (crc << 8) ^ CRC_LUT[((crc >> 24) ^ *data++) & 0xff];
+	return crc;
+}
+
+static void vidtv_psi_update_version_num(struct vidtv_psi_table_header *h)
+{
+	++h->version;
+	if (h->version > MAX_VERSION_NUM)
+		h->version = 0;
+}
+
+static inline u16 vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sdt_service *s)
+{
+	u16 mask;
+	u16 ret;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(0, 11);
+	#else
+	mask = GENMASK(11, 0);
+	#endif
+
+	ret = be16_to_cpu(s->bitfield) & mask;
+	return ret;
+}
+
+static inline u16 vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_pmt_stream *s)
+{
+	u16 mask;
+	u16 ret;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(0, 9);
+	#else
+	mask = GENMASK(9, 0);
+	#endif
+
+	ret = be16_to_cpu(s->bitfield2) & mask;
+	return ret;
+}
+
+static inline u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
+{
+	u16 mask;
+	u16 ret;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(0, 9);
+	#else
+	mask = GENMASK(9, 0);
+	#endif
+
+	ret = be16_to_cpu(p->bitfield2) & mask;
+	return ret;
+}
+
+static inline u16 vidtv_psi_get_sec_len(struct vidtv_psi_table_header *h)
+{
+	u16 mask;
+	u16 ret;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(0, 11);
+	#else
+	mask = GENMASK(11, 0);
+	#endif
+
+	ret = be16_to_cpu(h->bitfield) & mask;
+	return ret;
+}
+
+inline u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p)
+{
+	u16 mask;
+	u16 ret;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(0, 12);
+	#else
+	mask = GENMASK(12, 0);
+	#endif
+
+	ret = be16_to_cpu(p->bitfield) & mask;
+	return ret;
+}
+
+inline u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *s)
+{
+	u16 mask;
+	u16 ret;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(0, 12);
+	#else
+	mask = GENMASK(12, 0);
+	#endif
+
+	ret = be16_to_cpu(s->bitfield) & mask;
+	return ret;
+}
+
+static inline void vidtv_psi_set_desc_loop_len(__be16 *bitfield, u16 new_len, u8 desc_len_nbits)
+{
+	u16 mask;
+	__be16 new;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(desc_len_nbits, 15);
+	#else
+	mask = GENMASK(15, desc_len_nbits);
+	#endif
+
+	new = cpu_to_be16((be16_to_cpu(*bitfield) & mask) | new_len);
+	*bitfield = new;
+}
+
+static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
+{
+	u16 old_len = vidtv_psi_get_sec_len(h);
+	__be16 new;
+	u16 mask;
+
+	#if defined(BIG_ENDIAN)
+	mask = GENMASK(13, 15);
+	#else
+	mask = GENMASK(15, 13);
+	#endif
+
+	new = cpu_to_be16((be16_to_cpu(h->bitfield) & mask) | new_len);
+
+	if (old_len > MAX_SECTION_LEN)
+		pr_warn_ratelimited("section length: %d > %d, old len was %d\n",
+				    new_len,
+				    MAX_SECTION_LEN,
+				    old_len);
+
+	h->bitfield = new;
+}
+
+static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args args)
+{
+	/*
+	 * Packetize PSI sections into TS packets:
+	 * push a TS header (4bytes) every 184 bytes
+	 * manage the continuity_counter
+	 * add stuffing (i.e. padding bytes) after the CRC
+	 */
+
+	u32 nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
+	bool aligned = (nbytes_past_boundary == 0);
+	struct vidtv_mpeg_ts ts_header = {};
+
+	/* number of bytes written by this function */
+	u32 nbytes = 0;
+	/* how much there is left to write */
+	u32 remaining_len = args.len;
+	/* how much we can be written in this packet */
+	u32 payload_write_len = 0;
+	/* where we are in the source */
+	u32 payload_offset = 0;
+
+	const u16 PAYLOAD_START = args.new_psi_section;
+
+	if (!args.crc && !args.is_crc)
+		pr_warn_ratelimited("Missing CRC for chunk\n");
+
+	if (args.crc)
+		*args.crc = dvb_crc32(*args.crc, args.from, args.len);
+
+	if (args.new_psi_section && !aligned) {
+		pr_warn_ratelimited("Cannot write a new PSI section in a misaligned buffer\n");
+
+		/* forcibly align and hope for the best */
+		nbytes += vidtv_memset(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       TS_FILL_BYTE,
+				       TS_PACKET_LEN - nbytes_past_boundary);
+	}
+
+	while (remaining_len) {
+		nbytes_past_boundary = (args.dest_offset + nbytes) % TS_PACKET_LEN;
+		aligned = (nbytes_past_boundary == 0);
+
+		if (aligned) {
+			/* if at a packet boundary, write a new TS header */
+			ts_header.sync_byte = TS_SYNC_BYTE;
+			ts_header.bitfield = cpu_to_be16((PAYLOAD_START << 14) | args.pid);
+			ts_header.scrambling = 0;
+			ts_header.continuity_counter = *args.continuity_counter;
+			ts_header.payload = 1;
+			/* no adaptation field */
+			ts_header.adaptation_field = 0;
+
+			/* copy the header */
+			nbytes += vidtv_memcpy(args.dest_buf,
+					       args.dest_offset + nbytes,
+					       args.dest_buf_sz,
+					       &ts_header,
+					       sizeof(ts_header));
+			/*
+			 * This will trigger a discontinuity if the buffer is full,
+			 * effectively dropping the packet.
+			 */
+			vidtv_ts_inc_cc(args.continuity_counter);
+		}
+
+		/* write the pointer_field in the first byte of the payload */
+		if (args.new_psi_section)
+			nbytes += vidtv_memset(args.dest_buf,
+					       args.dest_offset + nbytes,
+					       args.dest_buf_sz,
+					       0x0,
+					       1);
+
+		/* write as much of the payload as possible */
+		nbytes_past_boundary = (args.dest_offset + nbytes) % TS_PACKET_LEN;
+		payload_write_len = min(TS_PACKET_LEN - nbytes_past_boundary, remaining_len);
+
+		nbytes += vidtv_memcpy(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       args.from + payload_offset,
+				       payload_write_len);
+
+		/* 'payload_write_len' written from a total of 'len' requested*/
+		remaining_len -= payload_write_len;
+		payload_offset += payload_write_len;
+	}
+
+	/*
+	 * fill the rest of the packet if there is any remaining space unused
+	 */
+
+	nbytes_past_boundary = (args.dest_offset + nbytes) % TS_PACKET_LEN;
+
+	if (args.is_crc)
+		nbytes += vidtv_memset(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       TS_FILL_BYTE,
+				       TS_PACKET_LEN - nbytes_past_boundary);
+
+	return nbytes;
+}
+
+static u32 table_section_crc32_write_into(struct crc32_write_args args)
+{
+	/* the CRC is the last entry in the section */
+	u32 nbytes = 0;
+	struct psi_write_args psi_args = {};
+
+	psi_args.dest_buf           = args.dest_buf;
+	psi_args.from               = &args.crc;
+	psi_args.len                = CRC_SIZE_IN_BYTES;
+	psi_args.dest_offset        = args.dest_offset;
+	psi_args.pid                = args.pid;
+	psi_args.new_psi_section    = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = true;
+	psi_args.dest_buf_sz        = args.dest_buf_sz;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc *head,
+							   enum service_type service_type,
+							   char *service_name,
+							   char *provider_name)
+{
+	struct vidtv_psi_desc_service *desc;
+	u32 service_name_len = service_name ? strlen(service_name) : 0;
+	u32 provider_name_len = provider_name ? strlen(provider_name) : 0;
+
+	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+
+	desc->type = SERVICE_DESCRIPTOR;
+
+	desc->length = sizeof_field(struct vidtv_psi_desc_service, service_type)
+		       + sizeof_field(struct vidtv_psi_desc_service, provider_name_len)
+		       + provider_name_len
+		       + sizeof_field(struct vidtv_psi_desc_service, service_name_len)
+		       + service_name_len;
+
+	desc->service_type = service_type;
+
+	desc->service_name_len = service_name_len;
+
+	if (service_name && service_name_len)
+		desc->service_name = kstrdup(service_name, GFP_KERNEL);
+
+	desc->provider_name_len = provider_name_len;
+
+	if (provider_name && provider_name_len)
+		desc->provider_name = kstrdup(provider_name, GFP_KERNEL);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = (struct vidtv_psi_desc *)desc;
+	}
+	return desc;
+}
+
+struct vidtv_psi_desc_registration
+*vidtv_psi_registration_desc_init(struct vidtv_psi_desc *head,
+				  __be32 format_id,
+				  u8 *additional_ident_info,
+				  u32 additional_info_len)
+{
+	struct vidtv_psi_desc_registration *desc;
+
+	desc = kzalloc(sizeof(*desc) + sizeof(format_id) + additional_info_len, GFP_KERNEL);
+
+	desc->type = REGISTRATION_DESCRIPTOR;
+
+	desc->length = sizeof_field(struct vidtv_psi_desc_registration, format_id)
+		       + additional_info_len;
+
+	desc->format_id = format_id;
+
+	if (additional_ident_info && additional_info_len)
+		memcpy(desc->additional_identification_info,
+		       additional_ident_info,
+		       additional_info_len);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = (struct vidtv_psi_desc *)desc;
+	}
+
+	return desc;
+}
+
+struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
+{
+	struct vidtv_psi_desc *head = NULL;
+	struct vidtv_psi_desc *prev = NULL;
+	struct vidtv_psi_desc *curr = NULL;
+
+	struct vidtv_psi_desc_service *service;
+
+	while (desc) {
+		switch (desc->type) {
+		case SERVICE_DESCRIPTOR:
+			service = (struct vidtv_psi_desc_service *)desc;
+			curr = (struct vidtv_psi_desc *)
+				vidtv_psi_service_desc_init(head,
+							    service->service_type,
+							    service->service_name,
+							    service->provider_name);
+		break;
+
+		case REGISTRATION_DESCRIPTOR:
+		default:
+			curr = kzalloc(sizeof(*desc) + desc->length, GFP_KERNEL);
+			memcpy(curr, desc, sizeof(*desc) + desc->length);
+		break;
+	}
+
+		if (curr)
+			curr->next = NULL;
+		if (!head)
+			head = curr;
+		if (prev)
+			prev->next = curr;
+
+		prev = curr;
+		desc = desc->next;
+	}
+
+	return head;
+}
+
+void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
+{
+	struct vidtv_psi_desc *curr = desc;
+	struct vidtv_psi_desc *tmp  = NULL;
+
+	while (curr) {
+		tmp  = curr;
+		curr = curr->next;
+
+		switch (tmp->type) {
+		case SERVICE_DESCRIPTOR:
+			kfree(((struct vidtv_psi_desc_service *)tmp)->provider_name);
+			kfree(((struct vidtv_psi_desc_service *)tmp)->service_name);
+
+			break;
+		case REGISTRATION_DESCRIPTOR:
+			/* nothing to do */
+			break;
+
+		default:
+			pr_warn_ratelimited("Possible leak: not handling descriptor type %d\n",
+					    tmp->type);
+			break;
+		}
+
+		kfree(tmp);
+	}
+}
+
+static u16
+vidtv_psi_desc_comp_loop_len(struct vidtv_psi_desc *desc)
+{
+	u32 length = 0;
+
+	if (!desc)
+		return 0;
+
+	while (desc) {
+		length += sizeof_field(struct vidtv_psi_desc, type);
+		length += sizeof_field(struct vidtv_psi_desc, length);
+		length += desc->length; /* from 'length' field until the end of the descriptor */
+		desc    = desc->next;
+	}
+
+	return length;
+}
+
+void vidtv_psi_desc_assign(struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc)
+{
+	if (desc == *to)
+		return;
+
+	if (*to)
+		vidtv_psi_desc_destroy(*to);
+
+	*to = desc;
+}
+
+void vidtv_pmt_desc_assign(struct vidtv_psi_table_pmt *pmt,
+			   struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc)
+{
+	vidtv_psi_desc_assign(to, desc);
+	vidtv_psi_pmt_table_update_sec_len(pmt);
+
+	if (vidtv_psi_get_sec_len(&pmt->header) > MAX_SECTION_LEN)
+		vidtv_psi_desc_assign(to, NULL);
+
+	vidtv_psi_update_version_num(&pmt->header);
+}
+
+void vidtv_sdt_desc_assign(struct vidtv_psi_table_sdt *sdt,
+			   struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc)
+{
+	vidtv_psi_desc_assign(to, desc);
+	vidtv_psi_sdt_table_update_sec_len(sdt);
+
+	if (vidtv_psi_get_sec_len(&sdt->header) > MAX_SECTION_LEN)
+		vidtv_psi_desc_assign(to, NULL);
+
+	vidtv_psi_update_version_num(&sdt->header);
+}
+
+static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	struct psi_write_args psi_args = {};
+
+	psi_args.dest_buf = args.dest_buf;
+	psi_args.from     = &args.desc->type;
+
+	psi_args.len = sizeof_field(struct vidtv_psi_desc, type) +
+		       sizeof_field(struct vidtv_psi_desc, length);
+
+	psi_args.dest_offset        = args.dest_offset + nbytes;
+	psi_args.pid                = args.pid;
+	psi_args.new_psi_section    = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = false;
+	psi_args.dest_buf_sz        = args.dest_buf_sz;
+	psi_args.crc                = args.crc;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	switch (args.desc->type) {
+	case SERVICE_DESCRIPTOR:
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = sizeof_field(struct vidtv_psi_desc_service, service_type) +
+			       sizeof_field(struct vidtv_psi_desc_service, provider_name_len);
+		psi_args.from = &((struct vidtv_psi_desc_service *)args.desc)->service_type;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_service *)args.desc)->provider_name_len;
+		psi_args.from = ((struct vidtv_psi_desc_service *)args.desc)->provider_name;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = sizeof_field(struct vidtv_psi_desc_service, service_name_len);
+		psi_args.from = &((struct vidtv_psi_desc_service *)args.desc)->service_name_len;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_service *)args.desc)->service_name_len;
+		psi_args.from = ((struct vidtv_psi_desc_service *)args.desc)->service_name;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		break;
+
+	case REGISTRATION_DESCRIPTOR:
+	default:
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = args.desc->length;
+		psi_args.from = &args.desc->data;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		break;
+	}
+
+	return nbytes;
+}
+
+static u32
+vidtv_psi_table_header_write_into(struct header_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	struct psi_write_args psi_args = {};
+
+	psi_args.dest_buf           = args.dest_buf;
+	psi_args.from               = args.h;
+	psi_args.len                = sizeof(struct vidtv_psi_table_header);
+	psi_args.dest_offset        = args.dest_offset;
+	psi_args.pid                = args.pid;
+	psi_args.new_psi_section    = true;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = false;
+	psi_args.dest_buf_sz        = args.dest_buf_sz;
+	psi_args.crc                = args.crc;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+void
+vidtv_psi_pat_table_update_sec_len(struct vidtv_psi_table_pat *pat)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.43 */
+	u16 length = 0;
+	u32 i;
+
+	/* from immediately after 'section_length' until 'last_section_number'*/
+	length += PAT_LEN_UNTIL_LAST_SECTION_NUMBER;
+
+	/* do not count the pointer */
+	for (i = 0; i < pat->programs; ++i)
+		length += sizeof(struct vidtv_psi_table_pat_program) -
+			  sizeof(struct vidtv_psi_table_pat_program *);
+
+	length += CRC_SIZE_IN_BYTES;
+
+	vidtv_psi_set_sec_len(&pat->header, length);
+}
+
+void vidtv_psi_pmt_table_update_sec_len(struct vidtv_psi_table_pmt *pmt)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.46 */
+	u16 length = 0;
+	struct vidtv_psi_table_pmt_stream *s = pmt->stream;
+	u16 desc_loop_len;
+
+	/* from immediately after 'section_length' until 'program_info_length'*/
+	length += PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH;
+
+	desc_loop_len = vidtv_psi_desc_comp_loop_len(pmt->descriptor);
+	vidtv_psi_set_desc_loop_len(&pmt->bitfield2, desc_loop_len, 10);
+
+	length += desc_loop_len;
+
+	while (s) {
+		/* skip both pointers at the end */
+		length += sizeof(struct vidtv_psi_table_pmt_stream) -
+			  sizeof(struct vidtv_psi_desc *) -
+			  sizeof(struct vidtv_psi_table_pmt_stream *);
+
+		desc_loop_len = vidtv_psi_desc_comp_loop_len(s->descriptor);
+		vidtv_psi_set_desc_loop_len(&s->bitfield2, desc_loop_len, 10);
+
+		length += desc_loop_len;
+
+		s = s->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	vidtv_psi_set_sec_len(&pmt->header, length);
+}
+
+void vidtv_psi_sdt_table_update_sec_len(struct vidtv_psi_table_sdt *sdt)
+{
+	/* see ETSI EN 300 468 V 1.10.1 p.24 */
+	u16 length = 0;
+	struct vidtv_psi_table_sdt_service *s = sdt->service;
+	u16 desc_loop_len;
+
+	/*
+	 * from immediately after 'section_length' until
+	 * 'reserved_for_future_use'
+	 */
+	length += SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE;
+
+	while (s) {
+		/* skip both pointers at the end */
+		length += sizeof(struct vidtv_psi_table_sdt_service) -
+			  sizeof(struct vidtv_psi_desc *) -
+			  sizeof(struct vidtv_psi_table_sdt_service *);
+
+		desc_loop_len = vidtv_psi_desc_comp_loop_len(s->descriptor);
+		vidtv_psi_set_desc_loop_len(&s->bitfield, desc_loop_len, 12);
+
+		length += desc_loop_len;
+
+		s = s->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	vidtv_psi_set_sec_len(&sdt->header, length);
+}
+
+struct vidtv_psi_table_pat_program*
+vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
+			   u16 service_id,
+			   u16 program_map_pid)
+{
+	struct vidtv_psi_table_pat_program *program;
+	const u16 RESERVED = 0x07;
+
+	program = kzalloc(sizeof(*program), GFP_KERNEL);
+
+	program->service_id = cpu_to_be16(service_id);
+
+	/* pid for the PMT section in the TS */
+	program->bitfield = cpu_to_be16((RESERVED << 13) | program_map_pid);
+	program->next = NULL;
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = program;
+	}
+
+	return program;
+}
+
+void
+vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p)
+{
+	struct vidtv_psi_table_pat_program *curr = p;
+	struct vidtv_psi_table_pat_program *tmp  = NULL;
+
+	while (curr) {
+		tmp  = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+void
+vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
+			     struct vidtv_psi_table_pat_program *p)
+{
+	/* This function transfers ownership of p to the table */
+
+	u16 program_count = 0;
+	struct vidtv_psi_table_pat_program *program = p;
+
+	if (p == pat->program)
+		return;
+
+	while (program) {
+		++program_count;
+		program = program->next;
+	}
+
+	pat->programs = program_count;
+	pat->program  = p;
+
+	/* Recompute section length */
+	vidtv_psi_pat_table_update_sec_len(pat);
+
+	if (vidtv_psi_get_sec_len(&pat->header) > MAX_SECTION_LEN)
+		vidtv_psi_pat_program_assign(pat, NULL);
+
+	vidtv_psi_update_version_num(&pat->header);
+}
+
+struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
+{
+	struct vidtv_psi_table_pat *pat = kzalloc(sizeof(*pat), GFP_KERNEL);
+	static u8 pat_version;
+	const u16 SYNTAX = 0x1;
+	const u16 ZERO = 0x0;
+	const u16 ONES = 0x03;
+
+	pat->header.table_id = 0x0;
+
+	pat->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ZERO << 14) | (ONES << 12));
+	/* transport stream ID, at will */
+	pat->header.id           = cpu_to_be16(transport_stream_id);
+	pat->header.current_next = 0x1;
+
+	pat->header.version = pat_version;
+
+	pat->header.one2         = 0x03;
+	pat->header.section_id   = 0x0;
+	pat->header.last_section = 0x0;
+
+	pat->programs = 0;
+
+	vidtv_psi_pat_table_update_sec_len(pat);
+
+	return pat;
+}
+
+u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	const u16 pat_pid = VIDTV_PAT_PID;
+	u32 crc = 0xffffffff;
+
+	struct vidtv_psi_table_pat_program *p = args.pat->program;
+
+	struct header_write_args h_args       = {};
+	struct psi_write_args psi_args            = {};
+	struct crc32_write_args c_args        = {};
+
+	vidtv_psi_pat_table_update_sec_len(args.pat);
+
+	h_args.dest_buf           = args.buf;
+	h_args.dest_offset        = args.offset;
+	h_args.h                  = &args.pat->header;
+	h_args.pid                = pat_pid;
+	h_args.continuity_counter = args.continuity_counter;
+	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.crc = &crc;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	/* note that the field 'u16 programs' is not really part of the PAT */
+
+	psi_args.dest_buf           = args.buf;
+	psi_args.pid                = pat_pid;
+	psi_args.new_psi_section    = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = false;
+	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.crc                = &crc;
+
+	while (p) {
+		/* copy the PAT programs */
+		psi_args.from = p;
+		/* skip the pointer */
+		psi_args.len = sizeof(*p) -
+			   sizeof(struct vidtv_psi_table_pat_program *);
+		psi_args.dest_offset = args.offset + nbytes;
+
+		//crc = dvb_crc32(crc, args.from, args.len);
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		p = p->next;
+	}
+
+	c_args.dest_buf           = args.buf;
+	c_args.dest_offset        = args.offset + nbytes;
+	c_args.crc                = cpu_to_be32(crc);
+	c_args.pid                = pat_pid;
+	c_args.continuity_counter = args.continuity_counter;
+	c_args.dest_buf_sz        = args.buf_sz;
+
+	/* Write the CRC32 at the end */
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void
+vidtv_psi_pat_table_destroy(struct vidtv_psi_table_pat *p)
+{
+	vidtv_psi_pat_program_destroy(p->program);
+	kfree(p);
+}
+
+struct vidtv_psi_table_pmt_stream*
+vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
+			  enum vidtv_psi_stream_types stream_type,
+			  u16 es_pid)
+{
+	struct vidtv_psi_table_pmt_stream *stream;
+	const u16 RESERVED1 = 0x07;
+	const u16 RESERVED2 = 0x0f;
+	const u16 ZERO = 0x0;
+	u16 desc_loop_len;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+
+	stream->type = stream_type;
+
+	stream->bitfield = cpu_to_be16((RESERVED1 << 13) | es_pid);
+
+	desc_loop_len = vidtv_psi_desc_comp_loop_len(stream->descriptor);
+
+	stream->bitfield2 = cpu_to_be16((RESERVED2 << 12) |
+					(ZERO << 10)      |
+					desc_loop_len);
+	stream->next = NULL;
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = stream;
+	}
+
+	return stream;
+}
+
+void vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s)
+{
+	struct vidtv_psi_table_pmt_stream *curr_stream = s;
+	struct vidtv_psi_table_pmt_stream *tmp_stream  = NULL;
+
+	while (curr_stream) {
+		tmp_stream  = curr_stream;
+		curr_stream = curr_stream->next;
+		vidtv_psi_desc_destroy(tmp_stream->descriptor);
+		kfree(tmp_stream);
+	}
+}
+
+void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
+				 struct vidtv_psi_table_pmt_stream *s)
+{
+	/* This function transfers ownership of s to the table */
+	if (s == pmt->stream)
+		return;
+
+	pmt->stream = s;
+	vidtv_psi_pmt_table_update_sec_len(pmt);
+
+	if (vidtv_psi_get_sec_len(&pmt->header) > MAX_SECTION_LEN)
+		vidtv_psi_pmt_stream_assign(pmt, NULL);
+
+	vidtv_psi_update_version_num(&pmt->header);
+}
+
+u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
+			  struct vidtv_psi_table_pat *pat)
+{
+	struct vidtv_psi_table_pat_program *program = pat->program;
+
+	/*
+	 * service_id is the same as program_number in the
+	 * corresponding program_map_section
+	 * see ETSI EN 300 468 v1.15.1 p. 24
+	 */
+	while (program) {
+		if (program->service_id == section->header.id)
+			return vidtv_psi_get_pat_program_pid(program);
+
+		program = program->next;
+	}
+
+	return TS_LAST_VALID_PID + 1; /* not found */
+}
+
+struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
+						     u16 pcr_pid)
+{
+	struct vidtv_psi_table_pmt *pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
+	static u8 pmt_version;
+	const u16 SYNTAX = 0x1;
+	const u16 ZERO = 0x0;
+	const u16 ONES = 0x03;
+	const u16 RESERVED1 = 0x07;
+	const u16 RESERVED2 = 0x0f;
+	u16 desc_loop_len;
+
+	if (!pcr_pid)
+		pcr_pid = 0x1fff;
+
+	pmt->header.table_id = 0x2;
+
+	pmt->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ZERO << 14) | (ONES << 12));
+
+	pmt->header.id = cpu_to_be16(program_number);
+	pmt->header.current_next = 0x1;
+
+	pmt->header.version = pmt_version;
+
+	pmt->header.one2 = ONES;
+	pmt->header.section_id   = 0;
+	pmt->header.last_section = 0;
+
+	pmt->bitfield = cpu_to_be16((RESERVED1 << 13) | pcr_pid);
+
+	desc_loop_len = vidtv_psi_desc_comp_loop_len(pmt->descriptor);
+
+	pmt->bitfield2 = cpu_to_be16((RESERVED2 << 12) |
+				     (ZERO << 10)      |
+				     desc_loop_len);
+
+	vidtv_psi_pmt_table_update_sec_len(pmt);
+
+	return pmt;
+}
+
+u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	u32 crc = 0xffffffff;
+
+	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
+	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
+	struct vidtv_psi_desc *stream_descriptor  = (stream) ?
+						    args.pmt->stream->descriptor :
+						    NULL;
+
+	struct header_write_args h_args = {};
+	struct psi_write_args psi_args      = {};
+	struct desc_write_args d_args   = {};
+	struct crc32_write_args c_args  = {};
+
+	vidtv_psi_pmt_table_update_sec_len(args.pmt);
+
+	h_args.dest_buf           = args.buf;
+	h_args.dest_offset        = args.offset;
+	h_args.h                  = &args.pmt->header;
+	h_args.pid                = args.pid;
+	h_args.continuity_counter = args.continuity_counter;
+	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.crc                = &crc;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	/* write the two bitfields */
+	psi_args.dest_buf = args.buf;
+	psi_args.from     = &args.pmt->bitfield;
+	psi_args.len      = sizeof_field(struct vidtv_psi_table_pmt, bitfield) +
+			    sizeof_field(struct vidtv_psi_table_pmt, bitfield2);
+
+	psi_args.dest_offset        = args.offset + nbytes;
+	psi_args.pid                = args.pid;
+	psi_args.new_psi_section    = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = false;
+	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.crc                = &crc;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	while (table_descriptor) {
+		/* write the descriptors, if any */
+		d_args.dest_buf           = args.buf;
+		d_args.dest_offset        = args.offset + nbytes;
+		d_args.desc               = table_descriptor;
+		d_args.pid                = args.pid;
+		d_args.continuity_counter = args.continuity_counter;
+		d_args.dest_buf_sz        = args.buf_sz;
+		d_args.crc                = &crc;
+
+		nbytes += vidtv_psi_desc_write_into(d_args);
+
+		table_descriptor = table_descriptor->next;
+	}
+
+	while (stream) {
+		/* write the streams, if any */
+		psi_args.from = stream;
+		psi_args.len  = sizeof_field(struct vidtv_psi_table_pmt_stream, type) +
+				sizeof_field(struct vidtv_psi_table_pmt_stream, bitfield) +
+				sizeof_field(struct vidtv_psi_table_pmt_stream, bitfield2);
+		psi_args.dest_offset = args.offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		while (stream_descriptor) {
+			/* write the stream descriptors, if any */
+			d_args.desc        = stream_descriptor;
+			d_args.dest_offset = args.offset + nbytes;
+			d_args.crc         = &crc;
+
+			nbytes += vidtv_psi_desc_write_into(d_args);
+
+			stream_descriptor = stream_descriptor->next;
+		}
+
+		stream = stream->next;
+	}
+
+	c_args.dest_buf           = args.buf;
+	c_args.dest_offset        = args.offset + nbytes;
+	c_args.crc                = cpu_to_be32(crc);
+	c_args.pid                = args.pid;
+	c_args.continuity_counter = args.continuity_counter;
+	c_args.dest_buf_sz        = args.buf_sz;
+
+	/* Write the CRC32 at the end */
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
+{
+	vidtv_psi_desc_destroy(pmt->descriptor);
+	vidtv_psi_pmt_stream_destroy(pmt->stream);
+	kfree(pmt);
+}
+
+struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
+{
+	struct vidtv_psi_table_sdt *sdt = kzalloc(sizeof(*sdt), GFP_KERNEL);
+	static u8 sdt_version;
+	const u16 SYNTAX = 0x1;
+	const u16 ONE = 0x1;
+	const u16 ONES = 0x03;
+	const u16 RESERVED = 0xff;
+
+	sdt->header.table_id = 0x42;
+
+	sdt->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
+
+	/*
+	 * This is a 16-bit field which serves as a label for identification
+	 * of the TS, about which the SDT informs, from any other multiplex
+	 * within the delivery system.
+	 */
+	sdt->header.id = cpu_to_be16(transport_stream_id);
+	sdt->header.current_next = ONE;
+
+	sdt->header.version = sdt_version;
+
+	sdt->header.one2  = ONES;
+	sdt->header.section_id   = 0;
+	sdt->header.last_section = 0;
+
+	sdt->network_id = cpu_to_be16(transport_stream_id);
+	sdt->reserved = RESERVED;
+
+	vidtv_psi_sdt_table_update_sec_len(sdt);
+
+	return sdt;
+}
+
+u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
+{
+	u32 nbytes  = 0;
+	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
+
+	u32 crc = 0xffffffff;
+
+	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
+	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
+					      args.sdt->service->descriptor :
+					      NULL;
+
+	struct header_write_args h_args = {};
+	struct psi_write_args psi_args      = {};
+	struct desc_write_args d_args   = {};
+	struct crc32_write_args c_args  = {};
+
+	vidtv_psi_sdt_table_update_sec_len(args.sdt);
+
+	h_args.dest_buf           = args.buf;
+	h_args.dest_offset        = args.offset;
+	h_args.h                  = &args.sdt->header;
+	h_args.pid                = sdt_pid;
+	h_args.continuity_counter = args.continuity_counter;
+	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.crc                = &crc;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	psi_args.dest_buf = args.buf;
+	psi_args.from     = &args.sdt->network_id;
+
+	psi_args.len = sizeof_field(struct vidtv_psi_table_sdt, network_id) +
+		       sizeof_field(struct vidtv_psi_table_sdt, reserved);
+
+	psi_args.dest_offset        = args.offset + nbytes;
+	psi_args.pid                = sdt_pid;
+	psi_args.new_psi_section    = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = false;
+	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.crc                = &crc;
+
+	/* copy u16 network_id + u8 reserved)*/
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	while (service) {
+		/* copy the services, if any */
+		psi_args.from = service;
+		/* skip both pointers at the end */
+		psi_args.len = sizeof(struct vidtv_psi_table_sdt_service) -
+			       sizeof(struct vidtv_psi_desc *) -
+			       sizeof(struct vidtv_psi_table_sdt_service *);
+		psi_args.dest_offset = args.offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		while (service_desc) {
+			/* copy the service descriptors, if any */
+			d_args.dest_buf           = args.buf;
+			d_args.dest_offset        = args.offset + nbytes;
+			d_args.desc               = service_desc;
+			d_args.pid                = sdt_pid;
+			d_args.continuity_counter = args.continuity_counter;
+			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.crc                = &crc;
+
+			nbytes += vidtv_psi_desc_write_into(d_args);
+
+			service_desc = service_desc->next;
+		}
+
+		service = service->next;
+	}
+
+	c_args.dest_buf           = args.buf;
+	c_args.dest_offset        = args.offset + nbytes;
+	c_args.crc                = cpu_to_be32(crc);
+	c_args.pid                = sdt_pid;
+	c_args.continuity_counter = args.continuity_counter;
+	c_args.dest_buf_sz        = args.buf_sz;
+
+	/* Write the CRC at the end */
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt)
+{
+	vidtv_psi_sdt_service_destroy(sdt->service);
+	kfree(sdt);
+}
+
+struct vidtv_psi_table_sdt_service
+*vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
+			    u16 service_id)
+{
+	struct vidtv_psi_table_sdt_service *service;
+
+	service = kzalloc(sizeof(*service), GFP_KERNEL);
+
+	/*
+	 * ETSI 300 468: this is a 16bit field which serves as a label to
+	 * identify this service from any other service within the TS.
+	 * The service id is the same as the program number in the
+	 * corresponding program_map_section
+	 */
+	service->service_id            = cpu_to_be16(service_id);
+	service->EIT_schedule          = 0x0;
+	service->EIT_present_following = 0x0;
+	service->reserved              = 0x3f;
+
+	service->bitfield = cpu_to_be16(RUNNING << 13);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = service;
+	}
+
+	return service;
+}
+
+void
+vidtv_psi_sdt_service_destroy(struct vidtv_psi_table_sdt_service *service)
+{
+	struct vidtv_psi_table_sdt_service *curr = service;
+	struct vidtv_psi_table_sdt_service *tmp  = NULL;
+
+	while (curr) {
+		tmp  = curr;
+		curr = curr->next;
+		vidtv_psi_desc_destroy(tmp->descriptor);
+		kfree(tmp);
+	}
+}
+
+void
+vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
+			     struct vidtv_psi_table_sdt_service *service)
+{
+	if (service == sdt->service)
+		return;
+
+	sdt->service = service;
+
+	/* recompute section length */
+	vidtv_psi_sdt_table_update_sec_len(sdt);
+
+	if (vidtv_psi_get_sec_len(&sdt->header) > MAX_SECTION_LEN)
+		vidtv_psi_sdt_service_assign(sdt, NULL);
+
+	vidtv_psi_update_version_num(&sdt->header);
+}
+
+struct vidtv_psi_table_pmt**
+vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat, u16 pcr_pid)
+
+{
+	/*
+	 * PMTs contain information about programs. For each program,
+	 * there is one PMT section. This function will create a section
+	 * for each program found in the PAT
+	 */
+	struct vidtv_psi_table_pat_program *program = pat->program;
+	struct vidtv_psi_table_pmt **pmt_secs;
+	u32 i = 0;
+
+	/* a section for each program_id */
+	pmt_secs = kcalloc(pat->programs,
+			   sizeof(struct vidtv_psi_table_pmt *),
+			   GFP_KERNEL);
+
+	while (program) {
+		pmt_secs[i] = vidtv_psi_pmt_table_init(be16_to_cpu(program->service_id), pcr_pid);
+		++i;
+		program = program->next;
+	}
+
+	return pmt_secs;
+}
+
+struct vidtv_psi_table_pmt
+*vidtv_psi_find_pmt_sec(struct vidtv_psi_table_pmt **pmt_sections,
+			u16 nsections,
+			u16 program_num)
+{
+	/* find the PMT section associated with 'program_num' */
+	struct vidtv_psi_table_pmt *sec = NULL;
+	u32 i;
+
+	for (i = 0; i < nsections; ++i) {
+		sec = pmt_sections[i];
+		if (be16_to_cpu(sec->header.id) == program_num)
+			return sec;
+	}
+
+	return NULL; /* not found */
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
new file mode 100644
index 000000000000..def56bcb80c7
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -0,0 +1,593 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file contains the logic to work with MPEG Program-Specific Information.
+ * These are defined both in ISO/IEC 13818-1 (systems) and ETSI EN 300 468.
+ * PSI is carried in the form of table structures, and although each table might
+ * technically be broken into one or more sections, we do not do this here,
+ * hence 'table' and 'section' are interchangeable for vidtv.
+ *
+ * This code currently supports three tables: PAT, PMT and SDT. These are the
+ * bare minimum to get userspace to recognize our MPEG transport stream. It can
+ * be extended to support more PSI tables in the future.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_PSI_H
+#define VIDTV_PSI_H
+
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+/*
+ * all section lengths start immediately after the 'section_length' field
+ * see ISO/IEC 13818-1 : 2000 and ETSI EN 300 468 V 1.10.1 for
+ * reference
+ */
+#define PAT_LEN_UNTIL_LAST_SECTION_NUMBER 5
+#define PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH 9
+#define SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE 8
+#define MAX_SECTION_LEN 1021
+#define VIDTV_PAT_PID 0 /* mandated by the specs */
+#define VIDTV_SDT_PID 0x0011 /* mandated by the specs */
+
+enum vidtv_psi_descriptors {
+	REGISTRATION_DESCRIPTOR	= 0x05, /* See ISO/IEC 13818-1 section 2.6.8 */
+	SERVICE_DESCRIPTOR = 0x48, /* See ETSI EN 300 468 section 6.2.33 */
+};
+
+enum vidtv_psi_stream_types {
+	STREAM_PRIVATE_DATA = 0x06, /* see ISO/IEC 13818-1 2000 p. 48 */
+};
+
+/**
+ * struct vidtv_psi_desc - A generic PSI descriptor type.
+ * The descriptor length is an 8-bit field specifying the total number of bytes of the data portion
+ * of the descriptor following the byte defining the value of this field.
+ */
+struct vidtv_psi_desc {
+	struct vidtv_psi_desc *next;
+	u8 type;
+	u8 length;
+	u8 data[];
+} __packed;
+
+/**
+ * struct vidtv_psi_desc_service - Service descriptor.
+ * See ETSI EN 300 468 section 6.2.33.
+ */
+struct vidtv_psi_desc_service {
+	struct vidtv_psi_desc *next;
+	u8 type;
+	u8 length;
+
+	u8 service_type;
+	u8 provider_name_len;
+	char *provider_name;
+	u8 service_name_len;
+	char *service_name;
+} __packed;
+
+/**
+ * struct vidtv_psi_desc_registration - A registration descriptor.
+ * See ISO/IEC 13818-1 section 2.6.8
+ */
+struct vidtv_psi_desc_registration {
+	struct vidtv_psi_desc *next;
+	u8 type;
+	u8 length;
+
+	/*
+	 * The format_identifier is a 32-bit value obtained from a Registration
+	 * Authority as designated by ISO/IEC JTC 1/SC 29.
+	 */
+	__be32 format_id;
+	/*
+	 * The meaning of additional_identification_info bytes, if any, are
+	 * defined by the assignee of that format_identifier, and once defined
+	 * they shall not change.
+	 */
+	u8 additional_identification_info[];
+} __packed;
+
+/**
+ * struct vidtv_psi_table_header - A header that is present for all PSI tables.
+ */
+struct vidtv_psi_table_header {
+	u8  table_id;
+
+	__be16 bitfield; /* syntax: 1, zero: 1, one: 2, section_length: 13 */
+
+	__be16 id; /* TS ID */
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	u8  current_next:1;
+	u8  version:5;
+	u8  one2:2;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+	u8  one2:2;
+	u8  version:5;
+	u8  current_next:1;
+#else
+#error  "Unknown bitfield ordering"
+#endif
+	u8  section_id;	/* section_number */
+	u8  last_section; /* last_section_number */
+} __packed;
+
+/**
+ * struct vidtv_psi_table_pat_program - A single program in the PAT
+ * See ISO/IEC 13818-1 : 2000 p.43
+ */
+struct vidtv_psi_table_pat_program {
+	__be16 service_id;
+	__be16 bitfield; /* reserved: 3, program_map_pid/network_pid: 13 */
+	struct vidtv_psi_table_pat_program *next;
+} __packed;
+
+/**
+ * struct vidtv_psi_table_pat - The Program Allocation Table (PAT)
+ * See ISO/IEC 13818-1 : 2000 p.43
+ */
+struct vidtv_psi_table_pat {
+	struct vidtv_psi_table_header header;
+	u16 programs; /* Included by libdvbv5, not part of the table and not actually serialized */
+	struct vidtv_psi_table_pat_program *program;
+} __packed;
+
+/**
+ * struct vidtv_psi_table_sdt_service - Represents a service in the SDT.
+ * see ETSI EN 300 468 v1.15.1 section 5.2.3.
+ */
+struct vidtv_psi_table_sdt_service {
+	__be16 service_id;
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	u8 EIT_present_following:1;
+	u8 EIT_schedule:1;
+	u8 reserved:6;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+	u8 reserved:6;
+	u8 EIT_schedule:1;
+	u8 EIT_present_following:1;
+#else
+#error  "Unknown bitfield ordering"
+#endif
+	__be16 bitfield; /* running_status: 3, free_ca:1, desc_loop_len:12 */
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_sdt_service *next;
+} __packed;
+
+/**
+ * struct vidtv_psi_table_sdt - Represents the Service Description Table
+ * see ETSI EN 300 468 v1.15.1 section 5.2.3.
+ */
+
+struct vidtv_psi_table_sdt {
+	struct vidtv_psi_table_header header;
+	__be16 network_id; /* original_network_id */
+	u8  reserved;
+	struct vidtv_psi_table_sdt_service *service;
+} __packed;
+
+/**
+ * enum service_running_status - Status of a SDT service.
+ * see ETSI EN 300 468 v1.15.1 section 5.2.3 table 6.
+ */
+enum service_running_status {
+	RUNNING = 0x4,
+};
+
+/**
+ * enum service_type - The type of a SDT service.
+ * see ETSI EN 300 468 v1.15.1 section 6.2.33, table 81.
+ */
+enum service_type {
+	/* see ETSI EN 300 468 v1.15.1 p. 77 */
+	DIGITAL_TELEVISION_SERVICE = 0x1,
+};
+
+/**
+ * struct vidtv_psi_table_pmt_stream - A single stream in the PMT.
+ * See ISO/IEC 13818-1 : 2000 p.46.
+ */
+struct vidtv_psi_table_pmt_stream {
+	u8 type;
+	__be16 bitfield; /* reserved: 3, elementary_pid: 13 */
+	__be16 bitfield2; /*reserved: 4, zero: 2, desc_length: 10 */
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_pmt_stream *next;
+} __packed;
+
+/**
+ * struct vidtv_psi_table_pmt - The Program Map Table (PMT).
+ * See ISO/IEC 13818-1 : 2000 p.46.
+ */
+struct vidtv_psi_table_pmt {
+	struct vidtv_psi_table_header header;
+	__be16 bitfield; /* reserved:3, pcr_pid: 13 */
+	__be16 bitfield2; /* reserved: 4, zero: 2, desc_len: 10 */
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_pmt_stream *stream;
+} __packed;
+
+/**
+ * struct psi_write_args - Arguments for the PSI packetizer.
+ * @dest_buf: The buffer to write into.
+ * @from: PSI data to be copied.
+ * @len: How much to write.
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @pid: TS packet ID.
+ * @new_psi_section: Set when starting a table section.
+ * @continuity_counter: Incremented on every new packet.
+ * @is_crc: Set when writing the CRC at the end.
+ * @dest_buf_sz: The size of the dest_buffer
+ * @crc: a pointer to store the crc for this chunk
+ */
+struct psi_write_args {
+	void *dest_buf;
+	void *from;
+	size_t len;
+	u32 dest_offset;
+	u16 pid;
+	bool new_psi_section;
+	u8 *continuity_counter;
+	bool is_crc;
+	u32 dest_buf_sz;
+	u32 *crc;
+};
+
+/**
+ * struct desc_write_args - Arguments in order to write a descriptor.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @desc: A pointer to the descriptor
+ * @pid: TS packet ID.
+ * @continuity_counter: Incremented on every new packet.
+ * @dest_buf_sz: The size of the dest_buffer
+ * @crc: a pointer to store the crc for this chunk
+ */
+struct desc_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	struct vidtv_psi_desc *desc;
+	u16 pid;
+	u8 *continuity_counter;
+	u32 dest_buf_sz;
+	u32 *crc;
+};
+
+/**
+ * struct crc32_write_args - Arguments in order to write the CRC at the end of
+ * the PSI tables.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @crc: the CRC value to write
+ * @pid: TS packet ID.
+ * @continuity_counter: Incremented on every new packet.
+ * @dest_buf_sz: The size of the dest_buffer
+ */
+struct crc32_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	__be32 crc;
+	u16 pid;
+	u8 *continuity_counter;
+	u32 dest_buf_sz;
+};
+
+/**
+ * struct header_write_args - Arguments in order to write the common table
+ * header
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: where to start writing in the dest_buffer.
+ * @h: a pointer to the header.
+ * @pid: TS packet ID.
+ * @continuity_counter: Incremented on every new packet.
+ * @dest_buf_sz: The size of the dest_buffer
+ * @crc: a pointer to store the crc for this chunk
+ */
+struct header_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	struct vidtv_psi_table_header *h;
+	u16 pid;
+	u8 *continuity_counter;
+	u32 dest_buf_sz;
+	u32 *crc;
+};
+
+struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc *head,
+							   enum service_type service_type,
+							   char *service_name,
+							   char *provider_name);
+
+struct vidtv_psi_desc_registration
+*vidtv_psi_registration_desc_init(struct vidtv_psi_desc *head,
+				  __be32 format_id,
+				  u8 *additional_ident_info,
+				  u32 additional_info_len);
+
+struct vidtv_psi_table_pat_program
+*vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
+			    u16 service_id,
+			    u16 program_map_pid);
+
+struct vidtv_psi_table_pmt_stream*
+vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
+			  enum vidtv_psi_stream_types stream_type,
+			  u16 es_pid);
+
+struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id);
+
+struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
+						     u16 pcr_pid);
+
+struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id);
+
+struct vidtv_psi_table_sdt_service*
+vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
+			   u16 service_id);
+
+void
+vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc);
+
+void
+vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p);
+
+void
+vidtv_psi_pat_table_destroy(struct vidtv_psi_table_pat *p);
+
+void
+vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s);
+
+void
+vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt);
+
+void
+vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt);
+
+void
+vidtv_psi_sdt_service_destroy(struct vidtv_psi_table_sdt_service *service);
+
+/**
+ * vidtv_psi_sdt_service_assign - Assigns the service loop to the SDT.
+ * @sdt: The SDT to assign to.
+ * @service: The service loop (one or more services)
+ *
+ * This will free the previous service loop in the table.
+ * This will assign ownership of the service loop to the table, i.e. the table
+ * will free this service loop when a call to its destroy function is made.
+ */
+void
+vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
+			     struct vidtv_psi_table_sdt_service *service);
+
+/**
+ * vidtv_psi_desc_assign - Assigns a descriptor loop at some point
+ * @to: Where to assign this descriptor loop to
+ * @desc: The descriptor loop that will be assigned.
+ *
+ * This will free the loop in 'to', if any.
+ */
+void vidtv_psi_desc_assign(struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc);
+
+/**
+ * vidtv_psi_pmt_desc_assign - Assigns a descriptor loop at some point in a PMT section.
+ * @pmt: The PMT section that will contain the descriptor loop
+ * @to: Where in the PMT to assign this descriptor loop to
+ * @desc: The descriptor loop that will be assigned.
+ *
+ * This will free the loop in 'to', if any.
+ * This will assign ownership of the loop to the table, i.e. the table
+ * will free this loop when a call to its destroy function is made.
+ */
+void vidtv_pmt_desc_assign(struct vidtv_psi_table_pmt *pmt,
+			   struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc);
+
+/**
+ * vidtv_psi_sdt_desc_assign - Assigns a descriptor loop at some point in a SDT.
+ * @sdt: The SDT that will contain the descriptor loop
+ * @to: Where in the PMT to assign this descriptor loop to
+ * @desc: The descriptor loop that will be assigned.
+ *
+ * This will free the loop in 'to', if any.
+ * This will assign ownership of the loop to the table, i.e. the table
+ * will free this loop when a call to its destroy function is made.
+ */
+void vidtv_sdt_desc_assign(struct vidtv_psi_table_sdt *sdt,
+			   struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc);
+
+/**
+ * vidtv_psi_pat_program_assign - Assigns the program loop to the PAT.
+ * @pat: The PAT to assign to.
+ * @p: The program loop (one or more programs)
+ *
+ * This will free the previous program loop in the table.
+ * This will assign ownership of the program loop to the table, i.e. the table
+ * will free this program loop when a call to its destroy function is made.
+ */
+void vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
+				  struct vidtv_psi_table_pat_program *p);
+
+/**
+ * vidtv_psi_pmt_stream_assign - Assigns the stream loop to the PAT.
+ * @pmt: The PMT to assign to.
+ * @s: The stream loop (one or more streams)
+ *
+ * This will free the previous stream loop in the table.
+ * This will assign ownership of the stream loop to the table, i.e. the table
+ * will free this stream loop when a call to its destroy function is made.
+ */
+void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
+				 struct vidtv_psi_table_pmt_stream *s);
+
+struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc);
+
+/**
+ * vidtv_psi_create_sec_for_each_pat_entry - Create a PMT section for each
+ * program found in the PAT
+ * @pat: The PAT to look for programs.
+ * @s: The stream loop (one or more streams)
+ * @pcr_pid: packet ID for the PCR to be used for the program described in this
+ * PMT section
+ */
+struct vidtv_psi_table_pmt**
+vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat, u16 pcr_pid);
+
+/**
+ * vidtv_psi_pmt_get_pid - Get the TS PID for a PMT section.
+ * @section: The PMT section whose PID we want to retrieve.
+ * @pat: The PAT table to look into.
+ *
+ * Returns: the TS PID for 'section'
+ */
+u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
+			  struct vidtv_psi_table_pat *pat);
+
+/**
+ * vidtv_psi_pat_table_update_sec_len - Recompute and update the PAT section length.
+ * @pat: The PAT whose length is to be updated.
+ *
+ * This will traverse the table and accumulate the length of its components,
+ * which is then used to replace the 'section_length' field.
+ *
+ * If section_length > MAX_SECTION_LEN, the operation fails.
+ */
+void vidtv_psi_pat_table_update_sec_len(struct vidtv_psi_table_pat *pat);
+
+/**
+ * vidtv_psi_pmt_table_update_sec_len - Recompute and update the PMT section length.
+ * @pmt: The PMT whose length is to be updated.
+ *
+ * This will traverse the table and accumulate the length of its components,
+ * which is then used to replace the 'section_length' field.
+ *
+ * If section_length > MAX_SECTION_LEN, the operation fails.
+ */
+void vidtv_psi_pmt_table_update_sec_len(struct vidtv_psi_table_pmt *pmt);
+
+/**
+ * vidtv_psi_sdt_table_update_sec_len - Recompute and update the SDT section length.
+ * @sdt: The SDT whose length is to be updated.
+ *
+ * This will traverse the table and accumulate the length of its components,
+ * which is then used to replace the 'section_length' field.
+ *
+ * If section_length > MAX_SECTION_LEN, the operation fails.
+ */
+void vidtv_psi_sdt_table_update_sec_len(struct vidtv_psi_table_sdt *sdt);
+
+/**
+ * struct vidtv_psi_pat_write_args - Arguments for writing a PAT table
+ * @buf: The destination buffer.
+ * @offset: The offset into the destination buffer.
+ * @pat: A pointer to the PAT.
+ * @buf_sz: The size of the destination buffer.
+ * @continuity_counter: A pointer to the CC. Incremented on every new packet.
+ *
+ */
+struct vidtv_psi_pat_write_args {
+	char *buf;
+	u32 offset;
+	struct vidtv_psi_table_pat *pat;
+	u32 buf_sz;
+	u8 *continuity_counter;
+};
+
+/**
+ * vidtv_psi_pat_write_into - Write PAT as MPEG-TS packets into a buffer.
+ * @args: An instance of struct vidtv_psi_pat_write_args
+ *
+ * This function writes the MPEG TS packets for a PAT table into a buffer.
+ * Calling code will usually generate the PAT via a call to its init function
+ * and thus is responsible for freeing it.
+ *
+ * Return: The number of bytes written into the buffer. This is NOT
+ * equal to the size of the PAT, since more space is needed for TS headers during TS
+ * encapsulation.
+ */
+u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args);
+
+/**
+ * struct vidtv_psi_sdt_write_args - Arguments for writing a SDT table
+ * @buf: The destination buffer.
+ * @offset: The offset into the destination buffer.
+ * @sdt: A pointer to the SDT.
+ * @buf_sz: The size of the destination buffer.
+ * @continuity_counter: A pointer to the CC. Incremented on every new packet.
+ *
+ */
+
+struct vidtv_psi_sdt_write_args {
+	char *buf;
+	u32 offset;
+	struct vidtv_psi_table_sdt *sdt;
+	u32 buf_sz;
+	u8 *continuity_counter;
+};
+
+/**
+ * vidtv_psi_sdt_write_into - Write SDT as MPEG-TS packets into a buffer.
+ * @args: an instance of struct vidtv_psi_sdt_write_args
+ *
+ * This function writes the MPEG TS packets for a SDT table into a buffer.
+ * Calling code will usually generate the SDT via a call to its init function
+ * and thus is responsible for freeing it.
+ *
+ * Return: The number of bytes written into the buffer. This is NOT
+ * equal to the size of the SDT, since more space is needed for TS headers during TS
+ * encapsulation.
+ */
+u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args);
+
+/**
+ * struct vidtv_psi_pmt_write_args - Arguments for writing a PMT section
+ * @buf: The destination buffer.
+ * @offset: The offset into the destination buffer.
+ * @pmt: A pointer to the PMT.
+ * @buf_sz: The size of the destination buffer.
+ * @continuity_counter: A pointer to the CC. Incremented on every new packet.
+ *
+ */
+struct vidtv_psi_pmt_write_args {
+	char *buf;
+	u32 offset;
+	struct vidtv_psi_table_pmt *pmt;
+	u16 pid;
+	u32 buf_sz;
+	u8 *continuity_counter;
+	u16 pcr_pid;
+};
+
+/**
+ * vidtv_psi_pmt_write_into - Write PMT as MPEG-TS packets into a buffer.
+ * @args: an instance of struct vidtv_psi_pmt_write_args
+ *
+ * This function writes the MPEG TS packets for a PMT section into a buffer.
+ * Calling code will usually generate the PMT section via a call to its init function
+ * and thus is responsible for freeing it.
+ *
+ * Return: The number of bytes written into the buffer. This is NOT
+ * equal to the size of the PMT section, since more space is needed for TS headers
+ * during TS encapsulation.
+ */
+u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args);
+
+/**
+ * vidtv_psi_find_pmt_sec - Finds the PMT section for 'program_num'
+ * @pmt_sections: The sections to look into.
+ * @nsections: The number of sections.
+ * @program_num: The 'program_num' from PAT pointing to a PMT section.
+ *
+ * Return: A pointer to the PMT, if found, or NULL.
+ */
+struct vidtv_psi_table_pmt *vidtv_psi_find_pmt_sec(struct vidtv_psi_table_pmt **pmt_sections,
+						   u16 nsections,
+						   u16 program_num);
+
+u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p);
+u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *s);
+
+#endif // VIDTV_PSI_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
new file mode 100644
index 000000000000..3d59ef5221b8
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -0,0 +1,627 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the code for an AES3 (also known as AES/EBU) encoder.
+ * It is based on EBU Tech 3250 and SMPTE 302M technical documents.
+ *
+ * This encoder currently supports 16bit AES3 subframes using 16bit signed
+ * integers.
+ *
+ * Note: AU stands for Access Unit, and AAU stands for Audio Access Unit
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/vmalloc.h>
+#include <linux/string.h>
+#include <linux/kernel.h>
+#include <linux/jiffies.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/math64.h>
+
+#include "vidtv_s302m.h"
+#include "vidtv_encoder.h"
+#include "vidtv_common.h"
+
+#define S302M_SAMPLING_RATE_HZ 48000
+#define PES_PRIVATE_STREAM_1 0xbd  /* PES: private_stream_1 */
+
+/* see preamble definition in EBU Tech 3250 2004 clause 2.4 */
+#define PREAMBLE_X_F0 0xe2 /* sub-frame 1 */
+#define PREAMBLE_Y_F0 0xe4 /* sub-frame 2 */
+#define PREAMBLE_Z_F0 0xe8 /* sub-frame 1 + block start */
+/* F0 and F1 refer to whether the F bit was set in the previous sub-frame */
+#define PREAMBLE_X_F1 0x1d /* sub-frame 1 */
+#define PREAMBLE_Y_F1 0X1b /* sub-frame 2 */
+#define PREAMBLE_Z_F1 0x17 /* sub-frame 1 + block start */
+
+#define S302M_BLOCK_SZ 192
+#define S302M_SIN_LUT_NUM_ELEM 1024
+
+/*
+ * This buffer contains PCM audio samples of a sine wave, compatible with
+ * S302. If this is used as a source, a userspace media application should be able
+ * to play it.
+ */
+static u16 s302m_sin_lut[S302M_SIN_LUT_NUM_ELEM] = {
+	0x8000, 0x80c9, 0x8192, 0x825b, 0x8324, 0x83ed, 0x84b6, 0x857e,
+	0x8647, 0x8710, 0x87d9, 0x88a1, 0x896a, 0x8a32, 0x8afb, 0x8bc3,
+	0x8c8b, 0x8d53, 0x8e1b, 0x8ee3, 0x8fab, 0x9072, 0x9139, 0x9201,
+	0x92c7, 0x938e, 0x9455, 0x951b, 0x95e1, 0x96a7, 0x976d, 0x9833,
+	0x98f8, 0x99bd, 0x9a82, 0x9b47, 0x9c0b, 0x9ccf, 0x9d93, 0x9e56,
+	0x9f19, 0x9fdc, 0xa09f, 0xa161, 0xa223, 0xa2e5, 0xa3a6, 0xa467,
+	0xa527, 0xa5e8, 0xa6a7, 0xa767, 0xa826, 0xa8e5, 0xa9a3, 0xaa61,
+	0xab1f, 0xabdc, 0xac98, 0xad55, 0xae10, 0xaecc, 0xaf87, 0xb041,
+	0xb0fb, 0xb1b5, 0xb26e, 0xb326, 0xb3de, 0xb496, 0xb54d, 0xb603,
+	0xb6b9, 0xb76f, 0xb824, 0xb8d8, 0xb98c, 0xba3f, 0xbaf2, 0xbba4,
+	0xbc56, 0xbd07, 0xbdb7, 0xbe67, 0xbf17, 0xbfc5, 0xc073, 0xc121,
+	0xc1cd, 0xc279, 0xc325, 0xc3d0, 0xc47a, 0xc524, 0xc5cc, 0xc675,
+	0xc71c, 0xc7c3, 0xc869, 0xc90f, 0xc9b3, 0xca57, 0xcafb, 0xcb9d,
+	0xcc3f, 0xcce0, 0xcd81, 0xce20, 0xcebf, 0xcf5d, 0xcffb, 0xd097,
+	0xd133, 0xd1ce, 0xd268, 0xd302, 0xd39a, 0xd432, 0xd4c9, 0xd55f,
+	0xd5f5, 0xd689, 0xd71d, 0xd7b0, 0xd842, 0xd8d3, 0xd964, 0xd9f3,
+	0xda82, 0xdb0f, 0xdb9c, 0xdc28, 0xdcb3, 0xdd3d, 0xddc7, 0xde4f,
+	0xded7, 0xdf5d, 0xdfe3, 0xe068, 0xe0eb, 0xe16e, 0xe1f0, 0xe271,
+	0xe2f1, 0xe370, 0xe3ee, 0xe46b, 0xe4e8, 0xe563, 0xe5dd, 0xe656,
+	0xe6cf, 0xe746, 0xe7bc, 0xe831, 0xe8a6, 0xe919, 0xe98b, 0xe9fc,
+	0xea6d, 0xeadc, 0xeb4a, 0xebb7, 0xec23, 0xec8e, 0xecf8, 0xed61,
+	0xedc9, 0xee30, 0xee96, 0xeefa, 0xef5e, 0xefc1, 0xf022, 0xf083,
+	0xf0e2, 0xf140, 0xf19d, 0xf1f9, 0xf254, 0xf2ae, 0xf307, 0xf35e,
+	0xf3b5, 0xf40a, 0xf45f, 0xf4b2, 0xf504, 0xf555, 0xf5a5, 0xf5f3,
+	0xf641, 0xf68d, 0xf6d8, 0xf722, 0xf76b, 0xf7b3, 0xf7fa, 0xf83f,
+	0xf884, 0xf8c7, 0xf909, 0xf94a, 0xf989, 0xf9c8, 0xfa05, 0xfa41,
+	0xfa7c, 0xfab6, 0xfaee, 0xfb26, 0xfb5c, 0xfb91, 0xfbc5, 0xfbf8,
+	0xfc29, 0xfc59, 0xfc88, 0xfcb6, 0xfce3, 0xfd0e, 0xfd39, 0xfd62,
+	0xfd89, 0xfdb0, 0xfdd5, 0xfdfa, 0xfe1d, 0xfe3e, 0xfe5f, 0xfe7e,
+	0xfe9c, 0xfeb9, 0xfed5, 0xfeef, 0xff09, 0xff21, 0xff37, 0xff4d,
+	0xff61, 0xff74, 0xff86, 0xff97, 0xffa6, 0xffb4, 0xffc1, 0xffcd,
+	0xffd8, 0xffe1, 0xffe9, 0xfff0, 0xfff5, 0xfff9, 0xfffd, 0xfffe,
+	0xffff, 0xfffe, 0xfffd, 0xfff9, 0xfff5, 0xfff0, 0xffe9, 0xffe1,
+	0xffd8, 0xffcd, 0xffc1, 0xffb4, 0xffa6, 0xff97, 0xff86, 0xff74,
+	0xff61, 0xff4d, 0xff37, 0xff21, 0xff09, 0xfeef, 0xfed5, 0xfeb9,
+	0xfe9c, 0xfe7e, 0xfe5f, 0xfe3e, 0xfe1d, 0xfdfa, 0xfdd5, 0xfdb0,
+	0xfd89, 0xfd62, 0xfd39, 0xfd0e, 0xfce3, 0xfcb6, 0xfc88, 0xfc59,
+	0xfc29, 0xfbf8, 0xfbc5, 0xfb91, 0xfb5c, 0xfb26, 0xfaee, 0xfab6,
+	0xfa7c, 0xfa41, 0xfa05, 0xf9c8, 0xf989, 0xf94a, 0xf909, 0xf8c7,
+	0xf884, 0xf83f, 0xf7fa, 0xf7b3, 0xf76b, 0xf722, 0xf6d8, 0xf68d,
+	0xf641, 0xf5f3, 0xf5a5, 0xf555, 0xf504, 0xf4b2, 0xf45f, 0xf40a,
+	0xf3b5, 0xf35e, 0xf307, 0xf2ae, 0xf254, 0xf1f9, 0xf19d, 0xf140,
+	0xf0e2, 0xf083, 0xf022, 0xefc1, 0xef5e, 0xeefa, 0xee96, 0xee30,
+	0xedc9, 0xed61, 0xecf8, 0xec8e, 0xec23, 0xebb7, 0xeb4a, 0xeadc,
+	0xea6d, 0xe9fc, 0xe98b, 0xe919, 0xe8a6, 0xe831, 0xe7bc, 0xe746,
+	0xe6cf, 0xe656, 0xe5dd, 0xe563, 0xe4e8, 0xe46b, 0xe3ee, 0xe370,
+	0xe2f1, 0xe271, 0xe1f0, 0xe16e, 0xe0eb, 0xe068, 0xdfe3, 0xdf5d,
+	0xded7, 0xde4f, 0xddc7, 0xdd3d, 0xdcb3, 0xdc28, 0xdb9c, 0xdb0f,
+	0xda82, 0xd9f3, 0xd964, 0xd8d3, 0xd842, 0xd7b0, 0xd71d, 0xd689,
+	0xd5f5, 0xd55f, 0xd4c9, 0xd432, 0xd39a, 0xd302, 0xd268, 0xd1ce,
+	0xd133, 0xd097, 0xcffb, 0xcf5d, 0xcebf, 0xce20, 0xcd81, 0xcce0,
+	0xcc3f, 0xcb9d, 0xcafb, 0xca57, 0xc9b3, 0xc90f, 0xc869, 0xc7c3,
+	0xc71c, 0xc675, 0xc5cc, 0xc524, 0xc47a, 0xc3d0, 0xc325, 0xc279,
+	0xc1cd, 0xc121, 0xc073, 0xbfc5, 0xbf17, 0xbe67, 0xbdb7, 0xbd07,
+	0xbc56, 0xbba4, 0xbaf2, 0xba3f, 0xb98c, 0xb8d8, 0xb824, 0xb76f,
+	0xb6b9, 0xb603, 0xb54d, 0xb496, 0xb3de, 0xb326, 0xb26e, 0xb1b5,
+	0xb0fb, 0xb041, 0xaf87, 0xaecc, 0xae10, 0xad55, 0xac98, 0xabdc,
+	0xab1f, 0xaa61, 0xa9a3, 0xa8e5, 0xa826, 0xa767, 0xa6a7, 0xa5e8,
+	0xa527, 0xa467, 0xa3a6, 0xa2e5, 0xa223, 0xa161, 0xa09f, 0x9fdc,
+	0x9f19, 0x9e56, 0x9d93, 0x9ccf, 0x9c0b, 0x9b47, 0x9a82, 0x99bd,
+	0x98f8, 0x9833, 0x976d, 0x96a7, 0x95e1, 0x951b, 0x9455, 0x938e,
+	0x92c7, 0x9201, 0x9139, 0x9072, 0x8fab, 0x8ee3, 0x8e1b, 0x8d53,
+	0x8c8b, 0x8bc3, 0x8afb, 0x8a32, 0x896a, 0x88a1, 0x87d9, 0x8710,
+	0x8647, 0x857e, 0x84b6, 0x83ed, 0x8324, 0x825b, 0x8192, 0x80c9,
+	0x8000, 0x7f36, 0x7e6d, 0x7da4, 0x7cdb, 0x7c12, 0x7b49, 0x7a81,
+	0x79b8, 0x78ef, 0x7826, 0x775e, 0x7695, 0x75cd, 0x7504, 0x743c,
+	0x7374, 0x72ac, 0x71e4, 0x711c, 0x7054, 0x6f8d, 0x6ec6, 0x6dfe,
+	0x6d38, 0x6c71, 0x6baa, 0x6ae4, 0x6a1e, 0x6958, 0x6892, 0x67cc,
+	0x6707, 0x6642, 0x657d, 0x64b8, 0x63f4, 0x6330, 0x626c, 0x61a9,
+	0x60e6, 0x6023, 0x5f60, 0x5e9e, 0x5ddc, 0x5d1a, 0x5c59, 0x5b98,
+	0x5ad8, 0x5a17, 0x5958, 0x5898, 0x57d9, 0x571a, 0x565c, 0x559e,
+	0x54e0, 0x5423, 0x5367, 0x52aa, 0x51ef, 0x5133, 0x5078, 0x4fbe,
+	0x4f04, 0x4e4a, 0x4d91, 0x4cd9, 0x4c21, 0x4b69, 0x4ab2, 0x49fc,
+	0x4946, 0x4890, 0x47db, 0x4727, 0x4673, 0x45c0, 0x450d, 0x445b,
+	0x43a9, 0x42f8, 0x4248, 0x4198, 0x40e8, 0x403a, 0x3f8c, 0x3ede,
+	0x3e32, 0x3d86, 0x3cda, 0x3c2f, 0x3b85, 0x3adb, 0x3a33, 0x398a,
+	0x38e3, 0x383c, 0x3796, 0x36f0, 0x364c, 0x35a8, 0x3504, 0x3462,
+	0x33c0, 0x331f, 0x327e, 0x31df, 0x3140, 0x30a2, 0x3004, 0x2f68,
+	0x2ecc, 0x2e31, 0x2d97, 0x2cfd, 0x2c65, 0x2bcd, 0x2b36, 0x2aa0,
+	0x2a0a, 0x2976, 0x28e2, 0x284f, 0x27bd, 0x272c, 0x269b, 0x260c,
+	0x257d, 0x24f0, 0x2463, 0x23d7, 0x234c, 0x22c2, 0x2238, 0x21b0,
+	0x2128, 0x20a2, 0x201c, 0x1f97, 0x1f14, 0x1e91, 0x1e0f, 0x1d8e,
+	0x1d0e, 0x1c8f, 0x1c11, 0x1b94, 0x1b17, 0x1a9c, 0x1a22, 0x19a9,
+	0x1930, 0x18b9, 0x1843, 0x17ce, 0x1759, 0x16e6, 0x1674, 0x1603,
+	0x1592, 0x1523, 0x14b5, 0x1448, 0x13dc, 0x1371, 0x1307, 0x129e,
+	0x1236, 0x11cf, 0x1169, 0x1105, 0x10a1, 0x103e, 0xfdd, 0xf7c,
+	0xf1d, 0xebf, 0xe62, 0xe06, 0xdab, 0xd51, 0xcf8, 0xca1,
+	0xc4a, 0xbf5, 0xba0, 0xb4d, 0xafb, 0xaaa, 0xa5a, 0xa0c,
+	0x9be, 0x972, 0x927, 0x8dd, 0x894, 0x84c, 0x805, 0x7c0,
+	0x77b, 0x738, 0x6f6, 0x6b5, 0x676, 0x637, 0x5fa, 0x5be,
+	0x583, 0x549, 0x511, 0x4d9, 0x4a3, 0x46e, 0x43a, 0x407,
+	0x3d6, 0x3a6, 0x377, 0x349, 0x31c, 0x2f1, 0x2c6, 0x29d,
+	0x276, 0x24f, 0x22a, 0x205, 0x1e2, 0x1c1, 0x1a0, 0x181,
+	0x163, 0x146, 0x12a, 0x110, 0xf6, 0xde, 0xc8, 0xb2,
+	0x9e, 0x8b, 0x79, 0x68, 0x59, 0x4b, 0x3e, 0x32,
+	0x27, 0x1e, 0x16, 0xf, 0xa, 0x6, 0x2, 0x1,
+	0x0, 0x1, 0x2, 0x6, 0xa, 0xf, 0x16, 0x1e,
+	0x27, 0x32, 0x3e, 0x4b, 0x59, 0x68, 0x79, 0x8b,
+	0x9e, 0xb2, 0xc8, 0xde, 0xf6, 0x110, 0x12a, 0x146,
+	0x163, 0x181, 0x1a0, 0x1c1, 0x1e2, 0x205, 0x22a, 0x24f,
+	0x276, 0x29d, 0x2c6, 0x2f1, 0x31c, 0x349, 0x377, 0x3a6,
+	0x3d6, 0x407, 0x43a, 0x46e, 0x4a3, 0x4d9, 0x511, 0x549,
+	0x583, 0x5be, 0x5fa, 0x637, 0x676, 0x6b5, 0x6f6, 0x738,
+	0x77b, 0x7c0, 0x805, 0x84c, 0x894, 0x8dd, 0x927, 0x972,
+	0x9be, 0xa0c, 0xa5a, 0xaaa, 0xafb, 0xb4d, 0xba0, 0xbf5,
+	0xc4a, 0xca1, 0xcf8, 0xd51, 0xdab, 0xe06, 0xe62, 0xebf,
+	0xf1d, 0xf7c, 0xfdd, 0x103e, 0x10a1, 0x1105, 0x1169, 0x11cf,
+	0x1236, 0x129e, 0x1307, 0x1371, 0x13dc, 0x1448, 0x14b5, 0x1523,
+	0x1592, 0x1603, 0x1674, 0x16e6, 0x1759, 0x17ce, 0x1843, 0x18b9,
+	0x1930, 0x19a9, 0x1a22, 0x1a9c, 0x1b17, 0x1b94, 0x1c11, 0x1c8f,
+	0x1d0e, 0x1d8e, 0x1e0f, 0x1e91, 0x1f14, 0x1f97, 0x201c, 0x20a2,
+	0x2128, 0x21b0, 0x2238, 0x22c2, 0x234c, 0x23d7, 0x2463, 0x24f0,
+	0x257d, 0x260c, 0x269b, 0x272c, 0x27bd, 0x284f, 0x28e2, 0x2976,
+	0x2a0a, 0x2aa0, 0x2b36, 0x2bcd, 0x2c65, 0x2cfd, 0x2d97, 0x2e31,
+	0x2ecc, 0x2f68, 0x3004, 0x30a2, 0x3140, 0x31df, 0x327e, 0x331f,
+	0x33c0, 0x3462, 0x3504, 0x35a8, 0x364c, 0x36f0, 0x3796, 0x383c,
+	0x38e3, 0x398a, 0x3a33, 0x3adb, 0x3b85, 0x3c2f, 0x3cda, 0x3d86,
+	0x3e32, 0x3ede, 0x3f8c, 0x403a, 0x40e8, 0x4198, 0x4248, 0x42f8,
+	0x43a9, 0x445b, 0x450d, 0x45c0, 0x4673, 0x4727, 0x47db, 0x4890,
+	0x4946, 0x49fc, 0x4ab2, 0x4b69, 0x4c21, 0x4cd9, 0x4d91, 0x4e4a,
+	0x4f04, 0x4fbe, 0x5078, 0x5133, 0x51ef, 0x52aa, 0x5367, 0x5423,
+	0x54e0, 0x559e, 0x565c, 0x571a, 0x57d9, 0x5898, 0x5958, 0x5a17,
+	0x5ad8, 0x5b98, 0x5c59, 0x5d1a, 0x5ddc, 0x5e9e, 0x5f60, 0x6023,
+	0x60e6, 0x61a9, 0x626c, 0x6330, 0x63f4, 0x64b8, 0x657d, 0x6642,
+	0x6707, 0x67cc, 0x6892, 0x6958, 0x6a1e, 0x6ae4, 0x6baa, 0x6c71,
+	0x6d38, 0x6dfe, 0x6ec6, 0x6f8d, 0x7054, 0x711c, 0x71e4, 0x72ac,
+	0x7374, 0x743c, 0x7504, 0x75cd, 0x7695, 0x775e, 0x7826, 0x78ef,
+	0x79b8, 0x7a81, 0x7b49, 0x7c12, 0x7cdb, 0x7da4, 0x7e6d, 0x7f36
+};
+
+static struct vidtv_access_unit *vidtv_s302m_access_unit_init(struct vidtv_access_unit *head)
+{
+	struct vidtv_access_unit *au = kzalloc(sizeof(*au), GFP_KERNEL);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = au;
+	}
+
+	return au;
+}
+
+static void vidtv_s302m_access_unit_destroy(struct vidtv_encoder *e)
+{
+	struct vidtv_access_unit *head = e->access_units;
+	struct vidtv_access_unit *tmp = NULL;
+
+	while (head) {
+		tmp = head;
+		head = head->next;
+		kfree(tmp);
+	}
+
+	e->access_units = NULL;
+}
+
+static bool vidtv_s302m_is_block_start(const struct vidtv_encoder *e)
+{
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+
+	return !(ctx->nframes % S302M_BLOCK_SZ);
+}
+
+static void vidtv_s302m_alloc_au(struct vidtv_encoder *e)
+{
+	struct vidtv_access_unit *sync_au = NULL;
+	struct vidtv_access_unit *temp = NULL;
+
+	if (e->sync && e->sync->is_video_encoder) {
+		sync_au = e->sync->access_units;
+
+		while (sync_au) {
+			temp = vidtv_s302m_access_unit_init(e->access_units);
+			if (!e->access_units)
+				e->access_units = temp;
+
+			sync_au = sync_au->next;
+		}
+
+		return;
+	}
+
+	e->access_units = vidtv_s302m_access_unit_init(NULL);
+}
+
+static void
+vidtv_s302m_compute_sample_count_v(struct vidtv_encoder *e)
+{
+	struct vidtv_access_unit *au = e->access_units;
+	struct vidtv_access_unit *sync_au = e->sync->access_units;
+	u32 vau_duration_usecs;
+	u32 sample_duration_usecs;
+	u32 s;
+
+	vau_duration_usecs    = USEC_PER_SEC / e->sync->sampling_rate_hz;
+	sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
+
+	while (au && sync_au) {
+		s = DIV_ROUND_UP(vau_duration_usecs, sample_duration_usecs);
+		au->num_samples = s;
+		au = au->next;
+		sync_au = sync_au->next;
+	}
+}
+
+static void
+vidtv_s302m_compute_sample_count(struct vidtv_encoder *e,
+				 u64 elapsed_time_usecs)
+{
+	/* compute sample count for 'elapsed_time_usecs' */
+	u32 sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
+	struct vidtv_access_unit *au = e->access_units;
+
+	au->num_samples = (u32)div64_u64(elapsed_time_usecs, sample_duration_usecs);
+}
+
+static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
+{
+	u64 count = e->sample_count;
+	struct vidtv_access_unit *au = e->access_units;
+
+	while (au) {
+		count += au->num_samples;
+
+		au->pts = count *
+			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
+
+		au = au->next;
+	}
+}
+
+static void vidtv_s302m_compute_pts_v(struct vidtv_encoder *e)
+{
+	struct vidtv_access_unit *au = e->access_units;
+	struct vidtv_access_unit *sync_au = e->sync->access_units;
+
+	/* use the same pts from the video access unit*/
+	while (au && sync_au) {
+		au->pts = sync_au->pts;
+		au = au->next;
+		sync_au = sync_au->next;
+	}
+}
+
+static bool vidtv_s302m_get_c_bit(struct vidtv_encoder *e)
+{
+	/* see libavcodec/s302menc.c */
+	return vidtv_s302m_is_block_start(e);
+}
+
+static bool vidtv_s302m_get_f_bit(const struct vidtv_encoder *e)
+{
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+	bool is_block_start = vidtv_s302m_is_block_start(e);
+	bool f = is_block_start && ctx->is_subframe_a;
+
+	ctx->last_f = f;
+
+	return f;
+}
+
+static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
+{
+	u16 sample;
+
+	/* bug somewhere */
+	if (e->src_buf_offset > e->src_buf_sz) {
+		pr_err_ratelimited("overflow detected: %d > %d, wrapping.\n",
+				   e->src_buf_offset,
+				   e->src_buf_sz);
+
+		e->src_buf_offset = 0;
+	}
+
+	if (e->src_buf_offset >= e->src_buf_sz) {
+		/* let the source know we are out of data */
+		if (e->last_sample_cb)
+			e->last_sample_cb(e->sample_count);
+
+		e->src_buf_offset = 0;
+	}
+
+	sample = *(u16 *)(e->src_buf + e->src_buf_offset);
+
+	return sample;
+}
+
+static void vidtv_s302m_toggle_subframe(struct vidtv_encoder *e)
+{
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+
+	ctx->is_subframe_a = !ctx->is_subframe_a;
+}
+
+static u8 vidtv_s302m_get_preamble(struct vidtv_encoder *e)
+{
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+
+	bool is_block_start = vidtv_s302m_is_block_start(e);
+
+	if (!ctx->is_subframe_a)
+		return (ctx->last_f) ? PREAMBLE_Y_F1 : PREAMBLE_Y_F0;
+
+	if (is_block_start) {
+		if (ctx->last_f)
+			return PREAMBLE_Z_F1;
+
+		return PREAMBLE_Z_F0;
+	}
+
+	if (ctx->last_f)
+		return PREAMBLE_X_F1;
+
+	return PREAMBLE_X_F0;
+}
+
+static u32 vidtv_s302m_write_subframe(struct vidtv_encoder *e,
+				      struct vidtv_s302m_subframe_16 *f)
+{
+	u32 nbytes = 0;
+
+	nbytes += vidtv_memcpy(e->encoder_buf,
+			       e->encoder_buf_offset,
+			       VIDTV_S302M_BUF_SZ,
+			       f,
+			       sizeof(*f));
+
+	e->encoder_buf_offset += nbytes;
+
+	return nbytes;
+}
+
+static u32 vidtv_s302m_write_h(struct vidtv_encoder *e, u32 p_sz)
+{
+	struct vidtv_smpte_s302m_es h = {};
+	u32 nbytes = 0;
+
+	/* 2 channels, ident: 0, 16 bits per sample */
+	h.bitfield = cpu_to_be32((p_sz << 16));
+
+	nbytes += vidtv_memcpy(e->encoder_buf,
+			       e->encoder_buf_offset,
+			       e->encoder_buf_sz,
+			       &h,
+			       sizeof(h));
+
+	e->encoder_buf_offset += nbytes;
+	return nbytes;
+}
+
+static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
+{
+	u32 nbytes = 0;
+	u32 nbytes_per_unit = 0;
+	u32 au_sz = 0;
+
+	struct vidtv_access_unit *au = e->access_units;
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+	struct vidtv_s302m_subframe_16 a = {};
+	struct vidtv_s302m_subframe_16 b = {};
+
+	u8 preamble_a = 0; /* four bits sent per subframe */
+	u8 preamble_b = 0; /* four bits sent per subframe */
+	u8 preamble = 0;
+	u16 sample = 0;
+
+	u32 j;
+
+	u8 preamble_mask1;
+	u8 preamble_mask2;
+	bool preamble_first_half;
+
+	#ifdef BIG_ENDIAN
+	preamble_mask1 = GENMASK(4, 7);
+	preamble_mask2 = GENMASK(0, 3);
+	#else
+	preamble_mask1 = GENMASK(7, 4);
+	preamble_mask2 = GENMASK(3, 0);
+	#endif
+
+	vidtv_s302m_toggle_subframe(e); /* start with subframe 'A' */
+
+	while (au) {
+		/* stereo: each sample will generate two subframes */
+		au_sz = au->num_samples *
+			sizeof(struct vidtv_s302m_subframe_16) *
+			2;
+
+		/* account for the header size as well */
+		au_sz += sizeof(struct vidtv_smpte_s302m_es);
+
+		nbytes_per_unit = vidtv_s302m_write_h(e, au_sz);
+
+		preamble_first_half = true;
+
+		for (j = 0; j < au->num_samples; ++j) {
+			preamble_a = vidtv_s302m_get_preamble(e);
+			sample = vidtv_s302m_get_sample(e);
+
+			preamble = preamble_first_half ?
+				   (preamble_a & preamble_mask1) >> 4 :
+				   (preamble_a & preamble_mask2) >> 4;
+
+			a.bitfield = cpu_to_be32((preamble << 28) |
+						 (sample << 4) |
+						 (0x1 << 3) |
+						 (vidtv_s302m_get_c_bit(e) << 1) |
+						 vidtv_s302m_get_f_bit(e));
+
+			vidtv_s302m_toggle_subframe(e);
+
+			preamble_b = vidtv_s302m_get_preamble(e);
+
+			preamble = preamble_first_half ?
+				   (preamble_b & preamble_mask1) >> 4 :
+				   (preamble_b & preamble_mask2) >> 4;
+
+			b.bitfield = cpu_to_be32((preamble << 28) |
+						 (sample << 4) |
+						 (0x1 << 3) |
+						 (vidtv_s302m_get_c_bit(e) << 1) |
+						 vidtv_s302m_get_f_bit(e));
+
+			nbytes_per_unit += vidtv_s302m_write_subframe(e, &a);
+			nbytes_per_unit += vidtv_s302m_write_subframe(e, &b);
+			ctx->nframes++;
+
+			e->sample_count++;
+			e->src_buf_offset += sizeof(u16);
+
+			vidtv_s302m_toggle_subframe(e);
+
+			memset(&a, 0, sizeof(a));
+			memset(&b, 0, sizeof(b));
+
+			preamble_first_half = !preamble_first_half;
+		}
+
+		au->nbytes = nbytes_per_unit;
+
+		if (au_sz != nbytes_per_unit) {
+			pr_warn_ratelimited("write size was %d, expected %d\n",
+					    nbytes_per_unit,
+					    au_sz);
+		}
+
+		nbytes += nbytes_per_unit;
+		au->offset = nbytes - nbytes_per_unit;
+
+		nbytes_per_unit = 0;
+
+		au = au->next;
+	}
+}
+
+static void *vidtv_s302m_encode(struct vidtv_encoder *e, u64 elapsed_time)
+{
+	/*
+	 * According to SMPTE 302M, an audio access unit is specified as those
+	 * AES3 words that are associated with a corresponding video frame.
+	 * Therefore, there is one audio access unit for every video access unit
+	 * in the corresponding video encoder ('sync'), using the same values
+	 * for PTS as used by the video encoder.
+	 *
+	 * Assuming that it is also possible to send audio without any
+	 * associated video, as in a radio-like service, a single audio access unit
+	 * is created with enough audio data for 'elapsed_time'
+	 * The value of PTS is computed manually.
+	 */
+
+	if (!elapsed_time)
+		goto out;
+
+	vidtv_s302m_access_unit_destroy(e);
+	vidtv_s302m_alloc_au(e);
+
+	if (e->sync && e->sync->is_video_encoder) {
+		vidtv_s302m_compute_sample_count_v(e);
+		vidtv_s302m_compute_pts_v(e);
+	} else {
+		vidtv_s302m_compute_sample_count(e, elapsed_time);
+		vidtv_s302m_compute_pts(e);
+	}
+
+	vidtv_s302m_write_frames(e);
+
+out:
+	return e->encoder_buf;
+}
+
+static u32 vidtv_s302m_clear(struct vidtv_encoder *e)
+{
+	struct vidtv_access_unit *au = e->access_units;
+	u32 count = 0;
+
+	while (au) {
+		count++;
+		au = au->next;
+	}
+
+	vidtv_s302m_access_unit_destroy(e);
+	memset(e->encoder_buf, 0, VIDTV_S302M_BUF_SZ);
+	e->encoder_buf_offset = 0;
+
+	return count;
+}
+
+struct vidtv_encoder
+*vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args)
+{
+	struct vidtv_encoder *e = kzalloc(sizeof(*e), GFP_KERNEL);
+	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
+
+	e->id = S302M;
+
+	if (args.name)
+		e->name = kstrdup(args.name, GFP_KERNEL);
+
+	e->encoder_buf        = vzalloc(VIDTV_S302M_BUF_SZ);
+	e->encoder_buf_sz     = VIDTV_S302M_BUF_SZ;
+	e->encoder_buf_offset = 0;
+
+	e->sample_count          = 0;
+
+	e->src_buf        = (args.src_buf) ? args.src_buf : &s302m_sin_lut;
+	e->src_buf_sz     = (args.src_buf) ? args.src_buf_sz : S302M_SIN_LUT_NUM_ELEM * sizeof(u16);
+	e->src_buf_offset = 0;
+
+	e->is_video_encoder = false;
+	e->ctx   = kzalloc(priv_sz, GFP_KERNEL);
+
+	e->encode = vidtv_s302m_encode;
+	e->clear  = vidtv_s302m_clear;
+
+	e->es_pid = cpu_to_be16(args.es_pid);
+	e->stream_id = cpu_to_be16(PES_PRIVATE_STREAM_1);
+
+	e->sync                 = args.sync;
+	e->sampling_rate_hz     = S302M_SAMPLING_RATE_HZ;
+
+	/* wrap around 'src' if this is NULL */
+	e->last_sample_cb = args.last_sample_cb;
+
+	e->destroy = vidtv_s302m_encoder_destroy;
+
+	if (args.head) {
+		while (args.head->next)
+			args.head = args.head->next;
+
+		args.head->next = e;
+	}
+
+	e->next = NULL;
+
+	return e;
+}
+
+void vidtv_s302m_encoder_destroy(struct vidtv_encoder *e)
+{
+	if (e->id != S302M) {
+		pr_err_ratelimited("Encoder type mismatch, skipping.\n");
+		return;
+	}
+
+	vidtv_s302m_access_unit_destroy(e);
+	kfree(e->name);
+	vfree(e->encoder_buf);
+	kfree(e->ctx);
+	kfree(e);
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
new file mode 100644
index 000000000000..cb61a988f475
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the code for an AES3 (also known as AES/EBU) encoder.
+ * It is based on EBU Tech 3250 and SMPTE 302M technical documents.
+ *
+ * This encoder currently supports 16bit AES3 subframes using 16bit signed
+ * integers.
+ *
+ * Note: AU stands for Access Unit, and AAU stands for Audio Access Unit
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_S302M_H
+#define VIDTV_S302M_H
+
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#include "vidtv_encoder.h"
+
+/* see SMPTE 302M 2007 clause 7.3 */
+#define VIDTV_S302M_BUF_SZ 65024
+
+/* see ETSI TS 102 154 v.1.2.1 clause 7.3.5 */
+#define VIDTV_S302M_FORMAT_IDENTIFIER 0x42535344
+
+/**
+ * struct vidtv_s302m_ctx - s302m encoder context.
+ * @enc: A pointer to the containing encoder structure.
+ * @last_f: whether the F bit was set for the last sub-frame.
+ * @is_subframe_a: Whether we are writing an A subframe at the moment.
+ * @current_c_bit: The C bit to send in the current subframe.
+ */
+struct vidtv_s302m_ctx {
+	struct vidtv_encoder *enc;
+
+	bool last_f;
+	bool is_subframe_a;
+	u64 nframes;
+};
+
+/**
+ * struct vidtv_smpte_s302m_es - s302m MPEG Elementary Stream header.
+ *
+ * See SMPTE 302M 2007 table 1.
+ */
+struct vidtv_smpte_s302m_es {
+	/*
+	 *
+	 * audio_packet_size:16;
+	 * num_channels:2;
+	 * channel_identification:8;
+	 * bits_per_sample:2; // 0x0 for 16bits
+	 * zero:4;
+	 */
+	__be32 bitfield;
+} __packed;
+
+/**
+ * struct vidtv_s302m_subframe_16 - A 16 bit s302m subframe.
+ *
+ * See SMPTE 302M 2007 figure 3.
+ */
+struct vidtv_s302m_subframe_16 {
+	/*
+	 * u8 preamble:4;
+	 * u8 aux:4;
+	 * u8 zero:4;
+	 * data_word: 16 //little endian
+	 * v:1;
+	 * u:1;
+	 * c:1;
+	 * f:1;
+	 */
+	__be32 bitfield;
+} __packed;
+
+/**
+ * struct vidtv_s302m_encoder_init_args - Args for the s302m encoder.
+ *
+ * @name: A name to identify this particular instance
+ * @src_buf: The source buffer, encoder will default to a sine wave if this is NULL.
+ * @src_buf_sz: The size of the source buffer.
+ * @es_pid: The MPEG Elementary Stream PID to use.
+ * @sync: Attempt to synchronize audio with this video encoder, if not NULL.
+ * @last_sample_cb: A callback called when the encoder runs out of data.
+ */
+struct vidtv_s302m_encoder_init_args {
+	char *name;
+	void *src_buf;
+	u32 src_buf_sz;
+	u16 es_pid;
+	struct vidtv_encoder *sync;
+	void (*last_sample_cb)(u32 sample_no);
+
+	/* optionally chain to this encoder */
+	struct vidtv_encoder *head;
+};
+
+struct vidtv_encoder
+*vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args);
+
+void vidtv_s302m_encoder_destroy(struct vidtv_encoder *encoder);
+
+#endif /* VIDTV_S302M_H */
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
new file mode 100644
index 000000000000..190b9e4438dc
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/types.h>
+#include <linux/math64.h>
+#include <asm/byteorder.h>
+
+#include "vidtv_ts.h"
+#include "vidtv_common.h"
+
+static u32 vidtv_ts_write_pcr_bits(u8 *to, u32 to_offset, u64 pcr)
+{
+	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
+	u64 div;
+	u64 rem;
+	u8 *buf = to + to_offset;
+	u64 pcr_low;
+	u64 pcr_high;
+
+	div = div64_u64_rem(pcr, 300, &rem);
+
+	pcr_low = rem; /* pcr_low = pcr % 300 */
+	pcr_high = div; /* pcr_high = pcr / 300 */
+
+	*buf++ = pcr_high >> 25;
+	*buf++ = pcr_high >> 17;
+	*buf++ = pcr_high >>  9;
+	*buf++ = pcr_high >>  1;
+	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
+	*buf++ = pcr_low;
+
+	return 6;
+}
+
+void vidtv_ts_inc_cc(u8 *continuity_counter)
+{
+	++*continuity_counter;
+	if (*continuity_counter > TS_CC_MAX_VAL)
+		*continuity_counter = 0;
+}
+
+u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
+{
+	u32 nbytes = 0;
+	struct vidtv_mpeg_ts ts_header = {};
+
+	ts_header.sync_byte          = TS_SYNC_BYTE;
+	ts_header.bitfield           = cpu_to_be16(TS_NULL_PACKET_PID);
+	ts_header.payload            = 1;
+	ts_header.continuity_counter = *args.continuity_counter;
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	vidtv_ts_inc_cc(args.continuity_counter);
+
+	/* fill the rest with empty data */
+	nbytes += vidtv_memset(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       TS_FILL_BYTE,
+			       TS_PACKET_LEN - nbytes);
+
+	/* we should have written exactly _one_ 188byte packet */
+	if (nbytes != TS_PACKET_LEN)
+		pr_warn_ratelimited("Expected exactly %d bytes, got %d\n",
+				    TS_PACKET_LEN,
+				    nbytes);
+
+	return nbytes;
+}
+
+u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
+{
+	u32 nbytes = 0;
+	struct vidtv_mpeg_ts ts_header = {};
+	struct vidtv_mpeg_ts_adaption ts_adap = {};
+
+	ts_header.sync_byte     = TS_SYNC_BYTE;
+	ts_header.bitfield      = cpu_to_be16(args.pid);
+	ts_header.scrambling    = 0;
+	/* cc is not incremented, but it is needed. see 13818-1 clause 2.4.3.3 */
+	ts_header.continuity_counter = *args.continuity_counter;
+	ts_header.payload            = 0;
+	ts_header.adaptation_field   = 1;
+
+	/* 13818-1 clause 2.4.3.5 */
+	ts_adap.length = 183;
+	ts_adap.PCR    = 1;
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	/* write the adap after the TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_adap,
+			       sizeof(ts_adap));
+
+	/* write the PCR optional */
+	nbytes += vidtv_ts_write_pcr_bits(args.dest_buf,
+					  args.dest_offset + nbytes,
+					  args.pcr);
+
+	nbytes += vidtv_memset(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       TS_FILL_BYTE,
+			       TS_PACKET_LEN - nbytes);
+
+	/* we should have written exactly _one_ 188byte packet */
+	if (nbytes != TS_PACKET_LEN)
+		pr_warn_ratelimited("Expected exactly %d bytes, got %d\n",
+				    TS_PACKET_LEN,
+				    nbytes);
+
+	return nbytes;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
new file mode 100644
index 000000000000..7d46f48737b6
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Copyright (C) 2020 Daniel W. S. Almeida
+ */
+
+#ifndef VIDTV_TS_H
+#define VIDTV_TS_H
+
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#define TS_SYNC_BYTE 0x47
+#define TS_PACKET_LEN 188
+#define TS_PAYLOAD_LEN 184
+#define TS_NULL_PACKET_PID 0x1fff
+#define TS_CC_MAX_VAL 0x0f /* 4 bits */
+#define TS_LAST_VALID_PID 8191
+#define TS_FILL_BYTE 0xff /* the byte used in packet stuffing */
+
+struct vidtv_mpeg_ts_adaption {
+	u8 length;
+	struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 extension:1;
+		u8 private_data:1;
+		u8 splicing_point:1;
+		u8 OPCR:1;
+		u8 PCR:1;
+		u8 priority:1;
+		u8 random_access:1;
+		u8 discontinued:1;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 discontinued:1;
+		u8 random_access:1;
+		u8 priority:1;
+		u8 PCR:1;
+		u8 OPCR:1;
+		u8 splicing_point:1;
+		u8 private_data:1;
+		u8 extension:1;
+#else
+#error  "Unknown bitfield ordering"
+#endif
+	} __packed;
+	u8 data[];
+} __packed;
+
+struct vidtv_mpeg_ts {
+	u8 sync_byte;
+	__be16 bitfield; /* tei: 1, payload_start:1 priority: 1, pid:13 */
+	struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 continuity_counter:4;
+		u8 payload:1;
+		u8 adaptation_field:1;
+		u8 scrambling:2;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 scrambling:2;
+		u8 adaptation_field:1;
+		u8 payload:1;
+		u8 continuity_counter:4;
+#else
+#error  "Unknown bitfield ordering"
+#endif
+	} __packed;
+	struct vidtv_mpeg_ts_adaption adaption[];
+} __packed;
+
+/**
+ * struct pcr_write_args - Arguments for the pcr_write_into function.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: The byte offset into the buffer.
+ * @pid: The TS PID for the PCR packets.
+ * @buf_sz: The size of the buffer in bytes.
+ * @countinuity_counter: The TS continuity_counter.
+ * @pcr: A sample from the system clock.
+ */
+struct pcr_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u16 pid;
+	u32 buf_sz;
+	u8 *continuity_counter;
+	u64 pcr;
+};
+
+/**
+ * struct null_packet_write_args - Arguments for the null_write_into function
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: The byte offset into the buffer.
+ * @buf_sz: The size of the buffer in bytes.
+ * @countinuity_counter: The TS continuity_counter.
+ */
+struct null_packet_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 buf_sz;
+	u8 *continuity_counter;
+};
+
+/* Increment the continuity counter */
+void vidtv_ts_inc_cc(u8 *continuity_counter);
+
+/**
+ * vidtv_ts_null_write_into - Write a TS null packet into a buffer.
+ * @args: the arguments to use when writing.
+ *
+ * This function will write a null packet into a buffer. This is usually used to
+ * pad TS streams.
+ *
+ * Return: The number of bytes written into the buffer.
+ */
+u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
+
+/**
+ * vidtv_ts_pcr_write_into - Write a PCR  packet into a buffer.
+ * @args: the arguments to use when writing.
+ *
+ * This function will write a PCR packet into a buffer. This is used to
+ * synchronize the clocks between encoders and decoders.
+ *
+ * Return: The number of bytes written into the buffer.
+ */
+u32 vidtv_ts_pcr_write_into(struct pcr_write_args args);
+
+#endif //VIDTV_TS_H
--
2.28.0

