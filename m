Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABEF2C23A4
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732599AbgKXLGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:33804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732494AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5FE9208CA;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=RhnRClEIApaIMoXlb7If12dWul65bUVAbwvPbOmUOmE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bRx4UW1CFy2C/rQbDv74Jl2NNemLo7ZubDgn0fGq3mg7+a267rVtasKfYxtkODad8
         Wp1bjmvbH1z1+GB+bX74ICO6ogazu7vrrmylrImmKovRelN1QMirFr09w/ka355y5Q
         KqY0TaPoW6s10GfRN9d6Bch5O1OA+Irs6qDqlWNQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZP-JY; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 02/31] media: vidtv: add error checks
Date:   Tue, 24 Nov 2020 12:05:58 +0100
Message-Id: <f4aff290e0fe042fcb4661b53f21b93508457f95.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, there are not checks if something gets bad during
memory allocation: it will simply use NULL pointers and
crash.

Add error path at the logic which allocates memory for the
MPEG-TS generator code, propagating the errors up to the
vidtv_bridge. Now, if something wents bad, start_streaming
will return an error that userspace can detect:

	ERROR    DMX_SET_PES_FILTER failed (PID = 0x2000): 12 Cannot allocate memory

and the driver doesn't crash.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   |   2 +
 .../media/test-drivers/vidtv/vidtv_channel.c  | 138 ++++++++++++++++--
 .../media/test-drivers/vidtv/vidtv_channel.h  |   4 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  85 +++++++----
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 110 +++++++++++---
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  19 ++-
 6 files changed, 291 insertions(+), 67 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 068fb4e9fafe..e846aaab2c44 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -185,6 +185,8 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 
 	dvb->streaming = true;
 	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, mux_args);
+	if (!dvb->mux)
+		return -ENOMEM;
 	vidtv_mux_start_thread(dvb->mux);
 
 	dev_dbg_ratelimited(dev, "Started streaming\n");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 683da9014064..b2d44d7e78b6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -57,54 +57,75 @@ struct vidtv_channel
 	const u16 s302m_program_pid         = 0x101; /* packet id for PMT*/
 	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
 	const __be32 s302m_fid              = cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER);
-
 	char *name = ENCODING_ISO8859_15 "Beethoven";
 	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
 	char *iso_language_code = ENCODING_ISO8859_15 "eng";
 	char *event_name = ENCODING_ISO8859_15 "Beethoven Music";
 	char *event_text = ENCODING_ISO8859_15 "Beethoven's 5th Symphony";
 	const u16 s302m_beethoven_event_id  = 1;
-
-	struct vidtv_channel *s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
+	struct vidtv_channel *s302m;
 	struct vidtv_s302m_encoder_init_args encoder_args = {};
 
+	s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
+	if (!s302m)
+		return NULL;
+
 	s302m->name = kstrdup(name, GFP_KERNEL);
+	if (!s302m->name)
+		goto free_s302m;
 
 	s302m->service = vidtv_psi_sdt_service_init(NULL, s302m_service_id, false, true);
+	if (!s302m->service)
+		goto free_name;
 
 	s302m->service->descriptor = (struct vidtv_psi_desc *)
 				     vidtv_psi_service_desc_init(NULL,
 								 DIGITAL_TELEVISION_SERVICE,
 								 name,
 								 provider);
+	if (!s302m->service->descriptor)
+		goto free_service;
 
 	s302m->transport_stream_id = transport_stream_id;
 
 	s302m->program = vidtv_psi_pat_program_init(NULL,
 						    s302m_service_id,
 						    s302m_program_pid);
+	if (!s302m->program)
+		goto free_service;
 
 	s302m->program_num = s302m_program_num;
 
 	s302m->streams = vidtv_psi_pmt_stream_init(NULL,
 						   STREAM_PRIVATE_DATA,
 						   s302m_es_pid);
+	if (!s302m->streams)
+		goto free_program;
 
 	s302m->streams->descriptor = (struct vidtv_psi_desc *)
 				     vidtv_psi_registration_desc_init(NULL,
 								      s302m_fid,
 								      NULL,
 								      0);
