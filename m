Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9E92A1873
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgJaPGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbgJaPGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:12 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F61C0617A6;
        Sat, 31 Oct 2020 08:06:11 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id r8so6257547qtp.13;
        Sat, 31 Oct 2020 08:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o15QLCzgOCOc0pPyfxbz6Drtyo9Yovhi7q2d2idBagE=;
        b=oOf1dFTsgEuVxMxrzx4CH59jxQCbZmabFD+PaUE1eXkldRudO6HHcFKyTCbCHbDNbt
         /mGKgBCQfIJssI5vjYEC5fKHEZZy7Z1BFA0k/2/TXKcv7Z8g42pqAXbVMsjaR6Nn2o8x
         PWvjxpQkb4xz8psQ8YsHtIju6i/mepMpbAzXmtKMfgMKU+9igLFoK+dldeIZHHvSjZlG
         BhxE9y9QD4Zwjt649s/MQlxgOFPpOpbQd7VG8c8WaWCHN1+7GjByVI25IzpYclcI1edV
         zGvkbLcH+0E6VCDPFrQDt3b8HrL647Mcx4CZXTeNDmRoVUBtVASWSnmnZ8qRvN5/gGKG
         liwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o15QLCzgOCOc0pPyfxbz6Drtyo9Yovhi7q2d2idBagE=;
        b=jY0tC5hhwCUmd24SkO0gN8T1EgSfT941zSQzfHjA03tkLreidlRllYiAJcCGXWsfZb
         QhJGCZUMs58RCrhoRRnYOX5Pc5qNZpJVEPpoQa8hiN8hGQc113IlzM7sCrALygdqOATB
         9s0Fk3uZ3+Q7upVfBR4t+2nRoYy/vA0b+d7nizqewSBhGMWqn7eXy2mUhAor/mL4Tgvl
         dFMmn9QMP57D2xQzdpuBp0TPGcub2VQEzZ1x2qfaFQuNOOceeAQyLDb+wFTDVtTycxWe
         rN8Kct/JSTvK/ZgE3x8P2EepGPtNGytf0Ri31NNcl2hVd/j2JQF679rdwJm0lf5U4uV4
         sp+w==
X-Gm-Message-State: AOAM533YmJ/ofnmRlvCai+8/fzy3MlvSPW1V0Hsfnsu0D+BdNbt+bIsa
        BTDmCLSY2XhTMQC/4YfvL1c=
X-Google-Smtp-Source: ABdhPJxSQ7wpf7LVzPmViQeiHHZHBXa8zZGJCjU226odylERNmR4CJpKWQS6FQt1KbWi4JYQUgF4fA==
X-Received: by 2002:ac8:41ce:: with SMTP id o14mr6946665qtm.294.1604156770494;
        Sat, 31 Oct 2020 08:06:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:09 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] media: vidtv: psi: Implement an Event Information Table (EIT)
Date:   Sat, 31 Oct 2020 12:05:49 -0300
Message-Id: <20201031150552.663598-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Implement an Event Information Table (EIT) as per EN 300 468
5.2.4.

The EIT provides information in chronological order regarding
the events contained within each service.

For now only present event information is supported.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../driver-api/media/drivers/vidtv.rst        |   8 +-
 .../media/test-drivers/vidtv/vidtv_channel.c  |  71 +++-
 .../media/test-drivers/vidtv/vidtv_channel.h  |   3 +
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  13 +
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |   2 +
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 315 +++++++++++++++++-
 drivers/media/test-drivers/vidtv/vidtv_psi.h  | 121 ++++++-
 7 files changed, 524 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
index 2d7ddf676b13..38c49a3c11a7 100644
--- a/Documentation/driver-api/media/drivers/vidtv.rst
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -149,11 +149,11 @@ vidtv_psi.[ch]
 	Because the generator is implemented in a separate file, it can be
 	reused elsewhere in the media subsystem.
 
-	Currently vidtv supports working with 4 PSI tables: PAT, PMT,
-	SDT and NIT.
+	Currently vidtv supports working with 5 PSI tables: PAT, PMT,
+	SDT, NIT and EIT.
 
 	The specification for PAT and PMT can be found in *ISO 13818-1:
-	Systems*, while the specification for the SDT, NIT can be found in *ETSI
+	Systems*, while the specification for the SDT, NIT, EIT can be found in *ETSI
 	EN 300 468: Specification for Service Information (SI) in DVB
 	systems*.
 
@@ -197,6 +197,8 @@ vidtv_channel.[ch]
 
 	#. Their programs will be concatenated to populate the PAT
 
+ 	#. Their events will be concatenated to populate the EIT
+
 	#. For each program in the PAT, a PMT section will be created
 
 	#. The PMT section for a channel will be assigned its streams.
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index a246b49123d9..13e56544bb1e 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -9,6 +9,7 @@
  * When vidtv boots, it will create some hardcoded channels.
  * Their services will be concatenated to populate the SDT.
  * Their programs will be concatenated to populate the PAT
+ * Their events will be concatenated to populate the EIT
  * For each program in the PAT, a PMT section will be created
  * The PMT section for a channel will be assigned its streams.
  * Every stream will have its corresponding encoder polled to produce TS packets
@@ -59,13 +60,17 @@ struct vidtv_channel
 
 	char *name = ENCODING_ISO8859_15 "Beethoven";
 	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
+	char *iso_language_code = ENCODING_ISO8859_15 "eng";
+	char *event_name = ENCODING_ISO8859_15 "Beethoven Music";
+	char *event_text = ENCODING_ISO8859_15 "Beethoven's 5th Symphony";
+	const u16 s302m_beethoven_event_id  = 1;
 
 	struct vidtv_channel *s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
 	struct vidtv_s302m_encoder_init_args encoder_args = {};
 
 	s302m->name = kstrdup(name, GFP_KERNEL);
 
