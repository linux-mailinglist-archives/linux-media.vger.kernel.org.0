Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F4B1DAB63
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgETHEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgETHEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:04:07 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BBCC061A0E;
        Wed, 20 May 2020 00:04:07 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 142so2577241qkl.6;
        Wed, 20 May 2020 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eu6zyVAv2okqAu2MpDIX4+uWLByOhOoVUD/ukYkdvtU=;
        b=hL3uKUZC+ShBYI7GA2vsr0K3vXSxPUe7eJnW9YA+ujZoBCfPsgwzaUXtKgFI+xOghY
         iCWRM0fxH7gdulYBcV0mF1Ts0QxaPzpbgbiv4PCwITXw6+ZkasZUaQsVqKbOE25wWz78
         Sob0yDX+m5VKXwPz3UwvMm6lQt4cHDW6ObTQYACHxsIZU5IKa/EtxGsMT9dPRtQLF4b3
         7QEiSK1jEHocuxR45g/jXgFGz8p1wYo7vzQJb6TL6wKIDZcZflaljAnLPi9whUvyo16x
         mgv26ZTYU0x2X7/1nkLz+vAVpugybaMT5RqoytZWl9e4dCtn8aRYicNc2Hfla8SE6tJ2
         jRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eu6zyVAv2okqAu2MpDIX4+uWLByOhOoVUD/ukYkdvtU=;
        b=mzURbuSg2AMbGj46ALOpVNEhUsl3MPcAK6hAUhytXQiicQYIkluvshn+oIrQyU8pEM
         PwTMyJ3KuqvahD2IC3/572e2LuL/lccF+o2I/so8BNhpPRzgmYmJBiNMtWEshW76jBlW
         bhKVdxPF9Csgk1D7DYqhF+9ODve2VmJJSZOvELnT5JdMIrLM/Ujzgn6MTQnyEg1gCE/h
         1vUQPnbeCu+YctWJHecKDQrAkgd12Itn/mFHVw25YQwljxu4VSyu0gJWe1lImdfTrmuz
         ash3WdfzWnha/SbIqlAYlohM0N4wJh2sbji9fz/SRkJ0F4+/4olFyiabqgE2ds69B53+
         h+5w==
X-Gm-Message-State: AOAM532ez6BQavnXeqfD6RvBDVE0GI/0sB/5PSDkTOzO6hFqQEsjeDuX
        DR01Yh6FuYARa5OqfsKDSZw=
X-Google-Smtp-Source: ABdhPJwIM5NOT97Nxp2fyd1Y2xqqHdqgG0DhKVvamSgFiegtoWtz85BmA/oPp1PqnYHz1325W8Qh9A==
X-Received: by 2002:a37:a7c8:: with SMTP id q191mr3272536qke.214.1589958246511;
        Wed, 20 May 2020 00:04:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 00:04:05 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v6 06/10] media: vidtv: add MPEG TS common code
Date:   Wed, 20 May 2020 04:03:30 -0300
Message-Id: <20200520070334.1778751-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add code to work with MPEG TS packets, such as TS headers, adaptation
fields, PCR packets and NULL packets.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_ts.c | 157 ++++++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_ts.h | 120 +++++++++++++++
 2 files changed, 277 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
