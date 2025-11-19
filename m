Return-Path: <linux-media+bounces-47399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE59C70D85
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0F18D2F8E3
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7B036CDEF;
	Wed, 19 Nov 2025 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jBqa/z5s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043B348860
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581004; cv=none; b=sC8KzaDGen7yqGTtVKd/xShfAdMWl0u8Z3JiQKv/Y7P91XG61MhAzgudW2go10NZSuVEGx7qSLizQ4YZ2cIdOJIZWxuuWvshBaqLoFNjX/jaZhozEeCiJSVDJ/4Z9k3Anuc1eDP7mXeooaPu/Q1DPsWMwE2XXPscGau2ra3A2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581004; c=relaxed/simple;
	bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E03fG0Ub8CKCd22rSRqwJHPv7r8Fby/hn3E/99/z8ti723u55hsv66n/v0wjdBbdAs43CYcY1bMekAC6uaRtAgrRWX8RMcObMsjS3N2CfRcP6TQ1nIrP2iquzEw6jnqvN+W6YaRm9nW9FO8WDqt2uznY+FovO/dJpb5dXCk9Mr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jBqa/z5s; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee158187aaso1122521cf.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763580999; x=1764185799; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
        b=jBqa/z5s9CGp5RICxeKSJrdO5l3megJVr81FnjM4RHwVEKCUb4xEQ8NaoiOBOhnzcZ
         bMxWoyoMgmSdI5ISZhu0sMMq/bhX6xdwOzl9EI+joXijVlgSlY/nZpUwpWnn/B0Ui1n3
         W1cP0IRwL+kjK02u1dFunMpg85hYN05Dj9YAOL9GP3DccFBflwbNZyVBV7hJoxkN969L
         WGavQPhrCgEO9MrysbD9xVHbtHHSiRc7gCv2T2zrxkr+wtl5uM6DDuTpWX8LCAjj2xlp
         FMsXVMjmkR4zOh3um/QXeOnX47MD5GU5Nvj7Dyi23HwJxfdQIj3H8yE3t+KQbYckONLZ
         +Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763580999; x=1764185799;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
        b=vbgCGInwvSn/Stv2bhSSjjxf9JIlnIgFBlMfllnrweKwF5ejplGqbNoJHmivNFc35T
         d+0oUpbm41Nm/WTjCfykoV/BWQFxjmzyKawPHoAbmb5aAxzPjgWGy3W1Qv8xEmJ0BDyx
         RRFatO7UpXXDZtQfcD5r/tF7nzYeN2RTDuTQo6vbzXbzn2w3MyVXecGgwJJCuHNK4Rp7
         UwzZ64i50KEVII9IOxhEgC7tBLQ1vdqNpW0bXC+Asjnh7qKU3FZsckughVASJUEUk7/b
         sfin1kHaJJLNNPV8pY6oLvidHdBxtHZyXLphwTrJBYrU3MvHywxHGi0VFJKp+pZkMAZM
         3K7w==
X-Forwarded-Encrypted: i=1; AJvYcCUmT4BBjHMNbhNgGKOxLJOyxfunqXf8zQ9BBmwWFPKULRNCMlEYaXTR+JHgpu8nUj3nK9BG3lf5Lsrg8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh2hjgp1seeq579kEXk7H0YmS5z2qiXprocxBAAcVl+TobdYIf
	v7BGSzjSukR8dOXefPGt1F0baDgEqMtM/96j12QLKqf2VEIFxGVMCg9LGa1cNTXoxMk=
X-Gm-Gg: ASbGncs5dh6g/vwkTrMZLcV6X0Fihk5nqQwEWYNA0aLRP7kMbiakAV/17/Td4VJ3JSp
	u2F0ISsRwdCgTAAC9A/rPjkzvGctfOJngfgoriKFq064GhWIxAoWxxhtcE5vEiQP8bWUW59xIgw
	+ZZtpH1RLBAlIPEOC8b3/D9lvWlHPLidIKCxwqhGTLIIu20Eehcamlg5byOqJjEy6Lk86kImahf
	U2S1MtPdUN9+xDGzmVz23lFtZN4w7NoH7Y/KQEbaE+4kFf70CCdtb9a7TCGviVILHULU9QRIb9Y
	vbsg2lOIFLAe+MYVIkdbn5I5qxjU7wnvE3KQjn1/BvcILYxMaF5xIIOZgIrxvfBFteNlXVNL8er
	EFBEL6eRsiptQWXmUQlG21q/gFycSI4x9ENry26BLchMUO0os4kaQuk+8wKdy+THLnNYq83zliq
	1VF6oFi1SlH6ZdKsvkfSuyKMhn8ZTDk7gs8kr5u46cCfoeHQ5PW4rG2l1/
X-Google-Smtp-Source: AGHT+IEogkhlTHFcyAE9/u1UuBQV+X3tukog/nHIoHavB/ndnYOWZGPWrkYoYNh/EOln2cA+Kp4KoA==
X-Received: by 2002:a05:622a:310:b0:4ee:1d84:3068 with SMTP id d75a77b69052e-4ee4971a985mr8236121cf.76.1763580999342;
        Wed, 19 Nov 2025 11:36:39 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d64503sm3117901cf.13.2025.11.19.11.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:36:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLnyo-00000000bYz-0lQx;
	Wed, 19 Nov 2025 15:36:38 -0400
Date: Wed, 19 Nov 2025 15:36:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119193638.GQ17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119134245.GD18335@unreal>
 <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>

On Wed, Nov 19, 2025 at 03:11:01PM +0100, Christian König wrote:

> I miss interpreted the call to pci_p2pdma_map_type() here in that
> now the DMA-buf code decides if transactions go over the root
> complex or not.

Oh, that's not it at all. I think you get it, but just to be really
clear:

This code is taking a physical address from the exporter and
determining how it MUST route inside the fabric. There is only one
single choice with no optionality.

The exporter already decided if it will go over the host bridge by
providing an address that must use a host bridge path.

> But the exporter can call pci_p2pdma_map_type() even before calling
> this function, so that looks fine to me.

Yes, the exporter needs to decide where the data is placed before it
tries to map it into the SGT.

Jason

