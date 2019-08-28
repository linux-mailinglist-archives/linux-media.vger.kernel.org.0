Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5217A07FF
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 19:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfH1RCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 13:02:39 -0400
Received: from gofer.mess.org ([88.97.38.141]:37011 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbfH1RCj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 13:02:39 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7946C60665; Wed, 28 Aug 2019 18:02:37 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: support raw format by default
Date:   Wed, 28 Aug 2019 18:02:37 +0100
Message-Id: <20190828170237.26948-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When "ir-ctl -r" outputs data it prints one line per space and pulse. This
is not very space efficient and long protocols like rc-6 are unlikely to
fit on the screen.

The new format is much more compact. A single IR message is printed on a
single line. The pulse is prefixed with an optional + and a space is
prefixed with -.

The rc-5 example from the man page becomes:

$ ir-ctl -r
+889 -889 +1778 -1778 +889 -889 +889 -889 +889 -889 +1778 -889 +889 -889 +889 -889 +889 -889 +889 -889 +889 -1778 +889 # timeout 133889

The old behaviour can be resurrected with: ir-ctl -r --mode2

This commit also add support for sending the same format.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/keymap.c    |   8 +-
 utils/ir-ctl/ir-ctl.1.in |  36 +++---
 utils/ir-ctl/ir-ctl.c    | 241 ++++++++++++++++++++++++++++++++-------
 3 files changed, 228 insertions(+), 57 deletions(-)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index 9ca599a0..19d63661 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -272,19 +272,23 @@ static error_t parse_toml_raw_part(const char *fname, struct toml_array_t *raw,
 		if (!traw) {
 			fprintf(stderr, _("%s: missing raw value for entry %d\n"),
 				fname, ind);
+			free(keycode);
 			return EINVAL;
 		}
 
 		if (toml_rtos(traw, &raw_str)) {
 			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
 				fname, traw);
+			free(keycode);
 			return EINVAL;
 		}
 
-		if (parse_rawir_string(fname, raw_str, &re))
+		if (parse_rawir_string(fname, raw_str, &re)) {
+			free(keycode);
 			return EINVAL;
+		}
 
-		re->keycode = strdup(keycode);
+		re->keycode = keycode;
 		re->next = map->raw;
 		map->raw = re;
 	}
diff --git a/utils/ir-ctl/ir-ctl.1.in b/utils/ir-ctl/ir-ctl.1.in
index 7564066a..4b599418 100644
--- a/utils/ir-ctl/ir-ctl.1.in
+++ b/utils/ir-ctl/ir-ctl.1.in
@@ -9,7 +9,7 @@ ir\-ctl \- a swiss\-knife tool to handle raw IR and to set lirc options
 [\fIOPTION\fR]... \fI\-\-features\fR
 .br
 .B ir\-ctl
-[\fIOPTION\fR]... \fI\-\-send\fR [\fIpulse and space file to send\fR]
+[\fIOPTION\fR]... \fI\-\-send\fR [\fIfile to send\fR]
 .br
 .B ir\-ctl
 [\fIOPTION\fR]... \fI\-\-scancode\fR [\fIprotocol and scancode to send\fR]
@@ -58,13 +58,16 @@ in\-order with a 125ms gap between them. The gap length can be modified
 with \fB\-\-gap\fR.
 .TP
 \fB-k\fR, \fB\-\-keymap\fR=\fIKEYMAP\fR
-The rc keymap in toml format. The format is described in the rc_keymap(5)
-man page.
+The rc keymap file in toml format. The format is described in the rc_keymap(5)
+man page. This file is used to select the \fBKEYCODE\fR from.
 .TP
 \fB\-1\fR, \fB\-\-oneshot\fR
 When receiving, stop receiving after the first message, i.e. after a space or
 timeout of more than 19ms is received.
 .TP
+\fB\-\-mode2\fR
+When receiving, output IR in mode2 format. One line per space or pulse.
+.TP
 \fB\-w\fR, \fB\-\-wideband\fR
 Use the wideband receiver if available on the hardware. This is also
 known as learning mode. The measurements should be more precise and any
@@ -118,14 +121,17 @@ Verbose output; this prints the IR before sending.
 \fB\-V\fR, \fB\-\-version\fR
 print the v4l2\-utils version
 .PP
-.SS Format of pulse and space file
-When sending IR, the format of the file should be as follows. A comment
-starts with #. The carrier frequency can be specified as:
+.SS Format of file
+When sending or receiving raw IR, two formats can be used. The first is
+a list of integers representing pulse and space values. A pulse value can be
+prefixed with + and a space with -, but this is optional. The rc-5 scancode
+0x1e01 is encoded so:
 .PP
