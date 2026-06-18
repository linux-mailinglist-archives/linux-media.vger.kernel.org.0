Return-Path: <linux-media+bounces-65187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5EF+CnzfM2o5HgYAu9opvQ
	(envelope-from <linux-media+bounces-65187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:07:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B89569FED1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rMzjATTz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65187-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65187-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BFF7302DE15
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138933F44EA;
	Thu, 18 Jun 2026 12:07:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B819DF55
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:07:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784440; cv=none; b=O3Il6s+MAnV7oaNeccchT7QqDNsQKKXPOCuRUaN/NqDOTKkFFoTFqF99ja+cIk4eqmQyzgSTPHs01O344J3AXKrnCa9c33n9pIOZiWaVUjXJrYFUUE5rss1742e7CnZBa9xfxtYaun1ijLYkkubku+bGlHzMV+jjo5wEFmxJlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784440; c=relaxed/simple;
	bh=SfbOzbA3MKHsGeTbafSXSu5EYcsHWSO9YIZOKREiu/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nj9joDnHYp1+ipJuDsUK+qo/i1ahH4BSIWKNsGNC5moPmZnxC9wkB84tjwKhjdhS5nwmVlofqeSlb8zU7a6XvVo0y+uTCIe9Ql7HZSnLT0fyfF9VoC61ftFjLuiWMhS1RwAKvL8FgianT5u7XBGdXqhDZWxJJwpo6/ymh69ZlLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMzjATTz; arc=none smtp.client-ip=209.85.167.42
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ad49c55ce1so752753e87.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784437; x=1782389237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=rMzjATTz1MGTEZNwmy3stW3ZCI0hEl735IO2SKciUHgkwWmxCyGC5ItoeQOSomdsHY
         O41W/SR8L+IE5F8z9gEIilmiYhy7l86HKjc5SNkD3bRAYugPL3T5/l9P87VE1irm9pkI
         aJkgqGijWb58IIcGeicEMKA5JJ0KqFzpSXCFfGl0SnfDCb+orYlP4c1fIWtG86X9hdRV
         e68xvBk/5mxNK1YHsI1cswRY3O7+2ACMtKXA0vbMlY9TdrGoaj2DG0LR5OjoozAJOIo1
         UxzASsiMsoTQVRBZtWkGu5mg+ema9NSfaOhdHmJUp488fdBxufisnA0kfR9r+agg4nC7
         xDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784437; x=1782389237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=DlYWy7WA5guSCSpr/GByVM8Jap1dGccT13O/H+qqxmImlRgPX0D8hm9sY6qn2tygcB
         mtukOReLjKO7JE912WmMBwN9jk2SOA1fJhgycmGGfo7W4XZNAzBM6PFQvLo3z6r06gbx
         gZwCTIVVz/Y0J+EqC/LH6/DeyQwbLcyE8Mz2zTQZwLITxeBNJfhKCdye7NioBOLir8VJ
         X0mfw3m0yoc0b83uWg4Dq9mwUg+rtbmTPK+GOzVjtWq2dt+1iABvWyuzfkC5OfK5Pmhk
         XuJvVvBW8BDE3YiRJGwip5YjZeiuHFRvGtZSIYgjvLD38sL0bK4ydbShv1DBQPg5Ibz9
         lSCg==
X-Forwarded-Encrypted: i=1; AFNElJ+7wk8ZI+wF27PnXKDb59O8YQG7VYOI4RNJWWYj6nWjysgCXVwDqeqA6v15QXcGu4vt2nzSAPNFS/OfHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/Kr+z5Cs0ByLPKnMITRXQY1CL4NhhwALIniLelst7yHLLwlP
	8bUObXtLwBfng727NAO/efjKDbE0tk5Gymoucd6ThMC64JrP+r/AgbUd
X-Gm-Gg: AfdE7ckaW33joJj7svKmK+1SufzJsc+lmUzxXSA3b2F3+/F4gOOoetHPJeKCuayjaWW
	03IZLxrJbG1hYBySXkIt33aqOj32cvW7p9xkblX5istaCnuhyifbNUB4jIiDFmyPFv3yl9SQhrG
	Rz8TGMGIymimqBL5YWyuksjoNHe/Z5cnqOFxmsFEEF+jXMDQ3kh8H1HJwxLeTwJz3NV91AhDt/u
	WTmsqqXWKdxW+UX05G7IlNo13jAoQtxq1KcR1xwf+cMGuxsJ7wPl3CJCz6RWhMHfhsFEewHTwxV
	Tcaeq0JHsc+SEykIaZedEJtZzFVTPzlewCDuI7/ecI26lrkFqJDsqgxzew07DFleI2ZR8OezAMR
	9rccqhjIqVEBg84flXe7juRl5mihOMHPgw6hyXq+75oZ5gbiQKeWPe1NfCMKfPYZuavtOac8VKD
	Qu7+s1fA6UVedvBoeh+5GVt6eO86ivePNUG2Ws1NI+eNWtM+lzU/c=
X-Received: by 2002:a05:6512:3511:b0:5ad:5346:87ac with SMTP id 2adb3069b0e04-5ad534688cfmr396355e87.13.1781784437232;
        Thu, 18 Jun 2026 05:07:17 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b545asm5356676e87.80.2026.06.18.05.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:07:16 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 2/2] staging: media: atomisp: prefer __aligned over __attribute__((aligned))
Date: Thu, 18 Jun 2026 15:06:23 +0300
Message-Id: <20260618120623.42867-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65187-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B89569FED1

Replace the GCC-specific __attribute__((aligned(a))) with the standard
__aligned(a) macro to match the kernel coding style.

The checkpatch.pl error about complex macro values is a false positive
here, as enclosing the macro expansion in parentheses breaks declaration
syntax.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/platform_support.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
index 473d8d4fb9ba..9aa445c45e9f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
@@ -20,6 +20,6 @@
 #define UINT32_MAX UINT_MAX
 #define UCHAR_MAX  (255)
 
-#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
+#define CSS_ALIGN(d, a) d __aligned(a)
 
 #endif /* __PLATFORM_SUPPORT_H_INCLUDED__ */
-- 
2.34.1