+	if (!s302m->streams->descriptor)
+		goto free_streams;
+
 	encoder_args.es_pid = s302m_es_pid;
 
 	s302m->encoders = vidtv_s302m_encoder_init(encoder_args);
+	if (!s302m->encoders)
+		goto free_streams;
 
 	s302m->events = vidtv_psi_eit_event_init(NULL, s302m_beethoven_event_id);
+	if (!s302m->events)
+		goto free_encoders;
 	s302m->events->descriptor = (struct vidtv_psi_desc *)
 				    vidtv_psi_short_event_desc_init(NULL,
 								    iso_language_code,
 								    event_name,
 								    event_text);
+	if (!s302m->events->descriptor)
+		goto free_events;
 
 	if (head) {
 		while (head->next)
@@ -114,6 +135,23 @@ struct vidtv_channel
 	}
 
 	return s302m;
+
+free_events:
+	vidtv_psi_eit_event_destroy(s302m->events);
+free_encoders:
+	vidtv_s302m_encoder_destroy(s302m->encoders);
+free_streams:
+	vidtv_psi_pmt_stream_destroy(s302m->streams);
+free_program:
+	vidtv_psi_pat_program_destroy(s302m->program);
+free_service:
+	vidtv_psi_sdt_service_destroy(s302m->service);
+free_name:
+	kfree(s302m->name);
+free_s302m:
+	kfree(s302m);
+
+	return NULL;
 }
 
 static struct vidtv_psi_table_eit_event
@@ -142,6 +180,10 @@ static struct vidtv_psi_table_eit_event
 		while (curr) {
 			event_id = be16_to_cpu(curr->event_id);
 			tail = vidtv_psi_eit_event_init(tail, event_id);
+			if (!tail) {
+				vidtv_psi_eit_event_destroy(head);
+				return NULL;
+			}
 
 			desc = vidtv_psi_desc_clone(curr->descriptor);
 			vidtv_psi_desc_assign(&tail->descriptor, desc);
@@ -187,8 +229,12 @@ static struct vidtv_psi_table_sdt_service
 							  service_id,
 							  curr->EIT_schedule,
 							  curr->EIT_present_following);
+			if (!tail)
+				goto free;
 
 			desc = vidtv_psi_desc_clone(curr->descriptor);
+			if (!desc)
+				goto free_tail;
 			vidtv_psi_desc_assign(&tail->descriptor, desc);
 
 			if (!head)
@@ -201,6 +247,12 @@ static struct vidtv_psi_table_sdt_service
 	}
 
 	return head;
+
+free_tail:
+	vidtv_psi_sdt_service_destroy(tail);
+free:
+	vidtv_psi_sdt_service_destroy(head);
+	return NULL;
 }
 
 static struct vidtv_psi_table_pat_program*
@@ -231,6 +283,10 @@ vidtv_channel_pat_prog_cat_into_new(struct vidtv_mux *m)
 			tail = vidtv_psi_pat_program_init(tail,
 							  serv_id,
 							  pid);
+			if (!tail) {
+				vidtv_psi_pat_program_destroy(head);
+				return NULL;
+			}
 
 			if (!head)
 				head = tail;
@@ -303,6 +359,17 @@ vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 	}
 }
 
+static void vidtv_channel_destroy_service_list(struct vidtv_psi_desc_service_list_entry *e)
+{
+	struct vidtv_psi_desc_service_list_entry *tmp;
+
+	while (e) {
+		tmp = e;
+		e = e->next;
+		kfree(tmp);
+	}
+}
+
 static struct vidtv_psi_desc_service_list_entry
 *vidtv_channel_build_service_list(struct vidtv_psi_table_sdt_service *s)
 {
@@ -320,6 +387,12 @@ static struct vidtv_psi_desc_service_list_entry
 			s_desc = (struct vidtv_psi_desc_service *)desc;
 
 			curr_e = kzalloc(sizeof(*curr_e), GFP_KERNEL);
+			if (!curr_e) {
+				vidtv_channel_destroy_service_list(head_e);
+				return NULL;
+			}
+
+
 			curr_e->service_id = s->service_id;
 			curr_e->service_type = s_desc->service_type;
 
@@ -338,18 +411,7 @@ static struct vidtv_psi_desc_service_list_entry
 	return head_e;
 }
 
