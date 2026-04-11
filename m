Return-Path: <linux-media+bounces-58594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJmKMjyG2mkO3ggAu9opvQ
	(envelope-from <linux-media+bounces-58594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 19:34:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A93E10FB
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 19:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6382F3037653
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 17:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7588F3B9DB3;
	Sat, 11 Apr 2026 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX+DzwVu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB24C285CA4
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928888; cv=none; b=RBkiFwFbzPphAcSHudM1QIfBSUz/8x1gqdqNSCCyQ9vznYyZL+t2TwgQYluY8yZWsfaiEcT20Tmm7/gQN1fl1PVKyWPp7a62MEI6+A0Xgq8mEqEhzFRN+Vxwso5m/ScF2Lgqasi+hv6r+nsRMmqTv+vNGU+29OYvkWaz0C+DpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928888; c=relaxed/simple;
	bh=TVUmmcEGpWyuwDQqSCraoxd2R9SWXANWLHXdECuOFG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSC8/md8WieJBCrPlar1qFQ+xvXAsvCnUjTGmn8jx1m4zgM7c6NNvKst7m0jbNsNH75FD58eJYm177hHhLce2v21jB5So086cM+DRqYxfykmh6asQ+CnhSzcyOJfMmoPt7ihcfUhcmaJEIBMGa+JqSFQpSTNpsmfAtK9ZDle0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX+DzwVu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad4d639db3so14144295ad.0
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775928887; x=1776533687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjJYUGwxxGgqwtKOdyqSDtrzAYZSru7BIzGMtnuqExI=;
        b=bX+DzwVuIBZE3Aa8jiczIC8BEMEl5sANb7PaeK8UXZ5pxTxDu5jlUd0TR0P9mgGXR+
         +Nx8UII1I29TjibLLek99UKeoYTlt6/SRtz2CGkim6+JYwBq/1xo9TpAqLOF2eCyc1NN
         md8k+djv7LQXfAqXJUABIhQczw2CJ48wx27yvvcN6bJbiBNdCwvBUGk2skZmAhBZ85hm
         fumXKdiaBR9Kv5SJuhHZWB4yM1dfgiAfiBWatHiTfZZ7ohhjcPJO8V9Maf/1cJSvVytP
         XiSEoh8kDDJ2/GanmAtQ9bDaJw7qGmtmSbAg9lJahFjwrk9FtXLPpJb59NAAlBCIVX2v
         0J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928887; x=1776533687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjJYUGwxxGgqwtKOdyqSDtrzAYZSru7BIzGMtnuqExI=;
        b=OL1F0A6TIZ1XCUsVTmJ4qkFIGGAqKaeOngp6jiUYHskUFB6L3zCmtfApfJp3g6AHkr
         qvh9t8HOK2VtcT6wvx6771enxFHJKbNSHpVpSl4vI/nQSj7anIp7CCbuTVAQD+MWHzuS
         dRhkqH7krs1rNGS4DwST0GpE9Do8ogSM9wIMZgpoH5Woptm1Sl5uOPLD82aYHqSvCo8C
         wt/7EOeKkJCz45Gwg41fIcJR2zGflz8CQXAO87wJYwD9RH6O6/gspjv/X5jyLNULnJ5H
         ZtGm8YV5iv/94SKSXHQj7TcsSRa069usS/3tQBVnB4yO6mnpBxv+4aa1eQk2KNYsUpJa
         GZlA==
X-Forwarded-Encrypted: i=1; AFNElJ8XWzpNSnLEitoreK6jP1dGZfbjFvYJcymmgwQ+O0AewB+TEhbVPAGLKgVI6mkeqoTGAYm3ipI0v7uqYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrGbOXt+FG6Hs7rn9G9ryVEOu9yKuArnnu/IMJFSez7Ua/QQwg
	+jYrcWerso79xiE/goiK0IwtiYadXqtVSkto6th7SYiXQbI7Doi3pDgc
X-Gm-Gg: AeBDiesR6u8kf3ngEi212yR5isdzZqb/iZNt4PlOb+XP7l/leH0Qlm/mZohwxOdYRKW
	RwgZYz9xiYx2fcglXA8ZvG2LBSS++4o0iWaGQV+cFb/CwL+xKmE8cFB2Z1dk3vvjvNZ/zVrJCSV
	HeVHqCNqhbT0PKtG3k+1R4W59BQZi6rk0wGsy8mGY6aHk8VrIB/qSrfZbq6Gz7VzjzrnzBchAXj
	oH7qtbj3jNwBlGtsp7h5ozRMEk/tc9xzpfYImU73qVYqdBUQWZo4TphEY8n+NOs6inbEVkmhBTz
	jRXIPSaaeMJ8rVlXRDPn/0dPKttCQLePYVFnr4+7uwQdOD2AMPy2Xhfp0HmI+RSPhAPcmd2xZoe
	4zoQtEzjvGEvPXPPailvCJqiVTGy/bjTTDPxRa4GQ3kvw9jMK1tk26DZTfku3MMxAdPb/kU/0cc
	KgkKPFKV4a1RkI+JPAujOcdx+N8ByC2LkGFY9bXZrznrH9X1xKL2zzUCw7uwguoIzXHi8qErS8P
	OGhH/9MQr6XnNGaNDBe1Kl3cK8ZcFdG
X-Received: by 2002:a17:903:144e:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2b2d5a7773emr76956635ad.36.1775928887277;
        Sat, 11 Apr 2026 10:34:47 -0700 (PDT)
Received: from michael-mint.tail2556e3.ts.net ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dd67ecsm67009125ad.21.2026.04.11.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:34:46 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	Dan Carpenter <error27@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: use umin() for strscpy size arguments
Date: Sat, 11 Apr 2026 10:34:05 -0700
Message-ID: <20260411173405.14485-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411005512.46142-1-mugrinphoto@gmail.com>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58594-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mugrinphoto@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 432A93E10FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded ternary min expressions with umin() in
strscpy() calls, as suggested by Dan Carpenter.

Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
---
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c      | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e0..60bb10dac5891 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1256,8 +1256,7 @@ ia_css_debug_pipe_graph_dump_stage(
 				while (ei[p] != ',')
 					p--;
 				/* Last comma found, copy till that comma */
-				strscpy(enable_info1, ei,
-                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
+				strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
 
 				ei += p + 1;
 				l = strlen(ei);
@@ -1268,8 +1267,7 @@ ia_css_debug_pipe_graph_dump_stage(
 					 * it is not guaranteed dword aligned
 					 */
 
-					strscpy(enable_info2, ei,
-						l > sizeof(enable_info2) ? sizeof(enable_info2) : l);
+					strscpy(enable_info2, ei, umin(l, sizeof(enable_info2)));
 
 					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
 						 enable_info1, enable_info2);
@@ -1280,8 +1278,7 @@ ia_css_debug_pipe_graph_dump_stage(
 					while (ei[p] != ',')
 						p--;
 
-					strscpy(enable_info2, ei,
-						p > sizeof(enable_info2) ? sizeof(enable_info2) : p);
+					strscpy(enable_info2, ei, umin(p, sizeof(enable_info2)));
 
 					ei += p + 1;
 					l = strlen(ei);
@@ -1303,7 +1300,7 @@ ia_css_debug_pipe_graph_dump_stage(
 						while (ei[p] != ',')
 							p--;
 						strscpy(enable_info3, ei,
-							p > sizeof(enable_info3) ? sizeof(enable_info3) : p);
+							umin(p, sizeof(enable_info3)));
 						ei += p + 1;
 						strscpy(enable_info3, ei,
 							sizeof(enable_info3));
-- 
2.43.0


