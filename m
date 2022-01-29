Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071124A3037
	for <lists+linux-media@lfdr.de>; Sat, 29 Jan 2022 16:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241290AbiA2PQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jan 2022 10:16:31 -0500
Received: from h4.fbrelay.privateemail.com ([131.153.2.45]:35915 "EHLO
        h4.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232848AbiA2PQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jan 2022 10:16:30 -0500
X-Greylist: delayed 587 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 Jan 2022 10:16:30 EST
Received: from MTA-13-4.privateemail.com (mta-13-1.privateemail.com [198.54.122.107])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 2AD2318000A2
        for <linux-media@vger.kernel.org>; Sat, 29 Jan 2022 10:06:43 -0500 (EST)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
        by mta-13.privateemail.com (Postfix) with ESMTP id D991818000BE;
        Sat, 29 Jan 2022 10:06:40 -0500 (EST)
Received: from localhost.localdomain (unknown [10.20.151.172])
        by mta-13.privateemail.com (Postfix) with ESMTPA id 3071B18000A5;
        Sat, 29 Jan 2022 10:06:37 -0500 (EST)
From:   Jordy Zomer <jordy@pwning.systems>
To:     linux-kernel@vger.kernel.org
Cc:     Jordy Zomer <jordy@pwning.systems>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: heaps: Fix potential spectre v1 gadget
Date:   Sat, 29 Jan 2022 16:06:04 +0100
Message-Id: <20220129150604.3461652-1-jordy@pwning.systems>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It appears like nr could be a Spectre v1 gadget as it's supplied by a
user and used as an array index. Prevent the contents
of kernel memory from being leaked to userspace via speculative
execution by using array_index_nospec.

Signed-off-by: Jordy Zomer <jordy@pwning.systems>
---
 drivers/dma-buf/dma-heap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 56bf5ad01ad5..8f5848aa144f 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -14,6 +14,7 @@
 #include <linux/xarray.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/nospec.h>
 #include <linux/uaccess.h>
 #include <linux/syscalls.h>
 #include <linux/dma-heap.h>
@@ -135,6 +136,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 	if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
 		return -EINVAL;
 
+	nr = array_index_nospec(nr, ARRAY_SIZE(dma_heap_ioctl_cmds));
 	/* Get the kernel ioctl cmd that matches */
 	kcmd = dma_heap_ioctl_cmds[nr];
 
-- 
2.27.0

