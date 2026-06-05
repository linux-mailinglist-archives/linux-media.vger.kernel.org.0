Return-Path: <linux-media+bounces-63869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JXAxE214ImroXwEAu9opvQ
	(envelope-from <linux-media+bounces-63869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:19:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A97645E0F
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TVpqH1Qv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63869-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63869-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6A330548AD
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF55147798A;
	Fri,  5 Jun 2026 07:03:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25345349A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 07:03:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643034; cv=none; b=UJwD3AczbAhrl4D0flxciWiDS0EYKDKCzJ7nTuFGQa4ctZUAcWGzk8Fu5oAkBpFadWBYOuIUNeSb9a6iQxEEz1M4B25glpOq9H3ARKccKZkZMDmA/Nym8kfFSQgfX5Dp9adOZUqB9fC62l8pljnmFGpdcpiYcoqyMSQNRYNY3S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643034; c=relaxed/simple;
	bh=hrsSMsHe9WSvP0v/JhP7L5JAh4ICmr4rgG2ibRudbQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UaOMj4hheuVZKJK2Q47axu7u7EBQEZE69dF4AaFtAEsZLslE3ZOvzdM0JUj2a9RKiTgq1gEXAu98tDlIM0KbH88J406Fy3N0ueAPejvhiarV3r62DMAgh92ZNwt/GO7yVozdd6EeDb/hc1rT1NqT6TlqeO7b8iwTAYbf5ZyKDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVpqH1Qv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E33F1F00898;
	Fri,  5 Jun 2026 07:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780643030;
	bh=h2xwZQW682m/lc+RgTVbyQzaLz4+QD4JGz2IG59VZaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TVpqH1QvQcJvHOAwE184MccNwmTte/P7TW1V2LSU9Z9ENobTH2dYlZhGFnjQDM4JW
	 0d90bXUGKWsdQs9DWkkmWuuK4dPRQNNh+U1gPUPe5TkdMkj6Jtd3ugcag5Za2PqJAm
	 yd8TL++jrvjS+pptmhjhRRg56fc8D9gj601U768cqHXW3fnop6yEpnGwTQxs+52m9a
	 jdKqS28u8EjB+wYN1/F6TSsSkg3gEmjapaWrx9bdjvf0rmkS1lIFlHqO080/MAsX6U
	 1nigfnAe2jC3mG+SnPYmqdwkFbcBMACW2lQJgpFPYwmnB4a1OoXwNN7Py9GMl/V8nM
	 I9P5sooXaJG5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per dmabuf binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bobby Eshleman" <bobbyeshleman@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
In-Reply-To: <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 07:03:50 +0000
Message-Id: <20260605070350.7E33F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63869-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,meta.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93A97645E0F

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The `tx_vec` array is allocated without zero-initialization, l=
eading to dereferencing uninitialized pointers if the mapped SG table is sm=
aller than the dmabuf.
- [Critical] The `tx_vec` array can be overflowed if a dmabuf exporter retu=
rns an SG table whose total mapped length exceeds `dmabuf->size`.
--

commit 19418ca41b5b75f8c09b7526af4fcb2ea506b0fa
Author: Bobby Eshleman <bobbyeshleman@meta.com>
Subject: net: devmem: allow rx-buf-size > PAGE_SIZE per dmabuf binding

This patch adds a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE,
that lets userspace request a larger niov size for devmem dmabuf bindings,
allowing rx-buf-size > PAGE_SIZE.

> diff --git a/net/core/devmem.c b/net/core/devmem.c
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -248,18 +256,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>  			goto err_unmap;
>  		}
>  		binding->tx_vec =3D kvmalloc_objs(struct net_iov *,
> -						dmabuf->size / PAGE_SIZE);
> +						dmabuf->size >> niov_shift);

[Severity: Critical]
This isn't a bug introduced by this patch, but since kvmalloc_objs() doesn't
zero-initialize the memory, is it possible for uninitialized pointers to be
returned later?

If a dmabuf exporter returns an SG table whose total mapped length is less
than dmabuf->size, the trailing elements of the tx_vec array would remain
uninitialized. When userspace requests transmission with an offset beyond
the mapped length but within dmabuf->size, net_devmem_get_niov_at() would
read from this uninitialized memory and return a garbage pointer to the
datapath.

[ ... ]

> @@ -313,7 +319,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *=
vdev,
>  			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
>  						      net_devmem_get_dma_addr(niov));
>  			if (direction =3D=3D DMA_TO_DEVICE)
> -				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] =3D niov;
> +				binding->tx_vec[(owner->area.base_virtual >> niov_shift) + i] =3D ni=
ov;

[Severity: Critical]
This is a pre-existing issue, but does this loop lack bounds checking
against the actual allocated size of tx_vec?

The tx_vec array is allocated to hold dmabuf->size >> niov_shift elements.
If a buggy or malicious dmabuf exporter returns an SG table that maps more
data than expected (exceeding dmabuf->size), this loop will write pointers
past the end of the dynamically allocated tx_vec array, corrupting adjacent
kernel memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-tcpdm-larg=
e-niovs-v1-0-f37a4ac6726c@meta.com?part=3D1

