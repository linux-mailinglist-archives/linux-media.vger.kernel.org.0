Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537DC2C23A7
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732582AbgKXLGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:33788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732498AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E296B208B8;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=BOo9Ud6/SZEyAGwmAofjSAAtOyficzIngj2AUKfJ/8Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qVGkaa/eFHDB0CZf+tux4py2y1js+Jr0eVsJXNsupiA2lxs8s1pHuTxWGSuUdSle7
         eyrU6/8CVqtbR7gS17c+TJ8dKr+prM1IsDGihpDMdjwQjxot8ctGmZ7X8mOWo43WIh
         wCDD9cAL7VI04YS7u/4Qm02/ph4IfV67Vjl90Qv0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZh-QD; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 09/31] media: vidtv: do some cleanups at the driver
Date:   Tue, 24 Nov 2020 12:06:05 +0100
Message-Id: <b17b0eff22426705d1016737863809686b1bf43f.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do some cleanups at the coding style of the driver:
- remove "inline" declarations;
- use reverse xmas-tree for local var declarations;
- Adjust some indent to avoid breaking 80-cols;
- Cleanup some comments.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  80 ++++----
 .../media/test-drivers/vidtv/vidtv_channel.c  |  68 +++----
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   2 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  37 ++--
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 180 ++++++++----------
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  14 +-
 6 files changed, 187 insertions(+), 194 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 3fc7bf00a3e5..807baf59db8d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -4,7 +4,8 @@
  * validate the existing APIs in the media subsystem. It can also aid
  * developers working on userspace applications.
  *
- * When this module is loaded, it will attempt to modprobe 'dvb_vidtv_tuner' and 'dvb_vidtv_demod'.
+ * When this module is loaded, it will attempt to modprobe 'dvb_vidtv_tuner'
+ * and 'dvb_vidtv_demod'.
  *
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
@@ -24,18 +25,21 @@
 #include "vidtv_ts.h"
 #include "vidtv_tuner.h"
 
-//#define MUX_BUF_MAX_SZ
-//#define MUX_BUF_MIN_SZ
+#define MUX_BUF_MIN_SZ 90164
+#define MUX_BUF_MAX_SZ (MUX_BUF_MIN_SZ * 10)
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 #define VIDTV_DEFAULT_NETWORK_ID 0x744
 #define VIDTV_DEFAULT_NETWORK_NAME "LinuxTV.org"
 
-/* LNBf fake parameters: ranges used by an Universal (extended) European LNBf */
-#define LNB_CUT_FREQUENCY	11700000
-#define LNB_LOW_FREQ		9750000
-#define LNB_HIGH_FREQ		10600000
-
+/*
+ * The LNBf fake parameters here are the ranges used by an
+ * Universal (extended) European LNBf, which is likely the most common LNBf
+ * found on Satellite digital TV system nowadays.
+ */
+#define LNB_CUT_FREQUENCY	11700000	/* high IF frequency */
+#define LNB_LOW_FREQ		9750000		/* low IF frequency */
+#define LNB_HIGH_FREQ		10600000	/* transition frequency */
 
 static unsigned int drop_tslock_prob_on_low_snr;
 module_param(drop_tslock_prob_on_low_snr, uint, 0);
@@ -94,7 +98,8 @@ MODULE_PARM_DESC(si_period_msec, "How often to send SI packets. Default: 40ms");
 
 static unsigned int pcr_period_msec = 40;
 module_param(pcr_period_msec, uint, 0);
-MODULE_PARM_DESC(pcr_period_msec, "How often to send PCR packets. Default: 40ms");
+MODULE_PARM_DESC(pcr_period_msec,
+		 "How often to send PCR packets. Default: 40ms");
 
 static unsigned int mux_rate_kbytes_sec = 4096;
 module_param(mux_rate_kbytes_sec, uint, 0);
@@ -106,16 +111,14 @@ MODULE_PARM_DESC(pcr_pid, "PCR PID for all channels: defaults to 0x200");
 
 static unsigned int mux_buf_sz_pkts;
 module_param(mux_buf_sz_pkts, uint, 0);
-MODULE_PARM_DESC(mux_buf_sz_pkts, "Size for the internal mux buffer in multiples of 188 bytes");
-
-#define MUX_BUF_MIN_SZ 90164
-#define MUX_BUF_MAX_SZ (MUX_BUF_MIN_SZ * 10)
+MODULE_PARM_DESC(mux_buf_sz_pkts,
+		 "Size for the internal mux buffer in multiples of 188 bytes");
 
 static u32 vidtv_bridge_mux_buf_sz_for_mux_rate(void)
 {
 	u32 max_elapsed_time_msecs =  VIDTV_MAX_SLEEP_USECS / USEC_PER_MSEC;
-	u32 nbytes_expected;
 	u32 mux_buf_sz = mux_buf_sz_pkts * TS_PACKET_LEN;
+	u32 nbytes_expected;
 
 	nbytes_expected = mux_rate_kbytes_sec;
 	nbytes_expected *= max_elapsed_time_msecs;
@@ -145,14 +148,12 @@ static bool vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
 			  FE_HAS_LOCK);
 }
 
