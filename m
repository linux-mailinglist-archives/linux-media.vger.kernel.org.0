Return-Path: <linux-media+bounces-1526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62549802DA9
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98101B20A86
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D352EFBFA;
	Mon,  4 Dec 2023 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="QEBSsuSA";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="S1x4qlm9"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40FEE6
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1701680200; bh=JsC1d1pYcdfRtkJ0rqgaHeo0IWU1FonNAR9JZ8FPzTU=;
	h=From:To:Cc:Subject:Date:From;
	b=QEBSsuSAbEa89heqB4N5n1uKaStztqjOtbp7FSvOh4+1pkm606u2n++HR+jGXj7CZ
	 X5SA82Ksmb1z5gmx144oue0eaEhs2jPLkTV88C5WdyU1Q5NMHEfj5sgbcTZY3QPIRj
	 3P1Bg8BOCzhF0r9ku/M/hHF+bH9+TCcBxlaESOQy/7+bft2Yr8MWYxrUvqOyjoeWXA
	 JPGpjfmfee16aRDEmTTZCAqUFCNl2EymfzYK28o8Bd6yKNFF3mP1luIt+9FRgaDDkB
	 VLRbEXlpophgrDwM1GSJoPATYTXAKAtdhNwuuR7K0lvUo9NK4kMngOF6RQ1sHTxrkk
	 Z4HdhgzjDrCXw==
Received: by gofer.mess.org (Postfix, from userid 501)
	id BBDDF100103; Mon,  4 Dec 2023 08:56:40 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1701680198; bh=JsC1d1pYcdfRtkJ0rqgaHeo0IWU1FonNAR9JZ8FPzTU=;
	h=From:To:Cc:Subject:Date:From;
	b=S1x4qlm9HnMlOGc0BiZzWibWoRUDgmu22IeoUg7aImY/UpNhzzKbcMaK7Rz3KXWdt
	 dQjTTR9oxpS7c9dQwH2AxDi/5yrXRXBdFwxVoF4boGZFvRlZ7scuBy10s+UNpa5O5Z
	 NZBekwd9gaxRLyFiQD2IbrLu/YR5IUepsjxyUSF2Ow/dg94dPpfs3Kd1MH8Eqdc6Qq
	 t+jsQ+mPkSNtRFnaQycFGE4tUBnd7eTkawbtvZz1MSsigYbzavMEv8eXD57fISeHUI
	 8d1XQc0YcjXXgKyAoc++EtYQsXZ0FeYrKYDhRwreM506yfFjxXVMlOATJKhKKxgomq
	 QtRkhUSWwV05Q==
Received: from localhost.localdomain (unknown [IPv6:2a02:8011:d000:212:ca7f:54ff:fe51:14d6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id C7E3210005E;
	Mon,  4 Dec 2023 08:56:38 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Gregor Jasny <gjasny@googlemail.com>,
	Joe Kesselman <keshlam@alum.mit.edu>,
	Sean Young <sean@mess.org>
Subject: [PATCH v4l-utils] ir-ctl: remove line length limits
Date: Mon,  4 Dec 2023 08:56:20 +0000
Message-ID: <20231204085620.81213-1-sean@mess.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By using getline() rather get fgets(), there is no limit on the
line length.

See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1014887

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 3c389bd9..b37dec4d 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -58,8 +58,6 @@
 #define LIRCBUF_SIZE 1024
 #define IR_DEFAULT_TIMEOUT 125000
 #define UNSET UINT32_MAX
-/* Maximum number of columns per line */
-#define LINE_SIZE 8192
 
 const char *argp_program_version = "IR ctl version " V4L_UTILS_VERSION;
 const char *argp_program_bug_address = "Sean Young <sean@mess.org>";
@@ -218,7 +216,8 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 {
 	bool expect_pulse = true;
 	int lineno = 0, lastspace = 0;
-	char line[LINE_SIZE];
+	char *line = NULL;
+	size_t line_size;
 	int len = 0;
 	static const char whitespace[] = " \n\r\t";
 	struct send *f;
@@ -232,7 +231,7 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 	f->carrier = UNSET;
 	f->fname = fname;
 
-	while (fgets(line, sizeof(line), input)) {
+	while (getline(&line, &line_size, input)) {
 		char *p, *saveptr;
 		lineno++;
 		char *keyword = strtok_r(line, whitespace, &saveptr);
@@ -364,6 +363,7 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 		}
 	}
 
+	free(line);
 	fclose(input);
 
 	if (len == 0) {
@@ -386,7 +386,8 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 static struct send *read_file_raw(struct arguments *args, const char *fname, FILE *input)
 {
 	int lineno = 0, lastspace = 0;
-	char line[LINE_SIZE];
+	char *line = NULL;
+	size_t line_size;
 	int len = 0;
 	static const char whitespace[] = " \n\r\t,";
 	struct send *f;
@@ -401,7 +402,7 @@ static struct send *read_file_raw(struct arguments *args, const char *fname, FIL
 	f->carrier = UNSET;
 	f->fname = fname;
 
-	while (fgets(line, sizeof(line), input)) {
+	while (getline(&line, &line_size, input)) {
 		long int value;
 		char *p, *saveptr;
 		lineno++;
@@ -457,6 +458,7 @@ static struct send *read_file_raw(struct arguments *args, const char *fname, FIL
 		}
 	}
 
+	free(line);
 	fclose(input);
 
 	if (len == 0) {
@@ -479,14 +481,15 @@ static struct send *read_file_raw(struct arguments *args, const char *fname, FIL
 static struct send *read_file(struct arguments *args, const char *fname)
 {
 	FILE *input = fopen(fname, "r");
-	char line[LINE_SIZE];
+	char *line = NULL;
+	size_t line_size;
 
 	if (!input) {
 		fprintf(stderr, _("%s: could not open: %m\n"), fname);
 		return NULL;
 	}
 
-	while (fgets(line, sizeof(line), input)) {
+	while (getline(&line, &line_size, input)) {
 		int start = 0;
 
 		while (isspace(line[start]))
@@ -510,6 +513,7 @@ static struct send *read_file(struct arguments *args, const char *fname)
 		}
 	}
 
+	free(line);
 	fclose(input);
 
 	fprintf(stderr, _("%s: file is empty\n"), fname);
-- 
2.43.0


