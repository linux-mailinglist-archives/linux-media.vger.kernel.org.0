Return-Path: <linux-media+bounces-66242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nPx0FfU8RWpw9AoAu9opvQ
	(envelope-from <linux-media+bounces-66242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:14:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B43486EF9B2
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:14:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fykXsph2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66242-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66242-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A76C4316CA27
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AF049552B;
	Wed,  1 Jul 2026 16:09:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701C49253D;
	Wed,  1 Jul 2026 16:08:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922140; cv=none; b=Yk2ZZvkFj9/wKuEj0N8KwPO8yjJFwxWD9KzoFV5D1zoUtzaGOC00iGY0WSDR47orjmmZDvbxaoVKmAbR7lCttGouoRBysg2rGZuQuTBClfr17PaTEeTZ1mXMDsaMdlvlihfpN90NWhxIqqXxQ+iTxg032NJdx0OsJXLYDMFFC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922140; c=relaxed/simple;
	bh=j09omTc37P68T+IK8kTvPMj/Si1vY3/2/Kn3bkY9P4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGkvnjgjIGrU9Mj9GedEu4FN89kUvRB2dwRG9BOTqtCZmFNEqbG+YzHOjtjbRP8Qn7YqWFlvIfZxVcIq5aC2UnYz+XSkx2C+BVMttt3apwyNlT4utHNPBFlWsiV6spT+EghLCJVswuSPonEsoyAIbOG8g0VJYSfsJPDriuS5X1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fykXsph2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7833E1F00A3A;
	Wed,  1 Jul 2026 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782922138;
	bh=bRpiq5rufxdqwnSDjIMxZWCxMAuuCf1S5mzNKuDNLFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fykXsph26HR0LV16BHl63gEJ0vhMdbSEqVzGoHsJmWZQVoUlwTed8s0DB+jBRRtjN
	 0r91yL9YQ8CwVGxWO1wLX+UmJli6XT0rriLdpvPHUKUGmTSBpOAOjEH3CFjisWNjq/
	 FPHD5agWzrjYr83E17D+eAOfRkd5bvwT2nWvdpiwxZXUyB5WygU+Q062hwDPjIJRD/
	 rKnoVfPQfDz3ZAS/xBCESPgeP2tekI/AwSrkK+qDCAVP66wq9NdCV7HwYyJKAphVOr
	 f+jhDyaI+5bzSg3IbbaJsK9BrY9h5yY1VBqw4qi5pSqa5sAH2gNp70cj7oWK4FE658
	 +xIH3/Rjs6AFg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 01 Jul 2026 18:08:17 +0200
Subject: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
In-Reply-To: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Russell King <linux@armlinux.org.uk>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-mm@kvack.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
 linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11984; i=treding@nvidia.com;
 h=from:subject:message-id; bh=elmsBwlEoOLupzrob+8UUsUhd0IxXyTLvi03E0uXW9Q=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqRTuGUBbiw6Wo6Y1qI+pgFwoVeRSNIRE6UVsaL
 p1NEUAXwQCJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCakU7hgAKCRDdI6zXfz6z
 oYhJD/4ye32GeZJqJTg8Cj9ItkbpSyoH0sqwt4n8ueGzlU1w+JX4kdoaOgAi/EOIYyA8Xm5PDWk
 1ZuZP6Q1vmnzZu+xlZfpPn+QlZTGKXoNaXq2d6/Aq5/8n1YyTSTEJOhT85yWgp5GwjXCRolH7/y
 zuOHiQlSKoJDS0JUht7iYgF8EVmcCbZK6Qe7IHpF/4ITYgOf+0IuF9Zmx5MG8KcwAkYx5w5e4Pk
 OHHSUUloGht1YXHPfIcrRkFW5h21+ilDozwZV++9r3x4xw2LqJ44ViiohozkLH8CdYZZgnnf9ww
 6nmDWJYgvgn1k+te0wkDOpWsdUTgCm/qkMeahYmmyxBkwORTmPF6PnJKUSH+AeHeHF3S3xDrMXb
 l/XcmIJFHxdzZPjK4gOH+pBUkKB5e9Ir172FUj8mI+vXsv+n1L5V77zToYwt2CUOA4JuAoigT7w
 Z+4p6nNdW/naekNNhcTKBurCaNyIfive8gzf7NjX4e4vWcJDBFwZ+1L+nrMDzPk4yb0sXHAoTRL
 M+GA/iCBuoPTa8gUxJBamjjyfJaS3OzptscafwC5LzChvEm22DNMnIMzkiTfjNqiJ9+Tx64U8uo
 fbguc1t+m5odR3bMNQmSEMiPX8JwtwMr6qhqd6Ykp5Qwkcrn1dZ4GQrsvmmboHytO6YLyoMpSYD
 HrLBhKyEw8vhBzQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-66242-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,samsung.com,arm.com,linaro.org,collabora.com,amd.com,goodmis.org,efficios.com];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:c
 atalin.marinas@arm.com,m:will@kernel.org,m:thierry.reding@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:treding@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linaro.org,nvidia.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B43486EF9B2

