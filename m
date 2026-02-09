Return-Path: <linux-media+bounces-52422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPxYL4r/iWluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:38:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DB111FBB
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BAAF300A268
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1885F37FF6A;
	Mon,  9 Feb 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="mASJg6Ch"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64C37FF52
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651493; cv=none; b=Ts9qSqHyg/thRlJYGYIyhUrGVPmaLToqoKigH91dsc+zwy0Ipm/xsHvi8LpLEqE9QpRlEsrpHRSPsXN3BiW/0FrCpdHtb+Fl5/57NzwXpghK5+6Kgg/ebIyKnoMWfWNYVsgm1yCu9i9bELQc9PpSLZKx5A21m/pmAgFkJ75aUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651493; c=relaxed/simple;
	bh=ls9T1LlIM3oO6+LZXE2PlgRVjxyYDS9g9pq/cPHMgtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7/l0YfZVNaHNYmLF8jf5qPrqSIgilxMCeHA6ZtMt69SV8XHsUOogvcgt9iuK1jDE/2lLJtET/q645LNjpmieLXKqqaCclZM2i42Ypp5Wcd9wi+mg2dNZKdRgz838GWZyl89fGa5k8C1fkN4zn6ELZKmSl4G/IY3ZhcdAizsfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=mASJg6Ch; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so5392955e9.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651490; x=1771256290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BiucukKgd6A5IEwlte0sQaw8GOuaez4s0BdPuzMpI0U=;
        b=mASJg6ChukXbn1SLewMesSBpn8k50GQDQ6kTdK09D3Ur0VGcrUJ2lRA9CHvJwPmRkr
         TfHp0ikdEUyA8k8cr09v3PTJskRF7w0hISCsq2iiMpMRZ/higzkWAcEghbx+V2VS34/X
         B/XNo/cTyNl1/1DI9PUXAKRckg+nadAVU7v2TiIK4nugrWSnzVQim6zBiGXYhIieX3C3
         YeOV17U8IgYY1MbYQg2ULoRPHLoYvAEYLzhw5w/WKGJ69BeuGmt12FNi24qVd6hpDkAc
         aV50ad6WQVLLqqcDY8H7bUocZfyx/EhIv/EyXFQzDLiqmKX96P8Ji2xH9xAoeohZZA+a
         1qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651490; x=1771256290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiucukKgd6A5IEwlte0sQaw8GOuaez4s0BdPuzMpI0U=;
        b=c2KUWvkxcjsrphqfVOX/PgdishZEsXuJD3yu4bwmc563wdRQ6ks2xhU6rj9GZRhZnE
         jpzRMOv+fahFjw0rl6rdyzVrUoAAxIhlUTMXK+lnUsFrSGkVibI1CUT3MfF8PQz9aPML
         Ro0QSK6wlAQbAjlGefW+/hRpmp542sFSy5yUhAECgE9A8YxzBiMNLU8FkDVuGxcxAre2
         Voc4mM+vIcWqWlC6iERg+Wy4MN8uFrKqBwXiWdBcTfv1lC9/UczGBsUYM+XV+jUFRaX3
         4/Oi3H/NYN/JG/dysWdqh5iLlPZckPbquM0ff7AKKl+UmSR+/z+YNyWVsKbjLaLpmLUC
         UiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsP8wTRoj5QzD0oAXDPTL0W/UuEZpd3bf/6mNo6EEiltdiqsufQgNtCjsAJon0ff62q2d3AnbwpontQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkEWdD39Pn3WZfzfazXEoDvBqOe50PWLw4Iac6LjppCwjZThP
	oaLDjhbMrLhyQLTu1I6mlk7ejunTQtfcy531O2jVqwa8UlZk9G8DCxWINYabDrAg98E=
X-Gm-Gg: AZuq6aJtWbmStMDiwvGOUigk/zVTzTncWkLvVdFg4Kq6X5nuIc50TghGUPHgsyT6Zht
	S9a9Eb0uHmmrBEIOOIRwzGhuF4HC1l/W4GJY6Og26xrTNabiFzSnTufQuc+wrSxl+xIP7HBopgV
	0XHwIXCbKOHgAqL+4/aO+qQyyPtS4gYzJT0Z37w5nni70glsfH1QSxm7HOaB1c4WoJocZP8JBA8
	d9lRe9dkUBTxAykdCPBXdhMwYPZ47pqwYAa3gEGUR/ZpXOYgWFDUL51x2YqAwY1CU3iH0lT+4sn
	tn0cFdFAw6T7xn7yg/CpcpZ0BuHD7fctvTVZWEH3WD+IczGKvjx8JdXpzDpFtP7iMpqjGHeck4y
	D+cGMpuRMPHf8m80Aq7S92A0TN/b5ehwdKGRQDE3Y8mSIyq1SsuVdlgR21h1bRksZTkVEf//78I
	KKD4RDR+uWui0K
X-Received: by 2002:a05:600c:621a:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-4832097e2b0mr178535855e9.27.1770651490292;
        Mon, 09 Feb 2026 07:38:10 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8341csm329338275e9.13.2026.02.09.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:09 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH 0/5] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Mon,  9 Feb 2026 16:38:04 +0100
Message-ID: <20260209153809.250835-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52422-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,resnulli.us:mid,resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: DD3DB111FBB
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
run with encrypted/protected memory which creates a challenge
for devices that do not support DMA to it (no TDISP support).

For kernel-only DMA operations, swiotlb bounce buffering provides a
transparent solution by copying data through decrypted memory.
However, the only way to get this memory into userspace is via the DMA
API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
the use of the memory to a single DMA device, and is incompatible with
pin_user_pages().

These limitations are particularly problematic for the RDMA subsystem
which makes heavy use of pin_user_pages() and expects flexible memory
usage between many different DMA devices.

This patch series enables userspace to explicitly request decrypted
(shared) memory allocations from the dma-buf system heap.
Userspace can mmap this memory and pass the dma-buf fd to other
existing importers such as RDMA or DRM devices to access the
memory. The DMA API is improved to allow the dma heap exporter to DMA
map the shared memory to each importing device.

Jiri Pirko (5):
  dma-mapping: avoid random addr value print out on error path
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: use designated initializer for exp_info
  dma-buf: heaps: allow heap to specify valid heap flags
  dma-buf: heaps: system: add an option to allocate explicitly decrypted
    memory

 drivers/dma-buf/dma-heap.c          |  5 +-
 drivers/dma-buf/heaps/cma_heap.c    |  7 ++-
 drivers/dma-buf/heaps/system_heap.c | 96 ++++++++++++++++++++++++++---
 include/linux/dma-heap.h            |  3 +
 include/linux/dma-mapping.h         |  7 +++
 include/trace/events/dma.h          |  3 +-
 include/uapi/linux/dma-heap.h       | 12 +++-
 kernel/dma/direct.h                 | 14 ++++-
 8 files changed, 128 insertions(+), 19 deletions(-)

-- 
2.51.1


