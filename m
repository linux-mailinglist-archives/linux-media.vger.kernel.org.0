Return-Path: <linux-media+bounces-18108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225FB973EAA
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FB428359D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCDF1A76A5;
	Tue, 10 Sep 2024 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DGgYd3O8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F41A38CD
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725988516; cv=none; b=LPAuh8e3BB8xCJs8XutileZdtOatQJOy7UtX60EP+J5NCfLRzu8m9RfcdEWLuDW7pNIU3FUKmToHC+BjNsOdSplKGEFKrqAxNUtRKDZ7alZJmVGWMlhMWhpmkoNu/kkFFYEgbF0+A+zv7AuUYh8SfyjcYj2vSYpkXsiFNt1tlAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725988516; c=relaxed/simple;
	bh=MKkGxA3WqicLDk+3KCIQS97Cqppi5eNjK5EKzCTQ1VE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=olVQF55y4mESyjh0rhZ3ZOZfOBAJffnQpRbiQih3WVs/EC7TOrv4HE4n/p261ybbbDwFo26I5BOdX9F8qvAzIVuHOiFmHcMyrU9ERjjwDLKrBPGKYDHny3Zkkb5I7bLZBNti1f82wy35ISmQoEY7SvRTsj1IH0KFE0DNbJhDlss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DGgYd3O8; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-690404fd230so28348967b3.3
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725988509; x=1726593309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPRoHm5ctqVLQP6zA14FlIWbVV3YFsM8Hl9EN9iSjUU=;
        b=DGgYd3O8L5+kgsThfQp6SU5dN+4X3Pv0hob58VhNRsN19mEj0eomOkQvjrZIB2IljC
         pZ5MlXdZ3KX+V0TTIgG+QLxKKPvBOc+ORJHxmVl6DHY+G9t7TUAsCFb5ZEOEZwY+6S4H
         zLCX5d4TnPz73oRMq5EiHFTFexO59wvpYkOkE2JEQY7oH6OFgDt7/Allrepd1EEypC53
         y59V6i7icSPGkhVNnophLIQV+vKSu1jleQJyp/FSjRpKim2ClZISxXTRWGK4+UDTEd4V
         OGIhrY8Nq44vvzqTDFMU3ECxx6cjnAP+BYC25Vka1QEqf4NPb1qloMFFtlBYZyP2pbAN
         D09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725988509; x=1726593309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPRoHm5ctqVLQP6zA14FlIWbVV3YFsM8Hl9EN9iSjUU=;
        b=L+Levg0/VIxrhky/G8PBXs2ipoVWsQeD1MJfzX1VP5qkv2aaw2DekDLw/coRXrG/zu
         LzrpD+3PG0VLhd/vqEXnntr4oKvGJ8Id6HAWXLBVHrMd0w4CWCfaxVTfxSWSOEIcbOgp
         5oNRifWkgKdqCg7d7V5rIuCCO83wUn+uwdnqYhq9T6F5WYRODL5P3jJpZk4KseTTqUyd
         bt8csmwG7FrZhCwHaoEyCipz2+adtLzl9a0GTl+8l6TqEQhOQv/neCn4mNLSKDpiS2S9
         OQQXDQJeBh/K9k17mLgxlLKb+jwgVmpioeLVmjZTuGMAOt12JkrN4u/Nufjaa71mbdSw
         q7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW5tFuju8c5i7aRLcdrJwCeiaz6TVXwWkashK2lJk5Um6lkseJtsZm9zwt5dd6ZrOpBCy0z0bLYfGMliQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZ6LtWwB7zmLLdj8BFvNrJ4QY5QeXpQYeR1kAeCOYETgtsWw/
	DHHE64gdXlkEL86SvdL2U5GauCGSO3ZgtyHsth5+VUQRniuObzZXqL0AmW8fUGksSeBrCOO3wOJ
	OqLbh4yMpg5BWJjcwcGc55g==
X-Google-Smtp-Source: AGHT+IHBMQkcGr1YCCW3qFhgLQf69bwnUCWoN0wW6h2xW02h5QE5a99PC3GYqOf2BN0aqXHaJhlcjU6ZEKPx90xt1w==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:2c12:b0:66a:764f:e57f with
 SMTP id 00721157ae682-6dba6e28b59mr37067b3.7.1725988509066; Tue, 10 Sep 2024
 10:15:09 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:14:48 +0000
In-Reply-To: <20240910171458.219195-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240910171458.219195-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240910171458.219195-5-almasrymina@google.com>
Subject: [PATCH net-next v26 04/13] netdev: netdevice devmem allocator
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates net_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a net_iov
struct.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>

---

v23:
- WARN_ON when we don't see the dma_addr in the gen_pool (Jakub)

v20:
- Removed dma_addr field in dmabuf_genpool_chunk_owner not used in this
  patch (moved to later patch where it's used).

v19:
- Don't reset dma_addr on allocation/free (Jakub)

v17:
- Don't acquire a binding ref for every allocation (Jakub).

v11:
- Fix extraneous inline directive (Paolo)

v8:
- Rename netdev_dmabuf_binding -> net_devmem_dmabuf_binding to avoid
  patch-by-patch build error.
- Move niov->pp_magic/pp/pp_ref_counter usage to later patch to avoid
  patch-by-patch build error.

v7:
- netdev_ -> net_devmem_* naming (Yunsheng).

v6:
- Add comment on net_iov_dma_addr to explain why we don't use
  niov->dma_addr (Pavel)
- Refactor new functions into net/core/devmem.c (Pavel)

v1:
- Rename devmem -> dmabuf (David).


fix allocator

---
 net/core/devmem.c | 41 +++++++++++++++++++++++++++++++++++++++++
 net/core/devmem.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 8dd7beb080d2..9beb03763dc9 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -34,6 +34,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
 	kfree(owner);
 }
 
+static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
+}
+
 void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
 	size_t size, avail;
@@ -56,6 +64,39 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 	kfree(binding);
 }
 
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
+	struct net_iov *niov;
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
+	niov = &owner->niovs[index];
+
+	return niov;
+}
+
+void net_devmem_free_dmabuf(struct net_iov *niov)
+{
+	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
+	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
+
+	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
+				       PAGE_SIZE)))
+		return;
+
+	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+}
+
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c50f91d858dd..b1db4877cff9 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -74,6 +74,23 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct netlink_ext_ack *extack);
 void dev_dmabuf_uninstall(struct net_device *dev);
 
+static inline struct dmabuf_genpool_chunk_owner *
+net_iov_owner(const struct net_iov *niov)
+{
+	return niov->owner;
+}
+
+static inline unsigned int net_iov_idx(const struct net_iov *niov)
+{
+	return niov - net_iov_owner(niov)->niovs;
+}
+
+static inline struct net_devmem_dmabuf_binding *
+net_iov_binding(const struct net_iov *niov)
+{
+	return net_iov_owner(niov)->binding;
+}
+
 static inline void
 net_devmem_dmabuf_binding_get(struct net_devmem_dmabuf_binding *binding)
 {
@@ -89,7 +106,13 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
 	__net_devmem_dmabuf_binding_free(binding);
 }
 
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_free_dmabuf(struct net_iov *ppiov);
+
 #else
+struct net_devmem_dmabuf_binding;
+
 static inline void
 __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
@@ -119,6 +142,17 @@ net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 static inline void dev_dmabuf_uninstall(struct net_device *dev)
 {
 }
+
+static inline struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
+{
+}
+
 #endif
 
 #endif /* _NET_DEVMEM_H */
-- 
2.46.0.598.g6f2099f65c-goog


