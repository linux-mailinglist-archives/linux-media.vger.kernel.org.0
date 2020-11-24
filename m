Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FBB2C239E
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732559AbgKXLGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:33824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732514AbgKXLGh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:37 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E44122282;
        Tue, 24 Nov 2020 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215992;
        bh=0lzPZWa/Ly6q42aPW60arn5qeGKLjHWRYYiTE3f4x2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XkKqBNT6jzJ3cdNL1l+dKxUGWQzjvuaExliZ+0Z7kCfAS9nT0qxjBm3+fKmUE43LG
         HT64VwPuPQEkAqLee5hAnvjiJfFEBvzP+t+cO3G1vNXGcAnHdH/xgyX8ld2RYAT0tm
         e2PNmOimDhqH907361iF6jtSVSsA50yZrodn6i2U=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaY-Ak; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 27/31] media: vidtv: simplify NIT write function
Date:   Tue, 24 Nov 2020 12:06:23 +0100
Message-Id: <35df4602b43ca85522029f1d335fc00b5a02db87.1606215584.git.mchehab+huawei@kernel.org>
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

- pass struct vidtv_psi_nit_write_args as a pointer;
- avoid initializing struct fields multiple times.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 91 ++++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_psi.h |  2 +-
 3 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index ff1c7c586838..77d691f4ff92 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -204,7 +204,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	nit_args.offset             = m->mux_buf_offset;
 	nit_args.continuity_counter = &nit_ctx->cc;
 
-	m->mux_buf_offset += vidtv_psi_nit_write_into(nit_args);
+	m->mux_buf_offset += vidtv_psi_nit_write_into(&nit_args);
 
 	eit_args.offset             = m->mux_buf_offset;
 	eit_args.continuity_counter = &eit_ctx->cc;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index ffa0ff493d04..87fe3aedc8a8 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1647,53 +1647,60 @@ struct vidtv_psi_table_nit
 	return NULL;
 }
 