-static void vidtv_channel_destroy_service_list(struct vidtv_psi_desc_service_list_entry *e)
-{
-	struct vidtv_psi_desc_service_list_entry *tmp;
-
-	while (e) {
-		tmp = e;
-		e = e->next;
-		kfree(tmp);
-	}
-}
-
-void vidtv_channel_si_init(struct vidtv_mux *m)
+int vidtv_channel_si_init(struct vidtv_mux *m)
 {
 	struct vidtv_psi_table_pat_program *programs = NULL;
 	struct vidtv_psi_table_sdt_service *services = NULL;
@@ -357,24 +419,41 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	struct vidtv_psi_table_eit_event *events = NULL;
 
 	m->si.pat = vidtv_psi_pat_table_init(m->transport_stream_id);
+	if (!m->si.pat)
+		return -ENOMEM;
 
 	m->si.sdt = vidtv_psi_sdt_table_init(m->transport_stream_id);
+	if (!m->si.sdt)
+		goto free_pat;
 
 	programs = vidtv_channel_pat_prog_cat_into_new(m);
+	if (!programs)
+		goto free_sdt;
 	services = vidtv_channel_sdt_serv_cat_into_new(m);
+	if (!services)
+		goto free_programs;
 
 	events = vidtv_channel_eit_event_cat_into_new(m);
+	if (!events)
+		goto free_services;
 
 	/* look for a service descriptor for every service */
 	service_list = vidtv_channel_build_service_list(services);
+	if (!service_list)
+		goto free_events;
 
 	/* use these descriptors to build the NIT */
 	m->si.nit = vidtv_psi_nit_table_init(m->network_id,
 					     m->transport_stream_id,
 					     m->network_name,
 					     service_list);
+	if (!m->si.nit)
+		goto free_service_list;
 
 	m->si.eit = vidtv_psi_eit_table_init(m->network_id, m->transport_stream_id);
+	if (!m->si.eit)
+		goto free_nit;
+
 
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
@@ -386,12 +465,34 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	vidtv_psi_eit_event_assign(m->si.eit, events);
 
 	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat, m->pcr_pid);
+	if (!m->si.pmt_secs)
+		goto free_eit;
 
 	vidtv_channel_pmt_match_sections(m->channels,
 					 m->si.pmt_secs,
 					 m->si.pat->programs);
 
 	vidtv_channel_destroy_service_list(service_list);
+
+	return 0;
+
+free_eit:
+	vidtv_psi_eit_table_destroy(m->si.eit);
+free_nit:
+	vidtv_psi_nit_table_destroy(m->si.nit);
+free_service_list:
+	vidtv_channel_destroy_service_list(service_list);
+free_events:
+	vidtv_psi_eit_event_destroy(events);
+free_services:
+	vidtv_psi_sdt_service_destroy(services);
+free_programs:
+	vidtv_psi_pat_program_destroy(programs);
+free_sdt:
+	vidtv_psi_sdt_table_destroy(m->si.sdt);
+free_pat:
+	vidtv_psi_pat_table_destroy(m->si.pat);
+	return 0;
 }
 
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
@@ -410,10 +511,15 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 	vidtv_psi_eit_table_destroy(m->si.eit);
 }
 
-void vidtv_channels_init(struct vidtv_mux *m)
+int vidtv_channels_init(struct vidtv_mux *m)
 {
 	/* this is the place to add new 'channels' for vidtv */
 	m->channels = vidtv_channel_s302m_init(NULL, m->transport_stream_id);
+
+	if (!m->channels)
+		return -ENOMEM;
+
+	return 0;
 }
 
 void vidtv_channels_destroy(struct vidtv_mux *m)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.h b/drivers/media/test-drivers/vidtv/vidtv_channel.h