-	carrier 38000
++889 -889 +1778 -1778 +889 -889 +889 -889 +889 -889 +1778 -889 +889 -889 +889 -889 +889 -889 +889 -889 +889 -1778 +889
 .PP
-The file should contain alternating lines with pulse and space, followed
-by length in microseconds. The following is a rc-5 encoded message:
+The other format mimics the mode2 tool. This produces one line per space
+or pulse. For receiving it can selected by specifying \fB\-\-mode2\fR. Here is
+the same message as above, now encoded in mode2:
 .PP
 	carrier 36000
 .br
@@ -175,9 +181,13 @@ by length in microseconds. The following is a rc-5 encoded message:
 .br
 	pulse 840
 .PP
-Rather than specifying the raw IR, you can also specify the scancode and
-protocol you want to send. This will also automatically set the correct
-carrier. The above can be written as:
+Note that in this format, the carrier can also be specified. This can only
+by done with a separate \fB\-\-carrier=38000\fR command line option with
+the first format.
+.PP
+Rather than specifying just the raw IR, in this format you can also specify
+the scancode and protocol you want to send. This will also automatically set
+the correct carrier. The above can be written as:
 .PP
 	scancode rc5:0x1e01
 .PP
@@ -244,7 +254,7 @@ To send the rc-5 hauppauge '1' scancode:
 .PP
 To send the rc-5 hauppauage '1' key from the hauppauge keymap:
 .br
-	\fBir\-ctl -k hauppauge.toml -K KEY_NUMERIC_0\fR
+	\fBir\-ctl -k hauppauge.toml -K KEY_NUMERIC_1\fR
 .SH BUGS
 Report bugs to \fBLinux Media Mailing List <linux-media@vger.kernel.org>\fR
 .SH COPYRIGHT
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 837dffef..d6f945e2 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -64,8 +64,8 @@ const char *argp_program_bug_address = "Sean Young <sean@mess.org>";
 /*
  * Since this program drives the lirc interface, use the same terminology
  */
