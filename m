Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD261D5BEE
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 23:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgEOVtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 17:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726228AbgEOVt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 17:49:29 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B92C061A0C;
        Fri, 15 May 2020 14:49:29 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id z5so1870539qvw.4;
        Fri, 15 May 2020 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gqEOzk15o9w0uUFqBzHrkuteH6DYHITwy1pjKXiKQa8=;
        b=DDMkvaQaEkk4rC5u05dke51EZfwJmOw21wx0D9uPhC4BzwWzn3j85e4WCLGfZna5jc
         EmuUAXf8HzfvsZmH+XcvDocO5FPT3G7EdYZtgXEKwUCR1F/WauWjO1ZCbsXu8J5qJnhY
         QtmGV+JSvVTjgaWdq5eKjglm1/lfFgPhaSYkcFIHlhbCdl+44pxtEHwT1qtdzxcqQ8pe
         xV5rtyJ6rlMlkr6j9FHpG0VFgEBuVXUAAvOXKNQfzxOJ3pmQDNNh6rDI/J3gY3rXPuPW
         a3qyL01zn7WwVElcwYxUDKERYO8Wm3eoypzjEBWPBvHWGV9uaHOlTBeC/HgY2w1APTj5
         5kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gqEOzk15o9w0uUFqBzHrkuteH6DYHITwy1pjKXiKQa8=;
        b=Ify2GWDIWZ4TOeU7+IL6mTFgPc7efc5oa/bUEwogt0qrhb7g5FzqG6D27JNKJzxRrC
         kfsddCdZSI/202FNkQ1WPcLqNzlFP9Xm/lZPB3/QgUuw9GGmOqGqvCvfautBYP8SOuMb
         1QEi2zOKPSa0iXBiS9MCAh8aPckjbfXWngK02eOW2xQPyuFSiRRBCTlwSpePe5b8Wy1p
         +XGzLywemTZS5d9Fut8yavuJyvANGWfkArYmP0v6UW1sWb39GIg6pcF2zyenAjOHVW72
         cbZ9H5j0DFyrv5Szh6TZ7n0jqc27pJS/h6nDrpn1ZTE++rpottVvdvEGyoZfEbBjBvRq
         ENvA==
X-Gm-Message-State: AOAM531L9iN0ZEJ6GSQNlp3Wo2DPYrKydVcGoPQQ+99N7CYUjLresPxn
        q1BFnsXymwbTQFNJ4i6XcN8=
X-Google-Smtp-Source: ABdhPJzN+4iUXI0P+s8JkoBjn/uXizt/lnb4zC0DuNMJ0QlnzowaOA+VLlispy6F0JbjybFm+r1AXw==
X-Received: by 2002:a0c:edc3:: with SMTP id i3mr5107884qvr.248.1589579368076;
        Fri, 15 May 2020 14:49:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
        by smtp.gmail.com with ESMTPSA id m21sm2495019qkh.50.2020.05.15.14.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:49:27 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v5 10/10] media: vidtv: Add a MPEG Transport Stream Multiplexer
Date:   Fri, 15 May 2020 18:48:15 -0300
Message-Id: <20200515214815.15514-11-dwlsalmeida@gmail.com>
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
 .../media/test-drivers/vidtv/vidtv_bridg.c    |  76 +++
 .../media/test-drivers/vidtv/vidtv_bridg.h    |   2 +
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
index e0bb1b3bedad6..8663196fbbc56 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-vidtv_bridge-objs = vidtv_bridg.o
+vidtv_bridge-objs = vidtv_bridg.o vidtv_common.o vidtv_ts.o vidtv_psi.o \
+		    vidtv_pes.o vidtv_s302m.o vidtv_channel.o vidtv_mux.o
 
 obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridg.c b/drivers/media/test-drivers/vidtv/vidtv_bridg.c
index 95e564b91d4d1..7148621ced7eb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridg.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridg.c
@@ -19,7 +19,11 @@
 #include "vidtv_bridg.h"
 #include "vidtv_tuner.h"
 #include "vidtv_demod.h"
+#include "vidtv_ts.h"
+#include "vidtv_mux.h"
 
+#define TS_BUF_MAX_SZ (128 * TS_PACKET_LEN)
+#define TS_BUF_MIN_SZ (20 * TS_PACKET_LEN)
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 
@@ -66,6 +70,56 @@ MODULE_PARM_DESC(max_frequency_shift_hz,
 
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
@@ -74,12 +128,14 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
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
@@ -314,6 +370,8 @@ static int vidtv_bridge_i2c_probe(struct i2c_client *client,
 {
 	int ret;
 	struct vidtv_dvb *dvb;
+	struct vidtv_mux_init_args mux_args = {0};
+	u32    ts_buf_sz                    = ts_buf_sz_pkts * TS_PACKET_LEN;
 
 	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
 	if (!dvb)
@@ -325,6 +383,22 @@ static int vidtv_bridge_i2c_probe(struct i2c_client *client,
 
 	mutex_init(&dvb->feed_lock);
 
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
 	i2c_set_clientdata(client, dvb);
 
 	return ret;
@@ -341,6 +415,8 @@ static int vidtv_bridge_i2c_remove(struct i2c_client *client)
 
 	dvb = i2c_get_clientdata(client);
 
+	vidtv_mux_destroy(dvb->mux);
+
 	mutex_destroy(&dvb->feed_lock);
 
 	for (i = 0; i < NUM_FE; ++i)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridg.h b/drivers/media/test-drivers/vidtv/vidtv_bridg.h
index dead155c2735c..191bd60adc6f0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridg.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridg.h
@@ -17,6 +17,7 @@
 #include <media/dvb_demux.h>
 #include <media/dmxdev.h>
 #include <linux/i2c.h>
+#include "vidtv_mux.h"
 
 struct vidtv_dvb {
 	struct dvb_frontend *fe[NUM_FE];
@@ -32,6 +33,7 @@ struct vidtv_dvb {
 	struct mutex feed_lock; /* start/stop feed */
 
 	bool streaming;
+	struct vidtv_mux *mux;
 };
 
 #endif // VIDTV_BRIDG_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
new file mode 100644
index 0000000000000..7579720414a82
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
+	struct vidtv_s302m_encoder_init_args encoder_args = {0};
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
index 0000000000000..909a22815aff9
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
+	struct pcr_write_args args = {0};
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
+	struct pes_write_args args = {0};
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
+	struct null_packet_write_args args = {0};
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
index 37b1ecab5ee79..17d2d711014d6 100644
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