index e1ba638ab77f..4bc2a4c0980d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -65,14 +65,14 @@ struct vidtv_channel {
  * vidtv_channel_si_init - Init the PSI tables from the channels in the mux
  * @m: The mux containing the channels.
  */
-void vidtv_channel_si_init(struct vidtv_mux *m);
+int vidtv_channel_si_init(struct vidtv_mux *m);
 void vidtv_channel_si_destroy(struct vidtv_mux *m);
 
 /**
  * vidtv_channels_init - Init hardcoded, fake 'channels'.
  * @m: The mux to store the channels into.
  */
-void vidtv_channels_init(struct vidtv_mux *m);
+int vidtv_channels_init(struct vidtv_mux *m);
 struct vidtv_channel
 *vidtv_channel_s302m_init(struct vidtv_channel *head, u16 transport_stream_id);
 void vidtv_channels_destroy(struct vidtv_mux *m);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 465c5a6a3bc8..bba3f2315531 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -47,37 +47,56 @@ static struct vidtv_mux_pid_ctx
 	struct vidtv_mux_pid_ctx *ctx;
 
 	ctx = vidtv_mux_get_pid_ctx(m, pid);
-
 	if (ctx)
-		goto end;
+		return ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
 
-	ctx      = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	ctx->pid = pid;
 	ctx->cc  = 0;
 	hash_add(m->pid_ctx, &ctx->h, pid);
 
-end:
 	return ctx;
 }
 
-static void vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
+static void vidtv_mux_pid_ctx_destroy(struct vidtv_mux *m)
+{
+	int bkt;
+	struct vidtv_mux_pid_ctx *ctx;
+	struct hlist_node *tmp;
+
+	hash_for_each_safe(m->pid_ctx, bkt, tmp, ctx, h) {
+		hash_del(&ctx->h);
+		kfree(ctx);
+	}
+}
+
+static int vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
 {
 	struct vidtv_psi_table_pat_program *p = m->si.pat->program;
 	u16 pid;
 
 	hash_init(m->pid_ctx);
 	/* push the pcr pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, m->pcr_pid);
-	/* push the null packet pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, TS_NULL_PACKET_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, m->pcr_pid))
+		return -ENOMEM;
+	/* push the NULL packet pid ctx */
+	if (!vidtv_mux_create_pid_ctx_once(m, TS_NULL_PACKET_PID))
+		goto free;
 	/* push the PAT pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, VIDTV_PAT_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, VIDTV_PAT_PID))
+		goto free;
 	/* push the SDT pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID))
+		goto free;
 	/* push the NIT pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, VIDTV_NIT_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, VIDTV_NIT_PID))
+		goto free;
 	/* push the EIT pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, VIDTV_EIT_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, VIDTV_EIT_PID))
+		goto free;
 
 	/* add a ctx for all PMT sections */
 	while (p) {
@@ -85,18 +104,12 @@ static void vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
 		vidtv_mux_create_pid_ctx_once(m, pid);
 		p = p->next;
 	}
-}
 
-static void vidtv_mux_pid_ctx_destroy(struct vidtv_mux *m)
-{
-	int bkt;
-	struct vidtv_mux_pid_ctx *ctx;
-	struct hlist_node *tmp;
+	return 0;
 
-	hash_for_each_safe(m->pid_ctx, bkt, tmp, ctx, h) {
-		hash_del(&ctx->h);
-		kfree(ctx);
-	}
+free:
+	vidtv_mux_pid_ctx_destroy(m);
+	return -ENOMEM;
 }
 
 static void vidtv_mux_update_clk(struct vidtv_mux *m)
