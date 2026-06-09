Return-Path: <linux-media+bounces-64269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JHeBEDHAJ2oT1gIAu9opvQ
	(envelope-from <linux-media+bounces-64269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 09:26:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEC65D2C6
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 09:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BXQRnnQV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64269-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64269-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9207C30B926C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 07:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79778382F0D;
	Tue,  9 Jun 2026 07:22:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC635E922;
	Tue,  9 Jun 2026 07:22:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989760; cv=none; b=B9MLHQNRwiVhH/883ginkxepuFlY3Mgp72uVW3UUVPJPYEwneLxxKu5CFw/fDaDRiMMYqE6zwwDteVnJZScGW6c/9Jij3tSzSgCVqP8rR0l8zuoUtoFUvt2tQReoAGjKTQEST0S3pH7YXeKUGRBLOqXyVvjB5HQ0xtMeUCIkdMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989760; c=relaxed/simple;
	bh=GPZOvP3Mm6EiYDm8mY2iYgvc2pMGsaw676SV2/zQrQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9B8ZXJASog/NoKk1KmKrmhWfyQPKYyINWoR0GUF0JRK2hXLkv0aZv6mpl1SjYLdgnANJJ94RYaf61o96iE2x5bCnpUSnbKle0RHmmtqzFaSAUwdfpSGXmFWdS0bYufkXnyege4Q4/2nf7GXeh3IV5OF0hj5gvV8T02er2I81mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXQRnnQV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C631F00893;
	Tue,  9 Jun 2026 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989759;
	bh=I7FjI2O820nUywCy7+dsVn5yjEmJGm64ivePqVuSznw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BXQRnnQV+2QCcagZphHSOF7BYi7wn/QpRnuwSzxOhhwC6rlYLmLIzq7FmZr0qshQd
	 Iip7BxBMx/a4l3EnGn1XKMeeJeuLxaAU6F6Bvd1J0YQqS1HWcmHCtT/0FKI6uDL8Gf
	 BW2g/y+hr/9eO/Iqr54X7aBdTTMBLUeeHzs/H7BQtDqX8WKOBqEegveG7IAAI90iXg
	 E1rEH4b8xvB/vW+Jnm18an3eRdRidxK6adLb7j7ZNFHLIuTDxvn90lBOVvGUFwNnqa
	 fJWniPnIm5Erddgsl4U3z7DOb/1lRVGRUXDvAx8w5QykeMrT94EMovbgmUk6QsscYD
	 Y+Y6AaI2hSiIQ==
Date: Tue, 9 Jun 2026 10:22:34 +0300
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
Subject: Re: [PATCH v6] dma-buf: Fix silent overflow for phys vec to sgt
Message-ID: <20260609072234.GB327369@unreal>
References: <20260608194321.150838-1-xuehaohu@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608194321.150838-1-xuehaohu@google.com>
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
	TAGGED_FROM(0.00)[bounces-64269-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72CEC65D2C6

On Mon, Jun 08, 2026 at 07:43:21PM +0000, David Hu wrote:
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
> by using `check_add_overflow()` for `nents` and using
> `unsigned int` for the loop iterator in `fill_sg_entry` to match.
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Cc: stable@vger.kernel.org
> Cc: iommu@lists.linux.dev
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: David Hu <xuehaohu@google.com>
> ---
> Changes in v6:
>  - Used `check_add_overflow()` in `calc_sg_nents()` for safer
>    accumulation (Leon).
>  - Dropped explicit `!nents` check and added a comment noting that
>    `sg_alloc_table` handles `nents == 0` (Leon).
>  - Collected Reviewed-by from Kevin Tian.
> 
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
>  - Collected Reviewed-by from Pranjal Shrivastava.
> 
>  drivers/dma-buf/dma-buf-mapping.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index 794acff2546a..67a8ff52fb8f 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -5,12 +5,13 @@
>   */
>  #include <linux/dma-buf-mapping.h>
>  #include <linux/dma-resv.h>
> +#include <linux/overflow.h>
>  
>  static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  					 dma_addr_t addr)
>  {
>  	unsigned int len, nents;
> -	int i;
> +	unsigned int i;
>  
>  	nents = DIV_ROUND_UP(length, UINT_MAX);
>  	for (i = 0; i < nents; i++) {
> @@ -40,8 +41,11 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
>  	size_t i;
>  
>  	if (!state || !dma_use_iova(state)) {
> -		for (i = 0; i < nr_ranges; i++)
> -			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> +		for (i = 0; i < nr_ranges; i++) {
> +			unsigned int added = DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> +			if (check_add_overflow(nents, added, &nents))

An additional blank line should be inserted between variable initialization
and the subsequent code block.

Aside from that,
Reviewed-by: Leon Romanovsky <leon@kernel.org>

