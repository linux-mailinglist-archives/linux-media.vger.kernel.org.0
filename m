Return-Path: <linux-media+bounces-64257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zJ28DslbJ2pmvAIAu9opvQ
	(envelope-from <linux-media+bounces-64257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 02:18:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B871B65B4DE
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 02:18:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=WmmoMbXB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64257-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64257-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A9383047BE6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 00:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63B41FBC8E;
	Tue,  9 Jun 2026 00:18:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC94F5E0
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 00:18:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964284; cv=none; b=ko6IJzLS5yQRvVHay1mvgPVgdwI7ATHFh5uKJexvfNw8xTeVVdNg15JVj/Zuo+rtDDn1kZ7ZIBtNdmelKCdNHs5DkaauUu/AiWWQDACdOPlwTwmUanCMT5Orxs0feyvfHac2TMuC1Y9P2/fbgjdnQ8DRYc+KB8plXZQN8uVcRT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964284; c=relaxed/simple;
	bh=/BzsQnwRFrK/hqvtOlttIJXnp8XCgsxJk1C9zu5/bt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cpd2lmMQ4qp3hEclZXPuK8X7hzSlgFu2iKq4nE2V4Gfh/LlhQoaKtQdyxOcbGn8Q3MaVLn/WLQw5FuLLT4SdsZ15yLF9fuuwoVPWzFeLeuGa1nXJ9stvFTeS4wNRluKAhSEH3DsxRsnrFOfRbtrax7JyDe8tWEfwP3tSfvlAFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WmmoMbXB; arc=none smtp.client-ip=209.85.160.170
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5176b9c476aso36933291cf.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 17:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780964281; x=1781569081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MJrcrd97RrpK34MMckrW+u7pfPo1y7Snw62FaBcwTvE=;
        b=WmmoMbXBvNvVPgbb71bETL3s/1UKzklb9atQ7RRspFzvrzVQBRXbGcyZov3LFZOTQH
         bYvFUpR/jxHCQ+HNX/mk+5UL06R9iDwNyiggJkZ/MkEqyE9FiKp7C9tpLgzpQRBaHETd
         ntSPDBeT/l315+mhftpcN7Igk+i2Snr837FZVL/O0VWH6RqVSaiGe46D8DbLjPbLCOjh
         oOQj0C3HcfqT1rHvZlkCQtB2KOCLXc//DYGshbBo1JUYQwD9YDTHuKMMHRGAdZiIIMdD
         DGDYKkXe/MHhKQyenuEXRYsmzsEHKbbXjICic1s6i+BiTT0X7p/V9MrNtNrCdViwIu/w
         c/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780964281; x=1781569081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJrcrd97RrpK34MMckrW+u7pfPo1y7Snw62FaBcwTvE=;
        b=NE6UORyfFYNqJNyZu8JRsR16vze1AraedwEGYUDW9WLP/wJ6TIPaajJv9TlBgIEUOC
         2YHl75+frWM0Fx1EBgvxT3RSz4fdRz0CR47mic2db1PMS4+NWX8sWny4N7EV/FdOF1d2
         vgq1kqsPIXD+Tn5MNVERVuC699f5MGoKxT3GpkDe+DzuVpXyggYIadrO90hiWpFGwM8t
         6zLMyvnbdcpVGYS9ss4O52IhOFcB39O998qagIiDZ/0G8Td+ow70k34owN7963+Ht/Vp
         86eGjA5oLcZr8Fhf1HJeCabEqDuAn7KxOII8Cy1EhgidJgyjSqTIc4KYn5CtdBIxq9YZ
         5VxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rufubfryt9GxS8lmL6Aiuc2DuKS70jzxxzl8il/Xka9E/R7P6/5keat9VL1hzfl4xLKaTe4FQgrKxwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNvT2qyA3AWsfy2QN6yTa/tMLZnaCt7/IgL/NHteZrhgh6XNl
	tvHLWLQpg6pDkab1EEaR7PPBS3MiaQKqHc9dk4YcjYZF+kX4Q5vHnMed5W4kC7Y0B4s=
X-Gm-Gg: Acq92OE6JVM/F19JphxgqZcfqPGHGKAq+MkdWLkJuZFhxII5YpOiLPj7iY6peuhRJ2f
	o1YWrqkhaZk48cl6rh0zPPIGzOMFBZI0vSvhBfYW9SUsrKDtp15RQx+M3hy89YxYgA1vvuS6eUj
	41mNpvjI3kVnktsvsWv5Y/Cvu8zPguX9kcu8cci/yZ2zEJs90VRZWWLmPN1o3CVm2zu3bWV4NjL
	GRe7z2k0W6HcAc2jRJuljl8jyB5PJ6Mxn+ku0DP9jbqXpJiaztyIOaIVE5M9A61tQ+ciIIQaMm5
	zujj9zGZjG52SdYbfWzIgnpTatWXpKz0wRDbdtNsX4eEtZUaSFBQCakE8hkm2tniZPdpOc+ExnI
	vaEu/bq5tovr8b9qpPdnZsWqkGzZL8I91YUFV1wF5WY3t2cdpUj8nhUrkzMcEPqSsBpj/iyCaDV
	zfdO7I4O87As+Y301fJgBHgsYOYdOuJDSztuRzwa9mmTDa9AsDMC/ZAtn+QdJKAH7tDhfCDaAcZ
	wAsO7jr+fHkgeVn22L3fwHQPVg=
X-Received: by 2002:a05:622a:1b15:b0:517:8f31:df0a with SMTP id d75a77b69052e-51795a08705mr257391641cf.8.1780964280672;
        Mon, 08 Jun 2026 17:18:00 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c4d7absm165652141cf.11.2026.06.08.17.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 17:17:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wWkAI-00000000rFN-46mU;
	Mon, 08 Jun 2026 21:17:58 -0300
Date: Mon, 8 Jun 2026 21:17:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ankit Soni <Ankit.Soni@amd.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommufd: take dma_resv lock before dma_buf_unpin() in
 release path
Message-ID: <20260609001758.GG2764304@ziepe.ca>
References: <20260526111034.4079-1-Ankit.Soni@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526111034.4079-1-Ankit.Soni@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64257-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Ankit.Soni@amd.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:leon@kernel.org,m:vasant.hegde@amd.com,m:iommu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B871B65B4DE

On Tue, May 26, 2026 at 11:10:34AM +0000, Ankit Soni wrote:

> Take the dma_resv lock around dma_buf_unpin() in iopt_release_pages(),
> matching the iopt_map_dmabuf() convention. dma_buf_detach() acquires the
> reservation lock internally, so it must remain outside the locked region.
> 
> Fixes: 8c5f9645c389 ("iommufd: Add dma_buf_pin()")
> Reported-by: Ankit Soni <Ankit.Soni@amd.com>
> Signed-off-by: Ankit Soni <Ankit.Soni@amd.com>
> ---
>  drivers/iommu/iommufd/pages.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-next

Thanks,
Jason

