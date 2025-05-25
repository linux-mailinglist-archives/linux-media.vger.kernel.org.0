Return-Path: <linux-media+bounces-33329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D1AC3579
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 17:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A403B5C9C
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 15:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089A51F790F;
	Sun, 25 May 2025 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="YXLFAE69"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D134A1D
	for <linux-media@vger.kernel.org>; Sun, 25 May 2025 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188222; cv=none; b=dNyqAc8ymh2rpY4ahzG/xoFMmrzEg2qEP7XxhpWo+GbxcOvrPfg5sK7HDMU8CeCM6dePo7mc6oCDBzUf7+nDjDOeqZZQjlS4bDgL7pSmmQiITZySABjaUA1LFd4zYPfytwwc9drEwC7dYYqiC/kRa4ZdO9YlGkeflv73je3pQGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188222; c=relaxed/simple;
	bh=2V2OtQBaJ9u+7m8UqZqTQPPEl5D7FC54G0PsYlF80y0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Jde+kUqOhQn2e+WK0sVZC5hMgUC7fxV536Ad7dz2DfOs45KPl8fMn6h0nr/XEgNxeaqrLpRGNvgYdI4Xbs+wVum9GDhrlnXq1yXj2nN/r/NzvpqXSGFcbhykLjWyq0stN356JYRXLE1rJmOqogiSlYJpWDJHkbtykrk5Cect3T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=YXLFAE69; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1748187686; bh=2V2OtQBaJ9u+7m8UqZqTQPPEl5D7FC54G0PsYlF80y0=;
	h=From:To:Subject:Date:From;
	b=YXLFAE69nYhupYRHGc0BgRpAkcVMBmN/9hfj9VxaO4FqjWxn4o5P1aH81Oml29orV
	 L3i9cip6rYF16VwGLMWjLq/QNBn1pTop9+Rk4PT9mHJ3psYMGQxHWtHHKT6ZtbfPYQ
	 nvalJCjOY6m/+7TVUpNAR90uJ2rh2X5mWAABWH3fA2zHpEjgLu7AMf2J6vcUWlcaTz
	 BCZcN6Um+ju/eN4LF67FrxYP4PewjJ5TOEhyKKNVzchcu3E6t1hJE1aWc2TirJB794
	 nSz4O3IPtvZo+O96Gmda2dO5atr1e4APBtndfXvD1ATVW7eQm84k5a3oUFJA/w/jtY
	 3UAKXSVuVasEA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id A3E9010007D; Sun, 25 May 2025 16:41:26 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils]: ir-ctl: remove quirky -rmw command line parsing
Date: Sun, 25 May 2025 16:41:26 +0100
Message-Id: <20250525154126.1546895-1-sean@mess.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive option takes an optional file name, even when specified as a
short option without an `='. So, ir-ctl -rmw saves the output to a file
called mw. You would expect the -r, -m, and -w options to be specified.

This commit removes the file argument completely. Saving to a file is
confusing and does not really have a good use-case. I've never heard of
anyone using this feature.

On top of that, I'm implementing a ir-ctl compatibility mode in cir[1],
and clap does not support short options with an optional value without
`='; see the note[2].

[1] https://gitlab.freedesktop.org/linux-media/tools/cir
[2] https://docs.rs/clap/latest/clap/struct.Arg.html#method.default_missing_value

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.1.in |  9 +++-----
 utils/ir-ctl/ir-ctl.c    | 46 ++++++++++++----------------------------
 2 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.1.in b/utils/ir-ctl/ir-ctl.1.in
index f1ed2640..8fe74675 100644
--- a/utils/ir-ctl/ir-ctl.1.in
+++ b/utils/ir-ctl/ir-ctl.1.in
@@ -18,7 +18,7 @@ ir\-ctl \- a swiss\-knife tool to handle raw IR and to set lirc options
 [\fIOPTION\fR]... \fI\-\-keycode\fR [\fIkeycode to send\fR]
 .br
 .B ir\-ctl
-[\fIOPTION\fR]... \fI\-\-receive\fR [\fIsave to file\fR]
+[\fIOPTION\fR]... \fI\-\-receive\fR
 .SH DESCRIPTION
 ir\-ctl is a tool that allows one to list the features of a lirc device,
 set its options, receive raw IR, and send IR.
@@ -36,9 +36,8 @@ lirc device to control, /dev/lirc0 by default
 \fB\-f\fR, \fB\-\-features\fR
 List the features of the lirc device.
 .TP
-\fB\-r\fR, \fB\-\-receive\fR[=\fIFILE\fR]
-Receive IR and print to standard output if no file is specified, else
-save to the filename.
+\fB\-r\fR, \fB\-\-receive\fR
+Receive IR and print to standard output.
 .TP
 \fB\-s\fR, \fB\-\-send\fR=\fIFILE\fR
 Send IR in text file. It must be in the format described below. If this
@@ -238,8 +237,6 @@ To show the IR of the first button press on a remote in learning mode:
 .br
 	\fBir\-ctl \-r \-m \-w\fR
 .PP
