Return-Path: <linux-media+bounces-47777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F29A3C8B5E4
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 19:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78ACA34278E
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 18:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE93726ED48;
	Wed, 26 Nov 2025 18:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZUwQHn7i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D4207A0B
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180074; cv=none; b=G6/dHUdT62kQ36EObDBpYmPAhrZvwsCorpzpjBIcAsd7XXZGbRj2Qii6vk112EZ+VL5unpDQnn6+4x+W4N52XK1DROc5wKQnwWuGal9x+HyY89oKRK3O4CV6BqYRKFcuZS/J/pelGSz/5yypa5WXTOxowjUPlxSXluqS9PlWdrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180074; c=relaxed/simple;
	bh=O8Oxlh3txsqOf2IumAFDD74EyC3t+dmObTYw1aRFmW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3VNZPxHbrUhLMRq1D3afZgiH7YMV3vAB7n88qxH+3TFBhITO9quVw/aJxMhVWHsdIpM5CCfMSHJkbiUYYcnqJWo6Q+MM/2+6UY6uRsf+Y/QpnzTO0rzFKGZ1Q+kwCpZVfGAat3l5dVZKWqAFBApxPywM0QNDOf+w7FepLFPXnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZUwQHn7i; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8824888ce97so89966d6.2
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 10:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764180071; x=1764784871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jjSf74md9hV6abcmJUmAPy1uC1ZA/qAadY295f9z6us=;
        b=ZUwQHn7iTD9H3QuCokh18ubvXS3pH4A1pReeV6g2okuBMltvX44Fxh0LxVVDfWQ/Cs
         2XrZ6Gf7uZoaYTspqeMUqqb4uWaHYdIKhTXizH005ui/hshdBAqyg7piHiB9QGKiRbOc
         baTNwmbSM16cto+rEhKElMTUsvcl6fsanzXDXQ+CzH7M4FuWYjRs7PbL6iwVWPOS7dTo
         9SE5qAIQ8yrFwVBWGuD4lZJSa5hYrx5/Ahl519RKURIWGmYsiOLosBsv0dgRMCzTrfSW
         tQsR08K+YUH3kReWnFS79k73sdT1Pf1NcF4rh5nk9MKW52hrNy0cAJC2WUEH3ZYXsoyB
         WRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764180071; x=1764784871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjSf74md9hV6abcmJUmAPy1uC1ZA/qAadY295f9z6us=;
        b=H1JUgwqlpQOrvING6XzxcHX6QF+mtOSDhyGYUB1JrUKRetVkS0bSI5PueXpUq6SQMV
         rjT9z6QypNfpNsbtzD8slIuWDcfqll2377h96HvBRfpGxZvtgjD3Reb2ffnr44qPStHx
         GNiwjRFv9m/gJxRovIWYBPf+Ly9+OKjp+ITzeie1irsx6zSJqK9xe8BE8KpliPZseJET
         8nYGK66+R+4B+MGmrwhvxEjjsqPLXJrBb1TYJ0AmMV/8Jwdqq/w06r/1bgeilhvkzv1V
         MGAL2h5aqPs2appj3CIFQjXzRRKJxJzHqgQX5fPkCDGZBrQY6WupopixbITcvCxYd/Wa
         ROqg==
X-Forwarded-Encrypted: i=1; AJvYcCVcxqG4loUXWsn5vPMgTnpehBO0OeCpqt+iYWLr58cvO7JG0pgaXR8hvPL+x7DGGrTU/hK56jhRvi3Oow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzYiRYO6i0vMUpd48mhSfGRvKvvDChQCxlxYU2r4vZW9Rpvw3U
	MiWTAYw016QsnZLwRoAuqmZevwvF3I6e4jCVG4o9lWgt/1rTKuBPHpIzXRFPLRPW+Ag=
X-Gm-Gg: ASbGncsc8RDPv1gidL/lbKcVEr2piu9nSn3Mpq6aFPEnQTrSfUMdYCb1wLYoMo5vphV
	sH2yvKWpzCR8oSBO0QYx3sRha3txa5zOselwk1OPch8dRj2rC8y4VSop+3BHBcQFL8cdvV7nnuM
	qu4V9dLyg5Or0t3NGFEO/XCTCW7S8pnkGasjjbD0zlSghOOHGPXl6nTE4f16IxJDsAy6Se9yuIx
	SRDaYnSrWIaXl8VzzNZDjV3lU40SJ7oGiE3GyAy33x8wsKJfwWuoqmQALXtvsiCzRFpPX+2a8ds
	cmHC4m42BtdHHEY1wF5PjNc2xqweBzTVmfWua9J/G1ZRJqbymHqE/ZmtHUTFbFutfnwNYsdDN+O
	e7EeL676eOk0JDwF2MkH67WsboePrxkagt7cobrg4ttQ7SzuROEI2bapexeFlRGRmg2yyBg1dQZ
	QLvMM7vEddu6tf8C5kMSzrJ1K543x3NSu4glzCK6KgLD+BTVW48xT7nOE4
X-Google-Smtp-Source: AGHT+IEAvNp+zRI8SnZtBMAoTCcW9PsOn0UFKbLCX0nJH/mWJ9Vruy3K7nib32RLaHWbWg9aiKoVNw==
X-Received: by 2002:a05:6214:3113:b0:882:36d3:2c60 with SMTP id 6a1803df08f44-8847c4ccefamr223992386d6.19.1764180069440;
        Wed, 26 Nov 2025 10:01:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447272sm148376376d6.5.2025.11.26.10.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:01:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vOJpD-000000033ob-2pNk;
	Wed, 26 Nov 2025 14:01:07 -0400
Date: Wed, 26 Nov 2025 14:01:07 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Ankit Agrawal <ankita@nvidia.com>
Subject: Re: [PATCH] dma-buf: fix integer overflow in fill_sg_entry() for
 buffers >= 8GiB
Message-ID: <20251126180107.GA542915@ziepe.ca>
References: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>

On Tue, Nov 25, 2025 at 05:11:18PM -0800, Alex Mastro wrote:
> fill_sg_entry() splits large DMA buffers into multiple scatter-gather
> entries, each holding up to UINT_MAX bytes. When calculating the DMA
> address for entries beyond the second one, the expression (i * UINT_MAX)
> causes integer overflow due to 32-bit arithmetic.
> 
> This manifests when the input arg length >= 8 GiB results in looping for
> i >= 2.
> 
> Fix by casting i to dma_addr_t before multiplication.
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> More color about how I discovered this in [1] for the commit at [2]:
> 
> [1] https://lore.kernel.org/all/aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com
> [2] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

AlexW, can you pick this up?

Thanks,
Jason

