Return-Path: <linux-media+bounces-43903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5DBC3710
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 08:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0CC01887A55
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 06:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFF52EA73D;
	Wed,  8 Oct 2025 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUt7p4Yr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFEA296BD6;
	Wed,  8 Oct 2025 06:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759903833; cv=none; b=swNzNjAiCL0heYyIZ+ipMtfdeAOChLQ2n11Q/c7MTiwhCGQaknenqj2FngYvPL2wFqPoiC73h3GJ/d7EhVcRgw1BEtnyX8LIp0cdwQooncOfqxMbOUjo+UCR2q8HLAqjM7d9bivKGyMn8iC7J+FG6C0EQPio+tOEY3Lh552nwJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759903833; c=relaxed/simple;
	bh=Dc569KT1YS0VQ3qzLz5ms49L7ZBR3t8zH8folwCiWa8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HheAhURreZQt5DgjOMY9n/3bPP0AblfAe4MwJ/yfAWV0eUUIbz78C37LIhP8V+sLF6FvWms7uLq8dm5ZRtmq62mu85clnMpMRLfY7+dNKvg9OnnWtWJ49RPJ/9xGsHSgXf6wEzd5zpJzIJibcRvun4UvyW0CnHV02hiJQqdBBcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUt7p4Yr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A64FC4CEF4;
	Wed,  8 Oct 2025 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759903833;
	bh=Dc569KT1YS0VQ3qzLz5ms49L7ZBR3t8zH8folwCiWa8=;
	h=From:To:Cc:Subject:Date:From;
	b=oUt7p4YrY+IuLquT8CkeUy70jH9EPO23jENfxHkTIYmyBQQBC1rqAL69/ljqsWt9T
	 1eVRGYfHCByz90XkdQ+Pd/nAVHKIM15vHMK/PFOubWNLj0yb/8s4uQRxuDkPugWX2Z
	 DjgzVpIT9G9qI/f0KYfmN2S9+ij0yOdy2JLOzVdB8+N0o8Smeic5WcB+GdLXD/MmN1
	 tkKktcAsOGY/jufEVMVbeIKoh3jLf9vJlDfdY19w5/0gJjiLc2AROIQ360/YAMAsxc
	 tgyzRovP9z048Kz8m6BXCrsHMfoMuS2ORyO2e3ScMMiZ5WutaLzQagV8oq7pq2yTqG
	 bog/slmI6n8AQ==
From: Kees Cook <kees@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] dma-buf: use SB_I_NOEXEC and SB_I_NODEV
Date: Tue,  7 Oct 2025 23:10:32 -0700
Message-Id: <20251008061027.work.515-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=kees@kernel.org; h=from:subject:message-id; bh=Dc569KT1YS0VQ3qzLz5ms49L7ZBR3t8zH8folwCiWa8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnPGMIvvjnZz8Y1Y7b5isuyJ5568nE21L+vtb9k+Mkn9 nO/9D7jjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgInMi2b4wxP2aK6KqInRk67H 1z88+XNBde6Mi7VnVB6ZdK6/8uWSkQEjw6MdiyfJ2D0vu2v/Rdj6+JqlDRMy1/x4X3TiiVZdzfz G59wA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The dma-buf pseudo-filesystem should never have executable mappings nor
device nodes. Set SB_I_NOEXEC and SB_I_NODEV on the superblock to enforce
this at the filesystem level, similar to secretmem, commit 98f99394a104
("secretmem: use SB_I_NOEXEC").

Fix the syzbot-reported warning from the exec code to enforce this
requirement:

> WARNING: CPU: 1 PID: 6000 at fs/exec.c:119 path_noexec+0x1af/0x200 fs/exec.c:118
> Modules linked in:
> CPU: 1 UID: 0 PID: 6000 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full)
> RIP: 0010:path_noexec+0x1af/0x200 fs/exec.c:118
> Call Trace:
>  <TASK>
>  do_mmap+0xa43/0x10d0 mm/mmap.c:469
>  vm_mmap_pgoff+0x2a6/0x4d0 mm/util.c:580
>  ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:604
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68dc3ade.a70a0220.10c4b.015b.GAE@google.com/
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Christian Brauner <brauner@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com
Cc: <linux-media@vger.kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linaro-mm-sig@lists.linaro.org>
---
 drivers/dma-buf/dma-buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..6e2ab1a4560d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -189,6 +189,8 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 {
 	struct pseudo_fs_context *ctx;
 
+	fc->s_iflags |= SB_I_NOEXEC;
+	fc->s_iflags |= SB_I_NODEV;
 	ctx = init_pseudo(fc, DMA_BUF_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
-- 
2.34.1


