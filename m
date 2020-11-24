Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B4C2C23A6
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbgKXLGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:33784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732511AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5446C22228;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=6Dj298ztKfE+ZkBGd+9F1Ggx/oCFFgj0oxJDMUVS0rs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WKBCiph4feqYW8XQngopgq11wdjG5/vjyWKUkLkx0KNV60C1fRRQoiHEGGjBwmMVH
         RPHbHHCf1NL4yPjrNB2WHcaZ4F0B+DGnmupnlzGWLw/JIeGtGFhGn16hs4mvYXpXw0
         7Pb7bFUaRzht1Zdd2U+XJFBNo6dT1JnkaobKDeZo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Fac-Bq; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 28/31] media: vidtv: simplify EIT write function
Date:   Tue, 24 Nov 2020 12:06:24 +0100
Message-Id: <740356abb4b2543811d56ed23fe5dcb2282d5c70.1606215584.git.mchehab+huawei@kernel.org>
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

- pass struct vidtv_psi_eit_write_args as a pointer;
- avoid initializing struct fields multiple times.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 86 ++++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_psi.h |  2 +-
 3 files changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 77d691f4ff92..b51e6a3b8cbe 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -209,7 +209,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	eit_args.offset             = m->mux_buf_offset;
 	eit_args.continuity_counter = &eit_ctx->cc;
 
-	m->mux_buf_offset += vidtv_psi_eit_write_into(eit_args);
+	m->mux_buf_offset += vidtv_psi_eit_write_into(&eit_args);
 
 	nbytes = m->mux_buf_offset - initial_offset;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 87fe3aedc8a8..9df6bca4e0a4 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1857,55 +1857,63 @@ struct vidtv_psi_table_eit
 	return eit;
 }
 
-u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
+u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args *args)
 {
-	struct vidtv_psi_table_eit_event *event = args.eit->event;
+	struct header_write_args h_args = {
+		.dest_buf        = args->buf,
+		.dest_offset     = args->offset,
+		.h               = &args->eit->header,
+		.pid             = VIDTV_EIT_PID,
+		.dest_buf_sz     = args->buf_sz,
+	};
+	struct psi_write_args psi_args  = {
+		.dest_buf        = args->buf,
+		.len             = sizeof_field(struct vidtv_psi_table_eit, transport_id) +
+			           sizeof_field(struct vidtv_psi_table_eit, network_id)   +
+			           sizeof_field(struct vidtv_psi_table_eit, last_segment) +
+			           sizeof_field(struct vidtv_psi_table_eit, last_table_id),
+		.pid             = VIDTV_EIT_PID,
+		.new_psi_section = false,
+		.is_crc          = false,
+		.dest_buf_sz     = args->buf_sz,
+	};
+	struct desc_write_args d_args   = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_EIT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct crc32_write_args c_args  = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_EIT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct vidtv_psi_table_eit_event *event = args->eit->event;
 	struct vidtv_psi_desc *event_descriptor;
-	struct header_write_args h_args = {};
-	struct psi_write_args psi_args  = {};
-	struct desc_write_args d_args   = {};
-	struct crc32_write_args c_args  = {};
 	u32 crc = INITIAL_CRC;
 	u32 nbytes  = 0;
 
-	vidtv_psi_eit_table_update_sec_len(args.eit);
+	vidtv_psi_eit_table_update_sec_len(args->eit);
 
-	h_args.dest_buf           = args.buf;
-	h_args.dest_offset        = args.offset;
-	h_args.h                  = &args.eit->header;
-	h_args.pid                = VIDTV_EIT_PID;
-	h_args.continuity_counter = args.continuity_counter;
-	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.continuity_counter = args->continuity_counter;
 	h_args.crc                = &crc;
 
 	nbytes += vidtv_psi_table_header_write_into(&h_args);
 
-	psi_args.dest_buf = args.buf;
-	psi_args.from     = &args.eit->transport_id;
-
-	psi_args.len = sizeof_field(struct vidtv_psi_table_eit, transport_id) +
-		       sizeof_field(struct vidtv_psi_table_eit, network_id)   +
-		       sizeof_field(struct vidtv_psi_table_eit, last_segment) +
-		       sizeof_field(struct vidtv_psi_table_eit, last_table_id);
-
-	psi_args.dest_offset        = args.offset + nbytes;
-	psi_args.pid                = VIDTV_EIT_PID;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = false;
-	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.from               = &args->eit->transport_id;
+	psi_args.dest_offset        = args->offset + nbytes;
+	psi_args.continuity_counter = args->continuity_counter;
 	psi_args.crc                = &crc;
 
 	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
+	/* skip both pointers at the end */
+	psi_args.len = sizeof(struct vidtv_psi_table_eit_event) -
+		       sizeof(struct vidtv_psi_desc *) -
+		       sizeof(struct vidtv_psi_table_eit_event *);
 	while (event) {
 		/* copy the events, if any */
 		psi_args.from = event;
-		/* skip both pointers at the end */
-		psi_args.len = sizeof(struct vidtv_psi_table_eit_event) -
-			       sizeof(struct vidtv_psi_desc *) -
-			       sizeof(struct vidtv_psi_table_eit_event *);
-		psi_args.dest_offset = args.offset + nbytes;
+		psi_args.dest_offset = args->offset + nbytes;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
@@ -1913,12 +1921,9 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 
 		while (event_descriptor) {
 			/* copy the event descriptors, if any */
-			d_args.dest_buf           = args.buf;
-			d_args.dest_offset        = args.offset + nbytes;
+			d_args.dest_offset        = args->offset + nbytes;
 			d_args.desc               = event_descriptor;
-			d_args.pid                = VIDTV_EIT_PID;
-			d_args.continuity_counter = args.continuity_counter;
-			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.continuity_counter = args->continuity_counter;
 			d_args.crc                = &crc;
 
 			nbytes += vidtv_psi_desc_write_into(&d_args);
@@ -1929,12 +1934,9 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 		event = event->next;
 	}
 
-	c_args.dest_buf           = args.buf;
-	c_args.dest_offset        = args.offset + nbytes;
+	c_args.dest_offset        = args->offset + nbytes;
 	c_args.crc                = cpu_to_be32(crc);
-	c_args.pid                = VIDTV_EIT_PID;
-	c_args.continuity_counter = args.continuity_counter;
-	c_args.dest_buf_sz        = args.buf_sz;
+	c_args.continuity_counter = args->continuity_counter;
 
 	/* Write the CRC at the end */
 	nbytes += table_section_crc32_write_into(&c_args);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 9aa43272ecfa..6efc27996395 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -775,7 +775,7 @@ struct vidtv_psi_eit_write_args {
  * equal to the size of the EIT, since more space is needed for TS headers during TS
  * encapsulation.
  */
-u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args);
+u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args *args);
 
 void vidtv_psi_eit_table_destroy(struct vidtv_psi_table_eit *eit);
 
-- 
2.28.0

