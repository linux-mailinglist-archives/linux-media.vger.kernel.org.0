Return-Path: <linux-media+bounces-66813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +UNkFkeyTGo7oQEAu9opvQ
	(envelope-from <linux-media+bounces-66813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:01:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F5718CEF
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:01:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XCO2IW0+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66813-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66813-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9211E323A75E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 07:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71713C3440;
	Tue,  7 Jul 2026 07:36:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E513A873D
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 07:36:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409781; cv=none; b=lbHNMuHvzJc1/y1Ghx7+kBHuLK5YGXnpklDSgqlY4HarFg8/7LL4Y+Vi/O/WZJmqMiV5ak0BipeS5Qxo2/50JaNq3Hr63oyEmIcpOKaSG22SV0N4M2+xm/KiPjLNB46GL8pavjXi6OhNHGrYMMBt42JbnyD/DQV6cwJnGodSURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409781; c=relaxed/simple;
	bh=DSEChP9kAsmk2HrXfSdbcWaNkWfX3idepBBcxxyGuF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGQUABEgmPC01cWSv7/2jPwtyoHJPl+6UVwMc10ZYTV04bDAUgBkIel0h3ocVGArGlRBwyNKHg2XELw1vhg43qEggdZW9EBCDrbFefszezLa0ToUeh7tV5WrWNqYlOcFjjLJVrdlziTLBin/93CyQu/MprYJ3PMMwpRjyi8aFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCO2IW0+; arc=none smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6546778a12.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409778; x=1784014578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=XCO2IW0+wl2/TTVsaSeM68xaqGyeSlR8kPZ4ZZVhzz0hgtUT93u0v2Y+9++nkDfnr/
         9pbzYefA3/XQ8/ATUW8XkxHwFZEhBZ+nuRyqOljxuKLvAftDcBZgCLQxtRf/mk5W/LGe
         isxGRG8gW+rWPIg0n4QdQicTeHM3gZyOJddhF0JyQEt2HOlHSprPlw9gv21SMjndlrDv
         9IRwm/HeI8edMc1ApsBGJi0FQIcQ0DKjgM8POT2wvTjDAIMOVKwvzvJIm1te66NoCWn1
         vrvhryXTNAVETUDJatycEgVm1+2KrYLhDqESIfRgrcEX07F+neUQYJkkNCmt7yL2xiyl
         aBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409778; x=1784014578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=nbkypk+W4TExrBeRnmGEYXTbJs46eBSycCzrHiEZNZ9lfFbUhZ7ff3lEfT4Ny+2hwX
         TAuLRqx8fbdLIowu1B2TZvkzDd4+YikFI/lAmW+unojsW3OIkg1bIwVUQuSK21LrGjV5
         slaZ3V98k8QlYHR2zefCYxLNMv+S/RIxWP/yDu7w6sKm7TJeTsc4enJ44IK7PS5uP1Ub
         317PvMDNPwsJ1naKxiNQyv44SGHpl1whrsL8sF2sh4Xh5apc5TAtjNojfDr6DUQku/B5
         u15R7SyWP/pjpCUmuxPvMe02/pPPKvBSQ8PPD8qq1xDc6ZMrlT8J2wgiZ5Z9pSNz57O/
         fELw==
X-Forwarded-Encrypted: i=1; AHgh+Rom6Kzfib2bxBNpb/Pyi4zk5kKx1dRerwBi7aqitW0vhPcoJiLwiiMDP3ukVoEIJQ2fbOxORW39x2MsrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdphFsXzZ/GAe8tGettxGODVyeSPENzpLEL9UC6FyUZKU7jBJI
	47Evg01bEwUtdnYs07IzLLC80ocoC1C0q79Ek2TLHkZiwoDUsZO2LThw
X-Gm-Gg: AfdE7cklm5Z7UnPaOJ5uw/wecW+Hd7kCG6yB1gg8NEyrysVcCx10ZMOgc7I0Oj34D+e
	aGeuOG798g1yr7a1IbFgYXCl5cgDHBGQlQqPWIFQp8z56VcxA/48VbvPVqpWaExCdHSlOqfLBHK
	bzouSJ0EQtUI8jRbQ+ebenAr2v/lSfmKKEwqs1qGSX9OKS9gUiv5aGMoYU95siPsAQJ+J/GMcbe
	FsBBEjuqzswsIa2BqnWFgR7WQ+oW0sVztUBiNErKfFeAffZQv6G3pWAWh0upj9642qcHNgoYHLs
	ssYYPzWT24YXwOb7WYM6tSzcpjzbTqYc/5Lvz0dezsMQ8dNyJUhw65DhkBBnXY5mzk7A+UKKX3K
	FUfa/74lEjP+4qgOQdl7oPFNjmg10foCLOcR2yr0hhd80sxfQuYqazrpxgV+tJ74SSmOLdYclOi
	5XSvBeksTfb3Km3SC3
X-Received: by 2002:a05:6402:5406:b0:699:6d24:e298 with SMTP id 4fb4d7f45d1cf-69a8564e926mr2104511a12.8.1783409778033;
        Tue, 07 Jul 2026 00:36:18 -0700 (PDT)
Received: from fedora ([156.203.68.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm5515780a12.7.2026.07.07.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:36:17 -0700 (PDT)
From: Ziad Ali <zalshemy9@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ziad Ali <zalshemy9@gmail.com>
Subject: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Date: Tue,  7 Jul 2026 10:36:04 +0300
Message-ID: <20260707073604.11463-1-zalshemy9@gmail.com>
X-Mailer: git-send-email 2.55.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66813-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:zalshemy9@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zalshemy9@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zalshemy9@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD9F5718CEF

Signed-off-by: Ziad Ali <zalshemy9@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index 33e6079aa..59730ce32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -93,7 +93,7 @@ static struct ia_css_macc_table skin_high_macc_table = {
 	}
 };
 
-/*Blue enhencement image effect table*/
+/*Blue enhancement image effect table*/
 static struct ia_css_macc_table blue_macc_table = {
 	.data = {
 		9728, -3072, 0, 8192,
@@ -115,7 +115,7 @@ static struct ia_css_macc_table blue_macc_table = {
 	}
 };
 
-/*Green enhencement image effect table*/
+/*Green enhancement image effect table*/
 static struct ia_css_macc_table green_macc_table = {
 	.data = {
 		8192, 0, 0, 8192,
-- 
2.55.0


