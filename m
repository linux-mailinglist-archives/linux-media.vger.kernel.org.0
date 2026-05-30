Return-Path: <linux-media+bounces-63121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMEIHaHMGmoh9AgAu9opvQ
	(envelope-from <linux-media+bounces-63121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:40:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B90F60C8F7
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8115B300C81B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493DC3AA9EF;
	Sat, 30 May 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTM5Be2k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56FF3AB274
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141214; cv=none; b=F5ohNxiVRdBZ+Rb1kXUYoX8zkRlKC+GXKI3dkNFgwcbnnWG7amUwqwOEHhdMI4QYbvmOIinVCC0Tmd2RyAhLByEG9lVB9MIs4Q2BaOBFVzl/QjHmCrGmOFy49BVHOCQZqt3zdTEXXvoT1n/jTiJilERVGyb83fDTXCVGn+moHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141214; c=relaxed/simple;
	bh=OOHJjWKSeo4osgwSWJqA12jMh5iiqePaxkzSthvDHTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V5HeqCw71xvCt3CkPstAb7StJAq8wAN29zuv2IJxjryWErQR1s9OEBQ0CD7CVRRi5NYfoiogEZZD1nDE+pjnnf7sQE56AhnHGBhwO+KCEuhX0B3cDEKomuzV43y6qaTlrjahNHGZM+r000PxhFPxYTsfcQzCjBmXBub528kCL9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTM5Be2k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F6A1F00898;
	Sat, 30 May 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141213;
	bh=IoDponGPyc+RltUGfahrOHyLvXMdaEPttUZI7IOL9vs=;
	h=From:To:Cc:Subject:Date;
	b=JTM5Be2keilZ6yqZQwSg4isSrPfgMPrBIA7kZg9CnOiFyoTKO1lDlEbaMJ/sGPOMZ
	 MC70Ggd48GqhNHHVvgcj+IRavM4BpIwlW5IgskHR62G7ikI5phPTRDyoZT9YDB5ehm
	 ZBokJarqri2wuy+cstAoJnP9o4TTdv2VlNkqy98bQd2pMley9zc667s2t47brBqw49
	 /PM+4i34N25W6mmf33t+S5w/WtWibyRS88gjvTwmhdgdiXWREqTJSVDlWiTNl4hNgc
	 2K6EQFpxREujyd4r5P1cBSm9iKk0taCpU7rjczj/qO2nhorR7yQrLjLdiSTwExjZLs
	 EOLarybNDAZTw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wTI31-0000000AiXt-3II2;
	Sat, 30 May 2026 13:40:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] [TEST] add a broken patch
Date: Sat, 30 May 2026 13:40:03 +0200
Message-ID: <9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63121-lists,linux-media=lfdr.de,huawei];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1B90F60C8F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

IGNORE THIS PATCH.

This causes a compilation breakage. Its only goal is to do some
patchwork tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..3b997a9453e9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -89,6 +89,9 @@
 
 struct sh_css my_css;
 
+FOOBAR_SYNTAX_BREAK_BY_PURPOSE
+
+
 int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
 
 /*
-- 
2.54.0


