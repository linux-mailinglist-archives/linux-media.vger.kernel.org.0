Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB582C23B7
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732676AbgKXLHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:33790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731805AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27F4D2168B;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=R7psA8I1w0DRaZ6AZosSdABuf7nVS5xifafO8eF4Gxk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WWgiR4pUDpYjKrwMCiLmVxxbzW+LD/D7GVXl/z14PLYgHBSJnWO9CknFhmRcCGf4G
         ejipTkIvJbjDy5stZSI7+/qdNpK5rOw5YgcYhem1o9qvCeIIigpWdkHI+Rj5OENJ26
         rrUG/tqBxp5GYyvs2ZBKz0lAL3wMPyfKExZIec74=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaJ-67; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 22/31] media: vidtv: cleanup PSI descriptor write function
Date:   Tue, 24 Nov 2020 12:06:18 +0100
Message-Id: <9e0d29e2b7dbc232ae5176a43dae9ef40932b994.1606215584.git.mchehab+huawei@kernel.org>
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

This function initializes the psi_args twice, and receives
a struct, instead of a pointer to a struct.

Clean it up.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 104 +++++++++----------
 1 file changed, 51 insertions(+), 53 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 423b4fa2e473..754c32353ac2 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -634,69 +634,67 @@ void vidtv_sdt_desc_assign(struct vidtv_psi_table_sdt *sdt,
 	vidtv_psi_update_version_num(&sdt->header);
 }
 
-static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
+static u32 vidtv_psi_desc_write_into(struct desc_write_args *args)
 {
+	struct psi_write_args psi_args = {
+		.dest_buf           = args->dest_buf,
+		.from               = &args->desc->type,
+		.pid                = args->pid,
+		.new_psi_section    = false,
+		.continuity_counter = args->continuity_counter,
+		.is_crc             = false,
+		.dest_buf_sz        = args->dest_buf_sz,
+		.crc                = args->crc,
+		.len 		    = sizeof_field(struct vidtv_psi_desc, type) +
+				      sizeof_field(struct vidtv_psi_desc, length),
+	};
 	struct vidtv_psi_desc_service_list_entry *serv_list_entry = NULL;
-	struct psi_write_args psi_args = {};
-	/* the number of bytes written by this function */
 	u32 nbytes = 0;
 
-	psi_args.dest_buf = args.dest_buf;
-	psi_args.from     = &args.desc->type;
-
-	psi_args.len = sizeof_field(struct vidtv_psi_desc, type) +
-		       sizeof_field(struct vidtv_psi_desc, length);
-
-	psi_args.dest_offset        = args.dest_offset + nbytes;
-	psi_args.pid                = args.pid;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = false;
-	psi_args.dest_buf_sz        = args.dest_buf_sz;
-	psi_args.crc                = args.crc;
+	psi_args.dest_offset        = args->dest_offset + nbytes;
 
 	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-	switch (args.desc->type) {
+	switch (args->desc->type) {
 	case SERVICE_DESCRIPTOR:
-		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.dest_offset = args->dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_service, service_type) +
 			       sizeof_field(struct vidtv_psi_desc_service, provider_name_len);
-		psi_args.from = &((struct vidtv_psi_desc_service *)args.desc)->service_type;
+		psi_args.from = &((struct vidtv_psi_desc_service *)args->desc)->service_type;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
-		psi_args.len = ((struct vidtv_psi_desc_service *)args.desc)->provider_name_len;
-		psi_args.from = ((struct vidtv_psi_desc_service *)args.desc)->provider_name;
+		psi_args.dest_offset = args->dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_service *)args->desc)->provider_name_len;
+		psi_args.from = ((struct vidtv_psi_desc_service *)args->desc)->provider_name;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.dest_offset = args->dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_service, service_name_len);
-		psi_args.from = &((struct vidtv_psi_desc_service *)args.desc)->service_name_len;
+		psi_args.from = &((struct vidtv_psi_desc_service *)args->desc)->service_name_len;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
-		psi_args.len = ((struct vidtv_psi_desc_service *)args.desc)->service_name_len;
-		psi_args.from = ((struct vidtv_psi_desc_service *)args.desc)->service_name;
+		psi_args.dest_offset = args->dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_service *)args->desc)->service_name_len;
+		psi_args.from = ((struct vidtv_psi_desc_service *)args->desc)->service_name;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 		break;
 
 	case NETWORK_NAME_DESCRIPTOR:
-		psi_args.dest_offset = args.dest_offset + nbytes;
-		psi_args.len = args.desc->length;
-		psi_args.from = ((struct vidtv_psi_desc_network_name *)args.desc)->network_name;
+		psi_args.dest_offset = args->dest_offset + nbytes;
+		psi_args.len = args->desc->length;
+		psi_args.from = ((struct vidtv_psi_desc_network_name *)args->desc)->network_name;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 		break;
 
 	case SERVICE_LIST_DESCRIPTOR:
