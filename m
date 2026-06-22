Return-Path: <linux-media+bounces-65333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QIiXMYrwOGpckQcAu9opvQ
	(envelope-from <linux-media+bounces-65333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:21:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C86ADA2B
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mYadQOo4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65333-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65333-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B9430785C9
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7B339060F;
	Mon, 22 Jun 2026 08:13:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B138F24D
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 08:13:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116033; cv=none; b=O604OQmTCNBSx8e3Nq42Fkpx2FMsSAyghwpxWMfHK60mhN35Ipof4N19Um0r18N/6fONEPPnZNPUFzAQqBNkmK05yzmSAxq90LOwTx9t7SeLCOo/wCuJbfcPtdemkxsFb9rG0thMUmZtsDFHNiIW5gsl2bMkt3gTrjWB21CQ0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116033; c=relaxed/simple;
	bh=F6H+rAEwAFlvo2vcoaq3mMaDhsIksTBUqphzpxP80WY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gHa+BJrTsulupl2dNa2GPQlcASdHTuNb25C2P8ddLy6A94qb41dmq+XfY7gbRKFxrOmaVmzEz/XkgtNd69gJn+MMuC1FvEEdBjeIxH+uoCiSNsIpt0euFgnP8yTJtwVZ15zEG3pECX+F8bkuCZD/R3XsnSMr4HXnJbDQG1rFDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYadQOo4; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49249072f03so8854945e9.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782116027; x=1782720827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y69DNLtkcPX106ySVX6ZlNH6S9rjQScn7EBr8UTU9k0=;
        b=mYadQOo46NcgaU12CxB9GSPlIIegnCNLdCNhSOyW/I+Xy07v53GHjb50/R+GSFI+uR
         YlfBTbDf95ZxaB/UL/7XxShjkXDQD2vQ09dYUezg8LsqE0eDEIUsFBaQut53YdNbx3eO
         cJYu+JGbxn302NwD1+7xmLweKbs+aIfxkrSyQv2gQHvgLtNUfY5PPhFvCdz0vUe1cvi0
         itW/cqtzbndpD86fPZZMZD03nuRNiJ6g1ijby3UiOPkjZXtsZwdDfCrmpkdXd6SM0zSO
         Gj1NCfGLVSTpe5zsqhmplOlaFb5PhD8s1Jk+ifwjkZhxHZzFqL/da7BZ6D9tFxKu9DZp
         YToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116027; x=1782720827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y69DNLtkcPX106ySVX6ZlNH6S9rjQScn7EBr8UTU9k0=;
        b=NgK/zU6nD36ojO7HmIVABiLXJzO/y6/h0mm3JbuWYIsEhRnzHX5fAPZ9T53cn2Iy5m
         9KvPfcBn3wAKPKUhhVw2dciKUAOBsz7bPbh2IoYdtUqPmdPUbUAquevKOMSdL1ERz/rq
         gd++A6k5kOcNkqQeeMPJt3WWEnUAWoyJDsvTmW0WV9W9DEXmris7lofszphFdsT0pQDS
         UUr1RNRLF1cepqgh7D6Jd+GZL3A+StrHFVyahvelb/ZaCi04c3iAuZJXSCUy2A4G82cN
         4Biwy9RK3sHNA0zLdfkGwpY13+Z+Ij8oKMcSNgA71hDc1s8KCXDXZF/tqeDx/BHDBKlR
         +UlA==
X-Forwarded-Encrypted: i=1; AFNElJ9qFanUU7VMFrnZLHD0i27vI+0VUnSasvEVLU3Yg9bRSYQFgynMSYWjeUNnIzYldb9HUPhM0C7PwRPnkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4kcrVhJUzrLe4hg2WHvtvvL2bFDF34y0ZqWI4jkAep+1c+eN
	tYoggJ6jRZvyBfgr44D49urMXROJpSWLxhVxm5zcFO0GHifEpldk5z3O
X-Gm-Gg: AfdE7cnWGwNg+wqhYIr3FmTrXwxPUSbSZxqkYHCfHSt7uVt4mwDSAc/n5gBuL/SW0Zl
	oaP7g9OZXeCD0SPqo4Fbwg1rKFREBjVbsl8onTq0D9HCD7d/FNl+iwIgbjzR00WvG/reuXAkJWh
	JHclUdQjwCW9ZvUpblMjbmxAXrmv5bgKa065SOpnY48I8CSNn5rqdSqNdCpD9sg8UmsGE0JNfzi
	9K7EJbCq/k45dOHCC1+ZSjKdS/jeAv1Ii4II5+Bgl85G2CnqpJfBpmz2xvtB4MuWg9eIaCo0qOB
	EO+q0Fe7U+Uia5lRk7rOZ/sidn9sXdzcxqkFJinJ7ClnkFrxBWyCoew1JnYzAbAgP1NV5ViuUXo
	YFxwOVpM3uvlpyYbC2uNsfwimhhTF4VeejaRS9YsQWhttEay6oIUwNX3/+r+ciPfzrnnITJZX3I
	2xE1UoxY33o0So6ogl8+fG82wJrBaPS93N755FkuB50GgtJeVAFQ==
X-Received: by 2002:a05:600c:8719:b0:492:4c60:bfb8 with SMTP id 5b1f17b1804b1-4924c60bfdemr121648545e9.28.1782116026585;
        Mon, 22 Jun 2026 01:13:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm274806595e9.7.2026.06.22.01.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:13:45 -0700 (PDT)
Date: Mon, 22 Jun 2026 09:13:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Hu <xuehaohu@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen
 <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Alex Williamson
 <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com,
 praan@google.com, kpberry@google.com, sashiko-bot <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Split sgl by largest page-aligned chunk
Message-ID: <20260622091344.794e0d74@pumpkin>
In-Reply-To: <20260621222130.1667453-1-xuehaohu@google.com>
References: <20260621222130.1667453-1-xuehaohu@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65333-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 478C86ADA2B

On Sun, 21 Jun 2026 22:21:30 +0000
David Hu <xuehaohu@google.com> wrote:

> Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> first entry, resulting in non-page-aligned DMA addresses for all
> subsequent entries.

How did you find this?
It requires a single buffer over 4GB - seems highly unlikely.


> 
> While the underlying IOMMU mapping may be contiguous, hardware
> DMA engines often require explicit address alignment (e.g., page,
> cacheline, or storage sector boundaries). Passing unaligned
> addresses and lengths can cause explicit failures in DMA descriptor
> creation or silent data corruption if lower unaligned bits are
> truncated.
> 
> Fix this by splitting the scatterlist by the largest possible page
> aligned chunk within `UINT_MAX` (`ALIGN_DOWN(UINT_MAX, PAGE_SIZE)`).
> This ensures all scatterlist DMA addresses and lengths remain page
> aligned and satisfy hardware constraints.

It would almost certainly better to spilt into 2G chunks.
That removes any need for any divisions.

> Page-aligned entries allow the system to cleanly chunk payloads into
> PCIe MaxPayloadSize (MPS) (e.g., 128 bytes, 256 bytes, 512 bytes).
> As a result, this may help reduce TLP fragmentation in P2P transfers
> and alleviate potential congestion within a logical PCIe switch
> partition, especially when Relaxed Ordering is not possible due to
> hardware constraints.
> 
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260609165431.778061F00893@smtp.kernel.org/
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hu <xuehaohu@google.com>
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index 794acff2546a..f2bde38fdb1f 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -5,6 +5,9 @@
>   */
>  #include <linux/dma-buf-mapping.h>
>  #include <linux/dma-resv.h>
> +#include <linux/align.h>
> +
> +#define MAX_ENT_SZ ALIGN_DOWN(UINT_MAX, PAGE_SIZE)

>  
>  static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  					 dma_addr_t addr)
> @@ -12,9 +15,9 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  	unsigned int len, nents;
>  	int i;
>  
> -	nents = DIV_ROUND_UP(length, UINT_MAX);
> +	nents = DIV_ROUND_UP(length, MAX_ENT_SZ);
>  	for (i = 0; i < nents; i++) {

Why not change that to 'while (length) {' to avoid the division above.

> -		len = min_t(size_t, length, UINT_MAX);
> +		len = min_t(size_t, length, MAX_ENT_SZ);

I bet that doesn't need to be min_t()

>  		length -= len;
>  		/*
>  		 * DMABUF abuses scatterlist to create a scatterlist
> @@ -24,7 +27,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  		 * does not require the CPU list for mapping or unmapping.
>  		 */
>  		sg_set_page(sgl, NULL, 0, 0);
> -		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
> +		sg_dma_address(sgl) = addr + (dma_addr_t)i * MAX_ENT_SZ;
>  		sg_dma_len(sgl) = len;

Replace the multiply with 'addr += len'.

-- David

>  		sgl = sg_next(sgl);
>  	}
> @@ -41,14 +44,14 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
>  
>  	if (!state || !dma_use_iova(state)) {
>  		for (i = 0; i < nr_ranges; i++)
> -			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> +			nents += DIV_ROUND_UP(phys_vec[i].len, MAX_ENT_SZ);
>  	} else {
>  		/*
>  		 * In IOVA case, there is only one SG entry which spans
>  		 * for whole IOVA address space, but we need to make sure
>  		 * that it fits sg->length, maybe we need more.
>  		 */
> -		nents = DIV_ROUND_UP(size, UINT_MAX);
> +		nents = DIV_ROUND_UP(size, MAX_ENT_SZ);
>  	}
>  
>  	return nents;


