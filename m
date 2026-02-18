Return-Path: <linux-media+bounces-53056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDaEC6/zlWlTWwIAu9opvQ
	(envelope-from <linux-media+bounces-53056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:15:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B34141582B0
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39481300A8E9
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 17:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6BF345CA2;
	Wed, 18 Feb 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avf7wLd1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nlG9gDqa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9623451A9
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434903; cv=none; b=AEjU925ybGHHooLgzu1bRUSahzJ6h9pbFVEO+mZUVvMNODNhbqUKugYFoCLqo2qSXSQ14+zV9Kdfj/FVruequtAGj2aPL8ERVz8GMBrvE8YWvKjQgVq7/Mk7uwIXx78+qqfW0M+GFRcYraS2LpOdSeSBirtMazF8jYNV7d5VFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434903; c=relaxed/simple;
	bh=q2phHLlodPo3v5sf59GdN9ehFzXr/Zvq+imzW04dHco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+balTbjA2cxPIcdS73sIkuj6d2/rWwPIhyXTHp/+V4Ag0ZE+PcNEbeX087qJpN8x/GTzFnyIyfD78LQW39YD3fQvOHSk+S9VKty03HLE5l+EqDH4mW5EkojwzTMMtQXERx3PbLuqXhjPar6hg1RyVAVZJBvT0FPIc9mRXDST3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avf7wLd1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nlG9gDqa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771434901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VXUqFvDgr/GgZzXRZIRhwXqtA/ygCg24XF2XyoDsQa8=;
	b=avf7wLd12v+orlKzEG9kpaNixDaX0SD0XOpY39OvVRaC2G4ElReFEGS7QVoHCXpKg40QJx
	cBN/XBrr6tYHcj/GxmRyuxNIIlIle8TxFpyIucQs35zNhpUlEb9GVZMETmwXtlu9ZCW3gi
	KYkDibxtfdNol2Cn/P1TBjwo0rqbhGI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-FDIOpZJvMZajoPbUrlEtdg-1; Wed, 18 Feb 2026 12:15:00 -0500
X-MC-Unique: FDIOpZJvMZajoPbUrlEtdg-1
X-Mimecast-MFC-AGG-ID: FDIOpZJvMZajoPbUrlEtdg_1771434900
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so10836685a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 09:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771434900; x=1772039700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXUqFvDgr/GgZzXRZIRhwXqtA/ygCg24XF2XyoDsQa8=;
        b=nlG9gDqaMPF8P6SAEeUs6klBW1edQIEKhIYVKA0Xq90PRiA7HuMDzjqn7t4UFv1J/O
         ZzDknFH7LcelmgE9Xyi8HTEVZJfOpnPyOErX8YM422+L24ypwW0PzFWbipvzzCnXPGfT
         B+rMtxeWV45vzNLSim1D/Ttdy/sWGb4ojxdqNvW2JX6JI9AHR8kr18d7QrDK0dfOs1+L
         KBuCQLE7cfTH9NANpu/jJkRDRrTpdZvriCK8yHAMaB1P/CX109IUwsrp49rvhAXugLL8
         3+UDWyGLgLo7fVKIL84Z2VjKacGQCi91M8CiNzfDJqtZ7KWX70fM0Ru/d4p3a+wbJJP3
         nHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434900; x=1772039700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VXUqFvDgr/GgZzXRZIRhwXqtA/ygCg24XF2XyoDsQa8=;
        b=EsChoqX9mLOrBWz/TbeSa3/q8PR1i+gS/1zxRthbh6xhEq7LQy6VFcKTNB4QZnWegf
         fsgVcJlq99yxJHz3vFJHiIaYrca3cAI71g4I7DjzHociMvJmpZP6miHJDgwZGKAmzXt6
         n2UuR9ARL41NZ4N+CzHrF1ZQ0TDacoUWmj+P9vdiuMaKM0azUcXklmfJmF/sy0UePqxM
         XsITx2mt9oAfZp1OphVCAQ/NjL3DjVHWyb8VWS4+ZbaENZw7oqtYpLVyb5pOxNVR0DNW
         UfZW4/tWG0P5Ooy/4tetxBphrWNILBnAS9j1CqwBGnEy/nBDNHaGG0j4iGB0XrfkjM4A
         rUPg==
X-Gm-Message-State: AOJu0YyVRaNPJen5S+ykVcg5Cv9AsRItyfF9c9VzaZhB3jde30US8mjK
	vweLk7EYCI3jhVlbpT7Dr4FCpnhPBW9A9L5lo2NpjjQX5CeQea6Px06fxHtDa3p4hFkkJ5PzYan
	W9fukJwAunRGL4LKdAsC4wTPHy5ES5axL9UfB2Uchs9pptZlMNP4wM01IFseH6rzR
X-Gm-Gg: AZuq6aImpk0DVyFCp2NGDiOWi0sdEzsJyxyKP+/RwqX+AeLqs3/sFtTlauFTObQTNIz
	M0mRx96sHL4XkJcSlS7g+pfAUVJgVfv6amo+ho8oMGOUBZdojjmclGWb2kSUZtiwIiHbZyTzFyi
	8NkvZ2AmyLKlIhVcX91Mv0DGccBemWj39hrwDWho6N+w0tnQqsUX8OKbIfeN+bRS55YqH3R1IjA
	MVWjzHGcYW7dIeZkQlMONAixU/3UjCoePE5Q6BxXzAIALj9YPWLTv3s37MJ87A4v6K9ZQpru0C7
	FU2RZd4DLtdC/eKm63fUlWRzKnLIKCKUdbthMDkRdx/3EWOzhiEskmiXEPm8BjjmCIsr4/jL77z
	DWWzUS0DDIZoge3z8qe7iXFiGr3HSEJ8b6vu4p3G03npQVtdR06FE4QfrOC/AiP0=
X-Received: by 2002:a05:620a:7081:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cb408629c4mr2086848785a.34.1771434899737;
        Wed, 18 Feb 2026 09:14:59 -0800 (PST)
X-Received: by 2002:a05:620a:7081:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cb408629c4mr2086841985a.34.1771434899177;
        Wed, 18 Feb 2026 09:14:59 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89949b3d543sm57039066d6.16.2026.02.18.09.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:14:58 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Wed, 18 Feb 2026 12:14:10 -0500
Subject: [PATCH v2 1/3] cma: Register dmem region for each cma region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-1-b249886fb7b2@redhat.com>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53056-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B34141582B0
X-Rspamd-Action: no action

From: Maxime Ripard <mripard@kernel.org>

Now that the dmem cgroup has been merged, we need to create memory
regions for each allocator devices might allocate DMA memory from.

Since CMA is one of these allocators, we need to create such a region.
CMA can deal with multiple regions though, so we'll need to create a
dmem region per CMA region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 mm/cma.c | 13 ++++++++++++-
 mm/cma.h |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index 813e6dc7b0954864c9ef8cf7adc6a2293241de47..78016647d512868cd87bc2c1a52dd2295acaaf01 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -25,6 +25,7 @@
 #include <linux/string_choices.h>
 #include <linux/log2.h>
 #include <linux/cma.h>
+#include <linux/cgroup_dmem.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
@@ -142,6 +143,15 @@ static void __init cma_activate_area(struct cma *cma)
 	int allocrange, r;
 	struct cma_memrange *cmr;
 	unsigned long bitmap_count, count;
+	struct dmem_cgroup_region *region;
+
+	region = dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", cma->name);
+	if (IS_ERR(region))
+		goto out;
+
+#ifdef CONFIG_CGROUP_DMEM
+	cma->dmem_cgrp_region = region;
+#endif
 
 	for (allocrange = 0; allocrange < cma->nranges; allocrange++) {
 		cmr = &cma->ranges[allocrange];
@@ -183,7 +193,8 @@ static void __init cma_activate_area(struct cma *cma)
 cleanup:
 	for (r = 0; r < allocrange; r++)
 		bitmap_free(cma->ranges[r].bitmap);
-
+	dmem_cgroup_unregister_region(region);
+out:
 	/* Expose all pages to the buddy, they are useless for CMA. */
 	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
 		for (r = 0; r < allocrange; r++) {
diff --git a/mm/cma.h b/mm/cma.h
index c70180c36559c295d837725e26596cf546cd8b7e..e91bedcb17be8c9e0d31aea1b67c0db36315536d 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -62,6 +62,9 @@ struct cma {
 	unsigned long flags;
 	/* NUMA node (NUMA_NO_NODE if unspecified) */
 	int nid;
+#ifdef CONFIG_CGROUP_DMEM
+	struct dmem_cgroup_region *dmem_cgrp_region;
+#endif
 };
 
 enum cma_flags {

-- 
2.52.0


