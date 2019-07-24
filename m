Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEBD7286B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 08:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGXGnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 02:43:07 -0400
Received: from gofer.mess.org ([88.97.38.141]:43613 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbfGXGnH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 02:43:07 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 449A4604C0; Wed, 24 Jul 2019 07:43:05 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: show user how scancodes should be presented
Date:   Wed, 24 Jul 2019 07:43:05 +0100
Message-Id: <20190724064305.25949-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently ir-ctl just says the scancode is invalid, which is not
very clear.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c | 66 ++++++++++++++++++++++++++++++++--------
 utils/common/ir-encode.h |  2 +-
 utils/ir-ctl/ir-ctl.c    | 10 ++----
 3 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index 93c88501..47e294b1 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -21,6 +21,7 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <ctype.h>
+#include <stdio.h>
 
 #include <linux/lirc.h>
 
@@ -427,22 +428,61 @@ unsigned protocol_scancode_mask(enum rc_proto proto)
 	return protocols[proto].scancode_mask;
 }
 
-bool protocol_scancode_valid(enum rc_proto p, unsigned s)
+void protocol_scancode_valid(enum rc_proto *p, unsigned *s)
 {
-	if (s & ~protocols[p].scancode_mask)
-		return false;
-
-	if (p == RC_PROTO_NECX) {
-		return (((s >> 16) ^ ~(s >> 8)) & 0xff) != 0;
-	} else if (p == RC_PROTO_NEC32) {
-		return (((s >> 24) ^ ~(s >> 16)) & 0xff) != 0;
-	} else if (p == RC_PROTO_RC6_MCE) {
-		return (s & 0xffff0000) == 0x800f0000;
-	} else if (p == RC_PROTO_RC6_6A_32) {
-		return (s & 0xffff0000) != 0x800f0000;
+	enum rc_proto p2 = *p;
+	unsigned s2 = *s;
+
+	// rc6_mce is rc6_6a_32 with vendor code 0x800f and
+	if (*p == RC_PROTO_RC6_MCE && (*s & 0xffff0000) != 0x800f0000) {
+		p2 = RC_PROTO_RC6_6A_32;
+	} else if (*p == RC_PROTO_RC6_6A_32 && (*s & 0xffff0000) == 0x800f0000) {
+		p2 = RC_PROTO_RC6_MCE;
+	} else if (*p == RC_PROTO_NEC || *p == RC_PROTO_NECX || *p == RC_PROTO_NEC32) {
+		// nec scancodes may repeat the address and command
+		// in inverted form; the inverted values are not in the
+		// scancode.
+
+		// can 24 bit scancode be represented as 16 bit scancode
+		if (*s > 0x0000ffff && *s <= 0x00ffffff) {
+			if ((((*s >> 16) ^ ~(*s >> 8)) & 0xff) != 0) {
+				// is it necx
+				p2 = RC_PROTO_NECX;
+			} else {
+				// or regular nec
+				s2 = ((*s >> 8) & 0xff00) | (*s & 0x00ff);
+				p2 = RC_PROTO_NEC;
+			}
+		// can 32 bit scancode be represented as 24 or 16 bit scancode
+		} else if (*s > 0x00ffffff) {
+			if (((((*s >> 24) ^ ~(*s >> 16)) & 0xff) == 0) &&
+			    ((((*s >> 8) ^ ~(*s >> 0)) & 0xff) == 0)) {
+				// is it nec
+				s2 = ((*s >> 16) & 0xff00) |
+				     ((*s >> 8) & 0x00ff);
+				p2 = RC_PROTO_NEC;
+			} else if (((((*s >> 24) ^ ~(*s >> 16)) & 0xff) != 0) &&
+			    ((((*s >> 8) ^ ~(*s >> 0)) & 0xff) == 0)) {
+				// is it nec-x
+				s2 = (*s >> 8) & 0xffffff;
+				p2 = RC_PROTO_NECX;
+			} else {
+				// or it has to be nec32
+				p2 = RC_PROTO_NEC32;
+			}
+		}
 	}
 
-	return true;
+	s2 &= protocols[p2].scancode_mask;
+
+	if (*p != p2 || *s != s2) {
+		fprintf(stderr,
+			"warning: `%s:0x%x' will be decoded as `%s:0x%x'\n",
+			protocol_name(*p), *s, protocol_name(p2), s2);
+
+		*p = p2;
+		*s = s2;
+	}
 }
 
 bool protocol_encoder_available(enum rc_proto proto)
diff --git a/utils/common/ir-encode.h b/utils/common/ir-encode.h
index 7202c2d8..df595354 100644
--- a/utils/common/ir-encode.h
+++ b/utils/common/ir-encode.h
@@ -7,7 +7,7 @@
 bool protocol_match(const char *name, enum rc_proto *proto);
 unsigned protocol_carrier(enum rc_proto proto);
 unsigned protocol_max_size(enum rc_proto proto);
-bool protocol_scancode_valid(enum rc_proto proto, unsigned scancode);
+void protocol_scancode_valid(enum rc_proto *proto, unsigned *scancode);
 unsigned protocol_scancode_mask(enum rc_proto proto);
 bool protocol_encoder_available(enum rc_proto proto);
 unsigned protocol_encode(enum rc_proto proto, unsigned scancode, unsigned *buf);
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 03c2791d..82ac0dee 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -265,10 +265,7 @@ static struct file *read_file(struct arguments *args, const char *fname)
 				return NULL;
 			}
 
-			if (!protocol_scancode_valid(proto, scancode)) {
-				fprintf(stderr, _("error: %s:%d: invalid scancode '%s' for protocol '%s'\n"), fname, lineno, scancodestr, protocol_name(proto));
-				return NULL;
-			}
+			protocol_scancode_valid(&proto, &scancode);
 
 			if (len + protocol_max_size(proto) >= LIRCBUF_SIZE) {
 				fprintf(stderr, _("error: %s:%d: too much IR for one transmit\n"), fname, lineno);
@@ -380,10 +377,7 @@ static struct file *read_scancode(const char *name)
 		return NULL;
 	}
 
-	if (!protocol_scancode_valid(proto, scancode)) {
-		fprintf(stderr, _("error: invalid scancode '%s' for protocol '%s'\n"), p + 1, protocol_name(proto));
-		return NULL;
-	}
+	protocol_scancode_valid(&proto, &scancode);
 
 	f = malloc(sizeof(*f));
 	if (f == NULL) {
-- 
2.21.0

