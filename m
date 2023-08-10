Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4D08776DB1
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 03:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjHJB6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 21:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjHJB6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 21:58:06 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CF4C6
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 18:58:05 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-569e7aec37bso6483827b3.2
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691632684; x=1692237484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uM+hS5/EwM+ftlRN/2ZTbt0K7QdpYanXtJwBomb2UwQ=;
        b=uLaYCy++pxdUFVOxUPoNhYFoqnLRzBWPTl0JkxFlt1NmakDcC5JiSl2Wqx0xDBMMq9
         wzBhxLV0g9+a4hf1u+bjjDJs+3nRk9E6clx9JJe03viTH3YjudD9DoaTGpuDnen1fIJy
         F3vOsJ8gr0zJNKizjCVwlI8hEmkJvG25QOIMAF+1kQC5BxohRIPNOtlhdpQdog7mKXj/
         1Tv72/LBk1ohqLGl1XnLlnE/npZMqQ3HoFGyUKDQ0KS5YDiGtKFZKwn7wxtMUw+w1Bpr
         mL8aj/ayNt7XeCEGjRBRUjdDcqJNAyvPtnJriesTCc9+oANHLfQNDWtCZaakCyNTvPl8
         PJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691632684; x=1692237484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uM+hS5/EwM+ftlRN/2ZTbt0K7QdpYanXtJwBomb2UwQ=;
        b=YqsbcRO62U3Dpb0/0Dtg62Q+wEpXghHzjcSB3ODe1IGyNx26YxHJ9VxL3MLu8dPY57
         9JuTlw4eQDc0n+APCQZG6ZeCaKHOAKQQZzxbUCnfbh1TMh84b2KQVkoVuReX6fHwx0d2
         N0tdNBeZEd0SSmtnQ321wrL0I/20j464ujJHJGipzmzTvOzl2P15ILV6bneAY1Chrms/
         isRG8+mPNdJWQ/WPyIHb0ZwBgr7DqCdifnZ6F6lN01eFOb3dK+ZmB2fq7AO7m9a9bNg4
         /VtrZ/6Zi5PLW4GC6EhLwFFEqCvq/hBmmk3mmInO1czd5IiKDIr+jozTTQDEumwhDhB0
         qoZQ==
X-Gm-Message-State: AOJu0YwMyVWSBctXKBrzuRQ1nWHwSaLbw84F0CIM4CZJHdcWjTB5NztS
        dAAqrfRjMaFrT6E++vNSvy8zJK/g+0Z2wbZMcQ==
X-Google-Smtp-Source: AGHT+IGIxKBB6I4szoZJIiPeLKyVUhfSqsHd8uAIGcFZ4ivEnT5WdLA6J2u1z8MX07aU+fdA7H4yZcQ1kx0cgMI58A==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a81:ac62:0:b0:576:fdbe:76b2 with SMTP
 id z34-20020a81ac62000000b00576fdbe76b2mr16690ywj.3.1691632684693; Wed, 09
 Aug 2023 18:58:04 -0700 (PDT)
Date:   Wed,  9 Aug 2023 18:57:38 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-3-almasrymina@google.com>
Subject: [RFC PATCH v2 02/11] netdev: implement netlink api to bind dma-buf to netdevice
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

Add a netdev_dmabuf_binding struct which represents the
dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
an rx queue on the netdevice. On the binding, the dma_buf_attach
& dma_buf_map_attachment will occur. The entries in the sg_table from
mapping will be inserted into a genpool to make it ready
for allocation.

The chunks in the genpool are owned by a dmabuf_chunk_owner struct which
holds the dma-buf offset of the base of the chunk and the dma_addr of
the chunk. Both are needed to use allocations that come from this chunk.

We create a new type that represents an allocation from the genpool:
page_pool_iov. We setup the page_pool_iov allocation size in the
genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
allocated by the page pool and given to the drivers.

The user can unbind the dmabuf from the netdevice by closing the netlink
socket that established the binding. We do this so that the binding is
automatically unbound even if the userspace process crashes.

The binding and unbinding leaves an indicator in struct netdev_rx_queue
that the given queue is bound, but the binding doesn't take effect until
the driver actually reconfigures its queues, and re-initializes its page
pool. This issue/weirdness is highlighted in the memory provider
proposal[1], and I'm hoping that some generic solution for all
memory providers will be discussed; this patch doesn't address that
weirdness again.

The netdev_dmabuf_binding struct is refcounted, and releases its
resources only when all the refs are released.

[1] https://lore.kernel.org/netdev/20230707183935.997267-1-kuba@kernel.org/

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/netdevice.h |  57 ++++++++++++
 include/net/page_pool.h   |  27 ++++++
 net/core/dev.c            | 178 ++++++++++++++++++++++++++++++++++++++
 net/core/netdev-genl.c    | 101 ++++++++++++++++++++-
 4 files changed, 361 insertions(+), 2 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 3800d0479698..1b7c5966d2ca 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -53,6 +53,8 @@
 #include <net/net_trackers.h>
 #include <net/net_debug.h>
 #include <net/dropreason-core.h>
