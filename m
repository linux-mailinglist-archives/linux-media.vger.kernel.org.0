Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A532A1876
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgJaPGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgJaPGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:08 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A86AC0617A6;
        Sat, 31 Oct 2020 08:06:08 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id r8so6257455qtp.13;
        Sat, 31 Oct 2020 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=udyd2B6ATVhgLyq+o8oA8wYOWM/iQzcxbY/Bz8YkQKg=;
        b=FHZkf51SaJpNYcPRnnY4CcVffCwIYPd0W9vcc+L35oxxxreCR7saALU+S5cZwJWr/h
         ct46XOWNYsmOTLrFNiWctVWhyTiQCVklTd8iRZfKcOfUK0pM9pByqxR9EIt1Or9kdQop
         BDw3tNjoaW3LyoLd3UkkbnEZ88bUP93GLDOFPmhlIYmigDEt2BBb776MgJqGHRl+3RHo
         1CeX+QWLkk6FVaz8UWwQHMa/bCal1UyRcRzWvj2ZTlAzf2ZVP5nVMIzDbv4WIDpF5Qzi
         4B/a7o737jnLHb8Q4b9nGRpQih+5Uk0zxOBTd/JVyTziHH60uNcQSLzl4QUciDRItrGH
         4pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=udyd2B6ATVhgLyq+o8oA8wYOWM/iQzcxbY/Bz8YkQKg=;
        b=Jr0qtRtBB7eL6uj7ISbCifiI56Gx0C0BhF3DXG5+KfPsNyzjbhVK2TOGx9N0HiNkZV
         hUT6T58Bj9EgjLHUtwegc3pbkFYYVpDD0+NXUobwOFKX1FzI4vASkqoTVwP7vqodd8LN
         mkck/tvoIP5WCt0hwM6phM9lkrKjOzGyInpdB4GZh0Q/Z/Lu5a7ZfGeE5PhkRMeEjj2i
         bkTjwJmoKWxnyiSpSDvqfqHW4JfETDtEK3gEVIS91HMRaXpRtpsKRbJirohdR/0oABzP
         hG1S6R2x4cvamYGpXmyQy8jnzs3eRUIFRgNIuL3BCpAMyhiNIgo95gWxi8J/GflexOac
         XoCw==
X-Gm-Message-State: AOAM532e5cAWZckgEQcpWdSRUuMEWgFx7t4LlN7vznk6khIUFPihjnMT
        9CcXWT9jbDpgTLoGckrfkZk=
X-Google-Smtp-Source: ABdhPJw5sc9t8ZbtBRhHKXbaa5A3QKPHm5cGnFiX3INP3fr0mZVhm3LS0q64I5BZDwlJ6Pz5r5TDww==
X-Received: by 2002:ac8:4d92:: with SMTP id a18mr7378275qtw.338.1604156767194;
        Sat, 31 Oct 2020 08:06:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:06 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] media: vidtv: psi: add a Network Information Table (NIT)
Date:   Sat, 31 Oct 2020 12:05:48 -0300
Message-Id: <20201031150552.663598-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Add a Network Information Table (NIT) as specified in ETSI EN 300 468.

This table conveys information relating to the physical organization of
the multiplexes carried via a given network and the characteristics of
the network itself.

It is conveyed in the output of vidtv as packets with TS PID of 0x0010

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../driver-api/media/drivers/vidtv.rst        |   6 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   |   4 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  59 +++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  16 +
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |   9 +
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 345 +++++++++++++++++-
 drivers/media/test-drivers/vidtv/vidtv_psi.h  | 119 +++++-
 7 files changed, 546 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
index 65115448c52d..2d7ddf676b13 100644
--- a/Documentation/driver-api/media/drivers/vidtv.rst
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -149,11 +149,11 @@ vidtv_psi.[ch]
 	Because the generator is implemented in a separate file, it can be
 	reused elsewhere in the media subsystem.
 
-	Currently vidtv supports working with 3 PSI tables: PAT, PMT and
-	SDT.
+	Currently vidtv supports working with 4 PSI tables: PAT, PMT,
+	SDT and NIT.
 
 	The specification for PAT and PMT can be found in *ISO 13818-1:
