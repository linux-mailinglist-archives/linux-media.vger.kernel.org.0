Return-Path: <linux-media+bounces-12090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA418D1D05
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFED51C21E21
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A38B16F26C;
	Tue, 28 May 2024 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGCvZfVH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A697417C7F;
	Tue, 28 May 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903104; cv=none; b=SXyDxNBrb2Hfm9ArNJ6Hm3iZu4io2nZZ4wEvdkV4hSQPCiZJkHTIms6x05a9OD+udC4D4e74rcRGp3x55MDu7JybyD9DyB9Xb0amJ1b9ZHAoox6uWQcmeN9xn35HU90BYX9YBAq6iRDZCeDji6Hr+cOBHWfDdT8sjDnGD4FZE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903104; c=relaxed/simple;
	bh=vAWFowi/ZtCoWVCtCiP9IvNYrXqa5Ge8ez16WM4Swes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G9jaNcFxkJ8CyEtdGDC2IQeodR6IsXEueyozZa2aztlSgre8p5LmzDXA9jwAVLLflmnclDKZP3AIwpvPXbyelnxjaGOUpf2pqAZSCk24DqOsV/U9GUhTCBulcy/XfCkcKvZNIfivYZ+6mxm0DZ8NIfXE6EXxlUU9MW68NBapyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGCvZfVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFBBC3277B;
	Tue, 28 May 2024 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716903104;
	bh=vAWFowi/ZtCoWVCtCiP9IvNYrXqa5Ge8ez16WM4Swes=;
	h=From:To:Cc:Subject:Date:From;
	b=pGCvZfVHhZ3L6Pzx7NnHPDucViDWDEXfo30Quks0js3n/M15sESgT5MwXxE/XAai9
	 fJQk6BkT+ZZxD9WMXXxk9ycI0azOl7qkJnkYXfmLJVlKI2MCibPbzOfv/h7ih4EZt+
	 iuLKQMkhCgQAO1p1nQ2OhTnOOz+PA1xtN8YxGXp+tOJKuJraLxxl+BhOKn8GnMCa12
	 9oTy3b86sC/2D0vyhiNo8O4UFgcxKML9hf+5ka4S1eog8mw8JqUy9X3DszxHPnDgv3
	 fTwUMSd3rX6hQlKQQsonajId75IWesJxK/f3WmiZbRuxlByQXJ3m0WTRrzwUvXyxPQ
	 laRSU/cuxHlXA==
From: Arnd Bergmann <arnd@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dave Airlie <airlied@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] udmabuf: add CONFIG_MMU dependency
Date: Tue, 28 May 2024 15:31:31 +0200
Message-Id: <20240528133138.2237237-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There is no !CONFIG_MMU version of vmf_insert_pfn():

arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
udmabuf.c:(.text+0xaa): undefined reference to `vmf_insert_pfn'

Fixes: f7254e043ff1 ("udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma-buf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4dc53a36428..b46eb8a552d7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -35,6 +35,7 @@ config UDMABUF
 	default n
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
+	depends on MMU
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
-- 
2.39.2


