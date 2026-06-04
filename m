Return-Path: <linux-media+bounces-63778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxxzGdRJIWpdCgEAu9opvQ
	(envelope-from <linux-media+bounces-63778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:48:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452863EA7F
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=niblaG2N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63778-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63778-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FCF930B1ED6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 09:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F1E3A63E3;
	Thu,  4 Jun 2026 09:43:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9E37CD32;
	Thu,  4 Jun 2026 09:43:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566231; cv=none; b=owINCJ3v6eYGD9Hf7OrBPfAYEUfDuRDbMbNxhSLIlC6sxdo0qP/LjPg7DlhcneO7H1tHukkiuDZNhu4PMMC+z0VcCJGoO6nsvW1kee/x4gimSWRyLp8MfPC02OdWuOUL3HByVHDBo4h6reTNH3JVl5FWFAosv2zNCbNxM4rqZts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566231; c=relaxed/simple;
	bh=ugAYUrOSn44FtMqewdCK1F2clAAfSMRLFIpCzrvFaWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq+Pizp1eZAtZom6YFa+/oT2T4VesiBtyahgKievUlNW2cgId9CQddzcSyevZWoslYKODggPLFswJT4yIY0oTheRErGumwd03dD3HOQueOX2pxn7W/MU/VpZsNYxmVBFSNIDPZQyK7JUlTySkC1sTyxleJe+xKpvV8H/5q/VSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niblaG2N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA221F00893;
	Thu,  4 Jun 2026 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780566230;
	bh=Jr5p7L025l5AeOyYY0OiYrQNKQ4cBVm4lneQmDi1MpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niblaG2NeNcheETDbWROWRN2EC8gUaeqU+V2iVk/GSdhP8Z5E3h/Gqpa5xH9cOpQ1
	 v6hrbB7Jus7K1nshEC5tnaXEu/x8R0Ps4MUAXWUUwT0v92mDO1wuGIP+A09ewkQc3R
	 fewRlDncxRlqrzoTxEvDeXuP3fJVL9FX+trLyhY92vve5JphyKdwYusPG+7U/3wQ9z
	 2vJgIhyrAkFhIBA1MXydcQxfKlKZZc4vg+gsKTiHeslcVTAbWNka86r8xtj34X4OJd
	 JPg5dlYSt4RSFaXGFT+erozr6bJfWrCgR4+GV5uKZqspaOb3D1WgDUAG9cSmTV8MK3
	 Q5HIolmsKCCkw==
Date: Thu, 4 Jun 2026 12:43:44 +0300
From: Leon Romanovsky <leon@kernel.org>
To: David Hu <xuehaohu@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	jmoroni@google.com, praan@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v5] dma-buf: Fix silent overflow for phys vec to sgt
Message-ID: <20260604094344.GB245424@unreal>
References: <20260601200012.3872274-1-xuehaohu@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601200012.3872274-1-xuehaohu@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63778-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,unreal:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0452863EA7F

On Mon, Jun 01, 2026 at 08:00:12PM +0000, David Hu wrote:
> In case MMIO size is bigger than 4G and peer2peer DMA goes
> through host bridge, we trigger a code path that assigns the
> total linked IOVA (which is greater than 4G) to mapped_len.
> 
> Previously, `mapped_len` was declared as 32-bit `unsigned int`.
> When accumulating `size_t` lengths, this leads to a silent wrap-around.
> This truncation causes truncated lengths to be passed to functions
> like `fill_sg_entry()`.
> 
> Fix this by changing `mapped_len` to `size_t` (64-bit). While
> at it, fix similar potential overflow issues in `calc_sg_nents`
> by using `size_t` for `nents` and checking against `UINT_MAX`
> and using `unsigned int` for the loop iterator in `fill_sg_entry`
> to match.
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Cc: stable@vger.kernel.org
> Cc: iommu@lists.linux.dev
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: David Hu <xuehaohu@google.com>
> ---
> Changes in v5:
>  - Removed WARN_ON_ONCE from calc_sg_nents() to avoid log noise (Jason).
>  - Added explicit check for `!nents` in dma_buf_phys_vec_to_sgt() to
>    cleanly return -EINVAL on overflow (Jason).
> 
> Changes in v4:
>  - Added WARN_ON_ONCE() to the nents overflow check to prevent silent
>    failures (Claude Bot).
> 
> Changes in v3:
>  - Removed leftover sentence fragment from the commit message.
>  - Kept `nents = 0` initialization (previously stated as removed in the
>    v2 changelog) as it is strictly required for the `+=` accumulation
>    loop in `calc_sg_nents()`.
> 
> Changes in v2:
>  - Fixed 'IVOA' -> 'IOVA' typo and expanded commit message (Claude Bot).
>  - Added Reverse Xmas tree formatting (Pranjal).
>  - Folded in extra bounds checking for calc_sg_nents() (Pranjal).
>  - Folded in type consistency fix for fill_sg_entry() (Pranjal).
> 
>  drivers/dma-buf/dma-buf-mapping.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index 794acff2546a..607b7998463d 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -10,7 +10,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  					 dma_addr_t addr)
>  {
>  	unsigned int len, nents;
> -	int i;
> +	unsigned int i;
>  
>  	nents = DIV_ROUND_UP(length, UINT_MAX);
>  	for (i = 0; i < nents; i++) {
> @@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
>  				  struct phys_vec *phys_vec, size_t nr_ranges,
>  				  size_t size)
>  {
> -	unsigned int nents = 0;
> +	size_t nents = 0;
>  	size_t i;
>  
>  	if (!state || !dma_use_iova(state)) {
> @@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
>  		nents = DIV_ROUND_UP(size, UINT_MAX);
>  	}
>  
> +	if (nents > UINT_MAX)

I would suggest to use check_add_overflow() while calculating nents
instead of this check.

> +		return 0;
> +
>  	return nents;
>  }
>  
> @@ -95,9 +98,10 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
>  					 size_t nr_ranges, size_t size,
>  					 enum dma_data_direction dir)
>  {
> -	unsigned int nents, mapped_len = 0;
>  	struct dma_buf_dma *dma;
>  	struct scatterlist *sgl;
> +	size_t mapped_len = 0;
> +	unsigned int nents;
>  	dma_addr_t addr;
>  	size_t i;
>  	int ret;
> @@ -133,6 +137,11 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
>  	}
>  
>  	nents = calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> +	if (!nents) {
> +		ret = -EINVAL;
> +		goto err_free_state;
> +	}

Technically, this hunk is not necessary, since sg_alloc_table() will
return -EINVAL when nents == 0. At least, that is the behavior I relied on.

Thanks

> +
>  	ret = sg_alloc_table(&dma->sgt, nents, GFP_KERNEL | __GFP_ZERO);
>  	if (ret)
>  		goto err_free_state;
> -- 
> 2.54.0.929.g9b7fa37559-goog
> 

