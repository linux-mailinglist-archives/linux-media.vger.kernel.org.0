Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2514189581
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 07:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgCRGAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 02:00:41 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:41088 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgCRGAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 02:00:40 -0400
Received: by mail-qt1-f171.google.com with SMTP id i26so9962122qtq.8
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 23:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=teCjaxHebKUGTB2q8WbeNaw4FzolfzhMmcyhrBxugks=;
        b=isrNhXZZkRDxT8TMgeuWboDtMgv0f/+aYAHdiG99cFFubDDdcTFGLOuAo1H/9y3bqF
         c4+aKZkl76sH2DDKBx5Z6/jh6fafrLk9lSTqOjBvhri69e4rbCpAQnyZIY4wigamYHAl
         E3QBy6Y26tOfrpzkBe0iguBzUeJ2nr/RYj343h13IEOd2sNuM6zNnQsinV/zCY7er8wy
         K8vFOWwArj2JgDe9xqxv78MRtRQhT5WvC98XjiY02pj+PgmnwP7A2ycPmj/gex6Qu3lm
         XNt51H2SGWmJ1HF44OFfB2akGvF3ZK9v1vQpXnn/i35pERORPWE1bNSWIIiWdl2RR2f2
         qPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=teCjaxHebKUGTB2q8WbeNaw4FzolfzhMmcyhrBxugks=;
        b=J+uHg3YzKERFMTenm/AK8GpUq4DDtRXsQu5k0xWdVOHPkCCXEWwjpJTzydrCcjerRB
         7HF2vgSfWVdVK9XqCjPjSqLqbK9heqgLLFII6eXWEXN2mqNyOHH610XBjHLflDOOHNHh
         xo0PD+cP4iSDbiCJ6uu9LmodU3D1v9AIJi/bZAsEH90LznRcm3aFqYHfT5XqTtoAV8T5
         qPrSvk1Vzy1dGK/+zThdTCNVxp1x2NuhXEwL4U58Pp2CPZvhFOuHpV9ON4ydBLlm1/18
         MJm+H9viP4kYXQ+PfwBpo8Ok1tvb0yJgAQ5kClgTlbnKWpFsLNdgEzNYtBZwAZP2myxb
         DOzA==
X-Gm-Message-State: ANhLgQ0CQKyD7U6ACG1ULJh6A7zgyeKkFXYgnYBHJE5bhqIsylFBDYAw
        fN6Vhqewsg0/PQ0xUL4ss/g=
X-Google-Smtp-Source: ADFU+vspMpZfksLCCZDlt4ZmmYfMfWeU+hf7biVx+r1E3nBWJhE+1kqMKBi2oAw2zGUfrnpfIY2RuA==
X-Received: by 2002:ac8:3072:: with SMTP id g47mr2844228qte.278.1584511237565;
        Tue, 17 Mar 2020 23:00:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id c10sm223303qtp.13.2020.03.17.23.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 23:00:37 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC 3/3] media: dvb_dummy_fe.c: write PSI information into DMX buffer
Date:   Wed, 18 Mar 2020 03:00:18 -0300
Message-Id: <20200318060018.3437750-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
References: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Periodically feed the demux with PSI packets. This is needed so userspace
apps can retrieve information about the Transport Stream and eventually
tune into a (dummy) channel.

Currently this commit adds support for working with 3 PSI tables:
PAT, PMT and SDT. A dummy service with a dummy program is hardcoded
in the driver code.
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 1409 +++++++++++++++++++-
 1 file changed, 1398 insertions(+), 11 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 726c964a523d..10b1bd22c15d 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -11,11 +11,1408 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/random.h>
+#include <linux/crc32.h>
+#include <linux/string.h>
 
 #include <media/dvb_frontend.h>
