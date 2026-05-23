Return-Path: <linux-media+bounces-62670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLszNlWNEWrHnQYAu9opvQ
	(envelope-from <linux-media+bounces-62670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 13:19:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 621AB5BEAF8
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 13:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74AC3302A074
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 11:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD7D38945C;
	Sat, 23 May 2026 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1A4VhK3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAE1344DB1
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779534956; cv=none; b=XCPkQwPEM3v3TGgR2PejdLT/Mub1z4iFPU1GuOarHvxH5rzrcuQdwn8dAUeF8/EWYdt5w9mQaGEdpK8lLK973TR/GlxFgM4FoaPVjpIED7Qj1obA8uwYUAfVlb5wc6Br2ZIYXC4IArZpfoBIiEg9ZKXJ1VIjx0mHTc2gbxiEzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779534956; c=relaxed/simple;
	bh=3M9ITOOfKizUcZDviJIXMUOFBBOxO2x05gJvobaCncA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saGpBEUwkB0pHM+Y6EHQHdLHDGunMM3sOe9D3zl2bP2HZg07IYUu4RpUwgk0e3YLul5cgujnO6CmhdHuZQD8vnnAqUfI651cRBIKn4t5v3V+V0qcY12mzHBgOcODc6NNSsLHWwNyAX7vHTaTKiaD8qVVVyih3F9hHaSBj1ttayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1A4VhK3; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-79a535e7c00so83235297b3.3
        for <linux-media@vger.kernel.org>; Sat, 23 May 2026 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779534953; x=1780139753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IO4ACdWIMGeQQmW6pB7nrumG5uOpk88q4f2nui1XeM=;
        b=F1A4VhK3ZJC3+0/eDsDbsh7xxrjQMx+pBmG9Dzq+S1lfzBkHAEYriOlZmnDvJc1uo2
         2cXNvKd952/Eq07c0g6boY9ah1ZZVOv6KoeWXRTbwyYe5k9V56EZjCWsQwQzroCdm26V
         ASoo7abOQ+YYy642HIfQm8kpDea1D+bocTPg4YUMlJ1Bz0umY1uOPVp7SJ71KB1AKciD
         OcsH/tbehJgGLn8TgrKHp3E0aWxIVUodKIawrCEgvBy1fsH3anRHCJDaynqDC/yUIIvm
         WAY/v3H4NFzmHtH2MH78ID0o0i3m+ryf8WbmGBognexLexgZDj7Kc+XeiIYfzgOGCeIN
         4KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779534953; x=1780139753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IO4ACdWIMGeQQmW6pB7nrumG5uOpk88q4f2nui1XeM=;
        b=NXLlCqwQiXDlWQfjImh0S4FsYkxb716OsXqx0LKY+pv7lQqwLJIcernw+GbGTqf8Ey
         c62fgTDjP/RM91gjd/tFvU+cHf2iRLHrtJnR8HWw+evW4A7mOGdT1Vm22FRwAJzXdCPD
         PcKlbc9jxgoMHV0NmqASFVnQXXUE5RZPbK3pEuRB9JhwJI7fS0lLFBJapPFJzxGKiAS6
         5yN4T2aUhqLujHQwlGoyXra6ky/MDPMvM6S+2ictRnyUDUTKvlO42iYTl8cq5x57mYgB
         ZIwXSVaxktm3esEYrztdXwqfxFdtZ8ZxMb8INu9PC+WtlJ/OBO2HfXaXuis5OZL3YwQS
         O1qQ==
X-Forwarded-Encrypted: i=1; AFNElJ85jmO5JYHKLvIlAfitWNytPKLKTi5rw90QnJ+aOnCYh69wfAlS5Lmk9mEyE22VaLYnybTq+eqRDNe/Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2gXaBtklNzdG+zGuBaIC/ppfUtNheH4ceCOiIuiXqXYZZpE3H
	l/neDOiz3SyuFwQIEEM5SPDq5j+cBXymjpKHNIBOFsama9UyohAJ+zlAnYFngti7NtE=
X-Gm-Gg: Acq92OHup2IyqLD620A0zj/OjkqzpcQorkxlV/83yt1dUhUua+deeGxBekHucJ0wHCB
	aPqgVNvaqpcPc8lmYscUOR7JR1aeQoHq1XLdnV9Oni1OzrqnfiTaT09KSrL5g1X07JE3tNl5Mvr
	GCPiGHUBfeXfaPZEqHtxb/k6xixmmeI41/50jEZi3KEzTvHfA9W19dozCfJuMJPq7FV9Ref52nu
	gDqScizp60GaJ51JwrBgZi/1LoH8CnDFJ6eNjXhDSSEzA03qC5s37GUCkel4DW1ptxE8aYO1ATx
	Mna+m3wgcdyenRsGXEeBgbQqijFtgGAM4pxZEMr9F3ToNKvqJaxqdbFPNXZLpLw4ML8s0Oj9peU
	55C9kyDKd1M6djVUU/6BJS3ablq1riszmW3qDEaUiDWiMSggBP10yYVYIIQt6E9UDIdI/lQDK6G
	rlqbkm1yWmDlcq3OfvASGl1RNfS10aAkB7ti7V
X-Received: by 2002:a05:690c:45c2:b0:7bd:8cb2:4fa4 with SMTP id 00721157ae682-7d3377ad464mr86695227b3.39.1779534952804;
        Sat, 23 May 2026 04:15:52 -0700 (PDT)
Received: from localhost.localdomain ([24.151.11.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c838e71sm20152217b3.46.2026.05.23.04.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 04:15:52 -0700 (PDT)
From: Marlon Trujillo <marl0rd1080@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: fix typo in rx.c
Date: Sat, 23 May 2026 07:15:11 -0400
Message-ID: <20260523111511.865-1-marl0rd1080@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62670-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marl0rd1080@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 621AB5BEAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix spelling mistake: inptu -> input

Signed-off-by: Marlon Trujillo <marl0rd1080@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..ce7035ce8606 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -55,7 +55,7 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
  * */
 enum mipi_port_id ia_css_isys_port_to_mipi_port(enum mipi_port_id api_port)
 {
-	/* In this module the validity of the inptu variable should
+	/* In this module the validity of the input variable should
 	 * have been checked already, so we do not check for erroneous
 	 * values. */
 	enum mipi_port_id port = MIPI_PORT0_ID;
-- 
2.47.3


