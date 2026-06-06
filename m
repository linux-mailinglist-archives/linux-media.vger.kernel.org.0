Return-Path: <linux-media+bounces-64007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7s/eMnnuI2pH0QEAu9opvQ
	(envelope-from <linux-media+bounces-64007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:55:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAD64D0AC
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:55:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tsNAwPGu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64007-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64007-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18820301C157
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 09:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D18A37268A;
	Sat,  6 Jun 2026 09:54:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F2632A3EC
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 09:54:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780739671; cv=none; b=lSZTVzrMDaSTD0Bn7TKFAu1EDj+MQpqDA7kL2QZLr4/DKTMQJWMSltw6pj/P9ezU5X8SzyJOuS345AcUebnVeLhyU4mpDzO/Plbk3fEJmkEoe5JN2ug84XyqVOOUWNIzb5xlcFnXvccOjc5gAlfS5EDbm5rXGSCAffSRftoD7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780739671; c=relaxed/simple;
	bh=wSflhIQ/j4bX4/px/SkALjk/ydHA0ip1tjWOMNsvFAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QNZSEaEk9lRqASLouOM7QT6kQZz5lRmaq8GM7xW/S1umHh8J7J/KHSw8r3W8X9kOKwUrcquLA+wjlx6D/pORFmJ4PC9dSnp8iXOZOmDkqStCzgmGHLo+y4sMPOBHbk/LCcVMIoJe0yjSA9z2PkgnnZ48WBnbTIEWxE60OloLnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tsNAwPGu; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gXYYQ48Rsz9snJ;
	Sat,  6 Jun 2026 11:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780739658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6jc8S5oznjqRqJJ+nrncB/WEciDwZpfT1pFIjLs6fcY=;
	b=tsNAwPGuoX42ToBL57GUVxtIZT2VnzblFWOoEgggs1fPRVAY69tnK6bkzoXaYjBMkzsnSW
	5P4crgxZT3ky265afBVZgEoip75rxIZpGUYBAEkIm7Zasc8uZhIjXSd5H1Itu7atitU2Bh
	/ddIT0rYqK8Rgcu6K+IuGfQOhWrAO/XAlw0j2f3sh3tPm3+erOmN/OlJpSeVKb7zywnR1t
	pyEiNOylLpyMu/8Su+7LC5ZPRX5zZ55HMwt4DFdCWyAUItr1elBwCi2HFS8pxPN6OCIw+R
	7Xwo483w0qSg1YWNwR2xBhJj7P69gfpHap/mWjuGRghtDmBAR2Duvol2nf0NWQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH RESEND] media: atomisp: replace kmalloc() with kmalloc_array() in sh_css.c
Date: Sat,  6 Jun 2026 12:54:10 +0300
Message-ID: <20260606095410.13968-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 71c6576b1b8de388847
X-MBO-RS-META: tsib55u6g4pwyf7nzymgo8irkwczwgbt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64007-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[khomenkov@mailbox.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:kees@kernel.org,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khomenkov@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BCAD64D0AC

Replace arithmetic in the kmalloc() function with the kmalloc_array()
function, as this calculation method is unsafe.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 41 +++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..a325a7994068 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5819,36 +5819,31 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage, sizeof(bool), GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5974,29 +5969,25 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage, sizeof(bool), GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;

