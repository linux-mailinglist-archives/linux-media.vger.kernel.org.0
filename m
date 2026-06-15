Return-Path: <linux-media+bounces-64928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kb3XJZpWMGo+RwUAu9opvQ
	(envelope-from <linux-media+bounces-64928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 21:46:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E8689893
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 21:46:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="f7eV5/hQ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64928-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64928-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3A5A3034EE8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 19:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D023AE1B4;
	Mon, 15 Jun 2026 19:46:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7630F533
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 19:46:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781552782; cv=none; b=F4b4I5MAfVpYrunF18ZXAGESeumSHdU3PYwwmGFOQ3BaUTvvqkyXrmifJcItf/qFuXkKJrzqsFBricbfei4QWMbB57UnuLmiBGinZtv0oCmCLcmIxxxyygaT1xE2BwNr5tFrMT0s/Ic66fIRMW275EzHwneGkbJWZRSq0YqKpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781552782; c=relaxed/simple;
	bh=F8//HOzop0wZqkW/+yb7DeIyN49eYkCf+tfjSwgBSAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6VAsVWBI0zC3IA5EsNUBUvC9IScoIKsW7m5aww2kLzoamU+2saIkdMq/LfISyRTf84Yv4CAGRMmUV2bmqm1s/nlzMRDRKdtk4+jZRz+VnSVskNoGP+giA8LpzQq5SVcz3hjCRZkBz+tirMsm40Ba6T6ZHUIN/+mMXxNcpQiOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f7eV5/hQ; arc=none smtp.client-ip=80.241.56.172
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gfLGJ0P1vz9twp;
	Mon, 15 Jun 2026 21:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781552776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jjACC5qVmQdhDivw9+MwXW4hAT6BcvtyY3lMI/q4T9k=;
	b=f7eV5/hQ5M2hXepRuXTZ9xMoVhA4zkfddYd/mdhL7BI+Azz91j4tzJKahxlk1dT8iZ0eg8
	sbK8edTrSRUoxzPr1ra9QU7mvzvzJcEvTgWRka13ACYlJEuLeJRNz8dA7AKDUznkOBYmFc
	SW6q+G4hGC8bLaCxNULfa1LSPdE23INP8eAZeUVXgKSE2qld+f8rMHs6GEm+qoTgSae4OB
	5R9D8ytn/yt9e0+rGMWkh/EtIwm4U/YrOxPaNOcnB5Os7I9eUq1Z9FZfpZaboeL2dXLPzk
	Jn8I1CHieVTHqx3OErrWivQ9ckdqvsbUPehuwsoCDq3nH4FMXLaAOIEhhBaucA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH v3] media: atomisp: replace kmalloc() with kmalloc_objs() in sh_css.c
Date: Mon, 15 Jun 2026 22:45:48 +0300
Message-ID: <20260615194548.20963-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 14346f74dab98064f4f
X-MBO-RS-META: io5uppiifitymjmgcjt1eqyqiib9iih3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64928-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andriy.shevchenko@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[khomenkov@mailbox.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khomenkov@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D9E8689893

Replace arithmetic in the kmalloc() function with the kmalloc_objs()
macro, as this calculation method is unsafe.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
v3:
 - use 'kmalloc_objs()' macro instead of 'kmalloc_array()' function
 - drop unused 'GFP_KERNEL' arguments since they are default
v2:
 - use 'sizeof(*ptr)' instead of explicit type
 
v2: https://lore.kernel.org/linux-staging/20260613110712.71436-1-khomenkov@mailbox.org/
v1: https://lore.kernel.org/linux-staging/20260606095410.13968-1-khomenkov@mailbox.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 34 ++++++----------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..0733d33101b2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5819,36 +5819,27 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	kmalloc_objs(descr->in_info, descr->num_stage);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	kmalloc_objs(descr->internal_out_info, descr->num_stage);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	kmalloc_objs(descr->out_info, descr->num_stage);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	kmalloc_objs(descr->vf_info, descr->num_stage);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	kmalloc_objs(descr->is_output_stage, descr->num_stage);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5974,29 +5965,22 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	kmalloc_objs(descr->internal_out_info, descr->num_stage);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	kmalloc_objs(descr->out_info, descr->num_stage);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	kmalloc_objs(descr->vf_info, descr->num_stage);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	kmalloc_objs(descr->is_output_stage, descr->num_stage);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;

