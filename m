Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC831DAB7D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgETHEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgETHE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:04:26 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5F6C061A0E;
        Wed, 20 May 2020 00:04:26 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id v15so851762qvr.8;
        Wed, 20 May 2020 00:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hq3/Tdxg34paqXMw3ZQ5R+wveIJ625rgUg1aPE47IHE=;
        b=nf4BRmPh0fxi5JIk7e1nFgdwTYxjVawUJnNITzzumlFlEjaz8Zg2+jtqFctle0ey6k
         fd6Fx/mkw7hmju6cb9RgZdOma2pjYFIOIEgi5cNCS17eiRkWlUEh7ga7EZi2fB/1Cg0y
         C3pgHFqZ6NF83FCKL+jY6Ec3kY14kEX1pnNW5vMkCx96tkRa1KTvbGRQbE4FjlG5IuXe
         5Ey42bBFatYrkas7c6akQewSOaV2jD/jYy7g3WnCD4nVeJMROPt10+99gJfEKCtD8871
         tBD+jVzsO1gkj2EmzqUkVV5F3Hcu2OO2691VnX2cbFgaAcVpL6CzpqKBfk1zu1fcRX2J
         e4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hq3/Tdxg34paqXMw3ZQ5R+wveIJ625rgUg1aPE47IHE=;
        b=H8+f5+J99ksOymhXuapJrE5B0/QdpzfIm2iUWe944ddxKQ8vejN+oDLcpzQOcV8k8q
         45ORyU5VVXkDRVwIVebSJz6y9shoVHbSt9iJ0Yw2BlnqZkr6ORe9Hgz/E40FI0Z4NaAi
         b0SokZxkbEw56igI3OIw/1mbZfFvpfi8Sy4PJf5x23sLuVoIb6HMkVmWcA281eA+yrHq
         X5ZrGDIXddnNAjUP4yQmu80o8Ao9Z+5bvt579/ddGsIXZxcGnu9dqSp0celG2e7JPTkF
         yhH/lsBnRo6JrOR6E86yOkyfnOWycYVXoHx4Fq/h9FnSafYIW0Kn8l2qZ+Q7lhTQrddD
         blCg==
X-Gm-Message-State: AOAM531cvU/1+8uM0MGgGZTrNEzwsaQExPT81Oxh1esc+FZVWv6Ntrt8
        l0GA0DMnRJ3zaFS/wVtQmWU=
X-Google-Smtp-Source: ABdhPJxyzVDGRP7BnYWjplR9fTgQrX52oM8h+L4sHFIyTWKc2jg4Fp8L5sSbLQYmfj3SbMhm5cV3fQ==
X-Received: by 2002:a0c:fe88:: with SMTP id d8mr3324874qvs.208.1589958264924;
        Wed, 20 May 2020 00:04:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 00:04:24 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v6 10/10] media: vidtv: Add a MPEG Transport Stream Multiplexer
Date:   Wed, 20 May 2020 04:03:34 -0300
Message-Id: <20200520070334.1778751-11-dwlsalmeida@gmail.com>
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

Add a MPEG Transport Stream multiplexer responsible for polling encoders,
interleaving packets, padding the resulting stream with NULL packets if
necessary and then delivering the resulting TS packets to the bridge
driver so it can feed the demux.

This patch includes a "channel" abstraction, which attempts to map a
MPEG service into a struct that vidtv can work with.

When vidtv boots, it will create some hardcoded channels:

-Their services will be concatenated to populate the SDT.
-Their programs will be concatenated to populate the PAT
-For each program in the PAT, a PMT section will be created
-The PMT section for a channel will be assigned its streams.
-Every stream will have its corresponding encoder polled to produce TS packets
-These packets may be interleaved by the mux and then delivered to the bridg

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile     |   3 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  76 +++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   2 +
 .../media/test-drivers/vidtv/vidtv_channel.c  | 339 ++++++++++++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |  66 +++
 .../media/test-drivers/vidtv/vidtv_common.h   |   3 +
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 434 ++++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  | 105 +++++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  |  18 +
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |   5 +
 10 files changed, 1050 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index c99cd13f4adaf..330089e3b70c3 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -2,7 +2,8 @@
 
 dvb-vidtv-tuner-objs := vidtv_tuner.o
 dvb-vidtv-demod-objs := vidtv_demod.o