-	s302m->service = vidtv_psi_sdt_service_init(NULL, s302m_service_id);
+	s302m->service = vidtv_psi_sdt_service_init(NULL, s302m_service_id, false, true);
 
 	s302m->service->descriptor = (struct vidtv_psi_desc *)
 				     vidtv_psi_service_desc_init(NULL,
@@ -94,6 +99,13 @@ struct vidtv_channel
 
 	s302m->encoders = vidtv_s302m_encoder_init(encoder_args);
 
+	s302m->events = vidtv_psi_eit_event_init(NULL, s302m_beethoven_event_id);
+	s302m->events->descriptor = (struct vidtv_psi_desc *)
+				    vidtv_psi_short_event_desc_init(NULL,
+								    iso_language_code,
+								    event_name,
+								    event_text);
+
 	if (head) {
 		while (head->next)
 			head = head->next;
@@ -104,6 +116,48 @@ struct vidtv_channel
 	return s302m;
 }
 
+static struct vidtv_psi_table_eit_event
+*vidtv_channel_eit_event_cat_into_new(struct vidtv_mux *m)
+{
+	/* Concatenate the events */
+	const struct vidtv_channel *cur_chnl = m->channels;
+
+	struct vidtv_psi_table_eit_event *curr = NULL;
+	struct vidtv_psi_table_eit_event *head = NULL;
+	struct vidtv_psi_table_eit_event *tail = NULL;
+
+	struct vidtv_psi_desc *desc = NULL;
+	u16 event_id;
+
+	if (!cur_chnl)
+		return NULL;
+
+	while (cur_chnl) {
+		curr = cur_chnl->events;
+
+		if (!curr)
+			dev_warn_ratelimited(m->dev,
+					     "No events found for channel %s\n", cur_chnl->name);
+
+		while (curr) {
+			event_id = be16_to_cpu(curr->event_id);
+			tail = vidtv_psi_eit_event_init(tail, event_id);
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
 static struct vidtv_psi_table_sdt_service
 *vidtv_channel_sdt_serv_cat_into_new(struct vidtv_mux *m)
 {
@@ -129,7 +183,10 @@ static struct vidtv_psi_table_sdt_service
 
 		while (curr) {
 			service_id = be16_to_cpu(curr->service_id);
-			tail = vidtv_psi_sdt_service_init(tail, service_id);
+			tail = vidtv_psi_sdt_service_init(tail,
+							  service_id,
+							  curr->EIT_schedule,
+							  curr->EIT_present_following);
 
 			desc = vidtv_psi_desc_clone(curr->descriptor);
 			vidtv_psi_desc_assign(&tail->descriptor, desc);
@@ -297,6 +354,7 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	struct vidtv_psi_table_pat_program *programs = NULL;
 	struct vidtv_psi_table_sdt_service *services = NULL;
 	struct vidtv_psi_desc_service_list_entry *service_list = NULL;
+	struct vidtv_psi_table_eit_event *events = NULL;
 
 	m->si.pat = vidtv_psi_pat_table_init(m->transport_stream_id);
 
@@ -305,6 +363,8 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	programs = vidtv_channel_pat_prog_cat_into_new(m);
 	services = vidtv_channel_sdt_serv_cat_into_new(m);
 
+	events = vidtv_channel_eit_event_cat_into_new(m);
+
 	/* look for a service descriptor for every service */
 	service_list = vidtv_channel_build_service_list(services);
 
@@ -314,12 +374,17 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 					     m->network_name,
 					     service_list);
 
+	m->si.eit = vidtv_psi_eit_table_init(m->network_id, m->transport_stream_id);
+
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
 
 	/* assemble all services and assign to SDT */
 	vidtv_psi_sdt_service_assign(m->si.sdt, services);
 
+	/* assemble all events and assign to EIT */
+	vidtv_psi_eit_event_assign(m->si.eit, events);
+
 	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat, m->pcr_pid);
 
 	vidtv_channel_pmt_match_sections(m->channels,
@@ -342,6 +407,7 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 	kfree(m->si.pmt_secs);
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
 	vidtv_psi_nit_table_destroy(m->si.nit);
+	vidtv_psi_eit_table_destroy(m->si.eit);
 }
 
 void vidtv_channels_init(struct vidtv_mux *m)
@@ -361,6 +427,7 @@ void vidtv_channels_destroy(struct vidtv_mux *m)
 		vidtv_psi_pat_program_destroy(curr->program);
 		vidtv_psi_pmt_stream_destroy(curr->streams);
 		vidtv_channel_encoder_destroy(curr->encoders);
+		vidtv_psi_eit_event_destroy(curr->events);
 
 		tmp = curr;
 		curr = curr->next;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.h b/drivers/media/test-drivers/vidtv/vidtv_channel.h
index 2c3cba4313b0..40ed7fcdc5a1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -9,6 +9,7 @@
  * When vidtv boots, it will create some hardcoded channels.
  * Their services will be concatenated to populate the SDT.
  * Their programs will be concatenated to populate the PAT
+ * Their events will be concatenated to populate the EIT
  * For each program in the PAT, a PMT section will be created
  * The PMT section for a channel will be assigned its streams.
  * Every stream will have its corresponding encoder polled to produce TS packets
@@ -44,6 +45,7 @@
  * Will be concatenated into the PAT.
  * @streams: A stream loop used to populate the PMT section for 'program'
  * @encoders: A encoder loop. There must be one encoder for each stream.
+ * @events: Optional event information. This will feed into the EIT.
  * @next: Optionally chain this channel.
  */
 struct vidtv_channel {
@@ -54,6 +56,7 @@ struct vidtv_channel {
 	struct vidtv_psi_table_pat_program *program;
 	struct vidtv_psi_table_pmt_stream *streams;
 	struct vidtv_encoder *encoders;
+	struct vidtv_psi_table_eit_event *events;
 	struct vidtv_channel *next;
 };
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 2a960e87c39c..c3646dd269dd 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -76,6 +76,8 @@ static void vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
 	vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID);
 	/* push the NIT pid ctx */
 	vidtv_mux_create_pid_ctx_once(m, VIDTV_NIT_PID);
+	/* push the EIT pid ctx */
+	vidtv_mux_create_pid_ctx_once(m, VIDTV_EIT_PID);
 
 	/* add a ctx for all PMT sections */
 	while (p) {
@@ -120,11 +122,13 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	struct vidtv_mux_pid_ctx *pmt_ctx;
 	struct vidtv_mux_pid_ctx *sdt_ctx;
 	struct vidtv_mux_pid_ctx *nit_ctx;
+	struct vidtv_mux_pid_ctx *eit_ctx;
 
 	struct vidtv_psi_pat_write_args pat_args = {};
 	struct vidtv_psi_pmt_write_args pmt_args = {};
 	struct vidtv_psi_sdt_write_args sdt_args = {};
 	struct vidtv_psi_nit_write_args nit_args = {};
+	struct vidtv_psi_eit_write_args eit_args = {};
 
 	u32 nbytes; /* the number of bytes written by this function */
 	u16 pmt_pid;
@@ -133,6 +137,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	pat_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_PAT_PID);
 	sdt_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_SDT_PID);
 	nit_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_NIT_PID);
+	eit_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_EIT_PID);
 
 	pat_args.buf                = m->mux_buf;
 	pat_args.offset             = m->mux_buf_offset;
@@ -182,6 +187,14 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 
 	m->mux_buf_offset += vidtv_psi_nit_write_into(nit_args);
 
+	eit_args.buf                = m->mux_buf;
+	eit_args.offset             = m->mux_buf_offset;
+	eit_args.eit                = m->si.eit;
+	eit_args.buf_sz             = m->mux_buf_sz;
+	eit_args.continuity_counter = &eit_ctx->cc;
+
+	m->mux_buf_offset += vidtv_psi_eit_write_into(eit_args);
+
 	nbytes = m->mux_buf_offset - initial_offset;
 
 	m->num_streamed_si++;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 5dfbe30c2ac8..6eeb09fbfe4d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -58,6 +58,7 @@ struct vidtv_mux_timing {
  * @pat: The PAT in use by the muxer.
  * @pmt_secs: The PMT sections in use by the muxer. One for each program in the PAT.
  * @sdt: The SDT in use by the muxer.
+ * @eit: the EIT in use by the muxer.
  */
 struct vidtv_mux_si {
 	/* the SI tables */
@@ -65,6 +66,7 @@ struct vidtv_mux_si {
 	struct vidtv_psi_table_pmt **pmt_secs; /* the PMT sections */
 	struct vidtv_psi_table_sdt *sdt;
 	struct vidtv_psi_table_nit *nit;
+	struct vidtv_psi_table_eit *eit;
 };
 
 /**
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 0de6d646a483..b0b476545d65 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -28,6 +28,7 @@
 #define CRC_SIZE_IN_BYTES 4
 #define MAX_VERSION_NUM 32
 #define INITIAL_CRC 0xffffffff
+#define ISO_LANGUAGE_CODE_LEN 3
 
 static const u32 CRC_LUT[256] = {
 	/* from libdvbv5 */
@@ -454,6 +455,51 @@ struct vidtv_psi_desc_service_list
 	return desc;
 }
 
+struct vidtv_psi_desc_short_event
+*vidtv_psi_short_event_desc_init(struct vidtv_psi_desc *head,
+				 char *iso_language_code,
+				 char *event_name,
+				 char *text)
+{
+	struct vidtv_psi_desc_short_event *desc;
+	u32 event_name_len = event_name ? strlen(event_name) : 0;
+	u32 text_len =  text ? strlen(text) : 0;
+	u32 iso_len =  iso_language_code ? strlen(iso_language_code) : 0;
+
+	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+
+	desc->type = SHORT_EVENT_DESCRIPTOR;
+
+	desc->length = ISO_LANGUAGE_CODE_LEN +
+		       sizeof_field(struct vidtv_psi_desc_short_event, event_name_len) +
+		       event_name_len +
+		       sizeof_field(struct vidtv_psi_desc_short_event, text_len) +
+		       text_len;
+
+	desc->event_name_len = event_name_len;
+	desc->text_len = text_len;
+
+	if (iso_len != ISO_LANGUAGE_CODE_LEN)
+		iso_language_code = "eng";
+
+	desc->iso_language_code = kstrdup(iso_language_code, GFP_KERNEL);
+
+	if (event_name && event_name_len)
+		desc->event_name = kstrdup(event_name, GFP_KERNEL);
+
+	if (text && text_len)
+		desc->text = kstrdup(text, GFP_KERNEL);
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
 struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 {
 	struct vidtv_psi_desc *head = NULL;
@@ -463,6 +509,7 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 	struct vidtv_psi_desc_service *service;
 	struct vidtv_psi_desc_network_name *desc_network_name;
 	struct vidtv_psi_desc_service_list *desc_service_list;
+	struct vidtv_psi_desc_short_event  *desc_short_event;
 
 	while (desc) {
 		switch (desc->type) {
@@ -489,6 +536,15 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 								 desc_service_list->service_list);
 		break;
 
+		case SHORT_EVENT_DESCRIPTOR:
+			desc_short_event = (struct vidtv_psi_desc_short_event *)desc;
+			curr = (struct vidtv_psi_desc *)
+			       vidtv_psi_short_event_desc_init(head,
+							       desc_short_event->iso_language_code,
+							       desc_short_event->event_name,
+							       desc_short_event->text);
+		break;
+
 		case REGISTRATION_DESCRIPTOR:
 		default:
 			curr = kzalloc(sizeof(*desc) + desc->length, GFP_KERNEL);
@@ -544,6 +600,12 @@ void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
 			}
 			break;
 
+		case SHORT_EVENT_DESCRIPTOR:
+			kfree(((struct vidtv_psi_desc_short_event *)tmp)->iso_language_code);
+			kfree(((struct vidtv_psi_desc_short_event *)tmp)->event_name);
+			kfree(((struct vidtv_psi_desc_short_event *)tmp)->text);
+		break;
+
 		default:
 			pr_warn_ratelimited("Possible leak: not handling descriptor type %d\n",
 					    tmp->type);
@@ -683,6 +745,41 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 		}
 		break;
 
+	case SHORT_EVENT_DESCRIPTOR:
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = ISO_LANGUAGE_CODE_LEN;
+		psi_args.from = ((struct vidtv_psi_desc_short_event *)
+				  args.desc)->iso_language_code;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = sizeof_field(struct vidtv_psi_desc_short_event, event_name_len);
+		psi_args.from = &((struct vidtv_psi_desc_short_event *)
+				  args.desc)->event_name_len;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_short_event *)args.desc)->event_name_len;
+		psi_args.from = ((struct vidtv_psi_desc_short_event *)args.desc)->event_name;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = sizeof_field(struct vidtv_psi_desc_short_event, text_len);
+		psi_args.from = &((struct vidtv_psi_desc_short_event *)args.desc)->text_len;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_short_event *)args.desc)->text_len;
+		psi_args.from = ((struct vidtv_psi_desc_short_event *)args.desc)->text;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		break;
+
 	case REGISTRATION_DESCRIPTOR:
 	default:
 		psi_args.dest_offset = args.dest_offset + nbytes;
