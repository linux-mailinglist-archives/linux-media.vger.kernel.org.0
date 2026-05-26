Return-Path: <linux-media+bounces-62836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB0ZDlEeFmpZhwcAu9opvQ
	(envelope-from <linux-media+bounces-62836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 00:27:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E75DD316
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 00:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 741D930376B5
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 22:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9AC3C76AC;
	Tue, 26 May 2026 22:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="12uauAYg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFFF3C769B
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779834431; cv=none; b=Vv34zmWsHehUXmKdDKF+R0FXYLtFFSDoC3VqLoIFctowt1wXvjYN7HkSA1TmttZEDT7F3nlRhKP53fkXqV+527/VBAHQ+9olNB6OrdhTZd/QmjdCGvJKKNraYk61dboOm2xO3y2Q9vqwCOXrloYOkWlmOC2VL6spohkINy6GAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779834431; c=relaxed/simple;
	bh=NC7L59h3MSV2X+AacNqB1xKtV9B97rIzx+FWhV/JJUc=;
	h=Date:To:From:Subject:Message-Id; b=aO1gPDF2U+/osUNSinY/pyTY5M0s1rID4qdRDeqQxBLxWA0X757M+tfpSEoUBYp+5ar83QnPEq8S/HXkirbpMtqMYQFtLJk9VNEb1Y/vbvmcsx1RijnYmQTiuNnzECYzI6B+Cr9cOEz83h6vj83tdF8khzordognntTPiDSkabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=12uauAYg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608471F000E9;
	Tue, 26 May 2026 22:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779834429;
	bh=wnlOv1JnrWmpR4lUq5WND2dWRN3S65r/ZqBcztg5U9o=;
	h=Date:To:From:Subject;
	b=12uauAYglGi22GXIqTs2guqMXsQAvknS8Xia1nvCzMzdfEtugTyPC83WONWHZFyle
	 QSMQcTCDnk0m4zlCnaXDEdXx/ZUiCoOQbd0BOqmGJ/JXorn4FbJ8PAgU8Jxb0Dyv0E
	 caM9D3eLSm1Wusk2ZZJ7VjuPWQkMyP+ig5G/2tgw=
Date: Tue, 26 May 2026 15:27:08 -0700
To: akpm@linux-foundation.org,linux-media@vger.kernel.org,mchehab@kernel.org,akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
Subject: [patch 1/1] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
Message-Id: <20260526222709.608471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62836-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 999E75DD316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrew Morton <akpm@linux-foundation.org>
Subject: drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
Date: Tue May 26 03:14:09 PM PDT 2026

csky allmodconfig, gcc-15.2.0:

drivers/media/v4l2-core/v4l2-vp9.c: In function 'v4l2_vp9_adapt_noncoef_probs':
drivers/media/v4l2-core/v4l2-vp9.c:1834:1: error: the frame size of 1436 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

The amount of inlining in there is simply nuts.  This patch semi-randomly
uninlines various things and fixes the above.

Ad the .text size reduction is tremendous:

ts:/usr/src/25> size drivers/media/v4l2-core/v4l2-vp9.o
   text	   data	    bss	    dec	    hex	filename
  22450	     36	      0	  22486	   57d6	drivers/media/v4l2-core/v4l2-vp9.o-before
  16144	     36	      0	  16180	   3f34	drivers/media/v4l2-core/v4l2-vp9.o-after

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/media/v4l2-core/v4l2-vp9.c |   30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

--- a/drivers/media/v4l2-core/v4l2-vp9.c~drivers-media-v4l2-core-v4l2-vp9c-reduce-inlining
+++ a/drivers/media/v4l2-core/v4l2-vp9.c
@@ -1582,25 +1582,25 @@ static inline u8 noncoef_merge_prob(u8 p
  *	merge_prob(p[9], c[9], [10])
  */
 
-static inline void merge_probs_variant_a(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
+static noinline_for_stack void merge_probs_variant_a(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
 {
 	p[1] = merge_prob(p[1], c[0], c[1] + c[2], count_sat, update_factor);
 	p[2] = merge_prob(p[2], c[1], c[2], count_sat, update_factor);
 }
 
-static inline void merge_probs_variant_b(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
+static noinline_for_stack void merge_probs_variant_b(u8 *p, const u32 *c, u16 count_sat, u32 update_factor)
 {
 	p[0] = merge_prob(p[0], c[0], c[1], count_sat, update_factor);
 }
 
-static inline void merge_probs_variant_c(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_c(u8 *p, const u32 *c)
 {
 	p[0] = noncoef_merge_prob(p[0], c[2], c[1] + c[0] + c[3]);
 	p[1] = noncoef_merge_prob(p[1], c[0], c[1] + c[3]);
 	p[2] = noncoef_merge_prob(p[2], c[1], c[3]);
 }
 
-static void merge_probs_variant_d(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_d(u8 *p, const u32 *c)
 {
 	u32 sum = 0, s2;
 
@@ -1624,20 +1624,20 @@ static void merge_probs_variant_d(u8 *p,
 	p[8] = noncoef_merge_prob(p[8], c[6], c[7]);
 }
 
-static inline void merge_probs_variant_e(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_e(u8 *p, const u32 *c)
 {
 	p[0] = noncoef_merge_prob(p[0], c[0], c[1] + c[2] + c[3]);
 	p[1] = noncoef_merge_prob(p[1], c[1], c[2] + c[3]);
 	p[2] = noncoef_merge_prob(p[2], c[2], c[3]);
 }
 
-static inline void merge_probs_variant_f(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_f(u8 *p, const u32 *c)
 {
 	p[0] = noncoef_merge_prob(p[0], c[0], c[1] + c[2]);
 	p[1] = noncoef_merge_prob(p[1], c[1], c[2]);
 }
 
-static void merge_probs_variant_g(u8 *p, const u32 *c)
+static noinline_for_stack void merge_probs_variant_g(u8 *p, const u32 *c)
 {
 	u32 sum;
 
@@ -1659,12 +1659,12 @@ static void merge_probs_variant_g(u8 *p,
 }
 
 /* 8.4.3 Coefficient probability adaptation process */
-static inline void adapt_probs_variant_a_coef(u8 *p, const u32 *c, u32 update_factor)
+static noinline_for_stack void adapt_probs_variant_a_coef(u8 *p, const u32 *c, u32 update_factor)
 {
 	merge_probs_variant_a(p, c, 24, update_factor);
 }
 
-static inline void adapt_probs_variant_b_coef(u8 *p, const u32 *c, u32 update_factor)
+static noinline_for_stack void adapt_probs_variant_b_coef(u8 *p, const u32 *c, u32 update_factor)
 {
 	merge_probs_variant_b(p, c, 24, update_factor);
 }
@@ -1724,33 +1724,33 @@ static inline void adapt_probs_variant_b
 	merge_probs_variant_b(p, c, 20, 128);
 }
 
-static inline void adapt_probs_variant_c(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_c(u8 *p, const u32 *c)
 {
 	merge_probs_variant_c(p, c);
 }
 
-static inline void adapt_probs_variant_d(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_d(u8 *p, const u32 *c)
 {
 	merge_probs_variant_d(p, c);
 }
 
-static inline void adapt_probs_variant_e(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_e(u8 *p, const u32 *c)
 {
 	merge_probs_variant_e(p, c);
 }
 
-static inline void adapt_probs_variant_f(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_f(u8 *p, const u32 *c)
 {
 	merge_probs_variant_f(p, c);
 }
 
-static inline void adapt_probs_variant_g(u8 *p, const u32 *c)
+static noinline_for_stack void adapt_probs_variant_g(u8 *p, const u32 *c)
 {
 	merge_probs_variant_g(p, c);
 }
 
 /* 8.4.4 Non coefficient probability adaptation process, adapt_prob() */
-static inline u8 adapt_prob(u8 prob, const u32 counts[2])
+static noinline_for_stack u8 adapt_prob(u8 prob, const u32 counts[2])
 {
 	return noncoef_merge_prob(prob, counts[0], counts[1]);
 }
_

