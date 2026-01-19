Return-Path: <linux-media+bounces-51071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E74D3B2EF
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 18:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D551319A445
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E63324713;
	Mon, 19 Jan 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="b+iFq7pQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8609031D725
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 16:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841065; cv=none; b=DYrK68DGqpczXu7Wgs45WdnKJGEPW3rTCb6Zmo29wmU6m/sM8f5bzuRrYw7JvkqvNmI4GLs4OzM0k2MzIayVrbfHe7UYz5vmUn+LtVbokoFBIVI/OPezi3Nx0wWRuECORYT/k4j9QzpPT/7uktEixukn69Tdn5gfSB+dhfiIXic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841065; c=relaxed/simple;
	bh=Bnp3gemiqQAFqwPr305DyvhcAz0o+HO4/eTH34cXlNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWwpt2Vxs3mwu9b2aBQ27xBRdF23qrhg2LC1NH6onnL3jdYGAeJQ0fLpD9co7eS30pbKgupls7UoGYKj+W3WQ6QxqgPj8fDnWFr+tNEhNBRE831/gVChrvXUW6i7Mk1dU85xCYAUZ9szVDxRaGDSkwmUiAlTkQ29YbqSJTVQcxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=b+iFq7pQ; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-5014b671367so56784781cf.3
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768841062; x=1769445862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mLdSjko9gcpWp2LFuEj2HWiy0Q3Aa6qTfE9JkGPgsY=;
        b=b+iFq7pQEbU9zMc18BfM2At7jEhnqxpmFgRE1qjZF0/1gnQGkCRxYgPDFy9Z6Y341k
         x+nuiUSjswaWJ9yz8hJrgG2bkDny8SEt0ShfjRsFWB+Ftf2vzXAgXN422Vw57JFoUbKI
         NPaz1Z3MeknY04P4mVjgsz/4AazdfGqnH4REEDOKgyVaGN0DgRxbrGJZdNdzrwsR8RUf
         lEa0Dt63MeFIk+m+iRSo4a28iD5V2UqmhO6LCKzMCg7mwhWC5NOVFEaxQaoo2TzWzyrD
         ux2Lu9huYKdx0qTuOQY8Jvd5Fuup0fXs8ZsCr+H8DNDHN5EsXfB11Xsfyaxx3XuVhL47
         Sgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841062; x=1769445862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mLdSjko9gcpWp2LFuEj2HWiy0Q3Aa6qTfE9JkGPgsY=;
        b=uj7sAaCuz9rf6mGBcIpD7hhSCYZAHdQ9A5iSEYkvfQ2cbni8WrmUb63KwkzDo+nkaZ
         1oSIDNITpfd+SEGo3ku8xyWS0YKvcT4vvei0SqYVLwBuVpp2WnS/6uBs8ypTqm/vDGAj
         djiJ8VAStGR8pyPA6PXipd/jsqq0U1wzO0RYmsiQnntcImKhXzvW4aFvwzveoLQB4g/U
         zv3PzsJ4FrCm3yHjsX/7UJAY6B3M803HjEz/hpBp2+mL85speTwACAcAr5RabNosuZIu
         LtmabudCpLllLY5YHHKvfRaVFl2ttOr6+/3sa+bbK5pP2y/vL8RbuV2SDy9VWw1ywBV1
         ONvA==
X-Forwarded-Encrypted: i=1; AJvYcCVTZ9j/zXWjNc8Pm7agfNxduPfmaIUMpHN3hdKzXs2AG7h7m6iKsajSgpzbXzzkapCTMTzwyTfT1hKeoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0TbgPWaaYPTzlqgV1tC+EtUq1KhFWb1LxMXUM11nG7W4ksXCi
	81IcYjDD4eazPqiMJsOsUO4JcyySBEkQ7SpnepG2qivabFAjG+w21Ut09upVBvpWTm0=