-static void
-vidtv_bridge_on_new_pkts_avail(void *priv, u8 *buf, u32 npkts)
+/*
+ * called on a separate thread by the mux when new packets become available
+ */
+static void vidtv_bridge_on_new_pkts_avail(void *priv, u8 *buf, u32 npkts)
 {
-	/*
-	 * called on a separate thread by the mux when new packets become
-	 * available
-	 */
-	struct vidtv_dvb *dvb = (struct vidtv_dvb *)priv;
+	struct vidtv_dvb *dvb = priv;
 
 	/* drop packets if we lose the lock */
 	if (vidtv_bridge_check_demod_lock(dvb, 0))
@@ -180,8 +181,10 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 		return 0;
 	}
 
-	mux_buf_sz = (mux_buf_sz_pkts) ? mux_buf_sz_pkts :
-					 vidtv_bridge_mux_buf_sz_for_mux_rate();
+	if (mux_buf_sz_pkts)
+		mux_buf_sz = mux_buf_sz_pkts;
+	else
+		mux_buf_sz = vidtv_bridge_mux_buf_sz_for_mux_rate();
 
 	mux_args.mux_buf_sz  = mux_buf_sz;
 
@@ -212,8 +215,8 @@ static int vidtv_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
 	struct vidtv_dvb *dvb   = demux->priv;
+	int ret;
 	int rc;
-	int ret;
 
 	if (!demux->dmx.frontend)
 		return -EINVAL;
@@ -251,9 +254,9 @@ static int vidtv_stop_feed(struct dvb_demux_feed *feed)
 
 static struct dvb_frontend *vidtv_get_frontend_ptr(struct i2c_client *c)
 {
-	/* the demod will set this when its probe function runs */
 	struct vidtv_demod_state *state = i2c_get_clientdata(c);
 
+	/* the demod will set this when its probe function runs */
 	return &state->frontend;
 }
 
@@ -261,6 +264,11 @@ static int vidtv_master_xfer(struct i2c_adapter *i2c_adap,
 			     struct i2c_msg msgs[],
 			     int num)
 {
+	/*
+	 * Right now, this virtual driver doesn't really send or receive
+	 * messages from I2C. A real driver will require an implementation
+	 * here.
+	 */
 	return 0;
 }
 
