Return-Path: <linux-media+bounces-16545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC87958F42
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 22:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09792856FE
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 20:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4969C1C3F08;
	Tue, 20 Aug 2024 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCkuD9mv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA7165EE1;
	Tue, 20 Aug 2024 20:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186637; cv=none; b=LY8OpqRnp3OXE7lCbw4qjCqlADQi+ljc5Zmb0+wxnTYhKPmrJk3aLmLL3CqtDL+SZ1O2DVAT8LNG1ex4I0CYZLekhwj1k4BWTJqzQ0rM5UYBH5Wn5qf6sWsL4wPUTuIcmA/qJgDqtOanuEfBqhw9SEOoDh4nc5uhfW155l2GkcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186637; c=relaxed/simple;
	bh=JLwJvZEJ4FQcJlsdkCdftpn7WlsfUPPZSu64ISMQJ9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhaplR2hu0wF1MfXJuN7AKr+3p27AvGdEDERy7rIOVOUtfhhGjfIIQkmajzbKvxwn8tXgYhBwuj0ubc0uVgiJR5E+8ULuxOYFn5Hv8E8mALSo1PP+V5sh/k8ispJgykl4I241lSZXAv22+6FKQy6Oyg3jpxxq2Q0L76i7WISRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCkuD9mv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so761996966b.1;
        Tue, 20 Aug 2024 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724186634; x=1724791434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY4vNetXYvsnkw2DFC8H1kH4gA8u7ARIbqvnE6sG1Cc=;
        b=QCkuD9mvMGQcd1nZbd1hiUOePP0tmmCEnlxlBVyjVbzY93fNI+g/0PZXKQkUEqOPZx
         bDWgUAxwp6o5GuZNhrsQOT+dUs6Se+dIN8O4837dc/dW9mj6zRDx/y8FfS3tthm6Sa7I
         mJQiF7SoNkn8X5bVj16Gqg1CBY47SbG7xbSiGxvk7KRlMumQmb9/0jSyo5Vc150wXHlb
         eiwfVfhggXgLSXju0oh2ZvjT6GOMO54JSmz5yueUU40RTvkxXZ+7CkPw9pns3u2r1pyX
         1iZGtTGCLqvYXN3mgWG8Qv2B9SBwc1QjTPC67nGZiwxOeiw0rlC7GxNVIUWYWFQSEESQ
         n4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724186634; x=1724791434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY4vNetXYvsnkw2DFC8H1kH4gA8u7ARIbqvnE6sG1Cc=;
        b=Mq/Vjz5FCLiiFnGdH2cEe30Cpl1iTB6eYYkY9g6IPeg6sbcMaEp1R5lk6PakzNJh6+
         I9tkF357Ej/a9uSzYXyJ9uESMzME6wiXf7cqXgBtg2WvmF/erItoeHcfdRkDYtaCD1dT
         esF8FQPd4ITl91l6FlV3/h8jaK20UCdI50Rram5TWQYsTuqPPUO2FuinjdX7BxILp6pt
         sfaDWpCKfA69QoYxUfz1TOQMjYU+cL7aBkufA1HN9NSPXUSo7tzL/g0x7/KqhQu04R5G
         OyUXmYNvOKLmOfi4KmwEZO7WcpBkreSNN7l5SdeArRHAxSEREm1pxloTG5Pa9AghJG1+
         GbLA==
X-Forwarded-Encrypted: i=1; AJvYcCU1JvKTqD1DpntZoMJrcRxPlgHrAkzgdV6N7IiWHPzPATiAVWhfVQc3FKLQFwUl7mUPVZ4QUEnUZT7XCtc=@vger.kernel.org, AJvYcCUXvdYEb6Xj6RFviI33y9wXLOXBLyKc7qSo0ER6bK1o0kuzIQybJtRDIumRduI9ms3ZaY70BSMXmUrD2Qo1@vger.kernel.org, AJvYcCVg5VkpwPmoYzcmf4r+Vq5ZmmoWwa5KtUhHqZmgPw8OTA6ppLeFeIo4yaHAqXV7ajMdR8x2SazcZ1HvUm+a@vger.kernel.org
X-Gm-Message-State: AOJu0Yzni/+n3No/Au74o7WhgFbUEHUXEMcvn6681rU3IaGiFm6uzJVT
	GorNR8iwLZ2EEhVROjjB3c3H8Kz+TJXZR66DSIjglJOyUlTZ/CAh
X-Google-Smtp-Source: AGHT+IFT9OxSMHaf7wcsfNkvmOqHVu8Tc7SNr/lwJLFjb8ZxbaJb78dYme0DOGlzA7c3aDg+TR3IWQ==
X-Received: by 2002:a17:907:944d:b0:a7d:e956:ad51 with SMTP id a640c23a62f3a-a866f2c3804mr11419766b.21.1724186634040;
        Tue, 20 Aug 2024 13:43:54 -0700 (PDT)
Received: from [192.168.1.19] (79-100-234-73.ip.btc-net.bg. [79.100.234.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c689dsm805712166b.37.2024.08.20.13.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 13:43:53 -0700 (PDT)
Message-ID: <c5141c18-3f7b-41ac-a064-9911873d0bf9@gmail.com>
Date: Tue, 20 Aug 2024 23:43:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: firmware: Use
 iommu_paging_domain_alloc()
To: Lu Baolu <baolu.lu@linux.intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
 <20240812072105.9578-2-baolu.lu@linux.intel.com>
Content-Language: en-US, bg-BG
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <20240812072105.9578-2-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Thank you for the patch!

On 12.08.24 г. 10:21 ч., Lu Baolu wrote:
> An iommu domain is allocated in venus_firmware_init() and is attached to
> core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-10-baolu.lu@linux.intel.com
> ---
>   drivers/media/platform/qcom/venus/firmware.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index fe7da2b30482..66a18830e66d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.ced

Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>

I'll take the patch through linux-media tree.

> @@ -316,10 +316,10 @@ int venus_firmware_init(struct venus_core *core)
>   
>   	core->fw.dev = &pdev->dev;
>   
> -	iommu_dom = iommu_domain_alloc(&platform_bus_type);
> -	if (!iommu_dom) {
> +	iommu_dom = iommu_paging_domain_alloc(core->fw.dev);
> +	if (IS_ERR(iommu_dom)) {
>   		dev_err(core->fw.dev, "Failed to allocate iommu domain\n");
> -		ret = -ENOMEM;
> +		ret = PTR_ERR(iommu_dom);
>   		goto err_unregister;
>   	}
>   

-- 
regards,
Stan

