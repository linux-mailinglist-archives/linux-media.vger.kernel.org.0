Return-Path: <linux-media+bounces-62989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCbnHYbOGGqunggAu9opvQ
	(envelope-from <linux-media+bounces-62989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:23:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7135FB62F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA6FA3188653
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89BB36BCE8;
	Thu, 28 May 2026 23:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="Z4bBBsGn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O+b3et0U"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1B2D876F;
	Thu, 28 May 2026 23:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010162; cv=none; b=f1wrFyb8BbhyqaF4wQVsEQun3g88S4SSlj6W/BdvxVGk6ft61wBhVfdCCgJg59xykwQMtdfNUQFnpvD69l7RTAKb2eOgfXPPQ54krIIU65L0D5lJckTIcXk5vvMnF92V8Uhd69LM3UMcCeld/ZbLVpAQsIgKd6IgPFqLPnFdAkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010162; c=relaxed/simple;
	bh=YgWXalkIV0DW4sVt1CoeuE3cL7/KcRuRdlOQ3ljQE7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYlZxRWErxVELUkCrAkNP89Go6gplEhVvBwJxy82hq0Eu7vDn7ONK5bBO+zsUwYRKSfZiPrC/AgkA2t2u9p+w7atd/xnHq1SOxgf7TmlPFdmQJVW4skAYGSxzCnqiNkNYQUlJ+McRMYudC0XPAazmTBAVul1VR8iIBzdd/smcnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=Z4bBBsGn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O+b3et0U; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 01E287A00D7;
	Thu, 28 May 2026 19:15:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 28 May 2026 19:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780010157;
	 x=1780096557; bh=yg66s9O+SRPyi5J7DC3xp85rl9vs67fv0ciXxbOGHHs=; b=
	Z4bBBsGnBxwPrU6XLDjsZl7M0pJZ2nOdl/k3ZFDB62u+iUhT4iUUGl+ZrMuEO1OZ
	TfBXJg281joygNxFr7Z1f29DZC5ed3IjBSGY0uvVoY2o7YU7MrsVF6Zqcn9CXV81
	ze69HhGkadKPvxiVTLGfEUiaVbje8MYOPtHyiUnvvtQmvRB/7tyWiMZoSXf6iGLx
	Bwlnh4wjRoziUbWYivsVijndyuUvSPfsndvpABXSDM4RIsp6/ooej0m6GBaNp2uT
	8mIRGeXYXk2akVMy/AkCP7W00I4+utdAZP2WyaedHqx88Po3BZNwyF5qa8tJY7zO
	G41ljqG1HNnKvvHRQIUa0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780010157; x=
	1780096557; bh=yg66s9O+SRPyi5J7DC3xp85rl9vs67fv0ciXxbOGHHs=; b=O
	+b3et0UMZTJdVaVlGxlYJW8OzSJTKJq0kPSPG7PMCWcObRcI3KsU+cLrZRvtIC0J
	V3GYzcvEJuDkpB9z4OJQ1r/M5hTM981X+8WVATZghbXvZ+3OOOfH7ppICDhQces4
	R5WN0RVM7AKnR8WzN0TTNk14ujqa6E/ZdCZIK9chuBgGYMHudjTynOPiBwlJ/ruo
	aeMNAi0RP7uV5SlYYGD3zYIvlPeerB5K2FmONrpUTAG2aXyxNosTcmEv0nCyUnyw
	DHc4BphAzSpDk5yOAEqH0QuHg2tfNZkrOdvHMEXaNPSWu6TPY1mGBoXMiv4SkxVU
	4piYn/giEOCGw/Y5rmSeA==
X-ME-Sender: <xms:rcwYasn3PmD58RdH1awJqGILIXWy9Nrgul_-JwT5yI3dI15XOLNQLg>
    <xme:rcwYavxd5BZolWN0XnJU62gq5WY7c6xRJ4wHfC1Jk3qLhynRu-WL2YWp1YJoaPYCg
    LbElY2tDvApFf1tzK1PncvtfrIBPftjqg6O2DBJaZGMnnlJAGk7>
X-ME-Received: <xmr:rcwYajKsuWCCiA_Q4lndhnKzohfYsVNQi8D_Q90c8X4YEm3fAuuBtdkhH58>
X-ME-Proxy-Cause: dmFkZTGz+mBxqcdcSaiyBeR8rvmck9bXPGtwV5plDToDIpYQf9qQyGC2YiXS4ygunX+Nmn
    FHaUbaUe6oG6Xhvtslza91zdB0vTV9sYjwwG7ioFYWSqdRy5UFCOtOnKGCpAf8Xiq+C8jl
    MCfAUKm4YFJheQ6KX/FU7wcXo8/7WG+eGoNGYM3lxed1EA9MZLGde5nABFZKc8PpnDuCjK
    8yRUcyr9f5WETtyMmyLHKi9h3s72aD9DKLi8sd9HlkiXHGl5zZDwko6aPUCz5E9SWNPjqM
    9uV7U86V8/u+dy/2CwCe9rkuZW8diOnv7DZhXA6UtTZNR/xZ6iXLlvo9tamquTmQd1rXGb
    8q6oJcTsyWI5FhxasW/4kAX2T9+wxLn5QN0tWKRY1q8/52tP2OIp00l++it3gArBmXj4pI
    HPzebf9E20y2ASleLJSu4q/TdTGyfPG8BaErZurnYc1G7hIqgerUKUmFsPdu+GQ9BPq/5c
    dSFZpMyxi8ygmGK1rKMMOVJfEDBwYnJZKmHtM+15wGEFf9RKnVhgaaV2AYUTAHcIsN3Pxm
    gSfv35HcuahTRM7Ttj57UkF6B6weNcZC3xhsdnbi8SQfmnDsRMPaMB3C2NTQn4JjLFwXAg
    vby5p69BsDbSArRCdurZQOR8gkFWw3yHTgblLmu4CDIueKlkEV1VZqxQWgpg
X-ME-Proxy: <xmx:rcwYaiJOt4vSeOqxNKCYF7P5zRZL9pDlRg-kQNH8QOjGBs491wNyOQ>
    <xmx:rcwYaiUjX3_qxwxGAJslB43R2G6z4CLFr8wNIdeR07Z_J06cqBmJQQ>
    <xmx:rcwYaqBGejCZ7F0Qm__qHxUKiqgR50qnYNAUa09MJQqUbZidAlsW7A>
    <xmx:rcwYalH49KqnlSsvQE7fhYnR85vpAeEhQUVrhcuxgMzsoCSlwXicAA>
    <xmx:rcwYaiwY7dD-bmzwoVMIi8aW252Fc8QwJ5siw2WbB_WxQph_2dnMcL70>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 19:15:55 -0400 (EDT)
Date: Thu, 28 May 2026 17:14:32 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Logan
 Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, alex@shazbot.org
Subject: Re: [PATCH v2 9/9] vfio/pci: Add mmap() attributes to DMABUF
 feature
Message-ID: <20260528171432.771a1a30@shazbot.org>
In-Reply-To: <20260527102319.100128-10-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-10-mattev@meta.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62989-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,meta.com:email,shazbot.org:mid,shazbot.org:dkim]
X-Rspamd-Queue-Id: CE7135FB62F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:12 -0700
Matt Evans <mattev@meta.com> wrote:

