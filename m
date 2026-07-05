Return-Path: <linux-media+bounces-66621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dh5FGCkKSmoA9wAAu9opvQ
	(envelope-from <linux-media+bounces-66621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 09:39:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A339B70939F
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 09:39:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lIYCr14l;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66621-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66621-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47003010140
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 07:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EAE360EF5;
	Sun,  5 Jul 2026 07:39:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D913360EC4
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 07:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783237150; cv=none; b=ZqwZL64YTkdks2DOSRi/XqpSRtMg+5NKv0G0AMNuK5+7h+M0ld5Wh61zBrWYSSOJdMgD388D5U4OwlkHHdc9YT7nnheNRIV8i66snIqlYkPVNs2Vh6PrHpLZq4ZsOABWL/zIUholMwf0DMpJQkqPGMdRyrXkf1/dkAM00cLsNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783237150; c=relaxed/simple;
	bh=HjeCkmkrEZBv8g3eS5rqFaD5o8OMdcgrVvCwWBMQ07Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dw/Om/fnQbkoUuwD14kCyr+ybhMz0M9cAT9/LoBiznJ0BLefDTtgCImX6TW/UvdNwjfe2LU68ZNL6MXW/3q+LE7REQafyMObrNqdbfgjlp/WRVDGPhY1jZbwpLB4qa2uDEuP6Ipi7SAN5x9b462ZGzPrMm8U9uBYSZHytubfaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIYCr14l; arc=none smtp.client-ip=74.125.224.47
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6649beca11aso218271d50.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783237147; x=1783841947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jvuBiHYTDBytNW3yLYYgf9Uuwz/sK5RIDor3kGdnP0=;
        b=lIYCr14ldeI/R8S0EdxE7TALVqaceK3rMCyxbcUJltaR/yKAqgvkcObY0it5gkWJXE
         Nvp1alLSJl562mmkgwQwt0DemjNFaeyyB+w1ZwY57eFXWxyWBLUwmVWEefe/ZxkEnhIZ
         pQpK+l/Owy7tcmjP6w5859Irh0+TP6ZHgAbkcwOK4V8rtTq8HEEDELsUg6x4kFWExCv7
         2bQTHf7tRAOvO/h48s7HoK2TM12peAfK5TDRUAP6xYLlA7jH82uGenFrU0sGSmaR0qhg
         WMaR5NUhMYkXGm3pOl+tWzWWDhl5Wr8qLuH8mjvPG3tkQ3n0xICrdDGdJ2gmccBMoRw9
         uMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783237147; x=1783841947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jvuBiHYTDBytNW3yLYYgf9Uuwz/sK5RIDor3kGdnP0=;
        b=BZsH6DyukugsLKcKd7OkxFzjQKV4dB5uHTd9AP95dk5WBgaB6jh9aP2S4anZpk4dsD
         gw8g/FMwdZv4YVDd7SQkLSyqjPGs6yUrto3wkslIUkE5vJs58+0HpgLdSOzxGziQlCRu
         N44rdSMcu1jvVMvNCOM/wZxoKXVm9euAgkg2AV/RU3WhIN+9FdIWK1l/jY+mICJXIYeA
         FKU6Xp1ABXgnzcP7SDyJOQcNBc/UoXdmlAClq3rPC0tW6dWrzL2EUDZtqCPf/dzLILzE
         1wE4glQoPB1bTvFFnLaqPGHGAYtX5lv/o9xI4HDOCbNC6t1mp5/+3XlHKNepDzhiR7iH
         jY8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3V0/RZDQmOQnLBv4QaZ9z67ZLz3+jkb9qp/OR4Lu0FEoIThOjVs9hnml+rrbMDlc/2GCwM9rDk6Clww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlcZtNwrC3tGy/0QhUw1DSXf4CLR//LzaQ5FrX8VuIrr4Us16Y
	qBLqdQT9XuOxFVJXqYVNEJL87w2pOpq5AcCqJz4UPoYIPdemkXwygV6/
X-Gm-Gg: AfdE7cnwajeGcrdioT86KAUTGhU5qYMO0BRE0HoA6XbjeIV9eBv8pqaNAUUMrCE+u22
	TRGO8teRqZ/4A6XTqls9bilw937V2gcs1f5SIQhNnzVZbQZ/2wtUaPjVgY6gsq8mkLUiiFSTO6q
	PcV7sMEL25AkXOlm1hZ5x2/4ka5RTpDMjFa5qqTeRHLDBrBrfAgQM8jg8hH4siAo99t/TdQlLik
	jjZc8l3Bp11T6rkEbvUgnYQS5HluQDZzWFi4cwnnjTgTE3cRSxG54CVRFyTMid047E6ch3OrIrK
	rGmhoq6VLWrnyl9kgOIpJaCVhCyK/B7czK/8sRVcC3lYRrFxyBFT30OTpv/JsAoL2PaI0CX3Ml0
	mi5Wnva4Ivl0Kdv+h9Br6PtnqPo1NpJKsOZw8ivL0Bz0qhKFa7e9gIxte8CsBBdvHexUf
X-Received: by 2002:a05:690c:6d83:b0:7fd:6d19:5a8d with SMTP id 00721157ae682-81723da6a4fmr59711097b3.8.1783237147540;
        Sun, 05 Jul 2026 00:39:07 -0700 (PDT)
Received: from desktop ([2600:1700:78e0:fd0::27])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81448cd06a1sm43212147b3.21.2026.07.05.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:39:07 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mugrinphoto@gmail.com,
	matt@mattwardle.net,
	nealpatalay0@gmail.com
Subject: [PATCH v3] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Sun,  5 Jul 2026 00:38:44 -0700
Message-ID: <20260705073844.146578-1-nealpatalay0@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66621-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,m:nealpatalay0@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A339B70939F

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy() size dropped
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack. Address these shortcomings
and reduce stack usage with a single 256 byte buffer via a new helper
function, ia_css_debug_build_info().

Fixes: 662fb4fceb1a ("media: atomisp: get rid of a string_support.h abstraction layer")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
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
 .../pci/runtime/debug/src/ia_css_debug.c      | 185 +++++++-----------
 1 file changed, 70 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..e45334f7c2c4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,32 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
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
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n"
+	 */
+	if (len > 0 && info_size - off >= 2 &&
+	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		info[off - 1] = '\\';
+		info[off] = 'n';
+		off += 1;
+		len = 0;
+	}
+
+	len_written = scnprintf(info + off, info_size - off,
+				    "%s,", flag_str);
+	*offset = off + len_written;
+	*line_len = len + len_written;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1220,52 @@ ia_css_debug_pipe_graph_dump_stage(
 
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
+#define ADD_INFO(flag, flag_str)						\
+	if (bi->enable.flag)							\
+		ia_css_debug_build_info(enable_info, sizeof(enable_info),	\
+					&offset,				\
+					flag_str, sizeof(flag_str),		\
+					&line_len)
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
2.55.0


