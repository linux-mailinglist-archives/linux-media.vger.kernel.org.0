Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E98814C9F3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 12:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgA2LyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 06:54:22 -0500
Received: from gofer.mess.org ([88.97.38.141]:53595 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgA2LyV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 06:54:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 709F1C645D; Wed, 29 Jan 2020 11:54:19 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v4l-utils 2/4] keytable: new samsung36 bpf decoder
Date:   Wed, 29 Jan 2020 11:54:17 +0000
Message-Id: <20200129115419.8456-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129115419.8456-1-sean@mess.org>
References: <20200129115419.8456-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/bpf_protocols/Makefile.am |   2 +-
 utils/keytable/bpf_protocols/samsung36.c | 136 +++++++++++++++++++++++
 2 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 utils/keytable/bpf_protocols/samsung36.c

diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
index 3423aba1..13be2794 100644
--- a/utils/keytable/bpf_protocols/Makefile.am
+++ b/utils/keytable/bpf_protocols/Makefile.am
@@ -10,7 +10,7 @@ CLANG_SYS_INCLUDES := $(shell $(CLANG) -v -E - </dev/null 2>&1 \
 %.o: %.c bpf_helpers.h
 	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -O2 -c $<
 
-PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o raw.o
+PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o raw.o samsung36.o
 
 all: $(PROTOCOLS)
 
diff --git a/utils/keytable/bpf_protocols/samsung36.c b/utils/keytable/bpf_protocols/samsung36.c
new file mode 100644
index 00000000..1b09365f
--- /dev/null
+++ b/utils/keytable/bpf_protocols/samsung36.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Remote protocol used by some Samsung remotes. It has 36 bits and the
+// 16th bit is not really a bit, but a marker to distinguish it from
+// shorter samsung protocols.
+//
+// http://www.hifi-remote.com/wiki/index.php/DecodeIR#Samsung36
+// Copyright (C) 2020 Sean Young <sean@mess.org>
+
+#include <linux/lirc.h>
+#include <linux/bpf.h>
+
+#include "bpf_helpers.h"
+
+enum state {
+	STATE_INACTIVE,
+	STATE_HEADER_SPACE,
+	STATE_BITS_SPACE,
+	STATE_BITS_PULSE,
+	STATE_TRAILER,
+};
+
+struct decoder_state {
+	unsigned long bits;
+	enum state state;
+	unsigned int count;
+};
+
+struct bpf_map_def SEC("maps") decoder_state_map = {
+	.type = BPF_MAP_TYPE_ARRAY,
+	.key_size = sizeof(unsigned int),
+	.value_size = sizeof(struct decoder_state),
+	.max_entries = 1,
+};
+
+// These values can be overridden in the rc_keymap toml
+//
+// We abuse elf relocations. We cast the address of these variables to
+// an int, so that the compiler emits a mov immediate for the address
+// but uses it as an int. The bpf loader replaces the relocation with the
+// actual value (either overridden or taken from the data segment).
+int margin = 300;
+int rc_protocol = 69;
+
+#define BPF_PARAM(x) (int)(&(x))
+
+static inline int eq_margin(unsigned d1, unsigned d2)
+{
+	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
+}
+
+SEC("samsung36")
+int bpf_decoder(unsigned int *sample)
+{
+	unsigned int key = 0;
+	struct decoder_state *s = bpf_map_lookup_elem(&decoder_state_map, &key);
+
+	if (!s)
+		return 0;
+
+	switch (*sample & LIRC_MODE2_MASK) {
+	case LIRC_MODE2_SPACE:
+	case LIRC_MODE2_PULSE:
+	case LIRC_MODE2_TIMEOUT:
+		break;
+	default:
+		// not a timing events
+		return 0;
+	}
+
+	int duration = LIRC_VALUE(*sample);
+	int pulse = LIRC_IS_PULSE(*sample);
+
+	switch (s->state) {
+	case STATE_INACTIVE:
+		if (pulse && eq_margin(duration, 4500)) {
+			s->bits = 0;
+			s->state = STATE_HEADER_SPACE;
+			s->count = 0;
+		}
+		break;
+	case STATE_HEADER_SPACE:
+		if (!pulse && eq_margin(duration, 4500))
+			s->state = STATE_BITS_PULSE;
+		else
+			s->state = STATE_INACTIVE;
+		break;
+	case STATE_BITS_PULSE:
+		if (pulse && eq_margin(duration, 500))
+			s->state = STATE_BITS_SPACE;
+		else
+			s->state = STATE_INACTIVE;
+		break;
+	case STATE_BITS_SPACE:
+		if (pulse) {
+			s->state = STATE_INACTIVE;
+			break;
+		}
+
+		s->count++;
+
+		if (s->count == 17) {
+			if (eq_margin(duration, 4450)) {
+				s->state = STATE_BITS_PULSE;
+			} else {
+				s->state = STATE_INACTIVE;
+			}
+			break;
+		}
+
+		s->bits <<= 1;
+
+		if (eq_margin(duration, 1600)) {
+			s->bits |= 1;
+		} else if (!eq_margin(duration, 500)) {
+			s->state = STATE_INACTIVE;
+			break;
+		}
+
+		if (s->count == 37)
+			s->state = STATE_TRAILER;
+		else
+			s->state = STATE_BITS_PULSE;
+		break;
+	case STATE_TRAILER:
+		if (pulse && eq_margin(duration, 500)) {
+			bpf_rc_keydown(sample, BPF_PARAM(rc_protocol), s->bits, 0);
+		}
+
+		s->state = STATE_INACTIVE;
+	}
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.24.1

