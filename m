Return-Path: <linux-media+bounces-57753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF69BwWdy2loJgYAu9opvQ
	(envelope-from <linux-media+bounces-57753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:08:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F0367992
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10016311F270
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679043A6B7A;
	Tue, 31 Mar 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoUjbDYI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73323A5E91;
	Tue, 31 Mar 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951230; cv=none; b=FWyJJnhhxAUkMXuVWPIxYCwj+cQk9tDQk72TxTxpruXzHU2f5K+L5mAJHkHJSMs65qcDm5eW8xguMRrFwkw9srcLVuARPva07ZCznD9owBowTp1qDlTu+m+lwt1Y7Pki1YBKjL8UDrcUT3ypC35CSxBlTFjLwt0LKCYHxNLote0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951230; c=relaxed/simple;
	bh=FW0dQAbf77gP2JI3DUHh/5HKOkFfWCP2QQfOOyILTUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yy0BGTO9+9HzL7qAnYDhVXtrblayP3pUuG4NufkiQJMpE9iygTNjF3dSbXMIevhqfi7hTDyjmsLQr+OLUFYqBoN1zotrwQF1U1aQQ3TqKBEHd/Ci0pFStwzSg6LcjDZ04U6FR4naK2kDG3L0bpjMoVxGPhUlUQAro2YilmWoZTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoUjbDYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBE4C2BCB3;
	Tue, 31 Mar 2026 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774951230;
	bh=FW0dQAbf77gP2JI3DUHh/5HKOkFfWCP2QQfOOyILTUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OoUjbDYIQaQ3VSdGFwz8NRODvH9y/n3Kkmc5lP4aaipNKjSHtzPw5pFG8oZBl2/gI
	 5mK06fcq0AcR6L/LGS4bToqUCyKZUejqaLW7JzoKZlbCefXVWzV45V9IpFIlfqucWl
	 6nsG2TRceTEHqy6fbfjhcfWv90GPOEt027/3adzAiymJ6u8qygO+SCe2Xpzv4OtN77
	 QRFrJ/2Ex/myw6Zu3odAvIdWHW4MEE/uPKHyHmWn1IFAStzHxyVvrvqN7PoNpIGwgY
	 OnEKmBZU/HrGi4Vpb1ux4jkASJ8SYex354JGDwvITT1XtE85z3C8XOXtu6fwXR8FEn
	 AAHytpNI+yrjQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Mar 2026 12:00:12 +0200
Subject: [PATCH v4 3/8] dma: contiguous: Make dma_contiguous_default_area
 static
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dma-buf-heaps-as-modules-v4-3-e18fda504419@kernel.org>
References: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
In-Reply-To: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FW0dQAbf77gP2JI3DUHh/5HKOkFfWCP2QQfOOyILTUY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmnZ+s/e/ZI4PqR9yY/Xv2e9P7GTx+Hqt23ZZsm/t3/8
 m7MtzMvkzqmsjAIczLIiimyPJEJO728fXGVg/3KHzBzWJlAhjBwcQrARK5xMtb7e4p+fx8c3r9n
 ecNvh6Ritgs5Ik+WW3MbPvTVv72DR1/owof492YHrXdNEOpep3SVlYOxTl/UReeju8LsBc7JSjd
 Vp3o+v/dEV6GB+ckzZz7BWqd/l3UkL1xIyn4UvvJHes76jRlKAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57753-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 957F0367992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that dev_get_cma_area() is no longer inline, we don't have any user
of dma_contiguous_default_area() outside of contiguous.c so we can make
it static.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-map-ops.h | 2 --
 kernel/dma/contiguous.c     | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8604106c0c01b6a9dadc45263f3b1d9ecfacd4aa..bef279ebeae7de59dd504e631f47c64d7e223736 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -89,12 +89,10 @@ static inline void set_dma_ops(struct device *dev,
 {
 }
 #endif /* CONFIG_ARCH_HAS_DMA_OPS */
 
 #ifdef CONFIG_DMA_CMA
-extern struct cma *dma_contiguous_default_area;
-
 struct cma *dev_get_cma_area(struct device *dev);
 struct cma *dma_contiguous_get_area_by_idx(unsigned int idx);
 
 void dma_contiguous_reserve(phys_addr_t addr_limit);
 int __init dma_contiguous_reserve_area(phys_addr_t size, phys_addr_t base,
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 40a0ead24979cfdf25e4779545536a5438e26356..fd8d3518a2323f0a631fb185ef92a24c35f8d25d 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -81,11 +81,11 @@ struct cma *dma_contiguous_get_area_by_idx(unsigned int idx)
 
 	return dma_contiguous_areas[idx];
 }
 EXPORT_SYMBOL_GPL(dma_contiguous_get_area_by_idx);
 
-struct cma *dma_contiguous_default_area;
+static struct cma *dma_contiguous_default_area;
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
  * This is useful mainly for distro maintainers to create a kernel
  * that works correctly for most supported systems.

-- 
2.53.0


