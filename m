Return-Path: <linux-media+bounces-63941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tBi7FJ3vImrHfQEAu9opvQ
	(envelope-from <linux-media+bounces-63941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:47:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B842364972F
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:47:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BbttMqiV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63941-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63941-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F43A307D76B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972443E4C64;
	Fri,  5 Jun 2026 15:35:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FCC309EE7
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 15:35:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673740; cv=none; b=gFqWRBzfLdawCcHEweaRw9j5mKlJ9ZT8npxdP9/O3VHupNC4YDeJSHiLNdDHdX9Qum5MylelQ0sn2sC7y4P+9bIY27GyohDHbqnlVUQQJxxy3+uIUs74AeQCfcaVmw/vh33tKmVyFe/nt0i6pRsrxEF7sd+fW2oL+vo1e56ZlYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673740; c=relaxed/simple;
	bh=IzQ6VY1/pCSCuW589uWkrY4rVnE4dY+yC+x9fXtuNY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKxFFooipXPtqIsRp4oWnRtiNqMaBBqZa4eMaet7y0quh1xMMCMW+0Ry1pfpDZGGn3T+cEtCJNU+YgxuC6J/F/b0TYVCYu3+Mzm1n0mUniViKGpuv2GTOiwxDHY4cC/PfqZ3IKg3sQcgCYIOYmwE4Dfsmtr/ARxnUwRXkt1qcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbttMqiV; arc=none smtp.client-ip=209.85.215.195
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so809639a12.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780673734; x=1781278534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoDRJzQHz7VdEkd5BqZ67I7g6IeSlqxM9mM4zX/QtD0=;
        b=BbttMqiViaNA1nIeY58aGXn3fbQ+t4FYPmlDbFGL/urEb4gDpJPX/rioScSxtKDJ4l
         2eA+wZaLzUYa8Bje1j3h75g1MDS87chBAUkj0FJVUybNFIsEYK83hRWBKaAha5HezH5d
         a7AZWpSHkmLJEggzOkdlPJnM6e3XZBNqzHEhKTnje5U1nf5OrVvMj3IyTkfhGLfstP8w
         K9u3LtBBGVhbvJCRaTrFbBLSV3/bpQ+xR4FObmwizJUWQg2ltk5fsp/NhS1SO4xFMggN
         P6teWll26tAFJY+kixRUGxlrhh4JVcQ+jiS9St+ftlrG/uDBG8ZyccoCh4hp2QnFCOoI
         gQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673734; x=1781278534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoDRJzQHz7VdEkd5BqZ67I7g6IeSlqxM9mM4zX/QtD0=;
        b=MKXuWkSP2i2wUyeYkNnubM3PACNYDYblT7wBVOqzcH+52MPM5Oq5fExxb5czVzH9aK
         SY3Z/Zu9Fh1Yy2wZWsuLj9SCoAdpOGyWhwdeGmOtLambhaRq80W1C4WqhrfJDy1dy2Bb
         vSQLcML2Kxhy2MuVXkCBb53dfSzsMVXAZhN653o4g6/mK+vjc8HsqgVHGYz9Wo1S6XGr
         0h4Xsi8mgqm6djYyHgjYXdNZ6smN+m6ayQCLn3uu28n4HenA1i6K1e+Sxb4KCR5nSJ1B
         h1U9H3CHsT3QjrkitdrXPmonnP1ItTHMaS7uLnoUWHn8QlFqpLDhL5fHGBJ+doVPVI5K
         oO3A==
X-Forwarded-Encrypted: i=1; AFNElJ/bD5aaGKx5itUDXymmyu+8hmdcjr91cLmnEUsFTJMQjme0PMyqpekOU5VFBV7SLU9h8DKrVw/+GZsbiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfkUjzlh0umQ1G35e5bEa+yui1v+24WAEjPirjU0hceyYba9t+
	nQkRlqhSlS6Hdl6aIDMKSfTY77GZ/3QUGgDTkBD9aUIg6SidxWSirOvp
X-Gm-Gg: Acq92OE1XAP2nfTTcytvs1kDAvSqmU3O47owpsy1RZ7+tqYtlHnIq15dDUznU5DzLWN
	oS6qrVaIyOL9b2xsAQzsh9b1gLKfHryeJUgPnPNKui6e8X5FWY42aViorwxoCi2p45KaV5GYX3p
	GEKjqhXzx/jBE/xYQQMXOn46JLP3TYYV3+7TZndzYU+GH14HnixUGulAs/XeJidyNXiYeRW+WS+
	qbtbwActa+44Bb+3+aW88G/TYj9keEz+RBElLOjy8VpM1vHVOmwnPlDFASmDWURsq0iK9wwtpdl
	h3SanQDhSI1x1cEHADnggs0ZLwyKALHI7ygBXpbyikC8HrhZOC1MkTzDs+rChNpLQv6p2BCIrt7
	5E4zAepwhrCoS2sFb0n5nbXL1E6IqwWmyALK3JBLu/pp1K32Fk6dqx07XSPG4W5suM3EdmlHYDf
	nH3kq/Z7DoQQHUWmvalmXasa13+Ek=
X-Received: by 2002:a05:6a20:9383:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3b4cccff825mr4945669637.4.1780673734235;
        Fri, 05 Jun 2026 08:35:34 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm10022248a12.19.2026.06.05.08.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:35:33 -0700 (PDT)
Date: Fri, 5 Jun 2026 08:33:04 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 1/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per dmabuf binding
Message-ID: <aiLrsLM8N0VzrNMe@devvm7509.cco0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63941-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sdfkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdfkernel@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,meta.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devvm7509.cco0.facebook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B842364972F

On 06/03, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> churn for large flows.
> 
> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> lets userspace request a larger niov size. The value must be a power of
> two >= PAGE_SIZE.
> 
> Measurements
> ------------
> Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
> dctcp, num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov
> size, mlx5.
> 
> CPU Util:
> 
>    niov        net sirq %        net idle %         app sys %        app idle %
>   -----  ----------------  ----------------  ----------------  ----------------
>      4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/- 10.53
>     16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-  9.24
>     32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-  3.65
>     64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-  3.27
> 
> RX app sys % drops ~19% from 4K to 64K.
> 
> Throughput:
> 
>    niov       RX dev Gbps   RX flow avg Gbps
>   -----  ----------------  -----------------
>      4K  300.63 +/- 53.21    75.16 +/- 13.30
>     16K  321.35 +/- 28.20    80.34 +/-  7.05
>     32K  347.63 +/-  2.20    86.91 +/-  0.55
>     64K  332.11 +/- 14.26    83.03 +/-  3.56
> 
> Throughput seems to increase, but the stdev is pretty wide so could just
> be noise.
> 
> kperf support (not yet merged):
> https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  Documentation/netlink/specs/netdev.yaml |  8 +++++
>  include/uapi/linux/netdev.h             |  1 +
>  net/core/devmem.c                       | 52 +++++++++++++++++++--------------
>  net/core/devmem.h                       | 13 ++++++---
>  net/core/netdev-genl-gen.c              |  5 ++--
>  net/core/netdev-genl.c                  | 18 ++++++++++--
>  tools/include/uapi/linux/netdev.h       |  1 +
>  7 files changed, 68 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> index a1f4c5a561e9..063119907983 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -591,6 +591,13 @@ attribute-sets:
>          type: u32
>          checks:
>            min: 1
> +      -
> +        name: rx-buf-size
> +        doc: |
> +          Size in bytes of each RX buffer the NIC writes into from the bound
> +          dmabuf. Must be a power of two and >= PAGE_SIZE; defaults to
> +          PAGE_SIZE.
> +        type: u32
>  
>  operations:
>    list:
> @@ -805,6 +812,7 @@ operations:
>              - ifindex
>              - fd
>              - queues
> +            - rx-buf-size
>          reply:
>            attributes:
>              - id
> diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
> index 7df1056a35fd..180a4ffffd60 100644
> --- a/include/uapi/linux/netdev.h
> +++ b/include/uapi/linux/netdev.h
> @@ -217,6 +217,7 @@ enum {
>  	NETDEV_A_DMABUF_QUEUES,
>  	NETDEV_A_DMABUF_FD,
>  	NETDEV_A_DMABUF_ID,
> +	NETDEV_A_DMABUF_RX_BUF_SIZE,
>  
>  	__NETDEV_A_DMABUF_MAX,
>  	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 957d6b96216b..5a1c0d7984a8 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -46,7 +46,7 @@ static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
>  
>  	owner = net_devmem_iov_to_chunk_owner(niov);
>  	return owner->base_dma_addr +
> -	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
> +	       ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shift);
>  }
>  
>  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
> @@ -93,13 +93,14 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	ssize_t offset;
>  	ssize_t index;
>  
> -	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
> +	dma_addr = gen_pool_alloc_owner(binding->chunk_pool,
> +					1UL << binding->niov_shift,
>  					(void **)&owner);
>  	if (!dma_addr)
>  		return NULL;
>  
>  	offset = dma_addr - owner->base_dma_addr;
> -	index = offset / PAGE_SIZE;
> +	index = offset >> binding->niov_shift;
>  	niov = &owner->area.niovs[index];
>  
>  	niov->desc.pp_magic = 0;
> @@ -113,12 +114,13 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
>  {
>  	struct net_devmem_dmabuf_binding *binding = net_devmem_iov_binding(niov);
>  	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
> +	size_t niov_size = 1UL << binding->niov_shift;
>  
>  	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
> -				       PAGE_SIZE)))
> +				       niov_size)))
>  		return;
>  
> -	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
> +	gen_pool_free(binding->chunk_pool, dma_addr, niov_size);
>  }
>  
>  void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
> @@ -163,6 +165,9 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
>  	u32 xa_idx;
>  	int err;
>  
> +	if (binding->niov_shift != PAGE_SHIFT)
> +		mp_params.rx_page_size = 1U << binding->niov_shift;
> +
>  	err = netif_mp_open_rxq(dev, rxq_idx, &mp_params, extack);
>  	if (err)
>  		return err;
> @@ -184,14 +189,16 @@ struct net_devmem_dmabuf_binding *
>  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  		       struct device *dma_dev,
>  		       enum dma_data_direction direction,
> -		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
> +		       unsigned int dmabuf_fd, unsigned int niov_shift,
> +		       struct netdev_nl_sock *priv,
>  		       struct netlink_ext_ack *extack)
>  {
>  	struct net_devmem_dmabuf_binding *binding;
> +	size_t niov_size = 1UL << niov_shift;
>  	static u32 id_alloc_next;
> +	unsigned int sg_idx, i;
>  	struct scatterlist *sg;
>  	struct dma_buf *dmabuf;
> -	unsigned int sg_idx, i;
>  	unsigned long virtual;
>  	int err;
>  
> @@ -213,6 +220,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  
>  	binding->dev = dev;
>  	binding->vdev = vdev;
> +	binding->niov_shift = niov_shift;
>  	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
>  
>  	err = percpu_ref_init(&binding->ref,
> @@ -248,18 +256,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  			goto err_unmap;
>  		}
>  		binding->tx_vec = kvmalloc_objs(struct net_iov *,
> -						dmabuf->size / PAGE_SIZE);
> +						dmabuf->size >> niov_shift);
>  		if (!binding->tx_vec) {
>  			err = -ENOMEM;
>  			goto err_unmap;
>  		}
>  	}
>  
> -	/* For simplicity we expect to make PAGE_SIZE allocations, but the
> -	 * binding can be much more flexible than that. We may be able to
> -	 * allocate MTU sized chunks here. Leave that for future work...
> -	 */
> -	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
> +	binding->chunk_pool = gen_pool_create(niov_shift,
>  					      dev_to_node(&dev->dev));
>  	if (!binding->chunk_pool) {
>  		err = -ENOMEM;
> @@ -273,9 +277,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  		size_t len = sg_dma_len(sg);
>  		struct net_iov *niov;
>  
> -		if (!IS_ALIGNED(len, PAGE_SIZE)) {
> +		if (!IS_ALIGNED(dma_addr, niov_size) ||
> +		    !IS_ALIGNED(len, niov_size)) {
>  			err = -EINVAL;
> -			NL_SET_ERR_MSG(extack, "dma-buf SG length must be PAGE_SIZE aligned");
> +			NL_SET_ERR_MSG(extack,
> +				       "dmabuf sg entry not aligned to niov size");

nit: should we NL_SET_ERR_MSG_FMT here and export chunk len and expected
alignment?

>  			goto err_free_chunks;
>  		}
>  
> @@ -288,7 +294,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  
>  		owner->area.base_virtual = virtual;
>  		owner->base_dma_addr = dma_addr;
> -		owner->area.num_niovs = len / PAGE_SIZE;
> +		owner->area.num_niovs = len >> niov_shift;
>  		owner->binding = binding;
>  
>  		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
> @@ -313,7 +319,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
>  						      net_devmem_get_dma_addr(niov));
>  			if (direction == DMA_TO_DEVICE)
> -				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
> +				binding->tx_vec[(owner->area.base_virtual >> niov_shift) + i] = niov;
>  		}
>  
>  		virtual += len;
> @@ -430,13 +436,15 @@ struct net_iov *
>  net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
>  		       size_t virt_addr, size_t *off, size_t *size)
>  {
> +	size_t niov_size = 1UL << binding->niov_shift;
> +
>  	if (virt_addr >= binding->dmabuf->size)
>  		return NULL;
>  
> -	*off = virt_addr % PAGE_SIZE;
> -	*size = PAGE_SIZE - *off;
> +	*off = virt_addr & (niov_size - 1);
> +	*size = niov_size - *off;
>  
> -	return binding->tx_vec[virt_addr / PAGE_SIZE];
> +	return binding->tx_vec[virt_addr >> binding->niov_shift];
>  }
>  
>  /*** "Dmabuf devmem memory provider" ***/
> @@ -454,8 +462,8 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
>  	pool->dma_sync = false;
>  	pool->dma_sync_for_cpu = false;
>  
> -	if (pool->p.order != 0)
> -		return -E2BIG;
> +	if (pool->p.order != binding->niov_shift - PAGE_SHIFT)
> +		return -EINVAL;

Any specific reason you change E2BIG to EINVAL?