@@ -455,7 +468,11 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 				 struct device *dev,
 				 struct vidtv_mux_init_args args)
 {
-	struct vidtv_mux *m = kzalloc(sizeof(*m), GFP_KERNEL);
+	struct vidtv_mux *m;
+
+	m = kzalloc(sizeof(*m), GFP_KERNEL);
+	if (!m)
+		return NULL;
 
 	m->dev = dev;
 	m->fe = fe;
@@ -467,6 +484,9 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 	m->on_new_packets_available_cb = args.on_new_packets_available_cb;
 
 	m->mux_buf = vzalloc(args.mux_buf_sz);
+	if (!m->mux_buf)
+		goto free_mux;
+
 	m->mux_buf_sz = args.mux_buf_sz;
 
 	m->pcr_pid = args.pcr_pid;
@@ -479,16 +499,29 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 	if (args.channels)
 		m->channels = args.channels;
 	else
-		vidtv_channels_init(m);
+		if (vidtv_channels_init(m) < 0)
+			goto free_mux_buf;
 
 	/* will alloc data for pmt_sections after initializing pat */
-	vidtv_channel_si_init(m);
+	if (vidtv_channel_si_init(m) < 0)
+		goto free_channels;
 
 	INIT_WORK(&m->mpeg_thread, vidtv_mux_tick);
 
-	vidtv_mux_pid_ctx_init(m);
+	if (vidtv_mux_pid_ctx_init(m) < 0)
+		goto free_channel_si;
 
 	return m;
+
+free_channel_si:
+	vidtv_channel_si_destroy(m);
+free_channels:
+	vidtv_channels_destroy(m);
+free_mux_buf:
+	vfree(m->mux_buf);
+free_mux:
+	kfree(m);
+	return NULL;
 }
 
 void vidtv_mux_destroy(struct vidtv_mux *m)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index f4f6b90633db..b4bbd450fbe6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -333,6 +333,8 @@ struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc
 	u32 provider_name_len = provider_name ? strlen(provider_name) : 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = SERVICE_DESCRIPTOR;
 
@@ -367,6 +369,8 @@ struct vidtv_psi_desc_registration
 	struct vidtv_psi_desc_registration *desc;
 
 	desc = kzalloc(sizeof(*desc) + sizeof(format_id) + additional_info_len, GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = REGISTRATION_DESCRIPTOR;
 
@@ -391,6 +395,8 @@ struct vidtv_psi_desc_network_name
 	u32 network_name_len = network_name ? strlen(network_name) : 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = NETWORK_NAME_DESCRIPTOR;
 
@@ -414,11 +420,23 @@ struct vidtv_psi_desc_service_list
 	u16 length = 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = SERVICE_LIST_DESCRIPTOR;
 
 	while (entry) {
 		curr_e = kzalloc(sizeof(*curr_e), GFP_KERNEL);
+		if (!curr_e) {
+			while (head_e) {
+				curr_e = head_e;
+				head_e = head_e->next;
+				kfree(curr_e);
+			}
+			kfree(desc);
+			return NULL;
+		}
+
 		curr_e->service_id = entry->service_id;
 		curr_e->service_type = entry->service_type;
 
@@ -453,6 +471,8 @@ struct vidtv_psi_desc_short_event
 	u32 iso_len =  iso_language_code ? strlen(iso_language_code) : 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = SHORT_EVENT_DESCRIPTOR;
 
@@ -496,10 +516,10 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 		case SERVICE_DESCRIPTOR:
 			service = (struct vidtv_psi_desc_service *)desc;
 			curr = (struct vidtv_psi_desc *)
-				vidtv_psi_service_desc_init(head,
-							    service->service_type,
-							    service->service_name,
-							    service->provider_name);
+			       vidtv_psi_service_desc_init(head,
+							   service->service_type,
+							   service->service_name,
+							   service->provider_name);
 		break;
 
 		case NETWORK_NAME_DESCRIPTOR:
@@ -512,8 +532,8 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 		case SERVICE_LIST_DESCRIPTOR:
 			desc_service_list = (struct vidtv_psi_desc_service_list *)desc;
 			curr = (struct vidtv_psi_desc *)
-				vidtv_psi_service_list_desc_init(head,
-								 desc_service_list->service_list);
+			       vidtv_psi_service_list_desc_init(head,
+								desc_service_list->service_list);
 		break;
 
 		case SHORT_EVENT_DESCRIPTOR:
@@ -528,12 +548,15 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 		case REGISTRATION_DESCRIPTOR:
 		default:
 			curr = kzalloc(sizeof(*desc) + desc->length, GFP_KERNEL);
+			if (!curr)
+				return NULL;
 			memcpy(curr, desc, sizeof(*desc) + desc->length);
-		break;
-	}
+		}
 
-		if (curr)
-			curr->next = NULL;
+		if (!curr)
+			return NULL;
+
+		curr->next = NULL;
 		if (!head)
 			head = curr;
 		if (prev)