> A new VFIO feature, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR, is added to
> set (and get) CPU-facing memory type attributes for a DMABUF exported
> from vfio-pci.  These are used for subsequent mmap()s of the buffer.
> 
> There are two attributes supported:
>  - The default, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_UC
>  - VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC, which results in WC
>    PTEs for the DMABUF's BAR region.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c   |  2 +
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 70 +++++++++++++++++++++++++++++-
>  drivers/vfio/pci/vfio_pci_priv.h   | 12 +++++
>  include/uapi/linux/vfio.h          | 27 ++++++++++++
>  4 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 5184b3cac160..e256a925e7ce 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1590,6 +1590,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
>  	case VFIO_DEVICE_FEATURE_DMA_BUF:
>  		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR:
> +		return vfio_pci_core_feature_dma_buf_memattr(vdev, flags, arg, argsz);
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 3fa14760898f..db8b95ddbe18 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -42,7 +42,10 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
>  	 * contained within the DMABUF size before calling this.
>  	 */
>  
> -	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	if (READ_ONCE(priv->memattr) == VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC)
> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> +	else
> +		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>  
>  	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
> @@ -464,6 +467,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	priv->vdev = vdev;
>  	priv->nr_ranges = get_dma_buf.nr_ranges;
>  	priv->size = length;
> +	priv->memattr = VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC;
>  	ret = vdev->pci_ops->get_dmabuf_phys(vdev, &priv->provider,
>  					     get_dma_buf.region_index,
>  					     priv->phys_vec, dma_ranges,
> @@ -731,4 +735,68 @@ int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd)
>  
>  	return ret;
>  }
> +
> +int vfio_pci_core_feature_dma_buf_memattr(
> +	struct vfio_pci_core_device *vdev, u32 flags,
> +	struct vfio_device_feature_dma_buf_memattr __user *arg,
> +	size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf_memattr db_attr;
> +	struct vfio_pci_dma_buf *priv;
> +	struct dma_buf *dmabuf;
> +	int ret;
> +
> +	if (!vdev->pci_ops || !vdev->pci_ops->get_dmabuf_phys)
> +		return -EOPNOTSUPP;
> +
> +	ret = vfio_check_feature(flags, argsz,
> +				 VFIO_DEVICE_FEATURE_GET |
> +				 VFIO_DEVICE_FEATURE_SET,
> +				 sizeof(db_attr));

I don't see why this needs to support GET.  Are we solving a userspace
problem that doesn't exist?

> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&db_attr, arg, sizeof(db_attr)))
> +		return -EFAULT;
> +
> +	dmabuf = dma_buf_get(db_attr.dmabuf_fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	/* Verify DMABUF: see comments in vfio_pci_dma_buf_revoke() */
> +	priv = dmabuf->priv;
> +	if (dmabuf->ops != &vfio_pci_dmabuf_ops || priv->vdev != vdev) {
> +		ret = -ENODEV;
> +		goto out_put_buf;
> +	}
> +
> +	ret = 0;
> +	scoped_guard(rwsem_write, &vdev->memory_lock) {

Why?  This doesn't serialize against mmap.  Just use a WRITE_ONCE() to
match the READ_ONCE() on mmap?

> +		uint32_t old_attr = priv->memattr;
> +
> +		if (flags & VFIO_DEVICE_FEATURE_SET) {
> +			switch(db_attr.memattr) {
> +			case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC:
> +			case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC:
> +				priv->memattr = db_attr.memattr;
> +				break;
> +
> +			default:
> +				ret = -ENOTSUPP;

-EINVAL

> +			}
> +		}
> +		db_attr.memattr = old_attr;
> +	}
> +
> +	if (!ret && (flags & VFIO_DEVICE_FEATURE_GET)) {
> +		if (copy_to_user(arg, &db_attr, sizeof(db_attr)))
> +			ret = -EFAULT;
> +	}
> +
> + out_put_buf:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +}
>  #endif /* CONFIG_VFIO_PCI_DMABUF */
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index a1e0f4fcb1dc..8067be45beb0 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -41,6 +41,7 @@ struct vfio_pci_dma_buf {
>  	struct kref kref;
>  	struct completion comp;
>  	unsigned long vma_pgoff_adjust;
> +	u32 memattr;
>  	enum vfio_pci_dma_buf_status status;
>  };
>  
> @@ -154,6 +155,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
>  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  				  struct vfio_device_feature_dma_buf __user *arg,
>  				  size_t argsz);
> +int vfio_pci_core_feature_dma_buf_memattr(
> +	struct vfio_pci_core_device *vdev, u32 flags,
> +	struct vfio_device_feature_dma_buf_memattr __user *arg,
> +	size_t argsz);
>  int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd);
>  #else
>  static inline int
> @@ -163,6 +168,13 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  {
>  	return -ENOTTY;
>  }
> +static inline int vfio_pci_core_feature_dma_buf_memattr(
> +	struct vfio_pci_core_device *vdev, u32 flags,
> +	struct vfio_device_feature_dma_buf_memattr __user *arg,
> +	size_t argsz)
> +{
> +	return -ENODEV;

-ENOTTY

Thanks,
Alex

> +}
>  static inline int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev,
>  					  int dmabuf_fd)
>  {
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 02366e9f8e16..9b0b68f8a1ef 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1564,6 +1564,33 @@ struct vfio_device_feature_dma_buf {
>   */
>  #define VFIO_DEVICE_FEATURE_MIG_PRECOPY_INFOv2  12
>  
> +/**
> + * Given a dma_buf fd previously created by
> + * VFIO_DEVICE_FEATURE_DMA_BUF, GET or SET the memory attribute that
> + * will be used by future mmap()s of that fd.  SETting a new attribute
> + * does not affect existing VMAs.
> + *
> + * The default, if no previous SET has been performed, is NC.
> + *
> + * Return: 0 on success, -1 and errno is set on failure:
> + *
> + *  ENOTSUPP: The given memattr is not supported.
> + *  EBADF, EINVAL: dmabuf_fd is not a DMABUF fd.
> + *  ENODEV: The dmabuf_fd does not match this VFIO device.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR 13
> +
> +/* Valid memory attributes for the memattr field */
> +enum vfio_device_dma_buf_memattr {
> +	VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC = 0, /* pgprot_noncached */
> +	VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC = 1, /* pgprot_writecombine */
> +};
> +
> +struct vfio_device_feature_dma_buf_memattr {
> +	__s32	dmabuf_fd;
> +	__u32	memattr;
> +};
> +
>  /* -------- API for Type1 VFIO IOMMU -------- */
>  
>  /**


