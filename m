Return-Path: <linux-media+bounces-65779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OK0MKaJoP2rFSwkAu9opvQ
	(envelope-from <linux-media+bounces-65779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:07:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2676D13FC
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:07:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=Ad23KUMs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65779-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65779-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E7DE30329A2
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52D437C936;
	Sat, 27 Jun 2026 06:07:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CC38D;
	Sat, 27 Jun 2026 06:07:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782540432; cv=none; b=OLrJiCulvFT+gseO1QEDPXcPFqVrusp0OuiPILRmHi128cWc2cEBq4ZwvKm1Q2hr1DhJYewwt08i6SAhNNnDitRl4jECgz30Zmfutvi7X+FG4dlmAQQguN2/w0GQzGR7KmpHhzR43Fp3dj/71t+p2m0A2/OS4ZSPZJpzqpNj2UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782540432; c=relaxed/simple;
	bh=4LREPqg2WfTyqdb1L+xhLnGFM+/vi5VZ+yfBkau9XsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TR7vvlc7KaBy2ziT+nRa/VnDUwsckX3y4m0LYcwVg5cQCDK6EfeAlnYAAUn5G/9XSvVKQNyY9mpjhHHn6Hpcm1ipLzdQ9YwiihxBKwYWFTaD1o2PEF3fRbzO4Bo8EL5TRUIbNnyNMzDoBQS663O3UTj9y9Q8v4D3M2tjix4rsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Ad23KUMs; arc=none smtp.client-ip=45.254.49.198
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 43fb57346;
	Sat, 27 Jun 2026 14:01:51 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	azpijr@gmail.com,
	error27@gmail.com,
	kees@kernel.org,
	arnd@arndb.de,
	pontescpedro@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>
Subject: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Date: Sat, 27 Jun 2026 14:01:51 +0800
Message-Id: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f07ab8f6303a2kunm41fcde97ebed4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBodVhlNTBkfHUsfTRhCHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Ad23KUMs7gHGe1npr+wDHSUhSJIxq1qB2DB0Tzy3/8tLPknoJr9mFHxhrdaiuFooDD5QjgpM7oHYMeEiUPKilSekDVsUcEApZYA7VDEsbpIplvp1nREFmCMtC/etOuxIzKNy0YawR8l+dDDLLKmpcM99sM8Rbef/v8awfFxjeB8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=aiY8q6Mky3ednHnggxN7XrcwHP5//qKfIBb41Y+ZrCM=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65779-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:azpijr@gmail.com,m:error27@gmail.com,m:kees@kernel.org,m:arnd@arndb.de,m:pontescpedro@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,arndb.de,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:dkim,seu.edu.cn:email,seu.edu.cn:mid,seu.edu.cn:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF2676D13FC

load_video_binaries() and load_primary_binaries() create a CAS scaler
descriptor before allocating and looking up the YUV scaler binaries.
Several failure paths after descriptor creation return without destroying
the descriptor, leaking the frame-info arrays owned by it.

Route those exits through a descriptor cleanup label while keeping the
existing pipe_settings ownership model. Also clear num_yuv_scaler when
capture scaler binary allocation fails, so the existing failure unwind does
not iterate a NULL scaler array.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1.1.

An x86_64 allyesconfig build showed no new warnings. As we do not have
an Intel Atom ISP camera platform with matching sensor firmware and ACPI
camera graph to test with, no runtime testing was able to be performed.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 35 ++++++++++++----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..d0ff16ba890f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4528,20 +4528,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  NULL,
 			  &cas_scaler_descr);
 		if (err)
-			return err;
+			goto destroy_cas_scaler_desc;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
 			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		mycs->is_output_stage = kzalloc_objs(bool,
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -4557,10 +4557,13 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			if (err) {
 				kfree(mycs->is_output_stage);
 				mycs->is_output_stage = NULL;
-				return err;
+				goto destroy_cas_scaler_desc;
 			}
 		}
+destroy_cas_scaler_desc:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err)
+			return err;
 	}
 
 	{
@@ -5103,24 +5106,21 @@ static int load_primary_binaries(
 			  pipe_out_info,
 			  NULL,
 			  &cas_scaler_descr);
-		if (err) {
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
-		}
+		if (err)
+			goto destroy_cas_scaler_desc;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
+			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		mycs->is_output_stage = kzalloc_objs(bool,
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -5133,12 +5133,15 @@ static int load_primary_binaries(
 							     &cas_scaler_descr.vf_info[i]);
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
-			if (err) {
-				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				return err;
-			}
+			if (err)
+				goto destroy_cas_scaler_desc;
 		}
+destroy_cas_scaler_desc:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err) {
+			IA_CSS_LEAVE_ERR_PRIVATE(err);
+			return err;
+		}
 
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
-- 
2.34.1


