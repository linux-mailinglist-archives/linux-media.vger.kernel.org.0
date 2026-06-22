Return-Path: <linux-media+bounces-65402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9qQIDNeFOWoGuwcAu9opvQ
	(envelope-from <linux-media+bounces-65402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:58:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAE86B1F13
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:58:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P1oOazBc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65402-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65402-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99EA530F4F8A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4FB346FA7;
	Mon, 22 Jun 2026 18:50:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57606284B29
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:50:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154207; cv=none; b=uCleG/reRgkOVQmAsaFOzEZGhms2TsjFH/Nve79n1ZWpEyTAJLdQhVx748/6BAU8A77CqNcu1MwmF9DaEZgHzgDVknWPDFip5HwUhCOLlwJg4UKOrbsViLYZ9OKwITVurbQqrjtSmXhLMyy6Rn+nfcX4CLLKtlQh6tE/R60cS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154207; c=relaxed/simple;
	bh=lIQoyavRw2mxaKwIDMaLeH7SaMPO3OupKDMUZPF9wjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LH0cm+yTQeU6eoAgxpSuPhfEv2FnHn9tFO3j3wU5M+3S4FYfM+slfg8GbrN6yg0hLapSZEH7a/74GuS9VrBduKHFm+KRsQQUu+yVbQAWHaEFSNzBt5xWIfISdc3JhtGLJxJfv4Jbzn8YRGQQTD6hMGdsFJxr8YF6Wo8ELzcr8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1oOazBc; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so30293555e9.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154205; x=1782759005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqrzsHUr/eg1YVIWDSZ7dTiuZ9JQpM3TQd+R0iB1BOg=;
        b=P1oOazBceHTddVATqcHXhnsP6smAACYVhAr2/9ALkjW6AvoFCwodWuiwP/7yarONXF
         S7oLsemuNfD6pZqB32NLZ8LRK3yN3N2+8PLfrfXK1icqgxEuw5R4lYC0Jf4lhCBG8vEc
         7uKWTRLsqSGqUUsYip/2p9OHD2yM3CQIDR48Ktq+yVuF+UC8PLe3utD+z6QZvtWIng69
         27hMeDEMH7zYCj1ndxij2vZKvvgjhHYe3apmobBQaHaWK/iOqkegqyZ2XokRwAEgpt26
         NMgL1WM9mJx7f3Xt+yXF95HDp9F/Jd42g8Ec6gVjSjrypBfT3wsleKY2Ayz6w1ibbiFe
         j42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154205; x=1782759005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqrzsHUr/eg1YVIWDSZ7dTiuZ9JQpM3TQd+R0iB1BOg=;
        b=V0IGNQyv5lAbF0/msx6ZdMGJ+CtcviYqM1uIIqlUQT5C6sczU1UlRpN9qHyX0pBguE
         RkXm3z+Sva5GA2Ez+S1/jXQXcIgAxn1pdlZYl+cC4I1VSd+ltB0lBa0IeDisdB7gfuTQ
         WCh3uMt7bz32N6VN5jJBpfp8sO38Akikp2Lnq1PHkAml391rUNwaG0toz+g0CTREa8ZI
         w9YwyT0TnedtRJn+aWVKFs1Va0J/ZwYkjSgSUunKbJgbbjLfdXU8H8/x4c4yhkuIWO7K
         VBJoW0RrqDcQHxt/QbEXNiaxSAmr5UFTWX8V9eiiQ9Hus60bjMSAZor0YUMpUOn0TYmp
         Awgw==
X-Forwarded-Encrypted: i=1; AFNElJ8HT8PjefDYdpC2W1ziaV5kkml12cbumERyhwXi32Eh/nN6fPOLUVfAP04BbX+wypjsrbXdLqtDChjAJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8l7hKqd5KQgNC676b0ZbvcIRl9fG1aROPcZmZgg87DlUS4Bp
	sGIt+y4OX0ylkUE9+0EQ+qj5Pb8oRxdyEXM8eHHCr7Pl/UxD6EQZQjro
X-Gm-Gg: AfdE7cmwpftIo7M6nywfM5XExm5bcn86K0xsoWOl10VdBj5RGYBa7qpmpMvOMBgrloP
	Vlmn9WtSwsVsTs/ziEGqJE1/XTYG1KbB5jshu7c717vzHqOLLmQ7hVZfbWNGD8LBjynHu4Q0Yfl
	yHlGDGBg6bOXitj52BcphD4guNec4nr6k40zwMZYrXo0s7BUBfWuNUX4xZb1pAC2qYl87caOgnG
	SrtudZRJb6XXJBimmDnqs9raLmtN5j6EQoL0V2at2t7B9m6T0OzUZ1ylZNPNqRomcaW7cJTF2eR
	Du1ZH8FXajifsyb8jLA+G9ojF172BqFCrVJyta+ObI6yIUQc86Uo0UtGHRGjZaMTt4WUjbdnLiM
	nfthfjHYZhKOuKBl9+YbSF4TGnjNCBhIPE2v9At+shyU4CHAjJJoJG3VaHKWs08Ve6+/6xbF98E
	dLx1SVYly6yBIH+qma0EQ5cmmqg0EECb7L48YeK/B2NJLiPDtkm44qblI=
X-Received: by 2002:a05:600c:5285:b0:492:4640:cf59 with SMTP id 5b1f17b1804b1-4924640cf67mr232352695e9.36.1782154204532;
        Mon, 22 Jun 2026 11:50:04 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788282sm40882832f8f.17.2026.06.22.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:50:04 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation to use tabs instead of spaces
Date: Mon, 22 Jun 2026 21:49:59 +0300
Message-ID: <20260622184959.1668-1-batuadatutkun@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65402-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:gregkh@linuxfoundation.org,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:batuadatutkun@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[batuadatutkun@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[batuadatutkun@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DAE86B1F13

Function parameters in ia_css_cnr.host.c and sp.c were indented
with spaces instead of tabs, violating the kernel coding style.
Replace leading spaces with tabs.

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 .../staging/media/atomisp/pci/hive_isp_css_common/host/sp.c   | 4 ++--
 .../atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
index 0fb8a6754..35a7fd270 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
@@ -13,8 +13,8 @@
 #include "assert_support.h"
 
 void cnd_sp_irq_enable(
-    const sp_ID_t		ID,
-    const bool		cnd)
+	const sp_ID_t		ID,
+	const bool		cnd)
 {
 	if (cnd) {
 		sp_ctrl_setbit(ID, SP_IRQ_READY_REG, SP_IRQ_READY_BIT);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
index 54789d28a..469213a06 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
@@ -13,8 +13,8 @@
 /* keep the interface here, it is not enabled yet because host doesn't know the size of individual state */
 void
 ia_css_init_cnr_state(
-    void/*struct sh_css_isp_cnr_vmem_state*/ * state,
-    size_t size)
+	void/*struct sh_css_isp_cnr_vmem_state*/ * state,
+	size_t size)
 {
 	memset(state, 0, size);
 }
-- 
2.53.0