@@ -890,6 +913,8 @@ vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
 	const u16 RESERVED = 0x07;
 
 	program = kzalloc(sizeof(*program), GFP_KERNEL);
+	if (!program)
+		return NULL;
 
 	program->service_id = cpu_to_be16(service_id);
 
@@ -951,11 +976,15 @@ vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 
 struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
 {
-	struct vidtv_psi_table_pat *pat = kzalloc(sizeof(*pat), GFP_KERNEL);
+	struct vidtv_psi_table_pat *pat;
 	const u16 SYNTAX = 0x1;
 	const u16 ZERO = 0x0;
 	const u16 ONES = 0x03;
 
+	pat = kzalloc(sizeof(*pat), GFP_KERNEL);
+	if (!pat)
+		return NULL;
+
 	pat->header.table_id = 0x0;
 
 	pat->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ZERO << 14) | (ONES << 12));
@@ -1055,6 +1084,8 @@ vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
 	u16 desc_loop_len;
 
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return NULL;
 
 	stream->type = stream_type;
 
@@ -1129,7 +1160,7 @@ u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
 struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 						     u16 pcr_pid)
 {
-	struct vidtv_psi_table_pmt *pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
+	struct vidtv_psi_table_pmt *pmt;
 	const u16 SYNTAX = 0x1;
 	const u16 ZERO = 0x0;
 	const u16 ONES = 0x03;
@@ -1137,6 +1168,10 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 	const u16 RESERVED2 = 0x0f;
 	u16 desc_loop_len;
 
+	pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
+	if (!pmt)
+		return NULL;
+
 	if (!pcr_pid)
 		pcr_pid = 0x1fff;
 
@@ -1276,14 +1311,17 @@ void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
 
 struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
 {
-	struct vidtv_psi_table_sdt *sdt = kzalloc(sizeof(*sdt), GFP_KERNEL);
+	struct vidtv_psi_table_sdt *sdt;
 	const u16 SYNTAX = 0x1;
 	const u16 ONE = 0x1;
 	const u16 ONES = 0x03;
 	const u16 RESERVED = 0xff;
 
+	sdt  = kzalloc(sizeof(*sdt), GFP_KERNEL);
+	if (!sdt)
+		return NULL;
+
 	sdt->header.table_id = 0x42;
-
 	sdt->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
 
 	/*
@@ -1418,6 +1456,8 @@ struct vidtv_psi_table_sdt_service
 	struct vidtv_psi_table_sdt_service *service;
 
 	service = kzalloc(sizeof(*service), GFP_KERNEL);
+	if (!service)
+		return NULL;
 
 	/*
 	 * ETSI 300 468: this is a 16bit field which serves as a label to
@@ -1491,6 +1531,8 @@ vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat, u16
 	pmt_secs = kcalloc(pat->programs,
 			   sizeof(struct vidtv_psi_table_pmt *),
 			   GFP_KERNEL);
+	if (!pmt_secs)
+		return NULL;
 
 	while (program) {
 		pmt_secs[i] = vidtv_psi_pmt_table_init(be16_to_cpu(program->service_id), pcr_pid);
@@ -1568,13 +1610,20 @@ struct vidtv_psi_table_nit
 			  char *network_name,
 			  struct vidtv_psi_desc_service_list_entry *service_list)
 {
-	struct vidtv_psi_table_nit *nit = kzalloc(sizeof(*nit), GFP_KERNEL);
-	struct vidtv_psi_table_transport *transport = kzalloc(sizeof(*transport), GFP_KERNEL);
-
+	struct vidtv_psi_table_nit *nit;
+	struct vidtv_psi_table_transport *transport;
 	const u16 SYNTAX = 0x1;
 	const u16 ONE = 0x1;
 	const u16 ONES = 0x03;
 
+	nit = kzalloc(sizeof(*nit), GFP_KERNEL);
+	if (!nit)
+		return NULL;
+
+	transport = kzalloc(sizeof(*transport), GFP_KERNEL);
+	if (!transport)
+		goto free_nit;
+
 	nit->header.table_id = 0x40; // ACTUAL_NETWORK
 
 	nit->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
@@ -1593,18 +1642,31 @@ struct vidtv_psi_table_nit
 
 	nit->descriptor = (struct vidtv_psi_desc *)
 			  vidtv_psi_network_name_desc_init(NULL, network_name);
+	if (!nit->descriptor)
+		goto free_transport;
 
 	transport->transport_id = cpu_to_be16(transport_stream_id);
 	transport->network_id = cpu_to_be16(network_id);
 	transport->bitfield = cpu_to_be16(0xf);
 	transport->descriptor = (struct vidtv_psi_desc *)
 				vidtv_psi_service_list_desc_init(NULL, service_list);
+	if (!transport->descriptor)
+		goto free_nit_desc;
 
 	nit->transport = transport;
 
 	vidtv_psi_nit_table_update_sec_len(nit);
 
 	return nit;
+
+free_nit_desc:
+	vidtv_psi_desc_destroy((struct vidtv_psi_desc *)nit->descriptor);
+
+free_transport:
+	kfree(transport);
+free_nit:
+	kfree(nit);
+	return NULL;
 }
 
 u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
@@ -1786,12 +1848,15 @@ struct vidtv_psi_table_eit
 *vidtv_psi_eit_table_init(u16 network_id,
 			  u16 transport_stream_id)
 {
-	struct vidtv_psi_table_eit *eit = kzalloc(sizeof(*eit), GFP_KERNEL);
-
+	struct vidtv_psi_table_eit *eit;
 	const u16 SYNTAX = 0x1;
 	const u16 ONE = 0x1;
 	const u16 ONES = 0x03;
 
+	eit = kzalloc(sizeof(*eit), GFP_KERNEL);
+	if (!eit)
+		return NULL;
+
 	eit->header.table_id = 0x4e; //actual_transport_stream: present/following
 
 	eit->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
@@ -1906,9 +1971,14 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 struct vidtv_psi_table_eit_event
 *vidtv_psi_eit_event_init(struct vidtv_psi_table_eit_event *head, u16 event_id)
 {
-	struct vidtv_psi_table_eit_event *e = kzalloc(sizeof(*e), GFP_KERNEL);
+	struct vidtv_psi_table_eit_event *e;
 	const u8 DURATION_ONE_HOUR[] = {1, 0, 0};
 
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e)
+		return NULL;
+
 	e->event_id = cpu_to_be16(event_id);
 	memset(e->start_time, 0xff, sizeof(e->start_time)); //todo: 0xff means 'unspecified'
 	memcpy(e->duration, DURATION_ONE_HOUR, sizeof(e->duration)); //todo, default to this for now
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index ec88af63a74e..146e4e9d361b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -144,7 +144,11 @@ static const struct tone_duration beethoven_5th_symphony[] = {
 
 static struct vidtv_access_unit *vidtv_s302m_access_unit_init(struct vidtv_access_unit *head)
 {
-	struct vidtv_access_unit *au = kzalloc(sizeof(*au), GFP_KERNEL);
+	struct vidtv_access_unit *au;
+
+	au = kzalloc(sizeof(*au), GFP_KERNEL);
+	if (!au)
+		return NULL;
 
 	if (head) {
 		while (head->next)
@@ -441,9 +445,13 @@ static u32 vidtv_s302m_clear(struct vidtv_encoder *e)
 struct vidtv_encoder
 *vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args)
 {
-	struct vidtv_encoder *e = kzalloc(sizeof(*e), GFP_KERNEL);
+	struct vidtv_encoder *e;
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
-	struct vidtv_s302m_ctx *ctx = kzalloc(priv_sz, GFP_KERNEL);
+	struct vidtv_s302m_ctx *ctx;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e)
+		return NULL;
 
 	e->id = S302M;
 
@@ -461,6 +469,11 @@ struct vidtv_encoder
 	e->src_buf_offset = 0;
 
 	e->is_video_encoder = false;
+
+	ctx = kzalloc(priv_sz, GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
 	e->ctx = ctx;
 	ctx->last_duration = 0;
 
-- 
2.28.0

