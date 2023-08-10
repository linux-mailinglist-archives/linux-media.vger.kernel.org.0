Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0806776DC2
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 03:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjHJB6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 21:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjHJB6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 21:58:30 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E758C6
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 18:58:25 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-583fe0f84a5so6370257b3.3
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 18:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691632704; x=1692237504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A72dv4/C3nRhaaIL45Qla7D1fv5wRm/EUSGzlFwP9lc=;
        b=ExMQ69JxEkQEghmOjyVasRvnuhz6jC2LodZHs0V5yQ46eTTXvNsFNW4Y3Vm7mapiq1
         EkHgPogZUe6tuV/HA/bG9obyt4nv21rLc90nVe1NDWLzadva4pylwBpk997/Fq9lFIYn
         JDoDtpud26yzjICJ9UqHXgbaytjrVPB6PxSoeqn6mOxYihp7vNnGgm62VfzX3DWsvWlB
         lojyqTJSfpNOBPk2xOE769LpI3SqjqGJFgAr7HFsPxe4mkBIoZuQmzUTQfpLoHNVQ3Jo
         PkG/Xhz4f/OMQVjAmSQB8I7CAorAkNcIQ2eioBWwrz4eGnCDMECul4hqOMVEBrxUSjpE
         hRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691632704; x=1692237504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A72dv4/C3nRhaaIL45Qla7D1fv5wRm/EUSGzlFwP9lc=;
        b=iDUq1PVtR815uZxUg62u8iRiny1jHZaOSgYOO8n/c1dD2FBAEvRp/GrKCd2TfKDz59
         qB9TNbrBbrwgNHRDQfTOwGAh+P3De8eSoTz5ipZ7XxU3S0T4kvC71dhTUZ4OjTwSAx0K
         sDiYbz55xxNcv6vmaPptPDiZvi1O6WxhR3ti+af6OQCc7ONZkJJsR8ogt30EpCrqs2mk
         woiHkmEOA8W3FS+PsePc2ByLa/Cq5oqS0AFQ46p/IrBevJbibu7GM2PG6EjJKUzYp8Gv
         hLj4oLqyFqCmqfogNWNr87gocWHMcY9zjs1jTkWu9wd2//JPHja1t42i8pyKFgowxWNY
         pLiw==
X-Gm-Message-State: AOJu0YzHScF6fwamZbb/uWP/l2JbGasaSg/tu+bQxuq74Aymnx68222x
        nYhzWPRLEDPFdWSMAC3v+pyqk7TYmojzL8H00A==
X-Google-Smtp-Source: AGHT+IHgModR+ZQzG5GYWO5cFEJqbZO8Zz/HWXObhE9KVaBkIDk3FCSw7qbAx/envuhDtjI23LEIRDR/6UkUczA98g==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a81:af0f:0:b0:589:a997:f9ce with SMTP
 id n15-20020a81af0f000000b00589a997f9cemr16711ywh.2.1691632704659; Wed, 09
 Aug 2023 18:58:24 -0700 (PDT)
Date:   Wed,  9 Aug 2023 18:57:45 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-10-almasrymina@google.com>
Subject: [RFC PATCH v2 09/11] tcp: implement recvmsg() RX path for devmem TCP
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In tcp_recvmsg_locked(), detect if the skb being received by the user
is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVMEM
flag - pass it to tcp_recvmsg_devmem() for custom handling.

tcp_recvmsg_devmem() copies any data in the skb header to the linear
buffer, and returns a cmsg to the user indicating the number of bytes
returned in the linear buffer.

tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
and returns to the user a cmsg_devmem indicating the location of the
data in the dmabuf device memory. cmsg_devmem contains this information:

1.  the offset into the dmabuf where the payload starts. 'frag_offset'.
2. the size of the frag. 'frag_size'.
3. an opaque token 'frag_token' to return to the kernel when the buffer
is to be released.