-dvb-vidtv-bridge-objs := vidtv_bridge.o
+dvb-vidtv-bridge-objs := vidtv_bridge.o vidtv_common.o vidtv_ts.o vidtv_psi.o \
+			 vidtv_pes.o vidtv_s302m.o vidtv_channel.o vidtv_mux.o
 
 obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o \
 			   dvb-vidtv-bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index bc1c612c23013..6e0589258d52c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -20,7 +20,11 @@
 #include "vidtv_bridge.h"
 #include "vidtv_demod.h"
 #include "vidtv_tuner.h"
+#include "vidtv_ts.h"
+#include "vidtv_mux.h"
 
+#define TS_BUF_MAX_SZ (128 * TS_PACKET_LEN)
+#define TS_BUF_MIN_SZ (20 * TS_PACKET_LEN)
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 
@@ -64,6 +68,56 @@ MODULE_PARM_DESC(max_frequency_shift_hz,
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nums);
 
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
+static unsigned int ts_buf_sz_pkts = 20;
+module_param(ts_buf_sz_pkts, uint, 0);
+MODULE_PARM_DESC(ts_buf_sz_pkts, "Size for the TS buffer in multiples of 188 bytes");
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
 static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 {
 	if (dvb->streaming) {
@@ -72,12 +126,14 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 	}
 
 	dvb->streaming = true;
+	vidtv_mux_start_thread(dvb->mux);
 	return 0;
 }
 
 static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
 {
 	dvb->streaming = false;
+	vidtv_mux_stop_thread(dvb->mux);
 
 	return 0;
 }
@@ -340,6 +396,8 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct vidtv_dvb *dvb;
+	struct vidtv_mux_init_args mux_args = {0};
+	u32    ts_buf_sz                    = ts_buf_sz_pkts * TS_PACKET_LEN;
 
 	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
 	if (!dvb)
@@ -355,6 +413,22 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dvb);
 
+	if (ts_buf_sz < TS_BUF_MIN_SZ)
+		ts_buf_sz = TS_BUF_MIN_SZ;
+
+	if (ts_buf_sz > TS_BUF_MAX_SZ)
+		ts_buf_sz = TS_BUF_MAX_SZ;
+
+	mux_args.mux_rate_kbytes_sec         = mux_rate_kbytes_sec;
+	mux_args.on_new_packets_available_cb = vidtv_bridge_on_new_pkts_avail;
+	mux_args.ts_buf_sz                   = ts_buf_sz;
+	mux_args.pcr_period_usecs            = pcr_period_msec * 1000;
+	mux_args.si_period_usecs             = si_period_msec * 1000;
+	mux_args.pcr_pid                     = pcr_pid;
+	mux_args.priv                        = dvb;
+
+	dvb->mux = vidtv_mux_init(mux_args);
+
 	return ret;
 
 err_dvb:
@@ -369,6 +443,8 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 
 	dvb = platform_get_drvdata(pdev);
 
+	vidtv_mux_destroy(dvb->mux);
+
 	mutex_destroy(&dvb->feed_lock);
 
 	for (i = 0; i < NUM_FE; ++i)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index 4931bfb73273c..aac1da13a50aa 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -18,6 +18,7 @@
 #include <media/dmxdev.h>
 #include <media/dvb_demux.h>
 #include <media/dvb_frontend.h>
