Return-Path: <linux-media+bounces-16239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E50950EC8
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 23:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51D451C22F7D
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 21:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29941AE03B;
	Tue, 13 Aug 2024 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YnvFmr8z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118421AB51E
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583618; cv=none; b=NT7vyEjvMPxTXHSO8tZ7DOe5oj04PI+r23AGcWI8/xVsePco5bT8d8YUVQ4wnQ/9f3qR4jmKmwpJ1YqKU+e6N6AQmo+grCsjoroyEy8eKsDbLUS7yfYmMV3dLFd4fWhRKEhsrQP3GUB5ldY5jxKRNZMBJ2vNBrOY/mfWEqAPigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583618; c=relaxed/simple;
	bh=tIwvZ2cHGFADk9Jr1FPijOY9UHtTg6PmPxAqjaq4FPw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eHXbNM2sXeKGaDPcrEU6UzUjTqiPD+LtF9Su2JlDwa3TBTEanimOgFVKN9ikjIrxfPbswo6CSNWk6Zz1f4JIxLzFU32paB7QDgyEqjNVlPkIckXcdV/JL+Gmu+3TNSiYfuPrb/BiHobB7ezp2mhNjl8UJ/fEdxb26sJa81cGUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YnvFmr8z; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0bbd1ca079so10124725276.2
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 14:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723583613; x=1724188413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kLaaGAEPLbOdd+YeQCx2Pqz//MTJ4YC3yHtiwQUoUHE=;
        b=YnvFmr8zzi1PPHscN2/nsWTxqHSnyDPTsVH0Fz8GZUQ5Z08akopE74AooRY8hxRQUV
         rWNsQX9x2H2dLj7W8suvoTSX74JehtNvdg5FIG6TZoYh7P8dt8VS5HxTcQMqGRZvAZ8o
         f2s5kJIJ3o76y8i3rDPamZEtf/MQkq9H887HHvpjahtbMfXJsONWZ+a6wdzZPVrj0IjG
         aS+wLX5fIupIbsWfBApHvFGuFxrNaJJP90/irizZ3gz6nVCtr68woVPvh67B0gNm59rH
         y0GnOp4WGyuB3EC8/cSk8KHjocRYa3Dskr8rck2bh/e/AI0mgSYd8gcGjPIBjAP9PNo9
         +rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583613; x=1724188413;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLaaGAEPLbOdd+YeQCx2Pqz//MTJ4YC3yHtiwQUoUHE=;
        b=XVZpwfBA4/D7JlKMU4CnFRUpyPN2tfcajf0rC5P1XrygWNi/iV9ZrRzuAFZftNrOKr
         w2dGH3DJYcS9EL48fpd/7WMsEjvityQoTm+7SWxDZWOCU2UpSJ0axX7oO7vIKsHLaXzy
         kxes12U44hg44uBMMjz3PrUhttORx6ib96aaCEXVDhsibLzV6G6naJUblwuEJLT7cFHS
         ioFVxL0zZeKEYbavGJ6lCVtxWszdJ8gagL49XeWHfdWw9tsLnPOyiK4ehNWEu15NydNo
         g1KKMlrvz6m/qlbDKXK05VBUIcqhod9VknBkwngTKjdSNpL31AjTUf0/wZgq5H7grHUz
         SuQw==
X-Forwarded-Encrypted: i=1; AJvYcCVXSoTjZ5GWZ/S70PWhIZUIWjlodjAFbxc5pvD0Yk6Cgj4ZWZCi1Uwwz70wgkD21a+GXCaOY7tDPMkmXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbkmiF+oJU6ANJBlXCRk//skk0fBgKr94d3pvOkrwxxRZX3UM
	mIadMR4bqGsRNa7+Tyn6LA6tEerDdpq0EoghqT9TxTNlQBTD/s5cjlN3eBgXC5T4g6kFBj8VHeT
	1a/PKf7mXDQptQZW/Xn+x+Q==
X-Google-Smtp-Source: AGHT+IFwpTn0pxijEwnkGMsF8KAdBILkMTa2oL3LCkpLEIWq32B3zURRm+HsIRSfDEjmLEET0qVZFS2qSrBad12xzQ==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:27c8:0:b0:e05:ec8f:b497 with SMTP
 id 3f1490d57ef6-e1155a95561mr10050276.4.1723583612767; Tue, 13 Aug 2024
 14:13:32 -0700 (PDT)
