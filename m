Return-Path: <linux-media+bounces-66815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 598zItW0TGrmoQEAu9opvQ
	(envelope-from <linux-media+bounces-66815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:12:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A7718F30
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:12:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=MphwiHHY;
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66815-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66815-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6684A3040968
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 08:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F49529D264;
	Tue,  7 Jul 2026 08:06:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3894285CBC;
	Tue,  7 Jul 2026 08:06:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411593; cv=none; b=A3+LLzPwlv+G8W3ADh7+2UIogLaBrOlRsBrYkY/TPnzrVwKw7zq+AjFFA1H3hJArzSQ20CDW9PTfc0lI5pQLjAt+3z2yMRMHJeS1hyOZ9DApQu3S+XsqH3tu5K6EW8L/nNS6oG1XXw+8Yem12XmCRT3cL8JCyMDOwtHSD9BTOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411593; c=relaxed/simple;
	bh=jJ7ty7jq4rNWfZ6cw92JQ71UqFobN1PDQyluvXEEPxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S2MheuxEyz5hXvU/CjKaoyTaeRaUW8hGy9ePbNW2QtwHpbvcC9o4QI3fSTDVM96KwTp4jWxQptb4QTwoX7xL/9QBV6hrdhcDKJzEyPmbrpb64mqpSkq3MHjJiCu/kASZG8d8DMI2LvekzWISjJ1VeslgUc7env6onLwyFlXXd8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=MphwiHHY; arc=none smtp.client-ip=45.254.49.197
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 453773698;
	Tue, 7 Jul 2026 16:06:21 +0800 (GMT+08:00)
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
Subject: [PATCH v2] media: atomisp: fix scaler setup leaks
Date: Tue,  7 Jul 2026 16:06:15 +0800
Message-Id: <20260707080615.631222-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f3b9d201703a2kunm9435365539493
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx1MVh9DTUMYTB9PSUtMTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=MphwiHHYuTi6ESIPoyYhQeosf81+2JlXOhTh1dtcrppDctICkIKMhSi+R3H+zQ7fj7impmx7NjU3s74WdXmOtSrgoIbdBDb+oFLykddMsmdGh00Ypqs2PJC8A3UzoK6vVWRExQl1xeZJqojd9Leex8utvz360VH4vgP5pn/Xhqk=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=nBpWsa4JwdsFOGP1xCF1vGkR/mRGjxPDQ0mKNQD/sqU=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66815-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:azpijr@gmail.com,m:error27@gmail.com,m:kees@kernel.org,m:arnd@arndb.de,m:pontescpedro@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E39A7718F30

load_video_binaries() and load_primary_binaries() create a CAS scaler
descriptor before allocating and looking up the YUV scaler binaries. Error
paths after descriptor creation can return without destroying the
descriptor and without freeing the partially allocated scaler state.

Fix this by properly destroying the CAS scaler descriptor on failure and
using reverse-order cleanup labels to free the partially allocated scaler
arrays and state variables.

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
Changes in v2:
- Use reverse-order cleanup labels to free partially allocated scaler
  state on the scaler setup failure paths.

 drivers/staging/media/atomisp/pci/sh_css.c | 43 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..b17e0b3879f4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4527,21 +4527,25 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  pipe_out_info,
 			  NULL,
 			  &cas_scaler_descr);
-		if (err)
+		if (err) {
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			return err;
+		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
 			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			return err;
 		}
 		mycs->is_output_stage = kzalloc_objs(bool,
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			return err;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+			goto free_yuv_scaler;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -4555,9 +4559,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				kfree(mycs->is_output_stage);
-				mycs->is_output_stage = NULL;
-				return err;
+				ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+				goto free_output_stage;
 			}
 		}
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
@@ -4734,6 +4737,15 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 	}
 	IA_CSS_LEAVE_PRIVATE("");
 	return 0;
+
+free_output_stage:
+	kfree(mycs->is_output_stage);
+	mycs->is_output_stage = NULL;
+free_yuv_scaler:
+	kfree(mycs->yuv_scaler_binary);
+	mycs->yuv_scaler_binary = NULL;
+	mycs->num_yuv_scaler = 0;
+	return err;
 }
 
 static int
@@ -5105,6 +5117,7 @@ static int load_primary_binaries(
 			  NULL,
 			  &cas_scaler_descr);
 		if (err) {
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
@@ -5112,7 +5125,9 @@ static int load_primary_binaries(
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
+			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
@@ -5120,8 +5135,8 @@ static int load_primary_binaries(
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+			goto free_yuv_scaler;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -5135,8 +5150,8 @@ static int load_primary_binaries(
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				return err;
+				ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+				goto free_output_stage;
 			}
 		}
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
@@ -5257,6 +5272,16 @@ static int load_primary_binaries(
 	}
 
 	return 0;
+
+free_output_stage:
+	kfree(mycs->is_output_stage);
+	mycs->is_output_stage = NULL;
+free_yuv_scaler:
+	kfree(mycs->yuv_scaler_binary);
+	mycs->yuv_scaler_binary = NULL;
+	mycs->num_yuv_scaler = 0;
+	IA_CSS_LEAVE_ERR_PRIVATE(err);
+	return err;
 }
 
 static int
-- 
2.34.1

