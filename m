Return-Path: <linux-media+bounces-66249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STPnHRQ/RWpR9QoAu9opvQ
	(envelope-from <linux-media+bounces-66249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:23:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194A6EFBF8
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:23:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oBne4bQg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66249-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66249-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D0B9314F22B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAC9364931;
	Wed,  1 Jul 2026 16:16:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D12F1FD0
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922601; cv=none; b=jRzvfmBfW/IRxL8UDc5xPTktMGGOT9ijI759g3vSol1eZy2WMfg76f3890KgmoRSGAjApWK3qM+0J50gU+UpOLTlfYG4jcGk815UucmUEBc58TfbvDLYHwF1Om25OIgwsGAuc7nCcSXUITO/cDnw22cdRHfC2OVC0aMiBhHTqYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922601; c=relaxed/simple;
	bh=ozpwPaA0w+QjayUfndZNIG8hs+AyrILUcnu2wTnkTu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djYeagc7mS6DqiH9927VHsdsSxIpJLIfRaiNP+5/k0pc2TtNu61wS13XvO8KHJ09WkNEi71x8YE6loSOG8bcjRJJF240BOuSdbbj0oSdj2tHw84jf1XVRgQ4HGRX66MBWzs0EuuJx6T4r496zV5rn258LE/65RsOKUP2DqsG0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBne4bQg; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7ab2b9dceso2154175ad.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922599; x=1783527399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9duww/9n/zYVsBRyTBQ5AEot5qHPgR/+kguChkwrIaQ=;
        b=oBne4bQgo7v7IOy13DUIjAYzfzxf53gq2ylrrjOAty+pBLxs6eLwWWP45pS4K4AbxH
         +g43hbgdCnryJ5WbLyFIybDjNatdKQeFZJxpYqNhxD2zPsocDLUJqRrZGgZarlGiQRrE
         A9oviZFuY7Jf7tMQaPXn6zHXD5Vb7QAWCPneEwPaUZNnY16UtLXrZvZk+jIVFGDXUnkm
         BMji6QXwYhdF9Sf19ocuzZhUrip2A93Fp3393cX+Te3L9NMPaIQ9t7U21yHeomNxHayv
         u86/TdKrvc3bfgwfXXnPUchJs93itDMPGaTvpgkZk9ja914S4bNB0TSZ1YbilDKN5DgT
         1K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922599; x=1783527399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9duww/9n/zYVsBRyTBQ5AEot5qHPgR/+kguChkwrIaQ=;
        b=V64t1sR8NxnlpNCvWLvl0OobVkIhNU0i6V4DIVKF/llLeWoMBKgwFvUb+xbtfmkDws
         E129YzoREhYY87fSQbm6kYjw5LdsTWLLaOvIEDBIwXCioewQh/59kkB+LANSr3Un5XyY
         PuyMvKlazKW9IlT2sOchu8uFKE02Gp+2lneH3HEwvfIozHsw9bmxv0uhBCDwvhSUV2Hy
         m2ERQ+fFoHwFSgb/oB7zE7WQya/qE9b9xX6XesQg3ev5r54MtAG2YKuU0sn4xeKaa59d
         6UqhXCqJHzHVOOmnKderv7LWqYD1cV//JeJexc139Q1bEqPk3Funy4noipnfou8dzBuz
         pDuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Op4Uh5K1IPv1WARISMKw9pvsuhgummC4wPsv6B/m08g4wm67J593fbo3aK9vgP9/9ItWF2OtqQQ6dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMpXX3rjP6V+CXEGgMMd1GQxkLKoZ8fDkpVGC1dbKcu3JkTmLz
	lYy19weGQwedolTYkc0388OBBXnjlqMAyXb3+ziF9/wx60qIkd3ch09Q
X-Gm-Gg: AfdE7ckjtIEwekUwFpRCYFFy+0YZizar0p06FRWtGYaoKDDMGhTbH68NZn0hcbFHtXS
	RpWrX/8RV/3YydiU27/K5ocETxt6wLwrDKqNq00SIP30DjBdhI8soi1r8MRfvMKK5Q3P2i0cy21
	pOcYuKiYvWNP3ItZeu3kVViCx7X/mXs4rL5EVZRnZsTqzj35JF0WdzFwj3p2pt1aP0FrSjoq55s
	5v9uYZf/aX55GCsCreMffp/Mo8S5nxJ4T8lMbg0zp75CE+DSAKj80UqbrxWUYPEWwuBjHSlegRJ
	mFTCDfmpNxPbdY9OBeW/soMt1V+zx9J444fcv60LTFFZ9h06LHUHuk/QtW2C7YTeL+l7owX2h62
	KctLScGeFlVNioYBuCn6KZTRKSOH8wATjIuJN59whIjoibFaBAWtjd1cN+8XS4HNtVFFb/MJaO+
	DxKyWBpNOg
X-Received: by 2002:a17:90b:5386:b0:364:be8f:1d86 with SMTP id 98e67ed59e1d1-380aa2978d3mr1352639a91.8.1782922599407;
        Wed, 01 Jul 2026 09:16:39 -0700 (PDT)
Received: from desktop.lan ([2600:1700:78e0:fd0::14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc21casm20898228eec.10.2026.07.01.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:16:38 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	matt@mattwardle.net,
	error27@gmail.com,
	mugrinphoto@gmail.com,
	Neal Patalay <nealpatalay0@gmail.com>
Subject: [PATCH] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Wed,  1 Jul 2026 09:15:34 -0700
Message-ID: <20260701161534.31152-1-nealpatalay0@gmail.com>
X-Mailer: git-send-email 2.55.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,mattwardle.net,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66249-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:matt@mattwardle.net,m:error27@gmail.com,m:mugrinphoto@gmail.com,m:nealpatalay0@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1194A6EFBF8

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy size dropped
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack. Address these shortcomings
and reduce stack usage with a single 256 byte buffer via a new helper
function, ia_css_debug_build_info().

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
 .../pci/runtime/debug/src/ia_css_debug.c      | 174 ++++++------------
 1 file changed, 59 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..9b4dd3b429da 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,25 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size, int *offset, bool flag,
+				    const char *flag_str, size_t flag_str_size, int *line_len)
+{
+	if (flag) {
+		/* If new line length exceeds max line length, replace the last ',' with a "\\n" */
+		if (*line_len > 0 && info_size - *offset >= 2 &&
+		    *line_len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+			info[*offset - 1] = '\\';
+			info[*offset] = 'n';
+			*offset += 1;
+			*line_len = 0;
+		}
+
+		int len_written = scnprintf(info + *offset, info_size - *offset, "%s,", flag_str);
+		*offset += len_written;
+		*line_len += len_written;
+	}
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1213,48 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	/* Guard in case of binaries that don't have any binary_info */
 	if (stage->binary_info) {
-		char enable_info1[100];
-		char enable_info2[100];
-		char enable_info3[100];
-		char enable_info[302];
+		char enable_info[256];
+		int offset = 0;
+		int line_len = 0;
 		struct ia_css_binary_info *bi = stage->binary_info;
 
-		/* Split it in 2 function-calls to keep the amount of
-		 * parameters per call "reasonable"
-		 */
-		snprintf(enable_info1, sizeof(enable_info1),
-			 "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
-			 bi->enable.reduced_pipe ?	"rp," : "",
-			 bi->enable.vf_veceven ?		"vfve," : "",
-			 bi->enable.dis ?		"dis," : "",
-			 bi->enable.dvs_envelope ?	"dvse," : "",
-			 bi->enable.uds ?		"uds," : "",
-			 bi->enable.dvs_6axis ?		"dvs6," : "",
-			 bi->enable.block_output ?	"bo," : "",
-			 bi->enable.ds ?			"ds," : "",
-			 bi->enable.bayer_fir_6db ?	"bf6," : "",
-			 bi->enable.raw_binning ?	"rawb," : "",
-			 bi->enable.continuous ?		"cont," : "",
-			 bi->enable.s3a ?		"s3a," : "",
-			 bi->enable.fpnr ?		"fpnr," : "",
-			 bi->enable.sc ?			"sc," : ""
-			);
-
-		snprintf(enable_info2, sizeof(enable_info2),
-			 "%s%s%s%s%s%s%s%s%s%s%s",
-			 bi->enable.macc ?		"macc," : "",
-			 bi->enable.output ?		"outp," : "",
-			 bi->enable.ref_frame ?		"reff," : "",
-			 bi->enable.tnr ?		"tnr," : "",
-			 bi->enable.xnr ?		"xnr," : "",
-			 bi->enable.params ?		"par," : "",
-			 bi->enable.ca_gdc ?		"cagdc," : "",
-			 bi->enable.isp_addresses ?	"ispa," : "",
-			 bi->enable.in_frame ?		"inf," : "",
-			 bi->enable.out_frame ?		"outf," : "",
-			 bi->enable.high_speed ?		"hs," : ""
-			);
-
-		/* And merge them into one string */
-		snprintf(enable_info, sizeof(enable_info), "%s%s",
-			 enable_info1, enable_info2);
-		{
-			int l, p;
-			char *ei = enable_info;
-
-			l = strlen(ei);
-
-			/* Replace last ',' with \0 if present */
-			if (l && enable_info[l - 1] == ',')
-				enable_info[--l] = '\0';
-
-			if (l > ENABLE_LINE_MAX_LENGTH) {
-				/* Too big for one line, find last comma */
-				p = ENABLE_LINE_MAX_LENGTH;
-				while (ei[p] != ',')
-					p--;
-				/* Last comma found, copy till that comma */
-				strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
-
-				ei += p + 1;
-				l = strlen(ei);
-
-				if (l <= ENABLE_LINE_MAX_LENGTH) {
-					/* The 2nd line fits */
-					/* we cannot use ei as argument because
-					 * it is not guaranteed dword aligned
-					 */
-
-					strscpy(enable_info2, ei, umin(l, sizeof(enable_info2)));
-
-					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
-						 enable_info1, enable_info2);
-
-				} else {
-					/* 2nd line is still too long */
-					p = ENABLE_LINE_MAX_LENGTH;
-					while (ei[p] != ',')
-						p--;
-
-					strscpy(enable_info2, ei, umin(p, sizeof(enable_info2)));
-
-					ei += p + 1;
-					l = strlen(ei);
-
-					if (l <= ENABLE_LINE_MAX_LENGTH) {
-						/* The 3rd line fits */
-						/* we cannot use ei as argument because
-						* it is not guaranteed dword aligned
-						*/
-						strscpy(enable_info3, ei,
-							sizeof(enable_info3));
-						snprintf(enable_info, sizeof(enable_info),
-							 "%s\\n%s\\n%s",
-							 enable_info1, enable_info2,
-							 enable_info3);
-					} else {
-						/* 3rd line is still too long */
-						p = ENABLE_LINE_MAX_LENGTH;
-						while (ei[p] != ',')
-							p--;
-						strscpy(enable_info3, ei,
-							umin(p, sizeof(enable_info3)));
-						ei += p + 1;
-						strscpy(enable_info3, ei,
-							sizeof(enable_info3));
-						snprintf(enable_info, sizeof(enable_info),
-							 "%s\\n%s\\n%s",
-							 enable_info1, enable_info2,
-							 enable_info3);
-					}
-				}
-			}
-		}
+#define ADD_INFO(flag, flag_str) ia_css_debug_build_info(enable_info, sizeof(enable_info), \
+		&offset, bi->enable.flag, flag_str, sizeof(flag_str), &line_len)
+
+		/* Build string in enable_info buffer */
+		ADD_INFO(reduced_pipe, "rp");
+		ADD_INFO(vf_veceven, "vfve");
+		ADD_INFO(dis, "dis");
+		ADD_INFO(dvs_envelope, "dvse");
+		ADD_INFO(uds, "uds");
+		ADD_INFO(dvs_6axis, "dvs6");
+		ADD_INFO(block_output, "bo");
+		ADD_INFO(ds, "ds");
+		ADD_INFO(bayer_fir_6db, "bf6");
+		ADD_INFO(raw_binning, "rawb");
+		ADD_INFO(continuous, "cont");
+		ADD_INFO(s3a, "s3a");
+		ADD_INFO(fpnr, "fpnr");
+		ADD_INFO(sc, "sc");
+		ADD_INFO(macc, "macc");
+		ADD_INFO(output, "outp");
+		ADD_INFO(ref_frame, "reff");
+		ADD_INFO(tnr, "tnr");
+		ADD_INFO(xnr, "xnr");
+		ADD_INFO(params, "par");
+		ADD_INFO(ca_gdc, "cagdc");
+		ADD_INFO(isp_addresses, "ispa");
+		ADD_INFO(in_frame, "inf");
+		ADD_INFO(out_frame, "outf");
+		ADD_INFO(high_speed, "hs");
+
+#undef ADD_INFO
+
+		/* Replace last ',' with '\0' */
+		if (offset > 0)
+			enable_info[offset - 1] = '\0';
+		else
+			enable_info[0] = '\0';
 
 		dtrace_dot("node [shape = circle, fixedsize=true, width=2.5, label=\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
 			   bin_type, blob_name, enable_info, blob_name, id);
-- 
2.54.0


