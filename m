Return-Path: <linux-media+bounces-32373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A513AB5065
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 11:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF978C250B
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2415923C4E7;
	Tue, 13 May 2025 09:53:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808A23814A;
	Tue, 13 May 2025 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130016; cv=none; b=mAblvLQlB6VZd2MyKiPCFRiEcdlPZRCdI2BimLuoW6/v9j217WZ/JUotjPi8brpebsbbSD+V048ZrJyltNhiAlViAZgEklOu7krqXmB4SObnl7mlEX1MmirTNwptDgSiPKIge2WN9Cmr+efjJ4WTXdnVUYaULdZzq0Bpe3Bp6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130016; c=relaxed/simple;
	bh=WkPoPj7QdMXdas7VfZz2r9mgd9PMl7uh0K0dF6+vB24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C0KmLdjKzCZlq5hHjUYQyAB/tTmD/Ro281HcjkMp/GcTejkEg0IrwGa5BLgLE8H3m+DnBvFIFrWFiUpo2dJts++NDJoG1KzGtrQrZ+EV8sSVZOB5ECUt030l7zSQUF63M0sPNSQskrqtKvr700HkCEjlBE8k1BfBgWjKyJKjbEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4ZxWWL4RR0zYl4S7;
	Tue, 13 May 2025 17:33:50 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:35:53 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:35:52 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
	<benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
	<jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
	<feng.han@honor.com>
Subject: [PATCH 0/2] dma-buf: Add direct I/O support via DMA_BUF_IOCTL_RW_FILE
Date: Tue, 13 May 2025 17:27:09 +0800
Message-ID: <20250513092709.1869-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a010.hihonor.com
 (10.68.16.52)

Introduce DMA_BUF_IOCTL_RW_FILE ioctl for direct file I/O on dma-buf objects.

CURRENT WORKFLOW:
1. Allocate dma-buf:
   dmabuf_fd = dmabuf_alloc(len, heap_fd)
2. Map memory:
   vaddr = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, dmabuf_fd, 0)
3. File operations:
   file_fd = open(file_path, O_RDONLY)
   lseek(file_fd, pos)
   // 70% time spent on page cache management and memory copies
   read(file_fd, vaddr, len)

KEY OPTIMIZATIONS:
- Convert sg_table to bio_vec
- Enable IOCB_DIRECT flag
- Execute I/O via vfs_iocb_iter_read()

OPTIMIZED WORKFLOW:
   dmabuf_fd = dmabuf_alloc(len, heap_fd)
   file_fd = open(file_path, O_RDONLY)
   if (direct_io) arg.flags |= DMA_BUF_RW_FLAGS_DIRECT
   ioctl(dmabuf_fd, DMA_BUF_IOCTL_RW_FILE, &arg)

PERFORMANCE RESULTS:
- Throughput: 3776 MB/s (UFS 4.0 4GB/s limit)
- Page cache overhead eliminated
- Direct data path reduces memory copies

APPLICABLE SCENARIOS:
- AI model loading
- Real-time data acquisition
- Task snapshot persistence

