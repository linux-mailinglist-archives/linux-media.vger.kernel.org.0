Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C231B1A019C
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgDFXV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:21:26 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46377 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgDFXVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:21:25 -0400
Received: by mail-qk1-f194.google.com with SMTP id u4so18140535qkj.13;
        Mon, 06 Apr 2020 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zzy0jUAN6C0zTtF/FNa2E2Oxqy5UozoTv/zAp7PZcIQ=;
        b=XGbiOEfJL6pGapcLc5L9/FeYZBi0NixGDzc424P2toevx3seiigVTVktJs4QWubHZP
         kJg1QDWLNE4wlBoWo6xYvEJfg/oQFv9w8g56HJeitLtkQr65ncXCI1M9XDljfH9q0FS0
         JgaWMg4Hltse/gjOyY5437JBLbOK62F+bFsl2aT6/Y/+VVSljXkumnVvIF1h0JScodxI
         71vrVqHd7r5Yrzc70cD7EArkHysQNxtDgbih7dCfFl5RF+Ly+obHCJWr/pOStnNS93DU
         lqsGFjnKDaoxEvsIOg74dgSUz6YC/0ISApbiBPbNx7vD2DhJkRCELGYZcRs1a6lccOhR
         urPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zzy0jUAN6C0zTtF/FNa2E2Oxqy5UozoTv/zAp7PZcIQ=;
        b=KDvOAkd6yGCyA0gtle4xxi9DrE2zezYfmAa0dvLdwjRVhna40fvizTsRJFxGYuAvUQ
         3Gr1H49P52LNwuF81SdSPgbRd2VMUN9vo6Yqhciir3jk0K7SGNL9tCDXC6lVQZb7mg7G
         5vlD16u4WBOIg8c4Sw9uHDPIVtGWg7+yzxsC1rLtSrVjvzvM3gra22gud67U1C5AXcto
         w2XteopHQJSDF/5KXwiK8b6MHdznYvMwr/nJv1bjcF5FgGnbOQIK2a68p7Fze0ie/ajx
         u/LdUnUYnmFnIwtk882PNyzANZR8xBE4IJmkBCvoe9CZCr9uT7qPjrG4UqCw2h3Q/A73
         4prQ==
X-Gm-Message-State: AGi0PuYq4Wa8mAsHZsJemUovkfR6m3sS9+PHHlf1r9llGgX85+QGaJyE
        wyy3UoHIyF+SZXk6b9fIZ8U=
X-Google-Smtp-Source: APiQypKtVFd9J70zZECiq8yIsZQ3b70yB+cb3CTbb4jkA2+o1kPkdd+irnhf2dtJCT+awq5cBy7ijg==
X-Received: by 2002:a37:a84f:: with SMTP id r76mr8764345qke.370.1586215282864;
        Mon, 06 Apr 2020 16:21:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:21:21 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v3 4/6] media: vidtv: implement a PSI generator
Date:   Mon,  6 Apr 2020 20:20:53 -0300
Message-Id: <20200406232055.1023946-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

PSI packets contain general information about a MPEG Transport Stream.
A PSI generator is needed so userspace apps can retrieve information
about the Transport Stream and eventually tune into a (dummy) channel.

Because the generator is implemented in a separate file, it can be
reused elsewhere in the media subsystem.

Currently this commit adds support for working with 3 PSI tables:
PAT, PMT and SDT.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test_drivers/vidtv/Makefile     |   4 +-
 .../media/test_drivers/vidtv/vidtv_common.c   |  44 +
 .../media/test_drivers/vidtv/vidtv_common.h   |  71 ++
 drivers/media/test_drivers/vidtv/vidtv_psi.c  | 960 ++++++++++++++++++
 drivers/media/test_drivers/vidtv/vidtv_psi.h  | 294 ++++++
 5 files changed, 1372 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_psi.h

