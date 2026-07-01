Return-Path: <linux-media+bounces-66240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gfVBMZ4+RWoN9QoAu9opvQ
	(envelope-from <linux-media+bounces-66240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:21:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 344276EFB45
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:21:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gDKGsoSu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66240-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66240-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E7ED30E17EB
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B215140682E;
	Wed,  1 Jul 2026 16:08:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADD495510;
	Wed,  1 Jul 2026 16:08:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922134; cv=none; b=EFXgbkRiaFZ1lURj0SddyAAj1FH9g1JbquI6I2g48d6/Vyk3ElZ0ofxY2h3qsQemGl7klKwn8EJBjrUDoLidpz2PbC3rTQ3yHN2UhwglGNXZY3ptRAkJI1cHVORcehafZMtjwr1nR84CnAqonm4vtwZichgaO9LepJwSOX0JV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922134; c=relaxed/simple;
	bh=AJ0pMXg4zNx6iBLjC5rKIhxKfi1x1FCeAKc7Ze03gg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hW1QzASw2781WCV5nLyj/DsZ0XxQtfjPwlMlLwSm1wjVtEvFpmNZjsMcFyE0Yt5CoyK3bn58w2GvbNezBnQBm3c8ONijoyW3UDO/YaRfG2dMF2pI2CjPolr4CPPXpWjqPSgCaNvaIgRUxGNjM1TMXOgwYgRzIQQfZgdwhI5RQn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDKGsoSu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D934C1F000E9;
	Wed,  1 Jul 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782922132;
	bh=4svri2kKaEffu19Oke4jQpVS/UKAzGmltv6WEa4/xwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gDKGsoSuoX4y4+MxDGlxgvPDvWfjgJkJqbd4Z9YYZpHz8hxnq0PT2TzxefRMxVAa0
	 LLxc0gfXz+qgZo48WkXD5vaITziU/QoAPNRgdHmevJCl3HtlfFa8V8lnaN8/lPSoPG
	 p5iKl8CJsukVWbfhFl8WXyUsjdOfJnyUyxwTN8lF7AaXcwOjfoawTFhSMighESuZ5r
	 YEe/SUMdBjlGtyX5rVRWovUn0rzPNWNqDvBxJdBLtHjc3eCV8Gyyi7+WN47vgNUBTm
	 7jd0LJecHEfHZckFVTdLIX5rxFoXf27BDwP0eu3Fdmr93ZkcEmdf6rFk/LkbhdGvTl
	 McmYvWLdY5ukQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 01 Jul 2026 18:08:15 +0200
Subject: [PATCH v3 04/11] arm64/mm: Add set_memory_device() and
 set_memory_normal()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tegra-vpr-v3-4-d80f7b871bb4@nvidia.com>
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
 linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 Chun Ng <chunn@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551; i=treding@nvidia.com;
 h=from:subject:message-id; bh=G1LDIXegX2JsIizEgI4OVqdVWI4H2qUqnDjgZImq5XA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqRTuFpaJPLzRyixdVeDrzwyjHz8TdwopYr+lh2
 QtMV/FTH92JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCakU7hQAKCRDdI6zXfz6z
 oYHgD/9DX2Si/rXRk+uCTzgU4FnEHIC0/836XVX0PwE8Ma9Ts3J4Ee1/5z4Bu7fsEBHy4B5nsYJ
 5HY7goBFPkb8aaQuFHph3Elh5ghlrSLBKMwuM9bif/EjTZCy4cJvzDmW8MoMxwShmrhItxDbn2m
 wDriAvc09QSZbZJXHGas0SwlZbJrBfz/L7SGZpaHlEuK0/18CNrzsihbkF03qYcRhI+bIbyKp6x
 OCCsizV8aNU6Rdv6A76LYBE1opYbwXE3hBvSoEb0rdjK4pwc1M9VrGaANO2WFhSqtp3p329kiCR
 t3M6Tcq9VW6OhNoVWjtbxSYsH4AyO/4GImvYOoBBZmABxd3BYGtDyx9qiSxwTnhIOkowltBwDEC
 r8qcvoNnhp1KLdYBeatZBsgshi++YY+yJDNl7EnvEnHwAsIe0yhIyirKeSf1eTvj/1j3R4XXu5i
 w2FAaNtlofPzZAj/5aiWC8afRClCczkiKN/T527UzBH93xC/VZFX214PjZama7wpFXNU98m3jDG
 wFusLKzUfW0WuCLubnpA/ais9Yz78tToqcJdtGAvP/sN+buHI3vnWH44We1nPHow3pKyFXOxngI
 uPQWSO+yHz2FMkvwy0UDzziwfMQNIiMuzY7FpCKSivOCfIUKmjoYRUW/GLcGJqauaMlNBlwCoMm
 8wKqeTnYGGDOWRw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:c
 atalin.marinas@arm.com,m:will@kernel.org,m:thierry.reding@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:treding@nvidia.com,m:chunn@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66240-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,samsung.com,arm.com,linaro.org,collabora.com,amd.com,goodmis.org,efficios.com];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linaro.org,nvidia.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 344276EFB45

From: Chun Ng <chunn@nvidia.com>

Add helpers to swap PROT_NORMAL and PROT_DEVICE_nGnRnE protection bits
on a kernel-linear-map range.

Signed-off-by: Chun Ng <chunn@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 16 ++++++++++++++++
 include/linux/set_memory.h          | 11 +++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..6a7030609789 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -10,6 +10,8 @@ bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
 int set_memory_valid(unsigned long addr, int numpages, int enable);
+int set_memory_device(unsigned long addr, int numpages);
+int set_memory_normal(unsigned long addr, int numpages);
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..871b59a6c9ea 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -251,6 +251,22 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
+int set_memory_device(unsigned long addr, int numpages)
+{
+	return __change_memory_common(addr, PAGE_SIZE * numpages,
+				__pgprot(PROT_DEVICE_nGnRnE),
+				__pgprot(PROT_NORMAL));
+}
+EXPORT_SYMBOL_GPL(set_memory_device);
+
+int set_memory_normal(unsigned long addr, int numpages)
+{
+	return __change_memory_common(addr, PAGE_SIZE * numpages,
+				__pgprot(PROT_NORMAL),
+				__pgprot(PROT_DEVICE_nGnRnE));
+}
+EXPORT_SYMBOL_GPL(set_memory_normal);
+
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..abcb11378fdb 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -72,6 +72,17 @@ static inline int clear_mce_nospec(unsigned long pfn)
 }
 #endif
 
+#ifndef CONFIG_ARM64
+static inline int set_memory_device(unsigned long addr, int numpages)
+{
+	return 0;
+}
+static inline int set_memory_normal(unsigned long addr, int numpages)
+{
+	return 0;
+}
+#endif
+
 #ifndef CONFIG_ARCH_HAS_MEM_ENCRYPT
 static inline int set_memory_encrypted(unsigned long addr, int numpages)
 {

-- 
2.54.0


