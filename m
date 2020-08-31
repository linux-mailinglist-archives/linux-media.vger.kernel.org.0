Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37B2257299
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 06:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgHaERU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 00:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgHaERU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 00:17:20 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283C9C061573;
        Sun, 30 Aug 2020 21:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=hk9MKuYTLLrbYPyororI+1P9k/AQL7zML5WUOPd+C6c=; b=PMGr1dUjzsSLLZezD3HIALlL8q
        HqT6THcAJCmcjDT59RzuD2Of87nr/15+1XH4pvm/KedAGJNyHMlcfeoEdih24melWClTbOPxhFKF7
        Az17djVhyAk0DWJZQU2oIT6Hld0Tyg+ElHrhba4u5eWYUL5I6hI6hJ2EbLdS1oxHLBS5nvJfkG6rn
        yRSJ98sR65k3RQ8vxe8g36o2A8oDyzU8hQ1Hl1QalwZpY2Urgc1XUzJCZLCcT62uKrWpz7WMt4TSQ
        IpD6mmFTYqGhZw05LuBWG/dIOmqCWBNn3seu0lN8NHs7fWa2cSzMZpfJTKlMtDHXhpYxIvlVB3LMB
        aXLFxgCQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCbFt-000648-LC; Mon, 31 Aug 2020 04:17:18 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
Date:   Sun, 30 Aug 2020 21:17:13 -0700
Message-Id: <20200831041713.12571-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add @cookie to dma_fence_end_signalling() to prevent kernel-doc
warning in drivers/dma-buf/dma-fence.c:

../drivers/dma-buf/dma-fence.c:291: warning: Function parameter or member 'cookie' not described in 'dma_fence_end_signalling'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/dma-buf/dma-fence.c |    1 +
 1 file changed, 1 insertion(+)

--- lnx-59-rc3.orig/drivers/dma-buf/dma-fence.c
+++ lnx-59-rc3/drivers/dma-buf/dma-fence.c
@@ -283,6 +283,7 @@ EXPORT_SYMBOL(dma_fence_begin_signalling
 
 /**
  * dma_fence_end_signalling - end a critical DMA fence signalling section
+ * @cookie: opaque cookie from dma_fence_begin_signalling()
  *
  * Closes a critical section annotation opened by dma_fence_begin_signalling().
  */
