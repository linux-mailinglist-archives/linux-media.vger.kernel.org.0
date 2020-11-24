Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD4C2C23C8
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732776AbgKXLHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:33790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732421AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9006208DB;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=zqP2ZLOBN255u1tK6Ne0X9rdAbfRvEZ3u2d/BpSccko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NhHDocT0B4bzeifeaydbYu5uBZpjbvdqChfHQXXic4yyPu09QYN9j45zrY+LcrDhL
         blYlBnkNP84KPc0u9waskDBhvCPq48BnS2JjFuDxr9d1rBNEb4Oo24Z0yRvwGeAZOj
         qqYaksoMDdnXK9oFUhQ8L16G4HuJAqIFqPGmnq3g=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZR-Kx; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 03/31] media: vidtv: don't use recursive functions
Date:   Tue, 24 Nov 2020 12:05:59 +0100
Message-Id: <319acceb592f0970448eaa81c26f3631b692ad07.1606215584.git.mchehab+huawei@kernel.org>
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

The Linux stack is too short. So, using recursive functions
is a very bad idea. Convert those into non-recursive ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 75 +++++++++++---------
 1 file changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index b4bbd450fbe6..f92ff54fe19b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -951,25 +951,29 @@ vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 {
 	/* This function transfers ownership of p to the table */
 
-	u16 program_count = 0;
-	struct vidtv_psi_table_pat_program *program = p;
+	u16 program_count;
+	struct vidtv_psi_table_pat_program *program;
 
-	if (p == pat->program)
-		return;
+	do {
+		program_count = 0;
+		program = p;
 
-	while (program) {
-		++program_count;
-		program = program->next;
-	}
+		if (p == pat->program)
+			return;
 
-	pat->programs = program_count;
-	pat->program  = p;
+		while (program) {
+			++program_count;
+			program = program->next;
+		}
 
-	/* Recompute section length */
-	vidtv_psi_pat_table_update_sec_len(pat);
+		pat->programs = program_count;
+		pat->program  = p;
 
-	if (vidtv_psi_get_sec_len(&pat->header) > MAX_SECTION_LEN)
-		vidtv_psi_pat_program_assign(pat, NULL);
+		/* Recompute section length */
+		vidtv_psi_pat_table_update_sec_len(pat);
+
+		p = NULL;
+	} while (vidtv_psi_get_sec_len(&pat->header) > MAX_SECTION_LEN);
 
 	vidtv_psi_update_version_num(&pat->header);
 }
@@ -1124,15 +1128,16 @@ void vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s)
 void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
 				 struct vidtv_psi_table_pmt_stream *s)
 {
-	/* This function transfers ownership of s to the table */
-	if (s == pmt->stream)
-		return;
+	do {
+		/* This function transfers ownership of s to the table */
+		if (s == pmt->stream)
+			return;
 
-	pmt->stream = s;
-	vidtv_psi_pmt_table_update_sec_len(pmt);
+		pmt->stream = s;
+		vidtv_psi_pmt_table_update_sec_len(pmt);
 
-	if (vidtv_psi_get_sec_len(&pmt->header) > MAX_SECTION_LEN)
-		vidtv_psi_pmt_stream_assign(pmt, NULL);
+		s = NULL;
+	} while (vidtv_psi_get_sec_len(&pmt->header) > MAX_SECTION_LEN);
 
 	vidtv_psi_update_version_num(&pmt->header);
 }
@@ -1500,16 +1505,17 @@ void
 vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
 			     struct vidtv_psi_table_sdt_service *service)
 {
-	if (service == sdt->service)
-		return;
+	do {
+		if (service == sdt->service)
+			return;
 
-	sdt->service = service;
+		sdt->service = service;
 
-	/* recompute section length */
-	vidtv_psi_sdt_table_update_sec_len(sdt);
+		/* recompute section length */
+		vidtv_psi_sdt_table_update_sec_len(sdt);
 
-	if (vidtv_psi_get_sec_len(&sdt->header) > MAX_SECTION_LEN)
-		vidtv_psi_sdt_service_assign(sdt, NULL);
+		service = NULL;
+	} while (vidtv_psi_get_sec_len(&sdt->header) > MAX_SECTION_LEN);
 
 	vidtv_psi_update_version_num(&sdt->header);
 }
@@ -1832,14 +1838,15 @@ void vidtv_psi_eit_table_update_sec_len(struct vidtv_psi_table_eit *eit)
 void vidtv_psi_eit_event_assign(struct vidtv_psi_table_eit *eit,
 				struct vidtv_psi_table_eit_event *e)
 {
-	if (e == eit->event)
-		return;
+	do {
+		if (e == eit->event)
+			return;
 
-	eit->event = e;
-	vidtv_psi_eit_table_update_sec_len(eit);
+		eit->event = e;
+		vidtv_psi_eit_table_update_sec_len(eit);
 
-	if (vidtv_psi_get_sec_len(&eit->header) > EIT_MAX_SECTION_LEN)
-		vidtv_psi_eit_event_assign(eit, NULL);
+		e = NULL;
+	} while (vidtv_psi_get_sec_len(&eit->header) > EIT_MAX_SECTION_LEN);
 
 	vidtv_psi_update_version_num(&eit->header);
 }
-- 
2.28.0

