Return-Path: <linux-media+bounces-60427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAycHRb6+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:09:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E408F4CF18A
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9084430B9C7D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BB247ECDF;
	Tue,  5 May 2026 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cf7NCzLW"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F8C19A288;
	Tue,  5 May 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989944; cv=none; b=GfKrDSVuL7ttnCmYvpyPBhnzUJKYfd9oWEAJdzjp15n8Z+tkrgBcQI8E+9qD3sVDUEpZvFZtVlm9wwi6gudNoxEFj5F5Z4PGuCLDvLdRqB3Fo84WN+b/ZHHNS9XRtCzwzL8cFqV9DonjDnly6X/lBgiLOmriHEQ/NTnu9c337X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989944; c=relaxed/simple;
	bh=Lmg4UHVoceq5MLqHuT0Zw4zFdgj23nCiSgwMP/Dr5Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5XNQ6vrUltJE7V3hC/A6UpzR2mSuSz97c+t+M4h7AI3PUbuWCASMLAJyWUPciYSEsrdbbO1BOMl8YwbFW/+iPa/tQBdZbkgKpW1lCHdDCe4r1n/RD4y3D+Brlw9QgjHUWTav98FC8qXGx/31bbqQP7a0G4BcKk3D34/pqPNv+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cf7NCzLW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB582681;
	Tue,  5 May 2026 07:05:36 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEEC63F763;
	Tue,  5 May 2026 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989941; bh=Lmg4UHVoceq5MLqHuT0Zw4zFdgj23nCiSgwMP/Dr5Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cf7NCzLWa2JQFYrlx4a14dPfmo+PNOr9sAOCyiFWWizwWQYFN9afN9Vy2akEh41w4
	 9Ikx7gWRRtHmxmzEnc8LlioyXtZsAw9p7gnYqp5TZFZw5+/qLMlpCdQ5Xrq4bEiEZA
	 twar6aISCUE5yhhR5v2NLdJo/Hldo+NllxndJ3N8=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 3/8] drm/panthor: De-duplicate FW memory section sync
Date: Tue,  5 May 2026 16:05:09 +0200
Message-ID: <20260505140516.1372388-4-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505140516.1372388-1-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E408F4CF18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60427-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ketil.johnsen@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

Handle the sync to device of FW memory sections inside
panthor_fw_init_section_mem() so that the callers do not have to.

This small improvement is also critical for protected FW sections,
so we avoid issuing memory transactions to protected memory from
CPU running in normal mode.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index be0da5b1f3abf..0d07a133dc3af 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -446,6 +446,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
 					struct panthor_fw_section *section)
 {
 	bool was_mapped = !!section->mem->kmap;
+	struct sg_table *sgt;
 	int ret;
 
 	if (!section->data.size &&
@@ -464,6 +465,11 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
 
 	if (!was_mapped)
 		panthor_kernel_bo_vunmap(section->mem);
+
+	/* An sgt should have been requested when the kernel BO was GPU-mapped. */
+	sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
+	if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
+		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
 }
 
 /**
@@ -626,7 +632,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 	section_size = hdr.va.end - hdr.va.start;
 	if (section_size) {
 		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
-		struct panthor_gem_object *bo;
 		u32 vm_map_flags = 0;
 		u64 va = hdr.va.start;
 
@@ -663,14 +668,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		}
 
 		panthor_fw_init_section_mem(ptdev, section);
-
-		bo = to_panthor_bo(section->mem->obj);
-
-		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
-		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
-			return -EINVAL;
-
-		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
 	}
 
 	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
@@ -724,17 +721,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
 	struct panthor_fw_section *section;
 
 	list_for_each_entry(section, &ptdev->fw->sections, node) {
-		struct sg_table *sgt;
-
 		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
 			continue;
 
 		panthor_fw_init_section_mem(ptdev, section);
-
-		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
-		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
-		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
-			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
 	}
 }
 
-- 
2.43.0


