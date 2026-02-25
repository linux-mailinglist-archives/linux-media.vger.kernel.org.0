Return-Path: <linux-media+bounces-53394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOM3Is0mn2nOZAQAu9opvQ
	(envelope-from <linux-media+bounces-53394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:43:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFE19ADDD
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37B2330A9685
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E033DA7E5;
	Wed, 25 Feb 2026 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ur3A8vqq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856583E8C66;
	Wed, 25 Feb 2026 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037726; cv=none; b=E+Avm2KkWhmdDuBu9OGf879EJUYwuT8xKLTA8yU0kTXTkiO1Dn5o2Nqrush8eFjOs7zOtcYZvC8bhIBRUkK7o7NnkyyBZPUm0rNM7haVHMBmWDr/pow+2Z5vjxEqwe0nWceOKsE8wpxhVgTC2Sq9m9UNV4gd035GBrn4c5sGl44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037726; c=relaxed/simple;
	bh=1ksolxmHKnKMAAkcEvTBTRw073bmw9i+dhSGaMAVL9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVTUlwyCjNNeNVrnZHN1btPisurAkRZhZpCmTCjN0s0MnyNbQzGge9cnWMaMM/gU6+8QZgohVTgiiKQFyXczVMR4H77LDihHXb7K7jxcsdLwxY6tP460LyudjTqga7+jy9YWaeTxahJg/rh08jmyuE/0oLYP0beiyZswrQXh4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ur3A8vqq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA20C19421;
	Wed, 25 Feb 2026 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772037726;
	bh=1ksolxmHKnKMAAkcEvTBTRw073bmw9i+dhSGaMAVL9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ur3A8vqqGdciMpqU0VUtudg622/fzXcoMXTJl8MBdRsa8x8pVSrAXd1E9yCTkyXp6
	 iVXrS7SNdy75slH60+tXplIkB6t/1o7nxFWsyWf/4oxul8cFq6YbEGc52bvJAzibxR
	 BvjAMCMLrr3/tiFzUSV00wGbR8t+6DooLQJ5JpnNlHpE3i0UIaRtkNB+rccVdHIWrt
	 XC6A9aksZBx05/izc6qF3cGGmMQBGAb5VbwkipsNYcdeMD23sOXEaYaJtchHNc8GIJ
	 IVW12BkW/qEybgdzq+HbWDDkD9wZBUItYEI5/ngCNGrV0rqIEz3XE307ulKBuLLv5K
	 tUgyzFlBI4Xwg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 25 Feb 2026 17:41:51 +0100
Subject: [PATCH 3/7] mm: cma: Export cma_get_name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-dma-buf-heaps-as-modules-v1-3-2109225a090d@kernel.org>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
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
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1ksolxmHKnKMAAkcEvTBTRw073bmw9i+dhSGaMAVL9Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnz1fwnx849earviNBCCet3bOc1zpe7uW7U3Wz8x/jtU
 kPTxgeBHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi/AcY62Nq/RlO7bqgoKgi
 uWX9Eu8FKk0HHSbUvZ1qw2udpZF4WLmCq/pPatK1K8e79n64Xq4az9iwXMwi0n7FB4W7jc/2Pbh
 yIus746Trrs81HTbOqLTs8Ixmir8d+tG94N9f2VizxOz5p9YAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53394-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26BFE19ADDD
X-Rspamd-Action: no action

The CMA dma-buf heap uses the cma_get_name() function to get the name of
the heap instance it's going to create.

However, this function is not exported. Since we want to turn the CMA
heap into a module, let's export it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 mm/cma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/cma.c b/mm/cma.c
index be142b473f3bd41b9c7d8ba4397f018f6993d962..550effb9c4e01cc488b5744fe61d55a5b70a6d6c 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -50,10 +50,11 @@ unsigned long cma_get_size(const struct cma *cma)
 
 const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
+EXPORT_SYMBOL_GPL(cma_get_name);
 
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
 	if (align_order <= cma->order_per_bit)

-- 
2.53.0


