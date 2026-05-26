Return-Path: <linux-media+bounces-62786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEXPARGSFWovWgcAu9opvQ
	(envelope-from <linux-media+bounces-62786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:29:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E295D58AB
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85F2303DD11
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009DA3F99FC;
	Tue, 26 May 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CegQkZ1g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E913F8ECC
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798420; cv=none; b=p7EvnuakpKtSAnEDPbORgsQYBt5/3aJ2Hz1f0+N2YakKtVX6cTX9IQ1FAzvv2uSKOmGOXlDBssRD2diKddg/CR6C2vWAnQgfVp/00T4Z3nwRqXFcp6kLNhLgnB9rKalD/hlmjLEbvkWP9EaZzw18dlgH+s3PCanRUnEHj+0Q4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798420; c=relaxed/simple;
	bh=ehL5g3u352wzk/u26D6x4hHM2Xz657v/SQyqW4yRuEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVXKMSN/d8Hh72bkzKqDv6Buh3LwCT2jToMacwtGfAOLNUfqkFKw56k1OMzRChofnVfZLX7Nep81aa93uUbMHEmIr9+FG3w4qzxIOYnvurPbrHl1jciGLlXjSdq2nha1WoKBKOhlzYEHEIUjt4+6BE9V1tw1303nTLJPp74bznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CegQkZ1g; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e5c7eb565so113107731cf.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779798418; x=1780403218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQVPF5z8tEWy9hSyAGSwHCVBtb21IOuG2HFA7xrSBPI=;
        b=CegQkZ1g89NARdLWkEKXkP9zFEb3QDJ8ANioo+++6RPpDeEykh6l05ZnB6261wXW8/
         dC43CBwHGlBTcodBENPgjP3rXZNq9Hqz10GiCAnBNiCO6SL9ixaMwk1Gn+fyVS4Chl+D
         NRTxDZ61ofcfCg+eBZkYcwyZn3B5CId/ec91hL5cdaT+/3J7VDvrGVu7MF6Hl9rMxCUC
         TsLDQGoAk6JgWvPFyKGUxlTWv6X4SDwPU5a41DmhLCtaA/0/jCAWkNwas4zWd6IjfCFF
         ZsydgD1CkiSD69BgMToGz6uyGsZ9I5ZP5toy6xJkNDtG7zkZFRFcN+7jiFtUkPXj8g/3
         52Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798418; x=1780403218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQVPF5z8tEWy9hSyAGSwHCVBtb21IOuG2HFA7xrSBPI=;
        b=CQ7xFcyRqk9oAzisfLraB6VqZ7uZ+32cWB6gyN9zNMq5u429ZUAiMJWsrtLl++sfLu
         ipYIEBhnuGiZAVQjy310JTdV7kzbIQehqdAtLGfLYGlOgUV8an6RXiVmGMzgW8zwQFpr
         G2wq2xxOyjukLbZEJdQ9Klgs9aV0nsaiETkHHIPRd5C4Qb/S5YKR5Nx3LIqp5/NCfsSP
         wv2uh7QpIBBXAFgPTzLdPONeQe27Zp/PfJn7pLg6ZXu9TFQIz2UtX+xYnHXG9ZU96vT1
         NOzG05J+q64MfwNpEXZo1Y/NqdNJ5z8+keaH0cBBZl1MHN5QQegZTgOR+xjirFv+ES3X
         qv+A==
X-Forwarded-Encrypted: i=1; AFNElJ/T8LbK2hTI39YnGzMqORXaX6jbd4YChQT52khw9D4JZ1RaKa2mxpTN4j/pj+d0QaXtD6Gf+JYbl+QRZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIGmHWnHE8Ujtl+xY0HqZZVgS02HqrfdczQVMbY92bBfNrjoRn
	r8hRCrajiGwLR4NB7p8TygzE3Sz+m1q0o13o+Mqr5rE8MPsk88f5EKO8jL8uxY7KOe0=
X-Gm-Gg: Acq92OEoo1LbXCGl13me7+ABvysAg0MMAtfo8BpK+WLciGfiYhmhsXHH9neYrGQ95M5
	N87CVlLb6SPm2hp+wQ2XrCz7kXzvfb68bLICrTbAucuagFp3i/jH9xTWXiIGQdMYsF+XJTJqsDZ
	kHRiqB8yobIofNY2QUJXPMkOyS3hMmSUFWOeGS8Y3KVkmMIZy8/IIUvxUM8Bd5SY5f/uVFdPgty
	I0IiMUB8HfSFuriKuuWqZvZnY2GMVJk1THHd69JWhK+9gel99NrW0cy2ieXMmH5ERmM4Fb+xysi
	ja07IpzOhXdfrqBy1OKI2beqaqNRsV9FmE5Gf3ndSP+oiwb8FEybnsA5eBrni+bbi8AVFeik7R5
	v2Y8gipwQhqcBgHltt2yUEICkYXBZfvUTw/odfiwd7k8W6Yz7WCttteveJESiiLzaU2Uxt2CFce
	eFkezea9k6oKR7gNfkEKppUxAhUUzFYsFtlU1TG2j5er5mUXl7uCLx9eXgRAKwHTGxwZBYjB0Yw
	DY3dp/d10mH0cCJ
X-Received: by 2002:a05:620a:29d5:b0:914:c7b6:e29c with SMTP id af79cd13be357-914c7b6e6a4mr1836526485a.56.1779798418003;
        Tue, 26 May 2026 05:26:58 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f8801390sm215458285a.36.2026.05.26.05.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:26:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wRqs4-0000000DONN-3pnp;
	Tue, 26 May 2026 09:26:56 -0300
Date: Tue, 26 May 2026 09:26:56 -0300
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
Message-ID: <20260526122656.GE2487554@ziepe.ca>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	TAGGED_FROM(0.00)[bounces-62786-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 51E295D58AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 11:10:34AM +0000, Ankit Soni wrote:
> dma_buf_unpin() requires the caller to hold the exporter's dma_resv
> lock:
> 
>   void dma_buf_unpin(struct dma_buf_attachment *attach)
>   {
>           ...
>           dma_resv_assert_held(dmabuf->resv);
>           ...
>   }
> 
> iopt_release_pages() calls dma_buf_unpin() without taking that lock,
> so every iommufd_ioas_destroy()/iommufd_ioas_unmap() that releases
> the last reference on a DMABUF-backed iopt_pages triggers a WARN.
> This was hit while running tools/testing/selftests/iommu/iommufd:

Any idea why this is comming up now? Did I run the tests without some
kind of debug option to turn on that assertion maybe?

Jason