-	Systems*, while the specification for the SDT can be found in *ETSI
+	Systems*, while the specification for the SDT, NIT can be found in *ETSI
 	EN 300 468: Specification for Service Information (SI) in DVB
 	systems*.
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 74b054947bbe..2f97ecf423ed 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -28,6 +28,8 @@
 //#define MUX_BUF_MIN_SZ
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
+#define VIDTV_DEFAULT_NETWORK_ID 0x744
+#define VIDTV_DEFAULT_NETWORK_NAME "LinuxTV.org"
 
 /* LNBf fake parameters: ranges used by an Universal (extended) European LNBf */
 #define LNB_CUT_FREQUENCY	11700000
@@ -177,6 +179,8 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 	mux_args.si_period_usecs             = si_period_msec * 1000;
 	mux_args.pcr_pid                     = pcr_pid;
 	mux_args.transport_stream_id         = VIDTV_DEFAULT_TS_ID;
+	mux_args.network_id                  = VIDTV_DEFAULT_NETWORK_ID,
+	mux_args.network_name                = VIDTV_DEFAULT_NETWORK_NAME,
 	mux_args.priv                        = dvb;
 
 	dvb->streaming = true;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index f2b97cf08e87..a246b49123d9 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -246,10 +246,57 @@ vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 	}
 }
 
+static struct vidtv_psi_desc_service_list_entry
+*vidtv_channel_build_service_list(struct vidtv_psi_table_sdt_service *s)
+{
+	struct vidtv_psi_desc_service_list_entry *curr_e = NULL;
+	struct vidtv_psi_desc_service_list_entry *head_e = NULL;
+	struct vidtv_psi_desc_service_list_entry *prev_e = NULL;
+	struct vidtv_psi_desc *desc = s->descriptor;
+	struct vidtv_psi_desc_service *s_desc;
+
+	while (s) {
+		while (desc) {
+			if (s->descriptor->type != SERVICE_DESCRIPTOR)
+				goto next_desc;
+
+			s_desc = (struct vidtv_psi_desc_service *)desc;
+
+			curr_e = kzalloc(sizeof(*curr_e), GFP_KERNEL);
+			curr_e->service_id = s->service_id;
+			curr_e->service_type = s_desc->service_type;
+
+			if (!head_e)
+				head_e = curr_e;
+			if (prev_e)
+				prev_e->next = curr_e;
+
+			prev_e = curr_e;
+
+next_desc:
+			desc = desc->next;
+		}
+		s = s->next;
+	}
+	return head_e;
+}
+
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
 void vidtv_channel_si_init(struct vidtv_mux *m)
 {
 	struct vidtv_psi_table_pat_program *programs = NULL;
 	struct vidtv_psi_table_sdt_service *services = NULL;
+	struct vidtv_psi_desc_service_list_entry *service_list = NULL;
 
 	m->si.pat = vidtv_psi_pat_table_init(m->transport_stream_id);
 
@@ -258,6 +305,15 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	programs = vidtv_channel_pat_prog_cat_into_new(m);
 	services = vidtv_channel_sdt_serv_cat_into_new(m);
 
+	/* look for a service descriptor for every service */
+	service_list = vidtv_channel_build_service_list(services);
+
+	/* use these descriptors to build the NIT */
+	m->si.nit = vidtv_psi_nit_table_init(m->network_id,
+					     m->transport_stream_id,
+					     m->network_name,
+					     service_list);
+
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
 
@@ -269,6 +325,8 @@ void vidtv_channel_si_init(struct vidtv_mux *m)
 	vidtv_channel_pmt_match_sections(m->channels,
 					 m->si.pmt_secs,
 					 m->si.pat->programs);
+
+	vidtv_channel_destroy_service_list(service_list);
 }
 
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
@@ -283,6 +341,7 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 
 	kfree(m->si.pmt_secs);
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
+	vidtv_psi_nit_table_destroy(m->si.nit);
 }
 
 void vidtv_channels_init(struct vidtv_mux *m)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 082740ae9d44..2a960e87c39c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -74,6 +74,8 @@ static void vidtv_mux_pid_ctx_init(struct vidtv_mux *m)
 	vidtv_mux_create_pid_ctx_once(m, VIDTV_PAT_PID);
 	/* push the SDT pid ctx */
 	vidtv_mux_create_pid_ctx_once(m, VIDTV_SDT_PID);