new file mode 100644
index 0000000000000..77908c4e85eef
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#include "vidtv_ts.h"
+#include "vidtv_common.h"
+
+static u32 vidtv_ts_write_pcr_bits(u8 *to, u32 to_offset, u64 pcr)
+{
+	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
+	u64 pcr_low = pcr % 300;
+	u64 pcr_high = pcr / 300;
+	u8 *buf = to + to_offset;
+
+	*buf++ = pcr_high >> 25;
+	*buf++ = pcr_high >> 17;
+	*buf++ = pcr_high >>  9;
+	*buf++ = pcr_high >>  1;
+	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
+	*buf++ = pcr_low;
+
+	return 6;
+}
+
+void vidtv_ts_inc_cc(u8 *continuity_counter)
+{
+	++*continuity_counter;
+	if (*continuity_counter > TS_CC_MAX_VAL)
+		*continuity_counter = 0;
+}
+
+u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
+{
+	u32    nbytes                  = 0;
+	struct vidtv_mpeg_ts ts_header = {0};
+
+	ts_header.sync_byte          = TS_SYNC_BYTE;
+	ts_header.pid                = TS_NULL_PACKET_PID;
+	ts_header.payload            = 1;
+	ts_header.continuity_counter = *args.continuity_counter;
+
+	cpu_to_be16s(&ts_header.bitfield);
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	be16_to_cpus(&ts_header.bitfield);
+
+	/*
+	 * Note:
+	 *	This will cause a discontinuity if the buffer is full,
+	 *	effectively dropping the packet, since nothing will get written
+	 *	but the continuity counter will still be incremented. This way,
+	 *	userspace can detect packet losses.
+	 */
+	vidtv_ts_inc_cc(args.continuity_counter);
+
+	/* fill the rest with empty data */
+	nbytes += vidtv_memset(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       TS_FILL_BYTE,
+			       TS_PACKET_LEN - nbytes);
+
+	/* we should have written exactly _one_ 188byte packet */
+	if (nbytes != TS_PACKET_LEN)
+		pr_warn_ratelimited("Expected exactly %d bytes, got %d\n",
+				    TS_PACKET_LEN,
+				    nbytes);
+
+	return nbytes;
+}
+
+u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
+{
+	u32    nbytes                         = 0;
+	struct vidtv_mpeg_ts ts_header        = {0};
+	struct vidtv_mpeg_ts_adaption ts_adap = {0};
+
+	ts_header.sync_byte     = TS_SYNC_BYTE;
+	ts_header.tei           = 0;
+	ts_header.payload_start = 0;
+	ts_header.pid           = args.pid;
+	ts_header.priority      = 0;
+	ts_header.scrambling    = 0;
+	/* cc is not incremented, but we need it. see 13818-1 clause 2.4.3.3 */
+	ts_header.continuity_counter = *args.continuity_counter;
+	ts_header.payload            = 0;
+	ts_header.adaptation_field   = 1;
+
+	/* 13818-1 clause 2.4.3.5 */
+	ts_adap.length = 183;
+	ts_adap.PCR    = 1;
+
+	/*
+	 * Note:
+	 *	Nothing will get written if the buffer is full, this will
+	 *	essentially drop the packet. The continuity counter is not
+	 *	updated for PCR packets, so it will be as if no PCR packet was
+	 *	sent at all.
+	 */
+
+	cpu_to_be16s(&ts_header.bitfield);
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	be16_to_cpus(&ts_header.bitfield);
+
+	/* write the adap after the TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_adap,
+			       sizeof(ts_adap));
+
+	/* write the PCR optional */
+	cpu_to_be64s(&args.pcr);
+	nbytes += vidtv_ts_write_pcr_bits(args.dest_buf,
+					  args.dest_offset + nbytes,
+					  args.pcr);
+	be64_to_cpus(&args.pcr);
+
+	nbytes += vidtv_memset(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       TS_FILL_BYTE,
+			       TS_PACKET_LEN - nbytes);
+
+	/* we should have written exactly _one_ 188byte packet */
+	if (nbytes != TS_PACKET_LEN)
+		pr_warn_ratelimited("Expected exactly %d bytes, got %d\n",
+				    TS_PACKET_LEN,
+				    nbytes);
+
+	return nbytes;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
new file mode 100644
index 0000000000000..b6c638d13d14f
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_TS_H
+#define VIDTV_TS_H
+
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#define TS_SYNC_BYTE 0x47
+#define TS_PACKET_LEN 188
+#define TS_PAYLOAD_LEN 184
+#define TS_NULL_PACKET_PID 0x1fff
+#define TS_CC_MAX_VAL 0x0f /* 4 bits */
+#define TS_LAST_VALID_PID 8191
+#define TS_FILL_BYTE 0xff /* the byte used in packet stuffing */
+
+struct vidtv_mpeg_ts_adaption {
+	u8 length;
+	struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 extension:1;
+		u8 private_data:1;
+		u8 splicing_point:1;
+		u8 OPCR:1;
+		u8 PCR:1;
+		u8 priority:1;
+		u8 random_access:1;
+		u8 discontinued:1;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 discontinued:1;
+		u8 random_access:1;
+		u8 priority:1;
+		u8 PCR:1;
+		u8 OPCR:1;
+		u8 splicing_point:1;
+		u8 private_data:1;
+		u8 extension:1;
+#else
+#error  "Unknown bitfield ordering"
+#endif
+	} __packed;
+	u8 data[];
+} __packed;
+
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
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 continuity_counter:4;
+		u8 payload:1;
+		u8 adaptation_field:1;
+		u8 scrambling:2;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 scrambling:2;
+		u8 adaptation_field:1;
+		u8 payload:1;
+		u8 continuity_counter:4;
+#else
+#error  "Unknown bitfield ordering"
+#endif
+	} __packed;
+	struct vidtv_mpeg_ts_adaption adaption[];
+} __packed;
+
+/**
+ * struct pcr_write_args - Arguments for the pcr_write_into function.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: The byte offset into the buffer.
+ * @pid: The TS PID for the PCR packets.
+ * @buf_sz: The size of the buffer in bytes.
+ * @countinuity_counter: The TS continuity_counter.
+ * @pcr: A sample from the system clock.
+ */
+struct pcr_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u16 pid;
+	u32 buf_sz;
+	u8 *continuity_counter;
+	u64 pcr;
+};
+
+/**
+ * struct null_packet_write_args - Arguments for the null_write_into function
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: The byte offset into the buffer.
+ * @buf_sz: The size of the buffer in bytes.
+ * @countinuity_counter: The TS continuity_counter.
+ */
+struct null_packet_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 buf_sz;
+	u8 *continuity_counter;
+};
+
+/* Increment the continuity counter */
+void vidtv_ts_inc_cc(u8 *continuity_counter);
+
+u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
+
+u32 vidtv_ts_pcr_write_into(struct pcr_write_args args);
+
+#endif //VIDTV_TS_H
-- 
2.26.2

