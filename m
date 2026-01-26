Return-Path: <linux-media+bounces-51592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLshD6vVd2mFlwEAu9opvQ
	(envelope-from <linux-media+bounces-51592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 21:59:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B078D66A
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 21:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A7A309CA3C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 20:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87DC2D8777;
	Mon, 26 Jan 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MtdS85bE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969AC2D8798
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460849; cv=none; b=R9pUh2ZKR/9zmDZv++/e6FjU80Y82/HQw6mj0jGw2hhW73ZabbM6w2feVDoiGfwiZcsdZEJpp+riplRsybsk6064WvuA9QOiwrK86JRPQ/sB9xVz3+K9Rac1e2LI/3qAqzUlQivEL3i5IClMYB9LN+elK51kkz6HVjU4VOxFTqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460849; c=relaxed/simple;
	bh=RchACan6pmnNROmj5Nm+BsCnm9+nHETTFHN4ErlJ6d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkXpUwzInTLZxWb86+iGWsLdiK+uCpIZCJ5a2+3NK6r6OKgYHQ6yXt6XSgRd+QM1V2pJe8qF1Xq1j6KFxRGGOeqT+T6lytae1go8TtPRVBdXGCB19UOl2PD8GTxLZBcC4eEi/uZy3xWZTmPLE3KchmsUUEVl5UPQTv7V5PTCU6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MtdS85bE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d06cfa93so3295ad.1
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769460847; x=1770065647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzbl67LvVO3G9O2kTwPWCnjF6/j6A2BV5AiFShhPhBU=;
        b=MtdS85bEmPCF9PABaN2M8z662QvfgqigeCFIwCmgtYUB4BNwl31VMJHvL+yuyWNQLY
         nu+ZRUVpwkUBLkjdwy0ezW0SLL89wNyCCkySjj9i/TR66JSFDS4VbOx+5hy/ukiuAki9
         DCpMuP3Vlw2DhS+1ZQm7CbRvi9VKrO0nqpR51xOe/Hh4o+8IoDTfyUL9VsBlq1++JQ5F
         BE/7hRWq1RCtEBtqy+CDAIt1vyuxPzURlbppF6VNgdhbYP0PsjopRGkEAyYBqMIQyaqO
         p6cSfBErHx5L0n9AdZbQqqvcu/l14Ivoh9tZOrBw2CrI4wikMTBcuRHiUgJKa4kUFKr2
         0q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769460847; x=1770065647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hzbl67LvVO3G9O2kTwPWCnjF6/j6A2BV5AiFShhPhBU=;
        b=e/suUq1FztiueF/oL7sv4dHKbw2I30y+Bp5F9/RdI/hf+ow6ncx9LmxPCHvNLGoJeg
         TSdLzfAy3ieh28BGQEgWV4VOSAfFxFXjplonCnPQcapqgYO1r0ijKwwYpNtmgRwoSFP+
         SOyZdv0z/O1eZyxyshuI0X9A1IqFy/w4L3FT9Gc4gdVo8auxm37YyN6PLEL1lhlbD2Lq
         DM6GeNvjO91HeFVfJE0Szd6EcWtpzGEYS1T+8Sc2rEpOmAlxkN/JDL6LZq4uwMzbiw9D
         VWO7KFA4px7YsY7MLVh4frzsVCbRKzOZGcHVMs69YecOexTdfTtuKhTEI9iIWFVnK6Ds
         LFTg==
X-Forwarded-Encrypted: i=1; AJvYcCXuYPgvWEZM2ehSlBrTnf6bN4aMW4KVLvp13GCZYdm9rikOkJXriC15UynOnXAzSnl7S1D1MN1dm4hydw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5LvSJiyOd0sy1ltHFo5kg87CDQrtnDCHTtdpzXPmASak9LQDz
	VFPqgPbst16wKnrlAB4yZxxkJZiflO0QiaYvfPPytMA/YFP6w8WZuRxxzcUnfng2uQ==
X-Gm-Gg: AZuq6aI/E3IwXsimB4neGaXTqBKKiJxiEvliWQZlmNiUsSz4QmIr8I8/jSTJuGmucoV
	XwvG7gfWb+beJvQHtxXOU5bJsEeFLdlieIwgLsRmpWW5g3AuHqcDtLoAqNRF8jLvAfa9qWdXvoc
	wc/fMbhsFq6+eGufLZq5XDWqJc2u+nK22PzsTDGHeMVOdjdB6epO96wHMelnKF3NMxJuREBUqCo
	JzoDGjALP+ZHIjfB17UyXXa25+K75X42B0cMAI8mjkv6JYEHWCd4f+OeBee/x/O9xQVMsxgb1L9
	d7PgLYoQvoJjfgOcDz94gJVdAn28lVxpzjlJNgaKuUVrMeazMzMPz5ux0H5cEs2zeNFfRjXrknO
	hz7OdJPHb5BBT4F/1Pf7rYEMBIoibyf+ZuFHcZuUkwpjfGdLSqn5NkRMRs/XCo9gClqcSyMVTZ0
	bC3CoKuW3HVh3rZiG7DOy+LtLZbNde9uKn5BqCdIAP0p6D49I/
X-Received: by 2002:a17:903:1cc:b0:295:5405:46be with SMTP id d9443c01a7336-2a8447fe3b6mr3809735ad.1.1769460846094;
        Mon, 26 Jan 2026 12:54:06 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fda160sm94991165ad.88.2026.01.26.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 12:54:05 -0800 (PST)
Date: Mon, 26 Jan 2026 20:53:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <aXfUZcSEr9N18o6w@google.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-51592-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82B078D66A
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 09:14:16PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is handled asynchronously by the hardware, so VFIO
> must wait until all affected objects have been fully invalidated.
> 
> In addition, the dma-buf exporter is expecting that all importers unmap any
> buffers they previously mapped.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 71 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d8ceafabef48..485515629fe4 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -17,6 +17,8 @@ struct vfio_pci_dma_buf {
>  	struct dma_buf_phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
>  	u32 nr_ranges;
> +	struct kref kref;
> +	struct completion comp;
>  	u8 revoked : 1;
>  };
>  
> @@ -44,27 +46,46 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	return 0;
>  }
>  
> +static void vfio_pci_dma_buf_done(struct kref *kref)
> +{
> +	struct vfio_pci_dma_buf *priv =
> +		container_of(kref, struct vfio_pci_dma_buf, kref);
> +
> +	complete(&priv->comp);
> +}
> +
>  static struct sg_table *
>  vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>  		     enum dma_data_direction dir)
>  {
>  	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct sg_table *ret;
>  
>  	dma_resv_assert_held(priv->dmabuf->resv);
>  
>  	if (priv->revoked)
>  		return ERR_PTR(-ENODEV);
>  
> -	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> -				       priv->phys_vec, priv->nr_ranges,
> -				       priv->size, dir);
> +	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> +				      priv->phys_vec, priv->nr_ranges,
> +				      priv->size, dir);
> +	if (IS_ERR(ret))
> +		return ret;
> +
> +	kref_get(&priv->kref);
> +	return ret;
>  }
>  
>  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
>  				   struct sg_table *sgt,
>  				   enum dma_data_direction dir)
>  {
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
>  	dma_buf_free_sgt(attachment, sgt, dir);
> +	kref_put(&priv->kref, vfio_pci_dma_buf_done);
>  }
>  
>  static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> @@ -287,6 +308,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  		goto err_dev_put;
>  	}
>  
> +	kref_init(&priv->kref);
> +	init_completion(&priv->comp);
> +
>  	/* dma_buf_put() now frees priv */
>  	INIT_LIST_HEAD(&priv->dmabufs_elm);
>  	down_write(&vdev->memory_lock);
> @@ -326,6 +350,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	lockdep_assert_held_write(&vdev->memory_lock);
>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
>  			dma_buf_invalidate_mappings(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_BOOKKEEP, false,
> +					      MAX_SCHEDULE_TIMEOUT);
>  			dma_resv_unlock(priv->dmabuf->resv);
> +			if (revoked) {
> +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +				/* Let's wait till all DMA unmap are completed. */
> +				wait = wait_for_completion_timeout(
> +					&priv->comp, secs_to_jiffies(1));

Is the 1-second constant sufficient for all hardware, or should the 
invalidate_mappings() contract require the callback to block until 
speculative reads are strictly fenced? I'm wondering about a case where
a device's firmware has a high response latency, perhaps due to internal
management tasks like error recovery or thermal and it exceeds the 1s 
timeout. 

If the device is in the middle of a large DMA burst and the firmware is
slow to flush the internal pipelines to a fully "quiesced"
read-and-discard state, reclaiming the memory at exactly 1.001 seconds
risks triggering platform-level faults..

Since the wen explicitly permit these speculative reads until unmap is
complete, relying on a hardcoded timeout in the exporter seems to 
introduce a hardware-dependent race condition that could compromise
system stability via IOMMU errors or AER faults. 

Should the importer instead be required to guarantee that all 
speculative access has ceased before the invalidation call returns?

Thanks
Praan

> +				/*
> +				 * If you see this WARN_ON, it means that
> +				 * importer didn't call unmap in response to
> +				 * dma_buf_invalidate_mappings() which is not
> +				 * allowed.
> +				 */
> +				WARN(!wait,
> +				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
> +			} else {
> +				/*
> +				 * Kref is initialize again, because when revoke
> +				 * was performed the reference counter was decreased
> +				 * to zero to trigger completion.
> +				 */
> +				kref_init(&priv->kref);
> +				/*
> +				 * There is no need to wait as no mapping was
> +				 * performed when the previous status was
> +				 * priv->revoked == true.
> +				 */
> +				reinit_completion(&priv->comp);
> +			}
>  		}
>  		fput(priv->dmabuf->file);
>  	}
> @@ -346,6 +402,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  
>  	down_write(&vdev->memory_lock);
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -354,7 +412,14 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_invalidate_mappings(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv,
> +				      DMA_RESV_USAGE_BOOKKEEP, false,
> +				      MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait = wait_for_completion_timeout(&priv->comp,
> +						   secs_to_jiffies(1));
> +		WARN_ON(!wait);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
>  	}
> 
> -- 
> 2.52.0
> 
> 

