Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBAA273B05
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 08:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgIVGkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 02:40:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:47060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728592AbgIVGkF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 02:40:05 -0400
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EA54206F7;
        Tue, 22 Sep 2020 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600756803;
        bh=ZkRvmmUO3UpDhUA6dixjwbMXz48sS5Z7eMJxkWTqN1s=;
        h=From:To:Cc:Subject:Date:From;
        b=K0XjLD58SeVILpZgolS1u1eIeC4SrZvsfPoE7wOwk0JZtJH4eTizp6V/zJGVz/4/F
         b4MF1HmHBZZbKcrVoZ1L4Q3qat6vRObeALq/ERwkqwA8VE1YAtRt/Obbo2PbIFRn2b
         zGxezANZ1UrgR2Irg+ImtL4neqUls/hY/4QpWjpw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKby4-00089D-F3; Tue, 22 Sep 2020 08:40:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: vidtv: add error checks
Date:   Tue, 22 Sep 2020 08:39:59 +0200
Message-Id: <291504677c0907d7d4e59590652da28e29644c52.1600756796.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
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
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  2 +
 .../media/test-drivers/vidtv/vidtv_channel.c  | 58 +++++++++++++++++--
 .../media/test-drivers/vidtv/vidtv_channel.h  |  4 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 55 +++++++++++++-----
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 40 ++++++++++---
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 14 ++++-
 6 files changed, 143 insertions(+), 30 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fb533c2dd351..b76c1c1ff7c0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -181,6 +181,8 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 
 	dvb->streaming = true;
 	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, mux_args);
+	if (!dvb->mux)
+		return -ENOMEM;
 	vidtv_mux_start_thread(dvb->mux);
 
 	dev_dbg_ratelimited(dev, "Started streaming\n");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 28a675a4f367..748697a783a9 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -56,43 +56,61 @@ struct vidtv_channel
 	const u16 s302m_program_pid         = 0x101; /* packet id for PMT*/
 	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
 	const __be32 s302m_fid              = cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER);
-
 	char *name = ENCODING_ISO8859_15 "Beethoven";
 	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
 
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
 
 	s302m->service = vidtv_psi_sdt_service_init(NULL, s302m_service_id);
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
 
 	if (head) {
 		while (head->next)
@@ -102,6 +120,19 @@ struct vidtv_channel
 	}
 
 	return s302m;
+
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
 
 static struct vidtv_psi_table_sdt_service
@@ -132,6 +163,8 @@ static struct vidtv_psi_table_sdt_service
 			tail = vidtv_psi_sdt_service_init(tail, service_id);
 
 			desc = vidtv_psi_desc_clone(curr->descriptor);
+			if (!desc)
+				return NULL;
 			vidtv_psi_desc_assign(&tail->descriptor, desc);
 
 			if (!head)
@@ -246,17 +279,25 @@ vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 	}
 }
 
-void vidtv_channel_si_init(struct vidtv_mux *m)
+int vidtv_channel_si_init(struct vidtv_mux *m)
 {
 	struct vidtv_psi_table_pat_program *programs = NULL;
 	struct vidtv_psi_table_sdt_service *services = NULL;
 
 	m->si.pat = vidtv_psi_pat_table_init(m->transport_stream_id);
+	if (!m->si.pat)
+		return -ENOMEM;
 
 	m->si.sdt = vidtv_psi_sdt_table_init(m->transport_stream_id);
+	if (!m->si.sdt)
+		return -ENOMEM;
 
 	programs = vidtv_channel_pat_prog_cat_into_new(m);
+	if (!programs)
+		return -ENOMEM;
 	services = vidtv_channel_sdt_serv_cat_into_new(m);
+	if (!services)
+		return -ENOMEM;
 
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
@@ -265,10 +306,14 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	vidtv_psi_sdt_service_assign(m->si.sdt, services);
 
 	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat, m->pcr_pid);
+	if (!m->si.pmt_secs)
+		return -ENOMEM;
 
 	vidtv_channel_pmt_match_sections(m->channels,
 					 m->si.pmt_secs,
 					 m->si.pat->programs);
+
+	return 0;
 }
 
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
@@ -285,10 +330,15 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
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
index 93a436a27824..d9a0f6fbfd92 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -62,14 +62,14 @@ struct vidtv_channel {
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
index b7223f3a2c9d..9086edd45252 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -47,33 +47,38 @@ static struct vidtv_mux_pid_ctx
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
+		return -ENOMEM;
 	/* push the PAT pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, VIDTV_PAT_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, VIDTV_PAT_PID))
+		return -ENOMEM;
 	/* push the SDT pid ctx */
-	vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID);
+	if (!vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID))
+		return -ENOMEM;
 
 	/* add a ctx for all PMT sections */
 	while (p) {
@@ -81,6 +86,8 @@ static void vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
 		vidtv_mux_create_pid_ctx_once(m, pid);
 		p = p->next;
 	}