-u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
+u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args *args)
 {
-	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
-	struct vidtv_psi_table_transport *transport = args.nit->transport;
+	struct header_write_args h_args = {
+		.dest_buf           = args->buf,
+		.dest_offset        = args->offset,
+		.h                  = &args->nit->header,
+		.pid                = VIDTV_NIT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct psi_write_args psi_args  = {
+		.dest_buf           = args->buf,
+		.from               = &args->nit->bitfield,
+		.len                = sizeof_field(struct vidtv_psi_table_nit, bitfield),
+		.pid                = VIDTV_NIT_PID,
+		.new_psi_section    = false,
+		.is_crc             = false,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct desc_write_args d_args   = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_NIT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct crc32_write_args c_args  = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_NIT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct vidtv_psi_desc *table_descriptor     = args->nit->descriptor;
+	struct vidtv_psi_table_transport *transport = args->nit->transport;
 	struct vidtv_psi_desc *transport_descriptor;
-	struct header_write_args h_args = {};
-	struct psi_write_args psi_args  = {};
-	struct desc_write_args d_args   = {};
-	struct crc32_write_args c_args  = {};
 	u32 crc = INITIAL_CRC;
 	u32 nbytes = 0;
 
-	vidtv_psi_nit_table_update_sec_len(args.nit);
+	vidtv_psi_nit_table_update_sec_len(args->nit);
 
-	h_args.dest_buf           = args.buf;
-	h_args.dest_offset        = args.offset;
-	h_args.h                  = &args.nit->header;
-	h_args.pid                = VIDTV_NIT_PID;
-	h_args.continuity_counter = args.continuity_counter;
-	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.continuity_counter = args->continuity_counter;
 	h_args.crc                = &crc;
 
 	nbytes += vidtv_psi_table_header_write_into(&h_args);
 
 	/* write the bitfield */
-	psi_args.dest_buf = args.buf;
-	psi_args.from     = &args.nit->bitfield;
-	psi_args.len      = sizeof_field(struct vidtv_psi_table_nit, bitfield);
 
-	psi_args.dest_offset        = args.offset + nbytes;
-	psi_args.pid                = VIDTV_NIT_PID;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = false;
-	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.dest_offset        = args->offset + nbytes;
+	psi_args.continuity_counter = args->continuity_counter;
 	psi_args.crc                = &crc;
 
 	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (table_descriptor) {
 		/* write the descriptors, if any */
-		d_args.dest_buf           = args.buf;
-		d_args.dest_offset        = args.offset + nbytes;
+		d_args.dest_offset        = args->offset + nbytes;
 		d_args.desc               = table_descriptor;
-		d_args.pid                = VIDTV_NIT_PID;
-		d_args.continuity_counter = args.continuity_counter;
-		d_args.dest_buf_sz        = args.buf_sz;
+		d_args.continuity_counter = args->continuity_counter;
 		d_args.crc                = &crc;
 
 		nbytes += vidtv_psi_desc_write_into(&d_args);
@@ -1702,21 +1709,19 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 	}
 
 	/* write the second bitfield */
-	psi_args.dest_buf = args.buf;
-	psi_args.from = &args.nit->bitfield2;
+	psi_args.from = &args->nit->bitfield2;
 	psi_args.len = sizeof_field(struct vidtv_psi_table_nit, bitfield2);
-	psi_args.dest_offset = args.offset + nbytes;
-	psi_args.pid = VIDTV_NIT_PID;
+	psi_args.dest_offset = args->offset + nbytes;
 
 	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
+	psi_args.len  = sizeof_field(struct vidtv_psi_table_transport, transport_id) +
+			sizeof_field(struct vidtv_psi_table_transport, network_id)   +
+			sizeof_field(struct vidtv_psi_table_transport, bitfield);
 	while (transport) {
 		/* write the transport sections, if any */
 		psi_args.from = transport;
-		psi_args.len  = sizeof_field(struct vidtv_psi_table_transport, transport_id) +
-				sizeof_field(struct vidtv_psi_table_transport, network_id)   +
-				sizeof_field(struct vidtv_psi_table_transport, bitfield);
-		psi_args.dest_offset = args.offset + nbytes;
+		psi_args.dest_offset = args->offset + nbytes;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
@@ -1724,12 +1729,9 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 		while (transport_descriptor) {
 			/* write the transport descriptors, if any */
-			d_args.dest_buf           = args.buf;
-			d_args.dest_offset        = args.offset + nbytes;
+			d_args.dest_offset        = args->offset + nbytes;
 			d_args.desc               = transport_descriptor;
-			d_args.pid                = VIDTV_NIT_PID;
-			d_args.continuity_counter = args.continuity_counter;
-			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.continuity_counter = args->continuity_counter;
 			d_args.crc                = &crc;
 
 			nbytes += vidtv_psi_desc_write_into(&d_args);
@@ -1740,12 +1742,9 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 		transport = transport->next;
 	}
 
-	c_args.dest_buf           = args.buf;
-	c_args.dest_offset        = args.offset + nbytes;
+	c_args.dest_offset        = args->offset + nbytes;
 	c_args.crc                = cpu_to_be32(crc);
-	c_args.pid                = VIDTV_NIT_PID;
-	c_args.continuity_counter = args.continuity_counter;
-	c_args.dest_buf_sz        = args.buf_sz;
+	c_args.continuity_counter = args->continuity_counter;
 
 	/* Write the CRC32 at the end */
 	nbytes += table_section_crc32_write_into(&c_args);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 5065ddb805b1..9aa43272ecfa 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -710,7 +710,7 @@ struct vidtv_psi_nit_write_args {
  * equal to the size of the NIT, since more space is needed for TS headers during TS
  * encapsulation.
  */
-u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args);
+u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args *args);
 
 void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit);
 
-- 
2.28.0

