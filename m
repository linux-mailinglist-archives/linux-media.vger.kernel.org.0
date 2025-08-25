Return-Path: <linux-media+bounces-41049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385DB3482F
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 19:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03A254E36B2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9717F30102C;
	Mon, 25 Aug 2025 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AePNfPAi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A312868A9
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141537; cv=none; b=Yeclmn52TPaKhxxXvTH5UdVgJ6TZSzn9kaQmuCdRdPpGIYHVDULq2rtJe3qMH5AIXe8wclMKC6jz2ZwhZFC+pQg81MFpKMakKafIfblfnKsQh6ZBAte8Ilu1w8Bv7uDOHPAjufZMHYdgmYgOriysA6MqAcnY4oNjE4g5UyTP4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141537; c=relaxed/simple;
	bh=LRBN+7pVsfRX4HBnwza1vs2Vuv7PT4DxF6o0fSGauMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1KT/KNawPcGFozhSGDwtavtrH5cxVuYDSFUmBBunVqV+tpH4T1eqfkyYQEgOcXaOb93BgbpdmDljJFkw8wYs05QreiPiLjNoULwtajBK+OZtY811bb0kwOhLfIwQdfmphGS89NERI8PZDuxM/mNP/7pQF+u8ukyRd0RMe5//7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AePNfPAi; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70dbcf43dbfso17024106d6.3
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756141534; x=1756746334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6KxvMDzVSOwTyVOOifum1zHj+Q1NMnnZSanrfOQhBQ=;
        b=AePNfPAiZHUrBQkdhVEYcZPjYCX34plUwDXEpYwcQm+IGYN10n5ggcIsJsK1Ct1mtI
         TGb3lEJQu1Sr0ctftFMrxT+jZbmD487PKLnWG9MzSmxiuknk5blGABSQo326Ek244IV4
         3ScUjs2cXw2o3zFXjcUBgeL0tJpxaJyanY2liURl1UXgkjdKMuZvoWDBDNacHHd74W7n
         8HrcP7nJNsov8jfC1Y4l4rfoSOAVwvglYWs+IOatQWdrxZJ85eadjOYtiyACNKg/mVvc
         JKqA3jW5mXIGcIfYbESJHAzGGamzGv92sNOqQXNDcVwdJ3evBdkK124CE0ZDw5bvZJWN
         biFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141534; x=1756746334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6KxvMDzVSOwTyVOOifum1zHj+Q1NMnnZSanrfOQhBQ=;
        b=au8lA/I+N69UQ2YC7uArQMCp0IKUDBwQqcg0/HSBbBefGU0mPLJuMDSqBCmmUQo+hT
         EV6tRN49BqwrfCmT1b4XDqBnUbXyQt1B23ym1nzSj6C3yP4JhEGlgdettiEtkSZYidTU
         qI0mIFodlSG9h3qNTIA/yeOmgY+6aWSijdnxu068EzDW6HD8FveHsh4IviNnF5pw/35k
         zzahk7mPAzaA5P/m+qNSGC1ubMBFQhlax0b7bOoHNaxQJCyh7YpxQ0QC/pL2oo9o6j4F
         W5mIGJ6JylJg3uhji1/bHlV+ma9/qOeCdWQhy6iF5nQAn4zTWBy/PACDmEbJEjO6KtH5
         L1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUrzkrGSqdwHl+Wvrx2dOqHsUu4EJ+yoSPEGA0nYPLqwk3N1UgKX7abUgpqs/cH9uy/u9HoNIsnQtodKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCnjFpozoA9LFnUzB8mlX/vpPwdXh5LVjeqB9mmFK6mvpJynvb
	DmOmMcV74uH6OeOWzwOuYhETkpJTSSotkY2agZ4oJqKmltBh1wzbtKRrIS7fTpk5VIo=
X-Gm-Gg: ASbGncssdYexYjtzuwrLX+eSDMfiL4UKcCcVKh47Alwu032sjJYkjsBnXnJUEJYlymP
	gJ3EXBkFRi9ySn9Y+CjNA0C/tLF5ArtnpSEUSREcLDSyKoagJI/o3w7byHFX14nGXCdOqyPtj1e
	z6GXn+oIe+6AVkbXXm1tTLy/WMyug7p7t1yrM09YNjmCPR8SAyCBkIMExUQnI2fplnbsVLj1roF
	wjEsztBpB3BCnklwZh6ww0wMgVffYEjzzmxpkKoutYVnctCpOQyGx8xgLCROq7Q1m33YMvnrb9J
	oqeM6ErxPkdZOJUAW/rTvdHXgl6Klao5y46E2DHsPzIl3MkBx3Bbuf8pu56PF2OYQWOot+Irxlv
	0cm1n7fGhjBy0GzgnXJStlZ2frEYsIl5ZypCPmOVRhINR7T9Joo2em6SWsatGghyKLU6D
X-Google-Smtp-Source: AGHT+IH8RaHjAylVQJBbbz2fVViy55MQyOlXslCXu2TNEUhwTy4uudrftYMxMziT/A2NjRI6tuUcow==
X-Received: by 2002:a05:6214:2a83:b0:70d:be38:8ee8 with SMTP id 6a1803df08f44-70dbe3890e3mr56021826d6.63.1756141533729;
        Mon, 25 Aug 2025 10:05:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714727csm48193006d6.13.2025.08.25.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:05:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uqadP-00000008iJN-3bFh;
	Mon, 25 Aug 2025 14:05:31 -0300
Date: Mon, 25 Aug 2025 14:05:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <20250825170531.GA1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825153450.150071-5-benjamin.gaignard@collabora.com>

On Mon, Aug 25, 2025 at 05:34:43PM +0200, Benjamin Gaignard wrote:
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 81328c63b796..a28a181013b9 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -12,6 +12,9 @@
>  #ifndef HANTRO_H_
>  #define HANTRO_H_
>  
> +#include <linux/dma-map-ops.h>
> +#include <linux/iommu.h>
> +#include <linux/iommu-dma.h>

This is an internal header it should not be included in drivers.

> +static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
> +{
> +	if (ctx->iommu_domain) {
> +		iommu_attach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
> +		iommu_detach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
> +	}
> +}

What is this supposed to do? Put it back to the default domain? Who
changed it away from the default domain?

Did some other driver change the attached domain (if so that's wild
and wrong)? The commit message hints at that but it should be
explained alot more.

This just seems wrong and goofy. Driver shouldn't be changing their
iommu domains if they are using the default domain at all. We now have
APIs to allow you to allocate wide chunks of IOVA space and manage
them directly. Maybe these 'multiple stream's should be doing that
instead of mucking with iommu domains?

Jason

