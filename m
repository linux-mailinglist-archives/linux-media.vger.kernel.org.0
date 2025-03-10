Return-Path: <linux-media+bounces-27950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF86A593A5
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE093AB427
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C6422CBE9;
	Mon, 10 Mar 2025 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4uygRPz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FD522C35D;
	Mon, 10 Mar 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608403; cv=none; b=mUeCcG/2zuAygOGQTTRSjAE1pcoFjINlvd8WSJbyjd0A85t9//RTAcXh9T1LHj8BkZsIWuWLnKQBd3/KvxoII1at2OI2RkCpdfKx+vfADKuTHpPknRWgvHPo1p/ppaZt3u4wU5ThQDqEJd0Yy69ddVGurBoiqwWX/f7xoetXbw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608403; c=relaxed/simple;
	bh=bMCIvn+7jf6RMiYjEqkNRC/cCXSSxQerkW6ogfdek4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HA41zlan8ZMPHqm7T5QaSHRyAiejOYD5wUsBLgA3VPAl1n1NyG/WWv+itBOJX0HFtAUmfaZA83D3clKCsAr3/CYeTRLD9jzBKQFBQG3ICy+r9Lsl9X6joxNHfX+lpwEW8dkF84VuMCPsRNSPC0bqRfahvOh0JaJSOGLucv2v3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4uygRPz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DF7C4CEED;
	Mon, 10 Mar 2025 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608403;
	bh=bMCIvn+7jf6RMiYjEqkNRC/cCXSSxQerkW6ogfdek4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c4uygRPz6bHzOv7JaNd0BKTZdiJEeNNcAfN7JlO1sp451josGYGwOPeVSWBgd+N12
	 QOw5/LBuUY8o2XXn8mk3aPWeFcHLDfF4dARIrSn4peA4LCdlIglwRYGe80L9TOm5Nh
	 fvWbAvaafZU7hsRYue9WrYK6wXtSF1uVl//tLeDIrXiOtET1ST1idAgk0sOcpN66Qo
	 XMSEACHHxWrEhXDsq2mFwDakCRpfhdwUZuF+V9Ym0SbSNxk+GszSTQGzQutE5uF9Dj
	 6rEwFHnGHfJlI3b/8CaV0AU7g2mk6SMB2CX3lBmI1fBYXzaIJa5H7iLWESsMAH0nBP
	 iQ7NEvKYLtyYw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:15 +0100
Subject: [PATCH RFC 09/12] dma-buf: Clear cgroup accounting on release
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-9-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bMCIvn+7jf6RMiYjEqkNRC/cCXSSxQerkW6ogfdek4M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm5t/yVnmCnbdWIBb4tvabPfyl9udfO64jiO/quN4
 GNJyz/dUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgInsOsLIcPDV65S2uVZWc348
 +bw4wjdK8HDKtbceyZUZ2688natTF8zI8LhqgYHRIbd71bsl7t4JEb5RWWed883UeuOfx6vX9BW
 8ZwUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

In order to clean thing up when dma-heaps will allocate and register
buffers in the dev cgroup, let's uncharge a released buffer for any
(optional) cgroup controller.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/dma-buf.c | 7 +++++++
 include/linux/dma-buf.h   | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b855156516a0a766bee0789b122473efb3..a95eef17f193454b018dc8177ddfd434d7b64473 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -11,10 +11,11 @@
  * refining of this idea.
  */
 
 #include <linux/fs.h>
 #include <linux/slab.h>
+#include <linux/cgroup_dmem.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-fence-unwrap.h>
 #include <linux/anon_inodes.h>
 #include <linux/export.h>
@@ -97,10 +98,16 @@ static void dma_buf_release(struct dentry *dentry)
 	 * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
 	 */
 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
 	dma_buf_stats_teardown(dmabuf);
+
+#ifdef CONFIG_CGROUP_DMEM
+	if (dmabuf->cgroup_pool)
+		dmem_cgroup_uncharge(dmabuf->cgroup_pool, dmabuf->size);
+#endif
+
 	dmabuf->ops->release(dmabuf);
 
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..111ca5a738ae0a816ba1551313dfb0a958720b6c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -437,10 +437,15 @@ struct dma_buf {
 		struct dma_fence_cb cb;
 		wait_queue_head_t *poll;
 
 		__poll_t active;
 	} cb_in, cb_out;
+
+#ifdef CONFIG_CGROUP_DMEM
+	struct dmem_cgroup_pool_state *cgroup_pool;
+#endif
+
 #ifdef CONFIG_DMABUF_SYSFS_STATS
 	/**
 	 * @sysfs_entry:
 	 *
 	 * For exposing information about this buffer in sysfs. See also

-- 
2.48.1


