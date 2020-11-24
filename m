Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDD42C23A3
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732593AbgKXLGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:33820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732506AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2472C2158C;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=FsnHhUeH7Dg4dJaNDX9Y+iZXIBPzxEeXZ7JZS+myAYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2J+wGY6aO8iqOEmrsr2m4WzEDiLCHfInGU4agKQ4zGxPR9HqUsapuyZPLxAyOe+fA
         Pfy2GCMDczH8ElwD5A9g3ILzBs2dsAYAkKRRdMqz5Ymu71bjKdCEBvXyo1UMm3m1NV
         MKD9y+6p9VVySy73/sOzKUGaQwSgk9ZWypxiFERA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaE-3y; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 20/31] media: vidtv: simplify PSI write function
Date:   Tue, 24 Nov 2020 12:06:16 +0100
Message-Id: <35a8bc0c01e9165f661881195366248206c39a18.1606215584.git.mchehab+huawei@kernel.org>
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

The function vidtv_psi_ts_psi_write_into() initializes the
ts_header fields several times, and receives a struct
as argument, instead of using a pointer to struct.

Cleanup the function, in order to reduce its stack usage
and to avoid initializing the ts_header multiple times.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 128 +++++++++----------
 1 file changed, 62 insertions(+), 66 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 92fdf1149f0d..36f1c56d9e24 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -162,79 +162,75 @@ static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
  * manage the continuity_counter
  * add stuffing (i.e. padding bytes) after the CRC
  */