Date: Tue, 13 Aug 2024 21:13:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240813211317.3381180-8-almasrymina@google.com>
Subject: [PATCH net-next v19 07/13] net: support non paged skb frags
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
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
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

Make skb_frag_page() fail in the case where the frag is not backed
by a page, and fix its relevant callers to handle this case.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>


---

v10:
- Fixed newly generated kdoc warnings found by patchwork. While we're
  at it, fix the Return section of the functions I touched.

v6:
- Rebased on top of the merged netmem changes.

Changes in v1:
- Fix illegal_highdma() (Yunsheng).
- Rework napi_pp_put_page() slightly to reduce code churn (Willem).

---
 include/linux/skbuff.h     | 42 +++++++++++++++++++++++++++++++++++++-
 include/linux/skbuff_ref.h |  9 ++++----
 net/core/dev.c             |  3 ++-
 net/core/gro.c             |  3 ++-
 net/core/skbuff.c          | 11 ++++++++++
 net/ipv4/esp4.c            |  3 ++-
 net/ipv4/tcp.c             |  3 +++
 net/ipv6/esp6.c            |  3 ++-
 8 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index cf8f6ce06742..dbadf2dd6b35 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3523,21 +3523,58 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
 	fragto->offset = fragfrom->offset;
 }
 
+/* Return: true if the skb_frag contains a net_iov. */
+static inline bool skb_frag_is_net_iov(const skb_frag_t *frag)
+{
+	return netmem_is_net_iov(frag->netmem);
+}
+
+/**
+ * skb_frag_net_iov - retrieve the net_iov referred to by fragment
+ * @frag: the fragment
+ *
+ * Return: the &struct net_iov associated with @frag. Returns NULL if this
+ * frag has no associated net_iov.
+ */
+static inline struct net_iov *skb_frag_net_iov(const skb_frag_t *frag)
+{
+	if (!skb_frag_is_net_iov(frag))
+		return NULL;
+
+	return netmem_to_net_iov(frag->netmem);
+}
+
 /**
  * skb_frag_page - retrieve the page referred to by a paged fragment
  * @frag: the paged fragment
  *
- * Returns the &struct page associated with @frag.
+ * Return: the &struct page associated with @frag. Returns NULL if this frag
+ * has no associated page.
  */
 static inline struct page *skb_frag_page(const skb_frag_t *frag)
 {
+	if (skb_frag_is_net_iov(frag))
+		return NULL;
+
 	return netmem_to_page(frag->netmem);
 }
 
+/**
+ * skb_frag_netmem - retrieve the netmem referred to by a fragment
+ * @frag: the fragment
+ *
+ * Return: the &netmem_ref associated with @frag.
+ */
+static inline netmem_ref skb_frag_netmem(const skb_frag_t *frag)
+{
+	return frag->netmem;
+}
+
 int skb_pp_cow_data(struct page_pool *pool, struct sk_buff **pskb,
 		    unsigned int headroom);
 int skb_cow_data_for_xdp(struct page_pool *pool, struct sk_buff **pskb,
 			 struct bpf_prog *prog);