-#include "dvb_dummy_fe.h"
 
 
+#define CRC_SIZE_IN_BYTES 32
+#define NUM_CHANNELS 1
+#define TRANSPORT_STREAM_ID 0x744 /* a single stream */
+#define TS_SYNC_BYTE 0x47
+#define TS_PACKET_LEN 188
+#define TS_PAYLOAD_LEN 184
+#define DMX_BUF_LEN (20 * TS_PACKET_LEN)
+
+
+enum dvb_dummy_descriptors {
+	SERVICE_DESCRIPTOR = 0x48,
+};
+
+enum dvb_dummy_stream_types {
+	ISO_IEC_13818_3_Audio = 0x4,
+};
+
+struct dvb_dummy_channel {
+	u16 transport_stream_id;
+	struct dvb_dummy_table_sdt_service *service;
+	u16 program_num;
+	/* a single program with one or more streams associated with it */
+	struct dvb_dummy_table_pat_program *program;
+	struct dvb_dummy_table_pmt_stream *streams;
+};
+
+struct dvb_dummy_desc {
+	u8 type;
+	u8 length;
+	struct dvb_dummy_desc *next;
+	u8 *data;
+} __packed;
+
+struct dvb_dummy_desc_service {
+	u8 type;
+	u8 length;
+	struct dvb_desc *next;
+
+	u8 service_type;
+	char *name;
+	char *name_emph;
+	char *provider;
+	char *provider_emph;
+} __packed;
+
+struct dvb_dummy_table_header {
+	u8  table_id;
+	union {
+		u16 bitfield;
+		struct {
+			u16 section_length:12;
+			u8  one:2;
+			u8  zero:1;
+			u8  syntax:1;
+		} __packed;
+	} __packed;
+	u16 id;			/* TS ID */
+	u8  current_next:1;
+	u8  version:5;
+	u8  one2:2;
+
+	u8  section_id;		/* section_number */
+	u8  last_section;		/* last_section_number */
+} __packed;
+
+struct dvb_dummy_table_pat_program {
+	u16 service_id;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pid:13;
+			u8  reserved:3;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_table_pat_program *next;
+} __packed;
+
+struct dvb_dummy_table_pat {
+	struct dvb_dummy_table_header header;
+	u16 programs;
+	struct dvb_dummy_table_pat_program *program;
+} __packed;
+
+struct dvb_dummy_table_sdt_service {
+	u16 service_id;
+	u8 EIT_present_following:1;
+	u8 EIT_schedule:1;
+	u8 reserved:6;
+	union {
+		u16 bitfield;
+		struct {
+			u16 desc_length:12;
+			u16 free_CA_mode:1;
+			u16 running_status:3;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_desc *descriptor;
+	struct dvb_dummy_table_sdt_service *next;
+} __packed;
+
+struct dvb_dummy_table_sdt {
+	struct dvb_dummy_table_header header;
+	u16 network_id;
+	u8  reserved;
+	struct dvb_dummy_table_sdt_service *service;
+} __packed;
+
+enum service_running_status {
+	RUNNING,
+};
+
+enum service_type {
+	/* see ETSI EN 300 468 v1.15.1 p. 77 */
+	DIGITAL_TELEVISION_SERVICE = 0x1,
+};
+
+struct dvb_dummy_table_pmt_stream {
+	u8 type;
+	union {
+		u16 bitfield;
+		struct {
+			u16 elementary_pid:13;
+			u16 reserved:3;
+		} __packed;
+	} __packed;
+	union {
+		u16 bitfield2;
+		struct {
+			u16 desc_length:10;
+			u16 zero:2;
+			u16 reserved2:4;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_desc *descriptor;
+	struct dvb_dummy_table_pmt_stream *next;
+} __packed;
+
+struct dvb_dummy_table_pmt {
+	struct dvb_dummy_table_header header;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pcr_pid:13;
+			u16 reserved2:3;
+		} __packed;
+	} __packed;
+
+	union {
+		u16 bitfield2;
+		struct {
+			u16 desc_length:10;
+			u16 zero3:2;
+			u16 reserved3:4;
+		} __packed;
+	} __packed;
+	struct dvb_dummy_desc *descriptor;
+	struct dvb_dummy_table_pmt_stream *stream;
+} __packed;
+
+struct dvb_dummy_mpeg_ts_adaption {
+	u8 length;
+	struct {
+		u8 extension:1;
+		u8 private_data:1;
+		u8 splicing_point:1;
+		u8 OPCR:1;
+		u8 PCR:1;
+		u8 priority:1;
+		u8 random_access:1;
+		u8 discontinued:1;
+	} __packed;
+	u8 data[];
+} __packed;
+
+
+struct dvb_dummy_mpeg_ts {
+	u8 sync_byte;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pid:13;
+			u16 priority:1;
+			u16 payload_start:1;
+			u16 tei:1;
+		} __packed;
+	} __packed;
+	struct {
+		u8 continuity_counter:4;
+		u8 payload:1;
+		u8 adaptation_field:1;
+		u8 scrambling:2;
+	} __packed;
+	struct dvb_dummy_mpeg_ts_adaption adaption[];
+} __packed;
+
+struct dvb_dummy_fe_config {
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_probability_on_low_snr;
+};
+
+struct dvb_dummy_fe_state {
+	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
+	struct dvb_dummy_channel *channels;
+};
+
+static u32 dvb_dummy_fe_mpeg_ts_psi_write_stuffing(void *to, u32 len)
+{
+	memset(to, 0xFF, len);
+	return len;
+}
+
+static u32 dvb_dummy_fe_mpeg_ts_psi_write_into(void *to,
+					    const void *from,
+					    size_t len,
+					    u32 offset,
+					    u16 pid,
+					    bool new_psi_section,
+					    u8 *continuity_counter,
+					    bool is_crc)
+{
+	/*   Packetize PSI sections into TS packets:
+	 * - push a TS header (4bytes) every 184 bytes
+	 * - manage the continuity_counter
+	 * - add stuffing after the CRC
+	 */
+
+	u32 nbytes_past_boundary = (offset % TS_PACKET_LEN);
+	bool aligned = nbytes_past_boundary == 0;
+	bool split = len > TS_PAYLOAD_LEN;
+	u32 payload_write_len = (split) ? TS_PAYLOAD_LEN : len;
+
+	struct dvb_dummy_mpeg_ts ts_header = {0};
+
+	u32 nbytes = 0; /* number of bytes written by this function */
+
+	if (new_psi_section && !aligned) {
+		/* must pad the buffer with the complement to get a
+		 * multiple of 188
+		 */
+		nbytes +=
+			dvb_dummy_fe_mpeg_ts_psi_write_stuffing(
+						to + offset + nbytes,
+						TS_PACKET_LEN -
+						nbytes_past_boundary);
+
+		/* if we were not at a packet boundary, we are now after
+		 * stuffing the buffer with 0xFF
+		 */
+		aligned = true;
+	}
+
+	if (aligned) {
+		/* if at a packet boundary, write a new TS header */
+		ts_header.sync_byte = TS_SYNC_BYTE;
+		ts_header.tei = 0;
+		ts_header.payload_start = 1;
+		ts_header.pid = pid;
+		ts_header.priority = 0;
+		ts_header.scrambling = 0; /* not scrambled */
+		ts_header.continuity_counter = *continuity_counter;
+		ts_header.payload_start = 0; /* no adaption for now */
+
+
+		/* copy the header minus the adaption pointer*/
+		memcpy(to + offset + nbytes,
+		&ts_header,
+		sizeof(ts_header) -
+		sizeof(struct dvb_dummy_mpeg_ts_adaption *));
+
+		nbytes +=
+		sizeof(ts_header) -
+		sizeof(struct dvb_dummy_mpeg_ts_adaption *);
+	}
+
+	if (new_psi_section) {
+		/* write the pointer_field in the first byte of the payload */
+		memset(to + offset + nbytes, 0x0, 1);
+		nbytes += 1;
+		--payload_write_len; /* one byte was used by the pointer field*/
+	}
+
+	/* write as much of the payload as we possibly can */
+	memcpy(to + offset + nbytes, from, payload_write_len);
+	nbytes += payload_write_len;
+
+	if (split) {
+		/* next TS packet keeps the same PID, but increments the
+		 * counter
+		 */
+		++(*continuity_counter);
+		/* 'nbytes' written from a total of 'len' requested*/
+		len -= nbytes;
+		/* recursively write the rest of the data until we do not
+		 * need to split it anymore
+		 */
+		nbytes +=
+		dvb_dummy_fe_mpeg_ts_psi_write_into(to,
+						    from + nbytes,
+						    len,
+						    offset + nbytes,
+						    pid,
+						    false,
+						    continuity_counter,
+						    is_crc);
+	}
+
+	if (is_crc)
+		/* as the CRC is last in the section, stuff the rest of the
+		 * packet if there is any remaining space in there
+		 */
+
+		nbytes +=
+		dvb_dummy_fe_mpeg_ts_psi_write_stuffing(to + nbytes,
+							TS_PAYLOAD_LEN -
+							nbytes);
+
+	return nbytes;
+}
+
+static u32 table_section_crc32_write_into(char *buf,
+					  u32 offset,
+					  u16 pid,
+					  u8 *continuity_counter)
+{
+	/* the CRC is the last entry in the section */
+	u32 nbytes = 0;
+	u32 crc;
+
+	crc = crc32(0, buf, offset);
+
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+					    &crc,
+					    CRC_SIZE_IN_BYTES,
+					    offset,
+					    pid,
+					    false,
+					    continuity_counter,
+					    true);
+
+
+	return nbytes;
+}
+
+static struct dvb_dummy_desc*
+dvb_dummy_fe_mpeg_descriptor_init(struct dvb_dummy_desc *head,
+				  u8 type,
+				  u8 length)
+{
+	struct dvb_dummy_desc *desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+
+	desc->type = type;
+	desc->length = length;
+	desc->data = kzalloc(length, GFP_KERNEL);
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = desc;
+	}
+
+	return desc;
+}
+
+static void
+dvb_dummy_fe_mpeg_descriptor_destroy(struct dvb_dummy_desc *desc)
+{
+
+	struct dvb_dummy_desc *curr = desc;
+	struct dvb_dummy_desc *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp->data);
+		kfree(tmp);
+	}
+
+}
+
+static u32
+dvb_dummy_fe_mpeg_descriptor_compute_length(struct dvb_dummy_desc *desc)
+{
+	u32 length = 0;
+
+	if (!desc)
+		return 0;
+
+	while (desc) {
+		length += desc->length;
+		desc = desc->next;
+	}
+
+	return length;
+}
+
+static void
+dvb_dummy_fe_mpeg_descriptor_assign(struct dvb_dummy_desc *desc,
+				    struct dvb_dummy_desc *desc_ptr,
+				    u16 *desc_length)
+{
+
+	if (desc_ptr)
+		/* clean the old data */
+		dvb_dummy_fe_mpeg_descriptor_destroy(desc_ptr);
+
+	*desc_length = dvb_dummy_fe_mpeg_descriptor_compute_length(desc);
+	desc_ptr = desc;
+}
+
+static u32 dvb_dummy_fe_mpeg_desc_write_into(char *buf,
+					     u32 offset,
+					     struct dvb_dummy_desc *desc,
+					     u16 pid,
+					     u8 *continuity_counter)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+
+	/* u8 type + u8 length */
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+					    desc,
+					    16,
+					    offset,
+					    pid,
+					    false,
+					    continuity_counter,
+					    false);
+
+	/* move 'from' pointer to point to u8 data[] */
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+				desc + nbytes + sizeof(struct dvb_dummy_desc *),
+				desc->length,
+				offset + nbytes,
+				pid,
+				false,
+				continuity_counter,
+				false);
+
+	return nbytes;
+}
+
+static u32
+dvb_dummy_fe_mpeg_table_header_write_into(char *buf,
+					  u32 offset,
+					  struct dvb_dummy_table_header *h,
+					  u16 pid,
+					  u8 *continuity_counter)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+					h,
+					sizeof(struct dvb_dummy_table_header),
+					offset,
+					pid,
+					true,
+					continuity_counter,
+					false);
+
+	return nbytes;
+}
+
+static u16
+dvb_dummy_fe_mpeg_pat_table_compute_section_length
+(struct dvb_dummy_table_pat *pat)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.43 */
+	u16 length = 0;
+	u32 i;
+
+	length += 40;
+
+	for (i = 0; i < pat->programs; ++i)
+		length += 32;
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > 1021);
+	return length;
+}
+
+static u16
+dvb_dummy_fe_mpeg_pmt_table_compute_section_length
+(struct dvb_dummy_table_pmt *pmt)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.46 */
+	u16 length = 0;
+	struct dvb_dummy_table_pmt_stream *s = pmt->stream;
+
+	length += 72;
+	length += /* do not fail if 'desc_length' has not been computed yet */
+		dvb_dummy_fe_mpeg_descriptor_compute_length(pmt->descriptor);
+	length += pmt->desc_length;
+
+	while (s) {
+		length += 40;
+		length +=
+			dvb_dummy_fe_mpeg_descriptor_compute_length
+			(s->descriptor);
+		s = s->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > 1021);
+	return length;
+}
+
+static u16
+dvb_dummy_fe_mpeg_sdt_table_compute_section_length
+(struct dvb_dummy_table_sdt *sdt)
+{
+	/* see ETSI EN 300 468 V 1.10.1 p.24 */
+	u16 length = 0;
+	struct dvb_dummy_table_sdt_service *s = sdt->service;
+
+	length += 64;
+	while (s) {
+		length += 40;
+		length +=
+		/* do not fail if 'desc_length' has not been computed yet */
+			dvb_dummy_fe_mpeg_descriptor_compute_length
+			(s->descriptor);
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > 1021);
+	return length;
+}
+
+static struct dvb_dummy_table_pat_program*
+dvb_dummy_fe_mpeg_pat_program_init(struct dvb_dummy_table_pat_program *head,
+				   u16 service_id,
+				   u16 pid)
+{
+
+	struct dvb_dummy_table_pat_program *program;
+
+	program = kzalloc(sizeof(struct dvb_dummy_table_pat_program),
+			  GFP_KERNEL);
+
+	program->service_id = service_id;
+	program->pid = pid; /* pid for the PMT section in the TS */
+	program->next = NULL;
+	program->reserved = 0x7;
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = program;
+	}
+
+	return program;
+}
+
+static void
+dvb_dummy_fe_mpeg_pat_program_destroy(struct dvb_dummy_table_pat_program *p)
+{
+	struct dvb_dummy_table_pat_program *curr = p;
+	struct dvb_dummy_table_pat_program *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+static void
+dvb_dummy_fe_mpeg_pat_program_assign(struct dvb_dummy_table_pat *pat,
+				     struct dvb_dummy_table_pat_program *p)
+{
+	u16 program_count = 0;
+	struct dvb_dummy_table_pat_program *program = p;
+
+	if (pat->program)
+		dvb_dummy_fe_mpeg_pat_program_destroy(pat->program);
+
+	while (program) {
+		++program_count;
+		program = program->next;
+	}
+
+	pat->programs = program_count;
+
+	/* Recompute section length */
+	pat->header.section_length =
+		dvb_dummy_fe_mpeg_pat_table_compute_section_length(pat);
+
+	pat->program = p;
+}
+
+static struct dvb_dummy_table_pat_program*
+dvb_dummy_fe_mpeg_pat_program_concat_into_new
+(struct dvb_dummy_channel *channels)
+{
+	u32 i;
+	struct dvb_dummy_table_pat_program *curr = NULL;
+	struct dvb_dummy_table_pat_program *head = NULL;
+	struct dvb_dummy_table_pat_program *tail = NULL;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = channels[i].program;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = dvb_dummy_fe_mpeg_pat_program_init
+			       (tail, curr->service_id, curr->pid);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+	}
+
+	return head;
+}
+
+
+static void dvb_dummy_fe_mpeg_pat_table_init(struct dvb_dummy_table_pat *pat,
+					     bool update_version_num,
+					     u16 transport_stream_id)
+{
+	static u8 pat_version;
+
+	pat->header.table_id = 0x0;
+	pat->header.syntax = 0x1;
+	pat->header.zero = 0x0;
+	pat->header.one = 0x03;
+
+	pat->header.id = transport_stream_id; /* transport stream ID, at will */
+	pat->header.current_next = 0x1;
+
+	if (update_version_num)
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+		++pat_version;
+
+	pat->header.version = pat_version;
+
+	pat->header.one2 = 0x03;
+	pat->header.section_id = 0x0;
+	pat->header.last_section = 0x0;
+
+	pat->programs = 0;
+
+	pat->header.section_length =
+		dvb_dummy_fe_mpeg_pat_table_compute_section_length(pat);
+
+}
+
+static u32 dvb_dummy_fe_mpeg_pat_write_into(char *buf,
+					    u32 offset,
+					    struct dvb_dummy_table_pat *pat)
+{
+
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	u8 continuity_counter = 0;
+	const u16 pat_pid = pat->header.table_id; /* always 0x0 */
+
+	struct dvb_dummy_table_pat_program *p = pat->program;
+
+	nbytes +=
+	dvb_dummy_fe_mpeg_table_header_write_into(buf,
+						  offset,
+						  &pat->header,
+						  pat_pid,
+						  &continuity_counter);
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+				pat + sizeof(struct dvb_dummy_table_header),
+				sizeof(pat->programs),
+				offset + nbytes,
+				pat_pid,
+				false,
+				&continuity_counter,
+				false);
+
+
+	while (p) {
+		/* skip the pointer */
+		nbytes +=
+			dvb_dummy_fe_mpeg_ts_psi_write_into
+				(buf,
+				 p,
+				 sizeof(*p) -
+				 sizeof(struct dvb_dummy_table_pat_program *),
+				 offset + nbytes,
+				 pat_pid,
+				 false,
+				 &continuity_counter,
+				 false);
+
+		p = p->next;
+	}
+
+	nbytes += table_section_crc32_write_into(buf,
+						 offset + nbytes,
+						 pat_pid,
+						 &continuity_counter);
+	return nbytes;
+}
+
+static void
+dvb_dummy_fe_mpeg_pat_table_destroy(struct dvb_dummy_table_pat *p)
+{
+	dvb_dummy_fe_mpeg_pat_program_destroy(p->program);
+}
+
+static struct dvb_dummy_table_pmt_stream*
+dvb_dummy_fe_mpeg_pmt_stream_init(struct dvb_dummy_table_pmt_stream *head,
+				  enum dvb_dummy_stream_types stream_type,
+				  u16 es_pid)
+{
+
+	struct dvb_dummy_table_pmt_stream *stream =
+		kzalloc(sizeof(struct dvb_dummy_table_pmt_stream),
+			GFP_KERNEL);
+
+	stream->type = stream_type;
+	stream->elementary_pid = es_pid;
+	stream->reserved = 0x07;
+
+	stream->desc_length =
+		dvb_dummy_fe_mpeg_descriptor_compute_length(stream->descriptor);
+
+	stream->zero = 0x0;
+	stream->reserved2 = 0x0F;
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = stream;
+	}
+
+	return stream;
+}
+
+static void
+dvb_dummy_fe_mpeg_pmt_stream_destroy(struct dvb_dummy_table_pmt_stream *s)
+{
+	struct dvb_dummy_table_pmt_stream *curr_stream = s;
+	struct dvb_dummy_table_pmt_stream *tmp_stream = NULL;
+
+	while (curr_stream) {
+		tmp_stream = curr_stream;
+		curr_stream = curr_stream->next;
+		kfree(tmp_stream);
+	}
+}
+
+static void
+dvb_dummy_fe_mpeg_pmt_stream_assign(struct dvb_dummy_table_pmt *pmt,
+				    struct dvb_dummy_table_pmt_stream *s)
+{
+	u16 stream_count = 0;
+	u16 table_descriptor_count = 0;
+	struct dvb_dummy_table_pmt_stream *stream = s;
+	struct dvb_dummy_desc *desc = s->descriptor;
+
+	if (pmt->stream)
+		dvb_dummy_fe_mpeg_pmt_stream_destroy(pmt->stream);
+
+	while (stream) {
+		++stream_count;
+		stream = stream->next;
+	}
+
+	while (desc) {
+		++table_descriptor_count;
+		desc = desc->next;
+	}
+
+	/* Recompute section length */
+	pmt->header.section_length =
+		dvb_dummy_fe_mpeg_pmt_table_compute_section_length(pmt);
+
+	pmt->stream = s;
+}
+
+static void
+dvb_dummy_fe_mpeg_pmt_stream_match_with_sections
+(struct dvb_dummy_channel *channels,
+struct dvb_dummy_table_pmt *sections, u32 nsections)
+{
+	struct dvb_dummy_table_pmt *curr_section = NULL;
+	u32 i, j;
+	bool match;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+
+		for (j = 0; j < nsections; ++j) {
+			curr_section = &sections[j];
+
+			if (!curr_section)
+				continue;
+
+			match = curr_section->header.id ==
+					channels[i].program_num;
+
+			if (match) {
+				dvb_dummy_fe_mpeg_pmt_stream_assign
+				(curr_section, channels[i].streams);
+				break;
+			}
+		}
+	}
+}
+
+static u16
+dvb_dummy_fe_mpeg_pmt_get_pid(struct dvb_dummy_table_pmt *section,
+			      struct dvb_dummy_table_pat *pat)
+{
+	struct dvb_dummy_table_pat_program *program = pat->program;
+
+	while (program)
+		/* service_id is the same as program_number in the
+		 * corresponding program_map_section
+		 *  see ETSI EN 300 468 v1.15.1 p. 24
+		 */
+		if (program->service_id == section->header.id)
+			return pat->program->pid;
+
+	return -1;
+}
+
+static void
+dvb_dummy_fe_mpeg_pmt_table_init(struct dvb_dummy_table_pmt *pmt,
+				 bool update_version_num,
+				 u16 program_number,
+				 u16 pcr_pid)
+{
+	static u8 pmt_version;
+
+	pmt->header.table_id = 0x2;
+	pmt->header.syntax = 0x1;
+	pmt->header.zero = 0x0;
+	pmt->header.one = 0x3;
+
+	pmt->header.id = program_number;
+	pmt->header.current_next = 0x1;
+
+	if (update_version_num)
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+		++pmt_version;
+
+	pmt->header.version = pmt_version;
+
+	pmt->header.one2 = 0x3;
+	pmt->header.section_id = 0;
+	pmt->header.last_section = 0;
+
+	pmt->pcr_pid = (pcr_pid) ? pcr_pid : 0x1FFF;
+	pmt->reserved2 = 0x03;
+
+	pmt->reserved3 = 0x0F;
+	pmt->zero3 = 0x0;
+
+	pmt->desc_length =
+		dvb_dummy_fe_mpeg_descriptor_compute_length(pmt->descriptor);
+
+	pmt->header.section_length =
+		dvb_dummy_fe_mpeg_pmt_table_compute_section_length(pmt);
+
+}
+
+static u32 dvb_dummy_fe_mpeg_pmt_write_into(char *buf,
+					    u32 offset,
+					    struct dvb_dummy_table_pmt *pmt,
+					    u16 pid)
+{
+	u32 nbytes = 0; /* the number of bytes written */
+	u8 continuity_counter = 0;
+	struct dvb_dummy_desc *table_descriptor = pmt->descriptor;
+	struct dvb_dummy_table_pmt_stream *stream = pmt->stream;
+	struct dvb_dummy_desc *stream_descriptor = (stream) ?
+						    pmt->stream->descriptor :
+						    NULL;
+
+	nbytes +=
+	dvb_dummy_fe_mpeg_table_header_write_into(buf,
+						  offset,
+						  &pmt->header,
+						  pid,
+						  &continuity_counter);
+
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+				pmt + sizeof(struct dvb_dummy_table_header *),
+				32,
+				offset + nbytes,
+				pid,
+				false,
+				&continuity_counter,
+				false);
+
+
+	while (table_descriptor) {
+		nbytes +=
+			dvb_dummy_fe_mpeg_desc_write_into(buf,
+							  offset + nbytes,
+							  table_descriptor,
+							  pid,
+							  &continuity_counter);
+
+		table_descriptor = table_descriptor->next;
+	}
+
+	while (stream) {
+		/* u8 type + (2* u16) bitfields */
+		nbytes +=
+		dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+						    stream,
+						    40,
+						    offset + nbytes,
+						    pid,
+						    false,
+						    &continuity_counter,
+						    false);
+
+		while (stream_descriptor) {
+			nbytes +=
+				dvb_dummy_fe_mpeg_desc_write_into(buf,
+							offset + nbytes,
+							stream_descriptor,
+							pid,
+							&continuity_counter);
+
+			stream_descriptor = stream_descriptor->next;
+		}
+
+		stream = stream->next;
+	}
+
+	nbytes += table_section_crc32_write_into(buf,
+						 offset + nbytes,
+						 pid,
+						 &continuity_counter);
+	return nbytes;
+}
+
+static void
+dvb_dummy_fe_mpeg_pmt_table_destroy(struct dvb_dummy_table_pmt *pmt)
+{
+
+	struct dvb_dummy_desc *curr_desc = pmt->descriptor;
+	struct dvb_dummy_desc *tmp_desc = NULL;
+
+	while (curr_desc) {
+		tmp_desc = curr_desc;
+		curr_desc = curr_desc->next;
+		dvb_dummy_fe_mpeg_descriptor_destroy(tmp_desc);
+		kfree(tmp_desc);
+	}
+
+	dvb_dummy_fe_mpeg_pmt_stream_destroy(pmt->stream);
+}
+
+static void
+dvb_dummy_fe_mpeg_sdt_table_init(struct dvb_dummy_table_sdt *sdt,
+				 bool update_version_num,
+				 u16 transport_stream_id)
+{
+	static u8 sdt_version;
+
+	sdt->header.table_id = 0x42;
+
+	sdt->header.one = 0x3;
+	sdt->header.zero = 0x1;
+ /* The PAT, PMT, and CAT all set this to 0. Other tables set this to 1. */
+	sdt->header.syntax = 0x1;
+
+	/* This is a 16-bit field which serves as a label for identification
+	 * of the TS, about which the SDT informs, from any other multiplex
+	 * within the delivery system.
+	 */
+	sdt->header.id = transport_stream_id;
+	sdt->header.current_next = 0x1;
+
+	if (update_version_num)
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+		++sdt_version;
+
+	sdt->header.version = sdt_version;
+
+	sdt->header.one2 = 0x3;
+	sdt->header.section_id = 0;
+	sdt->header.last_section = 0;
+
+	sdt->network_id = transport_stream_id;
+	sdt->reserved = 0xFF;
+
+	sdt->header.section_length =
+		dvb_dummy_fe_mpeg_sdt_table_compute_section_length(sdt);
+}
+
+static u32 dvb_dummy_fe_mpeg_sdt_write_into(char *buf,
+					    u32 offset,
+					    struct dvb_dummy_table_sdt *sdt)
+{
+	u32 nbytes = 0; /* the number of bytes written */
+
+
+	u16 sdt_pid = 0x11; /* see ETSI EN 300 468 v1.15.1 p. 11 */
+	u8 continuity_counter = 0;
+
+	struct dvb_dummy_table_sdt_service *service = sdt->service;
+	struct dvb_dummy_desc *service_desc = (sdt->service) ?
+					       sdt->service->descriptor :
+					       NULL;
+
+
+	nbytes +=
+	dvb_dummy_fe_mpeg_table_header_write_into(buf,
+						  offset,
+						  &sdt->header,
+						  sdt_pid,
+						  &continuity_counter);
+	/* copy u16 network_id + u8 reserved)*/
+	nbytes +=
+	dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+				sdt + sizeof(struct dvb_dummy_table_header),
+				16,
+				offset + nbytes,
+				sdt_pid,
+				false,
+				&continuity_counter,
+				false);
+
+
+	while (service) {
+		/* u16 service_id + u8 + u16 bitfield */
+		nbytes +=
+		dvb_dummy_fe_mpeg_ts_psi_write_into(buf,
+						    service,
+						    40,
+						    offset + nbytes,
+						    sdt_pid,
+						    false,
+						    &continuity_counter,
+						    false);
+
+		while (service_desc) {
+			nbytes +=
+				dvb_dummy_fe_mpeg_desc_write_into(buf,
+							  offset + nbytes,
+							  service_desc,
+							  sdt_pid,
+							  &continuity_counter);
+			service_desc = service_desc->next;
+		}
+
+		service = service->next;
+	}
+
+	nbytes += table_section_crc32_write_into(buf,
+						 offset + nbytes,
+						 sdt_pid,
+						 &continuity_counter);
+	return nbytes;
+}
+
+static void
+dvb_dummy_fe_mpeg_sdt_table_destroy(struct dvb_dummy_table_sdt *sdt)
+{
+	struct dvb_dummy_table_sdt_service *curr_service = sdt->service;
+	struct dvb_dummy_table_sdt_service *tmp_service = NULL;
+	struct dvb_dummy_desc *curr_desc = (sdt->service) ?
+					   sdt->service->descriptor : NULL;
+	struct dvb_dummy_desc *tmp_desc = NULL;
+
+	while (curr_service) {
+		curr_desc = curr_service->descriptor;
+
+		while (curr_desc) {
+			/* clear all descriptors for the service */
+			tmp_desc = curr_desc;
+			curr_desc = curr_desc->next;
+			dvb_dummy_fe_mpeg_descriptor_destroy(tmp_desc);
+			kfree(tmp_desc);
+		}
+
+		/* then clear the current service */
+		tmp_service = curr_service;
+		curr_service = curr_service->next;
+		kfree(tmp_service);
+	}
+}
+
+static struct dvb_dummy_table_sdt_service*
+dvb_dummy_fe_mpeg_sdt_service_init(struct dvb_dummy_table_sdt_service *head,
+				   u16 service_id)
+{
+	struct dvb_dummy_table_sdt_service *service;
+
+	service = kzalloc(sizeof(struct dvb_dummy_table_sdt_service),
+			  GFP_KERNEL);
+
+
+	/* ETSI 300 468: this is a 16bit field which serves as a label to
+	 * identify this service from any other service within the TS.
+	 * The service id is the same as the program number in the
+	 * corresponding program_map_section
+	 */
+	service->service_id = service_id;
+	service->EIT_schedule = 0x0; /* TODO */
+	service->EIT_present_following = 0x0; /* TODO */
+	service->reserved = 0x3F; /* all bits on */
+	service->free_CA_mode = 0x0; /* not scrambled */
+	service->running_status = RUNNING;
+
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = service;
+	}
+
+	return service;
+
+}
+
+static void
+dvb_dummy_fe_mpeg_sdt_service_destroy
+(struct dvb_dummy_table_sdt_service *service)
+{
+
+	struct dvb_dummy_table_sdt_service *curr = service;
+	struct dvb_dummy_table_sdt_service *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+static void
+dvb_dummy_fe_mpeg_sdt_service_assign
+(struct dvb_dummy_table_sdt *sdt,
+struct dvb_dummy_table_sdt_service *service)
+{
+	if (sdt->service)
+		/* clean up old services */
+		dvb_dummy_fe_mpeg_sdt_service_destroy(sdt->service);
+
+	sdt->service = service;
+
+	sdt->header.section_length =
+		dvb_dummy_fe_mpeg_sdt_table_compute_section_length(sdt);
+}
+
+static struct dvb_dummy_table_sdt_service*
+dvb_dummy_fe_mpeg_sdt_service_concat_into_new
+(struct dvb_dummy_channel *channels)
+{
+	u32 i = 0;
+	struct dvb_dummy_table_sdt_service *curr = NULL;
+	struct dvb_dummy_table_sdt_service *head = NULL;
+	struct dvb_dummy_table_sdt_service *tail = NULL;
+
+	for (; i < NUM_CHANNELS; ++i) {
+		curr = channels[i].service;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = dvb_dummy_fe_mpeg_sdt_service_init(tail,
+				channels[i].service->service_id);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+	}
+
+	return head;
+}
+
+static void dvb_dummy_fe_init_channels(struct dvb_dummy_channel *channels)
+{
+
+	const u16 pcm_audio_channel_service_id = 0x880;
+	const u16 pcm_audio_channel_program_num = 0x880;
+	const u16 pcm_audio_channel_program_pid = 0x101; /* packet id for PMT*/
+	const u16 pcm_audio_channel_audio_stream_id = 0x111;
+
+	struct dvb_dummy_channel pcm_audio_channel;
+	struct dvb_dummy_table_sdt_service *pcm_audio_channel_service;
+	struct dvb_dummy_desc_service *pcm_audio_channel_service_descriptor;
+	u16 desc_length;
+
+	channels = kcalloc(NUM_CHANNELS,
+			   sizeof(struct dvb_dummy_channel),
+			   GFP_KERNEL);
+
+
+	pcm_audio_channel_service =
+		dvb_dummy_fe_mpeg_sdt_service_init
+			(NULL, pcm_audio_channel_service_id);
+
+	pcm_audio_channel_service_descriptor =
+		(struct dvb_dummy_desc_service *)
+		dvb_dummy_fe_mpeg_descriptor_init(NULL,
+					SERVICE_DESCRIPTOR,
+					sizeof(struct dvb_dummy_desc_service));
+
+	pcm_audio_channel_service_descriptor->name = "Sine Wave PCM Audio";
+	pcm_audio_channel_service_descriptor->service_type
+		= DIGITAL_TELEVISION_SERVICE;
+	pcm_audio_channel_service_descriptor->length = 8 /* u8 service_type */
+		+ strlen(pcm_audio_channel_service_descriptor->name)
+		+ strlen(pcm_audio_channel_service_descriptor->name_emph)
+		+ strlen(pcm_audio_channel_service_descriptor->provider)
+		+ strlen(pcm_audio_channel_service_descriptor->provider_emph);
+
+	dvb_dummy_fe_mpeg_descriptor_assign(
+					(struct dvb_dummy_desc *)
+					pcm_audio_channel_service_descriptor,
+					(struct dvb_dummy_desc *)
+					pcm_audio_channel_service->descriptor,
+					&desc_length);
+
+	pcm_audio_channel_service->desc_length = desc_length;
+
+	pcm_audio_channel.transport_stream_id = TRANSPORT_STREAM_ID;
+
+	pcm_audio_channel.program =
+		dvb_dummy_fe_mpeg_pat_program_init(NULL,
+					pcm_audio_channel_service_id,
+					pcm_audio_channel_program_pid);
+
+	pcm_audio_channel.program_num = pcm_audio_channel_program_num;
+	pcm_audio_channel.streams =
+		dvb_dummy_fe_mpeg_pmt_stream_init(NULL,
+					ISO_IEC_13818_3_Audio,
+					pcm_audio_channel_audio_stream_id);
+
+	memcpy(channels, &pcm_audio_channel, sizeof(struct dvb_dummy_channel));
+}
+
+static void dvb_dummy_fe_channels_destroy(struct dvb_dummy_channel *channels)
+{
+	u32 i;
+	struct dvb_dummy_channel *curr;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = &channels[i];
+		dvb_dummy_fe_mpeg_sdt_service_destroy(curr->service);
+		dvb_dummy_fe_mpeg_pat_program_destroy(curr->program);
+		dvb_dummy_fe_mpeg_pmt_stream_destroy(curr->streams);
+		kfree(curr);
+	}
+}
+
+static void
+dvb_dummy_fe_mpeg_pmt_create_section_for_each_pat_entry
+(struct dvb_dummy_table_pat *pat, struct dvb_dummy_table_pmt *sections)
+{
+	/* PMTs contain information about programs. For each program,
+	 * there is one PMT
+	 */
+
+	struct dvb_dummy_table_pat_program *program = pat->program;
+	u32 i = 0;
+
+	while (program) {
+		dvb_dummy_fe_mpeg_pmt_table_init(&sections[i],
+						 false,
+						 sections[i].header.id,
+						 0);
+
+		++i;
+		program = program->next;
+	}
+}
+
+static void dvb_dummy_fe_thread_mpeg_ts_tick(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+	const unsigned int SLEEP_MSECS = 10;
+	u32 ticks = 0;
+	u32 i;
+	char *buf = kzalloc(DMX_BUF_LEN, GFP_KERNEL);
+	u32 buffer_offset;
+
+	struct dvb_dummy_table_pat pat = {0};
+	struct dvb_dummy_table_sdt sdt = {0};
+
+	struct dvb_dummy_table_pmt *pmt_sections;
+
+	struct dvb_dummy_table_pat_program *programs = NULL;
+	struct dvb_dummy_table_sdt_service *services = NULL;
+
+	bool update_version_num = false;
+	u16 pmt_pid;
+
+	dvb_dummy_fe_init_channels(state->channels);
+
+	programs =
+		dvb_dummy_fe_mpeg_pat_program_concat_into_new(state->channels);
+	services =
+		dvb_dummy_fe_mpeg_sdt_service_concat_into_new(state->channels);
+
+	/* assemble all programs and assign to PAT */
+	dvb_dummy_fe_mpeg_pat_program_assign(&pat, programs);
+
+	/* assemble all services and assign to SDT */
+	dvb_dummy_fe_mpeg_sdt_service_assign(&sdt, services);
+
+	/* a section for each program_id */
+	pmt_sections = kcalloc(pat.programs,
+			       sizeof(struct dvb_dummy_table_pmt),
+			       GFP_KERNEL);
+
+	dvb_dummy_fe_mpeg_pmt_create_section_for_each_pat_entry(&pat,
+								pmt_sections);
+
+	dvb_dummy_fe_mpeg_pmt_stream_match_with_sections(state->channels,
+							 pmt_sections,
+							 pat.programs);
+
+	dvb_dummy_fe_mpeg_pat_table_init(&pat,
+					 update_version_num,
+					 TRANSPORT_STREAM_ID);
+	dvb_dummy_fe_mpeg_sdt_table_init(&sdt,
+				    update_version_num,
+				    TRANSPORT_STREAM_ID);
+	while (true) {
+
+		memset(buf, 0, DMX_BUF_LEN);
+		buffer_offset = 0;
+
+		if (!ticks || (ticks % 50) == 0) {
+			/* push PSI packets into the buffer */
+
+			buffer_offset +=
+				dvb_dummy_fe_mpeg_pat_write_into(buf,
+								 buffer_offset,
+								 &pat);
+			for (i = 0; i < pat.programs; ++i) {
+
+				pmt_pid =
+				dvb_dummy_fe_mpeg_pmt_get_pid(&pmt_sections[i],
+							      &pat);
+
+				WARN_ON(pmt_pid < 0); /* not found */
+
+				buffer_offset +=
+					/* write each section into buffer */
+					dvb_dummy_fe_mpeg_pmt_write_into(buf,
+							buffer_offset,
+							&pmt_sections[i],
+							pmt_pid);
+			}
+
+			buffer_offset +=
+				dvb_dummy_fe_mpeg_sdt_write_into(buf,
+								 buffer_offset,
+								 &sdt);
+
+
+			WARN_ON(buffer_offset > DMX_BUF_LEN); /* overflow */
+			msleep_interruptible(SLEEP_MSECS);
+		}
+	}
+
+	dvb_dummy_fe_mpeg_pat_table_destroy(&pat);
+	dvb_dummy_fe_mpeg_sdt_table_destroy(&sdt);
+
+	for (i = 0; i < pat.programs; ++i) {
+		/* destroy all PMT sections */
+		dvb_dummy_fe_mpeg_pmt_table_destroy(&pmt_sections[i]);
+		kfree(&pmt_sections[i]);
+	}
+
+	dvb_dummy_fe_channels_destroy(state->channels);
+	kfree(buf);
+}
+
 struct dvb_dummy_fe_cnr_to_qual_s {
 	/* attempt to use the same values as libdvbv5 */
 	u32 modulation;
@@ -75,17 +1472,7 @@ static struct dvb_dummy_fe_cnr_to_qual_s dvb_t_cnr_2_qual[] = {
 	{ QAM_64, FEC_7_8, 22.0, 24.0},
 };
 
-struct dvb_dummy_fe_config {
-	/* probability of losing the lock due to low snr */
-	u8 drop_tslock_probability_on_low_snr;
-};
 
-struct dvb_dummy_fe_state {
-	struct dvb_frontend frontend;
-	struct dvb_dummy_fe_config config;
-	struct delayed_work poll_snr;
-	enum fe_status status;
-};
 
 void poll_snr_handler(struct work_struct *work)
 {
-- 
2.25.1

