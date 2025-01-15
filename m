Return-Path: <linux-media+bounces-24743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3459A1198B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 07:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB8A1886C21
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 06:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B1D22F3A4;
	Wed, 15 Jan 2025 06:19:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE47A13B7A1
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736921966; cv=none; b=kc+swija/7w8k3Vw9HpwAtQiVuKM6QNIBWACr6sHJiQZunGO/kzgvZjnfa3zDBjcXdb9dxQEgNb1myJ+ufIeymy0f2VkBCuMIZcR9odDu2yzDEdc5RCJBhk5wYO08AQFSCLGAa9cMaIZmmeycU9xMES1eDlprpjLmBBYsi2QOnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736921966; c=relaxed/simple;
	bh=sok2zXbACSZKkiCcre6mIBNL55eeM1Bokf6O+JDqHLw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nF8s5BmY/lbUM5DZ705EnHcp5CKCYLi7D0uht8s+sAlJIBB/1Fy/FRYA5JCj8+qG+FdZJOkHVHPSHjjxNiIvf0mc3o9xjjEoOqds8fSQEmFvkl8W/RF0qFSZi7agXcmUljAcf8lBEnzPObV1+tUrqAoNJA7OAjeJ3dDYRKnLHj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 50F6IOuR038057;
	Wed, 15 Jan 2025 14:18:24 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YXwhc5Zz4z2PwgWJ;
	Wed, 15 Jan 2025 14:15:12 +0800 (CST)
Received: from bj03382pcu01.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 15 Jan 2025 14:18:21 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T . J . Mercier" <tjmercier@google.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "open
 list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
        "open
 list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
        "moderated
 list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>,
        Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [RFC PATCH] driver: dma-buf: use vmf_insert_page for cma_heap_vm_fault
Date: Wed, 15 Jan 2025 14:18:05 +0800
Message-ID: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 50F6IOuR038057

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
return NULL. This commit would like to suggest to replace
vmf_insert_pfn by vmf_insert_page.

[  103.402787] kvm [5276]: gfn(ipa)=0x80000 hva=0x7d4a400000 write_fault=0
[  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140000f43 pmd:8000000c1ca0003
[  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000000000000 mapping:ffffff8085163df0 index:0
[  103.406536] file:dmabuf fault:cma_heap_vm_fault [cma_heap] mmap:dma_buf_mmap_internal read_folio:0x0
[  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W  OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba3a911f3b744176a5d2d
[  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
[  103.410613] Call trace:
[  103.411038] dump_backtrace+0xf4/0x140
[  103.411641] show_stack+0x20/0x30
[  103.412184] dump_stack_lvl+0x60/0x84
[  103.412766] dump_stack+0x18/0x24
[  103.413304] print_bad_pte+0x1b8/0x1cc
[  103.413909] vm_normal_page+0xc8/0xd0
[  103.414491] follow_page_pte+0xb0/0x304
[  103.415096] follow_page_mask+0x108/0x240
[  103.415721] __get_user_pages+0x168/0x4ac
[  103.416342] __gup_longterm_locked+0x15c/0x864
[  103.417023] pin_user_pages+0x70/0xcc
[  103.417609] pkvm_mem_abort+0xf8/0x5c0
[  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
[  103.418906] handle_exit+0xac/0x33c
[  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
[  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
[  103.420785] __arm64_sys_ioctl+0xb0/0xec
[  103.421401] invoke_syscall+0x60/0x11c
[  103.422000] el0_svc_common+0xb4/0xe8
[  103.422590] do_el0_svc+0x24/0x30
[  103.423131] el0_svc+0x3c/0x70
[  103.423640] el0t_64_sync_handler+0x68/0xbc
[  103.424288] el0t_64_sync+0x1a8/0x1ac

Signed-off-by: Xiwei Wang <xiwei.wang1@unisoc.com>
Signed-off-by: Aijun Sun <aijun.sun@unisoc.com>
Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..b301fb63f16b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	if (vmf->pgoff > buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
-	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
+	return vmf_insert_page(vma, vmf->address, buffer->pages[vmf->pgoff]);
 }
 
 static const struct vm_operations_struct dma_heap_vm_ops = {
-- 
2.25.1


