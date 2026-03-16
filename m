Return-Path: <linux-media+bounces-55904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sZK9Jyz/t2k5YAEAu9opvQ
	(envelope-from <linux-media+bounces-55904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:01:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E446B299C63
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7E153004429
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D254E397686;
	Mon, 16 Mar 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="NT/1b7c5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDD395254
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665945; cv=none; b=N3hARLienvousn4JsCSpscihHhkX16/5CCfq/NML0pk28peatVpHJppWi23hQjoGL14PXDAqfYgfM22565r+SchOpUFf/fCMwlGJuvtFj67rrj7ZcxLyvNQW6Ca098wGVrqago04GCnNVNzg7owxPBzCxDywG98gcQZP26za5NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665945; c=relaxed/simple;
	bh=Lg2AUKdIw2znElHkpszuxWA7eoByATIIPmoC0QDvUj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAJHUncktFAG47lixpnNPZghrROzwSUqwZB4vigdBcXgQySlmAEdBP9X5X4rD1ISpbGHQ982pd21DmHFXmhVLoN1g3nHpE0rRbDfA/yVfFEm+ZaFw5Teq4rCvosxasE76dKZtf7bfUjt9jqytE8+LzfTE3BmrNZ1CyKKrdHpEEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=NT/1b7c5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so40473645e9.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773665940; x=1774270740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiV2UgPzDyf2BIxEKlEP0kmveErchJjvWqwkP1nC5aU=;
        b=NT/1b7c5hnnPwF+6JutJ63cqtI7vwWpJ2K2Ws5DUKnuGYiCV6qR5tTxaQ7A6tkOvRH
         brpC2sUyUfHNeuTT7DJUfeu2YLYccNC8a9vBpa0cdEKcf5HEjNPzNp64V8c7h5rAwxIr
         FxKAsdX3ASIeBYtJR4nIZmpGQdLMEr9y0RFp+NqbB6LKaGuu3Pp1u0TEawJcYL3h0kds
         S9gbrRz3rVAzKWYnq4TfBJ2GErwOISquJRBRhf/G+u1WRMqm56raC33z/ZqBX8GPhxz+
         CBCsfTz9QTLONXkk67/bBmu7xw2xb9vwlxi3/P45elH0Vmy6D9v4c73Zp0UHr13Xlml4
         euDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665940; x=1774270740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiV2UgPzDyf2BIxEKlEP0kmveErchJjvWqwkP1nC5aU=;
        b=kSPJge3rEOs9cVC5lau1XiN0ua4I8hnjvKaqGd5LpptX1d85z6+AjhlwE0Tc2lf75r
         uLvwdX+JhmWySmN6oNbaEwHkigXKRnw34A/Ot95EjFsNB+XCNVZ5/wLCqrhFYqwoYPSK
         qNUePYHWYYSaN1ePvRHuwUj9d7xOXIp+yfg5VN7/US1Rx9T+upNLyzUR07EaVFMFc8+T
         P94Mh9ZFM5n3QJ6BYx8Jc6atr6Q1m7xixPyO/t16tcF/RupEJk4nwHAZwzca8MJvD4h1
         HP7tBlBn0KpTLdZXpH8bXIKpiJ2ygkp54MXaNFMMGc/OltDOOTdMtT0nyCEZ8nezSm2r
         XJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoSW2uxpy0qzn5YXSafargjT5XVBvbKtHA5SVYMIUT1tgOMC3NKeGajHAg9/vvqztIjJxuzQy2Gpctkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/HxV6xBq0WMStP7S5sv5bxZN8gAO/TcqM6LAPJw3Qf6PkWIrM
	oqGdTPTR5WtaScEeg3TmeBR9XLKtlQoTEiTXYf7NwIdz2+i27Q/vHrVXHR9n0ChxnlY=
X-Gm-Gg: ATEYQzy9ux1jrkQ0943AATDisXtmN1Dsm4f2taoXZNDkdkZnZS+yZxpuC5feBwlcQIY
	9yiNWAgistHygYLEzxJxTGnwg8PtCPIpjihyn6czrrv8d7KIBD0uzj14FWVIGDbsQlGZighbQr2
	lovR2QKDnd0/6vp50RlU59inAPg1FBb3hd2eF82MBnxXAtvxVhc+FNB5Bzf0EALpaD4UuXhjwvM
	Py01krBbVuU7osGO3f8TLEbBZHgMwjSHBdkniErh6l6H2egInKJM2YOnZT9JKDcGtbUVpuwyMrW
	OV+/ioiUEpVRTXI/SzBchFqtuMjtZJAncZ4hVCOFjURWMfkMmNcCjRl5bEyDauN3nw4qSaQvnQC
	+Oaek15KV0ZNirNEZe/nU/TyCWdBD7DAIOWjY9kVdlIEN7rIsPD6N8DNe1LnyI+fpLowtrFCN+/
	ZBVl3Rfe6Hh9W82w==
X-Received: by 2002:a05:6000:18a8:b0:439:ccec:fcd0 with SMTP id ffacd0b85a97d-43a04db4fb9mr22368246f8f.29.1773665939476;
        Mon, 16 Mar 2026 05:58:59 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3e9a4fcdsm14591157f8f.8.2026.03.16.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:58:58 -0700 (PDT)
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
Subject: [PATCH v4 0/2] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Mon, 16 Mar 2026 13:58:55 +0100
Message-ID: <20260316125857.617836-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55904-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[resnulli-us.20230601.gappssmtp.com:query timed out,nvidia.com:query timed out];
	DMARC_NA(0.00)[resnulli.us];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E446B299C63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
(shared) memory allocations from new dma-buf system_cc_decrypted heap.
Userspace can mmap this memory and pass the dma-buf fd to other
existing importers such as RDMA or DRM devices to access the
memory. The DMA API is improved to allow the dma heap exporter to DMA
map the shared memory to each importing device.

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-mapping.h         |  10 +++
 include/trace/events/dma.h          |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 kernel/dma/mapping.c                |  13 +++-
 5 files changed, 132 insertions(+), 11 deletions(-)

-- 
2.51.1


