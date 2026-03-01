Return-Path: <linux-media+bounces-54025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vZ8RMcitpGkCpAUAu9opvQ
	(envelope-from <linux-media+bounces-54025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:21:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E851D19CC
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73A623004623
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 21:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D016B175A84;
	Sun,  1 Mar 2026 21:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nict9kHh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DC2430B9F
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400066; cv=none; b=Dq0vL+A/2q/JX4Zh2HsHJkkW0n+IukZr6ZRqZkgOxL/w2I0nGXMpeoojdJ81dPLxsMLgbqXjbrJ+HgGUT/uwnBJWgta1QkjDj60jFmiWGtJh6wRfyEW86j3PL3kwpsxlIqLnIEojqmtVxyONZi8B/TDC/9/FjMNhOD+em572TBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400066; c=relaxed/simple;
	bh=znsaELJexBKGqpY2QXeMZ84nICUuJN08Xpiiuesnxnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGC6Ohp7D+loAYTI/fjbDoXmJqN0iPDbzE7Y7KhKo/RJCQiKCBR53Xkd4u98XkTa88PrAqcJKH4wZq/7sCOXkDq3hVur7wYs9d/iOkEyhOXbdpNx+XHht59akk8XeHCTYzHLadlqgQ3o2MpSA0vSZiHfeLt/ZRfjY8a0YgNW0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nict9kHh; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389ff6e5885so50745931fa.0
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400063; x=1773004863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJJJcH8qm6uZh9jQolPaSi8lzikW/vGJx9WrRbJtwbs=;
        b=Nict9kHhvIJcJrBIU1Kdqxs3C0fTPhH/7J1XY08DxKcEvzS6yFccpTp7m9usB6eWAa
         LaI0GHMQWYIkxoDf8epQV/8V9xugrOSlAVQLF8BluCgZSnG95GMmckjPIvGQ4OpMmvZ0
         8r+oR/RiZitupYdfaMARDuUw47UZ0QFMTlUauxFnCHSqAHTBzs/B70fpxaNhDJ36fcgz
         vqqohjDYd2roQQKvhF76X3PFtKGGpdcHO9S22wIf8esv19S4VW5BtNMzEmBJkvD0O4/u
         NLx0fi4OfAYQo5/NiBSPJ8yfOPzacfDCWsgZwy52t1dVQR3dN8+1pMFDpGasRBpQAYBK
         vOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400063; x=1773004863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJJJcH8qm6uZh9jQolPaSi8lzikW/vGJx9WrRbJtwbs=;
        b=msY1e1OyYaVxi0x6hym+4/eONTNagNqqDqvGd2DwXctHvvxEysIekyqILcAuoVQm6M
         BbbGPLupHmWwKiCZDX7WLNOj4sXm4UW3bQJP3OaYEffVUHxcXRiLIYe6xagC4uaapILI
         C0GHPHkQGA2lVzvOW7NgxQ6LeZjXbMvb+/RXOu06xaLK0sSbCpfPDInJbHXcGQFjkecR
         ce33HrxwM7ToNEZPm3NXiSZ+d6ZnrpQ1dngZyJteCaWMO0FgN2f2/dmYaYEaAATtYPm+
         PLeitAADZb88SA6v3UcqN/7elWBoSZSFR9xKP8IFj1QyYevpdIUVcI+da73eiQduQGUX
         JipQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkETl+XVrEJtI6Mz0DYCrSJBzeG/U9amAf6tMKk8Jlxvv21nFskbaRbK4VAsIT5g3mossunajleckyIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytRiqy96DqDcBEb4+GlHfDVcgJev5YuUOvLlIfB9/8dxtCUiNt
	2Kb3F9n+ZnJwMwBFfCqoHhtjO5S/sWC7PRy6Lex1+sHDBq/++e0GtUswjgWf0g==
X-Gm-Gg: ATEYQzwuTocaC7exVCSAgQmGJ7AKfna/CiLCMLEhexgfWca5hGwCkTXMzDo9WbyuT7O
	3EJy4AQR2JjjIfiE0x12FfF+3uwHA8YZ+SwLjauhiSPULByQXeXw99S3kolswAunBmWIkFxqg7g
	orTizgSbz6sYCHP6DbyW2T8LK6AlLaZ80oOGu70ZkeZCEZyHhDYlF7eUAO8kYNQoRIYPeQGeED4
	sy3G5ZCrKZqvWcnyFfDxJxv0NJafNKinzjT+cSb1Jsx2hWKVDeKGYFuYxDMOa1bLaQ3XlokPGU8
	jb1B+czZ4/hsoqsI/+TpB5bsCnmRzuaEGFXbX+/7gp2a7ijjQ5Nm+3/+VgMFBzGQJGwWp4ZRij1
	eg5lzi4mzN03f2MkJhBKb6YqAnBeeEB7TMPgCrsETUcvBHO0soQOiv4pDqOcgs7hyebnwuBBFLk
	WC10FPwMQsvZrAP4qZOhJszSadmIh7fd7XLi+KSs8c9tQNODpTEoKF25fAo8iJFkXr+GUw7WNlQ
	g==
X-Received: by 2002:a2e:9646:0:b0:389:e6e4:3c7d with SMTP id 38308e7fff4ca-389f1e2a56fmr63482001fa.19.1772400062618;
        Sun, 01 Mar 2026 13:21:02 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bc9fd6sm1248587e87.35.2026.03.01.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:21:02 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: remove unnecessary else after return in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:20:47 +0100
Message-ID: <20260301212047.3649-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54025-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6E851D19CC
X-Rspamd-Action: no action

Remove unnecessary else clause after return statement as the else
branch is not needed when the if branch alsways returns.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9d22ec27ea76..d5c5895e06e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2035,8 +2035,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
 {
 	if (from_user)
 		return copy_from_user(to, (void __user *)from, n);
-	else
-		memcpy(to, from, n);
+	memcpy(to, from, n);
 	return 0;
 }
 
-- 
2.43.0


