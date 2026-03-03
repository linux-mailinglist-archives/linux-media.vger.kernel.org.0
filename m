Return-Path: <linux-media+bounces-54299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDZAFky0pmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:13:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8631EC7A8
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12CBB302810B
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916DA3988EA;
	Tue,  3 Mar 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAC+WnmK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009873822A3;
	Tue,  3 Mar 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532797; cv=none; b=S08fRK6YkzdYqKRiwLcPabrWRgEfoUy4xF1XYjpd9ILzEnfZSOcfx1AYnYhaRa1DEz/C5YYQDP8RLpvGjc6D25QQoZy27EVmZcf+HWFoI16Cptkx7U1svbrM8R8HJj198LEkvOMU4un8c0XfeFZzIooDTvDmsnHZ1Xfe7fDYpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532797; c=relaxed/simple;
	bh=huH+jTTc4+4vRctajrY9Qj1iPUcQ4Rh9vy/rLperoFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n5b0HkStb5i46s4MPqsnKIeZuIDQOMzKkvZY45El+q230QRlEMQGUJzfu5E57tRJx5Krg3jB9xkKnhl+ruE5Fqj/NnBj98tHkZnHU4gXsD2EvHCydjWldLfbXjxGsJn1X29N7RO0zSqyW26TA2JU6EgVr6Ri8+aCm6YGQGJtGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAC+WnmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A26C116C6;
	Tue,  3 Mar 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532796;
	bh=huH+jTTc4+4vRctajrY9Qj1iPUcQ4Rh9vy/rLperoFM=;
	h=From:Subject:Date:To:Cc:From;
	b=nAC+WnmKRlfMtbZ9K5XQk5snQ+o5BtHQCeb/WYovJVKV6u1w0MD/D9C60ZmDCnvp8
	 Idh0WQT4VmNxjNDmBH3C+rPsSIQI8EXk56wKu72Adu7B/lajCv8ty24wikx6XGaujz
	 FWLTDibVetz8Yd5d44OoxxIaDHl6G9Ys/KNgf8fN5u2vhEmuWneaXZ1DKn1saHKAlz
	 212l02YMYaM6LC2c6ujcRdMKTMONjm7PxX1t/S4+rUL427Kk8tFpdHTR23k3ULKvvc
	 ryk5kevylRq+/6MZmpYbUeLGPqW7fmTQf//AZtfUmNK8ddzspIVOcRzfj7pWI5dcBP
	 ELhw+Vd8I8yqA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 0/8] dma-buf: heaps: Turn heaps into modules
Date: Tue, 03 Mar 2026 11:13:03 +0100
Message-Id: <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NzQ6CMAzA8VchO1tTylfw5HsYD2MrsgiMbLJoC
 O/u4KQX4/HftL8uwrMz7MUpWYTjYLyxY4zskAjVyfHGYHRsQUglEhWgBwnN3ELHcvIgPQxWzz1
 7SDHLm4xV3ZIU8Xxy3JrnTl+usTvjH9a99k8h3aZ/oCEFBEqxjlsSa9TnO7uR+6N1N7GpgT6l6
 odEUcqLXDJXjKVSX9K6rm9FgDArCwEAAA==
X-Change-ID: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374; i=mripard@kernel.org;
 h=from:subject:message-id; bh=huH+jTTc4+4vRctajrY9Qj1iPUcQ4Rh9vy/rLperoFM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnLthir7uE4qVs1b+HWQ8xse5JMMoO7Z06K39+59fuUt
 T5zOg9YdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJtFxhbNizsavS6vYL7u75
 dS9Uv5xu7ta92yehqLe3YvaBq1waPHHOxSnfVk+z1mVb/Vsi2Tr0KWND+2btP29FZ0306P726AB
 vToXZnYrXB2MElk+5+9H5ifzjrVtW8lyaLbyvmWGWzD6238WrAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: CA8631EC7A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54299-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

The recent introduction of heaps in the optee driver [1] made possible
the creation of heaps as modules.

It's generally a good idea if possible, including for the already
existing system and CMA heaps.

The system one is pretty trivial, the CMA one is a bit more involved,
especially since we have a call from kernel/dma/contiguous.c to the CMA
heap code. This was solved by turning the logic around and making the
CMA heap call into the contiguous DMA code.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Squashed cma_get_name and cma_alloc/release patches
- Fixed typo in Export dev_get_cma_area commit title
- Fixed compilation failure with DMA_CMA but not OF_RESERVED_MEM
- Link to v2: https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org

Changes in v2:
- Collect tags
- Don't export dma_contiguous_default_area anymore, but export
  dev_get_cma_area instead
- Mentioned that heap modules can't be removed
- Link to v1: https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org

---
Maxime Ripard (8):
      dma: contiguous: Turn heap registration logic around
      dma: contiguous: Make dev_get_cma_area() a proper function
      dma: contiguous: Make dma_contiguous_default_area static
      dma: contiguous: Export dev_get_cma_area()
      mm: cma: Export cma_alloc(), cma_release() and cma_get_name()
      dma-buf: heaps: Export mem_accounting parameter
      dma-buf: heaps: cma: Turn the heap into a module
      dma-buf: heaps: system: Turn the heap into a module

 drivers/dma-buf/dma-heap.c          |  1 +
 drivers/dma-buf/heaps/Kconfig       |  4 ++--
 drivers/dma-buf/heaps/cma_heap.c    | 21 +++++----------------
 drivers/dma-buf/heaps/system_heap.c |  5 +++++
 include/linux/dma-map-ops.h         | 18 ++++++++++--------
 kernel/dma/contiguous.c             | 37 ++++++++++++++++++++++++++++++++++---
 mm/cma.c                            |  3 +++
 7 files changed, 60 insertions(+), 29 deletions(-)
---
base-commit: 499a718536dc0e1c1d1b6211847207d58acd9916
change-id: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


