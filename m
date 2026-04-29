Return-Path: <linux-media+bounces-60000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGa6L9NE8mlnpQEAu9opvQ
	(envelope-from <linux-media+bounces-60000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:50:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 166294984BE
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365BC3019906
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F0738B7D5;
	Wed, 29 Apr 2026 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO6R96hD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D587349B15
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485000; cv=none; b=JyMgEYeBV2ZGLWD1M9Hb6f9P9Zhfxwk2dGnjp9Bjyw+nTsyyMTRru3qvD/BE3KeoQIo4t0/6KN3ZdPSUFOI+AQwuFnd7wlAgMZ6eevb9VvERzK9W5su4+TZxnxOVz04VVLBbG0YPIab+GzLa/XdIQH4sOV1Zk+u6DXVmyg9qa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485000; c=relaxed/simple;
	bh=GXDy2EPWSVIeOj61/oWjBf0bAkD5nNMFZ37O68A7Nfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ACBbB1DHfpcrD7ERYYrtY/777TeAGSfQKSGSalHdNC+hwGLuLtNEGXuvL4EDhVpvYcVDiqV8dZtXFi8NdB+TOrZ877NCTjQdVaMJ2/g7eguJgdzjbrOZwtM1V9zYKjAb0eTyGb+rcwcZVMvkTYI4adOKmWNRJKPn3ul2yanAtSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TO6R96hD; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a5800772f3so688596d6.2
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777484998; x=1778089798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=TO6R96hDLL61cYPXiU/OaCJUaNDoKNAZVOuTyoxogIFaa9ae7pslzMMH1kH+yykJxf
         1YqnRDZseAZb3BRemzgOF7V+a7O0awAJpjWaIWvYQWCUKEv19tdJbSBxCqie8elqJhCW
         GCnVQ9kTaudvjzIGF3lPGFVYPgWu/dz6ivfo4huSFsyPoBiFBWlnE3O5Hkd8RSKiagpF
         Uj7HiAaLQuCEfmKQJjl2oZEPYpTexaTr1WQF/KZFOzUBF/FM0CrtJ7UZYGe4oiifHKGI
         UcYI/F2f9YNMvUI+NInGYUhusdbixwwRHHNr8n+eJNrR2slmlKHR6cbHyR6s14l+Kn+H
         hWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484998; x=1778089798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=ppA3Hm9zu4/C1vTFi4tZDfie7+bEPC0emWiVsElApPvSLqBtytr6t4/dDcWbNvw+BW
         NMVDaPVbgOuP9D/CODNT5Fnq35BMDt8njN8qxvCQQpxorF9GggMcV9EhZYXtXH/iKM+9
         IypVxTq4gg6DRauySHsp0Kt2yGxKx8lmV/LLkPbPxMEOimC6off1vsRthSPlexWOJiyf
         7iIOSvIXltAIHZLtehBaA7YyLK58Lp2ko6N/Bk0skdbILjjqsiMhnd2ZJq+fYL2bIB9Z
         jIlhsu7CyWBDL0DxW6AhF/3VRwv/ZhpG3zF2RaIb5KVOgeI97cz3UADRUgkUzergw9Ui
         FCJw==
X-Forwarded-Encrypted: i=1; AFNElJ967U1AzOllBWB4ktmX7v6a3ZJAIdd1P3QsOhvyUJGzTcP/IjEUdj0XRUrU9p9HdaMW1yvsaMo8/yAqKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgfVyk4Iog5PAjxu4lnSBZSFed7xcUd/UwhpM0NigegOfUefz
	ECBB5BklsykSHyQYhzfEfzyA8no3Mf+r1C1Neo6X5+2S+iVUCSx0o6gBLCylAPLd6KU=
X-Gm-Gg: AeBDievczn2iB88F0H7G+LuU8OwvAmGXPRCNNRiqmB48aWAtvWJmvEiBHz9X7s55YMR
	Ie1r9dZRn6IAjSOy3hi198RXgTDZp7ePJVX0/AuCdYigkv3Z+/XH6cWjr2L6ks3hShypKBMOwnD
	Z+al1zI/o4k6qA8YPA9eIWLxd8OMr5yzsRME9qZrmfdc6FicKJF79hQ3AYLnFXQCPl2Jp/RWwSD
	adHSj8E2JaaM9rAIVJwe6XX6rT9WIvroqLaHfparH6moANjYFxa429htG8nFtsxYOQzryG9cYG6
	zx7o4+f42YEPRX6/MFxmbifhjsDfwW6oyQkCmai75hXG2vpZJNRTqx8fzgu4Urid4uGjr/lOGlT
	kRGBolCytoVvTJ3UJtXR9DHscyFmSkdG/Ur8Kb8o5I053iTc+2HVCGk9QBDMWJ5ETER/BlOzy1c
	O9iKbJqPdnxUK01bi6jw7x801HMQBcvG2A5TcuaFzswqhDV2cgg5XnRncMb5UmaN8vlCSm
X-Received: by 2002:a05:6214:5e0a:b0:8ae:6460:c550 with SMTP id 6a1803df08f44-8b3eddd9217mr74858746d6.36.1777484998234;
        Wed, 29 Apr 2026 10:49:58 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef81f156sm24021166d6.37.2026.04.29.10.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:49:57 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: sh_css_mmu: fix typo in sh_css_mmu.c
Date: Wed, 29 Apr 2026 13:48:52 -0400
Message-Id: <20260429174852.6059-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 166294984BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60000-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix spelling mistake: Suppres -> Suppress

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6e52..f2838e40617a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -25,7 +25,7 @@ ia_css_mmu_invalidate_cache(void)
 	if (sh_css_sp_is_running()) {
 		HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;
 
-		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppres warnings in CRUN */
+		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppress warnings in CRUN */
 
 		sp_dmem_store_uint32(SP0_ID,
 				     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
-- 
2.34.1


