Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AE52C23BA
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732405AbgKXLHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732502AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B2E221D91;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=G8UWMrAUt24/HbKnZvnooFJrDZrmNrdEOJgz3oaGdv4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rBQjnRPAFoG7y37aqf/oByF3J0XEiw1LAFPRR9gIZ0vLXwUAWqWMr0soers0FB9D2
         8SzVK1oJk2FfZmzeqErmDvQR058JlOlx+HW/rP3SDZqf8pVSntetAvo5zFMgyAMzuz
         fLNAWsx494AFUllJ9KFdxjN4AxK4lt/pxwdm3+7U=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaQ-7v; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 24/31] media: vidtv: cleanup PAT write function
Date:   Tue, 24 Nov 2020 12:06:20 +0100
Message-Id: <ed8a1649e444d96d10f04f2659842cacc45ddc68.1606215584.git.mchehab+huawei@kernel.org>
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

Avoid initializing the structs multiple times and pass the
PAT struct as a pointer, instead of a var.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 57 ++++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_psi.h |  2 +-
 3 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 0cf784c09024..200a8000603f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -173,7 +173,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	pat_args.offset             = m->mux_buf_offset;
 	pat_args.continuity_counter = &pat_ctx->cc;
 
-	m->mux_buf_offset += vidtv_psi_pat_write_into(pat_args);
+	m->mux_buf_offset += vidtv_psi_pat_write_into(&pat_args);
 
 	for (i = 0; i < m->si.pat->num_pmt; ++i) {
 		pmt_pid = vidtv_psi_pmt_get_pid(m->si.pmt_secs[i],
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 1bc13b0d5fc6..29f35d5faf25 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -961,57 +961,60 @@ struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
 	return pat;
 }
 
-u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
+u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args *args)
 {
-	struct vidtv_psi_table_pat_program *p = args.pat->program;
-	struct header_write_args h_args       = {};
-	struct psi_write_args psi_args        = {};
-	struct crc32_write_args c_args        = {};
-	const u16 pat_pid = VIDTV_PAT_PID;
+	struct vidtv_psi_table_pat_program *p = args->pat->program;
+	struct header_write_args h_args       = {
+		.dest_buf           = args->buf,
+		.dest_offset        = args->offset,
+		.pid                = VIDTV_PAT_PID,
+		.h                  = &args->pat->header,
+		.continuity_counter = args->continuity_counter,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct psi_write_args psi_args        = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_PAT_PID,
+		.new_psi_section    = false,
+		.continuity_counter = args->continuity_counter,
+		.is_crc             = false,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct crc32_write_args c_args        = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_PAT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
 	u32 crc = INITIAL_CRC;
 	u32 nbytes = 0;
 
-	vidtv_psi_pat_table_update_sec_len(args.pat);
+	vidtv_psi_pat_table_update_sec_len(args->pat);
 
-	h_args.dest_buf           = args.buf;
-	h_args.dest_offset        = args.offset;
-	h_args.h                  = &args.pat->header;
-	h_args.pid                = pat_pid;
-	h_args.continuity_counter = args.continuity_counter;
-	h_args.dest_buf_sz        = args.buf_sz;
 	h_args.crc = &crc;
 
 	nbytes += vidtv_psi_table_header_write_into(&h_args);
 
 	/* note that the field 'u16 programs' is not really part of the PAT */
 
-	psi_args.dest_buf           = args.buf;
-	psi_args.pid                = pat_pid;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = false;
-	psi_args.dest_buf_sz        = args.buf_sz;
-	psi_args.crc                = &crc;
+	psi_args.crc = &crc;
 
 	while (p) {
 		/* copy the PAT programs */
 		psi_args.from = p;
 		/* skip the pointer */
 		psi_args.len = sizeof(*p) -
-			   sizeof(struct vidtv_psi_table_pat_program *);
-		psi_args.dest_offset = args.offset + nbytes;
+			       sizeof(struct vidtv_psi_table_pat_program *);
+		psi_args.dest_offset = args->offset + nbytes;
+		psi_args.continuity_counter = args->continuity_counter;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		p = p->next;
 	}
 
-	c_args.dest_buf           = args.buf;
-	c_args.dest_offset        = args.offset + nbytes;
+	c_args.dest_offset        = args->offset + nbytes;
+	c_args.continuity_counter = args->continuity_counter;
 	c_args.crc                = cpu_to_be32(crc);
-	c_args.pid                = pat_pid;
-	c_args.continuity_counter = args.continuity_counter;
-	c_args.dest_buf_sz        = args.buf_sz;
 
 	/* Write the CRC32 at the end */
 	nbytes += table_section_crc32_write_into(&c_args);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 1bf0103e6840..ba5c91a0d387 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -556,7 +556,7 @@ struct vidtv_psi_pat_write_args {
  * equal to the size of the PAT, since more space is needed for TS headers during TS
  * encapsulation.
  */
-u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args);
+u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args *args);
 
 /**
  * struct vidtv_psi_sdt_write_args - Arguments for writing a SDT table
-- 
2.28.0