From: Thierry Reding <treding@nvidia.com>

There is no technical reason why there should be a limited number of CMA
regions, so extract some code into helpers and use them to create extra
functions (cma_create() and cma_free()) that allow creating and freeing,
respectively, CMA regions dynamically at runtime.

The static array of CMA areas cannot be replaced by dynamically created
areas because for many of them, allocation must not fail and some cases
may need to initialize them before the slab allocator is even available.
To account for this, keep these "early" areas in a separate list and
track the dynamic areas in a separate list.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- rebase on top of recent linux-next, update kernel/dma/contiguous.c
- use kzalloc_obj() instead of kzalloc() with sizeof()

Changes in v2:
- rename fixed number of CMA areas to reflect their main use
- account for pages in dynamically allocated regions
---
 arch/arm/mm/dma-mapping.c |   2 +-
 arch/s390/mm/init.c       |   2 +-
 include/linux/cma.h       |   8 +-
 kernel/dma/contiguous.c   |   2 +-
 mm/cma.c                  | 187 +++++++++++++++++++++++++++++++++++++---------
 mm/cma.h                  |   5 +-
 6 files changed, 165 insertions(+), 41 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f9bc53b60f99..934952ab2102 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -254,7 +254,7 @@ struct dma_contig_early_reserve {
 	unsigned long size;
 };
 
-static struct dma_contig_early_reserve dma_mmu_remap[MAX_CMA_AREAS] __initdata;
+static struct dma_contig_early_reserve dma_mmu_remap[MAX_EARLY_CMA_AREAS] __initdata;
 
 static int dma_mmu_remap_num __initdata;
 
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index f07168a0d3dd..f8f78f1434ea 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -241,7 +241,7 @@ static int s390_cma_mem_notifier(struct notifier_block *nb,
 	mem_data.start = arg->start_pfn << PAGE_SHIFT;
 	mem_data.end = mem_data.start + (arg->nr_pages << PAGE_SHIFT);
 	if (action == MEM_GOING_OFFLINE)
-		rc = cma_for_each_area(s390_cma_check_range, &mem_data);
+		rc = cma_for_each_early_area(s390_cma_check_range, &mem_data);
 	return notifier_from_errno(rc);
 }
 
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 8555d38a97b1..fb7a4923c3ba 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -7,7 +7,7 @@
 #include <linux/numa.h>
 
 #ifdef CONFIG_CMA_AREAS
-#define MAX_CMA_AREAS	CONFIG_CMA_AREAS
+#define MAX_EARLY_CMA_AREAS	CONFIG_CMA_AREAS
 #endif
 
 #define CMA_MAX_NAME 64
@@ -57,8 +57,14 @@ struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order);
 bool cma_release_frozen(struct cma *cma, const struct page *pages,
 		unsigned long count);
 
+extern int cma_for_each_early_area(int (*it)(struct cma *cma, void *data), void *data);
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
 extern bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end);
 
 extern void cma_reserve_pages_on_error(struct cma *cma);
+
+extern struct cma *cma_create(phys_addr_t base, phys_addr_t size,
+			      unsigned int order_per_bit, const char *name);
+extern void cma_free(struct cma *cma);
+
 #endif
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index f754079a287d..7975551f69b3 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -52,7 +52,7 @@
 #define CMA_SIZE_MBYTES 0
 #endif
 
-static struct cma *dma_contiguous_areas[MAX_CMA_AREAS];
+static struct cma *dma_contiguous_areas[MAX_EARLY_CMA_AREAS];
 static unsigned int dma_contiguous_areas_num;
 
 static int dma_contiguous_insert_area(struct cma *cma)
diff --git a/mm/cma.c b/mm/cma.c
index a13ce4999b39..f989e2e98594 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -34,7 +34,12 @@
 #include "internal.h"
 #include "cma.h"
 
