Return-Path: <linux-media+bounces-63706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HEl3GeDKIGrd7wAAu9opvQ
	(envelope-from <linux-media+bounces-63706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:46:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C963C192
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JgwjkCY7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63706-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63706-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F08DB30477D6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C1E230BD5;
	Thu,  4 Jun 2026 00:43:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C8200110
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:43:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533790; cv=none; b=p2qox99KaFp24Myqe7Mo+xmaSbw4WQzoHpf+HPbmwomzhJO5gNXIo0HUIS4fQj80d5HbNyxiwN0B2VDqZa9wmymWmu6aIqMKTRriNxAyb2XD5+bTm0gO1YRYEtXjOu/+3g1uhiyZwRPXKO6DqO9QqQe2LSAJSYsIIjdUw/9NXJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533790; c=relaxed/simple;
	bh=u8CLOIiiL03Jn4LaBdDJYWviByZ6A69MVt+eIqh+9w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRu6gjNewkut+7vax+y3uLRBKC96BHY3G/7HgbQNj8419CZvK915APzWRWUJA/GzMhN4jehvjHCBqQcRsm1HYZ1iowtfAabjECD1hMIjkelnNLWHphkCaMga2KIdaCdj3CKZQiX1lG3JsrXVDfs6qjMqQ1q4A15OW5rMi3jh9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgwjkCY7; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so826795ad.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533787; x=1781138587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMXdy1WUN6bY3q1z5SmXOuLnvJqwfrxGDALvO9pXctw=;
        b=JgwjkCY74lytAxhRPp4xJOYqcSotL1GFGMNylRPpfmGVT11CTT6JBz8HTzh+4uKQgg
         +ltcmmIOA6qWfRqVgBFIleqvz0dWKXITzk/rWMPARagQvQz+Sevz5UEcHDEF/+RFCPTz
         sS2yQ1ebSfXlKfX72q9bJ+Pf6/6LCnqyJaC/vQEyg1CBRrdPPFo0JoU5otBTCC6c4RCU
         cWJLFCcpGX18kTcQa5yX01JLT5E0pW1iyc1SoG2zvbrqQiLmgO+hXFk5DypcO70meLmb
         sgfqis005YOBcQl0zd7HT+FclgrAmCJ9Wf5xYh96A0bFJS39tfiLbGU5FmcOMTnOZI6j
         Tf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533787; x=1781138587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DMXdy1WUN6bY3q1z5SmXOuLnvJqwfrxGDALvO9pXctw=;
        b=NDpJoxfQu4HmbaT1bSnPRG6GgWAviamlk/rObaMg5TbNy+onKuOEGNmAO8KmbIeamt
         11CUdDrnbJm2quIJ8dgT3RFqNEigK/Qi6UzlqsiCYokdnv8BXnM8Fy9GIwTZIbOYU1u3
         cRikEVAAh8vMiPkhwLPU1pGDWDxluezv5li3O6PSXYiHQnjnb0BB6+4LIM6+tvuwrKSW
         9H8vy9t/Ds4IQd/BryA89hYKdeNlAjg5oc55qbtR6gbQAxqf4KfFzdl05S2853Zt2gpV
         0W9LwPpUkmKfwfSzfM4qY0BlPOPKDEkbcGjC4tFtaXp3Xq+kOrHBd7F5xgSpxYR1zOYp
         i2GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mafaBQeMZHHxsRHudFz9Y/Xhh4nPU/zyMe1f24ues8vEe/9WPjtQRDOhCbtrTRiRcjQ9hiJje+k6/kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvX2RyiiYOhmwqJF+KGZu6EtzmWa1KXJ7LVVXjbjutJKHlmQwb
	HtlkZXf7HLu4oYCYaDP/v0RRn5qKXK7PWje8ptk+qpi+7bythnbxCIFm
X-Gm-Gg: Acq92OFKx4ZabCN451PLvJWEugFL5YW9mhucvUrDRpiUacPur1mzFZp3vgAAN+tpbmO
	Gb90PE5NBcw+AUi2tZ601B0AGbJrGMqhnvNTDk+z/BpjlQAfiyFNaFACQ/EGLR0MfZD9qcMWnBH
	7lxWhylda2rr8V2wP5aABQIyytJiSIds2x2xkLiQyNKPoe3iTYZm24iE9CCW7j8sj0Q/4km1Vn7
	6XC9wZDfMz+wpEqtVhOUeJzVAvEezL3n1ySFB615xr1+yu8cU2pnDWB9Mx2dKEAl3XmdPd5whFG
	+eFc0+02C5NzWZCfhcOfRnDV3pRkDRAXHhpBtmRV1FRK9ShHJAYfaiDCNekqNnY3XZ8vseYdHU8
	XxPAAYlKWVHSBp0Xm9jobN/LqzSRnwudbSX5mW0dJCxkUsN+rFBFDczob9SMgL81EUJMsh+dacy
	ywOwwBmRXN1aLTWmORwNZqnKNRTt+/mA==
X-Received: by 2002:a17:903:2a8b:b0:2c1:1685:b8f with SMTP id d9443c01a7336-2c163a10116mr71998895ad.9.1780533787168;
        Wed, 03 Jun 2026 17:43:07 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:55::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d2bbsm38725645ad.1.2026.06.03.17.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:43:06 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 03 Jun 2026 17:42:58 -0700
Subject: [PATCH net-next 1/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per dmabuf binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
In-Reply-To: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63706-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B43C963C192

From: Bobby Eshleman <bobbyeshleman@meta.com>

Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
churn for large flows.

Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
lets userspace request a larger niov size. The value must be a power of
two >= PAGE_SIZE.

Measurements
------------
Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
dctcp, num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov
size, mlx5.

CPU Util:

   niov        net sirq %        net idle %         app sys %        app idle %
  -----  ----------------  ----------------  ----------------  ----------------
     4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/- 10.53
    16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-  9.24
    32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-  3.65
    64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-  3.27

RX app sys % drops ~19% from 4K to 64K.

Throughput:

   niov       RX dev Gbps   RX flow avg Gbps
  -----  ----------------  -----------------
     4K  300.63 +/- 53.21    75.16 +/- 13.30
    16K  321.35 +/- 28.20    80.34 +/-  7.05
    32K  347.63 +/-  2.20    86.91 +/-  0.55
    64K  332.11 +/- 14.26    83.03 +/-  3.56

Throughput seems to increase, but the stdev is pretty wide so could just
be noise.

kperf support (not yet merged):
https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 Documentation/netlink/specs/netdev.yaml |  8 +++++
 include/uapi/linux/netdev.h             |  1 +
 net/core/devmem.c                       | 52 +++++++++++++++++++--------------
 net/core/devmem.h                       | 13 ++++++---
 net/core/netdev-genl-gen.c              |  5 ++--
 net/core/netdev-genl.c                  | 18 ++++++++++--
 tools/include/uapi/linux/netdev.h       |  1 +
 7 files changed, 68 insertions(+), 30 deletions(-)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index a1f4c5a561e9..063119907983 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -591,6 +591,13 @@ attribute-sets:
         type: u32
         checks:
           min: 1
+      -
+        name: rx-buf-size
+        doc: |
+          Size in bytes of each RX buffer the NIC writes into from the bound
+          dmabuf. Must be a power of two and >= PAGE_SIZE; defaults to
+          PAGE_SIZE.
+        type: u32
 
 operations:
   list:
@@ -805,6 +812,7 @@ operations:
             - ifindex
             - fd
             - queues
+            - rx-buf-size
         reply:
           attributes:
             - id
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 7df1056a35fd..180a4ffffd60 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -217,6 +217,7 @@ enum {
 	NETDEV_A_DMABUF_QUEUES,
 	NETDEV_A_DMABUF_FD,
 	NETDEV_A_DMABUF_ID,
+	NETDEV_A_DMABUF_RX_BUF_SIZE,
 
 	__NETDEV_A_DMABUF_MAX,
 	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 957d6b96216b..5a1c0d7984a8 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -46,7 +46,7 @@ static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
 
 	owner = net_devmem_iov_to_chunk_owner(niov);
 	return owner->base_dma_addr +
-	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
+	       ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shift);
 }
 
 static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
@@ -93,13 +93,14 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	ssize_t offset;
 	ssize_t index;
 
-	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool,
+					1UL << binding->niov_shift,
 					(void **)&owner);
 	if (!dma_addr)
 		return NULL;
 
 	offset = dma_addr - owner->base_dma_addr;
