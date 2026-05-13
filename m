Return-Path: <linux-media+bounces-61479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL1pJuStBGoSNAIAu9opvQ
	(envelope-from <linux-media+bounces-61479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:59:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB8537915
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23949300898E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B8A4DA559;
	Wed, 13 May 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Dxb+IAhb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA864DA545;
	Wed, 13 May 2026 16:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691545; cv=none; b=QnCE3gmVoxJSVSRcSiAcTPUa9AP51SW2MGLAAEMiTcqpoZGpJ2UIZ42MDvLaIZ4VvfTEE8jZkBSYfE0bmpTIqmPTYLjcgXWAE1nVxKGRDsYctxFFkgTTZpeEY12ehvbsZco4buDO/ney6wfgeSt+eyTlIYx9zAe6D7Rd4u43S40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691545; c=relaxed/simple;
	bh=0OQwKbihhL4l6Gg92F+5W95NMeySKGXxSegqXoUTufA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AM7SoMXGR8MZlVqSQMCwERLJt5S9g9VUdt/Mqupkx1j4KImPMRTW31xvscIsykOrWjob+yLRyoPS+XVNJ1Ph46w4wRvvc7Xp9g63nq6u/CBqlSdfGRj/sgxZJgdcg95pQ1GGUNw0hIgvTJXJcWk3IHl3+Eps2qvXFRdgB4CzaUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Dxb+IAhb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778691541;
	bh=0OQwKbihhL4l6Gg92F+5W95NMeySKGXxSegqXoUTufA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dxb+IAhbRGLXHKb4n8nGIjtrDyltHEIvjekTkPRW86Z2GKA6RUaJE3QQw2AwE/sQi
	 3uZO7efstdUfSccotCcO0DfZ90V6iOZydjg+LtYNWSNqtMIUrxf1dw1WYBshQZq5Px
	 8WJUNaVyBBOQhbKl5RUF+zXbARJddyhSD2QaPvwG+LeKuPrHm8HKnWwKrknPI0GWUq
	 cHFZG71xu8OM6aS/XvEcoUPjthwj7mYtsDYI2ekYrJ9TR8/9cYUony3b/gV1f5/FAw
	 sj5RRjH/6c3nYQb9JEw4D5+FLYZqOs0TqRecReGVNvVpc6fO6KAoAJhoWjRxZtyPKs
	 UcEh0Iz3Vx6iA==
Received: from [192.168.1.38] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5E4A17E156E;
	Wed, 13 May 2026 18:59:00 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 13 May 2026 18:58:50 +0200
Subject: [PATCH 2/6] dma-resv: Define guards for context-less dma_resv
 locks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778691539; l=1220;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=0OQwKbihhL4l6Gg92F+5W95NMeySKGXxSegqXoUTufA=;
 b=xilM6lR+4IMUjFkcXTn/tPBSzFs1xaXCDrF+j1zMUf4DsDX6g+1XB2TSR14o+EYGkRBtR2yLZ
 sjpVbTeL/v2DMevUfB8qax4xB2AJGbFboAA/mLo/VyBwtQssRUIMkDe
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 35CB8537915
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61479-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

When used without a context, dma_resv are no different from regular
locks. Define guards so we can use the guard-syntactic sugars for
explicit/implicit scoped locks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/linux/dma-resv.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5ab6fd9ebe8..e559b1811ca3 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -40,6 +40,7 @@
 #define _LINUX_RESERVATION_H
 
 #include <linux/ww_mutex.h>
+#include <linux/cleanup.h>
 #include <linux/dma-fence.h>
 #include <linux/slab.h>
 #include <linux/seqlock.h>
@@ -484,4 +485,8 @@ void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
 bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
 
+DEFINE_GUARD(dma_resv, struct dma_resv *, dma_resv_lock(_T, NULL), dma_resv_unlock(_T));
+DEFINE_GUARD_COND(dma_resv, _intr, dma_resv_lock_interruptible(_T, NULL), !_RET);
+DEFINE_GUARD_COND(dma_resv, _try, dma_resv_trylock(_T));
+
 #endif /* _LINUX_RESERVATION_H */

-- 
2.54.0


