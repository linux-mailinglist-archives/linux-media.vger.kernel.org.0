Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DD62C23C1
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbgKXLHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:33780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732448AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3B9220B1F;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=YlTEEhmthM6YyeVWr66Zz28hWTcdh7fEfKoV1W8zEsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gbO+HR5fl81qiEsVfQP+cRpMPkXou6XlHPqyStI8jHh3AlHOqof/sitZX1CUarkk/
         fSTCKt40XE8u8O294Xt5puI9GxqKr4GDXoNHdg2ho10oebTehNGDs0q6CTIGDFiZvK
         qVAoO4FOfiOGeXuSCpAQvuWOU78QY5ui39LhcUL0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Fa2-0Y; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 16/31] media: vidtv: add a PID entry for the NIT table
Date:   Tue, 24 Nov 2020 12:06:12 +0100
Message-Id: <31aaa4882400cef0b944e77a3b13efacb2ba5f7d.1606215584.git.mchehab+huawei@kernel.org>
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

On normal TS streams, the NIT table has its own entry at PAT,
but not at PMT.

While here, properly handle alloc problems when creating
PMT entries.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_channel.c  |  8 ++--
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 43 +++++++++++++------
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  3 +-
 4 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index d1d312566bc0..b7cf8caaeb40 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -45,6 +45,7 @@ static void vidtv_channel_encoder_destroy(struct vidtv_encoder *e)
 }
 
 #define ENCODING_ISO8859_15 "\x0b"
+#define TS_NIT_PID	0x10
 
 /*
  * init an audio only channel with a s302m encoder
@@ -296,6 +297,8 @@ vidtv_channel_pat_prog_cat_into_new(struct vidtv_mux *m)
 
 		cur_chnl = cur_chnl->next;
 	}
+	/* Add the NIT table */
+	vidtv_psi_pat_program_init(tail, 0, TS_NIT_PID);
 
 	return head;
 }
@@ -473,7 +476,7 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 
 	vidtv_channel_pmt_match_sections(m->channels,
 					 m->si.pmt_secs,
-					 m->si.pat->programs);
+					 m->si.pat->num_pmt);
 
 	vidtv_channel_destroy_service_list(service_list);
 
@@ -500,12 +503,11 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
 {
-	u16 num_programs = m->si.pat->programs;
 	u32 i;
 
 	vidtv_psi_pat_table_destroy(m->si.pat);
 
-	for (i = 0; i < num_programs; ++i)
+	for (i = 0; i < m->si.pat->num_pmt; ++i)
 		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
 
 	kfree(m->si.pmt_secs);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index e0cc74e98632..0cf784c09024 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -175,7 +175,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 
 	m->mux_buf_offset += vidtv_psi_pat_write_into(pat_args);
 
-	for (i = 0; i < m->si.pat->programs; ++i) {
+	for (i = 0; i < m->si.pat->num_pmt; ++i) {
 		pmt_pid = vidtv_psi_pmt_get_pid(m->si.pmt_secs[i],
 						m->si.pat);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 02dd217bdbf6..5c887639b676 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -794,7 +794,7 @@ vidtv_psi_pat_table_update_sec_len(struct vidtv_psi_table_pat *pat)
 	length += PAT_LEN_UNTIL_LAST_SECTION_NUMBER;
 
 	/* do not count the pointer */
-	for (i = 0; i < pat->programs; ++i)
+	for (i = 0; i < pat->num_pat; ++i)
 		length += sizeof(struct vidtv_psi_table_pat_program) -
 			  sizeof(struct vidtv_psi_table_pat_program *);
 
@@ -931,7 +931,7 @@ vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 			program = program->next;
 		}
 
-		pat->programs = program_count;
+		pat->num_pat = program_count;
 		pat->program  = p;
 
 		/* Recompute section length */
@@ -966,8 +966,6 @@ struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
 	pat->header.section_id   = 0x0;
 	pat->header.last_section = 0x0;
 
-	pat->programs = 0;
-
 	vidtv_psi_pat_table_update_sec_len(pat);
 
 	return pat;
@@ -1488,22 +1486,43 @@ vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
 					    u16 pcr_pid)
 
 {
-	struct vidtv_psi_table_pat_program *program = pat->program;
+	struct vidtv_psi_table_pat_program *program;
 	struct vidtv_psi_table_pmt **pmt_secs;
-	u32 i = 0;
+	u32 i = 0, num_pmt = 0;
 
-	/* a section for each program_id */
-	pmt_secs = kcalloc(pat->programs,
+	/*
+	 * The number of PMT entries is the number of PAT entries
+	 * that contain service_id. That exclude special tables, like NIT
+	 */
+	program = pat->program;
+	while (program) {
+		if (program->service_id)
+			num_pmt++;
+		program = program->next;
+	}
+
+	pmt_secs = kcalloc(num_pmt,
 			   sizeof(struct vidtv_psi_table_pmt *),
 			   GFP_KERNEL);
 	if (!pmt_secs)
 		return NULL;
 
-	while (program) {
-		pmt_secs[i] = vidtv_psi_pmt_table_init(be16_to_cpu(program->service_id), pcr_pid);
-		++i;
-		program = program->next;
+	for (program = pat->program; program; program = program->next) {
+		if (!program->service_id)
+			continue;
+		pmt_secs[i] = vidtv_psi_pmt_table_init(be16_to_cpu(program->service_id),
+						       pcr_pid);
+
+		if (!pmt_secs[i]) {
+			while (i > 0) {
+				i--;
+				vidtv_psi_pmt_table_destroy(pmt_secs[i]);
+			}
+			return NULL;
+		}
+		i++;
 	}
+	pat->num_pmt = num_pmt;
 
 	return pmt_secs;
 }
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 26b2c2f5774c..8f98bcaf6229 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -174,7 +174,8 @@ struct vidtv_psi_table_pat_program {
  */
 struct vidtv_psi_table_pat {
 	struct vidtv_psi_table_header header;
-	u16 programs; /* Included by libdvbv5, not part of the table and not actually serialized */
+	u16 num_pat;
+	u16 num_pmt;
 	struct vidtv_psi_table_pat_program *program;
 } __packed;
 
-- 
2.28.0