@@ -1334,7 +1431,9 @@ void vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt)
 
 struct vidtv_psi_table_sdt_service
 *vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
-			    u16 service_id)
+			    u16 service_id,
+			    bool eit_schedule,
+			    bool eit_present_following)
 {
 	struct vidtv_psi_table_sdt_service *service;
 
@@ -1347,8 +1446,8 @@ struct vidtv_psi_table_sdt_service
 	 * corresponding program_map_section
 	 */
 	service->service_id            = cpu_to_be16(service_id);
-	service->EIT_schedule          = 0x0;
-	service->EIT_present_following = 0x0;
+	service->EIT_schedule          = eit_schedule;
+	service->EIT_present_following = eit_present_following;
 	service->reserved              = 0x3f;
 
 	service->bitfield = cpu_to_be16(RUNNING << 13);
@@ -1656,3 +1755,213 @@ void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit)
 	vidtv_psi_transport_destroy(nit->transport);
 	kfree(nit);
 }
+
+void vidtv_psi_eit_table_update_sec_len(struct vidtv_psi_table_eit *eit)
+{
+	u16 length = 0;
+	struct vidtv_psi_table_eit_event *e = eit->event;
+	u16 desc_loop_len;
+
+	/*
+	 * from immediately after 'section_length' until
+	 * 'last_table_id'
+	 */
+	length += EIT_LEN_UNTIL_LAST_TABLE_ID;
+
+	while (e) {
+		/* skip both pointers at the end */
+		length += sizeof(struct vidtv_psi_table_eit_event) -
+			  sizeof(struct vidtv_psi_desc *) -
+			  sizeof(struct vidtv_psi_table_eit_event *);
+
+		desc_loop_len = vidtv_psi_desc_comp_loop_len(e->descriptor);
+		vidtv_psi_set_desc_loop_len(&e->bitfield, desc_loop_len, 12);
+
+		length += desc_loop_len;
+
+		e = e->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	vidtv_psi_set_sec_len(&eit->header, length);
+}
+
+void vidtv_psi_eit_event_assign(struct vidtv_psi_table_eit *eit,
+				struct vidtv_psi_table_eit_event *e)
+{
+	if (e == eit->event)
+		return;
+
+	eit->event = e;
+	vidtv_psi_eit_table_update_sec_len(eit);
+
+	if (vidtv_psi_get_sec_len(&eit->header) > EIT_MAX_SECTION_LEN)
+		vidtv_psi_eit_event_assign(eit, NULL);
+
+	vidtv_psi_update_version_num(&eit->header);
+}
+
+struct vidtv_psi_table_eit
+*vidtv_psi_eit_table_init(u16 network_id,
+			  u16 transport_stream_id)
+{
+	struct vidtv_psi_table_eit *eit = kzalloc(sizeof(*eit), GFP_KERNEL);
+
+	const u16 SYNTAX = 0x1;
+	const u16 ONE = 0x1;
+	const u16 ONES = 0x03;
+
+	eit->header.table_id = 0x4e; //actual_transport_stream: present/following
+
+	eit->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
+
+	eit->header.id = cpu_to_be16(network_id);
+	eit->header.current_next = ONE;
+
+	eit->header.version = 0x1f;
+
+	eit->header.one2  = ONES;
+	eit->header.section_id   = 0;
+	eit->header.last_section = 0;
+
+	eit->transport_id = cpu_to_be16(transport_stream_id);
+	eit->network_id = cpu_to_be16(network_id);
+
+	eit->last_segment = eit->header.last_section; /* not implemented */
+	eit->last_table_id = eit->header.table_id; /* not implemented */
+
+	vidtv_psi_eit_table_update_sec_len(eit);
+
+	return eit;
+}
+
+u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
+{
+	u32 nbytes  = 0;
+	u32 crc = INITIAL_CRC;
+
+	struct vidtv_psi_table_eit_event *event = args.eit->event;
+	struct vidtv_psi_desc *event_descriptor = (args.eit->event) ?
+						   args.eit->event->descriptor :
+						   NULL;
+
+	struct header_write_args h_args = {};
+	struct psi_write_args psi_args  = {};
+	struct desc_write_args d_args   = {};
+	struct crc32_write_args c_args  = {};
+
+	vidtv_psi_eit_table_update_sec_len(args.eit);
+
+	h_args.dest_buf           = args.buf;
+	h_args.dest_offset        = args.offset;
+	h_args.h                  = &args.eit->header;
+	h_args.pid                = VIDTV_EIT_PID;
+	h_args.continuity_counter = args.continuity_counter;
+	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.crc                = &crc;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	psi_args.dest_buf = args.buf;
+	psi_args.from     = &args.eit->transport_id;
+
+	psi_args.len = sizeof_field(struct vidtv_psi_table_eit, transport_id) +
+		       sizeof_field(struct vidtv_psi_table_eit, network_id)   +
+		       sizeof_field(struct vidtv_psi_table_eit, last_segment) +
+		       sizeof_field(struct vidtv_psi_table_eit, last_table_id);
+
+	psi_args.dest_offset        = args.offset + nbytes;
+	psi_args.pid                = VIDTV_EIT_PID;
+	psi_args.new_psi_section    = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc             = false;
+	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.crc                = &crc;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	while (event) {
+		/* copy the events, if any */
+		psi_args.from = event;
+		/* skip both pointers at the end */
+		psi_args.len = sizeof(struct vidtv_psi_table_eit_event) -
+			       sizeof(struct vidtv_psi_desc *) -
+			       sizeof(struct vidtv_psi_table_eit_event *);
+		psi_args.dest_offset = args.offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		event_descriptor = event->descriptor;
+
+		while (event_descriptor) {
+			/* copy the event descriptors, if any */
+			d_args.dest_buf           = args.buf;
+			d_args.dest_offset        = args.offset + nbytes;
+			d_args.desc               = event_descriptor;
+			d_args.pid                = VIDTV_EIT_PID;
+			d_args.continuity_counter = args.continuity_counter;
+			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.crc                = &crc;
+
+			nbytes += vidtv_psi_desc_write_into(d_args);
+
+			event_descriptor = event_descriptor->next;
+		}
+
+		event = event->next;
+	}
+
+	c_args.dest_buf           = args.buf;
+	c_args.dest_offset        = args.offset + nbytes;
+	c_args.crc                = cpu_to_be32(crc);
+	c_args.pid                = VIDTV_EIT_PID;
+	c_args.continuity_counter = args.continuity_counter;
+	c_args.dest_buf_sz        = args.buf_sz;
+
+	/* Write the CRC at the end */
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+struct vidtv_psi_table_eit_event
+*vidtv_psi_eit_event_init(struct vidtv_psi_table_eit_event *head, u16 event_id)
+{
+	struct vidtv_psi_table_eit_event *e = kzalloc(sizeof(*e), GFP_KERNEL);
+	const u8 DURATION_ONE_HOUR[] = {1, 0, 0};
+
+	e->event_id = cpu_to_be16(event_id);
+	memset(e->start_time, 0xff, sizeof(e->start_time)); //todo: 0xff means 'unspecified'
+	memcpy(e->duration, DURATION_ONE_HOUR, sizeof(e->duration)); //todo, default to this for now
+
+	e->bitfield = cpu_to_be16(RUNNING << 13);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = e;
+	}
+
+	return e;
+}
+
+void vidtv_psi_eit_event_destroy(struct vidtv_psi_table_eit_event *e)
+{
+	struct vidtv_psi_table_eit_event *curr_e = e;
+	struct vidtv_psi_table_eit_event *tmp_e  = NULL;
+
+	while (curr_e) {
+		tmp_e  = curr_e;
+		curr_e = curr_e->next;
+		vidtv_psi_desc_destroy(tmp_e->descriptor);
+		kfree(tmp_e);
+	}
+}
+
+void vidtv_psi_eit_table_destroy(struct vidtv_psi_table_eit *eit)
+{
+	vidtv_psi_eit_event_destroy(eit->event);
+	kfree(eit);
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 2272c52b8e4a..38d7f0028a85 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -24,16 +24,20 @@
 #define PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH 9
 #define SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE 8
 #define NIT_LEN_UNTIL_NETWORK_DESCRIPTOR_LEN 7
+#define EIT_LEN_UNTIL_LAST_TABLE_ID 11
 #define MAX_SECTION_LEN 1021
+#define EIT_MAX_SECTION_LEN 4093 /* see ETSI 300 468 v.1.10.1 p. 26 */
 #define VIDTV_PAT_PID 0 /* mandated by the specs */
 #define VIDTV_SDT_PID 0x0011 /* mandated by the specs */
 #define VIDTV_NIT_PID 0x0010 /* mandated by the specs */
+#define VIDTV_EIT_PID 0x0012 /*mandated by the specs */
 
 enum vidtv_psi_descriptors {
 	REGISTRATION_DESCRIPTOR	= 0x05, /* See ISO/IEC 13818-1 section 2.6.8 */
 	NETWORK_NAME_DESCRIPTOR = 0x40, /* See ETSI EN 300 468 section 6.2.27 */
 	SERVICE_LIST_DESCRIPTOR = 0x41, /* See ETSI EN 300 468 section 6.2.35 */
 	SERVICE_DESCRIPTOR = 0x48, /* See ETSI EN 300 468 section 6.2.33 */
+	SHORT_EVENT_DESCRIPTOR = 0x4d, /* See ETSI EN 300 468 section 6.2.37 */
 };
 
 enum vidtv_psi_stream_types {
@@ -118,6 +122,27 @@ struct vidtv_psi_desc_service_list {
 	struct vidtv_psi_desc_service_list_entry *service_list;
 } __packed;
 
+/**
+ * struct vidtv_psi_desc_short_event - A short event descriptor
+ * see ETSI EN 300 468 v1.15.1 section 6.2.37
+ */
+struct vidtv_psi_desc_short_event {
+	struct vidtv_psi_desc *next;
+	u8 type;
+	u8 length;
+	char *iso_language_code;
+	u8 event_name_len;
+	char *event_name;
+	u8 text_len;
+	char *text;
+} __packed;
+
+struct vidtv_psi_desc_short_event
+*vidtv_psi_short_event_desc_init(struct vidtv_psi_desc *head,
+				 char *iso_language_code,
+				 char *event_name,
+				 char *text);
+
 /**
  * struct vidtv_psi_table_header - A header that is present for all PSI tables.
  */
@@ -344,7 +369,9 @@ struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id);
 
 struct vidtv_psi_table_sdt_service*
 vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
-			   u16 service_id);
+			   u16 service_id,
+			   bool eit_schedule,
+			   bool eit_present_following);
 
 void
 vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc);
