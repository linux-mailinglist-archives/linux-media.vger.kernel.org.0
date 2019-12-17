Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCC2123569
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 20:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLQTIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 14:08:52 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39391 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfLQTIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 14:08:49 -0500
Received: by mail-pg1-f194.google.com with SMTP id b137so6182276pga.6
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=M6ODtAK/kSPelKWo8qlr9AI1paG4/5fDCdQdMGc8cow=;
        b=ZZTVTJg+L/PA6VmNqIt/3FCmTOg4djZsQiSvscUk3zZc5nQjBWomowCzIXvBlzUXNd
         mxj6r/CCoBn8hRs9dEO4PnnnM2thQdnOs2ev8XTLU9OTaRdpbbxn56TudNEblGV0SMyf
         5oaI2e6PKqeBpqrvW8nbu6yM3lY36oKKVE+VAGu4W6eAaoqAa+NnNVEHDE+jMgrysBL1
         L384H7mgWGRUH4ry94uE7pU1QHSEFMwP/vPmNGoFWLr7VuKTIBXjoTMMDoWdksJ7QKzZ
         etwMVRDuZDwlHtviWS2hmKY5uTqNt0BwulsdGwsWvZh8toG3F/rqoOGhedu4VQrZjq2f
         OnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M6ODtAK/kSPelKWo8qlr9AI1paG4/5fDCdQdMGc8cow=;
        b=I3j7Gbtie8MIs8/h6AJ2f/XDbi2F0XlWLJgJQ/8EzsjtitebVNIdCkhGVbGkhgSXhD
         HFuiw6jtKxYNSpvqR32vV3lhXEQqrgZuHSCsHurc3KY2SSOV4hB2lPFQkj8an5E88qGG
         6AaUH0qoe3DY6dMZVH/4khDfW7OBEPpKmq1ep0rV46jNAXttimxweDvJFJDR0aOi3Enq
         AugTFQ2vIORmCE3MTfalJBzSiFEjakTud/5JxzG8LnKnaOehQv7w+czjh4zOEegWVCgd
         /HzmD14E1mxsl8SPGScRvJk8he/5J6sbtuZHuYrv2+n8oGL2jOAmEqzbt8z3G7bd3LYQ
         KUwA==
X-Gm-Message-State: APjAAAXud+GuYHu+HC9we+zBbAl1WjO1dJYpzkloNztuixRu6fzr3+z9
        EF4lsMnbXw/LYmyxWcr73/GEew==
X-Google-Smtp-Source: APXvYqwwYwEW8UujHenDnM3HGny/IvVE2Z/yHHlmaPBn+WxMZ+NHOf6z5+i7m2NFWdAv96HkaHfebA==
X-Received: by 2002:a63:f743:: with SMTP id f3mr26884769pgk.28.1576609728600;
        Tue, 17 Dec 2019 11:08:48 -0800 (PST)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id 12sm1697085pfn.177.2019.12.17.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 11:08:47 -0800 (PST)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     sumit.semwal@linaro.org
Cc:     afd@ti.com, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
Date:   Wed, 18 Dec 2019 00:38:22 +0530
Message-Id: <20191217190822.1969-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: zhong jiang <zhongjiang@huawei.com>

Fix the following sparse warning.

drivers/dma-buf/dma-heap.c:109:14: warning: symbol 'dma_heap_ioctl_cmds'
was not declared. Should it be static?

Acked-by: Andrew F. Davis <afd@ti.com>
Acked-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: zhong jiang <zhongjiang@huawei.com>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
 [sumits: rebased over IOCTL rename patches]
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 1886aee46131..afd22c9dbdcf 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	return 0;
 }
 
-unsigned int dma_heap_ioctl_cmds[] = {
+static unsigned int dma_heap_ioctl_cmds[] = {
 	DMA_HEAP_IOCTL_ALLOC,
 };
 
-- 
2.18.0