+
+	return 0;
 }
 
 static void vidtv_mux_pid_ctx_destroy(struct vidtv_mux *m)
@@ -429,7 +436,11 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
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
@@ -441,6 +452,9 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 	m->on_new_packets_available_cb = args.on_new_packets_available_cb;
 
 	m->mux_buf = vzalloc(args.mux_buf_sz);
+	if (!m->mux_buf)
+		goto free_mux;
+
 	m->mux_buf_sz = args.mux_buf_sz;
 
 	m->pcr_pid = args.pcr_pid;
@@ -451,16 +465,29 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
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
index 0e58cbc79fb2..3151b300a91b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -325,6 +325,8 @@ struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc
 	u32 provider_name_len = provider_name ? strlen(provider_name) : 0;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = SERVICE_DESCRIPTOR;
 
@@ -364,6 +366,8 @@ struct vidtv_psi_desc_registration
 	struct vidtv_psi_desc_registration *desc;
 
 	desc = kzalloc(sizeof(*desc) + sizeof(format_id) + additional_info_len, GFP_KERNEL);
+	if (!desc)
+		return NULL;
 
 	desc->type = REGISTRATION_DESCRIPTOR;
 
@@ -410,11 +414,12 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 		default:
 			curr = kzalloc(sizeof(*desc) + desc->length, GFP_KERNEL);
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
@@ -693,6 +698,8 @@ vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
 	const u16 RESERVED = 0x07;
 
 	program = kzalloc(sizeof(*program), GFP_KERNEL);
+	if (!program)
+		return NULL;
 
 	program->service_id = cpu_to_be16(service_id);
 
@@ -754,11 +761,15 @@ vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 
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
@@ -858,6 +869,8 @@ vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
 	u16 desc_loop_len;
 
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return NULL;
 
 	stream->type = stream_type;
 
@@ -932,7 +945,7 @@ u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
 struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 						     u16 pcr_pid)
 {
-	struct vidtv_psi_table_pmt *pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
+	struct vidtv_psi_table_pmt *pmt;
 	const u16 SYNTAX = 0x1;
 	const u16 ZERO = 0x0;
 	const u16 ONES = 0x03;
@@ -940,6 +953,10 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 	const u16 RESERVED2 = 0x0f;
 	u16 desc_loop_len;
 
+	pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
+	if (!pmt)
+		return NULL;
+
 	if (!pcr_pid)
 		pcr_pid = 0x1fff;
 
@@ -1079,14 +1096,17 @@ void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
 
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
@@ -1219,6 +1239,8 @@ struct vidtv_psi_table_sdt_service
 	struct vidtv_psi_table_sdt_service *service;
 
 	service = kzalloc(sizeof(*service), GFP_KERNEL);
+	if (!service)
+		return NULL;
 
 	/*
 	 * ETSI 300 468: this is a 16bit field which serves as a label to
@@ -1292,6 +1314,8 @@ vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat, u16
 	pmt_secs = kcalloc(pat->programs,
 			   sizeof(struct vidtv_psi_table_pmt *),
 			   GFP_KERNEL);
+	if (!pmt_secs)
+		return NULL;
 
 	while (program) {
 		pmt_secs[i] = vidtv_psi_pmt_table_init(be16_to_cpu(program->service_id), pcr_pid);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 95c5b7bfd491..6e5e72ce90d0 100644
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
@@ -439,9 +443,13 @@ static u32 vidtv_s302m_clear(struct vidtv_encoder *e)
 struct vidtv_encoder
 *vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args)
 {
-	struct vidtv_encoder *e = kzalloc(sizeof(*e), GFP_KERNEL);
+	struct vidtv_encoder *e;
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
 
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e)
+		return NULL;
+
 	e->id = S302M;
 
 	if (args.name)
@@ -460,6 +468,8 @@ struct vidtv_encoder
 
 	e->is_video_encoder = false;
 	e->ctx = kzalloc(priv_sz, GFP_KERNEL);
+	if (!e->ctx)
+		return NULL;
 
 	e->encode = vidtv_s302m_encode;
 	e->clear = vidtv_s302m_clear;
-- 
2.26.2