-Note that \fBir\-ctl \-rmw\fR would receive to a file called \fBmw\fR.
-.PP
 To restore the normal (longer distance) receiver:
 .br
 	\fBir\-ctl \-n \-M\fR
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index e662651e..8600fbe6 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -100,7 +100,6 @@ struct arguments {
 	struct keymap *keymap;
 	struct send *send;
 	bool oneshot;
-	char *savetofile;
 	int wideband;
 	unsigned carrier_low, carrier_high;
 	unsigned timeout;
@@ -115,7 +114,7 @@ struct arguments {
 static const struct argp_option options[] = {
 	{ "device",	'd',	N_("DEV"),	0,	N_("lirc device to use") },
 	{ "features",	'f',	0,		0,	N_("list lirc device features") },
-	{ "receive",	'r',	N_("FILE"),	OPTION_ARG_OPTIONAL,	N_("receive IR to stdout or file") },
+	{ "receive",	'r',	0,		0,	N_("receive IR to stdout") },
 	{ "send",	's',	N_("FILE"),	0,	N_("send IR pulse and space file") },
 	{ "scancode",	'S',	N_("SCANCODE"),	0,	N_("send IR scancode in protocol specified") },
 	{ "keycode",	'K',	N_("KEYCODE"),	0,	N_("send IR keycode from keymap") },
@@ -140,7 +139,7 @@ static const struct argp_option options[] = {
 
 static const char args_doc[] = N_(
 	"--features\n"
-	"--receive [save to file]\n"
+	"--receive\n"
 	"--send [file to send]\n"
 	"--scancode [scancode to send]\n"
 	"--keycode [keycode to send]\n"
@@ -602,12 +601,6 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 			argp_error(state, _("receive can not be combined with features or send option"));
 
 		arguments->receive = true;
-		if (arg) {
-			if (arguments->savetofile)
-				argp_error(state, _("receive filename already set"));
-
-			arguments->savetofile = arg;
-		}
 		break;
 	case '1':
 		arguments->oneshot = true;
@@ -1126,7 +1119,6 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct s
 int lirc_receive(struct arguments *args, int fd, unsigned features)
 {
 	char *dev = args->device;
-	FILE *out = stdout;
 	int rc = EX_IOERR;
 	int mode = LIRC_MODE_MODE2;
 
@@ -1141,13 +1133,6 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 		return EX_IOERR;
 	}
 
-	if (args->savetofile) {
-		out = fopen(args->savetofile, "w");
-		if (!out) {
-			fprintf(stderr, _("%s: failed to open for writing: %m\n"), args->savetofile);
-			return EX_CANTCREAT;
-		}
-	}
 	unsigned buf[LIRCBUF_SIZE];
 
 	bool keep_reading = true;
@@ -1188,20 +1173,20 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 			if (args->mode2) {
 				switch (msg) {
 				case LIRC_MODE2_TIMEOUT:
-					fprintf(out, "timeout %u\n", val);
+					printf("timeout %u\n", val);
 					leading_space = true;
 					break;
 				case LIRC_MODE2_PULSE:
-					fprintf(out, "pulse %u\n", val);
+					printf("pulse %u\n", val);
 					break;
 				case LIRC_MODE2_SPACE:
-					fprintf(out, "space %u\n", val);
+					printf("space %u\n", val);
 					break;
 				case LIRC_MODE2_FREQUENCY:
-					fprintf(out, "carrier %u\n", val);
+					printf("carrier %u\n", val);
 					break;
 				case LIRC_MODE2_OVERFLOW:
-					fprintf(out, "overflow\n");
+					printf("overflow\n");
 					leading_space = true;
 					break;
 				}
@@ -1209,41 +1194,38 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 				switch (msg) {
 				case LIRC_MODE2_TIMEOUT:
 					if (carrier)
-						fprintf(out, "-%u # carrier %uHz\n", val, carrier);
+						printf("-%u # carrier %uHz\n", val, carrier);
 					else
-						fprintf(out, "-%u\n", val);
+						printf("-%u\n", val);
 					leading_space = true;
 					carrier = 0;
 					break;
 				case LIRC_MODE2_PULSE:
-					fprintf(out, "+%u ", val);
+					printf("+%u ", val);
 					break;
 				case LIRC_MODE2_SPACE:
-					fprintf(out, "-%u ", val);
+					printf("-%u ", val);
 					break;
 				case LIRC_MODE2_FREQUENCY:
 					carrier = val;
 					break;
 				case LIRC_MODE2_OVERFLOW:
 					if (carrier)
-						fprintf(out, "# carrier %uHz, overflow\n", carrier);
+						printf("# carrier %uHz, overflow\n", carrier);
 					else
-						fprintf(out, "# overflow\n");
+						printf("# overflow\n");
 					leading_space = true;
 					carrier = 0;
 					break;
 				}
 			}
 
-			fflush(out);
+			fflush(stdout);
 		}
 	}
 
 	rc = 0;
 err:
-	if (args->savetofile)
-		fclose(out);
-
 	return rc;
 }
 
-- 
2.49.0