-struct file {
-	struct file *next;
+struct send {
+	struct send *next;
 	const char *fname;
 	bool is_scancode;
 	bool is_keycode;
@@ -88,8 +88,9 @@ struct arguments {
 	bool features;
 	bool receive;
 	bool verbose;
+	bool mode2;
 	struct keymap *keymap;
-	struct file *send;
+	struct send *send;
 	bool oneshot;
 	char *savetofile;
 	int wideband;
@@ -113,6 +114,7 @@ static const struct argp_option options[] = {
 	{ "verbose",	'v',	0,		0,	N_("verbose output") },
 		{ .doc = N_("Receiving options:") },
 	{ "one-shot",	'1',	0,		0,	N_("end receiving after first message") },
+	{ "mode2",	2,	0,		0,	N_("output in mode2 format") },
 	{ "wideband",	'w',	0,		0,	N_("use wideband receiver aka learning mode") },
 	{ "narrowband",	'n',	0,		0,	N_("use narrowband receiver, disable learning mode") },
 	{ "carrier-range", 'R', N_("RANGE"),	0,	N_("set receiver carrier range") },
@@ -145,7 +147,7 @@ static const char doc[] = N_(
 	"  CARRIER  - the carrier frequency to use for sending\n"
 	"  DUTY     - the duty cycle to use for sending\n"
 	"  EMITTERS - comma separated list of emitters to use for sending, e.g. 1,2\n"
-	"  GAP      - gap between pulse and files or scancodes in microseconds\n"
+	"  GAP      - gap between sending in microseconds\n"
 	"  RANGE    - set range of accepted carrier frequencies, e.g. 20000-40000\n"
 	"  TIMEOUT  - set length of space before receiving stops in microseconds\n"
 	"  KEYCODE  - key code in keymap\n"
@@ -201,21 +203,14 @@ static unsigned parse_emitters(char *p)
 	return emit;
 }
 
-static struct file *read_file(struct arguments *args, const char *fname)
+static struct send *read_file_pulse_space(struct arguments *args, const char *fname, FILE *input)
 {
 	bool expect_pulse = true;
 	int lineno = 0, lastspace = 0;
 	char line[1024];
 	int len = 0;
-	static const char *whitespace = " \n\r\t";
-	struct file *f;
-
-	FILE *input = fopen(fname, "r");
-
-	if (!input) {
-		fprintf(stderr, _("%s: could not open: %m\n"), fname);
-		return NULL;
-	}
+	static const char whitespace[] = " \n\r\t";
+	struct send *f;
 
 	f = malloc(sizeof(*f));
 	if (f == NULL) {
@@ -360,10 +355,145 @@ static struct file *read_file(struct arguments *args, const char *fname)
 	return f;
 }
 
-static struct file *read_scancode(const char *name)
+static struct send *read_file_raw(struct arguments *args, const char *fname, FILE *input)
+{
+	int lineno = 0, lastspace = 0;
+	char line[1024];
+	int len = 0;
+	static const char whitespace[] = " \n\r\t,";
+	struct send *f;
+
+	f = malloc(sizeof(*f));
+	if (f == NULL) {
+		fprintf(stderr, _("Failed to allocate memory\n"));
+		fclose(input);
+		return NULL;
+	}
+	f->is_scancode = false;
+	f->is_keycode = false;
+	f->carrier = 0;
+	f->fname = fname;
+
+	while (fgets(line, sizeof(line), input)) {
+		long int value;
+		char *p, *saveptr;
+		lineno++;
+		char *keyword = strtok_r(line, whitespace, &saveptr);
+
+		for (;;) {
+			if (keyword == NULL || *keyword == 0 || *keyword == '#' ||
+			    (keyword[0] == '/' && keyword[1] == '/'))
+				break;
+
+			value = strtol(keyword, &p, 10);
+			if (errno || *p) {
+				fprintf(stderr, _("%s:%d: error: expected integer, got `%s'\n"),
+					fname, lineno, keyword);
+				fclose(input);
+				free(f);
+				return NULL;
+			}
+
+			if (len % 2) {
+				if (keyword[0] == '+') {
+					fprintf(stderr, _("%s:%d: error: pulse found where space expected `%s'\n"), fname, lineno, keyword);
+					free(f);
+					return NULL;
+				}
+				if (keyword[0] == '-')
+					value = -value;
+			} else {
+				if (keyword[0] == '-') {
+					fprintf(stderr, _("%s:%d: error: space found where pulse expected `%s'\n"), fname, lineno, keyword);
+					fclose(input);
+					free(f);
+					return NULL;
+				}
+				lastspace = lineno;
+			}
+
+			if (value <= 0 || value >= LIRC_VALUE_MASK) {
+				fprintf(stderr, _("%s:%d: error: value `%s' out of range\n"), fname, lineno, keyword);
+				fclose(input);
+				free(f);
+				return NULL;
+			}
+
+			f->buf[len++] = value;
+
+			if (len >= LIRCBUF_SIZE) {
+				fprintf(stderr, _("warning: %s:%d: IR cannot exceed %u edges\n"), fname, lineno, LIRCBUF_SIZE);
+				break;
+			}
+
+			keyword = strtok_r(NULL, whitespace, &saveptr);
+		}
+	}
+
+	fclose(input);
+
+	if (len == 0) {
+		fprintf(stderr, _("%s: no pulses or spaces found\n"), fname);
+		free(f);
+		return NULL;
+	}
+
+	if ((len % 2) == 0) {
+		fprintf(stderr, _("warning: %s:%d: trailing space ignored\n"),
+							fname, lastspace);
+		len--;
+	}
+
+	f->len = len;
+
+	return f;
+}
+
+static struct send *read_file(struct arguments *args, const char *fname)
+{
+	FILE *input = fopen(fname, "r");
+	char line[1024];
+
+	if (!input) {
+		fprintf(stderr, _("%s: could not open: %m\n"), fname);
+		return NULL;
+	}
+
+	while (fgets(line, sizeof(line), input)) {
+		int start = 0;
+
+		while (isspace(line[start]))
+			start++;
+
+		switch (line[start]) {
+		case '/':
+			if (line[start+1] != '/')
+				break;
+		case 0:
+		case '#':
+			continue;
+		case '+':
+		case '-':
+		case '0' ... '9':
+			rewind(input);
+			return read_file_raw(args, fname, input);
+		default:
+			rewind(input);
+			return read_file_pulse_space(args, fname, input);
+		}
+	}
+
+	fclose(input);
+
+	fprintf(stderr, _("%s: file is empty\n"), fname);
+
+	return NULL;
+}
+
+static struct send *read_scancode(const char *name)
 {
 	enum rc_proto proto;
-	struct file *f;
+	struct send *f;
 	unsigned scancode;
 	char *pstr;
 	char *p = strchr(name, ':');
@@ -407,7 +537,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 {
 	struct arguments *arguments = state->input;
 	struct keymap *map;
-	struct file *s;
+	struct send *s;
 
 	switch (k) {
 	case 'f':
@@ -431,6 +561,9 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 	case '1':
 		arguments->oneshot = true;
 		break;
+	case 2:
+		arguments->mode2 = true;
+		break;
 	case 'v':
 		arguments->verbose = true;
 		break;
@@ -514,7 +647,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		if (arguments->send == NULL)
 			arguments->send = s;
 		else {
-			struct file *p = arguments->send;
+			struct send *p = arguments->send;
 			while (p->next) p = p->next;
 			p->next = s;
 		}
@@ -530,7 +663,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		if (arguments->send == NULL)
 			arguments->send = s;
 		else {
-			struct file *p = arguments->send;
+			struct send *p = arguments->send;
 			while (p->next) p = p->next;
 			p->next = s;
 		}
@@ -550,7 +683,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		if (arguments->send == NULL)
 			arguments->send = s;
 		else {
-			struct file *p = arguments->send;
+			struct send *p = arguments->send;
 			while (p->next) p = p->next;
 			p->next = s;
 		}
@@ -577,16 +710,16 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		return ARGP_ERR_UNKNOWN;
 	}
 
-	if (k != '1' && k != 'd' && k != 'v' && k != 'k')
+	if (k != '1' && k != 'd' && k != 'v' && k != 'k' && k != 2)
 		arguments->work_to_do = true;
 
 	return 0;
 }
 
 // FIXME: keymaps can have multiple definitions of the same keycode
-static struct file* convert_keycode(struct keymap *map, const char *keycode)
+static struct send* convert_keycode(struct keymap *map, const char *keycode)
 {
-	struct file *s;
+	struct send *s;
 
 	while (map) {
 		struct raw_entry *re = map->raw;
@@ -857,7 +990,7 @@ static void lirc_features(struct arguments *args, int fd, unsigned features)
 	}
 }
 
-static int lirc_send(struct arguments *args, int fd, unsigned features, struct file *f)
+static int lirc_send(struct arguments *args, int fd, unsigned features, struct send *f)
 {
 	const char *dev = args->device;
 	int rc, mode;
@@ -930,9 +1063,10 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct f
 	size_t size = f->len * sizeof(unsigned);
 	if (args->verbose) {
 		int i;
-		printf("Sending:\n");
+		printf("Sending:");
 		for (i=0; i<f->len; i++)
-			printf("%s %u\n", i & 1 ? "space" : "pulse", f->buf[i]);
+			printf("%s%u", i & 1 ? " -" : " +", f->buf[i]);
+		putchar('\n');
 	}
 	ret = TEMP_FAILURE_RETRY(write(fd, f->buf, size));
 	if (ret < 0) {
@@ -982,6 +1116,7 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 
 	bool keep_reading = true;
 	bool leading_space = true;
+	unsigned carrier = 0;
 
 	while (keep_reading) {
 		ssize_t ret = TEMP_FAILURE_RETRY(read(fd, buf, sizeof(buf)));
@@ -1015,20 +1150,42 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 				break;
 			}
 
-			switch (msg) {
-			case LIRC_MODE2_TIMEOUT:
-				fprintf(out, "timeout %u\n", val);
-				leading_space = true;
-				break;
-			case LIRC_MODE2_PULSE:
-				fprintf(out, "pulse %u\n", val);
-				break;
-			case LIRC_MODE2_SPACE:
-				fprintf(out, "space %u\n", val);
-				break;
-			case LIRC_MODE2_FREQUENCY:
-				fprintf(out, "carrier %u\n", val);
-				break;
+			if (args->mode2) {
+				switch (msg) {
+				case LIRC_MODE2_TIMEOUT:
+					fprintf(out, "timeout %u\n", val);
+					leading_space = true;
+					break;
+				case LIRC_MODE2_PULSE:
+					fprintf(out, "pulse %u\n", val);
+					break;
+				case LIRC_MODE2_SPACE:
+					fprintf(out, "space %u\n", val);
+					break;
+				case LIRC_MODE2_FREQUENCY:
+					fprintf(out, "carrier %u\n", val);
+					break;
+				}
+			} else {
+				switch (msg) {
+				case LIRC_MODE2_TIMEOUT:
+					if (carrier)
+						fprintf(out, "# carrier %uHz, timeout %u\n", carrier, val);
+					else
+						fprintf(out, "# timeout %u\n", val);
+					leading_space = true;
+					carrier = 0;
+					break;
+				case LIRC_MODE2_PULSE:
+					fprintf(out, "+%u ", val);
+					break;
+				case LIRC_MODE2_SPACE:
+					fprintf(out, "-%u ", val);
+					break;
+				case LIRC_MODE2_FREQUENCY:
+					carrier = val;
+					break;
+				}
 			}
 
 			fflush(out);
@@ -1069,9 +1226,9 @@ int main(int argc, char *argv[])
 	if (rc)
 		exit(EX_IOERR);
 
-	struct file *s = args.send;
+	struct send *s = args.send;
 	while (s) {
-		struct file *next = s->next;
+		struct send *next = s->next;
 		if (s != args.send)
 			usleep(args.gap);
 
-- 
2.21.0

