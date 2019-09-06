Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02E1AC244
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 00:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391501AbfIFWBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 18:01:08 -0400
Received: from gofer.mess.org ([88.97.38.141]:34087 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390045AbfIFWBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 18:01:08 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 59C7A6047B; Fri,  6 Sep 2019 23:01:06 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: support sending protocols decoded by BPF decoders
Date:   Fri,  6 Sep 2019 23:01:06 +0100
Message-Id: <20190906220106.9257-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Encode keymaps using xbox-dvd, pulse_distance, pulse_length and manchester
BPF decoders. The kernel has no idea how to encode them so this must be
done in userspace.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c   |  26 ++++++-
 utils/common/keymap.c      |   1 +
 utils/ir-ctl/Makefile.am   |   2 +-
 utils/ir-ctl/bpf_encoder.c | 137 +++++++++++++++++++++++++++++++++++++
 utils/ir-ctl/bpf_encoder.h |   7 ++
 utils/ir-ctl/ir-ctl.c      |  31 ++++++---
 6 files changed, 193 insertions(+), 11 deletions(-)
 create mode 100644 utils/ir-ctl/bpf_encoder.c
 create mode 100644 utils/ir-ctl/bpf_encoder.h

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index 47e294b1..e4fde403 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -342,6 +342,30 @@ static int rc6_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	return (n % 2) ? n : n + 1;
 }
 
+static int xbox_dvd_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+{
+	int len = 0;
+
+	buf[len++] = 4000;
+	buf[len++] = 3900;
+
+	scancode &= 0xfff;
+	scancode |= (~scancode << 12) & 0xfff000;
+
+	for (int i=23; i >=0; i--) {
+		buf[len++] = 550;
+
+		if (scancode & (1 << i))
+			buf[len++] = 1900;
+		else
+			buf[len++] = 900;
+	}
+
+	buf[len++]= 550;
+
+	return len;
+}
+
 static const struct {
 	char name[10];
 	unsigned scancode_mask;
@@ -376,7 +400,7 @@ static const struct {
 	[RC_PROTO_RCMM12] = { "rc-mm-12", 0x0fff },
 	[RC_PROTO_RCMM24] = { "rc-mm-24", 0xffffff },
 	[RC_PROTO_RCMM32] = { "rc-mm-32", 0xffffffff },
-	[RC_PROTO_XBOX_DVD] = { "xbox-dvd", 0xfff },
+	[RC_PROTO_XBOX_DVD] = { "xbox-dvd", 0xfff, 68, 38000, xbox_dvd_encode },
 };
 
 static bool str_like(const char *a, const char *b)
diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index e3a162ab..20026cc4 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -404,6 +404,7 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 	}
 
 	struct scancode_entry **next = &map->scancode;
