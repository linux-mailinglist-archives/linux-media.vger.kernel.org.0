Return-Path: <linux-media+bounces-60170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NxjMOEs9WnyJAIAu9opvQ
	(envelope-from <linux-media+bounces-60170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 00:44:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A34B0104
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 00:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE049300D540
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 22:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C8C37C920;
	Fri,  1 May 2026 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="aFYeUrfL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SwP3GP3H"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C932D7DEA;
	Fri,  1 May 2026 22:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777675477; cv=none; b=RcgJnGM9Oa64cUI7M+wvlhGM0FWo4E7BvjL5SosFHqCwR41iNe0HEK5h6C60KF2xMt51ER82zXmGWPSMF6Dy1w1PITqihU86A/mq/gH0Ybgpjep7k7E0HvBdJ2zk3iGsswCfkZcwOQOdrIkgfkdIH/Ii239W+DnfRCB8PHPwC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777675477; c=relaxed/simple;
	bh=6pbstWboJn/nB88gnH6NdLhMyzqPdXIDhECFel51914=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rOJnrMqSIYSlws8gKazZhBsd4Tdo1h+Z2bXT3hQOSGAzPCajRGyTjYQGEecT6GZwyuUpr+3eBdLz6P0AM0a38BxR62vChVXphY3JDS9AWGnRQHq+WNgoJ3cFVThLoimBxl85IMcabwqcCNfXBKrQVpgTvtXqV9VrJ2Hws9cRLMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=aFYeUrfL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SwP3GP3H; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 526327A00CF;
	Fri,  1 May 2026 18:44:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 01 May 2026 18:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777675473;
	 x=1777761873; bh=H+RPTh5X6WGERBnZyIFiypbSLQyXU92BgOcneXZdT8o=; b=
	aFYeUrfLvBQkHDbVz7ZKmfk9HobjnyXxr1UrU9OKtxysKgwVEbot3/j3uMrtgz7V
	lfGBLiE2289Gg4oHBFSC2GXoAzSzcFzknK0wA0fVr6Hc9HePVjEaMEau8DU5UT/z
	mcumS4d92lla3JCegb6BwQF5cPlGQRHfrzCw61+jkvyfxBvezwJUkdZpp30EjiuK
	h05vH8lfYdrbuiiEVmY+DMRhc7W3Gs5gdz3LyG0CFhF0YHdYvhp4OFgPkWCYgb1y
	X4zqCoWfkDQ/63n9BNr0jeKLuzJNIrjyZCSZsub/BG/tYPlVt+bt8knf8T2tHR8g
	m2LhUk3LmrtVRwTeTWyJiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777675473; x=
	1777761873; bh=H+RPTh5X6WGERBnZyIFiypbSLQyXU92BgOcneXZdT8o=; b=S
	wP3GP3HwG/1UeyK/CZhjcl73RSpwARK7KiTMSpsvLSEMbZYQjX5BBKKYJEfA/9vR
	X+jPmI4W6hT4lEt/sdOv/iBMowm810wktfFgZIN0xxlniwzByzi8ewFoSNUcByG1
	0Kt62z3CN1TZYk1VLI3oOt+Q/WTML8MVmbcgzusVOw+SxGoM1iNdhaupzViVAjgL
	ZGNKZFjI0vMMRZhAyjq8F3+8lhjGA9UlOB3mK8cO94Gu195LNtA3MnpMspUWj2B5
	jvfT0SQNTlHMc1kgx20D4IDquJ+SSkApTw9e1GikQR8c5xLygVWe86y+8CMwGr98
	I12siL+2SnDk41DQ6GEzA==
X-ME-Sender: <xms:0Cz1aXy8nsNfltzNFLqZ7-71AVNWepLVy8DfLw2r5f6djlm8LRSPfQ>
    <xme:0Cz1adqSsIV25QlvASWKP97FeQyR5eLXm_wEHhajRMA7KJFB0DyZtDvctGOZltqPY
    nhZLlpdX49cWEP53hx193Yp8iA9XffNxt5WHz94PSNjzVqJkcFHGQ>
X-ME-Received: <xmr:0Cz1adUbgnjoWm5CaxK0Ubjb3dPQjQHk4yR5VsvAMb5AWDk69LEGHdwwEeM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeludegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfgjfhfogggtgfesthejredtredtvdenucfhrhhomheptehlvgigucgh
    ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
    htvghrnhepvdekfeejkedvudfhudfhteekudfgudeiteetvdeukedvheetvdekgfdugeev
    ueeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopedvtddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhgrthhtvghvsehmvghtrgdrtghomhdprhgtphhtth
    hopehlvghonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhgghesnhhvihguihgr
    rdgtohhmpdhrtghpthhtoheprghmrghsthhrohesfhgsrdgtohhmpdhrtghpthhtoheptg
    hhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepmhhnghih
    rggurghmsegrmhgriihonhdruggvpdhrtghpthhtohepughmrghtlhgrtghksehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:0Cz1aUrOHlNHxVpuRRwlUKIIa4PqR_2-hdS1duRpGNs8acQS9PUn-w>
    <xmx:0Cz1aRFzdnNWifsx23r_VcLJU-zJ2U7_4I4qFAB12e96hNavZ-2heQ>
    <xmx:0Cz1aWv4ijDSK8YqBGaagAKqzGxOeMNiau1ue4bnu-BssBHg87Gb0g>
    <xmx:0Cz1aUT1udFPrzbCAbWQckLAye7mlvoqL0k0yj-nKaNwzHUi_djdjA>
    <xmx:0Sz1aeJ3Ke8v-ukJ8nq1JmuSLDcRO2zwGVhY9am45YM85bbTFycKM5RV>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 18:44:31 -0400 (EDT)
Date: Fri, 1 May 2026 16:44:30 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>, alex@shazbot.org
Subject: Re: [PATCH 5/9] vfio/pci: Provide a user-facing name for BAR
 mappings
Message-ID: <20260501164430.5d3ea683@shazbot.org>
In-Reply-To: <20260416131815.2729131-6-mattev@meta.com>
References: <20260416131815.2729131-1-mattev@meta.com>
	<20260416131815.2729131-6-mattev@meta.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B86A34B0104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60170-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,shazbot.org:dkim,shazbot.org:mid,meta.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, 16 Apr 2026 06:17:48 -0700
Matt Evans <mattev@meta.com> wrote:

> Since converting BAR mmap()s to using DMABUFs, we lose the original
> device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
> synthetic 'filename' based on the cdev, plus BDF, plus resource index.
> 
> This applies only to BAR mappings via the VFIO device fd, as
> explicitly-exported DMABUFs are named by userspace via the
> DMA_BUF_SET_NAME ioctl.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index a12432825e5e..04c7733fe712 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -4,6 +4,7 @@
>  #include <linux/dma-buf-mapping.h>
>  #include <linux/pci-p2pdma.h>
>  #include <linux/dma-resv.h>
> +#include <uapi/linux/dma-buf.h>
>  
>  #include "vfio_pci_priv.h"
>  
> @@ -467,6 +468,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  {
>  	struct vfio_pci_dma_buf *priv;
>  	const unsigned int nr_ranges = 1;
> +	char *bufname;
>  	int ret;
>  
>  	priv = kzalloc_obj(*priv);
> @@ -479,6 +481,20 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  		goto err_free_priv;
>  	}
>  
> +	bufname = kzalloc(DMA_BUF_NAME_LEN, GFP_KERNEL);
> +	if (!bufname) {
> +		ret = -ENOMEM;
> +		goto err_free_phys;
> +	}
> +
> +	/*
> +	 * Maximum size of the friendly debug name is
> +	 * vfio1234567890:ffff:ff:3f.7-9 = 30, which fits within
> +	 * DMA_BUF_NAME_LEN.
> +	 */
> +	snprintf(bufname, DMA_BUF_NAME_LEN, "%s:%s/%x",
> +		 dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);

Comment suggests 9 is the max res_index that can be printed, but mmap
only directly supports standard BARs 0-5.  Comment also uses a '-'
while the code uses a '/'.  Thanks,

Alex

