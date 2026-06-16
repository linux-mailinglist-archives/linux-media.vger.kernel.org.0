Return-Path: <linux-media+bounces-64964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i3cvDCsEMWq6aQUAu9opvQ
	(envelope-from <linux-media+bounces-64964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:07:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFB68D09A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=jMFV0eqh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64964-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64964-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EFAC302F7C7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC98E416CF3;
	Tue, 16 Jun 2026 08:05:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC53386564
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:05:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597154; cv=none; b=cXckZ2Lymf7kG9vOlUggEq4/u+TNP8b72tiJ+GHhVsSW0dm28z2naOCvJaH7HzZ7LfXaOrqBJOE0u3N/8wQzGGAihBUECKZo0vTvuZ5EaD4au9eJBTVbI+gfEvrSkI67OsW3EWCQUbs1of8g5wQbDvmg5hzVU/J0w+Nzh8Uxzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597154; c=relaxed/simple;
	bh=82cTAyW+sZXW13gP4ib75YclIp3CSrYl7g+tdMUCv3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJtNOhMEDbbcEqWk3YnsO0sFdVIQ/kUNEV2ih2hDSGPOewSMJ3mO6KAeQdluYiTdFTkV7rRB0pMbtC0JRI9AjkszjXm2Wcn/kPwh3KwSTZX7Pf04fDey5zckeQVpcgp0C9OiHczyVqgA31sejBs2lBMkWzi8MSNPhkGZ6Sn0CK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jMFV0eqh; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2d865383so28985ad.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781597151; x=1782201951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOsiBDHauJNUL/mHLBlXDW8Xe2gvOcwU/fMCh1N6uL8=;
        b=jMFV0eqh6/zz9XTZeBSPAGCpdF2pouVCsfKBKgAUmQ5ODxYi6nC9pkFUQJEUc/xDNm
         0aPtGTlHR6NFlBLKUF5ZRpax/F6sjPVCgc3xkCJZOdAWx1tROAJQRjC2S/+5qZV2Krq4
         iz3fVngb9KU6ybAqWt/KhPnK1WpomcEspJofFBbQNLjlc2be+eh3xtLzPLmitoS4qqVP
         b5g6/WKw5t3xuQDsWmZiNq7cNILfmKVtintn7c695vvWdpVw18NWOy2Yzrf0LY61bDoR
         VQ1LpgNio6okg62mJkFO48PMQ5cwWKgRyFnJ6MA1jpOq3yzjsZEMt1Q9RhQQsh6LK0tO
         TeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597151; x=1782201951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOsiBDHauJNUL/mHLBlXDW8Xe2gvOcwU/fMCh1N6uL8=;
        b=saFg4DsPTmPa2gVb2sKb6LWLEExbd9VQEjmNfSHcPTeUvPuG4qPcEDx4uLSyDwJzju
         y2BXG6o4+Ay7pzjeT17MiOSeZZbgGJf6toKVQZEhvo9J519nDNfk6S02SCctn54YEXzD
         L2a4WA5f+PBTvG54rBiU2pFkE0Hi349ISqRUGYp3J/Ak0cnisPiCe9q0hP5jDWpnPkzK
         6FYeocgXUbGQBmKiLcvrGUzb3wahB4LnFodkEPhr1fUxdL1B8G716rKZhktjKWvYprAo
         q79FDiSYpl6YoEE+nD69f5/NsEYeu9418KaV0g9gEMu21atDtX6CePyopzuXzurNH4MS
         pz3w==
X-Forwarded-Encrypted: i=1; AFNElJ8y4YKA2SP2GE9eS0EDsZRQ5zKaRyt68OJ8EAu9MbgkHOtSgEaVFYgTUXSlnhv1G7r0AirJrMl7lCBBug==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8TnWNRHgHQ6myxTeBx4AqC4N4DZaICYSDZGrXy9htXZGJk5g
	reFWOMw2ujoV3r1BuaRi5WVJeePWm8CCheVmHYYHW1s5wsfzwGYXsi+mg95FbsQapQ==
X-Gm-Gg: Acq92OEMo3jK3iiIP0jczEWLX3Z6JcYad4rPuKQjiI0aetuml84HaJCzfJR0ogoO4zz
	uS9UFNYsw2lQpX8mkXP8V532pDYCVf/R6K7G03azrIXZeDUkJaWDaVmXu4QRcirC+MaZ02RjgQJ
	sCg8o3TO7BphMNKQtoYHrefmIRZWSUspSWgVRImT+qXz7lQnmbzA1G/E9Om/nT5D0HlCeKYDXXR
	bluof7jLTvmmxuWoxOqPkp7CZg6OWAaDHgAB7KQN1+O19S3kMT/cFUh35TAEyDVRjGaFDGmwg55
	DzjHYbUj6c8xgIv8dGbgqNfOoioZFzaRcB9GF1PLSrUyoXRhfFsUc4vtTq7l4ELPa9B3McLiltr
	8gD+Amq00FgsDOd2guFn1iA/F9gNzJwMlOS1TqZT1blwI8Q1DnwHAXYZxFQ9lNxc2gjuk9JGcR8
	b8k5R87VuosLATDcyTCVKa8w5TAuwkMuV+WaN3FenIR620+KMX9DcYTihGkAUD
X-Received: by 2002:a17:903:1b0e:b0:2bd:6dad:7cca with SMTP id d9443c01a7336-2c69a357a8cmr1809945ad.22.1781597150664;
        Tue, 16 Jun 2026 01:05:50 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm12271540b3a.8.2026.06.16.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:05:50 -0700 (PDT)
Date: Tue, 16 Jun 2026 08:05:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 8/9] vfio/pci: Permanently revoke a DMABUF on request
Message-ID: <ajED1v846hZkyq9z@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-9-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-9-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64964-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCVD_TLS_LAST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out,ozlabs.org:query timed out];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out,ozlabs.org:query timed out];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RBL_SEM_FAIL(0.00)[172.105.105.114:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0DFB68D09A

On Wed, Jun 10, 2026 at 04:43:22PM +0100, Matt Evans wrote:
> Expand the VFIO DMABUF revocation state to three states:
> Not revoked, temporarily revoked, and permanently revoked.
> 
> The first two are for existing transient revocation, e.g. across a
> function reset, and the DMABUF is put into the last in response to a
> new VFIO feature VFIO_DEVICE_FEATURE_DMA_BUF.
> 
> VFIO_DEVICE_FEATURE_DMA_BUF passes a DMABUF by fd and requests that
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
> function common to move and the new feature request path.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/vfio/pci/vfio_pci_core.c   |   6 +-
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 169 ++++++++++++++++++++++-------
>  drivers/vfio/pci/vfio_pci_priv.h   |  19 +++-
>  include/uapi/linux/vfio.h          |  20 ++++
>  4 files changed, 173 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 508a5eca910a..064906b25467 100644

[...]

>  
> +/* Set the DMABUF's revocation status (OK or temporarily/permanently revoked) */
> +static void vfio_pci_dma_buf_set_status(struct vfio_pci_dma_buf *priv,
> +					enum vfio_pci_dma_buf_status new_status)
> +{
> +	bool was_revoked;
> +
> +	lockdep_assert_held_write(&priv->vdev->memory_lock);
> +
> +	if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED ||
> +	    priv->status == new_status) {
> +		return;
> +	}
> +
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	was_revoked = (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED);
> +
> +	if (new_status != VFIO_PCI_DMABUF_OK) {
> +		priv->status = new_status; /* Temp or permanently revoked */
> +
> +		if (was_revoked) {
> +			/*
> +			 * TEMP_REVOKED is being upgraded to
> +			 * PERM_REVOKED.  The buffer is already gone,
> +			 * don't wait on it again.
> +			 */
> +			dma_resv_unlock(priv->dmabuf->resv);
> +			return;
> +		}
> +	}
> +
> +	dma_buf_invalidate_mappings(priv->dmabuf);

Nit: We seem to be calling this even if new_status == OK, while it works
as importers (like IOMMUFD and RDMA core) are immune to a double 
invalidate / revoke. I'm wondering if we could move this within the 
if (new_status != VFIO_PCI_DMABUF_OK) block? 

Since this is only needed to be called when we TEMP/PERM _REVOKE?

I'm just worried that this may overload the dma_buf_invalidate_mappings 
to be a state-change notification instead of a revoke / invalidate
notification.

> +	dma_resv_wait_timeout(priv->dmabuf->resv,
> +			      DMA_RESV_USAGE_BOOKKEEP, false,
> +			      MAX_SCHEDULE_TIMEOUT);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	if (new_status != VFIO_PCI_DMABUF_OK) {
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait_for_completion(&priv->comp);
> +		unmap_mapping_range(priv->dmabuf->file->f_mapping,
> +				    0, priv->size, 1);
> +		/*
> +		 * Re-arm the registered kref reference and the
> +		 * completion so the post-revoke state matches the
> +		 * post-creation state.	 An un-revoke followed by a
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

Otherwise, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