+#include <linux/xarray.h>
+#include <linux/refcount.h>

 struct netpoll_info;
 struct device;
@@ -782,6 +784,55 @@ bool rps_may_expire_flow(struct net_device *dev, u16 rxq_index, u32 flow_id,
 #endif
 #endif /* CONFIG_RPS */

+struct netdev_dmabuf_binding {
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *attachment;
+	struct sg_table *sgt;
+	struct net_device *dev;
+	struct gen_pool *chunk_pool;
+
+	/* The user holds a ref (via the netlink API) for as long as they want
+	 * the binding to remain alive. Each page pool using this binding holds
+	 * a ref to keep the binding alive. Each allocated page_pool_iov holds a
+	 * ref.
+	 *
+	 * The binding undos itself and unmaps the underlying dmabuf once all
+	 * those refs are dropped and the binding is no longer desired or in
+	 * use.
+	 */
+	refcount_t ref;
+
+	/* The portid of the user that owns this binding. Used for netlink to
+	 * notify us of the user dropping the bind.
+	 */
+	u32 owner_nlportid;
+
+	/* The list of bindings currently active. Used for netlink to notify us
+	 * of the user dropping the bind.
+	 */
+	struct list_head list;
+
+	/* rxq's this binding is active on. */
+	struct xarray bound_rxq_list;
+};
+
+void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding);
+
+static inline void
+netdev_devmem_binding_get(struct netdev_dmabuf_binding *binding)
+{
+	refcount_inc(&binding->ref);
+}
+
+static inline void
+netdev_devmem_binding_put(struct netdev_dmabuf_binding *binding)
+{
+	if (!refcount_dec_and_test(&binding->ref))
+		return;
+
+	__netdev_devmem_binding_free(binding);
+}
+
 /* This structure contains an instance of an RX queue. */
 struct netdev_rx_queue {
 	struct xdp_rxq_info		xdp_rxq;
@@ -796,6 +847,7 @@ struct netdev_rx_queue {
 #ifdef CONFIG_XDP_SOCKETS
 	struct xsk_buff_pool            *pool;
 #endif
+	struct netdev_dmabuf_binding	*binding;
 } ____cacheline_aligned_in_smp;

 /*
@@ -5026,6 +5078,11 @@ void netif_set_tso_max_segs(struct net_device *dev, unsigned int segs);
 void netif_inherit_tso_max(struct net_device *to,
 			   const struct net_device *from);

+void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding);
+int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
+				u32 rxq_idx,
+				struct netdev_dmabuf_binding **out);
+
 static inline bool netif_is_macsec(const struct net_device *dev)
 {
 	return dev->priv_flags & IFF_MACSEC;
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 364fe6924258..61b2066d32b5 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -170,6 +170,33 @@ extern const struct pp_memory_provider_ops hugesp_ops;
 extern const struct pp_memory_provider_ops huge_ops;
 extern const struct pp_memory_provider_ops huge_1g_ops;

+/* page_pool_iov support */
+
+/* Owner of the dma-buf chunks inserted into the gen pool. Each scatterlist
+ * entry from the dmabuf is inserted into the genpool as a chunk, and needs
+ * this owner struct to keep track of some metadata necessary to create
+ * allocations from this chunk.
+ */
+struct dmabuf_genpool_chunk_owner {
+	/* Offset into the dma-buf where this chunk starts.  */
+	unsigned long base_virtual;
+
+	/* dma_addr of the start of the chunk.  */
+	dma_addr_t base_dma_addr;
+
+	/* Array of page_pool_iovs for this chunk. */
+	struct page_pool_iov *ppiovs;
+	size_t num_ppiovs;
+
+	struct netdev_dmabuf_binding *binding;
+};
+
+struct page_pool_iov {
+	struct dmabuf_genpool_chunk_owner *owner;
+
+	refcount_t refcount;
+};
+
 struct page_pool {
 	struct page_pool_params p;

diff --git a/net/core/dev.c b/net/core/dev.c
index 8e7d0cb540cd..02a25ccf771a 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -151,6 +151,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/prandom.h>
 #include <linux/once_lite.h>
+#include <linux/genalloc.h>
+#include <linux/dma-buf.h>

 #include "dev.h"
 #include "net-sysfs.h"
@@ -2037,6 +2039,182 @@ static int call_netdevice_notifiers_mtu(unsigned long val,
 	return call_netdevice_notifiers_info(val, &info.info);
 }

+/* Device memory support */
+
+static void netdev_devmem_free_chunk_owner(struct gen_pool *genpool,
+					   struct gen_pool_chunk *chunk,
+					   void *not_used)
+{
+	struct dmabuf_genpool_chunk_owner *owner = chunk->owner;
+
+	kvfree(owner->ppiovs);
+	kfree(owner);
+}
+
+void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
+{
+	size_t size, avail;
+
+	gen_pool_for_each_chunk(binding->chunk_pool,
+				netdev_devmem_free_chunk_owner, NULL);
+
+	size = gen_pool_size(binding->chunk_pool);
+	avail = gen_pool_avail(binding->chunk_pool);
+
+	if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
+		  size, avail))
+		gen_pool_destroy(binding->chunk_pool);
+
+	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
+				 DMA_BIDIRECTIONAL);
+	dma_buf_detach(binding->dmabuf, binding->attachment);
+	dma_buf_put(binding->dmabuf);
+	kfree(binding);
+}
+
+void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding)
+{
+	struct netdev_rx_queue *rxq;
+	unsigned long xa_idx;
+
+	list_del_rcu(&binding->list);
+
+	xa_for_each(&binding->bound_rxq_list, xa_idx, rxq)
+		if (rxq->binding == binding)
+			rxq->binding = NULL;
+
+	netdev_devmem_binding_put(binding);
+}
+
+int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
+				u32 rxq_idx, struct netdev_dmabuf_binding **out)
+{
+	struct netdev_dmabuf_binding *binding;
+	struct netdev_rx_queue *rxq;
+	struct scatterlist *sg;
+	struct dma_buf *dmabuf;
+	unsigned int sg_idx, i;
+	unsigned long virtual;
+	u32 xa_idx;
+	int err;
+
+	rxq = __netif_get_rx_queue(dev, rxq_idx);
+
+	if (rxq->binding)
+		return -EEXIST;
+
+	dmabuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR_OR_NULL(dmabuf))
+		return -EBADFD;
+
+	binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
+			       dev_to_node(&dev->dev));
+	if (!binding) {
+		err = -ENOMEM;
+		goto err_put_dmabuf;
+	}
+
+	xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
+
+	refcount_set(&binding->ref, 1);
+
+	binding->dmabuf = dmabuf;
+
+	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
+	if (IS_ERR(binding->attachment)) {
+		err = PTR_ERR(binding->attachment);
+		goto err_free_binding;
+	}
+
+	binding->sgt = dma_buf_map_attachment(binding->attachment,
+					      DMA_BIDIRECTIONAL);
+	if (IS_ERR(binding->sgt)) {
+		err = PTR_ERR(binding->sgt);
+		goto err_detach;
+	}
+
+	/* For simplicity we expect to make PAGE_SIZE allocations, but the
+	 * binding can be much more flexible than that. We may be able to
+	 * allocate MTU sized chunks here. Leave that for future work...
+	 */
+	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
+					      dev_to_node(&dev->dev));
+	if (!binding->chunk_pool) {
+		err = -ENOMEM;
+		goto err_unmap;
+	}
+
+	virtual = 0;
+	for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
+		dma_addr_t dma_addr = sg_dma_address(sg);
+		struct dmabuf_genpool_chunk_owner *owner;
+		size_t len = sg_dma_len(sg);
+		struct page_pool_iov *ppiov;
+
+		owner = kzalloc_node(sizeof(*owner), GFP_KERNEL,
+				     dev_to_node(&dev->dev));
+		owner->base_virtual = virtual;
+		owner->base_dma_addr = dma_addr;
+		owner->num_ppiovs = len / PAGE_SIZE;
+		owner->binding = binding;
+
+		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
+					 dma_addr, len, dev_to_node(&dev->dev),
+					 owner);
+		if (err) {
+			err = -EINVAL;
+			goto err_free_chunks;
+		}
+
+		owner->ppiovs = kvmalloc_array(owner->num_ppiovs,
+					       sizeof(*owner->ppiovs),
+					       GFP_KERNEL);
+		if (!owner->ppiovs) {
+			err = -ENOMEM;
+			goto err_free_chunks;
+		}
+
+		for (i = 0; i < owner->num_ppiovs; i++) {
+			ppiov = &owner->ppiovs[i];
+			ppiov->owner = owner;
+			refcount_set(&ppiov->refcount, 1);
+		}
+
+		dma_addr += len;
+		virtual += len;
+	}
+
+	/* TODO: need to be able to bind to multiple rx queues on the same
+	 * netdevice. The code should already be able to handle that with
+	 * minimal changes, but the netlink API currently allows for 1 rx
+	 * queue.
+	 */
+	err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
+		       GFP_KERNEL);
+	if (err)
+		goto err_free_chunks;
+
+	rxq->binding = binding;
+	*out = binding;
+
+	return 0;
+
+err_free_chunks:
+	gen_pool_for_each_chunk(binding->chunk_pool,
+				netdev_devmem_free_chunk_owner, NULL);
+	gen_pool_destroy(binding->chunk_pool);
+err_unmap:
+	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
+				 DMA_BIDIRECTIONAL);
+err_detach:
+	dma_buf_detach(dmabuf, binding->attachment);
+err_free_binding:
+	kfree(binding);
+err_put_dmabuf:
+	dma_buf_put(dmabuf);
+	return err;
+}
+
 #ifdef CONFIG_NET_INGRESS
 static DEFINE_STATIC_KEY_FALSE(ingress_needed_key);

diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index bf7324dd6c36..288ed0112995 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -141,10 +141,74 @@ int netdev_nl_dev_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len;
 }

-/* Stub */
+static LIST_HEAD(netdev_rbinding_list);
+
 int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 {
-	return 0;
+	struct netdev_dmabuf_binding *out_binding;
+	u32 ifindex, dmabuf_fd, rxq_idx;
+	struct net_device *netdev;
+	struct sk_buff *rsp;
+	int err = 0;
+	void *hdr;
+
+	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_DEV_IFINDEX) ||
+	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_BIND_DMABUF_DMABUF_FD) ||
+	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_BIND_DMABUF_QUEUE_IDX))
+		return -EINVAL;
+
+	ifindex = nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
+	dmabuf_fd = nla_get_u32(info->attrs[NETDEV_A_BIND_DMABUF_DMABUF_FD]);
+	rxq_idx = nla_get_u32(info->attrs[NETDEV_A_BIND_DMABUF_QUEUE_IDX]);
+
+	rtnl_lock();
+
+	netdev = __dev_get_by_index(genl_info_net(info), ifindex);
+	if (!netdev) {
+		err = -ENODEV;
+		goto err_unlock;
+	}
+
+	if (rxq_idx >= netdev->num_rx_queues) {
+		err = -ERANGE;
+		goto err_unlock;
+	}
+
+	if (netdev_bind_dmabuf_to_queue(netdev, dmabuf_fd, rxq_idx,
+					&out_binding)) {
+		err = -EINVAL;
+		goto err_unlock;
+	}
+
+	out_binding->owner_nlportid = info->snd_portid;
+	list_add_rcu(&out_binding->list, &netdev_rbinding_list);
+
+	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!rsp) {
+		err = -ENOMEM;
+		goto err_unbind;
+	}
+
+	hdr = genlmsg_put(rsp, info->snd_portid, info->snd_seq,
+			  &netdev_nl_family, 0, info->genlhdr->cmd);
+	if (!hdr) {
+		err = -EMSGSIZE;
+		goto err_genlmsg_free;
+	}
+
+	genlmsg_end(rsp, hdr);
+
+	rtnl_unlock();
+
+	return genlmsg_reply(rsp, info);
+
+err_genlmsg_free:
+	nlmsg_free(rsp);
+err_unbind:
+	netdev_unbind_dmabuf_to_queue(out_binding);
+err_unlock:
+	rtnl_unlock();
+	return err;
 }

 static int netdev_genl_netdevice_event(struct notifier_block *nb,
@@ -167,10 +231,37 @@ static int netdev_genl_netdevice_event(struct notifier_block *nb,
 	return NOTIFY_OK;
 }

+static int netdev_netlink_notify(struct notifier_block *nb, unsigned long state,
+				 void *_notify)
+{
+	struct netlink_notify *notify = _notify;
+	struct netdev_dmabuf_binding *rbinding;
+
+	if (state != NETLINK_URELEASE || notify->protocol != NETLINK_GENERIC)
+		return NOTIFY_DONE;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(rbinding, &netdev_rbinding_list, list) {
+		if (rbinding->owner_nlportid == notify->portid) {
+			netdev_unbind_dmabuf_to_queue(rbinding);
+			break;
+		}
+	}
+
+	rcu_read_unlock();
+
+	return NOTIFY_OK;
+}
+
 static struct notifier_block netdev_genl_nb = {
 	.notifier_call	= netdev_genl_netdevice_event,
 };

+static struct notifier_block netdev_netlink_notifier = {
+	.notifier_call = netdev_netlink_notify,
+};
+
 static int __init netdev_genl_init(void)
 {
 	int err;
@@ -183,8 +274,14 @@ static int __init netdev_genl_init(void)
 	if (err)
 		goto err_unreg_ntf;

+	err = netlink_register_notifier(&netdev_netlink_notifier);
+	if (err)
+		goto err_unreg_family;
+
 	return 0;

+err_unreg_family:
+	genl_unregister_family(&netdev_nl_family);
 err_unreg_ntf:
 	unregister_netdevice_notifier(&netdev_genl_nb);
 	return err;
--
2.41.0.640.ga95def55d0-goog