The pages awaiting freeing are stored in the newly added
sk->sk_user_pages, and each page passed to userspace is get_page()'d.
This reference is dropped once the userspace indicates that it is
done reading this page.  All pages are released when the socket is
destroyed.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/socket.h            |   1 +
 include/net/sock.h                |   2 +
 include/uapi/asm-generic/socket.h |   5 +
 include/uapi/linux/uio.h          |   6 +
 net/ipv4/tcp.c                    | 180 +++++++++++++++++++++++++++++-
 net/ipv4/tcp_ipv4.c               |   7 ++
 6 files changed, 196 insertions(+), 5 deletions(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 39b74d83c7c4..102733ae888d 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -326,6 +326,7 @@ struct ucred {
 					  * plain text and require encryption
 					  */
 
+#define MSG_SOCK_DEVMEM 0x2000000	/* Receive devmem skbs as cmsg */
 #define MSG_ZEROCOPY	0x4000000	/* Use user data in kernel path */
 #define MSG_SPLICE_PAGES 0x8000000	/* Splice the pages from the iterator in sendmsg() */
 #define MSG_FASTOPEN	0x20000000	/* Send data in TCP SYN */
diff --git a/include/net/sock.h b/include/net/sock.h
index 2eb916d1ff64..5d2a97001152 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -353,6 +353,7 @@ struct sk_filter;
   *	@sk_txtime_unused: unused txtime flags
   *	@ns_tracker: tracker for netns reference
   *	@sk_bind2_node: bind node in the bhash2 table
+  *	@sk_user_pages: xarray of pages the user is holding a reference on.
   */
 struct sock {
 	/*
@@ -545,6 +546,7 @@ struct sock {
 	struct rcu_head		sk_rcu;
 	netns_tracker		ns_tracker;
 	struct hlist_node	sk_bind2_node;
+	struct xarray		sk_user_pages;
 };
 
 enum sk_pacing {
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index 8ce8a39a1e5f..aacb97f16b78 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,11 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_HEADER	98
+#define SCM_DEVMEM_HEADER	SO_DEVMEM_HEADER
+#define SO_DEVMEM_OFFSET	99
+#define SCM_DEVMEM_OFFSET	SO_DEVMEM_OFFSET
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index 059b1a9147f4..ae94763b1963 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -20,6 +20,12 @@ struct iovec
 	__kernel_size_t iov_len; /* Must be size_t (1003.1g) */
 };
 
+struct cmsg_devmem {
+	__u64 frag_offset;
+	__u32 frag_size;
+	__u32 frag_token;
+};
+
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 53ec616b1fb7..7a5279b61a89 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -461,6 +461,7 @@ void tcp_init_sock(struct sock *sk)
 
 	set_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
 	sk_sockets_allocated_inc(sk);
+	xa_init_flags(&sk->sk_user_pages, XA_FLAGS_ALLOC1);
 }
 EXPORT_SYMBOL(tcp_init_sock);
 
@@ -2306,6 +2307,144 @@ static int tcp_inq_hint(struct sock *sk)
 	return inq;
 }
 
