Return-Path: <linux-media+bounces-66943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F8TJMHbSTWpc+gEAu9opvQ
	(envelope-from <linux-media+bounces-66943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 06:30:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828D721987
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 06:30:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=r3JIZ7FW;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66943-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66943-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1274301ECD7
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 04:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038F7175A6C;
	Wed,  8 Jul 2026 04:30:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF42DF13A
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 04:30:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783485036; cv=none; b=WcY8LHdXAp3mHu9XBW0xEagdTWIOSq74rOjP9WEuHo+AJuNW+mhe2RsO9SUpgIaC1WSRyy77h8Qjxg7II5tYwBydqnYEE0Lv5JTQzObPgK+1W+4JsBaDdaPwoP9KwKEPeBBAnVTT3kks4v9k3zETjvPwYWWvJfahgTdDGAiX7t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783485036; c=relaxed/simple;
	bh=q9e7v5hnotE3cx4kjW2kI5fs9AKp4lheGRDb40amvh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaEZIdYK1vHUdEKTJsyOyu2tqssqz8udynwyR/r3cPZylhq+tZHka2fpCPK2KfRNxATH3o9rXKqj0u7FiTUeneOMKdYhMC39mHYnAoTbSK9Wif1/29wFMxF3xY8VdUf5mkOL6XsNoug3M/6t9uAteWFjOEZCj1uAY2TzfVNKiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3JIZ7FW; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso30325a91.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 21:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783485034; x=1784089834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPK8V+IueT5TCH9i7GirtjFyF+3KEvTuk3MZShfYogY=;
        b=r3JIZ7FWsnvymsLSCKRjp2sD83NiyucjsmoXrEJ84tAGGdh3B69laGKHtERHcrO7JI
         XzyAKaVcduMMJWH+4U0ZLZmhTApHzadkvUGbGqZ4YOszT3c8aweoV+7HDIlR8QfbRNqP
         qcoP9gcpyIRQ1cZFqSdBmT5SX/TdJRLCEzqeOXWoeVo668JRcWN0IMOthJ36fWgAvSOs
         m0jMBvMTLNc42Pf9VsyMvvBOXPEwyk83uS2lkRo4I+mUw9Ygr8IOAfF6ZND38RKqi9gk
         paZribsIVcnBWJb0pXSiiBOIHemxk8G36Sa0Vi+M3Q7qzrZOqqC0xU4nfXJeHLaC8E+W
         Yn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783485034; x=1784089834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPK8V+IueT5TCH9i7GirtjFyF+3KEvTuk3MZShfYogY=;
        b=CbHp02t/PzbUB9Xv2TdUOk8x/1ifyRYgyKIOPfBVzTe4J/RQoqPoUTtZd3L4G4LSwf
         KPBwbRn/Q4yJkEaUIb8GPtB3fa6jbFPK9fyVk/e6Hik7F+dmV8GgRXOZ93Jc1F5lTRSJ
         9spAMaMIPn7ptxNO8LW5L0jDUzAL3gGY5H1d9VPAhyMFrXqJdlrc1F3hfe7ngNJYZgFM
         quO4hn0FKJZEVJjRIfBrz/l2gci4/iFYi+xV+JDwxCOVtNMDlw30EyeAiFz4PZ+UW+8v
         keOs9fcBYUq5UnoWH9XMqkAlFLz63wKe3F5kIFhcRdfDOGiaSEXtuDGb/YERAjDlL4wn
         tV4g==
X-Forwarded-Encrypted: i=1; AHgh+RojT0816t5sQZuwiGdIeYmImbximCbdgTnmfQjWs1i01kif1AiQ5tWzF/EOmK4+TR1nya26uVEvCwa/JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylLkh0LERyDyko6Sh7AtlniFhJnW3zzJu0qtucducrGEa6p5eQ
	uJB4MBw3NbqrTvdK4jlwQcDkwjEVkj0DpV1ASyamne3YWFaNIv3eTvSt
X-Gm-Gg: AfdE7cmjM9RKqjz7QB9Osb8zbMSTdkq6Dec73G+7QNly7LU5uElf61HlkfLEozrKhPB
	4Sqx17Wm8xgLv5g8k937QxvPrpYcgtwJf2BHQ7BmS9501bKnH6Vor96LKR1hZShdDQ91zQtiY74
	sfzu/JSWD6x2wfcR8cX/MzNNNl+pl9Wghm+3OkOJN0BzSkWt9Nisa+/snhZrrJF/tOyn4AWSCy8
	/M2JG6MXRWC1wOIuCoEdjfXuvkot3RvjfR5V/2G6v3YmwwylSoObLjw3WjRCi3nkNPGYFtucS9r
	00Ulmp23Qu0CNLV9sNK2n42W1R+l1t/MAb12eeRVTgHvxUlqLlHnLNJz0XMSaDy6mclKAAgTi2L
	L71CvRB+Vimt9tZxaZ7NGFQ/F1RtSHjZIny5MDnTuPVlP5UpHR73kXiVD/Qa53AnUAKJBrbiZdA
	==
X-Received: by 2002:a17:90b:17ca:b0:381:abcc:c8d8 with SMTP id 98e67ed59e1d1-3894014e3fbmr760905a91.1.1783485034159;
        Tue, 07 Jul 2026 21:30:34 -0700 (PDT)
Received: from desktop.lan ([2600:1700:78e0:fd0::24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm7598852eec.21.2026.07.07.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 21:30:32 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	matt@mattwardle.net,
	mugrinphoto@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Neal Patalay <nealpatalay0@gmail.com>
Subject: [PATCH v5] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Tue,  7 Jul 2026 21:29:39 -0700
Message-ID: <20260708042939.40420-1-nealpatalay0@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,mattwardle.net,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66943-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:matt@mattwardle.net,m:mugrinphoto@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:nealpatalay0@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2828D721987

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy() size drops
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack and truncates all output
debug information after three lines. Fix the strscpy() bug, reduce
stack usage with a single 256 byte buffer, and remove the three line
limit via a new helper function, ia_css_debug_build_info().

Fixes: 662fb4fceb1a ("media: atomisp: get rid of a string_support.h abstraction layer")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
v5:
- Simplified by removing truncation logic and offset check
- Changed commit message to reflect removal of truncation logic
- Elaborated in comments and documented offset behavior

v4:
- Changed logic to truncate output after the third line
- Added offset check to avoid writing beyond bounds
- Fixed indentation inside helper function
- Separated variable definitions from code in helper function
- Fixed comment in helper function

v3:
- Moved "len_written" variable declaration to top of helper function
- Added local variables to track values inside helper function
- Fixed macro indentation
- Removed loop out of macro definition

v2:
- Fixed strscpy typo in commit message
- Changed Fixes tag to point to the actual buggy commit
- Dropped "flag" parameter from helper function and moved check to the macro
- Split long lines to conform with subsystem character limit
---
 .../pci/runtime/debug/src/ia_css_debug.c      | 190 +++++++-----------
 1 file changed, 76 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..5fbd37ba78f9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,34 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size,
+				    int *offset,
+				    const char *flag_str, size_t flag_str_size,
+				    int *line_len)
+{
+	int len = *line_len;
+	int off = *offset;
+	int len_written;
+
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n". Invalid
+	 * memory access via len > 0 && off == 0 is
+	 * impossible.
+	 */
+	if (len > 0 && info_size - off >= 2 &&
+	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		info[off - 1] = '\\';
+		info[off] = 'n';
+		off += 1;
+		len = 0;
+	}
+
+	len_written = scnprintf(info + off, info_size - off, "%s,", flag_str);
+	*offset = off + len_written;
+	*line_len = len + len_written;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1222,57 @@ ia_css_debug_pipe_graph_dump_stage(
 
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
+		/*
+		 * Build comma separated flag string word wrapped at
+		 * ENABLE_LINE_MAX_LENGTH characters using binary_info
+		 * flags in enable_info buffer. enable_info is used to
+		 * populate nodes in a graph visualization for debugging.
 		 */
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
+#define ADD_INFO(flag, flag_str)						\
+	if (bi->enable.flag)							\
+		ia_css_debug_build_info(enable_info, sizeof(enable_info),	\
+					&offset,				\
+					flag_str, sizeof(flag_str),		\
+					&line_len)
+
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
2.55.0


