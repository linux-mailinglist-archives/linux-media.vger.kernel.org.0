Return-Path: <linux-media+bounces-57090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKnbCl82xGkAxQQAu9opvQ
	(envelope-from <linux-media+bounces-57090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 20:24:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584932B275
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 20:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CD9E300BC69
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21589347518;
	Wed, 25 Mar 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="tGBfo5Mf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674512459EA
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466639; cv=none; b=UGrSGfCLvGXOX4jEAJ4vuGfiFc8Sgc83UEQccRKvu6U5rRM5QzS5rZBXQgg/du+Emwz+3at0qLjkh0l6eioX9EleGzZdt9WrkBUM4+MhUOMK3taphDHdBTBLdyOYwvDNe8xcc2WBdi4rvYGcPs1W8kCVs/KC48rspyUgGtjdGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466639; c=relaxed/simple;
	bh=5zxzl6uudo5fm3rD4gIEZz87DRY+U9FKt25ekqymGSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQ12kA8SWcemjFoUH6MgGIoB0eBbT3TDO5FA8x8ZE+P1nCktuNR3ZJSp35vpVgA5+ZZ1a+SEOZnArAuk0LPme5nk+3ThPs7iPA4CcihKNaEG4imaM6FpNNFEKba8Q3WDkgSERzH/woLBmPEHRY+gqrFd5PA0WKi7I6FZwLMdfF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=tGBfo5Mf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso1903645e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774466634; x=1775071434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9oYYl5Ubh4Ping1zst+E8em20zAUpauFfgriVu6hpE=;
        b=tGBfo5Mfqs+ivUfJPJCTRonnj6fGVVEabtIy9i2jvDjwOIvkPn7Bq7yCOA1KuJd03s
         bD5urjQOua5oT1vdBuYAB29rLTYHA2yN3zanfzNgL4VDntqhXGbLwPeyWIuakOxNmHK7
         X+WXO9KsCpQKJVgHjEN5k/ASVGfNXmvnpAy5gwXwkPyFHdXZalEel5jMZkuhyAZswnHO
         tYApepT64v8MS1DWf3SRZOz/vGL6J3LizsJJUtEjmB4KwdJxx0z++U1wS8EufJ53ACdw
         ITXCfCxo9XXquZTUVo/kz/Pesx/q/S9nmPwISvQBOiHqH8bMAzHQye+UhOCkxWyuiUxa
         BCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466634; x=1775071434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9oYYl5Ubh4Ping1zst+E8em20zAUpauFfgriVu6hpE=;
        b=AYODOPbWogGalKlwcQJqdJGRZPlFDtkA5XOOkMxrK75ax2UM8iKTKmXmkuRAqakTLA
         8je/Sg1D5q5rCkQHbQcxJGnucGyXH9v3m4fTzqARdt0qe/gseI73jOIc5O2iDccDVAI9
         6tOswCWbWj+Sc/IUQuvn9qyAH5RFRX6iWvqfSuXLMl8H2cMWHupm84V/gzD+dCN2p9bD
         09Ai1WoM6R+NRC5DupSqOkJ6wPnLtxNnKrJSu4rOagX30zg8YvOIL98OIbyhXzYTJWSQ
         qT7oodi+8g9UazOFlGSLyjI/nRmgLyuFIo4UWuvmomz9sfZWwJsWVG3iy0sIW505U0Nc
         Qluw==
X-Forwarded-Encrypted: i=1; AJvYcCVppiyrxcG/nE5/Ap3LlNHriEz4WIKntvUaxLCnfLx9SbxjNE88+m9YUAPV0Kmsszv47yibotvnTt5Trg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06DR+xrUWgkUfIj7jg1261/Wj4J0YwAEOe+dycAx4K4VYiwb4
	vnoXAhbt3F5wg3sny1y2o5tDY0x31hlPXwLfQzAzfp1saHtV8+16TMCAmU8/ito2+ls=
X-Gm-Gg: ATEYQzy81rRINWMbJFi60Jay2O6WYZZ3eoQHOdEfZt8GwU+A0muCm2iVuTeG7b8XW3a
	XaKTQbtCHyDKZckypGPSZxk0oPWSio5hZXM3i1ruHUvWxpSl33/JVHzND1oa3d2YfkLxfqHz78Y
	rrcYfeudWLnBorsVv2jiZtlFJvC9PCSopu15+d0h3LIDuhXSEUoGQR4gKX8iTAf5qVWA1HQGWe2
	4kmWCGAViLmQyXwdCo7oAyzz61hUl0CIImsMs1AHHHM657vSvVXbExnhyp2rTBdoMxZHeJXOCnx
	4vFX51VVff5oQGpDzJKg7hNUbs0LN7nKQlF+aKpB0vLTg54Fk8S+EO+g7uV0HhJmBv5xCheFAk+
	Nu3NUXgpgLYtzJaUWV5oGXMMWkGhwT1p5wgJLi/rawUnm4eoSLw4Lsg3nZy8Q43cQfG15+gipxB
	kx2SqOLNdSzAKeDSbhX1AGXzCS/+Ss
X-Received: by 2002:a05:600c:1f12:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-4871605686dmr70437725e9.27.1774466633448;
        Wed, 25 Mar 2026 12:23:53 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm1855634f8f.37.2026.03.25.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:23:53 -0700 (PDT)
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
Subject: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate explicitly shared/decrypted memory
Date: Wed, 25 Mar 2026 20:23:50 +0100
Message-ID: <20260325192352.437608-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57090-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2584932B275
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jiri Pirko <jiri@nvidia.com>

Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
run with private/encrypted memory which creates a challenge
for devices that do not support DMA to it (no TDISP support).

For kernel-only DMA operations, swiotlb bounce buffering provides a
transparent solution by copying data through shared memory.
However, the only way to get this memory into userspace is via the DMA
API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
the use of the memory to a single DMA device, and is incompatible with
pin_user_pages().

These limitations are particularly problematic for the RDMA subsystem
which makes heavy use of pin_user_pages() and expects flexible memory
usage between many different DMA devices.

This patch series enables userspace to explicitly request shared
(decrypted) memory allocations from new dma-buf system_cc_shared heap.
Userspace can mmap this memory and pass the dma-buf fd to other
existing importers such as RDMA or DRM devices to access the
memory. The DMA API is improved to allow the dma heap exporter to DMA
map the shared memory to each importing device.

Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0d

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_SHARED for shared memory
  dma-buf: heaps: system: add system_cc_shared heap for explicitly
    shared memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-mapping.h         |  10 +++
 include/trace/events/dma.h          |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 kernel/dma/mapping.c                |  13 +++-
 5 files changed, 132 insertions(+), 11 deletions(-)

-- 
2.51.1


