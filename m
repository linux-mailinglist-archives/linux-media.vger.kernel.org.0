Return-Path: <linux-media+bounces-62992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKDPHJbNGGpjnggAu9opvQ
	(envelope-from <linux-media+bounces-62992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:19:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C75FB58B
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 872A030D0FF0
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312C8371045;
	Thu, 28 May 2026 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="dFNYGu0d";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="My/DyPkH"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF336B048;
	Thu, 28 May 2026 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010169; cv=none; b=UNnJdrorQDQx8m0H4sQAUr282G0D+nEJ5F8IgZepKIbTdT+WSFq0EgDsGw+kBttC/WIXotY9CJIia7JT38YffD0vwaaELWyj5+prxWFUTEnEXrRuI3E2LoX/IqFO1cMRJ1ZKFSczp4Eo/ednnR/0nyDmEziTPdfGB8kyjeV8C1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010169; c=relaxed/simple;
	bh=8OiYccxtZCklc+vWU0XG4fzPLsDjfe9YS+urYtfHSPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PL33yxwMyVEO32R1zbHzNwP0cOde4m1KJJsRIxsBN8mSoKZm2zY3jAXFmfUI3xyK/KGvq/iWba7e3LLdJfLcsyCSJ0GFBY7RrYf+Cfu8CUjuld0SRSfdO15IT8wI7iT72EeVKA13jLYOmoGbZx2qVyMBGNTg22ESBdEVo/Hkae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=dFNYGu0d; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=My/DyPkH; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 60B4B7A00E1;
	Thu, 28 May 2026 19:16:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 28 May 2026 19:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780010166;
	 x=1780096566; bh=ucX6gS7oqPPbzpRc51QcDJWoRI+gmZbMAv7EHbC+Mqg=; b=
	dFNYGu0dFOQhio4WehcliNq4Zjh65rDegPNClbixnGjd54N2oaTnyNzVD2XOkUCm
	61W8TxF8iGlbUjzxYIrdHGXxV4mpDEkaoYxIcfBIOkva92mxCWjrNCOcxsaIupkS
	KWpdrRxXEWG02oGuUwKgReKsq2I69ogzgn+vsohrazsbL3QOZnPfleyAJlBLWv9A
	mB0R5e+A7aiY9txdRQ/vi6Yy2g/LVXeakIZ4GyVxOX7ugYoKi/yr+wLqaY0FA+8V
	dMlDw0+cSlQW4SvfP3vxvttM8cYBVQXMIiD6y4+miQsWtTNWKoNvYOdU6BZY/1PD
	8xcoBZqmeeCpgD9BJSzSyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780010166; x=
	1780096566; bh=ucX6gS7oqPPbzpRc51QcDJWoRI+gmZbMAv7EHbC+Mqg=; b=M
	y/DyPkH/JUXxmKcCRyaZSlzrqkZ4kKkPdG4fvfIZ+orWLHa1/we+7epvQyi6mbtE
	d7r37a91jlkpwEFnJ/bxVZdJFvZ3E5EkGH/5+9Kjy/t7/zCZgUK+H0vU2yxunEfk
	amb9dHVo4tTzxpZxL3RLSKgOg0cFJ9RuHFbUwfd57wFZBTJF7EtYTP486RIOaoIa
	oRDKrex0F5THzz6wKXZAfzktlN5y6tOS9WeTCsZgZ/Pap0si1lgo3H4/CNlnzgM/
	jn1KEv195AnRsIZspszseWU2tuP4lTer3PFQVRSaUJnemc+qAz/NFZqpR1S5dsCO
	LHD3L9f2TZruVyYe6F62A==
X-ME-Sender: <xms:tcwYathiWsPd1vb64qA-0t09Vuj9ebW4mxQVLJ3WnJc_si3cmrErwQ>
    <xme:tcwYatv1DN6AE6ZQbeszv0ja6c2HSezadL0BPyVupzTbs4HXziXwv9U8dZCnLnHr5
    PvzDF2Hn_jLVxLjPnIZlXWAd5FX5XXebKAvHY8V54izQmE-BjCQ>
X-ME-Received: <xmr:tcwYanzJk1w2e8EZPYr80CFkzLYt6RTaZp4eWAkOa5Pa6aaB0-qEzHhaTts>
X-ME-Proxy-Cause: dmFkZTGz+mBxqcdcSaiyBeR8rvmck9bXPGtwV5plDToDIpYQf9qQyGC2YiXS4ygunX+Nmn
    FHaUbaUe6oG6Xhvtslza91zdB0vTV9sYjwwG7ioFYWSqdRy5UFCOtOnKGCpAf8Xiq+C8jl
    MCfAUKm4YFJheQ6KX/FU7wcXo8/7WG+eGoNGYM3lxed1EA9MZLGde5nABFZKc8PpnDuCjK
    8yRUcyr9f5WETtyMmyLHKi9h3s72aD9DKLi8sd9HlkiXHGl5zZDwko6aPUCz5E9SWNPjqM
    9uV7U86V8/u+dy/2CwCe9rkuZW8diOnv7DZhXA6UtTZNR/xZ6iXLlvo9tamquTmQd1rXGX
    Op23nzZnCXLaPvLVT8ZrudeA0FZXRbcOg17exzCJ/bCAtjIVuCLl9Yj4/8eORHzZscPame
    yYNBO+HKQTQv2Z55l7oW5k6FFZWlxxPNCyb6aAtVY8Rj1hIZ2jHl1Oic18YGJVWQ//0YzN
    iMoVsEbP9C31fVu8goOouvHCofK59rnPUMT3tD6r3a8xceblJuhPRfiSZuKBWyIGpO32US
    ZAM6QhJYzJ//ji0biTWPj4eBYMuli8r58Qh/XA+AydmknwefyP1dk/f7ttp6VfsYRDEaGh
    N4jAaBPyFaFFbCB3230IGbR++GN6ZIHB0cfDX23hUkealFFeRonHgeAtxt/w
X-ME-Proxy: <xmx:tcwYajN5bEYXhwx7wSwQU6a_m5-tIbRVblwAeTbKfDCitf4kSnCnlA>
    <xmx:tcwYap2s1K5Y1b3PqiZ_KFEIcesnn_uWFZjZ_sP3YfuzFCt0FWyOhw>
    <xmx:tcwYarGdOjxqM-35sSDMv9zzvYWHoEBGS9omQyAyYtro3qNaINV-mA>
    <xmx:tcwYagh9lvrRUBBwE1TcfYe5IJTT9rCbiWxxQobpexRf8FbMjG16fQ>
    <xmx:tswYatmslSsIphF7A7LtGoI1RltHmRzi0JZU0mpPJjBbRvuS2_Z5nSRv>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 19:16:04 -0400 (EDT)
Date: Thu, 28 May 2026 17:14:46 -0600
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
Subject: Re: [PATCH v2 8/9] vfio/pci: Permanently revoke a DMABUF on request
Message-ID: <20260528171446.544fc486@shazbot.org>
In-Reply-To: <20260527102319.100128-9-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-9-mattev@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62992-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,messagingengine.com:dkim,meta.com:email,shazbot.org:mid,shazbot.org:dkim]
X-Rspamd-Queue-Id: E53C75FB58B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:11 -0700
Matt Evans <mattev@meta.com> wrote:

> Expand the VFIO DMABUF revocation state to three states:
> Not revoked, temporarily revoked, and permanently revoked.
> 
> The first two are for existing transient revocation, e.g. across a
> function reset, and the DMABUF is put into the last in response to a
> new ioctl(VFIO_DEVICE_PCI_DMABUF_REVOKE) request.

The DMABUF is created via a VFIO_DEVICE_FEATURE ioctl and you next
patch is setting attributes via another VFIO_DEVICE_FEATURE, why would
the REVOKE operation not also be a VFIO_DEVICE_FEATURE?

> This VFIO device fd ioctl() passes a DMABUF by fd and requests that
> the DMABUF is permanently revoked.  On success, it's guaranteed that
> the buffer can never be imported/attached/mmap()ed in future, that
> dynamic imports have been cleanly detached, and that all mappings have
> been made inaccessible/PTEs zapped.
> 
> This is useful for lifecycle management, to reclaim VFIO PCI BAR
> ranges previously delegated to a subordinate client process: The
> driver process can ensure that the loaned resources are revoked when
> the client is deemed "done", and exported ranges can be safely re-used
> elsewhere.
> 
> Refactor the revocation code out of vfio_pci_dma_buf_move() to a
> function common to move and the new ioctl path.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c   |  21 ++++-
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 146 +++++++++++++++++++++--------
>  drivers/vfio/pci/vfio_pci_priv.h   |  14 ++-
>  include/uapi/linux/vfio.h          |  30 ++++++
>  4 files changed, 170 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 41e049fa9a8a..5184b3cac160 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1500,6 +1500,21 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
>  				  ioeventfd.fd);
>  }
>  
> +static int vfio_pci_ioctl_dmabuf_revoke(struct vfio_pci_core_device *vdev,
> +					struct vfio_pci_dmabuf_revoke __user *arg)
> +{
> +	unsigned long minsz = offsetofend(struct vfio_pci_dmabuf_revoke, dmabuf_fd);
> +	struct vfio_pci_dmabuf_revoke revoke;
> +
> +	if (copy_from_user(&revoke, arg, minsz))
> +		return -EFAULT;
> +
> +	if (revoke.argsz < minsz)
> +		return -EINVAL;
> +
> +	return vfio_pci_dma_buf_revoke(vdev, revoke.dmabuf_fd);
> +}
> +
>  long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  			 unsigned long arg)
>  {
> @@ -1522,6 +1537,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  		return vfio_pci_ioctl_reset(vdev, uarg);
>  	case VFIO_DEVICE_SET_IRQS:
>  		return vfio_pci_ioctl_set_irqs(vdev, uarg);
> +	case VFIO_DEVICE_PCI_DMABUF_REVOKE:
> +		return vfio_pci_ioctl_dmabuf_revoke(vdev, uarg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -1792,7 +1809,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  	dma_resv_lock(priv->dmabuf->resv, NULL);
>  	vdev = READ_ONCE(priv->vdev);
>  
> -	if (priv->revoked || !vdev) {
> +	if (priv->status != VFIO_PCI_DMABUF_OK || !vdev) {
>  		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
>  				     __func__, vmf->address, vma->vm_pgoff);
>  		dma_resv_unlock(priv->dmabuf->resv);
> @@ -1815,7 +1832,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  
>  	scoped_guard(rwsem_read, &vdev->memory_lock) {
>  		/* Revocation status must be re-read, under memory_lock */
> -		if (!priv->revoked) {
> +		if (priv->status == VFIO_PCI_DMABUF_OK) {
>  			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
>  							     vmf->address,
>  							     order, &pfn);
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 4b3b15655f1d..3fa14760898f 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -19,7 +19,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	if (!attachment->peer2peer)
>  		return -EOPNOTSUPP;
>  
> -	if (priv->revoked)
> +	if (priv->status != VFIO_PCI_DMABUF_OK)
>  		return -ENODEV;
>  
>  	if (!dma_buf_attach_revocable(attachment))
> @@ -32,7 +32,7 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
>  {
>  	struct vfio_pci_dma_buf *priv = dmabuf->priv;
>  
> -	if (priv->revoked)
> +	if (priv->status != VFIO_PCI_DMABUF_OK)
>  		return -ENODEV;
>  	if ((vma->vm_flags & VM_SHARED) == 0)
>  		return -EINVAL;
> @@ -72,7 +72,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>  
>  	dma_resv_assert_held(priv->dmabuf->resv);
>  
> -	if (priv->revoked)
> +	if (priv->status != VFIO_PCI_DMABUF_OK)
>  		return ERR_PTR(-ENODEV);
>  
>  	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> @@ -287,7 +287,8 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
>  	INIT_LIST_HEAD(&priv->dmabufs_elm);
>  	down_write(&vdev->memory_lock);
>  	dma_resv_lock(priv->dmabuf->resv, NULL);
> -	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> +	priv->status = __vfio_pci_memory_enabled(vdev) ? VFIO_PCI_DMABUF_OK :
> +		VFIO_PCI_DMABUF_TEMP_REVOKED;
>  	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
>  	dma_resv_unlock(priv->dmabuf->resv);
>  	up_write(&vdev->memory_lock);
> @@ -318,7 +319,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
>  		return -EOPNOTSUPP;
>  
>  	priv = attachment->dmabuf->priv;
> -	if (priv->revoked)
> +	if (priv->status != VFIO_PCI_DMABUF_OK)
>  		return -ENODEV;
>  
>  	/* More than one range to iommufd will require proper DMABUF support */
> @@ -585,6 +586,63 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  	return ret;
>  }
>  
> +static void __vfio_pci_dma_buf_revoke(struct vfio_pci_dma_buf *priv, bool revoked,
> +				      bool permanently)

If the underscore prefix is mean to imply the lock semantics, that's
explicit with the annotation below and can be dropped.

The double bool args are not very intuitive to use and the [false,
true] combination is rather invalid.  Why not an enum:

enum vfio_pci_dma_buf_revoke_action {
	VFIO_PCI_DMABUF_REVOKE_RESTORE,
	VFIO_PCI_DMABUF_REVOKE_TEMPORARY,
	VFIO_PCI_DMABUF_REVOKE_PERMANENT,
};

> +{
> +	bool was_revoked;
> +
> +	lockdep_assert_held_write(&priv->vdev->memory_lock);
> +
> +	if ((priv->status == VFIO_PCI_DMABUF_PERM_REVOKED) ||
> +	    (priv->status == VFIO_PCI_DMABUF_OK && !revoked) ||
> +	    (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED && revoked && !permanently)) {
> +		return;
> +	}
> +
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	was_revoked = priv->status != VFIO_PCI_DMABUF_OK;
> +
> +	if (revoked)
> +		priv->status = permanently ? VFIO_PCI_DMABUF_PERM_REVOKED :
> +			VFIO_PCI_DMABUF_TEMP_REVOKED;
> +
> +	/*
> +	 * If TEMP_REVOKED is being upgraded to PERM_REVOKED, the
> +	 * buffer is already gone.  Don't wait on it again.
> +	 */
> +	if (was_revoked && revoked) {
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		return;
> +	}
> +
> +	dma_buf_invalidate_mappings(priv->dmabuf);
> +	dma_resv_wait_timeout(priv->dmabuf->resv,
> +			      DMA_RESV_USAGE_BOOKKEEP, false,
> +			      MAX_SCHEDULE_TIMEOUT);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	if (revoked) {
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait_for_completion(&priv->comp);
> +		unmap_mapping_range(priv->dmabuf->file->f_mapping,
> +				    0, priv->size, 1);
> +		/*
> +		 * Re-arm the registered kref reference and the
> +		 * completion so the post-revoke state matches the
> +		 * post-creation state.  An un-revoke followed by a
> +		 * new mapping needs the kref to be non-zero before
> +		 * kref_get(), and vfio_pci_dma_buf_cleanup()
> +		 * delegates its drain back through this revoke
> +		 * path on a possibly-already-revoked dma-buf.
> +		 */
> +		kref_init(&priv->kref);
> +		reinit_completion(&priv->comp);
> +	} else {
> +		dma_resv_lock(priv->dmabuf->resv, NULL);
> +		priv->status = VFIO_PCI_DMABUF_OK;
> +		dma_resv_unlock(priv->dmabuf->resv);
> +	}
> +}
> +
>  void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  {
>  	struct vfio_pci_dma_buf *priv;
> @@ -593,44 +651,13 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	lockdep_assert_held_write(&vdev->memory_lock);
>  	/*
>  	 * Holding memory_lock ensures a racing VMA fault observes
> -	 * priv->revoked properly.
> +	 * priv->status properly.
>  	 */
>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
> -
> -		if (priv->revoked != revoked) {
> -			dma_resv_lock(priv->dmabuf->resv, NULL);
> -			if (revoked)
> -				priv->revoked = true;
> -			dma_buf_invalidate_mappings(priv->dmabuf);
> -			dma_resv_wait_timeout(priv->dmabuf->resv,
> -					      DMA_RESV_USAGE_BOOKKEEP, false,
> -					      MAX_SCHEDULE_TIMEOUT);
> -			dma_resv_unlock(priv->dmabuf->resv);
> -			if (revoked) {
> -				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> -				wait_for_completion(&priv->comp);
> -				unmap_mapping_range(priv->dmabuf->file->f_mapping,
> -						    0, priv->size, 1);
> -				/*
> -				 * Re-arm the registered kref reference and the
> -				 * completion so the post-revoke state matches the
> -				 * post-creation state.  An un-revoke followed by a
> -				 * new mapping needs the kref to be non-zero before
> -				 * kref_get(), and vfio_pci_dma_buf_cleanup()
> -				 * delegates its drain back through this revoke
> -				 * path on a possibly-already-revoked dma-buf.
> -				 */
> -				kref_init(&priv->kref);
> -				reinit_completion(&priv->comp);
> -			} else {
> -				dma_resv_lock(priv->dmabuf->resv, NULL);
> -				priv->revoked = false;
> -				dma_resv_unlock(priv->dmabuf->resv);
> -			}
> -		}
> +		__vfio_pci_dma_buf_revoke(priv, revoked, false);
>  		fput(priv->dmabuf->file);
>  	}
>  }
> @@ -662,3 +689,46 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  	}
>  	up_write(&vdev->memory_lock);
>  }
> +
> +#ifdef CONFIG_VFIO_PCI_DMABUF
> +int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct dma_buf *dmabuf;
> +	int ret = 0;
> +
> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	priv = dmabuf->priv;
> +	/*
> +	 * Sanity-check the DMABUF is really a vfio_pci_dma_buf _and_
> +	 * relates to the VFIO device it was provided with.
> +	 *
> +	 * If the DMABUF relates to this vdev then priv->vdev is
> +	 * stable because this open fd prevents cleanup.
> +	 *
> +	 * If it relates to a different vdev, reading priv->vdev might
> +	 * race with a concurrent cleanup on that device.  But if so,
> +	 * it points to a non-matching vdev or NULL and is unusable
> +	 * either way.
> +	 */
> +	if (dmabuf->ops != &vfio_pci_dmabuf_ops || priv->vdev != vdev) {
> +		ret = -ENODEV;
> +		goto out_put_buf;
> +	}
> +
> +	scoped_guard(rwsem_write, &vdev->memory_lock) {
> +		if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED)
> +			ret = -EBADFD;
> +		else
> +			__vfio_pci_dma_buf_revoke(priv, true, true);
> +	}
> +
> + out_put_buf:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +#endif /* CONFIG_VFIO_PCI_DMABUF */
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index db2e2aeae88f..a1e0f4fcb1dc 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -23,6 +23,12 @@ struct vfio_pci_ioeventfd {
>  	bool			test_mem;
>  };
>  
> +enum vfio_pci_dma_buf_status {
> +	VFIO_PCI_DMABUF_OK = 0,
> +	VFIO_PCI_DMABUF_TEMP_REVOKED = 1,
> +	VFIO_PCI_DMABUF_PERM_REVOKED = 2,
> +};
> +
>  struct vfio_pci_dma_buf {
>  	struct dma_buf *dmabuf;
>  	struct vfio_pci_core_device *vdev;
> @@ -35,7 +41,7 @@ struct vfio_pci_dma_buf {
>  	struct kref kref;
>  	struct completion comp;
>  	unsigned long vma_pgoff_adjust;
> -	u8 revoked : 1;
> +	enum vfio_pci_dma_buf_status status;
>  };
>  
>  extern const struct vm_operations_struct vfio_pci_mmap_ops;
> @@ -148,6 +154,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
>  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  				  struct vfio_device_feature_dma_buf __user *arg,
>  				  size_t argsz);
> +int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev, int dmabuf_fd);
>  #else
>  static inline int
>  vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> @@ -156,6 +163,11 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  {
>  	return -ENOTTY;
>  }
> +static inline int vfio_pci_dma_buf_revoke(struct vfio_pci_core_device *vdev,
> +					  int dmabuf_fd)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  #endif
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 5de618a3a5ee..02366e9f8e16 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1321,6 +1321,36 @@ struct vfio_precopy_info {
>  
>  #define VFIO_MIG_GET_PRECOPY_INFO _IO(VFIO_TYPE, VFIO_BASE + 21)
>  
> +/**
> + * VFIO_DEVICE_PCI_DMABUF_REVOKE - _IO(VFIO_TYPE, VFIO_BASE + 22)
> + *
> + * This ioctl is used on the device FD, and requests that access to
> + * the buffer corresponding to the DMABUF FD parameter is immediately
> + * and permanently revoked.  On successful return, the buffer is not
> + * accessible through any mmap() or dma-buf import.  The request fails
> + * if the buffer is pinned; otherwise, the exporter marks the buffer
> + * as inaccessible and uses the move_notify callback to inform
> + * importers of the change.  The buffer is permanently disabled, and
> + * VFIO refuses all map, mmap, attach, etc. requests.
> + *
> + * Returns:
> + *
> + * Return: 0 on success, -1 and errno set on failure:
> + *
> + *  ENODEV if the associated dmabuf FD no longer exists/is closed,

These actually seem to map to EBADF/EINVAL.  Thanks,

Alex

> + *         or is not a DMABUF created for this device.
> + *  EINVAL if the dmabuf_fd parameter isn't a DMABUF.
> + *  EBADF if the dmabuf_fd parameter isn't a valid file number.
> + *  EBADFD if the buffer has already been revoked.
> + *
> + */
> +struct vfio_pci_dmabuf_revoke {
> +	__u32 argsz;
> +	__s32 dmabuf_fd;
> +};
> +
> +#define VFIO_DEVICE_PCI_DMABUF_REVOKE _IO(VFIO_TYPE, VFIO_BASE + 22)
> +
>  /*
>   * Upon VFIO_DEVICE_FEATURE_SET, allow the device to be moved into a low power
>   * state with the platform-based power management.  Device use of lower power


