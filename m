Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE5B1DAB83
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgETHE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgETHEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:04:21 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D8DC061A0E;
        Wed, 20 May 2020 00:04:21 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o19so1747741qtr.10;
        Wed, 20 May 2020 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cFfEffYRke2E/8xeks38892v+/Bemclf9TkHzkCxgTo=;
        b=IfOXErbZjuvtcCZoCyu+kruIZ1nkz+E1NdVKlBmosbSfFH/oBhguU6S+HE5sOo/abx
         Y/Bzy+TEI0itCQfBDHLvmbiva0oGGo+1yrMm1pVI6MkpMRPRIRg+u3QyelQeLn9mg/qr
         tQCvquQ0ECCn0R2rNlibZmcDLw6ab1G6YKYVD1gB2KMt2PQNOlcFrHM5QKKE8JfeTCOi
         1KVjWX8NXfVryG0YRM+ATBhmnO5198krid6Tej6yKA0+qSyM8rmwkWijfc4JAr4g0/oM
         UVo83fDxCMiOpfoP4/CjSOfXN7UNMa0AH6kR6W2IwoUhVAlbCYm9OfsTdBQu+5cpUKrb
         XYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cFfEffYRke2E/8xeks38892v+/Bemclf9TkHzkCxgTo=;
        b=pQFTJ1xsDOyO4OJxYnZ5NkZQuhdvZ9wI9zm8NYlxap28cT5HKuSSYn30F1P/FdTTBP
         94kUu2s876Vu/yNMvXU2xw6Pi0ChKetKeumyI+MUbqf/IdYCuzN6uPP2HSe4JhQvi7Ma
         pP/j415Rk4fwE9NkSS6v8Vb+PYsE+AEkBQ+Xcm2k5hSPQzttTSs8zr/tRmdylfBl+ts2
         DmHJJENCMV1fwYcJpsOo8KavR0TmapgpXpMEQooyWNMAOU3pJXpzIVitAEAxrTUS2WCo
         vSOWmmRCBP0pF3kODzFV1ykuAJsgn8gGmIjaSaJs3eDzLZkU4Oz6jMS7e816dy9vLBNA
         OFfA==
X-Gm-Message-State: AOAM532jJ139bR82wUqL0S3ZEmNKkt8pLAvb6wescuKf47S/eqwGaqkO
        O+xCeAUefohfUyPlwfTyo4g=
X-Google-Smtp-Source: ABdhPJydiQtKf+72OJ9z1FHAtG3VRlutgCGnHWSDAoSAU8bV4GA1sqlpdYeomivKiyHo2kmMCgnACA==
X-Received: by 2002:ac8:9d:: with SMTP id c29mr3958112qtg.288.1589958260277;
        Wed, 20 May 2020 00:04:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 00:04:19 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v6 09/10] media: vidtv: Implement a SMPTE 302M encoder
Date:   Wed, 20 May 2020 04:03:33 -0300
Message-Id: <20200520070334.1778751-10-dwlsalmeida@gmail.com>
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

Implement a S302M encoder to make it possible to insert PCM audio data
in the generated MPEG Transport Stream.

This shall enable passing an audio signal into userspace so it can be
decoded and played by media software.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_common.h   |   2 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  | 103 +++
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 636 ++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    | 119 ++++
 4 files changed, 860 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
index 1a31973f3ac61..a0480825b23a9 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -12,6 +12,8 @@
 
 #include <linux/types.h>
 
