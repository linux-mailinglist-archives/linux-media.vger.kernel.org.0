Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A0818F51E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgCWM6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:58:37 -0400
Received: from mail-qv1-f44.google.com ([209.85.219.44]:37736 "EHLO
        mail-qv1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgCWM6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:58:37 -0400
Received: by mail-qv1-f44.google.com with SMTP id n1so7069941qvz.4
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/wHmijjsy5KI1InernZzdxOmVKdmwhn2e2amZCCH+8=;
        b=Y67D/jh764NXWz70Oi64OZ3ZGsosQJoWGNi3k/cAqoqz+EnPTnRZ5eklfbixizu6qC
         i4mtTIlf0GSvB+lVdWzEWk7YZtCsi8/KNEo/4VwxHV0s8pn+k204dRaMyd4Fu+hFJ4N0
         XA11lAk2xbokOOYUXm2uyqB/P27CaNy3O+S+IDQ2/i9rRZQZnv46qU+mgj8iYnfHtm9A
         3Ga5NVYraJxHsmj0SDBGD27bb0meeofpHHWKjjL9wEEyYdocuaUwhU3+vpSdNRL9DzAu
         06Oi7BPGuDov9wzim0rM5B8CaKiI9RDRaD55g4huGcebOr2idiL4WcaqWhKLDQuIWyVE
         Msfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/wHmijjsy5KI1InernZzdxOmVKdmwhn2e2amZCCH+8=;
        b=KQVcx1Ri81v9kzm2Yz3IVUEJ4Pfy2RU3ix/rPK3AZtc1/t6JGyVkEMRFzZoZ0+KLRY
         pUEOKfYmLznjjMHGT9/s5vzpJ1Xa/l3tzrwYWgg4E6R6GhfmTiUDvhiv1gsdgcXKcD2P
         ZziSW9TBb4EgX33dLsF3VVOaGUg0oivSZgo/p4dEg1GmsfCZNoU1BE9KnCCX2+A9iHGB
         Oj2iRKVaSnP/GfBmhMlGOTW8QIFOX5Cd2RWVUkq4BSCbnqbe/cXr0nxcnCid3me7cOsL
         Gq/2/a67I3+hy6zvEsPjCOHu4xRUCxEVbInPc7fYb6HzSIPPdQMXMYzj0cYImUhNsYKV
         +1+g==
X-Gm-Message-State: ANhLgQ3k5bCFvRMCYmqOzhwSuoMsqZWaspbtbY+B7DD9O+g8lvCASU5Q
        TIXFfjuEwyoePchDbgtKp0rxUkKyBt0=
X-Google-Smtp-Source: ADFU+vtNWvXymzvc2kCGy1OWrYssbKAT4tmu1VoaJFOq03rvupaZsYX+IyCs3psQRyOBp97J03+GXA==
X-Received: by 2002:ad4:5808:: with SMTP id dd8mr13592994qvb.191.1584968314264;
        Mon, 23 Mar 2020 05:58:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id 16sm11075800qkk.79.2020.03.23.05.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:58:33 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [RFC, WIP, v2 3/3] media: dvb_dummy_fe.c: write PSI information into DMX buffer
Date:   Mon, 23 Mar 2020 09:57:32 -0300
Message-Id: <20200323125732.281976-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200323125732.281976-1-dwlsalmeida@gmail.com>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Periodically feed the demux with PSI packets. This is needed so userspace
apps can retrieve information about the Transport Stream and eventually
tune into a (dummy) channel.

Currently this commit adds support for working with 3 PSI tables:
PAT, PMT and SDT. A dummy service with a dummy program is hardcoded
in the driver code.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/Makefile          |   1 +
 drivers/media/dvb-frontends/dvb_dummy_fe.c    | 265 ++++-
 drivers/media/dvb-frontends/dvb_dummy_fe.h    |  32 +
 .../media/dvb-frontends/dvb_dummy_fe_common.h |  55 ++
 .../media/dvb-frontends/dvb_dummy_fe_psi.c    | 902 ++++++++++++++++++
 .../media/dvb-frontends/dvb_dummy_fe_psi.h    | 287 ++++++
 6 files changed, 1522 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_common.h
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_psi.c
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_psi.h

diff --git a/drivers/media/dvb-frontends/Makefile b/drivers/media/dvb-frontends/Makefile
index e9179162658c..2a44239de74d 100644
--- a/drivers/media/dvb-frontends/Makefile
+++ b/drivers/media/dvb-frontends/Makefile
@@ -15,6 +15,7 @@ stv0900-objs := stv0900_core.o stv0900_sw.o
 drxd-objs := drxd_firm.o drxd_hard.o
 cxd2820r-objs := cxd2820r_core.o cxd2820r_c.o cxd2820r_t.o cxd2820r_t2.o
 drxk-objs := drxk_hard.o
+dvb_dummy_fe-objs := dvb_dummy_fe_psi.o
 
 obj-$(CONFIG_DVB_PLL) += dvb-pll.o
 obj-$(CONFIG_DVB_STV0299) += stv0299.o
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 14446f2bdcde..ff0c510bdff5 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -14,14 +14,8 @@
 
 #include <media/dvb_frontend.h>
 #include "dvb_dummy_fe.h"
-
-
-struct dvb_dummy_fe_cnr_to_qual_s {
-	/* attempt to use the same values as libdvbv5 */
-	u32 modulation;
-	u32 fec;
-	u32 cnr_ok, cnr_good;
-};
+#include "dvb_dummy_fe_common.h"
+#include "dvb_dummy_fe_psi.h"
 
 struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_c_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
@@ -73,18 +67,248 @@ static struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_t_cnr_2_qual[] = {
 	{ QAM_64, FEC_7_8, 22000, 24000},
 };
 
-struct dvb_dummy_fe_config {
-	/* probability of losing the lock due to low snr */
-	u8 drop_tslock_prob_on_low_snr;
-	u8 recover_tslock_prob_on_good_snr;
-};
+static void
+dvb_dummy_fe_init_channels(struct dvb_dummy_channel channels[NUM_CHANNELS])
+{
+	const u16 pac_service_id = 0x880;
+	const u16 pac_program_num = 0x880;
+	const u16 pac_program_pid = 0x101; /* packet id for PMT*/
+	const u16 pac_audio_stream_id = 0x111;
+
+	struct dvb_dummy_channel pac; /* PCM Audio Channel */
+	struct dvb_dummy_table_sdt_service *pac_service;
+	struct dvb_dummy_desc_service *pac_s_desc;
+	u16 desc_length;
+
+	pac_service = dummy_fe_sdt_service_init(NULL, pac_service_id);
+
+	pac_s_desc = (struct dvb_dummy_desc_service *)
+		     dummy_fe_desc_init(NULL,
+					SERVICE_DESCRIPTOR,
+					sizeof(*pac_s_desc));
+
+	pac_s_desc->name = "Sine Wave PCM Audio";
+	pac_s_desc->service_type = DIGITAL_TELEVISION_SERVICE;
+	pac_s_desc->length = 8 /* u8 service_type */
+			     + strlen(pac_s_desc->name)
+			     + strlen(pac_s_desc->name_emph)
+			     + strlen(pac_s_desc->provider)
+			     + strlen(pac_s_desc->provider_emph);
+
+	dummy_fe_desc_assign((struct dvb_dummy_desc *)
+				   pac_s_desc,
+				   (struct dvb_dummy_desc *)
+				   pac_service->descriptor,
+				   &desc_length);
+
+	pac_service->desc_length = desc_length;
+
+	pac.transport_stream_id = TRANSPORT_STREAM_ID;
+
+	pac.program = dummy_fe_pat_program_init(NULL,
+						pac_service_id,
+						pac_program_pid);
+
+	pac.program_num = pac_program_num;
+	pac.streams = dummy_fe_pmt_stream_init(NULL,
+					       ISO_IEC_13818_3_AUDIO,
+					       pac_audio_stream_id);
+
+	memcpy(&channels[0], &pac, sizeof(struct dvb_dummy_channel));
+}
 
-struct dvb_dummy_fe_state {
-	struct dvb_frontend frontend;
-	struct dvb_dummy_fe_config config;
-	struct delayed_work poll_snr;
-	enum fe_status status;
-};
+static void
+dvb_dummy_fe_channels_destroy(struct dvb_dummy_channel channels[NUM_CHANNELS])
+{
+	u32 i;
+	struct dvb_dummy_channel *curr;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = &channels[i];
+		dummy_fe_sdt_service_destroy(curr->service);
+		dummy_fe_pat_program_destroy(curr->program);
+		dummy_fe_pmt_stream_destroy(curr->streams);
+	}
+}
+
+static struct dvb_dummy_table_sdt_service*
+dummy_fe_sdt_serv_cat_into_new(struct dvb_dummy_channel channels[NUM_CHANNELS])
+{
+	u32 i;
+	struct dvb_dummy_table_sdt_service *curr = NULL;
+	struct dvb_dummy_table_sdt_service *head = NULL;
+	struct dvb_dummy_table_sdt_service *tail = NULL;
+	u16 service_id;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = channels[i].service;
+		service_id = curr->service_id;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = dummy_fe_sdt_service_init(tail, service_id);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+	}
+
+	return head;
+}
+
+static struct dvb_dummy_table_pat_program*
+dummy_fe_pat_prog_cat_into_new(struct dvb_dummy_channel channels[NUM_CHANNELS])
+{
+	u32 i;
+	struct dvb_dummy_table_pat_program *curr = NULL;
+	struct dvb_dummy_table_pat_program *head = NULL;
+	struct dvb_dummy_table_pat_program *tail = NULL;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = channels[i].program;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = dummy_fe_pat_program_init
+			       (tail, curr->service_id, curr->pid);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+	}
+
+	return head;
+}
+
+static void
+dummy_fe_pmt_stream_match_with_sections(struct dvb_dummy_channel *channels,
+					struct dvb_dummy_table_pmt *sections,
+					u32 nsections)
+{
+	struct dvb_dummy_table_pmt *curr_section = NULL;
+	u32 i, j;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		for (j = 0; j < nsections; ++j) {
+			curr_section = &sections[j];
+
+			if (!curr_section)
+				continue;
+
+			if (curr_section->header.id ==
+			    channels[i].program_num) {
+				dummy_fe_pmt_stream_assign(curr_section,
+							   channels[i].streams);
+				break;
+			}
+		}
+	}
+}
+
+static void dvb_dummy_fe_thread_mpeg_ts_tick(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+	const unsigned int SLEEP_MSECS = 10;
+	u32 ticks = 0;
+	u32 i;
+	char *buf = kzalloc(DMX_BUF_LEN, GFP_KERNEL);
+	u32 buffer_offset;
+
+	struct dvb_dummy_table_pat pat = {0};
+	struct dvb_dummy_table_sdt sdt = {0};
+
+	struct dvb_dummy_table_pmt *pmt_sections;
+
+	struct dvb_dummy_table_pat_program *programs = NULL;
+	struct dvb_dummy_table_sdt_service *services = NULL;
+
+	bool update_version_num = false;
+	u16 pmt_pid;
+
+	programs = dummy_fe_pat_prog_cat_into_new(state->channels);
+	services = dummy_fe_sdt_serv_cat_into_new(state->channels);
+
+	/* assemble all programs and assign to PAT */
+	dummy_fe_pat_program_assign(&pat, programs);
+
+	/* assemble all services and assign to SDT */
+	dummy_fe_sdt_service_assign(&sdt, services);
+
+	/* a section for each program_id */
+	pmt_sections = kcalloc(pat.programs,
+			       sizeof(struct dvb_dummy_table_pmt),
+			       GFP_KERNEL);
+
+	dummy_fe_pmt_create_section_for_each_pat_entry(&pat,
+						       pmt_sections);
+
+	dummy_fe_pmt_stream_match_with_sections(state->channels,
+						pmt_sections,
+						pat.programs);
+
+	dummy_fe_pat_table_init(&pat,
+				update_version_num,
+				TRANSPORT_STREAM_ID);
+
+	dummy_fe_sdt_table_init(&sdt,
+				update_version_num,
+				TRANSPORT_STREAM_ID);
+	while (true) {
+		memset(buf, 0, DMX_BUF_LEN);
+		buffer_offset = 0;
+
+		if ((ticks % 50) == 0) {
+			/* push PSI packets into the buffer */
+
+			buffer_offset +=
+				dummy_fe_pat_write_into(buf,
+							buffer_offset,
+							&pat);
+			for (i = 0; i < pat.programs; ++i) {
+				pmt_pid =
+				dummy_fe_pmt_get_pid(&pmt_sections[i],
+						     &pat);
+
+				/* not found */
+				WARN_ON(pmt_pid > LAST_VALID_TS_PID);
+
+				/* write each section into buffer */
+				buffer_offset +=
+				dummy_fe_pmt_write_into(buf,
+							buffer_offset,
+							&pmt_sections[i],
+							pmt_pid);
+			}
+
+			buffer_offset +=
+				dummy_fe_sdt_write_into(buf,
+							buffer_offset,
+							&sdt);
+
+			WARN_ON(buffer_offset > DMX_BUF_LEN); /* overflow */
+			msleep_interruptible(SLEEP_MSECS);
+		}
+	}
+
+	dummy_fe_pat_table_destroy(&pat);
+	dummy_fe_sdt_table_destroy(&sdt);
+
+	for (i = 0; i < pat.programs; ++i) {
+		/* destroy all PMT sections */
+		dummy_fe_pmt_table_destroy(&pmt_sections[i]);
+		kfree(&pmt_sections[i]);
+	}
+
+	kfree(buf);
+}
 
 static void poll_snr_handler(struct work_struct *work)
 {
@@ -165,7 +389,6 @@ static void poll_snr_handler(struct work_struct *work)
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
-
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
 	*status = state->status;
@@ -232,6 +455,7 @@ static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
+	dvb_dummy_fe_init_channels(state->channels);
 	INIT_DELAYED_WORK(&state->poll_snr, &poll_snr_handler);
 	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
 	return 0;
@@ -254,6 +478,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
 	cancel_delayed_work_sync(&state->poll_snr);
+	dvb_dummy_fe_channels_destroy(state->channels);
 	kfree(state);
 }
 
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 463abf5ebd56..02efa1aed09c 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -10,6 +10,38 @@
 
 #include <linux/dvb/frontend.h>
 #include <media/dvb_frontend.h>
