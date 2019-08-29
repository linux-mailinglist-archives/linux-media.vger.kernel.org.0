Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A795A1F34
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 17:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfH2PbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 11:31:21 -0400
Received: from gofer.mess.org ([88.97.38.141]:41985 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfH2PbV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 11:31:21 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C96CA605E4; Thu, 29 Aug 2019 16:31:19 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: warn if keycode has multiple definitions
Date:   Thu, 29 Aug 2019 16:31:19 +0100
Message-Id: <20190829153119.14420-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 52 ++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 28d8d97a..e884b4f8 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -727,17 +727,22 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 	return 0;
 }
 
-// FIXME: keymaps can have multiple definitions of the same keycode
 static struct send* convert_keycode(struct keymap *map, const char *keycode)
 {
-	struct send *s;
+	struct send *s = NULL;
+	int count = 0;
+
+	for (;map; map = map->next) {
+		struct scancode_entry *se;
+		struct raw_entry *re;
 
-	while (map) {
-		struct raw_entry *re = map->raw;
-		struct scancode_entry *se = map->scancode;
+		for (re = map->raw; re; re = re->next) {
+			if (strcmp(re->keycode, keycode))
+				continue;
 
-		while (re) {
-			if (!strcmp(re->keycode, keycode)) {
+			count++;
+
+			if (!s) {
 				s = malloc(sizeof(*s) + re->raw_length * sizeof(int));
 				s->len = re->raw_length;
 				memcpy(s->buf, re->raw, s->len * sizeof(int));
@@ -745,17 +750,18 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 				s->is_keycode = false;
 				s->carrier = keymap_param(map, "carrier", 0);
 				s->next = NULL;
-
-				return s;
 			}
-
-			re = re->next;
 		}
 
-		while (se) {
-			if (!strcmp(se->keycode, keycode)) {
-				enum rc_proto proto;
+		for (se = map->scancode; se; se = se->next) {
+			if (strcmp(se->keycode, keycode))
+				continue;
+
+			count++;
+
+			if (!s) {
 				const char *proto_str;
+				enum rc_proto proto;
 
 				proto_str = map->variant ?: map->protocol;
 
@@ -770,17 +776,19 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 				s->is_scancode = true;
 				s->is_keycode = false;
 				s->next = NULL;
-
-				return s;
 			}
-
-			se = se->next;
 		}
+	}
 
-		map = map->next;
+	if (!s) {
+		fprintf(stderr, _("error: keycode `%s' not found in keymap\n"), keycode);
+		return NULL;
 	}
 
-	return NULL;
+	if (count > 1)
+		fprintf(stderr, _("warning: keycode `%s' has %d definitions in keymaps, using first\n"), keycode, count);
+
+	return s;
 }
 
 static const struct argp argp = {
@@ -1022,10 +1030,8 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct s
 		}
 
 		f = convert_keycode(map, keycode);
-		if (!f) {
-			fprintf(stderr, _("error: keycode `%s' not found in keymap\n"), keycode);
+		if (!f)
 			return EX_DATAERR;
-		}
 	}
 
 	if (f->is_scancode) {
-- 
2.21.0

