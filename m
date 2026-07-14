Return-Path: <linux-media+bounces-67594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N2+HBOe9VmrXAgEAu9opvQ
	(envelope-from <linux-media+bounces-67594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:53:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5375948D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:53:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dxaHtciJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67594-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67594-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E5923012743
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 22:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C17429CD8;
	Tue, 14 Jul 2026 22:52:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F9432E77
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069569; cv=none; b=TJJCKQjM/WGOTsF6KudvSKonMqsvBFhvLLx/lz7UzZdFqF+GJuP5i/KGl+mRbhdap9nZ7DJ4C2BHXul9Y79iq6cH5FPCwvPtEKD0a4r6vruFtltnmchW6vUj0ybnPTNCdL1S3XHS7tq4EA7e2xjw0h0dZmcJevN8PmDj4MyskGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069569; c=relaxed/simple;
	bh=A/qCooa4CX/pAneYM+GM5KmJMW5XYUBE0lCmM9t6q+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9rBzftZlzghl2zYTZMWsUTTExvOfowPUpLt4R2+Dfqx9DPkq3WJHU++11f84OyoG3i9HIrO5om0M++h3FYP+B8CKQvr5LDFN1r31C9nSG5NBwmctZykbNg0MmYte+dCb0G8Ba9UTFw6lJ2naOWrDtR8nrBxLFYprIkyKcqkNSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxaHtciJ; arc=none smtp.client-ip=209.85.128.175
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e9d8f3289so24086767b3.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069567; x=1784674367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/WWXOiE2bPExBcg+mH0smayeiXsP/dreEIzKLTojxg=;
        b=dxaHtciJTDJxOVpqIj1cpS9eX3H38lWeU6h8h1FXxTouRE6FLJErBWGXIWIGUM3XcX
         VesQMQQW9N2F7MtykoDphNTj0i+v1jPdR5nTT/jURH9m1AFZcPfL08UNE6+PlQCAC9lZ
         2G+wcfzlJ1spVh66yzm3MHXXQALtqMyeAmnvHaL99/I6Zw0dP3AlsxIJBjittZHhW10J
         D9T8ncDgTTrvJCcYsTj/HHKlnbvqSAstXc7I4Z1MKwJMESNtoLYkG1dYir7OesHG2D7d
         hKMAKKugHDOzyNM6YHUdGkuCxfxEuvVB8fw86Ks8EpRnoNFabJs7mGiPwb8DHbZklZ3b
         OTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069567; x=1784674367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/WWXOiE2bPExBcg+mH0smayeiXsP/dreEIzKLTojxg=;
        b=n2/t+Pu2qCmMYJ26CWeI3FwhKNNb1jAmE1YOkbsWV7weQJPN4lEoLhL657y8cEqZZC
         nI8Ynxc46Vien4Jb307KNcTofHUKimgyWmwthnTxk/mPUdbfG9ITYbI18X8d5eFEzkcd
         QijbfCKwlKMMac44o2CjHbydmF2Al9GzN3FE0IgevfujAtaoadNZNZToFzCxXta8kFse
         ntVpbBMLwcnbHbYvNyjNw7KyEsXnEU1rvthXkSvMuQutd10Ha2NJxwd8CIN2akNhjk3l
         IexaTth8tRLdAwZ5dmilHTsX5tqdj+jTiXSrbfy8D04SGe1sepIR6y0hStivX/URq70D
         06sA==
X-Forwarded-Encrypted: i=1; AHgh+RrCJ3fKp8489iFPg45F5isDTiZhVenguxyUVNd3crvNqukLJXMFl5XGwc6f7+tskMT9yAZEJfYu83zeRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzxDxmj66fatBz/9vun5Wk1hVzV61rahPl/jxqRgehRp6/p06R
	L1iiSZGlcn/xm+6tQUWJSuKzhcfIyiioplnxIqPDhNlmOMSioiF6Y5r/
X-Gm-Gg: AfdE7clN5vMAJpiB9rWYBF/dtkVgRpjW6FSDaX/cJ3ZbmKdq7LaTfhzFeo2SulGESNN
	SyMrog+nSF93TReAFc4CCZX/V4wVqZHhio+cVEqsfrcYfm67nPOv0nolAI0LvAR9QtWrjuvUjwe
	wY7A1wwAWPGWdGBCQmqAwKd18dYkuoV92nDQJnwxVBdG091MOGYe3jOlJSXe4PjpgTlRqxRi8Z7
	wz0jvORnMuRT/ellJ8To4sXJbQKBEq+QNdVGfdwonHoWAiBIsCI1x9QMV+y3zMlyJszUib0u/Vc
	dPzFcwQaTc94oRP6a7RvpjhHI1kLJoPgGVv1Os7nL+KLi+aWUwsZ2FmR5WzEePWHYEoDkcK33I5
	kz8tFLkwkBnEciK63QWTp+aqqqG+KacPZmSbYC7p/QNm9MiOY1cq9pLhviGYpQRqWowUdo9cTPs
	dUJXBLytrdJXVDgXpRZDaR/8j9/dzeB0cDnq+uyexqep4gHkVbq9qppsX/bs1sIh9kvS7ENlZlz
	zRt
X-Received: by 2002:a05:690c:6b86:b0:81d:2194:6c4a with SMTP id 00721157ae682-81ecfa39bdbmr4685007b3.47.1784069566934;
        Tue, 14 Jul 2026 15:52:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:46 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue, 14 Jul 2026 19:49:00 -0300
Message-ID: <20260714225235.47134-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67594-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0D5375948D

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..90d92ab8d52b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include <linux/slab.h>
+
 #include "assert_support.h"
 #include "sh_css_metrics.h"
 
@@ -59,16 +61,13 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = kvmalloc(length * sizeof(*histogram->run),
-				  GFP_KERNEL);
+	histogram->run = kvmalloc_objs(*histogram->run, length);
 	if (!histogram->run)
 		return;
-	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
-				    GFP_KERNEL);
+	histogram->stall = kvmalloc_objs(*histogram->stall, length);
 	if (!histogram->stall)
 		return;
-	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
-				    GFP_KERNEL);
+	histogram->msink = kvmalloc_objs(*histogram->msink, length);
 	if (!histogram->msink)
 		return;
 
-- 
2.48.1


