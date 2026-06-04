Return-Path: <linux-media+bounces-63762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cpd+Bes0IWq6AwEAu9opvQ
	(envelope-from <linux-media+bounces-63762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:18:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B663DF16
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:18:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=trailofbits.com header.s=google header.b=KOLKsnA3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63762-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63762-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=trailofbits.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF6F8301C3CA
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD8A3BB11E;
	Thu,  4 Jun 2026 08:10:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC92E719C
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:10:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560646; cv=none; b=i2EomuBsWOi8UzXrX2SB2mCcfn1Ix639AwXERtopVCB97i8fiwlPmKV+6A+uXot0Ouz3C40lbWQcQNz4F6E9P7gpL48t0lLD40kOwQXW961RAzdJgsKdLMsjaxKaT5MkpXW45jSV8v8fn95XOi9qWUEZi8iogJw+DJMpS0/R6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560646; c=relaxed/simple;
	bh=H/gJPI5aCQFKHhkbQeKIwVwsxNvH400RIDckNYDvbHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FIlx8vfJYBsxBiF0Sn59TIAMZQPjFSCO+fWFl8I1svZR84QCxtKXzXbMiH8wSEbF7au4EL6ETB/lntzaLyz0XQRXz2vC8bPV0TOukII0JrRAgIhJEd4+b0tGFd2Ty1RoZT6h4XJTW4QkSLQwEw17KJnHTp922gtF4zcx3aRGR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=KOLKsnA3; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so323853f8f.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1780560644; x=1781165444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8RhyzKK7A9KUq3VoV6Unn+5etWjgs4T3scj1SgNMio=;
        b=KOLKsnA3wFQtN21Z02FOBVvhxTJ11MSGm5pykdpm3Xqm3WNFJV0kTKGKHAEXCsrHxy
         KYfy6oaDZSUXz3DIOq1UY9M/6muvfcVeMfpJf9oZ2OnBz7MABJOMm5qz8XBJ+/5bskbt
         /c7WWbXPvLHSmDNp7QIk4IYR44LLMIMJm9z/vgOFRcr6cteaUOiXyGV+t9jcgokfALMo
         OGS33PsyYugmJ/ik0uqnvjTeWdEclQ4eA7PLeOsN78dBKoyota6TX1MhrTWMvGQw5x6v
         PQ36kHGi1ggwzODmgrruQ538EMfFRUXXulvrDDVNgR2tALnhBTN8sxALnEBU/wATvUf4
         y+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560644; x=1781165444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8RhyzKK7A9KUq3VoV6Unn+5etWjgs4T3scj1SgNMio=;
        b=eTh4UATWpCF6wJ5xO7qD58tvrTwFgESX0ewpmc4GFhzKiLDs6ft+F8XzBgR3MJjejz
         LU9msvT/qspXe12tKl9xuujIpLXwf3CHB3UMc8+N1RvcP8idendtnA6GRi4KFLCslSAP
         NrJ89MOxt6C8x9N6xqMhNPqrDCMJ5xq4RgOLg4avTj8nThRdvtKwGXL/RJ7cqT1x8imQ
         XaY/IDRDyMeFx02/5loo9PGDxYuD8KHtL1drWA2O2cbT2DiZ6AN9OqgsbK3q15XsaEFG
         O4mxvCCQbfOtHX3GTtEteFGSwwPJaDg6J/M2oxsBskBpmrb7LPYyhiDScUiuk/cRlW/v
         wydg==
X-Gm-Message-State: AOJu0Yy0PHa3XjNtTWdPnXsZ9XhqOF+V1sVt/U7UBv4x/usJwLHKERHQ
	Z+XYoW9T3ncCWuiWtHiS5kyrJwcoMuN0Bdg/RFfjqubV8eOHkfgP88frGZMP50Qo8VBwjzPPMPc
	Wftqy4/g=
X-Gm-Gg: Acq92OG+IvTREi+kVocawLqgewhvdkgSz/ebMXP3/9lJnaDhb96kad3e/5ZtP6Oq81g
	fTksK7J9zPVHmJJFVS+A/hyHVkfBwmeEV0+VvwpasTyTYagDw2TYFc9lrBhbGIlCdKX2ye7IRON
	AS3oTADo/ggZykxuLYY5/al3cwgxsDRddhEDTuUJaDhvFiY8w4AkV15HL9+1kUqCPHsuhPbsJl4
	nhFsQJRgFBFchHbdPwWBl8YuMTgr8IbyWQcaSLeTjCT2DL0lzqrqvP9Av75ZXOofP8YiFu79qxs
	6FXOEy/44flaacFcZdzTft4e7PuT1RKurb0pl+Q+mYoSWNkoPnYTwhD55w7lruKhs4HiizTpNeq
	RzxtVYXG0B3jCiSNVEei0HbPeGCGSehoJusXwYGSWqZ0K9zS2Da7UjWlcFvisMNRjldZl30tlnI
	vqXBnzinfqCH7xttDE2CfT5RQNVHIinRH+rlJhgcsAng6ri9Yy8LgwUUclGWKBVHVtB0KcORvGj
	9bSPA==
X-Received: by 2002:a05:6000:71a:b0:45e:ea68:523b with SMTP id ffacd0b85a97d-460218c8df5mr10426345f8f.10.1780560643557;
        Thu, 04 Jun 2026 01:10:43 -0700 (PDT)
Received: from localhost ([46.101.197.76])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f351d40sm14206083f8f.26.2026.06.04.01.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:10:43 -0700 (PDT)
From: Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>
To: linux-media@vger.kernel.org
Cc: "Dominik \"Disconnect3d\" Czarnota" <dominik.czarnota@trailofbits.com>,
	mchehab@kernel.org,
	hverkuil@xs4all.nl
Subject: [PATCH v4l-utils] dvbv5-daemon: validate remote message lengths
Date: Thu,  4 Jun 2026 08:10:32 +0000
Message-ID: <20260604081034.2583971-1-dominik.czarnota@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[trailofbits.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[trailofbits.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63762-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[trailofbits.com,kernel.org,xs4all.nl];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dominik.czarnota@trailofbits.com,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dominik.czarnota@trailofbits.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dominik.czarnota@trailofbits.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[trailofbits.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 693B663DF16

From: "Dominik \"Disconnect3d\" Czarnota" <dominik.czarnota@trailofbits.com>

dvbv5-daemon reads length-prefixed messages from TCP clients. The
message length is used as the size argument to recv() before checking
that it fits in the stack buffer.

scan_data() also copies length-prefixed strings into caller-provided
buffers without knowing their sizes. A remote client can use this to
overflow fixed stack buffers such as cmd[80].

Reject frames larger than the receive buffer before reading the frame
body, and make scan_data() require a destination size for each string
argument.

The issues can be reproduced against an affected daemon listening on TCP
port 1234 with:

python3 -c 'import sys,struct; p=b"B"*20000; sys.stdout.buffer.write(struct.pack(">I",len(p))+p)' | nc 127.0.0.1 1234

python3 -c 'import sys,struct; cmd=b"A"*50000; p=struct.pack(">I",1)+struct.pack(">I",len(cmd))+cmd;sys.stdout.buffer.write(struct.pack(">I",len(p))+p)' | nc -vvv 127.0.0.1 1234

Assisted-by: Codex:gpt-5.5-cyber-preview
Signed-off-by: Dominik "Disconnect3d" Czarnota <dominik.czarnota@trailofbits.com>
---
 utils/dvb/dvbv5-daemon.c | 65 ++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/utils/dvb/dvbv5-daemon.c b/utils/dvb/dvbv5-daemon.c
index 669b3321..3311967f 100644
--- a/utils/dvb/dvbv5-daemon.c
+++ b/utils/dvb/dvbv5-daemon.c
@@ -475,13 +475,10 @@ static ssize_t send_data(int fd, const char *fmt, ...)
 	return send_buf(fd, buf, ret);
 }
 
-static ssize_t scan_data(char *buf, int buf_size, const char *fmt, ...)
-	__attribute__ (( format( scanf, 3, 4 )));
-
-static ssize_t scan_data(char *buf, int buf_size, const char *fmt, ...)
+static ssize_t scan_data(char *buf, size_t buf_size, const char *fmt, ...)
 {
 	char *p = buf, *endp = &buf[buf_size], *s;
-	int len;
+	size_t len, max_len;
 	int32_t *i32;
 	uint64_t *u64;
 	va_list ap;
@@ -493,17 +490,24 @@ static ssize_t scan_data(char *buf, int buf_size, const char *fmt, ...)
 		switch (*fmt++) {
 		case 's':              /* string */
 			s = va_arg(ap, char *);
+			max_len = va_arg(ap, size_t);
 			if (p + 4 > endp) {
 				dbg("buffer to short for string length");
 				stack_dump();
-				return -1;
+				goto error;
 			}
-			len = be32toh(*(int32_t *)p);
+			len = be32toh(*(uint32_t *)p);
 			p += 4;
-			if (p + len > endp) {
+			if (len > (size_t)(endp - p)) {
 				dbg("buffer to short for string");
 				stack_dump();
-				return -1;
+				goto error;
+			}
+			if (len >= max_len) {
+				dbg("string length %zu exceeds destination size %zu",
+				    len, max_len);
+				stack_dump();
+				goto error;
 			}
 
 			memcpy(s, p, len);
@@ -514,7 +518,7 @@ static ssize_t scan_data(char *buf, int buf_size, const char *fmt, ...)
 			if (p + 4 > endp) {
 				dbg("buffer to short for int32_t");
 				stack_dump();
-				return -1;
+				goto error;
 			}
 			i32 = va_arg(ap, int32_t *);
 
@@ -530,7 +534,7 @@ static ssize_t scan_data(char *buf, int buf_size, const char *fmt, ...)
 			if (p + 8 > endp) {
 				dbg("buffer to short for uint64_t");
 				stack_dump();
-				return -1;
+				goto error;
 			}
 			u64 = va_arg(ap, uint64_t *);
 
@@ -547,6 +551,10 @@ static ssize_t scan_data(char *buf, int buf_size, const char *fmt, ...)
 	va_end(ap);
 
 	return p - buf;
+
+error:
+	va_end(ap);
+	return -1;
 }
 
 /*
@@ -652,7 +660,7 @@ static int dev_get_dev_info(uint32_t seq, char *cmd, int fd,
 	char sysname[REMOTE_BUF_SIZE];
 	int ret;
 
-	ret = scan_data(buf, size, "%s", sysname);
+	ret = scan_data(buf, size, "%s", sysname, sizeof(sysname));
 	if (ret < 0)
 		goto error;
 
@@ -788,7 +796,7 @@ static int dev_open(uint32_t seq, char *cmd, int fd, char *buf, ssize_t size)
 		goto error;
 	}
 
-	ret = scan_data(buf, size, "%s%i", sysname, &flags);
+	ret = scan_data(buf, size, "%s%i", sysname, sizeof(sysname), &flags);
 	if (ret < 0) {
 		free(desc);
 		goto error;
@@ -971,7 +979,10 @@ static int dev_dmx_set_section_filter(uint32_t seq, char *cmd, int fd,
 	unsigned char filter[17], mask[17], mode[17];
 
 	ret = scan_data(buf, size, "%i%i%i%s%s%s%i",
-			&uid, &pid, &filtsize, filter, mask, mode, &flags);
+			&uid, &pid, &filtsize,
+			(char *)filter, sizeof(filter),
+			(char *)mask, sizeof(mask),
+			(char *)mode, sizeof(mode), &flags);
 	if (ret < 0)
 		goto error;
 
@@ -1168,9 +1179,11 @@ static int dev_set_parms(uint32_t seq, char *cmd, int fd,
 		old_lnb = par->lnb->name;
 
 	ret = scan_data(p, size, "%i%i%s%i%i%i%i%s%s",
-			&par->abort, &par->lna, new_lnb,
+			&par->abort, &par->lna, new_lnb, sizeof(new_lnb),
 			&par->sat_number, &par->freq_bpf, &par->diseqc_wait,
-			&par->verbose, default_charset, output_charset);
+			&par->verbose,
+			default_charset, sizeof(default_charset),
+			output_charset, sizeof(output_charset));
 
 	if (ret < 0)
 		goto error;
@@ -1341,7 +1354,7 @@ static void *start_server(void *fd_pointer)
 	int fd = *(int *)fd_pointer, ret, flag = 1;
 	char buf[REMOTE_BUF_SIZE + 8], cmd[CMD_SIZE], *p;
 	ssize_t size;
-	uint32_t seq;
+	uint32_t frame_size, seq;
 	int bufsize;
 
 	if (verbose)
@@ -1364,13 +1377,21 @@ static void *start_server(void *fd_pointer)
 		size = recv(fd, buf, 4, MSG_WAITALL);
 		if (size <= 0)
 			break;
-		size = (uint32_t)buf[0] << 24 | (uint32_t)buf[1] << 16 |
-		       (uint32_t)buf[2] << 8 | (uint32_t)buf[3];
-		size = recv(fd, buf, size, MSG_WAITALL);
-		if (size <= 0)
+		frame_size = (uint32_t)buf[0] << 24 | (uint32_t)buf[1] << 16 |
+			     (uint32_t)buf[2] << 8 | (uint32_t)buf[3];
+		if (frame_size > sizeof(buf)) {
+			if (verbose)
+				dbg("data length too big: %u", frame_size);
+			send_data(fd, "%i%s%i%s", 0, "log", LOG_ERR,
+				  "data length too big");
+			break;
+		}
+
+		size = recv(fd, buf, frame_size, MSG_WAITALL);
+		if (size <= 0 || (uint32_t)size != frame_size)
 			break;
 
-		ret = scan_data(buf, size, "%i%s",  &seq, cmd);
+		ret = scan_data(buf, size, "%i%s",  &seq, cmd, sizeof(cmd));
 		if (ret < 0) {
 			if (verbose)
 				dbg("message too short: %ld", size);
-- 
2.43.0


