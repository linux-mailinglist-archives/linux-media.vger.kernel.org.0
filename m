Return-Path: <linux-media+bounces-42639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC8B7D0D8
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3882A7EAF
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 00:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756F3126BF7;
	Wed, 17 Sep 2025 00:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="lxzQHwsR"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.mt-integration.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863F1C3C18;
	Wed, 17 Sep 2025 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758069066; cv=none; b=Yns9MOatX/JxsRLgbbPhz2eTTJc0yiJGk3BUaqKmw3pdl7zQ9DBaqvyQ4xKD/LQx/oph4em/5z5lo3/mlZTl2PtbrU26AlA676lxaBJflDYPaXH4MtXAfFKUlPLVyHh31ocLM0XQjSVqSv2QbitKVd58zUBKdALC7qnKrR9Q6C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758069066; c=relaxed/simple;
	bh=jKMrePTVtH3GK5CWeu04sQVpD6lryLOx7JYCpiq1V1Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dVVJ51YAo0UCFwBta7/CR71YR/fpjl9ide85GM2le4AzpNUIRY8Uli5vhrIRyVC91+mZ7UyXhrXeZ8BXTJbzgWAYFv2e3cOnMa7abVuYx+dq1p2/UaTCo24JUlF2zmQsI3JYEAOfcZX7INW6Bv2T5KgfKk06Jr0jZlKPkw2lt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=lxzQHwsR; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 8B5EDC007A;
	Wed, 17 Sep 2025 03:30:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 8B5EDC007A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1758069053; bh=q3FMmTN5hXMh2C/vbItSLhglx0g/rmCHO6yb27iSL2w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lxzQHwsRMKVDhSzymQ1FelwfAX60PBlp7g38nKSrG3rk5PXjmby6opbidk26tULMW
	 W+8ClSukFbxob6dWYc+iSJ7XMhU4p0VxU1L4jHPFt/YIXkBH/v5iq8C6YI+4nDNg0G
	 5JunyfRMcM2f/yQ2ViKNOrLzxfPbPTUP5nzM7RYRybs/XbdsdE3bR37DXjaPhCQ1jO
	 yJPtaiDX7ldFTHGL6iq28s+hQkOvdAZX1K3aecN1eO51F7YZNcu2ct1qDmapAUHPv6
	 vYGsDDBFmRHLSCxqK6OHqVZMTd0qr7bA1hFWQ0wLpi02+s0NvWzrY1RaaUjKEOW5+k
	 LoJyS9krCEWiw==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Wed, 17 Sep 2025 03:30:53 +0300 (MSK)
Received: from db126-1-abramov-14-d-mosos.mti-lab.com (172.25.20.118) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 17 Sep 2025 03:30:52 +0300
From: Ivan Abramov <i.abramov@mt-integration.ru>
To: Andy Shevchenko <andy@kernel.org>
CC: Ivan Abramov <i.abramov@mt-integration.ru>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Colin Ian King <colin.i.king@gmail.com>, Alan
 Cox <alan@linux.intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH 1/1] media: atomisp: Avoid memory leaks in ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Wed, 17 Sep 2025 03:29:29 +0300
Message-ID: <20250917002933.506138-1-i.abramov@mt-integration.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mmail-p-exch02.mt.ru (81.200.124.62) To
 mmail-p-exch01.mt.ru (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: i.abramov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 66 0.3.66 fc5dda3b6b70d34b3701db39319eece2aeb510fb, {rep_avail}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, mt-integration.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;81.200.124.61:7.1.2;ksmg01.maxima.ru:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 196326 [Sep 16 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/09/16 21:49:00 #27824829
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

If any of the memory allocations for descr struct members fail, goto ERR is
executed, and none of the previously allocated memory is freed, which leads
to leaking memory.

Fix this by freeing memory at the end of the function in case of an
non-NULL err.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..d50bc81a59dc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5907,6 +5907,10 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "ia_css_pipe_create_cas_scaler_desc() leave, err=%d\n",
 			    err);
+
+        if (err)
+                ia_css_pipe_destroy_cas_scaler_desc(descr);
+
 	return err;
 }
 
-- 
2.39.5