X-Gm-Gg: AY/fxX69BIJ4fj84bVBHA5RrOD0Y7aePyJcqEAwuJcU6BQ4Qi7mOuSXgOpcGlSQCQQR
	Kdic5sHXYuDJZrIZ1K0/ag4/xJit2FrqzeTLCschehLDOjkgB9wkEcr8OTJDaHtcnmxHSmdgGlc
	U1mCjZPU2CS6lHRUyb8Zi7k3NvjjUYo2INrD+jUe1KFPgtisoGNUzhCVMUPQlriVWQt2u2ZSf68
	X4PBj++4bE7q/Lh47x/cTga/jBIvDCoTurIO1b31PX/hSNDvYBwmMK29Lq3gJ6XBPMcjJUFNIiD
	p8OiLWeMHh0XDwAl/o3tRZGraIF1OOl5iY7Q7WP/+irIrrfNGUqAPDxBgwlBOm95zay+3aPXmjD
	Q3k+hzKAl/quC+g0Hy7Xi8C01Lrr/YedqxnKVsXc/cnmxJsZ9DaxCRLLEznnptn2+phzLfOmJra
	I938kgpWntFo1mlkrDQGYzba/DF0QZAcXLXBN+TUOqJuTPuRGC0hGk2cpsc3FMNxXzYGI=
X-Received: by 2002:ac8:7d16:0:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-502a1f87eb4mr182498161cf.68.1768841062394;
        Mon, 19 Jan 2026 08:44:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ed3155sm72779401cf.19.2026.01.19.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:44:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vhsMX-00000005IKH-0ezs;
	Mon, 19 Jan 2026 12:44:21 -0400
Date: Mon, 19 Jan 2026 12:44:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
Message-ID: <20260119164421.GF961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>

On Sun, Jan 18, 2026 at 02:08:46PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Document a DMA-buf revoke mechanism that allows an exporter to explicitly
> invalidate ("kill") a shared buffer after it has been handed out to
> importers. Once revoked, all further CPU and device access is blocked, and
> importers consistently observe failure.
> 
> This requires both importers and exporters to honor the revoke contract.
> 
> For importers, this means implementing .invalidate_mappings() and calling
> dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s support
> for revocation.
> 
> For exporters, this means implementing the .pin() callback, which checks
> the DMA‑buf attachment for a valid revoke implementation.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-buf.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 1b397635c793..e0bc0b7119f5 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -579,6 +579,25 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  	return !!dmabuf->ops->pin;
>  }
>  
> +/**
> + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
> + * revoke semantics.
> + * @attach: the DMA-buf attachment to check
> + *
> + * Returns true if DMA-buf importer honors revoke semantics, which is
> + * negotiated with the exporter, by making sure that importer implements
> + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> + * DMA-buf attach.
> + */

I think this clarification should also have comment to
dma_buf_move_notify(). Maybe like this:

@@ -1324,7 +1324,18 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_sgt_unmap_attachment_unlocked, "DMA_BUF");
  * @dmabuf:    [in]    buffer which is moving
  *
  * Informs all attachments that they need to destroy and recreate all their
- * mappings.
+ * mappings. If the attachment is dynamic then the dynamic importer is expected
+ * to invalidate any caches it has of the mapping result and perform a new
+ * mapping request before allowing HW to do any further DMA.
+ *
+ * If the attachment is pinned then this informs the pinned importer that
+ * the underlying mapping is no longer available. Pinned importers may take
+ * this is as a permanent revocation so exporters should not trigger it
+ * lightly.
+ *
+ * For legacy pinned importers that cannot support invalidation this is a NOP.
+ * Drivers can call dma_buf_attachment_is_revoke() to determine if the
+ * importer supports this.
  */

Also it would be nice to document what Christian pointed out regarding
fences after move_notify.

> +static inline bool
> +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)
> +{
> +	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) &&
> +	       dma_buf_is_dynamic(attach->dmabuf) &&
> +	       (attach->importer_ops &&
> +		attach->importer_ops->invalidate_mappings);
> +}

And I don't think we should use a NULL invalidate_mappings function
pointer to signal this.

It sounds like the direction is to require importers to support
move_notify, so we should not make it easy to just drop a NULL in the
ops struct to get out of the desired configuration.

I suggest defining a function
"dma_buf_unsupported_invalidate_mappings" and use
EXPORT_SYMBOL_FOR_MODULES so only RDMA can use it. Then check for that
along with NULL importer_ops to cover the two cases where it is not
allowed.

The only reason RDMA has to use dma_buf_dynamic_attach() is to set the
allow_p2p=true ..

Jason

