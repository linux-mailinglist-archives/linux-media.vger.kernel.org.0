Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B03646A3CA
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 19:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346526AbhLFSKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 13:10:14 -0500
Received: from gofer.mess.org ([88.97.38.141]:57015 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238530AbhLFSKN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Dec 2021 13:10:13 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 791E0C63C2; Mon,  6 Dec 2021 18:06:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638814003; bh=5UsiuUCw3vbuWHb3TEEmtbmhwrRimdqfPJQvlqrpC5g=;
        h=From:To:Cc:Subject:Date:From;
        b=bqpalmOKNiE6c0F8iRxZc3XgYeokbxpnGXh6lYIURHETReU36FBZ6pLUMaUGpawfa
         9pLdUGFGaY1v/PzNgKSkZgrFxU+LUfkjZvQRkk65fS0TYSWPJTIIghPfqsk0x6k0ro
         AI7YxbFboumqv/gABQxIGc93sDt5wluJ1Tec7zKJ8mCkhdgL1POEQ49zZ9kAGOF0uV
         dMhdWMjw2Ip93A1ep5W+HYbLXvoOjqAfhxiG1edKFFz0wZU88cnXDu0ZbBWJSGytMf
         zsE274ke9fJMDCjw5xBjnLLvMPFV89XGzDlXdcAlIt5gRGtrJNpbeVEPu/XPKg2rng
         nAvfhESXtTe3A==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= 
        <vrserver1@gmail.com>
Subject: [PATCH v4l-utils] ir-ctl: allow for different gaps to be specified
Date:   Mon,  6 Dec 2021 18:06:43 +0000
Message-Id: <20211206180643.2690-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For example:

ir-ctl --send=part1 --gap=10000 --send=part2 --gap=20000 --send=part3

This would introduce a gap of 10000 microseconds between part1 and
part2, and 20000 microseconds between part2 and part3.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 122 +++++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 62 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 34cde11e..c3a34d3f 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -66,14 +66,19 @@
 const char *argp_program_version = "IR ctl version " V4L_UTILS_VERSION;
 const char *argp_program_bug_address = "Sean Young <sean@mess.org>";
 
+enum send_ty {
+	SEND_RAW,
+	SEND_SCANCODE,
+	SEND_KEYCODE,
+	SEND_GAP,
+};
 /*
  * Since this program drives the lirc interface, use the same terminology
  */
 struct send {
 	struct send *next;
 	const char *fname;
-	bool is_scancode;
-	bool is_keycode;
+	enum send_ty ty;
 	union {
 		struct {
 			unsigned carrier;
@@ -85,6 +90,7 @@ struct send {
 			unsigned protocol;
 		};
 		char	keycode[1];
+		int	gap;
 	};
 };
 
@@ -223,8 +229,7 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 		fprintf(stderr, _("Failed to allocate memory\n"));
 		return NULL;
 	}
-	f->is_scancode = false;
-	f->is_keycode = false;
+	f->ty = SEND_RAW;
 	f->carrier = UNSET;
 	f->fname = fname;
 
@@ -393,8 +398,7 @@ static struct send *read_file_raw(struct arguments *args, const char *fname, FIL
 		fclose(input);
 		return NULL;
 	}
-	f->is_scancode = false;
-	f->is_keycode = false;
+	f->ty = SEND_RAW;
 	f->carrier = UNSET;
 	f->fname = fname;
 
@@ -549,14 +553,32 @@ static struct send *read_scancode(const char *name)
 		return NULL;
 	}
 
-	f->is_scancode = true;
-	f->is_keycode = false;
+	f->ty = SEND_SCANCODE;
 	f->scancode = scancode;
 	f->protocol = proto;
 
 	return f;
 }
 