+#include "dvb_dummy_fe_common.h"
+#include "dvb_dummy_fe_psi.h"
+
+struct dvb_dummy_fe_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok, cnr_good;
+};
+
+struct dvb_dummy_channel {
+	u16 transport_stream_id;
+	struct dvb_dummy_table_sdt_service *service;
+	u16 program_num;
+	/* a single program with one or more streams associated with it */
+	struct dvb_dummy_table_pat_program *program;
+	struct dvb_dummy_table_pmt_stream *streams;
+};
+
+struct dvb_dummy_fe_config {
+	/* prob of losing the lock due to low snr */
+	u8 drop_tslock_prob_on_low_snr;
+	u8 recover_tslock_prob_on_good_snr;
+};
+
+struct dvb_dummy_fe_state {
+	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
+	struct dvb_dummy_channel channels[NUM_CHANNELS];
+};
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
 struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe_common.h b/drivers/media/dvb-frontends/dvb_dummy_fe_common.h
new file mode 100644
index 000000000000..c43b24e2b363
--- /dev/null
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe_common.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef DVB_DUMMY_FE_PRIV_H
+#define DVB_DUMMY_FE_PRIV_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+#define CRC_SIZE_IN_BYTES 32
+#define NUM_CHANNELS 1
+#define TRANSPORT_STREAM_ID 0x744 /* a single stream */
+#define TS_SYNC_BYTE 0x47
+#define TS_PACKET_LEN 188
+#define TS_PAYLOAD_LEN 184
+#define DMX_BUF_LEN (20 * TS_PACKET_LEN)
+#define LAST_VALID_TS_PID 8191
+
+/* to be used by both PSI and ES */
+struct dvb_dummy_mpeg_ts_adaption {
+	u8 length;
+	struct {
+		u8 extension:1;
+		u8 private_data:1;
+		u8 splicing_point:1;
+		u8 OPCR:1;
+		u8 PCR:1;
+		u8 priority:1;
+		u8 random_access:1;
+		u8 discontinued:1;
+	} __packed;
+	u8 data[];
+} __packed;
+
+/* to be used by both PSI and ES */
+struct dvb_dummy_mpeg_ts {
+	u8 sync_byte;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pid:13;
+			u16 priority:1;
+			u16 payload_start:1;
+			u16 tei:1;
+		} __packed;
+	} __packed;
+	struct {
+		u8 continuity_counter:4;
+		u8 payload:1;
+		u8 adaptation_field:1;
+		u8 scrambling:2;
+	} __packed;
+	struct dvb_dummy_mpeg_ts_adaption adaption[];
+} __packed;
+
+#endif // DVB_DUMMY_FE_PRIV_H
\ No newline at end of file
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe_psi.c b/drivers/media/dvb-frontends/dvb_dummy_fe_psi.c
new file mode 100644
index 000000000000..8cf0fc1e584e
--- /dev/null
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe_psi.c
@@ -0,0 +1,902 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/string.h>
+
+#include "dvb_dummy_fe_common.h"
+#include "dvb_dummy_fe_psi.h"
+
+static u32 dummy_fe_ts_psi_write_stuffing(void *to, u32 len)
+{
+	memset(to, 0xff, len);
+	return len;
+}
+
+static u32
+dummy_fe_ts_psi_write_into(struct psi_write_args args)
+{
+	/*
+	 * Packetize PSI sections into TS packets:
+	 *  push a TS header (4bytes) every 184 bytes
+	 *  manage the continuity_counter
+	 *  add stuffing after the CRC
+	 */
+
+	u32 nbytes_past_boundary = (args.offset % TS_PACKET_LEN);
+	bool aligned = nbytes_past_boundary == 0;
+	bool split = args.len > TS_PAYLOAD_LEN;
+	u32 payload_write_len = (split) ? TS_PAYLOAD_LEN : args.len;
+
+	struct psi_write_args new_args = {0};
+	struct dvb_dummy_mpeg_ts ts_header = {0};
+
+	u32 nbytes = 0; /* number of bytes written by this function */
+
+	if (args.new_psi_section && !aligned) {
+		/*
+		 * must pad the buffer with the complement to get a
+		 * multiple of 188
+		 */
+		nbytes += dummy_fe_ts_psi_write_stuffing(args.to +
+							 args.offset +
+							 nbytes,
+							 TS_PACKET_LEN -
+							 nbytes_past_boundary);
+
+		/*
+		 * if we were not at a packet boundary, we are now after
+		 * stuffing the buffer with 0xff
+		 */
+		aligned = true;
+	}
+
+	if (aligned) {
+		/* if at a packet boundary, write a new TS header */
+		ts_header.sync_byte = TS_SYNC_BYTE;
+		ts_header.tei = 0;
+		ts_header.payload_start = 1;
+		ts_header.pid = args.pid;
+		ts_header.priority = 0;
+		ts_header.scrambling = 0; /* not scrambled */
+		ts_header.continuity_counter = *args.continuity_counter;
+		ts_header.payload_start = 0; /* no adaption for now */
+
+		/* copy the header minus the adaption pointer*/
+		memcpy(args.to + args.offset + nbytes,
+		       &ts_header,
+		       sizeof(ts_header));
+
+		nbytes += sizeof(ts_header);
+	}
+
+	if (args.new_psi_section) {
+		/* write the pointer_field in the first byte of the payload */
+		memset(args.to + args.offset + nbytes, 0x0, 1);
+		nbytes += 1;
+		--payload_write_len; /* one byte was used by the pointer field*/
+	}
+
+	/* write as much of the payload as we possibly can */
+	memcpy(args.to + args.offset + nbytes,
+	       args.from,
+	       payload_write_len);
+
+	nbytes += payload_write_len;
+
+	if (split) {
+		/*
+		 * next TS packet keeps the same PID, but increments the
+		 * counter
+		 */
+		++(*args.continuity_counter);
+		/* 'nbytes' written from a total of 'len' requested*/
+		args.len -= nbytes;
+		/*
+		 * recursively write the rest of the data until we do not
+		 * need to split it anymore
+		 */
+		memcpy(&new_args, &args, sizeof(struct psi_write_args));
+		new_args.from = args.from + nbytes;
+		new_args.offset = args.offset + nbytes;
+		new_args.new_psi_section = false;
+
+		nbytes += dummy_fe_ts_psi_write_into(new_args);
+	}
+
+	if (args.is_crc)
+		/*
+		 * as the CRC is last in the section, stuff the rest of the
+		 * packet if there is any remaining space in there
+		 */
+
+		nbytes += dummy_fe_ts_psi_write_stuffing(args.to + nbytes,
+							 TS_PAYLOAD_LEN -
+							 nbytes);
+
+	return nbytes;
+}
+
+static u32 table_section_crc32_write_into(struct crc32_write_args args)
+{
+	/* the CRC is the last entry in the section */
+	u32 nbytes = 0;
+	u32 crc;
+	struct psi_write_args psi_args = {0};
+
+	crc = crc32(0, args.to, args.offset);
+
+	psi_args.to = args.to;
+	psi_args.from = &crc;
+	psi_args.len = CRC_SIZE_IN_BYTES;
+	psi_args.offset = args.offset;
+	psi_args.pid = args.pid;
+	psi_args.new_psi_section = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc = true;
+
+	nbytes += dummy_fe_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+struct dvb_dummy_desc *dummy_fe_desc_init(struct dvb_dummy_desc *head,
+					  u8 type,
+					  u8 length)
+{
+	struct dvb_dummy_desc *desc;
+
+	/* alloc enough memory for the flexible array too */
+	desc = kzalloc(sizeof(*desc) + length, GFP_KERNEL);
+
+	desc->type = type;
+	desc->length = length;
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = desc;
+	}
+
+	return desc;
+}
+
+void dummy_fe_desc_destroy(struct dvb_dummy_desc *desc)
+{
+	struct dvb_dummy_desc *curr = desc;
+	struct dvb_dummy_desc *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+static u32
+dummy_fe_desc_comp_len(struct dvb_dummy_desc *desc)
+{
+	u32 length = 0;
+
+	if (!desc)
+		return 0;
+
+	while (desc) {
+		length += desc->length;
+		desc = desc->next;
+	}
+
+	return length;
+}
+
+void dummy_fe_desc_assign(struct dvb_dummy_desc *desc,
+			  struct dvb_dummy_desc *desc_ptr,
+			  u16 *desc_length)
+{
+	if (desc_ptr)
+		/* clean the old data */
+		dummy_fe_desc_destroy(desc_ptr);
+
+	*desc_length = dummy_fe_desc_comp_len(desc);
+	desc_ptr = desc;
+}
+
+static u32 dummy_fe_desc_write_into(struct desc_write_args args)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	struct psi_write_args psi_args = {0};
+
+	psi_args.to = args.to;
+	psi_args.from = args.desc;
+	psi_args.len = 16; /* u8 type + u8 length */
+	psi_args.offset = args.offset;
+	psi_args.pid = args.pid;
+	psi_args.new_psi_section = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc = false;
+
+	nbytes += dummy_fe_ts_psi_write_into(psi_args);
+
+	/* move 'from' pointer to point to u8 data[] */
+	psi_args.from = args.desc + nbytes + sizeof(struct dvb_dummy_desc *);
+	psi_args.len = args.desc->length;
+	psi_args.offset = args.offset + nbytes;
+
+	nbytes += dummy_fe_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+static u32
+dummy_fe_table_header_write_into(struct header_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	struct psi_write_args psi_args = {0};
+
+	psi_args.to = args.to;
+	psi_args.from = args.h;
+	psi_args.len = sizeof(struct dvb_dummy_table_header);
+	psi_args.offset = args.offset;
+	psi_args.pid = args.pid;
+	psi_args.new_psi_section = true;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc = false;
+
+	nbytes += dummy_fe_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+static u16
+dummy_fe_pat_table_comp_sec_len(struct dvb_dummy_table_pat *pat)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.43 */
+	u16 length = 0;
+	u32 i;
+
+	/* from immediately after 'section_length' until 'last_section_number'*/
+	length += PAT_LEN_UNTIL_LAST_SECTION_NUMBER;
+
+	for (i = 0; i < pat->programs; ++i)
+		/* do not count the pointer */
+		length += sizeof(struct dvb_dummy_table_pat_program) -
+			  sizeof(struct dvb_dummy_table_pat_program *);
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > PAT_MAX_SECTION_LEN);
+	return length;
+}
+
+static u16
+dummy_fe_pmt_table_comp_sec_len(struct dvb_dummy_table_pmt *pmt)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.46 */
+	u16 length = 0;
+	struct dvb_dummy_table_pmt_stream *s = pmt->stream;
+
+	/* from immediately after 'section_length' until 'program_info_length'*/
+	length += PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH;
+
+	/* do not fail if 'desc_length' has not been computed yet */
+	length += dummy_fe_desc_comp_len(pmt->descriptor);
+	length += pmt->desc_length;
+
+	while (s) {
+		/* skip both pointers at the end */
+		length += sizeof(struct dvb_dummy_table_pmt_stream) -
+			  sizeof(struct dvb_dummy_desc *) -
+			  sizeof(struct dvb_dummy_table_pmt_stream *);
+
+		length += dummy_fe_desc_comp_len(s->descriptor);
+		s = s->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > PMT_MAX_SECTION_LEN);
+	return length;
+}
+
+static u16
+dummy_fe_sdt_table_comp_sec_len
+(struct dvb_dummy_table_sdt *sdt)
+{
+	/* see ETSI EN 300 468 V 1.10.1 p.24 */
+	u16 length = 0;
+	struct dvb_dummy_table_sdt_service *s = sdt->service;
+
+	/*
+	 * from immediately after 'section_length' until
+	 * 'reserved_for_future_use'
+	 */
+	length += SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE;
+
+	while (s) {
+		/* skip both pointers at the end */
+		length += sizeof(struct dvb_dummy_table_pmt_stream) -
+			  sizeof(struct dvb_dummy_desc *) -
+			  sizeof(struct dvb_dummy_table_pmt_stream *);
+		/* do not fail if 'desc_length' has not been computed yet */
+		length += dummy_fe_desc_comp_len(s->descriptor);
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > SDT_MAX_SECTION_LEN);
+	return length;
+}
+
+struct dvb_dummy_table_pat_program*
+dummy_fe_pat_program_init(struct dvb_dummy_table_pat_program *head,
+			  u16 service_id,
+			  u16 pid)
+{
+	struct dvb_dummy_table_pat_program *program;
+
+	program = kzalloc(sizeof(*program), GFP_KERNEL);
+
+	program->service_id = service_id;
+	program->pid = pid; /* pid for the PMT section in the TS */
+	program->next = NULL;
+	program->reserved = 0x7;
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
+dummy_fe_pat_program_destroy(struct dvb_dummy_table_pat_program *p)
+{
+	struct dvb_dummy_table_pat_program *curr = p;
+	struct dvb_dummy_table_pat_program *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+void
+dummy_fe_pat_program_assign(struct dvb_dummy_table_pat *pat,
+			    struct dvb_dummy_table_pat_program *p)
+{
+	u16 program_count = 0;
+	struct dvb_dummy_table_pat_program *program = p;
+
+	if (pat->program)
+		dummy_fe_pat_program_destroy(pat->program);
+
+	while (program) {
+		++program_count;
+		program = program->next;
+	}
+
+	pat->programs = program_count;
+
+	/* Recompute section length */
+	pat->header.section_length = dummy_fe_pat_table_comp_sec_len(pat);
+
+	pat->program = p;
+}
+
+void dummy_fe_pat_table_init(struct dvb_dummy_table_pat *pat,
+			     bool update_version_num,
+			     u16 transport_stream_id)
+{
+	static u8 pat_version;
+
+	pat->header.table_id = 0x0;
+	pat->header.syntax = 0x1;
+	pat->header.zero = 0x0;
+	pat->header.one = 0x03;
+
+	pat->header.id = transport_stream_id; /* transport stream ID, at will */
+	pat->header.current_next = 0x1;
+
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+	if (update_version_num)
+		++pat_version;
+
+	pat->header.version = pat_version;
+
+	pat->header.one2 = 0x03;
+	pat->header.section_id = 0x0;
+	pat->header.last_section = 0x0;
+
+	pat->programs = 0;
+
+	pat->header.section_length = dummy_fe_pat_table_comp_sec_len(pat);
+}
+
+u32 dummy_fe_pat_write_into(char *buf,
+			    u32 offset,
+			    struct dvb_dummy_table_pat *pat)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	u8 continuity_counter = 0;
+	const u16 pat_pid = pat->header.table_id; /* always 0x0 */
+
+	struct dvb_dummy_table_pat_program *p = pat->program;
+	struct header_write_args h_args = {0};
+	struct psi_write_args args = {0};
+	struct crc32_write_args c_args = {0};
+
+	h_args.to = buf;
+	h_args.offset = offset;
+	h_args.h = &pat->header;
+	h_args.pid = pat_pid;
+	h_args.continuity_counter = &continuity_counter;
+
+	nbytes += dummy_fe_table_header_write_into(h_args);
+
+	args.to = buf;
+	args.from = pat + sizeof(struct dvb_dummy_table_header),
+	args.len = sizeof(pat->programs);
+	args.offset = offset + nbytes;
+	args.pid = pat_pid;
+	args.new_psi_section = false;
+	args.continuity_counter = &continuity_counter;
+	args.is_crc = false;
+
+	nbytes += dummy_fe_ts_psi_write_into(args);
+
+	while (p) {
+		args.from = p;
+		/* skip the pointer */
+		args. len = sizeof(*p) -
+			    sizeof(struct dvb_dummy_table_pat_program *);
+		args.offset = offset + nbytes;
+
+		nbytes += dummy_fe_ts_psi_write_into(args);
+		p = p->next;
+	}
+
+	c_args.to = buf;
+	c_args.offset = offset + nbytes;
+	c_args.pid = pat_pid;
+	c_args.continuity_counter = &continuity_counter;
+
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void
+dummy_fe_pat_table_destroy(struct dvb_dummy_table_pat *p)
+{
+	dummy_fe_pat_program_destroy(p->program);
+}
+
+struct dvb_dummy_table_pmt_stream*
+dummy_fe_pmt_stream_init(struct dvb_dummy_table_pmt_stream *head,
+			 enum dvb_dummy_stream_types stream_type,
+			 u16 es_pid)
+{
+	struct dvb_dummy_table_pmt_stream *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+
+	stream->type = stream_type;
+	stream->elementary_pid = es_pid;
+	stream->reserved = 0x07;
+
+	stream->desc_length = dummy_fe_desc_comp_len(stream->descriptor);
+
+	stream->zero = 0x0;
+	stream->reserved2 = 0x0f;
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
+void dummy_fe_pmt_stream_destroy(struct dvb_dummy_table_pmt_stream *s)
+{
+	struct dvb_dummy_table_pmt_stream *curr_stream = s;
+	struct dvb_dummy_table_pmt_stream *tmp_stream = NULL;
+
+	while (curr_stream) {
+		tmp_stream = curr_stream;
+		curr_stream = curr_stream->next;
+		kfree(tmp_stream);
+	}
+}
+
+void dummy_fe_pmt_stream_assign(struct dvb_dummy_table_pmt *pmt,
+				struct dvb_dummy_table_pmt_stream *s)
+{
+	struct dvb_dummy_table_pmt_stream *stream = s;
+	struct dvb_dummy_desc *desc = s->descriptor;
+
+	if (pmt->stream)
+		dummy_fe_pmt_stream_destroy(pmt->stream);
+
+	while (stream)
+		stream = stream->next;
+
+	while (desc)
+		desc = desc->next;
+
+	/* Recompute section length */
+	pmt->header.section_length = dummy_fe_pmt_table_comp_sec_len(pmt);
+
+	pmt->stream = s;
+}
+
+u16 dummy_fe_pmt_get_pid(struct dvb_dummy_table_pmt *section,
+			 struct dvb_dummy_table_pat *pat)
+{
+	struct dvb_dummy_table_pat_program *program = pat->program;
+
+	while (program)
+		/*
+		 * service_id is the same as program_number in the
+		 * corresponding program_map_section
+		 * see ETSI EN 300 468 v1.15.1 p. 24
+		 */
+		if (program->service_id == section->header.id)
+			return pat->program->pid;
+
+	return LAST_VALID_TS_PID + 1; /* not found */
+}
+
+void dummy_fe_pmt_table_init(struct dvb_dummy_table_pmt *pmt,
+			     bool update_version_num,
+			     u16 program_number,
+			     u16 pcr_pid)
+{
+	static u8 pmt_version;
+
+	pmt->header.table_id = 0x2;
+	pmt->header.syntax = 0x1;
+	pmt->header.zero = 0x0;
+	pmt->header.one = 0x3;
+
+	pmt->header.id = program_number;
+	pmt->header.current_next = 0x1;
+
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+	if (update_version_num)
+		++pmt_version;
+
+	pmt->header.version = pmt_version;
+
+	pmt->header.one2 = 0x3;
+	pmt->header.section_id = 0;
+	pmt->header.last_section = 0;
+
+	pmt->pcr_pid = (pcr_pid) ? pcr_pid : 0x1fff;
+	pmt->reserved2 = 0x03;
+
+	pmt->reserved3 = 0x0f;
+	pmt->zero3 = 0x0;
+
+	pmt->desc_length = dummy_fe_desc_comp_len(pmt->descriptor);
+
+	pmt->header.section_length = dummy_fe_pmt_table_comp_sec_len(pmt);
+}
+
+u32 dummy_fe_pmt_write_into(char *buf,
+			    u32 offset,
+			    struct dvb_dummy_table_pmt *pmt,
+			    u16 pid)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	u8 continuity_counter = 0;
+	struct dvb_dummy_desc *table_descriptor = pmt->descriptor;
+	struct dvb_dummy_table_pmt_stream *stream = pmt->stream;
+	struct dvb_dummy_desc *stream_descriptor = (stream) ?
+						    pmt->stream->descriptor :
+						    NULL;
+
+	struct header_write_args h_args = {0};
+	struct psi_write_args args = {0};
+	struct desc_write_args d_args = {0};
+	struct crc32_write_args c_args = {0};
+
+	h_args.to = buf;
+	h_args.offset = offset;
+	h_args.h = &pmt->header;
+	h_args.pid = pid;
+	h_args.continuity_counter = &continuity_counter;
+
+	nbytes += dummy_fe_table_header_write_into(h_args);
+
+	args.to = buf;
+	args.from = pmt + sizeof(struct dvb_dummy_table_header);
+	args.len = 32;
+	args.offset = offset + nbytes;
+	args.pid = pid;
+	args.new_psi_section = false;
+	args.continuity_counter = &continuity_counter;
+	args.is_crc = false;
+
+	nbytes += dummy_fe_ts_psi_write_into(args);
+
+	while (table_descriptor) {
+		d_args.to = buf;
+		d_args.offset = offset + nbytes;
+		d_args.desc = table_descriptor;
+		d_args.pid = pid;
+		d_args.continuity_counter = &continuity_counter;
+		nbytes += dummy_fe_desc_write_into(d_args);
+
+		table_descriptor = table_descriptor->next;
+	}
+
+	while (stream) {
+		args.from = stream;
+		args.len = 40; /* u8 type + (2* u16) bitfields */
+		args.offset = offset + nbytes;
+
+		nbytes += dummy_fe_ts_psi_write_into(args);
+
+		while (stream_descriptor) {
+			d_args.desc = stream_descriptor;
+			d_args.offset = offset + nbytes;
+			nbytes += dummy_fe_desc_write_into(d_args);
+
+			stream_descriptor = stream_descriptor->next;
+		}
+
+		stream = stream->next;
+	}
+
+	c_args.to = buf;
+	c_args.offset = offset + nbytes;
+	c_args.pid = pid;
+	c_args.continuity_counter = &continuity_counter;
+
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void dummy_fe_pmt_table_destroy(struct dvb_dummy_table_pmt *pmt)
+{
+	struct dvb_dummy_desc *curr_desc = pmt->descriptor;
+	struct dvb_dummy_desc *tmp_desc = NULL;
+
+	while (curr_desc) {
+		tmp_desc = curr_desc;
+		curr_desc = curr_desc->next;
+		dummy_fe_desc_destroy(tmp_desc);
+		kfree(tmp_desc);
+	}
+
+	dummy_fe_pmt_stream_destroy(pmt->stream);
+}
+
+void dummy_fe_sdt_table_init(struct dvb_dummy_table_sdt *sdt,
+			     bool update_version_num,
+			     u16 transport_stream_id)
+{
+	static u8 sdt_version;
+
+	sdt->header.table_id = 0x42;
+
+	sdt->header.one = 0x3;
+	sdt->header.zero = 0x1;
+	/*
+	 * The PAT, PMT, and CAT all set this to 0.
+	 * Other tables set this to 1.
+	 */
+	sdt->header.syntax = 0x1;
+
+	/*
+	 * This is a 16-bit field which serves as a label for identification
+	 * of the TS, about which the SDT informs, from any other multiplex
+	 * within the delivery system.
+	 */
+	sdt->header.id = transport_stream_id;
+	sdt->header.current_next = 0x1;
+
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+	if (update_version_num)
+		++sdt_version;
+
+	sdt->header.version = sdt_version;
+
+	sdt->header.one2 = 0x3;
+	sdt->header.section_id = 0;
+	sdt->header.last_section = 0;
+
+	sdt->network_id = transport_stream_id;
+	sdt->reserved = 0xff;
+
+	sdt->header.section_length =
+		dummy_fe_sdt_table_comp_sec_len(sdt);
+}
+
+u32 dummy_fe_sdt_write_into(char *buf,
+			    u32 offset,
+			    struct dvb_dummy_table_sdt *sdt)
+{
+	u32 nbytes = 0; /* the number of bytes written */
+	u16 sdt_pid = 0x11; /* see ETSI EN 300 468 v1.15.1 p. 11 */
+	u8 continuity_counter = 0;
+
+	struct dvb_dummy_table_sdt_service *service = sdt->service;
+	struct dvb_dummy_desc *service_desc = (sdt->service) ?
+					       sdt->service->descriptor :
+					       NULL;
+
+	struct header_write_args h_args = {0};
+	struct psi_write_args args = {0};
+	struct desc_write_args d_args = {0};
+	struct crc32_write_args c_args = {0};
+
+	h_args.to = buf;
+	h_args.offset = offset;
+	h_args.h = &sdt->header;
+	h_args.pid = sdt_pid;
+	h_args.continuity_counter = &continuity_counter;
+
+	nbytes += dummy_fe_table_header_write_into(h_args);
+
+	args.to = buf;
+	args.from = sdt + sizeof(struct dvb_dummy_table_header);
+	args.len = 16;
+	args.offset = offset + nbytes;
+	args.pid = sdt_pid;
+	args.new_psi_section = false;
+	args.continuity_counter = &continuity_counter;
+	args.is_crc = false;
+
+	/* copy u16 network_id + u8 reserved)*/
+	nbytes += dummy_fe_ts_psi_write_into(args);
+
+	while (service) {
+		/* u16 service_id + u8 + u16 bitfield */
+		args.from = service;
+		args.len = 40;
+		args.offset = offset + nbytes;
+
+		nbytes += dummy_fe_ts_psi_write_into(args);
+
+		while (service_desc) {
+			d_args.to = buf;
+			d_args.offset = offset + nbytes;
+			d_args.desc = service_desc;
+			d_args.pid = sdt_pid;
+			d_args.continuity_counter = &continuity_counter;
+			nbytes += dummy_fe_desc_write_into(d_args);
+
+			service_desc = service_desc->next;
+		}
+
+		service = service->next;
+	}
+
+	c_args.to = buf;
+	c_args.offset = offset + nbytes;
+	c_args.pid = sdt_pid;
+	c_args.continuity_counter = &continuity_counter;
+
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void dummy_fe_sdt_table_destroy(struct dvb_dummy_table_sdt *sdt)
+{
+	struct dvb_dummy_table_sdt_service *curr_service = sdt->service;
+	struct dvb_dummy_table_sdt_service *tmp_service = NULL;
+	struct dvb_dummy_desc *curr_desc = (sdt->service) ?
+					   sdt->service->descriptor : NULL;
+	struct dvb_dummy_desc *tmp_desc = NULL;
+
+	while (curr_service) {
+		curr_desc = curr_service->descriptor;
+
+		while (curr_desc) {
+			/* clear all descriptors for the service */
+			tmp_desc = curr_desc;
+			curr_desc = curr_desc->next;
+			dummy_fe_desc_destroy(tmp_desc);
+			kfree(tmp_desc);
+		}
+
+		/* then clear the current service */
+		tmp_service = curr_service;
+		curr_service = curr_service->next;
+		kfree(tmp_service);
+	}
+}
+
+struct dvb_dummy_table_sdt_service*
+dummy_fe_sdt_service_init(struct dvb_dummy_table_sdt_service *head,
+			  u16 service_id)
+{
+	struct dvb_dummy_table_sdt_service *service;
+
+	service = kzalloc(sizeof(*service), GFP_KERNEL);
+
+	/*
+	 * ETSI 300 468: this is a 16bit field which serves as a label to
+	 * identify this service from any other service within the TS.
+	 * The service id is the same as the program number in the
+	 * corresponding program_map_section
+	 */
+	service->service_id = service_id;
+	service->EIT_schedule = 0x0; /* TODO */
+	service->EIT_present_following = 0x0; /* TODO */
+	service->reserved = 0x3f; /* all bits on */
+	service->free_CA_mode = 0x0; /* not scrambled */
+	service->running_status = RUNNING;
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
+dummy_fe_sdt_service_destroy(struct dvb_dummy_table_sdt_service *service)
+{
+	struct dvb_dummy_table_sdt_service *curr = service;
+	struct dvb_dummy_table_sdt_service *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+void
+dummy_fe_sdt_service_assign(struct dvb_dummy_table_sdt *sdt,
+			    struct dvb_dummy_table_sdt_service *service)
+{
+	if (sdt->service)
+		/* clean up old services */
+		dummy_fe_sdt_service_destroy(sdt->service);
+
+	sdt->service = service;
+
+	sdt->header.section_length = dummy_fe_sdt_table_comp_sec_len(sdt);
+}
+
+void
+dummy_fe_pmt_create_section_for_each_pat_entry(struct dvb_dummy_table_pat *pat,
+					       struct dvb_dummy_table_pmt *sec)
+
+{
+	/*
+	 * PMTs contain information about programs. For each program,
+	 * there is one PMT
+	 */
+	struct dvb_dummy_table_pat_program *program = pat->program;
+	u32 i = 0;
+
+	while (program) {
+		dummy_fe_pmt_table_init(&sec[i],
+					false,
+					sec[i].header.id,
+					0);
+
+		++i;
+		program = program->next;
+	}
+}
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe_psi.h b/drivers/media/dvb-frontends/dvb_dummy_fe_psi.h
new file mode 100644
index 000000000000..17118481148f
--- /dev/null
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe_psi.h
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef DVB_DUMMY_FE_PSI_H
+#define DVB_DUMMY_FE_PSI_H
+
+#include <linux/types.h>
+
+/*
+ * all section lengths start immediately after the 'section_length' field
+ * see ISO/IEC 13818-1 : 2000 and ETSI EN 300 468 V 1.10.1 for
+ * reference
+ */
+#define PAT_LEN_UNTIL_LAST_SECTION_NUMBER 40
+#define PAT_MAX_SECTION_LEN 1021
+#define PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH 72
+#define PMT_MAX_SECTION_LEN 1021
+#define SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE 64
+#define SDT_MAX_SECTION_LEN 1021
+
+enum dvb_dummy_descriptors {
+	SERVICE_DESCRIPTOR = 0x48,
+};
+
+enum dvb_dummy_stream_types {
+	ISO_IEC_13818_3_AUDIO = 0x4,
+};
+
+struct dvb_dummy_desc {
+	u8 type;
+	u8 length;
+	struct dvb_dummy_desc *next;
+	u8 data[];
+} __packed;
+
+struct dvb_dummy_desc_service {
+	u8 type;
+	u8 length;
+	struct dvb_desc *next;
+
+	u8 service_type;
+	char *name;
+	char *name_emph;
+	char *provider;
+	char *provider_emph;
+} __packed;
+
+struct dvb_dummy_table_header {
+	u8  table_id;
+	union {
+		u16 bitfield;
+		struct {
+			u16 section_length:12;
+			u8  one:2;
+			u8  zero:1;
+			u8  syntax:1;
+		} __packed;
+	} __packed;
+	u16 id;			/* TS ID */
+	u8  current_next:1;
+	u8  version:5;
+	u8  one2:2;
+
+	u8  section_id;		/* section_number */
+	u8  last_section;		/* last_section_number */
+} __packed;
+
+struct dvb_dummy_table_pat_program {
+	u16 service_id;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pid:13;
+			u8  reserved:3;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_table_pat_program *next;
+} __packed;
+
+struct dvb_dummy_table_pat {
+	struct dvb_dummy_table_header header;
+	u16 programs;
+	struct dvb_dummy_table_pat_program *program;
+} __packed;
+
+struct dvb_dummy_table_sdt_service {
+	u16 service_id;
+	u8 EIT_present_following:1;
+	u8 EIT_schedule:1;
+	u8 reserved:6;
+	union {
+		u16 bitfield;
+		struct {
+			u16 desc_length:12;
+			u16 free_CA_mode:1;
+			u16 running_status:3;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_desc *descriptor;
+	struct dvb_dummy_table_sdt_service *next;
+} __packed;
+
+struct dvb_dummy_table_sdt {
+	struct dvb_dummy_table_header header;
+	u16 network_id;
+	u8  reserved;
+	struct dvb_dummy_table_sdt_service *service;
+} __packed;
+
+enum service_running_status {
+	RUNNING,
+};
+
+enum service_type {
+	/* see ETSI EN 300 468 v1.15.1 p. 77 */
+	DIGITAL_TELEVISION_SERVICE = 0x1,
+};
+
+struct dvb_dummy_table_pmt_stream {
+	u8 type;
+	union {
+		u16 bitfield;
+		struct {
+			u16 elementary_pid:13;
+			u16 reserved:3;
+		} __packed;
+	} __packed;
+	union {
+		u16 bitfield2;
+		struct {
+			u16 desc_length:10;
+			u16 zero:2;
+			u16 reserved2:4;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_desc *descriptor;
+	struct dvb_dummy_table_pmt_stream *next;
+} __packed;
+
+struct dvb_dummy_table_pmt {
+	struct dvb_dummy_table_header header;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pcr_pid:13;
+			u16 reserved2:3;
+		} __packed;
+	} __packed;
+
+	union {
+		u16 bitfield2;
+		struct {
+			u16 desc_length:10;
+			u16 zero3:2;
+			u16 reserved3:4;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_desc *descriptor;
+	struct dvb_dummy_table_pmt_stream *stream;
+} __packed;
+
+struct psi_write_args {
+	void *to;
+	void *from;
+	size_t len; /* how much to write */
+	u32 offset; /* where to start writing in the buffer */
+	u16 pid; /* TS packet ID */
+	bool new_psi_section; /* set when starting a table section */
+	u8 *continuity_counter; /* TS: incremented when section gets split */
+	bool is_crc; /* set when writing the CRC at the end */
+};
+
+struct desc_write_args {
+	void *to;
+	u32 offset;
+	struct dvb_dummy_desc *desc;
+	u16 pid;
+	u8 *continuity_counter;
+};
+
+struct crc32_write_args {
+	void *to;
+	u32 offset;
+	u16 pid;
+	u8 *continuity_counter;
+};
+
+struct header_write_args {
+	void *to;
+	u32 offset;
+	struct dvb_dummy_table_header *h;
+	u16 pid;
+	u8 *continuity_counter;
+};
+
+struct dvb_dummy_desc *dummy_fe_desc_init(struct dvb_dummy_desc *head,
+					  u8 type,
+					  u8 length);
+
+void dummy_fe_pat_table_init(struct dvb_dummy_table_pat *pat,
+			     bool update_version_num,
+			     u16 transport_stream_id);
+
+struct dvb_dummy_table_pat_program*
+dummy_fe_pat_program_init(struct dvb_dummy_table_pat_program *head,
+			  u16 service_id,
+			  u16 pid);
+
+struct dvb_dummy_table_pmt_stream*
+dummy_fe_pmt_stream_init(struct dvb_dummy_table_pmt_stream *head,
+			 enum dvb_dummy_stream_types stream_type,
+			 u16 es_pid);
+
+void dummy_fe_pmt_table_init(struct dvb_dummy_table_pmt *pmt,
+			     bool update_version_num,
+			     u16 program_number,
+			     u16 pcr_pid);
+
+void
+dummy_fe_sdt_table_init(struct dvb_dummy_table_sdt *sdt,
+			bool update_version_num,
+			u16 transport_stream_id);
+
+struct dvb_dummy_table_sdt_service*
+dummy_fe_sdt_service_init(struct dvb_dummy_table_sdt_service *head,
+			  u16 service_id);
+
+void
+dummy_fe_desc_destroy(struct dvb_dummy_desc *desc);
+
+void
+dummy_fe_pat_program_destroy(struct dvb_dummy_table_pat_program *p);
+
+void
+dummy_fe_pat_table_destroy(struct dvb_dummy_table_pat *p);
+
+void
+dummy_fe_pmt_stream_destroy(struct dvb_dummy_table_pmt_stream *s);
+
+void
+dummy_fe_pmt_table_destroy(struct dvb_dummy_table_pmt *pmt);
+
+void
+dummy_fe_sdt_table_destroy(struct dvb_dummy_table_sdt *sdt);
+
+void
+dummy_fe_sdt_service_destroy(struct dvb_dummy_table_sdt_service *service);
+
+void
+dummy_fe_desc_destroy(struct dvb_dummy_desc *desc);
+
+void
+dummy_fe_pat_program_destroy(struct dvb_dummy_table_pat_program *p);
+
+void
+dummy_fe_sdt_service_assign(struct dvb_dummy_table_sdt *sdt,
+			    struct dvb_dummy_table_sdt_service *service);
+
+void dummy_fe_desc_assign(struct dvb_dummy_desc *desc,
+			  struct dvb_dummy_desc *desc_ptr,
+			  u16 *desc_length);
+
+void dummy_fe_pat_program_assign(struct dvb_dummy_table_pat *pat,
+				 struct dvb_dummy_table_pat_program *p);
+
+void dummy_fe_pmt_stream_assign(struct dvb_dummy_table_pmt *pmt,
+				struct dvb_dummy_table_pmt_stream *s);
+void
+dummy_fe_pmt_create_section_for_each_pat_entry(struct dvb_dummy_table_pat *pat,
+					       struct dvb_dummy_table_pmt *sec);
+
+u16 dummy_fe_pmt_get_pid(struct dvb_dummy_table_pmt *section,
+			 struct dvb_dummy_table_pat *pat);
+
+u32 dummy_fe_pat_write_into(char *buf,
+			    u32 offset,
+			    struct dvb_dummy_table_pat *pat);
+
+u32 dummy_fe_sdt_write_into(char *buf,
+			    u32 offset,
+			    struct dvb_dummy_table_sdt *sdt);
+
+u32 dummy_fe_pmt_write_into(char *buf,
+			    u32 offset,
+			    struct dvb_dummy_table_pmt *pmt,
+			    u16 pid);
+
+#endif // DVB_DUMMY_FE_PSI_H
-- 
2.25.2