+#include "vidtv_mux.h"
 
 struct vidtv_dvb {
 	struct platform_device *pdev;
@@ -34,6 +35,7 @@ struct vidtv_dvb {
 	struct mutex feed_lock; /* start/stop feed */
 
 	bool streaming;
+	struct vidtv_mux *mux;
 };
 
 #endif // VIDTV_BRIDG_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
new file mode 100644
index 0000000000000..c49426f67a680
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -0,0 +1,339 @@
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
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
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
+
+	while (curr) {
+		/* forward the call to the derived type */
+		curr->destroy(curr);
+		curr = curr->next;
+	}
+}
+
+static struct vidtv_channel
+*vidtv_channel_s302m_init(struct vidtv_channel *head)
+{
+	/* init an audio only channel with a s302m encoder */
+	const u16 s302m_service_id          = 0x880;
+	const u16 s302m_program_num         = 0x880;
+	const u16 s302m_program_pid         = 0x101; /* packet id for PMT*/
+	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
+	const u16 s302m_pes_audio_stream_id = 0xbd;  /* PES: private_stream_1 */
+
+	struct vidtv_channel *s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
+	struct vidtv_psi_table_sdt_service *s302m_service;
+	struct vidtv_psi_desc_service *s302m_s_desc;
+	struct vidtv_s302m_encoder_init_args encoder_args = {};
+
+	s302m_service = vidtv_psi_sdt_service_init(NULL, s302m_service_id);
+
+	s302m_s_desc = (struct vidtv_psi_desc_service *)
+		       vidtv_psi_desc_init(NULL,
+					   SERVICE_DESCRIPTOR,
+					   sizeof(*s302m_s_desc));
+
+	s302m_s_desc->name         = "Sine Wave PCM Audio";
+	s302m_s_desc->service_type = DIGITAL_TELEVISION_SERVICE;
+
+	s302m_s_desc->length = sizeof(s302m_s_desc->service_type)
+			       + strlen(s302m_s_desc->name)
+			       + strlen(s302m_s_desc->name_emph)
+			       + strlen(s302m_s_desc->provider)
+			       + strlen(s302m_s_desc->provider_emph);
+
+	vidtv_psi_desc_assign(&s302m_service->descriptor,
+			      (struct vidtv_psi_desc *)
+			      s302m_s_desc);
+
+	s302m->transport_stream_id = TRANSPORT_STREAM_ID;
+
+	s302m->program = vidtv_psi_pat_program_init(NULL,
+						    s302m_service_id,
+						    s302m_program_pid);
+
+	s302m->program_num = s302m_program_num;
+
+	s302m->streams = vidtv_psi_pmt_stream_init(NULL,
+						   STREAM_PRIVATE_DATA,
+						   s302m_pes_audio_stream_id);
+
+	encoder_args.access_unit_capacity = 16;
+	encoder_args.es_pid               = s302m_es_pid;
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
+*vidtv_channel_sdt_serv_cat_into_new(struct vidtv_channel *channels)
+{
+	struct vidtv_channel *cur_chnl           = channels;
+	struct vidtv_psi_table_sdt_service *curr = NULL;
+	struct vidtv_psi_table_sdt_service *head = NULL;
+	struct vidtv_psi_table_sdt_service *tail = NULL;
+	u16 service_id;
+
+	while (cur_chnl) {
+		curr       = cur_chnl->service;
+		service_id = be16_to_cpu(curr->service_id);
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = vidtv_psi_sdt_service_init(tail, service_id);
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
+vidtv_channel_pat_prog_cat_into_new(struct vidtv_channel *channels)
+{
+	struct vidtv_channel *cur_chnl           = channels;
+	struct vidtv_psi_table_pat_program *curr = NULL;
+	struct vidtv_psi_table_pat_program *head = NULL;
+	struct vidtv_psi_table_pat_program *tail = NULL;
+	u16 serv_id;
+
+	while (cur_chnl) {
+		curr = cur_chnl->program;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			serv_id = be16_to_cpu(curr->service_id);
+			tail = vidtv_psi_pat_program_init(tail,
+							  serv_id,
+							  curr->pid);
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
+				 struct vidtv_psi_table_pmt sections[],
+				 u32 nsections)
+{
+	struct vidtv_psi_table_pmt *curr_section = NULL;
+	struct vidtv_channel *cur_chnl           = channels;
+	u32 j;
+	u16 c_id;
+
+	while (cur_chnl) {
+		for (j = 0; j < nsections; ++j) {
+			curr_section = &sections[j];
+
+			if (!curr_section)
+				continue;
+
+			c_id = be16_to_cpu(curr_section->header.id);
+
+			/* we got a match */
+			if (c_id == cur_chnl->program_num) {
+				vidtv_psi_pmt_stream_assign(curr_section,
+							    cur_chnl->streams);
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
+	struct vidtv_psi_table_pat *pat = m->si.pat;
+	struct vidtv_psi_table_sdt *sdt = m->si.sdt;
+
+	struct vidtv_psi_table_pmt *pmt_sections = m->si.pmt_secs;
+
+	struct vidtv_psi_table_pat_program *programs = NULL;
+	struct vidtv_psi_table_sdt_service *services = NULL;
+
+	bool update_version_num = false;
+
+	vidtv_psi_pat_table_init(pat,
+				 update_version_num,
+				 TRANSPORT_STREAM_ID);
+
+	vidtv_psi_sdt_table_init(sdt,
+				 update_version_num,
+				 TRANSPORT_STREAM_ID);
+
+	programs = vidtv_channel_pat_prog_cat_into_new(m->channels);
+	services = vidtv_channel_sdt_serv_cat_into_new(m->channels);
+
+	/* assemble all programs and assign to PAT */
+	vidtv_psi_pat_program_assign(pat, programs);
+
+	/* assemble all services and assign to SDT */
+	vidtv_psi_sdt_service_assign(sdt, services);
+
+	/* a section for each program_id */
+	pmt_sections = kcalloc(pat->programs,
+			       sizeof(struct vidtv_psi_table_pmt),
+			       GFP_KERNEL);
+
+	vidtv_psi_pmt_create_sec_for_each_pat_entry(pat,
+						    pmt_sections);
+
+	vidtv_channel_pmt_match_sections(m->channels,
+					 pmt_sections,
+					 pat->programs);
+}
+
+void vidtv_channel_si_destroy(struct vidtv_mux *m)
+{
+	u32 i;
+
+	vidtv_psi_pat_table_destroy(m->si.pat);
+
+	for (i = 0; i < m->si.num_pmt_sections; ++i)
+		vidtv_psi_pmt_table_destroy(&m->si.pmt_secs[i]);
+
+	kfree(m->si.pmt_secs);
+	vidtv_psi_sdt_table_destroy(m->si.sdt);
+}
+
+void vidtv_channels_init(struct vidtv_mux *m)
+{
+	/* we only have a single channel for now */
+	m->channels = vidtv_channel_s302m_init(NULL);
+}
+
+void vidtv_channels_destroy(struct vidtv_mux *m)
+{
+	struct vidtv_channel *curr = m->channels;
+
+	while (curr) {
+		vidtv_psi_sdt_service_destroy(curr->service);
+		vidtv_psi_pat_program_destroy(curr->program);
+		vidtv_psi_pmt_stream_destroy(curr->streams);
+		vidtv_channel_encoder_destroy(curr->encoders);
+		curr = curr->next;
+	}
+}
+
+static void
+vidtv_channels_add_registration_s302m(struct vidtv_psi_table_pmt *sec)
+{
+	struct vidtv_psi_desc_registration *s302m_r_desc;
+
+	/* there might be some descriptors there already */
+	struct vidtv_psi_desc *parent = sec->descriptor;
+
+	s302m_r_desc = (struct vidtv_psi_desc_registration *)
+			vidtv_psi_desc_init(parent,
+					    REGISTRATION_DESCRIPTOR,
+					    sizeof(*s302m_r_desc));
+
+	s302m_r_desc->format_id = cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER);
+
+	if (!parent)
+		vidtv_psi_desc_assign(&sec->descriptor,
+				      (struct vidtv_psi_desc *)s302m_r_desc);
+
+	/* we are adding to the table, so recompute the length */
+	vidtv_psi_pmt_table_comp_sec_len(sec);
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
+			continue;
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
+
+		cur_chnl = cur_chnl->next;
+	}
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.h b/drivers/media/test-drivers/vidtv/vidtv_channel.h
new file mode 100644
index 0000000000000..02141c4c732f0
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -0,0 +1,66 @@
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
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
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
+struct vidtv_channel {
+	/* a number to identify the TS, chosen at will */
+	u16 transport_stream_id;
+
+	/* will be concatenated into the SDT */
+	struct vidtv_psi_table_sdt_service *service;
+
+	/* the link between SDT, PAT and PMT */
+	u16 program_num;
+
+	/*
+	 * a single program with one or more streams associated with it.
+	 * Will be concatenated into the PAT
+	 */
+	struct vidtv_psi_table_pat_program *program;
+
+	/*
+	 * one or more streams associated with the program
+	 * Will populate the PMT section for this program
+	 */
+	struct vidtv_psi_table_pmt_stream *streams;
+
+	/* a list of encoders, one for each stream */
+	struct vidtv_encoder *encoders;
+
+	struct vidtv_channel *next;
+};
+
+/* init SI data from the channels */
+void vidtv_channel_si_init(struct vidtv_mux *m);
+void vidtv_channel_si_destroy(struct vidtv_mux *m);
+
+void vidtv_channels_init(struct vidtv_mux *m);
+void vidtv_channels_destroy(struct vidtv_mux *m);
+
+void vidtv_channels_add_registration_descs(struct vidtv_mux *m);
+
+#endif //VIDTV_CHANNEL_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
index a0480825b23a9..a13e9331955a7 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -13,6 +13,9 @@
 #include <linux/types.h>
 
 #define CLOCK_UNIT_90KHZ 90000
+#define CLOCK_UNIT_27MHZ 27000000
+#define SLEEP_USECS 10000
+#define TRANSPORT_STREAM_ID 0x744
 
 u32 vidtv_memcpy(void *to,
 		 size_t to_offset,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
new file mode 100644
index 0000000000000..c9484c491a977
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the multiplexer logic for TS packets from different
+ * elementary streams
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
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
+
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
+		vidtv_mux_create_pid_ctx_once(m, p->pid);
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
+	u32 initial_offset = m->ts_buf_offset;
+	struct vidtv_mux_pid_ctx *pat_ctx;
+	struct vidtv_mux_pid_ctx *pmt_ctx;
+	struct vidtv_mux_pid_ctx *sdt_ctx;
+	u32 nbytes; /* the number of bytes written by this function */
+	u16 pmt_pid;
+	u32 i;
+
+	pat_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_PAT_PID);
+	sdt_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_SDT_PID);
+
+	m->ts_buf_offset += vidtv_psi_pat_write_into(m->ts_buf,
+						     m->ts_buf_offset,
+						     m->si.pat,
+						     m->ts_buf_sz,
+						     &pat_ctx->cc);
+
+	for (i = 0; i < m->si.num_pmt_sections; ++i) {
+		pmt_pid = vidtv_psi_pmt_get_pid(&m->si.pmt_secs[i],
+						m->si.pat);
+
+		if (pmt_pid > TS_LAST_VALID_PID) {
+			pr_warn_ratelimited("PID: %d not found\n", pmt_pid);
+			continue;
+		}
+
+		pmt_ctx = vidtv_mux_get_pid_ctx(m, pmt_pid);
+
+		/* write each section into buffer */
+		m->ts_buf_offset += vidtv_psi_pmt_write_into(m->ts_buf,
+							     m->ts_buf_offset,
+							     &m->si.pmt_secs[i],
+							     pmt_pid,
+							     m->ts_buf_sz,
+							     &pmt_ctx->cc);
+	}
+
+	m->ts_buf_offset += vidtv_psi_sdt_write_into(m->ts_buf,
+						     m->ts_buf_offset,
+						     m->si.sdt,
+						     m->ts_buf_sz,
+						     &sdt_ctx->cc);
+
+	nbytes = m->ts_buf_offset - initial_offset;
+	return nbytes;
+}
+
+static u32 vidtv_mux_push_pcr(struct vidtv_mux *m)
+{
+	struct pcr_write_args args = {};
+	struct vidtv_mux_pid_ctx *ctx;
+
+	ctx                     = vidtv_mux_get_pid_ctx(m, m->pcr_pid);
+	args.dest_buf           = m->ts_buf;
+	args.pid                = m->pcr_pid;
+	args.buf_sz             = m->ts_buf_sz;
+	args.continuity_counter = &ctx->cc;
+
+	/* the 27Mhz clock will feed both parts of the PCR bitfield */
+	args.pcr = m->timing.clk;
+
+	return vidtv_ts_pcr_write_into(args);
+}
+
+static bool vidtv_mux_should_push_pcr(struct vidtv_mux *m)
+{
+	u64 next_pcr_at;
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
+	/* the number of bytes written by this function */
+	u32    nbytes              = 0;
+	struct pes_write_args args = {};
+	u32    initial_offset      = m->ts_buf_offset;
+
+	u32 i;
+	u8 *buf;
+	struct vidtv_mux_pid_ctx *pid_ctx;
+
+	pid_ctx = vidtv_mux_create_pid_ctx_once(m, e->es_pid);
+
+	args.dest_buf           = m->ts_buf;
+	args.dest_buf_sz        = m->ts_buf_sz;
+	args.pid                = e->es_pid;
+	args.is_s302m_pkt       = (e->id == S302M);
+	args.continuity_counter = &pid_ctx->cc;
+	args.send_pts           = true;
+
+	for (i = 0; i < e->nunits; ++i) {
+		buf                  = e->encoder_buf + e->offsets[i];
+		args.from            = buf;
+		args.access_unit_len = e->nbytes[i];
+		args.dest_offset     = m->ts_buf_offset;
+		args.pts             = e->pts[i];
+
+		m->ts_buf_offset += vidtv_pes_write_into(args);
+	}
+
+	/* clear the encoder state once we have written the current ES data */
+	e->clear(e);
+
+	nbytes = m->ts_buf_offset - initial_offset;
+	return nbytes;
+}
+
+static u32 vidtv_mux_poll_encoders(struct vidtv_mux *m)
+{
+	u32    nbytes                  = 0;
+	struct vidtv_channel *cur_chnl = m->channels;
+	struct vidtv_encoder *e        = NULL;
+
+	u64    elapsed_time_usecs = jiffies_to_usecs(m->timing.current_jiffies -
+						     m->timing.past_jiffies);
+	while (cur_chnl) {
+		e = cur_chnl->encoders;
+
+		while (e) {
+			/* encode for 'elapsed_time_usecs' */
+			e->encode(e, elapsed_time_usecs);
+			/* get the TS packets into the mux buffer */
+			nbytes += vidtv_mux_packetize_access_units(m, e);
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
+	u32    initial_offset              = m->ts_buf_offset;
+	u32 nbytes; /* the number of bytes written by this function */
+	u32 i;
+	struct vidtv_mux_pid_ctx *ctx;
+
+	ctx = vidtv_mux_get_pid_ctx(m, TS_NULL_PACKET_PID);
+
+	args.dest_buf           = m->ts_buf;
+	args.buf_sz             = m->ts_buf_sz;
+	args.continuity_counter = &ctx->cc;
+	args.dest_offset        = m->ts_buf_offset;
+
+	for (i = 0; i < npkts; ++i) {
+		m->ts_buf_offset += vidtv_ts_null_write_into(args);
+		args.dest_offset  = m->ts_buf_offset;
+	}
+
+	nbytes = m->ts_buf_offset - initial_offset;
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
+	u64 elapsed_time_usecs = jiffies_to_usecs(m->timing.current_jiffies -
+						  m->timing.past_jiffies);
+
+	nbytes_expected  = (m->mux_rate_kbytes_sec / 1000) / USEC_PER_SEC;
+	nbytes_expected *= elapsed_time_usecs;
+
+	nbytes_streamed = m->num_streamed_pkts * TS_PACKET_LEN;
+
+	if (nbytes_streamed < nbytes_expected) {
+		/* can't write half a packet: roundup to a 188 multiple */
+		nbytes_expected  = roundup(nbytes_expected, TS_PACKET_LEN);
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
+	memset(m->ts_buf, 0, m->ts_buf_sz);
+	/* point to the beginning of the buffer again */
+	m->ts_buf_offset = 0;
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
+
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
+						       m->ts_buf,
+						       npkts);
+
+		m->num_streamed_pkts += npkts;
+		vidtv_mux_clear(m);
+
+		usleep_range(SLEEP_USECS, 2 * SLEEP_USECS);
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
+	m->streaming            = true;
+	m->timing.start_jiffies = get_jiffies_64();
+	schedule_work(&m->mpeg_thread);
+}
+
+void vidtv_mux_stop_thread(struct vidtv_mux *m)
+{
+	/* thread will quit */
+	m->streaming = false;
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
+	m->ts_buf    = vzalloc(args.ts_buf_sz);
+	m->ts_buf_sz = args.ts_buf_sz;
+
+	m->si.pat = kzalloc(sizeof(*m->si.pat), GFP_KERNEL);
+	m->si.sdt = kzalloc(sizeof(*m->si.sdt), GFP_KERNEL);
+
+	vidtv_channels_init(m);
+
+	/* will alloc data for pmt_sections after initializing pat */
+	vidtv_channel_si_init(m);
+
+	INIT_WORK(&m->mpeg_thread, vidtv_mux_tick);
+
+	m->pcr_pid = args.pcr_pid;
+	m->priv    = args.priv;
+
+	vidtv_mux_pid_ctx_init(m);
+	vidtv_channels_add_registration_descs(m);
+
+	return m;
+}
+
+void vidtv_mux_destroy(struct vidtv_mux *m)
+{
+	vidtv_mux_pid_ctx_destroy(m);
+	vidtv_channel_si_destroy(m);
+	vidtv_channels_destroy(m);
+	kfree(m->si.sdt);
+	kfree(m->si.pat);
+	kfree(m->ts_buf);
+	kfree(m);
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
new file mode 100644
index 0000000000000..1dffa2010d518
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the multiplexer logic for TS packets from different
+ * elementary streams
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_MUX_H
+#define VIDTV_MUX_H
+
+#include <linux/types.h>
+#include <linux/hashtable.h>
+#include <linux/workqueue.h>
+#include "vidtv_psi.h"
+struct vidtv_mux_timing {
+	u64 start_jiffies;
+	u64 current_jiffies;
+	u64 past_jiffies;
+
+	/* a 27Mhz clock from which we will drive the PCR */
+	u64 clk;
+
+	u64 pcr_period_usecs;
+	u64 si_period_usecs;
+};
+
+struct vidtv_mux_si {
+	/* the SI tables */
+	struct vidtv_psi_table_pat *pat;
+	struct vidtv_psi_table_pmt *pmt_secs; /* the PMT sections */
+	/* as many sections as programs in the PAT */
+	u16 num_pmt_sections;
+	struct vidtv_psi_table_sdt *sdt;
+};
+
+struct vidtv_mux_pid_ctx {
+	u16 pid;
+	u8 cc; /* continuity counter */
+	struct hlist_node h;
+};
+
+struct vidtv_mux {
+	struct vidtv_mux_timing timing;
+
+	/* the bit rate for the TS, in kbytes */
+	u32 mux_rate_kbytes_sec;
+
+	/* a hash table to keep track of per-PID metadata */
+	DECLARE_HASHTABLE(pid_ctx, 3);
+
+	/* a callback to inform of new TS packets ready */
+	void (*on_new_packets_available_cb)(void *priv, u8 *buf, u32 npackets);
+
+	/* the TS buffer */
+	u8 *ts_buf;
+
+	/* the TS buffer size */
+	u32 ts_buf_sz;
+
+	/* where we are in the TS buffer now */
+	u32 ts_buf_offset;
+
+	/* a list of channels */
+	struct vidtv_channel  *channels;
+
+	struct vidtv_mux_si si;
+	u64 num_streamed_pcr;
+	u64 num_streamed_si;
+
+	/* total number of packets streamed */
+	u64 num_streamed_pkts;
+
+	struct work_struct mpeg_thread;
+
+	/* whether to keep running the main loop */
+	bool streaming;
+
+	/* the pcr PID for _all_ channels */
+	u16 pcr_pid;
+
+	void *priv;
+};
+
+struct vidtv_mux_init_args {
+	u32 mux_rate_kbytes_sec;
+	void (*on_new_packets_available_cb)(void *priv, u8 *buf, u32 npackets);
+	u32 ts_buf_sz;
+	u64 pcr_period_usecs;
+	u64 si_period_usecs;
+	u16 pcr_pid;
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
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 51e9114173362..d9547efe4626b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1035,3 +1035,21 @@ vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
 		program = program->next;
 	}
 }
+
+struct vidtv_psi_table_pmt
+*vidtv_psi_find_pmt_sec(struct vidtv_psi_table_pmt pmt_sections[],
+			u16 nsections,
+			u16 program_num)
+{
+	/* find the PMT section associated with 'program_num' */
+	struct vidtv_psi_table_pmt *sec = NULL;
+	u32 i;
+
+	for (i = 0; i < nsections; ++i) {
+		sec = &pmt_sections[i];
+		if (be16_to_cpu(sec->header.id) == program_num)
+			return sec;
+	}
+
+	return NULL;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 77b616a46757a..f45540d53b351 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -412,4 +412,9 @@ u32 vidtv_psi_pmt_write_into(char *buf,
 			     u32 buf_sz,
 			     u8 *continuity_counter);
 
+struct vidtv_psi_table_pmt
+*vidtv_psi_find_pmt_sec(struct vidtv_psi_table_pmt *pmt_sections,
+			u16 nsections,
+			u16 program_num);
+
 #endif // VIDTV_PSI_H
-- 
2.26.2

