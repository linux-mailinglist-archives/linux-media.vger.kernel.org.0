Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC5302AC41
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 23:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfEZVJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 17:09:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:38703 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfEZVJm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 17:09:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2427B602BB; Sun, 26 May 2019 22:09:40 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 2/2] keytable: add xbox-dvd protocol to match kernel
Date:   Sun, 26 May 2019 22:09:39 +0100
Message-Id: <20190526210939.29849-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526210939.29849-1-sean@mess.org>
References: <20190526210939.29849-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the bpf protocol to match. Now we can use the generated keymap
for the XBox DVD remote.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c                      |  1 +
 utils/keytable/bpf_protocols/Makefile.am      |  2 +-
 .../bpf_protocols/{xbox.c => xbox-dvd.c}      |  2 +-
 utils/keytable/keytable.c                     |  4 ++-
 utils/keytable/rc_keymaps/xbox_dvd.toml       |  4 +--
 .../rc_keymaps_userspace/xbox_dvd.toml        | 31 -------------------
 6 files changed, 8 insertions(+), 36 deletions(-)
 rename utils/keytable/bpf_protocols/{xbox.c => xbox-dvd.c} (99%)
 delete mode 100644 utils/keytable/rc_keymaps_userspace/xbox_dvd.toml

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index 4bd1b694..93c88501 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -375,6 +375,7 @@ static const struct {
 	[RC_PROTO_RCMM12] = { "rc-mm-12", 0x0fff },
 	[RC_PROTO_RCMM24] = { "rc-mm-24", 0xffffff },
 	[RC_PROTO_RCMM32] = { "rc-mm-32", 0xffffffff },
+	[RC_PROTO_XBOX_DVD] = { "xbox-dvd", 0xfff },
 };
 
 static bool str_like(const char *a, const char *b)
diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
index 123b64ec..bca3bdec 100644
--- a/utils/keytable/bpf_protocols/Makefile.am
+++ b/utils/keytable/bpf_protocols/Makefile.am
@@ -10,7 +10,7 @@ CLANG_SYS_INCLUDES := $(shell $(CLANG) -v -E - </dev/null 2>&1 \
 %.o: %.c bpf_helpers.h
 	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -O2 -c $<
 
-PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox.o imon_rsc.o
+PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o
 
 all: $(PROTOCOLS)
 
diff --git a/utils/keytable/bpf_protocols/xbox.c b/utils/keytable/bpf_protocols/xbox-dvd.c
similarity index 99%
rename from utils/keytable/bpf_protocols/xbox.c
rename to utils/keytable/bpf_protocols/xbox-dvd.c
index e48e0a79..91b7d02e 100644
--- a/utils/keytable/bpf_protocols/xbox.c
+++ b/utils/keytable/bpf_protocols/xbox-dvd.c
@@ -51,7 +51,7 @@ static inline int eq_margin(unsigned d1, unsigned d2)
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("xbox")
+SEC("xbox-dvd")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index daf82c0e..bf5e2c6f 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -128,6 +128,7 @@ enum sysfs_protocols {
 	SYSFS_CEC		= (1 << 13),
 	SYSFS_IMON		= (1 << 14),
 	SYSFS_RCMM		= (1 << 15),
+	SYSFS_XBOX_DVD		= (1 << 16),
 	SYSFS_INVALID		= 0,
 };
 
@@ -163,6 +164,7 @@ const struct protocol_map_entry protocol_map[] = {
 	{ "cec",	NULL,		SYSFS_CEC	},
 	{ "imon",	NULL,		SYSFS_IMON	},
 	{ "rc-mm",	NULL,		SYSFS_RCMM	},
+	{ "xbox-dvd",	NULL,		SYSFS_XBOX_DVD	},
 	{ NULL,		NULL,		SYSFS_INVALID	},
 };
 
@@ -1621,7 +1623,7 @@ static void print_scancodes(const struct lirc_scancode *scancodes, unsigned coun
 {
 	unsigned i;
 
-	for (i=0; i< count; i++) {
+	for (i = 0; i < count; i++) {
 		const char *p = protocol_name(scancodes[i].rc_proto);
 
 		printf(_("%llu.%06llu: "),
diff --git a/utils/keytable/rc_keymaps/xbox_dvd.toml b/utils/keytable/rc_keymaps/xbox_dvd.toml
index 77863542..16f7bdd5 100644
--- a/utils/keytable/rc_keymaps/xbox_dvd.toml
+++ b/utils/keytable/rc_keymaps/xbox_dvd.toml
@@ -1,6 +1,6 @@
 [[protocols]]
-name = "XBox DVD"
-protocol = "xbox"
+name = "xbox_dvd"
+protocol = "xbox_dvd"
 [protocols.scancodes]
 0xa0b = "KEY_OK"
 0xaa6 = "KEY_UP"
diff --git a/utils/keytable/rc_keymaps_userspace/xbox_dvd.toml b/utils/keytable/rc_keymaps_userspace/xbox_dvd.toml
deleted file mode 100644
index 77863542..00000000
--- a/utils/keytable/rc_keymaps_userspace/xbox_dvd.toml
+++ /dev/null
@@ -1,31 +0,0 @@
-[[protocols]]
-name = "XBox DVD"
-protocol = "xbox"
-[protocols.scancodes]
-0xa0b = "KEY_OK"
-0xaa6 = "KEY_UP"
-0xaa7 = "KEY_DOWN"
-0xaa8 = "KEY_RIGHT"
-0xaa9 = "KEY_LEFT"
-0xac3 = "KEY_INFO"
-0xac6 = "KEY_9"
-0xac7 = "KEY_8"
-0xac8 = "KEY_7"
-0xac9 = "KEY_6"
-0xaca = "KEY_5"
-0xacb = "KEY_4"
-0xacc = "KEY_3"
-0xacd = "KEY_2"
-0xace = "KEY_1"
-0xacf = "KEY_0"
-0xad5 = "KEY_ANGLE"
-0xad8 = "KEY_BACK"
-0xadd = "KEY_PREVIOUSSONG"
-0xadf = "KEY_NEXTSONG"
-0xae0 = "KEY_STOP"
-0xae2 = "KEY_REWIND"
-0xae3 = "KEY_FASTFORWARD"
-0xae5 = "KEY_TITLE"
-0xae6 = "KEY_PAUSE"
-0xaea = "KEY_PLAY"
-0xaf7 = "KEY_MENU"
-- 
2.20.1

