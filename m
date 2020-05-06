Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC13F1C6FC2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgEFL7E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:59:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:42517 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbgEFL7E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:59:04 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 62A3CC6372; Wed,  6 May 2020 12:59:03 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: allow unmodulated signal to be sent
Date:   Wed,  6 May 2020 12:59:03 +0100
Message-Id: <20200506115903.17482-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some drivers like gpio-ir-tx and mceusb allow unmodulated signal to be
sent by setting the carrier to 0.

Likewise the timeout can be set to 0.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 71 +++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index ba454619..abf3ccf6 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -59,6 +59,7 @@
 /* See drivers/media/rc/lirc_dev.c line 22 */
 #define LIRCBUF_SIZE 1024
 #define IR_DEFAULT_TIMEOUT 125000
+#define UNSET UINT32_MAX
 
 const char *argp_program_version = "IR ctl version " V4L_UTILS_VERSION;
 const char *argp_program_bug_address = "Sean Young <sean@mess.org>";
@@ -158,17 +159,18 @@ static const char doc[] = N_(
 	"Note that most lirc setting have global state, i.e. the device will remain\n"
 	"in this state until set otherwise.");
 
-static int strtoint(const char *p, const char *unit)
+static bool strtoint(const char *p, const char *unit, unsigned *ret)
 {
 	char *end;
-	long arg = strtol(p, &end, 10);
+	long arg = strtoll(p, &end, 10);
 	if (end == NULL || (end[0] != 0 && strcasecmp(end, unit) != 0))
-		return 0;
+		return false;
 
-	if (arg <= 0 || arg >= 0xffffff)
-		return 0;
+	if (arg < 0 || arg >= 0xffffff)
+		return false;
 
-	return arg;
+	*ret = arg;
+	return true;
 }
 
 static bool strtoscancode(const char *p, unsigned *ret)
@@ -221,7 +223,7 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 	}
 	f->is_scancode = false;
 	f->is_keycode = false;
-	f->carrier = 0;
+	f->carrier = UNSET;
 	f->fname = fname;
 
 	while (fgets(line, sizeof(line), input)) {
@@ -300,8 +302,8 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 			continue;
 		}
 