-	index = offset / PAGE_SIZE;
+	index = offset >> binding->niov_shift;
 	niov = &owner->area.niovs[index];
 
 	niov->desc.pp_magic = 0;
@@ -113,12 +114,13 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
 {
 	struct net_devmem_dmabuf_binding *binding = net_devmem_iov_binding(niov);
 	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
+	size_t niov_size = 1UL << binding->niov_shift;
 
 	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
-				       PAGE_SIZE)))
+				       niov_size)))
 		return;
 
-	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+	gen_pool_free(binding->chunk_pool, dma_addr, niov_size);
 }
 
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
@@ -163,6 +165,9 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 	u32 xa_idx;
 	int err;
 
+	if (binding->niov_shift != PAGE_SHIFT)
+		mp_params.rx_page_size = 1U << binding->niov_shift;
+
 	err = netif_mp_open_rxq(dev, rxq_idx, &mp_params, extack);
 	if (err)
 		return err;
@@ -184,14 +189,16 @@ struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
-		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
+		       unsigned int dmabuf_fd, unsigned int niov_shift,
+		       struct netdev_nl_sock *priv,
 		       struct netlink_ext_ack *extack)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	size_t niov_size = 1UL << niov_shift;
 	static u32 id_alloc_next;
+	unsigned int sg_idx, i;
 	struct scatterlist *sg;
 	struct dma_buf *dmabuf;
