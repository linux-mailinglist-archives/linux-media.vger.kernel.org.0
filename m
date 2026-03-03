Return-Path: <linux-media+bounces-54350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBbKM4XXpmnHWgAAu9opvQ
	(envelope-from <linux-media+bounces-54350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:43:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A601EFA38
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0621B3059F0A
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 12:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D064B344DBB;
	Tue,  3 Mar 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6BjI3Fu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C19344DBE
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541262; cv=none; b=bEUc6i5Vrr9+Mgv3ZWJcZlH/niRjSptCPsQ5JfAQngz/ICnNqL8XG5CASBaF8PeB/aUBRd0fp9ojkJxf+fnvQepIXQPaDb2MRXoI662bcmXirk+Oqi6+hw9HtsBfhmFpizF9htlmv6MaLxVcwPoMKUo2GNu949PldIqqoniBZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541262; c=relaxed/simple;
	bh=IPXiwZtCc7P08ZgUjvcnSviyFkXkojb59Nxf4/tXsiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J8eyXgzOf7HQYSORXkm0HDGeKmP89msvJsDvFsH+9B+zFSmsDinbrepOk/3T4PcLeYzrN0Ohq/xBE9cHuQD7E32tS2uSuzHDHfUwRCjaH7xKZ4peRGdRHarBl5eDebhxgOZ2grLDumcVWBtYachZ2eP6VT7WEl3naQby6+yvlH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6BjI3Fu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772541258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U6xhLiQFL+mbcgfrby6QpV2yp3OnQ8VMri8wk6ood+Y=;
	b=H6BjI3FuXlBvjHNLBzJ5jq6MycB17nY5qB0ddmxKwUiiTQWNuVfZs5G3SzUC70Abeba0Yk
	ip43LpwdKozuNMrlIsnDqI8CHxG77A5CVdMesIWOIec8zlnH5gy2e2m2ovVHe+2QSORMIh
	eadqvRUNahi6fV4vZ3ZZnoxHs7yJWYg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-cN6t_CJ8MaSdHHuavs01GA-1; Tue,
 03 Mar 2026 07:34:13 -0500
X-MC-Unique: cN6t_CJ8MaSdHHuavs01GA-1
X-Mimecast-MFC-AGG-ID: cN6t_CJ8MaSdHHuavs01GA_1772541251
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 827351956089;
	Tue,  3 Mar 2026 12:34:10 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.44.32.231])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBF6530001B9;
	Tue,  3 Mar 2026 12:34:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2 0/6] dma-buf: heaps: add coherent reserved-memory heap
Date: Tue, 03 Mar 2026 13:33:43 +0100
Message-Id: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ7CIBCF4as0s3ZMmTaNuPIepgsKg7CgNICNp
 undxSZuXf5v8b0NMifPGa7NBolXn32ca9CpAe3U/GD0pjZQS0NL1OHUowlqelp0rBbU0XHiuWA
 KHFAKazpJg7IsoRJLYutfB38fazufS0zv420V3/UH9//hVaBAYy3bviN5UfqW2DhVzjoGGPd9/
 wAJXkgtyQAAAA==
X-Change-ID: 20260223-b4-dmabuf-heap-coherent-rmem-91fd3926afe9
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, echanude@redhat.com, mripard@redhat.com, 
 John Stultz <john.stultz@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772541243; l=2748;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=IPXiwZtCc7P08ZgUjvcnSviyFkXkojb59Nxf4/tXsiE=;
 b=UoJm8cOUwDbUZaGCu/6/A2ZEkCDOViFBfczvAM5knasQJRy7s18G7gsVP6zwFOy1FBwWL/nXj
 M/F79L4YdOoCAv3QZE2oXpL/jmdtEbuyArFvtu7fbTfA4XBopk6UHWV
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Queue-Id: 37A601EFA38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54350-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patch introduces a new heap driver to expose DT non‑reusable
"shared-dma-pool" coherent regions as dma-buf heaps, so userspace can
allocate buffers from each reserved, named region.

Because these regions are device‑dependent, each heap instance binds a
heap device to its reserved‑mem region via a newly introduced helper
function -namely, of_reserved_mem_device_init_with_mem()- so coherent
allocations use the correct dev->dma_mem.

Charging to cgroups for these buffers is intentionally left out to keep
review focused on the new heap; I plan to follow up based on Eric’s [1]
and Maxime’s [2] work on dmem charging from userspace.

This series also makes the new heap driver modular, in line with the CMA
heap change in [3].

[1] https://lore.kernel.org/all/20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com/
[2] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
[3] https://lore.kernel.org/all/20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org/

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v2:
- Removed dmem charging parts
- Moved coherent heap registering logic to coherent.c
- Made heap device a member of struct dma_heap
- Split dma_heap_add logic into create/register, to be able to
  access the stored heap device before registered.
- Avoid platform device in favour of heap device
- Added a wrapper to rmem device_init() op
- Switched from late_initcall() to module_init()
- Made the coherent heap driver modular
- Link to v1: https://lore.kernel.org/r/20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com

---
Albert Esteve (5):
      dma-buf: dma-heap: split dma_heap_add
      of_reserved_mem: add a helper for rmem device_init op
      dma-buf: heaps: Add Coherent heap to dmabuf heaps
      dma: coherent: register to coherent heap
      dma-buf: heaps: coherent: Turn heap into a module

John Stultz (1):
      dma-buf: dma-heap: Keep track of the heap device struct

 drivers/dma-buf/dma-heap.c            | 138 +++++++++--
 drivers/dma-buf/heaps/Kconfig         |   9 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/coherent_heap.c | 429 ++++++++++++++++++++++++++++++++++
 drivers/of/of_reserved_mem.c          |  27 ++-
 include/linux/dma-heap.h              |  16 ++
 include/linux/dma-map-ops.h           |   7 +
 include/linux/of_reserved_mem.h       |   8 +
 kernel/dma/coherent.c                 |  34 +++
 9 files changed, 642 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-b4-dmabuf-heap-coherent-rmem-91fd3926afe9

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>