-		int arg = strtoint(p, "");
-		if (arg == 0) {
+		unsigned int arg;
+		if (!strtoint(p, "", &arg)) {
 			fprintf(stderr, _("warning: %s:%d: invalid argument '%s'\n"), fname, lineno, p);
 			continue;
 		}
@@ -313,6 +315,10 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 		}
 
 		if (strcmp(keyword, "space") == 0) {
+			if (arg == 0) {
+				fprintf(stderr, _("warning: %s:%d: invalid argument to space '%d'\n"), fname, lineno, arg);
+				continue;
+			}
 			if (expect_pulse) {
 				if (len == 0) {
 					fprintf(stderr, _("warning: %s:%d: leading space ignored\n"),
@@ -326,13 +332,17 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 			lastspace = lineno;
 			expect_pulse = true;
 		} else if (strcmp(keyword, "pulse") == 0) {
+			if (arg == 0) {
+				fprintf(stderr, _("warning: %s:%d: invalid argument to pulse '%d'\n"), fname, lineno, arg);
+				continue;
+			}
 			if (!expect_pulse)
 				f->buf[len-1] += arg;
 			else
 				f->buf[len++] = arg;
 			expect_pulse = false;
 		} else if (strcmp(keyword, "carrier") == 0) {
-			if (f->carrier && f->carrier != arg) {
+			if (f->carrier != UNSET && f->carrier != arg) {
 				fprintf(stderr, _("warning: %s:%d: carrier already specified\n"), fname, lineno);
 			} else {
 				f->carrier = arg;
@@ -383,7 +393,7 @@ static struct send *read_file_raw(struct arguments *args, const char *fname, FIL
 	}
 	f->is_scancode = false;
 	f->is_keycode = false;
-	f->carrier = 0;
+	f->carrier = UNSET;
 	f->fname = fname;
 
 	while (fgets(line, sizeof(line), input)) {
@@ -619,8 +629,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		break;
 	}
 	case 't':
-		arguments->timeout = strtoint(arg, "µs");
-		if (arguments->timeout == 0)
+		if (!strtoint(arg, "µs", &arguments->timeout))
 			argp_error(state, _("cannot parse timeout `%s'"), arg);
 		break;
 
@@ -629,8 +638,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		arguments->device = arg;
 		break;
 	case 'c':
-		arguments->carrier = strtoint(arg, "Hz");
-		if (arguments->carrier == 0)
+		if (!strtoint(arg, "Hz", &arguments->carrier))
 			argp_error(state, _("cannot parse carrier `%s'"), arg);
 		break;
 	case 'e':
@@ -639,13 +647,12 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 			argp_error(state, _("cannot parse emitters `%s'"), arg);
 		break;
 	case 'g':
-		arguments->gap = strtoint(arg, "");
-		if (arguments->gap == 0)
+		if (!strtoint(arg, "", &arguments->gap))
 			argp_error(state, _("cannot parse gap `%s'"), arg);
 		break;
 	case 'D':
-		arguments->duty = strtoint(arg, "%");
-		if (arguments->duty == 0 || arguments->duty >= 100)
+		if (!strtoint(arg, "%", &arguments->duty) ||
+		     arguments->duty == 0 || arguments->duty >= 100)
 			argp_error(state, _("invalid duty cycle `%s'"), arg);
 		break;
 	case 's':
@@ -862,7 +869,7 @@ static int lirc_options(struct arguments *args, int fd, unsigned features)
 	const char *dev = args->device;
 	int rc;
 
-	if (args->timeout) {
+	if (args->timeout != UNSET) {
 		if (features & LIRC_CAN_SET_REC_TIMEOUT) {
 			rc = ioctl(fd, LIRC_SET_REC_TIMEOUT, &args->timeout);
 			if (rc)
@@ -910,7 +917,7 @@ static int lirc_options(struct arguments *args, int fd, unsigned features)
 			fprintf(stderr, _("%s: device does not support setting receiver carrier range\n"), dev);
 	}
 
-	if (args->carrier)
+	if (args->carrier != UNSET)
 		lirc_set_send_carrier(fd, dev, features, args->carrier);
 
 	if (args->duty) {
@@ -970,8 +977,12 @@ static void lirc_features(struct arguments *args, int fd, unsigned features)
 		// This ioctl is only supported from kernel 4.18 onwards
 		unsigned timeout;
 		int rc = ioctl(fd, LIRC_GET_REC_TIMEOUT, &timeout);
-		if (rc == 0)
-			printf(_(" - Receiving timeout %u microseconds\n"), timeout);
+		if (rc == 0) {
+			if (timeout == 0)
+				printf(_(" - Receiving timeout not set\n"));
+			else
+				printf(_(" - Receiving timeout %u microseconds\n"), timeout);
+		}
 
 		if (features & LIRC_CAN_SET_REC_TIMEOUT) {
 			unsigned min_timeout, max_timeout;
@@ -1074,9 +1085,11 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct s
 		f->carrier = protocol_carrier(proto);
 	}
 
-	if (args->carrier && f->carrier)
-		fprintf(stderr, _("warning: %s: carrier specified but overwritten on command line\n"), f->fname);
-	else if (f->carrier && args->carrier == 0)
+	if (args->carrier != UNSET) {
+		if (f->carrier != UNSET)
+			fprintf(stderr, _("warning: carrier specified but overwritten on command line\n"));
+		lirc_set_send_carrier(fd, dev, features, args->carrier);
+	} else if (f->carrier != UNSET)
 		lirc_set_send_carrier(fd, dev, features, f->carrier);
 
 	size_t size = f->len * sizeof(unsigned);
@@ -1220,7 +1233,11 @@ err:
 
 int main(int argc, char *argv[])
 {
-	struct arguments args = { .gap = IR_DEFAULT_TIMEOUT };
+	struct arguments args = {
+		.gap = IR_DEFAULT_TIMEOUT,
+		.carrier = UNSET,
+		.timeout = UNSET,
+	};
 
 #ifdef ENABLE_NLS
         setlocale (LC_ALL, "");
-- 
2.26.2