-	unsigned int sg_idx, i;
 	unsigned long virtual;
 	int err;
 
@@ -213,6 +220,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 
 	binding->dev = dev;
 	binding->vdev = vdev;
+	binding->niov_shift = niov_shift;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -248,18 +256,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			goto err_unmap;
 		}
 		binding->tx_vec = kvmalloc_objs(struct net_iov *,
-						dmabuf->size / PAGE_SIZE);
+						dmabuf->size >> niov_shift);
 		if (!binding->tx_vec) {
 			err = -ENOMEM;
 			goto err_unmap;
 		}
 	}
 
-	/* For simplicity we expect to make PAGE_SIZE allocations, but the
-	 * binding can be much more flexible than that. We may be able to
-	 * allocate MTU sized chunks here. Leave that for future work...
-	 */
-	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
+	binding->chunk_pool = gen_pool_create(niov_shift,
 					      dev_to_node(&dev->dev));
 	if (!binding->chunk_pool) {
 		err = -ENOMEM;
@@ -273,9 +277,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		size_t len = sg_dma_len(sg);
 		struct net_iov *niov;
 
-		if (!IS_ALIGNED(len, PAGE_SIZE)) {
+		if (!IS_ALIGNED(dma_addr, niov_size) ||
+		    !IS_ALIGNED(len, niov_size)) {
 			err = -EINVAL;
-			NL_SET_ERR_MSG(extack, "dma-buf SG length must be PAGE_SIZE aligned");
+			NL_SET_ERR_MSG(extack,
+				       "dmabuf sg entry not aligned to niov size");
 			goto err_free_chunks;
 		}
 
@@ -288,7 +294,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 
 		owner->area.base_virtual = virtual;
 		owner->base_dma_addr = dma_addr;
-		owner->area.num_niovs = len / PAGE_SIZE;
+		owner->area.num_niovs = len >> niov_shift;
 		owner->binding = binding;
 
 		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
@@ -313,7 +319,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      net_devmem_get_dma_addr(niov));
 			if (direction == DMA_TO_DEVICE)
-				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
+				binding->tx_vec[(owner->area.base_virtual >> niov_shift) + i] = niov;
 		}
 
 		virtual += len;
@@ -430,13 +436,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
@@ -454,8 +462,8 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
 	pool->dma_sync = false;
 	pool->dma_sync_for_cpu = false;
 
-	if (pool->p.order != 0)
-		return -E2BIG;
+	if (pool->p.order != binding->niov_shift - PAGE_SHIFT)
+		return -EINVAL;
 
 	net_devmem_dmabuf_binding_get(binding);
 	return 0;
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 3852a56036cb..4a293a7d1149 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -71,6 +71,8 @@ struct net_devmem_dmabuf_binding {
 	 */
 	struct net_iov **tx_vec;
 
+	unsigned int niov_shift;
+
 	struct work_struct unbind_w;
 };
 