+	/* push the NIT pid ctx */
+	vidtv_mux_create_pid_ctx_once(m, VIDTV_NIT_PID);
 
 	/* add a ctx for all PMT sections */
 	while (p) {
@@ -117,10 +119,12 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	struct vidtv_mux_pid_ctx *pat_ctx;
 	struct vidtv_mux_pid_ctx *pmt_ctx;
 	struct vidtv_mux_pid_ctx *sdt_ctx;
+	struct vidtv_mux_pid_ctx *nit_ctx;
 
 	struct vidtv_psi_pat_write_args pat_args = {};
 	struct vidtv_psi_pmt_write_args pmt_args = {};
 	struct vidtv_psi_sdt_write_args sdt_args = {};
+	struct vidtv_psi_nit_write_args nit_args = {};
 
 	u32 nbytes; /* the number of bytes written by this function */
 	u16 pmt_pid;
@@ -128,6 +132,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 
 	pat_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_PAT_PID);
 	sdt_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_SDT_PID);
+	nit_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_NIT_PID);
 
 	pat_args.buf                = m->mux_buf;
 	pat_args.offset             = m->mux_buf_offset;
@@ -169,6 +174,14 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 
 	m->mux_buf_offset += vidtv_psi_sdt_write_into(sdt_args);
 
+	nit_args.buf                = m->mux_buf;
+	nit_args.offset             = m->mux_buf_offset;
+	nit_args.nit                = m->si.nit;
+	nit_args.buf_sz             = m->mux_buf_sz;
+	nit_args.continuity_counter = &nit_ctx->cc;
+
+	m->mux_buf_offset += vidtv_psi_nit_write_into(nit_args);
+
 	nbytes = m->mux_buf_offset - initial_offset;
 
 	m->num_streamed_si++;
@@ -446,6 +459,8 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 	m->pcr_pid = args.pcr_pid;
 	m->transport_stream_id = args.transport_stream_id;
 	m->priv = args.priv;
+	m->network_id = args.network_id;
+	m->network_name = kstrdup(args.network_name, GFP_KERNEL);
 	m->timing.current_jiffies = get_jiffies_64();
 
 	if (args.channels)
@@ -469,6 +484,7 @@ void vidtv_mux_destroy(struct vidtv_mux *m)
 	vidtv_mux_pid_ctx_destroy(m);
 	vidtv_channel_si_destroy(m);
 	vidtv_channels_destroy(m);