-static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args args)
+static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *args)
 {
-
-	u32 nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
+	struct vidtv_mpeg_ts ts_header = {
+		.sync_byte = TS_SYNC_BYTE,
+		.bitfield = cpu_to_be16((args->new_psi_section << 14) | args->pid),
+		.scrambling = 0,
+		.payload = 1,
+		.adaptation_field = 0, /* no adaptation field */
+	};
+	u32 nbytes_past_boundary = (args->dest_offset % TS_PACKET_LEN);
 	bool aligned = (nbytes_past_boundary == 0);
-	struct vidtv_mpeg_ts ts_header = {};
-	u32 remaining_len = args.len;
+	u32 remaining_len = args->len;
 	u32 payload_write_len = 0;
 	u32 payload_offset = 0;
 	u32 nbytes = 0;
 
-	const u16 PAYLOAD_START = args.new_psi_section;
-
-	if (!args.crc && !args.is_crc)
+	if (!args->crc && !args->is_crc)
 		pr_warn_ratelimited("Missing CRC for chunk\n");
 
-	if (args.crc)
-		*args.crc = dvb_crc32(*args.crc, args.from, args.len);
+	if (args->crc)
+		*args->crc = dvb_crc32(*args->crc, args->from, args->len);
 
-	if (args.new_psi_section && !aligned) {
+	if (args->new_psi_section && !aligned) {
 		pr_warn_ratelimited("Cannot write a new PSI section in a misaligned buffer\n");
 
 		/* forcibly align and hope for the best */
-		nbytes += vidtv_memset(args.dest_buf,
-				       args.dest_offset + nbytes,
-				       args.dest_buf_sz,
+		nbytes += vidtv_memset(args->dest_buf,
+				       args->dest_offset + nbytes,
+				       args->dest_buf_sz,
 				       TS_FILL_BYTE,
 				       TS_PACKET_LEN - nbytes_past_boundary);
 	}
 
 	while (remaining_len) {
-		nbytes_past_boundary = (args.dest_offset + nbytes) % TS_PACKET_LEN;
+		nbytes_past_boundary = (args->dest_offset + nbytes) % TS_PACKET_LEN;
 		aligned = (nbytes_past_boundary == 0);
 
 		if (aligned) {
 			/* if at a packet boundary, write a new TS header */
-			ts_header.sync_byte = TS_SYNC_BYTE;
-			ts_header.bitfield = cpu_to_be16((PAYLOAD_START << 14) | args.pid);
-			ts_header.scrambling = 0;
-			ts_header.continuity_counter = *args.continuity_counter;
-			ts_header.payload = 1;
-			/* no adaptation field */
-			ts_header.adaptation_field = 0;
+			ts_header.continuity_counter = *args->continuity_counter;
 
-			/* copy the header */
-			nbytes += vidtv_memcpy(args.dest_buf,
-					       args.dest_offset + nbytes,
-					       args.dest_buf_sz,
+			nbytes += vidtv_memcpy(args->dest_buf,
+					       args->dest_offset + nbytes,
+					       args->dest_buf_sz,
 					       &ts_header,
 					       sizeof(ts_header));
 			/*
 			 * This will trigger a discontinuity if the buffer is full,
 			 * effectively dropping the packet.
 			 */
-			vidtv_ts_inc_cc(args.continuity_counter);
+			vidtv_ts_inc_cc(args->continuity_counter);
 		}
 
 		/* write the pointer_field in the first byte of the payload */
-		if (args.new_psi_section)
-			nbytes += vidtv_memset(args.dest_buf,
-					       args.dest_offset + nbytes,
-					       args.dest_buf_sz,
+		if (args->new_psi_section)
+			nbytes += vidtv_memset(args->dest_buf,
+					       args->dest_offset + nbytes,
+					       args->dest_buf_sz,
 					       0x0,
 					       1);
 
 		/* write as much of the payload as possible */
-		nbytes_past_boundary = (args.dest_offset + nbytes) % TS_PACKET_LEN;
+		nbytes_past_boundary = (args->dest_offset + nbytes) % TS_PACKET_LEN;
 		payload_write_len = min(TS_PACKET_LEN - nbytes_past_boundary, remaining_len);
 
-		nbytes += vidtv_memcpy(args.dest_buf,
-				       args.dest_offset + nbytes,
-				       args.dest_buf_sz,
-				       args.from + payload_offset,
+		nbytes += vidtv_memcpy(args->dest_buf,
+				       args->dest_offset + nbytes,
+				       args->dest_buf_sz,
+				       args->from + payload_offset,
 				       payload_write_len);
 
 		/* 'payload_write_len' written from a total of 'len' requested*/
@@ -246,12 +242,12 @@ static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args args)
 	 * fill the rest of the packet if there is any remaining space unused
 	 */
 
-	nbytes_past_boundary = (args.dest_offset + nbytes) % TS_PACKET_LEN;
+	nbytes_past_boundary = (args->dest_offset + nbytes) % TS_PACKET_LEN;
 
-	if (args.is_crc)
-		nbytes += vidtv_memset(args.dest_buf,
-				       args.dest_offset + nbytes,
-				       args.dest_buf_sz,
+	if (args->is_crc)
+		nbytes += vidtv_memset(args->dest_buf,
+				       args->dest_offset + nbytes,
+				       args->dest_buf_sz,
 				       TS_FILL_BYTE,
 				       TS_PACKET_LEN - nbytes_past_boundary);
 
@@ -275,7 +271,7 @@ static u32 table_section_crc32_write_into(struct crc32_write_args args)
 	psi_args.is_crc             = true;
 	psi_args.dest_buf_sz        = args.dest_buf_sz;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	return nbytes;
 }
@@ -662,7 +658,7 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 	psi_args.dest_buf_sz        = args.dest_buf_sz;
 	psi_args.crc                = args.crc;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	switch (args.desc->type) {
 	case SERVICE_DESCRIPTOR:
@@ -671,25 +667,25 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 			       sizeof_field(struct vidtv_psi_desc_service, provider_name_len);
 		psi_args.from = &((struct vidtv_psi_desc_service *)args.desc)->service_type;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = ((struct vidtv_psi_desc_service *)args.desc)->provider_name_len;
 		psi_args.from = ((struct vidtv_psi_desc_service *)args.desc)->provider_name;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_service, service_name_len);
 		psi_args.from = &((struct vidtv_psi_desc_service *)args.desc)->service_name_len;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = ((struct vidtv_psi_desc_service *)args.desc)->service_name_len;
 		psi_args.from = ((struct vidtv_psi_desc_service *)args.desc)->service_name;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 		break;
 
 	case NETWORK_NAME_DESCRIPTOR:
@@ -697,7 +693,7 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 		psi_args.len = args.desc->length;
 		psi_args.from = ((struct vidtv_psi_desc_network_name *)args.desc)->network_name;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 		break;
 
 	case SERVICE_LIST_DESCRIPTOR:
@@ -708,7 +704,7 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 				       sizeof(struct vidtv_psi_desc_service_list_entry *);
 			psi_args.from = serv_list_entry;
 
-			nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+			nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 			serv_list_entry = serv_list_entry->next;
 		}
@@ -720,32 +716,32 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 		psi_args.from = ((struct vidtv_psi_desc_short_event *)
 				  args.desc)->iso_language_code;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_short_event, event_name_len);
 		psi_args.from = &((struct vidtv_psi_desc_short_event *)
 				  args.desc)->event_name_len;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = ((struct vidtv_psi_desc_short_event *)args.desc)->event_name_len;
 		psi_args.from = ((struct vidtv_psi_desc_short_event *)args.desc)->event_name;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = sizeof_field(struct vidtv_psi_desc_short_event, text_len);
 		psi_args.from = &((struct vidtv_psi_desc_short_event *)args.desc)->text_len;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		psi_args.dest_offset = args.dest_offset + nbytes;
 		psi_args.len = ((struct vidtv_psi_desc_short_event *)args.desc)->text_len;
 		psi_args.from = ((struct vidtv_psi_desc_short_event *)args.desc)->text;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		break;
 
@@ -755,7 +751,7 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
 		psi_args.len = args.desc->length;
 		psi_args.from = &args.desc->data;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 		break;
 	}
 
@@ -780,7 +776,7 @@ vidtv_psi_table_header_write_into(struct header_write_args args)
 	psi_args.dest_buf_sz        = args.dest_buf_sz;
 	psi_args.crc                = args.crc;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	return nbytes;
 }
@@ -1014,7 +1010,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 			   sizeof(struct vidtv_psi_table_pat_program *);
 		psi_args.dest_offset = args.offset + nbytes;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		p = p->next;
 	}
@@ -1207,7 +1203,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 	psi_args.dest_buf_sz        = args.buf_sz;
 	psi_args.crc                = &crc;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (table_descriptor) {
 		/* write the descriptors, if any */
@@ -1232,7 +1228,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 				sizeof_field(struct vidtv_psi_table_pmt_stream, bitfield2);
 		psi_args.dest_offset = args.offset + nbytes;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		stream_descriptor = stream->descriptor;
 
@@ -1360,7 +1356,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	psi_args.crc                = &crc;
 
 	/* copy u16 network_id + u8 reserved)*/
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (service) {
 		/* copy the services, if any */
@@ -1371,7 +1367,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 			       sizeof(struct vidtv_psi_table_sdt_service *);
 		psi_args.dest_offset = args.offset + nbytes;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		service_desc = service->descriptor;
 
@@ -1694,7 +1690,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 	psi_args.dest_buf_sz        = args.buf_sz;
 	psi_args.crc                = &crc;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (table_descriptor) {
 		/* write the descriptors, if any */
@@ -1718,7 +1714,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 	psi_args.dest_offset = args.offset + nbytes;
 	psi_args.pid = VIDTV_NIT_PID;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (transport) {
 		/* write the transport sections, if any */
@@ -1728,7 +1724,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 				sizeof_field(struct vidtv_psi_table_transport, bitfield);
 		psi_args.dest_offset = args.offset + nbytes;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		transport_descriptor = transport->descriptor;
 
@@ -1907,7 +1903,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 	psi_args.dest_buf_sz        = args.buf_sz;
 	psi_args.crc                = &crc;
 
-	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 	while (event) {
 		/* copy the events, if any */
@@ -1918,7 +1914,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 			       sizeof(struct vidtv_psi_table_eit_event *);
 		psi_args.dest_offset = args.offset + nbytes;
 
-		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+		nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
 
 		event_descriptor = event->descriptor;
 
-- 
2.28.0