-struct cma cma_areas[MAX_CMA_AREAS];
+static DEFINE_MUTEX(cma_lock);
+
+struct cma cma_early_areas[MAX_EARLY_CMA_AREAS];
+unsigned int cma_early_area_count;
+
+static LIST_HEAD(cma_areas);
 unsigned int cma_area_count;
 
 phys_addr_t cma_get_base(const struct cma *cma)
@@ -198,7 +203,6 @@ static void __init cma_activate_area(struct cma *cma)
 				free_reserved_page(pfn_to_page(pfn));
 		}
 	}
-	totalcma_pages -= cma->count;
 	cma->available_count = cma->count = 0;
 	pr_err("CMA area %s could not be activated\n", cma->name);
 }
@@ -207,8 +211,8 @@ static int __init cma_init_reserved_areas(void)
 {
 	int i;
 
-	for (i = 0; i < cma_area_count; i++)
-		cma_activate_area(&cma_areas[i]);
+	for (i = 0; i < cma_early_area_count; i++)
+		cma_activate_area(&cma_early_areas[i]);
 
 	return 0;
 }
@@ -219,41 +223,77 @@ void __init cma_reserve_pages_on_error(struct cma *cma)
 	set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
 }
 
+static void __init cma_init_area(struct cma *cma, const char *name,
+				 phys_addr_t size, unsigned int order_per_bit)
+{
+	if (name)
+		strscpy(cma->name, name);
+	else
+		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
+
+	cma->available_count = cma->count = size >> PAGE_SHIFT;
+	cma->order_per_bit = order_per_bit;
+
+	INIT_LIST_HEAD(&cma->node);
+}
+
 static int __init cma_new_area(const char *name, phys_addr_t size,
 			       unsigned int order_per_bit,
 			       struct cma **res_cma)
 {
 	struct cma *cma;
 
-	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
+	if (cma_early_area_count == ARRAY_SIZE(cma_early_areas)) {
 		pr_err("Not enough slots for CMA reserved regions!\n");
 		return -ENOSPC;
 	}
 
+	mutex_lock(&cma_lock);
+
 	/*
 	 * Each reserved area must be initialised later, when more kernel
 	 * subsystems (like slab allocator) are available.
 	 */
-	cma = &cma_areas[cma_area_count];
-	cma_area_count++;
+	cma = &cma_early_areas[cma_early_area_count];
+	cma_early_area_count++;
 
-	if (name)
-		strscpy(cma->name, name);
-	else
-		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
+	cma_init_area(cma, name, size, order_per_bit);
 
-	cma->available_count = cma->count = size >> PAGE_SHIFT;
-	cma->order_per_bit = order_per_bit;
-	*res_cma = cma;
 	totalcma_pages += cma->count;
+	*res_cma = cma;
+
+	mutex_unlock(&cma_lock);
 
 	return 0;
 }
 
 static void __init cma_drop_area(struct cma *cma)
 {
+	mutex_lock(&cma_lock);
 	totalcma_pages -= cma->count;
-	cma_area_count--;
+	cma_early_area_count--;
+	mutex_unlock(&cma_lock);
+}
+
+static int __init cma_check_memory(phys_addr_t base, phys_addr_t size)
+{
+	if (!size || !memblock_is_region_reserved(base, size))
+		return -EINVAL;
+
+	/*
+	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
+	 * needs pageblock_order to be initialized. Let's enforce it.
+	 */
+	if (!pageblock_order) {
+		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
+		return -EINVAL;
+	}
+
+	/* ensure minimal alignment required by mm core */
+	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
+		return -EINVAL;
+
+	return 0;
 }
 
 /**
@@ -276,22 +316,9 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	struct cma *cma;
 	int ret;
 
-	/* Sanity checks */
-	if (!size || !memblock_is_region_reserved(base, size))
-		return -EINVAL;
-
-	/*
-	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
-	 * needs pageblock_order to be initialized. Let's enforce it.
-	 */
-	if (!pageblock_order) {
-		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
-		return -EINVAL;
-	}
-
-	/* ensure minimal alignment required by mm core */
-	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
-		return -EINVAL;
+	ret = cma_check_memory(base, size);
+	if (ret < 0)
+		return ret;
 
 	ret = cma_new_area(name, size, order_per_bit, &cma);
 	if (ret != 0)
@@ -444,7 +471,7 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
 		__func__, &size, &base, &limit, &alignment);
 
-	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
+	if (cma_early_area_count == ARRAY_SIZE(cma_early_areas)) {
 		pr_err("Not enough slots for CMA reserved regions!\n");
 		return -ENOSPC;
 	}
