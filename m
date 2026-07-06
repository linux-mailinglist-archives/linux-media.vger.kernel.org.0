Return-Path: <linux-media+bounces-66646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6qqsBGPySmpUKAEAu9opvQ
	(envelope-from <linux-media+bounces-66646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 02:10:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0070BCEF
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 02:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WgVkStzk;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66646-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66646-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8390F300A8F3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 00:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08B875809;
	Mon,  6 Jul 2026 00:10:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CBD35898
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 00:10:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296603; cv=none; b=mNYWxJ/H70Zn4Ay/g/DWzsxf++LHljQkhpbFBGh/jbdpCUlgwh7ePqdpA9urJXbSpgt6FosQfCZfrHCWHhW4g0sqdXS/FLojCP2MY/GK+DAhVys6jG2znf3Zx93f9WszfzZ0VGtyT2tAIpuwm2YrfHI9dsdf/As6Pap+8Gohjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296603; c=relaxed/simple;
	bh=X1Ah+l3/ZB5oCV+QF+h+tusCtXKrXutWylNwgaixmVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eahL4GQA7UUegPF2G48vaB9snvMh/5WTwC6CxQWE6SMhn64Am23xPC6JbWMz7B1O1c9c7huByRh6+vnCGcfZxT03bQGwcrPn49IEqMON65BT8Pi3ellOibzRQFmbGBHTpPRsqQDbv4szAvamwzkyv4YVhoEKBKb/XHxiU/Q7tDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgVkStzk; arc=none smtp.client-ip=74.125.224.53
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6649beca11aso260164d50.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 17:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783296601; x=1783901401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WoWipZJJsquAFbGvSKcXoTo7sOkuUz1BZt1zlYOduU4=;
        b=WgVkStzky652lCvhgsTnlx9e5r+3DNc8hHYhjQGl+fftl5Bmjq6YuFLOBVu1pmKk1V
         C7mcfM/Yh2dRjjA278jKi/cn66K9UbKOUHuLjtopufvv0DeDtDqhHf/FrbwmLHlfJ3hC
         Z7ooLml/NbzDNcJrBLnQH8F80KfvPOaklNh3JGv0fRgvyQtw08+3EszGAxLiIvpDG7r6
         i3VmedH6i9+uZZ3sRwfvP3qxU/UmlRyKlS4lhew29aDqqI60OQWFz96ocGRiXpxnqfzU
         A0C3a+uHK2v78Z/RHzIvMp+bIyR1bJTl73kvNM+Ch6Fonz+y8wG+D6U5s5A6rbkiFFO7
         RJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296601; x=1783901401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoWipZJJsquAFbGvSKcXoTo7sOkuUz1BZt1zlYOduU4=;
        b=B7xSTdYuhySR2AeJbUDO2ta29ajswyGFbyWOMTW0eN1OtDEZ9e3RKX+XxeIXuzfhyV
         9UGRiQYckGId9ePxnYRvt9auJe4EoeKzczOmTJI5CSvTo15r/YS30KF8j/rgImuHU2Gu
         1viHC7gHxSaMhT3S7dambKlTMtsDdL8woJUbQn22Ef+3kd3QfRkci8jObeLQGz0gWlRs
         T8gyMKeC+LUZONeM8KCBMVm98PBuJsIBy5EQwyv6PCTOqNbSP19O3dXocW6HwTYx7lI3
         q8Xcv9vIGg+9CYAekSYub6fvKhm2Nn+IN5GkilsOjfb15+CK3X6iSJecsOmOPzjW/cf9
         sPpA==
X-Forwarded-Encrypted: i=1; AHgh+RpJrRcOwGivyR/7ClG2TmJmijZN+2v+Oowe1iD8KMma8GIFZvwukif7YL+sfOJ1+iqncQBVCUa/dtNQXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFmnnFmkJVWbsk7sPJof3vhkfIJpX9noKfj9uXmqmAdYxzt3/S
	7SE5Q+NqouWve9kXre7U6rhiamiwUTav/MuEYvqudwSXq5b0CRGVrxqU
X-Gm-Gg: AfdE7cmsNGVONVwn7bNO0fzR67kO44MrwSG97rANtf/8s4iiUxLslir7BJ0RJyYulgi
	CUtKl8izKCkJ2UgUsEArHx7xlts3C6hV+MrNFb2IYf124d4QZGEtGkhJglmlrAP0WVcfld9F/Sw
	WX+gRKSmkE6OlhomTG/Ogy3uclxZQnj0H1DfGAU63QWW6xzXEy7CdY/BEeI4hF7Y4+emWrzMPt4
	R7p+RwVePqeUDWAvCxD9Qi9vmxHkJsPvSg23e8s+0sm3aIccAVEa6tQmT4xBCeyLaAlKZpv5sEF
	0YwVaBXePoU+mvFLaKwUQfTA1RBEuA3S4pTolhuyA90o+4LYDF9Ohzt3nS/xDvBFfgOPFH/EULC
	SYJ8e1VMForD9lHMFC8Asvn8zpYi7UkGNMEw141ejPWj8ztyvhNs2LnMXFVAvoL1E1WA+
X-Received: by 2002:a05:690e:1241:b0:667:541c:2282 with SMTP id 956f58d0204a3-667541c23efmr5399080d50.9.1783296600821;
        Sun, 05 Jul 2026 17:10:00 -0700 (PDT)
Received: from desktop ([2600:1700:78e0:fd0::27])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-666408c2597sm4008673d50.21.2026.07.05.17.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 17:10:00 -0700 (PDT)
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
Subject: [PATCH v4] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Sun,  5 Jul 2026 17:07:38 -0700
Message-ID: <20260706000738.18478-1-nealpatalay0@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66646-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,m:nealpatalay0@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CA0070BCEF

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy() size dropped
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack. Address these shortcomings
and reduce stack usage with a single 256 byte buffer via a new helper
function, ia_css_debug_build_info().

Fixes: 662fb4fceb1a ("media: atomisp: get rid of a string_support.h abstraction layer")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
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
 .../pci/runtime/debug/src/ia_css_debug.c      | 198 ++++++++----------
 1 file changed, 83 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..19c4e0246c34 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,43 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size,
+				    int *offset,
+				    const char *flag_str, size_t flag_str_size,
+				    int *line_len,
+				    int *num_lines)
+{
+	int len = *line_len;
+	int off = *offset;
+	int lines = *num_lines;
+	int len_written;
+
+	if (lines > 3)
+		return;
+
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n".
+	 */
+	if (len > 0 && off > 0 && info_size - off >= 2 &&
+	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		if (lines >= 3) {
+			*num_lines = lines + 1;
+			return;
+		}
+		info[off - 1] = '\\';
+		info[off] = 'n';
+		off += 1;
+		len = 0;
+		lines += 1;
+	}
+
+	len_written = scnprintf(info + off, info_size - off, "%s,", flag_str);
+	*offset = off + len_written;
+	*line_len = len + len_written;
+	*num_lines = lines;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1231,54 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	/* Guard in case of binaries that don't have any binary_info */
 	if (stage->binary_info) {
-		char enable_info1[100];
-		char enable_info2[100];
-		char enable_info3[100];
-		char enable_info[302];
+		char enable_info[256];
+		int offset = 0;
+		int line_len = 0;
+		int num_lines = 1;
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
+					&line_len,				\
+					&num_lines)
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


