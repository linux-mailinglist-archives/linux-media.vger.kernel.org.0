Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF39776DB3
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 03:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjHJB6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 21:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjHJB6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 21:58:09 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70D210DA
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 18:58:08 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c6dd0e46a52so422934276.2
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 18:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691632688; x=1692237488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=02sZ2KF4/kqkk3itVZ075jQ951/44aLMfRaJz3dWZO4=;
        b=6mH2Ew/JcDBG5I+lwTS2EpGNdA9p2OpK3REUFQmgG/geEfGAlApwafQm+F8Gjno4YC
         vCDpAjVQe/ngWT9ZjuvRnO154w6wMjfn1TMqYO6+aMkf3aUUNdMJ68kQBo2qQ919+N+6
         lKxnUZJbXsq2kguUx1ebg3wjqtsA5OXafhjUWBT09q2+GKzL/W7LndWwN5JGkvJDAsIU
         f37R5BVREmn+7hqWsqzA49Zg1HbjS5FUv9sr3KyQvLdN0VbcJv5ntYIw6TECU5sCQfjR
         5iZE0rdJFNV4kBD7r9HDwuh2iYmq6tOP0IggmUN31yMTUrjT1B3pj+8C4fHWrpOgLVl5
         IaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691632688; x=1692237488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02sZ2KF4/kqkk3itVZ075jQ951/44aLMfRaJz3dWZO4=;
        b=G8/1dBKjZSJa/OYfOKYSYIJ4PnuzprzW/BaeoyYuA2UYm+4lhweIdGM7R6Rbtw6YHV
         2Bx5LL7F/lHbVaoQaU2n6NFGvDAx8dIxGB0irfak0+MmEPBR/8dwmKQEshxFvZVZDFC/
         q9wYtQCOm5wA6v7NXCbZ7um3Mu+a/2Tt5/pp2b7aRXp32nHQ0ioL0WaDz+xR3tnrds9M
         ngClmh9G5L+G2+rvmmvxWDTqxHsTRnP+xr76sbpd3tzgIunrLWAdio15xHop4G7Nvhtm
         /L88VkXHrEDoswjqV5WNyKWHp2mN2XBW5nNx+VRAD3CH/F/1qohT0K/OLbUqgJp1pXzP
         pdfw==
X-Gm-Message-State: AOJu0YzenSSsdB5cgqqAO0C1ds0Yj94zcQbWaEV//d6vkrBjLUhjgpTg
        5CaM43g+2F55fCQYXIn+j9Yv4dE2KU6gYGXz6w==
X-Google-Smtp-Source: AGHT+IGCapGPNtCMW44RrnrHw/oUHA4QZiHHbnSEAibZ2bVU1IyKSIRjwoib/ZnyU3K9b3mMe5ZiIByGi0TbafufWQ==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:778b:0:b0:d09:17f2:d3b0 with SMTP
 id s133-20020a25778b000000b00d0917f2d3b0mr16984ybc.9.1691632688161; Wed, 09
 Aug 2023 18:58:08 -0700 (PDT)
Date:   Wed,  9 Aug 2023 18:57:39 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-4-almasrymina@google.com>
Subject: [RFC PATCH v2 03/11] netdev: implement netdevice devmem allocator
From:   Mina Almasry <almasrymina@google.com>
To:     netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Mina Almasry <almasrymina@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com, Willem de Bruijn <willemb@google.com>,
        Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates page_pool_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a page_pool_iov
struct.

page_pool_iov are refcounted and are freed back to the binding when the
refcount drops to 0.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/netdevice.h |  4 ++++
 include/net/page_pool.h   | 26 ++++++++++++++++++++++++++
 net/core/dev.c            | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 1b7c5966d2ca..bb5296e6cb00 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5078,6 +5078,10 @@ void netif_set_tso_max_segs(struct net_device *dev, unsigned int segs);
 void netif_inherit_tso_max(struct net_device *to,
 			   const struct net_device *from);

+struct page_pool_iov *
+netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
+void netdev_free_devmem(struct page_pool_iov *ppiov);
+
 void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding);
 int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
 				u32 rxq_idx,
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 61b2066d32b5..13ae7f668c9e 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -197,6 +197,32 @@ struct page_pool_iov {
 	refcount_t refcount;
 };

+static inline struct dmabuf_genpool_chunk_owner *
+page_pool_iov_owner(const struct page_pool_iov *ppiov)
+{
+	return ppiov->owner;
+}
+
+static inline unsigned int page_pool_iov_idx(const struct page_pool_iov *ppiov)
+{
+	return ppiov - page_pool_iov_owner(ppiov)->ppiovs;
+}
+
+static inline dma_addr_t
+page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = page_pool_iov_owner(ppiov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)page_pool_iov_idx(ppiov) << PAGE_SHIFT);
+}
+
+static inline struct netdev_dmabuf_binding *
+page_pool_iov_binding(const struct page_pool_iov *ppiov)
+{
+	return page_pool_iov_owner(ppiov)->binding;
+}
+
 struct page_pool {
 	struct page_pool_params p;

diff --git a/net/core/dev.c b/net/core/dev.c
index 02a25ccf771a..0149335a25b7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -2072,6 +2072,42 @@ void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
 	kfree(binding);
 }

+struct page_pool_iov *netdev_alloc_devmem(struct netdev_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	struct page_pool_iov *ppiov;
+	unsigned long dma_addr;
+	ssize_t offset;
+	ssize_t index;
+
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+					(void **)&owner);
+	if (!dma_addr)
+		return NULL;
+
+	offset = dma_addr - owner->base_dma_addr;
+	index = offset / PAGE_SIZE;
+	ppiov = &owner->ppiovs[index];
+
+	netdev_devmem_binding_get(binding);
+
+	return ppiov;
+}
+
+void netdev_free_devmem(struct page_pool_iov *ppiov)
+{
+	struct netdev_dmabuf_binding *binding = page_pool_iov_binding(ppiov);
+
+	refcount_set(&ppiov->refcount, 1);
+
+	if (gen_pool_has_addr(binding->chunk_pool,
+			      page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool,
+			      page_pool_iov_dma_addr(ppiov), PAGE_SIZE);
+
+	netdev_devmem_binding_put(binding);
+}
+
 void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
--
2.41.0.640.ga95def55d0-goog
