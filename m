Return-Path: <linux-media+bounces-55234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGOuD8uAsGmwjwIAu9opvQ
	(envelope-from <linux-media+bounces-55234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:36:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA8257EB6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92A513025EC4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67713B6366;
	Tue, 10 Mar 2026 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXEyLJRq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE27368272
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174979; cv=none; b=pYPkyyTrreGptQlPo9pdu6/ERGHDRwPpUbEces33l0nCck14ZMzF2CsDiGbXKjCvwpjPckel12tg0ircg/5tY+0M2TLYmpbCZhtuYXwU6GmHPmqtwJ7GH06dhK2zxgy7HrZNj7WuYT1oCwR6aUpJfQzrFqWuAqD6Nh9aPJmHZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174979; c=relaxed/simple;
	bh=I9i22WPTRAmhpxhypjMdYtzA+JuNyUwyEIYAxkX9C34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V48nSnA0tuuCsD1UwS0zIu3s9iFYA3PCqz6PumNEmyl+I1DMRfLdMZ94Ww9Mh1XzNwQNa2soEbq4Ki9C+EPa53ZM/YWvozpBVPHUqOvsy+x0bc3Z/a7Rmca+LUbQvlzj3sontUv9FXsUs5hJ9OaM0Lc97NbQLYjavZGGtrPjSE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXEyLJRq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a133502accso6718768e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174976; x=1773779776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gH63xno2m/4CidvXeQf37K4ZWvOPR2V3GJ+M/nb9CI=;
        b=bXEyLJRq/M78/Qt1HVo74GDtWdRSVNbK3auLHNT3g9aP8gOEtXy7FaH5tAVciHhEDR
         YCjxrxzR/PPdxUmD5zSHGEvrxhIfcSV5fmrsY+p98mjroWR7dUlIH5zPDQnaajTZh0Bg
         RaH17X3OI6b+T2xzNQKc+CD4RBEKo7rUAt/+ElDFSYo8bjGrAAyPb9eGp/EX8fXMdsj9
         quhZC8t+ubuqkHw9FM5PnF/9xAug1AikJv7e0jOn6HcCdVxj/ApqBJugqCR4GD89PhdC
         D4Q+qAINWDgp92NDZF4nUKgCWwHjd2dHtJGp71A6LfmaJq9m27qvHB36jFSddpGqXtsT
         Rbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174976; x=1773779776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9gH63xno2m/4CidvXeQf37K4ZWvOPR2V3GJ+M/nb9CI=;
        b=SaRjfHRuDwgEhnr3RZyUFWAnFxpY3xz6i9qf//80wISJaLSI3By9lPuHpdnqi5UWUU
         I6l2PEfqq44zLE/BSEF/Uh1VGlH8H+XzKle55SAjZm3cfon4DugYFcVJmUoJrsAfthEp
         8ibs+AjkJILibCrE30R9uKJA33sMa7xfZiGgqJH8O0NxOE2AXrgT2B/0UOPKWylOFPDP
         QftgjIOVzIOK2JDb44HP6ckVHhKjH4llGXr4qrqXqPfCsK45WSjYBtGaloonX970XXEQ
         FvQTXxH0a5nG9myH5xMwGmQIaquVog4WjE/xSb2awo0c3J9G1raLZEeVlInSDf3ZsxpG
         UiUg==
X-Forwarded-Encrypted: i=1; AJvYcCWgdyMrnTTq3drZ15atRfERVu/VFK+uJDgeUWgYiwJGq93OeGJRm6/vPHG/w2jDFpPgAgq3WITxboyfLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywml/Jlvmemn89SERrq6ohEPPYUwfMQA4n1ZA1dUto9+lo4S7FG
	6Nqc0HCloorkylbvNrSjinGZayK+rFQB6it+2w9DIxS5TGNooszF0FCj
X-Gm-Gg: ATEYQzyv6Git71H11fSelgGoSwCBevNBaAYFGI6sbmwvaQI2U+Kz08cx3SSK2HfMA0i
	g7mzAuK8STTVAPw+nTFQY7Ymxf3YbkQp+47aTT9ojQN2uOFMLBylrdOQ6MOzlPVfbyQMIquZxbF
	N0cf8z8i0lD+9auHnkvMs0laIE3CODGz+32rCp3Vfw0oGO7QSQnR0SHVwIJe6aEjmpFtV1PHfzG
	+miXGm6Y8kqPWexCXQ/YemZrXch/2PDycM9SlAiXfePXZijZyaOo1Fe1UOQWANQlvUP7d2ppi2B
	PRx36OwjB6FquF/NrDA9vDu3au/JWjBqYUeuX4U28eQVbp2GknVxdSmiEOlFS91y47CI/QjejvH
	dDIOgq0cNF1xTCbhdm4n1WnFXDfUlgIkUlc7KqEJP/+IWPWbACxlJRiUG5pR9pG+9LJgvqOOh2U
	es1YuU6bT66UF2RNnQN1YRf5khwWmwvUJfepYAv6MLK+JEIh4AE9zKdhlDzHd5IFv1bv9JiVQgJ
	w==
X-Received: by 2002:a05:6512:1458:20b0:5a1:376b:692a with SMTP id 2adb3069b0e04-5a13caae83fmr3641678e87.10.1773174975906;
        Tue, 10 Mar 2026 13:36:15 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162dcesm23345e87.58.2026.03.10.13.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:36:15 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: fix block comment style in refcount.c
Date: Tue, 10 Mar 2026 21:35:46 +0100
Message-ID: <20260310203546.8849-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309215516.6091-1-rayfraytech@gmail.com>
References: <20260309215516.6091-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 60EA8257EB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55234-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Fix block comment formatting to comply with kernel coding style:
- Move text from opening '/*' line to a separate continuation line
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line
- Replace commented-out code with #if 0 ... #endif blocks

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../atomisp/pci/base/refcount/src/refcount.c  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 00e8a73f413e..68c3bc181a96 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -15,7 +15,8 @@
 
 #include "ia_css_debug.h"
 
-/* TODO: enable for other memory aswell
+/*
+ * TODO: enable for other memory aswell
  * now only for ia_css_ptr
  */
 struct ia_css_refcount_entry {
@@ -99,10 +100,11 @@ void ia_css_refcount_uninit(void)
 		 */
 		entry = myrefcount.items + i;
 		if (entry->data != mmgr_NULL) {
-			/*	ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
-			 *	"ia_css_refcount_uninit: freeing (%x)\n",
-			 *	entry->data);
-			 */
+#if 0
+			ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
+				"ia_css_refcount_uninit: freeing (%x)\n",
+				entry->data);
+#endif
 			hmm_free(entry->data);
 			entry->data = mmgr_NULL;
 			entry->count = 0;
@@ -174,9 +176,10 @@ bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 		if (entry->count > 0) {
 			entry->count -= 1;
 			if (entry->count == 0) {
-				/* ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
-				 * "ia_css_refcount_decrement: freeing\n");
-				 */
+#if 0
+				ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
+						    "ia_css_refcount_decrement: freeing\n");
+#endif
 				hmm_free(ptr);
 				entry->data = mmgr_NULL;
 				entry->id = 0;
-- 
2.43.0