+
 /**
  * skb_frag_address - gets the address of the data contained in a paged fragment
  * @frag: the paged fragment buffer
@@ -3547,6 +3584,9 @@ int skb_cow_data_for_xdp(struct page_pool *pool, struct sk_buff **pskb,
  */
 static inline void *skb_frag_address(const skb_frag_t *frag)
 {
+	if (!skb_frag_page(frag))
+		return NULL;
+
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
index 16c241a23472..0f3c58007488 100644
--- a/include/linux/skbuff_ref.h
+++ b/include/linux/skbuff_ref.h
@@ -34,14 +34,13 @@ static inline void skb_frag_ref(struct sk_buff *skb, int f)
 
 bool napi_pp_put_page(netmem_ref netmem);
 
-static inline void
-skb_page_unref(struct page *page, bool recycle)
+static inline void skb_page_unref(netmem_ref netmem, bool recycle)
 {
 #ifdef CONFIG_PAGE_POOL
-	if (recycle && napi_pp_put_page(page_to_netmem(page)))
+	if (recycle && napi_pp_put_page(netmem))
 		return;
 #endif
-	put_page(page);
+	put_page(netmem_to_page(netmem));
 }
 
 /**
@@ -54,7 +53,7 @@ skb_page_unref(struct page *page, bool recycle)
  */
 static inline void __skb_frag_unref(skb_frag_t *frag, bool recycle)
 {
-	skb_page_unref(skb_frag_page(frag), recycle);
+	skb_page_unref(skb_frag_netmem(frag), recycle);
 }
 
 /**
diff --git a/net/core/dev.c b/net/core/dev.c
index 0a8caf0e4c77..87a43c6997f4 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3434,8 +3434,9 @@ static int illegal_highdma(struct net_device *dev, struct sk_buff *skb)
 	if (!(dev->features & NETIF_F_HIGHDMA)) {
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page *page = skb_frag_page(frag);
 
-			if (PageHighMem(skb_frag_page(frag)))
+			if (page && PageHighMem(page))
 				return 1;
 		}
 	}
diff --git a/net/core/gro.c b/net/core/gro.c
index b3b43de1a650..26f09c3e830b 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -408,7 +408,8 @@ static inline void skb_gro_reset_offset(struct sk_buff *skb, u32 nhoff)
 	pinfo = skb_shinfo(skb);
 	frag0 = &pinfo->frags[0];
 
-	if (pinfo->nr_frags && !PageHighMem(skb_frag_page(frag0)) &&
+	if (pinfo->nr_frags && skb_frag_page(frag0) &&
+	    !PageHighMem(skb_frag_page(frag0)) &&
 	    (!NET_IP_ALIGN || !((skb_frag_off(frag0) + nhoff) & 3))) {
 		NAPI_GRO_CB(skb)->frag0 = skb_frag_address(frag0);
 		NAPI_GRO_CB(skb)->frag0_len = min_t(unsigned int,
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 9e2b28342793..91c7def73700 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1371,6 +1371,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
 		struct page *p;
 		u8 *vaddr;
 
+		if (skb_frag_is_net_iov(frag)) {
+			printk("%sskb frag %d: not readable\n", level, i);
+			len -= skb_frag_size(frag);
+			if (!len)
+				break;
+			continue;
+		}
+
 		skb_frag_foreach_page(frag, skb_frag_off(frag),
 				      skb_frag_size(frag), p, p_off, p_len,
 				      copied) {
@@ -3163,6 +3171,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];
 
+		if (WARN_ON_ONCE(!skb_frag_page(f)))
+			return false;
+
 		if (__splice_segment(skb_frag_page(f),
 				     skb_frag_off(f), skb_frag_size(f),
 				     offset, len, spd, false, sk, pipe))
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 47378ca41904..f3281312eb5e 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -115,7 +115,8 @@ static void esp_ssg_unref(struct xfrm_state *x, void *tmp, struct sk_buff *skb)
 	 */
 	if (req->src != req->dst)
 		for (sg = sg_next(req->src); sg; sg = sg_next(sg))
-			skb_page_unref(sg_page(sg), skb->pp_recycle);
+			skb_page_unref(page_to_netmem(sg_page(sg)),
+				       skb->pp_recycle);
 }
 
 #ifdef CONFIG_INET_ESPINTCP
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 8514257f4ecd..20a1b0333017 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2177,6 +2177,9 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			break;
 		}
 		page = skb_frag_page(frags);
+		if (WARN_ON_ONCE(!page))
+			break;
+
 		prefetchw(page);
 		pages[pages_to_map++] = page;
 		length += PAGE_SIZE;
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index 3920e8aa1031..b2400c226a32 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -132,7 +132,8 @@ static void esp_ssg_unref(struct xfrm_state *x, void *tmp, struct sk_buff *skb)
 	 */
 	if (req->src != req->dst)
 		for (sg = sg_next(req->src); sg; sg = sg_next(sg))
-			skb_page_unref(sg_page(sg), skb->pp_recycle);
+			skb_page_unref(page_to_netmem(sg_page(sg)),
+				       skb->pp_recycle);
 }
 
 #ifdef CONFIG_INET6_ESPINTCP
-- 
2.46.0.76.ge559c4bf1a-goog