diff --git a/drivers/media/test_drivers/vidtv/Makefile b/drivers/media/test_drivers/vidtv/Makefile
index 36ba00ddc0d1e..690420a7c904b 100644
--- a/drivers/media/test_drivers/vidtv/Makefile
+++ b/drivers/media/test_drivers/vidtv/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o  vidtv_demod.o
+vidtv_demod-objs := vidtv_common.o vidtv_psi.o
+
+obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o
diff --git a/drivers/media/test_drivers/vidtv/vidtv_common.c b/drivers/media/test_drivers/vidtv/vidtv_common.c
new file mode 100644
index 0000000000000..62713284e14d9
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_common.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+
+u32 vidtv_memcpy(void *to,
+		 const void *from,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz)
+{
+	if (buf_sz && offset + len > buf_sz) {
+		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
+		       __func__);
+		return 0;
+	}
+
+	memcpy(to, from, len);
+	return len;
+}
+
+u32 vidtv_memset(void *to,
+		 int c,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz)
+{
+	if (buf_sz && offset + len > buf_sz) {
+		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
+		       __func__);
+		return 0;
+	}
+
+	memset(to, c, len);
+	return len;
+}
diff --git a/drivers/media/test_drivers/vidtv/vidtv_common.h b/drivers/media/test_drivers/vidtv/vidtv_common.h
new file mode 100644
index 0000000000000..43269833ee866
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_common.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_COMMON_H
+#define VIDTV_COMMON_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+#define CRC_SIZE_IN_BYTES 32
+#define TS_SYNC_BYTE 0x47
+#define TS_PACKET_LEN 188
+#define TS_PAYLOAD_LEN 184
+#define LAST_VALID_TS_PID 8191
+
+/* to be used by both PSI and ES */
+struct vidtv_mpeg_ts_adaption {
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
+/* to be used by both PSI and ES */
+struct vidtv_mpeg_ts {
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
+	struct vidtv_mpeg_ts_adaption adaption[];
+} __packed;
+
+u32 vidtv_memcpy(void *to,
+		 const void *from,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz);
+
+u32 vidtv_memset(void *to,
+		 int c,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz);
+
+#endif // VIDTV_COMMON_H
diff --git a/drivers/media/test_drivers/vidtv/vidtv_psi.c b/drivers/media/test_drivers/vidtv/vidtv_psi.c
new file mode 100644
index 0000000000000..70fc6289407a0
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_psi.c
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+
+#include "vidtv_common.h"
+#include "vidtv_psi.h"
+
+static u32 vidtv_psi_ts_psi_write_stuffing(void *to,
+					   u32 len,
+					   u32 offset,
+					   u32 buf_sz)
+{
+	return vidtv_memset(to, 0xff, len, offset, buf_sz);
+}
+
+static u32
+vidtv_psi_ts_psi_write_into(struct psi_write_args args)
+{
+	/*
+	 * Packetize PSI sections into TS packets:
+	 *  push a TS header (4bytes) every 184 bytes
+	 *  manage the continuity_counter
+	 *  add stuffing after the CRC
+	 */
+
+	u32 nbytes_past_boundary = (args.offset % TS_PACKET_LEN);
+	bool aligned = nbytes_past_boundary == 0;
+	bool split = args.len > TS_PAYLOAD_LEN;
+	u32 payload_write_len = (split) ? TS_PAYLOAD_LEN : args.len;
+
+	struct psi_write_args new_args = {0};
+	struct vidtv_mpeg_ts ts_header = {0};
+
+	u32 nbytes = 0; /* number of bytes written by this function */
+	u32 temp;
+
+	if (args.new_psi_section && !aligned) {
+		/*
+		 * must pad the buffer with the complement to get a
+		 * multiple of 188
+		 */
+		nbytes += vidtv_psi_ts_psi_write_stuffing(args.to +
+							 args.offset +
+							 nbytes,
+							 TS_PACKET_LEN -
+							 nbytes_past_boundary,
+							 args.offset + nbytes,
+							 args.buf_sz);
+
+		/*
+		 * if we were not at a packet boundary, we are now after
+		 * stuffing the buffer with 0xff
+		 */
+		aligned = true;
+	}
+
+	if (aligned) {
+		/* if at a packet boundary, write a new TS header */
+		ts_header.sync_byte = TS_SYNC_BYTE;
+		ts_header.tei = 0;
+		ts_header.payload_start = 1;
+		ts_header.pid = args.pid;
+		ts_header.priority = 0;
+		ts_header.scrambling = 0; /* not scrambled */
+		ts_header.continuity_counter = *args.continuity_counter;
+		ts_header.payload_start = 0; /* no adaption for now */
+
+		/* copy the header minus the adaption pointer*/
+		nbytes += vidtv_memcpy(args.to + args.offset + nbytes,
+				       &ts_header,
+				       sizeof(ts_header),
+				       args.offset + nbytes,
+				       args.buf_sz);
+	}
+
+	if (args.new_psi_section) {
+		/* write the pointer_field in the first byte of the payload */
+		temp = vidtv_memset(args.to + args.offset + nbytes,
+				    0x0,
+				    1,
+				    args.offset + nbytes,
+				    args.buf_sz);
+		/* one byte was used by the pointer field*/
+		nbytes += temp;
+		payload_write_len -= temp;
+	}
+
+	/* write as much of the payload as we possibly can */
+	nbytes += vidtv_memcpy(args.to + args.offset + nbytes,
+			       args.from,
+			       payload_write_len,
+			       args.offset + nbytes,
+			       args.buf_sz);
+
+	if (split) {
+		/*
+		 * next TS packet keeps the same PID, but increments the
+		 * counter
+		 */
+		++(*args.continuity_counter);
+		/* 'nbytes' written from a total of 'len' requested*/
+		args.len -= nbytes;
+		/*
+		 * recursively write the rest of the data until we do not
+		 * need to split it anymore
+		 */
+		memcpy(&new_args, &args, sizeof(struct psi_write_args));
+		new_args.from = args.from + nbytes;
+		new_args.offset = args.offset + nbytes;
+		new_args.new_psi_section = false;
+
+		nbytes += vidtv_psi_ts_psi_write_into(new_args);
+	}
+
+	/*
+	 * as the CRC is last in the section, stuff the rest of the
+	 * packet if there is any remaining space in there
+	 */
+	if (args.is_crc)
+		nbytes += vidtv_psi_ts_psi_write_stuffing(args.to + nbytes,
+							 TS_PAYLOAD_LEN -
+							 nbytes,
+							 args.offset + nbytes,
+							 args.buf_sz);
+
+	return nbytes;
+}
+
+static u32 table_section_crc32_write_into(struct crc32_write_args args)
+{
+	/* the CRC is the last entry in the section */
+	u32 nbytes = 0;
+	u32 crc;
+	struct psi_write_args psi_args = {0};
+
+	crc = crc32(0, args.to, args.offset);
+
+	psi_args.to = args.to;
+	psi_args.from = &crc;
+	psi_args.len = CRC_SIZE_IN_BYTES;
+	psi_args.offset = args.offset;
+	psi_args.pid = args.pid;
+	psi_args.new_psi_section = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc = true;
+	psi_args.buf_sz = args.buf_sz;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+struct vidtv_psi_desc *vidtv_psi_desc_init(struct vidtv_psi_desc *head,
+					   u8 type,
+					   u8 length)
+{
+	struct vidtv_psi_desc *desc;
+
+	/* alloc enough memory for the flexible array too */
+	desc = kzalloc(sizeof(*desc) + length, GFP_KERNEL);
+
+	desc->type = type;
+	desc->length = length;
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
+void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
+{
+	struct vidtv_psi_desc *curr = desc;
+	struct vidtv_psi_desc *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+static u32
+vidtv_psi_desc_comp_len(struct vidtv_psi_desc *desc)
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
+void vidtv_psi_desc_assign(struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc,
+			   u16 *desc_length)
+{
+	/*
+	 * This function transfers ownedship of desc.
+	 * Start by cleaning the old data
+	 */
+	if (*to)
+		vidtv_psi_desc_destroy(*to);
+
+	*desc_length = vidtv_psi_desc_comp_len(desc);
+	*to = desc; /* reassign pointer */
+}
+
+static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	struct psi_write_args psi_args = {0};
+
+	psi_args.to = args.to;
+	psi_args.from = args.desc;
+	psi_args.len = sizeof_field(struct vidtv_psi_desc, type) +
+		       sizeof_field(struct vidtv_psi_desc, length);
+	psi_args.offset = args.offset;
+	psi_args.pid = args.pid;
+	psi_args.new_psi_section = false;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc = false;
+	psi_args.buf_sz = args.buf_sz;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	/* move 'from' pointer to point to u8 data[] */
+	psi_args.from = args.desc + nbytes + sizeof(struct vidtv_psi_desc *);
+	psi_args.len = args.desc->length;
+	psi_args.offset = args.offset + nbytes;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+static u32
+vidtv_psi_table_header_write_into(struct header_write_args args)
+{
+	/* the number of bytes written by this function */
+	u32 nbytes = 0;
+	struct psi_write_args psi_args = {0};
+
+	psi_args.to = args.to;
+	psi_args.from = args.h;
+	psi_args.len = sizeof(struct vidtv_psi_table_header);
+	psi_args.offset = args.offset;
+	psi_args.pid = args.pid;
+	psi_args.new_psi_section = true;
+	psi_args.continuity_counter = args.continuity_counter;
+	psi_args.is_crc = false;
+	psi_args.buf_sz = args.buf_sz;
+
+	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
+
+	return nbytes;
+}
+
+static u16
+vidtv_psi_pat_table_comp_sec_len(struct vidtv_psi_table_pat *pat)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.43 */
+	u16 length = 0;
+	u32 i;
+
+	/* from immediately after 'section_length' until 'last_section_number'*/
+	length += PAT_LEN_UNTIL_LAST_SECTION_NUMBER;
+
+	/* do not count the pointer */
+	for (i = 0; i < pat->programs; ++i)
+		length += sizeof(struct vidtv_psi_table_pat_program) -
+			  sizeof(struct vidtv_psi_table_pat_program *);
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > PAT_MAX_SECTION_LEN);
+	return length;
+}
+
+static u16
+vidtv_psi_pmt_table_comp_sec_len(struct vidtv_psi_table_pmt *pmt)
+{
+	/* see ISO/IEC 13818-1 : 2000 p.46 */
+	u16 length = 0;
+	struct vidtv_psi_table_pmt_stream *s = pmt->stream;
+
+	/* from immediately after 'section_length' until 'program_info_length'*/
+	length += PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH;
+
+	/* do not fail if 'desc_length' has not been computed yet */
+	length += vidtv_psi_desc_comp_len(pmt->descriptor);
+	length += pmt->desc_length;
+
+	while (s) {
+		/* skip both pointers at the end */
+		length += sizeof(struct vidtv_psi_table_pmt_stream) -
+			  sizeof(struct vidtv_psi_desc *) -
+			  sizeof(struct vidtv_psi_table_pmt_stream *);
+
+		length += vidtv_psi_desc_comp_len(s->descriptor);
+		s = s->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > PMT_MAX_SECTION_LEN);
+	return length;
+}
+
+static u16
+vidtv_psi_sdt_table_comp_sec_len
+(struct vidtv_psi_table_sdt *sdt)
+{
+	/* see ETSI EN 300 468 V 1.10.1 p.24 */
+	u16 length = 0;
+	struct vidtv_psi_table_sdt_service *s = sdt->service;
+
+	/*
+	 * from immediately after 'section_length' until
+	 * 'reserved_for_future_use'
+	 */
+	length += SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE;
+
+	while (s) {
+		/* skip both pointers at the end */
+		length += sizeof(struct vidtv_psi_table_pmt_stream) -
+			  sizeof(struct vidtv_psi_desc *) -
+			  sizeof(struct vidtv_psi_table_pmt_stream *);
+		/* do not fail if 'desc_length' has not been computed yet */
+		length += vidtv_psi_desc_comp_len(s->descriptor);
+
+		s = s->next;
+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length > SDT_MAX_SECTION_LEN);
+	return length;
+}
+
+struct vidtv_psi_table_pat_program*
+vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
+			   u16 service_id,
+			   u16 pid)
+{
+	struct vidtv_psi_table_pat_program *program;
+
+	program = kzalloc(sizeof(*program), GFP_KERNEL);
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
+void
+vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p)
+{
+	struct vidtv_psi_table_pat_program *curr = p;
+	struct vidtv_psi_table_pat_program *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+void
+vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
+			     struct vidtv_psi_table_pat_program *p)
+{
+	/* This function transfers ownership of p to the table */
+
+	u16 program_count = 0;
+	struct vidtv_psi_table_pat_program *program = p;
+	struct vidtv_psi_table_pat_program *temp = pat->program;
+
+	while (program) {
+		++program_count;
+		program = program->next;
+	}
+
+	pat->programs = program_count;
+	pat->program = p;
+
+	/* Recompute section length */
+	pat->header.section_length = vidtv_psi_pat_table_comp_sec_len(pat);
+
+	/* do not break userspace: reassign if the new size is too big */
+	if (pat->header.section_length > PAT_MAX_SECTION_LEN)
+		vidtv_psi_pat_program_assign(pat, temp);
+	else
+		vidtv_psi_pat_program_destroy(temp);
+}
+
+void vidtv_psi_pat_table_init(struct vidtv_psi_table_pat *pat,
+			      bool update_version_num,
+			      u16 transport_stream_id)
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
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+	if (update_version_num)
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
+	pat->header.section_length = vidtv_psi_pat_table_comp_sec_len(pat);
+}
+
+u32 vidtv_psi_pat_write_into(char *buf,
+			     u32 offset,
+			     struct vidtv_psi_table_pat *pat,
+			     u32 buf_sz)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	u8 continuity_counter = 0;
+	const u16 pat_pid = pat->header.table_id; /* always 0x0 */
+
+	struct vidtv_psi_table_pat_program *p = pat->program;
+	struct header_write_args h_args = {0};
+	struct psi_write_args args = {0};
+	struct crc32_write_args c_args = {0};
+
+	h_args.to = buf;
+	h_args.offset = offset;
+	h_args.h = &pat->header;
+	h_args.pid = pat_pid;
+	h_args.continuity_counter = &continuity_counter;
+	h_args.buf_sz = buf_sz;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	args.to = buf;
+	args.from = pat + sizeof(struct vidtv_psi_table_header),
+	args.len = sizeof(pat->programs);
+	args.offset = offset + nbytes;
+	args.pid = pat_pid;
+	args.new_psi_section = false;
+	args.continuity_counter = &continuity_counter;
+	args.is_crc = false;
+	args.buf_sz = buf_sz;
+
+	nbytes += vidtv_psi_ts_psi_write_into(args);
+
+	while (p) {
+		args.from = p;
+		/* skip the pointer */
+		args. len = sizeof(*p) -
+			    sizeof(struct vidtv_psi_table_pat_program *);
+		args.offset = offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(args);
+		p = p->next;
+	}
+
+	c_args.to = buf;
+	c_args.offset = offset + nbytes;
+	c_args.pid = pat_pid;
+	c_args.continuity_counter = &continuity_counter;
+	c_args.buf_sz = buf_sz;
+
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void
+vidtv_psi_pat_table_destroy(struct vidtv_psi_table_pat *p)
+{
+	vidtv_psi_pat_program_destroy(p->program);
+}
+
+struct vidtv_psi_table_pmt_stream*
+vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
+			  enum vidtv_psi_stream_types stream_type,
+			  u16 es_pid)
+{
+	struct vidtv_psi_table_pmt_stream *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+
+	stream->type = stream_type;
+	stream->elementary_pid = es_pid;
+	stream->reserved = 0x07;
+
+	stream->desc_length = vidtv_psi_desc_comp_len(stream->descriptor);
+
+	stream->zero = 0x0;
+	stream->reserved2 = 0x0f;
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
+void vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s)
+{
+	struct vidtv_psi_table_pmt_stream *curr_stream = s;
+	struct vidtv_psi_table_pmt_stream *tmp_stream = NULL;
+
+	while (curr_stream) {
+		tmp_stream = curr_stream;
+		curr_stream = curr_stream->next;
+		kfree(tmp_stream);
+	}
+}
+
+void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
+				 struct vidtv_psi_table_pmt_stream *s)
+{
+	/* This function transfers ownership of s to the table */
+	struct vidtv_psi_table_pmt_stream *stream = s;
+	struct vidtv_psi_desc *desc = s->descriptor;
+	struct vidtv_psi_table_pmt_stream *temp = pmt->stream;
+
+	while (stream)
+		stream = stream->next;
+
+	while (desc)
+		desc = desc->next;
+
+	pmt->stream = s;
+	/* Recompute section length */
+	pmt->header.section_length = vidtv_psi_pmt_table_comp_sec_len(pmt);
+
+	/* do not break userspace: reassign if the new size is too big */
+	if (pmt->header.section_length > PMT_MAX_SECTION_LEN)
+		vidtv_psi_pmt_stream_assign(pmt, temp);
+	else
+		vidtv_psi_pmt_stream_destroy(temp);
+}
+
+u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
+			  struct vidtv_psi_table_pat *pat)
+{
+	struct vidtv_psi_table_pat_program *program = pat->program;
+
+	/*
+	 * service_id is the same as program_number in the
+	 * corresponding program_map_section
+	 * see ETSI EN 300 468 v1.15.1 p. 24
+	 */
+	while (program)
+		if (program->service_id == section->header.id)
+			return pat->program->pid;
+
+	return LAST_VALID_TS_PID + 1; /* not found */
+}
+
+void vidtv_psi_pmt_table_init(struct vidtv_psi_table_pmt *pmt,
+			      bool update_version_num,
+			      u16 program_number,
+			      u16 pcr_pid)
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
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+	if (update_version_num)
+		++pmt_version;
+
+	pmt->header.version = pmt_version;
+
+	pmt->header.one2 = 0x3;
+	pmt->header.section_id = 0;
+	pmt->header.last_section = 0;
+
+	pmt->pcr_pid = (pcr_pid) ? pcr_pid : 0x1fff;
+	pmt->reserved2 = 0x03;
+
+	pmt->reserved3 = 0x0f;
+	pmt->zero3 = 0x0;
+
+	pmt->desc_length = vidtv_psi_desc_comp_len(pmt->descriptor);
+
+	pmt->header.section_length = vidtv_psi_pmt_table_comp_sec_len(pmt);
+}
+
+u32 vidtv_psi_pmt_write_into(char *buf,
+			     u32 offset,
+			     struct vidtv_psi_table_pmt *pmt,
+			     u16 pid,
+			     u32 buf_sz)
+{
+	u32 nbytes = 0; /* the number of bytes written by this function */
+	u8 continuity_counter = 0;
+	struct vidtv_psi_desc *table_descriptor = pmt->descriptor;
+	struct vidtv_psi_table_pmt_stream *stream = pmt->stream;
+	struct vidtv_psi_desc *stream_descriptor = (stream) ?
+						    pmt->stream->descriptor :
+						    NULL;
+
+	struct header_write_args h_args = {0};
+	struct psi_write_args args = {0};
+	struct desc_write_args d_args = {0};
+	struct crc32_write_args c_args = {0};
+
+	h_args.to = buf;
+	h_args.offset = offset;
+	h_args.h = &pmt->header;
+	h_args.pid = pid;
+	h_args.continuity_counter = &continuity_counter;
+	h_args.buf_sz = buf_sz;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	args.to = buf;
+	args.from = pmt + sizeof(struct vidtv_psi_table_header);
+	args.len = sizeof_field(struct vidtv_psi_table_pmt, bitfield) +
+		   sizeof_field(struct vidtv_psi_table_pmt, bitfield2);
+	args.offset = offset + nbytes;
+	args.pid = pid;
+	args.new_psi_section = false;
+	args.continuity_counter = &continuity_counter;
+	args.is_crc = false;
+	args.buf_sz = buf_sz;
+
+	nbytes += vidtv_psi_ts_psi_write_into(args);
+
+	while (table_descriptor) {
+		d_args.to = buf;
+		d_args.offset = offset + nbytes;
+		d_args.desc = table_descriptor;
+		d_args.pid = pid;
+		d_args.continuity_counter = &continuity_counter;
+		d_args.buf_sz = buf_sz;
+
+		nbytes += vidtv_psi_desc_write_into(d_args);
+
+		table_descriptor = table_descriptor->next;
+	}
+
+	while (stream) {
+		args.from = stream;
+		args.len = sizeof_field(struct vidtv_psi_table_pmt_stream,
+					type) +
+			   sizeof_field(struct vidtv_psi_table_pmt_stream,
+					bitfield) +
+			   sizeof_field(struct vidtv_psi_table_pmt_stream,
+					bitfield2);
+		args.offset = offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(args);
+
+		while (stream_descriptor) {
+			d_args.desc = stream_descriptor;
+			d_args.offset = offset + nbytes;
+			nbytes += vidtv_psi_desc_write_into(d_args);
+
+			stream_descriptor = stream_descriptor->next;
+		}
+
+		stream = stream->next;
+	}
+
+	c_args.to = buf;
+	c_args.offset = offset + nbytes;
+	c_args.pid = pid;
+	c_args.continuity_counter = &continuity_counter;
+	c_args.buf_sz = buf_sz;
+
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
+{
+	struct vidtv_psi_desc *curr_desc = pmt->descriptor;
+	struct vidtv_psi_desc *tmp_desc = NULL;
+
+	while (curr_desc) {
+		tmp_desc = curr_desc;
+		curr_desc = curr_desc->next;
+		vidtv_psi_desc_destroy(tmp_desc);
+		kfree(tmp_desc);
+	}
+
+	vidtv_psi_pmt_stream_destroy(pmt->stream);
+}
+
+void vidtv_psi_sdt_table_init(struct vidtv_psi_table_sdt *sdt,
+			      bool update_version_num,
+			      u16 transport_stream_id)
+{
+	static u8 sdt_version;
+
+	sdt->header.table_id = 0x42;
+
+	sdt->header.one = 0x3;
+	sdt->header.zero = 0x1;
+	/*
+	 * The PAT, PMT, and CAT all set this to 0.
+	 * Other tables set this to 1.
+	 */
+	sdt->header.syntax = 0x1;
+
+	/*
+	 * This is a 16-bit field which serves as a label for identification
+	 * of the TS, about which the SDT informs, from any other multiplex
+	 * within the delivery system.
+	 */
+	sdt->header.id = transport_stream_id;
+	sdt->header.current_next = 0x1;
+
+	/* ETSI 300 468: indicates changes in the TS described by this table*/
+	if (update_version_num)
+		++sdt_version;
+
+	sdt->header.version = sdt_version;
+
+	sdt->header.one2 = 0x3;
+	sdt->header.section_id = 0;
+	sdt->header.last_section = 0;
+
+	sdt->network_id = transport_stream_id;
+	sdt->reserved = 0xff;
+
+	sdt->header.section_length = vidtv_psi_sdt_table_comp_sec_len(sdt);
+}
+
+u32 vidtv_psi_sdt_write_into(char *buf,
+			     u32 offset,
+			     struct vidtv_psi_table_sdt *sdt,
+			     u32 buf_sz)
+{
+	u32 nbytes = 0; /* the number of bytes written */
+	u16 sdt_pid = 0x11; /* see ETSI EN 300 468 v1.15.1 p. 11 */
+	u8 continuity_counter = 0;
+
+	struct vidtv_psi_table_sdt_service *service = sdt->service;
+	struct vidtv_psi_desc *service_desc = (sdt->service) ?
+					       sdt->service->descriptor :
+					       NULL;
+
+	struct header_write_args h_args = {0};
+	struct psi_write_args args = {0};
+	struct desc_write_args d_args = {0};
+	struct crc32_write_args c_args = {0};
+
+	h_args.to = buf;
+	h_args.offset = offset;
+	h_args.h = &sdt->header;
+	h_args.pid = sdt_pid;
+	h_args.continuity_counter = &continuity_counter;
+	h_args.buf_sz = buf_sz;
+
+	nbytes += vidtv_psi_table_header_write_into(h_args);
+
+	args.to = buf;
+	args.from = sdt + sizeof(struct vidtv_psi_table_header);
+	args.len = sizeof_field(struct vidtv_psi_table_sdt, network_id) +
+		   sizeof_field(struct vidtv_psi_table_sdt, reserved);
+	args.offset = offset + nbytes;
+	args.pid = sdt_pid;
+	args.new_psi_section = false;
+	args.continuity_counter = &continuity_counter;
+	args.is_crc = false;
+	args.buf_sz = buf_sz;
+
+	/* copy u16 network_id + u8 reserved)*/
+	nbytes += vidtv_psi_ts_psi_write_into(args);
+
+	while (service) {
+		args.from = service;
+		/* skip both pointers at the end */
+		args.len = sizeof(struct vidtv_psi_table_sdt_service) -
+			   sizeof(struct vidtv_psi_desc *) -
+			   sizeof(struct vidtv_psi_table_sdt_service *);
+		args.offset = offset + nbytes;
+
+		nbytes += vidtv_psi_ts_psi_write_into(args);
+
+		while (service_desc) {
+			d_args.to = buf;
+			d_args.offset = offset + nbytes;
+			d_args.desc = service_desc;
+			d_args.pid = sdt_pid;
+			d_args.continuity_counter = &continuity_counter;
+			d_args.buf_sz = buf_sz;
+
+			nbytes += vidtv_psi_desc_write_into(d_args);
+
+			service_desc = service_desc->next;
+		}
+
+		service = service->next;
+	}
+
+	c_args.to = buf;
+	c_args.offset = offset + nbytes;
+	c_args.pid = sdt_pid;
+	c_args.continuity_counter = &continuity_counter;
+	c_args.buf_sz = buf_sz;
+
+	nbytes += table_section_crc32_write_into(c_args);
+
+	return nbytes;
+}
+
+void vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt)
+{
+	struct vidtv_psi_table_sdt_service *curr_service = sdt->service;
+	struct vidtv_psi_table_sdt_service *tmp_service = NULL;
+	struct vidtv_psi_desc *curr_desc = (sdt->service) ?
+					   sdt->service->descriptor : NULL;
+	struct vidtv_psi_desc *tmp_desc = NULL;
+
+	while (curr_service) {
+		curr_desc = curr_service->descriptor;
+
+		while (curr_desc) {
+			/* clear all descriptors for the service */
+			tmp_desc = curr_desc;
+			curr_desc = curr_desc->next;
+			vidtv_psi_desc_destroy(tmp_desc);
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
+struct vidtv_psi_table_sdt_service*
+vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
+			   u16 service_id)
+{
+	struct vidtv_psi_table_sdt_service *service;
+
+	service = kzalloc(sizeof(*service), GFP_KERNEL);
+
+	/*
+	 * ETSI 300 468: this is a 16bit field which serves as a label to
+	 * identify this service from any other service within the TS.
+	 * The service id is the same as the program number in the
+	 * corresponding program_map_section
+	 */
+	service->service_id = service_id;
+	service->EIT_schedule = 0x0; /* TODO */
+	service->EIT_present_following = 0x0; /* TODO */
+	service->reserved = 0x3f; /* all bits on */
+	service->free_CA_mode = 0x0; /* not scrambled */
+	service->running_status = RUNNING;
+
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = service;
+	}
+
+	return service;
+}
+
+void
+vidtv_psi_sdt_service_destroy(struct vidtv_psi_table_sdt_service *service)
+{
+	struct vidtv_psi_table_sdt_service *curr = service;
+	struct vidtv_psi_table_sdt_service *tmp = NULL;
+
+	while (curr) {
+		tmp = curr;
+		curr = curr->next;
+		kfree(tmp);
+	}
+}
+
+void
+vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
+			     struct vidtv_psi_table_sdt_service *service)
+{
+	struct vidtv_psi_table_sdt_service *temp = sdt->service;
+
+	sdt->service = service;
+
+	sdt->header.section_length = vidtv_psi_sdt_table_comp_sec_len(sdt);
+
+	/* do not break userspace: reassign if the new size is too big */
+	if (sdt->header.section_length > SDT_MAX_SECTION_LEN)
+		vidtv_psi_sdt_service_assign(sdt, temp);
+	else
+		vidtv_psi_sdt_service_destroy(temp);
+}
+
+void
+vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
+					    struct vidtv_psi_table_pmt *sec)
+
+{
+	/*
+	 * PMTs contain information about programs. For each program,
+	 * there is one PMT
+	 */
+	struct vidtv_psi_table_pat_program *program = pat->program;
+	u32 i = 0;
+
+	while (program) {
+		vidtv_psi_pmt_table_init(&sec[i],
+					 false,
+					 sec[i].header.id,
+					 0);
+
+		++i;
+		program = program->next;
+	}
+}
diff --git a/drivers/media/test_drivers/vidtv/vidtv_psi.h b/drivers/media/test_drivers/vidtv/vidtv_psi.h
new file mode 100644
index 0000000000000..0336934b3aba2
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_psi.h
@@ -0,0 +1,294 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef VIDTV_PSI_H
+#define VIDTV_PSI_H
+
+#include <linux/types.h>
+
+/*
+ * all section lengths start immediately after the 'section_length' field
+ * see ISO/IEC 13818-1 : 2000 and ETSI EN 300 468 V 1.10.1 for
+ * reference
+ */
+#define PAT_LEN_UNTIL_LAST_SECTION_NUMBER 5
+#define PAT_MAX_SECTION_LEN 1021
+#define PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH 9
+#define PMT_MAX_SECTION_LEN 1021
+#define SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE 8
+#define SDT_MAX_SECTION_LEN 1021
+
+enum vidtv_psi_descriptors {
+	SERVICE_DESCRIPTOR = 0x48,
+};
+
+enum vidtv_psi_stream_types {
+	ISO_IEC_13818_3_AUDIO = 0x4,
+};
+
+struct vidtv_psi_desc {
+	u8 type;
+	u8 length;
+	struct vidtv_psi_desc *next;
+	u8 data[];
+} __packed;
+
+struct vidtv_psi_desc_service {
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
+struct vidtv_psi_table_header {
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
+struct vidtv_psi_table_pat_program {
+	u16 service_id;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pid:13;
+			u8  reserved:3;
+		} __packed;
+	} __packed;
+	struct vidtv_psi_table_pat_program *next;
+} __packed;
+
+struct vidtv_psi_table_pat {
+	struct vidtv_psi_table_header header;
+	u16 programs;
+	struct vidtv_psi_table_pat_program *program;
+} __packed;
+
+struct vidtv_psi_table_sdt_service {
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
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_sdt_service *next;
+} __packed;
+
+struct vidtv_psi_table_sdt {
+	struct vidtv_psi_table_header header;
+	u16 network_id;
+	u8  reserved;
+	struct vidtv_psi_table_sdt_service *service;
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
+struct vidtv_psi_table_pmt_stream {
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
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_pmt_stream *next;
+} __packed;
+
+struct vidtv_psi_table_pmt {
+	struct vidtv_psi_table_header header;
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
+	struct vidtv_psi_desc *descriptor;
+	struct vidtv_psi_table_pmt_stream *stream;
+} __packed;
+
+struct psi_write_args {
+	void *to;
+	void *from;
+	size_t len; /* how much to write */
+	u32 offset; /* where to start writing in the buffer */
+	u16 pid; /* TS packet ID */
+	bool new_psi_section; /* set when starting a table section */
+	u8 *continuity_counter; /* TS: incremented when section gets split */
+	bool is_crc; /* set when writing the CRC at the end */
+	u32 buf_sz; /* protect against overflow when this field is not zero */
+};
+
+struct desc_write_args {
+	void *to;
+	u32 offset;
+	struct vidtv_psi_desc *desc;
+	u16 pid;
+	u8 *continuity_counter;
+	u32 buf_sz; /* protect against overflow when this field is not zero */
+};
+
+struct crc32_write_args {
+	void *to;
+	u32 offset;
+	u16 pid;
+	u8 *continuity_counter;
+	u32 buf_sz; /* protect against overflow when this field is not zero */
+};
+
+struct header_write_args {
+	void *to;
+	u32 offset;
+	struct vidtv_psi_table_header *h;
+	u16 pid;
+	u8 *continuity_counter;
+	u32 buf_sz; /* protect against overflow when this field is not zero */
+};
+
+struct vidtv_psi_desc *vidtv_psi_desc_init(struct vidtv_psi_desc *head,
+					   u8 type,
+					   u8 length);
+
+void vidtv_psi_pat_table_init(struct vidtv_psi_table_pat *pat,
+			      bool update_version_num,
+			      u16 transport_stream_id);
+
+struct vidtv_psi_table_pat_program*
+vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
+			   u16 service_id,
+			   u16 pid);
+
+struct vidtv_psi_table_pmt_stream*
+vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
+			  enum vidtv_psi_stream_types stream_type,
+			  u16 es_pid);
+
+void vidtv_psi_pmt_table_init(struct vidtv_psi_table_pmt *pmt,
+			      bool update_version_num,
+			      u16 program_number,
+			      u16 pcr_pid);
+
+void
+vidtv_psi_sdt_table_init(struct vidtv_psi_table_sdt *sdt,
+			 bool update_version_num,
+			 u16 transport_stream_id);
+
+struct vidtv_psi_table_sdt_service*
+vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
+			   u16 service_id);
+
+void
+vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc);
+
+void
+vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p);
+
+void
+vidtv_psi_pat_table_destroy(struct vidtv_psi_table_pat *p);
+
+void
+vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s);
+
+void
+vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt);
+
+void
+vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt);
+
+void
+vidtv_psi_sdt_service_destroy(struct vidtv_psi_table_sdt_service *service);
+
+void
+vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc);
+
+void
+vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p);
+
+void
+vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
+			     struct vidtv_psi_table_sdt_service *service);
+
+void vidtv_psi_desc_assign(struct vidtv_psi_desc **to,
+			   struct vidtv_psi_desc *desc,
+			   u16 *desc_length);
+
+void vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
+				  struct vidtv_psi_table_pat_program *p);
+
+void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
+				 struct vidtv_psi_table_pmt_stream *s);
+void
+vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
+					    struct vidtv_psi_table_pmt *sec);
+
+u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
+			  struct vidtv_psi_table_pat *pat);
+
+u32 vidtv_psi_pat_write_into(char *buf,
+			     u32 offset,
+			     struct vidtv_psi_table_pat *pat,
+			     u32 buf_sz);
+
+u32 vidtv_psi_sdt_write_into(char *buf,
+			     u32 offset,
+			     struct vidtv_psi_table_sdt *sdt,
+			     u32 buf_sz);
+
+u32 vidtv_psi_pmt_write_into(char *buf,
+			     u32 offset,
+			     struct vidtv_psi_table_pmt *pmt,
+			     u16 pid,
+			     u32 buf_sz);
+
+#endif // VIDTV_PSI_H
-- 
2.26.0