@@ -328,11 +336,10 @@ static int vidtv_bridge_dmxdev_init(struct vidtv_dvb *dvb)
 
 static int vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
 {
-	struct vidtv_demod_config cfg = {};
-
-	cfg.drop_tslock_prob_on_low_snr     = drop_tslock_prob_on_low_snr;
-	cfg.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr;
-
+	struct vidtv_demod_config cfg = {
+		.drop_tslock_prob_on_low_snr     = drop_tslock_prob_on_low_snr,
+		.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr,
+	};
 	dvb->i2c_client_demod[n] = dvb_module_probe("dvb_vidtv_demod",
 						    NULL,
 						    &dvb->i2c_adapter,
@@ -351,13 +358,14 @@ static int vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
 
 static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 {
-	struct vidtv_tuner_config cfg = {};
+	struct vidtv_tuner_config cfg = {
+		.fe                       = dvb->fe[n],
+		.mock_power_up_delay_msec = mock_power_up_delay_msec,
+		.mock_tune_delay_msec     = mock_tune_delay_msec,
+	};
 	u32 freq;
 	int i;
 
-	cfg.fe                       = dvb->fe[n];
-	cfg.mock_power_up_delay_msec = mock_power_up_delay_msec;
-	cfg.mock_tune_delay_msec     = mock_tune_delay_msec;
 
 	/* TODO: check if the frequencies are at a valid range */
 
@@ -397,9 +405,7 @@ static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 
 static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
 {
-	int ret;
-	int i;
-	int j;
+	int ret, i, j;
 
 	ret = vidtv_bridge_i2c_register_adap(dvb);
 	if (ret < 0)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index d80b1a56c90c..eba9d9dd0808 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -33,8 +33,8 @@
 
 static void vidtv_channel_encoder_destroy(struct vidtv_encoder *e)
 {
-	struct vidtv_encoder *curr = e;
 	struct vidtv_encoder *tmp = NULL;
+	struct vidtv_encoder *curr = e;
 
 	while (curr) {
 		/* forward the call to the derived type */
@@ -46,25 +46,25 @@ static void vidtv_channel_encoder_destroy(struct vidtv_encoder *e)
 
 #define ENCODING_ISO8859_15 "\x0b"
 
+/*
+ * init an audio only channel with a s302m encoder
+ */
 struct vidtv_channel
 *vidtv_channel_s302m_init(struct vidtv_channel *head, u16 transport_stream_id)
 {
-	/*
-	 * init an audio only channel with a s302m encoder
-	 */
-	const u16 s302m_service_id          = 0x880;
-	const u16 s302m_program_num         = 0x880;
-	const u16 s302m_program_pid         = 0x101; /* packet id for PMT*/
-	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
 	const __be32 s302m_fid              = cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER);
-	char *name = ENCODING_ISO8859_15 "Beethoven";
-	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
-	char *iso_language_code = ENCODING_ISO8859_15 "eng";
-	char *event_name = ENCODING_ISO8859_15 "Beethoven Music";
 	char *event_text = ENCODING_ISO8859_15 "Beethoven's Für Elise";
+	char *event_name = ENCODING_ISO8859_15 "Beethoven Music";
+	struct vidtv_s302m_encoder_init_args encoder_args = {};
+	char *iso_language_code = ENCODING_ISO8859_15 "eng";
+	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
+	char *name = ENCODING_ISO8859_15 "Beethoven";
+	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
+	const u16 s302m_program_pid         = 0x101; /* packet id for PMT*/
+	const u16 s302m_service_id          = 0x880;
+	const u16 s302m_program_num         = 0x880;
 	const u16 s302m_beethoven_event_id  = 1;
 	struct vidtv_channel *s302m;
-	struct vidtv_s302m_encoder_init_args encoder_args = {};
 
 	s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
 	if (!s302m)
@@ -159,11 +159,9 @@ static struct vidtv_psi_table_eit_event
 {
 	/* Concatenate the events */
 	const struct vidtv_channel *cur_chnl = m->channels;
-
 	struct vidtv_psi_table_eit_event *curr = NULL;
 	struct vidtv_psi_table_eit_event *head = NULL;
 	struct vidtv_psi_table_eit_event *tail = NULL;
-
 	struct vidtv_psi_desc *desc = NULL;
 	u16 event_id;
 
@@ -175,7 +173,8 @@ static struct vidtv_psi_table_eit_event
 
 		if (!curr)
 			dev_warn_ratelimited(m->dev,
-					     "No events found for channel %s\n", cur_chnl->name);
+					     "No events found for channel %s\n",
+					     cur_chnl->name);
 
 		while (curr) {
 			event_id = be16_to_cpu(curr->event_id);
@@ -221,7 +220,8 @@ static struct vidtv_psi_table_sdt_service
 
 		if (!curr)
 			dev_warn_ratelimited(m->dev,
-					     "No services found for channel %s\n", cur_chnl->name);
+					     "No services found for channel %s\n",
+					     cur_chnl->name);
 
 		while (curr) {
 			service_id = be16_to_cpu(curr->service_id);
@@ -300,26 +300,24 @@ vidtv_channel_pat_prog_cat_into_new(struct vidtv_mux *m)
 	return head;
 }
 
+/*
+ * Match channels to their respective PMT sections, then assign the
+ * streams
+ */
 static void
 vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 				 struct vidtv_psi_table_pmt **sections,
 				 u32 nsections)
 {
-	/*
-	 * Match channels to their respective PMT sections, then assign the
-	 * streams
-	 */
 	struct vidtv_psi_table_pmt *curr_section = NULL;
-	struct vidtv_channel *cur_chnl = channels;
-
-	struct vidtv_psi_table_pmt_stream *s = NULL;
 	struct vidtv_psi_table_pmt_stream *head = NULL;
 	struct vidtv_psi_table_pmt_stream *tail = NULL;
-
+	struct vidtv_psi_table_pmt_stream *s = NULL;
+	struct vidtv_channel *cur_chnl = channels;
 	struct vidtv_psi_desc *desc = NULL;
-	u32 j;
-	u16 curr_id;
 	u16 e_pid; /* elementary stream pid */
+	u16 curr_id;
+	u32 j;
 
 	while (cur_chnl) {
 		for (j = 0; j < nsections; ++j) {
@@ -345,7 +343,8 @@ vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 						head = tail;
 
 					desc = vidtv_psi_desc_clone(s->descriptor);
-					vidtv_psi_desc_assign(&tail->descriptor, desc);
+					vidtv_psi_desc_assign(&tail->descriptor,
+							      desc);
 
 					s = s->next;
 				}
@@ -359,7 +358,8 @@ vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 	}
 }
 
-static void vidtv_channel_destroy_service_list(struct vidtv_psi_desc_service_list_entry *e)
+static void
+vidtv_channel_destroy_service_list(struct vidtv_psi_desc_service_list_entry *e)
 {
 	struct vidtv_psi_desc_service_list_entry *tmp;
 
@@ -413,9 +413,9 @@ static struct vidtv_psi_desc_service_list_entry
 
 int vidtv_channel_si_init(struct vidtv_mux *m)
 {
+	struct vidtv_psi_desc_service_list_entry *service_list = NULL;
 	struct vidtv_psi_table_pat_program *programs = NULL;
 	struct vidtv_psi_table_sdt_service *services = NULL;
-	struct vidtv_psi_desc_service_list_entry *service_list = NULL;
 	struct vidtv_psi_table_eit_event *events = NULL;
 
 	m->si.pat = vidtv_psi_pat_table_init(m->transport_stream_id);
@@ -450,7 +450,8 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 	if (!m->si.nit)
 		goto free_service_list;
 
-	m->si.eit = vidtv_psi_eit_table_init(m->network_id, m->transport_stream_id);
+	m->si.eit = vidtv_psi_eit_table_init(m->network_id,
+					     m->transport_stream_id);
 	if (!m->si.eit)
 		goto free_nit;
 
@@ -464,7 +465,8 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 	/* assemble all events and assign to EIT */
 	vidtv_psi_eit_event_assign(m->si.eit, events);
 
-	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat, m->pcr_pid);
+	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat,
+								     m->pcr_pid);
 	if (!m->si.pmt_secs)
 		goto free_eit;
 
@@ -497,8 +499,8 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
 {
-	u32 i;
 	u16 num_programs = m->si.pat->programs;
+	u32 i;
 
 	vidtv_psi_pat_table_destroy(m->si.pat);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
index f742d566fbcb..0ac5b1e3f666 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_encoder.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -28,7 +28,7 @@ struct vidtv_access_unit {
 	struct vidtv_access_unit *next;
 };
 
-/* Some musical notes, used by a tone generator */
+/* Some musical notes, used by a tone generator. Values are in Hz */
 enum musical_notes {
 	NOTE_SILENT = 0,
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index eb24e27b7f5f..6df9cfd7f33b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -63,9 +63,9 @@ static struct vidtv_mux_pid_ctx
 
 static void vidtv_mux_pid_ctx_destroy(struct vidtv_mux *m)
 {
-	int bkt;
 	struct vidtv_mux_pid_ctx *ctx;
 	struct hlist_node *tmp;
+	int bkt;
 
 	hash_for_each_safe(m->pid_ctx, bkt, tmp, ctx, h) {
 		hash_del(&ctx->h);
@@ -129,21 +129,18 @@ static void vidtv_mux_update_clk(struct vidtv_mux *m)
 
 static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 {
-	u32 initial_offset = m->mux_buf_offset;
-
-	struct vidtv_mux_pid_ctx *pat_ctx;
-	struct vidtv_mux_pid_ctx *pmt_ctx;
-	struct vidtv_mux_pid_ctx *sdt_ctx;
-	struct vidtv_mux_pid_ctx *nit_ctx;
-	struct vidtv_mux_pid_ctx *eit_ctx;
-
 	struct vidtv_psi_pat_write_args pat_args = {};
 	struct vidtv_psi_pmt_write_args pmt_args = {};
 	struct vidtv_psi_sdt_write_args sdt_args = {};
 	struct vidtv_psi_nit_write_args nit_args = {};
 	struct vidtv_psi_eit_write_args eit_args = {};
-
-	u32 nbytes; /* the number of bytes written by this function */
+	u32 initial_offset = m->mux_buf_offset;
+	struct vidtv_mux_pid_ctx *pat_ctx;
+	struct vidtv_mux_pid_ctx *pmt_ctx;
+	struct vidtv_mux_pid_ctx *sdt_ctx;
+	struct vidtv_mux_pid_ctx *nit_ctx;
+	struct vidtv_mux_pid_ctx *eit_ctx;
+	u32 nbytes;
 	u16 pmt_pid;
 	u32 i;
 
@@ -269,7 +266,6 @@ static bool vidtv_mux_should_push_si(struct vidtv_mux *m)
 static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
 					    struct vidtv_encoder *e)
 {
-	u32 nbytes = 0;
 	struct pes_write_args args = {
 		.dest_buf           = m->mux_buf,
 		.dest_buf_sz        = m->mux_buf_sz,
@@ -279,10 +275,11 @@ static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
 		.send_pts           = true,  /* forbidden value '01'... */
 		.send_dts           = false, /* ...for PTS_DTS flags    */
 	};
-	u32 initial_offset = m->mux_buf_offset;
 	struct vidtv_access_unit *au = e->access_units;
-	u8 *buf = NULL;
+	u32 initial_offset = m->mux_buf_offset;
 	struct vidtv_mux_pid_ctx *pid_ctx;
+	u32 nbytes = 0;
+	u8 *buf = NULL;
 
 	/* see SMPTE 302M clause 6.4 */
 	if (args.encoder_id == S302M) {
@@ -318,10 +315,10 @@ static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
 
 static u32 vidtv_mux_poll_encoders(struct vidtv_mux *m)
 {
-	u32 nbytes = 0;
-	u32 au_nbytes;
 	struct vidtv_channel *cur_chnl = m->channels;
 	struct vidtv_encoder *e = NULL;
+	u32 nbytes = 0;
+	u32 au_nbytes;
 
 	while (cur_chnl) {
 		e = cur_chnl->encoders;
@@ -347,9 +344,9 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 {
 	struct null_packet_write_args args = {};
 	u32 initial_offset = m->mux_buf_offset;
-	u32 nbytes; /* the number of bytes written by this function */
-	u32 i;
 	struct vidtv_mux_pid_ctx *ctx;
+	u32 nbytes;
+	u32 i;
 
 	ctx = vidtv_mux_get_pid_ctx(m, TS_NULL_PACKET_PID);
 
@@ -388,9 +385,9 @@ static void vidtv_mux_tick(struct work_struct *work)
 					   struct vidtv_mux,
 					   mpeg_thread);
 	struct dtv_frontend_properties *c = &m->fe->dtv_property_cache;
-	u32 nbytes;
-	u32 npkts;
 	u32 tot_bits = 0;
+	u32 nbytes;
+	u32 npkts;
 
 	while (m->streaming) {
 		nbytes = 0;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index f92ff54fe19b..375e01480d3d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -76,7 +76,7 @@ static const u32 CRC_LUT[256] = {
 	0xbcb4666d, 0xb8757bda, 0xb5365d03, 0xb1f740b4
 };
 
-static inline u32 dvb_crc32(u32 crc, u8 *data, u32 len)
+static u32 dvb_crc32(u32 crc, u8 *data, u32 len)
 {
 	/* from libdvbv5 */
 	while (len--)
@@ -89,7 +89,8 @@ static void vidtv_psi_update_version_num(struct vidtv_psi_table_header *h)
 	h->version++;
 }
 
-static inline u16 vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sdt_service *s)
+static u16
+vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sdt_service *s)
 {
 	u16 mask;
 	u16 ret;
@@ -100,7 +101,8 @@ static inline u16 vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sd
 	return ret;
 }
 
-static inline u16 vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_pmt_stream *s)
+static u16
+vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_pmt_stream *s)
 {
 	u16 mask;
 	u16 ret;
@@ -111,7 +113,7 @@ static inline u16 vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_
 	return ret;
 }
 
-static inline u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
+static u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
 {
 	u16 mask;
 	u16 ret;
@@ -122,7 +124,7 @@ static inline u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
 	return ret;
 }
 
-static inline u16 vidtv_psi_get_sec_len(struct vidtv_psi_table_header *h)
+static u16 vidtv_psi_get_sec_len(struct vidtv_psi_table_header *h)
 {
 	u16 mask;
 	u16 ret;
@@ -133,7 +135,7 @@ static inline u16 vidtv_psi_get_sec_len(struct vidtv_psi_table_header *h)
 	return ret;
 }
 
-inline u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p)
+u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p)
 {
 	u16 mask;
 	u16 ret;
@@ -144,7 +146,7 @@ inline u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p)
 	return ret;
 }
 
-inline u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *s)
+u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *s)
 {
 	u16 mask;
 	u16 ret;
@@ -155,10 +157,11 @@ inline u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *
 	return ret;
 }
 
-static inline void vidtv_psi_set_desc_loop_len(__be16 *bitfield, u16 new_len, u8 desc_len_nbits)
+static void vidtv_psi_set_desc_loop_len(__be16 *bitfield, u16 new_len,
+					u8 desc_len_nbits)
 {
-	u16 mask;
 	__be16 new;
+	u16 mask;
 
 	mask = GENMASK(15, desc_len_nbits);
 
@@ -185,27 +188,22 @@ static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
 	h->bitfield = new;
 }
 
+/*
+ * Packetize PSI sections into TS packets:
+ * push a TS header (4bytes) every 184 bytes
+ * manage the continuity_counter
+ * add stuffing (i.e. padding bytes) after the CRC
+ */
 static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args args)
 {
-	/*
-	 * Packetize PSI sections into TS packets:
-	 * push a TS header (4bytes) every 184 bytes
-	 * manage the continuity_counter
-	 * add stuffing (i.e. padding bytes) after the CRC
-	 */
 
 	u32 nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
 	bool aligned = (nbytes_past_boundary == 0);
 	struct vidtv_mpeg_ts ts_header = {};
-
-	/* number of bytes written by this function */
-	u32 nbytes = 0;
-	/* how much there is left to write */
 	u32 remaining_len = args.len;
-	/* how much we can be written in this packet */
 	u32 payload_write_len = 0;
-	/* where we are in the source */
 	u32 payload_offset = 0;
+	u32 nbytes = 0;
 
 	const u16 PAYLOAD_START = args.new_psi_section;
 
@@ -294,9 +292,10 @@ static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args args)
 
 static u32 table_section_crc32_write_into(struct crc32_write_args args)
 {
+	struct psi_write_args psi_args = {};
+	u32 nbytes = 0;
+
 	/* the CRC is the last entry in the section */
-	u32 nbytes = 0;
-	struct psi_write_args psi_args = {};
 
 	psi_args.dest_buf           = args.dest_buf;
 	psi_args.from               = &args.crc;
@@ -391,8 +390,8 @@ struct vidtv_psi_desc_registration
 struct vidtv_psi_desc_network_name
 *vidtv_psi_network_name_desc_init(struct vidtv_psi_desc *head, char *network_name)
 {
-	struct vidtv_psi_desc_network_name *desc;
 	u32 network_name_len = network_name ? strlen(network_name) : 0;
+	struct vidtv_psi_desc_network_name *desc;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 	if (!desc)
@@ -413,10 +412,10 @@ struct vidtv_psi_desc_service_list
 *vidtv_psi_service_list_desc_init(struct vidtv_psi_desc *head,
 				  struct vidtv_psi_desc_service_list_entry *entry)
 {
-	struct vidtv_psi_desc_service_list *desc;
 	struct vidtv_psi_desc_service_list_entry *curr_e = NULL;
 	struct vidtv_psi_desc_service_list_entry *head_e = NULL;
 	struct vidtv_psi_desc_service_list_entry *prev_e = NULL;
+	struct vidtv_psi_desc_service_list *desc;
 	u16 length = 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
@@ -465,10 +464,10 @@ struct vidtv_psi_desc_short_event
 				 char *event_name,
 				 char *text)
 {
-	struct vidtv_psi_desc_short_event *desc;
+	u32 iso_len =  iso_language_code ? strlen(iso_language_code) : 0;
 	u32 event_name_len = event_name ? strlen(event_name) : 0;
+	struct vidtv_psi_desc_short_event *desc;
 	u32 text_len =  text ? strlen(text) : 0;
-	u32 iso_len =  iso_language_code ? strlen(iso_language_code) : 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 	if (!desc)
@@ -502,14 +501,13 @@ struct vidtv_psi_desc_short_event
 
 struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 {
-	struct vidtv_psi_desc *head = NULL;
-	struct vidtv_psi_desc *prev = NULL;
-	struct vidtv_psi_desc *curr = NULL;
-
-	struct vidtv_psi_desc_service *service;
 	struct vidtv_psi_desc_network_name *desc_network_name;
 	struct vidtv_psi_desc_service_list *desc_service_list;
 	struct vidtv_psi_desc_short_event  *desc_short_event;
+	struct vidtv_psi_desc_service *service;
+	struct vidtv_psi_desc *head = NULL;
+	struct vidtv_psi_desc *prev = NULL;
+	struct vidtv_psi_desc *curr = NULL;
 
 	while (desc) {
 		switch (desc->type) {
@@ -571,10 +569,10 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 
 void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
 {
+	struct vidtv_psi_desc_service_list_entry *sl_entry_tmp = NULL;
+	struct vidtv_psi_desc_service_list_entry *sl_entry = NULL;
 	struct vidtv_psi_desc *curr = desc;
 	struct vidtv_psi_desc *tmp  = NULL;
-	struct vidtv_psi_desc_service_list_entry *sl_entry = NULL;
-	struct vidtv_psi_desc_service_list_entry *sl_entry_tmp = NULL;
 
 	while (curr) {
 		tmp  = curr;
@@ -677,10 +675,10 @@ void vidtv_sdt_desc_assign(struct vidtv_psi_table_sdt *sdt,
 
 static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 {
-	/* the number of bytes written by this function */
-	u32 nbytes = 0;
-	struct psi_write_args psi_args = {};
 	struct vidtv_psi_desc_service_list_entry *serv_list_entry = NULL;
+	struct psi_write_args psi_args = {};
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
 
 	psi_args.dest_buf = args.dest_buf;
 	psi_args.from     = &args.desc->type;
@@ -799,9 +797,9 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 static u32
 vidtv_psi_table_header_write_into(struct header_write_args args)
 {
+	struct psi_write_args psi_args = {};
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
-	struct psi_write_args psi_args = {};
 
 	psi_args.dest_buf           = args.dest_buf;
 	psi_args.from               = args.h;
@@ -822,9 +820,10 @@ vidtv_psi_table_header_write_into(struct header_write_args args)
 void
 vidtv_psi_pat_table_update_sec_len(struct vidtv_psi_table_pat *pat)
 {
+	u16 length = 0;
+	u32 i;
+
 	/* see ISO/IEC 13818-1 : 2000 p.43 */
-	u16 length = 0;
-	u32 i;
 
 	/* from immediately after 'section_length' until 'last_section_number'*/
 	length += PAT_LEN_UNTIL_LAST_SECTION_NUMBER;
@@ -841,10 +840,11 @@ vidtv_psi_pat_table_update_sec_len(struct vidtv_psi_table_pat *pat)
 
 void vidtv_psi_pmt_table_update_sec_len(struct vidtv_psi_table_pmt *pmt)
 {
-	/* see ISO/IEC 13818-1 : 2000 p.46 */
-	u16 length = 0;
 	struct vidtv_psi_table_pmt_stream *s = pmt->stream;
 	u16 desc_loop_len;
+	u16 length = 0;
+
+	/* see ISO/IEC 13818-1 : 2000 p.46 */
 
 	/* from immediately after 'section_length' until 'program_info_length'*/
 	length += PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH;
@@ -875,10 +875,11 @@ void vidtv_psi_pmt_table_update_sec_len(struct vidtv_psi_table_pmt *pmt)
 
 void vidtv_psi_sdt_table_update_sec_len(struct vidtv_psi_table_sdt *sdt)
 {
-	/* see ETSI EN 300 468 V 1.10.1 p.24 */
-	u16 length = 0;
 	struct vidtv_psi_table_sdt_service *s = sdt->service;
 	u16 desc_loop_len;
+	u16 length = 0;
+
+	/* see ETSI EN 300 468 V 1.10.1 p.24 */
 
 	/*
 	 * from immediately after 'section_length' until
@@ -935,8 +936,8 @@ vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
 void
 vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p)
 {
-	struct vidtv_psi_table_pat_program *curr = p;
 	struct vidtv_psi_table_pat_program *tmp  = NULL;
+	struct vidtv_psi_table_pat_program *curr = p;
 
 	while (curr) {
 		tmp  = curr;
@@ -945,14 +946,13 @@ vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p)
 	}
 }
 
+/* This function transfers ownership of p to the table */
 void
 vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 			     struct vidtv_psi_table_pat_program *p)
 {
-	/* This function transfers ownership of p to the table */
-
+	struct vidtv_psi_table_pat_program *program;
 	u16 program_count;
-	struct vidtv_psi_table_pat_program *program;
 
 	do {
 		program_count = 0;
@@ -1010,16 +1010,13 @@ struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
 
 u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 {
-	/* the number of bytes written by this function */
-	u32 nbytes = 0;
-	const u16 pat_pid = VIDTV_PAT_PID;
-	u32 crc = INITIAL_CRC;
-
 	struct vidtv_psi_table_pat_program *p = args.pat->program;
-
 	struct header_write_args h_args       = {};
-	struct psi_write_args psi_args            = {};
+	struct psi_write_args psi_args        = {};
 	struct crc32_write_args c_args        = {};
+	const u16 pat_pid = VIDTV_PAT_PID;
+	u32 crc = INITIAL_CRC;
+	u32 nbytes = 0;
 
 	vidtv_psi_pat_table_update_sec_len(args.pat);
 
@@ -1114,8 +1111,8 @@ vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
 
 void vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s)
 {
-	struct vidtv_psi_table_pmt_stream *curr_stream = s;
 	struct vidtv_psi_table_pmt_stream *tmp_stream  = NULL;
+	struct vidtv_psi_table_pmt_stream *curr_stream = s;
 
 	while (curr_stream) {
 		tmp_stream  = curr_stream;
@@ -1166,11 +1163,11 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 						     u16 pcr_pid)
 {
 	struct vidtv_psi_table_pmt *pmt;
-	const u16 SYNTAX = 0x1;
-	const u16 ZERO = 0x0;
-	const u16 ONES = 0x03;
 	const u16 RESERVED1 = 0x07;
 	const u16 RESERVED2 = 0x0f;
+	const u16 SYNTAX = 0x1;
+	const u16 ONES = 0x03;
+	const u16 ZERO = 0x0;
 	u16 desc_loop_len;
 
 	pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
@@ -1208,18 +1205,15 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 
 u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 {
-	/* the number of bytes written by this function */
-	u32 nbytes = 0;
-	u32 crc = INITIAL_CRC;
-
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
 	struct vidtv_psi_desc *stream_descriptor;
-
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
 	struct desc_write_args d_args   = {};
 	struct crc32_write_args c_args  = {};
+	u32 crc = INITIAL_CRC;
+	u32 nbytes = 0;
 
 	vidtv_psi_pmt_table_update_sec_len(args.pmt);
 
@@ -1317,10 +1311,10 @@ void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
 struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
 {
 	struct vidtv_psi_table_sdt *sdt;
-	const u16 SYNTAX = 0x1;
-	const u16 ONE = 0x1;
-	const u16 ONES = 0x03;
 	const u16 RESERVED = 0xff;
+	const u16 SYNTAX = 0x1;
+	const u16 ONES = 0x03;
+	const u16 ONE = 0x1;
 
 	sdt  = kzalloc(sizeof(*sdt), GFP_KERNEL);
 	if (!sdt)
@@ -1360,18 +1354,17 @@ struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
 
 u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 {
-	u32 nbytes  = 0;
-	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
-
-	u32 crc = INITIAL_CRC;
-
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
 	struct vidtv_psi_desc *service_desc;
-
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
 	struct desc_write_args d_args   = {};
 	struct crc32_write_args c_args  = {};
+	u16 sdt_pid = VIDTV_SDT_PID;
+	u32 nbytes  = 0;
+	u32 crc = INITIAL_CRC;
+
+	/* see ETSI EN 300 468 v1.15.1 p. 11 */
 
 	vidtv_psi_sdt_table_update_sec_len(args.sdt);
 
@@ -1520,15 +1513,16 @@ vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
 	vidtv_psi_update_version_num(&sdt->header);
 }
 
+/*
+ * PMTs contain information about programs. For each program,
+ * there is one PMT section. This function will create a section
+ * for each program found in the PAT
+ */
 struct vidtv_psi_table_pmt**
-vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat, u16 pcr_pid)
+vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
+					    u16 pcr_pid)
 
 {
-	/*
-	 * PMTs contain information about programs. For each program,
-	 * there is one PMT section. This function will create a section
-	 * for each program found in the PAT
-	 */
 	struct vidtv_psi_table_pat_program *program = pat->program;
 	struct vidtv_psi_table_pmt **pmt_secs;
 	u32 i = 0;
@@ -1549,12 +1543,12 @@ vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat, u16
 	return pmt_secs;
 }
 
+/* find the PMT section associated with 'program_num' */
 struct vidtv_psi_table_pmt
 *vidtv_psi_find_pmt_sec(struct vidtv_psi_table_pmt **pmt_sections,
 			u16 nsections,
 			u16 program_num)
 {
-	/* find the PMT section associated with 'program_num' */
 	struct vidtv_psi_table_pmt *sec = NULL;
 	u32 i;
 
@@ -1616,11 +1610,11 @@ struct vidtv_psi_table_nit
 			  char *network_name,
 			  struct vidtv_psi_desc_service_list_entry *service_list)
 {
-	struct vidtv_psi_table_nit *nit;
 	struct vidtv_psi_table_transport *transport;
+	struct vidtv_psi_table_nit *nit;
 	const u16 SYNTAX = 0x1;
-	const u16 ONE = 0x1;
 	const u16 ONES = 0x03;
+	const u16 ONE = 0x1;
 
 	nit = kzalloc(sizeof(*nit), GFP_KERNEL);
 	if (!nit)
@@ -1677,18 +1671,15 @@ struct vidtv_psi_table_nit
 
 u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 {
-	/* the number of bytes written by this function */
-	u32 nbytes = 0;
-	u32 crc = INITIAL_CRC;
-
 	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
 	struct vidtv_psi_table_transport *transport = args.nit->transport;
 	struct vidtv_psi_desc *transport_descriptor;
-
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
 	struct desc_write_args d_args   = {};
 	struct crc32_write_args c_args  = {};
+	u32 crc = INITIAL_CRC;
+	u32 nbytes = 0;
 
 	vidtv_psi_nit_table_update_sec_len(args.nit);
 
@@ -1786,8 +1777,8 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 static void vidtv_psi_transport_destroy(struct vidtv_psi_table_transport *t)
 {
-	struct vidtv_psi_table_transport *curr_t = t;
 	struct vidtv_psi_table_transport *tmp_t  = NULL;
+	struct vidtv_psi_table_transport *curr_t = t;
 
 	while (curr_t) {
 		tmp_t  = curr_t;
@@ -1806,9 +1797,9 @@ void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit)
 
 void vidtv_psi_eit_table_update_sec_len(struct vidtv_psi_table_eit *eit)
 {
-	u16 length = 0;
 	struct vidtv_psi_table_eit_event *e = eit->event;
 	u16 desc_loop_len;
+	u16 length = 0;
 
 	/*
 	 * from immediately after 'section_length' until
@@ -1890,16 +1881,14 @@ struct vidtv_psi_table_eit
 
 u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 {
-	u32 nbytes  = 0;
-	u32 crc = INITIAL_CRC;
-
 	struct vidtv_psi_table_eit_event *event = args.eit->event;
 	struct vidtv_psi_desc *event_descriptor;
-
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
 	struct desc_write_args d_args   = {};
 	struct crc32_write_args c_args  = {};
+	u32 crc = INITIAL_CRC;
+	u32 nbytes  = 0;
 
 	vidtv_psi_eit_table_update_sec_len(args.eit);
 
@@ -1978,9 +1967,8 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 struct vidtv_psi_table_eit_event
 *vidtv_psi_eit_event_init(struct vidtv_psi_table_eit_event *head, u16 event_id)
 {
-	struct vidtv_psi_table_eit_event *e;
 	const u8 DURATION_ONE_HOUR[] = {1, 0, 0};
-
+	struct vidtv_psi_table_eit_event *e;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
@@ -2004,8 +1992,8 @@ struct vidtv_psi_table_eit_event
 
 void vidtv_psi_eit_event_destroy(struct vidtv_psi_table_eit_event *e)
 {
-	struct vidtv_psi_table_eit_event *curr_e = e;
 	struct vidtv_psi_table_eit_event *tmp_e  = NULL;
+	struct vidtv_psi_table_eit_event *curr_e = e;
 
 	while (curr_e) {
 		tmp_e  = curr_e;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 569e7a50129f..ce7dd6cafc8b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -201,10 +201,10 @@ static void vidtv_s302m_alloc_au(struct vidtv_encoder *e)
 static void
 vidtv_s302m_compute_sample_count_from_video(struct vidtv_encoder *e)
 {
-	struct vidtv_access_unit *au = e->access_units;
 	struct vidtv_access_unit *sync_au = e->sync->access_units;
-	u32 vau_duration_usecs;
+	struct vidtv_access_unit *au = e->access_units;
 	u32 sample_duration_usecs;
+	u32 vau_duration_usecs;
 	u32 s;
 
 	vau_duration_usecs    = USEC_PER_SEC / e->sync->sampling_rate_hz;
@@ -290,9 +290,9 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 static u32 vidtv_s302m_write_frame(struct vidtv_encoder *e,
 				   u16 sample)
 {
-	u32 nbytes = 0;
+	struct vidtv_s302m_ctx *ctx = e->ctx;
 	struct vidtv_s302m_frame_16 f = {};
-	struct vidtv_s302m_ctx *ctx = e->ctx;
+	u32 nbytes = 0;
 
 	/* from ffmpeg: see s302enc.c */
 
@@ -389,6 +389,8 @@ static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
 
 static void *vidtv_s302m_encode(struct vidtv_encoder *e)
 {
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+
 	/*
 	 * According to SMPTE 302M, an audio access unit is specified as those
 	 * AES3 words that are associated with a corresponding video frame.
@@ -402,8 +404,6 @@ static void *vidtv_s302m_encode(struct vidtv_encoder *e)
 	 * ffmpeg
 	 */
 
-	struct vidtv_s302m_ctx *ctx = e->ctx;
-
 	vidtv_s302m_access_unit_destroy(e);
 	vidtv_s302m_alloc_au(e);
 
@@ -441,9 +441,9 @@ static u32 vidtv_s302m_clear(struct vidtv_encoder *e)
 struct vidtv_encoder
 *vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args)
 {
-	struct vidtv_encoder *e;
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
 	struct vidtv_s302m_ctx *ctx;
+	struct vidtv_encoder *e;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
-- 
2.28.0