+	kfree(m->network_name);
 	vfree(m->mux_buf);
 	kfree(m);
 }
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 2caa60623e97..5dfbe30c2ac8 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -64,6 +64,7 @@ struct vidtv_mux_si {
 	struct vidtv_psi_table_pat *pat;
 	struct vidtv_psi_table_pmt **pmt_secs; /* the PMT sections */
 	struct vidtv_psi_table_sdt *sdt;
+	struct vidtv_psi_table_nit *nit;
 };
 
 /**
@@ -99,6 +100,8 @@ struct vidtv_mux_pid_ctx {
  * @pcr_pid: The TS PID used for the PSI packets. All channels will share the
  * same PCR.
  * @transport_stream_id: The transport stream ID
+ * @network_id: The network ID
+ * @network_name: The network name
  * @priv: Private data.
  */
 struct vidtv_mux {
@@ -128,6 +131,8 @@ struct vidtv_mux {
 
 	u16 pcr_pid;
 	u16 transport_stream_id;
+	u16 network_id;
+	char *network_name;
 	void *priv;
 };
 
@@ -142,6 +147,8 @@ struct vidtv_mux {
  * same PCR.
  * @transport_stream_id: The transport stream ID
  * @channels: an optional list of channels to use
+ * @network_id: The network ID
+ * @network_name: The network name
  * @priv: Private data.
  */
 struct vidtv_mux_init_args {
@@ -153,6 +160,8 @@ struct vidtv_mux_init_args {
 	u16 pcr_pid;
 	u16 transport_stream_id;
 	struct vidtv_channel *channels;
+	u16 network_id;
+	char *network_name;
 	void *priv;
 };
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index f2e25e68c085..0de6d646a483 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -6,10 +6,6 @@
  * technically be broken into one or more sections, we do not do this here,
  * hence 'table' and 'section' are interchangeable for vidtv.
  *
- * This code currently supports three tables: PAT, PMT and SDT. These are the
- * bare minimum to get userspace to recognize our MPEG transport stream. It can
- * be extended to support more PSI tables in the future.
- *
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
@@ -389,6 +385,75 @@ struct vidtv_psi_desc_registration
 	return desc;
 }
 
+struct vidtv_psi_desc_network_name
+*vidtv_psi_network_name_desc_init(struct vidtv_psi_desc *head, char *network_name)
+{
+	struct vidtv_psi_desc_network_name *desc;
+	u32 network_name_len = network_name ? strlen(network_name) : 0;
+
+	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+
+	desc->type = NETWORK_NAME_DESCRIPTOR;
+
+	desc->length = network_name_len;
+
+	if (network_name && network_name_len)
+		desc->network_name = kstrdup(network_name, GFP_KERNEL);
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
+struct vidtv_psi_desc_service_list
+*vidtv_psi_service_list_desc_init(struct vidtv_psi_desc *head,
+				  struct vidtv_psi_desc_service_list_entry *entry)
+{
+	struct vidtv_psi_desc_service_list *desc;
+	struct vidtv_psi_desc_service_list_entry *curr_e = NULL;
+	struct vidtv_psi_desc_service_list_entry *head_e = NULL;
+	struct vidtv_psi_desc_service_list_entry *prev_e = NULL;
+	u16 length = 0;
+
+	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+
+	desc->type = SERVICE_LIST_DESCRIPTOR;
+
+	while (entry) {
+		curr_e = kzalloc(sizeof(*curr_e), GFP_KERNEL);
+		curr_e->service_id = entry->service_id;
+		curr_e->service_type = entry->service_type;
+
+		length += sizeof(struct vidtv_psi_desc_service_list_entry) -
+			  sizeof(struct vidtv_psi_desc_service_list_entry *);
+
+		if (!head_e)
+			head_e = curr_e;
+		if (prev_e)
+			prev_e->next = curr_e;
+
+		prev_e = curr_e;
+		entry = entry->next;
+	}
+
+	desc->length = length;
+	desc->service_list = head_e;
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
@@ -396,6 +461,8 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 	struct vidtv_psi_desc *curr = NULL;
 
 	struct vidtv_psi_desc_service *service;
+	struct vidtv_psi_desc_network_name *desc_network_name;
+	struct vidtv_psi_desc_service_list *desc_service_list;
 
 	while (desc) {
 		switch (desc->type) {
@@ -408,6 +475,20 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 							    service->provider_name);
 		break;
 
+		case NETWORK_NAME_DESCRIPTOR:
+			desc_network_name = (struct vidtv_psi_desc_network_name *)desc;
+			curr = (struct vidtv_psi_desc *)
+			       vidtv_psi_network_name_desc_init(head,
+								desc_network_name->network_name);
+		break;
+
+		case SERVICE_LIST_DESCRIPTOR:
+			desc_service_list = (struct vidtv_psi_desc_service_list *)desc;
+			curr = (struct vidtv_psi_desc *)
+				vidtv_psi_service_list_desc_init(head,
+								 desc_service_list->service_list);
+		break;
+
 		case REGISTRATION_DESCRIPTOR:
 		default:
 			curr = kzalloc(sizeof(*desc) + desc->length, GFP_KERNEL);
@@ -433,6 +514,8 @@ void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
 {
 	struct vidtv_psi_desc *curr = desc;
 	struct vidtv_psi_desc *tmp  = NULL;
+	struct vidtv_psi_desc_service_list_entry *sl_entry = NULL;
+	struct vidtv_psi_desc_service_list_entry *sl_entry_tmp = NULL;
 
 	while (curr) {
 		tmp  = curr;
@@ -448,6 +531,19 @@ void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
 			/* nothing to do */
 			break;
 
+		case NETWORK_NAME_DESCRIPTOR:
+			kfree(((struct vidtv_psi_desc_network_name *)tmp)->network_name);
+			break;
+
+		case SERVICE_LIST_DESCRIPTOR:
+			sl_entry = ((struct vidtv_psi_desc_service_list *)tmp)->service_list;
+			while (sl_entry) {
+				sl_entry_tmp = sl_entry;
+				sl_entry = sl_entry->next;
+				kfree(sl_entry_tmp);
+			}
+			break;
+
 		default:
 			pr_warn_ratelimited("Possible leak: not handling descriptor type %d\n",
 					    tmp->type);
@@ -519,6 +615,7 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
 	struct psi_write_args psi_args = {};
+	struct vidtv_psi_desc_service_list_entry *serv_list_entry = NULL;
 
 	psi_args.dest_buf = args.dest_buf;
 	psi_args.from     = &args.desc->type;
@@ -564,6 +661,28 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 		break;
 
+	case NETWORK_NAME_DESCRIPTOR:
+		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.len = args.desc->length;
+		psi_args.from = ((struct vidtv_psi_desc_network_name *)args.desc)->network_name;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		break;
+
+	case SERVICE_LIST_DESCRIPTOR:
+		serv_list_entry = ((struct vidtv_psi_desc_service_list *)args.desc)->service_list;
+		while (serv_list_entry) {
+			psi_args.dest_offset = args.dest_offset + nbytes;
+			psi_args.len = sizeof(struct vidtv_psi_desc_service_list_entry) -
+				       sizeof(struct vidtv_psi_desc_service_list_entry *);
+			psi_args.from = serv_list_entry;
+
+			nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+			serv_list_entry = serv_list_entry->next;
+		}
+		break;
+
 	case REGISTRATION_DESCRIPTOR:
 	default:
 		psi_args.dest_offset = args.dest_offset + nbytes;
@@ -682,7 +801,6 @@ void vidtv_psi_sdt_table_update_sec_len(struct vidtv_psi_table_sdt *sdt)
 	}
 
 	length += CRC_SIZE_IN_BYTES;
-
 	vidtv_psi_set_sec_len(&sdt->header, length);
 }
 
@@ -1321,3 +1439,220 @@ struct vidtv_psi_table_pmt
 
 	return NULL; /* not found */
 }
+
+static void vidtv_psi_nit_table_update_sec_len(struct vidtv_psi_table_nit *nit)
+{
+	u16 length = 0;
+	struct vidtv_psi_table_transport *t = nit->transport;
+	u16 desc_loop_len;
+	u16 transport_loop_len = 0;
+
+	/*
+	 * from immediately after 'section_length' until
+	 * 'network_descriptor_length'
+	 */
+	length += NIT_LEN_UNTIL_NETWORK_DESCRIPTOR_LEN;
+
+	desc_loop_len = vidtv_psi_desc_comp_loop_len(nit->descriptor);
+	vidtv_psi_set_desc_loop_len(&nit->bitfield, desc_loop_len, 12);
+
+	length += desc_loop_len;
+
+	length += sizeof_field(struct vidtv_psi_table_nit, bitfield2);
+
+	while (t) {
+		/* skip both pointers at the end */
+		transport_loop_len += sizeof(struct vidtv_psi_table_transport) -
+				      sizeof(struct vidtv_psi_desc *) -
+				      sizeof(struct vidtv_psi_table_transport *);
+
+		length += transport_loop_len;
+
+		desc_loop_len = vidtv_psi_desc_comp_loop_len(t->descriptor);
+		vidtv_psi_set_desc_loop_len(&t->bitfield, desc_loop_len, 12);
+
+		length += desc_loop_len;
+
+		t = t->next;
+	}
+
+	// Actually sets the transport stream loop len, maybe rename this function later
+	vidtv_psi_set_desc_loop_len(&nit->bitfield2, transport_loop_len, 12);
+	length += CRC_SIZE_IN_BYTES;
+
+	vidtv_psi_set_sec_len(&nit->header, length);
+}
+
+struct vidtv_psi_table_nit
+*vidtv_psi_nit_table_init(u16 network_id,
+			  u16 transport_stream_id,
+			  char *network_name,
+			  struct vidtv_psi_desc_service_list_entry *service_list)
+{
+	struct vidtv_psi_table_nit *nit = kzalloc(sizeof(*nit), GFP_KERNEL);
+	struct vidtv_psi_table_transport *transport = kzalloc(sizeof(*transport), GFP_KERNEL);
+
+	const u16 SYNTAX = 0x1;
+	const u16 ONE = 0x1;
+	const u16 ONES = 0x03;
+
+	nit->header.table_id = 0x40; // ACTUAL_NETWORK
+
+	nit->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
+
+	nit->header.id = cpu_to_be16(network_id);
+	nit->header.current_next = ONE;
+
+	nit->header.version = 0x1f;
+
+	nit->header.one2  = ONES;
+	nit->header.section_id   = 0;
+	nit->header.last_section = 0;
+
+	nit->bitfield = cpu_to_be16(0xf);
+	nit->bitfield2 = cpu_to_be16(0xf);
+
+	nit->descriptor = (struct vidtv_psi_desc *)
+			  vidtv_psi_network_name_desc_init(NULL, network_name);
+
+	transport->transport_id = cpu_to_be16(transport_stream_id);
+	transport->network_id = cpu_to_be16(network_id);
+	transport->bitfield = cpu_to_be16(0xf);
+	transport->descriptor = (struct vidtv_psi_desc *)
+				vidtv_psi_service_list_desc_init(NULL, service_list);
+
+	nit->transport = transport;
+
+	vidtv_psi_nit_table_update_sec_len(nit);
+
+	return nit;
+}
+
+u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	u32 crc = INITIAL_CRC;
+
+	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
+	struct vidtv_psi_table_transport *transport = args.nit->transport;
+	struct vidtv_psi_desc *transport_descriptor = (transport) ?
+						       args.nit->transport->descriptor :
+						       NULL;
+
+	struct header_write_args h_args = {};
+	struct psi_write_args psi_args  = {};
+	struct desc_write_args d_args   = {};
+	struct crc32_write_args c_args  = {};
+
+	vidtv_psi_nit_table_update_sec_len(args.nit);
+
+	h_args.dest_buf           = args.buf;
+	h_args.dest_offset        = args.offset;
+	h_args.h                  = &args.nit->header;
+	h_args.pid                = VIDTV_NIT_PID;
+	h_args.continuity_counter = args.continuity_counter;
+	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.crc                = &crc;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	/* write the bitfield */
+	psi_args.dest_buf = args.buf;
+	psi_args.from     = &args.nit->bitfield;
+	psi_args.len      = sizeof_field(struct vidtv_psi_table_nit, bitfield);
+
+	psi_args.dest_offset        = args.offset + nbytes;
+	psi_args.pid                = VIDTV_NIT_PID;
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
+		d_args.pid                = VIDTV_NIT_PID;
+		d_args.continuity_counter = args.continuity_counter;
+		d_args.dest_buf_sz        = args.buf_sz;
+		d_args.crc                = &crc;
+
+		nbytes += vidtv_psi_desc_write_into(d_args);
+
+		table_descriptor = table_descriptor->next;
+	}
+
+	/* write the second bitfield */
+	psi_args.dest_buf = args.buf;
+	psi_args.from = &args.nit->bitfield2;
+	psi_args.len = sizeof_field(struct vidtv_psi_table_nit, bitfield2);
+	psi_args.dest_offset = args.offset + nbytes;
+	psi_args.pid = VIDTV_NIT_PID;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	while (transport) {
+		/* write the transport sections, if any */
+		psi_args.from = transport;
+		psi_args.len  = sizeof_field(struct vidtv_psi_table_transport, transport_id) +
+				sizeof_field(struct vidtv_psi_table_transport, network_id)   +
+				sizeof_field(struct vidtv_psi_table_transport, bitfield);
+		psi_args.dest_offset = args.offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+		while (transport_descriptor) {
+			/* write the transport descriptors, if any */
+			d_args.dest_buf           = args.buf;
+			d_args.dest_offset        = args.offset + nbytes;
+			d_args.desc               = transport_descriptor;
+			d_args.pid                = VIDTV_NIT_PID;
+			d_args.continuity_counter = args.continuity_counter;
+			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.crc                = &crc;
+
+			nbytes += vidtv_psi_desc_write_into(d_args);
+
+			transport_descriptor = transport_descriptor->next;
+		}
+
+		transport = transport->next;
+	}
+
+	c_args.dest_buf           = args.buf;
+	c_args.dest_offset        = args.offset + nbytes;
+	c_args.crc                = cpu_to_be32(crc);
+	c_args.pid                = VIDTV_NIT_PID;
+	c_args.continuity_counter = args.continuity_counter;
+	c_args.dest_buf_sz        = args.buf_sz;
+
+	/* Write the CRC32 at the end */
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+static void vidtv_psi_transport_destroy(struct vidtv_psi_table_transport *t)
+{
+	struct vidtv_psi_table_transport *curr_t = t;
+	struct vidtv_psi_table_transport *tmp_t  = NULL;
+
+	while (curr_t) {
+		tmp_t  = curr_t;
+		curr_t = curr_t->next;
+		vidtv_psi_desc_destroy(tmp_t->descriptor);
+		kfree(tmp_t);
+	}
+}
+
+void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit)
+{
+	vidtv_psi_desc_destroy(nit->descriptor);
+	vidtv_psi_transport_destroy(nit->transport);
+	kfree(nit);
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 3f962cc78278..2272c52b8e4a 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -6,10 +6,6 @@
  * technically be broken into one or more sections, we do not do this here,
  * hence 'table' and 'section' are interchangeable for vidtv.
  *
- * This code currently supports three tables: PAT, PMT and SDT. These are the
- * bare minimum to get userspace to recognize our MPEG transport stream. It can
- * be extended to support more PSI tables in the future.
- *
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
@@ -27,12 +23,16 @@
 #define PAT_LEN_UNTIL_LAST_SECTION_NUMBER 5
 #define PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH 9
 #define SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE 8
+#define NIT_LEN_UNTIL_NETWORK_DESCRIPTOR_LEN 7
 #define MAX_SECTION_LEN 1021
 #define VIDTV_PAT_PID 0 /* mandated by the specs */
 #define VIDTV_SDT_PID 0x0011 /* mandated by the specs */
+#define VIDTV_NIT_PID 0x0010 /* mandated by the specs */
 
 enum vidtv_psi_descriptors {
 	REGISTRATION_DESCRIPTOR	= 0x05, /* See ISO/IEC 13818-1 section 2.6.8 */
+	NETWORK_NAME_DESCRIPTOR = 0x40, /* See ETSI EN 300 468 section 6.2.27 */
+	SERVICE_LIST_DESCRIPTOR = 0x41, /* See ETSI EN 300 468 section 6.2.35 */
 	SERVICE_DESCRIPTOR = 0x48, /* See ETSI EN 300 468 section 6.2.33 */
 };
 
@@ -90,6 +90,34 @@ struct vidtv_psi_desc_registration {
 	u8 additional_identification_info[];
 } __packed;
 
+/**
+ * struct vidtv_psi_desc_network_name - A network name descriptor
+ * see ETSI EN 300 468 v1.15.1 section 6.2.27
+ */
+struct vidtv_psi_desc_network_name {
+	struct vidtv_psi_desc *next;
+	u8 type;
+	u8 length;
+	char *network_name;
+} __packed;
+
+struct vidtv_psi_desc_service_list_entry {
+	__be16 service_id;
+	u8 service_type;
+	struct vidtv_psi_desc_service_list_entry *next;
+} __packed;
+
+/**
+ * struct vidtv_psi_desc_service_list - A service list descriptor
+ * see ETSI EN 300 468 v1.15.1 section 6.2.35
+ */
+struct vidtv_psi_desc_service_list {
+	struct vidtv_psi_desc *next;
+	u8 type;
+	u8 length;
+	struct vidtv_psi_desc_service_list_entry *service_list;
+} __packed;
+
 /**
  * struct vidtv_psi_table_header - A header that is present for all PSI tables.
  */
@@ -290,6 +318,13 @@ struct vidtv_psi_desc_registration
 				  u8 *additional_ident_info,
 				  u32 additional_info_len);
 
+struct vidtv_psi_desc_network_name
+*vidtv_psi_network_name_desc_init(struct vidtv_psi_desc *head, char *network_name);
+
+struct vidtv_psi_desc_service_list
+*vidtv_psi_service_list_desc_init(struct vidtv_psi_desc *head,
+				  struct vidtv_psi_desc_service_list_entry *entry);
+
 struct vidtv_psi_table_pat_program
 *vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
 			    u16 service_id,
@@ -574,4 +609,80 @@ struct vidtv_psi_table_pmt *vidtv_psi_find_pmt_sec(struct vidtv_psi_table_pmt **
 u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p);
 u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *s);
 
+/**
+ * struct vidtv_psi_table_transport - A entry in the TS loop for the NIT and/or other tables.
+ * See ETSI 300 468 section 5.2.1
+ * @transport_id: The TS ID being described
+ * @network_id: The network_id that contains the TS ID
+ * @bitfield: Contains the descriptor loop length
+ * @descriptor: A descriptor loop
+ * @next: Pointer to the next entry
+ *
+ */
+struct vidtv_psi_table_transport {
+	__be16 transport_id;
+	__be16 network_id;
+	__be16 bitfield; /* desc_len: 12, reserved: 4 */
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_transport *next;
+} __packed;
+
+/**
+ * struct vidtv_psi_table_nit - A Network Information Table (NIT). See ETSI 300
+ * 468 section 5.2.1
+ * @header: A PSI table header
+ * @bitfield: Contains the network descriptor length
+ * @descriptor: A descriptor loop describing the network
+ * @bitfield2: Contains the transport stream loop length
+ * @transport: The transport stream loop
+ *
+ */
+struct vidtv_psi_table_nit {
+	struct vidtv_psi_table_header header;
+	__be16 bitfield; /* network_desc_len: 12, reserved:4 */
+	struct vidtv_psi_desc *descriptor;
+	__be16 bitfield2; /* ts_loop_len: 12, reserved: 4 */
+	struct vidtv_psi_table_transport *transport;
+} __packed;
+
+struct vidtv_psi_table_nit
+*vidtv_psi_nit_table_init(u16 network_id,
+			  u16 transport_stream_id,
+			  char *network_name,
+			  struct vidtv_psi_desc_service_list_entry *service_list);
+
+
+/**
+ * struct vidtv_psi_nit_write_args - Arguments for writing a NIT section
+ * @buf: The destination buffer.
+ * @offset: The offset into the destination buffer.
+ * @nit: A pointer to the NIT
+ * @buf_sz: The size of the destination buffer.
+ * @continuity_counter: A pointer to the CC. Incremented on every new packet.
+ *
+ */
+struct vidtv_psi_nit_write_args {
+	char *buf;
+	u32 offset;
+	struct vidtv_psi_table_nit *nit;
+	u32 buf_sz;
+	u8 *continuity_counter;
+};
+
+/**
+ * vidtv_psi_nit_write_into - Write NIT as MPEG-TS packets into a buffer.
+ * @args: an instance of struct vidtv_psi_nit_write_args
+ *
+ * This function writes the MPEG TS packets for a NIT table into a buffer.
+ * Calling code will usually generate the NIT via a call to its init function
+ * and thus is responsible for freeing it.
+ *
+ * Return: The number of bytes written into the buffer. This is NOT
+ * equal to the size of the NIT, since more space is needed for TS headers during TS
+ * encapsulation.
+ */
+u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args);
+
+void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit);
+
 #endif // VIDTV_PSI_H
-- 
2.29.2