+#define CLOCK_UNIT_90KHZ 90000
+
 u32 vidtv_memcpy(void *to,
 		 size_t to_offset,
 		 size_t to_size,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
new file mode 100644
index 0000000000000..361e49c58c96e
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains a generic encoder type that can provide data for a stream
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_ENCODER_H
+#define VIDTV_ENCODER_H
+
+#include <linux/types.h>
+
+enum vidtv_encoder_id {
+	/* add IDs here when implementing new encoders */
+	S302M,
+};
+
+/**
+ * struct vidtv_encoder - A generic encoder type.
+ * @id: So we can cast to a concrete implementation when needed.
+ * @name: Usually the same as the stream name.
+ * @encoder_buf: The encoder internal buffer for the access units.
+ * @encoder_buf_sz: The encoder buffer size, in bytes
+ * @encoder_buf_offset: Our byte position in the encoder buffer.
+ * @sample_count: How many samples we have encoded in total.
+ * @previous_sample_count: The previous sample count, before clear() was
+ * called.
+ * @nunits: The number of access units ready.
+ * @pts: Array mapping pts[i] for AU[i].
+ * @dts: Array mapping dts[i] for AU[i]
+ * @nbytes: Array mapping how many bytes were written per AU.
+ * @offsets: array keeping track of AU offsets in the buffer.
+ * @src_buf: The source of raw data to be encoded, encoder might set a
+ * default if null.
+ * @src_buf_offset: Our position in the source buffer.
+ * @video: Either video or audio.
+ * @ctx: Encoder-specific state.
+ * @stream_id: Examples: Audio streams (0xc0-0xdf), Video streams
+ * (0xe0-0xef).
+ * @es_id: The TS PID to use for the elementary stream in this encoder.
+ * @encode: Prepare enough AUs for the given amount of time.
+ * @clear: Clear the encoder output.
+ * @sync: Attempt to synchronize with this encoder.
+ * @sampling_rate_hz: The sampling rate (or fps, if video) used.
+ * @access_unit_capacity: Controls allocation for the arrays.
+ * @last_sample_cb: Called when the encoder runs out of data. The encoder
+ * 		    might optionally wrap around the src data if this is not
+ * 		    implemented. This is so the source can read data in a
+ * 		    piecemeal fashion instead of having to
+ * 		    provide it all at once.
+ * @destroy: Destroy this encoder, freeing allocated resources.
+ */
+struct vidtv_encoder {
+	enum vidtv_encoder_id id;
+	char *name;
+
+	u8 *encoder_buf;
+	u32 encoder_buf_sz;
+	u32 encoder_buf_offset;
+
+	u32 sample_count;
+	u32 previous_sample_count;
+
+	u32 nunits;
+	u32 *samples_per_unit;
+	u64 *pts;
+	u64 *dts;
+	u32 *nbytes;
+	u32 *offsets;
+
+	void *src_buf;
+	u32 src_buf_sz;
+	u32 src_buf_offset;
+
+	bool video;
+	void *ctx;
+
+	u16 stream_id;
+
+	u16 es_pid;
+
+	void *(*encode)(struct vidtv_encoder *e, u64 elapsed_time_usecs);
+
+	u8 (*clear)(struct vidtv_encoder *e);
+
+	struct vidtv_encoder *sync;
+
+	u32 sampling_rate_hz;
+
+	u8 access_unit_capacity;
+
+	void (*last_sample_cb)(u32 sample_no);
+
+	void (*destroy)(struct vidtv_encoder *e);
+
+	struct vidtv_encoder *next;
+};
+
+#endif /* VIDTV_ENCODER_H */
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
new file mode 100644
index 0000000000000..3fc537efd9332
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -0,0 +1,636 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the code for an AES3 (also known as AES/EBU) encoder.
+ * It is based on EBU Tech 3250 and SMPTE 302M technical documents.
+ *
+ * This encoder currently supports 16bit AES3 subframes using 16bit signed
+ * integers.
+ *
+ * Note: AU stands for Access Unit, and AAU stands for Audio Access Unit
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/vmalloc.h>
+#include <linux/string.h>
+#include <linux/kernel.h>
+#include <linux/jiffies.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#include "vidtv_s302m.h"
+#include "vidtv_encoder.h"
+#include "vidtv_common.h"
+
+#define S302M_SAMPLING_RATE_HZ 48000
+
+/* see EBU Tech 3250 2004 clause 4 */
+#define CHANNEL_STATUS_BIT_LEN 92
+
+#define S302M_2CHANNELS 0
+#define S302M_BITS_PER_SAMPLE_16 0
+
+/* see preamble definition in EBU Tech 3250 2004 clause 2.4 */
+#define PREAMBLE_X_F0 0xe2 /* sub-frame 1 */
+#define PREAMBLE_Y_F0 0xe4 /* sub-frame 2 */
+#define PREAMBLE_Z_F0 0xe8 /* sub-frame 1 + block start */
+/* F0 and F1 refer to whether the F bit was set in the previous sub-frame */
+#define PREAMBLE_X_F1 0x1d /* sub-frame 1 */
+#define PREAMBLE_Y_F1 0X1b /* sub-frame 2 */
+#define PREAMBLE_Z_F1 0x17 /* sub-frame 1 + block start */
+
+#define S302M_BLOCK_SZ 192
+#define S302M_SIN_LUT_SZ 1024
+
+/*
+ * This buffer contains PCM audio samples of a sine wave, compatible with
+ * S302m
+ */
+static int s302m_sin_lut[S302M_SIN_LUT_SZ] = {
+	0x8000, 0x80c9, 0x8192, 0x825b, 0x8324, 0x83ed, 0x84b6, 0x857e,
+	0x8647, 0x8710, 0x87d9, 0x88a1, 0x896a, 0x8a32, 0x8afb, 0x8bc3,
+	0x8c8b, 0x8d53, 0x8e1b, 0x8ee3, 0x8fab, 0x9072, 0x9139, 0x9201,
+	0x92c7, 0x938e, 0x9455, 0x951b, 0x95e1, 0x96a7, 0x976d, 0x9833,
+	0x98f8, 0x99bd, 0x9a82, 0x9b47, 0x9c0b, 0x9ccf, 0x9d93, 0x9e56,
+	0x9f19, 0x9fdc, 0xa09f, 0xa161, 0xa223, 0xa2e5, 0xa3a6, 0xa467,
+	0xa527, 0xa5e8, 0xa6a7, 0xa767, 0xa826, 0xa8e5, 0xa9a3, 0xaa61,
+	0xab1f, 0xabdc, 0xac98, 0xad55, 0xae10, 0xaecc, 0xaf87, 0xb041,
+	0xb0fb, 0xb1b5, 0xb26e, 0xb326, 0xb3de, 0xb496, 0xb54d, 0xb603,
+	0xb6b9, 0xb76f, 0xb824, 0xb8d8, 0xb98c, 0xba3f, 0xbaf2, 0xbba4,
+	0xbc56, 0xbd07, 0xbdb7, 0xbe67, 0xbf17, 0xbfc5, 0xc073, 0xc121,
+	0xc1cd, 0xc279, 0xc325, 0xc3d0, 0xc47a, 0xc524, 0xc5cc, 0xc675,
+	0xc71c, 0xc7c3, 0xc869, 0xc90f, 0xc9b3, 0xca57, 0xcafb, 0xcb9d,
+	0xcc3f, 0xcce0, 0xcd81, 0xce20, 0xcebf, 0xcf5d, 0xcffb, 0xd097,
+	0xd133, 0xd1ce, 0xd268, 0xd302, 0xd39a, 0xd432, 0xd4c9, 0xd55f,
+	0xd5f5, 0xd689, 0xd71d, 0xd7b0, 0xd842, 0xd8d3, 0xd964, 0xd9f3,
+	0xda82, 0xdb0f, 0xdb9c, 0xdc28, 0xdcb3, 0xdd3d, 0xddc7, 0xde4f,
+	0xded7, 0xdf5d, 0xdfe3, 0xe068, 0xe0eb, 0xe16e, 0xe1f0, 0xe271,
+	0xe2f1, 0xe370, 0xe3ee, 0xe46b, 0xe4e8, 0xe563, 0xe5dd, 0xe656,
+	0xe6cf, 0xe746, 0xe7bc, 0xe831, 0xe8a6, 0xe919, 0xe98b, 0xe9fc,
+	0xea6d, 0xeadc, 0xeb4a, 0xebb7, 0xec23, 0xec8e, 0xecf8, 0xed61,
+	0xedc9, 0xee30, 0xee96, 0xeefa, 0xef5e, 0xefc1, 0xf022, 0xf083,
+	0xf0e2, 0xf140, 0xf19d, 0xf1f9, 0xf254, 0xf2ae, 0xf307, 0xf35e,
+	0xf3b5, 0xf40a, 0xf45f, 0xf4b2, 0xf504, 0xf555, 0xf5a5, 0xf5f3,
+	0xf641, 0xf68d, 0xf6d8, 0xf722, 0xf76b, 0xf7b3, 0xf7fa, 0xf83f,
+	0xf884, 0xf8c7, 0xf909, 0xf94a, 0xf989, 0xf9c8, 0xfa05, 0xfa41,
+	0xfa7c, 0xfab6, 0xfaee, 0xfb26, 0xfb5c, 0xfb91, 0xfbc5, 0xfbf8,
+	0xfc29, 0xfc59, 0xfc88, 0xfcb6, 0xfce3, 0xfd0e, 0xfd39, 0xfd62,
+	0xfd89, 0xfdb0, 0xfdd5, 0xfdfa, 0xfe1d, 0xfe3e, 0xfe5f, 0xfe7e,
+	0xfe9c, 0xfeb9, 0xfed5, 0xfeef, 0xff09, 0xff21, 0xff37, 0xff4d,
+	0xff61, 0xff74, 0xff86, 0xff97, 0xffa6, 0xffb4, 0xffc1, 0xffcd,
+	0xffd8, 0xffe1, 0xffe9, 0xfff0, 0xfff5, 0xfff9, 0xfffd, 0xfffe,
+	0xffff, 0xfffe, 0xfffd, 0xfff9, 0xfff5, 0xfff0, 0xffe9, 0xffe1,
+	0xffd8, 0xffcd, 0xffc1, 0xffb4, 0xffa6, 0xff97, 0xff86, 0xff74,
+	0xff61, 0xff4d, 0xff37, 0xff21, 0xff09, 0xfeef, 0xfed5, 0xfeb9,
+	0xfe9c, 0xfe7e, 0xfe5f, 0xfe3e, 0xfe1d, 0xfdfa, 0xfdd5, 0xfdb0,
+	0xfd89, 0xfd62, 0xfd39, 0xfd0e, 0xfce3, 0xfcb6, 0xfc88, 0xfc59,
+	0xfc29, 0xfbf8, 0xfbc5, 0xfb91, 0xfb5c, 0xfb26, 0xfaee, 0xfab6,
+	0xfa7c, 0xfa41, 0xfa05, 0xf9c8, 0xf989, 0xf94a, 0xf909, 0xf8c7,
+	0xf884, 0xf83f, 0xf7fa, 0xf7b3, 0xf76b, 0xf722, 0xf6d8, 0xf68d,
+	0xf641, 0xf5f3, 0xf5a5, 0xf555, 0xf504, 0xf4b2, 0xf45f, 0xf40a,
+	0xf3b5, 0xf35e, 0xf307, 0xf2ae, 0xf254, 0xf1f9, 0xf19d, 0xf140,
+	0xf0e2, 0xf083, 0xf022, 0xefc1, 0xef5e, 0xeefa, 0xee96, 0xee30,
+	0xedc9, 0xed61, 0xecf8, 0xec8e, 0xec23, 0xebb7, 0xeb4a, 0xeadc,
+	0xea6d, 0xe9fc, 0xe98b, 0xe919, 0xe8a6, 0xe831, 0xe7bc, 0xe746,
+	0xe6cf, 0xe656, 0xe5dd, 0xe563, 0xe4e8, 0xe46b, 0xe3ee, 0xe370,
+	0xe2f1, 0xe271, 0xe1f0, 0xe16e, 0xe0eb, 0xe068, 0xdfe3, 0xdf5d,
+	0xded7, 0xde4f, 0xddc7, 0xdd3d, 0xdcb3, 0xdc28, 0xdb9c, 0xdb0f,
+	0xda82, 0xd9f3, 0xd964, 0xd8d3, 0xd842, 0xd7b0, 0xd71d, 0xd689,
+	0xd5f5, 0xd55f, 0xd4c9, 0xd432, 0xd39a, 0xd302, 0xd268, 0xd1ce,
+	0xd133, 0xd097, 0xcffb, 0xcf5d, 0xcebf, 0xce20, 0xcd81, 0xcce0,
+	0xcc3f, 0xcb9d, 0xcafb, 0xca57, 0xc9b3, 0xc90f, 0xc869, 0xc7c3,
+	0xc71c, 0xc675, 0xc5cc, 0xc524, 0xc47a, 0xc3d0, 0xc325, 0xc279,
+	0xc1cd, 0xc121, 0xc073, 0xbfc5, 0xbf17, 0xbe67, 0xbdb7, 0xbd07,
+	0xbc56, 0xbba4, 0xbaf2, 0xba3f, 0xb98c, 0xb8d8, 0xb824, 0xb76f,
+	0xb6b9, 0xb603, 0xb54d, 0xb496, 0xb3de, 0xb326, 0xb26e, 0xb1b5,
+	0xb0fb, 0xb041, 0xaf87, 0xaecc, 0xae10, 0xad55, 0xac98, 0xabdc,
+	0xab1f, 0xaa61, 0xa9a3, 0xa8e5, 0xa826, 0xa767, 0xa6a7, 0xa5e8,
+	0xa527, 0xa467, 0xa3a6, 0xa2e5, 0xa223, 0xa161, 0xa09f, 0x9fdc,
+	0x9f19, 0x9e56, 0x9d93, 0x9ccf, 0x9c0b, 0x9b47, 0x9a82, 0x99bd,
+	0x98f8, 0x9833, 0x976d, 0x96a7, 0x95e1, 0x951b, 0x9455, 0x938e,
+	0x92c7, 0x9201, 0x9139, 0x9072, 0x8fab, 0x8ee3, 0x8e1b, 0x8d53,
+	0x8c8b, 0x8bc3, 0x8afb, 0x8a32, 0x896a, 0x88a1, 0x87d9, 0x8710,
+	0x8647, 0x857e, 0x84b6, 0x83ed, 0x8324, 0x825b, 0x8192, 0x80c9,
+	0x8000, 0x7f36, 0x7e6d, 0x7da4, 0x7cdb, 0x7c12, 0x7b49, 0x7a81,
+	0x79b8, 0x78ef, 0x7826, 0x775e, 0x7695, 0x75cd, 0x7504, 0x743c,
+	0x7374, 0x72ac, 0x71e4, 0x711c, 0x7054, 0x6f8d, 0x6ec6, 0x6dfe,
+	0x6d38, 0x6c71, 0x6baa, 0x6ae4, 0x6a1e, 0x6958, 0x6892, 0x67cc,
+	0x6707, 0x6642, 0x657d, 0x64b8, 0x63f4, 0x6330, 0x626c, 0x61a9,
+	0x60e6, 0x6023, 0x5f60, 0x5e9e, 0x5ddc, 0x5d1a, 0x5c59, 0x5b98,
+	0x5ad8, 0x5a17, 0x5958, 0x5898, 0x57d9, 0x571a, 0x565c, 0x559e,
+	0x54e0, 0x5423, 0x5367, 0x52aa, 0x51ef, 0x5133, 0x5078, 0x4fbe,
+	0x4f04, 0x4e4a, 0x4d91, 0x4cd9, 0x4c21, 0x4b69, 0x4ab2, 0x49fc,
+	0x4946, 0x4890, 0x47db, 0x4727, 0x4673, 0x45c0, 0x450d, 0x445b,
+	0x43a9, 0x42f8, 0x4248, 0x4198, 0x40e8, 0x403a, 0x3f8c, 0x3ede,
+	0x3e32, 0x3d86, 0x3cda, 0x3c2f, 0x3b85, 0x3adb, 0x3a33, 0x398a,
+	0x38e3, 0x383c, 0x3796, 0x36f0, 0x364c, 0x35a8, 0x3504, 0x3462,
+	0x33c0, 0x331f, 0x327e, 0x31df, 0x3140, 0x30a2, 0x3004, 0x2f68,
+	0x2ecc, 0x2e31, 0x2d97, 0x2cfd, 0x2c65, 0x2bcd, 0x2b36, 0x2aa0,
+	0x2a0a, 0x2976, 0x28e2, 0x284f, 0x27bd, 0x272c, 0x269b, 0x260c,
+	0x257d, 0x24f0, 0x2463, 0x23d7, 0x234c, 0x22c2, 0x2238, 0x21b0,
+	0x2128, 0x20a2, 0x201c, 0x1f97, 0x1f14, 0x1e91, 0x1e0f, 0x1d8e,
+	0x1d0e, 0x1c8f, 0x1c11, 0x1b94, 0x1b17, 0x1a9c, 0x1a22, 0x19a9,
+	0x1930, 0x18b9, 0x1843, 0x17ce, 0x1759, 0x16e6, 0x1674, 0x1603,
+	0x1592, 0x1523, 0x14b5, 0x1448, 0x13dc, 0x1371, 0x1307, 0x129e,
+	0x1236, 0x11cf, 0x1169, 0x1105, 0x10a1, 0x103e, 0xfdd, 0xf7c,
+	0xf1d, 0xebf, 0xe62, 0xe06, 0xdab, 0xd51, 0xcf8, 0xca1,
+	0xc4a, 0xbf5, 0xba0, 0xb4d, 0xafb, 0xaaa, 0xa5a, 0xa0c,
+	0x9be, 0x972, 0x927, 0x8dd, 0x894, 0x84c, 0x805, 0x7c0,
+	0x77b, 0x738, 0x6f6, 0x6b5, 0x676, 0x637, 0x5fa, 0x5be,
+	0x583, 0x549, 0x511, 0x4d9, 0x4a3, 0x46e, 0x43a, 0x407,
+	0x3d6, 0x3a6, 0x377, 0x349, 0x31c, 0x2f1, 0x2c6, 0x29d,
+	0x276, 0x24f, 0x22a, 0x205, 0x1e2, 0x1c1, 0x1a0, 0x181,
+	0x163, 0x146, 0x12a, 0x110, 0xf6, 0xde, 0xc8, 0xb2,
+	0x9e, 0x8b, 0x79, 0x68, 0x59, 0x4b, 0x3e, 0x32,
+	0x27, 0x1e, 0x16, 0xf, 0xa, 0x6, 0x2, 0x1,
+	0x0, 0x1, 0x2, 0x6, 0xa, 0xf, 0x16, 0x1e,
+	0x27, 0x32, 0x3e, 0x4b, 0x59, 0x68, 0x79, 0x8b,
+	0x9e, 0xb2, 0xc8, 0xde, 0xf6, 0x110, 0x12a, 0x146,
+	0x163, 0x181, 0x1a0, 0x1c1, 0x1e2, 0x205, 0x22a, 0x24f,
+	0x276, 0x29d, 0x2c6, 0x2f1, 0x31c, 0x349, 0x377, 0x3a6,
+	0x3d6, 0x407, 0x43a, 0x46e, 0x4a3, 0x4d9, 0x511, 0x549,
+	0x583, 0x5be, 0x5fa, 0x637, 0x676, 0x6b5, 0x6f6, 0x738,
+	0x77b, 0x7c0, 0x805, 0x84c, 0x894, 0x8dd, 0x927, 0x972,
+	0x9be, 0xa0c, 0xa5a, 0xaaa, 0xafb, 0xb4d, 0xba0, 0xbf5,
+	0xc4a, 0xca1, 0xcf8, 0xd51, 0xdab, 0xe06, 0xe62, 0xebf,
+	0xf1d, 0xf7c, 0xfdd, 0x103e, 0x10a1, 0x1105, 0x1169, 0x11cf,
+	0x1236, 0x129e, 0x1307, 0x1371, 0x13dc, 0x1448, 0x14b5, 0x1523,
+	0x1592, 0x1603, 0x1674, 0x16e6, 0x1759, 0x17ce, 0x1843, 0x18b9,
+	0x1930, 0x19a9, 0x1a22, 0x1a9c, 0x1b17, 0x1b94, 0x1c11, 0x1c8f,
+	0x1d0e, 0x1d8e, 0x1e0f, 0x1e91, 0x1f14, 0x1f97, 0x201c, 0x20a2,
+	0x2128, 0x21b0, 0x2238, 0x22c2, 0x234c, 0x23d7, 0x2463, 0x24f0,
+	0x257d, 0x260c, 0x269b, 0x272c, 0x27bd, 0x284f, 0x28e2, 0x2976,
+	0x2a0a, 0x2aa0, 0x2b36, 0x2bcd, 0x2c65, 0x2cfd, 0x2d97, 0x2e31,
+	0x2ecc, 0x2f68, 0x3004, 0x30a2, 0x3140, 0x31df, 0x327e, 0x331f,
+	0x33c0, 0x3462, 0x3504, 0x35a8, 0x364c, 0x36f0, 0x3796, 0x383c,
+	0x38e3, 0x398a, 0x3a33, 0x3adb, 0x3b85, 0x3c2f, 0x3cda, 0x3d86,
+	0x3e32, 0x3ede, 0x3f8c, 0x403a, 0x40e8, 0x4198, 0x4248, 0x42f8,
+	0x43a9, 0x445b, 0x450d, 0x45c0, 0x4673, 0x4727, 0x47db, 0x4890,
+	0x4946, 0x49fc, 0x4ab2, 0x4b69, 0x4c21, 0x4cd9, 0x4d91, 0x4e4a,
+	0x4f04, 0x4fbe, 0x5078, 0x5133, 0x51ef, 0x52aa, 0x5367, 0x5423,
+	0x54e0, 0x559e, 0x565c, 0x571a, 0x57d9, 0x5898, 0x5958, 0x5a17,
+	0x5ad8, 0x5b98, 0x5c59, 0x5d1a, 0x5ddc, 0x5e9e, 0x5f60, 0x6023,
+	0x60e6, 0x61a9, 0x626c, 0x6330, 0x63f4, 0x64b8, 0x657d, 0x6642,
+	0x6707, 0x67cc, 0x6892, 0x6958, 0x6a1e, 0x6ae4, 0x6baa, 0x6c71,
+	0x6d38, 0x6dfe, 0x6ec6, 0x6f8d, 0x7054, 0x711c, 0x71e4, 0x72ac,
+	0x7374, 0x743c, 0x7504, 0x75cd, 0x7695, 0x775e, 0x7826, 0x78ef,
+	0x79b8, 0x7a81, 0x7b49, 0x7c12, 0x7cdb, 0x7da4, 0x7e6d, 0x7f36
+};
+
+static void vidtv_s302m_compute_nunits(struct vidtv_encoder *e)
+{
+	/*
+	 * match the amount of video units if we are trying to sync with a video
+	 * encoder
+	 */
+	if (e->sync && e->sync->video) {
+		e->nunits = e->sync->nunits;
+		return;
+	}
+
+	/* otherwise return enough samples for the timedelta in a single AU */
+	e->nunits = 1;
+}
+
+static void
+vidtv_s302m_compute_sample_count_v(struct vidtv_encoder *e)
+{
+	/* compute sample count for VAU[i] in 'sync' */
+	u32 vau_duration_usecs;
+	u32 sample_duration_usecs;
+	u32 i;
+	u32 s;
+
+	vau_duration_usecs    = USEC_PER_SEC / e->sync->sampling_rate_hz;
+	sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
+
+	for (i = 0; i < e->sync->nunits; ++i) {
+		s = DIV_ROUND_UP(vau_duration_usecs, sample_duration_usecs);
+		e->samples_per_unit[i] = s;
+	}
+}
+
+static void
+vidtv_s302m_compute_sample_count(struct vidtv_encoder *e,
+				 u64 elapsed_time_usecs)
+{
+	/* compute sample count for 'elapsed_time_usecs' */
+	u32 sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
+
+	e->samples_per_unit[0] = elapsed_time_usecs / sample_duration_usecs;
+}
+
+static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
+{
+	u32 count = e->previous_sample_count;
+	u32 i;
+
+	for (i = 0; i < e->nunits; ++i) {
+		count += e->samples_per_unit[i];
+
+		e->pts[i] = count *
+			    CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
+	}
+}
+
+static void vidtv_s302m_compute_pts_v(struct vidtv_encoder *e)
+{
+	u32 i;
+
+	/* use the same pts for video */
+	for (i = 0; i < e->sync->nunits; ++i)
+		e->pts[i] = e->sync->pts[i];
+}
+
+static bool vidtv_s302m_get_c_bit(struct vidtv_encoder *e)
+{
+	/*
+	 * see EBU Tech 3250 2004 clause 5.2.1: minimal implementation of
+	 * channel status
+	 */
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+	bool   start_was_z;
+
+	start_was_z = ctx->last_start_preamble == PREAMBLE_Z_F0 ||
+		      ctx->last_start_preamble == PREAMBLE_Z_F1;
+
+	if (!start_was_z)
+		return false;
+
+	++ctx->current_c_bit;
+
+	/* set the bit only if it is the first C bit after a Z preamble */
+	return !(ctx->current_c_bit % CHANNEL_STATUS_BIT_LEN);
+}
+
+static s16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
+{
+	s16 sample;
+	s16 ret = 0;
+
+	/* bug somewhere */
+	if (e->src_buf_offset > e->src_buf_sz) {
+		pr_err_ratelimited("overflow detected: %d > %d, wrapping.\n",
+				   e->src_buf_offset,
+				   e->src_buf_sz);
+
+		e->src_buf_offset = 0;
+	}
+
+	if (e->src_buf_offset >= e->src_buf_sz) {
+		/* let the source know we are out of data */
+		if (e->last_sample_cb)
+			e->last_sample_cb(e->sample_count);
+
+		e->src_buf_offset = 0;
+	}
+
+	sample = *(s16 *)(e->src_buf + e->src_buf_offset);
+
+	e->sample_count++;
+	e->src_buf_offset += sizeof(s16);
+
+	/* reverse so the LSB comes first when serializing */
+	while (sample) {
+		ret <<= 1;
+
+		if (sample & 1)
+			ret  ^= 1;
+
+		sample >>= 1;
+	}
+
+	return ret;
+}
+
+static void vidtv_s302m_toggle_subframe(struct vidtv_encoder *e)
+{
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+
+	ctx->is_subframe_a = !ctx->is_subframe_a;
+}
+
+static bool vidtv_s302m_is_block_start(const struct vidtv_encoder *e)
+{
+	return e->sample_count % S302M_BLOCK_SZ;
+}
+
+static bool vidtv_s302m_get_f_bit(const struct vidtv_encoder *e)
+{
+	const struct vidtv_s302m_ctx *ctx = e->ctx;
+
+	return vidtv_s302m_is_block_start(e) && ctx->is_subframe_a;
+}
+
+static u8 vidtv_s302m_get_preamble(struct vidtv_encoder *e)
+{
+	/*
+	 * some codecs might disregard the preambles (e.g. ffmpeg s302m), but
+	 * we implement them according to the specs anyway, because some other
+	 * codecs might rely on them.
+	 */
+
+	struct vidtv_s302m_ctx *ctx = e->ctx;
+
+	bool start_was_x = ctx->last_start_preamble == PREAMBLE_X_F0 ||
+			   ctx->last_start_preamble == PREAMBLE_X_F1;
+
+	bool start_was_z = ctx->last_start_preamble == PREAMBLE_Z_F0 ||
+			   ctx->last_start_preamble == PREAMBLE_Z_F1;
+
+	bool is_block_start = vidtv_s302m_is_block_start(e);
+
+	/* bug somewhere: a block always starts with an A subframe */
+	if (!ctx->is_subframe_a && is_block_start) {
+		pr_err_ratelimited("Block should start on 'A' subframe\n");
+		ctx->is_subframe_a = true;
+	}
+
+	if (!ctx->is_subframe_a)
+		return (ctx->last_f) ? PREAMBLE_Y_F1 : PREAMBLE_Y_F0;
+
+	if (start_was_x && is_block_start) {
+		if (ctx->last_f) {
+			ctx->last_start_preamble = PREAMBLE_Z_F0;
+			return PREAMBLE_Z_F0;
+		}
+
+		ctx->last_start_preamble = PREAMBLE_Z_F1;
+		return PREAMBLE_Z_F1;
+	}
+
+	if (start_was_z && is_block_start) {
+		if (ctx->last_f) {
+			ctx->last_start_preamble = PREAMBLE_X_F0;
+			return PREAMBLE_X_F0;
+		}
+
+		ctx->last_start_preamble = PREAMBLE_X_F1;
+		return PREAMBLE_X_F1;
+	}
+
+	return PREAMBLE_X_F0;
+}
+
+static u32 vidtv_s302m_write_subframe(struct vidtv_encoder *e,
+				      struct vidtv_s302m_subframe_16 *f)
+{
+	u32 nbytes = 0;
+
+	nbytes += vidtv_memcpy(e->encoder_buf,
+			       e->encoder_buf_offset,
+			       VIDTV_S302M_BUF_SZ,
+			       f,
+			       sizeof(*f));
+
+	e->encoder_buf_offset += nbytes;
+
+	return nbytes;
+}
+
+static void vidtv_s302m_write_h(struct vidtv_encoder *e, u32 p_sz)
+{
+	struct vidtv_smpte_s302m_es h = {};
+	u32    nbytes                 = 0;
+
+	h.bits_per_sample        = S302M_BITS_PER_SAMPLE_16;
+	h.channel_identification = 0;
+	h.num_channels           = S302M_2CHANNELS;
+	h.audio_packet_size      = p_sz;
+
+	nbytes += vidtv_memcpy(e->encoder_buf,
+			       e->encoder_buf_offset,
+			       e->encoder_buf_sz,
+			       &h,
+			       sizeof(h));
+
+	e->encoder_buf_offset += nbytes;
+}
+
+static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
+{
+	u32    nbytes                    = 0;
+	u32    nbytes_per_unit           = 0;
+	u32    preamble_bit_num          = 0;
+	u32    au_sz                     = 0;
+	struct vidtv_s302m_subframe_16 a = {};
+	struct vidtv_s302m_subframe_16 b = {};
+	u8     preamble_a                = 0; /* four bits sent per subframe */
+	u8     preamble_b                = 0; /* four bits sent per subframe */
+	u8     aux                       = 0;
+	s16    sample                    = 0;
+	bool   v                         = true;
+	bool   u                         = false;
+	bool   c;
+	bool   f;
+
+	u32    i;
+	u32    j;
+
+	for (i = 0; i < e->nunits; ++i) {
+		/* stereo: each sample will generate two subframes */
+		au_sz = e->samples_per_unit[i] *
+			sizeof(struct vidtv_s302m_subframe_16) *
+			2;
+
+		vidtv_s302m_write_h(e, au_sz);
+
+		for (j = 0; j < e->samples_per_unit[i]; ++j) {
+			/* keep this in this order */
+			preamble_a = vidtv_s302m_get_preamble(e);
+			sample     = vidtv_s302m_get_sample(e);
+			c          = vidtv_s302m_get_c_bit(e);
+			f          = vidtv_s302m_get_f_bit(e);
+
+			a.preamble = preamble_bit_num % 8 ?
+				     (preamble_a & GENMASK(3, 0)) :
+				     (preamble_a & GENMASK(7, 4)) >> 4;
+
+			a.aux       = aux;
+			a.data_word = sample;
+			a.v         = v;
+			a.u         = u;
+			a.c         = c;
+			a.f         = f;
+
+			vidtv_s302m_toggle_subframe(e);
+
+			preamble_b = vidtv_s302m_get_preamble(e);
+			c          = vidtv_s302m_get_c_bit(e);
+			f          = vidtv_s302m_get_f_bit(e);
+
+			b.preamble = preamble_bit_num % 8 ?
+				     (preamble_b & GENMASK(3, 0)) :
+				     (preamble_b & GENMASK(7, 4)) >> 4;
+
+			b.aux       = aux;
+			b.data_word = sample;
+			b.v         = v;
+			b.u         = u;
+			b.c         = c;
+			b.f         = f;
+
+			preamble_bit_num += 4;
+
+			nbytes_per_unit += vidtv_s302m_write_subframe(e, &a);
+			nbytes_per_unit += vidtv_s302m_write_subframe(e, &b);
+
+			nbytes += nbytes_per_unit;
+
+			vidtv_s302m_toggle_subframe(e);
+		}
+
+		e->nbytes[i] = nbytes;
+
+		/* did we write more bytes than we initially computed? */
+		if (au_sz != nbytes_per_unit) {
+			pr_warn_ratelimited("write size was %d, expected %d\n",
+					    au_sz,
+					    nbytes_per_unit);
+		}
+
+		e->offsets[i] = nbytes_per_unit;
+		nbytes_per_unit = 0;
+	}
+}
+
+static void *vidtv_s302m_encode(struct vidtv_encoder *e, u64 elapsed_time)
+{
+	/*
+	 * According to SMPTE 302M, an audio access unit is specified as those
+	 * AES3 words that are associated with a corresponding video frame.
+	 * Therefore we should write one AAU for every VAU in the corresponding
+	 * video encoder ('sync'), using the same values for PTS as used by the
+	 * video encoder.
+	 *
+	 * I assume that it is also possible to send audio without any
+	 * associated video, as in a radio-like service. If this is the case,
+	 * we are sending only _one_ AAU with enough audio data for
+	 * 'elapsed_time' instead, computing the value for PTS manually.
+	 */
+
+	vidtv_s302m_compute_nunits(e);
+
+	if (e->sync && e->sync->video) {
+		vidtv_s302m_compute_sample_count_v(e);
+		vidtv_s302m_compute_pts_v(e);
+	} else {
+		vidtv_s302m_compute_sample_count(e, elapsed_time);
+		vidtv_s302m_compute_pts(e);
+	}
+
+	vidtv_s302m_write_frames(e);
+
+	return e->encoder_buf;
+}
+
+static u8 vidtv_s302m_clear(struct vidtv_encoder *e)
+{
+	u8 ret = e->nunits;
+
+	e->nunits = 0;
+	memset(e->samples_per_unit, 0, e->access_unit_capacity);
+	memset(e->nbytes, 0, e->access_unit_capacity);
+	memset(e->offsets, 0, e->access_unit_capacity);
+	memset(e->pts, 0, e->access_unit_capacity);
+	memset(e->dts, 0, e->access_unit_capacity);
+
+	return ret;
+}
+
+struct vidtv_encoder
+*vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args)
+{
+	struct vidtv_encoder *e = kzalloc(sizeof(*e), GFP_KERNEL);
+	u32    priv_sz          = sizeof(struct vidtv_s302m_ctx);
+
+	if (args.sync)
+		args.access_unit_capacity = args.sync->access_unit_capacity;
+
+	e->id = S302M;
+
+	e->name = kzalloc(strlen(args.name), GFP_KERNEL);
+	strncpy(e->name, args.name, strlen(e->name));
+
+	e->encoder_buf        = vzalloc(VIDTV_S302M_BUF_SZ);
+	e->encoder_buf_sz     = VIDTV_S302M_BUF_SZ;
+	e->encoder_buf_offset = 0;
+
+	e->sample_count          = 0;
+	e->previous_sample_count = 0;
+	e->nunits                = 0;
+
+	e->samples_per_unit = kcalloc(args.access_unit_capacity,
+				      sizeof(u32),
+				      GFP_KERNEL);
+
+	e->pts = kcalloc(args.access_unit_capacity, sizeof(u64), GFP_KERNEL);
+	e->dts = kcalloc(args.access_unit_capacity, sizeof(u64), GFP_KERNEL);
+
+	e->nbytes  = kcalloc(args.access_unit_capacity,
+			     sizeof(u32),
+			     GFP_KERNEL);
+
+	e->offsets = kcalloc(args.access_unit_capacity,
+			     sizeof(u32),
+			     GFP_KERNEL);
+
+	e->src_buf        = (args.src_buf) ? args.src_buf : &s302m_sin_lut;
+	e->src_buf_sz     = (args.src_buf) ? args.src_buf_sz : S302M_SIN_LUT_SZ;
+	e->src_buf_offset = 0;
+
+	e->video = false;
+	e->ctx   = kzalloc(priv_sz, GFP_KERNEL);
+
+	e->encode = vidtv_s302m_encode;
+	e->clear  = vidtv_s302m_clear;
+
+	e->es_pid = args.es_pid;
+
+	e->sync                 = args.sync;
+	e->sampling_rate_hz     = S302M_SAMPLING_RATE_HZ;
+	e->access_unit_capacity = args.access_unit_capacity;
+
+	/* we will wrap around 'src' if this is NULL */
+	e->last_sample_cb = args.last_sample_cb;
+
+	e->destroy = vidtv_s302m_encoder_destroy;
+
+	if (args.head) {
+		while (args.head->next)
+			args.head = args.head->next;
+
+		args.head->next = e;
+	}
+
+	e->next = NULL;
+
+	return e;
+}
+
+void vidtv_s302m_encoder_destroy(struct vidtv_encoder *e)
+{
+	if (e->id != S302M) {
+		pr_err_ratelimited("Encoder type mismatch, skipping.\n");
+		return;
+	}
+
+	kfree(e->name);
+	kfree(e->encoder_buf);
+	kfree(e->samples_per_unit);
+	kfree(e->pts);
+	kfree(e->dts);
+	kfree(e->nbytes);
+	kfree(e->offsets);
+	kfree(e->ctx);
+	kfree(e);
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
new file mode 100644
index 0000000000000..d0ed01cffca27
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the code for an AES3 (also known as AES/EBU) encoder.
+ * It is based on EBU Tech 3250 and SMPTE 302M technical documents.
+ *
+ * This encoder currently supports 16bit AES3 subframes using 16bit signed
+ * integers.
+ *
+ * Note: AU stands for Access Unit, and AAU stands for Audio Access Unit
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_S302M_H
+#define VIDTV_S302M_H
+
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#include "vidtv_encoder.h"
+
+/* see SMPTE 302M 2007 clause 7.3 */
+#define VIDTV_S302M_BUF_SZ 65024
+
+/* see ETSI TS 102 154 v.1.2.1 clause 7.3.5 */
+#define VIDTV_S302M_FORMAT_IDENTIFIER 0x42535344
+
+/**
+ * struct vidtv_s302m_ctx - s302m encoder context.
+ * @enc: A pointer to the containing encoder structure.
+ * @last_f: whether the F bit was set for the last sub-frame.
+ * @last_start_preamble: The start preamble, either X or Z.
+ * @is_subframe_a: Whether we are writing an A subframe at the moment.
+ * @current_c_bit: The C bit to send in the current subframe.
+ */
+struct vidtv_s302m_ctx {
+	struct vidtv_encoder *enc;
+
+	bool last_f;
+	u8 last_start_preamble;
+	bool is_subframe_a;
+	u8 current_c_bit;
+};
+
+struct vidtv_smpte_s302m_es {
+	union {
+		__be32 bitfield;
+		struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+			u16 zero:4;
+			u16 bits_per_sample:2; /* 0x0 for 16bits */
+			u16 channel_identification:8;
+			u16 num_channels:2;
+			u16 audio_packet_size:16;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+			u16 audio_packet_size:16;
+			u16 num_channels:2;
+			u16 channel_identification:8;
+			u16 bits_per_sample:2; /* 0x0 for 16bits */
+			u16 zero:4;
+#else
+#error  "Unknown bit ordering"
+#endif
+		} __packed;
+	} __packed;
+} __packed;
+
+struct vidtv_s302m_subframe_16 {
+	union {
+		u32 bitfield;
+		struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+			u8 f:1;
+			u8 c:1;
+			u8 u:1;
+			u8 v:1;
+			u16 data_word:16; /* little endian */
+			u8 zero:4;
+			u8 aux:4;
+			u8 preamble:4;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+			u8 preamble:4;
+			u8 aux:4;
+			u8 zero:4;
+			u16 data_word:16; /* little endian */
+			u8 v:1;
+			u8 u:1;
+			u8 c:1;
+			u8 f:1;
+#else
+#error  "Unknown bit ordering"
+#endif
+		} __packed;
+	} __packed;
+}__packed;
+
+struct vidtv_s302m_encoder_init_args {
+	char *name;
+	void *src_buf;
+	u32 src_buf_sz;
+	u16 es_pid;
+	struct vidtv_encoder *sync;
+	u8 access_unit_capacity;
+	void (*last_sample_cb)(u32 sample_no);
+
+	/* optionally chain to this encoder */
+	struct vidtv_encoder *head;
+};
+
+struct vidtv_encoder
+*vidtv_s302m_encoder_init(struct vidtv_s302m_encoder_init_args args);
+
+void vidtv_s302m_encoder_destroy(struct vidtv_encoder *encoder);
+
+#endif /* VIDTV_S302M_H */
-- 
2.26.2