+/* On error, returns the -errno. On success, returns number of bytes sent to the
+ * user. May not consume all of @remaining_len.
+ */
+static int tcp_recvmsg_devmem(const struct sock *sk, const struct sk_buff *skb,
+			      unsigned int offset, struct msghdr *msg,
+			      int remaining_len)
+{
+	struct cmsg_devmem cmsg_devmem = { 0 };
+	unsigned int start;
+	int i, copy, n;
+	int sent = 0;
+	int err = 0;
+
+	do {
+		start = skb_headlen(skb);
+
+		if (!skb_frags_not_readable(skb)) {
+			err = -ENODEV;
+			goto out;
+		}
+
+		/* Copy header. */
+		copy = start - offset;
+		if (copy > 0) {
+			copy = min(copy, remaining_len);
+
+			n = copy_to_iter(skb->data + offset, copy,
+					 &msg->msg_iter);
+			if (n != copy) {
+				err = -EFAULT;
+				goto out;
+			}
+
+			offset += copy;
+			remaining_len -= copy;
+
+			/* First a cmsg_devmem for # bytes copied to user
+			 * buffer.
+			 */
+			memset(&cmsg_devmem, 0, sizeof(cmsg_devmem));
+			cmsg_devmem.frag_size = copy;
+			err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_HEADER,
+				       sizeof(cmsg_devmem), &cmsg_devmem);
+			if (err)
+				goto out;
+
+			sent += copy;
+
+			if (remaining_len == 0)
+				goto out;
+		}
+
+		/* after that, send information of devmem pages through a
+		 * sequence of cmsg
+		 */
+		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
+			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page_pool_iov *ppiov;
+			u64 frag_offset;
+			u32 user_token;
+			int end;
+
+			/* skb_frags_not_readable() should indicate that ALL the
+			 * frags in this skb are unreadable page_pool_iovs.
+			 * We're checking for that flag above, but also check
+			 * individual pages here. If the tcp stack is not
+			 * setting skb->devmem correctly, we still don't want to
+			 * crash here when accessing pgmap or priv below.
+			 */
+			if (!skb_frag_page_pool_iov(frag)) {
+				net_err_ratelimited("Found non-devmem skb with page_pool_iov");
+				err = -ENODEV;
+				goto out;
+			}
+
+			ppiov = skb_frag_page_pool_iov(frag);
+			end = start + skb_frag_size(frag);
+			copy = end - offset;
+
+			if (copy > 0) {
+				copy = min(copy, remaining_len);
+
+				frag_offset = page_pool_iov_virtual_addr(ppiov) +
+					      skb_frag_off(frag) + offset -
+					      start;
+				cmsg_devmem.frag_offset = frag_offset;
+				cmsg_devmem.frag_size = copy;
+				err = xa_alloc((struct xarray *)&sk->sk_user_pages,
+					       &user_token, frag->bv_page,
+					       xa_limit_31b, GFP_KERNEL);
+				if (err)
+					goto out;
+
+				cmsg_devmem.frag_token = user_token;
+
+				offset += copy;
+				remaining_len -= copy;
+
+				err = put_cmsg(msg, SOL_SOCKET,
+					       SO_DEVMEM_OFFSET,
+					       sizeof(cmsg_devmem),
+					       &cmsg_devmem);
+				if (err)
+					goto out;
+
+				page_pool_iov_get_many(ppiov, 1);
+
+				sent += copy;
+
+				if (remaining_len == 0)
+					goto out;
+			}
+			start = end;
+		}
+
+		if (!remaining_len)
+			goto out;
+
+		/* if remaining_len is not satisfied yet, we need to go to the
+		 * next frag in the frag_list to satisfy remaining_len.
+		 */
+		skb = skb_shinfo(skb)->frag_list ?: skb->next;
+
+		offset = offset - start;
+	} while (skb);
+
+	if (remaining_len) {
+		err = -EFAULT;
+		goto out;
+	}
+
+out:
+	if (!sent)
+		sent = err;
+
+	return sent;
+}
+
 /*
  *	This routine copies from a sock struct into the user buffer.
  *
@@ -2318,6 +2457,7 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 			      int flags, struct scm_timestamping_internal *tss,
 			      int *cmsg_flags)
 {
+	bool last_copied_devmem, last_copied_init = false;
 	struct tcp_sock *tp = tcp_sk(sk);
 	int copied = 0;
 	u32 peek_seq;
@@ -2492,15 +2632,45 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 		}
 
 		if (!(flags & MSG_TRUNC)) {
-			err = skb_copy_datagram_msg(skb, offset, msg, used);
-			if (err) {
-				/* Exception. Bailout! */
-				if (!copied)
-					copied = -EFAULT;
+			if (last_copied_init &&
+			    last_copied_devmem != skb->devmem)
 				break;
+
+			if (!skb->devmem) {
+				err = skb_copy_datagram_msg(skb, offset, msg,
+							    used);
+				if (err) {
+					/* Exception. Bailout! */
+					if (!copied)
+						copied = -EFAULT;
+					break;
+				}
+			} else {
+				if (!(flags & MSG_SOCK_DEVMEM)) {
+					/* skb->devmem skbs can only be received
+					 * with the MSG_SOCK_DEVMEM flag.
+					 */
+					if (!copied)
+						copied = -EFAULT;
+
+					break;
+				}
+
+				err = tcp_recvmsg_devmem(sk, skb, offset, msg,
+							 used);
+				if (err <= 0) {
+					if (!copied)
+						copied = -EFAULT;
+
+					break;
+				}
+				used = err;
 			}
 		}
 
+		last_copied_devmem = skb->devmem;
+		last_copied_init = true;
+
 		WRITE_ONCE(*seq, *seq + used);
 		copied += used;
 		len -= used;
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index cecd5a135e64..4472b9357569 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -2295,6 +2295,13 @@ static int tcp_v4_init_sock(struct sock *sk)
 void tcp_v4_destroy_sock(struct sock *sk)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	struct page *page;
+	unsigned long index;
+
+	xa_for_each(&sk->sk_user_pages, index, page)
+		page_pool_page_put_many(page, 1);
+
+	xa_destroy(&sk->sk_user_pages);
 
 	trace_tcp_destroy_sock(sk);
 
-- 
2.41.0.640.ga95def55d0-goog

