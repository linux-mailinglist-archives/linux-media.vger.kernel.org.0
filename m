Return-Path: <linux-media+bounces-63951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TImEKOX4ImrUfwEAu9opvQ
	(envelope-from <linux-media+bounces-63951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:27:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933B649C28
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:27:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EF8O5wdl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63951-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63951-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82B7A3067F85
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 16:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FA03EDE64;
	Fri,  5 Jun 2026 16:20:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0130C610
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 16:20:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676440; cv=none; b=j3jRWpJhp8lRUJST1bvJ1D8d+PVJvLNeVUBeOnd+hxOV0UaA8Sr251Ab/yiBky1+PaKFC/omJAXRqI//VUdptYLMHabrGpUXX+kfO/DFPOfEvQ8cDIOSBnFQ+ccaXw9MFquprxxy5kFz1zTA4n4FMvp1MqMbS/swwHMWVKwnuDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676440; c=relaxed/simple;
	bh=SsQfeurk4ed9hQnsOPWLl1nA8N6jtyUDvGh7S2vpuFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA/aD/hUwN3B7vtEe7A7t4jq6mdVHbfrbkND6+d3HHITQQyueoGQVTsX2XMu/CAVR4JaNN0BrEy2uH+XmOrhx95MNNwlYgiQiED+tsOQcOK75z3XXjuD0ROJ+VMraA4Ueknsx6jg5PEVBISElLNJ7Xmi9vcLbKlEmljesvSMTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF8O5wdl; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf2247e38eso21919255ad.3
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780676437; x=1781281237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mql6HNKVt0P+1uPegRUW8zlGYKpmXHvNpDN0uRKtg58=;
        b=EF8O5wdlEzY6OBlkhry+7oUoAvDlT+f+Fhe+3NJ7Ug+OQ8c85+fP1wWZA9b1TCeS+8
         e6+c/EgcUQ0q0LkR5x2Yu5rgddrrdz5RmLV83V/2nSi9LxdcWQ7fubrMeMzig+L3gY+6
         jx34sSAzyxiXqY8GcU4b4s//gJ96dH0Xp4YbVujrZMP0dlDByvSEm2uBXbX+Gbjn7dKt
         F6y5gzO1MiEaSt0efIo4wqlOfHiHY2ZN1fPitd88NMGooE9VMTzuGtuCOjseGVVUhkM/
         Tcg3f+b1a2l/eqqR9+ezRSxzyLXTOAxLNDoBVMe11Ai0NDbeoKqpQUETvcrkwSLTdwIa
         R5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676437; x=1781281237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mql6HNKVt0P+1uPegRUW8zlGYKpmXHvNpDN0uRKtg58=;
        b=Mj5bBvci0vAQ9QdOvg3p617Fpypnqw71JbBNfCaButCmbXJ3t3g0Yz+udiv3HpCEvp
         QgSp/IqKUz/AQK3QAJKVbm7grg0jQUBX6KcU1XxHFOOCHFt8FwDAq4cXIbqZ/XKja1Pb
         4qlauIoAw7F52OvFe61+cXVYJ3ynnD6r0fCU2fuIj/PhTnfGmZezm3XnE88DHvEGZj8X
         CMD92rZmia5xk9ruIJFn/EzTEmGwGTaVv2i9tQ9n5LzUJpuUWtgTLO4Cu5w4q4CkAxPs
         sPumiNxxzWza5iiG3PQmiDb0iHAXHXW0kn9PL9bYtVNJa/7X5ah0wKPnv8p8cGobzB+q
         UXAA==
X-Forwarded-Encrypted: i=1; AFNElJ/ARAFCR/xepeLeK26SaDy/PpaQcFQMnp+T7A2JvOX17AyjJIUul7TwER4NbaeH0hw9VCMJwZjHhGKlWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDO+aFsZVQmU8OCwRsLMlmieTnVy7Jb8wXUhc3yjJUtR2Ai0Oh
	z8RM+GFSqXlUe4/wrwbcAw7rHvbC6p5U3QxXXhPljruMANdRq56KB/1Z
X-Gm-Gg: Acq92OFrvrcBNmB9THLZl/nS7M6ypCcJh2z2aAsyXVvebKnQngNSERZWHPwAPF18clQ
	FJv4QpMMquYNzwU3KrdsOHYbFMpOIU+cd4nrLCNbTvxEWoMLIjuJ+2O6qPH3CNx80UPyOehxrNC
	O+3e8ps7WIixcKpq+9SRAwwa3/DySkdZuIeSRGkvkMsgCxOt9cf7CKhJCIwfhV1XPvNzKAJYPo+
	caarwxQHRRWvABQ9i2R3KSqvPRp2QddJmHnnvpLc+G99EfVxP8UoqsHSCYFmwesL3uBtAjk489n
	X6dUUmWuWpd+032r5Q4/IuT62uU0WFI7BdWf34szHGVfyM3tawUn5S5sdMe9y872J1LRBzyQnx/
	ETyqXIe3X+EMj6MDGchSWENuEkEJ3jNiKazwSGyRjKcLok2JsR927itXNC2SJWK0nLcFsnNv1Db
	7CYS1XuxfkQ+PPcVpGXBIphwi5WpFURDMeXr9zYNmlks25lzlhZshyNV8=
X-Received: by 2002:a17:903:2c0e:b0:2bf:356f:4e17 with SMTP id d9443c01a7336-2c1e821d398mr55753675ad.13.1780676437322;
        Fri, 05 Jun 2026 09:20:37 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa404fsm97497065ad.37.2026.06.05.09.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:20:36 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:20:32 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 1/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per dmabuf binding
Message-ID: <aiL3UM9aULBypEk7@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
 <aiLrsLM8N0VzrNMe@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLrsLM8N0VzrNMe@devvm7509.cco0.facebook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sdf.kernel@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:sdfkernel@gmail.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63951-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devvm29614.prn0.facebook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1933B649C28

On Fri, Jun 05, 2026 at 08:33:04AM -0700, Stanislav Fomichev wrote:
> On 06/03, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> > This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> > churn for large flows.
> > 
> > Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> > lets userspace request a larger niov size. The value must be a power of
> > two >= PAGE_SIZE.
> > 
> > Measurements
> > ------------
> > Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
> > dctcp, num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov
> > size, mlx5.
> > 
> > CPU Util:
> > 
> >    niov        net sirq %        net idle %         app sys %        app idle %
> >   -----  ----------------  ----------------  ----------------  ----------------
> >      4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/- 10.53
> >     16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-  9.24
> >     32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-  3.65
> >     64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-  3.27
> > 
> > RX app sys % drops ~19% from 4K to 64K.
> > 
> > Throughput:
> > 
> >    niov       RX dev Gbps   RX flow avg Gbps
> >   -----  ----------------  -----------------
> >      4K  300.63 +/- 53.21    75.16 +/- 13.30
> >     16K  321.35 +/- 28.20    80.34 +/-  7.05
> >     32K  347.63 +/-  2.20    86.91 +/-  0.55
> >     64K  332.11 +/- 14.26    83.03 +/-  3.56
> > 
> > Throughput seems to increase, but the stdev is pretty wide so could just
> > be noise.
> > 
> > kperf support (not yet merged):
> > https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  Documentation/netlink/specs/netdev.yaml |  8 +++++
> >  include/uapi/linux/netdev.h             |  1 +
> >  net/core/devmem.c                       | 52 +++++++++++++++++++--------------
> >  net/core/devmem.h                       | 13 ++++++---
> >  net/core/netdev-genl-gen.c              |  5 ++--
> >  net/core/netdev-genl.c                  | 18 ++++++++++--
> >  tools/include/uapi/linux/netdev.h       |  1 +
> >  7 files changed, 68 insertions(+), 30 deletions(-)
> > 
> > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> > index a1f4c5a561e9..063119907983 100644
> > --- a/Documentation/netlink/specs/netdev.yaml
> > +++ b/Documentation/netlink/specs/netdev.yaml
> > @@ -591,6 +591,13 @@ attribute-sets:
> >          type: u32
> >          checks:
> >            min: 1
> > +      -
> > +        name: rx-buf-size
> > +        doc: |
> > +          Size in bytes of each RX buffer the NIC writes into from the bound
> > +          dmabuf. Must be a power of two and >= PAGE_SIZE; defaults to
> > +          PAGE_SIZE.
> > +        type: u32
> >  
> >  operations:
> >    list:
> > @@ -805,6 +812,7 @@ operations:
> >              - ifindex
> >              - fd
> >              - queues
> > +            - rx-buf-size
> >          reply:
> >            attributes:
> >              - id
> > diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
> > index 7df1056a35fd..180a4ffffd60 100644
> > --- a/include/uapi/linux/netdev.h
> > +++ b/include/uapi/linux/netdev.h
> > @@ -217,6 +217,7 @@ enum {
> >  	NETDEV_A_DMABUF_QUEUES,
> >  	NETDEV_A_DMABUF_FD,
> >  	NETDEV_A_DMABUF_ID,
> > +	NETDEV_A_DMABUF_RX_BUF_SIZE,
> >  
> >  	__NETDEV_A_DMABUF_MAX,
> >  	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 957d6b96216b..5a1c0d7984a8 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -46,7 +46,7 @@ static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
> >  
> >  	owner = net_devmem_iov_to_chunk_owner(niov);
> >  	return owner->base_dma_addr +
> > -	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
> > +	       ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shift);
> >  }
> >  
> >  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
> > @@ -93,13 +93,14 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> >  	ssize_t offset;
> >  	ssize_t index;
> >  
> > -	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
> > +	dma_addr = gen_pool_alloc_owner(binding->chunk_pool,
> > +					1UL << binding->niov_shift,
> >  					(void **)&owner);
> >  	if (!dma_addr)
> >  		return NULL;
> >  
> >  	offset = dma_addr - owner->base_dma_addr;
> > -	index = offset / PAGE_SIZE;
> > +	index = offset >> binding->niov_shift;
> >  	niov = &owner->area.niovs[index];
> >  
> >  	niov->desc.pp_magic = 0;
> > @@ -113,12 +114,13 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
> >  {
> >  	struct net_devmem_dmabuf_binding *binding = net_devmem_iov_binding(niov);
> >  	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
> > +	size_t niov_size = 1UL << binding->niov_shift;
> >  
> >  	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
> > -				       PAGE_SIZE)))
> > +				       niov_size)))
> >  		return;
> >  
> > -	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
> > +	gen_pool_free(binding->chunk_pool, dma_addr, niov_size);
> >  }
> >  
> >  void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
> > @@ -163,6 +165,9 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> >  	u32 xa_idx;
> >  	int err;
> >  
> > +	if (binding->niov_shift != PAGE_SHIFT)
> > +		mp_params.rx_page_size = 1U << binding->niov_shift;
> > +
> >  	err = netif_mp_open_rxq(dev, rxq_idx, &mp_params, extack);
> >  	if (err)
> >  		return err;
> > @@ -184,14 +189,16 @@ struct net_devmem_dmabuf_binding *
> >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  		       struct device *dma_dev,
> >  		       enum dma_data_direction direction,
> > -		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
> > +		       unsigned int dmabuf_fd, unsigned int niov_shift,
> > +		       struct netdev_nl_sock *priv,
> >  		       struct netlink_ext_ack *extack)
> >  {
> >  	struct net_devmem_dmabuf_binding *binding;
> > +	size_t niov_size = 1UL << niov_shift;
> >  	static u32 id_alloc_next;
> > +	unsigned int sg_idx, i;
> >  	struct scatterlist *sg;
> >  	struct dma_buf *dmabuf;
> > -	unsigned int sg_idx, i;
> >  	unsigned long virtual;
> >  	int err;
> >  
> > @@ -213,6 +220,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  
> >  	binding->dev = dev;
> >  	binding->vdev = vdev;
> > +	binding->niov_shift = niov_shift;
> >  	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> >  
> >  	err = percpu_ref_init(&binding->ref,
> > @@ -248,18 +256,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  			goto err_unmap;
> >  		}
> >  		binding->tx_vec = kvmalloc_objs(struct net_iov *,
> > -						dmabuf->size / PAGE_SIZE);
> > +						dmabuf->size >> niov_shift);
> >  		if (!binding->tx_vec) {
> >  			err = -ENOMEM;
> >  			goto err_unmap;
> >  		}
> >  	}
> >  
> > -	/* For simplicity we expect to make PAGE_SIZE allocations, but the
> > -	 * binding can be much more flexible than that. We may be able to
> > -	 * allocate MTU sized chunks here. Leave that for future work...
> > -	 */
> > -	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
> > +	binding->chunk_pool = gen_pool_create(niov_shift,
> >  					      dev_to_node(&dev->dev));
> >  	if (!binding->chunk_pool) {
> >  		err = -ENOMEM;
> > @@ -273,9 +277,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  		size_t len = sg_dma_len(sg);
> >  		struct net_iov *niov;
> >  
> > -		if (!IS_ALIGNED(len, PAGE_SIZE)) {
> > +		if (!IS_ALIGNED(dma_addr, niov_size) ||
> > +		    !IS_ALIGNED(len, niov_size)) {
> >  			err = -EINVAL;
> > -			NL_SET_ERR_MSG(extack, "dma-buf SG length must be PAGE_SIZE aligned");
> > +			NL_SET_ERR_MSG(extack,
> > +				       "dmabuf sg entry not aligned to niov size");
> 
> nit: should we NL_SET_ERR_MSG_FMT here and export chunk len and expected
> alignment?

sgtm!

> >  			goto err_free_chunks;
> >  		}
> >  
> > @@ -288,7 +294,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  
> >  		owner->area.base_virtual = virtual;
> >  		owner->base_dma_addr = dma_addr;
> > -		owner->area.num_niovs = len / PAGE_SIZE;
> > +		owner->area.num_niovs = len >> niov_shift;
> >  		owner->binding = binding;
> >  
> >  		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
> > @@ -313,7 +319,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
> >  						      net_devmem_get_dma_addr(niov));
> >  			if (direction == DMA_TO_DEVICE)
> > -				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
> > +				binding->tx_vec[(owner->area.base_virtual >> niov_shift) + i] = niov;
> >  		}
> >  
> >  		virtual += len;
> > @@ -430,13 +436,15 @@ struct net_iov *
> >  net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
> >  		       size_t virt_addr, size_t *off, size_t *size)
> >  {
> > +	size_t niov_size = 1UL << binding->niov_shift;
> > +
> >  	if (virt_addr >= binding->dmabuf->size)
> >  		return NULL;
> >  
> > -	*off = virt_addr % PAGE_SIZE;
> > -	*size = PAGE_SIZE - *off;
> > +	*off = virt_addr & (niov_size - 1);
> > +	*size = niov_size - *off;
> >  
> > -	return binding->tx_vec[virt_addr / PAGE_SIZE];
> > +	return binding->tx_vec[virt_addr >> binding->niov_shift];
> >  }
> >  
> >  /*** "Dmabuf devmem memory provider" ***/
> > @@ -454,8 +462,8 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
> >  	pool->dma_sync = false;
> >  	pool->dma_sync_for_cpu = false;
> >  
> > -	if (pool->p.order != 0)
> > -		return -E2BIG;
> > +	if (pool->p.order != binding->niov_shift - PAGE_SHIFT)
> > +		return -EINVAL;
> 
> Any specific reason you change E2BIG to EINVAL?

It seemed to reflect the new conditional more accurately, as in the case
of order < niov_shift the pool order is too small, not too big. TBH, I'm
not sure if that case is actually ever hit though, at least with current
drivers... 

Not married to it, open to go back to E2BIG.

Best,
Bobby

