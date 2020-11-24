Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4585A2C23AF
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732643AbgKXLHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:33792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732504AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4093E221EB;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=+jZzZC+Lv638cKmRSSgEOuv/zUcuFka/FHuiKGg8Lx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=efA56DHAW6mJhV5CODEmo20BASI15LkeKUQ3ovCD04NZoBpC7o6o0uzBX2k5LBzin
         AnrCF7MxbJ/hntCOuCkM2U158SL9/uAQWYXTD+UWgGTL+mldU8mvrQQbOZFLEg6GdI
         ESeSJSxZHHt4f0ZFDdaT6t0+kh4sU1kAONgxgH9E=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaS-8t; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 25/31] media: vidtv: cleanup PMT write table function
Date:   Tue, 24 Nov 2020 12:06:21 +0100
Message-Id: <c581adb5d12cb76be45e589e205e001bd83b013a.1606215584.git.mchehab+huawei@kernel.org>
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

- Pass struct vidtv_psi_pmt_write_args as a pointer;
- Avoid initializing structs multiple times.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 91 ++++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_psi.h |  2 +-
 3 files changed, 46 insertions(+), 49 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 200a8000603f..239e0a242b6e 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -193,7 +193,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 		pmt_args.continuity_counter = &pmt_ctx->cc;
 
 		/* write each section into buffer */
-		m->mux_buf_offset += vidtv_psi_pmt_write_into(pmt_args);
+		m->mux_buf_offset += vidtv_psi_pmt_write_into(&pmt_args);
 	}
 
 	sdt_args.offset             = m->mux_buf_offset;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 29f35d5faf25..ab349654ba54 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1159,54 +1159,58 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 	return pmt;
 }
 
-u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
+u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args *args)
 {
-	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
-	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
+	struct vidtv_psi_desc *table_descriptor   = args->pmt->descriptor;
+	struct vidtv_psi_table_pmt_stream *stream = args->pmt->stream;
 	struct vidtv_psi_desc *stream_descriptor;
-	struct header_write_args h_args = {};
-	struct psi_write_args psi_args  = {};
-	struct desc_write_args d_args   = {};
-	struct crc32_write_args c_args  = {};
+	struct header_write_args h_args = {
+		.dest_buf           = args->buf,
+		.dest_offset        = args->offset,
+		.h                  = &args->pmt->header,
+		.pid                = args->pid,
+		.continuity_counter = args->continuity_counter,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct psi_write_args psi_args  = {
+		.dest_buf = args->buf,
+		.from     = &args->pmt->bitfield,
+		.len      = sizeof_field(struct vidtv_psi_table_pmt, bitfield) +
+			    sizeof_field(struct vidtv_psi_table_pmt, bitfield2),
+		.pid                = args->pid,
+		.new_psi_section    = false,
+		.is_crc             = false,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct desc_write_args d_args   = {
+		.dest_buf           = args->buf,
+		.desc               = table_descriptor,
+		.pid                = args->pid,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct crc32_write_args c_args  = {
+		.dest_buf           = args->buf,
+		.pid                = args->pid,
+		.dest_buf_sz        = args->buf_sz,
+	};
 	u32 crc = INITIAL_CRC;
 	u32 nbytes = 0;
 
-	vidtv_psi_pmt_table_update_sec_len(args.pmt);
+	vidtv_psi_pmt_table_update_sec_len(args->pmt);
 
-	h_args.dest_buf           = args.buf;
-	h_args.dest_offset        = args.offset;
-	h_args.h                  = &args.pmt->header;
-	h_args.pid                = args.pid;
-	h_args.continuity_counter = args.continuity_counter;
-	h_args.dest_buf_sz        = args.buf_sz;
 	h_args.crc                = &crc;
 
 	nbytes += vidtv_psi_table_header_write_into(&h_args);
 
 	/* write the two bitfields */
-	psi_args.dest_buf = args.buf;
-	psi_args.from     = &args.pmt->bitfield;
-	psi_args.len      = sizeof_field(struct vidtv_psi_table_pmt, bitfield) +
-			    sizeof_field(struct vidtv_psi_table_pmt, bitfield2);
-
-	psi_args.dest_offset        = args.offset + nbytes;
-	psi_args.pid                = args.pid;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = false;
-	psi_args.dest_buf_sz        = args.buf_sz;
-	psi_args.crc                = &crc;
-
+	psi_args.dest_offset        = args->offset + nbytes;
+	psi_args.continuity_counter = args->continuity_counter;
 	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (table_descriptor) {
 		/* write the descriptors, if any */
-		d_args.dest_buf           = args.buf;
-		d_args.dest_offset        = args.offset + nbytes;
-		d_args.desc               = table_descriptor;
-		d_args.pid                = args.pid;
-		d_args.continuity_counter = args.continuity_counter;
-		d_args.dest_buf_sz        = args.buf_sz;
+		d_args.dest_offset        = args->offset + nbytes;
+		d_args.continuity_counter = args->continuity_counter;
 		d_args.crc                = &crc;
 
 		nbytes += vidtv_psi_desc_write_into(&d_args);
@@ -1214,13 +1218,12 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 		table_descriptor = table_descriptor->next;
 	}
 
+	psi_args.len += sizeof_field(struct vidtv_psi_table_pmt_stream, type);
 	while (stream) {
 		/* write the streams, if any */
 		psi_args.from = stream;
-		psi_args.len  = sizeof_field(struct vidtv_psi_table_pmt_stream, type) +
-				sizeof_field(struct vidtv_psi_table_pmt_stream, bitfield) +
-				sizeof_field(struct vidtv_psi_table_pmt_stream, bitfield2);
-		psi_args.dest_offset = args.offset + nbytes;
+		psi_args.dest_offset = args->offset + nbytes;
+		psi_args.continuity_counter = args->continuity_counter;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
@@ -1228,12 +1231,9 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 		while (stream_descriptor) {
 			/* write the stream descriptors, if any */
-			d_args.dest_buf           = args.buf;
-			d_args.dest_offset        = args.offset + nbytes;
+			d_args.dest_offset        = args->offset + nbytes;
 			d_args.desc               = stream_descriptor;
-			d_args.pid                = args.pid;
-			d_args.continuity_counter = args.continuity_counter;
-			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.continuity_counter = args->continuity_counter;
 			d_args.crc                = &crc;
 
 			nbytes += vidtv_psi_desc_write_into(&d_args);
@@ -1244,12 +1244,9 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 		stream = stream->next;
 	}
 
-	c_args.dest_buf           = args.buf;
-	c_args.dest_offset        = args.offset + nbytes;
+	c_args.dest_offset        = args->offset + nbytes;
 	c_args.crc                = cpu_to_be32(crc);
-	c_args.pid                = args.pid;
-	c_args.continuity_counter = args.continuity_counter;
-	c_args.dest_buf_sz        = args.buf_sz;
+	c_args.continuity_counter = args->continuity_counter;
 
 	/* Write the CRC32 at the end */
 	nbytes += table_section_crc32_write_into(&c_args);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index ba5c91a0d387..b72635bcdae7 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -621,7 +621,7 @@ struct vidtv_psi_pmt_write_args {
  * equal to the size of the PMT section, since more space is needed for TS headers
  * during TS encapsulation.
  */
-u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args);
+u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args *args);
 
 /**
  * vidtv_psi_find_pmt_sec - Finds the PMT section for 'program_num'
-- 
2.28.0

