Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0815E3A981C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 12:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhFPKwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 06:52:12 -0400
Received: from gofer.mess.org ([88.97.38.141]:58265 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231769AbhFPKwM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 06:52:12 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A2D03C634E; Wed, 16 Jun 2021 11:50:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1623840605; bh=/V1Kq008myJIOQLhdflgqyj8t8ybJDtTqI9vdorq45U=;
        h=From:To:Subject:Date:From;
        b=Z17I6cCpC8R4CtUGSw9jMxBuEXU9KwNiXjF1/jbr7RxwsYZluPw0HGGHMDRNPQcRW
         fLfSU+4iSjdPUsWEP9M14MhMsu9FEmtMEXVwXCO8oeK0sCFmgr3LG+NChbwZJzHMgU
         YaytNo1X/addnYLmoL2TbiJjGpqbmHNXYYqCpGwpqL/Ldyv650dcOVwnPi+ziSYI8K
         w3+Yexu1AXqnFRyrJNtWAFvbIB3qtt/EYLPN2mHOHXe0HzS+g/C62RtZ4OfLIu13VU
         We9qTOzt2vH1tpdWdb2cnVjjBdN0qcQTsRCZoJQx7PxEzpXgwA0iXgwMg5K5xuqy/2
         7eAVzO1eiCBXQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: ensure BPF IR decoders use correct section name
Date:   Wed, 16 Jun 2021 11:50:05 +0100
Message-Id: <20210616105005.28923-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The convention is to have the type ("lirc_mode2/") prefixed so the
BPF loader knows what type it is.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/bpf_load.c                     | 28 ++++++++++++++-----
 utils/keytable/bpf_protocols/grundig.c        |  6 ++--
 utils/keytable/bpf_protocols/imon_rsc.c       |  6 ++--
 utils/keytable/bpf_protocols/manchester.c     |  6 ++--
 utils/keytable/bpf_protocols/pulse_distance.c |  6 ++--
 utils/keytable/bpf_protocols/pulse_length.c   |  6 ++--
 utils/keytable/bpf_protocols/raw.c            |  8 +++---
 utils/keytable/bpf_protocols/rc_mm.c          |  6 ++--
 utils/keytable/bpf_protocols/samsung36.c      |  6 ++--
 utils/keytable/bpf_protocols/xbox-dvd.c       |  6 ++--
 10 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
index ec6eb98e..d444b70b 100644
--- a/utils/keytable/bpf_load.c
+++ b/utils/keytable/bpf_load.c
@@ -58,16 +58,24 @@ struct bpf_file {
 	int strtabidx;
 	Elf_Data *symbols;
 	struct protocol_param *param;
+	char name[128];
 };
 
 static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, struct bpf_insn *prog, int size)
 {
-        size_t insns_cnt = size / sizeof(struct bpf_insn);
+	struct bpf_load_program_attr load_attr;
 	int fd, err;
 
-	fd = bpf_load_program(BPF_PROG_TYPE_LIRC_MODE2, prog, insns_cnt,
-			      bpf_file->license, 0,
-			      bpf_log_buf, LOG_BUF_SIZE);
+	memset(&load_attr, 0, sizeof(struct bpf_load_program_attr));
+
+	load_attr.prog_type = BPF_PROG_TYPE_LIRC_MODE2;
+	load_attr.expected_attach_type = BPF_LIRC_MODE2;
+	load_attr.name = bpf_file->name;
+	load_attr.insns = prog;
+	load_attr.insns_cnt = size / sizeof(struct bpf_insn);
+	load_attr.license = bpf_file->license;
+
+	fd = bpf_load_program_xattr(&load_attr, bpf_log_buf, LOG_BUF_SIZE);
 	if (fd < 0) {
 		printf("bpf_load_program() err=%m\n%s", bpf_log_buf);
 		return -1;
@@ -78,6 +86,7 @@ static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, struct bpf_in
 		printf("bpf_prog_attach: err=%m\n");
 		return -1;
 	}
+
 	return 0;
 }
 
