Return-Path: <linux-media+bounces-53176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIG8KmsjnGkCAAQAu9opvQ
	(envelope-from <linux-media+bounces-53176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:52:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDBD174415
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02E613030757
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD90354AE2;
	Mon, 23 Feb 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="vC+QOMk3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C046134FF50
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840303; cv=none; b=Y5Y0AueqVRHlAir/MKRCY2AycJ1qUUtNYIDuljfl6Y3dT/JZDJUCf+BKuxxPqDAbq3qS2ZgdEPHMWFWGxOPtGOP+/4d34win55lGZa0fVMI0LW7VK9eDiyH6CtwgpSWfGm9xsrSy8sZd2qzBEtEqhIQ3QLhide8icvc9LQVG67E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840303; c=relaxed/simple;
	bh=KfFRfouRKPdjO8QdYp354wLUw4VwaWEdMEKo3LWxlW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKyzQ+RgCpvAa2rOnbFz4y8MVt8468qkv5bWw4MtqN/F9pqjAVaq+xpc6za4KRcWczX+6FAK5/pBxbsuvNzPWWtpPqAfoPcJ3rKHPq3rfVVoq2TtVZnoCYIoNpygK4oKIY+LnYfa0ZA7kBlSSMW4eTaaaqFgaFN1EgsQGFzcClo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=vC+QOMk3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483703e4b08so32467695e9.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771840298; x=1772445098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9P/hiUK/l/iV+NBMdNBP19LQ/+lioTm29Bruktj9zQ=;
        b=vC+QOMk3NjIgf5tjcAAAN9f2watvPwzVaAL1qjqBNwNlhuTcNlPaRB/6S6jtbHX//2
         za5XlXtCwYG2LYsXq4UYTYpszUajkP2CGdHIXTNDlhYkCEUII3PK/ay5y1+X2UOsbVQd
         gBRqTNMLciHEwpndxqeNHZr1krZ4BJIiWoy2BH/eVne5bA2BN7+fIVSE3FluPG7pACE7
         BL13TTVFplVAzFJvhZcpO+1eBZ5jglVmEqa3jazEMum79FhgUKD1T8gInmiJYYTi9dbY
         ImU6ds86ar3UzTY9q3x3kwLPTzOg8pxrVcI5LWMErDm9kPKSzZjitgFDTmwwYbGNz2t1
         E66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840298; x=1772445098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9P/hiUK/l/iV+NBMdNBP19LQ/+lioTm29Bruktj9zQ=;
        b=ayyFsPSMrzkMt74z/SbpeGcez/bZAy4PdZlyy3IWP1sNh0bZXDkUBQXR2LwlEwmErw
         eLks4QIqlPzUFiNaYWcPSjNZCxGngcmb5JjJUUMUBcyQTlfhB4gw4HhYS1rSIIOfEzez
         Ctrb38WqTeBAgciT/Q/8NO1uUItnz/c+iA4HbjyNejq6+Kk5YSEVA1LeoSeU9PMQlBvo
         Ryd3BKdvAsFrGfswtIJrRIFcwPHow1ojOmFW3JqXvvpJL5Y6M6HolJrblhYN70/9Gc/z
         bhhsfV92H58gD2NtbQGQyU6icOz6FrqIVXJ3xS4NV/m7X+rPBnwwDIwe+9Y66+GQ2f+Q
         wusg==
X-Forwarded-Encrypted: i=1; AJvYcCVGDZL1ysUnnqFB3a2EBdHhlxrO+U0SCzc4YmUmx8DHozDv/pYidHh2yfMHp0eV4pQF6rcBz2g3GnneZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlFtJfj40WrJFWjT0xy7CRT0APH5/ncdK1e9BKF1CKKC3PLkGP
	UL9fny5+wFQk/B1XYMBTDbayPaWFfYsyKA5BIf4RyGfz93jP2PHO0iV+9DpWsKqcrsI=
X-Gm-Gg: AZuq6aKEUZ87u4/xOiQBiJCqOHyUqyLuPMVLsqROItNHFdD55cNvvoG2n4nKtUSpt9a
	b5ROjMNGC4lLg+tQOukNckP5TerSlK7j14yrWhFA77SCqARvLzby65STO0gAm4TiN2h7fnveNKi
	d9r2zsbR7k3Ovd3/pZm4fn6qquTsoqI9/QAjU34U44MiQ+7WrXNENocm52DYZHUkxPqc0HOPih2
	7X5IrWQTFW6bzBHe9T3UfzdnNHh7JyLPCpnl6pM6KM81vLvPPKWtNdW4T32U2XIDEP0tDi6PB4h
	I/j3vMghfRlIX2AN9Ai6LkJl3/ut7so4LlgtppYImSBzpm7hYMX4UlSEs/nqBEohYd4Mf76KbHe
	nTbwqJI+ki0H419an/gh2NBAk/cx8BaE1hPlehGRnUlIETu9ubaTHbD+gQGcFvyBr8bYcxwglnu
	/pogQ+6Aa0LqOthg==
X-Received: by 2002:a05:600c:8b5b:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-483a949e600mr141861245e9.6.1771840297668;
        Mon, 23 Feb 2026 01:51:37 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadedsm152601835e9.10.2026.02.23.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:51:37 -0800 (PST)
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
Subject: [PATCH v2 0/2] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Mon, 23 Feb 2026 10:51:34 +0100
Message-ID: <20260223095136.225277-1-jiri@resnulli.us>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53176-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,resnulli.us:mid,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: DEDBD174415
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

---
v1->v2:
 patch1:
  - rebased on top of recent dma-mapping-fixes
 patch2:
  - fixed build errors on s390 by including mem_encrypt.h
  - converted system heap flag implementation to a separate heap

Based on dma-mapping-fixes HEAD d5b5e8149af0f5efed58653cbebf1cb3258ce49a

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-heap.h            |   1 +
 include/linux/dma-mapping.h         |   6 ++
 include/trace/events/dma.h          |   3 +-
 include/uapi/linux/dma-heap.h       |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 6 files changed, 119 insertions(+), 11 deletions(-)

-- 
2.51.1