+	i = 0;
 
 	for (;;) {
 		struct scancode_entry *se;
diff --git a/utils/ir-ctl/Makefile.am b/utils/ir-ctl/Makefile.am
index df53a965..ad90b84e 100644
--- a/utils/ir-ctl/Makefile.am
+++ b/utils/ir-ctl/Makefile.am
@@ -1,6 +1,6 @@
 bin_PROGRAMS = ir-ctl
 man_MANS = ir-ctl.1
 
-ir_ctl_SOURCES = ir-ctl.c ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
+ir_ctl_SOURCES = ir-ctl.c ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h bpf_encoder.c bpf_encoder.h
 ir_ctl_LDADD = @LIBINTL@
 ir_ctl_LDFLAGS = $(ARGP_LIBS)
diff --git a/utils/ir-ctl/bpf_encoder.c b/utils/ir-ctl/bpf_encoder.c
new file mode 100644
index 00000000..82d12cc0
--- /dev/null
+++ b/utils/ir-ctl/bpf_encoder.c
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/types.h>
+
+#include "keymap.h"
+
+// Some keymaps use BPF decoders, so the kernel has no idea how to encode
+// them. We need user-space encoders for these.
+//
+// This encoders should match what the BPF decoders in
+// utils/keytable/bpf_protocols/*.c decode.
+
+static void encode_pulse_distance(struct keymap *map, uint32_t scancode, int *buf, int *length)
+{
+	int len = 0, bits, i;
+
+	buf[len++] = keymap_param(map, "header_pulse", 2125);
+	buf[len++] = keymap_param(map, "header_space", 1875);
+
+	bits = keymap_param(map, "bits", 4);
+
+	if (keymap_param(map, "reverse", 0)) {
+		for (i = 0; i < bits; i++) {
+			buf[len++] = keymap_param(map, "bit_pulse", 625);
+
+			if (scancode & (1 << i))
+				buf[len++] = keymap_param(map, "bit_1_space", 1625);
+			else
+				buf[len++] = keymap_param(map, "bit_0_space", 375);
+		}
+	} else {
+		for (i = bits - 1; i >= 0; i--) {
+			buf[len++] = keymap_param(map, "bit_pulse", 625);
+
+			if (scancode & (1 << i))
+				buf[len++] = keymap_param(map, "bit_1_space", 1625);
+			else
+				buf[len++] = keymap_param(map, "bit_0_space", 375);
+		}
+	}
+
+	buf[len++] = keymap_param(map, "trailer_pulse", 625);
+
+	*length = len;
+}
+
+static void encode_pulse_length(struct keymap *map, uint32_t scancode, int *buf, int *length)
+{
+	int len = 0, bits, i;
+
+	buf[len++] = keymap_param(map, "header_pulse", 2125);
+	buf[len++] = keymap_param(map, "header_space", 1875);
+
+	bits = keymap_param(map, "bits", 4);
+
+	if (keymap_param(map, "reverse", 0)) {
+		for (i = 0; i < bits; i++) {
+			if (scancode & (1 << i))
+				buf[len++] = keymap_param(map, "bit_1_space", 1625);
+			else
+				buf[len++] = keymap_param(map, "bit_0_space", 375);
+
+			buf[len++] = keymap_param(map, "bit_pulse", 625);
+		}
+	} else {
+		for (i = bits - 1; i >= 0; i--) {
+			if (scancode & (1 << i))
+				buf[len++] = keymap_param(map, "bit_1_space", 1625);
+			else
+				buf[len++] = keymap_param(map, "bit_0_space", 375);
+
+			buf[len++] = keymap_param(map, "bit_pulse", 625);
+		}
+	}
+
+	*length = len;
+}
+
+static void encode_manchester(struct keymap *map, uint32_t scancode, int *buf, int *length)
+{
+	int len = 0, bits, i;
+
+	void advance_space(unsigned length)
+	{
+		if (len % 2)
+			buf[len] += length;
+		else
+			buf[++len] = length;
+	}
+
+	void advance_pulse(unsigned length)
+	{
+		if (len % 2)
+			buf[++len] = length;
+		else
+			buf[len] += length;
+	}
+
+	bits = keymap_param(map, "bits", 14);
+
+	for (i = bits - 1; i >= 0; i--) {
+		if (scancode & (1 << i)) {
+			advance_pulse(keymap_param(map, "one_pulse", 888));
+			advance_space(keymap_param(map, "one_space", 888));
+		} else {
+			advance_space(keymap_param(map, "zero_space", 888));
+			advance_pulse(keymap_param(map, "zero_pulse", 888));
+		}
+	}
+
+	/* drop any trailing pulse */
+        *length = (len % 2) ? len : len + 1;
+}
+
+bool encode_bpf_protocol(struct keymap *map, uint32_t scancode, int *buf, int *length)
+{
+	if (!strcmp(map->protocol, "pulse_distance")) {
+		encode_pulse_distance(map, scancode, buf, length);
+		return true;
+	}
+
+	if (!strcmp(map->protocol, "pulse_length")) {
+		encode_pulse_length(map, scancode, buf, length);
+		return true;
+	}
+
+	if (!strcmp(map->protocol, "manchester")) {
+		encode_manchester(map, scancode, buf, length);
+		return true;
+	}
+
+	return false;
+}
diff --git a/utils/ir-ctl/bpf_encoder.h b/utils/ir-ctl/bpf_encoder.h
new file mode 100644
index 00000000..5d1d43a9
--- /dev/null
+++ b/utils/ir-ctl/bpf_encoder.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __BPF_ENCODER_H
+#define __BPF_ENCODER_H
+
+bool encode_bpf_protocol(struct keymap *map, uint32_t scancode, int *buf, int *length);
+
+#endif
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 94a22043..586461ac 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -17,6 +17,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdbool.h>
+#include <stdint.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
@@ -31,6 +32,7 @@
 
 #include "ir-encode.h"
 #include "keymap.h"
+#include "bpf_encoder.h"
 
 #ifdef ENABLE_NLS
 # define _(string) gettext(string)
@@ -754,28 +756,39 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 		}
 
 		for (se = map->scancode; se; se = se->next) {
+			int buf[LIRCBUF_SIZE], length;
+			const char *proto_str;
+			enum rc_proto proto;
+
 			if (strcmp(se->keycode, keycode))
 				continue;
 
 			count++;
 
-			if (!s) {
-				const char *proto_str;
-				enum rc_proto proto;
-
-				proto_str = map->variant ?: map->protocol;
+			if (s)
+				continue;
 
-				if (!protocol_match(proto_str, &proto)) {
-					fprintf(stderr, _("error: protocol '%s' not suppoted\n"), proto_str);
-					return NULL;
-				}
+			proto_str = map->variant ?: map->protocol;
 
+			if (protocol_match(proto_str, &proto)) {
 				s = malloc(sizeof(*s));
 				s->protocol = proto;
 				s->scancode = se->scancode;
 				s->is_scancode = true;
 				s->is_keycode = false;
 				s->next = NULL;
+			} else if (encode_bpf_protocol(map, se->scancode,
+						       buf, &length)) {
+				s = malloc(sizeof(*s) + sizeof(int) * length);
+				s->len = length;
+				memcpy(s->buf, buf, length * sizeof(int));
+				s->is_scancode = false;
+				s->is_keycode = false;
+				s->carrier = keymap_param(map, "carrier", 0);
+				s->next = NULL;
+			} else {
+				fprintf(stderr, _("error: protocol '%s' not supported\n"), proto_str);
+				return NULL;
 			}
 		}
 	}
-- 
2.21.0

