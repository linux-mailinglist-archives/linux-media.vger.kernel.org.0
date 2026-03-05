Return-Path: <linux-media+bounces-54632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OMQODx5qWl77wAAu9opvQ
	(envelope-from <linux-media+bounces-54632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:38:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B6211CC3
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50685305DA76
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133139E6F9;
	Thu,  5 Mar 2026 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nf+W7QV3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785339B943
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714209; cv=none; b=mWFP8mW4h84x0waRpOuFW1wexTyEaAhlplfHS2w0H6eBLlyLfGlgZvuGAAAWB9QpiUlsAonVbZS/8wmh9OHqNTNW3Fx7J6tDJUsfxkq9ynx7q/jr8wguBaPzi0CPyN23czN1z+HTWwX6Sn6W6x/t6O1friutBR2YKQI2aWyYtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714209; c=relaxed/simple;
	bh=BH57nnIaE9i3N95p4Q0UsDprhOQ63o6bys4TWubRZV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioAYZXvhpS+iHpfTgn0mDDTVz3GVfPrTX6Ln28EmbytIziYYXgQ2ukQl2ZLv/KigGw5GqKZbXBS9BeA3tjq/0NGViE49sLVub/n86zb3sQYAQvqJ8/YZgM++JeXC1cWCW5lywyGUU70SQe2lh8q2/EzBSwSdxF+6DULg6uWh4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=nf+W7QV3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439baf33150so3385251f8f.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714203; x=1773319003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3f86hD8zd8MmrDtQjkoOiWVtBZ+fmRfNZDECEzXgGc=;
        b=nf+W7QV3isp/6tGZ/tbfbMglaQd5XBdGe+SW66gbePsJctuc3zL76weCzerQjQbQR/
         JNnpiTdBDeYJxqa4wP3PNzVDJ9IEX7FKy9GYCjj5Dcigi7WAOEr6w9nbIStLUwqlKyGl
         LLmlA3+jB43Fcx7cVElkpnL4w0YuYYyuAV/EW4N1j7YZ5ZU6u7MbQ4yPW7fFSxevvUGh
         Vw1ezC7QJnBoam8fK/eyEe9lKTnq/mgGyPhQlu4bZHfBmn903CbDIE6W28Q5RI0Vn+Wa
         w6tCKN7fPV3MwemH1BG6Fx5i6L3lmcXtHJ2t7Ebx1jMocfLWjSCddQi3GNJXaJ2XBcF2
         6fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714203; x=1773319003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3f86hD8zd8MmrDtQjkoOiWVtBZ+fmRfNZDECEzXgGc=;
        b=UhOz9VYF2WlicBDDSN3mffNBYw6udASLtBusprURPXYOgVeHkqgOxJgMuPOtluXzCT
         QVWMGA0oRcR+6Uy5dGAtwXK69A0AqMUiNkm5fYTvkJFqwft1e5IIYWF1dY5PR7Q+jXmg
         9IEC9haec0ZnKmOjgp/CaPuX03DQ5BEAew2jr9EZaSqAdExIq3qwHzoK9ncS5StA6p62
         7+CGq/ToJVMAVzicqNT5QmnqGyX622ATfrpYE8oqCoeDAwUU5uoqkp2DwCzcfdqX9tXT
         SR7wP1PdGe1nIiK8Ojhl9JKrIfMfe45kDZeqZ+1bqFtr22jua9mxTyXPwC2NWb0Onxz0
         T0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWGJh294DMJm6IC9LDEfgeWykgNgF8k68yGy5LGpcmoiH/gZ6KQRkitPreIijRdlg6DXIrLcGgTW4CiAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdxhuGjdeqi+6cKsYUvdcYVbwT7jse82Eg07LCOUBJj5PDDeM+
	PvDypiVxwt7Ugiy9ZFBTzpeYs3y8O+kkdNJvhSr0IyxCYrRh2hUxYCFgO5TxOR5NbY4=
X-Gm-Gg: ATEYQzyJeQIqwi3WeruRR8R5LV0ycn8fleo0R0YO3d0yvKMyc/BmUClGITn+POZJPcV
	fmS+PJOJjD/bj4JDP1ZACQMr0MmkycaKjzkO/xssirYM9VIcXC8Q9eMEBXZuJStC4fyFqXFcEi7
	8cnTyOlWfKMzjQa4UcZwIz8ENhw+QTr0AjMpXvz86El6cXr+1Pfle1vR4oJ5c83e6mMglLfU1ge
	0e1zx/PMDXG3c0baCU+atsRBTpuyLXICM2oqDArDFHd3CZHZqIH7aCfbx73VaZE6saYmkR+pqTf
	u+Yr6xyl1CODpqhi0jZt6LkfdfRO8uvGi1dj509wFldB3BP0umnvwKFMDFdJB/j7MzbkaVs6Y0p
	+deIdMXiyGdP4ztpj6la80OIUWU8tAid08qjN0eUnWQDxy6wsliMmivvcyAP4GZyQX0817qTAoM
	6wGmYxtuiJI3vnNA==
X-Received: by 2002:a05:6000:1845:b0:439:afc5:dd0d with SMTP id ffacd0b85a97d-439cfd76cf6mr3945058f8f.25.1772714202770;
        Thu, 05 Mar 2026 04:36:42 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm43701820f8f.8.2026.03.05.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:36:42 -0800 (PST)
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
Subject: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
Date: Thu,  5 Mar 2026 13:36:39 +0100
Message-ID: <20260305123641.164164-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 382B6211CC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54632-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim,resnulli.us:mid]
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

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-mapping.h         |   6 ++
 include/trace/events/dma.h          |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 4 files changed, 117 insertions(+), 9 deletions(-)

-- 
2.51.1