-		serv_list_entry = ((struct vidtv_psi_desc_service_list *)args.desc)->service_list;
+		serv_list_entry = ((struct vidtv_psi_desc_service_list *)args->desc)->service_list;
 		while (serv_list_entry) {
-			psi_args.dest_offset = args.dest_offset + nbytes;
+			psi_args.dest_offset = args->dest_offset + nbytes;
 			psi_args.len = sizeof(struct vidtv_psi_desc_service_list_entry) -
 				       sizeof(struct vidtv_psi_desc_service_list_entry *);
 			psi_args.from = serv_list_entry;
@@ -708,35 +706,35 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 		break;
 
 	case SHORT_EVENT_DESCRIPTOR:
-		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.dest_offset = args->dest_offset + nbytes;
 		psi_args.len = ISO_LANGUAGE_CODE_LEN;
 		psi_args.from = ((struct vidtv_psi_desc_short_event *)
-				  args.desc)->iso_language_code;
+				  args->desc)->iso_language_code;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.dest_offset = args->dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_short_event, event_name_len);
 		psi_args.from = &((struct vidtv_psi_desc_short_event *)
-				  args.desc)->event_name_len;
+				  args->desc)->event_name_len;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
-		psi_args.len = ((struct vidtv_psi_desc_short_event *)args.desc)->event_name_len;
-		psi_args.from = ((struct vidtv_psi_desc_short_event *)args.desc)->event_name;
+		psi_args.dest_offset = args->dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_short_event *)args->desc)->event_name_len;
+		psi_args.from = ((struct vidtv_psi_desc_short_event *)args->desc)->event_name;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
+		psi_args.dest_offset = args->dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_short_event, text_len);
-		psi_args.from = &((struct vidtv_psi_desc_short_event *)args.desc)->text_len;
+		psi_args.from = &((struct vidtv_psi_desc_short_event *)args->desc)->text_len;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
-		psi_args.dest_offset = args.dest_offset + nbytes;
-		psi_args.len = ((struct vidtv_psi_desc_short_event *)args.desc)->text_len;
-		psi_args.from = ((struct vidtv_psi_desc_short_event *)args.desc)->text;
+		psi_args.dest_offset = args->dest_offset + nbytes;
+		psi_args.len = ((struct vidtv_psi_desc_short_event *)args->desc)->text_len;
+		psi_args.from = ((struct vidtv_psi_desc_short_event *)args->desc)->text;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
@@ -744,9 +742,9 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 
 	case REGISTRATION_DESCRIPTOR:
 	default:
-		psi_args.dest_offset = args.dest_offset + nbytes;
-		psi_args.len = args.desc->length;
-		psi_args.from = &args.desc->data;
+		psi_args.dest_offset = args->dest_offset + nbytes;
+		psi_args.len = args->desc->length;
+		psi_args.from = &args->desc->data;
 
 		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 		break;
@@ -1212,7 +1210,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 		d_args.dest_buf_sz        = args.buf_sz;
 		d_args.crc                = &crc;
 
-		nbytes += vidtv_psi_desc_write_into(d_args);
+		nbytes += vidtv_psi_desc_write_into(&d_args);
 
 		table_descriptor = table_descriptor->next;
 	}
@@ -1239,7 +1237,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 			d_args.dest_buf_sz        = args.buf_sz;
 			d_args.crc                = &crc;
 
-			nbytes += vidtv_psi_desc_write_into(d_args);
+			nbytes += vidtv_psi_desc_write_into(&d_args);
 
 			stream_descriptor = stream_descriptor->next;
 		}
@@ -1378,7 +1376,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 			d_args.dest_buf_sz        = args.buf_sz;
 			d_args.crc                = &crc;
 
-			nbytes += vidtv_psi_desc_write_into(d_args);
+			nbytes += vidtv_psi_desc_write_into(&d_args);
 
 			service_desc = service_desc->next;
 		}
@@ -1699,7 +1697,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 		d_args.dest_buf_sz        = args.buf_sz;
 		d_args.crc                = &crc;
 
-		nbytes += vidtv_psi_desc_write_into(d_args);
+		nbytes += vidtv_psi_desc_write_into(&d_args);
 
 		table_descriptor = table_descriptor->next;
 	}
@@ -1735,7 +1733,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 			d_args.dest_buf_sz        = args.buf_sz;
 			d_args.crc                = &crc;
 
-			nbytes += vidtv_psi_desc_write_into(d_args);
+			nbytes += vidtv_psi_desc_write_into(&d_args);
 
 			transport_descriptor = transport_descriptor->next;
 		}
@@ -1925,7 +1923,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 			d_args.dest_buf_sz        = args.buf_sz;
 			d_args.crc                = &crc;
 
-			nbytes += vidtv_psi_desc_write_into(d_args);
+			nbytes += vidtv_psi_desc_write_into(&d_args);
 
 			event_descriptor = event_descriptor->next;
 		}
-- 
2.28.0

