Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B607B813
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 04:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbfGaC5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 22:57:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:58255 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbfGaC5E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 22:57:04 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 061886055F; Wed, 31 Jul 2019 03:57:01 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v4l-utils] keytable: check keymaps
Date:   Wed, 31 Jul 2019 03:57:01 +0100
Message-Id: <20190731025701.3420-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/Makefile.am |  3 +++
 utils/keytable/keytable.c  | 40 +++++++++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index 148b9446..0a8f5936 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -20,6 +20,9 @@ endif
 
 EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
 
+check:
+	@$(foreach keymap,$(wildcard $(keytablesystem_DATA)),./ir-keytable --test-keymap=$(keymap);)
+
 # custom target
 install-data-local:
 	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 55d52945..573989eb 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -262,6 +262,7 @@ static const struct argp_option options[] = {
 	{"delay",	'D',	N_("DELAY"),	0,	N_("Sets the delay before repeating a keystroke"), 0},
 	{"period",	'P',	N_("PERIOD"),	0,	N_("Sets the period to repeat a keystroke"), 0},
 	{"auto-load",	'a',	N_("CFGFILE"),	0,	N_("Auto-load keymaps, based on a configuration file. Only works with --sysdev."), 0},
+	{"test-keymap",	1,	N_("KEYMAP"),	0,	N_("Test if keymap is valid"), 0},
 	{"help",        '?',	0,		0,	N_("Give this help list"), -1},
 	{"usage",	-3,	0,		0,	N_("Give a short usage message")},
 	{"version",	'V',	0,		0,	N_("Print program version"), -1},
@@ -278,6 +279,7 @@ int debug = 0;
 static int test = 0;
 static int delay = -1;
 static int period = -1;
+static int test_keymap = 0;
 static enum sysfs_protocols ch_proto = 0;
 
 struct bpf_protocol {
@@ -421,7 +423,7 @@ static error_t parse_plain_keyfile(char *fname, char **table)
 
 						protocol = parse_sysfs_protocol(p, false);
 						if (protocol == SYSFS_INVALID) {
-							fprintf(stderr, _("Protocol %s invalid\n"), p);
+							fprintf(stderr, _("%s: protocol %s invalid\n"), fname, p);
 							goto err_einval;
 						}
 						ch_proto |= protocol;
@@ -484,7 +486,7 @@ err_einval:
 	return EINVAL;
 }
 
-static error_t parse_toml_protocol(struct toml_table_t *proot)
+static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot)
 {
 	struct toml_table_t *scancodes;
 	enum sysfs_protocols protocol;
@@ -494,12 +496,12 @@ static error_t parse_toml_protocol(struct toml_table_t *proot)
 
 	raw = toml_raw_in(proot, "protocol");
 	if (!raw) {
-		fprintf(stderr, _("protocol missing\n"));
+		fprintf(stderr, _("%s: protocol missing\n"), fname);
 		return EINVAL;
 	}
 
 	if (toml_rtos(raw, &p)) {
-		fprintf(stderr, _("Bad value `%s' for protocol\n"), raw);
+		fprintf(stderr, _("%s: bad value `%s' for protocol\n"), fname, raw);
 		return EINVAL;
 	}
 
@@ -520,7 +522,7 @@ static error_t parse_toml_protocol(struct toml_table_t *proot)
 	scancodes = toml_table_in(proot, "scancodes");
 	if (!scancodes) {
 		if (debug)
-			fprintf(stderr, _("No [protocols.scancodes] section\n"));
+			fprintf(stderr, _("%s: no [protocols.scancodes] section\n"), fname);
 		return 0;
 	}
 
@@ -536,13 +538,13 @@ static error_t parse_toml_protocol(struct toml_table_t *proot)
 
 		raw = toml_raw_in(scancodes, scancode);
 		if (!raw) {
-			fprintf(stderr, _("Invalid value `%s'\n"), scancode);
+			fprintf(stderr, _("%s: invalid value `%s'\n"), fname, scancode);
 			return EINVAL;
 		}
 
 		if (toml_rtos(raw, &keycode)) {
-			fprintf(stderr, _("Bad value `%s' for keycode\n"),
-				keycode);
+			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
+				fname, keycode);
 			return EINVAL;
 		}
 
@@ -556,7 +558,7 @@ static error_t parse_toml_protocol(struct toml_table_t *proot)
 		if (value == -1) {
 			value = strtol(keycode, &p, 0);
 			if (errno || *p)
-				fprintf(stderr, _("keycode `%s' not recognised, no mapping for scancode %s\n"), keycode, scancode);
+				fprintf(stderr, _("%s: keycode `%s' not recognised, no mapping for scancode %s\n"), fname, keycode, scancode);
 		}
 		free(keycode);
 
@@ -595,13 +597,13 @@ static error_t parse_toml_keyfile(char *fname, char **table)
 	root = toml_parse_file(fin, buf, sizeof(buf));
 	fclose(fin);
 	if (!root) {
-		fprintf(stderr, _("Failed to parse toml: %s\n"), buf);
+		fprintf(stderr, _("%s: failed to parse toml: %s\n"), fname, buf);
 		return EINVAL;
 	}
 
 	arr = toml_array_in(root, "protocols");
 	if (!arr) {
-		fprintf(stderr, _("Missing [protocols] section\n"));
+		fprintf(stderr, _("%s: missing [protocols] section\n"), fname);
 		return EINVAL;
 	}
 
@@ -610,7 +612,7 @@ static error_t parse_toml_keyfile(char *fname, char **table)
 		if (!proot)
 			break;
 
-		ret = parse_toml_protocol(proot);
+		ret = parse_toml_protocol(fname, proot);
 		if (ret)
 			goto out;
 
@@ -618,11 +620,11 @@ static error_t parse_toml_keyfile(char *fname, char **table)
 	}
 
 	if (i == 0) {
-		fprintf(stderr, _("No protocols found\n"));
+		fprintf(stderr, _("%s: no protocols found\n"), fname);
 		goto out;
 	}
 
-	// Don't free toml, this is used during bpf loading */
+	// Don't free toml, this is used during bpf loading
 	//toml_free(root);
 	return 0;
 out:
@@ -871,7 +873,14 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 			p = strtok(NULL, ":=");
 		} while (p);
 		break;
+	case 1:
+		test_keymap++;
+		char *name = NULL;
 
+		rc = parse_keyfile(arg, &name);
+		if (rc)
+			argp_error(state, _("Failed to read table file %s"), arg);
+		break;
 	case '?':
 		argp_state_help(state, state->out_stream,
 				ARGP_HELP_SHORT_USAGE | ARGP_HELP_LONG
@@ -2121,6 +2130,9 @@ int main(int argc, char *argv[])
 
 	argp_parse(&argp, argc, argv, ARGP_NO_HELP, 0, 0);
 
+	if (test_keymap)
+		return 0;
+
 	/* Just list all devices */
 	if (!clear && !readtable && !keytable && !ch_proto && !cfg.next && !test && delay < 0 && period < 0 && !bpf_protocol) {
 		if (show_sysfs_attribs(&rc_dev, devclass))
-- 
2.21.0