@@ -1051,12 +1078,12 @@ bool cma_release_frozen(struct cma *cma, const struct page *pages,
 	return true;
 }
 
-int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
+int cma_for_each_early_area(int (*it)(struct cma *cma, void *data), void *data)
 {
 	int i;
 
-	for (i = 0; i < cma_area_count; i++) {
-		int ret = it(&cma_areas[i], data);
+	for (i = 0; i < cma_early_area_count; i++) {
+		int ret = it(&cma_early_areas[i], data);
 
 		if (ret)
 			return ret;
@@ -1065,6 +1092,25 @@ int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
 	return 0;
 }
 
+int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
+{
+	struct cma *cma;
+
+	mutex_lock(&cma_lock);
+
+	list_for_each_entry(cma, &cma_areas, node) {
+		int ret = it(cma, data);
+
+		if (ret) {
+			mutex_unlock(&cma_lock);
+			return ret;
+		}
+	}
+
+	mutex_unlock(&cma_lock);
+	return 0;
+}
+
 bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end)
 {
 	int r;
@@ -1147,3 +1193,74 @@ void __init *cma_reserve_early(struct cma *cma, unsigned long size)
 
 	return ret;
 }
+
+struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
+			      unsigned int order_per_bit, const char *name)
+{
+	struct cma *cma;
+	int ret;
+
+	ret = cma_check_memory(base, size);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	cma = kzalloc_obj(*cma, GFP_KERNEL);
+	if (!cma)
+		return ERR_PTR(-ENOMEM);
+
+	cma_init_area(cma, name, size, order_per_bit);
+	cma->ranges[0].base_pfn = PFN_DOWN(base);
+	cma->ranges[0].early_pfn = PFN_DOWN(base);
+	cma->ranges[0].count = cma->count;
+	cma->nranges = 1;
+
+	cma_activate_area(cma);
+
+	mutex_lock(&cma_lock);
+	list_add_tail(&cma->node, &cma_areas);
+	totalcma_pages += cma->count;
+	cma_area_count++;
+	mutex_unlock(&cma_lock);
+
+	return cma;
+}
+
+void cma_free(struct cma *cma)
+{
+	unsigned int i;
+
+	/*
+	 * Safety check to prevent a CMA with active allocations from being
+	 * released.
+	 */
+	for (i = 0; i < cma->nranges; i++) {
+		unsigned long nbits = cma_bitmap_maxno(cma, &cma->ranges[i]);
+
+		if (!bitmap_empty(cma->ranges[i].bitmap, nbits)) {
+			WARN(1, "%s: range %u not empty\n", cma->name, i);
+			return;
+		}
+	}
+
+	/* free reserved pages and the bitmap */
+	for (i = 0; i < cma->nranges; i++) {
+		struct cma_memrange *cmr = &cma->ranges[i];
+		unsigned long end_pfn, pfn;
+
+		end_pfn = cmr->base_pfn + cmr->count;
+		for (pfn = cmr->base_pfn; pfn < end_pfn; pfn++)
+			free_reserved_page(pfn_to_page(pfn));
+
+		bitmap_free(cmr->bitmap);
+	}
+
+	mutex_destroy(&cma->alloc_mutex);
+
+	mutex_lock(&cma_lock);
+	totalcma_pages -= cma->count;
+	list_del(&cma->node);
+	cma_area_count--;
+	mutex_unlock(&cma_lock);
+
+	kfree(cma);
+}
diff --git a/mm/cma.h b/mm/cma.h
index c70180c36559..ae4db9819e38 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -41,6 +41,7 @@ struct cma {
 	unsigned long	available_count;
 	unsigned int order_per_bit; /* Order of pages represented by one bit */
 	spinlock_t	lock;
+	struct list_head node;
 	struct mutex alloc_mutex;
 #ifdef CONFIG_CMA_DEBUGFS
 	struct hlist_head mem_head;
@@ -71,8 +72,8 @@ enum cma_flags {
 	CMA_ACTIVATED,
 };
 
-extern struct cma cma_areas[MAX_CMA_AREAS];
-extern unsigned int cma_area_count;
+extern struct cma cma_early_areas[MAX_EARLY_CMA_AREAS];
+extern unsigned int cma_early_area_count;
 
 static inline unsigned long cma_bitmap_maxno(struct cma *cma,
 		struct cma_memrange *cmr)

-- 
2.54.0


