Return-Path: <linux-media+bounces-67079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z8DEN3vVTmpNVAIAu9opvQ
	(envelope-from <linux-media+bounces-67079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:55:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE872AFE0
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p2zaO8NY;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67079-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67079-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D337230230F3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 22:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ED33A7858;
	Wed,  8 Jul 2026 22:55:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04505399350
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 22:55:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551319; cv=none; b=QVWW/XbwjQvQlduiyo10xGDH4FDPqqOu8zyeQuL9ZXHptto/kVELUuMwkgFSV3vVbad9Ir1chvZL6o12W05p7H7Ck9xn3y959f+1gL7Uxz/wdx0ELDkOHDXD9ORq1aHV5SCD9Ba1lUyqfkDwVaFGdbZsVPGI1/jX3lKvZzZ2jHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551319; c=relaxed/simple;
	bh=FrC7zCfTnt4aYtmAC3U3F1RLBcRWxdQYMWPNA03sMUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqG6UQyN2JlTPlA9b1K+jRqQ8+Q/tFzvtrMa/v+bFGMbivHFtPAHx+YVuh+oKtmofNKPESIDYB1Fg+qZtGBHIalhqLhfcOKVQE2Fdh+ot29RtxevUZAQs5T0X5M1Ol7Q6INnfHIz+kxYmLrzFYPPISQR7RroxLt+RZMOxjb3Cis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2zaO8NY; arc=none smtp.client-ip=209.85.161.41
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a378f187bbso216835eaf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551316; x=1784156116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umzZlIHXZ1jPPJhn3H23UP6gJCBYR8cxewnv3zVIeDg=;
        b=p2zaO8NYLZKG2PdH5AxXkvudKMpETXmWOd/PUpXay0KiIiNQHfClFQ/hMfm97NLffw
         IVlkXOa7IcFf8jWOm3kAXBS8/rdCrDt3hTiD0G2dqJ6Okrn1dOBUV279gWJ/dl9uLP3s
         h2xEU3FGpU3fII2itxMGmmXnk8IOFGHyapCvs2jltpZiaWS5iYdm30jWIvFzU2+UHvXh
         EUKYRS56CkAAugBos5cEnhQRgQo68ATd3oYvnb7PdpOJCXxcK+m36WdLYSlOXkuw+6jy
         3b3UBwW30cTskUQcx/aR6HUnrKgAsO9+sJXTvxwTcd6aqdHcvlyaVzqo7thXjpkzk6GD
         tRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551316; x=1784156116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umzZlIHXZ1jPPJhn3H23UP6gJCBYR8cxewnv3zVIeDg=;
        b=lCiCF9v20Oh1dMtBpXEo9qtZ/33DfMBfJb/yEIV1xjIjxsfs9t+GHYGQSD+NLIH7CZ
         oHueWvTig1lTWEYjZlmVC7B6sJ7v1NrpbQbq8TatOOygUezuR0xsAKS1mCzk5ihAsvjE
         tlpRg1faZJOobNEblDxlSC/rQIPbi/nbfMz2fsy4voMhzWnTlX8KVn+BZ7Nb8z1E77vf
         XOW8AFY41YyzggxAj51mlTThKZnzJAcZmmGWJ3ln/IXs7In3mX6vV+mOSw7tv5oWc5lj
         dIdqPDzWbXW+AFlZ6Gd+YlgnJVR0C3yvuJ9MbUb8sKAuVipXAmcNBklPtm0sPokntJqW
         uT6g==
X-Forwarded-Encrypted: i=1; AFNElJ/CbKmY0AxHIW6oL0yr/ai8MB1qb4DT0rxncdrjzUAiVioh4qG+fzz5DE62O2NQibLGUS+WB2TIJ/H0WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXwgDbmTqDjTtYNpRwIXroCJlrWYAOPIowmyAKj3+7wbYHFU8
	JhJCqwk/Zf4UlZdrv3Lvi+NynR+fxPDT/lH2NQpZVw3b4A4XKW1yqb950EyqJslN
X-Gm-Gg: AfdE7cljWw9JCYstltF9nQFRkw3IjFzbjHy+r515wKWXwX//4fND0+P/iKEXNLSwWuj
	Pd1s+kZWuR9N/+K8az0gGW49Ir+RFATnCFmEbVGrqKE2Rkt8WMK1psr/LgFBl+QneCgLGMHtPv6
	dCpRdcRK1OWnTdZLaZxoDDl8gTZJnKT+9DyGX+XrwYhC/tw8WU1qorzOR8V/7GXVtMEYTl91i7F
	//N1K1UsrW/UU0fD2xNrjOpG3T9ztPdDH/SFUGvMUNgYk/D+VM6KJUn7Qxf7SgqNEG17jNZy9xC
	BCMClsBzGQS/XZRBYQf5vOLQ0mcoPoUG3tL0IQdHFX5ekYRDAQHQO+PS2Ctt+4SBSbvHGaLhZ4+
	UVGsWA4cJuxfDTQn+04nHL143sOwY05/jRlb0D1lrNka9DfTkk0gn4xqQ3FZiayYKzAkX4/nPb4
	uHBpfIc8k=
X-Received: by 2002:a05:6820:987:b0:6a1:2fcc:753d with SMTP id 006d021491bc7-6a36d91ed0amr3468132eaf.14.1783551315727;
        Wed, 08 Jul 2026 15:55:15 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:2::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a66b668sm2923429eaf.8.2026.07.08.15.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:55:15 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 08 Jul 2026 15:55:04 -0700
Subject: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per dmabuf binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
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
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67079-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:joe@dama.to,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8CE872AFE0

From: Bobby Eshleman <bobbyeshleman@meta.com>

Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
churn for large flows.

Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
lets userspace request a larger niov size. The value must be a power of
two >= PAGE_SIZE.

Measurements:
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
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
---
 Documentation/netlink/specs/netdev.yaml |  8 ++++++
 include/uapi/linux/netdev.h             |  1 +
 net/core/devmem.c                       | 51 +++++++++++++++++++--------------
 net/core/devmem.h                       | 13 ++++++---
 net/core/netdev-genl-gen.c              |  5 ++--
 net/core/netdev-genl.c                  | 19 ++++++++++--
 tools/include/uapi/linux/netdev.h       |  1 +
 7 files changed, 69 insertions(+), 29 deletions(-)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 5f143da7458c..70b902008bd3 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -598,6 +598,13 @@ attribute-sets:
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
@@ -812,6 +819,7 @@ operations:
             - ifindex
             - fd
             - queues
+            - rx-buf-size
         reply:
           attributes:
             - id
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 2f3ab75e8cc0..85e1d20c6268 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -219,6 +219,7 @@ enum {
 	NETDEV_A_DMABUF_QUEUES,
 	NETDEV_A_DMABUF_FD,
 	NETDEV_A_DMABUF_ID,
+	NETDEV_A_DMABUF_RX_BUF_SIZE,
 
 	__NETDEV_A_DMABUF_MAX,
 	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 957d6b96216b..3ce3cc14bec0 100644
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
@@ -273,9 +277,12 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		size_t len = sg_dma_len(sg);
 		struct net_iov *niov;
 
-		if (!IS_ALIGNED(len, PAGE_SIZE)) {
+		if (!IS_ALIGNED(dma_addr, niov_size) ||
+		    !IS_ALIGNED(len, niov_size)) {
 			err = -EINVAL;
-			NL_SET_ERR_MSG(extack, "dma-buf SG length must be PAGE_SIZE aligned");
+			NL_SET_ERR_MSG_FMT(extack,
+					   "dmabuf sg entry (addr=%pad, len=%zu) not aligned to niov size %zu",
+					   &dma_addr, len, niov_size);
 			goto err_free_chunks;
 		}
 
@@ -288,7 +295,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 
 		owner->area.base_virtual = virtual;
 		owner->base_dma_addr = dma_addr;
-		owner->area.num_niovs = len / PAGE_SIZE;
+		owner->area.num_niovs = len >> niov_shift;
 		owner->binding = binding;
 
 		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
@@ -313,7 +320,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      net_devmem_get_dma_addr(niov));
 			if (direction == DMA_TO_DEVICE)
-				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
+				binding->tx_vec[(owner->area.base_virtual >> niov_shift) + i] = niov;
 		}
 
 		virtual += len;
@@ -430,13 +437,15 @@ struct net_iov *
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
@@ -454,7 +463,7 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
 	pool->dma_sync = false;
 	pool->dma_sync_for_cpu = false;
 
-	if (pool->p.order != 0)
+	if (pool->p.order != binding->niov_shift - PAGE_SHIFT)
 		return -E2BIG;
 
 	net_devmem_dmabuf_binding_get(binding);
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
index d18c89b5a6c7..447ed06d8c74 100644
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
 		.flags		= GENL_UNS_ADMIN_PERM | GENL_CMD_CAP_DO,
 	},
 	{
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index c15d8d4ca1f8..82089dac000f 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1013,6 +1013,7 @@ netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
 int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	unsigned int niov_shift = PAGE_SHIFT;
 	u32 ifindex, dmabuf_fd, rxq_idx;
 	struct netdev_nl_sock *priv;
 	struct net_device *netdev;
@@ -1030,6 +1031,19 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	ifindex = nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
 	dmabuf_fd = nla_get_u32(info->attrs[NETDEV_A_DMABUF_FD]);
 
+	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
+		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
+
+		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
+		    rx_buf_size < PAGE_SIZE) {
+			NL_SET_ERR_MSG_FMT(info->extack,
+					   "rx_buf_size %u must be a power of 2 >= page size (%lu)",
+					   rx_buf_size, PAGE_SIZE);
+			return -EINVAL;
+		}
+		niov_shift = ilog2(rx_buf_size);
+	}
+
 	priv = genl_sk_priv_get(&netdev_nl_family, NETLINK_CB(skb).sk);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
@@ -1080,7 +1094,8 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	binding = net_devmem_bind_dmabuf(netdev, NULL, dma_dev, DMA_FROM_DEVICE,
-					 dmabuf_fd, priv, info->extack);
+					 dmabuf_fd, niov_shift, priv,
+					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
@@ -1221,7 +1236,7 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 	binding = net_devmem_bind_dmabuf(bind_dev,
 					 bind_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 priv, info->extack);
+					 PAGE_SHIFT, priv, info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_unlock_bind_dev;
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 2f3ab75e8cc0..85e1d20c6268 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -219,6 +219,7 @@ enum {
 	NETDEV_A_DMABUF_QUEUES,
 	NETDEV_A_DMABUF_FD,
 	NETDEV_A_DMABUF_ID,
+	NETDEV_A_DMABUF_RX_BUF_SIZE,
 
 	__NETDEV_A_DMABUF_MAX,
 	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)

-- 
2.53.0-Meta