+static void add_to_send_list(struct arguments *arguments, struct send *send)
+{
+	send->next = NULL;
+
+	if (arguments->send == NULL)
+		arguments->send = send;
+	else {
+		// introduce gap
+		struct send *gap = malloc(sizeof(*gap));
+		gap->ty = SEND_GAP;
+		gap->gap = arguments->gap;
+		gap->next = send;
+
+		struct send *p = arguments->send;
+		while (p->next) p = p->next;
+		p->next = gap;
+	}
+}
+
 static error_t parse_opt(int k, char *arg, struct argp_state *state)
 {
 	struct arguments *arguments = state->input;
@@ -664,14 +686,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		if (s == NULL)
 			exit(EX_DATAERR);
 
-		s->next = NULL;
-		if (arguments->send == NULL)
-			arguments->send = s;
-		else {
-			struct send *p = arguments->send;
-			while (p->next) p = p->next;
-			p->next = s;
-		}
+		add_to_send_list(arguments, s);
 		break;
 	case 'S':
 		if (arguments->receive || arguments->features)
@@ -680,14 +695,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		if (s == NULL)
 			exit(EX_DATAERR);
 
-		s->next = NULL;
-		if (arguments->send == NULL)
-			arguments->send = s;
-		else {
-			struct send *p = arguments->send;
-			while (p->next) p = p->next;
-			p->next = s;
-		}
+		add_to_send_list(arguments, s);
 		break;
 
 	case 'K':
@@ -696,18 +704,10 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		s = malloc(sizeof(*s) + strlen(arg));
 		if (s == NULL)
 			exit(EX_DATAERR);
-
-		s->next = NULL;
 		strcpy(s->keycode, arg);
-		s->is_scancode = false;
-		s->is_keycode = true;
-		if (arguments->send == NULL)
-			arguments->send = s;
-		else {
-			struct send *p = arguments->send;
-			while (p->next) p = p->next;
-			p->next = s;
-		}
+		s->ty = SEND_KEYCODE;
+
+		add_to_send_list(arguments, s);
 		break;
 
 	case 'k':
@@ -757,8 +757,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 				s = malloc(sizeof(*s) + re->raw_length * sizeof(int));
 				s->len = re->raw_length;
 				memcpy(s->buf, re->raw, s->len * sizeof(int));
-				s->is_scancode = false;
-				s->is_keycode = false;
+				s->ty = SEND_RAW;
 				s->carrier = keymap_param(map, "carrier", 0);
 				s->next = NULL;
 			}
@@ -783,16 +782,14 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 				s = malloc(sizeof(*s));
 				s->protocol = proto;
 				s->scancode = se->scancode;
-				s->is_scancode = true;
-				s->is_keycode = false;
+				s->ty = SEND_SCANCODE;
 				s->next = NULL;
 			} else if (encode_bpf_protocol(map, se->scancode,
 						       buf, &length)) {
 				s = malloc(sizeof(*s) + sizeof(int) * length);
 				s->len = length;
 				memcpy(s->buf, buf, length * sizeof(int));
-				s->is_scancode = false;
-				s->is_keycode = false;
+				s->ty = SEND_RAW;
 				s->carrier = keymap_param(map, "carrier", 0);
 				s->next = NULL;
 			} else {
@@ -1049,7 +1046,7 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct s
 		return EX_UNAVAILABLE;
 	}
 
-	if (f->is_scancode) {
+	if (f->ty == SEND_SCANCODE) {
 		if (args->verbose)
 			printf("Sending to kernel encoder protocol:%s scancode:0x%x\n",
 			       protocol_name(f->protocol), f->scancode);
@@ -1075,7 +1072,7 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct s
 		return EX_UNAVAILABLE;
 	}
 
-	if (f->is_scancode) {
+	if (f->ty == SEND_SCANCODE) {
 		// encode scancode
 		enum rc_proto proto = f->protocol;
 		if (!protocol_encoder_available(proto)) {
@@ -1265,29 +1262,30 @@ int main(int argc, char *argv[])
 	struct send *s = args.send;
 	while (s) {
 		struct send *next = s->next;
-		if (s != args.send)
-			usleep(args.gap);
-
-		if (s->is_keycode) {
-			struct send *k;
+		if (s->ty == SEND_GAP) {
+			usleep(s->gap);
+		} else {
+			if (s->ty == SEND_KEYCODE) {
+				struct send *k;
 
-			if (!args.keymap) {
-				fprintf(stderr, _("error: no keymap specified\n"));
-				exit(EX_DATAERR);
-			}
+				if (!args.keymap) {
+					fprintf(stderr, _("error: no keymap specified\n"));
+					exit(EX_DATAERR);
+				}
 
-			k = convert_keycode(args.keymap, s->keycode);
-			if (!k)
-				exit(EX_DATAERR);
+				k = convert_keycode(args.keymap, s->keycode);
+				if (!k)
+					exit(EX_DATAERR);
 
-			free(s);
-			s = k;
-		}
+				free(s);
+				s = k;
+			}
 
-		rc = lirc_send(&args, fd, features, s);
-		if (rc) {
-			close(fd);
-			exit(rc);
+			rc = lirc_send(&args, fd, features, s);
+			if (rc) {
+				close(fd);
+				exit(rc);
+			}
 		}
 
 		free(s);
-- 
2.33.1

