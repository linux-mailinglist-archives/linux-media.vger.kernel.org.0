Return-Path: <linux-media+bounces-65234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k/V9AdRLNGqQUAYAu9opvQ
	(envelope-from <linux-media+bounces-65234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:49:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D98936A2663
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:49:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Tyg8BV7B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65234-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65234-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4451F301ECC3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 19:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F0633D50F;
	Thu, 18 Jun 2026 19:49:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286830DD30
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 19:49:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812174; cv=none; b=Yl4G13TFkeu20YLryF52lgUKjHeM+cEpvcNLpawIluDJIjyr9nv6yeu7LzqDxa9zDXlpPqBXfLO8uiLIHZfbPI6+g4YBIvNom3mWkYqAwqO7uTqL6W1p8FLDWOPXIpb7oBc7vx4hWt6cMY4pnDw//b5lmx0JP2Nd/cojAu3uwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812174; c=relaxed/simple;
	bh=1YLdQ/msyd0W121tLsFiehlIe+lkIMz1cTQ0oAyZowE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gs6PCih79qjDK1BWPnSxiqRd0XmBy3welxeCUlIP6CL6nKRSb6E+DK8ZJcm+D9PvM4X9BH7oqsyKcC47vF348/RJ2EQjT9iII3De6mhxxTguKVDezKSPTcfNpfsB8wposQRk4Yq2MKN3ZEcb4+LpdNj8NoWLfCaswxEXUmZg0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tyg8BV7B; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so2452305e9.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781812172; x=1782416972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YpwL670KpkXw/0Z8Fkpct/A1nyX8uS033EDlJlU/IBI=;
        b=Tyg8BV7Bv420U4cAja7bgWxPw5DHZXJsdvsAIg34bKWQchjep/SkSh/NzugsI4HNvY
         h6Qys8+8Ihkr0Lu4VdH6Sj0qV++tEgarw/c8UmcGxiin14NzdfEOQ8cd0rxtHd2wGIsA
         A/3O9ZKqg8/QvJL1wUUEEfrmERUaEELXHwnx8+Elsav8bE4LkVR4pPFg9DAszXCx/tWM
         nsbvSkkUn+et8pxNtyKLQQxlz+Z9yZcHn1l/TBNeOesHbAOK06ypthsqPeyaAKaWVr55
         DHlm/C6gWiF3JPxSv7ef0gWY1sywo1uNTWL+D/G8Dxv5ZnhrlazFcP4LD/1SKuUg8H9Q
         y1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812172; x=1782416972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpwL670KpkXw/0Z8Fkpct/A1nyX8uS033EDlJlU/IBI=;
        b=eCPAFP+kLDFc/yCky3B7HzYmVKT0iBb1AHq0JpXiyRisDDPn8v+lumYeB7axYJJ6I8
         otGJosEiWqH2wcwvFcL2qhofaLOhHQvszON2zLskhybVtCSe5w22pPQSBnDaYVwviT3o
         46wkB6APZEad2N1T626F8aYFWO+nHw6V7qoXporqWZNA+HrA47pZ77uhrK/DaPOkWgFD
         7/QGlFTfUz3TE+v+NEiEdNy1YwhTYNLbB4i8UMhMAVGdhUTIqajFhLtWs+M4zCi8ZwJT
         JdpR8txj1WFG5b75YzsnKIwgDX/r5sCgpLs33Hho+EYo3eDX9+PUkPM8fNngq4jigjI5
         f5Kw==
X-Gm-Message-State: AOJu0YzCvOY6Z9pEqZ1+VLVf0mafi+XwGOeTG2N3KXRI/8pQpufgZUrc
	Q2L6BpVjQsgB9EShxyOqcUytgGTLcrrrrmycL5J1BISzjv1DR65cwSRC
X-Gm-Gg: AfdE7ckLqlaiF4OyEWWCmZMA2VWeVLo3h+F0KYLe6uDfXg9czaQAFzenaEM/6yzFgLp
	4RElVPrDKj6il2ITHZH1vWz7B7wuagJuCrWZ2ZLFYVUvc+4QnEAoY0tSuSKaqiZOrmKUIamez/y
	pXW67gtpU+/D5cushqZeV7CQ5nbFsXpDVhhYHV/N75eZAKLfFnRLNPamxJyNDXGgNsE0Wg9h4Bi
	L3yp7NobOrEDvFb8K9uihr3O/wPbUFpOekxRv1JH42COAcf+mlxgW+A4qiMqLm3ty/hucj5Z4nA
	7wYwqYB4m+XW5CqQTgspwzJ9+t8mBJe0Ia2f9S5isxqgjW7bHoQVQfRvzFA0e3O4KDnfzbN+hGz
	lpILE4fscx3p1sxgFu8oCamcTNou0D8ALVgsuU3bhVDf+pJS0uF298y+XITYJBER7sMkvpi43dr
	lVO59A7V1pLzueertU4/jhK9ZPKg==
X-Received: by 2002:a05:600c:6089:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-4923f579721mr17437325e9.22.1781812171449;
        Thu, 18 Jun 2026 12:49:31 -0700 (PDT)
Received: from localhost.localdomain ([115.187.36.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm3073735e9.1.2026.06.18.12.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:49:31 -0700 (PDT)
From: Joyeta Modak <joyetamdk@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joyeta Modak <joyetamdk@gmail.com>
Subject: [PATCH] staging: media: av7110: remove commented out macro
Date: Fri, 19 Jun 2026 01:19:00 +0530
Message-ID: <20260618194900.8771-1-joyetamdk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65234-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:joyetamdk@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[joyetamdk@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joyetamdk@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gmx.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D98936A2663

av7110_ir.c contains MODULE_AUTHOR() and MODULE_LICENSE() commented
out. This file is compiled into dvb-ttpci.ko (dvb-ttpci-objs +=
av7110_ir.o in Makefile), and the MODULE_LICENSE(), MODULE_AUTHOR()
and MODULE_DESCRIPTION() are declared in av7110.c.

These commented out lines are unchanged since before kernel moved to git
which was checked using git log. Removing them will clean up the file.

Signed-off-by: Joyeta Modak <joyetamdk@gmail.com>
---
 drivers/staging/media/av7110/av7110_ir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index fdae467fd..e84f9353b 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -154,5 +154,3 @@ void av7110_ir_exit(struct av7110 *av7110)
 	rc_free_device(av7110->ir.rcdev);
 }
 
-//MODULE_AUTHOR("Holger Waechtler <holger@convergence.de>, Oliver Endriss <o.endriss@gmx.de>");
-//MODULE_LICENSE("GPL");
-- 
2.53.0


