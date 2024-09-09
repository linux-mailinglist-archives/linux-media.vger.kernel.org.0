Return-Path: <linux-media+bounces-17901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9643970D49
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18F08B21C44
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 05:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFCC1AE042;
	Mon,  9 Sep 2024 05:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t5K3PGdP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75421AD9E9
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725860616; cv=none; b=peN11f6LpI34aAmi+nym36NlqXZhOLjS5xQESgBA83+FfLh72srGYQ7LWCE49Xxyqrl5ispDAshDHXpAOOXsyEGT9Ymv6rH6L1DRwHbTJYpczv44FhpMdS1b1Hd+GYNENA6UX1GSNFEb3JrZP0JNxZe9jAKkwA7ok3NE3jT1r6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725860616; c=relaxed/simple;
	bh=WeTDJ7ZZ1u9c8OCH/DRwuCCCr2tmlYwQobBUfuuwPY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JXmDiS2SwVPkhqyihNdOuS8DvGTwEYEc3StRggwOdAZQJUfsc6Z03wOeMjDIluxqsIpqtPphgw+x9Pp+U3wiua4tZIcBMsEUcXVvoCm8qOXY0ATirLSW7qvFyY1bk/tUckd+M0c2cTFYokp8d6HthQQBtn/SkBT+3RlJ1uQZlaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t5K3PGdP; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e03623b24ddso8112613276.1
        for <linux-media@vger.kernel.org>; Sun, 08 Sep 2024 22:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725860609; x=1726465409; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ECIeZR9RzpNIy7i73AGnhxjov/QI8UJt0jpUvT+70vI=;
        b=t5K3PGdPt/z6TH4R0diqGEYCEOpL5gAnad9t38DA/ZTVH3fcr8BzajKSnp5t6r4NnK
         XAjpRUEEtxUQWl+c5qmYv6vqhZzjjKwiJYL2+tFe8bXpP5XA9/V0Z9Ozwxr051bOJ1Cc
         L8dmvNNHoCxm4fkTC92qzl3BNFB/5HQ4gv3nJSF1n5hvNdS2krQaBAm4lCDA5/QFJTQL
         JgXXIwHUcU7+zta7BXSX/inf3p/42n2ehbB6jhjGuULH3zy6Rmg7jKfrhagLIGB8j0dv
         8Alf+zTJfz6xH8crT2Tw9figfu4tl/ZIbQ4i2MU3vx70UEDoCorLG9/k4kdSrKkdcJXG
         Ej7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725860609; x=1726465409;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECIeZR9RzpNIy7i73AGnhxjov/QI8UJt0jpUvT+70vI=;
        b=Ayx0AOj9tbeAlkNOaQR/KbpGB+5ZyFi3qWOevzxUOr5yK9lH68/36XbXRfpHtlEufO
         gxTPxOj1XtCkiK9oVQz0t75Jqo55Bvl1LimBnzKfBswG1g8xusLABHF6bhEy+ZFbrbPz
         nncSFvjIOF7D0syJUBIrTMlXuUXf8SdWyUA7393uKHTRhKJl62GgqleuZGCXSL3RhfSc
         lQERZG4vRlCOMgB1hbQkv1Gq/SyHXqtcz7x3qgJvd4cmaPT1MEI+wKsQJguDb95hO8vU
         yekKMaED7ElgxGBso6z2oLzGkReOwFjZrMWTX70R/oC3VtfBfafOXPXQjSldBZIoXfKd
         tW7A==
X-Forwarded-Encrypted: i=1; AJvYcCVDuvcQJCJrrmx36v8h//gBdEnYnbNj948WbyQljjNMm97Ka1TnJbGW1EgPfhvK8RHXdtHXSS6AJfaSwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3TYiOlbS4xfYltm2cuoIfrhzfg6PWDFu9ixInYD4iHpbvDYEI
	rRv7WBeRSS4TrHDzcM/1TjkS8W06a+huiEo2lyIkyhAEtarZ7HPycslwV5eE2nUXtBXloeL9GPg
	CumH1e24d611t7nbJpo/sDw==
X-Google-Smtp-Source: AGHT+IH6BBD54EtEYwpncKGXuiMb46yGAk99MKkGAmBV/dBkcwIDJg6JBjgLXyLNhVw8tz5j31vVfWXujpW14zoBJw==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:abb3:0:b0:e1d:21ae:3b95 with SMTP
 id 3f1490d57ef6-e1d34a7232cmr22362276.10.1725860609193; Sun, 08 Sep 2024
 22:43:29 -0700 (PDT)
Date: Mon,  9 Sep 2024 05:43:09 +0000
In-Reply-To: <20240909054318.1809580-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240909054318.1809580-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240909054318.1809580-5-almasrymina@google.com>
Subject: [PATCH net-next v25 04/13] netdev: netdevice devmem allocator
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
2.46.0.469.g59c65b2a67-goog