@@ -260,7 +269,7 @@ static int parse_relo_and_apply(struct bpf_file *bpf_file, GElf_Shdr *shdr,
 			}
 
 			if (match) {
-		                insn[insn_idx].src_reg = BPF_PSEUDO_MAP_FD;
+				insn[insn_idx].src_reg = BPF_PSEUDO_MAP_FD;
 				insn[insn_idx].imm = bpf_file->map_data[map_idx].fd;
 				continue;
 			}
@@ -427,7 +436,7 @@ static int load_elf_maps_section(struct bpf_file *bpf_file)
 }
 
 int load_bpf_file(const char *path, int lirc_fd, struct protocol_param *param,
-	          struct raw_entry *raw)
+		  struct raw_entry *raw)
 {
 	struct bpf_file bpf_file = { .param = param };
 	int fd, i, ret;
@@ -469,7 +478,7 @@ int load_bpf_file(const char *path, int lirc_fd, struct protocol_param *param,
 		if (strcmp(shname, "license") == 0) {
 			bpf_file.processed_sec[i] = true;
 			memcpy(bpf_file.license, data->d_buf, data->d_size);
-		} else if (strcmp(shname, "maps") == 0) {
+		} else if (strcmp(shname, "lirc_mode2/maps") == 0) {
 			int j;
 
 			bpf_file.maps_shidx = i;
@@ -530,6 +539,11 @@ int load_bpf_file(const char *path, int lirc_fd, struct protocol_param *param,
 			    !(shdr_prog.sh_flags & SHF_EXECINSTR))
 				continue;
 
+			if (strncmp(shname_prog, "lirc_mode2/", 11))
+				strncpy(bpf_file.name, shname_prog, sizeof(bpf_file.name) - 1);
+			else
+				strncpy(bpf_file.name, shname_prog + 11, sizeof(bpf_file.name) - 1);
+
 			insns = (struct bpf_insn *) data_prog->d_buf;
 			bpf_file.processed_sec[i] = true; /* relo section */
 
diff --git a/utils/keytable/bpf_protocols/grundig.c b/utils/keytable/bpf_protocols/grundig.c
index 4d8cc4b9..cdd551f9 100644
--- a/utils/keytable/bpf_protocols/grundig.c
+++ b/utils/keytable/bpf_protocols/grundig.c
@@ -22,7 +22,7 @@ struct decoder_state {
 	unsigned int last_space;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -44,9 +44,9 @@ int header_pulse = 900;
 int header_space = 2900;
 int leader_pulse = 1300;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
-SEC("grundig")
+SEC("lirc_mode2/grundig")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/imon_rsc.c b/utils/keytable/bpf_protocols/imon_rsc.c
index 14c4ec37..e163f217 100644
--- a/utils/keytable/bpf_protocols/imon_rsc.c
+++ b/utils/keytable/bpf_protocols/imon_rsc.c
@@ -19,7 +19,7 @@ struct decoder_state {
 	unsigned int count;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -34,14 +34,14 @@ struct bpf_map_def SEC("maps") decoder_state_map = {
 // actual value (either overridden or taken from the data segment).
 int margin = 325;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("imon_rsc")
+SEC("lirc_mode2/imon_rsc")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/manchester.c b/utils/keytable/bpf_protocols/manchester.c
index 94b53fd0..0310f37e 100644
--- a/utils/keytable/bpf_protocols/manchester.c
+++ b/utils/keytable/bpf_protocols/manchester.c
@@ -13,7 +13,7 @@ struct decoder_state {
 	unsigned long bits;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -41,7 +41,7 @@ int bits = 14;
 int scancode_mask = 0;
 int rc_protocol = 66;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
@@ -79,7 +79,7 @@ static int emitBit(unsigned int *sample, struct decoder_state *s, int bit, int s
 	return state;
 }
 
-SEC("manchester")
+SEC("lirc_mode2/manchester")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/pulse_distance.c b/utils/keytable/bpf_protocols/pulse_distance.c
index 9e9ea4ad..f2de8d27 100644
--- a/utils/keytable/bpf_protocols/pulse_distance.c
+++ b/utils/keytable/bpf_protocols/pulse_distance.c
@@ -22,7 +22,7 @@ struct decoder_state {
 	unsigned int count;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -49,14 +49,14 @@ int reverse = 0;
 int header_optional = 0;
 int rc_protocol = 64;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("pulse_distance")
+SEC("lirc_mode2/pulse_distance")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/pulse_length.c b/utils/keytable/bpf_protocols/pulse_length.c
index e33f0899..1c9e1948 100644
--- a/utils/keytable/bpf_protocols/pulse_length.c
+++ b/utils/keytable/bpf_protocols/pulse_length.c
@@ -22,7 +22,7 @@ struct decoder_state {
 	unsigned int count;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -49,14 +49,14 @@ int reverse = 0;
 int header_optional = 0;
 int rc_protocol = 67;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("pulse_length")
+SEC("lirc_mode2/pulse_length")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/raw.c b/utils/keytable/bpf_protocols/raw.c
index a0ee78b4..5084264d 100644
--- a/utils/keytable/bpf_protocols/raw.c
+++ b/utils/keytable/bpf_protocols/raw.c
@@ -27,7 +27,7 @@ struct decoder_state {
 	DECLARE_BITMAP(nomatch, MAX_PATTERNS);
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -40,7 +40,7 @@ struct raw_pattern {
 };
 
 // ir-keytable will load the raw patterns here
-struct bpf_map_def SEC("maps") raw_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") raw_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct raw_pattern), // this is not used
@@ -60,14 +60,14 @@ int rc_protocol = 68;
 int trail_space = 1000;
 int max_length = 1;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("raw")
+SEC("lirc_mode2/raw")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/rc_mm.c b/utils/keytable/bpf_protocols/rc_mm.c
index 034d39b9..117f7d62 100644
--- a/utils/keytable/bpf_protocols/rc_mm.c
+++ b/utils/keytable/bpf_protocols/rc_mm.c
@@ -21,7 +21,7 @@ struct decoder_state {
 	unsigned int count;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -37,7 +37,7 @@ struct bpf_map_def SEC("maps") decoder_state_map = {
 //
 // This is why they should be accessed through the BPF_PARAM() macro.
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 int margin = 100;
 int header_pulse = 417;
@@ -56,7 +56,7 @@ static inline int eq_margin(unsigned d1, unsigned d2)
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("rc_mm")
+SEC("lirc_mode2/rc_mm")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/samsung36.c b/utils/keytable/bpf_protocols/samsung36.c
index 1b09365f..a83137e4 100644
--- a/utils/keytable/bpf_protocols/samsung36.c
+++ b/utils/keytable/bpf_protocols/samsung36.c
@@ -26,7 +26,7 @@ struct decoder_state {
 	unsigned int count;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -42,14 +42,14 @@ struct bpf_map_def SEC("maps") decoder_state_map = {
 int margin = 300;
 int rc_protocol = 69;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("samsung36")
+SEC("lirc_mode2/samsung36")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
diff --git a/utils/keytable/bpf_protocols/xbox-dvd.c b/utils/keytable/bpf_protocols/xbox-dvd.c
index 18225453..c0b57a7c 100644
--- a/utils/keytable/bpf_protocols/xbox-dvd.c
+++ b/utils/keytable/bpf_protocols/xbox-dvd.c
@@ -21,7 +21,7 @@ struct decoder_state {
 	unsigned int count;
 };
 
-struct bpf_map_def SEC("maps") decoder_state_map = {
+struct bpf_map_def SEC("lirc_mode2/maps") decoder_state_map = {
 	.type = BPF_MAP_TYPE_ARRAY,
 	.key_size = sizeof(unsigned int),
 	.value_size = sizeof(struct decoder_state),
@@ -44,14 +44,14 @@ int trailer_pulse = 550;
 int bits = 24;
 int rc_protocol = 68;
 
-#define BPF_PARAM(x) (int)(&(x))
+#define BPF_PARAM(x) (int)(long)(&(x))
 
 static inline int eq_margin(unsigned d1, unsigned d2)
 {
 	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
 }
 
-SEC("xbox_dvd")
+SEC("lirc_mode2/xbox_dvd")
 int bpf_decoder(unsigned int *sample)
 {
 	unsigned int key = 0;
-- 
2.31.1

