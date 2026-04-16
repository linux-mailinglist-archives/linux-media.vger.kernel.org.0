Return-Path: <linux-media+bounces-58907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMhNC8vo4GlInQAAu9opvQ
	(envelope-from <linux-media+bounces-58907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:48:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD740F26A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E03243064EDD
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159BB39DBDD;
	Thu, 16 Apr 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfOl6X1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437D3BED7A
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347188; cv=none; b=dbmErCiv+rQzCYAEYdJYpQGMeXjEFKwiz0BR8HHf5tOjQ+CQliH66ulgnxMAvZ8BuxisA0yRHhiQtDKZRg8hSOK+Nh1DU49bCxrqayupwkgTd+hmDszn7l7k96hQpXrmxd3M1vg71insZCiC0KYQnMlUfIdSE2+Lmg//ioBeWGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347188; c=relaxed/simple;
	bh=3EAwYE7+t5LBGy+Qw2ONJz+RCqEsQCzzTpMO2mrhpIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyvlQj9064BC8eUfjJ6e3AKsaRKpW4eqcmuKMfaX40A8zBwo9ezhfJ3EvO4wx8Y6DcqFf+ESM9rXuSR0ejeMSriwKYIeYm1bltQyf2nf3xurOodp8NyhnBwa6A/tUYClzD64XOTWf2o9s1qMaAeKBPsTdTXFvt7TivvKQ4zwf6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfOl6X1I; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso526945eec.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347186; x=1776951986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=So59SyK+EyB2Z67BGgN+VJWPDFL7GSSTqAp2bhFGkV4=;
        b=OfOl6X1IOC1hQmUh31TkatZmGWoeZn+VVMIi1Zn1Np0ViNyZyzRt5SG9R+QeEo0LKS
         lVkMJGZS8e9/On1HsLKucmwhTz6MDkPNrz6KWNu3nJOCDy7xXS4fAr9+HLcQHLHHFdra
         OguF49wvH96d0kF6/TMefw8as85RiMi82WsKsbO/r/ryw742pvsPuJ6WjesNAVFTvwYy
         fF0SitVGNwoykTrjeVkH+esytXR7M3tBbSCuf1CrzQY5Xp3kmZ2MO3zJgQVxzrIcYLKO
         9th2iK3y/KwWg9XJloFTh4eckIltiUSEAgX5hDPL9oiHNPAzbhNahnZJElZiqjD4cYr1
         C6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347186; x=1776951986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So59SyK+EyB2Z67BGgN+VJWPDFL7GSSTqAp2bhFGkV4=;
        b=R+uIhtpdNs4foYETxH1ban8pvZv6NTDd5iVOGJTOVEzu1OZYhBZJHvH/YUQ0Irw2HM
         QKVcAB0ZcmXvA2IhMoS5R1jRr/xIUQYdaeSqexOl7hLLhmjMVCPkSfnzHaOs4D/TWSNH
         oiNBRPEoOzqerYMhSMnr0l1PJas8hg8yyN5ShCer0Z1fnH05ETxYjauXERLd1qlLFQnS
         ipTBLdMplZACz6GYRLyFX2mPUtt6uM5RkyoqqAnT9ks8zlbmhBMVwKHl0u/PcXxupo1O
         jPkAcO/JOS9siIHKYGk1DI448RaBGmXNTgCs9fHjgPl5yC+NEIl86ouGGXpCK3aatS7I
         Z/1w==
X-Forwarded-Encrypted: i=1; AFNElJ++Wv5JZfd8J8htAku9sgywdwBZvWOEYZS+CZI1xXSv2Ngnp6xCkRUPJeD+mHwMmxyCMjwmSSnbXMGfNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjyM7w6B7oE+3VU0d4N/3m5p76kE9skTznlA51+uzMvk/IzRZK
	WQaeGZKNrUzzz/xQatePp+U4OLQ+Git0F0fTFSer7Ottu/TOzwPHS9Sh
X-Gm-Gg: AeBDievMNQhjM0ye/PCh5g5E8ncUisuu4nL5ffupnR4mw0l8JDxDiKHO6EBjAWu9TvB
	AhssFdzFjPCyikHiGGF1ZOAMwEuKNlILWPQzTyIy1j74CsxhR73xXoRFLGtAN5V07c3tneToouz
	bVn4BnYWL5pyHr62E8TUfmUjtI+Ur9UccsvHfy4yvc6R0gfogFBRbUDNkJc5l0n/wYii2jUKAjD
	IMMJbWlGszIer6dhSbTxiR6SN3bG7SgCyddLpmmFbqH0FiOl2Y58HOaWMMrR7B+XDsAtfJXxX4n
	EKQBlipQWzvVvuNZrHnofrnOr20OFHgbT+nlUuyJVSgCrnRwG6Ikkrjr5VpVr0fmmbq+dJbQiPq
	FYo5djf49cnFkcTt6B7QgQRRLCWvy/lYD8gtjKcGdAbMmu30Cn6Rm4cgGZo3IvDD1AfCWHNQmgd
	2LPBF3xnqiTmwV0M9AUyxnELeqE3T4oL7LAMOfow==
X-Received: by 2002:a05:7300:ac81:b0:2c6:67b6:3acc with SMTP id 5a478bee46e88-2df7f4671e7mr1831946eec.15.1776347186136;
        Thu, 16 Apr 2026 06:46:26 -0700 (PDT)
Received: from pedro-oxean-machine ([2804:214:400b:a09:b5a8:d8b1:e224:db26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm7256740eec.26.2026.04.16.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:46:25 -0700 (PDT)
From: Pedro Pontes <pontescpedro@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pedro Pontes <pontescpedro@gmail.com>
Subject: [PATCH] media: atomisp: use kmalloc_objs for array allocations
Date: Thu, 16 Apr 2026 10:42:15 -0300
Message-ID: <20260416134214.130665-2-pontescpedro@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-58907-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pontescpedro@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0DD740F26A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert manual kmalloc() multiplications to the modern kmalloc_objs()
interface to improve type safety and prevent potential integer
overflows.

Signed-off-by: Pedro Pontes <pontescpedro@gmail.com>
---
This patch is a refresh and modernization of the following work by
Qianfeng Rong from August 2025:
Link: https://lore.kernel.org/all/20250821081746.528018-1-rongqianfeng@vivo.com/

The original version used manual multiplications; I have updated it
to use the newer kmalloc_objs() macro and enforced pointer-based
type inference (e.g., *descr->in_info) as is now the preferred
standard for these cleanups.

The patch has been verified with a W=1 build for pci/sh_css.o. Since I
don't own the hardware.

Please note that, since I'm a new contributor, I wasn't quite sure in
how to proceed in this scenario of "redoing" an older contribution.
I've credited the original author with the "Originally-authored-by"
tag. Please let me know if I should have done something differently.

 drivers/staging/media/atomisp/pci/sh_css.c | 57 ++++++++++++----------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..26b7ea560c02 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5819,36 +5819,37 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}

-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_objs(*descr->in_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_objs(*descr->internal_out_info,
+						descr->num_stage,
+						GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_objs(*descr->out_info,
+				       descr->num_stage,
+				       GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_objs(*descr->vf_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_objs(*descr->is_output_stage,
+					      descr->num_stage,
+					      GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5968,35 +5969,37 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,

 	descr->num_stage = num_stages;

-	descr->in_info = kmalloc_objs(struct ia_css_frame_info,
-				      descr->num_stage);
+	descr->in_info = kmalloc_objs(*descr->in_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_objs(*descr->internal_out_info,
+						descr->num_stage,
+						GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_objs(*descr->out_info,
+				       descr->num_stage,
+				       GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_objs(*descr->vf_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_objs(*descr->is_output_stage,
+					      descr->num_stage,
+					      GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
--
2.53.0