@@ -93,7 +95,8 @@ struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
-		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
+		       unsigned int dmabuf_fd, unsigned int niov_shift,
+		       struct netdev_nl_sock *priv,
 		       struct netlink_ext_ack *extack);
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
@@ -122,10 +125,11 @@ static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
 
 static inline unsigned long net_iov_virtual_addr(const struct net_iov *niov)
 {
-	struct net_iov_area *owner = net_iov_owner(niov);
+	struct dmabuf_genpool_chunk_owner *co =
+		net_devmem_iov_to_chunk_owner(niov);
 
-	return owner->base_virtual +
-	       ((unsigned long)net_iov_idx(niov) << PAGE_SHIFT);
+	return net_iov_owner(niov)->base_virtual +
+	       ((unsigned long)net_iov_idx(niov) << co->binding->niov_shift);
 }
 
 static inline bool
@@ -175,6 +179,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd,
+		       unsigned int niov_shift,
 		       struct netdev_nl_sock *priv,
 		       struct netlink_ext_ack *extack)
 {
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index c7e138bfe345..55e03b9cd227 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -106,10 +106,11 @@ static const struct nla_policy netdev_qstats_get_nl_policy[NETDEV_A_QSTATS_SCOPE
 };
 
 /* NETDEV_CMD_BIND_RX - do */
-static const struct nla_policy netdev_bind_rx_nl_policy[NETDEV_A_DMABUF_FD + 1] = {
+static const struct nla_policy netdev_bind_rx_nl_policy[NETDEV_A_DMABUF_RX_BUF_SIZE + 1] = {
 	[NETDEV_A_DMABUF_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
 	[NETDEV_A_DMABUF_FD] = { .type = NLA_U32, },
 	[NETDEV_A_DMABUF_QUEUES] = NLA_POLICY_NESTED(netdev_queue_id_nl_policy),
+	[NETDEV_A_DMABUF_RX_BUF_SIZE] = { .type = NLA_U32, },
 };
 
 /* NETDEV_CMD_NAPI_SET - do */
@@ -219,7 +220,7 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.cmd		= NETDEV_CMD_BIND_RX,
 		.doit		= netdev_nl_bind_rx_doit,
 		.policy		= netdev_bind_rx_nl_policy,
-		.maxattr	= NETDEV_A_DMABUF_FD,
+		.maxattr	= NETDEV_A_DMABUF_RX_BUF_SIZE,
 		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
 	},
 	{
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index b4d48f3672a5..9902a97698f5 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1012,6 +1012,7 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
 	u32 ifindex, dmabuf_fd, rxq_idx;
+	unsigned int niov_shift = PAGE_SHIFT;
 	struct netdev_nl_sock *priv;
 	struct net_device *netdev;
 	unsigned long *rxq_bitmap;
@@ -1028,6 +1029,18 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	ifindex = nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
 	dmabuf_fd = nla_get_u32(info->attrs[NETDEV_A_DMABUF_FD]);
 
+	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
+		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
+
+		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
+		    rx_buf_size < PAGE_SIZE) {
+			NL_SET_ERR_MSG(info->extack,
+				       "rx_buf_size must be a power of 2 >= PAGE_SIZE");
+			return -EINVAL;
+		}
+		niov_shift = ilog2(rx_buf_size);
+	}
+
 	priv = genl_sk_priv_get(&netdev_nl_family, NETLINK_CB(skb).sk);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
@@ -1078,7 +1091,8 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	binding = net_devmem_bind_dmabuf(netdev, NULL, dma_dev, DMA_FROM_DEVICE,
-					 dmabuf_fd, priv, info->extack);
+					 dmabuf_fd, niov_shift, priv,
+					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
@@ -1221,7 +1235,7 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 	binding = net_devmem_bind_dmabuf(bind_dev,
 					 bind_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 priv, info->extack);
+					 PAGE_SHIFT, priv, info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_unlock_bind_dev;
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 7df1056a35fd..180a4ffffd60 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -217,6 +217,7 @@ enum {
 	NETDEV_A_DMABUF_QUEUES,
 	NETDEV_A_DMABUF_FD,
 	NETDEV_A_DMABUF_ID,
+	NETDEV_A_DMABUF_RX_BUF_SIZE,
 
 	__NETDEV_A_DMABUF_MAX,
 	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)

-- 
2.53.0-Meta


