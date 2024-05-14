Return-Path: <linux-media+bounces-11438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A038C57A8
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 16:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CE72284A0D
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 14:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9E51459E5;
	Tue, 14 May 2024 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ojuOe3ne";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ojuOe3ne"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A336144D10
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715695550; cv=none; b=L60kQKbd9H6ammLSIvQ8YIhkGMtWEdWqMW1AzUyqTYUiLP7pKEE/pK6eZWLptF60T4XTwpDxakpsS6NqEixPml+jDGsrwgMS28/TvX7A6VEMt2t6VhWqOqCoHimAExjV4bsGd6GLnzEDT47Srxi7LIM1pebwj52i9DOsruGjyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715695550; c=relaxed/simple;
	bh=yzKFOWJOSWnPUG66gKXIOLG2Yey0lubzPDTSYz7dGMQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tKavRpJIYfpRPqQ4GcFcOVz+ex9aVrUbIeQ/OBeDVJ0XMM87X0Bbx/y7O83/Tf2ZggZkkQud/QOVZX2LFWOVUKWU1k3chObDVRw94YpV2JntCd67ZITD7DAy6pRJTIbAodkALGW4B3L3ocy/WHIch+mzVF20HFtJtXwz/tQ/3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ojuOe3ne; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ojuOe3ne; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1715694984; bh=yzKFOWJOSWnPUG66gKXIOLG2Yey0lubzPDTSYz7dGMQ=;
	h=From:To:Subject:Date:From;
	b=ojuOe3neA0Dw+zXVxtmZ4hf6a4WxTHwCP+9TLJfn+gNo7NZDGUVJ8Zv/AEe27fH/r
	 cpwLyazxvhWUyrl2cKCFdXEDTI8fTyGZSaLelzifiBgnQgmoiKfNRvdAnTz9d769ik
	 cKRx7MGBzE+M0GHTsWBhwh+WDqtOJR7I0Q4CaDagRoQbHpKUq5pIZbGfSGWvl+pDmT
	 ljfvWKeM1rAV+zMJ9MUReklUIO6e3+uPOJJUH8WPbNUZNy2+X8NzwF6oid3bnRcaNZ
	 6UESguaRIugbvOAVQkiTPMxzr55YGA6O6ew2odMoJOQVIWfdWYU5vpgUvI6PUewj1g
	 kEMvGXK82QqGQ==
Received: by gofer.mess.org (Postfix, from userid 501)
	id C84C61000CE; Tue, 14 May 2024 14:56:24 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1715694984; bh=yzKFOWJOSWnPUG66gKXIOLG2Yey0lubzPDTSYz7dGMQ=;
	h=From:To:Subject:Date:From;
	b=ojuOe3neA0Dw+zXVxtmZ4hf6a4WxTHwCP+9TLJfn+gNo7NZDGUVJ8Zv/AEe27fH/r
	 cpwLyazxvhWUyrl2cKCFdXEDTI8fTyGZSaLelzifiBgnQgmoiKfNRvdAnTz9d769ik
	 cKRx7MGBzE+M0GHTsWBhwh+WDqtOJR7I0Q4CaDagRoQbHpKUq5pIZbGfSGWvl+pDmT
	 ljfvWKeM1rAV+zMJ9MUReklUIO6e3+uPOJJUH8WPbNUZNy2+X8NzwF6oid3bnRcaNZ
	 6UESguaRIugbvOAVQkiTPMxzr55YGA6O6ew2odMoJOQVIWfdWYU5vpgUvI6PUewj1g
	 kEMvGXK82QqGQ==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 03BF710005B
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 14:56:23 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: fix command line processing
Date: Tue, 14 May 2024 14:55:33 +0100
Message-ID: <20240514135533.28788-1-sean@mess.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove --test-keymap since the command line processing is broken if
--test-keymap is specified with other arguments. A keymap can simply
be tested by loading it.

Also ensure `--auto-load` properly excludes other options.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index dac99f5e..b6474d5c 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -273,7 +273,6 @@ static const struct argp_option options[] = {
 	{"delay",	'D',	N_("DELAY"),	0,	N_("Sets the delay before repeating a keystroke"), 0},
 	{"period",	'P',	N_("PERIOD"),	0,	N_("Sets the period to repeat a keystroke"), 0},
 	{"auto-load",	'a',	N_("CFGFILE"),	0,	N_("Auto-load keymaps, based on a configuration file. Only works with --sysdev."), 0},
-	{"test-keymap",	1,	N_("KEYMAP"),	0,	N_("Test if keymap is valid"), 0},
 	{"help",        '?',	0,		0,	N_("Give this help list"), -1},
 	{"usage",	-3,	0,		0,	N_("Give a short usage message")},
 	{"version",	'V',	0,		0,	N_("Print program version"), -1},
@@ -290,7 +289,6 @@ int debug = 0;
 static int test = 0;
 static int delay = -1;
 static int period = -1;
-static int test_keymap = 0;
 static enum sysfs_protocols ch_proto = 0;
 
 struct bpf_protocol {
@@ -697,16 +695,6 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 			p = strtok(NULL, ":=");
 		} while (p);
 		break;
-	case 1:
-		test_keymap++;
-		struct keymap *map ;
-
-		rc = parse_keymap(arg, &map, debug);
-		if (rc)
-			argp_error(state, _("Failed to read table file %s"), arg);
-		add_keymap(map, arg);
-		free_keymap(map);
-		break;
 	case '?':
 		argp_state_help(state, state->out_stream,
 				ARGP_HELP_SHORT_USAGE | ARGP_HELP_LONG
@@ -2070,9 +2058,6 @@ int main(int argc, char *argv[])
 
 	argp_parse(&argp, argc, argv, ARGP_NO_HELP, 0, 0);
 
-	if (test_keymap)
-		return 0;
-
 	/* Just list all devices */
 	if (!clear && !readtable && !keytable && !ch_proto && !cfg.next && !test && delay < 0 && period < 0 && !bpf_protocol) {
 		if (show_sysfs_attribs(&rc_dev, devclass))
@@ -2084,7 +2069,7 @@ int main(int argc, char *argv[])
 	if (!devclass)
 		devclass = "rc0";
 
-	if (cfg.next && (clear || keytable || ch_proto)) {
+	if (cfg.next && (clear || keytable || ch_proto || bpf_protocol || test)) {
 		fprintf (stderr, _("Auto-mode can be used only with --read, --verbose and --sysdev options\n"));
 		return -1;
 	}
-- 
2.45.0


