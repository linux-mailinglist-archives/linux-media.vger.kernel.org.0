Return-Path: <linux-media+bounces-32630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD80AB98D8
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 11:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABD451BA8B0A
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 09:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E01922FAF8;
	Fri, 16 May 2025 09:31:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AD7483;
	Fri, 16 May 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387892; cv=none; b=i7It+YArkNbn6LaUGW0UaSAG79IdaG+bp2YwY3+zYxOBJ36W6KBTEu9d/9naOibAUvQF2O8DJURz9T0euyHui6upee8kqgA6vuVYxnFHkySNInuN0fBOAfbCoGgBN1SZNYVpOfh43N38qJpVebD9WTpHgVJZ/xBjrmpOehYHnYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387892; c=relaxed/simple;
	bh=46Wom2JNnd0VAYDNrrzY9gWvmu9C6AMWiAQqgHf94Ck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BNG5eyYFgEr6RrU6Lw9To82yy5DPxMU9+xusqp4veR4E0jZJHupCfQLeLLnle5vsFwARLmlhWSaC1/FeFvHs+CFlhwUyr+vQgsMakz0Ey3aQ/GuX0yDrIIDbkF9PPh7kMyqB1n1GVgNo+vDO8RPX9CZIXK0/AzaiSUGLGdICXf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZzMGZ02P2zYl3Ls;
	Fri, 16 May 2025 17:29:10 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:30:59 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:30:58 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
	<benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
	<jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
	<feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v2 0/2] dma-buf: Add direct I/O support via DMA_BUF_IOCTL_RW_FILE
Date: Fri, 16 May 2025 17:21:46 +0800
Message-ID: <20250516092148.12778-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a010.hihonor.com
 (10.68.16.52)

Introduce DMA_BUF_IOCTL_RW_FILE ioctl for direct file I/O on dma-buf objects.

Current flow:
1. Allocate dma-buf (buf_fd)       # Get buffer descriptor
2. Map memory (vaddr)              # Access via virtual address
3. File ops: open/lseek/read       # Read into mapped memory

Problem:
- No direct I/O support in dmabuf
- 70% read time spent on page cache & memcpy
- High latency/power with buffer I/O

Solution:
Add rw_file callback in exporter. When holding sgtable exclusively:
- Build bio_vec and set IOCB_DIRECT flag
- Use vfs_iocb_iter_read for direct I/O

Improved usage:
    dmabuf_fd = dmabuf_alloc(len, heap_fd)
    file_fd = open(file_path, O_RDONLY)
    if (direct_io) arg.flags |= DMA_BUF_RW_FLAGS_DIRECT
    ioctl(dmabuf_fd, DMA_BUF_IOCTL_RW_FILE, &arg)

Performance gains:
- Throughput: 1032MB/s -> 3776MB/s (UFS4.0 @4GB/s)
- Zero page cache overhead
- Direct path eliminates memory copies

Use cases:
- AI model loading
- Real-time data streaming
- Task snapshot storage

vs udmabuf:
- udmabuf creation slower
- udmabuf direct I/O slower than dmabuf direct I/O
- sendfile still has 1 copy vs dmabuf's zero-copy

Test (32x32MB buffer, 1GB file, UFS @4GB/s, CPU @1GHZ):
Metric                 | alloc (ms) | read (ms) | total (ms)
-----------------------|------------|-----------|-----------
udmabuf buffer read    | 539        | 2017      | 2555
udmabuf direct read    | 522        | 658       | 1179
udmabuf buffer sendfile| 505        | 1040      | 1546
udmabuf direct sendfile| 510        | 2269      | 2780
dmabuf buffer read     | 51         | 1068      | 1118
patch 1-2 direct read  | 52         | 297       | 349

v1: https://lore.kernel.org/all/20250513092803.2096-1-tao.wangtao@honor.com
v1 -> v2:
  Dma-buf exporter verify exclusive access to the dmabuf's sgtable.

wangtao (2):
  dmabuf: add DMA_BUF_IOCTL_RW_FILE
  dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for system_heap

 drivers/dma-buf/dma-buf.c           |   8 ++
 drivers/dma-buf/heaps/system_heap.c | 121 ++++++++++++++++++++++++++++
 include/linux/dma-buf.h             |  15 ++++
 include/uapi/linux/dma-buf.h        |  28 +++++++
 4 files changed, 172 insertions(+)

-- 
2.17.1


