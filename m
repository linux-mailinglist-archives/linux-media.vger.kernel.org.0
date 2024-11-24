Return-Path: <linux-media+bounces-21911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B40339D75D2
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 17:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E302FB64C36
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380181C303E;
	Sun, 24 Nov 2024 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bL+1RWdN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC211C07F6;
	Sun, 24 Nov 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732455680; cv=none; b=X55HH6aXN9mLVV3Z+UyugMANnu52gAq5lQ6tOmeZB4ddLvsSyPoTa8RCcBqXFi9bTs7pkE6C95osAmD99JvfiZtaBVvGdXfOixJ4qIOdvKmJkcjtZmkZAi9I3cWsT5pvgOyN+O2fMhKbnvNtep3q3PR54OR/vxvz/ylAyWpg2hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732455680; c=relaxed/simple;
	bh=jVug0B5z0yu25jHuiw9klU8LOF+X8Zb4FdA8H54E8Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECQqZSzo6v/rYMJ3n/uUiU+qdOQl4h6Zd5yNn2PNCnF7ddrGiU70RaoBRLGC/AH+HPXCMavFtGOY/mlx219f7IScIkeXq7vgPXeyzp9LpSdZhTOxDeIjGM9jwPpKLM+X1dS1hxU6KukedBrsOIhO70xZ3xqCYEydq3+Qke0S7co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bL+1RWdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B1CC4CED3;
	Sun, 24 Nov 2024 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732455680;
	bh=jVug0B5z0yu25jHuiw9klU8LOF+X8Zb4FdA8H54E8Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bL+1RWdN3Y9oXYTlDtUjDEgmYO4eAGq7GBu3qDJRIdTm5z8JqSRl6I/cOqdYYHDOc
	 zkOfs7p4plmhag+C7lq2TcFUCk9o3/b1st7Gk1gz1ut6JlyLNgLcjS6h5yGX9VcRPv
	 UaqshYRyOarDZpujr+3Gn7Oo6yqINARSzvcwiiH2PV9TVeTR54B3GToWN/Yaw7OaPK
	 vvWKwzfS1w4YHszfErygysk3b1LYAPndmM4AeIKsu9L5D58bQEXsO7PwsxQb3b5aJL
	 U8ljr66JSLLAr5ARerM1w8ObuhyzoyrqI+cOdDlvalBYobN53RNVIV3bTfnMoYyawA
	 q31Ir1SmSdMJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huan Yang <link@vivo.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	kraxel@redhat.com,
	sumit.semwal@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.11 08/87] udmabuf: change folios array from kmalloc to kvmalloc
Date: Sun, 24 Nov 2024 08:37:46 -0500
Message-ID: <20241124134102.3344326-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Huan Yang <link@vivo.com>

[ Upstream commit 1c0844c6184e658064e14c4335885785ad3bf84b ]

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240918025238.2957823-3-link@vivo.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2cefff..bc94c194e172d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -80,7 +80,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -88,7 +88,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -196,8 +196,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -322,14 +322,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				 GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -343,7 +343,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -353,7 +353,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -382,7 +382,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -398,8 +398,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.43.0


