Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29092C23B0
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732493AbgKXLHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:33818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732505AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44565221F9;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=w/tJPJr6IOV6p4PXXs54u7f4fAHEeqps80vv1D4BmO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uz3BnRdmaQ3T+KINDENifiCSGQmoXeqoymmkVdKkRwhqdit3NHCI89/wkDnuxz/W3
         I7BgVh+jrjJ/w8uj/MsjfePf4iOkj1/ZHdlOuwfRAZ65w8bcMgBx/vPbmrVRNgZYCy
         X4Zk50mWGYvebiAx3fDH8xeeL4PEhKUP7LepUnVs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaV-9q; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 26/31] media: vidtv: simplify SDT write function
Date:   Tue, 24 Nov 2020 12:06:22 +0100
Message-Id: <8f6c5baf950d66410e4df9826a8ef407caa5039d.1606215584.git.mchehab+huawei@kernel.org>
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

- pass struct vidtv_psi_sdt_write_args as a pointer;
- avoid initializing struct fields multiple times.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 85 ++++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_psi.h |  2 +-
 3 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 239e0a242b6e..ff1c7c586838 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -199,7 +199,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	sdt_args.offset             = m->mux_buf_offset;
 	sdt_args.continuity_counter = &sdt_ctx->cc;
 
-	m->mux_buf_offset += vidtv_psi_sdt_write_into(sdt_args);
+	m->mux_buf_offset += vidtv_psi_sdt_write_into(&sdt_args);
 
 	nit_args.offset             = m->mux_buf_offset;
 	nit_args.continuity_counter = &nit_ctx->cc;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index ab349654ba54..ffa0ff493d04 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1306,57 +1306,66 @@ struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 network_id,
 	return sdt;
 }
 
-u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
+u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args *args)
 {
-	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
+	struct header_write_args h_args = {
+		.dest_buf           = args->buf,
+		.dest_offset        = args->offset,
+		.h                  = &args->sdt->header,
+		.pid                = VIDTV_SDT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct psi_write_args psi_args  = {
+		.dest_buf = args->buf,
+		.len = sizeof_field(struct vidtv_psi_table_sdt, network_id) +
+		       sizeof_field(struct vidtv_psi_table_sdt, reserved),
+		.pid                = VIDTV_SDT_PID,
+		.new_psi_section    = false,
+		.is_crc             = false,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct desc_write_args d_args   = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_SDT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct crc32_write_args c_args  = {
+		.dest_buf           = args->buf,
+		.pid                = VIDTV_SDT_PID,
+		.dest_buf_sz        = args->buf_sz,
+	};
+	struct vidtv_psi_table_sdt_service *service = args->sdt->service;
 	struct vidtv_psi_desc *service_desc;
-	struct header_write_args h_args = {};
-	struct psi_write_args psi_args  = {};
-	struct desc_write_args d_args   = {};
-	struct crc32_write_args c_args  = {};
-	u16 sdt_pid = VIDTV_SDT_PID;
 	u32 nbytes  = 0;
 	u32 crc = INITIAL_CRC;
 
 	/* see ETSI EN 300 468 v1.15.1 p. 11 */
 
-	vidtv_psi_sdt_table_update_sec_len(args.sdt);
+	vidtv_psi_sdt_table_update_sec_len(args->sdt);
 
-	h_args.dest_buf           = args.buf;
-	h_args.dest_offset        = args.offset;
-	h_args.h                  = &args.sdt->header;
-	h_args.pid                = sdt_pid;
-	h_args.continuity_counter = args.continuity_counter;
-	h_args.dest_buf_sz        = args.buf_sz;
+	h_args.continuity_counter = args->continuity_counter;
 	h_args.crc                = &crc;
 
 	nbytes += vidtv_psi_table_header_write_into(&h_args);
 
-	psi_args.dest_buf = args.buf;
-	psi_args.from     = &args.sdt->network_id;
-
-	psi_args.len = sizeof_field(struct vidtv_psi_table_sdt, network_id) +
-		       sizeof_field(struct vidtv_psi_table_sdt, reserved);
-
-	psi_args.dest_offset        = args.offset + nbytes;
-	psi_args.pid                = sdt_pid;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = false;
-	psi_args.dest_buf_sz        = args.buf_sz;
+	psi_args.from               = &args->sdt->network_id;
+	psi_args.dest_offset        = args->offset + nbytes;
+	psi_args.continuity_counter = args->continuity_counter;
 	psi_args.crc                = &crc;
 
 	/* copy u16 network_id + u8 reserved)*/
 	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
+	/* skip both pointers at the end */
+	psi_args.len = sizeof(struct vidtv_psi_table_sdt_service) -
+		       sizeof(struct vidtv_psi_desc *) -
+		       sizeof(struct vidtv_psi_table_sdt_service *);
+
 	while (service) {
 		/* copy the services, if any */
 		psi_args.from = service;
-		/* skip both pointers at the end */
-		psi_args.len = sizeof(struct vidtv_psi_table_sdt_service) -
-			       sizeof(struct vidtv_psi_desc *) -
-			       sizeof(struct vidtv_psi_table_sdt_service *);
-		psi_args.dest_offset = args.offset + nbytes;
+		psi_args.dest_offset = args->offset + nbytes;
+		psi_args.continuity_counter = args->continuity_counter;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
@@ -1364,12 +1373,9 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 
 		while (service_desc) {
 			/* copy the service descriptors, if any */
-			d_args.dest_buf           = args.buf;
-			d_args.dest_offset        = args.offset + nbytes;
+			d_args.dest_offset        = args->offset + nbytes;
 			d_args.desc               = service_desc;
-			d_args.pid                = sdt_pid;
-			d_args.continuity_counter = args.continuity_counter;
-			d_args.dest_buf_sz        = args.buf_sz;
+			d_args.continuity_counter = args->continuity_counter;
 			d_args.crc                = &crc;
 
 			nbytes += vidtv_psi_desc_write_into(&d_args);
@@ -1380,12 +1386,9 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 		service = service->next;
 	}
 
-	c_args.dest_buf           = args.buf;
-	c_args.dest_offset        = args.offset + nbytes;
+	c_args.dest_offset        = args->offset + nbytes;
 	c_args.crc                = cpu_to_be32(crc);
-	c_args.pid                = sdt_pid;
-	c_args.continuity_counter = args.continuity_counter;
-	c_args.dest_buf_sz        = args.buf_sz;
+	c_args.continuity_counter = args->continuity_counter;
 
 	/* Write the CRC at the end */
 	nbytes += table_section_crc32_write_into(&c_args);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index b72635bcdae7..5065ddb805b1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -588,7 +588,7 @@ struct vidtv_psi_sdt_write_args {
  * equal to the size of the SDT, since more space is needed for TS headers during TS
  * encapsulation.
  */
-u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args);
+u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args *args);
 
 /**
  * struct vidtv_psi_pmt_write_args - Arguments for writing a PMT section
-- 
2.28.0