@@ -685,4 +712,96 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args);
 
 void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit);
 
+/**
+ * struct vidtv_psi_desc_short_event - A short event descriptor
+ * see ETSI EN 300 468 v1.15.1 section 6.2.37
+ */
+struct vidtv_psi_table_eit_event {
+	__be16 event_id;
+	u8 start_time[5];
+	u8 duration[3];
+	__be16 bitfield; /* desc_length: 12, free_CA_mode: 1, running_status: 1 */
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_eit_event *next;
+} __packed;
+
+/*
+ * struct vidtv_psi_table_eit - A Event Information Table (EIT)
+ * See ETSI 300 468 section 5.2.4
+ */
+struct vidtv_psi_table_eit {
+	struct vidtv_psi_table_header header;
+	__be16 transport_id;
+	__be16 network_id;
+	u8 last_segment;
+	u8 last_table_id;
+	struct vidtv_psi_table_eit_event *event;
+} __packed;
+
+struct vidtv_psi_table_eit
+*vidtv_psi_eit_table_init(u16 network_id,
+			  u16 transport_stream_id);
+
+
+/**
+ * struct vidtv_psi_eit_write_args - Arguments for writing an EIT section
+ * @buf: The destination buffer.
+ * @offset: The offset into the destination buffer.
+ * @nit: A pointer to the NIT
+ * @buf_sz: The size of the destination buffer.
+ * @continuity_counter: A pointer to the CC. Incremented on every new packet.
+ *
+ */
+struct vidtv_psi_eit_write_args {
+	char *buf;
+	u32 offset;
+	struct vidtv_psi_table_eit *eit;
+	u32 buf_sz;
+	u8 *continuity_counter;
+};
+
+/**
+ * vidtv_psi_eit_write_into - Write EIT as MPEG-TS packets into a buffer.
+ * @args: an instance of struct vidtv_psi_nit_write_args
+ *
+ * This function writes the MPEG TS packets for a EIT table into a buffer.
+ * Calling code will usually generate the EIT via a call to its init function
+ * and thus is responsible for freeing it.
+ *
+ * Return: The number of bytes written into the buffer. This is NOT
+ * equal to the size of the EIT, since more space is needed for TS headers during TS
+ * encapsulation.
+ */
+u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args);
+
+void vidtv_psi_eit_table_destroy(struct vidtv_psi_table_eit *eit);
+
+/**
+ * vidtv_psi_eit_table_update_sec_len - Recompute and update the EIT section length.
+ * @eit: The EIT whose length is to be updated.
+ *
+ * This will traverse the table and accumulate the length of its components,
+ * which is then used to replace the 'section_length' field.
+ *
+ * If section_length > EIT_MAX_SECTION_LEN, the operation fails.
+ */
+void vidtv_psi_eit_table_update_sec_len(struct vidtv_psi_table_eit *eit);
+
+/**
+ * vidtv_psi_eit_event_assign - Assigns the event loop to the EIT.
+ * @eit: The EIT to assign to.
+ * @e: The event loop
+ *
+ * This will free the previous event loop in the table.
+ * This will assign ownership of the stream loop to the table, i.e. the table
+ * will free this stream loop when a call to its destroy function is made.
+ */
+void vidtv_psi_eit_event_assign(struct vidtv_psi_table_eit *eit,
+				struct vidtv_psi_table_eit_event *e);
+
+struct vidtv_psi_table_eit_event
+*vidtv_psi_eit_event_init(struct vidtv_psi_table_eit_event *head, u16 event_id);
+
+void vidtv_psi_eit_event_destroy(struct vidtv_psi_table_eit_event *e);
+
 #endif // VIDTV_PSI_H
-- 
2.29.2

