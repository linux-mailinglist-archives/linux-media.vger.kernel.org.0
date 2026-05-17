Return-Path: <linux-media+bounces-61838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAh1HMdZCWodWQQAu9opvQ
	(envelope-from <linux-media+bounces-61838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 08:01:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB8F55F62B
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 08:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D5E300E718
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 06:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E5830DD2F;
	Sun, 17 May 2026 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjqXknFP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30C4502F
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 06:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997697; cv=none; b=RUHYx9rS2g0IUllus2UuIzgvvx2FuVmstNNKuEjwYjRp5jIwpGtrgSaX4LA/0Zf6DlSHvWNg3V5zT5csNAmUTqDRIaxiafBZ8WS45aD2gezW3LoOhtRY4EsDnxwQazIqY1pdw9y7FPuFMWmin2cDznCs5ikug6zOkMl/s+tOgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997697; c=relaxed/simple;
	bh=VaK3fKqcOmXN3mYxwSRwH7hBWOIOKiIvaobLGWq1OHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=diG+KHtcVGHPqtNuk5BANxIflEV8njhX4kw+JWUEuwrZQgdvlT0JSy8djm8XLeNOYbqavaKCxHjCjtEMX0ouHd/coEE58MNso40xPCcVxwMq7zpbtPVd+bYS5V+YERq3u17a+Bd+Oa6Z/tmUnNiTgFFS/99XPkC//cya66mJHlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjqXknFP; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-479fc1fc048so1129680b6e.1
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 23:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997695; x=1779602495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVCHuHOtEYmbunnuxniFzv+yhpYhRK5hiaxeyHyp0XY=;
        b=RjqXknFP4p5rS1P6O1WPS8kmH+3VpCgfCJZw1JdQi9BEfXNtfOilsAm4ZTJYo9YJN0
         bwktOTzol+TTdv/PDFExN636chLaOyKaf/0JLKIFQ8SI2F+uzvL8M1Fq0s6Y+/XDFhGx
         4dykaglyEI3F8eQAtUfP3xPbvnZL9oeFoD3hOql6B49+TYLlRygQVprberOU6g86qcKG
         QxEk4EGwO+eoHyuqW4K1f9kW8X4N0mTjiPdywS+qEgHLdio7FrhfZ8Ri+OGdWJLUbp72
         QZ/eadahqR51ZMO3ZWTZw0wOBu7kFq8V9LilWnTAYXiKNYeYiNZY+lD0IkSqjV04F1Gy
         MRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997695; x=1779602495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVCHuHOtEYmbunnuxniFzv+yhpYhRK5hiaxeyHyp0XY=;
        b=JdGnnjJOm659ER1XH1nYU8akK13RDmNVWpTATSXXus2rQqMIeRuemm80K9wwEZ4V+o
         7dntQOuwKy4NkuineiwLsj9fSJIL31EGsbohL06PzviXxD52tykPM9IfEYzvDxNBg6ry
         Yp9q3F/T5jTPLELZbO8+EGwhyzc32xpRSdgII5kMQYzrRqpRfST2+VQ3O0kzuEwutU5j
         fVgM8rezSW2r4BCakjJeVtom5K3Pe0z3qc0aoiCt6qFkVeC0FD8viX+WHuHnugyhxVXW
         Ga4m+v95rHH7G6ixc/B/Lq+mXiUZbVlQ+/m834ozicSduSoawax9UjByNjtaAchAyxFG
         ckjA==
X-Forwarded-Encrypted: i=1; AFNElJ/LyqSRIHWCQaMPSqNBPgKlD+zsCtHcSsl6qNYE9i1ENJPwGGKHFH9JDB+7tN12Lelo8mxXi0PY7D8FxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KJAlnfHkFoZUAYCiyXGocmRdLrV6Z+hN3tuHPQFRfNB5xSYq
	I9hq9S82roHsoGeooqokR75mStLp/3N/YfEp+zmyu2nFKqHbJCNI/aeV
X-Gm-Gg: Acq92OEOsQV85S+n+D3Q58r2F0hcVg1Ana4qvoP6H7Yt5sfkk8EIpBd45dwuMRBMZSP
	hlakT0KTBdWB8MYjMhryMXqU1n8yFu9iHe/i71NSZkkM5+KZho+tlIFlpzExZ5GFmxxEmAqAOpM
	mdcNJrTIRWGDN83MkvjZNHh8NjDXgTnXtwPhRnXkSwKQkjxe814Qytn164drpChPzRGYBm8CdNv
	QTXgO97Mxs5Ly/KX++tn1yyeuKmOik2jzXllzGZE9WpY3c9X8b3rXPRhDsINYidA/iRNJxCd5ZO
	n5WIC/vr8tzvp65mjm73sBgeXH7HiCKuO/m9UceYWogw7gGDD1CXqP1EAqz0eaaIXhDNySiiczo
	dwbdkPtKllYjACIVAaG4PJC8TUMLLo3xMdn2FSOsKRGiJQAzy0CVT6SukI5mODGpjj8slu/P8Ej
	ePiFZIdhu+/yVcsUaoEH+bnL5nK3I0Cwm96/jLffo/dw==
X-Received: by 2002:a05:6808:67c1:b0:467:1880:ffc6 with SMTP id 5614622812f47-482e5760341mr7257824b6e.32.1778997695039;
        Sat, 16 May 2026 23:01:35 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:a314:9972:40f1:1f4d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee5349a5sm3397433b6e.15.2026.05.16.23.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:01:34 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove redundant comparison to false
Date: Sun, 17 May 2026 00:01:19 -0600
Message-ID: <20260517060120.221278-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CAB8F55F62B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61838-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diegomanceradev@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Repetitive comparisons to boolean values are error-prone and visually
noisy. Clean up the codebase by removing the explicit '== false' check
and utilizing the logical negation operator instead.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11..bcd84efd3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1466,7 +1466,7 @@ sh_css_set_morph_table(struct ia_css_isp_parameters *params,
 	IA_CSS_ENTER_PRIVATE("table=%p", table);
 
 	assert(params);
-	if (table->enable == false)
+	if (!table->enable)
 		table = NULL;
 	params->morph_table = table;
 	params->morph_table_changed = true;
-- 
2.43.0


